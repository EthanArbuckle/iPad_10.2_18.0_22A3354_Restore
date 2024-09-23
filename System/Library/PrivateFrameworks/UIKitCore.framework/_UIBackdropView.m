@implementation _UIBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIBackdropView)initWithPrivateStyle:(int64_t)a3
{
  void *v4;
  _UIBackdropView *v5;

  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 1, v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v5;
}

- (_UIBackdropView)initWithFrame:(CGRect)a3 privateStyle:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  _UIBackdropView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 0, v9, x, y, width, height);

  return v10;
}

- (void)addGrayscaleTintViewIfNeededForSettings:(id)a3
{
  void *v4;
  UIView *v5;
  UIView *v6;
  id v7;

  v7 = a3;
  if (!objc_msgSend(v7, "usesGrayscaleTintView")
    || (-[_UIBackdropView grayscaleTintView](self, "grayscaleTintView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if (objc_msgSend(v7, "usesGrayscaleTintView"))
    {
      v5 = [UIView alloc];
      v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setOpaque:](v6, "setOpaque:", 0);
      -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
      -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
      -[UIView setAlpha:](v6, "setAlpha:", 0.0);
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](v6, "setFrame:");
      -[_UIBackdropView setGrayscaleTintView:](self, "setGrayscaleTintView:", v6);
      -[_UIBackdropView setAppliesOutputSettingsAutomatically:](self, "setAppliesOutputSettingsAutomatically:", 1);

    }
  }

}

- (void)addDarkeningTintViewIfNeededForSettings:(id)a3
{
  UIView *v4;
  UIView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!objc_msgSend(v10, "usesDarkeningTintView") || !self->_darkeningTintView)
  {
    if (objc_msgSend(v10, "usesDarkeningTintView"))
    {
      v4 = [UIView alloc];
      v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setOpaque:](v5, "setOpaque:", 0);
      -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](v5, "setFrame:");
      v6 = *MEMORY[0x1E0CD2C28];
      -[UIView layer](v5, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCompositingFilter:", v6);

      +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.619444444, 0.2, 0.64, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v8);

      -[UIView setAlpha:](v5, "setAlpha:", 0.2);
      -[_UIBackdropView setDarkeningTintView:](self, "setDarkeningTintView:", v5);

    }
    else
    {
      -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      -[_UIBackdropView setDarkeningTintView:](self, "setDarkeningTintView:", 0);
    }
  }

}

- (void)setDarkeningTintView:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningTintView, a3);
}

- (void)addColorTintViewIfNeededForSettings:(id)a3
{
  void *v4;
  UIView *v5;
  UIView *v6;
  id v7;

  v7 = a3;
  if (!objc_msgSend(v7, "usesColorTintView")
    || (-[_UIBackdropView colorTintView](self, "colorTintView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if (objc_msgSend(v7, "usesColorTintView"))
    {
      v5 = [UIView alloc];
      v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setOpaque:](v6, "setOpaque:", 0);
      -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
      -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
      -[UIView setAlpha:](v6, "setAlpha:", 0.0);
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](v6, "setFrame:");
      -[_UIBackdropView setColorTintView:](self, "setColorTintView:", v6);
      -[_UIBackdropView setAppliesOutputSettingsAutomatically:](self, "setAppliesOutputSettingsAutomatically:", 1);

    }
  }

}

- (void)addColorBurnTintViewIfNeededForSettings:(id)a3
{
  void *v4;
  UIView *v5;
  UIView *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!objc_msgSend(v9, "usesColorBurnTintView")
    || (-[_UIBackdropView colorBurnTintView](self, "colorBurnTintView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if (objc_msgSend(v9, "usesColorBurnTintView"))
    {
      v5 = [UIView alloc];
      v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setOpaque:](v6, "setOpaque:", 0);
      -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
      -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
      -[UIView setAlpha:](v6, "setAlpha:", 0.0);
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](v6, "setFrame:");
      v7 = *MEMORY[0x1E0CD2BC0];
      -[UIView layer](v6, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCompositingFilter:", v7);

      -[_UIBackdropView setColorBurnTintView:](self, "setColorBurnTintView:", v6);
      -[_UIBackdropView setAppliesOutputSettingsAutomatically:](self, "setAppliesOutputSettingsAutomatically:", 1);

    }
  }

}

- (void)setGrayscaleTintView:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleTintView, a3);
}

- (void)setColorTintView:(id)a3
{
  objc_storeStrong((id *)&self->_colorTintView, a3);
}

- (void)transitionToSettings:(id)a3
{
  -[_UIBackdropView prepareForTransitionToSettings:](self, "prepareForTransitionToSettings:", a3);
  -[_UIBackdropView computeAndApplySettingsForTransition](self, "computeAndApplySettingsForTransition");
}

- (void)computeAndApplySettingsForTransition
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void *, uint64_t);
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  -[_UIBackdropView outputSettings](self, "outputSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView inputSettings](self, "inputSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "computeOutputSettingsUsingModel:", v4);

  -[_UIBackdropView outputSettings](self, "outputSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView applySettings:](self, "applySettings:", v5);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55___UIBackdropView_computeAndApplySettingsForTransition__block_invoke;
  aBlock[3] = &unk_1E16B3FD8;
  aBlock[4] = self;
  v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (!+[UIView _addCompletion:](UIView, "_addCompletion:", v6))
    v6[2](v6, 1);
  -[_UIBackdropView observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", sel_backdropViewDidChange_, self);

}

- (void)transitionComplete
{
  double v3;
  double v4;
  void *v5;

  if (self->_applyingTransition)
  {
    -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](self->_outputSettings, "computeOutputSettingsUsingModel:", self->_inputSettings);
    -[_UIBackdropView adjustTintImplementationIfNeeded:](self, "adjustTintImplementationIfNeeded:", self->_outputSettings);
    if (!self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack)
    {
      -[_UIBackdropViewSettings scale](self->_inputSettings, "scale");
      v4 = v3;
      -[_UIBackdropEffectView backdropLayer](self->_backdropEffectView, "backdropLayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setScale:", v4);

    }
    -[_UIBackdropView setBackdropVisible:](self, "setBackdropVisible:", -[_UIBackdropViewSettings isBackdropVisible](self->_inputSettings, "isBackdropVisible"));
    self->_applyingTransition = 0;
  }
}

- (void)setBackdropVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _UIBackdropEffectView *backdropEffectView;
  void *v7;

  v3 = a3;
  if (self->__backdropVisible != a3 || !self->_backdropVisibilitySetOnce)
  {
    self->_backdropVisibilitySetOnce = 1;
    -[_UIBackdropEffectView backdropLayer](self->_backdropEffectView, "backdropLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

    self->__backdropVisible = v3;
    if (v3 || -[_UIBackdropViewSettings requiresBackdropLayer](self->_inputSettings, "requiresBackdropLayer"))
    {
      backdropEffectView = self->_backdropEffectView;
      if (backdropEffectView)
      {
        -[UIView superview](backdropEffectView, "superview");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          -[_UIBackdropView ensureProperSubviewOrdering](self, "ensureProperSubviewOrdering");
      }
    }
    else
    {
      -[UIView removeFromSuperview](self->_backdropEffectView, "removeFromSuperview");
    }
  }
}

- (void)_updateBackdropGroupName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSString *v9;

  v9 = self->_groupName;
  if (self->_autoGroup)
  {
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIView traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForTrait:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v9 = (NSString *)v6;
    }
  }
  -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backdropLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGroupName:", v9);

}

- (_UIBackdropViewSettings)outputSettings
{
  return self->_outputSettings;
}

- (void)_applyCornerRadiusToSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  UIView *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  UIView *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_cornerRadiusIsContinuous)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[UIView subviews](self, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          v8 = *(UIView **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (v8 != self->_contentView)
            -[UIView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:", self->_cornerRadius);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[UIView subviews](self, "subviews", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v3);
          v13 = *(UIView **)(*((_QWORD *)&v14 + 1) + 8 * j);
          if (v13 != self->_contentView)
            -[UIView _setCornerRadius:](v13, "_setCornerRadius:", self->_cornerRadius);
        }
        v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v10);
    }
  }

}

- (void)updateSubviewHierarchyIfNeededForSettings:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIBackdropView addBackdropEffectViewIfNeededForSettings:](self, "addBackdropEffectViewIfNeededForSettings:", v4);
  -[_UIBackdropView addGrayscaleTintViewIfNeededForSettings:](self, "addGrayscaleTintViewIfNeededForSettings:", v4);
  -[_UIBackdropView addColorTintViewIfNeededForSettings:](self, "addColorTintViewIfNeededForSettings:", v4);
  -[_UIBackdropView addColorBurnTintViewIfNeededForSettings:](self, "addColorBurnTintViewIfNeededForSettings:", v4);
  -[_UIBackdropView addContentViewIfNeededForSettings:](self, "addContentViewIfNeededForSettings:", v4);
  -[_UIBackdropView addDarkeningTintViewIfNeededForSettings:](self, "addDarkeningTintViewIfNeededForSettings:", v4);

  -[_UIBackdropView ensureProperSubviewOrdering](self, "ensureProperSubviewOrdering");
  -[_UIBackdropView _applyCornerRadiusToSubviews](self, "_applyCornerRadiusToSubviews");
}

- (void)addContentViewIfNeededForSettings:(id)a3
{
  _UIBackdropContentView *v4;
  _UIBackdropContentView *v5;
  id v6;

  v6 = a3;
  if ((!objc_msgSend(v6, "usesContentView") || !self->_contentView)
    && objc_msgSend(v6, "usesContentView")
    && -[_UIBackdropView contentViewAccessed](self, "contentViewAccessed"))
  {
    v4 = [_UIBackdropContentView alloc];
    v5 = -[_UIBackdropContentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setOpaque:](v5, "setOpaque:", 0);
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[_UIBackdropView setContentView:](self, "setContentView:", v5);

  }
}

- (BOOL)contentViewAccessed
{
  return self->_contentViewAccessed;
}

- (void)addBackdropEffectViewIfNeededForSettings:(id)a3
{
  void *v4;
  _UIBackdropEffectView *v5;
  void *v6;
  NSString *groupName;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "usesBackdropEffectView") & 1) != 0
    || -[_UIBackdropView computesColorSettings](self, "computesColorSettings")
    || objc_msgSend(v9, "requiresBackdropLayer"))
  {
    -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(_UIBackdropEffectView);
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](v5, "setFrame:");
      -[UIView layer](v5, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowsEdgeAntialiasing:", 0);

      groupName = self->_groupName;
      -[_UIBackdropEffectView backdropLayer](v5, "backdropLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setGroupName:", groupName);

      -[_UIBackdropView setBackdropEffectView:](self, "setBackdropEffectView:", v5);
      -[_UIBackdropView setAppliesOutputSettingsAutomatically:](self, "setAppliesOutputSettingsAutomatically:", 1);

    }
  }

}

