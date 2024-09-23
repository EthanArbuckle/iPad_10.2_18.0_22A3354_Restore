@implementation SBWindow

- (BOOL)_shouldResizeWithScene
{
  void *v2;
  void *v3;
  char v4;

  -[SBWindow screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMainDisplay") ^ 1;

  return v4;
}

- (UIView)recycledViewsContainer
{
  SBRecycledViewsContainer *recycledViewsContainerView;
  SBRecycledViewsContainer *v4;
  SBRecycledViewsContainer *v5;
  SBRecycledViewsContainer *v6;

  recycledViewsContainerView = self->_recycledViewsContainerView;
  if (!recycledViewsContainerView)
  {
    v4 = [SBRecycledViewsContainer alloc];
    v5 = -[SBRecycledViewsContainer initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_recycledViewsContainerView;
    self->_recycledViewsContainerView = v5;

    -[SBRecycledViewsContainer setHidden:](self->_recycledViewsContainerView, "setHidden:", 1);
    -[SBRecycledViewsContainer setAlpha:](self->_recycledViewsContainerView, "setAlpha:", 0.0);
    -[SBRecycledViewsContainer setUserInteractionEnabled:](self->_recycledViewsContainerView, "setUserInteractionEnabled:", 0);
    -[SBWindow addSubview:](self, "addSubview:", self->_recycledViewsContainerView);
    recycledViewsContainerView = self->_recycledViewsContainerView;
  }
  return (UIView *)recycledViewsContainerView;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindow _debugName](self, "_debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  v6 = (id)objc_msgSend(v3, "appendSuper");
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (TRAParticipant)traitsParticipant
{
  return self->_traitsParticipant;
}

- (void)setHidden:(BOOL)a3
{
  self->_requestedHiddenValue = a3;
  -[SBWindow _updateRealIsHidden](self, "_updateRealIsHidden");
}

- (void)_updateRealIsHidden
{
  _BOOL8 v3;
  objc_super v4;

  v3 = self->_requestedHiddenValue || -[NSMutableSet count](self->_additionalHiddenReasons, "count") != 0;
  v4.receiver = self;
  v4.super_class = (Class)SBWindow;
  -[SBFWindow setHidden:](&v4, sel_setHidden_, v3);
}

- (id)_traitsParticipant
{
  return self->_traitsParticipant;
}

- (void)_setTraitsParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_traitsParticipant, a3);
}

- (SBWindow)initWithFrame:(CGRect)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindow.m"), 125, CFSTR("%s - dont' call this function - %@"), "-[SBWindow initWithFrame:]", v6);

  return 0;
}

- (SBWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5
{
  return -[SBWindow initWithWindowScene:layoutStrategy:role:debugName:](self, "initWithWindowScene:layoutStrategy:role:debugName:", a3, 0, a4, a5);
}

- (SBWindow)initWithWindowScene:(id)a3 layoutStrategy:(id)a4 role:(id)a5 debugName:(id)a6
{
  return -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](self, "initWithWindowScene:rootViewController:layoutStrategy:role:debugName:", a3, 0, a4, a5, a6);
}

- (SBWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 role:(id)a5 debugName:(id)a6
{
  return -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](self, "initWithWindowScene:rootViewController:layoutStrategy:role:debugName:", a3, a4, 0, a5, a6);
}

- (SBWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 layoutStrategy:(id)a5 role:(id)a6 debugName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  SBWindow *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  objc_super v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v15)
  {
    objc_msgSend((id)objc_opt_class(), "defaultLayoutStrategy");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "frameWithInterfaceOrientation:windowScene:", 1, v13);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  SBLogStartup();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v13)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v28;
      v47 = 2114;
      v48 = v13;
      _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] wiring up with windowScene: %{public}@", buf, 0x16u);

    }
    v44.receiver = self;
    v44.super_class = (Class)SBWindow;
    v29 = (SBWindow *)-[SBWindow _initWithFrame:debugName:windowScene:](&v44, sel__initWithFrame_debugName_windowScene_, v17, v13, v19, v21, v23, v25);
    if (!v29)
      goto LABEL_27;
