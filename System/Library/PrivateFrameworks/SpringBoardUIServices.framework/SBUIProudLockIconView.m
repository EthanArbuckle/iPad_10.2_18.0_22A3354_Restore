@implementation SBUIProudLockIconView

- (SBUIProudLockIconView)initWithFrame:(CGRect)a3
{
  SBUIProudLockIconView *v3;
  SBUIProudLockIconView *v4;
  UIView *v5;
  UIView *iconContainerView;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BSUICAPackageView *lockView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSSet *imageLayers;
  uint64_t v23;
  NSSet *shadowImageLayers;
  uint64_t v25;
  NSSet *shadowFilterLayers;
  void *v27;
  uint64_t v28;
  SBUIFaceIDCameraGlyphView *v29;
  SBUIFaceIDCameraGlyphView *cameraCoveredView;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)SBUIProudLockIconView;
  v3 = -[SBUIProudLockIconView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_allowsAlongsideCoaching = 1;
    v3->_pearlGlyphStyle = 3;
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    iconContainerView = v4->_iconContainerView;
    v4->_iconContainerView = v5;

    -[SBUIProudLockIconView addSubview:](v4, "addSubview:", v4->_iconContainerView);
    v7 = objc_alloc(MEMORY[0x1E0D01910]);
    -[SBUIProudLockIconView fileNameForCurrentDevice](v4, "fileNameForCurrentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithPackageName:inBundle:", v8, v9);
    lockView = v4->_lockView;
    v4->_lockView = (BSUICAPackageView *)v10;

    -[BSUICAPackageView layer](v4->_lockView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 1);

    -[UIView addSubview:](v4->_iconContainerView, "addSubview:", v4->_lockView);
    -[SBUIProudLockIconView layer](v4, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsGroupOpacity:", 1);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUICAPackageView layer](v4->_lockView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __39__SBUIProudLockIconView_initWithFrame___block_invoke;
    v32[3] = &unk_1E4C3ED88;
    v18 = v14;
    v33 = v18;
    v19 = v15;
    v34 = v19;
    v20 = v16;
    v35 = v20;
    -[SBUIProudLockIconView _forEachLayerInHierarchy:perform:](v4, "_forEachLayerInHierarchy:perform:", v17, v32);

    v21 = objc_msgSend(v18, "copy");
    imageLayers = v4->_imageLayers;
    v4->_imageLayers = (NSSet *)v21;

    v23 = objc_msgSend(v19, "copy");
    shadowImageLayers = v4->_shadowImageLayers;
    v4->_shadowImageLayers = (NSSet *)v23;

    v25 = objc_msgSend(v20, "copy");
    shadowFilterLayers = v4->_shadowFilterLayers;
    v4->_shadowFilterLayers = (NSSet *)v25;

    -[BSUICAPackageView setHidden:](v4->_lockView, "setHidden:", 0);
    -[SBUIProudLockIconView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("proud-lock"));
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "userInterfaceIdiom");

      if (v28 != 1)
      {
LABEL_7:
        -[SBUIProudLockIconView addSubview:](v4, "addSubview:", v4->_cameraCoveredView);
        v4->_state = 0;
        -[SBUIProudLockIconView _transitionToState:animated:updateText:options:completion:](v4, "_transitionToState:animated:updateText:options:completion:", 0, 0, 1, 0, 0);

        return v4;
      }
    }
    v29 = objc_alloc_init(SBUIFaceIDCameraGlyphView);
    cameraCoveredView = v4->_cameraCoveredView;
    v4->_cameraCoveredView = v29;

    goto LABEL_7;
  }
  return v4;
}

void __39__SBUIProudLockIconView_initWithFrame___block_invoke(id *a1, void *a2)
{
  void *v3;
  id *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("shackle"))
    || objc_msgSend(v3, "isEqualToString:", CFSTR("body")))
  {
    v4 = a1 + 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("shadow")))
  {
    v4 = a1 + 5;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("filter")))
      goto LABEL_5;
    v4 = a1 + 6;
  }
  objc_msgSend(*v4, "addObject:", v5);
LABEL_5:

}

- (id)fileNameForCurrentDevice
{
  void *v2;
  int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v3 = BSFloatEqualToFloat();

  v4 = CFSTR("@3x");
  if (v3)
    v4 = CFSTR("@2x");
  v5 = v4;
  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPoseidonSupport");

  v8 = &stru_1E4C40DE8;
  if ((MGGetBoolAnswer() & 1) != 0 || v7)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
        v8 = CFSTR("-120fps");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "userInterfaceIdiom") == 1)
        v8 = CFSTR("-120fps");

    }
  }
  v10 = v8;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_14:
      v11 = CFSTR("~ipad");
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 == 1)
      goto LABEL_14;
  }
  v11 = &stru_1E4C40DE8;
  v14 = SBFEffectiveArtworkSubtype();
  if (v14 <= 2795)
  {
    if (v14 != 2556 && v14 != 2622)
      goto LABEL_23;
LABEL_22:
    v11 = CFSTR("-d73");
    goto LABEL_23;
  }
  if (v14 == 2868 || v14 == 2796)
    goto LABEL_22;