- (void)setInputSettings:(id)a3
{
  _UIBackdropViewSettings *v4;
  _UIBackdropViewSettings *inputSettings;
  _UIBackdropViewSettings *v6;

  v4 = (_UIBackdropViewSettings *)a3;
  -[_UIBackdropViewSettings setBackdrop:](self->_inputSettings, "setBackdrop:", 0);
  inputSettings = self->_inputSettings;
  self->_inputSettings = v4;
  v6 = v4;

  -[_UIBackdropViewSettings setBackdrop:](self->_inputSettings, "setBackdrop:", self);
}

- (void)setOutputSettings:(id)a3
{
  _UIBackdropViewSettings *v4;
  _UIBackdropViewSettings *outputSettings;
  _UIBackdropViewSettings *v6;

  v4 = (_UIBackdropViewSettings *)a3;
  -[_UIBackdropViewSettings setBackdrop:](self->_outputSettings, "setBackdrop:", 0);
  outputSettings = self->_outputSettings;
  self->_outputSettings = v4;
  v6 = v4;

  -[_UIBackdropViewSettings setBackdrop:](self->_outputSettings, "setBackdrop:", self);
}

- (void)transitionIncrementallyToSettings:(id)a3 weighting:(double)a4
{
  _UIBackdropViewSettings *v6;
  _UIBackdropViewSettingsCombiner *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = self->_outputSettings;
  }
  else
  {
    v7 = -[_UIBackdropViewSettings initWithDefaultValuesForGraphicsQuality:]([_UIBackdropViewSettingsCombiner alloc], "initWithDefaultValuesForGraphicsQuality:", 0);
    -[_UIBackdropViewSettings colorSettings](self->_inputSettings, "colorSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setColorSettings:](v7, "setColorSettings:", v8);

    -[_UIBackdropViewSettingsCombiner setInputSettingsA:](v7, "setInputSettingsA:", self->_inputSettings);
    -[_UIBackdropViewSettingsCombiner setInputSettingsB:](v7, "setInputSettingsB:", v11);
    -[_UIBackdropView prepareForTransitionToSettings:](self, "prepareForTransitionToSettings:", v7);
    v6 = self->_outputSettings;
    -[_UIBackdropViewSettingsCombiner inputSettingsA](v7, "inputSettingsA");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setInputSettingsA:](v6, "setInputSettingsA:", v9);

    -[_UIBackdropViewSettingsCombiner inputSettingsB](v7, "inputSettingsB");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropViewSettings setInputSettingsB:](v6, "setInputSettingsB:", v10);

    self->_style = -3;
  }
  -[_UIBackdropViewSettings setWeighting:](v6, "setWeighting:", a4);
  -[_UIBackdropViewSettings computeOutputSettingsUsingModel:](v6, "computeOutputSettingsUsingModel:", self->_inputSettings);
  -[_UIBackdropView applySettings:](self, "applySettings:", v6);

}

- (void)applySettings:(id)a3
{
  double *v4;
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  double v13;
  int v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  double *v40;
  double v41;
  void *v42;
  _QWORD v43[5];
  double *v44;
  _QWORD v45[5];
  _QWORD v46[7];
  _QWORD v47[8];

  v4 = (double *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = *((_QWORD *)v4 + 3);
    if (self->_style == v6)
    {
      if (!self->_applyingTransition && !*((_BYTE *)v4 + 328))
        goto LABEL_31;
      if (self->_tintFilter)
        -[_UIBackdropView setTintFilterForSettings:](self, "setTintFilterForSettings:", v4);
      -[_UIBackdropView setColorOffsetFilterForSettings:](self, "setColorOffsetFilterForSettings:", v5);
      v7 = 1.0;
      v8 = 1.0;
      if (!*((_BYTE *)v5 + 120))
        v8 = v5[12];
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5[11], v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_grayscaleTintView, "setBackgroundColor:", v9);

      if (*((_BYTE *)v5 + 120))
        v7 = v5[12];
      -[UIView setAlpha:](self->_grayscaleTintView, "setAlpha:", v7);
      -[_UIBackdropView setGrayscaleTintMaskImage:](self, "setGrayscaleTintMaskImage:", *((_QWORD *)v5 + 14));
      v10 = v5[13];
      -[UIView layer](self->_grayscaleTintView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mask");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v13 = v10;
      objc_msgSend(v12, "setOpacity:", v13);

      v14 = *((unsigned __int8 *)v5 + 120);
      if (*((_BYTE *)v5 + 120))
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2DE0]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      -[UIView layer](self->_grayscaleTintView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCompositingFilter:", v15);

      if (v14)
      -[UIView setBackgroundColor:](self->_colorTintView, "setBackgroundColor:", *((_QWORD *)v5 + 16));
      -[UIView setAlpha:](self->_colorTintView, "setAlpha:", v5[17]);
      -[_UIBackdropView setColorTintMaskImage:](self, "setColorTintMaskImage:", *((_QWORD *)v5 + 19));
      v17 = v5[18];
      -[UIView layer](self->_colorTintView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mask");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v20 = v17;
      objc_msgSend(v19, "setOpacity:", v20);

      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5[20], 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_colorBurnTintView, "setBackgroundColor:", v21);

      -[UIView setAlpha:](self->_colorBurnTintView, "setAlpha:", v5[21]);
      -[_UIBackdropView setColorBurnTintMaskImage:](self, "setColorBurnTintMaskImage:", *((_QWORD *)v5 + 22));
      -[UIView setAlpha:](self->_darkeningTintView, "setAlpha:", v5[23]);
      +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v5[24], v5[25], v5[26], 1.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_darkeningTintView, "setBackgroundColor:", v22);

      -[_UIBackdropView setDarkeningTintMaskImage:](self, "setDarkeningTintMaskImage:", *((_QWORD *)v5 + 27));
      v23 = (_QWORD *)MEMORY[0x1E0CD2C30];
      if (!*((_BYTE *)v5 + 224))
        v23 = (_QWORD *)MEMORY[0x1E0CD2C28];
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->_darkeningTintView, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCompositingFilter:", v24);

      -[_UIBackdropView setBlurFilterWithRadius:blurQuality:](self, "setBlurFilterWithRadius:blurQuality:", *((_QWORD *)v5 + 30), v5[29]);
      -[_UIBackdropView setSaturationDeltaFactor:](self, "setSaturationDeltaFactor:", v5[31]);
      -[_UIBackdropView setFilterMaskImage:](self, "setFilterMaskImage:", *((_QWORD *)v5 + 33));
      -[UIView layer](self->_backdropEffectView, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v5[32];
      objc_msgSend(v26, "mask");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v29 = v27;
      objc_msgSend(v28, "setOpacity:", v29);

      v30 = v5[10];
      -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setZoom:", v30);

      if (self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack)
      {
        +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
        if (v32 <= 0.0)
        {
          v35 = 0.075;
          v34 = 0.025;
        }
        else
        {
          v33 = v32 * 60.0;
          v34 = 1.0 / v33;
          v35 = 2.0 / v33;
        }
        v36 = v5[10];
        -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v36 <= 0.0)
        {
          objc_msgSend(v37, "setAlpha:", 1.0);

          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __33___UIBackdropView_applySettings___block_invoke_3;
          v46[3] = &unk_1E16B4E70;
          *(double *)&v46[5] = v34;
          *(double *)&v46[6] = v35;
          v46[4] = self;
          v39 = v46;
        }
        else
        {
          objc_msgSend(v37, "setAlpha:", 0.0);

          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __33___UIBackdropView_applySettings___block_invoke;
          v47[3] = &unk_1E16B4E70;
          *(double *)&v47[5] = v34;
          *(double *)&v47[6] = v35;
          v47[4] = self;
          v39 = v47;
        }
        +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v39, 0, 0.0, 0.0);
      }
      else
      {
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __33___UIBackdropView_applySettings___block_invoke_5;
        v45[3] = &unk_1E16B1B28;
        v45[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v45);
      }

      if (!self->_applyingTransition)
      {
LABEL_31:
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __33___UIBackdropView_applySettings___block_invoke_6;
        v43[3] = &unk_1E16B1B50;
        v43[4] = self;
        v40 = v5;
        v44 = v40;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v43);
        if (!self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack)
        {
          v41 = v40[36];
          -[_UIBackdropEffectView backdropLayer](self->_backdropEffectView, "backdropLayer");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setScale:", v41);

        }
      }
    }
    else
    {
      NSLog(CFSTR("*** warning: tried to apply settings with a style which doesn't match the backdrop view's settings style: %ld != %ld"), self->_style, v6);
    }
  }
  else
  {
    NSLog(CFSTR("*** warning: tried to apply nil settings to a _UIBackdropView: %@"), self);
  }

}

- (void)setSaturationDeltaFactor:(double)a3
{
  CAFilter *colorSaturateFilter;
  void *v6;
  void *v7;
  CAFilter *v8;
  void *v9;
  void *v10;

  colorSaturateFilter = self->_colorSaturateFilter;
  if (self->_backdropEffectView)
  {
    if (!colorSaturateFilter)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("inputAmount"));

      objc_msgSend(v6, "setName:", CFSTR("colorSaturate"));
      v8 = self->_colorSaturateFilter;
      self->_colorSaturateFilter = (CAFilter *)v6;

      -[_UIBackdropView _updateFilters](self, "_updateFilters");
    }
    if (self->__saturationDeltaFactor != a3)
    {
      -[UIView layer](self->_backdropEffectView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKeyPath:", v10, CFSTR("filters.colorSaturate.inputAmount"));

      self->__saturationDeltaFactor = a3;
    }
  }
  else if (colorSaturateFilter)
  {
    self->_colorSaturateFilter = 0;

    -[_UIBackdropView _updateFilters](self, "_updateFilters");
  }
}

- (void)setFilterMaskImage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_filterMaskImage, a3);
  v5 = a3;
  -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView setMaskImage:onLayer:](self, "setMaskImage:onLayer:", v5, v6);

}

- (void)setDarkeningTintMaskImage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_darkeningTintMaskImage, a3);
  v5 = a3;
  -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView setMaskImage:onLayer:](self, "setMaskImage:onLayer:", v5, v6);

}

