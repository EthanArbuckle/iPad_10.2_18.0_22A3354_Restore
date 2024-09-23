@implementation SBSUIHearingTestModeHostComponent

- (SBSUIHearingTestModeHostComponent)init
{
  SBSUIHearingTestModeHostComponent *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSUIHearingTestModeHostComponent;
  v2 = -[SBSUIHearingTestModeHostComponent init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (void)setHearingTestMode:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_hearingTestMode != a3)
  {
    self->_hearingTestMode = a3;
    SBLogHearingTestMode();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      SBSHearingTestModeDescription();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Host component post changes in hearing test mode through delegate: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    -[SBSUIHearingTestModeHostComponent delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hearingTestModeHostComponentDidChangeActiveState:", self);

  }
}

- (void)_updateHearingTestMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  -[FBSSceneComponent scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hearingTestMode");

  v6 = objc_msgSend(v3, "isValid");
  v7 = 0;
  if (v6 && v5)
  {
    objc_msgSend(v3, "settings", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isForeground");

    if (v9)
    {
      -[NSTimer invalidate](self->_disableHearingTestModeAfterDelayWhenBackgroundTimer, "invalidate");
      -[SBSUIHearingTestModeHostComponent setDisableHearingTestModeAfterDelayWhenBackgroundTimer:](self, "setDisableHearingTestModeAfterDelayWhenBackgroundTimer:", 0);
      v7 = v5;
    }
    else
    {
      v7 = -[SBSUIHearingTestModeHostComponent hearingTestMode](self, "hearingTestMode");
      if (v7 == 1)
      {
        -[SBSUIHearingTestModeHostComponent disableHearingTestModeAfterDelayWhenBackgroundTimer](self, "disableHearingTestModeAfterDelayWhenBackgroundTimer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_initWeak(&location, self);
          v11 = (void *)MEMORY[0x1E0C99E88];
          v13 = MEMORY[0x1E0C809B0];
          v14 = 3221225472;
          v15 = __59__SBSUIHearingTestModeHostComponent__updateHearingTestMode__block_invoke;
          v16 = &unk_1E4C3F378;
          objc_copyWeak(&v17, &location);
          objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v13, 150.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSUIHearingTestModeHostComponent setDisableHearingTestModeAfterDelayWhenBackgroundTimer:](self, "setDisableHearingTestModeAfterDelayWhenBackgroundTimer:", v12, v13, v14, v15, v16);

          objc_destroyWeak(&v17);
          objc_destroyWeak(&location);
        }
        v7 = 1;
      }
    }
  }
  -[SBSUIHearingTestModeHostComponent setHearingTestMode:](self, "setHearingTestMode:", v7);

}

void __59__SBSUIHearingTestModeHostComponent__updateHearingTestMode__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(v5, "isValid"))
    objc_msgSend(WeakRetained, "setHearingTestMode:", 0);
  objc_msgSend(WeakRetained, "disableHearingTestModeAfterDelayWhenBackgroundTimer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    objc_msgSend(WeakRetained, "setDisableHearingTestModeAfterDelayWhenBackgroundTimer:", 0);

}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  SBLogHearingTestMode();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_DEFAULT, "Host Component did receive scene settings updates with context: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }

  -[SBSUIHearingTestModeHostComponent _updateHearingTestMode](self, "_updateHearingTestMode");
}

- (void)sceneDidInvalidate:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogHearingTestMode();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Host Component did receive scene invalidation", v5, 2u);
  }

  -[SBSUIHearingTestModeHostComponent _updateHearingTestMode](self, "_updateHearingTestMode");
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  SBLogHearingTestMode();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_DEFAULT, "Host Component did receive client scene settings updates with clientSettingsDiff: %@, oldSettings: %@, transitionContext: %@", (uint8_t *)&v13, 0x20u);
  }

  if (objc_msgSend(v9, "containsProperty:", sel_hearingTestMode))
    -[SBSUIHearingTestModeHostComponent _updateHearingTestMode](self, "_updateHearingTestMode");

}

- (SBSUIHearingTestModeHostComponentDelegate)delegate
{
  return (SBSUIHearingTestModeHostComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)hearingTestMode
{
  return self->_hearingTestMode;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSTimer)disableHearingTestModeAfterDelayWhenBackgroundTimer
{
  return self->_disableHearingTestModeAfterDelayWhenBackgroundTimer;
}

- (void)setDisableHearingTestModeAfterDelayWhenBackgroundTimer:(id)a3
{
  objc_storeStrong((id *)&self->_disableHearingTestModeAfterDelayWhenBackgroundTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableHearingTestModeAfterDelayWhenBackgroundTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