LABEL_23:
  if (!-[__CFString length](v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
    if (BSFloatEqualToFloat())
      v11 = CFSTR("-896h");
    else
      v11 = CFSTR("-812h");
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lock%@%@%@"), v5, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setState:(int64_t)a3
{
  -[SBUIProudLockIconView setState:animated:](self, "setState:animated:", a3, 1);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  -[SBUIProudLockIconView setState:animated:completion:](self, "setState:animated:completion:", a3, a4, 0);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[SBUIProudLockIconView setState:animated:updateText:options:completion:](self, "setState:animated:updateText:options:completion:", a3, a4, 1, 0, a5);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = v12;
  if (self->_state != a3)
  {
    v14 = v12;
    -[SBUIProudLockIconView _transitionToState:animated:updateText:options:completion:](self, "_transitionToState:animated:updateText:options:completion:", a3, v9, v8, a6);
    goto LABEL_5;
  }
  if (v12)
  {
    v14 = v12;
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
LABEL_5:
    v13 = v14;
  }

}

- (void)setOverrideSize:(CGSize)a3 offset:(CGPoint)a4 extent:(double)a5
{
  self->_overridesSizing = 1;
  self->_overrideSize = a3;
  self->_overrideOffset = a4;
  self->_overrideExtent = a5;
  -[SBUIProudLockIconView setNeedsLayout](self, "setNeedsLayout");
  -[SBUIProudLockIconView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setOverrideGlyphStyle:(int64_t)a3
{
  int64_t v3;

  if (a3)
  {
    if (a3 != 1)
      return;
    v3 = 4;
  }
  else
  {
    v3 = 3;
  }
  if (v3 != self->_pearlGlyphStyle)
  {
    self->_pearlGlyphStyle = v3;
    -[SBUIProudLockIconView _resetPearlGlyphView](self, "_resetPearlGlyphView");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;
  _UILegibilitySettings **p_legibilitySettings;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    SBLogLockScreenBiometricFaceIDCoaching();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_1A471F000, v8, OS_LOG_TYPE_DEFAULT, "[Legibility] Updating to legibility settings: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[SBUIProudLockIconView setLegibilitySettings:].cold.1(v8);
    }

    -[_UILegibilitySettings primaryColor](*p_legibilitySettings, "primaryColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIProudLockIconView setContentColor:](self, "setContentColor:", v9);

    -[SBUIProudLockIconView _configureShadowFromLegibilitySettings:](self, "_configureShadowFromLegibilitySettings:", v5);
    -[SBUIProudLockIconView _faceIDCoachingView](self, "_faceIDCoachingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLegibilitySettings:", *p_legibilitySettings);

    -[SBUIProudLockIconView cameraCoveredView](self, "cameraCoveredView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLegibilitySettings:", *p_legibilitySettings);

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
  double height;
  id *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double Width;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  LAUIPearlGlyphView *lazy_pearlGlyphView;
  double overrideExtent;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  SBUIProudLockIconView *v68;
  SBUIFaceIDCameraGlyphView *cameraCoveredView;
  void *v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  objc_super v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v76.receiver = self;
  v76.super_class = (Class)SBUIProudLockIconView;
  -[SBUIProudLockIconView layoutSubviews](&v76, sel_layoutSubviews);
  -[SBUIProudLockIconView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  height = v9;
  v11 = (id *)MEMORY[0x1E0CEB258];
  v12 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1 || (unint64_t)(v12 - 3) > 1)
  {
    v16 = v8 * 0.5;
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockCenterFromTopOfScreen");
    v18 = v17;
  }
  else
  {
    if (v12 == 3)
    {
      objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockCenterFromTopOfScreen");
      v16 = v19;
    }
    else
    {
      v77.origin.x = v4;
      v77.origin.y = v6;
      v77.size.width = v8;
      v77.size.height = height;
      Width = CGRectGetWidth(v77);
      objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockCenterFromTopOfScreen");
      v16 = Width - v21;
    }
    v18 = height * 0.5;
  }
  if (self->_overridesSizing)
  {
    v8 = self->_overrideSize.width;
    height = self->_overrideSize.height;
    v16 = v8 * 0.5;
    v18 = height * 0.5;
    v6 = 0.0;
    v4 = 0.0;
  }
  -[UIView setBounds:](self->_iconContainerView, "setBounds:", v4, v6, v8, height);
  if (self->_overridesSizing)
  {
    v22 = self->_overrideSize.width * 1.13;
    v23 = self->_overrideSize.height * 1.13;
    v24 = self->_overrideSize.width * 0.5 + self->_overrideOffset.x;
    v25 = v18 + self->_overrideOffset.y;
  }
  else
  {
    v24 = v8 * 0.5;
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
    v22 = v26;
    v23 = v27;
    v25 = height * 0.5 - (v27 - floor(v27)) * 0.5;
  }
  -[BSUICAPackageView setBounds:](self->_lockView, "setBounds:", 0.0, 0.0, v22, v23);
  -[BSUICAPackageView setCenter:](self->_lockView, "setCenter:", v24, v25);
  lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
  if (lazy_pearlGlyphView)
  {
    if (self->_overridesSizing)
    {
      overrideExtent = self->_overrideExtent;
    }
    else
    {
      v25 = v25 + 2.333333;
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "userInterfaceIdiom");

      if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        overrideExtent = 26.6666667;
      else
        overrideExtent = 20.0;
      lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
    }
    -[LAUIPearlGlyphView setBounds:](lazy_pearlGlyphView, "setBounds:", 0.0, 0.0, overrideExtent, overrideExtent);
    -[LAUIPearlGlyphView setCenter:](self->_lazy_pearlGlyphView, "setCenter:", v24, v25);
  }
  v75 = v16;
  -[SBUIProudLockIconView _smallLockSize](self, "_smallLockSize");
  v33 = v32;
  v74 = v34;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v78.origin.x = v37;
  v78.origin.y = v39;
  v78.size.width = v41;
  v78.size.height = v43;
  v44 = CGRectGetWidth(v78);
  v79.origin.x = v37;
  v79.origin.y = v39;
  v79.size.width = v41;
  v79.size.height = v43;
  v45 = CGRectGetHeight(v79);
  if (v44 < v45)
    v45 = v44;
  v46 = v45 + -32.0 - v33;
  -[SBUIProudLockIconView _lockToCoachingSpacing](self, "_lockToCoachingSpacing");
  -[SBUIFaceIDCoachingView setBounds:](self->_lazy_faceIDCoachingView, "setBounds:", 0.0, 0.0, v46 - v47, 40.0);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "scale");
  v50 = v49;

  if (!self->_changingAllowsAlongsideCoaching)
    -[SBUIFaceIDCoachingView stringWidth](self->_lazy_faceIDCoachingView, "stringWidth");
  BSFloatRoundForScale();
  v52 = v51;
  -[SBUIProudLockIconView window](self, "window");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUICAPackageView bounds](self->_lockView, "bounds");
  objc_msgSend(v53, "convertRect:fromView:", self->_lockView);
  v55 = v54;
  v57 = v56;

  if (self->_allowsAlongsideCoaching)
  {
    v58 = v55;
    if (!self->_changingAllowsAlongsideCoaching)
    {
      -[SBUIProudLockIconView _lockToCoachingSpacing](self, "_lockToCoachingSpacing");
      v58 = v52 + v55 + v59;
    }
  }
  else
  {
    v58 = v55;
  }
  if (!SBUIProudLockIconViewStateShowsCoachingText(self->_state)
    || self->_performingIncomingLayout
    || self->_changingAllowsAlongsideCoaching)
  {
    v60 = v75;
  }
  else
  {
    v71 = v58 - v55;
    v72 = objc_msgSend(*v11, "userInterfaceLayoutDirection");
    v73 = -(v71 * 0.5);
    if (v72 != 1)
      v73 = v71 * 0.5;
    v60 = v75 - v73;
    v18 = v18 + (round(v50 * (v18 + v57 * 0.5)) - v50 * (v18 + v57 * 0.5)) / v50;
  }
  -[UIView setCenter:](self->_iconContainerView, "setCenter:", v60, v18);
  v61 = objc_msgSend(*v11, "userInterfaceLayoutDirection");
  -[SBUIProudLockIconView _lockToCoachingSpacing](self, "_lockToCoachingSpacing");
  v63 = (v33 + v52) * 0.5 + v62 + -1.5;
  if (v61 == 1)
    v63 = -v63;
  v64 = v60 + v63;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "scale");
  v67 = v66;

  -[SBUIFaceIDCoachingView setCenter:](self->_lazy_faceIDCoachingView, "setCenter:", v64, v18 + round(v74 * v50 / 30.0) / v67);
  -[SBUIFaceIDCameraGlyphView superview](self->_cameraCoveredView, "superview");
  v68 = (SBUIProudLockIconView *)objc_claimAutoreleasedReturnValue();

  if (v68 == self)
  {
    cameraCoveredView = self->_cameraCoveredView;
    -[SBUIFaceIDCameraGlyphView superview](cameraCoveredView, "superview");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bounds");
    -[SBUIFaceIDCameraGlyphView setFrame:](cameraCoveredView, "setFrame:");

  }
}

- (double)proudLockLandscapeOffset
{
  double result;

  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockLandscapeOffset");
  return result;
}

- (BOOL)allowsAlongsideCoaching
{
  return self->_allowsAlongsideCoaching;
}

- (void)setAllowsAlongsideCoaching:(BOOL)a3
{
  _QWORD v4[5];

  if (self->_allowsAlongsideCoaching != a3)
  {
    self->_allowsAlongsideCoaching = a3;
    self->_changingAllowsAlongsideCoaching = 1;
    -[SBUIFaceIDCoachingView setCoachingCondition:](self->_lazy_faceIDCoachingView, "setCoachingCondition:", 1);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__SBUIProudLockIconView_setAllowsAlongsideCoaching___block_invoke;
    v4[3] = &unk_1E4C3E408;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v4);
    self->_changingAllowsAlongsideCoaching = 0;
  }
}

