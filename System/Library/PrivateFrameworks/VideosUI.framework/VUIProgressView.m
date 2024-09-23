@implementation VUIProgressView

- (VUIProgressView)initWithFrame:(CGRect)a3
{
  VUIProgressView *v3;
  void *v4;
  uint64_t v5;
  UIColor *completeTintColor;
  uint64_t v7;
  UIColor *progressTintColor;
  __int128 v9;
  VUIProgressBarView *v10;
  uint64_t v11;
  VUIProgressBarView *progressBarView;
  VUIProgressBarView *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VUIProgressView;
  v3 = -[VUIProgressView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIProgressView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[VUIProgressView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v3->_height = 2.0;
    v3->_cornerRadius = 3.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 0.9);
    v5 = objc_claimAutoreleasedReturnValue();
    completeTintColor = v3->_completeTintColor;
    v3->_completeTintColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v7 = objc_claimAutoreleasedReturnValue();
    progressTintColor = v3->_progressTintColor;
    v3->_progressTintColor = (UIColor *)v7;

    v9 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&v3->_padding.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&v3->_padding.bottom = v9;
    v3->_shouldProgressBarUseRoundCorner = 0;
    v3->_useMaterial = 0;
    v3->_useVisualEffectForMaterial = 1;
    v10 = [VUIProgressBarView alloc];
    -[VUIProgressView bounds](v3, "bounds");
    v11 = -[VUIProgressBarView initWithFrame:](v10, "initWithFrame:");
    progressBarView = v3->_progressBarView;
    v3->_progressBarView = (VUIProgressBarView *)v11;

    v13 = v3->_progressBarView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIProgressBarView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[VUIProgressBarView setAutoresizingMask:](v3->_progressBarView, "setAutoresizingMask:", 18);
    -[VUIProgressBarView setCornerRadius:](v3->_progressBarView, "setCornerRadius:", v3->_cornerRadius);
    -[VUIProgressBarView setCompleteTintColor:](v3->_progressBarView, "setCompleteTintColor:", v3->_completeTintColor);
    -[VUIProgressBarView setProgressTintColor:](v3->_progressBarView, "setProgressTintColor:", v3->_progressTintColor);
    -[VUIProgressBarView setPadding:](v3->_progressBarView, "setPadding:", v3->_padding.top, v3->_padding.left, v3->_padding.bottom, v3->_padding.right);
    -[VUIProgressBarView setShouldProgressBarUseRoundCorner:](v3->_progressBarView, "setShouldProgressBarUseRoundCorner:", v3->_shouldProgressBarUseRoundCorner);
    -[VUIProgressView addSubview:](v3, "addSubview:", v3->_progressBarView);
    -[VUIProgressView _updateForStyleChange](v3, "_updateForStyleChange");
  }
  return v3;
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
  char isKindOfClass;
  UIView *materialView;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)VUIProgressView;
  -[VUIProgressView layoutSubviews](&v25, sel_layoutSubviews);
  -[VUIProgressView bounds](self, "bounds");
  if (!CGRectEqualToRect(v28, *MEMORY[0x1E0C9D648]))
  {
    -[VUIProgressView bounds](self, "bounds");
    v4 = v3 + -6.0;
    v6 = v5 + -2.0;
    v8 = v7 + 12.0;
    v10 = v9 + 10.0;
    -[VUIProgressView shadowImageView](self, "shadowImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    if (self->_materialView)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      materialView = self->_materialView;
      if ((isKindOfClass & 1) != 0)
      {
        -[VUIProgressView _maskImageForProgressBar](self, "_maskImageForProgressBar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView _setMaskImage:](materialView, "_setMaskImage:", v14);
      }
      else
      {
        -[UIView layer](materialView, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIProgressView bounds](self, "bounds");
        objc_msgSend(v14, "setFrame:");
        objc_msgSend(v14, "sublayers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v22;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v22 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v19);
              -[VUIProgressView bounds](self, "bounds");
              objc_msgSend(v20, "setFrame:");
              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v17);
        }

      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[VUIProgressView height](self, "height", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)setCompleteTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_completeTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_completeTintColor, a3);
    -[VUIProgressBarView setCompleteTintColor:](self->_progressBarView, "setCompleteTintColor:", v5);
  }

}

- (void)setCornerRadius:(double)a3
{
  if (vabdd_f64(self->_cornerRadius, a3) > 0.00000011920929)
  {
    self->_cornerRadius = a3;
    -[VUIProgressBarView setCornerRadius:](self->_progressBarView, "setCornerRadius:");
  }
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 0.00000011920929)
  {
    self->_progress = a3;
    -[VUIProgressBarView setProgress:](self->_progressBarView, "setProgress:");
  }
}

- (void)setProgressTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_progressTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    -[VUIProgressBarView setProgressTintColor:](self->_progressBarView, "setProgressTintColor:", v5);
  }

}

- (void)setGradientStartColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientStartColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientStartColor, a3);
    -[VUIProgressBarView setGradientStartColor:](self->_progressBarView, "setGradientStartColor:", v5);
  }

}

- (void)setGradientEndColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientEndColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientEndColor, a3);
    -[VUIProgressBarView setGradientEndColor:](self->_progressBarView, "setGradientEndColor:", v5);
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
    -[VUIProgressBarView setPadding:](self->_progressBarView, "setPadding:");
  }
}

- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3
{
  if (self->_shouldProgressBarUseRoundCorner != a3)
  {
    self->_shouldProgressBarUseRoundCorner = a3;
    -[VUIProgressBarView setShouldProgressBarUseRoundCorner:](self->_progressBarView, "setShouldProgressBarUseRoundCorner:");
    -[VUIProgressView setNeedsLayout](self, "setNeedsLayout");
    -[VUIProgressView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[VUIProgressView layer](self, "layer", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsEdgeAntialiasing:", v4);

  -[VUIProgressBarView layer](self->_progressBarView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", v4);

}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[VUIProgressView _updateForStyleChange](self, "_updateForStyleChange");
  }
}

- (void)setUseMaterial:(BOOL)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  CGRect v12;
  CGRect v13;

  v11[1] = *MEMORY[0x1E0C80C00];
  if (self->_useMaterial != a3)
  {
    self->_useMaterial = a3;
    -[VUIProgressBarView setUseMaterial:](self->_progressBarView, "setUseMaterial:");
    if (!self->_useMaterial)
    {
      -[UIView removeFromSuperview](self->_materialView, "removeFromSuperview");
LABEL_14:
      -[VUIProgressView setNeedsLayout](self, "setNeedsLayout");
      -[VUIProgressView setNeedsDisplay](self, "setNeedsDisplay");
      return;
    }
    if (self->_materialView)
    {
      if (!self->_useVisualEffectForMaterial)
        goto LABEL_7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->_useVisualEffectForMaterial)
        {
LABEL_11:
          -[VUIProgressView _layoutMaterialView](self, "_layoutMaterialView");
          goto LABEL_14;
        }
LABEL_7:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_8;
        goto LABEL_11;
      }
    }
LABEL_8:
    if (self->_useVisualEffectForMaterial)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
      +[VUIProgressBarBlurEffect effectWithStyle:](VUIProgressBarBlurEffect, "effectWithStyle:", 4004);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v4, "initWithEffect:", v5);
    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v5 = objc_alloc_init(MEMORY[0x1E0CD2708]);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.25);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));
      objc_msgSend(v5, "setMasksToBounds:", 1);
      objc_msgSend(v5, "setCornerRadius:", self->_cornerRadius);
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFilters:", v9);
      objc_msgSend(v6, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSublayer:", v5);

    }
    -[VUIProgressView bounds](self, "bounds");
    v13 = CGRectInset(v12, -20.0, -20.0);
    objc_msgSend(v6, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
    objc_msgSend(v6, "setAutoresizingMask:", 18);
    -[VUIProgressView setMaterialView:](self, "setMaterialView:", v6);

    goto LABEL_14;
  }
}

- (void)setMaterialView:(id)a3
{
  UIView *v5;
  UIView *materialView;
  UIView *v7;

  v5 = (UIView *)a3;
  materialView = self->_materialView;
  if (materialView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](materialView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_materialView, a3);
    -[VUIProgressView _layoutMaterialView](self, "_layoutMaterialView");
    v5 = v7;
  }

}

- (void)_layoutMaterialView
{
  UIView *materialView;
  CGRect v4;
  CGRect v5;

  if (self->_useMaterial)
  {
    materialView = self->_materialView;
    if (materialView)
    {
      -[VUIProgressView bounds](self, "bounds");
      v5 = CGRectInset(v4, -20.0, -20.0);
      -[UIView setFrame:](materialView, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
      -[UIView setAutoresizingMask:](self->_materialView, "setAutoresizingMask:", 18);
      if (!-[UIView isDescendantOfView:](self->_materialView, "isDescendantOfView:", self))
        -[VUIProgressView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_materialView, self->_progressBarView);
    }
  }
  -[VUIProgressView setNeedsLayout](self, "setNeedsLayout");
  -[VUIProgressView setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)_maskImageForProgressBar
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  UIView *materialView;
  void *v13;
  void *v14;
  CGSize v16;

  -[UIView bounds](self->_materialView, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;
  v16.width = v4;
  v16.height = v6;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFill");

  v11 = (void *)MEMORY[0x1E0DC3508];
  materialView = self->_materialView;
  -[VUIProgressView bounds](self, "bounds");
  -[UIView convertRect:fromView:](materialView, "convertRect:fromView:", self);
  objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fill");

  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

- (void)_updateForStyleChange
{
  unint64_t style;
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
    v6 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("ProgressBarShadow"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resizableImageWithCapInsets:", 7.0, 11.0, 7.0, 11.0);
    v11 = (UIImageView *)objc_claimAutoreleasedReturnValue();

    v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
    v10 = self->_shadowImageView;
    self->_shadowImageView = v9;

    -[VUIProgressView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowImageView, 0);
    v5 = v11;
    goto LABEL_7;
  }
}

- (unint64_t)style
{
  return self->_style;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
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

- (BOOL)useVisualEffectForMaterial
{
  return self->_useVisualEffectForMaterial;
}

- (void)setUseVisualEffectForMaterial:(BOOL)a3
{
  self->_useVisualEffectForMaterial = a3;
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

- (UIImageView)shadowImageView
{
  return self->_shadowImageView;
}

- (void)setShadowImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowImageView, a3);
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_completeTintColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
  objc_storeStrong((id *)&self->_progressBarView, 0);
}

@end
