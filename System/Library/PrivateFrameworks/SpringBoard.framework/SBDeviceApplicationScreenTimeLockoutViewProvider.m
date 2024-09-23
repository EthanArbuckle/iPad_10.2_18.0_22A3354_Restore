@implementation SBDeviceApplicationScreenTimeLockoutViewProvider

- (SBDeviceApplicationScreenTimeLockoutViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4
{
  SBDeviceApplicationScreenTimeLockoutViewProvider *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDeviceApplicationScreenTimeLockoutViewProvider;
  v4 = -[SBDeviceApplicationSceneOverlayViewProvider initWithSceneHandle:delegate:](&v7, sel_initWithSceneHandle_delegate_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__handleInstalledAppsChanged_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

  }
  return v4;
}

- (void)_activateIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  STBlockingViewController *blockingViewController;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  STBlockingViewController *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  STBlockingViewController *v23;
  STBlockingViewController *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isBlockedForScreenTimeExpiration") & 1) != 0)
  {
    objc_msgSend((id)SBApp, "privacyPreflightController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "requiresPreflightForApplication:", v7);

    if (v8)
    {
      SBLogScreenTime();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v10;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "not activating overlay for %{public}@, exiting early because the app still requires privacy disclosure", buf, 0xCu);

      }
      self->_waitingForPrivacyPreflight = 1;
      -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:", self);

    }
    else
    {
      blockingViewController = self->_blockingViewController;
      SBLogScreenTime();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (blockingViewController)
      {
        if (v16)
        {
          objc_msgSend(v4, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v17;
          v28 = 2048;
          v29 = objc_msgSend(v5, "screenTimePolicy");
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "had existing VC for app %{public}@, updating with new policy %ld", buf, 0x16u);

        }
        v18 = self->_blockingViewController;
        v19 = objc_msgSend(v5, "screenTimePolicy");
        objc_msgSend(v5, "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:](v18, "updateAppearanceUsingPolicy:forBundleIdentifier:", v19, v20);
      }
      else
      {
        if (v16)
        {
          objc_msgSend(v4, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v21;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "creating new blocking view controller for app %{public}@", buf, 0xCu);

        }
        objc_msgSend(v4, "bundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[SBDeviceApplicationScreenTimeLockoutViewProvider _newBlockingViewControllerWithBundleIdentifier:](self, "_newBlockingViewControllerWithBundleIdentifier:", v22);
        v24 = self->_blockingViewController;
        self->_blockingViewController = v23;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObserver:selector:name:object:", self, sel__blockingViewControllerDismissedItself, *MEMORY[0x1E0D8C098], self->_blockingViewController);
      }

      self->_isActive = 1;
      v25.receiver = self;
      v25.super_class = (Class)SBDeviceApplicationScreenTimeLockoutViewProvider;
      -[SBDeviceApplicationSceneOverlayViewProvider _activateIfPossible](&v25, sel__activateIfPossible);
    }
  }
  else
  {
    SBLogScreenTime();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "attempted to activate overlay for %{public}@, exiting early because app is not blocked", buf, 0xCu);

    }
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);
  if (self->_blockingViewController)
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D8C098]);

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationScreenTimeLockoutViewProvider;
  -[SBDeviceApplicationSceneOverlayViewProvider dealloc](&v4, sel_dealloc);
}

- (int64_t)priority
{
  return 4;
}

- (void)_handleInstalledAppsChanged:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBInstalledApplicationsUpdatedBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    SBLogScreenTime();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "scene overlay got applicationsChanged: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isBlockedForScreenTimeExpiration");

    SBLogScreenTime();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138543618;
      v14 = v9;
      v15 = 1024;
      v16 = v11;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "app %{public}@ is now blocked for Downtime: %d", (uint8_t *)&v13, 0x12u);
    }

    if ((objc_msgSend(v5, "containsObject:", v9) & v11) == 1)
    {
      -[SBDeviceApplicationScreenTimeLockoutViewProvider _activateIfPossible](self, "_activateIfPossible");
    }
    else if (self->_isActive && ((objc_msgSend(v5, "containsObject:", v9) ^ 1 | v11) & 1) == 0)
    {
      -[SBDeviceApplicationScreenTimeLockoutViewProvider _deactivateIfPossibleRespectingAppBlockedState:](self, "_deactivateIfPossibleRespectingAppBlockedState:", 1);
    }

  }
}