uint64_t __52__SBUIProudLockIconView_setAllowsAlongsideCoaching___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 498))
  {
    objc_msgSend(*(id *)(v2 + 488), "setHidden:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v2, "setNeedsLayout");
  result = objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 498))
    return objc_msgSend(*(id *)(v4 + 488), "setHidden:", 1);
  return result;
}

- (void)setContentColor:(id)a3
{
  UIColor *v5;
  UIColor **p_contentColor;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  SBUIProudLockIconView *v21;
  UIColor *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (UIColor *)a3;
  p_contentColor = &self->_contentColor;
  if (self->_contentColor != v5)
  {
    v22 = v5;
    objc_storeStrong((id *)&self->_contentColor, a3);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = self;
    v7 = self->_imageLayers;
    v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v8)
      goto LABEL_24;
    v9 = v8;
    v10 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "name", v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("body")))
        {
          v14 = objc_opt_class();
          v15 = v12;
          if (v14)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = v15;
            else
              v16 = 0;
          }
          else
          {
            v16 = 0;
          }
          v20 = v16;

          objc_msgSend(v20, "setFillColor:", -[UIColor cgColor](*p_contentColor, "cgColor"));
        }
        else
        {
          if (!objc_msgSend(v13, "isEqualToString:", CFSTR("shackle")))
            goto LABEL_22;
          v17 = objc_opt_class();
          v18 = v12;
          if (v17)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
          }
          else
          {
            v19 = 0;
          }
          v20 = v19;

          objc_msgSend(v20, "setStrokeColor:", -[UIColor cgColor](*p_contentColor, "cgColor"));
        }

LABEL_22:
      }
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v9)
      {
LABEL_24:

        -[LAUIPearlGlyphView setFinishedColor:animated:](v21->_lazy_pearlGlyphView, "setFinishedColor:animated:", *p_contentColor, 0);
        v5 = v22;
        break;
      }
    }
  }

}

- (void)_configureShadowFromLegibilitySettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "shadowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "style");
  v7 = (id *)MEMORY[0x1E0CD2C30];
  if (v6 != 1)
    v7 = (id *)MEMORY[0x1E0CD2DE0];
  v8 = *v7;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_shadowImageLayers;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v14, "superlayer", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAllowsGroupBlending:", 0);

        objc_msgSend(v14, "setShadowColor:", objc_msgSend(v5, "cgColor"));
        objc_msgSend(v14, "setCompositingFilter:", v8);
      }
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)_forEachLayerInHierarchy:(id)a3 perform:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v7[2](v7, v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "sublayers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[SBUIProudLockIconView _forEachLayerInHierarchy:perform:](self, "_forEachLayerInHierarchy:perform:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_transitionToState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  int v61;
  int v62;
  id v63;
  id v64;
  void (**v65)(_QWORD, _QWORD);
  void (**v66)(_QWORD, _QWORD);
  NSObject *v67;
  void (**v68)(_QWORD, _QWORD, _QWORD);
  void *v69;
  void *v70;
  id v71;
  unsigned __int8 v72;
  id v73;
  _BOOL4 v74;
  unint64_t state;
  _BOOL4 v76;
  _QWORD v77[4];
  NSObject *v78;
  _QWORD v79[5];
  _QWORD v80[4];
  NSObject *v81;
  _QWORD v82[4];
  id v83;
  SBUIProudLockIconView *v84;
  int64_t v85;
  char v86;
  BOOL v87;
  _QWORD v88[4];
  NSObject *v89;
  _QWORD v90[4];
  id v91;
  SBUIProudLockIconView *v92;
  unint64_t v93;
  char v94;
  BOOL v95;
  _OWORD v96[3];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[4];
  void (**v105)(_QWORD, _QWORD, _QWORD);
  _QWORD v106[4];
  NSObject *v107;
  _QWORD v108[4];
  id v109;
  uint64_t v110;
  char v111;
  BOOL v112;
  _QWORD v113[4];
  NSObject *v114;
  _QWORD v115[4];
  id v116;
  char v117;
  BOOL v118;
  _QWORD v119[4];
  NSObject *v120;
  SBUIProudLockIconView *v121;
  BOOL v122;
  BOOL v123;
  _QWORD v124[6];
  BOOL v125;
  _QWORD v126[4];
  NSObject *v127;
  SBUIProudLockIconView *v128;
  _QWORD *v129;
  BOOL v130;
  _QWORD block[5];
  id v132;
  id v133;
  id v134;
  id v135;
  _QWORD *v136;
  _QWORD v137[3];
  char v138;
  _BYTE v139[128];
  uint64_t v140;

  v76 = a4;
  v140 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v137[0] = 0;
  v137[1] = v137;
  v137[2] = 0x2020000000;
  v138 = 0;
  state = self->_state;
  self->_state = a3;
  if ((a6 & 2) != 0)
  {
    -[SBUIProudLockIconView _resetPearlGlyphView](self, "_resetPearlGlyphView");
    -[SBUIProudLockIconView _resetfaceIDCoachingView](self, "_resetfaceIDCoachingView");
    -[SBUIProudLockIconView _resetCameraGlyphView](self, "_resetCameraGlyphView");
  }
  -[SBUIProudLockIconView _activeViewsForState:](self, "_activeViewsForState:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIProudLockIconView _activeViewsForState:](self, "_activeViewsForState:", state);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v14, "removeObjectsInArray:", v13);
  v69 = v14;
  v15 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v15, "removeObjectsInArray:", v12);
  v16 = a3 == 5 && state == 4 || a3 == 4 && state == 5 || a3 == 19 || state == 19;
  v74 = v16;
  v72 = objc_msgSend(v12, "isEqualToArray:", v13);
  v70 = v15;
  v18 = v11;
  v62 = SBUIProudLockIconViewStateShowsCoachingText(state);
  v61 = SBUIProudLockIconViewStateShowsCoachingText(a3);
  v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  dispatch_group_enter(v19);
  dispatch_group_enter(v19);
  dispatch_group_enter(v19);
  dispatch_group_enter(v19);
  v20 = (void *)objc_opt_new();
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke;
  block[3] = &unk_1E4C3EDD8;
  block[4] = self;
  v22 = v12;
  v132 = v22;
  v73 = v13;
  v133 = v73;
  v64 = v20;
  v134 = v64;
  v63 = v18;
  v135 = v63;
  v136 = v137;
  dispatch_group_notify(v19, MEMORY[0x1E0C80D38], block);
  v126[0] = v21;
  v126[1] = 3221225472;
  v126[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_3;
  v126[3] = &unk_1E4C3EE28;
  v23 = v19;
  v127 = v23;
  v128 = self;
  v130 = v76;
  v129 = v137;
  v65 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A1798](v126);
  v124[0] = MEMORY[0x1E0C809B0];
  v124[1] = 3221225472;
  v124[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_5;
  v124[3] = &unk_1E4C3EE70;
  v124[5] = a6;
  v124[4] = self;
  v125 = v76;
  v68 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A1798](v124);
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_8;
  v119[3] = &unk_1E4C3EE98;
  v24 = v23;
  v122 = a5;
  v120 = v24;
  v121 = self;
  v123 = v76;
  v66 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A1798](v119);
  if (v76)
  {
    -[SBUIProudLockIconView _alphaAnimationSettingsForTransitionFromViews:andState:toViews:andState:forIncomingViews:](self, "_alphaAnimationSettingsForTransitionFromViews:andState:toViews:andState:forIncomingViews:", v73, state, v22, a3, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)MEMORY[0x1E0D01908];
  v115[0] = v21;
  v115[1] = 3221225472;
  v115[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_9;
  v115[3] = &unk_1E4C3EAA8;
  v117 = v72 ^ 1;
  v118 = v74;
  v27 = v70;
  v116 = v27;
  v113[0] = v21;
  v113[1] = 3221225472;
  v113[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_10;
  v113[3] = &unk_1E4C3E510;
  v28 = v24;
  v114 = v28;
  objc_msgSend(v26, "animateWithSettings:actions:completion:", v25, v115, v113);
  -[SBUIProudLockIconView _alphaForActiveViewForState:](self, "_alphaForActiveViewForState:", a3);
  v30 = v29;
  if (v76)
  {
    -[SBUIProudLockIconView _alphaAnimationSettingsForTransitionFromViews:andState:toViews:andState:forIncomingViews:](self, "_alphaAnimationSettingsForTransitionFromViews:andState:toViews:andState:forIncomingViews:", v73, state, v22, a3, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  v32 = (void *)MEMORY[0x1E0D01908];
  v108[0] = v21;
  v108[1] = 3221225472;
  v108[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_11;
  v108[3] = &unk_1E4C3EEC0;
  v111 = v72 ^ 1;
  v112 = v74;
  v71 = v22;
  v109 = v71;
  v110 = v30;
  v106[0] = v21;
  v106[1] = 3221225472;
  v106[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_12;
  v106[3] = &unk_1E4C3E510;
  v67 = v28;
  v107 = v67;
  objc_msgSend(v32, "animateWithSettings:actions:completion:", v31, v108, v106);

  v33 = 0.0;
  v34 = CFSTR("Sleep");
  v35 = 1;
  switch(a3)
  {
    case 0:
      goto LABEL_41;
    case 1:
    case 19:
    case 20:
    case 21:
      v34 = CFSTR("Locked");
      goto LABEL_41;
    case 2:
      v34 = CFSTR("Unlocked");
      goto LABEL_41;
    case 3:
      if (v62 != v61)
      {
        v104[0] = MEMORY[0x1E0C809B0];
        v104[1] = 3221225472;
        v104[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_13;
        v104[3] = &unk_1E4C3EEE8;
        v105 = v68;
        v36 = (void *)MEMORY[0x1A85A1798](v104);
        objc_msgSend(v64, "addObject:", v36);

      }
      else
      {
        v34 = CFSTR("Error");
LABEL_41:
        ((void (**)(_QWORD, const __CFString *, NSObject *))v68)[2](v68, v34, v67);
      }
      goto LABEL_42;
    case 4:
    case 9:
    case 13:
    case 14:
    case 15:
      goto LABEL_21;
    case 5:
      v35 = 2;
      goto LABEL_21;
    case 6:
      v35 = 3;
      goto LABEL_21;
    case 7:
      v35 = 4;
LABEL_21:
      v65[2](v65, v35);
      goto LABEL_42;
    case 8:
    case 16:
      ((void (**)(_QWORD, const __CFString *, NSObject *))v68)[2](v68, CFSTR("Locked"), v67);
      v37 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(self->_state);
      v66[2](v66, v37);
      goto LABEL_42;
    case 10:
      v38 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(10);
      v66[2](v66, v38);
      goto LABEL_42;
    case 11:
      v39 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(11);
      v66[2](v66, v39);
      v33 = 0.5;
      v40 = 2;
      goto LABEL_43;
    case 12:
      v41 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(12);
      v66[2](v66, v41);
      v33 = 0.5;
      goto LABEL_34;
    case 17:
      v66[2](v66, 12);
      goto LABEL_42;
    case 18:
      v66[2](v66, 12);
LABEL_34:
      v40 = 1;
      goto LABEL_43;
    case 22:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled())
        v42 = 14;
      else
        v42 = 1;
      v66[2](v66, v42);
      goto LABEL_42;
    default:
LABEL_42:
      v40 = 0;
LABEL_43:
      -[SBUIFaceIDCameraGlyphView setState:delay:](self->_cameraCoveredView, "setState:delay:", v40, v33);
      if (((v72 ^ 1) & 1) != 0 || v74)
      {
        v43 = v27;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v44 = v69;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v100, v139, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v101;
          do
          {
            for (i = 0; i != v45; ++i)
            {
              if (*(_QWORD *)v101 != v46)
                objc_enumerationMutation(v44);
              v48 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
              v98 = 0u;
              v99 = 0u;
              v97 = 0u;
              -[SBUIProudLockIconView _incomingTransformForActiveView:forState:](self, "_incomingTransformForActiveView:forState:", v48, a3);
              v96[0] = v97;
              v96[1] = v98;
              v96[2] = v99;
              objc_msgSend(v48, "setTransform:", v96);
            }
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v100, v139, 16);
          }
          while (v45);
        }

        v27 = v43;
      }
      if (v76)
      {
        -[SBUIProudLockIconView _transformAnimationSettingsForTransitionFromViews:andState:toViews:andState:forIncomingViews:](self, "_transformAnimationSettingsForTransitionFromViews:andState:toViews:andState:forIncomingViews:", v73, state, v71, a3, 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = 0;
      }
      v50 = (void *)MEMORY[0x1E0D01908];
      v51 = MEMORY[0x1E0C809B0];
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_14;
      v90[3] = &unk_1E4C3EF10;
      v94 = v72 ^ 1;
      v95 = v74;
      v52 = v27;
      v91 = v52;
      v92 = self;
      v93 = state;
      v88[0] = v51;
      v88[1] = 3221225472;
      v88[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_15;
      v88[3] = &unk_1E4C3E510;
      v53 = v67;
      v89 = v53;
      objc_msgSend(v50, "animateWithSettings:actions:completion:", v49, v90, v88);
      if (v76)
      {
        -[SBUIProudLockIconView _transformAnimationSettingsForTransitionFromViews:andState:toViews:andState:forIncomingViews:](self, "_transformAnimationSettingsForTransitionFromViews:andState:toViews:andState:forIncomingViews:", v73, state, v71, a3, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v54 = 0;
      }
      v55 = (void *)MEMORY[0x1E0D01908];
      v82[0] = v51;
      v82[1] = 3221225472;
      v82[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_16;
      v82[3] = &unk_1E4C3EF10;
      v86 = v72 ^ 1;
      v87 = v74;
      v56 = v71;
      v83 = v56;
      v84 = self;
      v85 = a3;
      v80[0] = v51;
      v80[1] = 3221225472;
      v80[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_17;
      v80[3] = &unk_1E4C3E510;
      v57 = v53;
      v81 = v57;
      objc_msgSend(v55, "animateWithSettings:actions:completion:", v54, v82, v80);

      if ((v72 & 1) == 0
        && self->_lazy_faceIDCoachingView
        && objc_msgSend(v56, "containsObject:")
        && self->_allowsAlongsideCoaching)
      {
        self->_performingIncomingLayout = 1;
        -[SBUIProudLockIconView setNeedsLayout](self, "setNeedsLayout");
        -[SBUIProudLockIconView layoutIfNeeded](self, "layoutIfNeeded");
        self->_performingIncomingLayout = 0;
      }
      -[SBUIProudLockIconView setNeedsLayout](self, "setNeedsLayout");
      if (v76)
      {
        -[SBUIProudLockIconView _layoutAnimationSettingsForTransitionFromViews:andState:toViews:andState:](self, "_layoutAnimationSettingsForTransitionFromViews:andState:toViews:andState:", v73, state, v56, a3);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v58 = 0;
      }
      v59 = (void *)MEMORY[0x1E0D01908];
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_18;
      v79[3] = &unk_1E4C3E408;
      v79[4] = self;
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_19;
      v77[3] = &unk_1E4C3E510;
      v60 = v57;
      v78 = v60;
      objc_msgSend(v59, "animateWithSettings:actions:completion:", v58, v79, v77);

      _Block_object_dispose(v137, 8);
      return;
  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activeViewsForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 472);
  if (v3
    && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) & 1) == 0
    && (objc_msgSend(v2, "containsObject:", v3) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 48), "containsObject:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetPearlGlyphView");
  }
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 488);
  if (v4
    && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4) & 1) == 0
    && (objc_msgSend(v2, "containsObject:", v4) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 48), "containsObject:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetfaceIDCoachingView");
  }
  v5 = dispatch_group_create();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = *(id *)(a1 + 56);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_2;
  v13[3] = &unk_1E4C3EDB0;
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v14 = v11;
  v15 = v12;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v13);

}

uint64_t __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return result;
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_pearlGlyphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_4;
  v6[3] = &unk_1E4C3EE00;
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setState:animated:withCompletion:", a2, v5, v6);

}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  char v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("Unlocked"));
  v8 = *(_QWORD *)(a1 + 40);
  dispatch_group_enter(v6);
  if (v7)
    kdebug_trace();
  v9 = 2.0;
  if ((v8 & 1) == 0)
    v9 = 1.0;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v11 = MEMORY[0x1E0C809B0];
  v12 = *(unsigned __int8 *)(a1 + 48);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_6;
  v17[3] = &__block_descriptor_33_e8_v12__0B8l;
  v18 = v7;
  objc_msgSend(v10, "setState:animated:transitionSpeed:completion:", v5, v12, v17, v9);
  v13 = dispatch_time(0, 150000000);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_7;
  v15[3] = &unk_1E4C3E408;
  v16 = v6;
  v14 = v6;
  dispatch_after(v13, MEMORY[0x1E0C80D38], v15);

}