LABEL_11:
    v29->_requestedHiddenValue = -[SBWindow isHidden](v29, "isHidden");
    v31 = objc_msgSend((id)objc_opt_class(), "_isSecure");
    if ((v31 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObserver:selector:name:object:", v29, sel__willEnableSecureRendering_, *MEMORY[0x1E0DA9FE8], 0);
      objc_msgSend(v32, "addObserver:selector:name:object:", v29, sel__didDisableSecureRendering_, *MEMORY[0x1E0DA9FE0], 0);

    }
    objc_storeStrong((id *)&v29->_layoutStrategy, v15);
    -[SBWindow setClipsToBounds:](v29, "setClipsToBounds:", -[SBWindowLayoutStrategy shouldClipForWindow:](v29->_layoutStrategy, "shouldClipForWindow:", v29));
    -[SBWindow _setWindowInterfaceOrientation:](v29, "_setWindowInterfaceOrientation:", 1);
    if (v16)
      -[SBWindow _setRoleHint:](v29, "_setRoleHint:", v16);
    if (v14)
    {
      v33 = -[SBWindow isHidden](v29, "isHidden");
      -[SBWindow setRootViewController:](v29, "setRootViewController:", v14);
      -[SBWindow setHidden:](v29, "setHidden:", 0);
      -[SBWindow setHidden:](v29, "setHidden:", v33);
    }
    -[SBWindowLayoutStrategy addObserver:](v29->_layoutStrategy, "addObserver:", v29);
    if ((v31 & 1) == 0)
    {
      v34 = objc_opt_class();
      v35 = v13;
      if (v34)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v36 = v35;
        else
          v36 = 0;
      }
      else
      {
        v36 = 0;
      }
      v37 = v36;

      objc_msgSend(v37, "secureDisplayStateProvider");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        v40 = v38;
      }
      else
      {
        objc_msgSend((id)SBApp, "authenticationController");
        v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      v41 = v40;

      -[SBWindow _updateHidingForSecureRendering:](v29, "_updateHidingForSecureRendering:", objc_msgSend(v41, "isInSecureDisplayMode"));
    }
    goto LABEL_27;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:].cold.1((uint64_t)self, (uint64_t)a2, v27);

  SBMainWindowScene();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43.receiver = self;
  v43.super_class = (Class)SBWindow;
  v29 = (SBWindow *)-[SBWindow _initWithFrame:debugName:windowScene:](&v43, sel__initWithFrame_debugName_windowScene_, v17, v30, v19, v21, v23, v25);

  if (v29)
    goto LABEL_11;
LABEL_27:

  return v29;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DA9FE8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DA9FE0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBWindow;
  -[SBFWindow dealloc](&v4, sel_dealloc);
}

- (void)layoutStrategyFrameOnScreenDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v4 = a3;
  v5 = -[SBWindow interfaceOrientation](self, "interfaceOrientation");
  -[SBWindow windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameWithInterfaceOrientation:windowScene:", v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15.receiver = self;
  v15.super_class = (Class)SBWindow;
  -[SBWindow setFrame:](&v15, sel_setFrame_, v8, v10, v12, v14);
}

- (void)makeKeyAndVisible
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBWindow;
  -[SBWindow makeKeyAndVisible](&v3, sel_makeKeyAndVisible);
  self->_requestedHiddenValue = 0;
  -[SBWindow _updateRealIsHidden](self, "_updateRealIsHidden");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  -[SBWindow traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (objc_msgSend(v4, "userInterfaceStyle") != v6)
    -[SBUICoronaAnimationController coronaDidChange:](self->_coronaAnimationController, "coronaDidChange:", v6);
  v7.receiver = self;
  v7.super_class = (Class)SBWindow;
  -[SBWindow traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);

}

- (id)sb_coronaAnimationController
{
  SBUICoronaAnimationController *coronaAnimationController;
  SBUICoronaAnimationController *v4;
  SBUICoronaAnimationController *v5;

  coronaAnimationController = self->_coronaAnimationController;
  if (!coronaAnimationController)
  {
    v4 = (SBUICoronaAnimationController *)objc_alloc_init(MEMORY[0x1E0DAC280]);
    v5 = self->_coronaAnimationController;
    self->_coronaAnimationController = v4;

    coronaAnimationController = self->_coronaAnimationController;
  }
  return coronaAnimationController;
}

+ (id)defaultLayoutStrategy
{
  return +[SBWindowDefaultLayoutStrategy clipStrategy](SBWindowDefaultLayoutStrategy, "clipStrategy");
}

+ (BOOL)sb_disableStatusBarHeightChanges
{
  return 1;
}

- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4
{
  objc_super v7;

  if ((objc_msgSend((id)objc_opt_class(), "sb_disableStatusBarHeightChanges") & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBWindow;
    -[SBWindow handleStatusBarChangeFromHeight:toHeight:](&v7, sel_handleStatusBarChangeFromHeight_toHeight_, a3, a4);
  }
}

+ (BOOL)sb_autorotates
{
  return 0;
}

- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4
{
  -[SBWindow _sb_updateAutorotatesFlagAndForceInterfaceOrientationUpdate:](self, "_sb_updateAutorotatesFlagAndForceInterfaceOrientationUpdate:", a4);
}

- (void)sb_updateAutorotatesFlag
{
  void *v2;
  int v4;
  uint64_t v5;
  objc_super v6;

  v4 = objc_msgSend((id)objc_opt_class(), "sb_autorotates");
  if (v4)
  {
    -[SBWindow screen](self, "screen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "_isRotatable");
  }
  else
  {
    v5 = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBWindow;
  -[SBWindow setAutorotates:forceUpdateInterfaceOrientation:](&v6, sel_setAutorotates_forceUpdateInterfaceOrientation_, v5, 0);
  if (v4)

}

- (void)_sb_updateAutorotatesFlagAndForceInterfaceOrientationUpdate:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  int v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "sb_autorotates");
  if (v6)
  {
    -[SBWindow screen](self, "screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "_isRotatable");
  }
  else
  {
    v7 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SBWindow;
  -[SBWindow setAutorotates:forceUpdateInterfaceOrientation:](&v8, sel_setAutorotates_forceUpdateInterfaceOrientation_, v7, v4);
  if (v6)

}

- (void)moveToWindowSceneIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBWindow windowScene](self, "windowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[SBWindow setWindowScene:](self, "setWindowScene:", v6);
    v5 = v6;
  }

}

- (void)_addHiddenReason:(id)a3
{
  id v4;
  NSMutableSet *additionalHiddenReasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  additionalHiddenReasons = self->_additionalHiddenReasons;
  v8 = v4;
  if (!additionalHiddenReasons)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_additionalHiddenReasons;
    self->_additionalHiddenReasons = v6;

    v4 = v8;
    additionalHiddenReasons = self->_additionalHiddenReasons;
  }
  -[NSMutableSet addObject:](additionalHiddenReasons, "addObject:", v4);
  -[SBWindow _updateRealIsHidden](self, "_updateRealIsHidden");

}

- (void)_removeHiddenReason:(id)a3
{
  -[NSMutableSet removeObject:](self->_additionalHiddenReasons, "removeObject:", a3);
  -[SBWindow _updateRealIsHidden](self, "_updateRealIsHidden");
}

- (void)_updateHidingForSecureRendering:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;

  if (a3
    && (-[SBWindow screen](self, "screen"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "displayIdentity"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isMainDisplay"),
        v5,
        v4,
        v6))
  {
    -[SBWindow _addHiddenReason:](self, "_addHiddenReason:", CFSTR("SBWindowHiddenReasonSecureRendering"));
  }
  else
  {
    -[SBWindow _removeHiddenReason:](self, "_removeHiddenReason:", CFSTR("SBWindowHiddenReasonSecureRendering"));
  }
}

- (void)_willEnableSecureRendering:(id)a3
{
  -[SBWindow _updateHidingForSecureRendering:](self, "_updateHidingForSecureRendering:", 1);
}

- (void)_didDisableSecureRendering:(id)a3
{
  -[SBWindow _updateHidingForSecureRendering:](self, "_updateHidingForSecureRendering:", 0);
}

- (int64_t)activeInterfaceOrientation
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[SBWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "_overrideWindowActiveInterfaceOrientation");
  else
    v4 = -[SBWindow _windowInterfaceOrientation](self, "_windowInterfaceOrientation");
  v5 = v4;

  return v5;
}

- (BOOL)isActive
{
  BOOL v3;
  void *v4;

  if ((-[SBWindow isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[SBWindow rootViewController](self, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (NSString)orientationSourceDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindow _debugName](self, "_debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  -[SBWindow activeInterfaceOrientation](self, "activeInterfaceOrientation");
  BSInterfaceOrientationDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("orientation"));

  -[SBWindow orientationSourceLevel](self, "orientationSourceLevel");
  v9 = (id)objc_msgSend(v3, "appendInteger:withName:", (uint64_t)v8, CFSTR("level"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBWindow isActive](self, "isActive"), CFSTR("active"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (SBWindowLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_additionalHiddenReasons, 0);
  objc_storeStrong((id *)&self->_recycledViewsContainerView, 0);
  objc_storeStrong((id *)&self->_coronaAnimationController, 0);
}

- (void)setAlphaAndObeyBecauseIAmTheWindowManager:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBWindow;
  -[SBWindow setAlpha:](&v3, sel_setAlpha_, a3);
}

- (void)initWithWindowScene:(NSObject *)a3 rootViewController:layoutStrategy:role:debugName:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] no windowScene passed in somehow. the caller better wire one up soon", (uint8_t *)&v5, 0xCu);

}

@end
