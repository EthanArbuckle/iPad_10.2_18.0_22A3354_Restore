@implementation SBFloatingDockPlatterView

- (SBFloatingDockPlatterView)initWithFrame:(CGRect)a3
{
  SBFloatingDockPlatterView *v3;
  SBFloatingDockPlatterView *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFloatingDockPlatterView;
  v3 = -[SBFloatingDockPlatterView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_hasShadow = 0;
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBFloatingDockPlatterView addSubview:](v4, "addSubview:", v5);
    -[SBFloatingDockPlatterView setBackgroundView:](v4, "setBackgroundView:", v5);
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", 0.3);

    -[SBFloatingDockPlatterView updateBorderVisualStyling](v4, "updateBorderVisualStyling");
    -[SBFloatingDockPlatterView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("dock-platter-view"));
    -[SBFloatingDockPlatterView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

  }
  return v4;
}

- (void)setReferenceHeight:(double)a3
{
  if (self->_referenceHeight != a3)
  {
    self->_referenceHeight = a3;
    -[SBFloatingDockPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumContinuousCornerRadius:(double)a3
{
  if (self->_maximumContinuousCornerRadius != a3)
  {
    self->_maximumContinuousCornerRadius = a3;
    -[SBFloatingDockPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)currentContinuousCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockPlatterView backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_continuousCornerRadius");
  v4 = v3;

  return v4;
}

- (void)setBackdropGroupName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBFloatingDockPlatterView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setGroupName:", v5);

}

- (NSString)backdropGroupName
{
  void *v2;
  void *v3;

  -[SBFloatingDockPlatterView backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "groupName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setBackdropGroupNamespace:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBFloatingDockPlatterView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setGroupNamespace:", v6);

}

- (NSString)backdropGroupNamespace
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (id)*MEMORY[0x1E0CD2960];
  -[SBFloatingDockPlatterView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "groupNamespace");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }

  return (NSString *)v3;
}

- (void)setHasShadow:(BOOL)a3
{
  id v4;

  if (self->_hasShadow != a3)
  {
    self->_hasShadow = a3;
    -[SBFloatingDockPlatterView shadowView](self, "shadowView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockPlatterView _maxShadowViewAlpha](self, "_maxShadowViewAlpha");
    objc_msgSend(v4, "setAlpha:");

  }
}

- (UIEdgeInsets)shadowOutsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[SBFloatingDockPlatterView metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockPlatterView _shadowOutsetsForMetrics:](self, "_shadowOutsetsForMetrics:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (UIEdgeInsets)shadowOutsetsForBounds:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[SBFloatingDockPlatterView _metricsForBounds:](self, "_metricsForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockPlatterView _shadowOutsetsForMetrics:](self, "_shadowOutsetsForMetrics:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundView;
  UIView *backgroundView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  v8 = v5;
  if (backgroundView != v5)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    if (*p_backgroundView)
      -[SBFloatingDockPlatterView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backgroundView, 0);
  }

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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  SBFloatingDockPlatterView *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  double v66;
  double v67;
  double v68;
  double v69;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)SBFloatingDockPlatterView;
  -[SBFloatingDockPlatterView layoutSubviews](&v70, sel_layoutSubviews);
  -[SBFloatingDockPlatterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (BSFloatGreaterThanFloat() && BSFloatGreaterThanFloat())
  {
    -[SBFloatingDockPlatterView metrics](self, "metrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockPlatterView _metricsForBounds:](self, "_metricsForBounds:", v4, v6, v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "continuousCornerRadius");
    if (!BSFloatGreaterThanFloat())
    {
LABEL_14:

      return;
    }
    -[SBFloatingDockPlatterView setMetrics:](self, "setMetrics:", v12);
    objc_msgSend(v12, "continuousCornerRadius");
    v14 = v13;
    -[SBFloatingDockPlatterView _shadowInsetsForMetrics:](self, "_shadowInsetsForMetrics:", v12);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v50 = v21;
    v54 = v8 - (v17 + v21);
    v55 = v6 + v15;
    v52 = v4 + v17;
    v53 = v10 - (v15 + v19);
    -[SBFloatingDockPlatterView backgroundView](self, "backgroundView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockPlatterView shadowView](self, "shadowView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v11, "continuousCornerRadius");
      if ((BSFloatEqualToFloat() & 1) != 0)
      {
        objc_msgSend(v23, "setFrame:", v52, v55, v54, v53);
LABEL_13:
        objc_msgSend(v22, "setFrame:", v4, v6, v8, v10);
        objc_msgSend(v22, "_setContinuousCornerRadius:", v14);

        goto LABEL_14;
      }
    }
    -[SBFloatingDockPlatterView _shadowImageViewForMetrics:previousMetrics:](self, "_shadowImageViewForMetrics:previousMetrics:", v12, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockPlatterView setShadowView:](self, "setShadowView:", v24);
    if (v23)
    {
      if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
      {
        v25 = (void *)MEMORY[0x1E0DC3F10];
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke;
        v63[3] = &unk_1E8D86EF0;
        v63[4] = self;
        v26 = v24;
        v64 = v26;
        v49 = v11;
        v65 = v49;
        v66 = v16;
        v67 = v18;
        v68 = v20;
        v69 = v50;
        objc_msgSend(v25, "performWithoutAnimation:", v63);
        v27 = (void *)MEMORY[0x1E0D01908];
        objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationSettings");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "factoryWithSettings:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v30) = 0.25;
        LODWORD(v31) = 0.75;
        LODWORD(v32) = 0.25;
        LODWORD(v33) = 0.75;
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "factoryWithTimingFunction:", v34);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)MEMORY[0x1E0D01908];
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_2;
        v60[3] = &unk_1E8D84EF0;
        v61 = v26;
        v62 = self;
        objc_msgSend(v35, "animateWithFactory:actions:", v51, v60);
        LODWORD(v36) = 0.75;
        LODWORD(v37) = 0.25;
        LODWORD(v38) = 0.75;
        LODWORD(v39) = 0.25;
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v36, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "factoryWithTimingFunction:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = (void *)MEMORY[0x1E0D01908];
        v43 = MEMORY[0x1E0C809B0];
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_3;
        v58[3] = &unk_1E8D84C50;
        v59 = v23;
        v56[0] = v43;
        v56[1] = 3221225472;
        v56[2] = __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_4;
        v56[3] = &unk_1E8D84F68;
        v44 = v59;
        v57 = v44;
        objc_msgSend(v42, "animateWithFactory:actions:completion:", v41, v58, v56);
        -[SBFloatingDockPlatterView _shadowInsetsForMetrics:](self, "_shadowInsetsForMetrics:", v49);
        objc_msgSend(v44, "setFrame:", v4 + v48, v6 + v45, v8 - (v48 + v46), v10 - (v45 + v47));

LABEL_12:
        objc_msgSend(v24, "setFrame:", v52, v55, v54, v53);

        goto LABEL_13;
      }
      objc_msgSend(v23, "removeFromSuperview");
    }
    -[SBFloatingDockPlatterView addSubview:](self, "addSubview:", v24);
    -[SBFloatingDockPlatterView _maxShadowViewAlpha](self, "_maxShadowViewAlpha");
    objc_msgSend(v24, "setAlpha:");
    goto LABEL_12;
  }
}

