@implementation SXFadeComponentAnimationHandler

- (void)prepareAnimation
{
  BOOL IsVoiceOverRunning;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler prepareAnimation](&v6, sel_prepareAnimation);
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  -[SXComponentAnimationHandler component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1.0;
  if (!IsVoiceOverRunning)
    -[SXFadeComponentAnimationHandler initialAlpha](self, "initialAlpha", 1.0);
  objc_msgSend(v4, "setAlpha:", v5);

}

- (void)updateAnimationWithFactor:(double)a3
{
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v8, sel_updateAnimationWithFactor_);
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    -[SXFadeComponentAnimationHandler initialAlpha](self, "initialAlpha");
    v6 = v5 + (1.0 - v5) * a3;
    -[SXComponentAnimationHandler component](self, "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", v6);

  }
}

- (void)startAnimation
{
  _QWORD v3[5];
  _QWORD v4[5];
  objc_super v5;

  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)SXFadeComponentAnimationHandler;
    -[SXComponentAnimationHandler startAnimation](&v5, sel_startAnimation);
    v3[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __49__SXFadeComponentAnimationHandler_startAnimation__block_invoke;
    v4[3] = &unk_24D6874A8;
    v4[4] = self;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __49__SXFadeComponentAnimationHandler_startAnimation__block_invoke_2;
    v3[3] = &unk_24D689490;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2, v4, v3, 0.3, 0.0);
  }
}

void __49__SXFadeComponentAnimationHandler_startAnimation__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "component");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __49__SXFadeComponentAnimationHandler_startAnimation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAnimation");
}

- (void)finishAnimation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler finishAnimation](&v4, sel_finishAnimation);
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    -[SXComponentAnimationHandler component](self, "component");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 1.0);

  }
}

- (double)initialAlpha
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[SXComponentAnimationHandler animation](self, "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialAlpha");
  if (v4 == 1.79769313e308)
  {
    v7 = 0.3;
  }
  else
  {
    -[SXComponentAnimationHandler animation](self, "animation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "initialAlpha");
    v7 = v6;

  }
  return v7;
}

@end
