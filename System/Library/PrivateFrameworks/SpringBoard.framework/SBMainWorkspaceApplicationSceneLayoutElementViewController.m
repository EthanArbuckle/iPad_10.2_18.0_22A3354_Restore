@implementation SBMainWorkspaceApplicationSceneLayoutElementViewController

- (SBMainWorkspaceApplicationSceneLayoutElementViewController)initWithDisplayIdentity:(id)a3
{
  SBMainWorkspaceApplicationSceneLayoutElementViewController *v3;
  SBMainWorkspaceApplicationSceneLayoutElementViewController *v4;
  uint64_t v5;
  BSCornerRadiusConfiguration *cornerRadiusConfiguration;
  uint64_t v7;
  NSMutableSet *maskDisplayCornersReasons;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  v3 = -[SBAppContainerViewController initWithDisplayIdentity:](&v10, sel_initWithDisplayIdentity_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_nubViewHidden = 1;
    v3->_nubViewHighlighted = 0;
    v3->_shadowOpacity = 0.0;
    v3->_shadowOffset = 0.0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", SBScreenDisplayCornerRadius());
    cornerRadiusConfiguration = v4->_cornerRadiusConfiguration;
    v4->_cornerRadiusConfiguration = (BSCornerRadiusConfiguration *)v5;

    v4->_clipsToBounds = 1;
    v4->_darkenViewAlpha = 0.0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    maskDisplayCornersReasons = v4->_maskDisplayCornersReasons;
    v4->_maskDisplayCornersReasons = (NSMutableSet *)v7;

  }
  return v4;
}

- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  _BOOL8 v12;
  void (**v14)(_QWORD);
  void *v15;
  id v16;

  v12 = a3;
  v16 = a7;
  v14 = (void (**)(_QWORD))a8;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "setLiveContentBlurEnabled:duration:blurDelay:iconViewScale:began:completion:", v12, v16, v14, a4, a5, a6);
  }
  else if (v14)
  {
    v14[2](v14);
  }

}

- (double)blurViewIconScale
{
  void *v2;
  double v3;
  double v4;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "blurViewIconScale");
    v3 = v4;
  }

  return v3;
}

- (void)setBlurViewIconScale:(double)a3
{
  id v4;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setBlurViewIconScale:", a3);

}

- (BOOL)isBlurred
{
  void *v2;
  char v3;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isBlurred");
  else
    v3 = 0;

  return v3;
}

- (void)_beginRequiringSceneViewMatchMoveAnimationForReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_beginRequiringSceneViewMatchMoveAnimationForReason:", v4);

}

- (void)_endRequiringSceneViewMatchMoveAnimationForReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_endRequiringSceneViewMatchMoveAnimationForReason:", v4);

}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = CFSTR("NO");
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "isBlurred"))
    v4 = CFSTR("YES");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppContainerViewController sceneHandle](self, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p (%@) - %@ - blurred=%@>"), v7, self, v9, v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)setClipsToBounds:(BOOL)a3
{
  if (self->_clipsToBounds != a3)
    self->_clipsToBounds = a3;
}

- (void)setDarkenViewAlpha:(double)a3
{
  id v4;

  if (self->_darkenViewAlpha != a3)
  {
    self->_darkenViewAlpha = a3;
    -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDarkenViewAlpha:", a3);

  }
}

- (void)setDropInteraction:(id)a3
{
  void *v5;
  UIDropInteraction *v6;

  v6 = (UIDropInteraction *)a3;
  if (self->_dropInteraction != v6)
  {
    objc_storeStrong((id *)&self->_dropInteraction, a3);
    -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDropInteraction:", v6);

  }
}

- (void)setHomeGrabberDisplayMode:(int64_t)a3
{
  id v4;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeGrabberDisplayMode:", a3);

}

- (int64_t)homeGrabberDisplayMode
{
  void *v2;
  int64_t v3;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "homeGrabberDisplayMode");

  return v3;
}