uint64_t __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_6(uint64_t result)
{
  if (*(_BYTE *)(result + 32))
    return kdebug_trace();
  return result;
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v4;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "_faceIDCoachingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCoachingCondition:animated:delay:", a2, *(unsigned __int8 *)(a1 + 49), 0.18);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_9(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41))
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = *(id *)(a1 + 32);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAlpha:", 0.0, (_QWORD)v6);
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_10(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_11(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setAlpha:", *(double *)(a1 + 40), (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_12(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_14(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56) || *(_BYTE *)(a1 + 57))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v11 = 0u;
          v12 = 0u;
          v10 = 0u;
          v8 = *(void **)(a1 + 40);
          if (v8)
            objc_msgSend(v8, "_outgoingTransformForView:fromState:", v7, *(_QWORD *)(a1 + 48));
          v9[0] = v10;
          v9[1] = v11;
          v9[2] = v12;
          objc_msgSend(v7, "setTransform:", v9);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_15(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_16(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56) || *(_BYTE *)(a1 + 57))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v11 = 0u;
          v12 = 0u;
          v10 = 0u;
          v8 = *(void **)(a1 + 40);
          if (v8)
            objc_msgSend(v8, "_transformForActiveView:forState:", v7, *(_QWORD *)(a1 + 48));
          v9[0] = v10;
          v9[1] = v11;
          v9[2] = v12;
          objc_msgSend(v7, "setTransform:", v9);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_17(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_19(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_transformAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6 forIncomingViews:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  BOOL v24;
  int v25;
  void *v26;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = objc_msgSend(v13, "isEqualToArray:", v12);
  v19 = v14 ^ 1;
  if (a4 != 1)
    v19 = 0;
  if (a6 != 4 || !v19)
  {
    v24 = a4 == 4 && a6 == 2;
    v25 = !v7;
    if (!v24)
      v25 = 1;
    if (((v25 | v14) & 1) != 0)
    {
      if (!v19 || !SBUIProudLockIconViewStateShowsCoachingText(a6) || !v7)
      {
        -[SBUIProudLockIconView _defaultAnimationSettingsForTransitionFromViews:andState:toViews:andState:](self, "_defaultAnimationSettingsForTransitionFromViews:andState:toViews:andState:", v12, a4, v13, a6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      v20 = (void *)MEMORY[0x1E0CD27D0];
      LODWORD(v15) = 1054280253;
      LODWORD(v17) = 1061494456;
      LODWORD(v18) = 1062836634;
      LODWORD(v16) = 0;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CD27D0];
      LODWORD(v15) = 1043207291;
      LODWORD(v16) = 1038174126;
      LODWORD(v17) = 1057300152;
      LODWORD(v18) = 1064682127;
    }
    goto LABEL_19;
  }
  v20 = (void *)MEMORY[0x1E0CD27D0];
  if (!v7)
  {
    LODWORD(v15) = 1056293519;
    LODWORD(v16) = 0;
    LODWORD(v17) = 1.0;
    LODWORD(v18) = 1.0;
LABEL_19:
    objc_msgSend(v20, "functionWithControlPoints::::", v15, v16, v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0D016B0];
    v23 = 0.27;
    goto LABEL_20;
  }
  LODWORD(v15) = 1048911544;
  LODWORD(v17) = 1056293519;
  LODWORD(v16) = 1.0;
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v15, v16, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D016B0];
  v23 = 0.56;
LABEL_20:
  objc_msgSend(v22, "settingsWithDuration:timingFunction:", v21, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v26;
}

- (id)_alphaAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6 forIncomingViews:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  int v14;
  void *v15;
  double v16;
  void *v17;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = objc_msgSend(v13, "isEqualToArray:", v12);
  if (a6 == 4 && a4 == 1 && !v14)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v16 = 0.1;
    else
      v16 = 0.27;
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:timingFunction:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBUIProudLockIconView _defaultAnimationSettingsForTransitionFromViews:andState:toViews:andState:](self, "_defaultAnimationSettingsForTransitionFromViews:andState:toViews:andState:", v12, a4, v13, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_defaultAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  char v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v9, "isEqualToArray:", v8) & 1) != 0)
    goto LABEL_2;
  v13 = objc_msgSend(v9, "containsObject:", self->_lockView);
  if (self->_lazy_faceIDCoachingView)
  {
    v14 = objc_msgSend(v8, "containsObject:");
    if (!v13)
      goto LABEL_2;
  }
  else
  {
    v14 = 0;
    if (!v13)
      goto LABEL_2;
  }
  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D016B0];
    v12 = 0.2;
    goto LABEL_9;
  }