uint64_t __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 48), "bounds");
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", v2 + *(double *)(a1 + 64), *(double *)(a1 + 56) + v3, v4 - (*(double *)(a1 + 64) + *(double *)(a1 + 80)), v5 - (*(double *)(a1 + 56) + *(double *)(a1 + 72)));
}

uint64_t __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_maxShadowViewAlpha");
  return objc_msgSend(v1, "setAlpha:");
}

uint64_t __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockPlatterView;
  -[SBFloatingDockPlatterView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[SBFloatingDockPlatterView updateBorderVisualStyling](self, "updateBorderVisualStyling");
}

- (double)_maxShadowViewAlpha
{
  _BOOL4 v2;
  double result;

  v2 = -[SBFloatingDockPlatterView hasShadow](self, "hasShadow");
  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

- (id)_metricsForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBFloatingDockPlatterView referenceHeight](self, "referenceHeight");
  -[SBFloatingDockPlatterView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");

  -[SBFloatingDockPlatterView maximumContinuousCornerRadius](self, "maximumContinuousCornerRadius");
  UIFloorToScale();
  v10 = v9;
  UIFloorToScale();
  v12 = v11;
  UIRoundToScale();
  return -[_SBFloatingDockPlatterMetrics initWithBounds:continuousCornerRadius:shadowRadius:shadowYOffset:]([_SBFloatingDockPlatterMetrics alloc], "initWithBounds:continuousCornerRadius:shadowRadius:shadowYOffset:", x, y, width, height, v10, v12, v13);
}

- (id)_shadowImageViewForMetrics:(id)a3 previousMetrics:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (objc_class *)MEMORY[0x1E0DC3890];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBFloatingDockPlatterView _shadowImageForMetrics:previousMetrics:](self, "_shadowImageForMetrics:previousMetrics:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setImage:", v11);
  objc_msgSend(v10, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowsHitTesting:", 0);

  return v10;
}

