@implementation UITextMultiTapRecognizer

- (void)setAllowableMovement:(double)a3
{
  -[UITapRecognizer setAllowableMovement:](self->_tapRecognizer, "setAllowableMovement:", a3);
}

- (UITextMultiTapRecognizer)initWithTarget:(id)a3 tapAction:(SEL)a4
{
  id v6;
  UITextMultiTapRecognizer *v7;
  UITapRecognizer *v8;
  UITapRecognizer *tapRecognizer;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextMultiTapRecognizer;
  v7 = -[UIGestureRecognizer initWithTarget:action:](&v11, sel_initWithTarget_action_, self, sel_onStateUpdate_);
  if (v7)
  {
    v8 = objc_alloc_init(UITapRecognizer);
    tapRecognizer = v7->_tapRecognizer;
    v7->_tapRecognizer = v8;

    -[UITapRecognizer setDelegate:](v7->_tapRecognizer, "setDelegate:", v7);
    objc_storeWeak(&v7->_target, v6);
    v7->_tapAction = a4;
    -[UITapRecognizer setNumberOfTouchesRequired:](v7->_tapRecognizer, "setNumberOfTouchesRequired:", 1);
    -[UITapRecognizer setContinuousTapRecognition:](v7->_tapRecognizer, "setContinuousTapRecognition:", 1);
    -[UITapRecognizer setAllowableMovement:](v7->_tapRecognizer, "setAllowableMovement:", 45.0);
    -[UITapRecognizer setMaximumTapDuration:](v7->_tapRecognizer, "setMaximumTapDuration:", 0.75);
    -[UITapRecognizer setMaximumIntervalBetweenSuccessiveTaps:](v7->_tapRecognizer, "setMaximumIntervalBetweenSuccessiveTaps:", 0.35);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_destroyWeak(&self->_target);
}

- (void)onStateUpdate:(id)a3
{
  id WeakRetained;
  SEL tapAction;
  void *v6;
  SEL v7;
  id v8;

  if (-[UIGestureRecognizer state](self, "state", a3) != UIGestureRecognizerStateBegan
    && -[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateChanged
    || self->_sendTapAction)
  {
    WeakRetained = objc_loadWeakRetained(&self->_target);
    if (WeakRetained)
    {
      tapAction = self->_tapAction;

      if (tapAction)
      {
        v6 = (void *)UIApp;
        v7 = self->_tapAction;
        v8 = objc_loadWeakRetained(&self->_target);
        objc_msgSend(v6, "sendAction:to:from:forEvent:", v7, v8, self, 0);

      }
    }
    self->_sendTapAction = 0;
  }
}

- (unint64_t)numberOfTouchesRequired
{
  return -[UITapRecognizer numberOfTouchesRequired](self->_tapRecognizer, "numberOfTouchesRequired");
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  -[UITapRecognizer setNumberOfTouchesRequired:](self->_tapRecognizer, "setNumberOfTouchesRequired:", a3);
}

- (unint64_t)minimumNumberOfTapsRequired
{
  return -[UITapRecognizer numberOfTapsRequired](self->_tapRecognizer, "numberOfTapsRequired");
}

- (void)setMinimumNumberOfTapsRequired:(unint64_t)a3
{
  -[UITapRecognizer setNumberOfTapsRequired:](self->_tapRecognizer, "setNumberOfTapsRequired:", a3);
}

- (double)allowableMovement
{
  double result;

  -[UITapRecognizer allowableMovement](self->_tapRecognizer, "allowableMovement");
  return result;
}

- (double)maximumTouchDownDuration
{
  double result;

  -[UITapRecognizer maximumTapDuration](self->_tapRecognizer, "maximumTapDuration");
  return result;
}

- (void)setMaximumTouchDownDuration:(double)a3
{
  -[UITapRecognizer setMaximumTapDuration:](self->_tapRecognizer, "setMaximumTapDuration:", a3);
}

- (double)maximumIntervalBetweenTaps
{
  double result;

  -[UITapRecognizer maximumIntervalBetweenSuccessiveTaps](self->_tapRecognizer, "maximumIntervalBetweenSuccessiveTaps");
  return result;
}

- (void)setMaximumIntervalBetweenTaps:(double)a3
{
  -[UITapRecognizer setMaximumIntervalBetweenSuccessiveTaps:](self->_tapRecognizer, "setMaximumIntervalBetweenSuccessiveTaps:", a3);
}

- (NSArray)touchesForTap
{
  return -[UITapRecognizer touches](self->_tapRecognizer, "touches");
}

- (unint64_t)tapCount
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[UITextMultiTapRecognizer recognizesOnSubsequentTouchDowns](self, "recognizesOnSubsequentTouchDowns");
  v4 = 5;
  if (v3)
    v4 = 4;
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___UITextMultiTapRecognizer__tapRecognizer[v4]);
}