LABEL_2:
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D016B0];
  v12 = 0.4;
LABEL_9:
  objc_msgSend(v11, "settingsWithDuration:timingFunction:", v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_layoutAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  LODWORD(v6) = 1048911544;
  LODWORD(v7) = 1041194025;
  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a3, a4, a5, a6, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:delay:timingFunction:", v10, 0.63, 0.12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_activeViewsForState:(int64_t)a3
{
  _QWORD *p_isa;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD v29[2];
  uint64_t v30;
  _QWORD v31[3];

  p_isa = &self->super.super.super.isa;
  v31[2] = *MEMORY[0x1E0C80C00];
  v5 = -[SBUIProudLockIconView allowsAlongsideCoaching](self, "allowsAlongsideCoaching");
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      v18 = p_isa[53];
      v31[0] = p_isa[54];
      v31[1] = v18;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = v31;
      goto LABEL_13;
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
    case 13:
    case 14:
    case 15:
      v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1 || (unint64_t)(v11 - 3) >= 2)
        objc_msgSend(p_isa, "_pearlGlyphViewIfExists");
      else
        objc_msgSend(p_isa, "_pearlGlyphView");
      v20 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v20;
      if (v20)
      {
        v21 = p_isa[53];
        v29[0] = v20;
        v29[1] = v21;
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = v29;
        v10 = 2;
      }
      else
      {
        v30 = p_isa[53];
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = &v30;
        v10 = 1;
      }
      goto LABEL_17;
    case 8:
    case 10:
    case 11:
    case 12:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
      if (v5)
      {
        v28[0] = p_isa[54];
        objc_msgSend(p_isa, "_faceIDCoachingView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = p_isa[53];
        v28[1] = v6;
        v28[2] = v7;
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = v28;
        goto LABEL_4;
      }
      v15 = p_isa[53];
      v27[0] = p_isa[54];
      v27[1] = v15;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = v27;
      goto LABEL_13;
    case 22:
      if ((_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled() & v5 & 1) != 0)
      {
        v26[0] = p_isa[54];
        objc_msgSend(p_isa, "_faceIDCoachingView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = p_isa[53];
        v26[1] = v6;
        v26[2] = v22;
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = v26;
LABEL_4:
        v10 = 3;
LABEL_17:
        objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
        p_isa = (_QWORD *)objc_claimAutoreleasedReturnValue();

        return p_isa;
      }
      else
      {
        v23 = p_isa[53];
        v24 = p_isa[54];
        v25 = v23;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = &v24;
LABEL_13:
        objc_msgSend(v16, "arrayWithObjects:count:", v17, 2, v24, v25);
        return (id)objc_claimAutoreleasedReturnValue();
      }
    default:
      return p_isa;
  }
}

- (CGAffineTransform)_incomingTransformForActiveView:(SEL)a3 forState:(id)a4
{
  UIView *v8;
  UIView *v9;
  SBUIFaceIDCoachingView *lazy_faceIDCoachingView;
  BOOL v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  CGAffineTransform *result;
  UIView *v17;

  v8 = (UIView *)a4;
  if (a5 == 4)
  {
    v17 = v8;
    -[SBUIProudLockIconView _pearlGlyphViewIfExists](self, "_pearlGlyphViewIfExists");
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();

    v8 = v17;
    if (v9 == v17)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceIdiom");

      CGAffineTransformMakeScale(retstr, dbl_1A47AEDC0[(v15 & 0xFFFFFFFFFFFFFFFBLL) == 1], dbl_1A47AEDC0[(v15 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
      goto LABEL_11;
    }
  }
  lazy_faceIDCoachingView = self->_lazy_faceIDCoachingView;
  if (lazy_faceIDCoachingView)
    v11 = lazy_faceIDCoachingView == (SBUIFaceIDCoachingView *)v8;
  else
    v11 = 0;
  if (!v11 && self->_iconContainerView != v8)
  {
    v17 = v8;
    -[SBUIProudLockIconView _zoomedTransform](self, "_zoomedTransform");
LABEL_11:
    v8 = v17;
    goto LABEL_12;
  }
  v12 = MEMORY[0x1E0C9BAA8];
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
LABEL_12:

  return result;
}

- (CGAffineTransform)_transformForActiveView:(SEL)a3 forState:(id)a4
{
  int v8;
  UIView *v9;
  uint64_t v10;
  __int128 v11;
  CGAffineTransform *result;
  UIView *v13;

  v13 = (UIView *)a4;
  v8 = SBUIProudLockIconViewStateShowsCoachingText(a5);
  v9 = v13;
  if (v8 && self->_iconContainerView == v13)
  {
    -[SBUIProudLockIconView _zoomedTransform](self, "_zoomedTransform");
    v9 = v13;
  }
  else
  {
    v10 = MEMORY[0x1E0C9BAA8];
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v10 + 32);
  }

  return result;
}

- (CGAffineTransform)_outgoingTransformForView:(SEL)a3 fromState:(id)a4
{
  BSUICAPackageView *v8;
  BSUICAPackageView *v9;
  SBUIFaceIDCoachingView *lazy_faceIDCoachingView;
  BOOL v11;
  uint64_t v12;
  __int128 v13;
  CGAffineTransform *result;
  BSUICAPackageView *v15;
  BSUICAPackageView *v16;

  v8 = (BSUICAPackageView *)a4;
  if (a5 == 4
    && (v15 = v8,
        -[SBUIProudLockIconView _pearlGlyphViewIfExists](self, "_pearlGlyphViewIfExists"),
        v9 = (BSUICAPackageView *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8 = v15,
        v9 == v15)
    || ((lazy_faceIDCoachingView = self->_lazy_faceIDCoachingView) != 0
      ? (v11 = lazy_faceIDCoachingView == (SBUIFaceIDCoachingView *)v8)
      : (v11 = 0),
        v11 || (BSUICAPackageView *)self->_iconContainerView == v8 || self->_lockView != v8))
  {
    v12 = MEMORY[0x1E0C9BAA8];
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  }
  else
  {
    v16 = v8;
    -[SBUIProudLockIconView _zoomedTransform](self, "_zoomedTransform");
    v8 = v16;
  }

  return result;
}

- (CGAffineTransform)_zoomedTransform
{
  CGFloat v4;

  -[SBUIProudLockIconView _scaleAmountForZoom](self, "_scaleAmountForZoom");
  return CGAffineTransformMakeScale(retstr, v4, v4);
}

- (double)_scaleAmountForZoom
{
  double v2;
  double v3;
  double v4;

  -[SBUIProudLockIconView _smallLockSize](self, "_smallLockSize");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
  return v3 / v4;
}

- (CGSize)_practicalProudLockSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockAssetSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockScaleFactor");
  v7 = v5 * v6;
  v8 = v3 * v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGSize)_smallLockSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SBUIFaceIDCoachingView currentSizeCategory](self->_lazy_faceIDCoachingView, "currentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIProudLockIconView _smallLockSizeForTextSize:](self, "_smallLockSizeForTextSize:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_smallLockSizeForTextSize:(id)a3
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  CGSize result;

  v3 = (void *)MEMORY[0x1E0DA9E68];
  v4 = a3;
  objc_msgSend(v3, "proudLockAssetSize");
  v6 = v5;
  v8 = v7;
  v9 = v5 / v7;
  SBUICeilingCapHeightForCoachingTextForUIContentSizeCategory(v4);
  v11 = v10;

  v12 = v11 * 1.66666667;
  v13 = v12 * v9;
  v14 = BSSizeLessThanSize();
  if (v14)
    v15 = v13;
  else
    v15 = v6;
  if (v14)
    v16 = v12;
  else
    v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)_lockToCoachingSpacing
{
  double v2;

  -[SBUIProudLockIconView _smallLockSize](self, "_smallLockSize");
  return v2 * 0.5;
}

- (double)_alphaForActiveViewForState:(int64_t)a3
{
  return 1.0;
}

- (id)_pearlGlyphViewIfExists
{
  return self->_lazy_pearlGlyphView;
}

- (id)_pearlGlyphView
{
  LAUIPearlGlyphView *lazy_pearlGlyphView;
  void *v4;
  id v5;
  void *v6;
  LAUIPearlGlyphView *v7;
  LAUIPearlGlyphView *v8;
  LAUIPearlGlyphView *v9;
  LAUIPearlGlyphView *v10;
  void *v11;
  id pearlGlyphViewSharedResources;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
  if (!lazy_pearlGlyphView)
  {
    if (self->_pearlGlyphStyle == 4)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v4 = (void *)getLAUIPearlGlyphStaticConfigurationClass_softClass;
      v18 = getLAUIPearlGlyphStaticConfigurationClass_softClass;
      if (!getLAUIPearlGlyphStaticConfigurationClass_softClass)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __getLAUIPearlGlyphStaticConfigurationClass_block_invoke;
        v14[3] = &unk_1E4C3E458;
        v14[4] = &v15;
        __getLAUIPearlGlyphStaticConfigurationClass_block_invoke((uint64_t)v14);
        v4 = (void *)v16[3];
      }
      v5 = objc_retainAutorelease(v4);
      _Block_object_dispose(&v15, 8);
      v6 = (void *)objc_msgSend(v5, "createSystemApertureConfiguration");
      v7 = (LAUIPearlGlyphView *)objc_msgSend(objc_alloc((Class)getLAUIPearlGlyphViewClass()), "initWithConfiguration:", v6);
      v8 = self->_lazy_pearlGlyphView;
      self->_lazy_pearlGlyphView = v7;

      -[LAUIPearlGlyphView setFaceVisibility:animated:](self->_lazy_pearlGlyphView, "setFaceVisibility:animated:", 7, 0);
    }
    else
    {
      v9 = (LAUIPearlGlyphView *)objc_msgSend(objc_alloc((Class)getLAUIPearlGlyphViewClass()), "initWithStyle:", self->_pearlGlyphStyle);
      v10 = self->_lazy_pearlGlyphView;
      self->_lazy_pearlGlyphView = v9;

      -[LAUIPearlGlyphView setFaceVisibility:animated:](self->_lazy_pearlGlyphView, "setFaceVisibility:animated:", 0, 0);
    }
    -[LAUIPearlGlyphView setFeedbackEnabled:](self->_lazy_pearlGlyphView, "setFeedbackEnabled:", 0);
    -[UIView addSubview:](self->_iconContainerView, "addSubview:", self->_lazy_pearlGlyphView);
    -[SBUIProudLockIconView setNeedsLayout](self, "setNeedsLayout");
    -[SBUIProudLockIconView layoutIfNeeded](self, "layoutIfNeeded");
    if (!self->_pearlGlyphViewSharedResources)
    {
      objc_msgSend(getLAUIPearlGlyphViewClass(), "sharedStaticResources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      pearlGlyphViewSharedResources = self->_pearlGlyphViewSharedResources;
      self->_pearlGlyphViewSharedResources = v11;

    }
    -[LAUIPearlGlyphView setFinishedColor:animated:](self->_lazy_pearlGlyphView, "setFinishedColor:animated:", self->_contentColor, 0);
    -[LAUIPearlGlyphView setHidden:](self->_lazy_pearlGlyphView, "setHidden:", 0);
    -[LAUIPearlGlyphView setAlpha:](self->_lazy_pearlGlyphView, "setAlpha:", 0.0);
    -[LAUIPearlGlyphView setState:animated:](self->_lazy_pearlGlyphView, "setState:animated:", 6, 0);
    lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
  }
  return lazy_pearlGlyphView;
}

