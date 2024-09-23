@implementation SBCaptureHardwareButtonFullPressRecognizer

- (SBCaptureHardwareButtonFullPressRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBCaptureHardwareButtonFullPressRecognizer *v4;
  SBCaptureHardwareButtonFullPressRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  v4 = -[_UIAbstractDynamicButtonGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_UIAbstractDynamicButtonGestureRecognizer _setAllowedPhysicalButtons:](v4, "_setAllowedPhysicalButtons:", 32);
    -[SBCaptureHardwareButtonFullPressRecognizer _setRequiresSystemGesturesToFail:](v5, "_setRequiresSystemGesturesToFail:", 0);
  }
  return v5;
}

- (BOOL)isCaptureButtonFullyPressed
{
  return self->_isCaptureButtonFullyPressed;
}

- (unint64_t)pressDownTimestamp
{
  return self->_lastDownTimestamp;
}

- (unint64_t)pressUpTimestamp
{
  return self->_lastUpTimestamp;
}

- (BOOL)_shouldReceiveDynamicButton:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "_physicalButton");
  v5 = _UIPhysicalButtonSetForPhysicalButton();
  v6 = (v5 & ~-[_UIAbstractDynamicButtonGestureRecognizer _allowedPhysicalButtons](self, "_allowedPhysicalButtons")) == 0
    && objc_msgSend(v4, "_stage") == 4;

  return v6;
}

- (void)_dynamicButtonsBegan:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonFullPressRecognizer.m"), 54, CFSTR("Only expect one Camera Capture Button"));

  }
  objc_msgSend(v7, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_stage") == 4)
  {
    objc_msgSend(v9, "_timestamp");
    self->_lastDownTimestamp = _UIMachTimeForMediaTime();
    self->_isCaptureButtonFullyPressed = 1;
    -[SBCaptureHardwareButtonFullPressRecognizer _beginIfNeeded](self, "_beginIfNeeded");
  }
  v11.receiver = self;
  v11.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsBegan:withEvent:](&v11, sel__dynamicButtonsBegan_withEvent_, v7, v8);

}

- (void)_dynamicButtonsChanged:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsChanged:withEvent:](&v4, sel__dynamicButtonsChanged_withEvent_, a3, a4);
}

- (void)_dynamicButtonsEnded:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureHardwareButtonFullPressRecognizer.m"), 69, CFSTR("Only expect one Camera Capture Button"));

  }
  objc_msgSend(v7, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_stage") == 4)
  {
    self->_isCaptureButtonFullyPressed = 0;
    objc_msgSend(v9, "_timestamp");
    self->_lastUpTimestamp = _UIMachTimeForMediaTime();
    -[SBCaptureHardwareButtonFullPressRecognizer _endIfNeeded](self, "_endIfNeeded");
  }
  v11.receiver = self;
  v11.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsEnded:withEvent:](&v11, sel__dynamicButtonsEnded_withEvent_, v7, v8);

}

- (void)_dynamicButtonsCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[SBCaptureHardwareButtonFullPressRecognizer _cancelIfNeeded](self, "_cancelIfNeeded");
  v8.receiver = self;
  v8.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsCancelled:withEvent:](&v8, sel__dynamicButtonsCancelled_withEvent_, v7, v6);

}

- (void)_beginIfNeeded
{
  if (!-[SBCaptureHardwareButtonFullPressRecognizer state](self, "state"))
    -[SBCaptureHardwareButtonFullPressRecognizer setState:](self, "setState:", 1);
}

- (void)_endIfNeeded
{
  if (!self->_isCaptureButtonFullyPressed)
    -[SBCaptureHardwareButtonFullPressRecognizer setState:](self, "setState:", 3);
}

- (void)_cancelIfNeeded
{
  if (!self->_isCaptureButtonFullyPressed)
    -[SBCaptureHardwareButtonFullPressRecognizer setState:](self, "setState:", 4);
}

- (void)reset
{
  self->_isCaptureButtonFullyPressed = 0;
  self->_lastDownTimestamp = 0;
  self->_lastUpTimestamp = 0;
}

@end
