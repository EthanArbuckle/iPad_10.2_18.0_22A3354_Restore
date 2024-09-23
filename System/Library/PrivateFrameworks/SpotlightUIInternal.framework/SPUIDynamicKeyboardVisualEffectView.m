@implementation SPUIDynamicKeyboardVisualEffectView

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double x;
  double y;
  double width;
  double height;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _BOOL4 v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;

  -[SPUIDynamicKeyboardVisualEffectView tlks_screen](self, "tlks_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;

  v32.receiver = self;
  v32.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  -[SPUIDynamicKeyboardVisualEffectView layoutSubviews](&v32, sel_layoutSubviews);
  -[SPUIDynamicKeyboardVisualEffectView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v11 = v6;
  v13 = v12;
  v14 = v12 < 363.0 || v6 < v5;
  if (v14 && !-[SPUIDynamicKeyboardVisualEffectView hideVisualEffectView](self, "hideVisualEffectView"))
  {
    v13 = 363.0;
    v11 = v5;
  }
  v15 = *(double *)&SPUIExtendedEdgesDimensionConstant;
  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.width = v11;
  v33.size.height = v13;
  v34 = CGRectInset(v33, -*(double *)&SPUIExtendedEdgesDimensionConstant, 0.0);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  v20 = v34.origin.y + 8.0;
  v21 = v34.size.height + v15 * 2.0;
  -[SPUIDynamicKeyboardVisualEffectView colorView](self, "colorView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", x, v20, width, v21);

  -[SPUIDynamicKeyboardVisualEffectView searchFieldHeight](self, "searchFieldHeight");
  v24 = v23;
  if (-[SPUIDynamicKeyboardVisualEffectView hideVisualEffectView](self, "hideVisualEffectView"))
    v25 = v24 + 60.0;
  else
    v25 = 104.0;
  -[SPUIDynamicKeyboardVisualEffectView featheredBlur](self, "featheredBlur");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", x, y + 12.0, width, v25);

  v27 = -[SPUIDynamicKeyboardVisualEffectView hideVisualEffectView](self, "hideVisualEffectView");
  v28 = 30.0;
  if (!v27)
    v28 = 0.0;
  v29 = y + v24 + v28;
  -[SPUIDynamicKeyboardVisualEffectView gaussianBlurView](self, "gaussianBlurView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", x, v29, width, height - (v24 + -30.0));

  -[SPUIDynamicKeyboardVisualEffectView keyboardVisualEffectView](self, "keyboardVisualEffectView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", x, y, width, height);

}

- (BOOL)hideVisualEffectView
{
  void *v2;
  double v3;
  BOOL v4;

  -[SPUIDynamicKeyboardVisualEffectView colorView](self, "colorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 == 0.0;

  return v4;
}

- (UIView)colorView
{
  return (UIView *)objc_getProperty(self, a2, 432, 1);
}

- (MTMaterialView)featheredBlur
{
  return (MTMaterialView *)objc_getProperty(self, a2, 440, 1);
}

- (UIView)gaussianBlurView
{
  return (UIView *)objc_getProperty(self, a2, 448, 1);
}

- (UIView)keyboardVisualEffectView
{
  return (UIView *)objc_getProperty(self, a2, 424, 1);
}

- (double)searchFieldHeight
{
  return self->_searchFieldHeight;
}

double __43__SPUIDynamicKeyboardVisualEffectView_init__block_invoke()
{
  return 0.4;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  -[SPUIDynamicKeyboardVisualEffectView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SPUIDynamicKeyboardVisualEffectView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)setSearchFieldHeight:(double)a3
{
  self->_searchFieldHeight = a3;
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  char v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  objc_super v38;
  void *v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v38.receiver = self;
  v38.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  v4 = a3;
  -[SPUIDynamicKeyboardVisualEffectView tlk_updateForAppearance:](&v38, sel_tlk_updateForAppearance_, v4);
  v5 = objc_msgSend(v4, "isDark", v38.receiver, v38.super_class);

  if ((v5 & 1) != 0)
  {
    v6 = 0.17254902;
    v7 = 1.0;
  }
  else
  {
    v6 = 0.752941176;
    v7 = 0.95;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v6, v6, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIDynamicKeyboardVisualEffectView colorView](self, "colorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)objc_opt_new();
    -[SPUIDynamicKeyboardVisualEffectView setColorView:](self, "setColorView:", v10);

    v11 = (void *)objc_opt_new();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40[0] = objc_msgSend(v12, "CGColor");
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.4);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40[1] = objc_msgSend(v13, "CGColor");
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.39);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40[2] = objc_msgSend(v14, "CGColor");
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.27);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40[3] = objc_msgSend(v15, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setColors:", v16);

    objc_msgSend(v11, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLocations:", &unk_24F9E07B0);

    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInterpolations:", v20);

    -[SPUIDynamicKeyboardVisualEffectView setGradientView:](self, "setGradientView:", v11);
    -[SPUIDynamicKeyboardVisualEffectView colorView](self, "colorView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIDynamicKeyboardVisualEffectView gradientView](self, "gradientView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

    v24 = (void *)MEMORY[0x24BE85220];
    -[SPUIDynamicKeyboardVisualEffectView gradientView](self, "gradientView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fillContainerWithView:", v25);

  }
  -[SPUIDynamicKeyboardVisualEffectView gaussianBlurView](self, "gaussianBlurView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v27 = (void *)objc_opt_new();
    -[SPUIDynamicKeyboardVisualEffectView setGaussianBlurView:](self, "setGaussianBlurView:", v27);

  }
  -[SPUIDynamicKeyboardVisualEffectView colorView](self, "colorView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIDynamicKeyboardVisualEffectView featheredBlur](self, "featheredBlur");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIDynamicKeyboardVisualEffectView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v28, v29);

  -[SPUIDynamicKeyboardVisualEffectView gaussianBlurView](self, "gaussianBlurView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIDynamicKeyboardVisualEffectView featheredBlur](self, "featheredBlur");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIDynamicKeyboardVisualEffectView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v30, v31);

  LODWORD(v31) = UIAccessibilityIsReduceTransparencyEnabled();
  -[SPUIDynamicKeyboardVisualEffectView keyboardVisualEffectView](self, "keyboardVisualEffectView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if ((_DWORD)v31)
  {

    if (!v33)
    {
      v34 = objc_alloc(MEMORY[0x24BEBD6A8]);
      objc_msgSend(MEMORY[0x24BEBD698], "darkConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "backdropStyle");
      v37 = (void *)objc_msgSend(v34, "initWithFrame:style:", v36, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      -[SPUIDynamicKeyboardVisualEffectView setKeyboardVisualEffectView:](self, "setKeyboardVisualEffectView:", v37);

    }
    -[SPUIDynamicKeyboardVisualEffectView keyboardVisualEffectView](self, "keyboardVisualEffectView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIDynamicKeyboardVisualEffectView insertSubview:atIndex:](self, "insertSubview:atIndex:", v33, 0);
  }
  else
  {
    objc_msgSend(v32, "removeFromSuperview");
  }

  -[SPUIDynamicKeyboardVisualEffectView setNeedsLayout](self, "setNeedsLayout");
  -[SPUIDynamicKeyboardVisualEffectView layoutIfNeeded](self, "layoutIfNeeded");

}

- (UIView)gradientView
{
  return (UIView *)objc_getProperty(self, a2, 456, 1);
}

- (void)setHideVisualEffectView:(BOOL)a3
{
  double v4;
  void *v5;

  v4 = 0.0;
  if (!a3)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
      v4 = 0.0;
    else
      v4 = 1.0;
  }
  -[SPUIDynamicKeyboardVisualEffectView colorView](self, "colorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[SPUIDynamicKeyboardVisualEffectView setNeedsLayout](self, "setNeedsLayout");
  -[SPUIDynamicKeyboardVisualEffectView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setHideFeatheredBlur:(BOOL)a3
{
  double v4;
  void *v5;

  v4 = 0.0;
  if (!a3)
    v4 = (double)!UIAccessibilityIsReduceTransparencyEnabled();
  -[SPUIDynamicKeyboardVisualEffectView featheredBlur](self, "featheredBlur");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[SPUIDynamicKeyboardVisualEffectView setNeedsLayout](self, "setNeedsLayout");
  -[SPUIDynamicKeyboardVisualEffectView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setGradientView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (void)setGaussianBlurView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void)setColorView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  -[SPUIDynamicKeyboardVisualEffectView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SPUIDynamicKeyboardVisualEffectView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SPUIDynamicKeyboardVisualEffectView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SPUIDynamicKeyboardVisualEffectView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (SPUIDynamicKeyboardVisualEffectView)init
{
  SPUIDynamicKeyboardVisualEffectView *v2;
  SPUIDynamicKeyboardVisualEffectView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  v2 = -[SPUIDynamicKeyboardVisualEffectView init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SPUIDynamicKeyboardVisualEffectView setSearchFieldHeight:](v2, "setSearchFieldHeight:", 60.0);
    v4 = (void *)MEMORY[0x24BE64060];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("darkModeKeyboardBackground"), v5, 0, &__block_literal_global_6, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIDynamicKeyboardVisualEffectView setFeatheredBlur:](v3, "setFeatheredBlur:", v6);

    -[SPUIDynamicKeyboardVisualEffectView featheredBlur](v3, "featheredBlur");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIDynamicKeyboardVisualEffectView addSubview:](v3, "addSubview:", v7);

    -[SPUIDynamicKeyboardVisualEffectView setNeedsLayout](v3, "setNeedsLayout");
    -[SPUIDynamicKeyboardVisualEffectView layoutIfNeeded](v3, "layoutIfNeeded");
    -[SPUIDynamicKeyboardVisualEffectView setHideVisualEffectView:](v3, "setHideVisualEffectView:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_tlk_updateWithCurrentAppearance, *MEMORY[0x24BEBDEC0], 0);

  }
  return v3;
}

- (void)setFeatheredBlur:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (BOOL)hideFeatheredBlur
{
  void *v2;
  double v3;
  BOOL v4;

  -[SPUIDynamicKeyboardVisualEffectView featheredBlur](self, "featheredBlur");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 == 0.0;

  return v4;
}

- (void)setKeyboardVisualEffectView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_gaussianBlurView, 0);
  objc_storeStrong((id *)&self->_featheredBlur, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_keyboardVisualEffectView, 0);
}

@end