- (id)prepareForContentRotation
{
  void *v2;
  void *v3;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForContentRotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)SB_conformsToMainDisplaySceneLayoutElementViewControlling
{
  return 1;
}

- (void)setShadowOpacity:(double)a3
{
  if (self->_shadowOpacity != a3)
    self->_shadowOpacity = a3;
}

- (void)setShadowOffset:(double)a3
{
  if (self->_shadowOffset != a3)
    self->_shadowOffset = a3;
}

- (void)setCornerRadiusConfiguration:(id)a3
{
  BSCornerRadiusConfiguration *v4;
  BSCornerRadiusConfiguration *cornerRadiusConfiguration;
  id v6;

  v6 = a3;
  if ((-[BSCornerRadiusConfiguration isEqual:](self->_cornerRadiusConfiguration, "isEqual:") & 1) == 0)
  {
    v4 = (BSCornerRadiusConfiguration *)objc_msgSend(v6, "copy");
    cornerRadiusConfiguration = self->_cornerRadiusConfiguration;
    self->_cornerRadiusConfiguration = v4;

  }
}

- (void)setMaskDisplayCorners:(BOOL)a3 forReason:(id)a4
{
  NSMutableSet *maskDisplayCornersReasons;

  maskDisplayCornersReasons = self->_maskDisplayCornersReasons;
  if (a3)
    -[NSMutableSet addObject:](maskDisplayCornersReasons, "addObject:", a4);
  else
    -[NSMutableSet removeObject:](maskDisplayCornersReasons, "removeObject:", a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  v7 = a4;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController", v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (int64_t)_overrideStatusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;

  -[SBAppContainerViewController sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentInterfaceOrientation");
  if (v6)
  {
    v7 = v6;
    v8 = -[SBLayoutElementViewController contentWrapperInterfaceOrientation](self, "contentWrapperInterfaceOrientation");
    if (v7 != v8)
    {
      v9 = v8;
      if (!objc_msgSend(v5, "isEffectivelyForeground"))
        v7 = v9;
    }
  }
  else
  {
    v7 = objc_msgSend(v5, "activationInterfaceOrientationForOrientation:", a3);
  }

  return v7;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  -[SBAppContainerViewController prepareForReuse](&v4, sel_prepareForReuse);
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController setNubViewHidden:](self, "setNubViewHidden:", 1);
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController setNubViewHighlighted:](self, "setNubViewHighlighted:", 0);
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController setShadowOpacity:](self, "setShadowOpacity:", 0.0);
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController setShadowOffset:](self, "setShadowOffset:", 0.0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", SBScreenDisplayCornerRadius());
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController setCornerRadiusConfiguration:](self, "setCornerRadiusConfiguration:", v3);

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController setDarkenViewAlpha:](self, "setDarkenViewAlpha:", 0.0);
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController setDropInteraction:](self, "setDropInteraction:", 0);
  -[NSMutableSet removeAllObjects](self->_maskDisplayCornersReasons, "removeAllObjects");
}

- (unint64_t)supportedContentInterfaceOrientations
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  v3 = -[SBLayoutElementViewController supportedContentInterfaceOrientations](&v7, sel_supportedContentInterfaceOrientations);
  -[SBAppContainerViewController sceneHandle](self, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = (id)objc_msgSend(v4, "_mainSceneSupportedInterfaceOrientations");

  return (unint64_t)v3;
}

