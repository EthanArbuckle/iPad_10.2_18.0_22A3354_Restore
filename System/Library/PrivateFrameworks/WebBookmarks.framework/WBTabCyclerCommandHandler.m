@implementation WBTabCyclerCommandHandler

- (WBTabCyclerCommandHandler)initWithTabGroupManager:(id)a3
{
  id v5;
  WBTabCyclerCommandHandler *v6;
  WBTabCyclerCommandHandler *v7;
  WBTabCollection *v8;
  void *v9;
  uint64_t v10;
  WBTabCollection *tabCollection;
  uint64_t v12;
  WBSDistributedNotificationObserver *syncAgentNotificationObserver;
  NSObject *v14;
  WBTabCollection *v15;
  WBTabCyclerCommandHandler *v16;
  objc_super v18;
  uint8_t buf[4];
  WBTabCollection *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBTabCyclerCommandHandler;
  v6 = -[WBTabCyclerCommandHandler init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabGroupManager, a3);
    v8 = [WBTabCollection alloc];
    +[WBCollectionConfiguration safariTabCollectionConfiguration](WBCollectionConfiguration, "safariTabCollectionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WBTabCollection initWithConfiguration:openDatabase:](v8, "initWithConfiguration:openDatabase:", v9, 1);
    tabCollection = v7->_tabCollection;
    v7->_tabCollection = (WBTabCollection *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE83120]), "initWithNotificationName:", CFSTR("com.apple.SafariTabGroupSync.SyncDidFinish"));
    syncAgentNotificationObserver = v7->_syncAgentNotificationObserver;
    v7->_syncAgentNotificationObserver = (WBSDistributedNotificationObserver *)v12;

    v14 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v7->_tabCollection;
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "Created Tab Cycler test target with tab collection: %@", buf, 0xCu);
    }
    v16 = v7;
  }

  return v7;
}

- (void)fetchTopLevelBookmarkList:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE83100]), "initWithTitle:uniqueIdentifier:", CFSTR("tab-group-container-bookmark"), CFSTR("tab-group-container-bookmark-uuid"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WBTabGroupManager profiles](self->_tabGroupManager, "profiles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[WBTabCyclerCommandHandler _cyclerRepresentationOfProfile:](self, "_cyclerRepresentationOfProfile:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addChild:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v4[2](v4, v5);
}

- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  char v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("local and remote");
    if ((v4 & 1) == 0)
      v8 = CFSTR("local");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Clearing %@ profiles and tab groups", (uint8_t *)&v9, 0xCu);
  }
  if ((v4 & 1) != 0)
    -[WBTabCyclerCommandHandler _clearRemoteProfilesWithCompletionHandler:](self, "_clearRemoteProfilesWithCompletionHandler:", v6);
  else
    -[WBTabCyclerCommandHandler _clearLocalProfilesWithCompletionHandler:](self, "_clearLocalProfilesWithCompletionHandler:", v6);

}

- (void)_clearLocalTabGroupsWithCompletionHandler:(id)a3
{
  -[WBTabCyclerCommandHandler _clearLocalTabGroupsWithCompletionHandler:retryCooldown:](self, "_clearLocalTabGroupsWithCompletionHandler:retryCooldown:", a3, 2.0);
}

