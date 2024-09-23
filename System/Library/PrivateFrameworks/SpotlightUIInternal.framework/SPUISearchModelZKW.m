@implementation SPUISearchModelZKW

- (void)didReceiveResponse:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  const char *v7;
  NSObject **v8;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 2 && -[SPUISearchModelZKW ignoreNextPartialUpdate](self, "ignoreNextPartialUpdate"))
  {
    -[SPUISearchModelZKW setIgnoreNextPartialUpdate:](self, "setIgnoreNextPartialUpdate:", 0);
    -[SPUISearchModel setQueryPartiallyComplete:](self, "setQueryPartiallyComplete:", 1);
    v5 = (NSObject **)MEMORY[0x24BEB0818];
    v6 = *MEMORY[0x24BEB0818];
    if (!*MEMORY[0x24BEB0818])
    {
      SPUIInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "ignoring partial zkw update";
LABEL_11:
      _os_log_impl(&dword_22E078000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SPUISearchModelZKW;
    -[SPUISearchModel didReceiveResponse:](&v9, sel_didReceiveResponse_, v4);
    v8 = (NSObject **)MEMORY[0x24BEB0818];
    v6 = *MEMORY[0x24BEB0818];
    if (!*MEMORY[0x24BEB0818])
    {
      SPUIInitLogging();
      v6 = *v8;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "updating zkw with response";
      goto LABEL_11;
    }
  }

}

- (void)updateWithQueryContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject **v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[SPUISearchModel delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeviceAuthenticationState:", objc_msgSend(v6, "currentDeviceAuthenticationState"));

  }
  v7 = (NSObject **)MEMORY[0x24BEB0818];
  v8 = *MEMORY[0x24BEB0818];
  if (!*MEMORY[0x24BEB0818])
  {
    SPUIInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E078000, v8, OS_LOG_TYPE_DEFAULT, "querying zkw", buf, 2u);
  }
  self->_shouldCacheResults = 1;
  -[SPUISearchModelZKW session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryTaskWithContext:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchModel setQueryTask:](self, "setQueryTask:", v10);

  -[SPUISearchModel setLastResponse:](self, "setLastResponse:", 0);
  self->_newQuery = 1;
  -[SPUISearchModel queryTask](self, "queryTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[SPUISearchModel queryTask](self, "queryTask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "start");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SPUISearchModelZKW_updateWithQueryContext___block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  if (updateWithQueryContext__onceToken != -1)
    dispatch_once(&updateWithQueryContext__onceToken, block);

}

- (SPZKWSession)session
{
  return self->_session;
}

- (BOOL)ignoreNextPartialUpdate
{
  return self->_ignoreNextPartialUpdate;
}

- (SPUISearchModelZKW)init
{
  SPUISearchModelZKW *v2;
  SPZKWSession *v3;
  SPZKWSession *session;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPUISearchModelZKW;
  v2 = -[SPUISearchModelZKW init](&v6, sel_init);
  if (v2)
  {
    v3 = (SPZKWSession *)objc_alloc_init(MEMORY[0x24BEB0080]);
    session = v2->_session;
    v2->_session = v3;

  }
  return v2;
}

void __45__SPUISearchModelZKW_updateWithQueryContext___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v3;
  id v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)homeScreenPrefChanged, CFSTR("com.apple.suggestions.settingsChanged"), 0, CFNotificationSuspensionBehaviorDrop);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, *(const void **)(a1 + 32), (CFNotificationCallback)homeScreenPrefChanged, CFSTR("com.apple.duetexpertd.spotlightActionsSuggestionUpdate"), 0, CFNotificationSuspensionBehaviorDrop);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__refreshRequested, *MEMORY[0x24BEB05E0], 0);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SPUISearchModelZKW;
  -[SPUISearchModelZKW dealloc](&v5, sel_dealloc);
}

- (void)refreshWithQueryContext:(id)a3
{
  -[SPUISearchModelZKW refreshUpdatingQueryId:withQueryContext:](self, "refreshUpdatingQueryId:withQueryContext:", 0, a3);
}

- (void)refreshUpdatingQueryId:(BOOL)a3 withQueryContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BE85288];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__SPUISearchModelZKW_refreshUpdatingQueryId_withQueryContext___block_invoke;
  v9[3] = &unk_24F9D60A0;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "dispatchMainIfNecessary:", v9);

}

void __62__SPUISearchModelZKW_refreshUpdatingQueryId_withQueryContext___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "searchAgentHasWindow:", *(_QWORD *)(a1 + 32));

  if (v3)
  {
    SPLogForSPLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22E078000, v4, OS_LOG_TYPE_DEFAULT, "refreshing zkw", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setIgnoreNextPartialUpdate:", 1);
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "queryTask");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "query");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "queryContext");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x24BEB0830], "updateQueryContext:withSearchString:showSuggestions:view:", v6, &stru_24F9D6A70, 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeviceAuthenticationState:", objc_msgSend(v10, "currentDeviceAuthenticationState"));

      v6 = v9;
    }
    objc_msgSend(*(id *)(a1 + 32), "updateWithQueryContext:", v6);

  }
}

- (void)_refreshRequested
{
  NSObject **v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = (NSObject **)MEMORY[0x24BEB0818];
  v4 = *MEMORY[0x24BEB0818];
  if (!*MEMORY[0x24BEB0818])
  {
    SPUIInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E078000, v4, OS_LOG_TYPE_DEFAULT, "zkw refresh requested", v5, 2u);
  }
  -[SPUISearchModelZKW refreshUpdatingQueryId:withQueryContext:](self, "refreshUpdatingQueryId:withQueryContext:", 1, 0);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setIgnoreNextPartialUpdate:(BOOL)a3
{
  self->_ignoreNextPartialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queryProcessor, 0);
}

@end
