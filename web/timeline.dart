// Copyright (c) 2017, Ian Bebbington. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:YearInReview/Renderer.dart';
import 'package:YearInReview/HealthVisual.dart';
import 'package:YearInReview/FinancialHealthVisual.dart';
import 'package:YearInReview/StateVisual.dart';
import 'package:YearInReview/GithubCommitVisual.dart';
import 'package:YearInReview/StackOverflowVisual.dart';
import 'package:YearInReview/BlogPostingVisual.dart';
import 'package:YearInReview/CommitmentsVisual.dart';
import 'package:YearInReview/LinearCalendarVisual.dart';

void main() {
  Renderer renderer = new Renderer();
 
  var view = renderer.InitializeView();
  querySelector('#timeline').append(view);
  //view.style.width = '734px';
  //view.style.height = '200px';
 
  DateTime startDate = new DateTime(2016, 01, 15);
  num days = 366;

  renderer.AddLayer(new StateVisual().Initialize(startDate, days));
  renderer.AddLayer(new HealthVisual().Initialize(startDate, days));
  renderer.AddLayer(new FinancialHealthVisual().Initialize(startDate, days));
  renderer.AddLayer(new GithubCommitVisual().Initialize(startDate, days));
  renderer.AddLayer(new StackOverflowVisual().Initialize(startDate, days));
  renderer.AddLayer(new BlogPostingVisual().Initialize(startDate, days));
  renderer.AddLayer(new CommitmentsVisual().Initialize(startDate, days));
  renderer.AddLayer(new LinearCalendarVisual().Initialize(startDate, days));

  window.requestAnimationFrame(renderer.DrawFrame);
}