- (void)_clearLocalTabGroupsWithCompletionHandler:(id)a3 retryCooldown:(double)a4
{
  id v6;
  NSObject *v7;
  WBTabCollection *tabCollection;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSTimer *v13;
  NSTimer *clearLocalTabGroupsRetryTimer;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  double v23;
  uint8_t buf[4];
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 <= 64.0)
  {
    if (-[WBTabCollection lockSync](self->_tabCollection, "lockSync"))
    {
      v16 = MEMORY[0x24BDAC760];
      v17 = 3221225472;
      v18 = __85__WBTabCyclerCommandHandler__clearLocalTabGroupsWithCompletionHandler_retryCooldown___block_invoke_2;
      v19 = &unk_24CB34570;
      v20 = v6;
      -[WBTabCyclerCommandHandler _startMonitoringTabGroupUpdateExpectingMigration:completionHandler:](self, "_startMonitoringTabGroupUpdateExpectingMigration:completionHandler:", 0, &v16);
      tabCollection = self->_tabCollection;
      -[WBTabCollection allNamedTabGroupsUnsorted](tabCollection, "allNamedTabGroupsUnsorted", v16, v17, v18, v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabCollection deleteItems:leaveTombstones:](tabCollection, "deleteItems:leaveTombstones:", v9, 0);

      -[WBTabCollection unlockSync](self->_tabCollection, "unlockSync");
      -[WBTabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:](self->_tabGroupManager, "reloadTabGroupsFromDatabaseWithCompletionHandler:", 0);
      v10 = v20;
    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v25 = a4;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Failed to acquire tab collection lock. Retrying after %f seconds.", buf, 0xCu);
      }
      v12 = (void *)MEMORY[0x24BDBCF40];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __85__WBTabCyclerCommandHandler__clearLocalTabGroupsWithCompletionHandler_retryCooldown___block_invoke;
      v21[3] = &unk_24CB34548;
      v21[4] = self;
      v22 = v6;
      v23 = a4;
      objc_msgSend(v12, "timerWithTimeInterval:repeats:block:", 0, v21, a4);
      v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      clearLocalTabGroupsRetryTimer = self->_clearLocalTabGroupsRetryTimer;
      self->_clearLocalTabGroupsRetryTimer = v13;

      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addTimer:forMode:", self->_clearLocalTabGroupsRetryTimer, *MEMORY[0x24BDBCA90]);

      v10 = v22;
    }

  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v25 = a4 * 0.5;
      _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Failed to acquire tab collection lock after backing off to a %f second wait. Giving up.", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __85__WBTabCyclerCommandHandler__clearLocalTabGroupsWithCompletionHandler_retryCooldown___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearLocalTabGroupsWithCompletionHandler:retryCooldown:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48) + *(double *)(a1 + 48));
}

uint64_t __85__WBTabCyclerCommandHandler__clearLocalTabGroupsWithCompletionHandler_retryCooldown___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_clearLocalTabGroupsRetryTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBTabCyclerCommandHandler;
  -[WBTabCyclerCommandHandler dealloc](&v3, sel_dealloc);
}

- (void)_clearRemoteTabGroupsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD block[5];
  id v7;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__WBTabCyclerCommandHandler__clearRemoteTabGroupsWithCompletionHandler___block_invoke;
  block[3] = &unk_24CB319F0;
  block[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

void __72__WBTabCyclerCommandHandler__clearRemoteTabGroupsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "tabGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __72__WBTabCyclerCommandHandler__clearRemoteTabGroupsWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_24CB34570;
    v4 = *(void **)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_startMonitoringSyncStatusWithCompletionHandler:", v14);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "tabGroups", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeTabGroup:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1);
  }
}

uint64_t __72__WBTabCyclerCommandHandler__clearRemoteTabGroupsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);
}

- (void)_clearRemoteProfilesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD block[5];
  id v7;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WBTabCyclerCommandHandler__clearRemoteProfilesWithCompletionHandler___block_invoke;
  block[3] = &unk_24CB319F0;
  block[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

void __71__WBTabCyclerCommandHandler__clearRemoteProfilesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "namedProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "namedTabGroupsInDefaultProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
    {
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1);
      return;
    }
  }
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __71__WBTabCyclerCommandHandler__clearRemoteProfilesWithCompletionHandler___block_invoke_2;
  v24[3] = &unk_24CB34570;
  v5 = *(void **)(a1 + 32);
  v25 = *(id *)(a1 + 40);
  objc_msgSend(v5, "_startMonitoringSyncStatusWithCompletionHandler:", v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "namedProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeProfile:completionHandler:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10++), 0);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "namedTabGroupsForProfileWithIdentifier:", *MEMORY[0x24BE82E70], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeTabGroup:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v13);
  }

}

uint64_t __71__WBTabCyclerCommandHandler__clearRemoteProfilesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);
}

