@implementation _UIAlertControlleriOSHighlightedBackgroundView

- (_UIAlertControlleriOSHighlightedBackgroundView)init
{
  return -[_UIAlertControlleriOSHighlightedBackgroundView initWithStyle:](self, "initWithStyle:", 0);
}

- (_UIAlertControlleriOSHighlightedBackgroundView)initWithStyle:(int64_t)a3
{
  _UIAlertControlleriOSHighlightedBackgroundView *v4;
  _UIAlertControlleriOSHighlightedBackgroundView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControlleriOSHighlightedBackgroundView;
  v4 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    -[_UIAlertControlleriOSHighlightedBackgroundView _configureWithStyle:](v4, "_configureWithStyle:", a3);
  }
  return v5;
}

- (void)_configureWithStyle:(int64_t)a3
{
  void *v4;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  UIVisualEffectView *effectView;
  id v9;

  if (a3 == 1)
  {
    -[UIView setHidden:](self, "setHidden:");
    +[UIColor whiteColor](UIColor, "whiteColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:");
  }
  else
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v4);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[UIView setHidden:](v5, "setHidden:", 1);
    -[UIView addSubview:](self, "addSubview:", v5);
    effectView = self->_effectView;
    self->_effectView = v5;

  }
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_style != 1)
    self = (_UIAlertControlleriOSHighlightedBackgroundView *)self->_effectView;
  -[UIView setHidden:](self, "setHidden:", !a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
