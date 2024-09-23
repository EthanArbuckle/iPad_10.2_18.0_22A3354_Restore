@implementation SBRemoteTransientOverlayHostViewController

- (SBRemoteTransientOverlayHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBRemoteTransientOverlayHostViewController *v4;
  SBRemoteTransientOverlayHostViewController *v5;
  NSNumber *preferredSceneDeactivationReasonValue;
  uint64_t v7;
  NSSet *preferredBackgroundActivitiesToSuppress;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  v4 = -[SBRemoteTransientOverlayHostViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    preferredSceneDeactivationReasonValue = v4->_preferredSceneDeactivationReasonValue;
    v4->_preferredSceneDeactivationReasonValue = (NSNumber *)&unk_1E91D12F8;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    preferredBackgroundActivitiesToSuppress = v5->_preferredBackgroundActivitiesToSuppress;
    v5->_preferredBackgroundActivitiesToSuppress = (NSSet *)v7;

    v5->_requestedBackgroundStyle = 0;
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)-[SBRemoteTransientOverlayHostViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBRemoteTransientOverlayHostViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteViewController serviceBundleIdentifier](self, "serviceBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("serviceBundleIdentifier"));

  v6 = (id)objc_msgSend(v3, "appendInt64:withName:", -[_UIRemoteViewController serviceProcessIdentifier](self, "serviceProcessIdentifier"), CFSTR("servicePID"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBRemoteTransientOverlayHostViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  void *v2;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleDoubleHeightStatusBarTap");

  return 1;
}

- (void)didInvalidateForRemoteAlert
{
  id v2;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didInvalidateForRemoteAlert");

}

- (void)setAllowsBanners:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldDisableBanners != !a3)
  {
    self->_shouldDisableBanners = !a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:", self);

  }
}

- (void)setAllowsAlertItems:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldPendAlertItems != !a3)
  {
    self->_shouldPendAlertItems = !a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:", self);

  }
}

- (void)setAllowsControlCenter:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldDisableControlCenter != !a3)
  {
    self->_shouldDisableControlCenter = !a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:", self);

  }
}

- (void)setAllowsSiri:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldDisableSiri != !a3)
  {
    self->_shouldDisableSiri = !a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:", self);

  }
}

- (void)deactivate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerRequestsDeactivation:", self);

}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerRequestsInvalidation:", self);

}

- (void)_setDesiredHardwareButtonEvents:(unint64_t)a3
{
  id WeakRetained;

  if (self->_preferredHardwareButtonEvents != a3)
  {
    self->_preferredHardwareButtonEvents = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeDesiredHardwareButtonEvents:", self);

  }
}

- (void)setWallpaperTunnelActive:(BOOL)a3
{
  id WeakRetained;

  if (self->_prefersWallpaperTunnelActive != a3)
  {
    self->_prefersWallpaperTunnelActive = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangePrefersWallpaperTunnel:", self);

  }
}

- (void)setWallpaperStyle:(int64_t)a3 withDuration:(double)a4
{
  void *v6;
  id WeakRetained;

  if (self->_requestedBackgroundStyle != a3)
  {
    self->_requestedBackgroundStyle = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((BSFloatGreaterThanFloat() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeRequestedBackgroundStyle:withAnimationSettings:", self, v6);

    }
    else
    {
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeRequestedBackgroundStyle:withAnimationSettings:", self, 0);
    }

  }
}

- (void)setAllowsMenuButtonDismissal:(BOOL)a3
{
  id WeakRetained;

  if (self->_allowsHomeButtonDismissal != a3)
  {
    self->_allowsHomeButtonDismissal = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeAllowsMenuButtonDismissal:", self);

  }
}

- (void)setAllowsAlertStacking:(BOOL)a3
{
  self->_allowsStackingOverlayContentAbove = a3;
}

- (void)setDismissalAnimationStyle:(int64_t)a3
{
  id WeakRetained;

  if (self->_dismissalAnimationStyle != a3)
  {
    self->_dismissalAnimationStyle = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeDismissalAnimationStyle:", self);

  }
}

- (void)setSwipeDismissalStyle:(int64_t)a3
{
  id WeakRetained;

  if (self->_swipeDismissalStyle != a3)
  {
    self->_swipeDismissalStyle = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeSwipeDismissalStyle:", self);

  }
}

- (void)setStyleOverridesToCancel:(unint64_t)a3 animationSettings:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  STUIBackgroundActivityIdentifiersForStyleOverrides();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRemoteTransientOverlayHostViewController setBackgroundActivitiesToCancel:animationSettings:](self, "setBackgroundActivitiesToCancel:animationSettings:", v6, v5);

}