- (void)_clearLocalProfilesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  WBTabCollection *tabCollection;
  void *v7;
  WBTabCollection *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__WBTabCyclerCommandHandler__clearLocalProfilesWithCompletionHandler___block_invoke;
  v10[3] = &unk_24CB34570;
  v11 = v4;
  v5 = v4;
  -[WBTabCyclerCommandHandler _startMonitoringTabGroupUpdateExpectingMigration:completionHandler:](self, "_startMonitoringTabGroupUpdateExpectingMigration:completionHandler:", 0, v10);
  tabCollection = self->_tabCollection;
  -[WBTabGroupManager namedProfiles](self->_tabGroupManager, "namedProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabCollection deleteItems:leaveTombstones:](tabCollection, "deleteItems:leaveTombstones:", v7, 0);

  v8 = self->_tabCollection;
  -[WBTabGroupManager namedTabGroupsInDefaultProfile](self->_tabGroupManager, "namedTabGroupsInDefaultProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabCollection deleteItems:leaveTombstones:](v8, "deleteItems:leaveTombstones:", v9, 0);

  -[WBTabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:](self->_tabGroupManager, "reloadTabGroupsFromDatabaseWithCompletionHandler:", 0);
}

uint64_t __70__WBTabCyclerCommandHandler__clearLocalProfilesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);
}

- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  void (**v10)(id, uint64_t);
  id v11;
  id v12;
  WBMutableTabGroup *v13;
  void *v14;
  WBMutableTabGroup *v15;
  WBMutableTabGroup *v16;
  _QWORD block[5];
  WBMutableTabGroup *v18;
  unint64_t v19;

  v10 = (void (**)(id, uint64_t))a6;
  v11 = a4;
  v12 = a3;
  v13 = [WBMutableTabGroup alloc];
  -[WBTabCyclerCommandHandler deviceIdentifier](self, "deviceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WBTabGroup initWithTitle:deviceIdentifier:](v13, "initWithTitle:deviceIdentifier:", v12, v14);

  -[WBMutableTabGroup setProfileIdentifier:](v15, "setProfileIdentifier:", v11);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__WBTabCyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke;
  block[3] = &unk_24CB32538;
  v18 = v15;
  v19 = a5;
  block[4] = self;
  v16 = v15;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v10[2](v10, 1);

}

void __92__WBTabCyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tabGroupBeforeIndex:inProfileWithIdentifier:", v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "insertTabGroup:afterTabGroup:", *(_QWORD *)(a1 + 40), v6);
}

- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  int v15;
  WBTabGroupManager *tabGroupManager;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  WebBookmark *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  WebBookmark *v25;
  void *v26;
  WBTabGroupManager *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  WBMutableTab *v31;
  void *v32;
  WBMutableTab *v33;
  WBMutableTab *v34;
  id v35;
  id v36;
  _QWORD block[5];
  id v38;
  WBMutableTab *v39;
  unint64_t v40;

  v36 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, uint64_t))a7;
  v15 = objc_msgSend(v13, "hasPrefix:", CFSTR("TopScopedBookmarkList_"));
  tabGroupManager = self->_tabGroupManager;
  if (!v15)
  {
    -[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", v13);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v31 = [WBMutableTab alloc];
      -[WBTabCyclerCommandHandler deviceIdentifier](self, "deviceIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[WBTab initWithTitle:url:deviceIdentifier:](v31, "initWithTitle:url:deviceIdentifier:", v36, v12, v32);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __92__WBTabCyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke;
      block[3] = &unk_24CB345C0;
      block[4] = self;
      v18 = v18;
      v38 = v18;
      v39 = v33;
      v40 = a6;
      v34 = v33;
      dispatch_sync(MEMORY[0x24BDAC9B8], block);
      v14[2](v14, 1);

      goto LABEL_7;
    }
LABEL_6:
    v14[2](v14, 0);
    goto LABEL_7;
  }
  objc_msgSend(v13, "substringFromIndex:", objc_msgSend(CFSTR("TopScopedBookmarkList_"), "length"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager tabGroupWithUUID:](tabGroupManager, "tabGroupWithUUID:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_6;
  -[WBTabGroupManager topScopedBookmarkListForTabGroup:](self->_tabGroupManager, "topScopedBookmarkListForTabGroup:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = a6;
  v21 = [WebBookmark alloc];
  objc_msgSend(v12, "absoluteString");
  v35 = v12;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v19, "folderID");
  -[WBTabGroupManager deviceIdentifier](self->_tabGroupManager, "deviceIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[WebBookmark initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:](v21, "initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:", v36, v22, v23, 1, v24, 1);

  -[WBTabCyclerCommandHandler _tabGroupFavoriteBeforeIndex:inList:](self, "_tabGroupFavoriteBeforeIndex:inList:", v20, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self->_tabGroupManager;
  v28 = objc_msgSend(v19, "folderID");
  objc_msgSend(v26, "UUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28;
  v12 = v35;
  -[WBTabGroupManager insertScopedBookmark:inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:](v27, "insertScopedBookmark:inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:", v25, v30, v29, 1);

  v14[2](v14, 1);
LABEL_7:

}

void __92__WBTabCyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __92__WBTabCyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_2;
  v6[3] = &unk_24CB34598;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v3, 1, v6);

}

void __92__WBTabCyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_mutableTabBeforeIndex:inGroup:", *(_QWORD *)(a1 + 48), v4, v7, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertTabs:afterTab:", v5, v6);

}

- (void)createProfileWithTitle:(id)a3 symbolName:(id)a4 inListWithIdentifier:(id)a5 reply:(id)a6
{
  void (**v9)(id, uint64_t, void *);
  id v10;
  id v11;
  WBProfile *v12;
  void *v13;
  WBProfile *v14;
  void *v15;
  WBProfile *v16;
  _QWORD block[5];
  WBProfile *v18;

  v9 = (void (**)(id, uint64_t, void *))a6;
  v10 = a4;
  v11 = a3;
  v12 = [WBProfile alloc];
  -[WBTabCyclerCommandHandler deviceIdentifier](self, "deviceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WBProfile initWithTitle:symbolImageName:favoritesFolderServerID:deviceIdentifier:](v12, "initWithTitle:symbolImageName:favoritesFolderServerID:deviceIdentifier:", v11, v10, CFSTR("Favorites Bar"), v13);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__WBTabCyclerCommandHandler_createProfileWithTitle_symbolName_inListWithIdentifier_reply___block_invoke;
  block[3] = &unk_24CB31830;
  block[4] = self;
  v18 = v14;
  v16 = v14;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  -[WBProfile identifier](v16, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 1, v15);

}

uint64_t __90__WBTabCyclerCommandHandler_createProfileWithTitle_symbolName_inListWithIdentifier_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "appendProfile:completionHandler:", *(_QWORD *)(a1 + 40), 0);
}

- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[WBTabCyclerCommandHandler _profileWithIdentifier:](self, "_profileWithIdentifier:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WBTabCyclerCommandHandler _deleteProfile:reply:](self, "_deleteProfile:reply:", v7, v6);
  }
  else
  {
    -[WBTabCyclerCommandHandler _tabGroupWithIdentifier:](self, "_tabGroupWithIdentifier:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[WBTabCyclerCommandHandler _deleteTabGroup:reply:](self, "_deleteTabGroup:reply:", v8, v6);
    }
    else
    {
      -[WBTabCyclerCommandHandler _tabWithIdentifier:](self, "_tabWithIdentifier:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        -[WBTabCyclerCommandHandler _deleteTab:reply:](self, "_deleteTab:reply:", v9, v6);
      else
        v6[2](v6, 0);

    }
  }

}

- (void)_deleteProfile:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  _QWORD block[5];
  id v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WBTabCyclerCommandHandler__deleteProfile_reply___block_invoke;
  block[3] = &unk_24CB31830;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  v7 = (void (**)(id, uint64_t))a4;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v7[2](v7, 1);

}

uint64_t __50__WBTabCyclerCommandHandler__deleteProfile_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeProfile:completionHandler:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_deleteTabGroup:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  _QWORD block[5];
  id v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WBTabCyclerCommandHandler__deleteTabGroup_reply___block_invoke;
  block[3] = &unk_24CB31830;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  v7 = (void (**)(id, uint64_t))a4;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v7[2](v7, 1);

}

uint64_t __51__WBTabCyclerCommandHandler__deleteTabGroup_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeTabGroup:", *(_QWORD *)(a1 + 40));
}

- (void)_deleteTab:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WBTabCyclerCommandHandler__deleteTab_reply___block_invoke;
  block[3] = &unk_24CB345E8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

void __46__WBTabCyclerCommandHandler__deleteTab_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "tabGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__WBTabCyclerCommandHandler__deleteTab_reply___block_invoke_2;
  v4[3] = &unk_24CB31568;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v3, 1, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __46__WBTabCyclerCommandHandler__deleteTab_reply___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDBCE30];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);

}

- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v17 = a3;
  v10 = a4;
  v11 = a6;
  -[WBTabCyclerCommandHandler _tabGroupWithIdentifier:](self, "_tabGroupWithIdentifier:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[WBTabCyclerCommandHandler _moveTabGroup:toProfileWithIdentifier:atIndex:reply:](self, "_moveTabGroup:toProfileWithIdentifier:atIndex:reply:", v12, v10, a5, v11);
  }
  else
  {
    -[WBTabCyclerCommandHandler _tabWithIdentifier:](self, "_tabWithIdentifier:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabCyclerCommandHandler _tabGroupWithIdentifier:](self, "_tabGroupWithIdentifier:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __93__WBTabCyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke;
    block[3] = &unk_24CB34610;
    block[4] = self;
    v19 = v13;
    v20 = v14;
    v22 = a5;
    v21 = v11;
    v15 = v14;
    v16 = v13;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __93__WBTabCyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v7[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_tabBeforeIndex:inGroup:", *(_QWORD *)(a1 + 64), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v3, v4, v5, 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_moveTabGroup:(id)a3 toProfileWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  WBTabCyclerCommandHandler *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v10 = a3;
  v21 = a4;
  v11 = (void (**)(id, _QWORD))a6;
  -[WBTabCyclerCommandHandler _profileWithIdentifier:](self, "_profileWithIdentifier:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    v11[2](v11, 0);
  -[WBTabGroupManager namedTabGroupsForProfileWithIdentifier:](self->_tabGroupManager, "namedTabGroupsForProfileWithIdentifier:", v21, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __81__WBTabCyclerCommandHandler__moveTabGroup_toProfileWithIdentifier_atIndex_reply___block_invoke;
  v28[3] = &unk_24CB34638;
  v16 = v10;
  v29 = v16;
  if (objc_msgSend(v14, "indexOfObjectPassingTest:", v28) >= a5)
    v17 = a5;
  else
    v17 = a5 + 1;
  -[WBTabCyclerCommandHandler _tabGroupBeforeIndex:inProfileWithIdentifier:](self, "_tabGroupBeforeIndex:inProfileWithIdentifier:", v17, v13);
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __81__WBTabCyclerCommandHandler__moveTabGroup_toProfileWithIdentifier_atIndex_reply___block_invoke_2;
  block[3] = &unk_24CB32408;
  v24 = v16;
  v25 = v13;
  v26 = self;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v27;
  v19 = v13;
  v20 = v16;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11[2](v11, 1);

}

uint64_t __81__WBTabCyclerCommandHandler__moveTabGroup_toProfileWithIdentifier_atIndex_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __81__WBTabCyclerCommandHandler__moveTabGroup_toProfileWithIdentifier_atIndex_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "profileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  v4 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
  v5 = *(_QWORD *)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "moveTabGroup:afterTabGroup:", v5, *(_QWORD *)(a1 + 56));
  else
    return objc_msgSend(v4, "moveTabGroup:toProfileWithIdentifier:afterTabGroup:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[WBTabCyclerCommandHandler _profileWithIdentifier:](self, "_profileWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[WBTabCyclerCommandHandler _setTitle:forProfileWithIdentifier:reply:](self, "_setTitle:forProfileWithIdentifier:reply:", v13, v8, v9);
  }
  else
  {
    -[WBTabCyclerCommandHandler _tabGroupWithIdentifier:](self, "_tabGroupWithIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[WBTabCyclerCommandHandler _setTitle:forTabGroupWithUUID:reply:](self, "_setTitle:forTabGroupWithUUID:reply:", v13, v8, v9);
    }
    else
    {
      -[WBTabCyclerCommandHandler _tabWithIdentifier:](self, "_tabWithIdentifier:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[WBTabCyclerCommandHandler _setTitle:forTabWithUUID:reply:](self, "_setTitle:forTabWithUUID:reply:", v13, v8, v9);
      else
        v9[2](v9, 0);

    }
  }

}

- (void)_setTitle:(id)a3 forTabGroupWithUUID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WBTabCyclerCommandHandler__setTitle_forTabGroupWithUUID_reply___block_invoke;
  block[3] = &unk_24CB324C0;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v12 = v9;
  v11 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11[2](v11, 1);

}

void __65__WBTabCyclerCommandHandler__setTitle_forTabGroupWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__WBTabCyclerCommandHandler__setTitle_forTabGroupWithUUID_reply___block_invoke_2;
  v3[3] = &unk_24CB31568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "updateTabGroupWithUUID:persist:usingBlock:", v1, 1, v3);

}