- (id)_faceIDCoachingView
{
  SBUIFaceIDCoachingView *lazy_faceIDCoachingView;
  SBUIFaceIDCoachingView *v4;
  SBUIFaceIDCoachingView *v5;
  NSObject *v6;
  uint8_t v8[16];

  lazy_faceIDCoachingView = self->_lazy_faceIDCoachingView;
  if (!lazy_faceIDCoachingView)
  {
    v4 = objc_alloc_init(SBUIFaceIDCoachingView);
    v5 = self->_lazy_faceIDCoachingView;
    self->_lazy_faceIDCoachingView = v4;

    -[SBUIProudLockIconView addSubview:](self, "addSubview:", self->_lazy_faceIDCoachingView);
    -[SBUIProudLockIconView layoutIfNeeded](self, "layoutIfNeeded");
    SBLogLockScreenBiometricFaceIDCoaching();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "[Legibility] Creating FaceID coaching view", v8, 2u);
    }

    -[SBUIFaceIDCoachingView setLegibilitySettings:](self->_lazy_faceIDCoachingView, "setLegibilitySettings:", self->_legibilitySettings);
    -[SBUIFaceIDCoachingView setHidden:](self->_lazy_faceIDCoachingView, "setHidden:", -[SBUIProudLockIconView allowsAlongsideCoaching](self, "allowsAlongsideCoaching") ^ 1);
    -[SBUIFaceIDCoachingView setAlpha:](self->_lazy_faceIDCoachingView, "setAlpha:", 0.0);
    -[SBUIFaceIDCoachingView setCoachingCondition:](self->_lazy_faceIDCoachingView, "setCoachingCondition:", 1);
    lazy_faceIDCoachingView = self->_lazy_faceIDCoachingView;
  }
  return lazy_faceIDCoachingView;
}