- (void)setGrayscaleTintMaskImage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_grayscaleTintMaskImage, a3);
  v5 = a3;
  -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView setMaskImage:onLayer:](self, "setMaskImage:onLayer:", v5, v6);

}

- (void)setMaskImage:(id)a3 onLayer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "mask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contents");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v12)
    {
      objc_msgSend(v7, "mask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      if (v12)
      {
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setMask:", v10);
          objc_msgSend(v10, "setDelegate:", self);
          v11 = v12;
        }
        objc_msgSend(v10, "setContents:", objc_msgSend(objc_retainAutorelease(v11), "CGImage"));
        -[UIView setNeedsLayout](self, "setNeedsLayout");
      }
      else
      {
        objc_msgSend(v7, "setMask:", 0);
      }

    }
  }

}

- (void)setColorTintMaskImage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_colorTintMaskImage, a3);
  v5 = a3;
  -[_UIBackdropView colorTintView](self, "colorTintView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView setMaskImage:onLayer:](self, "setMaskImage:onLayer:", v5, v6);

}

- (void)setColorOffsetFilterForSettings:(id)a3
{
  double *v4;
  uint64_t v5;
  float64x2_t v6;
  int32x2_t v7;
  double *v8;
  void *v9;
  float32x2_t v10;
  int32x2_t v11;
  float v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  CAFilter *v16;
  double v17;
  double v18;
  unsigned int v19;
  float64x2_t v20;
  float64x2_t v21;
  float32x2_t v22;
  unsigned int v23;
  unint64_t v24;
  void *v25;
  void *v26;
  CAFilter *colorOffsetFilter;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int32 v31;
  __int32 v32;
  uint64_t v33;
  __int32 v34;
  __int32 v35;
  float32x2_t v36;
  __int128 v37;
  int32x2_t v38;
  float v39;
  __int128 v40;
  uint64_t v41;
  int v42;

  v4 = (double *)a3;
  v8 = v4;
  if (self->_backdropEffectView)
  {
    if (*((_BYTE *)v4 + 310))
    {
      v9 = (void *)*((_QWORD *)v4 + 40);
      if (v9)
      {
        objc_msgSend(v9, "CAColorMatrixValue");
        v31 = v34;
        v32 = v35;
        v10 = v36;
        v11 = v38;
        v12 = v39;
        v29 = v37;
        v30 = v40;
        v13 = v41;
        v14 = v42;
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0], v33, v15);
      }
      else
      {
        v17 = v8[39];
        v18 = 1.0 - v17;
        *(float *)&v19 = v17 * 0.8 + 1.0 - v17;
        v6.f64[0] = (1.0 - v17) * 0.0;
        v20 = vmulq_n_f64((float64x2_t)xmmword_1866789F0, v17);
        *(_QWORD *)&v21.f64[0] = *(_OWORD *)&vsubq_f64(v6, v20);
        v21.f64[1] = vaddq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&v6, 0), v20).f64[1];
        *(float *)v7.i32 = v20.f64[0] + v6.f64[0];
        v22 = vcvt_f32_f64(v21);
        *(float *)&v23 = v17 + 1.0 - v17;
        *(float *)&v17 = v17 * 0.1 + v6.f64[0];
        LODWORD(v24) = v7.i32[0];
        v12 = v20.f64[0] + v18;
        HIDWORD(v24) = v7.i32[0];
        v29 = __PAIR64__(LODWORD(v17), v23);
        v30 = v24;
        v32 = v7.i32[0];
        v11 = vdup_lane_s32(v7, 0);
        v13 = 0x3F80000000000000;
        v14 = 0;
        v31 = v22.i32[0];
        v10 = v22;
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0], v19, v5);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v28;
      v34 = v31;
      v35 = v32;
      v36 = v10;
      v37 = v29;
      v38 = v11;
      v39 = v12;
      v40 = v30;
      v41 = v13;
      v42 = v14;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setValue:forKey:", v26, CFSTR("inputColorMatrix"));

      colorOffsetFilter = self->_colorOffsetFilter;
      self->_colorOffsetFilter = (CAFilter *)v25;

      goto LABEL_9;
    }
  }
  else
  {
    v16 = self->_colorOffsetFilter;
    if (v16)
    {
      self->_colorOffsetFilter = 0;

LABEL_9:
      -[_UIBackdropView _updateFilters](self, "_updateFilters");
    }
  }

}

- (void)setColorBurnTintMaskImage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_colorBurnTintMaskImage, a3);
  v5 = a3;
  -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView setMaskImage:onLayer:](self, "setMaskImage:onLayer:", v5, v6);

}

- (void)setBlurFilterWithRadius:(double)a3 blurQuality:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  char v13;
  NSString *v14;
  NSString *blurQuality;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;

  v24 = (__CFString *)a4;
  -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (qword_1ECD7B6C0 != -1)
      dispatch_once(&qword_1ECD7B6C0, &__block_literal_global_644);
    if ((byte_1ECD7B699 & 1) == 0)
    {
      -[_UIBackdropView gaussianBlurFilter](self, "gaussianBlurFilter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
LABEL_19:
        if (self->__blurRadius != a3)
        {
          -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "layer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setValue:forKeyPath:", v18, CFSTR("filters.gaussianBlur.inputRadius"));

          -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "layer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "valueForKeyPath:", CFSTR("filters.gaussianBlur"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIBackdropView setGaussianBlurFilter:](self, "setGaussianBlurFilter:", v21);

          self->__blurRadius = a3;
        }
        if ((-[__CFString isEqualToString:](v24, "isEqualToString:", self->__blurQuality) & 1) == 0)
        {
          -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "layer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setValue:forKeyPath:", v24, CFSTR("filters.gaussianBlur.inputQuality"));

        }
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("inputRadius"));

      v10 = v24;
      if (!v24)
      {
        -[_UIBackdropView inputSettings](self, "inputSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "graphicsQuality") == 10)
        {

        }
        else
        {
          if (qword_1ECD7B6C8 != -1)
            dispatch_once(&qword_1ECD7B6C8, &__block_literal_global_648);
          v13 = byte_1ECD7B69A;

          if ((v13 & 1) == 0)
          {
            v10 = CFSTR("default");
            goto LABEL_16;
          }
        }
        v10 = CFSTR("low");
      }
LABEL_16:
      v24 = v10;
      if (!self->__blurQuality)
      {
        v14 = (NSString *)-[__CFString copy](v10, "copy");
        blurQuality = self->__blurQuality;
        self->__blurQuality = v14;

      }
      objc_msgSend(v8, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
      objc_msgSend(v8, "setValue:forKey:", v24, CFSTR("inputQuality"));
      objc_msgSend(v8, "setName:", CFSTR("gaussianBlur"));
      -[_UIBackdropView setGaussianBlurFilter:](self, "setGaussianBlurFilter:", v8);
      -[_UIBackdropView _updateFilters](self, "_updateFilters");

      goto LABEL_19;
    }
  }
  else
  {
    -[_UIBackdropView gaussianBlurFilter](self, "gaussianBlurFilter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_UIBackdropView setGaussianBlurFilter:](self, "setGaussianBlurFilter:", 0);
      -[_UIBackdropView _updateFilters](self, "_updateFilters");
    }
  }
LABEL_23:

}

- (CAFilter)gaussianBlurFilter
{
  return self->_gaussianBlurFilter;
}

- (void)ensureProperSubviewOrdering
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIView *contentView;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;

  -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v7);

      -[_UIBackdropView inputSettings](self, "inputSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isBackdropVisible");

      if ((v9 & 1) == 0)
      {
        -[_UIBackdropView setBackdropVisibilitySetOnce:](self, "setBackdropVisibilitySetOnce:", 0);
        -[_UIBackdropView setBackdropVisible:](self, "setBackdropVisible:", 0);
      }
    }
  }
  -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v14);

    }
  }
  -[_UIBackdropView colorTintView](self, "colorTintView");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[_UIBackdropView colorTintView](self, "colorTintView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[_UIBackdropView colorTintView](self, "colorTintView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v19);

    }
  }
  -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v24);

    }
  }
  -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v29);

    }
  }
  contentView = self->_contentView;
  if (contentView)
  {
    -[UIView superview](contentView, "superview");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
      -[UIView addSubview:](self, "addSubview:", self->_contentView);
  }
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v33);

    v34 = 1;
  }
  else
  {
    v34 = 0;
  }
  -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[UIView subviews](self, "subviews");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "indexOfObject:", v37);

    if (v38 != v34)
    {
      -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView exchangeSubviewAtIndex:withSubviewAtIndex:](self, "exchangeSubviewAtIndex:withSubviewAtIndex:", v34, v39);

    }
    ++v34;
  }
  -[_UIBackdropView colorTintView](self, "colorTintView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[UIView subviews](self, "subviews");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView colorTintView](self, "colorTintView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "indexOfObject:", v42);

    if (v43 != v34)
    {
      -[_UIBackdropView colorTintView](self, "colorTintView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView exchangeSubviewAtIndex:withSubviewAtIndex:](self, "exchangeSubviewAtIndex:withSubviewAtIndex:", v34, v44);

    }
    ++v34;
  }
  -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[UIView subviews](self, "subviews");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "indexOfObject:", v47);

    if (v48 != v34)
    {
      -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView exchangeSubviewAtIndex:withSubviewAtIndex:](self, "exchangeSubviewAtIndex:withSubviewAtIndex:", v34, v49);

    }
    ++v34;
  }
  -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[UIView subviews](self, "subviews");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "indexOfObject:", v52);

    if (v53 != v34)
    {
      -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView exchangeSubviewAtIndex:withSubviewAtIndex:](self, "exchangeSubviewAtIndex:withSubviewAtIndex:", v34, v54);

    }
  }
  if (self->_contentView)
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:");
}

- (_UIBackdropEffectView)backdropEffectView
{
  return self->_backdropEffectView;
}

- (UIView)grayscaleTintView
{
  return self->_grayscaleTintView;
}

- (UIView)colorTintView
{
  return self->_colorTintView;
}

- (UIView)darkeningTintView
{
  return self->_darkeningTintView;
}

- (UIView)colorBurnTintView
{
  return self->_colorBurnTintView;
}

- (void)_updateFilters
{
  void *v3;
  id v4;

  -[_UIBackdropView filters](self, "filters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_backdropEffectView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", v4);

}