uint64_t __65__WBTabCyclerCommandHandler__setTitle_forTabGroupWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", *(_QWORD *)(a1 + 32));
}

- (void)_setTitle:(id)a3 forTabWithUUID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WBTabCyclerCommandHandler__setTitle_forTabWithUUID_reply___block_invoke;
  block[3] = &unk_24CB324C0;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v12 = v9;
  v11 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11[2](v11, 1);

}

void __60__WBTabCyclerCommandHandler__setTitle_forTabWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__WBTabCyclerCommandHandler__setTitle_forTabWithUUID_reply___block_invoke_2;
  v3[3] = &unk_24CB34660;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "updateTabWithUUID:persist:notify:usingBlock:", v1, 1, 1, v3);

}

uint64_t __60__WBTabCyclerCommandHandler__setTitle_forTabWithUUID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", *(_QWORD *)(a1 + 32));
}

- (void)_setTitle:(id)a3 forProfileWithIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__WBTabCyclerCommandHandler__setTitle_forProfileWithIdentifier_reply___block_invoke;
  block[3] = &unk_24CB324C0;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v12 = v9;
  v11 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11[2](v11, 1);

}

void __70__WBTabCyclerCommandHandler__setTitle_forProfileWithIdentifier_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__WBTabCyclerCommandHandler__setTitle_forProfileWithIdentifier_reply___block_invoke_2;
  v4[3] = &unk_24CB34688;
  v5 = *(id *)(a1 + 48);
  v3 = (id)objc_msgSend(v2, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", v1, 1, v4, 0);

}

uint64_t __70__WBTabCyclerCommandHandler__setTitle_forProfileWithIdentifier_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", *(_QWORD *)(a1 + 32));
}

- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WBTabCyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke;
  block[3] = &unk_24CB324C0;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v12 = v9;
  v11 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11[2](v11, 1);

}

void __68__WBTabCyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__WBTabCyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_2;
  v3[3] = &unk_24CB34660;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "updateTabWithUUID:persist:notify:usingBlock:", v1, 1, 1, v3);

}

uint64_t __68__WBTabCyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUrl:", *(_QWORD *)(a1 + 32));
}

- (void)setSymbolImageName:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[WBTabCyclerCommandHandler _profileWithIdentifier:](self, "_profileWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[WBTabCyclerCommandHandler _setSymbolImageName:forProfileWithIdentifier:reply:](self, "_setSymbolImageName:forProfileWithIdentifier:reply:", v11, v8, v9);
  else
    v9[2](v9, 0);

}

- (void)_setSymbolImageName:(id)a3 forProfileWithIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__WBTabCyclerCommandHandler__setSymbolImageName_forProfileWithIdentifier_reply___block_invoke;
  block[3] = &unk_24CB324C0;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v12 = v9;
  v11 = (void (**)(id, uint64_t))a5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11[2](v11, 1);

}

void __80__WBTabCyclerCommandHandler__setSymbolImageName_forProfileWithIdentifier_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__WBTabCyclerCommandHandler__setSymbolImageName_forProfileWithIdentifier_reply___block_invoke_2;
  v4[3] = &unk_24CB34688;
  v5 = *(id *)(a1 + 48);
  v3 = (id)objc_msgSend(v2, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", v1, 1, v4, 0);

}

uint64_t __80__WBTabCyclerCommandHandler__setSymbolImageName_forProfileWithIdentifier_reply___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSymbolImageName:", *(_QWORD *)(a1 + 32));
}

- (void)syncBookmarksWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__WBTabCyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke;
  v6[3] = &unk_24CB319F0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __64__WBTabCyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "tabGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(id **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "_startMonitoringSyncStatusWithCompletionHandler:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_triggerTabGroupSync");
  }
  else
  {
    objc_msgSend(v4[1], "lockSync");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tabCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSyncData:forKey:", 0, CFSTR("BASyncData"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlockSync");
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __64__WBTabCyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke_2;
    v10 = &unk_24CB346B0;
    v6 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = v6;
    objc_msgSend(v11, "_startMonitoringSyncStatusWithCompletionHandler:", &v7);
    objc_msgSend(*(id *)(a1 + 32), "_triggerTabGroupSync", v7, v8, v9, v10, v11);

  }
}

