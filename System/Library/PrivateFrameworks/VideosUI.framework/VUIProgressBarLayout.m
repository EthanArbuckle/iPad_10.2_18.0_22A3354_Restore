@implementation VUIProgressBarLayout

+ (id)defaultProgressBarLayout
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 2)
  {
    objc_msgSend(v2, "setHeight:", 10.0);
    objc_msgSend(v2, "setPadding:", 2.0, 2.0, 2.0, 2.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_progressBarFillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFillColor:", v5);

    objc_msgSend(v2, "setCornerRadius:", 5.0);
    objc_msgSend(v2, "setShouldProgressBarUseRoundCorner:", 1);
    objc_msgSend(v2, "setUseMaterial:", 1);
    objc_msgSend(v2, "setTintColor:", 0);
  }
  else
  {
    objc_msgSend(v2, "setHeight:", 2.0);
    objc_msgSend(v2, "setCornerRadius:", 5.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.847058824, 0.847058824, 0.847058824, 0.4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTintColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFillColor:", v7);

    objc_msgSend(v2, "setShouldProgressBarUseRoundCorner:", 1);
    objc_msgSend(v2, "setUseMaterial:", 0);
  }
  return v2;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (void)setGradientStartColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientStartColor, a3);
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientEndColor, a3);
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UIEdgeInsets)margin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margin.top;
  left = self->_margin.left;
  bottom = self->_margin.bottom;
  right = self->_margin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)shouldProgressBarUseRoundCorner
{
  return self->_shouldProgressBarUseRoundCorner;
}

- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3
{
  self->_shouldProgressBarUseRoundCorner = a3;
}

- (BOOL)useMaterial
{
  return self->_useMaterial;
}

- (void)setUseMaterial:(BOOL)a3
{
  self->_useMaterial = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
