@implementation _UIInterfaceActionVibrantSeparatorView

- (_UIInterfaceActionVibrantSeparatorView)init
{
  _UIInterfaceActionVibrantSeparatorView *v2;
  _UIInterfaceActionSeparatorConstraintController *v3;
  _UIInterfaceActionSeparatorConstraintController *separatorViewConstraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIInterfaceActionVibrantSeparatorView;
  v2 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = -[_UIInterfaceActionSeparatorConstraintController initWithSeparatorView:]([_UIInterfaceActionSeparatorConstraintController alloc], "initWithSeparatorView:", v2);
    separatorViewConstraints = v2->_separatorViewConstraints;
    v2->_separatorViewConstraints = v3;

    -[_UIInterfaceActionVibrantSeparatorView _setupEffectView](v2, "_setupEffectView");
  }
  return v2;
}

- (void)_setupEffectView
{
  void *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *effectView;
  void *v6;
  void *v7;
  id v8;

  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:", v8, 120);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v3);
  effectView = self->_effectView;
  self->_effectView = v4;

  +[UIColor whiteColor](UIColor, "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_effectView, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_effectView, "setFrame:");
  -[UIView setAutoresizingMask:](self->_effectView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self, "addSubview:", self->_effectView);

}

- (void)setConstantAxisDimension:(double)a3
{
  void *v5;
  id v6;

  -[_UIInterfaceActionSeparatorConstraintController setConstantAxisDimension:](self->_separatorViewConstraints, "setConstantAxisDimension:");
  if (a3 >= 0.0)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_effectView, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
}

- (double)constantAxisDimension
{
  double result;

  -[_UIInterfaceActionSeparatorConstraintController constantAxisDimension](self->_separatorViewConstraints, "constantAxisDimension");
  return result;
}

- (void)setHorizontalLineLeadingInset:(double)a3
{
  if (self->_horizontalLineLeadingInset != a3)
  {
    self->_horizontalLineLeadingInset = a3;
    -[_UIInterfaceActionVibrantSeparatorView _updateContentDirectionalInsets](self, "_updateContentDirectionalInsets");
  }
}

- (void)setConstantSizedAxis:(int64_t)a3
{
  -[_UIInterfaceActionSeparatorConstraintController setConstantSizedAxis:](self->_separatorViewConstraints, "setConstantSizedAxis:", a3);
  -[_UIInterfaceActionVibrantSeparatorView _updateContentDirectionalInsets](self, "_updateContentDirectionalInsets");
}

- (int64_t)constantSizedAxis
{
  return -[_UIInterfaceActionSeparatorConstraintController constantSizedAxis](self->_separatorViewConstraints, "constantSizedAxis");
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionVibrantSeparatorView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  -[_UIInterfaceActionSeparatorConstraintController separatorViewDidUpdateConstraints](self->_separatorViewConstraints, "separatorViewDidUpdateConstraints");
}

- (void)_updateContentDirectionalInsets
{
  int64_t v3;
  double v4;
  double v5;

  v3 = -[_UIInterfaceActionVibrantSeparatorView constantSizedAxis](self, "constantSizedAxis");
  v4 = 0.0;
  if (v3 == 1)
  {
    -[_UIInterfaceActionVibrantSeparatorView horizontalLineLeadingInset](self, "horizontalLineLeadingInset");
    v4 = v5;
  }
  -[UIView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 0.0, v4, 0.0, 0.0);
}

- (double)horizontalLineLeadingInset
{
  return self->_horizontalLineLeadingInset;
}

- (_UIInterfaceActionSeparatorConstraintController)separatorViewConstraints
{
  return self->_separatorViewConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViewConstraints, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