uint64_t __64__WBTabCyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_startMonitoringTabGroupUpdateExpectingMigration:completionHandler:", 1, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "reloadTabGroupsFromDatabaseWithCompletionHandler:", 0);
}

- (id)deviceIdentifier
{
  return -[WBTabCollection currentDeviceIdentifier](self->_tabCollection, "currentDeviceIdentifier");
}

- (id)tabGroups
{
  return -[WBTabGroupManager allNamedTabGroupsUnsorted](self->_tabGroupManager, "allNamedTabGroupsUnsorted");
}

- (void)_triggerTabGroupSync
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_INFO, "Triggering tab group sync", v4, 2u);
  }
  +[WBTabGroupSyncAgentProxy sharedProxy](WBTabGroupSyncAgentProxy, "sharedProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleSyncIfNeeded");

}

- (void)_startMonitoringSyncStatusWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__WBTabCyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke;
  v13[3] = &unk_24CB346D8;
  objc_copyWeak(&v15, &location);
  v6 = v4;
  v14 = v6;
  -[WBSDistributedNotificationObserver setNotificationHandler:](self->_syncAgentNotificationObserver, "setNotificationHandler:", v13);
  v8 = v5;
  v9 = 3221225472;
  v10 = __77__WBTabCyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_34;
  v11 = &unk_24CB318F8;
  v7 = v6;
  v12 = v7;
  -[WBSDistributedNotificationObserver setTimeoutHandler:](self->_syncAgentNotificationObserver, "setTimeoutHandler:", &v8);
  -[WBSDistributedNotificationObserver waitWithTimeout:](self->_syncAgentNotificationObserver, "waitWithTimeout:", 900.0, v8, v9, v10, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

BOOL __77__WBTabCyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  _BOOL8 v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("syncResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue");
  if (v5 == 1)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "Sync finished but local migration has not completed. Waiting for migration to complete.", v14, 2u);
    }
    v8 = 0;
  }
  else
  {
    v6 = v5;
    if (v5 == 5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v8 = WeakRetained == 0;
      if (WeakRetained)
      {
        v9 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Sync agent reset sync data. Triggering another sync.", buf, 2u);
        }
        objc_msgSend(WeakRetained, "_triggerTabGroupSync");
      }

    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Sync agent finished syncing", v13, 2u);
      }
      (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6 == 0);
      v8 = 1;
    }
  }

  return v8;
}

uint64_t __77__WBTabCyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_INFO, "Timed out waiting for sync agent to finish syncing", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_startMonitoringTabGroupUpdateExpectingMigration:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  WBTabGroupManager *tabGroupManager;
  id v8;
  _WBTabCyclerTabGroupUpdateObserver *v9;
  _WBTabCyclerTabGroupUpdateObserver *tabGroupUpdateObserver;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  tabGroupManager = self->_tabGroupManager;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __96__WBTabCyclerCommandHandler__startMonitoringTabGroupUpdateExpectingMigration_completionHandler___block_invoke;
  v11[3] = &unk_24CB34700;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v12 = v8;
  +[_WBTabCyclerTabGroupUpdateObserver observeTabGroupManager:waitForTabGroups:handler:](_WBTabCyclerTabGroupUpdateObserver, "observeTabGroupManager:waitForTabGroups:handler:", tabGroupManager, v4, v11);
  v9 = (_WBTabCyclerTabGroupUpdateObserver *)objc_claimAutoreleasedReturnValue();
  tabGroupUpdateObserver = self->_tabGroupUpdateObserver;
  self->_tabGroupUpdateObserver = v9;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __96__WBTabCyclerCommandHandler__startMonitoringTabGroupUpdateExpectingMigration_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v4 = WeakRetained;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v4;
  }

}

- (id)_tabGroupBeforeIndex:(unint64_t)a3 inProfileWithIdentifier:(id)a4
{
  void *v5;
  void *v6;

  -[WBTabGroupManager namedTabGroupsForProfileWithIdentifier:](self->_tabGroupManager, "namedTabGroupsForProfileWithIdentifier:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    if (objc_msgSend(v5, "count") >= a3)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", a3 - 1);
      a3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a3 = 0;
    }
  }

  return (id)a3;
}