- (void)setBackgroundActivitiesToCancel:(id)a3 animationSettings:(id)a4
{
  id v6;
  NSSet *v7;
  NSSet *preferredBackgroundActivitiesToSuppress;
  id WeakRetained;

  v6 = a4;
  v7 = (NSSet *)objc_msgSend(a3, "copy");
  preferredBackgroundActivitiesToSuppress = self->_preferredBackgroundActivitiesToSuppress;
  self->_preferredBackgroundActivitiesToSuppress = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewController:didChangeBackgroundActivitiesToSuppressWithAnimationSettings:", self, v6);

}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  SBRemoteTransientOverlayHostViewControllerDelegate **p_delegate;
  id v7;
  id WeakRetained;

  if (a4)
  {
    v4 = a3;
    p_delegate = &self->_delegate;
    v7 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewController:didSetIdleTimerDisabled:forReason:", self, v4, v7);

  }
}

- (void)setDesiredAutoLockDuration:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewController:didSetDesiredAutoLockDuration:", self, a3);

}

- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4
{
  int v4;
  _QWORD v5[5];

  if (a3)
    v4 = 1;
  else
    v4 = 2;
  self->_preferredStatusBarVisibility = v4;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__SBRemoteTransientOverlayHostViewController_setStatusBarHidden_withDuration___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, a4);
}

uint64_t __78__SBRemoteTransientOverlayHostViewController_setStatusBarHidden_withDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)setShouldDisableFadeInAnimation:(BOOL)a3
{
  self->_shouldEnableFadeInAnimation = !a3;
}

- (void)setInteractiveScreenshotGestureDisabled:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldDisableInteractiveScreenshotGesture != a3)
  {
    self->_shouldDisableInteractiveScreenshotGesture = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:", self);

  }
}

- (void)setLaunchingInterfaceOrientation:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewController:didChangeLaunchingInterfaceOrientation:", self, a3);

}

- (void)setOrientationChangedEventsEnabled:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldDisableOrientationUpdates != !a3)
  {
    self->_shouldDisableOrientationUpdates = !a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeShouldDisableOrientationUpdates:", self);

  }
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewController:didChangeWhitePointAdaptivityStyle:", self, a3);

}

- (void)setDesiredIdleTimerSettings:(id)a3
{
  SBRemoteTransientOverlayHostViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewController:didSetDesiredIdleTimerSettings:", self, v5);

}

- (void)setReachabilityDisabled:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldDisableReachability != a3)
  {
    self->_shouldDisableReachability = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:", self);

  }
}

- (void)setSceneDeactivationReason:(id)a3
{
  NSNumber *v4;
  NSNumber *preferredSceneDeactivationReasonValue;
  char v6;
  NSNumber *v7;
  NSNumber *v8;
  id WeakRetained;
  NSNumber *v10;

  v4 = (NSNumber *)a3;
  preferredSceneDeactivationReasonValue = self->_preferredSceneDeactivationReasonValue;
  if (preferredSceneDeactivationReasonValue != v4)
  {
    v10 = v4;
    v6 = -[NSNumber isEqual:](preferredSceneDeactivationReasonValue, "isEqual:", v4);
    v4 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (NSNumber *)-[NSNumber copy](v10, "copy");
      v8 = self->_preferredSceneDeactivationReasonValue;
      self->_preferredSceneDeactivationReasonValue = v7;

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangePreferredSceneDeactivationReasonValue:", self);

      v4 = v10;
    }
  }

}