- (id)filters
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_applySaturationBeforeBlur && self->_colorSaturateFilter)
    objc_msgSend(v3, "addObject:");
  if (self->_gaussianBlurFilter)
    objc_msgSend(v4, "addObject:");
  if (!self->_applySaturationBeforeBlur && self->_colorSaturateFilter)
    objc_msgSend(v4, "addObject:");
  if (self->_tintFilter)
    objc_msgSend(v4, "addObject:");
  if (self->_colorOffsetFilter)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (BOOL)requiresTintViews
{
  char v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;

  if (-[_UIBackdropView configuration](self, "configuration") == 1)
    return 1;
  if (-[_UIBackdropView configuration](self, "configuration") == 2)
    return 0;
  -[_UIBackdropView partialMaskViews](self, "partialMaskViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 1;
  -[_UIBackdropView inputSettings](self, "inputSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "grayscaleTintMaskImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIBackdropView inputSettings](self, "inputSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorTintMaskImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIBackdropView inputSettings](self, "inputSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filterMaskImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && !v10 && !v12 || (v3 = 1, v8 == v10) && v10 == v12 && v8 == v12)
  {
    -[_UIBackdropView inputSettings](self, "inputSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "graphicsQuality");

    if (v14 == 10
      || (-[_UIBackdropView inputSettings](self, "inputSettings"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "blurRadius"),
          v17 = v16,
          v15,
          v17 < 0.00000011920929)
      || -[_UIBackdropView applyingTransition](self, "applyingTransition"))
    {
      v3 = 1;
    }
    else
    {
      -[_UIBackdropView inputSettings](self, "inputSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v18, "usesColorTintView");

    }
  }

  return v3;
}

- (_UIBackdropViewSettings)inputSettings
{
  return self->_inputSettings;
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (NSMutableSet)partialMaskViews
{
  return self->_partialMaskViews;
}

- (void)prepareForTransitionToSettings:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;
  BOOL v12;

  v4 = a3;
  -[_UIBackdropView setApplyingTransition:](self, "setApplyingTransition:", 1);
  -[_UIBackdropView inputSettings](self, "inputSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "style") == -2;

  v7 = objc_msgSend(v4, "style") == -2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50___UIBackdropView_prepareForTransitionToSettings___block_invoke;
  v9[3] = &unk_1E16B4E20;
  v9[4] = self;
  v10 = v4;
  v11 = v6;
  v12 = v7;
  v8 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);

}

- (void)setApplyingTransition:(BOOL)a3
{
  self->_applyingTransition = a3;
}

- (void)adjustTintImplementationIfNeeded:(id)a3
{
  id v4;
  void *v5;
  double v6;
  BOOL v7;
  double v8;
  BOOL v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;

  v4 = a3;
  -[_UIBackdropView tintFilter](self, "tintFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "grayscaleTintAlpha");
  if (v6 <= 0.00000011920929)
  {
    objc_msgSend(v4, "colorTintAlpha");
    v7 = v8 > 0.00000011920929;
  }
  else
  {
    v7 = 1;
  }
  v9 = -[_UIBackdropView requiresTintViews](self, "requiresTintViews");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52___UIBackdropView_adjustTintImplementationIfNeeded___block_invoke;
  v11[3] = &unk_1E16B4E48;
  v13 = v5 != 0;
  v14 = v9;
  v11[4] = self;
  v12 = v4;
  v15 = v7;
  v10 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);

}

- (CAFilter)tintFilter
{
  return self->_tintFilter;
}

- (void)setAppliesOutputSettingsAutomaticallyEnabledComputesColorSettings:(BOOL)a3
{
  self->_appliesOutputSettingsAutomaticallyEnabledComputesColorSettings = a3;
}

- (void)setAppliesOutputSettingsAutomatically:(BOOL)a3
{
  void *v4;
  uint64_t v5;

  self->_appliesOutputSettingsAutomatically = a3;
  if (a3)
  {
    -[_UIBackdropView inputSettings](self, "inputSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "requiresColorStatistics");

  }
  else
  {
    if (!-[_UIBackdropView appliesOutputSettingsAutomaticallyEnabledComputesColorSettings](self, "appliesOutputSettingsAutomaticallyEnabledComputesColorSettings"))return;
    v5 = 0;
  }
  -[_UIBackdropView setComputesColorSettings:](self, "setComputesColorSettings:", v5);
  -[_UIBackdropView setAppliesOutputSettingsAutomaticallyEnabledComputesColorSettings:](self, "setAppliesOutputSettingsAutomaticallyEnabledComputesColorSettings:", v5);
}

- (void)setBackdropVisibilitySetOnce:(BOOL)a3
{
  self->_backdropVisibilitySetOnce = a3;
}

- (void)setGaussianBlurFilter:(id)a3
{
  objc_storeStrong((id *)&self->_gaussianBlurFilter, a3);
}

- (void)setBackdropEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropEffectView, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)dealloc
{
  _UIBackdropView *v2;
  NSObject *v3;
  _UIBackdropView *v4;
  void *v5;
  void *v6;
  void *v7;
  id computeAndApplySettingsNotificationObserver;
  void *v9;
  NSHashTable *observers;
  objc_super v11;
  _QWORD block[4];
  _UIBackdropView *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = self;
  _UIBackdropViewQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___RemoveFromAllBackdropViews_block_invoke;
  block[3] = &unk_1E16B1B28;
  v13 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView computeAndApplySettingsNotificationObserver](v4, "computeAndApplySettingsNotificationObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIBackdropView computeAndApplySettingsNotificationObserver](v4, "computeAndApplySettingsNotificationObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v7);

    computeAndApplySettingsNotificationObserver = v4->_computeAndApplySettingsNotificationObserver;
    v4->_computeAndApplySettingsNotificationObserver = 0;

  }
  v14[0] = CFSTR("UIApplicationDidBecomeActiveNotification");
  v14[1] = CFSTR("UIAccessibilityReduceTransparencyStatusDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v5, v4, v9);

  -[_UIBackdropView setComputesColorSettings:](v4, "setComputesColorSettings:", 0);
  v4->_observer = 0;
  observers = v4->_observers;
  v4->_observers = 0;

  -[_UIBackdropViewSettings setBackdrop:](v4->_inputSettings, "setBackdrop:", 0);
  -[_UIBackdropViewSettings setBackdrop:](v4->_outputSettings, "setBackdrop:", 0);
  -[_UIBackdropViewSettings setBackdrop:](v4->_savedInputSettingsDuringRenderInContext, "setBackdrop:", 0);

  v11.receiver = v4;
  v11.super_class = (Class)_UIBackdropView;
  -[UIView dealloc](&v11, sel_dealloc);
}

- (id)computeAndApplySettingsNotificationObserver
{
  return self->_computeAndApplySettingsNotificationObserver;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)_UIBackdropView;
  -[UIView layoutSubviews](&v27, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);
        objc_msgSend(v16, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "mask");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);

        objc_msgSend(v16, "setNeedsDisplay");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v13);
  }

  if (-[_UIBackdropView applySettingsAfterLayout](self, "applySettingsAfterLayout"))
  {
    -[_UIBackdropView setApplySettingsAfterLayout:](self, "setApplySettingsAfterLayout:", 0);
    -[_UIBackdropView outputSettings](self, "outputSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView inputSettings](self, "inputSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "computeOutputSettingsUsingModel:", v20);

    -[_UIBackdropView outputSettings](self, "outputSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView applySettings:](self, "applySettings:", v21);

    -[_UIBackdropView outputSettings](self, "outputSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView adjustTintImplementationIfNeeded:](self, "adjustTintImplementationIfNeeded:", v22);

  }
}

- (BOOL)applySettingsAfterLayout
{
  return self->_applySettingsAfterLayout;
}

- (_UIBackdropView)initWithFrame:(CGRect)a3 autosizesToFitSuperview:(BOOL)a4 settings:(id)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  _UIBackdropView *v12;
  _UIBackdropView *v13;
  _UIBackdropView *v14;
  NSObject *v15;
  _UIBackdropView *v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _UIBackdropView *v27;
  objc_super v29;
  _QWORD block[4];
  _UIBackdropView *v31;

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_UIBackdropView;
  v12 = -[UIView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v14 = v12;
    _UIBackdropViewQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___AddToAllBackdropViews_block_invoke;
    block[3] = &unk_1E16B1B28;
    v31 = v14;
    v16 = v14;
    dispatch_sync(v15, block);

    -[_UIBackdropView backdropViewLayer](v16, "backdropViewLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackdropView:", v16);

    -[_UIBackdropView setAutosizesToFitSuperview:](v16, "setAutosizesToFitSuperview:", v5);
    if (-[_UIBackdropView autosizesToFitSuperview](v16, "autosizesToFitSuperview"))
      -[UIView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
    if (!v11)
    {
      NSLog(CFSTR("*** warning: calling _UIBackdropView -initWithSettings: with nil settings. This is probably not what you want."));
      v11 = objc_alloc_init(+[_UIBackdropView defaultSettingsClass](_UIBackdropView, "defaultSettingsClass"));
    }
    v18 = _AXSEnhanceBackgroundContrastEnabled();
    _MergedGlobals_69 = v18 != 0;
    if (v18)
    {
      +[_UIBackdropViewSettings settingsPreservingHintsFromSettings:graphicsQuality:](_UIBackdropViewSettings, "settingsPreservingHintsFromSettings:graphicsQuality:", v11, 10);
      v19 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v19;
    }
    -[_UIBackdropView setInputSettings:](v16, "setInputSettings:", v11);
    if (objc_msgSend(v11, "style"))
    {
      +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", objc_msgSend(v11, "style"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = objc_alloc_init((Class)objc_opt_class());
    }
    v21 = v20;
    -[_UIBackdropView setOutputSettings:](v16, "setOutputSettings:", v20);

    -[_UIBackdropView setStyle:](v16, "setStyle:", objc_msgSend(v11, "style"));
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView setObservers:](v16, "setObservers:", v22);

    -[UIView setOpaque:](v16, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v16, "setUserInteractionEnabled:", 0);
    -[_UIBackdropView setAppliesOutputSettingsAnimationDuration:](v16, "setAppliesOutputSettingsAnimationDuration:", 0.25);
    -[UIView layer](v16, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsGroupBlending:", 0);

    -[UIView layer](v16, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupOpacity:", 0);

    -[_UIBackdropView inputSettings](v16, "inputSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView updateSubviewHierarchyIfNeededForSettings:](v16, "updateSubviewHierarchyIfNeededForSettings:", v25);

    -[_UIBackdropView inputSettings](v16, "inputSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView applySettings:](v16, "applySettings:", v26);

    v27 = v16;
  }

  return v13;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)didMoveToSuperview
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
  CGRect v13;
  CGRect v14;

  -[_UIBackdropView _updateBackdropGroupName](self, "_updateBackdropGroupName");
  if (-[_UIBackdropView autosizesToFitSuperview](self, "autosizesToFitSuperview"))
  {
    -[UIView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    Width = CGRectGetWidth(v13);
    v14.origin.x = v5;
    v14.origin.y = v7;
    v14.size.width = v9;
    v14.size.height = v11;
    -[UIView setFrame:](self, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v14));
  }
  -[_UIBackdropView setApplySettingsAfterLayout:](self, "setApplySettingsAfterLayout:", -[_UIBackdropView appliesOutputSettingsAutomatically](self, "appliesOutputSettingsAutomatically"));
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)autosizesToFitSuperview
{
  return self->_autosizesToFitSuperview;
}

- (void)setApplySettingsAfterLayout:(BOOL)a3
{
  self->_applySettingsAfterLayout = a3;
}

- (BOOL)appliesOutputSettingsAutomatically
{
  return self->_appliesOutputSettingsAutomatically;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setAutosizesToFitSuperview:(BOOL)a3
{
  self->_autosizesToFitSuperview = a3;
}

- (void)setAppliesOutputSettingsAnimationDuration:(double)a3
{
  self->_appliesOutputSettingsAnimationDuration = a3;
}

- (void)transitionIncrementallyToStyle:(int64_t)a3 weighting:(double)a4
{
  id v6;

  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView transitionIncrementallyToSettings:weighting:](self, "transitionIncrementallyToSettings:weighting:", v6, a4);

}

- (void)setAutoGroup:(BOOL)a3
{
  self->_autoGroup = a3;
  -[_UIBackdropView _updateBackdropGroupName](self, "_updateBackdropGroupName");
}

- (void)settingsDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIBackdropView outputSettings](self, "outputSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[_UIBackdropView inputSettings](self, "inputSettings");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4 && !-[_UIBackdropView applyingBackdropChanges](self, "applyingBackdropChanges"))
    {
      if (-[_UIBackdropView appliesOutputSettingsAutomatically](self, "appliesOutputSettingsAutomatically"))
      {
        -[_UIBackdropView inputSettings](self, "inputSettings");
        v7 = (id)objc_claimAutoreleasedReturnValue();

        if (v7 == v4)
        {
          -[_UIBackdropView outputSettings](self, "outputSettings");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIBackdropView inputSettings](self, "inputSettings");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "computeOutputSettingsUsingModel:", v9);

        }
        -[_UIBackdropView outputSettings](self, "outputSettings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBackdropView applySettingsWithBuiltInAnimation:](self, "applySettingsWithBuiltInAnimation:", v10);

      }
      -[_UIBackdropView updateSubviewHierarchyIfNeededForSettings:](self, "updateSubviewHierarchyIfNeededForSettings:", v4);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[_UIBackdropView observers](self, "observers", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "backdropViewDidChange:", self);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
  }

}

+ (void)adjustGraphicsQualityForAccessibilityIfNeeded:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = _AXSEnhanceBackgroundContrastEnabled() != 0;
  if (_MergedGlobals_69 != v4)
  {
    _MergedGlobals_69 = v4;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_graphicsQuality");

    if (_MergedGlobals_69)
      v7 = 10;
    else
      v7 = v6;
    objc_msgSend(a1, "setAllBackdropViewsToGraphicsQuality:", v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__blurQuality, 0);
  objc_storeStrong((id *)&self->_colorMatrixColorTint, 0);
  objc_storeStrong(&self->_computeAndApplySettingsNotificationObserver, 0);
  objc_storeStrong((id *)&self->_filterMaskViewMap, 0);
  objc_storeStrong((id *)&self->_filterMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_darkeningTintMaskViewMap, 0);
  objc_storeStrong((id *)&self->_darkeningTintMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_colorBurnTintMaskViewMap, 0);
  objc_storeStrong((id *)&self->_colorBurnTintMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_colorTintMaskViewMap, 0);
  objc_storeStrong((id *)&self->_colorTintMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_grayscaleTintMaskViewMap, 0);
  objc_storeStrong((id *)&self->_grayscaleTintMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_partialMaskViews, 0);
  objc_storeStrong((id *)&self->_darkeningTintMaskImage, 0);
  objc_storeStrong((id *)&self->_darkeningTintView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_colorOffsetFilter, 0);
  objc_storeStrong((id *)&self->_tintFilter, 0);
  objc_storeStrong((id *)&self->_colorSaturateFilter, 0);
  objc_storeStrong((id *)&self->_gaussianBlurFilter, 0);
  objc_storeStrong((id *)&self->_colorBurnTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorBurnTintView, 0);
  objc_storeStrong((id *)&self->_colorTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorTintView, 0);
  objc_storeStrong((id *)&self->_grayscaleTintMaskImage, 0);
  objc_storeStrong((id *)&self->_grayscaleTintView, 0);
  objc_storeStrong((id *)&self->_filterMaskImage, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_backdropEffectView, 0);
  objc_storeStrong((id *)&self->_savedInputSettingsDuringRenderInContext, 0);
  objc_storeStrong((id *)&self->_outputSettings, 0);
  objc_storeStrong((id *)&self->_inputSettings, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (id)allBackdropViews
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__13;
  v11 = 0;
  _UIBackdropViewQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___UIBackdropView_allBackdropViews__block_invoke;
  block[3] = &unk_1E16B14C0;
  block[4] = &v6;
  dispatch_sync(v2, block);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (void)setAllBackdropViewsToGraphicsQuality:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "allBackdropViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_transitionToGraphicsQuality:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_transitionToGraphicsQuality:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  -[_UIBackdropView graphicsQualityChangeDelegate](self, "graphicsQualityChangeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (-[_UIBackdropView graphicsQualityChangeDelegate](self, "graphicsQualityChangeDelegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "backdropView:willChangeToGraphicsQuality:", self, a3),
        v11 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        (v7 = v11) == 0))
  {
    -[_UIBackdropView inputSettings](self, "inputSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIBackdropViewSettings settingsPreservingHintsFromSettings:graphicsQuality:](_UIBackdropViewSettings, "settingsPreservingHintsFromSettings:graphicsQuality:", v8, a3);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v12;
  }
  v13 = v7;
  -[_UIBackdropView transitionToSettings:](self, "transitionToSettings:");
  -[_UIBackdropView graphicsQualityChangeDelegate](self, "graphicsQualityChangeDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UIBackdropView graphicsQualityChangeDelegate](self, "graphicsQualityChangeDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backdropView:didChangeToGraphicsQuality:", self, a3);

  }
}

+ (Class)defaultSettingsClass
{
  return (Class)objc_opt_class();
}

- (_UIBackdropView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  return -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIBackdropView)initWithSettings:(id)a3
{
  return -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 1, a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (_UIBackdropView)initWithStyle:(int64_t)a3
{
  void *v4;
  _UIBackdropView *v5;

  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 1, v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v5;
}

- (_UIBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  _UIBackdropView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 0, v9, x, y, width, height);

  return v10;
}

- (_UIBackdropView)initWithFrame:(CGRect)a3
{
  return -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIBackdropView)init
{
  return -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 1, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setGroupName:(id)a3
{
  NSString *v4;
  NSString *groupName;

  if (self->_groupName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    groupName = self->_groupName;
    self->_groupName = v4;

  }
  -[_UIBackdropView _updateBackdropGroupName](self, "_updateBackdropGroupName");
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    self->_cornerRadiusIsContinuous = 0;
    -[_UIBackdropView _applyCornerRadiusToSubviews](self, "_applyCornerRadiusToSubviews");
  }
}

- (double)_continuousCornerRadius
{
  return self->_cornerRadius;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    self->_cornerRadiusIsContinuous = 1;
    -[_UIBackdropView _applyCornerRadiusToSubviews](self, "_applyCornerRadiusToSubviews");
  }
}

- (void)setApplySaturationBeforeBlur:(BOOL)a3
{
  self->_applySaturationBeforeBlur = a3;
  -[_UIBackdropView _updateFilters](self, "_updateFilters");
}

- (void)setShouldRasterizeEffectsView:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (-[_UIBackdropViewSettings zoomsBack](self->_inputSettings, "zoomsBack"))
  {
    v5 = 1;
  }
  else
  {
    -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "meshTransform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 != 0;

  }
  -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backdropLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldRasterize:", v5 | v3);

}

- (void)willCallRenderInContextOnBackdropViewLayer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIBackdropView inputSettings](self, "inputSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "graphicsQuality");

  if (v4 != 10)
  {
    -[_UIBackdropView inputSettings](self, "inputSettings");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "combinedTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
}

- (void)didCallRenderInContextOnBackdropViewLayer
{
  void *v3;
  uint64_t v4;

  -[_UIBackdropView inputSettings](self, "inputSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "graphicsQuality");

  if (v4 != 10)
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", 0);
}

- (void)setObserver:(id)a3
{
  _UIBackdropViewObserver *observer;
  _UIBackdropViewObserver *v5;

  observer = self->_observer;
  v5 = (_UIBackdropViewObserver *)a3;
  -[_UIBackdropView removeObserver:](self, "removeObserver:", observer);
  self->_observer = v5;
  -[_UIBackdropView addObserver:](self, "addObserver:");

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIBackdropView observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIBackdropView observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)updateMaskViewForView:(id)a3 flag:(int64_t)a4
{
  void *v6;
  UIView *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  UIView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIView *v20;
  char v21;
  uint64_t v22;
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
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  switch(a4)
  {
    case 1:
      -[_UIBackdropView grayscaleTintMaskViewMap](self, "grayscaleTintMaskViewMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView grayscaleTintMaskViewContainer](self, "grayscaleTintMaskViewContainer");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[_UIBackdropView colorTintMaskViewMap](self, "colorTintMaskViewMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView colorTintMaskViewContainer](self, "colorTintMaskViewContainer");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView colorTintView](self, "colorTintView");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_63;
    case 4:
      -[_UIBackdropView filterMaskViewMap](self, "filterMaskViewMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView filterMaskViewContainer](self, "filterMaskViewContainer");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 8:
      -[_UIBackdropView colorBurnTintMaskViewMap](self, "colorBurnTintMaskViewMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView colorBurnTintMaskViewContainer](self, "colorBurnTintMaskViewContainer");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    default:
      if (a4 != 16)
        goto LABEL_63;
      -[_UIBackdropView darkeningTintMaskViewMap](self, "darkeningTintMaskViewMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView darkeningTintMaskViewContainer](self, "darkeningTintMaskViewContainer");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v8;
      objc_msgSend(v36, "_backdropMaskViewForFlag:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_generateBackdropMaskViewForFlag:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v36);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      if (v10 && v11 != v10)
      {
        v13 = v11 != 0;
        if (v11)
        {
          objc_msgSend(v10, "frame");
          objc_msgSend(v11, "setFrame:");
        }
        objc_msgSend(v10, "removeFromSuperview");
        objc_msgSend(v6, "removeObjectForKey:", v12);
      }
      if (!v11)
        goto LABEL_62;
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v34 = v10;
      if (!v7 && v9)
      {
        v14 = [UIView alloc];
        -[UIView bounds](self, "bounds");
        v7 = -[UIView initWithFrame:](v14, "initWithFrame:");
        if (!-[_UIBackdropView maskMode](self, "maskMode"))
        {
          +[UIColor blackColor](UIColor, "blackColor");
          v15 = v6;
          v16 = v12;
          v17 = v9;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v18);

          v9 = v17;
          v12 = v16;
          v6 = v15;
        }
        -[UIView setOpaque:](v7, "setOpaque:", 0, v34);
        -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
        -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
        objc_msgSend(v9, "_setMaskView:", v7);
        objc_msgSend(v9, "setNeedsLayout");
      }
      v19 = v9;
      -[UIView addSubview:](v7, "addSubview:", v11, v34);
      objc_msgSend(v36, "superview");
      v20 = (UIView *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == self->_contentView || v13;

      if ((v21 & 1) == 0)
      {
        objc_msgSend(v11, "bounds");
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", v36);
        objc_msgSend(v11, "setFrame:");
      }
      objc_msgSend(v6, "setObject:forKey:", v11, v12);
      if (!-[_UIBackdropView maskMode](self, "maskMode"))
      {
        v22 = *MEMORY[0x1E0CD2EF0];
        objc_msgSend(v11, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCompositingFilter:", v22);

      }
      break;
  }
  v9 = v19;
  v10 = v35;
  switch(a4)
  {
    case 1:
      -[_UIBackdropView grayscaleTintMaskViewMap](self, "grayscaleTintMaskViewMap");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24 && v6)
        -[_UIBackdropView setGrayscaleTintMaskViewMap:](self, "setGrayscaleTintMaskViewMap:", v6);
      -[_UIBackdropView grayscaleTintMaskViewContainer](self, "grayscaleTintMaskViewContainer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && !v25)
        -[_UIBackdropView setGrayscaleTintMaskViewContainer:](self, "setGrayscaleTintMaskViewContainer:", v7);
      break;
    case 2:
      -[_UIBackdropView colorTintMaskViewMap](self, "colorTintMaskViewMap");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28 && v6)
        -[_UIBackdropView setColorTintMaskViewMap:](self, "setColorTintMaskViewMap:", v6);
      -[_UIBackdropView colorTintMaskViewContainer](self, "colorTintMaskViewContainer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && !v29)
        -[_UIBackdropView setColorTintMaskViewContainer:](self, "setColorTintMaskViewContainer:", v7);
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    case 4:
      -[_UIBackdropView filterMaskViewMap](self, "filterMaskViewMap");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30 && v6)
        -[_UIBackdropView setFilterMaskViewMap:](self, "setFilterMaskViewMap:", v6);
      -[_UIBackdropView filterMaskViewContainer](self, "filterMaskViewContainer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && !v31)
        -[_UIBackdropView setFilterMaskViewContainer:](self, "setFilterMaskViewContainer:", v7);
      break;
    case 8:
      -[_UIBackdropView colorBurnTintMaskViewMap](self, "colorBurnTintMaskViewMap");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32 && v6)
        -[_UIBackdropView setColorBurnTintMaskViewMap:](self, "setColorBurnTintMaskViewMap:", v6);
      -[_UIBackdropView colorBurnTintMaskViewContainer](self, "colorBurnTintMaskViewContainer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && !v33)
        -[_UIBackdropView setColorBurnTintMaskViewContainer:](self, "setColorBurnTintMaskViewContainer:", v7);
      break;
    default:
      if (a4 == 16)
      {
        -[_UIBackdropView darkeningTintMaskViewMap](self, "darkeningTintMaskViewMap");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26 && v6)
          -[_UIBackdropView setDarkeningTintMaskViewMap:](self, "setDarkeningTintMaskViewMap:", v6);
        -[_UIBackdropView darkeningTintMaskViewContainer](self, "darkeningTintMaskViewContainer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v35;
        if (v7)
        {
          v10 = v35;
          if (!v27)
            -[_UIBackdropView setDarkeningTintMaskViewContainer:](self, "setDarkeningTintMaskViewContainer:", v7);
          break;
        }
      }
      else
      {
        v9 = v35;
      }
      v10 = v35;
      break;
  }
LABEL_62:

LABEL_63:
}

- (void)updateMaskViewsForView:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v4 = -[_UIBackdropView simulatesMasks](self, "simulatesMasks");
  v5 = objc_msgSend(v17, "_backdropMaskViewFlags");
  if (v4)
  {
    if (v5)
      -[_UIBackdropView applyOverlayBlendModeToView:](self, "applyOverlayBlendModeToView:", v17);
    else
      -[_UIBackdropView removeOverlayBlendModeFromView:](self, "removeOverlayBlendModeFromView:", v17);
  }
  else if (v5
         || (objc_msgSend(v17, "_backdropMaskViews"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             v7 = objc_msgSend(v6, "count"),
             v6,
             v7))
  {
    if (!-[_UIBackdropView updateMaskViewsForViewReentrancyGuard](self, "updateMaskViewsForViewReentrancyGuard"))
    {
      -[_UIBackdropView setUpdateMaskViewsForViewReentrancyGuard:](self, "setUpdateMaskViewsForViewReentrancyGuard:", 1);
      v8 = objc_msgSend(v17, "_backdropMaskViewFlags");
      v9 = objc_msgSend(v17, "_backdropMaskViewFlags");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView partialMaskViews](self, "partialMaskViews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v8 == 7 || !v9)
      {
        objc_msgSend(v11, "removeObject:", v10);
      }
      else
      {

        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIBackdropView setPartialMaskViews:](self, "setPartialMaskViews:", v13);

        }
        -[_UIBackdropView partialMaskViews](self, "partialMaskViews");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v10);
      }

      -[_UIBackdropView updateMaskViewForView:flag:](self, "updateMaskViewForView:flag:", v17, 1);
      -[_UIBackdropView updateMaskViewForView:flag:](self, "updateMaskViewForView:flag:", v17, 2);
      -[_UIBackdropView updateMaskViewForView:flag:](self, "updateMaskViewForView:flag:", v17, 8);
      -[_UIBackdropView updateMaskViewForView:flag:](self, "updateMaskViewForView:flag:", v17, 16);
      -[_UIBackdropView updateMaskViewForView:flag:](self, "updateMaskViewForView:flag:", v17, 4);
      objc_msgSend(v17, "superview");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        do
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v15, "_addScrollViewScrollObserver:", v17);
          objc_msgSend(v15, "superview");
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v16;
        }
        while (v16);
      }
      -[_UIBackdropView setUpdateMaskViewsForViewReentrancyGuard:](self, "setUpdateMaskViewsForViewReentrancyGuard:", 0);

    }
  }

}