- (void)_resetPearlGlyphView
{
  LAUIPearlGlyphView *lazy_pearlGlyphView;
  LAUIPearlGlyphView *v4;

  v4 = self->_lazy_pearlGlyphView;
  -[LAUIPearlGlyphView setState:animated:](v4, "setState:animated:", 6, 0);
  -[LAUIPearlGlyphView removeFromSuperview](self->_lazy_pearlGlyphView, "removeFromSuperview");
  lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
  self->_lazy_pearlGlyphView = 0;

}

- (void)_resetfaceIDCoachingView
{
  -[SBUIFaceIDCoachingView setCoachingCondition:animated:delay:](self->_lazy_faceIDCoachingView, "setCoachingCondition:animated:delay:", 1, 0, 0.0);
}

- (void)_resetCameraGlyphView
{
  -[SBUIFaceIDCameraGlyphView setState:](self->_cameraCoveredView, "setState:", 0);
}

- (int64_t)state
{
  return self->_state;
}

- (SBUIFaceIDCameraGlyphView)cameraCoveredView
{
  return self->_cameraCoveredView;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)durationOnCameraCoveredGlyphBeforeCoaching
{
  return self->_durationOnCameraCoveredGlyphBeforeCoaching;
}

- (void)setDurationOnCameraCoveredGlyphBeforeCoaching:(double)a3
{
  self->_durationOnCameraCoveredGlyphBeforeCoaching = a3;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_cameraCoveredView, 0);
  objc_storeStrong((id *)&self->_lazy_faceIDCoachingView, 0);
  objc_storeStrong(&self->_pearlGlyphViewSharedResources, 0);
  objc_storeStrong((id *)&self->_lazy_pearlGlyphView, 0);
  objc_storeStrong((id *)&self->_shadowFilterLayers, 0);
  objc_storeStrong((id *)&self->_shadowImageLayers, 0);
  objc_storeStrong((id *)&self->_imageLayers, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_iconContainerView, 0);
}

- (void)setLegibilitySettings:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A471F000, log, OS_LOG_TYPE_FAULT, "[Legibility] Updated to nil legibility settings", v1, 2u);
}

@end
