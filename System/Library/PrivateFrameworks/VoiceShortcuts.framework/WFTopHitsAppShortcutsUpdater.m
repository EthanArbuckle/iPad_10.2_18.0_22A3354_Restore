@implementation WFTopHitsAppShortcutsUpdater

- (WFTopHitsAppShortcutsUpdater)initWithXPCEventHandler:(id)a3
{
  id v5;
  WFTopHitsAppShortcutsUpdater *v6;
  WFTopHitsAppShortcutsUpdater *v7;
  WFTopHitsAppShortcutsUpdater *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFTopHitsAppShortcutsUpdater;
  v6 = -[WFTopHitsAppShortcutsUpdater init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcEventHandler, a3);
    v8 = v7;
  }

  return v7;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  WFXPCActivityScheduler *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WFTopHitsAppShortcutsUpdater xpcEventHandler](self, "xpcEventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_applicationRegistered_, CFSTR("ApplicationRegistered"));

  -[WFTopHitsAppShortcutsUpdater xpcEventHandler](self, "xpcEventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:", self, sel_handleRecentCallsUpdate, CFSTR("com.apple.callhistory.notification.calls-changed"));

  -[WFTopHitsAppShortcutsUpdater xpcEventHandler](self, "xpcEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_handleFavoriteCallsUpdate, CFSTR("CNFavoritesChangedExternallyNotification"));

  -[WFTopHitsAppShortcutsUpdater registerForUpcomingMediaSuggestionChanged](self, "registerForUpcomingMediaSuggestionChanged");
  v6 = -[WFXPCActivityScheduler initWithActivityIdentifier:]([WFXPCActivityScheduler alloc], "initWithActivityIdentifier:", CFSTR("com.apple.siriactionsd.UpdateAppShortcutsCheckIn"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__WFTopHitsAppShortcutsUpdater_start__block_invoke;
  v13[3] = &unk_1E7AA83C0;
  v13[4] = self;
  -[WFXPCActivityScheduler scheduleWithRunHandler:](v6, "scheduleWithRunHandler:", v13);
  objc_msgSend(MEMORY[0x1E0C99EA0], "lastAppShortcutUpdateDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)objc_opt_new(),
        objc_msgSend(v8, "timeIntervalSinceDate:", v7),
        v10 = v9,
        v8,
        v10 <= 3600.0))
  {
    getWFTopHitsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFTopHitsAppShortcutsUpdater start]";
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s Last update at: %@ was within the past hour, ignoring initial update", buf, 0x16u);
    }

  }
  else
  {
    getWFTopHitsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFTopHitsAppShortcutsUpdater start]";
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Last update at: %@ was more than an hour ago, performing initial App Shortcuts update", buf, 0x16u);
    }

    -[WFTopHitsAppShortcutsUpdater updateWithCompletion:](self, "updateWithCompletion:", &__block_literal_global_7434);
  }

}

- (void)applicationRegistered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0DC7FD8]);
    if (v14)
    {
      getWFTopHitsLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315138;
        v17 = "-[WFTopHitsAppShortcutsUpdater applicationRegistered:]";
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s Shortcuts app installed, triggering App Shortcuts update", (uint8_t *)&v16, 0xCu);
      }

      -[WFTopHitsAppShortcutsUpdater updateWithCompletion:](self, "updateWithCompletion:", &__block_literal_global_129_7425);
    }
  }

}

- (void)handleRecentCallsUpdate
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFTopHitsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[WFTopHitsAppShortcutsUpdater handleRecentCallsUpdate]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s Got recent calls updated notification, triggering App Shortcuts update", (uint8_t *)&v4, 0xCu);
  }

  -[WFTopHitsAppShortcutsUpdater updateWithCompletion:](self, "updateWithCompletion:", &__block_literal_global_130);
}

- (void)handleFavoriteCallsUpdate
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFTopHitsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[WFTopHitsAppShortcutsUpdater handleFavoriteCallsUpdate]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s Got favorite calls updated notification, triggering App Shortcuts update", (uint8_t *)&v4, 0xCu);
  }

  -[WFTopHitsAppShortcutsUpdater updateWithCompletion:](self, "updateWithCompletion:", &__block_literal_global_131);
}

- (void)updateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__WFTopHitsAppShortcutsUpdater_updateWithCompletion___block_invoke;
  v6[3] = &unk_1E7AA8398;
  v7 = v4;
  v5 = v4;
  -[WFTopHitsAppShortcutsUpdater _updateWithCompletion:](self, "_updateWithCompletion:", v6);

}

