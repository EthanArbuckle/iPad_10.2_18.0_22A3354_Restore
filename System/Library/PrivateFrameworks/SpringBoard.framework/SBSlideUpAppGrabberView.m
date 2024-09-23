@implementation SBSlideUpAppGrabberView

- (SBSlideUpAppGrabberView)initWithAdditionalTopPadding:(BOOL)a3 invertVerticalInsets:(BOOL)a4
{
  _BOOL4 v5;
  SBSlideUpAppGrabberView *v6;
  double v7;
  double v8;
  int v9;
  int v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  id v29;
  uint64_t v30;
  UIView *tintView;
  SBSaturatedIconView *v32;
  SBSaturatedIconView *saturatedIconView;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SBSlideUpAppGrabberView;
  v6 = -[SBSlideUpAppGrabberView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DA9E68], "slideUpGrabberInset");
    v8 = v7;
    v9 = __sb__runningInSpringBoard();
    if (v5)
    {
      if ((v9 & 1) != 0)
      {
        v10 = SBFEffectiveDeviceClass();
        v11 = 40.0;
        if (v10 == 2)
          v11 = 80.0;
        v12 = -v11;
        if (a4)
          goto LABEL_24;
LABEL_13:
        if (__sb__runningInSpringBoard())
        {
          v13 = SBFEffectiveDeviceClass();
          v14 = 40.0;
          if (v13 == 2)
            v14 = 100.0;
          v15 = -v14;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "userInterfaceIdiom");
          v25 = 40.0;
          if (v24 == 1)
            v25 = 100.0;
          v15 = -v25;

        }
        v19 = -v8;
        v22 = v19;
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "userInterfaceIdiom");
      v18 = 40.0;
      if (v17 == 1)
        v18 = 80.0;
      v12 = -v18;
    }
    else
    {
      if (v9)
      {
        if (SBFEffectiveDeviceClass() == 2)
          v12 = -50.0;
        else
          v12 = -20.0;
        if (!a4)
          goto LABEL_13;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "userInterfaceIdiom") == 1)
        v12 = -50.0;
      else
        v12 = -20.0;
    }

    if (!a4)
      goto LABEL_13;
LABEL_24:
    v19 = -v8;
    if ((__sb__runningInSpringBoard() & 1) != 0)
    {
      v20 = SBFEffectiveDeviceClass();
      v21 = 40.0;
      if (v20 == 2)
        v21 = 100.0;
      v22 = -v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "userInterfaceIdiom");
      v28 = 40.0;
      if (v27 == 1)
        v28 = 100.0;
      v22 = -v28;

    }
    v15 = v19;