- (void)setMaskMode:(int64_t)a3
{
  int64_t maskMode;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (!-[_UIBackdropView simulatesMasks](self, "simulatesMasks"))
  {
    maskMode = self->_maskMode;
    self->_maskMode = a3;
    if (maskMode != a3)
    {
      if (-[_UIBackdropView maskMode](self, "maskMode"))
      {
        v6 = 0;
        v7 = 0;
      }
      else
      {
        +[UIColor blackColor](UIColor, "blackColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (id)*MEMORY[0x1E0CD2EF0];
      }
      -[_UIBackdropView grayscaleTintMaskViewContainer](self, "grayscaleTintMaskViewContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v7);

      -[_UIBackdropView colorTintMaskViewContainer](self, "colorTintMaskViewContainer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v7);

      -[_UIBackdropView colorBurnTintMaskViewContainer](self, "colorBurnTintMaskViewContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v7);

      -[_UIBackdropView darkeningTintMaskViewContainer](self, "darkeningTintMaskViewContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v7);

      -[_UIBackdropView filterMaskViewContainer](self, "filterMaskViewContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v7);

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      -[_UIBackdropView grayscaleTintMaskViewMap](self, "grayscaleTintMaskViewMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v65 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "layer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setCompositingFilter:", v6);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        }
        while (v16);
      }

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      -[_UIBackdropView colorTintMaskViewMap](self, "colorTintMaskViewMap");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v61 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "layer");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setCompositingFilter:", v6);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        }
        while (v23);
      }

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      -[_UIBackdropView colorBurnTintMaskViewMap](self, "colorBurnTintMaskViewMap");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allValues");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v57 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "layer");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setCompositingFilter:", v6);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
        }
        while (v30);
      }

      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[_UIBackdropView darkeningTintMaskViewMap](self, "darkeningTintMaskViewMap");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "allValues");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v53;
        do
        {
          for (m = 0; m != v37; ++m)
          {
            if (*(_QWORD *)v53 != v38)
              objc_enumerationMutation(v35);
            objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * m), "layer");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setCompositingFilter:", v6);

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
        }
        while (v37);
      }

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[_UIBackdropView filterMaskViewMap](self, "filterMaskViewMap", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "allValues");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v49;
        do
        {
          for (n = 0; n != v44; ++n)
          {
            if (*(_QWORD *)v49 != v45)
              objc_enumerationMutation(v42);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * n), "layer");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setCompositingFilter:", v6);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
        }
        while (v44);
      }

    }
  }
}

