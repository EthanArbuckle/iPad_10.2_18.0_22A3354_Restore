@implementation NCNotificationSummaryOnboardingButton

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryOnboardingButton;
  -[NCNotificationSummaryOnboardingButton layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationSummaryOnboardingButton _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[NCNotificationSummaryOnboardingButton _layoutBackgroundView](self, "_layoutBackgroundView");
}

- (void)_configureBackgroundViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *backgroundView;
  UIView *v6;
  void *v7;

  if (!self->_backgroundView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    v6 = self->_backgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.25);
    -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
    -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", 8.0);
    -[NCNotificationSummaryOnboardingButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
  }
}

- (void)_layoutBackgroundView
{
  UIView *backgroundView;

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[NCNotificationSummaryOnboardingButton bounds](self, "bounds");
    -[UIView setFrame:](backgroundView, "setFrame:");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSummaryOnboardingButton;
  -[NCNotificationSummaryOnboardingButton setHighlighted:](&v6, sel_setHighlighted_);
  if (a3)
  {
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.1);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__NCNotificationSummaryOnboardingButton_setHighlighted___block_invoke;
    v5[3] = &unk_1E8D1B568;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.1);
  }
}

uint64_t __56__NCNotificationSummaryOnboardingButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 752), "setAlpha:", 0.25);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
