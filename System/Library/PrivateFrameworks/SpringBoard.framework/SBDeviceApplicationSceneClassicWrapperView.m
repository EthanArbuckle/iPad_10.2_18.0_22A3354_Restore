@implementation SBDeviceApplicationSceneClassicWrapperView

+ (BOOL)shouldUseWrapperViewForSceneHandle:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isClassic") & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else if ((objc_msgSend(v3, "isHostedSecureApp") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(v3, "_windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "switcherController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    if (objc_msgSend(v7, "isChamoisWindowingUIEnabled")
      && (objc_msgSend(v4, "supportsChamoisSceneResizing") & 1) == 0)
    {
      objc_msgSend(v7, "activeAndVisibleSceneIdentifiersForApplication:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sceneIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "containsObject:", v11) & (v9 ^ 1);

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (BOOL)suppressLayoutUpdatesForStartOfClassicPhoneAppRotation
{
  return self->_suppressLayoutUpdatesForStartOfClassicPhoneAppRotation;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[SBDeviceApplicationSceneClassicWrapperView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (SBDeviceApplicationSceneClassicWrapperView)initWithSceneHandle:(id)a3
{
  id v5;
  SBDeviceApplicationSceneClassicWrapperView *v6;
  SBDeviceApplicationSceneClassicWrapperView *v7;
  _SBDeviceApplicationSceneClassicHostPositioningView *v8;
  uint64_t v9;
  _SBDeviceApplicationSceneClassicHostPositioningView *positioningView;
  void *v11;
  void *v12;
  uint64_t v13;
  SBSwitcherChamoisSettings *chamoisSettings;
  void *v15;
  uint64_t v16;
  SBAppSwitcherDefaults *appSwitcherDefaults;
  SBAppSwitcherDefaults *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  BSDefaultObserver *chamoisEnabledObserver;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SBDeviceApplicationSceneClassicWrapperView;
  v6 = -[SBDeviceApplicationSceneClassicWrapperView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneHandle, a3);
    if (!v7->_positioningView)
    {
      v8 = [_SBDeviceApplicationSceneClassicHostPositioningView alloc];
      -[SBDeviceApplicationSceneClassicWrapperView bounds](v7, "bounds");
      v9 = -[_SBDeviceApplicationSceneClassicHostPositioningView initWithFrame:](v8, "initWithFrame:");
      positioningView = v7->_positioningView;
      v7->_positioningView = (_SBDeviceApplicationSceneClassicHostPositioningView *)v9;

      -[SBDeviceApplicationSceneClassicWrapperView addSubview:](v7, "addSubview:", v7->_positioningView);
      -[_SBDeviceApplicationSceneClassicHostPositioningView layer](v7->_positioningView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMinificationFilter:", *MEMORY[0x1E0CD2B98]);
      objc_msgSend(v11, "setMagnificationFilter:", *MEMORY[0x1E0CD2E10]);
      if (SBFIsChamoisWindowingUIAvailable())
      {
        +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "chamoisSettings");
        v13 = objc_claimAutoreleasedReturnValue();
        chamoisSettings = v7->_chamoisSettings;
        v7->_chamoisSettings = (SBSwitcherChamoisSettings *)v13;

        -[PTSettings addKeyObserver:](v7->_chamoisSettings, "addKeyObserver:", v7);
        v7->_canRasterize = -[SBSwitcherChamoisSettings rasterizeScaledApps](v7->_chamoisSettings, "rasterizeScaledApps");
        +[SBDefaults localDefaults](SBDefaults, "localDefaults");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appSwitcherDefaults");
        v16 = objc_claimAutoreleasedReturnValue();
        appSwitcherDefaults = v7->_appSwitcherDefaults;
        v7->_appSwitcherDefaults = (SBAppSwitcherDefaults *)v16;

        objc_initWeak(&location, v7);
        v18 = v7->_appSwitcherDefaults;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisWindowingEnabled");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = MEMORY[0x1E0C80D38];
        v21 = MEMORY[0x1E0C80D38];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __66__SBDeviceApplicationSceneClassicWrapperView_initWithSceneHandle___block_invoke;
        v25[3] = &unk_1E8E9DF28;
        objc_copyWeak(&v26, &location);
        -[SBAppSwitcherDefaults observeDefault:onQueue:withBlock:](v18, "observeDefault:onQueue:withBlock:", v19, v20, v25);
        v22 = objc_claimAutoreleasedReturnValue();
        chamoisEnabledObserver = v7->_chamoisEnabledObserver;
        v7->_chamoisEnabledObserver = (BSDefaultObserver *)v22;

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }

    }
  }

  return v7;
}

- (void)addContentView:(id)a3
{
  _SBDeviceApplicationSceneClassicHostPositioningView *positioningView;
  id v5;

  positioningView = self->_positioningView;
  v5 = a3;
  -[_SBDeviceApplicationSceneClassicHostPositioningView addSubview:](positioningView, "addSubview:", v5);
  -[_SBDeviceApplicationSceneClassicHostPositioningView bounds](self->_positioningView, "bounds");
  objc_msgSend(v5, "setFrame:");

}

- (BOOL)wantsBlackBackground
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[SBDeviceApplicationSceneClassicWrapperView sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isChamoisWindowingUIEnabled");

  return !v6 || -[SBDeviceApplicationSceneClassicWrapperView _isProbablyScreenSized](self, "_isProbablyScreenSized");
}

- (CGRect)_effectiveSceneBounds
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[SBDeviceApplicationSceneClassicWrapperView sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;

    objc_msgSend(v3, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "interfaceOrientation") - 3;

    if (v10 > 1)
    {
      BSRectWithSize();
      v11 = v13;
      v12 = v14;
      v8 = v15;
      v6 = v16;
    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v17 = v11;
  v18 = v12;
  v19 = v8;
  v20 = v6;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat width;
  CGFloat height;
  _SBDeviceApplicationSceneClassicHostPositioningView *v15;
  _SBDeviceApplicationSceneClassicHostPositioningView *v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t startingOrientationForClassicPhoneAppRotation;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  _BOOL4 v45;
  double v46;
  _BOOL4 v47;
  int v48;
  int v49;
  int v50;
  double v51;
  double v52;
  double v53;
  int v54;
  double v55;
  double v56;
  char v57;
  char v58;
  __int128 v59;
  CGFloat v60;
  _SBDeviceApplicationSceneClassicHostPositioningView *positioningView;
  _SBDeviceApplicationSceneClassicHostPositioningView *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  void *v81;
  CGFloat v82;
  CGFloat v83;
  void *v84;
  double rect;
  CGFloat y;
  CGFloat x;
  double v88;
  double v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v96;
  CGAffineTransform v97;
  CGAffineTransform v98;
  objc_super v99;
  _BYTE v100[128];
  uint64_t v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;

  v101 = *MEMORY[0x1E0C80C00];
  if (self->_suppressLayoutUpdatesForStartOfClassicPhoneAppRotation)
    return;
  v99.receiver = self;
  v99.super_class = (Class)SBDeviceApplicationSceneClassicWrapperView;
  -[SBDeviceApplicationSceneClassicWrapperView layoutSubviews](&v99, sel_layoutSubviews);
  -[SBDeviceApplicationSceneClassicWrapperView sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneClassicWrapperView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBDeviceApplicationSceneClassicWrapperView _effectiveSceneBounds](self, "_effectiveSceneBounds");
  width = v102.size.width;
  height = v102.size.height;
  y = v102.origin.y;
  x = v102.origin.x;
  if (!CGRectIsEmpty(v102))
  {
    v82 = height;
    v83 = width;
    objc_msgSend(v3, "_windowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "switcherController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v18;
    objc_msgSend(v18, "screen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    startingOrientationForClassicPhoneAppRotation = -[SBDeviceApplicationSceneClassicWrapperView orientation](self, "orientation");
    v80 = startingOrientationForClassicPhoneAppRotation;
    if (self->_preparingForUserDrivenClassicRotation)
      startingOrientationForClassicPhoneAppRotation = self->_startingOrientationForClassicPhoneAppRotation;
    -[SBDeviceApplicationSceneClassicWrapperView sceneHandle](self, "sceneHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sceneIfExists");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "settings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "interfaceOrientation");

    objc_msgSend(v4, "classicAppPhoneAppRunningOnPad");
    objc_msgSend(v3, "sceneIfExists");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "settings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27;
    v30 = v29;

    v76 = v30;
    v77 = v28;
    _UIWindowConvertRectFromOrientationToOrientation();
    BSRectWithSize();
    v88 = v32;
    v89 = v31;
    v79 = v33;
    rect = v34;
    objc_msgSend(v19, "layoutState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "interfaceOrientation");

    if ((unint64_t)(v36 - 3) <= 1)
    {
      v103.origin.x = v6;
      v103.origin.y = v8;
      v103.size.width = v10;
      v103.size.height = v12;
      CGRectGetHeight(v103);
      v104.origin.x = v6;
      v104.origin.y = v8;
      v104.size.width = v10;
      v104.size.height = v12;
      CGRectGetWidth(v104);
    }
    _UIWindowConvertRectFromOrientationToOrientation();
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v84 = v20;
    objc_msgSend(v20, "_referenceBounds");
    v115.origin.x = v38;
    v115.origin.y = v40;
    v74 = v44;
    v75 = v42;
    v115.size.width = v42;
    v115.size.height = v44;
    v45 = CGRectEqualToRect(v105, v115);
    v106.origin.y = v88;
    v106.origin.x = v89;
    v106.size.width = v79;
    v46 = rect;
    v106.size.height = rect;
    v116.origin.x = v6;
    v116.origin.y = v8;
    v116.size.width = v10;
    v116.size.height = v12;
    v47 = CGRectEqualToRect(v106, v116);
    v48 = objc_msgSend(v19, "isChamoisWindowingUIEnabled");
    if (objc_msgSend(v4, "classicAppNonFullScreenWithHomeAffordance"))
    {
      v49 = objc_msgSend(v4, "classicAppPhoneAppRunningOnPad") ^ 1;
      if (!v48)
        goto LABEL_10;
    }
    else
    {
      v49 = 0;
      if (!v48)
      {
LABEL_10:
        if (objc_msgSend(v4, "classicAppPhoneAppRunningOnPad"))
        {
          v50 = objc_msgSend(v4, "classicAppZoomedInOrRequiresHiDPI");
          v51 = 1.0;
          if (v50)
            v51 = SBClassicUtilitiesScaleFactorForPhoneAppZoomedIn(startingOrientationForClassicPhoneAppRotation, v77, v76);
          v52 = 5.0 / v51;
LABEL_33:
          v78 = v52;
          v53 = v51;
          goto LABEL_34;
        }
        v54 = objc_msgSend(v4, "classicAppScaled");
        v51 = 1.0;
        v78 = 0.0;
        if (!v54)
        {
          v53 = 1.0;
          goto LABEL_34;
        }
        v107.origin.x = v6;
        v107.origin.y = v8;
        v107.size.width = v10;
        v107.size.height = v12;
        v55 = CGRectGetHeight(v107);
        v108.origin.x = v89;
        v108.origin.y = v88;
        v108.size.width = v79;
        v108.size.height = rect;
        v53 = v55 / CGRectGetHeight(v108);
        v109.origin.x = v6;
        v109.origin.y = v8;
        v109.size.width = v10;
        v109.size.height = v12;
        v73 = CGRectGetWidth(v109);
        v110.origin.x = v89;
        v110.origin.y = v88;
        v110.size.width = v79;
        v110.size.height = rect;
        v56 = v73 / CGRectGetWidth(v110);
        v46 = rect;
        v57 = objc_msgSend(v4, "classicAppFullScreen");
        v51 = v56;
        if ((v57 & 1) != 0)
          goto LABEL_34;
        goto LABEL_30;
      }
    }
    v73 = v10 / v79;
    v53 = v12 / rect;
    if (v47 || !v45)
    {
      v78 = 0.0;
      if (objc_msgSend(v4, "classicAppFullScreen"))
        objc_msgSend(v84, "_isEmbeddedScreen");
      v49 = 0;
      v51 = v10 / v79;
      goto LABEL_34;
    }
    v58 = objc_msgSend(v4, "classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen");
    v111.origin.x = v89;
    v111.origin.y = v88;
    v111.size.width = v79;
    v111.size.height = rect;
    CGRectGetWidth(v111);
    v112.origin.x = v89;
    v112.origin.y = v88;
    v112.size.width = v79;
    v112.size.height = rect;
    CGRectGetHeight(v112);
    v113.origin.x = v6;
    v113.origin.y = v8;
    v113.size.width = v10;
    v113.size.height = v12;
    CGRectGetWidth(v113);
    v114.origin.x = v6;
    v114.origin.y = v8;
    v114.size.width = v10;
    v114.size.height = v12;
    CGRectGetHeight(v114);
    if ((BSFloatApproximatelyEqualToFloat() & 1) != 0)
    {
      v53 = v12 / rect;
    }
    else
    {
      v53 = v12 / rect;
      if (objc_msgSend(v4, "classicAppPhoneAppRunningOnPad"))
      {
        v53 = SBClassicUtilitiesScaleFactorForPhoneAppZoomedIn(startingOrientationForClassicPhoneAppRotation, v77, v76);
        v73 = v53;
      }
    }
    if ((objc_msgSend(v4, "classicAppFullScreen", *(_QWORD *)&v73, *(_QWORD *)&v74, *(_QWORD *)&v42) & 1) != 0)
      objc_msgSend(v84, "_isEmbeddedScreen");
    v49 = 0;
    v78 = 0.0;
    v46 = rect;
    v51 = v73;
    if ((v58 & 1) != 0)
    {
LABEL_34:
      v59 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v98.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v98.c = v59;
      *(_OWORD *)&v98.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      memset(&v97, 0, sizeof(v97));
      CGAffineTransformMakeScale(&v97, v51, v53);
      if (self->_preparingForUserDrivenClassicRotation)
      {
        SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
        CGAffineTransformMakeRotation(&v98, v60);
        t1 = v97;
        t2 = v98;
        CGAffineTransformConcat(&v96, &t1, &t2);
        v97 = v96;
      }
      -[_SBDeviceApplicationSceneClassicHostPositioningView setBounds:](self->_positioningView, "setBounds:", v89, v88, v79, v46, *(_QWORD *)&v73);
      positioningView = self->_positioningView;
      UIRectGetCenter();
      -[_SBDeviceApplicationSceneClassicHostPositioningView setCenter:](positioningView, "setCenter:");
      v62 = self->_positioningView;
      v96 = v97;
      -[_SBDeviceApplicationSceneClassicHostPositioningView setTransform:](v62, "setTransform:", &v96);
      v10 = v83;
      if (v49)
      {
        if ((v48 & 1) != 0)
          v63 = 1;
        else
          v63 = objc_msgSend(v4, "includesStatusBarInClassicJailForInterfaceOrientation:", v80);
        v64 = v84;
        -[_SBDeviceApplicationSceneClassicHostPositioningView layer](self->_positioningView, "layer");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        SBClassicUtilitiesInsetAndTranslateLayerForPresentationWithHomeAffordance(v65, v84, 0, v80, 1, v63, objc_msgSend(v4, "classicAppWithRoundedCorners"), v75, v74, v77, v76, v53);

        v12 = v82;
      }
      else
      {
        v12 = v82;
        v64 = v84;
        if (v78 <= 0.0)
        {
LABEL_44:

          v8 = y;
          v6 = x;
          goto LABEL_45;
        }
        -[_SBDeviceApplicationSceneClassicHostPositioningView _setContinuousCornerRadius:](self->_positioningView, "_setContinuousCornerRadius:", v78);
      }
      -[_SBDeviceApplicationSceneClassicHostPositioningView setClipsToBounds:](self->_positioningView, "setClipsToBounds:", 1);
      goto LABEL_44;
    }
LABEL_30:
    if (v51 > v53)
      v51 = v53;
    v52 = 0.0;
    goto LABEL_33;
  }
  -[_SBDeviceApplicationSceneClassicHostPositioningView setFrame:](self->_positioningView, "setFrame:", v6, v8, v10, v12);
  v15 = self->_positioningView;
  UIRectGetCenter();
  -[_SBDeviceApplicationSceneClassicHostPositioningView setCenter:](v15, "setCenter:");
  v16 = self->_positioningView;
  v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v98.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v98.c = v17;
  *(_OWORD *)&v98.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[_SBDeviceApplicationSceneClassicHostPositioningView setTransform:](v16, "setTransform:", &v98);
LABEL_45:
  -[_SBDeviceApplicationSceneClassicHostPositioningView layer](self->_positioningView, "layer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setShouldRasterize:", -[SBDeviceApplicationSceneClassicWrapperView _shouldRasterizePositioningLayer](self, "_shouldRasterizePositioningLayer"));
  -[SBDeviceApplicationSceneClassicWrapperView traitCollection](self, "traitCollection");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "displayScale");
  objc_msgSend(v66, "setRasterizationScale:");

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[SBDeviceApplicationSceneClassicWrapperView contentViews](self, "contentViews");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v91 != v71)
          objc_enumerationMutation(v68);
        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "setFrame:", v6, v8, v10, v12);
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    }
    while (v70);
  }

}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSArray)contentViews
{
  return (NSArray *)-[_SBDeviceApplicationSceneClassicHostPositioningView subviews](self->_positioningView, "subviews");
}

- (BOOL)_shouldRasterizePositioningLayer
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_canRasterize)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SBDeviceApplicationSceneClassicWrapperView _shouldRasterizePositioningLayer].cold.1();
    goto LABEL_9;
  }
  if ((-[SBAppSwitcherDefaults chamoisWindowingEnabled](self->_appSwitcherDefaults, "chamoisWindowingEnabled") & 1) == 0)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SBDeviceApplicationSceneClassicWrapperView _shouldRasterizePositioningLayer].cold.2();
