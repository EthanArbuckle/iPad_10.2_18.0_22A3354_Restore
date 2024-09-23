@implementation SASSiriPocketStateManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  return (id)sharedManager_manager;
}

void __42__SASSiriPocketStateManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SASSiriPocketStateManager _init]([SASSiriPocketStateManager alloc], "_init");
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (id)_init
{
  SASSiriPocketStateManager *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SASSiriPocketStateManager;
  v2 = -[SASSiriPocketStateManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CA56A8]);
    -[SASSiriPocketStateManager _setPocketStateManager:](v2, "_setPocketStateManager:", v3);

    -[SASSiriPocketStateManager _pocketStateManager](v2, "_pocketStateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v2);

    -[SASSiriPocketStateManager _setCurrentPocketState:](v2, "_setCurrentPocketState:", 4);
  }
  return v2;
}

- (SASSiriPocketStateManager)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (void)queryForPocketStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[SASSiriPocketStateManager queryForPocketStateWithCompletion:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #SiriPocketStateManager: Querying Pocket State", buf, 0xCu);
  }
  -[SASSiriPocketStateManager _updateForPocketState:](self, "_updateForPocketState:", 4);
  -[SASSiriPocketStateManager _pocketStateManager](self, "_pocketStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C80D38];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SASSiriPocketStateManager_queryForPocketStateWithCompletion___block_invoke;
  v9[3] = &unk_1E91FBEF8;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v6, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", MEMORY[0x1E0C80D38], v9, 0.5, 0.3);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __63__SASSiriPocketStateManager_queryForPocketStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = *MEMORY[0x1E0CFE6A0];
    v8 = *MEMORY[0x1E0CFE6A0];
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __63__SASSiriPocketStateManager_queryForPocketStateWithCompletion___block_invoke_cold_1((uint64_t)v5, v7);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v7;
        objc_msgSend(WeakRetained, "_stringForPocketState:", a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "-[SASSiriPocketStateManager queryForPocketStateWithCompletion:]_block_invoke";
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #SiriPocketStateManager: Pocket state query successful with state: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(WeakRetained, "_updateForPocketState:", a2);
    }
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }

}

- (BOOL)pocketStateShouldPreventVoiceTriggerForActivationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechRequestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceTriggerEventInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v6, "objectForKey:", CFSTR("hfpTriggerDuringPhoneCall")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "BOOLValue"),
        v7,
        v8))
  {
    v9 = *MEMORY[0x1E0CFE6A0];
    v10 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[SASSiriPocketStateManager pocketStateShouldPreventVoiceTriggerForActivationRequest:]";
      _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation hfpTriggerDuringPhoneCall = YES bypassing pocket state detector", (uint8_t *)&v12, 0xCu);
      v10 = 0;
    }
  }
  else
  {
    v10 = -[SASSiriPocketStateManager pocketStateShouldPreventVoiceTrigger](self, "pocketStateShouldPreventVoiceTrigger");
  }

  return v10;
}

- (BOOL)pocketStateShouldPreventVoiceTrigger
{
  unint64_t v2;

  v2 = -[SASSiriPocketStateManager _currentPocketState](self, "_currentPocketState");
  return (v2 > 4) | v2 & 1;
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  -[SASSiriPocketStateManager _updateForPocketState:](self, "_updateForPocketState:", a4);
}

- (void)_updateForPocketState:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SASSiriPocketStateManager _stringForPocketState:](self, "_stringForPocketState:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[SASSiriPocketStateManager _updateForPocketState:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #SiriPocketStateManager: PocketState changed to %@", (uint8_t *)&v8, 0x16u);

  }
  -[SASSiriPocketStateManager _setCurrentPocketState:](self, "_setCurrentPocketState:", a3);
}

- (id)_stringForPocketState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("CMPocketStateTypeOutOfPocket");
  else
    return off_1E91FBF18[a3 - 1];
}

- (CMPocketStateManager)_pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)_setPocketStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_pocketStateManager, a3);
}

- (int64_t)_currentPocketState
{
  return self->_currentPocketState;
}

- (void)_setCurrentPocketState:(int64_t)a3
{
  self->_currentPocketState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
}

void __63__SASSiriPocketStateManager_queryForPocketStateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SASSiriPocketStateManager queryForPocketStateWithCompletion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1D132F000, a2, OS_LOG_TYPE_ERROR, "%s #SiriPocketStateManager: Failed to query for pocket state: %@", (uint8_t *)&v2, 0x16u);
}

@end
