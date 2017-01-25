import 'package:pixi/pixi.dart';
import 'package:YearInReview/TimelineVisual.dart';
import 'package:YearInReview/LayoutConstants.dart';
import 'dart:core';
import 'dart:math';
import 'dart:html';

class LinearCalendarVisual {  
  static final List<String> _months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
  static final num top = 0;
  static final num height = 16;

	CanvasElement _canvas = new CanvasElement();
  CanvasRenderingContext2D _context	= null;
  TextStyle _dateTextStyle = new TextStyle(font: "9pt Arial", fill: LayoutConstants.Foreground);
  num _textHeight;

  LinearCalendarVisual() {
    _context = _canvas.context2D;
    _context.font = _dateTextStyle.font;

    _textHeight = CalculateTextHeight();
  }

  num CalculateTextHeight() {
    	var dummy = new DivElement()
				..appendText('M')
				..style.font 		= _dateTextStyle.font
				..style.position 	= 'absolute'
				..style.top			= '0'
				..style.left		= '0'
				..style.opacity		= '0.0'
				..style.zIndex		= '-1';

			//document.body.children.insert(0, dummy);	// this breaks as javascript when used in a PolymerElement
			document.body.children.add(dummy);
			num value = dummy.offsetHeight;
			document.body.children.remove(dummy);

      return value;
  }

  TimelineVisual Initialize(DateTime startDate, num days) {   
    TimelineVisual container = new TimelineVisual("Date", (days * LayoutConstants.DayWidth) + (2 * LayoutConstants.HorizontalMargin), height + (2 * _textHeight));
 
    Graphics graphics = new Graphics();

    graphics.lineStyle(2, LayoutConstants.Foreground, 1.0);
    graphics.moveTo(LayoutConstants.HorizontalMargin - 1, 0);
    graphics.lineTo(LayoutConstants.HorizontalMargin + (days * LayoutConstants.DayWidth), 0);

    for (num day = 0; day <= days; day++) {
      DateTime date = startDate.add(new Duration(days: day));
      num vp = day % 7 == 0 ? 0 : 8;
      graphics.moveTo(LayoutConstants.HorizontalMargin + (day * LayoutConstants.DayWidth), 0);
      graphics.lineTo(LayoutConstants.HorizontalMargin + (day * LayoutConstants.DayWidth), top + height - vp);
      String dateString = date.day.toString();
      var dateText = new CanvasText(dateString, _dateTextStyle);      
      var dateTextMetrics = _context.measureText(dateString);
      dateText.position = new Point(LayoutConstants.HorizontalMargin + (day * LayoutConstants.DayWidth) - (dateTextMetrics.width / 2), top + height);

      container.children.add(dateText);

      if (day == 0 || date.day == 1) {
        String monthString = _months[date.month - 1];
        var monthText = new CanvasText(monthString, _dateTextStyle);     
        monthText.position = new Point(LayoutConstants.HorizontalMargin + (day * LayoutConstants.DayWidth), top + height + _textHeight);
        container.children.add(monthText);
      }
    }    
    
    container.children.add(graphics);

    return container;
  }
}