@implementation THWReviewSummaryRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryRep;
  -[THWReviewSummaryRep dealloc](&v3, "dealloc");
}

- (THWReviewSummaryRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWReviewSummaryRep *v4;
  THWReviewSummaryRep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWReviewSummaryRep;
  v4 = -[THWReviewSummaryRep initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_showingResults = objc_msgSend(objc_msgSend(-[THWReviewSummaryRep layout](v4, "layout"), "delegate"), "reviewSummaryShouldShowResults");
    -[THWReviewSummaryRep p_updateWantsSpinner](v5, "p_updateWantsSpinner");
  }
  return v5;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)viewScrollWillChange
{
  self->_wantsSpinner = 1;
  objc_msgSend(-[THWReviewSummaryRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
}

- (void)p_updateWantsSpinner
{
  _BOOL4 v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;

  if (self->_showingResults)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(-[THWReviewSummaryRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(-[THWReviewSummaryRep layout](self, "layout"), "frameInRoot");
    v17.origin.x = v12;
    v17.origin.y = v13;
    v17.size.width = v14;
    v17.size.height = v15;
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    v3 = CGRectIntersectsRect(v16, v17);
  }
  if (self->_wantsSpinner != v3)
  {
    self->_wantsSpinner = v3;
    objc_msgSend(-[THWReviewSummaryRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
  }
}

- (void)didUpdateLayer:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  char v13;

  v5 = -[THWReviewSummaryRep layout](self, "layout");
  v6 = objc_msgSend(-[THWReviewSummaryRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v5, "resultsLayout"));
  v7 = objc_msgSend(-[THWReviewSummaryRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v5, "checkingLayout"));
  v8 = objc_msgSend(-[THWReviewSummaryRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", v6);
  v9 = objc_msgSend(-[THWReviewSummaryRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", v7);
  v10 = objc_msgSend(objc_msgSend(v5, "delegate"), "reviewSummaryShouldShowResults");
  objc_msgSend(v8, "setHidden:", v10 ^ 1);
  objc_msgSend(v9, "setHidden:", v10);
  if (self->_showingResults != (_DWORD)v10)
  {
    +[CATransaction begin](CATransaction, "begin");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_182384;
    v12[3] = &unk_427268;
    v12[4] = self;
    v13 = (char)v10;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v12);
    v11 = +[CATransition animation](CATransition, "animation");
    objc_msgSend(v11, "setType:", kCATransitionFade);
    objc_msgSend(v11, "setBeginTime:", CACurrentMediaTime() + 0.25);
    objc_msgSend(v11, "setDuration:", 0.25);
    objc_msgSend(v11, "setFillMode:", kCAFillModeBoth);
    objc_msgSend(a3, "addAnimation:forKey:", v11, CFSTR("fadeAnimation"));
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v6;
  double v7;
  id v8;

  if (objc_msgSend(a3, "tag") == (char *)&dword_4 + 2)
  {
    v6 = objc_opt_class(THWControlContainerRep);
    *(_QWORD *)&v7 = TSUDynamicCast(v6, a4).n128_u64[0];
    objc_msgSend(v8, "setDelegate:", self, v7);
  }
}

- (void)controlContainer:(id)a3 addChildLayersToArray:(id)a4
{
  CALayer *spinnerLayer;
  CALayer *v7;
  unint64_t i;
  CALayer *v9;
  CABasicAnimation *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __n128 v32;
  __n128 v33;
  double v34;
  CGFloat v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;

  if (objc_msgSend(objc_msgSend(a3, "layout"), "tag") == (char *)&dword_4 + 2)
  {
    spinnerLayer = self->_spinnerLayer;
    if (self->_wantsSpinner)
    {
      if (!spinnerLayer)
      {
        v7 = +[CALayer layer](CALayer, "layer");
        self->_spinnerLayer = v7;
        -[CALayer setBounds:](v7, "setBounds:", 0.0, 0.0, 40.0, 40.0);
        for (i = 0; i != 12; ++i)
        {
          v9 = +[CALayer layer](CALayer, "layer");
          -[CALayer setBounds:](v9, "setBounds:", 0.0, 0.0, 3.0, 8.0);
          -[CALayer setCornerRadius:](v9, "setCornerRadius:", 1.5);
          -[CALayer setBackgroundColor:](v9, "setBackgroundColor:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"));
          -[CALayer setAnchorPoint:](v9, "setAnchorPoint:", 0.5, 1.75);
          -[CALayer setPosition:](v9, "setPosition:", 20.0, 20.0);
          CGAffineTransformMakeRotation(&v36, (double)i * 0.523598776);
          -[CALayer setAffineTransform:](v9, "setAffineTransform:", &v36);
          -[CALayer addSublayer:](self->_spinnerLayer, "addSublayer:", v9);
          v10 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
          LODWORD(v11) = 1.0;
          -[CABasicAnimation setFromValue:](v10, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
          LODWORD(v12) = 0;
          -[CABasicAnimation setToValue:](v10, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12));
          -[CABasicAnimation setTimingFunction:](v10, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
          LODWORD(v13) = 2139095040;
          -[CABasicAnimation setRepeatCount:](v10, "setRepeatCount:", v13);
          -[CABasicAnimation setDuration:](v10, "setDuration:", 1.0);
          -[CABasicAnimation setTimeOffset:](v10, "setTimeOffset:", (double)i * -0.0833333333);
          -[CALayer addAnimation:forKey:](v9, "addAnimation:forKey:", v10, CFSTR("MarkerAnimationKey"));
        }
      }
      v14 = objc_msgSend(-[THWReviewSummaryRep layout](self, "layout"), "checkingWPLayout");
      v15 = objc_msgSend(-[THWReviewSummaryRep canvas](self, "canvas"), "repForLayout:", v14);
      objc_msgSend(objc_msgSend(objc_msgSend(v14, "columns"), "lastObject"), "typographicBounds");
      objc_msgSend(v15, "convertNaturalRectToUnscaledCanvas:");
      objc_msgSend(objc_msgSend(v15, "canvas"), "convertUnscaledToBoundsRect:", v16, v17, v18, v19);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      if (-[THWReviewSummaryRep parentRep](self, "parentRep"))
      {
        objc_msgSend(-[THWReviewSummaryRep parentRep](self, "parentRep"), "layerFrameInScaledCanvas");
        v29 = v28;
        v31 = v30;
        v32.n128_f64[0] = v21;
        v33.n128_f64[0] = v23;
        v21 = TSDSubtractPoints(v32, v33, v29, v31);
        v23 = v34;
      }
      v37.origin.x = v21;
      v37.origin.y = v23;
      v37.size.width = v25;
      v37.size.height = v27;
      v35 = CGRectGetMinX(v37) + -20.0;
      v38.origin.x = v21;
      v38.origin.y = v23;
      v38.size.width = v25;
      v38.size.height = v27;
      -[CALayer setPosition:](self->_spinnerLayer, "setPosition:", v35, CGRectGetMidY(v38));
      if (self->_spinnerLayer)
        objc_msgSend(a4, "addObject:");
    }
    else
    {

      self->_spinnerLayer = 0;
    }
  }
}

- (BOOL)showingResults
{
  return self->_showingResults;
}

- (CALayer)spinnerLayer
{
  return self->_spinnerLayer;
}

@end