- (CGPoint)location
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextMultiTapRecognizer locationInView:](self, "locationInView:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)tapIsPossibleForTapRecognizer:(id)a3
{
  return 1;
}

- (void)tapRecognizerRecognizedTap:(id)a3
{
  unint64_t touchDownCount;
  uint64_t v5;
  unint64_t v6;

  touchDownCount = self->_touchDownCount;
  if (touchDownCount == -[UITextMultiTapRecognizer minimumNumberOfTapsRequired](self, "minimumNumberOfTapsRequired", a3))
  {
    v5 = 1;
LABEL_5:
    -[UIGestureRecognizer setState:](self, "setState:", v5);
    goto LABEL_6;
  }
  v6 = self->_touchDownCount;
  if (v6 > -[UITextMultiTapRecognizer minimumNumberOfTapsRequired](self, "minimumNumberOfTapsRequired"))
  {
    v5 = 2;
    goto LABEL_5;
  }
LABEL_6:
  ++self->_tapCount;
  self->_sendTapAction = 1;
}

- (void)tapRecognizerFailedToRecognizeTap:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t touchDownCount;
  unint64_t v7;

  -[UITapRecognizer activeTouches](self->_tapRecognizer, "activeTouches", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

    v5 = 5;
  }
  else
  {
    touchDownCount = self->_touchDownCount;
    v7 = -[UITextMultiTapRecognizer minimumNumberOfTapsRequired](self, "minimumNumberOfTapsRequired");

    if (touchDownCount >= v7)
      v5 = 3;
    else
      v5 = 5;
  }
  -[UIGestureRecognizer setState:](self, "setState:", v5);
}

- (double)_touchSloppinessFactor
{
  void *v2;
  double v3;
  double v4;

  -[UIGestureRecognizer view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_touchSloppinessFactor");
  v4 = v3;

  return v4;
}

- (void)resetTapCountForTapRecognizer:(id)a3
{
  self->_tapCount = 0;
  self->_touchDownCount = 0;
}

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UITapRecognizer locationInView:](self->_tapRecognizer, "locationInView:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextMultiTapRecognizer;
  -[UIGestureRecognizer reset](&v3, sel_reset);
  self->_sendTapAction = 0;
  -[UITextMultiTapRecognizer resetTapCountForTapRecognizer:](self, "resetTapCountForTapRecognizer:", self->_tapRecognizer);
  -[UITapRecognizer _reset](self->_tapRecognizer, "_reset");
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "_isGestureType:", 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "numberOfTouchesRequired");
    if (v6 == -[UITextMultiTapRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired"))
    {
      v7 = (unint64_t)objc_msgSend(v5, "numberOfTapsRequired") > 1;
LABEL_8:

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "_isGestureType:", 1))
  {
    v5 = v4;
    v8 = objc_msgSend(v5, "numberOfTouchesRequired");
    if (v8 == -[UITextMultiTapRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired"))
    {
      v7 = objc_msgSend(v5, "numberOfTapsRequired") != 0;
      goto LABEL_8;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0 && (int)objc_msgSend(v4, "numberOfFullTaps") > 0;
LABEL_9:

  return !v7;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "modifierFlags") & 0x40000) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextMultiTapRecognizer;
    v8 = -[UIGestureRecognizer _shouldReceiveTouch:withEvent:](&v10, sel__shouldReceiveTouch_withEvent_, v6, v7);
  }

  return v8;
}

- (BOOL)_allowsEventWithRequiredButtonMask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t requiredButtonMask;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (self->_requiredButtonMask
    && objc_msgSend(v4, "_buttonMask")
    && objc_msgSend(v6, "_containsHIDPointerEvent"))
  {
    requiredButtonMask = self->_requiredButtonMask;
    v8 = (objc_msgSend(v4, "_buttonMask") & requiredButtonMask) == requiredButtonMask;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITextMultiTapRecognizer;
  v6 = a4;
  v7 = a3;
  -[UIGestureRecognizer touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v7, v6);
  -[UITapRecognizer touchesBegan:withEvent:](self->_tapRecognizer, "touchesBegan:withEvent:", v7, v6, v9.receiver, v9.super_class);

  LODWORD(v7) = -[UITextMultiTapRecognizer _allowsEventWithRequiredButtonMask:](self, "_allowsEventWithRequiredButtonMask:", v6);
  if (!(_DWORD)v7)
  {
    v8 = 5;
    goto LABEL_6;
  }
  ++self->_touchDownCount;
  if (-[UITextMultiTapRecognizer recognizesOnSubsequentTouchDowns](self, "recognizesOnSubsequentTouchDowns")
    && self->_touchDownCount >= 2)
  {
    self->_sendTapAction = 1;
    v8 = 2;
LABEL_6:
    -[UIGestureRecognizer setState:](self, "setState:", v8);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UITextMultiTapRecognizer;
  -[UIGestureRecognizer touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v6, v7);
  if (-[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateFailed)
    -[UITapRecognizer touchesMoved:withEvent:](self->_tapRecognizer, "touchesMoved:withEvent:", v6, v7);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITextMultiTapRecognizer;
  v6 = a4;
  v7 = a3;
  -[UIGestureRecognizer touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_, v7, v6);
  -[UITapRecognizer touchesEnded:withEvent:](self->_tapRecognizer, "touchesEnded:withEvent:", v7, v6, v8.receiver, v8.super_class);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITextMultiTapRecognizer;
  v6 = a4;
  v7 = a3;
  -[UIGestureRecognizer touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v7, v6);
  -[UITapRecognizer touchesCancelled:withEvent:](self->_tapRecognizer, "touchesCancelled:withEvent:", v7, v6, v8.receiver, v8.super_class);

  -[UIGestureRecognizer setState:](self, "setState:", 4);
}

- (BOOL)recognizesOnSubsequentTouchDowns
{
  return self->_recognizesOnSubsequentTouchDowns;
}

- (void)setRecognizesOnSubsequentTouchDowns:(BOOL)a3
{
  self->_recognizesOnSubsequentTouchDowns = a3;
}

- (int64_t)requiredButtonMask
{
  return self->_requiredButtonMask;
}

- (void)setRequiredButtonMask:(int64_t)a3
{
  self->_requiredButtonMask = a3;
}

@end
