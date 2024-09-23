@implementation SXAppearComponentAnimationHandler

- (void)prepareAnimation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXAppearComponentAnimationHandler;
  -[SXComponentAnimationHandler prepareAnimation](&v4, sel_prepareAnimation);
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    -[SXComponentAnimationHandler component](self, "component");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
}

- (void)startAnimation
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  objc_super v7;

  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v7.receiver = self;
    v7.super_class = (Class)SXAppearComponentAnimationHandler;
    -[SXComponentAnimationHandler startAnimation](&v7, sel_startAnimation);
    -[SXComponentAnimationHandler component](self, "component");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    -[SXComponentAnimationHandler component](self, "component");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    v5[4] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__SXAppearComponentAnimationHandler_startAnimation__block_invoke;
    v6[3] = &unk_24D6874A8;
    v6[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__SXAppearComponentAnimationHandler_startAnimation__block_invoke_2;
    v5[3] = &unk_24D689490;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2, v6, v5, 0.1, 0.0);
  }
}

void __51__SXAppearComponentAnimationHandler_startAnimation__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "component");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __51__SXAppearComponentAnimationHandler_startAnimation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAnimation");
}

- (void)finishAnimation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXAppearComponentAnimationHandler;
  -[SXComponentAnimationHandler finishAnimation](&v4, sel_finishAnimation);
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    -[SXComponentAnimationHandler component](self, "component");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 0);

  }
}

@end