- (void)removeMaskViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (!-[_UIBackdropView simulatesMasks](self, "simulatesMasks"))
  {
    -[_UIBackdropView grayscaleTintMaskViewContainer](self, "grayscaleTintMaskViewContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    -[_UIBackdropView grayscaleTintMaskViewContainer](self, "grayscaleTintMaskViewContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[_UIBackdropView setGrayscaleTintMaskViewContainer:](self, "setGrayscaleTintMaskViewContainer:", 0);
    -[_UIBackdropView colorTintMaskViewContainer](self, "colorTintMaskViewContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    -[_UIBackdropView colorTintMaskViewContainer](self, "colorTintMaskViewContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[_UIBackdropView setColorTintMaskViewContainer:](self, "setColorTintMaskViewContainer:", 0);
    -[_UIBackdropView colorBurnTintMaskViewContainer](self, "colorBurnTintMaskViewContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    -[_UIBackdropView colorBurnTintMaskViewContainer](self, "colorBurnTintMaskViewContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[_UIBackdropView setColorBurnTintMaskViewContainer:](self, "setColorBurnTintMaskViewContainer:", 0);
    -[_UIBackdropView darkeningTintMaskViewContainer](self, "darkeningTintMaskViewContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    -[_UIBackdropView darkeningTintMaskViewContainer](self, "darkeningTintMaskViewContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");

    -[_UIBackdropView setDarkeningTintMaskViewContainer:](self, "setDarkeningTintMaskViewContainer:", 0);
    -[_UIBackdropView filterMaskViewContainer](self, "filterMaskViewContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subviews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    -[_UIBackdropView filterMaskViewContainer](self, "filterMaskViewContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeFromSuperview");

    -[_UIBackdropView setFilterMaskViewContainer:](self, "setFilterMaskViewContainer:", 0);
    -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setMaskView:", 0);

    -[_UIBackdropView colorTintView](self, "colorTintView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setMaskView:", 0);

    -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_setMaskView:", 0);

    -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_setMaskView:", 0);

    -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setMaskView:", 0);

  }
}

- (void)applyOverlayBlendMode:(int64_t)a3 toView:(id)a4
{
  objc_msgSend(a4, "_setDrawsAsBackdropOverlayWithBlendMode:", a3);
}

- (void)applyOverlayBlendModeToView:(id)a3
{
  objc_msgSend(a3, "_setDrawsAsBackdropOverlay:", 1);
}

- (void)removeOverlayBlendModeFromView:(id)a3
{
  objc_msgSend(a3, "_setDrawsAsBackdropOverlay:", 0);
}

- (double)blurRadius
{
  return self->__blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  if (self->__blurRadius != a3 || !-[_UIBackdropView blurRadiusSetOnce](self, "blurRadiusSetOnce"))
  {
    -[_UIBackdropView setBlurRadiusSetOnce:](self, "setBlurRadiusSetOnce:", 1);
    -[_UIBackdropView setBlurFilterWithRadius:blurQuality:](self, "setBlurFilterWithRadius:blurQuality:", CFSTR("default"), a3);
    self->__blurRadius = a3;
  }
}

- (id)blurQuality
{
  return self->__blurQuality;
}

- (void)setBlurQuality:(id)a3
{
  id v4;
  NSString *v5;
  NSString *blurQuality;

  if (self->__blurQuality != a3)
  {
    v4 = a3;
    -[_UIBackdropView blurRadius](self, "blurRadius");
    -[_UIBackdropView setBlurFilterWithRadius:blurQuality:](self, "setBlurFilterWithRadius:blurQuality:", v4);
    v5 = (NSString *)objc_msgSend(v4, "copy");

    blurQuality = self->__blurQuality;
    self->__blurQuality = v5;

  }
}

- (double)saturationDeltaFactor
{
  return self->__saturationDeltaFactor;
}

- (void)setTintFilterForSettings:(id)a3
{
  _QWORD *v4;
  id v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  CAFilter *v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  CAFilter *tintFilter;
  void *v20;
  void *v21;
  float v22;
  uint64_t v23;
  int v24;
  float v25;
  int v26;
  float v27;
  uint64_t v28;
  float v29;
  uint64_t v30;
  float v31;
  int v32;
  float v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;

  v4 = a3;
  v5 = v4;
  if (self->_backdropEffectView)
  {
    v39 = 0.0;
    v40 = 0.0;
    v37 = 0.0;
    v38 = 0.0;
    v6 = 0.0;
    v7 = (void *)v4[16];
    if (v7)
    {
      objc_msgSend(v7, "getRed:green:blue:alpha:", &v40, &v39, &v38, &v37);
      v8 = *((double *)v5 + 17) * v37;
      v37 = v8;
      v9 = 1.0 - v8;
    }
    else
    {
      v9 = 1.0;
      v8 = 0.0;
    }
    if (*((_BYTE *)v5 + 305))
      v6 = *((double *)v5 + 12);
    v11 = *((double *)v5 + 11);
    v12 = v9 * (v6 * v11);
    v13 = v9 * (1.0 - v6);
    v14 = v12 + v8 * v40;
    v15 = v12 + v8 * v39;
    v16 = v12 + v8 * v38;
    if (!self->_tintFilter)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setName:", CFSTR("colorMatrix"));
      v22 = v13;
      v23 = 0;
      v24 = 0;
      v25 = v14;
      v26 = 0;
      v27 = v13;
      v28 = 0;
      v29 = v15;
      v30 = 0;
      v31 = v13;
      v32 = 0;
      v33 = v16;
      v34 = 0;
      v35 = 0;
      v36 = 1065353216;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", v18, CFSTR("inputColorMatrix"));

      tintFilter = self->_tintFilter;
      self->_tintFilter = (CAFilter *)v17;

      -[_UIBackdropView _updateFilters](self, "_updateFilters");
      v11 = *((double *)v5 + 11);
    }
    if (vabdd_f64(self->_colorMatrixGrayscaleTintLevel, v11) > 0.00000011920929
      || vabdd_f64(self->_colorMatrixGrayscaleTintAlpha, *((double *)v5 + 12)) > 0.00000011920929
      || vabdd_f64(self->_colorMatrixColorTintAlpha, *((double *)v5 + 17)) > 0.00000011920929)
    {
      goto LABEL_16;
    }
    if (!-[UIColor isEqual:](self->_colorMatrixColorTint, "isEqual:", *((_QWORD *)v5 + 16)))
    {
      v11 = *((double *)v5 + 11);
LABEL_16:
      self->_colorMatrixGrayscaleTintLevel = v11;
      self->_colorMatrixGrayscaleTintAlpha = *((double *)v5 + 12);
      objc_storeStrong((id *)&self->_colorMatrixColorTint, *((id *)v5 + 16));
      self->_colorMatrixColorTintAlpha = *((double *)v5 + 17);
      -[UIView layer](self->_backdropEffectView, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v13;
      v23 = 0;
      v24 = 0;
      v25 = v14;
      v26 = 0;
      v27 = v13;
      v28 = 0;
      v29 = v15;
      v30 = 0;
      v31 = v13;
      v32 = 0;
      v33 = v16;
      v34 = 0;
      v35 = 0;
      v36 = 1065353216;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setValue:forKeyPath:", v21, CFSTR("filters.colorMatrix.inputColorMatrix"));

    }
  }
  else
  {
    v10 = self->_tintFilter;
    if (v10)
    {
      self->_tintFilter = 0;

      -[_UIBackdropView _updateFilters](self, "_updateFilters");
    }
  }

}

- (BOOL)isBackdropVisible
{
  return self->__backdropVisible;
}

- (void)setUsesZoom
{
  void *v3;
  void *v4;
  id v5;

  MeshTransformForZoom(0.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView backdropEffectView](self, "backdropEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backdropLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMeshTransform:", v5);

}

- (void)_setBlursBackground:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  self->_blursBackground = a3;
  if (-[_UIBackdropView configuration](self, "configuration") != 1)
    -[_UIBackdropView setConfiguration:](self, "setConfiguration:", 1);
  -[_UIBackdropView effectView](self, "effectView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", (double)v3);

}

- (void)transitionToStyle:(int64_t)a3
{
  id v4;

  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIBackdropView prepareForTransitionToSettings:](self, "prepareForTransitionToSettings:", v4);
  -[_UIBackdropView computeAndApplySettingsForTransition](self, "computeAndApplySettingsForTransition");

}

- (void)transitionToColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", 2040);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorTint:", v4);

  objc_msgSend(v5, "setColorTintAlpha:", 1.0);
  -[_UIBackdropView prepareForTransitionToSettings:](self, "prepareForTransitionToSettings:", v5);
  -[_UIBackdropView computeAndApplySettingsForTransition](self, "computeAndApplySettingsForTransition");

}

