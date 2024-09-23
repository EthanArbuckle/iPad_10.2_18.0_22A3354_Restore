@implementation SBPowerDownView

- (void)_powerDownSliderDidBeginSlide
{
  void *v3;
  objc_super v4;

  -[SBPowerDownView powerDownDelegate](self, "powerDownDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "powerDownViewDidBeginSlide:", self);
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  -[SBUIPowerDownView _powerDownSliderDidBeginSlide](&v4, sel__powerDownSliderDidBeginSlide);

}

- (void)_powerDownSliderDidUpdateSlideWithValue:(double)a3
{
  void *v5;
  objc_super v6;

  -[SBPowerDownView powerDownDelegate](self, "powerDownDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "powerDownView:didUpdateSlideWithValue:", self, a3);
  v6.receiver = self;
  v6.super_class = (Class)SBPowerDownView;
  -[SBUIPowerDownView _powerDownSliderDidUpdateSlideWithValue:](&v6, sel__powerDownSliderDidUpdateSlideWithValue_, a3);

}

- (void)_powerDownSliderDidCompleteSlide
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;
  objc_super v10;

  -[SBPowerDownView powerDownDelegate](self, "powerDownDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBUIPowerDownView deviceSupportsFindMy](self, "deviceSupportsFindMy")
    && (v4 = -[SBUIPowerDownView shouldPowerDownViewShowFindMyAlert](self, "shouldPowerDownViewShowFindMyAlert"), v3)
    && v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBPowerDownView;
    -[SBUIPowerDownView _prepareViewsForAlert](&v10, sel__prepareViewsForAlert);
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__SBPowerDownView__powerDownSliderDidCompleteSlide__block_invoke;
    v8[3] = &unk_1E8E9E820;
    v8[4] = self;
    v9 = v3;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __51__SBPowerDownView__powerDownSliderDidCompleteSlide__block_invoke_2;
    v7[3] = &unk_1E8E9DED8;
    v7[4] = self;
    objc_msgSend(v9, "showPowerDownFindMyAlertWithProceed:cancelCompletion:", v8, v7);

  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "powerDownViewDidCompleteSlide:", self);
    v6.receiver = self;
    v6.super_class = (Class)SBPowerDownView;
    -[SBUIPowerDownView _powerDownSliderDidCompleteSlide](&v6, sel__powerDownSliderDidCompleteSlide);
  }

}

id __51__SBPowerDownView__powerDownSliderDidCompleteSlide__block_invoke(uint64_t a1)
{
  objc_super v3;

  objc_msgSend(*(id *)(a1 + 32), "setShouldPowerDownViewShowFindMyAlert:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "powerDownViewDidCompleteSlide:", *(_QWORD *)(a1 + 32));
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SBPowerDownView;
  return objc_msgSendSuper2(&v3, sel__powerDownSliderDidCompleteSlide);
}

uint64_t __51__SBPowerDownView__powerDownSliderDidCompleteSlide__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldPowerDownViewShowFindMyAlert:", 0);
}

- (void)_powerDownSliderDidCancelSlide
{
  void *v3;
  objc_super v4;

  -[SBPowerDownView powerDownDelegate](self, "powerDownDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "powerDownViewDidCancelSlide:", self);
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  -[SBUIPowerDownView _powerDownSliderDidCancelSlide](&v4, sel__powerDownSliderDidCancelSlide);

}

- (void)_cancelButtonTapped
{
  void *v3;
  objc_super v4;

  -[SBPowerDownView powerDownDelegate](self, "powerDownDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "powerDownViewDidReceiveCancelButtonAction:", self);
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  -[SBUIPowerDownView _cancelButtonTapped](&v4, sel__cancelButtonTapped);

}

- (void)_didTapFindMy
{
  void *v3;
  objc_super v4;

  -[SBPowerDownView powerDownDelegate](self, "powerDownDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  -[SBUIPowerDownView _prepareViewsForAlert](&v4, sel__prepareViewsForAlert);
  objc_msgSend(v3, "showPowerDownFindMyAlert");

}

- (void)_idleTimerFired
{
  void *v3;
  objc_super v4;

  -[SBPowerDownView powerDownDelegate](self, "powerDownDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "powerDownViewDidFireIdleTimer:", self);
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  -[SBUIPowerDownView _idleTimerFired](&v4, sel__idleTimerFired);

}

- (SBPowerDownViewDelegate)powerDownDelegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPowerDownView;
  -[SBUIPowerDownView delegate](&v3, sel_delegate);
  return (SBPowerDownViewDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPowerDownDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPowerDownView;
  -[SBUIPowerDownView setDelegate:](&v3, sel_setDelegate_, a3);
}

@end
