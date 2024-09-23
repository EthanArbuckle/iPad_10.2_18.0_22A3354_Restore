@implementation UIDigitizerLongPressGestureRecognizer

- (UIDigitizerLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIDigitizerLongPressGestureRecognizer *v4;
  UIDigitizerLongPressGestureRecognizer *v5;
  _UIDigitizerGestureRecognizerImp *v6;
  _UIDigitizerGestureRecognizerImp *imp;
  int v8;
  double v9;
  int v10;
  double v11;
  int v12;
  double v13;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIDigitizerLongPressGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v17, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v16.receiver = v4;
    v16.super_class = (Class)UIDigitizerLongPressGestureRecognizer;
    -[UIGestureRecognizer setAllowedPressTypes:](&v16, sel_setAllowedPressTypes_, &unk_1E1A935C0);
    v15.receiver = v5;
    v15.super_class = (Class)UIDigitizerLongPressGestureRecognizer;
    -[UIGestureRecognizer setAllowedTouchTypes:](&v15, sel_setAllowedTouchTypes_, &unk_1E1A935D8);
    v6 = objc_alloc_init(_UIDigitizerGestureRecognizerImp);
    imp = v5->_imp;
    v5->_imp = v6;

    -[_UIDigitizerGestureRecognizerImp setDelegate:](v5->_imp, "setDelegate:", v5);
    v8 = _UIInternalPreferenceUsesDefault_1((int *)algn_1ECD76538, (uint64_t)CFSTR("DigitizerLongPressGestureRecognizerDefaultDuration"));
    v9 = *(double *)&qword_1ECD76540;
    if (v8)
      v9 = 0.5;
    -[_UIDigitizerGestureRecognizerImp setMinimumPressDuration:](v5->_imp, "setMinimumPressDuration:", v9);
    -[_UIDigitizerGestureRecognizerImp setMaximumPressDuration:](v5->_imp, "setMaximumPressDuration:", 1.79769313e308);
    v10 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_910, (uint64_t)CFSTR("DigitizerGestureSloppinessDuration"));
    v11 = *(double *)&qword_1ECD76520;
    if (v10)
      v11 = 0.05;
    -[_UIDigitizerGestureRecognizerImp setPressEndToTouchBeginDuration:](v5->_imp, "setPressEndToTouchBeginDuration:", v11);
    v12 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_910, (uint64_t)CFSTR("DigitizerGestureSloppinessDuration"));
    v13 = *(double *)&qword_1ECD76520;
    if (v12)
      v13 = 0.05;
    -[_UIDigitizerGestureRecognizerImp setTouchEndToPressEndDuration:](v5->_imp, "setTouchEndToPressEndDuration:", v13);
  }
  return v5;
}

- (void)setAllowedPressTypes:(id)a3
{
  objc_class *v3;
  id v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ cannot be configured to recognize a press type other than UIPressTypeSelect."), v4);

}

- (void)setAllowedTouchTypes:(id)a3
{
  objc_class *v3;
  id v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ cannot be configured to recognize a touch type other than UITouchTypeIndirect."), v4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[_UIDigitizerGestureRecognizerImp touchesBegan:withEvent:](self->_imp, "touchesBegan:withEvent:", a3, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[_UIDigitizerGestureRecognizerImp touchesMoved:withEvent:](self->_imp, "touchesMoved:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[_UIDigitizerGestureRecognizerImp touchesEnded:withEvent:](self->_imp, "touchesEnded:withEvent:", a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[_UIDigitizerGestureRecognizerImp touchesCancelled:withEvent:](self->_imp, "touchesCancelled:withEvent:", a3, a4);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  -[_UIDigitizerGestureRecognizerImp pressesBegan:withEvent:](self->_imp, "pressesBegan:withEvent:", a3, a4);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  -[_UIDigitizerGestureRecognizerImp pressesChanged:withEvent:](self->_imp, "pressesChanged:withEvent:", a3, a4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  -[_UIDigitizerGestureRecognizerImp pressesEnded:withEvent:](self->_imp, "pressesEnded:withEvent:", a3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[_UIDigitizerGestureRecognizerImp pressesCancelled:withEvent:](self->_imp, "pressesCancelled:withEvent:", a3, a4);
}

- (void)reset
{
  -[_UIDigitizerGestureRecognizerImp reset](self->_imp, "reset");
}

- (void)pressesEndedSuccessfully:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)pressesHeldForMinimum:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)pressesNotHeldLongEnough:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)pressesHeldOverMaximum:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (CGPoint)digitizerLocation
{
  double v3;
  double v4;
  CGPoint result;

  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan
    || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged
    || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateEnded)
  {
    -[_UIDigitizerGestureRecognizerImp digitizerLocation](self->_imp, "digitizerLocation");
  }
  else
  {
    -[_UIDigitizerGestureRecognizerImp defaultDigitizerLocation](self->_imp, "defaultDigitizerLocation");
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)minimumPressDuration
{
  double result;

  -[_UIDigitizerGestureRecognizerImp minimumPressDuration](self->_imp, "minimumPressDuration");
  return result;
}

- (void)setMinimumPressDuration:(double)a3
{
  -[_UIDigitizerGestureRecognizerImp setMinimumPressDuration:](self->_imp, "setMinimumPressDuration:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imp, 0);
}

@end
