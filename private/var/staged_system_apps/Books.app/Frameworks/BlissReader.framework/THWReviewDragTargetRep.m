@implementation THWReviewDragTargetRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewDragTargetRep;
  -[THWReviewDragTargetRep dealloc](&v3, "dealloc");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewDragTargetRep;
  -[THWReviewDragTargetRep addAdditionalChildLayersToArray:](&v5, "addAdditionalChildLayersToArray:");
  -[THWReviewDragTargetRep p_updateLayer](self, "p_updateLayer");
  if (self->_buttonLayer)
    objc_msgSend(a3, "addObject:");
}

- (void)p_updateLayer
{
  id v3;
  id v4;
  CGFloat v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  if (self->_choiceState >= 4u)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewDragTargetRep p_updateLayer]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewDragTargetRep.m"), 67, CFSTR("Unexpected choiceState: %d"), self->_choiceState);
  if (self->_radioState >= 3u)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewDragTargetRep p_updateLayer]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewDragTargetRep.m"), 68, CFSTR("Unexpected radioState: %d"), self->_radioState);
  if (!self->_buttonLayer)
  {
    self->_buttonLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[CALayer setDelegate:](self->_buttonLayer, "setDelegate:", -[THWReviewDragTargetRep interactiveCanvasController](self, "interactiveCanvasController"));
  }
  v3 = objc_msgSend(-[THWReviewDragTargetRep p_questionHost](self, "p_questionHost"), "reviewQuestion:cachedImageNamed:", 0, *(&off_42AA08[3 * self->_choiceState] + self->_radioState));
  objc_msgSend(-[THWReviewDragTargetRep canvas](self, "canvas"), "contentsScale");
  v4 = objc_msgSend(v3, "CGImageForContentsScale:");
  if (-[CALayer contents](self->_buttonLayer, "contents") != v4)
    -[CALayer setContents:](self->_buttonLayer, "setContents:", v4);
  objc_msgSend(-[THWReviewDragTargetRep canvas](self, "canvas"), "viewScale");
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeScale(&v7, v5, v5);
  -[CALayer setBounds:](self->_buttonLayer, "setBounds:", TSDRectWithSize(objc_msgSend(v3, "size")));
  -[CALayer setPosition:](self->_buttonLayer, "setPosition:", CGPointZero.x, CGPointZero.y);
  v6 = v7;
  -[CALayer setAffineTransform:](self->_buttonLayer, "setAffineTransform:", &v6);
}

- (void)setChoiceState:(int)a3
{
  if (self->_choiceState != a3)
  {
    self->_choiceState = a3;
    -[THWReviewDragTargetRep p_updateLayer](self, "p_updateLayer");
  }
}

- (void)setRadioState:(int)a3
{
  -[THWReviewDragTargetRep setRadioState:animated:](self, "setRadioState:animated:", *(_QWORD *)&a3, 1);
}

- (void)setRadioState:(int)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  if (self->_radioState != a3)
  {
    v4 = a4;
    self->_radioState = a3;
    -[THWReviewDragTargetRep p_updateLayer](self, "p_updateLayer");
    if (v4)
    {
      switch(a3)
      {
        case 2:
LABEL_6:
          -[THWReviewDragTargetRep p_addRelaxAnimation](self, "p_addRelaxAnimation");
          return;
        case 1:
          -[THWReviewDragTargetRep p_addPulseAnimation](self, "p_addPulseAnimation");
          break;
        case 0:
          goto LABEL_6;
      }
    }
  }
}

- (void)p_addPulseAnimation
{
  CAKeyframeAnimation *v3;
  NSNumber *v4;
  double v5;
  NSNumber *v6;
  double v7;
  double v8;
  NSNumber *v9;
  double v10;
  NSNumber *v11;
  double v12;

  +[CATransaction begin](CATransaction, "begin");
  v3 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  objc_msgSend(-[CALayer valueForKeyPath:](-[CALayer presentationLayer](self->_buttonLayer, "presentationLayer"), "valueForKeyPath:", CFSTR("transform.scale.xy")), "floatValue");
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  LODWORD(v5) = 1.5;
  v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5);
  LODWORD(v7) = 1067869798;
  -[CAKeyframeAnimation setValues:](v3, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v6, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v3, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), 0));
  LODWORD(v8) = 0;
  v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8);
  LODWORD(v10) = 0.5;
  v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10);
  LODWORD(v12) = 1.0;
  -[CAKeyframeAnimation setKeyTimes:](v3, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, v11, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12), 0));
  -[CAKeyframeAnimation setDuration:](v3, "setDuration:", 0.3);
  -[CAKeyframeAnimation setFillMode:](v3, "setFillMode:", kCAFillModeForwards);
  -[CAKeyframeAnimation setRemovedOnCompletion:](v3, "setRemovedOnCompletion:", 0);
  -[CALayer removeAnimationForKey:](self->_buttonLayer, "removeAnimationForKey:", kTHWReviewDragTargetRelaxAnimationName);
  -[CALayer addAnimation:forKey:](self->_buttonLayer, "addAnimation:forKey:", v3, kTHWReviewDragTargetPulseAnimationName);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_addRelaxAnimation
{
  int v3;
  int v4;
  CABasicAnimation *v5;
  double v6;
  double v7;

  +[CATransaction begin](CATransaction, "begin");
  objc_msgSend(-[CALayer valueForKeyPath:](-[CALayer presentationLayer](self->_buttonLayer, "presentationLayer"), "valueForKeyPath:", CFSTR("transform.scale.xy")), "floatValue");
  v4 = v3;
  v5 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  -[CABasicAnimation setTimingFunction:](v5, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  -[CABasicAnimation setDuration:](v5, "setDuration:", 0.15);
  LODWORD(v6) = v4;
  -[CABasicAnimation setFromValue:](v5, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  LODWORD(v7) = 1.0;
  -[CABasicAnimation setToValue:](v5, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
  -[CABasicAnimation setFillMode:](v5, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v5, "setRemovedOnCompletion:", 1);
  -[CALayer removeAnimationForKey:](self->_buttonLayer, "removeAnimationForKey:", kTHWReviewDragTargetPulseAnimationName);
  -[CALayer addAnimation:forKey:](self->_buttonLayer, "addAnimation:forKey:", v5, kTHWReviewDragTargetRelaxAnimationName);
  +[CATransaction commit](CATransaction, "commit");
}

- (id)p_questionHost
{
  return objc_msgSend(-[THWReviewDragTargetRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWReviewQuestionHosting);
}

- (int)choiceState
{
  return self->_choiceState;
}

- (int)radioState
{
  return self->_radioState;
}

- (CALayer)buttonLayer
{
  return self->_buttonLayer;
}

@end