- (void)_blockingViewControllerDismissedItself
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_isActive)
  {
    SBLogScreenTime();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "application");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "blocking view controller for app %{public}@ dismissed itself, deactivating overlay preemptively", (uint8_t *)&v7, 0xCu);

    }
    -[SBDeviceApplicationScreenTimeLockoutViewProvider _deactivateIfPossibleRespectingAppBlockedState:](self, "_deactivateIfPossibleRespectingAppBlockedState:", 0);
  }
}

- (void)showContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogScreenTime();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 67109378;
    v11[1] = v4;
    v12 = 2114;
    v13 = v10;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "showing content with animation: %d for app %{public}@", (uint8_t *)v11, 0x12u);

  }
  -[STBlockingViewController showWithAnimation:completionHandler:](self->_blockingViewController, "showWithAnimation:completionHandler:", v4, v6);

}

- (void)hideContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogScreenTime();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 67109378;
    v11[1] = v4;
    v12 = 2114;
    v13 = v10;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "hiding content with animation: %d for app %{public}@", (uint8_t *)v11, 0x12u);

  }
  -[STBlockingViewController hideWithAnimation:completionHandler:](self->_blockingViewController, "hideWithAnimation:completionHandler:", v4, v6);

}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  _QWORD block[5];

  if (self->_waitingForPrivacyPreflight)
  {
    self->_waitingForPrivacyPreflight = 0;
    objc_msgSend(a3, "removeObserver:", self, a4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__SBDeviceApplicationScreenTimeLockoutViewProvider_sceneHandle_didCreateScene___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __79__SBDeviceApplicationScreenTimeLockoutViewProvider_sceneHandle_didCreateScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateIfPossible");
}

- (void)_deactivateIfPossibleRespectingAppBlockedState:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 isActive;
  STBlockingViewController *blockingViewController;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  __int16 v21;
  STBlockingViewController *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v8, "isBlockedForScreenTimeExpiration");

  }
  if (self->_isActive && (v3 & 1) == 0 && self->_blockingViewController)
  {
    self->_isActive = 0;
    v14.receiver = self;
    v14.super_class = (Class)SBDeviceApplicationScreenTimeLockoutViewProvider;
    -[SBDeviceApplicationSceneOverlayViewProvider _deactivateIfPossible](&v14, sel__deactivateIfPossible);
  }
  else
  {
    SBLogScreenTime();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "application");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isActive = self->_isActive;
      blockingViewController = self->_blockingViewController;
      *(_DWORD *)buf = 138544130;
      v16 = v11;
      v17 = 1024;
      v18 = isActive;
      v19 = 1024;
      v20 = v3;
      v21 = 2114;
      v22 = blockingViewController;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "attempted to deactivate overlay for %{public}@, exiting early with state %d, %d, %{public}@", buf, 0x22u);

    }
  }

}

- (id)_realOverlayViewController
{
  if (self->_isActive)
    return self->_blockingViewController;
  else
    return 0;
}

- (id)_newBlockingViewControllerWithBundleIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0D8C088];
  v5 = a3;
  v6 = (void *)objc_msgSend(v4, "newTranslucentBlockingViewController");
  objc_msgSend(MEMORY[0x1E0D8C088], "closeApplicationHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOkButtonHandler:", v7);

  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "info");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateAppearanceUsingPolicy:forBundleIdentifier:", objc_msgSend(v10, "screenTimePolicy"), v5);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingViewController, 0);
}

@end
