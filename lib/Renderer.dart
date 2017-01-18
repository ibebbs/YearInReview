import 'package:YearInReview/LayoutConstants.dart';
import 'package:YearInReview/TimelineVisual.dart';
import 'package:pixi/pixi.dart';
import 'dart:math';
import 'dart:html';

class Renderer {
  static final num absoluteWidth = 8192;
  static final num scaledWidth = 1024;
  static final num horizontalMultiplier = absoluteWidth / scaledWidth;
  static final num horizontalScaling = scaledWidth / absoluteWidth;
  static final num vertialScaling = 1;
  static final num height = 200;
  static final num focusWidth = 400;
  static final num focusHeight = 200;
  static final num maxFocusLeft = absoluteWidth - focusWidth;
  static final num maxLeft = scaledWidth - focusWidth;

  static final TextStyle nameTextStyle = new TextStyle(font: "9pt Arial", fill: new Colour(150, 150, 150));
  
  List<TimelineVisual> _layers = new List<TimelineVisual>();

  CanvasRenderer _background;
  CanvasRenderer _foreground;
  
  BaseTexture _baseTexture;

  Stage _backgroundStage;
  Stage _foregroundStage;
  Stage _foregroundFocusStage;

  num _focusLeft = 0;
  num _textHeight;

  Sprite _foregroundFill;
  Sprite _foregroundFocus;

  bool _isDirty;

  CanvasText _left;
	CanvasElement _canvas = new CanvasElement();
  CanvasRenderingContext2D _context	= null;

  Renderer() {
    _canvas = new CanvasElement();
    _context = _canvas.context2D;
    _context.font = nameTextStyle.font;
    _textHeight = CalculateTextHeight();
  }


  num CalculateTextHeight() {
    	var dummy = new DivElement()
				..appendText('M')
				..style.font 		= nameTextStyle.font
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

   dynamic InitializeView() {
     _background = new CanvasRenderer(width: absoluteWidth, height: height);
     _backgroundStage = new Stage(new Colour(255, 255, 255));
     _foreground = new CanvasRenderer(width: scaledWidth, height: height, interactive: true);
     _foregroundStage = new Stage(new Colour(255, 255, 255));

     _foregroundFill = new Sprite(null);
     _foregroundFill.position = new Point(0,0);
     _foregroundFill.anchor = new Point(0,0);
     _foregroundFill.scale = new Point(horizontalScaling, vertialScaling);
     _foregroundFocusStage = new Stage(new Colour(255, 255, 255));
     _foregroundFocus = new Sprite(null);
     _foregroundFocus.position = new Point(2, 0);

     Graphics focusOutline = new Graphics();
     focusOutline.beginFill(new Colour(255, 255, 255));
     focusOutline.lineStyle(2, new Colour(20, 20, 20), 1.0);
     focusOutline.drawRect(1, 1, focusWidth + 2, focusHeight - 2);

     _foregroundFocusStage.children.add(focusOutline);
     _foregroundFocusStage.children.add(_foregroundFocus);
     _foregroundFocusStage.position = new Point(1,0);

     _foregroundFill.onMouseMove.listen(OnMove, cancelOnError: false);
     _foregroundFill.onMouseOver.listen(OnEnter, cancelOnError: false);
     _foregroundFill.onMouseOut.listen(OnLeave, cancelOnError: false);

     _left = new CanvasText(_focusLeft.toString(), new TextStyle());   
     
     _foregroundStage.children.add(_foregroundFill);
     _foregroundStage.children.add(_foregroundFocusStage);  
     //_foregroundStage.children.add(_left);

     return _foreground.view;
  } 

  void OnMove(InteractionEvent event) {
    _focusLeft = event.x;

    _left.setText(_focusLeft.toString());

    DrawForeground();
  }

  void OnEnter(InteractionEvent event) {
    _foregroundFocusStage.visible = true;

    DrawForeground();
  }

  void OnLeave(InteractionEvent event) {
    _foregroundFocusStage.visible = false;

    DrawForeground();
  }

  void AddLayer(TimelineVisual visual)
  {    
    _isDirty = true;

    DisplayObjectContainer container = new DisplayObjectContainer();
    visual.position = new Point(LayoutConstants.TitleWidth, 0);
    container.children.add(visual);

    CanvasText name = new CanvasText(visual.Name, nameTextStyle);
    var nameMetrics = _context.measureText(visual.Name);
    name.position = new Point(LayoutConstants.TitleWidth - nameMetrics.width, (visual.Height / 2) - (_textHeight / 2));
    container.children.add(name);

    num top = _layers.fold(0, (t, v) => t + v.Height);
    container.position = new Point(0, top + 2);

    _backgroundStage.children.add(container);

    _layers.add(visual);
  }

  void RenderBackground()
  {
    if (_isDirty) {
      _background.render(_backgroundStage);
      _baseTexture = new BaseTexture(_background.view);
      _isDirty = false;
    }
  }

  void DrawForeground() {
    RenderBackground();

    num leftPercent = _focusLeft / scaledWidth;
    num absoluteLeft = (absoluteWidth - focusWidth) * leftPercent;
    num scaledLeft = (scaledWidth - focusWidth) * leftPercent;
    
    Texture fillTexture = new Texture(_baseTexture);
    Texture focusTexture = new Texture(_baseTexture, new Rectangle(min(absoluteLeft, maxFocusLeft), 0, focusWidth, focusHeight));

    _foregroundFill.setTexture(fillTexture);
    _foregroundFocus.setTexture(focusTexture);
    _foregroundFocusStage.position = new Point(scaledLeft, 0);

    _foreground.render(_foregroundStage);
  }

  void DrawFrame(num highResTime) {
    DrawForeground();
  }
}
