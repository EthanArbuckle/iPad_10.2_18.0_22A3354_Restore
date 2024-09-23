@implementation _TVProgressView

- (_TVProgressView)initWithFrame:(CGRect)a3
{
  char *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  _TVProgressBarView *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_TVProgressView;
  v3 = -[_TVProgressView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

    objc_msgSend(v3, "setClipsToBounds:", 0);
    *((_QWORD *)v3 + 55) = 0x4008000000000000;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.2, 0.9);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v3 + 60);
    *((_QWORD *)v3 + 60) = v5;

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v3 + 57);
    *((_QWORD *)v3 + 57) = v7;

    v9 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)(v3 + 504) = *MEMORY[0x24BDF7718];
    *(_OWORD *)(v3 + 520) = v9;
    v3[425] = 0;
    v10 = [_TVProgressBarView alloc];
    objc_msgSend(v3, "bounds");
    v11 = -[_TVProgressBarView initWithFrame:](v10, "initWithFrame:");
    v12 = (void *)*((_QWORD *)v3 + 52);
    *((_QWORD *)v3 + 52) = v11;

    v13 = (void *)*((_QWORD *)v3 + 52);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    objc_msgSend(*((id *)v3 + 52), "setAutoresizingMask:", 18);
    objc_msgSend(*((id *)v3 + 52), "setCornerRadius:", *((double *)v3 + 55));
    objc_msgSend(*((id *)v3 + 52), "setCompleteTintColor:", *((_QWORD *)v3 + 60));
    objc_msgSend(*((id *)v3 + 52), "setProgressTintColor:", *((_QWORD *)v3 + 57));
    objc_msgSend(*((id *)v3 + 52), "setPadding:", *((double *)v3 + 63), *((double *)v3 + 64), *((double *)v3 + 65), *((double *)v3 + 66));
    objc_msgSend(*((id *)v3 + 52), "setShouldProgressBarUseRoundCorner:", v3[425]);
    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 52));
    v15 = objc_alloc(MEMORY[0x24BDF6FC8]);
    +[_TVProgressBarBlurEffect effectWithStyle:](_TVProgressBarBlurEffect, "effectWithStyle:", 4004);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithEffect:", v16);
    v18 = (void *)*((_QWORD *)v3 + 61);
    *((_QWORD *)v3 + 61) = v17;

    objc_msgSend(v3, "_updateForStyleChange");
  }
  return (_TVProgressView *)v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  UIVisualEffectView *materialView;
  UIVisualEffectView *v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v15.receiver = self;
  v15.super_class = (Class)_TVProgressView;
  -[_TVProgressView layoutSubviews](&v15, sel_layoutSubviews);
  -[_TVProgressView bounds](self, "bounds");
  if (!CGRectEqualToRect(v16, *MEMORY[0x24BDBF090]))
  {
    -[_TVProgressView bounds](self, "bounds");
    v4 = v3 + -6.0;
    v6 = v5 + -2.0;
    v8 = v7 + 12.0;
    v10 = v9 + 10.0;
    -[_TVProgressView shadowImageView](self, "shadowImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    if (-[_TVProgressView useMaterial](self, "useMaterial"))
    {
      materialView = self->_materialView;
      -[_TVProgressView bounds](self, "bounds");
      v18 = CGRectInset(v17, -20.0, -20.0);
      -[UIVisualEffectView setFrame:](materialView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
      v13 = self->_materialView;
      -[_TVProgressView _maskImageForProgressBar](self, "_maskImageForProgressBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _setMaskImage:](v13, "_setMaskImage:", v14);

    }
  }
}

- (void)setCompleteTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_completeTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_completeTintColor, a3);
    -[_TVProgressBarView setCompleteTintColor:](self->_progressBarView, "setCompleteTintColor:", v5);
  }

}

- (void)setCornerRadius:(double)a3
{
  if (vabdd_f64(self->_cornerRadius, a3) > 0.00000011920929)
  {
    self->_cornerRadius = a3;
    -[_TVProgressBarView setCornerRadius:](self->_progressBarView, "setCornerRadius:");
  }
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 0.00000011920929)
  {
    self->_progress = a3;
    -[_TVProgressBarView setProgress:](self->_progressBarView, "setProgress:");
  }
}

- (void)setProgressTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_progressTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    -[_TVProgressBarView setProgressTintColor:](self->_progressBarView, "setProgressTintColor:", v5);
  }

}

- (void)setGradientStartColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientStartColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientStartColor, a3);
    -[_TVProgressBarView setGradientStartColor:](self->_progressBarView, "setGradientStartColor:", v5);
  }

}