LABEL_9:
    LOBYTE(v5) = 0;
    goto LABEL_13;
  }
  -[_SBDeviceApplicationSceneClassicHostPositioningView layer](self->_positioningView, "layer");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    -[NSObject transform](v3, "transform", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  v5 = BSFloatIsOne() ^ 1;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v8;
    v11 = 1024;
    v12 = v5;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ returning %{BOOL}u", buf, 0x12u);

  }
LABEL_13:

  return v5;
}

void __66__SBDeviceApplicationSceneClassicWrapperView_initWithSceneHandle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_windowingModeChanged");

}

- (void)dealloc
{
  objc_super v3;

  -[BSDefaultObserver invalidate](self->_chamoisEnabledObserver, "invalidate");
  -[PTSettings removeKeyObserver:](self->_chamoisSettings, "removeKeyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneClassicWrapperView;
  -[SBDeviceApplicationSceneClassicWrapperView dealloc](&v3, sel_dealloc);
}

- (void)removeContentView:(id)a3
{
  _SBDeviceApplicationSceneClassicHostPositioningView *v4;
  _SBDeviceApplicationSceneClassicHostPositioningView *positioningView;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v4 = (_SBDeviceApplicationSceneClassicHostPositioningView *)objc_claimAutoreleasedReturnValue();
  positioningView = self->_positioningView;

  if (v4 == positioningView)
    objc_msgSend(v6, "removeFromSuperview");

}

- (BOOL)_isProbablyScreenSized
{
  void *v3;
  void *v4;
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
  BOOL v15;

  -[SBDeviceApplicationSceneClassicWrapperView sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;
  v9 = v8;
  -[SBDeviceApplicationSceneClassicWrapperView bounds](self, "bounds");
  if (v7 >= v9)
    v12 = v7;
  else
    v12 = v9;
  if (v10 >= v11)
    v13 = v10;
  else
    v13 = v11;
  if (v7 <= v9)
    v14 = v7;
  else
    v14 = v9;
  if (v10 > v11)
    v10 = v11;
  v15 = v12 == v13 && v14 == v10;

  return v15;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_chamoisSettings == a3)
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("rasterizeScaledApps")))
    {
      self->_canRasterize = -[SBSwitcherChamoisSettings rasterizeScaledApps](self->_chamoisSettings, "rasterizeScaledApps");
      -[SBDeviceApplicationSceneClassicWrapperView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setSuppressLayoutUpdatesForStartOfClassicPhoneAppRotation:(BOOL)a3
{
  self->_suppressLayoutUpdatesForStartOfClassicPhoneAppRotation = a3;
}

- (BOOL)preparingForUserDrivenClassicRotation
{
  return self->_preparingForUserDrivenClassicRotation;
}

- (void)setPreparingForUserDrivenClassicRotation:(BOOL)a3
{
  self->_preparingForUserDrivenClassicRotation = a3;
}

- (int64_t)startingOrientationForClassicPhoneAppRotation
{
  return self->_startingOrientationForClassicPhoneAppRotation;
}

- (void)setStartingOrientationForClassicPhoneAppRotation:(int64_t)a3
{
  self->_startingOrientationForClassicPhoneAppRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_chamoisSettings, 0);
  objc_storeStrong((id *)&self->_chamoisEnabledObserver, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_positioningView, 0);
}

- (void)_shouldRasterizePositioningLayer
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "%{public}@ early return NO because we're not in chamois", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