- (BOOL)_shouldDisplayLayoutElementBecomeActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[SBAppContainerViewController sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "sceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && !objc_msgSend(v4, "isEffectivelyForeground"))
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSuspendedUnderLock") ^ 1;

    }
    SBLogAppSwitcher();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLayoutElementViewController layoutElement](self, "layoutElement");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "isEffectivelyForeground");
      NSStringFromBOOL();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "isSuspendedUnderLock");
      NSStringFromBOOL();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sceneIfExists");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v18;
      v31 = 2114;
      v32 = v19;
      v33 = 2114;
      v34 = v21;
      v35 = 2114;
      v36 = v22;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@ shouldDisplayLayoutElementBecomeActive=%{public}@ because isEffectivelyForeground=%{public}@ isSuspendedUnderLock=%{public}@ sceneIfExists=%{public}@", buf, 0x3Eu);

    }
    SBLogAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v4;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "sceneHandle=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    SBLogAppSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLayoutElementViewController layoutElement](self, "layoutElement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLayoutElementViewController layoutState](self, "layoutState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v10;
      v27 = 2114;
      v28 = v12;
      v29 = 2114;
      v30 = v13;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@ shouldDisplayLayoutElementBecomeActive=NO because there is no scene handle. layout state %{public}@", buf, 0x20u);

    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_applicationSceneViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  -[SBAppContainerViewController _applicationSceneViewController](&v3, sel__applicationSceneViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_applicationSceneViewControllerForSceneHandle:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  SBMedusaDecoratedDeviceApplicationSceneViewController *v13;
  void *v15;

  v5 = a3;
  if ((objc_msgSend(v5, "isDeviceApplicationSceneHandle") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainWorkspaceApplicationSceneLayoutElementViewController.m"), 335, CFSTR("This class cannot work with anything other than a SBDeviceApplicationSceneHandle."));

  }
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isMedusaCapable");

    if (v10)
    {
      -[SBLayoutElementViewController layoutElement](self, "layoutElement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "layoutRole");

      v8 = -[SBMedusaDecoratedDeviceApplicationSceneViewController initWithDeviceApplicationSceneHandle:layoutRole:]([SBMedusaDecoratedDeviceApplicationSceneViewController alloc], "initWithDeviceApplicationSceneHandle:layoutRole:", v5, v12);
    }
    else
    {
      v8 = -[SBDeviceApplicationSceneViewController initWithSceneHandle:]([SBDeviceApplicationSceneViewController alloc], "initWithSceneHandle:", v5);
    }
  }
  v13 = v8;

  return v13;
}

- (void)_configureViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  v4 = a3;
  -[SBAppContainerViewController _configureViewController:](&v8, sel__configureViewController_, v4);
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC:](self, "_medusaDecoratedVC:", v4, v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setNubViewHidden:", -[SBMainWorkspaceApplicationSceneLayoutElementViewController isNubViewHidden](self, "isNubViewHidden"));
    objc_msgSend(v5, "setNubViewHighlighted:", -[SBMainWorkspaceApplicationSceneLayoutElementViewController isNubViewHighlighted](self, "isNubViewHighlighted"));
    -[SBMainWorkspaceApplicationSceneLayoutElementViewController darkenViewAlpha](self, "darkenViewAlpha");
    objc_msgSend(v5, "setDarkenViewAlpha:");
    -[SBMainWorkspaceApplicationSceneLayoutElementViewController dropInteraction](self, "dropInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDropInteraction:", v6);

    -[SBLayoutElementViewController layoutElement](self, "layoutElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutRole:spaceConfiguration:floatingConfiguration:sizingPolicy:", objc_msgSend(v7, "layoutRole"), 0, 0, 0);

  }
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBMainWorkspaceApplicationSceneLayoutElementViewController;
  -[SBAppContainerViewController sceneHandle:didCreateScene:](&v5, sel_sceneHandle_didCreateScene_, a3, a4);
  -[SBLayoutElementViewController _updateDisplayLayoutElementVisibility](self, "_updateDisplayLayoutElementVisibility");
}