- (void)setGradientEndColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientEndColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientEndColor, a3);
    -[_TVProgressBarView setGradientEndColor:](self->_progressBarView, "setGradientEndColor:", v5);
  }

}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_padding.left
    || a3.top != self->_padding.top
    || a3.right != self->_padding.right
    || a3.bottom != self->_padding.bottom)
  {
    self->_padding = a3;
    -[_TVProgressBarView setPadding:](self->_progressBarView, "setPadding:");
  }
}

- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3
{
  if (self->_shouldProgressBarUseRoundCorner != a3)
  {
    self->_shouldProgressBarUseRoundCorner = a3;
    -[_TVProgressBarView setShouldProgressBarUseRoundCorner:](self->_progressBarView, "setShouldProgressBarUseRoundCorner:");
    -[_TVProgressView setNeedsLayout](self, "setNeedsLayout");
    -[_TVProgressView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[_TVProgressView layer](self, "layer", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsEdgeAntialiasing:", v4);

  -[_TVProgressBarView layer](self->_progressBarView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", v4);

}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[_TVProgressView _updateForStyleChange](self, "_updateForStyleChange");
  }
}

- (void)setUseMaterial:(BOOL)a3
{
  if (self->_useMaterial != a3)
  {
    self->_useMaterial = a3;
    -[_TVProgressBarView setUseMaterial:](self->_progressBarView, "setUseMaterial:");
    if (self->_useMaterial)
      -[_TVProgressView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_materialView, self->_progressBarView);
    else
      -[UIVisualEffectView removeFromSuperview](self->_materialView, "removeFromSuperview");
    -[_TVProgressView setNeedsLayout](self, "setNeedsLayout");
    -[_TVProgressView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setMaterialView:(id)a3
{
  UIVisualEffectView *v5;
  UIVisualEffectView **p_materialView;
  UIVisualEffectView *materialView;
  UIVisualEffectView *v8;

  v5 = (UIVisualEffectView *)a3;
  p_materialView = &self->_materialView;
  materialView = self->_materialView;
  if (materialView != v5)
  {
    v8 = v5;
    -[UIVisualEffectView removeFromSuperview](materialView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_materialView, a3);
    if (-[_TVProgressView useMaterial](self, "useMaterial")
      && (-[UIVisualEffectView isDescendantOfView:](*p_materialView, "isDescendantOfView:", self) & 1) == 0)
    {
      -[_TVProgressView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", *p_materialView, self->_progressBarView);
    }
    -[_TVProgressView setNeedsLayout](self, "setNeedsLayout");
    -[_TVProgressView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v8;
  }

}

- (id)_maskImageForProgressBar
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  objc_msgSend(v3, "setScale:");

  objc_msgSend(v3, "setOpaque:", 0);
  v5 = objc_alloc(MEMORY[0x24BDF6A98]);
  -[UIVisualEffectView bounds](self->_materialView, "bounds");
  v8 = (void *)objc_msgSend(v5, "initWithSize:format:", v3, v6, v7);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43___TVProgressView__maskImageForProgressBar__block_invoke;
  v11[3] = &unk_24EB86630;
  v11[4] = self;
  objc_msgSend(v8, "imageWithActions:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateForStyleChange
{
  int64_t style;
  UIImageView *shadowImageView;
  UIImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *v10;
  UIImageView *v11;

  style = self->_style;
  shadowImageView = self->_shadowImageView;
  if (style)
  {
    if (shadowImageView)
    {
      -[UIImageView removeFromSuperview](shadowImageView, "removeFromSuperview");
      v5 = self->_shadowImageView;
      self->_shadowImageView = 0;
LABEL_7:

    }
  }
  else if (!shadowImageView)
  {
    v6 = (void *)MEMORY[0x24BDF6AC8];
    +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("tvprogressview-shadow"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resizableImageWithCapInsets:", 7.0, 11.0, 7.0, 11.0);
    v11 = (UIImageView *)objc_claimAutoreleasedReturnValue();

    v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v11);
    v10 = self->_shadowImageView;
    self->_shadowImageView = v9;

    -[_TVProgressView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowImageView, 0);
    v5 = v11;
    goto LABEL_7;
  }
}

- (int64_t)style
{
  return self->_style;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)progressTintColor
{
  return self->_progressTintColor;
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (UIColor)completeTintColor
{
  return self->_completeTintColor;
}

- (BOOL)useMaterial
{
  return self->_useMaterial;
}

- (BOOL)shouldProgressBarUseRoundCorner
{
  return self->_shouldProgressBarUseRoundCorner;
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

- (UIVisualEffectView)materialView
{
  return self->_materialView;
}

- (UIImageView)shadowImageView
{
  return self->_shadowImageView;
}

- (void)setShadowImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_completeTintColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
  objc_storeStrong((id *)&self->_progressBarView, 0);
}

@end