- (void)_updateWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getWFTopHitsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[WFTopHitsAppShortcutsUpdater _updateWithCompletion:]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Attempting App Shortcuts update", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D44180], "policyWithBundleIdentifier:", *MEMORY[0x1E0DC7F70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "connectionWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__WFTopHitsAppShortcutsUpdater__updateWithCompletion___block_invoke;
    v9[3] = &unk_1E7AA8398;
    v10 = v3;
    objc_msgSend(v6, "updateAppShortcutParametersWithCompletionHandler:", v9);

  }
  else
  {
    getWFTopHitsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFTopHitsAppShortcutsUpdater _updateWithCompletion:]";
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s App Shortcuts update connection failed: %@", buf, 0x16u);
    }

    (*((void (**)(id, id))v3 + 2))(v3, v7);
  }

}

- (void)registerForUpcomingMediaSuggestionChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForIntentsDataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0D15C58], "intentClassKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("self.%@.value.%@ == %@"), v3, v5, CFSTR("INPlayMediaIntent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:withPredicate:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0D15C70];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__WFTopHitsAppShortcutsUpdater_registerForUpcomingMediaSuggestionChanged__block_invoke;
  v12[3] = &unk_1E7AA84B0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.siriactionsd.TopHitsAppShortcutsUpdater"), v7, CFSTR("com.apple.siriactionsd.contextstore-registration"), v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTopHitsAppShortcutsUpdater setChangeRegistration:](self, "setChangeRegistration:", v9);
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTopHitsAppShortcutsUpdater setClientContext:](self, "setClientContext:", v10);

  -[WFTopHitsAppShortcutsUpdater clientContext](self, "clientContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerCallback:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (SwiftVCDaemonXPCEventHandler)xpcEventHandler
{
  return self->_xpcEventHandler;
}

- (void)setXpcEventHandler:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEventHandler, a3);
}

- (_CDClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (_CDContextualChangeRegistration)changeRegistration
{
  return self->_changeRegistration;
}

- (void)setChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_changeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_xpcEventHandler, 0);
}

void __73__WFTopHitsAppShortcutsUpdater_registerForUpcomingMediaSuggestionChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clientContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForIntentsDataDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    if (_NSIsNSDictionary())
    {
      objc_msgSend(MEMORY[0x1E0D15C58], "intentSourceBundleIDKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DC7F00]) & 1) != 0
        || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DC7F28]))
      {
        getWFTopHitsLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315394;
          v11 = "-[WFTopHitsAppShortcutsUpdater registerForUpcomingMediaSuggestionChanged]_block_invoke";
          v12 = 2112;
          v13 = v8;
          _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s Received media suggestion update for %@, triggering update", (uint8_t *)&v10, 0x16u);
        }

        objc_msgSend(v2, "updateWithCompletion:", &__block_literal_global_144);
      }

    }
  }

}

void __54__WFTopHitsAppShortcutsUpdater__updateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFTopHitsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[WFTopHitsAppShortcutsUpdater _updateWithCompletion:]_block_invoke";
      v14 = 2112;
      v15 = v3;
      v6 = "%s App Shortcuts update failed: %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 22;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v7, v8, v6, (uint8_t *)&v12, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[WFTopHitsAppShortcutsUpdater _updateWithCompletion:]_block_invoke";
    v6 = "%s App Shortcuts update completed";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3, v10, v11);
}

void __53__WFTopHitsAppShortcutsUpdater_updateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0DD9FC8]);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __37__WFTopHitsAppShortcutsUpdater_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFTopHitsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[WFTopHitsAppShortcutsUpdater start]_block_invoke";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Triggering scheduled App Shortcuts update", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__WFTopHitsAppShortcutsUpdater_start__block_invoke_117;
  v9[3] = &unk_1E7AA8398;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "updateWithCompletion:", v9);

  return 0;
}

void __37__WFTopHitsAppShortcutsUpdater_start__block_invoke_122(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  getWFTopHitsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[WFTopHitsAppShortcutsUpdater start]_block_invoke";
      v11 = 2114;
      v12 = v2;
      v5 = "%s Initial App Shortcuts update completed with error: %{public}@";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
      v8 = 22;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[WFTopHitsAppShortcutsUpdater start]_block_invoke";
    v5 = "%s Initial App Shortcuts update completed!";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    v8 = 12;
    goto LABEL_6;
  }

}

uint64_t __37__WFTopHitsAppShortcutsUpdater_start__block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