- (BOOL)SB_conformsToMedusaDecoratedDeviceApplicationSceneViewControlling
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding
{
  return 1;
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4
{
  return -[SBMainWorkspaceApplicationSceneLayoutElementViewController statusBarAssertionWithStatusBarHidden:nubViewHidden:atLevel:](self, "statusBarAssertionWithStatusBarHidden:nubViewHidden:atLevel:", a3, 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "statusBarAssertionWithStatusBarHidden:nubViewHidden:atLevel:", v7, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBMainWorkspaceApplicationSceneLayoutElementViewController _deviceApplicationSceneViewController](self, "_deviceApplicationSceneViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "statusBarAssertionWithStatusBarHidden:atLevel:", v7, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)isNubViewHidden
{
  return self->_nubViewHidden;
}

- (void)setNubViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_nubViewHidden != a3)
  {
    v3 = a3;
    self->_nubViewHidden = a3;
    -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNubViewHidden:", v3);

  }
}

- (BOOL)isNubViewHighlighted
{
  return self->_nubViewHighlighted;
}

- (void)setNubViewHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_nubViewHighlighted != a3)
  {
    v3 = a3;
    self->_nubViewHighlighted = a3;
    -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNubViewHighlighted:", v3);

  }
}

- (SBHomeGrabberView)homeGrabberView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _deviceApplicationSceneViewController](self, "_deviceApplicationSceneViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeGrabberView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeGrabberView");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (SBHomeGrabberView *)v6;
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _deviceApplicationSceneViewController](self, "_deviceApplicationSceneViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "bestHomeAffordanceOrientationForOrientation:", a3);

  return v5;
}

- (SBApplicationSceneBackgroundView)backgroundView
{
  void *v2;
  void *v3;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBApplicationSceneBackgroundView *)v3;
}

- (void)setBackgroundView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundView:", v4);

}

- (UIView)sceneContentView
{
  return 0;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", v8, v6);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", v8, v6);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", v8, v6);

}

- (id)initialCornerRadiusConfiguration
{
  return self->_cornerRadiusConfiguration;
}

- (id)containerViewForBlurContentView
{
  void *v2;
  void *v3;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC](self, "_medusaDecoratedVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_blurViewContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_medusaDecoratedVC
{
  void *v3;
  void *v4;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _medusaDecoratedVC:](self, "_medusaDecoratedVC:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_medusaDecoratedVC:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_deviceApplicationSceneViewController
{
  void *v3;
  void *v4;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _deviceApplicationSceneViewController:](self, "_deviceApplicationSceneViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_deviceApplicationSceneViewController:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (int64_t)leadingStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "leadingStatusBarStyle");

  return v3;
}

- (int64_t)trailingStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trailingStatusBarStyle");

  return v3;
}

- (id)backgroundActivitiesToSuppress
{
  void *v2;
  void *v3;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundActivitiesToSuppress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)currentStatusBarHeight
{
  void *v2;
  double v3;
  double v4;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentStatusBarHeight");
  v4 = v3;

  return v4;
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a6;
  v10 = a5;
  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "willRotateFromInterfaceOrientation:toInterfaceOrientation:alongsideContainerView:animated:", a3, a4, v10, v6);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  id v6;

  -[SBMainWorkspaceApplicationSceneLayoutElementViewController _applicationSceneViewController](self, "_applicationSceneViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didRotateFromInterfaceOrientation:toInterfaceOrientation:", a3, a4);

}

- (NSString)sceneMinificationFilter
{
  return self->sceneMinificationFilter;
}

- (void)setSceneMinificationFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (BOOL)sceneRendersAsynchronously
{
  return self->sceneRendersAsynchronously;
}

- (void)setSceneRendersAsynchronously:(BOOL)a3
{
  self->sceneRendersAsynchronously = a3;
}

- (BOOL)sceneResizesHostedContext
{
  return self->sceneResizesHostedContext;
}

- (void)setSceneResizesHostedContext:(BOOL)a3
{
  self->sceneResizesHostedContext = a3;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (double)darkenViewAlpha
{
  return self->_darkenViewAlpha;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  return self->_cornerRadiusConfiguration;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowOffset
{
  return self->_shadowOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerRadiusConfiguration, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->sceneMinificationFilter, 0);
  objc_storeStrong((id *)&self->_maskDisplayCornersReasons, 0);
}

@end
