@implementation SBPrototypeDumpingGround

- (SBPrototypeDumpingGround)init
{
  SBPrototypeDumpingGround *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBPrototypeDumpingGround;
  v2 = -[SBPrototypeDumpingGround init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pearlSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addKeyObserver:", v2);

    -[SBPrototypeDumpingGround _updatePearlDebugUI](v2, "_updatePearlDebugUI");
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addNotificationOutlet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addAction:", &__block_literal_global_236);

    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "killSpringBoardOutlet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "addAction:", &__block_literal_global_3_1);

    +[SBExternalDisplaySettingsDomain rootSettings](SBExternalDisplaySettingsDomain, "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "killSpringBoardOutlet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "addAction:", &__block_literal_global_6_5);

    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconEditingSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resetHomeScreenLayoutOutlet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "addAction:", &__block_literal_global_8_2);

  }
  return v2;
}

void __32__SBPrototypeDumpingGround_init__block_invoke()
{
  id v0;

  +[SBExampleUserNotificationCenter sharedInstance](SBExampleUserNotificationCenter, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "publish");

}

void __32__SBPrototypeDumpingGround_init__block_invoke_2()
{
  id v0;

  +[SBPrototypeController sharedInstance](SBPrototypeController, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "restartSpringBoard");

}

void __32__SBPrototypeDumpingGround_init__block_invoke_3()
{
  id v0;

  +[SBPrototypeController sharedInstance](SBPrototypeController, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "restartSpringBoard");

}

void __32__SBPrototypeDumpingGround_init__block_invoke_4()
{
  id v0;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resetHomeScreenLayout");

}

- (void)dealloc
{
  void *v3;
  id appLaunchedNotificationToken;
  objc_super v5;

  if (self->_appLaunchedNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_appLaunchedNotificationToken);

    appLaunchedNotificationToken = self->_appLaunchedNotificationToken;
    self->_appLaunchedNotificationToken = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SBPrototypeDumpingGround;
  -[SBPrototypeDumpingGround dealloc](&v5, sel_dealloc);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0D1BBD8];
  v6 = a3;
  objc_msgSend(v5, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pearlSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
    -[SBPrototypeDumpingGround _updatePearlDebugUI](self, "_updatePearlDebugUI");
}

- (void)_updatePearlDebugUI
{
  void *v3;
  void *v4;
  int v5;
  SBBiometricMonitorUI *pearlMonitorUI;
  SBBiometricMonitorUI *v7;
  SBBiometricMonitorUI *v8;
  SBBiometricMonitorUI *v9;
  void *v10;
  SBBiometricMonitorUI *v11;
  SBBiometricMonitorPearlDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  id appLaunchedNotificationToken;
  SBBiometricMonitorUI *v17;
  _QWORD v18[4];
  id v19;
  id location;

  if (objc_msgSend((id)SBApp, "hasFinishedLaunching"))
  {
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pearlSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pearlDebugUIEnabled");

    pearlMonitorUI = self->_pearlMonitorUI;
    if (v5)
    {
      if (!pearlMonitorUI)
      {
        v7 = objc_alloc_init(SBBiometricMonitorUI);
        v8 = self->_pearlMonitorUI;
        self->_pearlMonitorUI = v7;

        v9 = self->_pearlMonitorUI;
        -[SBPrototypeDumpingGround windowScene](self, "windowScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBBiometricMonitorUI setWindowScene:](v9, "setWindowScene:", v10);

        v11 = self->_pearlMonitorUI;
        v12 = objc_alloc_init(SBBiometricMonitorPearlDataSource);
        -[SBBiometricMonitorUI setDataSource:](v11, "setDataSource:", v12);

        pearlMonitorUI = self->_pearlMonitorUI;
      }
      -[SBBiometricMonitorUI enable](pearlMonitorUI, "enable");
    }
    else
    {
      -[SBBiometricMonitorUI disable](pearlMonitorUI, "disable");
      -[SBBiometricMonitorUI setDataSource:](self->_pearlMonitorUI, "setDataSource:", 0);
      v17 = self->_pearlMonitorUI;
      self->_pearlMonitorUI = 0;

    }
  }
  else if (!self->_appLaunchedNotificationToken)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__SBPrototypeDumpingGround__updatePearlDebugUI__block_invoke;
    v18[3] = &unk_1E8EAD940;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", CFSTR("SBBootCompleteNotification"), 0, v14, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    appLaunchedNotificationToken = self->_appLaunchedNotificationToken;
    self->_appLaunchedNotificationToken = v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __47__SBPrototypeDumpingGround__updatePearlDebugUI__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObserver:", WeakRetained[2]);

    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    objc_msgSend(WeakRetained, "_updatePearlDebugUI");
  }

}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong(&self->_appLaunchedNotificationToken, 0);
  objc_storeStrong((id *)&self->_pearlMonitorUI, 0);
}

@end