- (UIView)contentView
{
  UIView **p_contentView;
  void *v4;

  if (-[_UIBackdropView contentViewAccessorGuard](self, "contentViewAccessorGuard"))
  {
    p_contentView = &self->_contentView;
  }
  else
  {
    -[_UIBackdropView setContentViewAccessorGuard:](self, "setContentViewAccessorGuard:", 1);
    p_contentView = &self->_contentView;
    if (!self->_contentView)
    {
      -[_UIBackdropView setContentViewAccessed:](self, "setContentViewAccessed:", 1);
      -[_UIBackdropView inputSettings](self, "inputSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView updateSubviewHierarchyIfNeededForSettings:](self, "updateSubviewHierarchyIfNeededForSettings:", v4);

    }
    -[_UIBackdropView setContentViewAccessorGuard:](self, "setContentViewAccessorGuard:", 0);
  }
  return *p_contentView;
}

- (void)setConfiguration:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_configuration != a3)
  {
    self->_configuration = a3;
    -[_UIBackdropView outputSettings](self, "outputSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView inputSettings](self, "inputSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "computeOutputSettingsUsingModel:", v5);

    -[_UIBackdropView outputSettings](self, "outputSettings");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView adjustTintImplementationIfNeeded:](self, "adjustTintImplementationIfNeeded:", v6);

  }
}

- (void)applySettingsWithBuiltInAnimation:(id)a3
{
  id v4;
  void *v5;
  double appliesOutputSettingsAnimationDuration;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (!self->_applyingTransition)
  {
    appliesOutputSettingsAnimationDuration = self->_appliesOutputSettingsAnimationDuration;
    v7 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___UIBackdropView_applySettingsWithBuiltInAnimation___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v4;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __53___UIBackdropView_applySettingsWithBuiltInAnimation___block_invoke_2;
    v8[3] = &unk_1E16B3FD8;
    v8[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v9, v8, appliesOutputSettingsAnimationDuration, 0.0);

  }
}

- (BOOL)disablesOccludedBackdropBlurs
{
  return 0;
}