- (void)_participateInSystemAnimationFence:(id)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawingWithFence:");
  else
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  objc_super v5;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_becomeFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  return -[SBRemoteTransientOverlayHostViewController becomeFirstResponder](&v5, sel_becomeFirstResponder);
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  objc_super v5;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sb_resignFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  return -[SBRemoteTransientOverlayHostViewController resignFirstResponder](&v5, sel_resignFirstResponder);
}

- (int64_t)preferredStatusBarStyle
{
  objc_super v3;

  if (self->_preferredStatusBarStyleValue)
    return -[NSNumber integerValue](self->_preferredStatusBarStyleValue, "integerValue");
  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  return -[_UIRemoteViewController preferredStatusBarStyle](&v3, sel_preferredStatusBarStyle);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  SBRemoteTransientOverlayHostViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  -[_UIRemoteViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v7;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  SBRemoteTransientOverlayHostViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  -[_UIRemoteViewController viewDidDisappear:](&v8, sel_viewDidDisappear_);
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v7;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  SBRemoteTransientOverlayHostViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  -[_UIRemoteViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v7;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  SBRemoteTransientOverlayHostViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  -[_UIRemoteViewController viewWillDisappear:](&v8, sel_viewWillDisappear_);
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v7;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  v4 = a3;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v6, sel_viewServiceDidTerminateWithError_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewController:didTerminateWithError:", self, v4, v6.receiver, v6.super_class);

}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFDA8CA0);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEB5020);
}

- (void)_updateContentOverlayInsetsFromParentIfNecessary
{
  objc_super v2;

  if (!self->_shouldIgnoreContentOverlayInsetUpdates)
  {
    v2.receiver = self;
    v2.super_class = (Class)SBRemoteTransientOverlayHostViewController;
    -[SBRemoteTransientOverlayHostViewController _updateContentOverlayInsetsFromParentIfNecessary](&v2, sel__updateContentOverlayInsetsFromParentIfNecessary);
  }
}

- (int)_preferredStatusBarVisibility
{
  int result;
  objc_super v4;

  result = self->_preferredStatusBarVisibility;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBRemoteTransientOverlayHostViewController;
    return -[_UIRemoteViewController _preferredStatusBarVisibility](&v4, sel__preferredStatusBarVisibility);
  }
  return result;
}

