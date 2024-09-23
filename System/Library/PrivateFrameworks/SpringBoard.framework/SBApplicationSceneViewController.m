@implementation SBApplicationSceneViewController

- (int64_t)overrideStatusBarStyle
{
  SBStatusBarSettings *overrideStatusBarSettings;

  overrideStatusBarSettings = self->_overrideStatusBarSettings;
  if (overrideStatusBarSettings)
    return -[SBStatusBarSettings style](overrideStatusBarSettings, "style");
  else
    return -1;
}

- (void)_setOverrideStatusBarSettings:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  SBStatusBarSettings *v11;
  SBStatusBarSettings *overrideStatusBarSettings;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBStatusBarSettings isEqual:](self->_overrideStatusBarSettings, "isEqual:", v4);
  SBLogAppStatusBars();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBApplicationSceneViewController _setOverrideStatusBarSettings:].cold.1(self, (uint64_t)v4, v7);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[SBSceneViewController sceneHandle](self, "sceneHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sceneIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v4;
      v10 = v16;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "(%@) %@ Override status bar settings did change: %{public}@", (uint8_t *)&v13, 0x20u);

    }
    v11 = (SBStatusBarSettings *)objc_msgSend(v4, "copy");
    overrideStatusBarSettings = self->_overrideStatusBarSettings;
    self->_overrideStatusBarSettings = v11;

    -[SBApplicationSceneViewController applicationSceneStatusBarDelegate](self, "applicationSceneStatusBarDelegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject applicationSceneViewController:didUpdateStatusBarSettings:](v7, "applicationSceneViewController:didUpdateStatusBarSettings:", self, v4);
  }

}

- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate
{
  return (SBApplicationSceneViewControllingStatusBarDelegate *)objc_loadWeakRetained((id *)&self->_applicationSceneStatusBarDelegate);
}

- (SBApplicationSceneViewController)initWithSceneHandle:(id)a3
{
  id v5;
  SBApplicationSceneViewController *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneViewController.m"), 25, CFSTR("ApplicationSceneHandle must be of type SBApplicationSceneHandle, but was: %@"), v5);

  }
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationSceneViewController;
  v6 = -[SBSceneViewController initWithSceneHandle:](&v9, sel_initWithSceneHandle_, v5);

  return v6;
}

- (double)statusBarAlpha
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;

  -[SBStatusBarSettings alpha](self->_overrideStatusBarSettings, "alpha");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBStatusBarSettings alpha](self->_overrideStatusBarSettings, "alpha");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    return v6;
  }
  else
  {
    -[SBApplicationSceneViewController _applicationStatusBarAlpha](self, "_applicationStatusBarAlpha");
  }
  return result;
}

- (double)_applicationStatusBarAlpha
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SBSceneViewController sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "uiClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusBarAlpha");
    v6 = v5;

  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (void)setApplicationSceneStatusBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_applicationSceneStatusBarDelegate, a3);
}

- (BOOL)_isApplicationStatusBarHidden
{
  return self->__applicationStatusBarHidden;
}

- (SBStatusBarSettings)_overrideStatusBarSettings
{
  return self->_overrideStatusBarSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideStatusBarSettings, 0);
  objc_destroyWeak((id *)&self->_applicationSceneStatusBarDelegate);
}

- (void)_setOverrideStatusBarSettings:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = (id)objc_opt_class();
  v12 = 2114;
  v13 = a2;
  v7 = v11;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "(%@) %@ Override status bar settings did not change: %{public}@", (uint8_t *)&v8, 0x20u);

}

@end