- (void)setTintOpacity:(double)a3
{
  int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  -[_UIBackdropView inputSettings](self, "inputSettings");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v18, "lightenGrayscaleWithSourceOver");
  v6 = 1.0;
  if (v5)
    objc_msgSend(v18, "grayscaleTintAlpha", 1.0);
  v7 = v6 * a3;
  -[_UIBackdropView grayscaleTintView](self, "grayscaleTintView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  objc_msgSend(v18, "colorTintAlpha");
  v10 = v9 * a3;
  -[_UIBackdropView colorTintView](self, "colorTintView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v10);

  objc_msgSend(v18, "colorBurnTintAlpha");
  v13 = v12 * a3;
  -[_UIBackdropView colorBurnTintView](self, "colorBurnTintView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v13);

  objc_msgSend(v18, "darkeningTintAlpha");
  v16 = v15 * a3;
  -[_UIBackdropView darkeningTintView](self, "darkeningTintView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", v16);

}

- (int64_t)style
{
  return self->_style;
}

- (_UIBackdropViewObserver)observer
{
  return self->_observer;
}

- (BOOL)computesColorSettings
{
  return self->_computesColorSettings;
}

- (double)appliesOutputSettingsAnimationDuration
{
  return self->_appliesOutputSettingsAnimationDuration;
}

- (BOOL)applySaturationBeforeBlur
{
  return self->_applySaturationBeforeBlur;
}

- (_UIBackdropViewSettings)savedInputSettingsDuringRenderInContext
{
  return self->_savedInputSettingsDuringRenderInContext;
}

- (void)setSavedInputSettingsDuringRenderInContext:(id)a3
{
  objc_storeStrong((id *)&self->_savedInputSettingsDuringRenderInContext, a3);
}

- (BOOL)appliesOutputSettingsAutomaticallyEnabledComputesColorSettings
{
  return self->_appliesOutputSettingsAutomaticallyEnabledComputesColorSettings;
}

- (BOOL)applyingBackdropChanges
{
  return self->_applyingBackdropChanges;
}

- (void)setApplyingBackdropChanges:(BOOL)a3
{
  self->_applyingBackdropChanges = a3;
}

- (BOOL)applyingTransition
{
  return self->_applyingTransition;
}

- (void)setRequiresTintViews:(BOOL)a3
{
  self->_requiresTintViews = a3;
}

- (BOOL)blursBackground
{
  return self->_blursBackground;
}

- (void)setBlursBackground:(BOOL)a3
{
  self->_blursBackground = a3;
}

- (BOOL)allowsColorSettingsSuppression
{
  return self->_allowsColorSettingsSuppression;
}

- (void)setAllowsColorSettingsSuppression:(BOOL)a3
{
  self->_allowsColorSettingsSuppression = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)autoGroup
{
  return self->_autoGroup;
}

- (UIImage)filterMaskImage
{
  return self->_filterMaskImage;
}

- (UIImage)grayscaleTintMaskImage
{
  return self->_grayscaleTintMaskImage;
}

- (UIImage)colorTintMaskImage
{
  return self->_colorTintMaskImage;
}

- (void)setColorBurnTintView:(id)a3
{
  objc_storeStrong((id *)&self->_colorBurnTintView, a3);
}

- (UIImage)colorBurnTintMaskImage
{
  return self->_colorBurnTintMaskImage;
}

- (CAFilter)colorSaturateFilter
{
  return self->_colorSaturateFilter;
}

- (void)setColorSaturateFilter:(id)a3
{
  objc_storeStrong((id *)&self->_colorSaturateFilter, a3);
}

- (void)setTintFilter:(id)a3
{
  objc_storeStrong((id *)&self->_tintFilter, a3);
}

- (CAFilter)colorOffsetFilter
{
  return self->_colorOffsetFilter;
}

- (void)setColorOffsetFilter:(id)a3
{
  objc_storeStrong((id *)&self->_colorOffsetFilter, a3);
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIImage)darkeningTintMaskImage
{
  return self->_darkeningTintMaskImage;
}

- (void)setContentViewAccessed:(BOOL)a3
{
  self->_contentViewAccessed = a3;
}

- (BOOL)contentViewAccessorGuard
{
  return self->_contentViewAccessorGuard;
}

- (void)setContentViewAccessorGuard:(BOOL)a3
{
  self->_contentViewAccessorGuard = a3;
}

- (int64_t)maskMode
{
  return self->_maskMode;
}

- (void)setPartialMaskViews:(id)a3
{
  objc_storeStrong((id *)&self->_partialMaskViews, a3);
}

- (UIView)grayscaleTintMaskViewContainer
{
  return self->_grayscaleTintMaskViewContainer;
}

- (void)setGrayscaleTintMaskViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleTintMaskViewContainer, a3);
}

- (NSMutableDictionary)grayscaleTintMaskViewMap
{
  return self->_grayscaleTintMaskViewMap;
}

- (void)setGrayscaleTintMaskViewMap:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleTintMaskViewMap, a3);
}

- (UIView)colorTintMaskViewContainer
{
  return self->_colorTintMaskViewContainer;
}

- (void)setColorTintMaskViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_colorTintMaskViewContainer, a3);
}

- (NSMutableDictionary)colorTintMaskViewMap
{
  return self->_colorTintMaskViewMap;
}

- (void)setColorTintMaskViewMap:(id)a3
{
  objc_storeStrong((id *)&self->_colorTintMaskViewMap, a3);
}

- (UIView)colorBurnTintMaskViewContainer
{
  return self->_colorBurnTintMaskViewContainer;
}

- (void)setColorBurnTintMaskViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_colorBurnTintMaskViewContainer, a3);
}

- (NSMutableDictionary)colorBurnTintMaskViewMap
{
  return self->_colorBurnTintMaskViewMap;
}

- (void)setColorBurnTintMaskViewMap:(id)a3
{
  objc_storeStrong((id *)&self->_colorBurnTintMaskViewMap, a3);
}

- (UIView)darkeningTintMaskViewContainer
{
  return self->_darkeningTintMaskViewContainer;
}

- (void)setDarkeningTintMaskViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningTintMaskViewContainer, a3);
}

- (NSMutableDictionary)darkeningTintMaskViewMap
{
  return self->_darkeningTintMaskViewMap;
}

- (void)setDarkeningTintMaskViewMap:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningTintMaskViewMap, a3);
}

- (UIView)filterMaskViewContainer
{
  return self->_filterMaskViewContainer;
}

- (void)setFilterMaskViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_filterMaskViewContainer, a3);
}

- (NSMutableDictionary)filterMaskViewMap
{
  return self->_filterMaskViewMap;
}

- (void)setFilterMaskViewMap:(id)a3
{
  objc_storeStrong((id *)&self->_filterMaskViewMap, a3);
}

- (void)setComputeAndApplySettingsNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_computeAndApplySettingsNotificationObserver, a3);
}

- (BOOL)updateMaskViewsForViewReentrancyGuard
{
  return self->_updateMaskViewsForViewReentrancyGuard;
}

- (void)setUpdateMaskViewsForViewReentrancyGuard:(BOOL)a3
{
  self->_updateMaskViewsForViewReentrancyGuard = a3;
}

- (double)colorMatrixGrayscaleTintLevel
{
  return self->_colorMatrixGrayscaleTintLevel;
}

- (void)setColorMatrixGrayscaleTintLevel:(double)a3
{
  self->_colorMatrixGrayscaleTintLevel = a3;
}

- (double)colorMatrixGrayscaleTintAlpha
{
  return self->_colorMatrixGrayscaleTintAlpha;
}

- (void)setColorMatrixGrayscaleTintAlpha:(double)a3
{
  self->_colorMatrixGrayscaleTintAlpha = a3;
}

- (UIColor)colorMatrixColorTint
{
  return self->_colorMatrixColorTint;
}

- (void)setColorMatrixColorTint:(id)a3
{
  objc_storeStrong((id *)&self->_colorMatrixColorTint, a3);
}

- (double)colorMatrixColorTintAlpha
{
  return self->_colorMatrixColorTintAlpha;
}

- (void)setColorMatrixColorTintAlpha:(double)a3
{
  self->_colorMatrixColorTintAlpha = a3;
}

- (BOOL)simulatesMasks
{
  return self->_simulatesMasks;
}

- (void)setSimulatesMasks:(BOOL)a3
{
  self->_simulatesMasks = a3;
}

- (BOOL)backdropVisibilitySetOnce
{
  return self->_backdropVisibilitySetOnce;
}

- (BOOL)blurRadiusSetOnce
{
  return self->_blurRadiusSetOnce;
}

- (void)setBlurRadiusSetOnce:(BOOL)a3
{
  self->_blurRadiusSetOnce = a3;
}

- (double)previousBackdropStatisticsRed
{
  return self->_previousBackdropStatisticsRed;
}

- (void)setPreviousBackdropStatisticsRed:(double)a3
{
  self->_previousBackdropStatisticsRed = a3;
}

- (double)previousBackdropStatisticsGreen
{
  return self->_previousBackdropStatisticsGreen;
}

- (void)setPreviousBackdropStatisticsGreen:(double)a3
{
  self->_previousBackdropStatisticsGreen = a3;
}

- (double)previousBackdropStatisticsBlue
{
  return self->_previousBackdropStatisticsBlue;
}

- (void)setPreviousBackdropStatisticsBlue:(double)a3
{
  self->_previousBackdropStatisticsBlue = a3;
}

- (double)previousBackdropStatisticsContrast
{
  return self->_previousBackdropStatisticsContrast;
}

- (void)setPreviousBackdropStatisticsContrast:(double)a3
{
  self->_previousBackdropStatisticsContrast = a3;
}

- (_UIBackdropViewGraphicsQualityChangeDelegate)graphicsQualityChangeDelegate
{
  return self->_graphicsQualityChangeDelegate;
}

- (void)setGraphicsQualityChangeDelegate:(id)a3
{
  self->_graphicsQualityChangeDelegate = (_UIBackdropViewGraphicsQualityChangeDelegate *)a3;
}

- (BOOL)transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack
{
  return self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack;
}

- (void)setTransitioningBetweenMaterialsRequiringRasterizationAndAlphaHack:(BOOL)a3
{
  self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack = a3;
}

- (NSString)_blurQuality
{
  return self->__blurQuality;
}

- (void)set_blurQuality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (double)_blurRadius
{
  return self->__blurRadius;
}

- (void)set_blurRadius:(double)a3
{
  self->__blurRadius = a3;
}

- (double)_saturationDeltaFactor
{
  return self->__saturationDeltaFactor;
}

- (void)set_saturationDeltaFactor:(double)a3
{
  self->__saturationDeltaFactor = a3;
}

- (BOOL)_backdropVisible
{
  return self->__backdropVisible;
}

- (void)set_backdropVisible:(BOOL)a3
{
  self->__backdropVisible = a3;
}

@end