- (id)_shadowImageForMetrics:(id)a3 previousMetrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke((uint64_t)v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockPlatterView shadowImages](self, "shadowImages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v6, "continuousCornerRadius");
    v14 = v13;
    UICeilToViewScale();
    v16 = v15;
    objc_msgSend(v6, "shadowRadius");
    v18 = v17;
    v19 = v16 + v17;
    -[SBFloatingDockPlatterView _shadowOutsetsForMetrics:](self, "_shadowOutsetsForMetrics:", v6);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v19 * 2.0 + 1.0, v19 * 2.0 + 1.0);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke_2;
    v47[3] = &unk_1E8D86F18;
    v49 = v21;
    v50 = v23;
    v51 = v25;
    v52 = v27;
    v53 = v14;
    v48 = v6;
    v54 = v18;
    v40 = v28;
    objc_msgSend(v28, "imageWithActions:", v47);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "resizableImageWithCapInsets:", v19, v19, v19, v19);
    v41 = objc_claimAutoreleasedReturnValue();

    v42 = v7;
    if (v7)
    {
      __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke(v30, v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v9, "allKeys", self);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (!v31 || (objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "isEqualToString:", v31) & 1) == 0)
            objc_msgSend(v9, "removeObjectForKey:", v37);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v34);
    }

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v39 + 464), v9);
    }
    v12 = (id)v41;
    objc_msgSend(v9, "setObject:forKey:", v41, v8);

    v7 = v42;
  }

  return v12;
}

uint64_t __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "continuousCornerRadius");
  v5 = v4;
  objc_msgSend(v3, "shadowRadius");
  v7 = v6;
  objc_msgSend(v3, "shadowYOffset");
  v9 = v8;

  return objc_msgSend(v2, "stringWithFormat:", CFSTR("%f.%f.%f"), v5, v7, v9);
}

void __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  CGColor *v18;
  id v19;
  CGSize v20;

  v3 = a2;
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");
  objc_msgSend(v3, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v7 + *(double *)(a1 + 48), v9 + *(double *)(a1 + 40), v11 - (*(double *)(a1 + 48) + *(double *)(a1 + 64)), v13 - (*(double *)(a1 + 40) + *(double *)(a1 + 56)), *(double *)(a1 + 72));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  CGContextSaveGState(v4);
  objc_msgSend(*(id *)(a1 + 32), "shadowYOffset");
  v15 = v14;
  v16 = *(double *)(a1 + 80);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (CGColor *)objc_msgSend(v17, "CGColor");
  v20.width = 0.0;
  v20.height = v15;
  CGContextSetShadowWithColor(v4, v20, v16, v18);

  objc_msgSend(v19, "fillWithBlendMode:alpha:", 0, 0.15);
  CGContextRestoreGState(v4);
  objc_msgSend(v19, "fillWithBlendMode:alpha:", 16, 1.0);

}

- (UIEdgeInsets)_shadowOutsetsForMetrics:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  v3 = a3;
  objc_msgSend(v3, "shadowRadius");
  v5 = v4;
  objc_msgSend(v3, "shadowYOffset");
  v7 = v5 - v6;
  objc_msgSend(v3, "shadowRadius");
  v9 = v8;
  objc_msgSend(v3, "shadowRadius");
  v11 = v10;
  objc_msgSend(v3, "shadowYOffset");
  v13 = v11 + v12;
  objc_msgSend(v3, "shadowRadius");
  v15 = v14;

  v16 = v7;
  v17 = v9;
  v18 = v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)_shadowInsetsForMetrics:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  -[SBFloatingDockPlatterView _shadowOutsetsForMetrics:](self, "_shadowOutsetsForMetrics:", a3);
  v4 = -v3;
  v6 = -v5;
  v8 = -v7;
  v10 = -v9;
  result.right = v10;
  result.bottom = v8;
  result.left = v6;
  result.top = v4;
  return result;
}

+ (id)borderColorForUserInterfaceStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 2)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", dbl_1D0190D28[a3], 0.08, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateBorderVisualStyling
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  -[SBFloatingDockPlatterView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[SBFloatingDockPlatterView backgroundView](self, "backgroundView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "borderColorForUserInterfaceStyle:", v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

}

- (SBFloatingDockPlatterView)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  void *v8;
  SBFloatingDockPlatterView *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v8);

  v11.receiver = self;
  v11.super_class = (Class)SBFloatingDockPlatterView;
  v9 = -[SBFloatingDockPlatterView initWithCoder:](&v11, sel_initWithCoder_, v6);

  return v9;
}

- (double)referenceHeight
{
  return self->_referenceHeight;
}

- (double)maximumContinuousCornerRadius
{
  return self->_maximumContinuousCornerRadius;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIImageView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (_SBFloatingDockPlatterMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (NSMutableDictionary)shadowImages
{
  return self->_shadowImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImages, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