LABEL_36:
    v6->_hitTestEdgeInsets.top = v12;
    v6->_hitTestEdgeInsets.left = v15;
    v6->_hitTestEdgeInsets.bottom = v19;
    v6->_hitTestEdgeInsets.right = v22;
    v6->_vibrancyAllowed = 1;
    v29 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBSlideUpAppGrabberView bounds](v6, "bounds");
    v30 = objc_msgSend(v29, "initWithFrame:");
    tintView = v6->_tintView;
    v6->_tintView = (UIView *)v30;

    -[SBSlideUpAppGrabberView addSubview:](v6, "addSubview:", v6->_tintView);
    v32 = -[SBSaturatedIconView initWithImage:]([SBSaturatedIconView alloc], "initWithImage:", 0);
    saturatedIconView = v6->_saturatedIconView;
    v6->_saturatedIconView = v32;

    -[SBSlideUpAppGrabberView addSubview:](v6, "addSubview:", v6->_saturatedIconView);
    -[SBSlideUpAppGrabberView setExclusiveTouch:](v6, "setExclusiveTouch:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSlideUpAppGrabberView setBackgroundColor:](v6, "setBackgroundColor:", v34);

    -[SBSlideUpAppGrabberView layer](v6, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAllowsGroupBlending:", 0);

    -[SBSlideUpAppGrabberView layer](v6, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMasksToBounds:", 1);

  }
  return v6;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  UIEdgeInsets *p_hitTestEdgeInsets;
  double left;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  p_hitTestEdgeInsets = &self->_hitTestEdgeInsets;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_hitTestEdgeInsets.top, *MEMORY[0x1E0CEB4B0]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_hitTestEdgeInsets.bottom, *(float64x2_t *)(MEMORY[0x1E0CEB4B0] + 16)))), 0xFuLL))) & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSlideUpAppGrabberView;
    return -[SBSlideUpAppGrabberView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, a4, a3.x, a3.y);
  }
  else
  {
    -[SBSlideUpAppGrabberView bounds](self, "bounds", a4);
    left = p_hitTestEdgeInsets->left;
    v15.origin.x = v8 + left;
    v15.origin.y = p_hitTestEdgeInsets->top + v9;
    v15.size.width = v10 - (left + p_hitTestEdgeInsets->right);
    v15.size.height = v11 - (p_hitTestEdgeInsets->top + p_hitTestEdgeInsets->bottom);
    v14.x = x;
    v14.y = y;
    return CGRectContainsPoint(v15, v14);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (self->_grabberImage)
    -[UIImage size](self->_grabberImage, "size", a3.width, a3.height);
  else
    -[SBSaturatedIconView sizeThatFits:](self->_saturatedIconView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  SBSaturatedIconView *saturatedIconView;
  UIView *tintView;
  UIView *backgroundView;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSlideUpAppGrabberView;
  -[SBSlideUpAppGrabberView layoutSubviews](&v8, sel_layoutSubviews);
  saturatedIconView = self->_saturatedIconView;
  -[SBSlideUpAppGrabberView bounds](self, "bounds");
  -[SBSaturatedIconView setFrame:](saturatedIconView, "setFrame:");
  tintView = self->_tintView;
  -[SBSlideUpAppGrabberView bounds](self, "bounds");
  -[UIView setFrame:](tintView, "setFrame:");
  backgroundView = self->_backgroundView;
  -[SBSlideUpAppGrabberView bounds](self, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  -[SBSlideUpAppGrabberView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSlideUpAppGrabberView bounds](self, "bounds");
  objc_msgSend(v7, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  if (self->_saturatedIconView)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBSlideUpAppGrabberView;
  -[SBSlideUpAppGrabberView setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);

}

- (void)setGrabberImageFromAppWithBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableUIIconImageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Siri")))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("siri-suggestion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v7);
  }
  else
  {
    objc_msgSend(v4, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationIconForBundleIdentifier:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSlideUpAppGrabberView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageForIcon:compatibleWithTraitCollection:options:", v7, v6, 2);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSlideUpAppGrabberView setAppStyleGrabberImage:](self, "setAppStyleGrabberImage:", v9);
  objc_msgSend(v5, "iconImageInfo");
  -[SBSlideUpAppGrabberView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v10);

}

- (void)setAppStyleGrabberImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_grabberImage, a3);
  v5 = a3;
  -[SBSaturatedIconView setImage:](self->_saturatedIconView, "setImage:", v5);

  -[SBSlideUpAppGrabberView sizeToFit](self, "sizeToFit");
  -[SBSlideUpAppGrabberView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_shouldUseVibrancy
{
  return SBGraphicsQuality(self, a2) == 100 && -[SBSlideUpAppGrabberView isVibrancyAllowed](self, "isVibrancyAllowed");
}

- (void)setVibrancyAllowed:(BOOL)a3
{
  SBUILegibilityView *legibilityView;
  SBUILegibilityView *v5;

  if (self->_vibrancyAllowed != a3)
  {
    self->_vibrancyAllowed = a3;
    if (a3)
    {
      legibilityView = self->_legibilityView;
      if (legibilityView)
      {
        -[SBUILegibilityView removeFromSuperview](legibilityView, "removeFromSuperview");
        v5 = self->_legibilityView;
        self->_legibilityView = 0;

      }
    }
  }
}

- (void)setVibrantSettings:(id)a3
{
  id v5;
  _SBFVibrantSettings **p_vibrantSettings;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = a3;
  if (-[SBSlideUpAppGrabberView _shouldUseVibrancy](self, "_shouldUseVibrancy"))
  {
    p_vibrantSettings = &self->_vibrantSettings;
    if ((-[_SBFVibrantSettings isEqual:](self->_vibrantSettings, "isEqual:", v5) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_vibrantSettings, a3);
      -[_SBFVibrantSettings tintColor](*p_vibrantSettings, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_SBFVibrantSettings style](*p_vibrantSettings, "style") == 2)
      {
        v14 = 0.0;
        v15 = 0.0;
        v12 = 0.0;
        v13 = 0.0;
        objc_msgSend(v7, "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);
        v8 = (void *)MEMORY[0x1E0CEA478];
        v9 = (v15 + v14 + v13) * 1.20000005 / 3.0;
        v10 = v12;
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0CEA478];
        v10 = 0.100000001;
        v9 = 0.0;
      }
      objc_msgSend(v8, "colorWithWhite:alpha:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView setBackgroundColor:](self->_tintView, "setBackgroundColor:", v11);
    }
  }

}

- (void)setBackgroundView:(id)a3
{
  _BOOL4 v5;
  UIView *v6;
  UIView **p_backgroundView;
  UIView *backgroundView;
  UIView *v9;
  UIView *v10;

  v10 = (UIView *)a3;
  v5 = -[SBSlideUpAppGrabberView _shouldUseVibrancy](self, "_shouldUseVibrancy");
  v6 = v10;
  if (v5)
  {
    p_backgroundView = &self->_backgroundView;
    backgroundView = self->_backgroundView;
    if (backgroundView != v10)
    {
      -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_backgroundView, a3);
      v9 = *p_backgroundView;
      -[SBSlideUpAppGrabberView bounds](self, "bounds");
      -[UIView setFrame:](v9, "setFrame:");
      -[SBSlideUpAppGrabberView addSubview:](self, "addSubview:", *p_backgroundView);
      -[SBSlideUpAppGrabberView sendSubviewToBack:](self, "sendSubviewToBack:", *p_backgroundView);
      v6 = v10;
    }
  }

}

- (id)_lazyLegibilityView
{
  id v3;
  double v4;
  double v5;
  SBUILegibilityView *v6;
  SBUILegibilityView *legibilityView;
  SBUILegibilityView *v8;
  void *v9;

  if (!-[SBSlideUpAppGrabberView _shouldUseVibrancy](self, "_shouldUseVibrancy") && !self->_legibilityView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DAC5E0]);
    -[UIImage size](self->_grabberImage, "size");
    v6 = (SBUILegibilityView *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v4, v5);
    legibilityView = self->_legibilityView;
    self->_legibilityView = v6;

    v8 = self->_legibilityView;
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilityView updateForChangedSettings:options:image:strength:](v8, "updateForChangedSettings:options:image:strength:", v9, 3, self->_grabberImage, *MEMORY[0x1E0CEC0D0]);

    -[SBUILegibilityView bounds](self->_legibilityView, "bounds");
    -[SBSlideUpAppGrabberView setBounds:](self, "setBounds:");
    -[SBSlideUpAppGrabberView addSubview:](self, "addSubview:", self->_legibilityView);
    -[SBUILegibilityView setAutoresizingMask:](self->_legibilityView, "setAutoresizingMask:", 18);
    -[SBSlideUpAppGrabberView setAutoresizesSubviews:](self, "setAutoresizesSubviews:", 1);
    if (self->_saturatedIconView)
      -[SBSlideUpAppGrabberView sendSubviewToBack:](self, "sendSubviewToBack:", self->_legibilityView);
  }
  return self->_legibilityView;
}

- (void)setStrength:(double)a3
{
  id v4;

  self->_strength = a3;
  -[SBSlideUpAppGrabberView _lazyLegibilityView](self, "_lazyLegibilityView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrength:", a3);

}

- (void)setLegibilitySettings:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  v5 = a3;
  -[SBSlideUpAppGrabberView _lazyLegibilityView](self, "_lazyLegibilityView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLegibilitySettings:", v5);

}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestEdgeInsets.top;
  left = self->_hitTestEdgeInsets.left;
  bottom = self->_hitTestEdgeInsets.bottom;
  right = self->_hitTestEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (_SBFVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isVibrancyAllowed
{
  return self->_vibrancyAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_storeStrong((id *)&self->_grabberImage, 0);
  objc_storeStrong((id *)&self->_saturatedIconView, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