- (id)_tabBeforeIndex:(unint64_t)a3 inGroup:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "tabs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= a3)
    {
      objc_msgSend(v6, "tabs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3 - 1);
      a3 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a3 = 0;
    }
  }

  return (id)a3;
}

- (id)_mutableTabBeforeIndex:(unint64_t)a3 inGroup:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "tabs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= a3)
    {
      objc_msgSend(v6, "tabs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3 - 1);
      a3 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a3 = 0;
    }
  }

  return (id)a3;
}

- (id)_tabGroupFavoriteBeforeIndex:(unint64_t)a3 inList:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    if (objc_msgSend(v5, "bookmarkCount") >= a3)
    {
      objc_msgSend(v6, "bookmarkArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", a3 - 1);
      a3 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a3 = 0;
    }
  }

  return (id)a3;
}

- (id)_profileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[WBTabGroupManager profiles](self->_tabGroupManager, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__WBTabCyclerCommandHandler__profileWithIdentifier___block_invoke;
  v11[3] = &unk_24CB34728;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[WBTabGroupManager profiles](self->_tabGroupManager, "profiles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __52__WBTabCyclerCommandHandler__profileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_tabGroupWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[WBTabCyclerCommandHandler tabGroups](self, "tabGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__WBTabCyclerCommandHandler__tabGroupWithIdentifier___block_invoke;
  v11[3] = &unk_24CB34638;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[WBTabCyclerCommandHandler tabGroups](self, "tabGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __53__WBTabCyclerCommandHandler__tabGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_tabWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  -[WBTabCyclerCommandHandler tabGroups](self, "tabGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__WBTabCyclerCommandHandler__tabWithIdentifier___block_invoke;
  v9[3] = &unk_24CB34750;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__WBTabCyclerCommandHandler__tabWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a2;
  objc_msgSend(v12, "tabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__WBTabCyclerCommandHandler__tabWithIdentifier___block_invoke_2;
  v13[3] = &unk_24CB34348;
  v14 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v13);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v12, "tabs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

uint64_t __48__WBTabCyclerCommandHandler__tabWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_cyclerRepresentationOfProfile:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WBTabGroupManager *tabGroupManager;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE83108]);
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithTitle:symbolImageName:uniqueIdentifier:", v6, v7, v8);

  tabGroupManager = self->_tabGroupManager;
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager namedTabGroupsForProfileWithIdentifier:](tabGroupManager, "namedTabGroupsForProfileWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        -[WBTabCyclerCommandHandler _cyclerRepresentationOfTabGroup:](self, "_cyclerRepresentationOfTabGroup:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17), (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addChild:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v9;
}

- (id)_cyclerRepresentationOfTabGroup:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE83110]);
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:uniqueIdentifier:", v6, v7);

  -[WBTabCyclerCommandHandler _cyclerRepresentationOfTopScopedBookmarkListForTabGroup:](self, "_cyclerRepresentationOfTopScopedBookmarkListForTabGroup:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addChild:", v9);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "tabs", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[WBTabCyclerCommandHandler _cyclerRepresentationOfTab:](self, "_cyclerRepresentationOfTab:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addChild:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v8;
}

- (id)_cyclerRepresentationOfTab:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BE830F0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithURL:title:uniqueIdentifier:", v6, v7, v8);
  return v9;
}

- (id)_cyclerRepresentationOfTopScopedBookmarkListForTabGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WBTabGroupManager topScopedBookmarkListForTabGroup:](self->_tabGroupManager, "topScopedBookmarkListForTabGroup:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE83118]);
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), CFSTR("TopScopedBookmarkList_"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithTitle:uniqueIdentifier:", &stru_24CB35168, v9);

  objc_msgSend(v5, "bookmarkArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[WBTabCyclerCommandHandler _cyclerRepresentationOfTabGroupFavorite:](self, "_cyclerRepresentationOfTabGroupFavorite:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addChild:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

- (id)_cyclerRepresentationOfTabGroupFavorite:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BE830F0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v4, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v5, "initWithURL:title:uniqueIdentifier:", v8, v9, v10);
  return v11;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_clearLocalTabGroupsRetryTimer, 0);
  objc_storeStrong((id *)&self->_syncAgentNotificationObserver, 0);
  objc_storeStrong((id *)&self->_tabGroupUpdateObserver, 0);
  objc_storeStrong((id *)&self->_tabCollection, 0);
}

@end