- (void)setShouldIgnoreContentOverlayInsetUpdates:(BOOL)a3
{
  objc_super v3;

  if (self->_shouldIgnoreContentOverlayInsetUpdates != a3)
  {
    self->_shouldIgnoreContentOverlayInsetUpdates = a3;
    if (!a3)
    {
      v3.receiver = self;
      v3.super_class = (Class)SBRemoteTransientOverlayHostViewController;
      -[SBRemoteTransientOverlayHostViewController _updateContentOverlayInsetsFromParentIfNecessary](&v3, sel__updateContentOverlayInsetsFromParentIfNecessary);
    }
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "legacyAlertOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "bs_safeDictionaryForKey:", *MEMORY[0x1E0DABA40]);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUserInfo:", v10);

    }
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E0DABA50]))
      -[SBRemoteTransientOverlayHostViewController setWallpaperTunnelActive:](self, "setWallpaperTunnelActive:", 1);
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E0DABA00]))
      -[SBRemoteTransientOverlayHostViewController setAllowsMenuButtonDismissal:](self, "setAllowsMenuButtonDismissal:", 1);
    v28 = (void *)v10;
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E0DAB9E0]))
      -[SBRemoteTransientOverlayHostViewController setAllowsAlertItems:](self, "setAllowsAlertItems:", 1);
    objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E0DABA08]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      -[SBRemoteTransientOverlayHostViewController setDismissalAnimationStyle:](self, "setDismissalAnimationStyle:", objc_msgSend(v12, "integerValue"));
    objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E0DABA38]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      -[SBRemoteTransientOverlayHostViewController setSwipeDismissalStyle:](self, "setSwipeDismissalStyle:", objc_msgSend(v14, "integerValue"));
    objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E0DABA20]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      -[SBRemoteTransientOverlayHostViewController setLaunchingInterfaceOrientation:](self, "setLaunchingInterfaceOrientation:", objc_msgSend(v16, "integerValue"));
    objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E0DABA10]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_storeStrong((id *)&self->_hasTranslucentContentValue, v18);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewControllerDidChangeContentOpaque:", self);

    }
    objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E0DABA18]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      -[SBRemoteTransientOverlayHostViewController setWallpaperStyle:withDuration:](self, "setWallpaperStyle:withDuration:", objc_msgSend(v20, "integerValue"), 0.0);
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E0DAB9F8]))
      -[SBRemoteTransientOverlayHostViewController setShouldDisableFadeInAnimation:](self, "setShouldDisableFadeInAnimation:", 1);
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E0DABA30]))
      -[SBRemoteTransientOverlayHostViewController setAllowsSiri:](self, "setAllowsSiri:", 0);
    objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E0DABA28]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_storeStrong((id *)&self->_preferredStatusBarStyleValue, v22);
      -[SBRemoteTransientOverlayHostViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    }

  }
  v23 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke;
  v31[3] = &unk_1E8E9F598;
  v32 = v6;
  v24 = v6;
  v25 = (void *)MEMORY[0x1D17E5550](v31);
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v29[1] = 3221225472;
  v29[2] = __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke_3;
  v29[3] = &unk_1E8E9E8D0;
  v30 = v25;
  v27 = v25;
  objc_msgSend(v26, "configureWithContext:completion:", v7, v29);

}

void __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "activityContinuationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "noteActivatedForActivityContinuationWithIdentifier:", v10);

  }
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "noteActivatedWithPresentationMode:", a4);

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke;
  v20[3] = &unk_1E8E9F598;
  v21 = v8;
  v14 = v8;
  v15 = (void *)MEMORY[0x1D17E5550](v20);
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke_3;
  v18[3] = &unk_1E8E9E8D0;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "prepareForActivationWithContext:completion:", v9, v18);

}

void __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  BSDispatchMain();

}

uint64_t __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)preserveInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_preserveInputViewsAnimated:", v3);

}

- (void)restoreInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_restoreInputViewsAnimated:", v3);

}

