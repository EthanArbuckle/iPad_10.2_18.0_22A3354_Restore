@implementation SBSplashBoardController

- (void)dealloc
{
  objc_super v3;

  if (self->_isObservingAppLanguageChanges)
    objc_msgSend(MEMORY[0x1E0D3EFB0], "unsubscribeFromAppLanguageChanges");
  v3.receiver = self;
  v3.super_class = (Class)SBSplashBoardController;
  -[XBApplicationController dealloc](&v3, sel_dealloc);
}

- (void)configureForLocaleChanges
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Skipping any snapshot migration as we're in or going to Buddy", v1, 2u);
}

- (void)_checkForChangedLocale
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "checking if locale has changed: %{public}@ to %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_handleLocaleDidChangeNotification
{
  void *v3;
  int v4;

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInSetupMode");

  if (v4)
    -[SBSplashBoardController _checkForChangedLocale](self, "_checkForChangedLocale");
}

- (id)_splashBoardApplicationForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[XBApplicationController applicationProvider](self, "applicationProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSplashBoardApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__SBSplashBoardController__splashBoardApplicationForBundleID___block_invoke;
  v10[3] = &unk_1E8EAE030;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __62__SBSplashBoardController__splashBoardApplicationForBundleID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_observeLocaleChanges
{
  void *v3;
  void *v5;
  _QWORD v6[5];

  if (self->_isObservingAppLanguageChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSplashBoardController.m"), 86, CFSTR("configureForLocaleChanges can only be called once"));

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SBSplashBoardController__observeLocaleChanges__block_invoke;
  v6[3] = &unk_1E8EAE058;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0D3EFB0], "subscribeToAppLanguageChanges:", v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleLocaleDidChangeNotification, *MEMORY[0x1E0C99720], 0);

  self->_isObservingAppLanguageChanges = 1;
}

void __48__SBSplashBoardController__observeLocaleChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_splashBoardApplicationForBundleID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  XBLogFileManifest();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = v3;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "locale changed for %{public}@; purging generated launch images. appInfo: %{public}@",
        buf,
        0x16u);
    }

    v7 = *(void **)(a1 + 32);
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeCachedLaunchImagesForApplications:forgettingApps:", v6, 0);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "informed locale changed for %{public}@, but not a splashboard app so we're skipping", buf, 0xCu);
  }

}

@end
