@implementation SBContinuityButtonActions

- (SBContinuityButtonActions)initWithWindowScene:(id)a3 debugName:(id)a4
{
  id v6;
  id v7;
  SBContinuityButtonActions *v8;
  SBContinuityButtonActions *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuityButtonActions;
  v8 = -[SBContinuityButtonActions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowScene, v6);
    objc_storeStrong((id *)&v9->_debugName, a4);
  }

  return v9;
}

- (void)invalidate
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBContinuityButtonActions _menuButtonEventName](self, "_menuButtonEventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelEventsWithName:", v3);

}

- (void)performHomeButtonAction
{
  if (!-[SBContinuityButtonActions _processHomeButtonInSystemApertureController](self, "_processHomeButtonInSystemApertureController")&& !-[SBContinuityButtonActions _processHomeButtonInBannerManager](self, "_processHomeButtonInBannerManager")&& !-[SBContinuityButtonActions _processHomeButtonInCommandTabUI](self, "_processHomeButtonInCommandTabUI")&& !-[SBContinuityButtonActions _processHomeButtonInLibraryViewController](self, "_processHomeButtonInLibraryViewController")&& !-[SBContinuityButtonActions _processHomeButtonInSwitcherController](self, "_processHomeButtonInSwitcherController")&& !-[SBContinuityButtonActions _processHomeButtonInApp](self, "_processHomeButtonInApp"))
  {
    -[SBContinuityButtonActions _requeueHomeButtonRequest](self, "_requeueHomeButtonRequest");
  }
}

- (void)performSwitcherButtonAction
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "switcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleMainSwitcherWithSource:animated:", 20, 1);

}

- (void)performSpotlightButtonAction
{
  void *v2;
  id WeakRetained;

  v2 = (void *)SBApp;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v2, "toggleSearchOnWindowScene:fromBreadcrumbSource:withWillBeginHandler:completionHandler:", WeakRetained, 0, 0, 0);

}

- (id)_menuButtonEventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("HandleMenuButton"), self->_debugName);
}

- (BOOL)_processHomeButtonInSystemApertureController
{
  id WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "systemApertureController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "handleHomeButtonPress");
  if (v4)
  {
    SBLogContinuityDisplay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "System aperture controller handled the home button event", v7, 2u);
    }

  }
  return v4;
}

- (BOOL)_processHomeButtonInBannerManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  int v10;
  NSObject *v11;
  BOOL v12;
  uint8_t v14[16];

  -[SBContinuityButtonActions windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlayPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientOverlayPresenterForWindowScene:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "bannerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bannerWindowInWindowScene:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowLevel");
  if (objc_msgSend(v6, "hasPresentationAboveWindowLevel:"))
  {

LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v10 = objc_msgSend(v7, "handleHomeButtonPressInWindowScene:", WeakRetained);

  if (!v10)
    goto LABEL_7;
  SBLogContinuityDisplay();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Banner manager handled the home button event", v14, 2u);
  }

  v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)_processHomeButtonInCommandTabUI
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  if (v3)
  {
    +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismiss");

    SBLogContinuityDisplay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing command-tab UI", v7, 2u);
    }

  }
  return v3;
}

- (BOOL)_processHomeButtonInLibraryViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  uint8_t v11[16];

  -[SBContinuityButtonActions windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modalLibraryController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unlockedEnvironmentMode");

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2 && objc_msgSend(v3, "isPresentingLibraryInForeground"))
  {
    objc_msgSend(v3, "libraryViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "popPresentationState");

    SBLogContinuityDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Library view controller handled the home button event", v11, 2u);
    }

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_processHomeButtonInSwitcherController
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  -[SBContinuityButtonActions windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "handleHomeButtonPress");
  if (v4)
  {
    SBLogContinuityDisplay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBMainSwitcherCoordinator handled the home button event", v7, 2u);
    }

  }
  return v4;
}

- (BOOL)_processHomeButtonInApp
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  -[SBContinuityButtonActions windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "handleHomeButtonSinglePressUpForWindowScene:withSourceType:", v2, 0);

  if (v4)
  {
    SBLogContinuityDisplay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "UIController handled the home button event", v7, 2u);
    }

  }
  return v4;
}

- (void)_requeueHomeButtonRequest
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  SBLogContinuityDisplay();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SBUIController is busy - queued the home button event for later processing", (uint8_t *)buf, 2u);
  }

  -[SBContinuityButtonActions _menuButtonEventName](self, "_menuButtonEventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  v5 = (void *)MEMORY[0x1E0D229B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SBContinuityButtonActions__requeueHomeButtonRequest__block_invoke;
  v8[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v9, buf);
  objc_msgSend(v5, "eventWithName:handler:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelEventsWithName:", v4);
  objc_msgSend(v7, "executeOrAppendEvent:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);

}

void __54__SBContinuityButtonActions__requeueHomeButtonRequest__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performHomeButtonAction");

}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_debugName, 0);
}

@end
