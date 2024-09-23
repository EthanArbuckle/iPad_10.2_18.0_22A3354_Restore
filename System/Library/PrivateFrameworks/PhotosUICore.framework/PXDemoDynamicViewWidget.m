@implementation PXDemoDynamicViewWidget

- (void)_loadView
{
  UIView *v3;
  UIView *view;
  UIView *v5;
  void *v6;

  if (!self->__view)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    view = self->__view;
    self->__view = v3;

    v5 = self->__view;
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[PXDemoDynamicViewWidget _heartBeatIncreaseHeightPhase:](self, "_heartBeatIncreaseHeightPhase:", 0);
  }
}

- (void)_heartBeatIncreaseHeightPhase:(BOOL)a3
{
  double v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (a3)
  {
    -[PXDemoDynamicViewWidget _preferredHeightPhase](self, "_preferredHeightPhase");
    -[PXDemoDynamicViewWidget _setPreferredHeightPhase:](self, "_setPreferredHeightPhase:", v4 + 1.0);
  }
  -[PXDemoDynamicViewWidget widgetDelegate](self, "widgetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetLocalizedTitleDidChange:", self);

  objc_initWeak(&location, self);
  v6 = dispatch_time(0, 1000000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PXDemoDynamicViewWidget__heartBeatIncreaseHeightPhase___block_invoke;
  v7[3] = &unk_1E5148D30;
  objc_copyWeak(&v8, &location);
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_setPreferredHeightPhase:(double)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PXDemoDynamicViewWidget *v8;

  if (self->__preferredHeightPhase != a3)
  {
    self->__preferredHeightPhase = a3;
    -[PXDemoDynamicViewWidget widgetDelegate](self, "widgetDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__PXDemoDynamicViewWidget__setPreferredHeightPhase___block_invoke;
    v6[3] = &unk_1E5148D08;
    v7 = v4;
    v8 = self;
    v5 = v4;
    objc_msgSend(v5, "widget:animateChanges:withAnimationOptions:", self, v6, 0);

  }
}

- (BOOL)hasContentForCurrentInput
{
  void *v2;
  char v3;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showDemoDynamicWidget");

  return v3;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  return MEMORY[0x1A85CCD54](-[PXDemoDynamicViewWidget _preferredHeightPhase](self, "_preferredHeightPhase", a3))
       * 100.0
       + 200.0;
}

- (PXAnonymousView)contentView
{
  -[PXDemoDynamicViewWidget _loadView](self, "_loadView");
  return (PXAnonymousView *)-[PXDemoDynamicViewWidget _view](self, "_view");
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromDate:dateStyle:timeStyle:", v4, 0, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Dynamic (%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (UIView)_view
{
  return self->__view;
}

- (double)_preferredHeightPhase
{
  return self->__preferredHeightPhase;
}

- (void)_setPreferredHeight:(double)a3
{
  self->__preferredHeightPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__view, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
}

uint64_t __52__PXDemoDynamicViewWidget__setPreferredHeightPhase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widgetPreferredContentHeightForWidthDidChange:", *(_QWORD *)(a1 + 40));
}

void __57__PXDemoDynamicViewWidget__heartBeatIncreaseHeightPhase___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_heartBeatIncreaseHeightPhase:", 1);

}

@end