- (void)presentForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[SBRemoteTransientOverlayHostViewController allowsCustomPresentationDismissalAnimations](self, "allowsCustomPresentationDismissalAnimations"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke;
    v13[3] = &unk_1E8E9F598;
    v14 = v6;
    v8 = MEMORY[0x1D17E5550](v13);
    v9 = (void *)v8;
    if (v4)
    {
      -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke_3;
      v11[3] = &unk_1E8E9E8D0;
      v12 = v9;
      objc_msgSend(v10, "sb_presentForAlertAnimated:completion:", 1, v11);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

void __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[SBRemoteTransientOverlayHostViewController allowsCustomPresentationDismissalAnimations](self, "allowsCustomPresentationDismissalAnimations"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke;
    v13[3] = &unk_1E8E9F598;
    v14 = v6;
    v8 = MEMORY[0x1D17E5550](v13);
    v9 = (void *)v8;
    if (v4)
    {
      -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke_3;
      v11[3] = &unk_1E8E9E8D0;
      v12 = v9;
      objc_msgSend(v10, "sb_dismissForAlertAnimated:completion:", 1, v11);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

void __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleButtonActions:", v4);

}

- (BOOL)isContentOpaque
{
  NSNumber *hasTranslucentContentValue;

  hasTranslucentContentValue = self->_hasTranslucentContentValue;
  if (hasTranslucentContentValue)
    LOBYTE(hasTranslucentContentValue) = !-[NSNumber BOOLValue](hasTranslucentContentValue, "BOOLValue");
  return (char)hasTranslucentContentValue;
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  self->_windowedAccessoryCutoutFrameInScreen = a4;
  self->_attachedToWindowedAccessory = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v8, x, y, width, height);

}

- (SBRemoteTransientOverlayHostViewControllerDelegate)delegate
{
  return (SBRemoteTransientOverlayHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return self->_allowsStackingOverlayContentAbove;
}

- (int64_t)requestedBackgroundStyle
{
  return self->_requestedBackgroundStyle;
}

- (BOOL)prefersWallpaperTunnelActive
{
  return self->_prefersWallpaperTunnelActive;
}

- (BOOL)shouldEnableFadeInAnimation
{
  return self->_shouldEnableFadeInAnimation;
}

- (void)setShouldEnableFadeInAnimation:(BOOL)a3
{
  self->_shouldEnableFadeInAnimation = a3;
}

- (BOOL)shouldEnableFadeOutAnimation
{
  return self->_shouldEnableFadeOutAnimation;
}

- (void)setShouldEnableFadeOutAnimation:(BOOL)a3
{
  self->_shouldEnableFadeOutAnimation = a3;
}

- (BOOL)allowsHomeButtonDismissal
{
  return self->_allowsHomeButtonDismissal;
}

- (unint64_t)preferredHardwareButtonEvents
{
  return self->_preferredHardwareButtonEvents;
}

- (int64_t)dismissalAnimationStyle
{
  return self->_dismissalAnimationStyle;
}

- (int64_t)swipeDismissalStyle
{
  return self->_swipeDismissalStyle;
}

- (NSNumber)preferredSceneDeactivationReasonValue
{
  return self->_preferredSceneDeactivationReasonValue;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return self->_preferredBackgroundActivitiesToSuppress;
}

- (BOOL)shouldDisableOrientationUpdates
{
  return self->_shouldDisableOrientationUpdates;
}

- (BOOL)allowsCustomPresentationDismissalAnimations
{
  return self->_allowsCustomPresentationDismissalAnimations;
}

- (void)setAllowsCustomPresentationDismissalAnimations:(BOOL)a3
{
  self->_allowsCustomPresentationDismissalAnimations = a3;
}

- (BOOL)shouldIgnoreContentOverlayInsetUpdates
{
  return self->_shouldIgnoreContentOverlayInsetUpdates;
}

- (BOOL)shouldDisableBanners
{
  return self->_shouldDisableBanners;
}

- (BOOL)shouldDisableControlCenter
{
  return self->_shouldDisableControlCenter;
}

- (BOOL)shouldDisableReachability
{
  return self->_shouldDisableReachability;
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  return self->_shouldDisableInteractiveScreenshotGesture;
}

- (BOOL)shouldDisableSiri
{
  return self->_shouldDisableSiri;
}

- (BOOL)shouldPendAlertItems
{
  return self->_shouldPendAlertItems;
}

- (BOOL)isAttachedToWindowedAccessory
{
  return self->_attachedToWindowedAccessory;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_windowedAccessoryCutoutFrameInScreen.origin.x;
  y = self->_windowedAccessoryCutoutFrameInScreen.origin.y;
  width = self->_windowedAccessoryCutoutFrameInScreen.size.width;
  height = self->_windowedAccessoryCutoutFrameInScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBackgroundActivitiesToSuppress, 0);
  objc_storeStrong((id *)&self->_preferredSceneDeactivationReasonValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hasTranslucentContentValue, 0);
  objc_storeStrong((id *)&self->_preferredStatusBarStyleValue, 0);
}

@end
