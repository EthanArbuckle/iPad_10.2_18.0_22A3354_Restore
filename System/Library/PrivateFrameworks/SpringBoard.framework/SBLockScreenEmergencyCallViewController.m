@implementation SBLockScreenEmergencyCallViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  SBLockScreenEmergencyCallViewController *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "View Service terminated with error: %@ -> %@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "emergencyCallViewController:didExitWithError:", self, v4);
  }
  else
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lockScreenEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emergencyDialerExitedWithError:", v4);

  }
}

- (void)dismiss
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dismissEmergencyCallViewController:", self);
  }
  else
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lockScreenEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exitEmergencyDialerAnimated:", 1);

  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLockScreenEmergencyCallViewController;
  -[SBUIEmergencyCallHostViewController setBackgroundStyle:](&v3, sel_setBackgroundStyle_, a3);
}

- (id)tintColorForBackgroundStyle:(int64_t)a3 outBlurRadius:(double *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  -[SBLockScreenEmergencyCallViewController _wallpaperStyleFromUIBackgroundStyle:](self, "_wallpaperStyleFromUIBackgroundStyle:", a3);
  _WallpaperBackdropParametersForStyleAndAverageColor();
  objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:graphicsQuality:", v10, 100);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blurRadius");
    *(_QWORD *)a4 = v7;

  }
  objc_msgSend(v5, "combinedTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)_wallpaperStyleFromUIBackgroundStyle:(int64_t)a3
{
  _WallpaperStyleForBackgroundStyle();
  return _WallpaperStyleByRemovingTintFromStyle();
}

- (SBLockScreenEmergencyCallViewControllerDelegate)delegate
{
  return (SBLockScreenEmergencyCallViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
