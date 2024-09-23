@implementation WBSSavedAccountStore

void __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD block[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke_cold_1(v5);
    }
    else
    {
      +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachedGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      {
        *((_BYTE *)WeakRetained + 216) = 1;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v8 = *((id *)WeakRetained + 17);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v9)
        {
          v10 = v9;
          v19 = v7;
          LOBYTE(v11) = 0;
          v12 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v8);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              v15 = (void *)*((_QWORD *)WeakRetained + 16);
              objc_msgSend(v14, "groupID", v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if ((v11 & 1) != 0)
                v11 = 1;
              else
                v11 = objc_msgSend(WeakRetained, "_deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:inGroup:", v17, v14);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v10);

          *((_BYTE *)WeakRetained + 216) = 0;
          v7 = v19;
          if (v11)
          {
            objc_msgSend(WeakRetained, "_resetOnInternalQueue");
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke_225;
            block[3] = &unk_1E649B768;
            block[4] = WeakRetained;
            dispatch_async(MEMORY[0x1E0C80D38], block);
          }
        }
        else
        {

          *((_BYTE *)WeakRetained + 216) = 0;
        }
      }
      else
      {
        v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B2621000, v18, OS_LOG_TYPE_DEFAULT, "Aborting clean up for passwords with unmatchable contributor ID because groups have changed since the account store was loaded.", buf, 2u);
        }
        objc_msgSend(WeakRetained, "_updateCachedSharedAccountGroupsOnInternalQueue");
      }

    }
  }

}

- (void)_updateCachedSharedAccountGroupsOnInternalQueue
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *sharedAccountsGroups;
  _QWORD block[5];

  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((WBSIsEqual(v4, self->_sharedAccountsGroups) & 1) == 0)
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    sharedAccountsGroups = self->_sharedAccountsGroups;
    self->_sharedAccountsGroups = v5;

    -[WBSSavedAccountStore _resetOnInternalQueue](self, "_resetOnInternalQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__WBSSavedAccountStore__updateCachedSharedAccountGroupsOnInternalQueue__block_invoke;
    block[3] = &unk_1E649B768;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)_resetOnInternalQueue
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSArray *savedAccounts;
  NSArray *savedAccountsWithPasswords;
  NSArray *v8;
  NSMutableDictionary *personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  NSMutableDictionary *groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
  NSArray *savedAccountsInPersonalKeychain;
  NSMutableArray *allRecentlyDeletedSavedAccounts;
  NSMutableArray *recentlyDeletedSavedAccountsInPersonalKeychain;
  NSMutableDictionary *recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  NSMutableDictionary *recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  NSMutableDictionary *sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
  _QWORD block[5];
  uint8_t buf[16];

  +[WBSKeyBagLockStatusManager sharedManager](WBSKeyBagLockStatusManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyBagLockStatus");

  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Skipping account store reset because the key bag is locked", buf, 2u);
    }
  }
  else
  {
    savedAccounts = self->_savedAccounts;
    self->_savedAccounts = 0;

    savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
    self->_savedAccountsWithPasswords = 0;

    v8 = self->_savedAccountsWithPasswords;
    self->_savedAccountsWithPasswords = 0;

    *(_WORD *)&self->_hasPasswordsEligibleForAutoFill = 0;
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = 0;

    groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = 0;

    savedAccountsInPersonalKeychain = self->_savedAccountsInPersonalKeychain;
    self->_savedAccountsInPersonalKeychain = 0;

    allRecentlyDeletedSavedAccounts = self->_allRecentlyDeletedSavedAccounts;
    self->_allRecentlyDeletedSavedAccounts = 0;

    recentlyDeletedSavedAccountsInPersonalKeychain = self->_recentlyDeletedSavedAccountsInPersonalKeychain;
    self->_recentlyDeletedSavedAccountsInPersonalKeychain = 0;

    recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = 0;

    recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    self->_recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = 0;

    sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
    self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__WBSSavedAccountStore__resetOnInternalQueue__block_invoke;
    block[3] = &unk_1E649B768;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __50__WBSSavedAccountStore__fetchSharedAccountsGroups__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCachedSharedAccountGroupsOnInternalQueue");
}

uint64_t __71__WBSSavedAccountStore__updateCachedSharedAccountGroupsOnInternalQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

void __35__WBSSavedAccountStore_sharedStore__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initAndPrewarmSavedAccounts:", 1);
  v2 = (void *)sharedStore_store;
  sharedStore_store = v1;

}

- (id)initAndPrewarmSavedAccounts:(BOOL)a3
{
  _BOOL8 v3;
  WBSAuthenticationServicesAgentProxy *v5;
  WBSSavedAccountStore *v6;

  v3 = a3;
  v5 = objc_alloc_init(WBSAuthenticationServicesAgentProxy);
  -[WBSAuthenticationServicesAgentProxy setDelegate:](v5, "setDelegate:", self);
  v6 = -[WBSSavedAccountStore initWithAuthenticationServicesAgentProxy:shouldPrewarmSavedAccounts:limitedToDomains:](self, "initWithAuthenticationServicesAgentProxy:shouldPrewarmSavedAccounts:limitedToDomains:", v5, v3, 0);

  return v6;
}

- (WBSSavedAccountStore)initWithAuthenticationServicesAgentProxy:(id)a3 shouldPrewarmSavedAccounts:(BOOL)a4 limitedToDomains:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  WBSSavedAccountStore *v11;
  uint64_t v12;
  NSArray *domainsStoreIsLimitedTo;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  WBSKeychainCredentialNotificationMonitor *v20;
  WBSKeychainCredentialNotificationMonitor *keychainMonitor;
  WBSKeychainCredentialNotificationMonitor *v22;
  uint64_t v23;
  uint64_t v24;
  id keychainNotificationRegistrationToken;
  void *v26;
  void *v27;
  uint64_t v28;
  WBSDiagnosticStateCollector *stateCollector;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  WBSSavedAccountStore *v35;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  objc_super v42;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)WBSSavedAccountStore;
  v11 = -[WBSSavedAccountStore init](&v42, sel_init);
  if (v11)
  {
    objc_initWeak(&location, v11);
    v12 = objc_msgSend(v10, "copy");
    domainsStoreIsLimitedTo = v11->_domainsStoreIsLimitedTo;
    v11->_domainsStoreIsLimitedTo = (NSArray *)v12;

    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("com.apple.SafariCore.%@.%p"), v16, v11);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    v20 = -[WBSKeychainCredentialNotificationMonitor initWithCoalescingInterval:]([WBSKeychainCredentialNotificationMonitor alloc], "initWithCoalescingInterval:", 0.002);
    keychainMonitor = v11->_keychainMonitor;
    v11->_keychainMonitor = v20;

    v22 = v11->_keychainMonitor;
    v23 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __109__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains___block_invoke;
    v39[3] = &unk_1E649B5B0;
    objc_copyWeak(&v40, &location);
    -[WBSKeychainCredentialNotificationMonitor addObserverWithBlock:](v22, "addObserverWithBlock:", v39);
    v24 = objc_claimAutoreleasedReturnValue();
    keychainNotificationRegistrationToken = v11->_keychainNotificationRegistrationToken;
    v11->_keychainNotificationRegistrationToken = (id)v24;

    +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubscriber:", v11);

    -[WBSSavedAccountStore _fetchSharedAccountsGroups](v11, "_fetchSharedAccountsGroups");
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v11, sel__signInWithApplePushNotificationReceived_, CFSTR("com.apple.authkit.siwa-consented-app-list-changed"), 0);

    objc_storeStrong((id *)&v11->_authenticationServicesAgentProxy, a3);
    v37[0] = v23;
    v37[1] = 3221225472;
    v37[2] = __109__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains___block_invoke_3;
    v37[3] = &unk_1E649F410;
    objc_copyWeak(&v38, &location);
    +[WBSDiagnosticStateCollector registeredStateCollectorWithLogLabel:payloadProvider:](WBSDiagnosticStateCollector, "registeredStateCollectorWithLogLabel:payloadProvider:", CFSTR("Saved Account Store State"), v37);
    v28 = objc_claimAutoreleasedReturnValue();
    stateCollector = v11->_stateCollector;
    v11->_stateCollector = (WBSDiagnosticStateCollector *)v28;

    if (v6)
    {
      -[WBSSavedAccountStore websiteNameProvider](v11, "websiteNameProvider");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "prewarm");

      -[WBSSavedAccountStore _prewarm](v11, "_prewarm");
    }
    -[WBSSavedAccountStore _moveContributedSavedAccountsBackToPersonalKeychainIfNecessary](v11, "_moveContributedSavedAccountsBackToPersonalKeychainIfNecessary");
    -[WBSSavedAccountStore _performCleanupForExitedGroupsIfNecessary:](v11, "_performCleanupForExitedGroupsIfNecessary:", &__block_literal_global_57);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "processName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("AuthenticationServicesAgent"));

    if (v33)
    {
      v11->_shouldShowServiceNamesForPasswordAndPasskeyItems = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObserver:forKeyPath:options:context:", v11, CFSTR("ShowServiceNamesInPasswords"), 0, showServiceNamesInPasswordsEnabledKVOContext);
      -[WBSSavedAccountStore _updateShowServiceNamesInPasswordsPreference](v11, "_updateShowServiceNamesInPasswordsPreference");

    }
    v35 = v11;
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)_fetchSharedAccountsGroups
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSSavedAccountStore__fetchSharedAccountsGroups__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_prewarm
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__WBSSavedAccountStore__prewarm__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_loadRecentlyDeletedSavedAccounts
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_savedAccountsWithPasswords)
    v3 = -[WBSSavedAccountStore _loadSavedAccounts](self, "_loadSavedAccounts");
  -[WBSSavedAccountStore _loadRecentlyDeletedSavedAccountsInPersonalKeychain](self, "_loadRecentlyDeletedSavedAccountsInPersonalKeychain");
  v4 = (void *)-[NSMutableArray mutableCopy](self->_recentlyDeletedSavedAccountsInPersonalKeychain, "mutableCopy");
  -[NSArray safari_mapObjectsUsingBlock:](self->_sharedAccountsGroups, "safari_mapObjectsUsingBlock:", &__block_literal_global_173);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:](self, "_loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:", v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "sortUsingSelector:", sel_compare_);
  objc_storeStrong((id *)&self->_allRecentlyDeletedSavedAccounts, v4);
  if (self->_shouldShowServiceNamesForPasswordAndPasskeyItems)
    -[WBSSavedAccountStore _applyServiceNamesToSavedAccounts:](self, "_applyServiceNamesToSavedAccounts:", self->_allRecentlyDeletedSavedAccounts);
  -[WBSSavedAccountStore _cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:](self, "_cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:", 1);

}

- (void)_loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
  self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = v5;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v20 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safari_allRecentlyDeletedPasswordCredentialItemsInGroupWithID:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:](self, "_loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:", v12, v10, v11, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_groupIdentifiersToRecentlyDeletedPasskeysData, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSavedAccountStore _loadSavedAccountsWithPasskeysFromPasskeyData:forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:](self, "_loadSavedAccountsWithPasskeysFromPasskeyData:forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:", v15, v10, 1, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[WBSSavedAccountStore _mergeSavedAccountsWithPasskeys:andSavedAccountsWithPasswords:usingDictionaryForSavedAccountsWithPasswords:dictionaryForSavedAccountsWithPasskeys:](self, "_mergeSavedAccountsWithPasskeys:andSavedAccountsWithPasswords:usingDictionaryForSavedAccountsWithPasswords:dictionaryForSavedAccountsWithPasskeys:", v16, v13, v11, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, "setObject:forKeyedSubscript:", v18, v10);

        ++v9;
      }
      while (v8 != v9);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

}

- (void)_postSavedAccountStoreDidChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WBSSavedAccountStoreDidChangeNotification"), self);

}

- (id)_loadSavedAccounts
{
  NSObject *v3;
  NSObject *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts;
  void *v7;
  NSArray *v8;
  NSArray *savedAccountsInPersonalKeychain;
  NSMutableDictionary *v10;
  NSMutableDictionary *groupIdentifiersToSavedAccounts;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  NSArray *v22;
  NSArray *savedAccounts;
  NSArray *v24;
  NSArray *savedAccountsWithPasswords;
  void *v26;
  NSArray *v27;
  NSArray *v28;
  NSObject *v29;
  NSObject *v30;
  NSArray *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_DEFAULT, "Beginning saved account store load", buf, 2u);
  }
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B2621000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AccountStoreLoad", ", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts = self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts;
  self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _fetchAndFilterAllPasskeysData](self, "_fetchAndFilterAllPasskeysData");
  -[WBSSavedAccountStore _loadAndMergeSavedAccountsFromPersonalKeychainIntoAllSavedAccounts:](self, "_loadAndMergeSavedAccountsFromPersonalKeychainIntoAllSavedAccounts:", v7);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  savedAccountsInPersonalKeychain = self->_savedAccountsInPersonalKeychain;
  self->_savedAccountsInPersonalKeychain = v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  groupIdentifiersToSavedAccounts = self->_groupIdentifiersToSavedAccounts;
  self->_groupIdentifiersToSavedAccounts = v10;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = self->_sharedAccountsGroups;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v17, "groupID", (_QWORD)v33);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSavedAccountStore _loadAndMergeSavedAccountsFromGroupID:intoAllSavedAccounts:](self, "_loadAndMergeSavedAccountsFromGroupID:intoAllSavedAccounts:", v18, v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = self->_groupIdentifiersToSavedAccounts;
        objc_msgSend(v17, "groupID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v14);
  }

  if (-[NSArray count](self->_sharedAccountsGroups, "count"))
    -[WBSSavedAccountStore _identifySharedSavedAccountsWithSameUsernameAndHighLevelDomainPairs](self, "_identifySharedSavedAccountsWithSameUsernameAndHighLevelDomainPairs");
  -[WBSSavedAccountStore _fetchSignInWithAppleAccounts](self, "_fetchSignInWithAppleAccounts", (_QWORD)v33);
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  savedAccounts = self->_savedAccounts;
  self->_savedAccounts = v22;

  -[NSArray safari_filterObjectsUsingBlock:](self->_savedAccounts, "safari_filterObjectsUsingBlock:", &__block_literal_global_154);
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
  self->_savedAccountsWithPasswords = v24;

  if (-[NSArray count](self->_savedAccountsWithSignInWithAppleRecords, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_savedAccounts, "arrayByAddingObjectsFromArray:", self->_savedAccountsWithSignInWithAppleRecords);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sortedArrayUsingSelector:", sel_compare_);
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v28 = self->_savedAccounts;
    self->_savedAccounts = v27;

  }
  v29 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B2621000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AccountStoreLoad", ", buf, 2u);
  }
  v30 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v30, OS_LOG_TYPE_DEFAULT, "Completed saved account store load", buf, 2u);
  }
  -[WBSSavedAccountStore _cleanUpRedundantCredentialsWithoutUsernames](self, "_cleanUpRedundantCredentialsWithoutUsernames");
  -[WBSSavedAccountStore _cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:](self, "_cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:", 0);
  -[WBSSavedAccountStore _performRecentlyDeletedMaintenanceIfNecessary](self, "_performRecentlyDeletedMaintenanceIfNecessary");
  if (self->_shouldShowServiceNamesForPasswordAndPasskeyItems)
    -[WBSSavedAccountStore _applyServiceNamesToSavedAccounts:](self, "_applyServiceNamesToSavedAccounts:", self->_savedAccounts);
  v31 = self->_savedAccounts;

  return v31;
}

void __68__WBSSavedAccountStore__cleanUpRedundantCredentialsWithoutUsernames__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__WBSSavedAccountStore__cleanUpRedundantCredentialsWithoutUsernames__block_invoke_2;
  v13[3] = &unk_1E649F4C8;
  v13[4] = v2;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_removeCredentialTypes:forSavedAccount:", 1, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)_performRecentlyDeletedMaintenanceIfNecessary
{
  NSObject *queue;
  _QWORD block[5];

  if (-[WBSSavedAccountStore _canPerformMaintenanceTasks](self, "_canPerformMaintenanceTasks"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__WBSSavedAccountStore__performRecentlyDeletedMaintenanceIfNecessary__block_invoke;
    block[3] = &unk_1E649B768;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_moveContributedSavedAccountsBackToPersonalKeychainIfNecessary
{
  void *v3;
  NSObject *v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WBSSavedAccountStore _canPerformMaintenanceTasks](self, "_canPerformMaintenanceTasks"))
  {
    -[WBSSavedAccountStore _groupIDArrayForUserDefaultsKey:](self, "_groupIDArrayForUserDefaultsKey:", CFSTR("groupIdentifiersToMoveContributedCredentialsBackToPersonalKeychainFrom"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEFAULT, "Moving credentials back to personal keychain for group ID's recorded for cleanup: %@", buf, 0xCu);
      }
      queue = self->_queue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __86__WBSSavedAccountStore__moveContributedSavedAccountsBackToPersonalKeychainIfNecessary__block_invoke;
      v6[3] = &unk_1E649B6D8;
      v6[4] = self;
      v7 = v3;
      dispatch_async(queue, v6);

    }
  }
}

- (void)_performCleanupForExitedGroupsIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *queue;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  if (-[WBSSavedAccountStore _canPerformMaintenanceTasks](self, "_canPerformMaintenanceTasks"))
  {
    -[WBSSavedAccountStore _groupIDArrayForUserDefaultsKey:](self, "_groupIDArrayForUserDefaultsKey:", CFSTR("groupIdentifiersToDeleteAllItemsFrom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      queue = self->_queue;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke;
      v8[3] = &unk_1E649FD20;
      v10 = v4;
      v8[4] = self;
      v9 = v5;
      objc_msgSend(v6, "performTaskOnQueueAfterFetchingGroups:task:", queue, v8);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)_cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted:(BOOL)a3
{
  void *v4;
  void *v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  if (-[WBSSavedAccountStore _canPerformMaintenanceTasks](self, "_canPerformMaintenanceTasks", a3))
  {
    v4 = (void *)-[NSArray copy](self->_sharedAccountsGroups, "copy");
    objc_initWeak(&location, self);
    +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke;
    v8[3] = &unk_1E649FBB8;
    objc_copyWeak(&v10, &location);
    v7 = v4;
    v9 = v7;
    objc_msgSend(v5, "performTaskOnQueueAfterFetchingGroups:task:", queue, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

- (BOOL)_canPerformMaintenanceTasks
{
  if (isProcessAllowedToPerformAccountStoreMaintenance_onceToken != -1)
    dispatch_once(&isProcessAllowedToPerformAccountStoreMaintenance_onceToken, &__block_literal_global_702);
  return isProcessAllowedToPerformAccountStoreMaintenance_isAllowedToPerformMaintenance;
}

- (id)_loadAndMergeSavedAccountsFromPersonalKeychainIntoAllSavedAccounts:(id)a3
{
  return -[WBSSavedAccountStore _loadAndMergeSavedAccountsFromGroupID:intoAllSavedAccounts:](self, "_loadAndMergeSavedAccountsFromGroupID:intoAllSavedAccounts:", &stru_1E64A2498, a3);
}

- (id)_loadAndMergeSavedAccountsFromGroupID:(id)a3 intoAllSavedAccounts:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8)
  {
    if (!self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
      self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = v9;

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "setObject:forKeyedSubscript:", v11, v6);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v6);
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = v13;

    v12 = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  }
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[WBSSavedAccountStore _allInternetPasswordEntriesFromGroupID:](self, "_allInternetPasswordEntriesFromGroupID:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:](self, "_loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:", v17, v6, v15, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_groupIdentifiersToPasskeysData, "objectForKeyedSubscript:", v6);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WBSSavedAccountStore _allInternetPasswordEntriesFromPersonalKeychain](self, "_allInternetPasswordEntriesFromPersonalKeychain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:](self, "_loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:", v17, v6, v15, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_passkeysDataInPersonalKeychain;
  }
  v20 = v19;
  -[WBSSavedAccountStore _loadSavedAccountsWithPasskeysFromPasskeyData:forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:](self, "_loadSavedAccountsWithPasskeysFromPasskeyData:forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:", v19, v6, 0, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _mergeSavedAccountsWithPasskeys:andSavedAccountsWithPasswords:usingDictionaryForSavedAccountsWithPasswords:dictionaryForSavedAccountsWithPasskeys:](self, "_mergeSavedAccountsWithPasskeys:andSavedAccountsWithPasswords:usingDictionaryForSavedAccountsWithPasswords:dictionaryForSavedAccountsWithPasskeys:", v21, v18, v15, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _mergeLoadedSavedAccounts:intoAllSavedAccounts:](self, "_mergeLoadedSavedAccounts:intoAllSavedAccounts:", v22, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_mergeLoadedSavedAccounts:(id)a3 intoAllSavedAccounts:(id)a4
{
  __int128 v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  id obj;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v35 = a4;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v44;
    *(_QWORD *)&v6 = 138740227;
    v33 = v6;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v8, "highLevelDomain", v33);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v38 = i;
          objc_msgSend(v8, "highLevelDomain");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "additionalSites");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "safari_mapObjectsUsingBlock:", &__block_literal_global_180);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v40 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
                -[NSMutableDictionary objectForKeyedSubscript:](self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts, "objectForKeyedSubscript:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v21)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts, "setObject:forKeyedSubscript:", v21, v20);
                }
                objc_msgSend(v8, "user");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v23)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "user");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, v24);

                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "credentialTypes"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v26)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, v25);
                }
                objc_msgSend(v26, "addObject:", v8);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v17);
          }

          objc_msgSend(v35, "addObject:", v8);
          i = v38;
        }
        else
        {
          v27 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = v27;
            objc_msgSend(v8, "user");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "protectionSpaces");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v33;
            v50 = v29;
            v51 = 2117;
            v52 = v30;
            _os_log_error_impl(&dword_1B2621000, v28, OS_LOG_TYPE_ERROR, "Encountered saved account without high level domain with user: %{sensitive}@ protectionSpaces: %{sensitive}@", buf, 0x16u);

          }
        }
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v37);
  }
  objc_msgSend(obj, "sortedArrayUsingSelector:", sel_compare_);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)_loadRecentlyDeletedSavedAccountsInPersonalKeychain
{
  NSMutableDictionary *v3;
  NSMutableDictionary *recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *recentlyDeletedSavedAccountsInPersonalKeychain;
  id v13;

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = v3;
  v5 = v3;

  objc_msgSend(v13, "safari_allRecentlyDeletedPasswordCredentialItemsInPersonalKeychain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:](self, "_loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:", v6, &stru_1E64A2498, self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _loadSavedAccountsWithPasskeysFromPasskeyData:forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:](self, "_loadSavedAccountsWithPasskeysFromPasskeyData:forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:", self->_recentlyDeletedPasskeysDataInPersonalKeychain, &stru_1E64A2498, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _mergeSavedAccountsWithPasskeys:andSavedAccountsWithPasswords:usingDictionaryForSavedAccountsWithPasswords:dictionaryForSavedAccountsWithPasskeys:](self, "_mergeSavedAccountsWithPasskeys:andSavedAccountsWithPasswords:usingDictionaryForSavedAccountsWithPasswords:dictionaryForSavedAccountsWithPasskeys:", v9, v7, v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSMutableArray *)objc_msgSend(v10, "mutableCopy");
  recentlyDeletedSavedAccountsInPersonalKeychain = self->_recentlyDeletedSavedAccountsInPersonalKeychain;
  self->_recentlyDeletedSavedAccountsInPersonalKeychain = v11;

}

- (id)_mergeSavedAccountsWithPasskeys:(id)a3 andSavedAccountsWithPasswords:(id)a4 usingDictionaryForSavedAccountsWithPasswords:(id)a5 dictionaryForSavedAccountsWithPasskeys:(id)a6
{
  id v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  char v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v54 = a5;
  v53 = a6;
  v51 = (void *)objc_msgSend(a4, "mutableCopy");
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v9;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  if (v55)
  {
    v52 = *(_QWORD *)v75;
    v10 = 0x1E0C99000uLL;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v75 != v52)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend(v12, "user");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "highLevelDomain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "allValues");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = v19;
        v61 = objc_msgSend(v19, "count");
        if (objc_msgSend(v17, "count"))
        {
          v58 = v14;
          v59 = v13;
          v60 = i;
          objc_msgSend(*(id *)(v10 + 3560), "array");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v56 = v17;
          v64 = v17;
          v20 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v71;
            while (2)
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v71 != v22)
                  objc_enumerationMutation(v64);
                v24 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                objc_msgSend(v24, "sites");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "passkeyRelyingPartyID");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v25, "containsObject:", v26);

                if (v27)
                {
                  objc_msgSend(v62, "addObject:", v24);
                  goto LABEL_17;
                }
              }
              v21 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
              if (v21)
                continue;
              break;
            }
          }
LABEL_17:
          v57 = v16;

          objc_msgSend(*(id *)(v10 + 3560), "array");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v29 = v63;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v67;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v67 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
                objc_msgSend(v12, "passkeyRelyingPartyID");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "passkeyRelyingPartyID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v35, "isEqualToString:", v36);

                if (v37)
                  objc_msgSend(v28, "addObject:", v34);
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
            }
            while (v31);
          }

          if (objc_msgSend(v62, "count") == 1 && (v38 = objc_msgSend(v28, "count"), v39 = v62, v38 == 1)
            || objc_msgSend(v64, "count") == 1 && (v39 = v64, v61 == 1))
          {
            objc_msgSend(v39, "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = 0;
            v16 = v57;
            v14 = v58;
            if ((objc_msgSend(v40, "_canMergeWithSavedAccount:requiresDataCopying:", v12, &v65) & 1) != 0)
            {
              objc_msgSend(v12, "passkeyCredentialID");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setPasskeyCredentialID:", v41);

              objc_msgSend(v12, "passkeyUserHandle");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setPasskeyUserHandle:", v42);

              objc_msgSend(v12, "passkeyRelyingPartyID");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setPasskeyRelyingPartyID:", v43);

              objc_msgSend(v12, "creationDateForPasskey");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setCreationDateForPasskey:", v44);

              objc_msgSend(v12, "lastModifiedDate");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setLastModifiedDateForPasskey:", v45);

              objc_msgSend(v12, "lastUsedDateForPasskey");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setLastUsedDateForPasskey:", v46);

              objc_msgSend(v40, "_mergePasskeySidecarsFromSavedAccount:", v12);
              i = v60;
              if (v65)
                -[WBSSavedAccountStore _writeSidecarDataForMergedSavedAccount:](self, "_writeSidecarDataForMergedSavedAccount:", v40);
            }
            else
            {
              objc_msgSend(v51, "addObject:", v12);
              i = v60;
            }

            v10 = 0x1E0C99000;
          }
          else
          {
            objc_msgSend(v51, "addObject:", v12);
            v10 = 0x1E0C99000;
            i = v60;
            v16 = v57;
            v14 = v58;
          }

          v13 = v59;
          v17 = v56;
        }
        else
        {
          objc_msgSend(v51, "addObject:", v12);
        }

      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    }
    while (v55);
  }

  objc_msgSend(v51, "sortedArrayUsingSelector:", sel_compare_);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

- (void)_fetchAndFilterRecentlyDeletedPasskeysData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *recentlyDeletedPasskeysDataInPersonalKeychain;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSDictionary *v19;
  NSDictionary *groupIdentifiersToRecentlyDeletedPasskeysData;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "recentlyDeletedPasskeysData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v2;
  v22 = v3;
  v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v23)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IsSynchronizable"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
        {
          objc_msgSend(v3, "addObject:", v8);
        }
        else
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GroupID"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "length"))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v11)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

            }
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v8);

            v3 = v22;
          }

        }
      }
      v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v23);
  }

  v14 = (NSArray *)objc_msgSend(v3, "copy");
  recentlyDeletedPasskeysDataInPersonalKeychain = self->_recentlyDeletedPasskeysDataInPersonalKeychain;
  self->_recentlyDeletedPasskeysDataInPersonalKeychain = v14;

  v16 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 136315394;
    v29 = "-[WBSSavedAccountStore _fetchAndFilterRecentlyDeletedPasskeysData]";
    v30 = 2048;
    v31 = v18;
    _os_log_impl(&dword_1B2621000, v17, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu recently deleted passkey keychain records from personal keychain", buf, 0x16u);

    v3 = v22;
  }
  v19 = (NSDictionary *)objc_msgSend(v4, "copy");
  groupIdentifiersToRecentlyDeletedPasskeysData = self->_groupIdentifiersToRecentlyDeletedPasskeysData;
  self->_groupIdentifiersToRecentlyDeletedPasskeysData = v19;

  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_175);
}

- (void)_fetchAndFilterAllPasskeysData
{
  -[WBSSavedAccountStore _fetchAndFilterPasskeysData](self, "_fetchAndFilterPasskeysData");
  -[WBSSavedAccountStore _fetchAndFilterRecentlyDeletedPasskeysData](self, "_fetchAndFilterRecentlyDeletedPasskeysData");
}

- (void)_fetchAndFilterPasskeysData
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *highLevelDomainToLegacyPlatformAuthenticatorCredentials;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *passkeysDataInPersonalKeychain;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSDictionary *v26;
  NSDictionary *groupIdentifiersToPasskeysData;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "passkeysData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  highLevelDomainToLegacyPlatformAuthenticatorCredentials = self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials;
  self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials = v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IsSynchronizable"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "BOOLValue"))
        {
          objc_msgSend(v28, "addObject:", v11);
          self->_hasPasskeysEligibleForAutoFill = 1;
        }
        else
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GroupID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "length"))
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v13);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v11);

            self->_hasPasskeysEligibleForAutoFill = 1;
          }
          else
          {
            objc_msgSend(v11, "safari_stringForKey:", CFSTR("CredentialRelyingPartyID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "safari_highLevelDomainForPasswordManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableDictionary safari_mutableArrayForKey:](self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials, "safari_mutableArrayForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = v19;
              objc_msgSend(v19, "addObject:", v11);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials, "setObject:forKeyedSubscript:", v20, v18);
            }

          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v8);
  }

  v21 = (NSArray *)objc_msgSend(v28, "copy");
  passkeysDataInPersonalKeychain = self->_passkeysDataInPersonalKeychain;
  self->_passkeysDataInPersonalKeychain = v21;

  v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    v25 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 136315394;
    v35 = "-[WBSSavedAccountStore _fetchAndFilterPasskeysData]";
    v36 = 2048;
    v37 = v25;
    _os_log_impl(&dword_1B2621000, v24, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu passkey keychain records from personal keychain", buf, 0x16u);

  }
  v26 = (NSDictionary *)objc_msgSend(v6, "copy");
  groupIdentifiersToPasskeysData = self->_groupIdentifiersToPasskeysData;
  self->_groupIdentifiersToPasskeysData = v26;

  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_174);
}

- (void)_cleanUpRedundantCredentialsWithoutUsernames
{
  NSObject *queue;
  _QWORD block[5];

  if (-[WBSSavedAccountStore _canPerformMaintenanceTasks](self, "_canPerformMaintenanceTasks"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__WBSSavedAccountStore__cleanUpRedundantCredentialsWithoutUsernames__block_invoke;
    block[3] = &unk_1E649B768;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (id)_allInternetPasswordEntriesFromPersonalKeychain
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_allPasswordCredentialItemsInPersonalKeychain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_groupIDArrayForUserDefaultsKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "safari_browserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)setShouldWarmDataStoreAfterReset:(BOOL)a3
{
  self->_shouldWarmDataStoreAfterReset = a3;
}

- (id)_loadSavedAccountsWithPasskeysFromPasskeyData:(id)a3 forGroupID:(id)a4 fromRecentlyDeleted:(BOOL)a5 withDictionaryForSavedAccountsWithPasskeys:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  NSObject *v43;
  WBSPublicKeyCredentialIdentifier *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  __CFString *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  WBSPair *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  uint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  _BOOL4 v80;
  id v81;
  NSMutableDictionary *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  __CFString *v86;
  uint64_t v87;
  WBSSavedAccountStore *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint8_t v92;
  char v93[15];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  uint64_t v99;
  __int16 v100;
  void *v101;
  _BYTE v102[128];
  uint64_t v103;

  v7 = a5;
  v103 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v81 = a6;
  v85 = v11;
  v12 = objc_msgSend(v11, "length");
  v13 = v12;
  v80 = v7;
  v76 = v12;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v82 = v14;
    if (!v13)
      objc_storeStrong((id *)&self->_recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, v14);
  }
  else
  {
    if (v12)
    {
      if (!self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
        self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = v15;

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v76);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, "setObject:forKeyedSubscript:", v17, v11);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, "objectForKeyedSubscript:", v11);
      v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
      self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = v19;

      v18 = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    }
    v82 = v18;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v76);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v95;
    v88 = self;
    v78 = v21;
    v87 = *(_QWORD *)v95;
    do
    {
      v25 = 0;
      v83 = v23;
      do
      {
        if (*(_QWORD *)v95 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v25);
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CredentialRelyingPartyID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WBSSavedAccountStore _shouldLoadCredentialRecordWithHostIntoAccountStore:](self, "_shouldLoadCredentialRecordWithHostIntoAccountStore:", v27))
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CredentialUserVisibleName"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("UserHandle"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CredentialID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "base64EncodedStringWithOptions:", 0);
          v30 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "safari_highLevelDomainForPasswordManager");
          v91 = objc_claimAutoreleasedReturnValue();
          v89 = (void *)v30;
          if (v91)
          {
            if (v30)
            {
              objc_msgSend(v26, "safari_stringForKey:", CFSTR("GroupID"));
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = (void *)v31;
              v33 = &stru_1E64A2498;
              if (v31)
                v33 = (__CFString *)v31;
              v34 = v33;

              v86 = v34;
              if ((-[__CFString isEqualToString:](v34, "isEqualToString:", v85) & 1) != 0)
              {
                -[NSMutableDictionary safari_mutableArrayForKey:](self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials, "safari_mutableArrayForKey:", v91);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = 0;
                if (objc_msgSend(v35, "count"))
                {
                  v37 = 0;
                  do
                  {
                    objc_msgSend(v35, "objectAtIndexedSubscript:", v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("UserHandle"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend(v39, "isEqualToString:", v28);

                    if (v40)
                    {
                      if (v36)
                      {
                        objc_msgSend(v36, "addIndex:", v37);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v37);
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("CredentialID"));
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "base64EncodedStringWithOptions:", 0);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();

                      v43 = WBS_LOG_CHANNEL_PREFIXPasswords();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543618;
                        v99 = v91;
                        v100 = 2114;
                        v101 = v42;
                        _os_log_impl(&dword_1B2621000, v43, OS_LOG_TYPE_DEFAULT, "Found passkey and legacy credential for %{public}@ with matching userHandle %{public}@. Removing legacy credential.", buf, 0x16u);
                      }
                      v44 = -[WBSPublicKeyCredentialIdentifier initWithCredentialID:groupID:]([WBSPublicKeyCredentialIdentifier alloc], "initWithCredentialID:groupID:", v42, &stru_1E64A2498);
                      objc_msgSend((id)objc_opt_class(), "deletePasskeyWithIdentifier:", v44);

                    }
                    ++v37;
                  }
                  while (v37 < objc_msgSend(v35, "count"));
                  if (v36)
                    objc_msgSend(v35, "removeObjectsAtIndexes:", v36);
                  v45 = v81;
                  v46 = v89;
                  v47 = v90;
                }
                else
                {
                  v46 = v89;
                  v47 = v90;
                  v45 = v81;
                }
                v53 = -[WBSSavedAccount _initWithPasskeyRelyingPartyID:user:passkeyUserHandle:passkeyCredentialID:]([WBSSavedAccount alloc], "_initWithPasskeyRelyingPartyID:user:passkeyUserHandle:passkeyCredentialID:", v27, v47, v28, v46);
                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CreationDate"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setCreationDateForPasskey:", v54);

                objc_msgSend(v45, "objectForKeyedSubscript:", v91);
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v55)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "setObject:forKeyedSubscript:", v56, v91);

                }
                objc_msgSend(v45, "objectForKeyedSubscript:", v91);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "objectForKeyedSubscript:", v47);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v58)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:", v91);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "setObject:forKeyedSubscript:", v59, v90);

                }
                objc_msgSend(v45, "objectForKeyedSubscript:", v91);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "objectForKeyedSubscript:", v90);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "addObject:", v53);

                objc_msgSend(MEMORY[0x1E0C92C70], "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v27);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = -[WBSPair initWithFirst:second:]([WBSPair alloc], "initWithFirst:second:", v28, v84);
                -[NSMutableDictionary objectForKeyedSubscript:](v82, "objectForKeyedSubscript:", v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v64)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v82, "setObject:forKeyedSubscript:", v64, v63);
                }
                objc_msgSend(v64, "addObject:", v53);
                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("LastModifiedDate"));
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setLastModifiedDateForPasskey:", v65);

                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("LastUsedDate"));
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setLastUsedDateForPasskey:", v66);

                objc_msgSend(v53, "setSharedGroupID:", v85);
                objc_msgSend(v53, "setIsRecentlyDeleted:", v80);
                objc_msgSend(v79, "addObject:", v53);

                self = v88;
                v21 = v78;
                v23 = v83;
                v49 = (void *)v91;
                v52 = v86;
              }
              else
              {
                v51 = WBS_LOG_CHANNEL_PREFIXPasswords();
                v49 = (void *)v91;
                v52 = v86;
                if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v99 = (uint64_t)v86;
                  v100 = 2114;
                  v101 = v85;
                  _os_log_fault_impl(&dword_1B2621000, v51, OS_LOG_TYPE_FAULT, "Given passkey with group %{public}@ does not match expected group %{public}@. Skipping.", buf, 0x16u);
                }
              }

            }
            else
            {
              v50 = WBS_LOG_CHANNEL_PREFIXPasswords();
              v49 = (void *)v91;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
                -[WBSSavedAccountStore _loadSavedAccountsWithPasskeysFromPasskeyData:forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:].cold.2(&v92, v93, v50);
            }
          }
          else
          {
            v48 = WBS_LOG_CHANNEL_PREFIXPasswords();
            v49 = 0;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138739971;
              v99 = (uint64_t)v27;
              _os_log_error_impl(&dword_1B2621000, v48, OS_LOG_TYPE_ERROR, "Failed to create high level domain from passkey data relying party ID: %{sensitive}@", buf, 0xCu);
            }
          }

          v24 = v87;
        }

        ++v25;
      }
      while (v25 != v23);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    }
    while (v23);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    -[WBSSavedAccountStore _allSharedSidecarsForGroupID:fromRecentlyDeleted:](self, "_allSharedSidecarsForGroupID:fromRecentlyDeleted:", v85, v80);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _matchSidecars:toSavedAccountsWithPasskeysInDictionary:unmatchedSidecars:](self, "_matchSidecars:toSavedAccountsWithPasskeysInDictionary:unmatchedSidecars:", v68, v82, v67);
    -[WBSSavedAccountStore _allPersonalSidecarsForGroupID:fromRecentlyDeleted:](self, "_allPersonalSidecarsForGroupID:fromRecentlyDeleted:", v85, v80);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _matchSidecars:toSavedAccountsWithPasskeysInDictionary:unmatchedSidecars:](self, "_matchSidecars:toSavedAccountsWithPasskeysInDictionary:unmatchedSidecars:", v69, v82, v67);

  }
  else
  {
    -[WBSSavedAccountStore _allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:](self, "_allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:", v80);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _matchSidecars:toSavedAccountsWithPasskeysInDictionary:unmatchedSidecars:](self, "_matchSidecars:toSavedAccountsWithPasskeysInDictionary:unmatchedSidecars:", v68, v82, v67);
  }

  v70 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    v71 = v70;
    v72 = objc_msgSend(v67, "count");
    *(_DWORD *)buf = 134217984;
    v99 = v72;
    _os_log_impl(&dword_1B2621000, v71, OS_LOG_TYPE_INFO, "%ld unmatched sidecars.", buf, 0xCu);

  }
  v73 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:].cold.2();
  v74 = (void *)objc_msgSend(v79, "copy");

  return v74;
}

- (id)_allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:(BOOL)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WBSSavedAccountStore _allSidecarsFromPersonalKeychain](self, "_allSidecarsFromPersonalKeychain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_matchSidecars:(id)a3 toSavedAccountsWithPasskeysInDictionary:(id)a4 unmatchedSidecars:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  WBSPair *v14;
  void *v15;
  void *v16;
  WBSPair *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24 = a5;
  obj = v7;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v14 = [WBSPair alloc];
        objc_msgSend(v13, "user");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "protectionSpace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[WBSPair initWithFirst:second:](v14, "initWithFirst:second:", v15, v16);

        objc_msgSend(v8, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v27 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "_addPasskeySidecar:", v13);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v21);
          }
        }
        else
        {
          objc_msgSend(v24, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

}

- (id)_allSidecarsFromPersonalKeychain
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_allPersonalSidecarsInPersonalKeychain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_loadSavedAccountsWithPasswordsFromKeychainData:(id)a3 forGroupID:(id)a4 withDictionaryForSavedAccountsWithPasswords:(id)a5 fromRecentlyDeleted:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  char *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  const __CFString *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  _WBSSavedAccountPartialCredential *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  NSObject *v74;
  NSObject *v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  void *v79;
  void *v81;
  id v82;
  _BOOL4 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  WBSSavedAccountStore *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  __CFString *v104;
  void *v105;
  void *v106;
  void *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD v111[4];
  id v112;
  id v113;
  WBSSavedAccountStore *v114;
  id v115;
  BOOL v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  char v121[16];
  uint8_t v122[128];
  uint8_t buf[4];
  const char *v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  id v128;
  __int16 v129;
  __CFString *v130;
  uint64_t v131;

  v6 = a6;
  v131 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v82 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = objc_msgSend(v10, "count");
    v15 = CFSTR("NO");
    if (v6)
      v15 = CFSTR("YES");
    v16 = v15;
    *(_DWORD *)buf = 136315906;
    v124 = "-[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccou"
           "ntsWithPasswords:fromRecentlyDeleted:]";
    v125 = 2048;
    v126 = v14;
    v127 = 2114;
    v128 = v11;
    v129 = 2112;
    v130 = v16;
    _os_log_impl(&dword_1B2621000, v13, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu password keychain records from group: %{public}@ from Recently Deleted: %@", buf, 0x2Au);

  }
  v81 = v11;
  v83 = v6;
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v17 = v10;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v117, v122, 16);
  if (v18)
  {
    v19 = v18;
    v99 = 0;
    v85 = 0;
    v20 = *(_QWORD *)v118;
    v21 = *MEMORY[0x1E0CD6AD0];
    v110 = *MEMORY[0x1E0CD68F8];
    v109 = *MEMORY[0x1E0CD6B50];
    v94 = *MEMORY[0x1E0CD6910];
    v93 = *MEMORY[0x1E0CD6920];
    v84 = *MEMORY[0x1E0CD6898];
    v92 = *MEMORY[0x1E0CD70D8];
    v91 = *MEMORY[0x1E0CD6AC8];
    v90 = *MEMORY[0x1E0C92B40];
    v89 = *MEMORY[0x1E0CD6990];
    v88 = *MEMORY[0x1E0CD6A98];
    v86 = *MEMORY[0x1E0CD6988];
    v87 = *MEMORY[0x1E0CD70E0];
    v97 = v17;
    v98 = self;
    v95 = *MEMORY[0x1E0CD6AD0];
    v96 = *(_QWORD *)v118;
    do
    {
      v22 = 0;
      v100 = v19;
      do
      {
        if (*(_QWORD *)v118 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v22);
        objc_msgSend(v23, "objectForKeyedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        WBSHTTPProtocolFromSecAttrProtocolValue(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", v110);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          v28 = &stru_1E64A2498;
          if (v26)
            v28 = (__CFString *)v26;
          v29 = v28;

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v23, "objectForKeyedSubscript:", v109);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "length")
              && -[WBSSavedAccountStore _shouldLoadCredentialRecordWithHostIntoAccountStore:](self, "_shouldLoadCredentialRecordWithHostIntoAccountStore:", v30))
            {
              objc_msgSend(v23, "safari_stringForKey:", v94);
              v31 = (char *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v31, "isEqualToString:", v93) & 1) == 0)
              {
                objc_msgSend(v23, "safari_stringForKey:", v84);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = WBS_LOG_CHANNEL_PREFIXKeychain();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v124 = v31;
                  v125 = 2114;
                  v126 = (uint64_t)v32;
                  _os_log_error_impl(&dword_1B2621000, v33, OS_LOG_TYPE_ERROR, "Invalid authentication type for keychain item; kSecAttrAuthenticationType: %{public}@, kSecAttrAcces"
                    "sGroup: %{public}@",
                    buf,
                    0x16u);
                }
                ++v99;

              }
              objc_msgSend(v30, "safari_highLevelDomainForPasswordManager");
              v34 = objc_claimAutoreleasedReturnValue();
              v35 = (void *)v34;
              if (v34)
                v36 = (void *)v34;
              else
                v36 = v30;
              v37 = v36;

              objc_msgSend(v101, "objectForKeyedSubscript:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v38)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "setObject:forKeyedSubscript:", v38, v37);
              }
              objc_msgSend(v23, "objectForKeyedSubscript:", v92);
              v39 = objc_claimAutoreleasedReturnValue();
              v105 = (void *)v39;
              if (v39)
              {
                v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v39, 4);
                v41 = (void *)v40;
                v42 = &stru_1E64A2498;
                if (v40)
                  v42 = (__CFString *)v40;
                v43 = v42;

              }
              else
              {
                v43 = &stru_1E64A2498;
              }
              objc_msgSend(v38, "objectForKeyedSubscript:", v29);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v45)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setObject:forKeyedSubscript:", v45, v29);
              }
              objc_msgSend(v45, "objectForKeyedSubscript:", v43);
              v46 = objc_claimAutoreleasedReturnValue();
              v107 = v37;
              v108 = v31;
              v106 = v38;
              v104 = (__CFString *)v43;
              v102 = v45;
              if (v46)
              {
                v103 = (id)v46;
              }
              else
              {
                ++v85;
                v103 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v45, "setObject:forKeyedSubscript:");
              }
              v47 = objc_alloc(MEMORY[0x1E0C92C70]);
              objc_msgSend(v23, "objectForKeyedSubscript:", v91);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = (void *)objc_msgSend(v47, "initWithHost:port:protocol:realm:authenticationMethod:", v30, objc_msgSend(v48, "integerValue"), v25, 0, v90);

              objc_msgSend(v23, "objectForKeyedSubscript:", v89);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", v88);
              v51 = objc_claimAutoreleasedReturnValue();
              v52 = (void *)v51;
              if (v51)
                v53 = (void *)v51;
              else
                v53 = v50;
              v54 = v53;

              objc_msgSend(v23, "safari_dataForKey:", v87);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", v86);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("default"));

              v58 = -[_WBSSavedAccountPartialCredential initWithProtectionSpace:modificationDate:creationDate:persistentIdentifier:isDefaultCredentialForProtectionSpace:]([_WBSSavedAccountPartialCredential alloc], "initWithProtectionSpace:modificationDate:creationDate:persistentIdentifier:isDefaultCredentialForProtectionSpace:", v49, v54, v50, v55, v57);
              objc_msgSend(v103, "addObject:", v58);

              v17 = v97;
              self = v98;
              v21 = v95;
              v20 = v96;
              v19 = v100;
            }

          }
          else
          {
            v44 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:].cold.3((uint64_t)v121, v44);
          }

        }
        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v117, v122, 16);
    }
    while (v19);
  }
  else
  {
    v99 = 0;
    v85 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v85);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke;
  v111[3] = &unk_1E649F6E8;
  v60 = v81;
  v112 = v60;
  v116 = v83;
  v61 = v59;
  v113 = v61;
  v114 = self;
  v62 = v82;
  v115 = v62;
  objc_msgSend(v101, "enumerateKeysAndObjectsUsingBlock:", v111);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "length"))
  {
    -[WBSSavedAccountStore _allSharedSidecarsForGroupID:fromRecentlyDeleted:](self, "_allSharedSidecarsForGroupID:fromRecentlyDeleted:", v60, v83);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _matchSidecars:toSavedAccountsWithPasswordsInDictionary:unmatchedSidecars:](self, "_matchSidecars:toSavedAccountsWithPasswordsInDictionary:unmatchedSidecars:", v64, v62, v63);
    v65 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v65;
      v67 = objc_msgSend(v64, "count");
      *(_DWORD *)buf = 136315650;
      v124 = "-[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAcc"
             "ountsWithPasswords:fromRecentlyDeleted:]";
      v125 = 2048;
      v126 = v67;
      v127 = 2114;
      v128 = v60;
      _os_log_impl(&dword_1B2621000, v66, OS_LOG_TYPE_DEFAULT, "%s: loaded %lu shared sidecar items from group %{public}@", buf, 0x20u);

    }
    -[WBSSavedAccountStore _allPersonalSidecarsForGroupID:fromRecentlyDeleted:](self, "_allPersonalSidecarsForGroupID:fromRecentlyDeleted:", v60, v83);
    v68 = objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _matchSidecars:toSavedAccountsWithPasswordsInDictionary:unmatchedSidecars:](self, "_matchSidecars:toSavedAccountsWithPasswordsInDictionary:unmatchedSidecars:", v68, v62, v63);
    v69 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = v69;
      v71 = -[NSObject count](v68, "count");
      *(_DWORD *)buf = 136315650;
      v124 = "-[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAcc"
             "ountsWithPasswords:fromRecentlyDeleted:]";
      v125 = 2048;
      v126 = v71;
      v127 = 2114;
      v128 = v60;
      _os_log_impl(&dword_1B2621000, v70, OS_LOG_TYPE_DEFAULT, "%s: loaded %lu personal sidecar items from group %{public}@", buf, 0x20u);

    }
  }
  else
  {
    -[WBSSavedAccountStore _allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:](self, "_allPersonalSidecarsFromPersonalKeychainFromRecentlyDeleted:", v83);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _matchSidecars:toSavedAccountsWithPasswordsInDictionary:unmatchedSidecars:](self, "_matchSidecars:toSavedAccountsWithPasswordsInDictionary:unmatchedSidecars:", v64, v62, v63);
    v72 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      goto LABEL_55;
    v68 = v72;
    v73 = objc_msgSend(v64, "count");
    *(_DWORD *)buf = 136315394;
    v124 = "-[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccou"
           "ntsWithPasswords:fromRecentlyDeleted:]";
    v125 = 2048;
    v126 = v73;
    _os_log_impl(&dword_1B2621000, v68, OS_LOG_TYPE_DEFAULT, "%s: loaded %lu sidecar items from personal keychain", buf, 0x16u);
  }

LABEL_55:
  v74 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    v75 = v74;
    v76 = objc_msgSend(v63, "count");
    *(_DWORD *)buf = 134217984;
    v124 = (const char *)v76;
    _os_log_impl(&dword_1B2621000, v75, OS_LOG_TYPE_DEFAULT, "%ld unmatched sidecars", buf, 0xCu);

  }
  v77 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
  {
    -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:].cold.2();
    if (!v99)
      goto LABEL_62;
  }
  else if (!v99)
  {
    goto LABEL_62;
  }
  v78 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    -[WBSSavedAccountStore _loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:].cold.1();
  -[WBSSavedAccountStore _reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded](self, "_reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded");
LABEL_62:
  v79 = (void *)objc_msgSend(v61, "copy");

  return v79;
}

- (void)_matchSidecars:(id)a3 toSavedAccountsWithPasswordsInDictionary:(id)a4 unmatchedSidecars:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  WBSSavedAccountStore *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  id v35;
  uint64_t v36;
  WBSSavedAccountStore *v37;
  uint64_t v38;
  id v39;
  id obj;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v39 = a4;
  v35 = a5;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v55;
    v36 = *(_QWORD *)v55;
    v37 = self;
    do
    {
      v12 = 0;
      v38 = v10;
      do
      {
        if (*(_QWORD *)v55 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v12);
        objc_msgSend(v13, "protectionSpace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "host");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WBSSavedAccountStore _shouldLoadCredentialRecordWithHostIntoAccountStore:](self, "_shouldLoadCredentialRecordWithHostIntoAccountStore:", v15))
        {
          objc_msgSend(v15, "safari_highLevelDomainForPasswordManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v13;
          objc_msgSend(v13, "user");
          v18 = v11;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v19);
          v20 = v10;
          v21 = self;
          v22 = objc_claimAutoreleasedReturnValue();

          v11 = v18;
          v45 = (void *)v22;
          v23 = (void *)v22;
          self = v21;
          v10 = v20;
          objc_msgSend(v23, "allValues");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v25 = v24;
          v42 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          if (v42)
          {
            v26 = *(_QWORD *)v51;
            v41 = v16;
            v43 = v25;
            do
            {
              for (i = 0; i != v42; ++i)
              {
                if (*(_QWORD *)v51 != v26)
                  objc_enumerationMutation(v25);
                v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                v46 = 0u;
                v47 = 0u;
                v48 = 0u;
                v49 = 0u;
                objc_msgSend(v28, "protectionSpaces");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                if (v30)
                {
                  v31 = v30;
                  v32 = *(_QWORD *)v47;
                  while (2)
                  {
                    for (j = 0; j != v31; ++j)
                    {
                      if (*(_QWORD *)v47 != v32)
                        objc_enumerationMutation(v29);
                      if (objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "isEqualToProtectionSpaceForPasswordManager:", v14))
                      {
                        objc_msgSend(v14, "host");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v28, "_addSidecar:forSite:", v44, v34);

                        v25 = v43;
                        v11 = v36;
                        self = v37;
                        v10 = v38;
                        v16 = v41;
                        goto LABEL_24;
                      }
                    }
                    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                    if (v31)
                      continue;
                    break;
                  }
                }

                v25 = v43;
              }
              v11 = v36;
              self = v37;
              v10 = v38;
              v16 = v41;
              v42 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
            }
            while (v42);
          }

          objc_msgSend(v35, "addObject:", v44);
LABEL_24:

        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v10);
  }

}

uint64_t __45__WBSSavedAccountStore__resetOnInternalQueue__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 251))
  {
    v2 = result;
    objc_msgSend(*(id *)(v1 + 224), "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(v2 + 32), sel__warmDataStoreAfterResetTimerFired_, 0, 0, 3.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(v2 + 32);
    v5 = *(void **)(v4 + 224);
    *(_QWORD *)(v4 + 224) = v3;

    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 224), "setTolerance:", 0.3);
  }
  return result;
}

uint64_t __32__WBSSavedAccountStore__prewarm__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_savedAccounts");
  return objc_msgSend(*(id *)(a1 + 32), "_loadRecentlyDeletedSavedAccounts");
}

- (id)_savedAccounts
{
  id v3;
  NSObject *v4;
  NSArray *savedAccounts;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_savedAccountsWithPasswords)
    v3 = -[WBSSavedAccountStore _loadSavedAccounts](self, "_loadSavedAccounts");
  v4 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    savedAccounts = self->_savedAccounts;
    v6 = v4;
    v8 = 136315394;
    v9 = "-[WBSSavedAccountStore _savedAccounts]";
    v10 = 2048;
    v11 = -[NSArray count](savedAccounts, "count");
    _os_log_impl(&dword_1B2621000, v6, OS_LOG_TYPE_DEFAULT, "%s: Returning %lu saved accounts", (uint8_t *)&v8, 0x16u);

  }
  return self->_savedAccounts;
}

+ (WBSSavedAccountStore)sharedStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WBSSavedAccountStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStore_onceToken_0 != -1)
    dispatch_once(&sharedStore_onceToken_0, block);
  return (WBSSavedAccountStore *)(id)sharedStore_store;
}

void __69__WBSSavedAccountStore__performRecentlyDeletedMaintenanceIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  char v27;
  uint64_t v28;
  _QWORD block[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -30, v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("DebugPasswordManagerRecentlyDeletedRecoveryWindowInMinutes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerForKey:", CFSTR("DebugPasswordManagerRecentlyDeletedRecoveryWindowInMinutes"));

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 64, -v8, v2, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v36 = v8;
        _os_log_impl(&dword_1B2621000, v11, OS_LOG_TYPE_DEFAULT, "Using debug recently deleted limit of %ld minutes", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("DebugPasswordManagerRecentlyDeletedRecoveryWindowInMinutes"));

      v4 = (void *)v10;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
    v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = v15;
      v28 = a1;
      v26 = v2;
      v27 = 0;
      v17 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v19, "lastModifiedDate", v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "earlierDate:", v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 != v4)
          {
            objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "safari_mostRecentLastModifiedDateForCredentialsOnSavedAccount:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v4, "earlierDate:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24 != v4)
              {
                v25 = WBS_LOG_CHANNEL_PREFIXPasswords();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B2621000, v25, OS_LOG_TYPE_DEFAULT, "Permanently deleting a saved account from Recently Deleted because it is more than 30 days old.", buf, 2u);
                }
                objc_msgSend(*(id *)(v28 + 32), "_removeCredentialTypes:forSavedAccount:", objc_msgSend(v19, "credentialTypes"), v19);
                v27 = 1;
              }
            }

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v16);

      *(_BYTE *)(*(_QWORD *)(v28 + 32) + 216) = 0;
      v2 = v26;
      if ((v27 & 1) != 0)
      {
        objc_msgSend(*(id *)(v28 + 32), "_resetOnInternalQueue");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __69__WBSSavedAccountStore__performRecentlyDeletedMaintenanceIfNecessary__block_invoke_232;
        block[3] = &unk_1E649B768;
        block[4] = *(_QWORD *)(v28 + 32);
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
    else
    {

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
    }

  }
}

- (id)initPartialStoreForDomains:(id)a3
{
  id v4;
  WBSAuthenticationServicesAgentProxy *v5;
  WBSSavedAccountStore *v6;

  v4 = a3;
  v5 = objc_alloc_init(WBSAuthenticationServicesAgentProxy);
  -[WBSAuthenticationServicesAgentProxy setDelegate:](v5, "setDelegate:", self);
  v6 = -[WBSSavedAccountStore initWithAuthenticationServicesAgentProxy:shouldPrewarmSavedAccounts:limitedToDomains:](self, "initWithAuthenticationServicesAgentProxy:shouldPrewarmSavedAccounts:limitedToDomains:", v5, 0, v4);

  return v6;
}

void __109__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains___block_invoke_2;
  block[3] = &unk_1E649B5B0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __109__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  char v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[216])
    {
      v4 = WeakRetained;
      v3 = objc_msgSend(WeakRetained, "_isMigratingKeychainItemsWithInvalidAuthenticationTypes");
      v2 = v4;
      if ((v3 & 1) == 0)
      {
        objc_msgSend(v4, "reset");
        objc_msgSend(v4, "_postSavedAccountStoreDidChangeNotification");
        v2 = v4;
      }
    }
  }

}

id __109__WBSSavedAccountStore_initWithAuthenticationServicesAgentProxy_shouldPrewarmSavedAccounts_limitedToDomains___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_diagnosticStateDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)showServiceNamesInPasswordsEnabledKVOContext == a6)
    -[WBSSavedAccountStore _updateShowServiceNamesInPasswordsPreference](self, "_updateShowServiceNamesInPasswordsPreference", a3, a4, a5);
}

- (id)_diagnosticStateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("number of saved accounts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_savedAccounts, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("number of passkeys in personal keychain");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_passkeysDataInPersonalKeychain, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("number of saved accounts with passwords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_savedAccountsWithPasswords, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("number of personal keychain high level domains");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WBSKeychainCredentialNotificationMonitor removeObserverForToken:](self->_keychainMonitor, "removeObserverForToken:", self->_keychainNotificationRegistrationToken);
  -[NSTimer invalidate](self->_warmDataStoreAfterResetTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSSavedAccountStore;
  -[WBSSavedAccountStore dealloc](&v4, sel_dealloc);
}

- (id)savedAccountForURLCredential:(id)a3 protectionSpace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSSavedAccountStore _savedAccountForProtectionSpace:user:password:](self, "_savedAccountForProtectionSpace:user:password:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)savedAccountsInPersonalKeychain
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__WBSSavedAccountStore_savedAccountsInPersonalKeychain__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __55__WBSSavedAccountStore_savedAccountsInPersonalKeychain__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[15];
  if (!v3)
  {
    v4 = (id)objc_msgSend(v2, "_loadSavedAccounts");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  }
  v5 = objc_msgSend(v3, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (NSArray)savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords
{
  void *v2;
  void *v3;

  -[WBSSavedAccountStore savedAccountsInPersonalKeychain](self, "savedAccountsInPersonalKeychain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_117);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __88__WBSSavedAccountStore_savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userIsNeverSaveMarker") ^ 1;
}

- (id)savedAccountsForGroupID:(id)a3
{
  id v4;
  NSObject *queue;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__15;
    v17 = __Block_byref_object_dispose__15;
    v18 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__WBSSavedAccountStore_savedAccountsForGroupID___block_invoke;
    block[3] = &unk_1E649D5A8;
    block[4] = self;
    v12 = &v13;
    v11 = v4;
    dispatch_sync(queue, block);
    v6 = (void *)v14[5];
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[WBSSavedAccountStore savedAccountsForGroupID:].cold.1();
      v7 = (id)MEMORY[0x1E0C9AA60];
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    -[WBSSavedAccountStore savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords](self, "savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __48__WBSSavedAccountStore_savedAccountsForGroupID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 56))
  {
    v3 = (id)objc_msgSend((id)v2, "_loadSavedAccounts");
    v2 = a1[4];
  }
  objc_msgSend(*(id *)(v2 + 128), "objectForKeyedSubscript:", a1[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)removeLegacyPlatformCredentialsForDomains:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__WBSSavedAccountStore_removeLegacyPlatformCredentialsForDomains___block_invoke;
  v7[3] = &unk_1E649B6D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __66__WBSSavedAccountStore_removeLegacyPlatformCredentialsForDomains___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  WBSPublicKeyCredentialIdentifier *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v1 = a1;
  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[10])
    v3 = (id)objc_msgSend(v2, "_loadSavedAccounts");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(v1 + 40);
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v19)
  {
    v17 = v1;
    v18 = *(_QWORD *)v27;
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v4), "safari_highLevelDomainFromHost");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 80), "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v6, "count"))
        {

          goto LABEL_20;
        }
        v20 = v5;
        v21 = v4;
        v7 = (void *)objc_opt_class();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "safari_dataForKey:", CFSTR("CredentialID"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = -[WBSPublicKeyCredentialIdentifier initWithCredentialID:groupID:]([WBSPublicKeyCredentialIdentifier alloc], "initWithCredentialID:groupID:", v14, &stru_1E64A2498);
              objc_msgSend(v7, "deletePasskeyWithIdentifier:", v15);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v10);
        }

        v1 = v17;
        objc_msgSend(*(id *)(*(_QWORD *)(v17 + 32) + 80), "removeObjectForKey:", v20);

        v4 = v21 + 1;
      }
      while (v21 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_20:

}

- (void)savedAccountWithAllMetadataForURLCredential:(id)a3 protectionSpace:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(17, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__WBSSavedAccountStore_savedAccountWithAllMetadataForURLCredential_protectionSpace_completion___block_invoke;
  v15[3] = &unk_1E649F478;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __95__WBSSavedAccountStore_savedAccountWithAllMetadataForURLCredential_protectionSpace_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "savedAccountWithAllMetadataForURLCredential:protectionSpace:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)savedAccountWithAllMetadataForURLCredential:(id)a3 protectionSpace:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[WBSSavedAccountStore savedAccountsWithPasswords](self, "savedAccountsWithPasswords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v21 = v6;
    v11 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v13, "userIsNeverSaveMarker") & 1) == 0)
        {
          objc_msgSend(v13, "user");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "isEqualToString:", v7))
            goto LABEL_12;
          objc_msgSend(v13, "password");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isEqualToString:", v8) & 1) == 0)
          {

LABEL_12:
            continue;
          }
          objc_msgSend(v13, "protectionSpaces");
          v16 = v9;
          v17 = v7;
          v18 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v19, "containsObject:", v22);

          v8 = v18;
          v7 = v17;
          v9 = v16;

          if ((v23 & 1) != 0)
          {
            v10 = v13;
            goto LABEL_15;
          }
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v10)
      {
LABEL_15:
        v6 = v21;
        break;
      }
    }
  }

  return v10;
}

- (id)savedAccountForURL:(id)a3 user:(id)a4 password:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0C92C70];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "safari_HTMLFormProtectionSpaceForURL:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _savedAccountForProtectionSpace:user:password:](self, "_savedAccountForProtectionSpace:user:password:", v11, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_savedAccountForProtectionSpace:(id)a3 user:(id)a4 password:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safari_allSafariCredentials");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __70__WBSSavedAccountStore__savedAccountForProtectionSpace_user_password___block_invoke;
  v38[3] = &unk_1E649F4A0;
  v15 = v10;
  v39 = v15;
  v16 = v7;
  v40 = v16;
  v17 = v8;
  v41 = v17;
  v18 = v11;
  v42 = v18;
  v19 = v12;
  v43 = v19;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v38);

  v32 = v15;
  v33 = v16;
  v31 = v17;
  v20 = -[WBSSavedAccount _initWithHighLevelDomain:user:password:]([WBSSavedAccount alloc], "_initWithHighLevelDomain:user:password:", v15, v16, v17);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = v18;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v26, "host");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "containsObject:", v27) & 1) != 0)
        {
          objc_msgSend(v26, "safari_addressString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 0, 0);
          v29 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v29 = v27;
        }
        objc_msgSend(v20, "_addProtectionSpace:forSite:isDefaultCredentialForSite:", v26, v29, objc_msgSend(v20, "isDefaultCredentialForFullyQualifiedHostname:", v27));

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v23);
  }

  return v20;
}

void __70__WBSSavedAccountStore__savedAccountForProtectionSpace_user_password___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(v15, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_highLevelDomainForPasswordManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "password");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 48));

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
      }
      else
      {
        v13 = *(void **)(a1 + 64);
        objc_msgSend(v15, "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

      }
    }

  }
}

- (id)savedAccountsForPersistentIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore savedAccountsWithPasswords](self, "savedAccountsWithPasswords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__WBSSavedAccountStore_savedAccountsForPersistentIdentifiers___block_invoke;
  v9[3] = &unk_1E649F4C8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __62__WBSSavedAccountStore_savedAccountsForPersistentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a2, "persistentIdentifiersForWarningManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7)) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

+ (void)removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4 forGroup:(id)a5
{
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v7 = a5;
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_deletePasswordCredentialsForGroupID:", v9);

  }
  if ((v6 & 2) != 0)
  {
    objc_msgSend(v8, "groupID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_deletePasskeyCredentialForGroupID:", v10);

  }
}

- (id)_allPersonalSidecarsForGroupID:(id)a3 fromRecentlyDeleted:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C92C68];
  v6 = a3;
  objc_msgSend(v5, "sharedCredentialStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_allPersonalSidecarsForGroupID:fromRecentlyDeleted:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_allSharedSidecarsForGroupID:(id)a3 fromRecentlyDeleted:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C92C68];
  v6 = a3;
  objc_msgSend(v5, "sharedCredentialStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_allSharedSidecarsForGroupID:fromRecentlyDeleted:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)savedAccountsWithTOTPGenerators
{
  void *v2;
  void *v3;

  -[WBSSavedAccountStore savedAccountsWithPasswords](self, "savedAccountsWithPasswords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_128);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

BOOL __55__WBSSavedAccountStore_savedAccountsWithTOTPGenerators__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "totpGenerators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)savedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords
{
  void *v2;
  void *v3;

  -[WBSSavedAccountStore savedAccountsWithPasswords](self, "savedAccountsWithPasswords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_129);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __83__WBSSavedAccountStore_savedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userIsNeverSaveMarker") ^ 1;
}

- (NSSet)highLevelDomainsOfAllSavedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords
{
  void *v2;
  void *v3;

  -[WBSSavedAccountStore savedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords](self, "savedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_131);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

uint64_t __104__WBSSavedAccountStore_highLevelDomainsOfAllSavedAccountsWithPasswordsExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "highLevelDomain");
}

- (WBSAuthenticationServicesAgentProxy)authenticationServicesAgentProxy
{
  return self->_authenticationServicesAgentProxy;
}

- (NSArray)savedAccountsExcludingNeverSaveMarkerPasswords
{
  void *v2;
  void *v3;

  -[WBSSavedAccountStore savedAccounts](self, "savedAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_132);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __70__WBSSavedAccountStore_savedAccountsExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userIsNeverSaveMarker") ^ 1;
}

- (NSSet)highLevelDomainsOfAllSavedAccountsExcludingNeverSaveMarkerPasswords
{
  void *v2;
  void *v3;

  -[WBSSavedAccountStore savedAccountsExcludingNeverSaveMarkerPasswords](self, "savedAccountsExcludingNeverSaveMarkerPasswords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_133);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

uint64_t __91__WBSSavedAccountStore_highLevelDomainsOfAllSavedAccountsExcludingNeverSaveMarkerPasswords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "highLevelDomain");
}

- (NSSet)highLevelDomainsOfRecentlyDeletedAccounts
{
  void *v2;
  void *v3;

  -[WBSSavedAccountStore allRecentlyDeletedSavedAccounts](self, "allRecentlyDeletedSavedAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_134);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

uint64_t __65__WBSSavedAccountStore_highLevelDomainsOfRecentlyDeletedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "highLevelDomain");
}

- (id)highLevelDomainsOfSavedAccountsExcludingNeverSaveMarkerPasswordsForGroupID:(id)a3
{
  void *v3;
  void *v4;

  -[WBSSavedAccountStore savedAccountsForGroupID:](self, "savedAccountsForGroupID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_setByApplyingBlock:", &__block_literal_global_135);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __99__WBSSavedAccountStore_highLevelDomainsOfSavedAccountsExcludingNeverSaveMarkerPasswordsForGroupID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "userIsNeverSaveMarker") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "highLevelDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_warmDataStoreAfterResetTimerFired:(id)a3
{
  NSTimer *warmDataStoreAfterResetTimer;

  -[WBSSavedAccountStore _prewarm](self, "_prewarm", a3);
  -[NSTimer invalidate](self->_warmDataStoreAfterResetTimer, "invalidate");
  warmDataStoreAfterResetTimer = self->_warmDataStoreAfterResetTimer;
  self->_warmDataStoreAfterResetTimer = 0;

}

- (NSArray)savedAccountsWithPasswords
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__WBSSavedAccountStore_savedAccountsWithPasswords__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __50__WBSSavedAccountStore_savedAccountsWithPasswords__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_savedAccountsWithPasswords");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)savedAccounts
{
  NSObject *v3;
  NSObject *queue;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  v15 = 0;
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WBSSavedAccountStore savedAccounts]";
    _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_DEFAULT, "%s: Loading saved accounts", buf, 0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__WBSSavedAccountStore_savedAccounts__block_invoke;
  v9[3] = &unk_1E649BA10;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  v5 = (id)WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend((id)v11[5], "count");
    *(_DWORD *)buf = 136315394;
    v17 = "-[WBSSavedAccountStore savedAccounts]";
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "%s: Loading completed with %lu saved accounts", buf, 0x16u);
  }

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSArray *)v7;
}

void __37__WBSSavedAccountStore_savedAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_savedAccounts");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_savedAccountsWithPasswords
{
  NSArray *savedAccountsWithPasswords;
  id v4;

  savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
  if (!savedAccountsWithPasswords)
  {
    v4 = -[WBSSavedAccountStore _loadSavedAccounts](self, "_loadSavedAccounts");
    savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
  }
  return savedAccountsWithPasswords;
}

- (void)_ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue
{
  if (!self->_allRecentlyDeletedSavedAccounts)
    -[WBSSavedAccountStore _loadRecentlyDeletedSavedAccounts](self, "_loadRecentlyDeletedSavedAccounts");
}

- (NSArray)allRecentlyDeletedSavedAccounts
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__WBSSavedAccountStore_allRecentlyDeletedSavedAccounts__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __55__WBSSavedAccountStore_allRecentlyDeletedSavedAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)recentlyDeletedSavedAccountsInPersonalKeychain
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__WBSSavedAccountStore_recentlyDeletedSavedAccountsInPersonalKeychain__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __70__WBSSavedAccountStore_recentlyDeletedSavedAccountsInPersonalKeychain__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)sharingGroupsWithSavedAccounts
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__WBSSavedAccountStore_sharingGroupsWithSavedAccounts__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __54__WBSSavedAccountStore_sharingGroupsWithSavedAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureDomainsToUsersExists");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WBSSavedAccountStore_sharingGroupsWithSavedAccounts__block_invoke_2;
  v7[3] = &unk_1E649D508;
  v7[4] = v2;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

BOOL __54__WBSSavedAccountStore_sharingGroupsWithSavedAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (NSArray)sharingGroupsWithRecentlyDeletedSavedAccounts
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__WBSSavedAccountStore_sharingGroupsWithRecentlyDeletedSavedAccounts__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __69__WBSSavedAccountStore_sharingGroupsWithRecentlyDeletedSavedAccounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__WBSSavedAccountStore_sharingGroupsWithRecentlyDeletedSavedAccounts__block_invoke_2;
  v7[3] = &unk_1E649D508;
  v7[4] = v2;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

BOOL __69__WBSSavedAccountStore_sharingGroupsWithRecentlyDeletedSavedAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)recentlyDeletedSavedAccountsForGroupWithID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSSavedAccountStore_recentlyDeletedSavedAccountsForGroupWithID___block_invoke;
  block[3] = &unk_1E649D5A8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __67__WBSSavedAccountStore_recentlyDeletedSavedAccountsForGroupWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_shouldLoadCredentialRecordWithHostIntoAccountStore:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_domainsStoreIsLimitedTo, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_domainsStoreIsLimitedTo;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(v4, "safari_isHostOrSubdomainOfHost:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  char v61;
  char v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_msgSend(v6, "count");
  v9 = MEMORY[0x1E0C809B0];
  if (v8 < 2)
  {
    v11 = 0;
  }
  else
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_2;
    v63[3] = &unk_1E649EDC0;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v64 = v10;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v63);
    if (objc_msgSend(v10, "count") == 1)
    {
      v11 = 0;
    }
    else
    {
      v43 = v7;
      v44 = a1;
      v45 = v6;
      v41 = v10;
      v12 = v10;
      v42 = v5;
      v13 = v5;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      if (v15)
      {
        v16 = v15;
        v17 = &_dateFormatTemplatesWithLongMonth_onceToken;
        v18 = *(_QWORD *)v66;
        while (2)
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v66 != v18)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v19), "substringToIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v19), "length") - objc_msgSend(v13, "length"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "length"))
            {
              v21 = v20;
              if (v17[57] != -1)
                dispatch_once(&setOfUninterestingSubdomains_onceToken, &__block_literal_global_647);
              if (objc_msgSend((id)setOfUninterestingSubdomains_set, "containsObject:", v21))
              {

              }
              else
              {
                if (numberedSubdomainRegexp_onceToken != -1)
                  dispatch_once(&numberedSubdomainRegexp_onceToken, &__block_literal_global_698);
                v22 = (id)numberedSubdomainRegexp_regexp;
                objc_msgSend(v22, "firstMatchInString:options:range:", v21, 0, 0, objc_msgSend(v21, "length"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                v17 = &_dateFormatTemplatesWithLongMonth_onceToken;
                if (!v23)
                {

                  v11 = 1;
                  goto LABEL_22;
                }
              }
            }

            ++v19;
          }
          while (v16 != v19);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          if (v16)
            continue;
          break;
        }
      }

      v11 = 0;
LABEL_22:
      a1 = v44;
      v6 = v45;
      v5 = v42;
      v7 = v43;
      v9 = MEMORY[0x1E0C809B0];
      v10 = v41;
    }

  }
  v54[0] = v9;
  v54[1] = 3221225472;
  v54[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_5;
  v54[3] = &unk_1E649F6C0;
  v61 = v11;
  v24 = v5;
  v55 = v24;
  v56 = *(id *)(a1 + 32);
  v62 = *(_BYTE *)(a1 + 64);
  v57 = *(id *)(a1 + 40);
  v25 = v7;
  v26 = *(_QWORD *)(a1 + 48);
  v27 = *(void **)(a1 + 56);
  v58 = v25;
  v59 = v26;
  v60 = v27;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v54);
  if ((unint64_t)objc_msgSend(v25, "count") >= 2)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v29 = v25;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v51;
LABEL_27:
      v33 = 0;
      while (1)
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v33);
        if (!objc_msgSend(v34, "shouldShowSpecificSubdomainForUserVisibleDomain"))
          break;
        objc_msgSend(v34, "userVisibleDomain");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v35);

        if (v31 == ++v33)
        {
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
          if (v31)
            goto LABEL_27;
          goto LABEL_33;
        }
      }
    }
    else
    {
LABEL_33:

      if (objc_msgSend(v28, "count") != 1)
      {
LABEL_42:

        goto LABEL_43;
      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v36 = v29;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v47 != v39)
              objc_enumerationMutation(v36);
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "setShouldShowSpecificSubdomainForUserVisibleDomain:", 0);
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
        }
        while (v38);
      }
    }

    goto LABEL_42;
  }
LABEL_43:

}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_3;
  v4[3] = &unk_1E649F610;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_142);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

id __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "protectionSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  char v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v8 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_6;
  v29[3] = &unk_1E649F610;
  v9 = v7;
  v30 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v29);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 80))
    v11 = 1;
  else
    v11 = (unint64_t)objc_msgSend(v6, "count") > 1;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_8;
  v18[3] = &unk_1E649F698;
  v19 = *(id *)(a1 + 32);
  v17 = v5;
  v20 = v17;
  v12 = v9;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v23 = *(id *)(a1 + 40);
  v27 = *(_BYTE *)(a1 + 81);
  v24 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v28 = v11;
  v15 = *(_QWORD *)(a1 + 64);
  v25 = v14;
  v26 = v15;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);
  objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v17);

}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_146);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

id __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "protectionSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v20 = v5;
  v7 = -[WBSSavedAccount _initWithHighLevelDomain:user:password:]([WBSSavedAccount alloc], "_initWithHighLevelDomain:user:password:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "protectionSpace");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 48), "countForObject:", v14) == 1)
        {
          v15 = v14;
        }
        else
        {
          objc_msgSend(v13, "safari_addressString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 0, 0);
          v15 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v7, "_addProtectionSpace:forSite:isDefaultCredentialForSite:", v13, v15, objc_msgSend(v12, "isDefaultCredentialForProtectionSpace"));
        objc_msgSend(v12, "modificationDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_addPasswordCredentialModificationDate:", v17);

        objc_msgSend(v12, "creationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_addPasswordCredentialCreationDate:", v18);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  objc_msgSend(obj, "safari_mapObjectsUsingBlock:", &__block_literal_global_148);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersistentIdentifiersForWarningManager:", v19);
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v7, v20);
  objc_msgSend(v7, "setSharedGroupID:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v7, "setIsRecentlyDeleted:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v7);
  objc_msgSend(*(id *)(a1 + 80), "addObject:", v7);
  if (*(_BYTE *)(a1 + 97))
    objc_msgSend(v7, "setShouldShowSpecificSubdomainForUserVisibleDomain:", 1);
  if ((objc_msgSend(v7, "userIsNeverSaveMarker") & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(a1 + 88) + 248) = 1;

}

uint64_t __147__WBSSavedAccountStore__loadSavedAccountsWithPasswordsFromKeychainData_forGroupID_withDictionaryForSavedAccountsWithPasswords_fromRecentlyDeleted___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "persistentIdentifier");
}

- (void)_reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dateForKey:", CFSTR("LastInvalidAuthTypeMigrationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -7, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "safari_isEarlierThanDate:", v4))
  {

LABEL_7:
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v9, &__block_literal_global_151_0);

    -[WBSSavedAccountStore _migratePasswordsWithInvalidAuthenticationTypes](self, "_migratePasswordsWithInvalidAuthenticationTypes");
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_setDate:forKey:", v11, CFSTR("LastInvalidAuthTypeMigrationDate"));

    goto LABEL_8;
  }
  v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = 7;
    _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_DEFAULT, "Skipping invalid auth type migration because the migration has already run in the past %lu days.", (uint8_t *)&v12, 0xCu);
  }

LABEL_8:
}

void __82__WBSSavedAccountStore__reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded__block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __82__WBSSavedAccountStore__reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded__block_invoke_cold_1();
}

uint64_t __42__WBSSavedAccountStore__loadSavedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "credentialTypes") & 1;
}

- (void)_fetchSignInWithAppleAccounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Unable to load Sign in with Apple accounts, SPI not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke_cold_1();
  }
  else
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke_162;
    v11[3] = &unk_1E649B6D8;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    dispatch_async(v8, v11);

  }
}

uint64_t __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke_162(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v6 = 134217984;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEFAULT, "Successfully fetched '%lu' Sign in with Apple accounts.", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts:", *(_QWORD *)(a1 + 32));
}

- (void)_updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts:(id)a3
{
  void *v4;
  NSArray *savedAccounts;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSArray *v11;
  NSArray *savedAccountsWithSignInWithAppleRecords;
  void *v13;
  uint64_t v14;
  NSArray *v15;
  NSArray *v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[16];

  -[WBSSavedAccountStore _convertSignInWithAppleAccountsToSavedAccounts:](self, "_convertSignInWithAppleAccountsToSavedAccounts:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  savedAccounts = self->_savedAccounts;
  if (!savedAccounts)
    savedAccounts = (NSArray *)MEMORY[0x1E0C9AA60];
  v6 = savedAccounts;
  -[NSArray safari_filterObjectsUsingBlock:](v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_164);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToSet:", v9);

  if ((v10 & 1) == 0)
  {
    v11 = (NSArray *)objc_msgSend(v4, "copy");
    savedAccountsWithSignInWithAppleRecords = self->_savedAccountsWithSignInWithAppleRecords;
    self->_savedAccountsWithSignInWithAppleRecords = v11;

    -[NSArray safari_filterObjectsUsingBlock:](v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_165);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_savedAccountsWithSignInWithAppleRecords, "count"))
    {
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", self->_savedAccountsWithSignInWithAppleRecords);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (NSArray *)v14;
    }
    -[NSArray sortedArrayUsingSelector:](v6, "sortedArrayUsingSelector:", sel_compare_);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = self->_savedAccounts;
    self->_savedAccounts = v15;

    v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v17, OS_LOG_TYPE_DEFAULT, "Merging Sign in with Apple accounts into all saved accounts", buf, 2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__WBSSavedAccountStore__updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts___block_invoke_166;
    block[3] = &unk_1E649B768;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

unint64_t __88__WBSSavedAccountStore__updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "credentialTypes") >> 2) & 1;
}

BOOL __88__WBSSavedAccountStore__updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts___block_invoke_2(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "credentialTypes") & 3) != 0;
}

uint64_t __88__WBSSavedAccountStore__updateCachedSignInWithAppleAccountsOnInternalQueueWithAccounts___block_invoke_166(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

- (id)_convertSignInWithAppleAccountsToSavedAccounts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "localizedAppName", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
        {
          v13 = -[WBSSavedAccount _initWithSignInWithAppleAccount:]([WBSSavedAccount alloc], "_initWithSignInWithAppleAccount:", v10);
          objc_msgSend(v4, "addObject:", v13);

        }
        else
        {
          v14 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[WBSSavedAccountStore _convertSignInWithAppleAccountsToSavedAccounts:].cold.1((uint64_t)v21, v14);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (void)_signInWithApplePushNotificationReceived:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEFAULT, "Sign in with Apple accounts changed push notification received, reloading accounts", v5, 2u);
  }
  -[WBSSavedAccountStore _fetchSignInWithAppleAccounts](self, "_fetchSignInWithAppleAccounts");
}

- (BOOL)_moveSignInWithAppleSavedAccount:(id)a3 toGroupID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;

  v5 = a3;
  v28 = a4;
  v31 = v5;
  objc_msgSend(v5, "signInWithAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryAuthKitAccount");
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "altDSIDForAccount:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentUserParticipantID");
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "familyNameForAccount:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFamilyName:", v15);

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v8;
  objc_msgSend(v16, "givenNameForAccount:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setGivenName:", v17);

  v18 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v18, "stringFromPersonNameComponents:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v12;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00288]), "initWithGroupID:participantID:participantName:", v28, v12, v19);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00298]), "initWithAltDSID:", v10);
  objc_msgSend(v21, "setSignInWithAppleAccount:", v6);
  v33 = v6;
  objc_msgSend(v6, "shareInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "groupID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCurrentGroupID:", v23);

  v24 = objc_msgSend(v28, "length");
  if (v24)
  {
    v25 = v31;
    v26 = -[WBSSavedAccountStore _shareSignInWithAppleAccountWithContext:withGroupInfo:savedAccount:](self, "_shareSignInWithAppleAccountWithContext:withGroupInfo:savedAccount:", v21, v20, v31);
  }
  else
  {
    v26 = -[WBSSavedAccountStore _unshareSignInWithAppleAccountWithContext:](self, "_unshareSignInWithAppleAccountWithContext:", v21);
    v25 = v31;
  }

  return v26;
}

- (BOOL)_shareSignInWithAppleAccountWithContext:(id)a3 withGroupInfo:(id)a4 savedAccount:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  char v15;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D00290]);
  v11 = dispatch_group_create();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  dispatch_group_enter(v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__WBSSavedAccountStore__shareSignInWithAppleAccountWithContext_withGroupInfo_savedAccount___block_invoke;
  v17[3] = &unk_1E649F7B8;
  v20 = &v21;
  v12 = v9;
  v18 = v12;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v10, "shareAccountWithContext:withGroup:completion:", v7, v8, v17);
  v14 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v13, v14);
  v15 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __91__WBSSavedAccountStore__shareSignInWithAppleAccountWithContext_withGroupInfo_savedAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__WBSSavedAccountStore__shareSignInWithAppleAccountWithContext_withGroupInfo_savedAccount___block_invoke_cold_1();
    v9 = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_DEFAULT, "Successfully shared Sign in with Apple Account.", v10, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSignInWithAppleAccount:", v5);
    v9 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (BOOL)unshareSignInWithAppleSavedAccount:(id)a3
{
  return -[WBSSavedAccountStore _moveSignInWithAppleSavedAccount:toGroupID:](self, "_moveSignInWithAppleSavedAccount:toGroupID:", a3, 0);
}

- (BOOL)_unshareSignInWithAppleAccountWithContext:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  char v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D00290]);
  v5 = dispatch_group_create();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  dispatch_group_enter(v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__WBSSavedAccountStore__unshareSignInWithAppleAccountWithContext___block_invoke;
  v10[3] = &unk_1E649F7E0;
  v12 = &v13;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "unshareAccountWithContext:completion:", v3, v10);
  v7 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v6, v7);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __66__WBSSavedAccountStore__unshareSignInWithAppleAccountWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__WBSSavedAccountStore__unshareSignInWithAppleAccountWithContext___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_DEFAULT, "Successfully unshared Sign in with Apple Account.", v8, 2u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __57__WBSSavedAccountStore__loadRecentlyDeletedSavedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupID");
}

void __51__WBSSavedAccountStore__fetchAndFilterPasskeysData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = 136315650;
    v9 = "-[WBSSavedAccountStore _fetchAndFilterPasskeysData]_block_invoke";
    v10 = 2048;
    v11 = objc_msgSend(v5, "count");
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu passkey keychain records from group %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

void __66__WBSSavedAccountStore__fetchAndFilterRecentlyDeletedPasskeysData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = 136315650;
    v9 = "-[WBSSavedAccountStore _fetchAndFilterRecentlyDeletedPasskeysData]_block_invoke";
    v10 = 2048;
    v11 = objc_msgSend(v5, "count");
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_DEFAULT, "%s: Loaded %zu recently deleted passkey keychain records from group %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __71__WBSSavedAccountStore__mergeLoadedSavedAccounts_intoAllSavedAccounts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_highLevelDomainForPasswordManager");
}

- (void)_removeSavedAccount:(id)a3 fromCachedCollectionsForCredentialTypes:(int64_t)a4
{
  _BOOL4 v6;
  NSMutableDictionary *personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *savedAccountsWithPasswords;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  NSArray *savedAccountsWithSignInWithAppleRecords;
  void *v20;
  NSArray *v21;
  NSArray *savedAccounts;
  id v23;

  v23 = a3;
  v6 = -[NSArray containsObject:](self->_savedAccountsWithPasswords, "containsObject:");
  if ((a4 & 1) != 0 && v6)
  {
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    objc_msgSend(v23, "highLevelDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "password");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

    v13 = (void *)-[NSArray mutableCopy](self->_savedAccountsWithPasswords, "mutableCopy");
    objc_msgSend(v13, "removeObject:", v23);
    v14 = (NSArray *)objc_msgSend(v13, "copy");
    savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
    self->_savedAccountsWithPasswords = v14;

  }
  if (-[NSArray containsObject:](self->_savedAccounts, "containsObject:", v23))
  {
    v16 = objc_msgSend(v23, "credentialTypes");
    if (v16 == (objc_msgSend(v23, "credentialTypes") & a4))
    {
      if (objc_msgSend(v23, "credentialTypes") == 4)
      {
        v17 = (void *)-[NSArray mutableCopy](self->_savedAccountsWithSignInWithAppleRecords, "mutableCopy");
        objc_msgSend(v17, "removeObject:", v23);
        v18 = (NSArray *)objc_msgSend(v17, "copy");
        savedAccountsWithSignInWithAppleRecords = self->_savedAccountsWithSignInWithAppleRecords;
        self->_savedAccountsWithSignInWithAppleRecords = v18;

      }
      v20 = (void *)-[NSArray mutableCopy](self->_savedAccounts, "mutableCopy");
      objc_msgSend(v20, "removeObject:", v23);
      v21 = (NSArray *)objc_msgSend(v20, "copy");
      savedAccounts = self->_savedAccounts;
      self->_savedAccounts = v21;

    }
  }

}

- (void)_addSavedAccountToRecentlyDeletedCachedCollections:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableArray addObject:](self->_allRecentlyDeletedSavedAccounts, "addObject:", v6);
  -[NSMutableArray sortUsingSelector:](self->_allRecentlyDeletedSavedAccounts, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v6, "sharedGroupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(v5, "sortUsingSelector:", sel_compare_);

  }
  else
  {
    -[NSMutableArray addObject:](self->_recentlyDeletedSavedAccountsInPersonalKeychain, "addObject:", v6);
    -[NSMutableArray sortUsingSelector:](self->_recentlyDeletedSavedAccountsInPersonalKeychain, "sortUsingSelector:", sel_compare_);
  }

}

- (void)_removeSavedAccountFromRecentlyDeletedCachedCollections:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableArray removeObject:](self->_allRecentlyDeletedSavedAccounts, "removeObject:", v6);
  objc_msgSend(v6, "sharedGroupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

  }
  else
  {
    -[NSMutableArray removeObject:](self->_recentlyDeletedSavedAccountsInPersonalKeychain, "removeObject:", v6);
  }

}

- (void)removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSSavedAccountStore_removeCredentialTypes_forSavedAccount___block_invoke;
  block[3] = &unk_1E649F8C8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(queue, block);

}

uint64_t __62__WBSSavedAccountStore_removeCredentialTypes_forSavedAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeCredentialTypes:forSavedAccount:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_removeCredentialTypes:(int64_t)a3 forSavedAccount:(id)a4
{
  id v6;

  v6 = a4;
  if (objc_msgSend(v6, "isRecentlyDeleted"))
    -[WBSSavedAccountStore _removeSavedAccountFromRecentlyDeletedCachedCollections:](self, "_removeSavedAccountFromRecentlyDeletedCachedCollections:", v6);
  else
    -[WBSSavedAccountStore _removeSavedAccount:fromCachedCollectionsForCredentialTypes:](self, "_removeSavedAccount:fromCachedCollectionsForCredentialTypes:", v6, a3);
  objc_msgSend(v6, "_deleteCredentialTypes:", a3);

}

- (void)removeSite:(id)a3 fromSavedAccountWithPassword:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  WBSSavedAccountStore *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__WBSSavedAccountStore_removeSite_fromSavedAccountWithPassword_withCompletion___block_invoke;
  v15[3] = &unk_1E649F8F0;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

uint64_t __79__WBSSavedAccountStore_removeSite_fromSavedAccountWithPassword_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "sites");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "sites");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if (v5)
      objc_msgSend(*(id *)(a1 + 48), "_removeSavedAccount:fromCachedCollectionsForCredentialTypes:", *(_QWORD *)(a1 + 32), 1);
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "_deletePasswordCredentialsForSite:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)canChangeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  NSObject *queue;
  _QWORD block[4];
  id v18;
  WBSSavedAccountStore *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  objc_msgSend(v8, "password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_msgSend(v10, "isEqualToString:", v13) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__WBSSavedAccountStore_canChangeSavedAccount_toUser_password___block_invoke;
    block[3] = &unk_1E649F918;
    v22 = &v23;
    v18 = v8;
    v19 = self;
    v20 = v9;
    v21 = v10;
    dispatch_sync(queue, block);
    v14 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }

  return v14;
}

void __62__WBSSavedAccountStore_canChangeSavedAccount_toUser_password___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isSavedInPersonalKeychain"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_canChangeSavedAccountInPersonalKeychain:toUser:password:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 32), "isSavedInSharedGroup"))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_BYTE *)(v2 + 24))
    {
      v4 = *(void **)(a1 + 32);
      v3 = *(void **)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v4, "sharedGroupID");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "_canChangeSavedAccount:toUser:password:forGroupID:", v4, v5, v6, v7);

    }
    else
    {
      *(_BYTE *)(v2 + 24) = 0;
    }
  }
}

- (BOOL)_canChangeSavedAccountInPersonalKeychain:(id)a3 toUser:(id)a4 password:(id)a5
{
  return -[WBSSavedAccountStore _canChangeSavedAccount:toUser:password:forGroupID:](self, "_canChangeSavedAccount:toUser:password:forGroupID:", a3, a4, a5, 0);
}

- (BOOL)_canChangeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5 forGroupID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "highLevelDomain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    objc_msgSend(v10, "highLevelDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v16, "objectForKeyedSubscript:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protectionSpaces");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  objc_msgSend(v10, "user");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v11, "isEqualToString:", v20);

  objc_msgSend(v10, "password");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__WBSSavedAccountStore__canChangeSavedAccount_toUser_password_forGroupID___block_invoke;
  v27[3] = &unk_1E649F940;
  v32 = v21;
  v23 = v22;
  v28 = v23;
  v24 = v12;
  v29 = v24;
  v25 = v19;
  v30 = v25;
  v31 = &v33;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v27);
  LOBYTE(v20) = *((_BYTE *)v34 + 24);

  _Block_object_dispose(&v33, 8);
  return (char)v20;
}

void __74__WBSSavedAccountStore__canChangeSavedAccount_toUser_password_forGroupID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if ((!*(_BYTE *)(a1 + 64) || (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    && (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = *(id *)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          if (objc_msgSend(v8, "_containsProtectionSpace:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            *a4 = 1;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)changeSavedAccount:(id)a3 toUser:(id)a4 password:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  char v14;
  NSObject *queue;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  WBSSavedAccountStore *v21;
  id v22;
  id v23;
  char v24;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v16, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);
  objc_msgSend(v16, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqualToString:", v12);
  v14 = v13;
  if (!v11 || (v13 & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__WBSSavedAccountStore_changeSavedAccount_toUser_password___block_invoke;
    block[3] = &unk_1E649F988;
    v18 = v16;
    v19 = v8;
    v20 = v9;
    v21 = self;
    v22 = v10;
    v23 = v12;
    v24 = v14;
    dispatch_sync(queue, block);

  }
}

void __59__WBSSavedAccountStore_changeSavedAccount_toUser_password___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "_setUser:password:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "isSavedInPersonalKeychain"))
    objc_msgSend(*(id *)(a1 + 56), "_updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:withChangeFromOldUser:oldPassword:forSavedAccountWithPassword:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "isSavedInSharedGroup"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 56) + 24);
    objc_msgSend(*(id *)(a1 + 32), "sharedGroupID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "_updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:withChangeFromOldUser:oldPassword:forSavedAccountWithPassword:", v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  }
  if (!*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 56), "_saveSidecarObjectsOnInternalQueueForSavedAccountWithPassword:withBlock:", *(_QWORD *)(a1 + 32), &__block_literal_global_183);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 64), "sortedArrayUsingSelector:", sel_compare_);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 56), "sortedArrayUsingSelector:", sel_compare_);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v8;

}

uint64_t __59__WBSSavedAccountStore_changeSavedAccount_toUser_password___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  if (!a2)
    return objc_msgSend(a3, "setHideWarningMarker:", 0);
  return result;
}

- (BOOL)canChangeSavedAccountWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "savedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasValidWebsite") & 1) == 0)
  {
    objc_msgSend(v4, "customTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_stringByTrimmingWhitespace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (!v8)
    {
      v26 = 0;
      goto LABEL_50;
    }
  }
  v9 = objc_msgSend(v5, "credentialTypes");
  if (v9 != 3)
  {
    if (v9 == 2)
    {
      objc_msgSend(v4, "password");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "length");
      objc_msgSend(v4, "user");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        objc_msgSend(v4, "password");
        v48 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "passkeyRelyingPartyID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "notesEntry");
        v21 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "customTitle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sharedGroupID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[WBSSavedAccountStore canSaveUser:password:forUserTypedSite:notes:customTitle:groupID:error:](self, "canSaveUser:password:forUserTypedSite:notes:customTitle:groupID:error:", v21, v48, v20, v22, v23, v24, 0);

        v19 = v21;
        v25 = (void *)v48;
      }
      else
      {
        if (objc_msgSend(v18, "length"))
        {
          v16 = 1;
          goto LABEL_24;
        }
        objc_msgSend(v5, "user");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v25, "length") == 0;
      }

LABEL_24:
      goto LABEL_25;
    }
    if (v9 != 1)
    {
      v16 = 0;
      goto LABEL_26;
    }
  }
  objc_msgSend(v4, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  if (!v11)
  {
    objc_msgSend(v5, "user");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "length"))
    {
      v47 = v19;
      goto LABEL_7;
    }
    v16 = 0;
    goto LABEL_24;
  }
LABEL_7:
  objc_msgSend(v4, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  if (v13
    || (objc_msgSend(v5, "user"), v46 = (void *)objc_claimAutoreleasedReturnValue(), !objc_msgSend(v46, "length")))
  {
    objc_msgSend(v4, "user");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "password");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WBSSavedAccountStore canChangeSavedAccount:toUser:password:](self, "canChangeSavedAccount:toUser:password:", v5, v14, v15);

    if (v13)
      goto LABEL_20;
  }
  else
  {
    v16 = 0;
  }

LABEL_20:
  v19 = v47;
  if (!v11)
    goto LABEL_24;
LABEL_25:

LABEL_26:
  objc_msgSend(v4, "notesEntry");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");
  objc_msgSend(v5, "notesEntry");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v30 <= 0x400)
    v31 = 1024;
  else
    v31 = v30;

  objc_msgSend(v4, "customTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");
  objc_msgSend(v5, "customTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "length");

  if (v35 <= 0x80)
    v36 = 128;
  else
    v36 = v35;

  v26 = v33 <= v36 && v28 <= v31 && v16;
  if (objc_msgSend(v4, "hasAdditionalSitesChange"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v4, "additionalSites");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v52 != v41)
            objc_enumerationMutation(v38);
          v43 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v44 = (void *)objc_opt_class();
          v49 = 0;
          v50 = 0;
          LODWORD(v43) = objc_msgSend(v44, "getProtectionSpaceAndHighLevelDomainForUserTypedSite:protectionSpace:highLevelDomain:", v43, &v50, &v49);

          if (!(_DWORD)v43)
          {
            v26 = 0;
            goto LABEL_49;
          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v40)
          continue;
        break;
      }
    }
LABEL_49:

  }
LABEL_50:

  return v26;
}

- (void)changeSavedAccountWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  WBSSavedAccountStore *v21;
  id v22;
  id v23;
  char v24;

  v15 = a3;
  objc_msgSend(v15, "savedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "hasChanges"))
  {
    objc_msgSend(v15, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "password");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "password");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "credentialTypes") & 1;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke;
    block[3] = &unk_1E649F9D8;
    v17 = v15;
    v18 = v4;
    v19 = v5;
    v24 = v9;
    v20 = v6;
    v21 = self;
    v22 = v7;
    v23 = v8;
    v11 = v8;
    v12 = v7;
    v13 = v6;
    v14 = v5;
    dispatch_sync(queue, block);

  }
}

void __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  char v19;
  int v20;
  int v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD block[5];
  _QWORD v45[4];
  id v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasUserChange") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "hasPasswordChange"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_setUser:password:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  objc_msgSend(*(id *)(a1 + 32), "sites");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(*(id *)(a1 + 40), "sites");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "sites");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v8);

    objc_msgSend(v5, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v53 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(a1 + 40), "_deletePasswordCredentialsForSite:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v11);
    }

  }
  if (*(_BYTE *)(a1 + 88))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isSavedInPersonalKeychain"))
      objc_msgSend(*(id *)(a1 + 64), "_updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:withChangeFromOldUser:oldPassword:forSavedAccountWithPassword:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(a1 + 40), "isSavedInSharedGroup"))
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 64) + 24);
      objc_msgSend(*(id *)(a1 + 40), "sharedGroupID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 64), "_updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:withChangeFromOldUser:oldPassword:forSavedAccountWithPassword:", v16, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
    }
  }
  v17 = objc_msgSend(*(id *)(a1 + 32), "hasTOTPGeneratorChange");
  v18 = objc_msgSend(*(id *)(a1 + 32), "hasNotesEntryChange");
  v19 = objc_msgSend(*(id *)(a1 + 32), "hasPasswordChange");
  v20 = objc_msgSend(*(id *)(a1 + 32), "hasCustomTitleChange");
  v21 = objc_msgSend(*(id *)(a1 + 32), "hasAdditionalSitesChange");
  v22 = v21;
  if ((v17 & 1) != 0 || (v18 & 1) != 0 || (v19 & 1) != 0 || (v20 & 1) != 0 || v21)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "valueForKey:", CFSTR("safariUseLegacySidecarModificationPath"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = *(void **)(a1 + 64);
    if (v24)
    {
      objc_msgSend(*(id *)(a1 + 64), "_performLegacySidecarModificationWithChangeRequest:toSavedAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      if (!v20)
        goto LABEL_26;
      goto LABEL_25;
    }
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_2;
    v45[3] = &unk_1E649F9B0;
    v47 = v17;
    v34 = *(_QWORD *)(a1 + 40);
    v46 = *(id *)(a1 + 32);
    v48 = v18;
    v49 = v20;
    v50 = v19;
    v51 = v22;
    objc_msgSend(v25, "_saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:", v34, v45);

    if (v20)
    {
LABEL_25:
      v26 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "customTitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCustomTitle:performSidecarUpdate:", v27, 0);

    }
  }
LABEL_26:
  if (objc_msgSend(*(id *)(a1 + 32), "isAddingPasswordToAccountWithPasskey"))
  {
    v29 = *(_QWORD *)(a1 + 56);
    v28 = *(void **)(a1 + 64);
    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "passkeyRelyingPartyID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sharedGroupID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_saveAccountOnInternalQueueWithUser:password:forUserTypedSite:groupID:", v30, v29, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 64), "_mergeSavedAccountWithPassword:toSavedAccountWithPasskey:", v33, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v35 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_cold_1();
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 64), "sortedArrayUsingSelector:", sel_compare_);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = *(_QWORD *)(a1 + 64);
  v38 = *(void **)(v37 + 64);
  *(_QWORD *)(v37 + 64) = v36;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 56), "sortedArrayUsingSelector:", sel_compare_);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = *(_QWORD *)(a1 + 64);
  v41 = *(void **)(v40 + 56);
  *(_QWORD *)(v40 + 56) = v39;

  +[WBSKeychainSyncingMonitor sharedMonitor](WBSKeychainSyncingMonitor, "sharedMonitor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "keychainSyncSettingValue");

  if (v43 == 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_189;
    block[3] = &unk_1E649B768;
    block[4] = *(_QWORD *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  WBSSavedAccountAdditionalSite *v20;
  id obj;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "totpGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotpGenerator:", v6);

  }
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "notesEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNotesEntry:", v7);

  }
  if (*(_BYTE *)(a1 + 42))
  {
    objc_msgSend(*(id *)(a1 + 32), "customTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCustomTitle:", v8);

  }
  if (!a2 && *(_BYTE *)(a1 + 43))
    objc_msgSend(v5, "setHideWarningMarker:", 0);
  if (*(_BYTE *)(a1 + 44))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "additionalSites");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "additionalSites");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v17 = v5;
          objc_msgSend(v5, "additionalSites");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_3;
          v22[3] = &unk_1E649EF50;
          v22[4] = v16;
          objc_msgSend(v18, "safari_firstObjectPassingTest:", v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v11, "addObject:", v19);
          }
          else
          {
            v20 = -[WBSSavedAccountAdditionalSite initWithSite:]([WBSSavedAccountAdditionalSite alloc], "initWithSite:", v16);
            objc_msgSend(v11, "addObject:", v20);

          }
          v5 = v17;
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    objc_msgSend(v5, "setAdditionalSites:", v11);
  }

}

uint64_t __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "site");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_189(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

- (void)_performLegacySidecarModificationWithChangeRequest:(id)a3 toSavedAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  BOOL v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  BOOL v30;
  BOOL v31;
  char v32;
  _QWORD v33[4];
  id v34;
  id v35;
  BOOL v36;
  BOOL v37;
  BOOL v38;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasTOTPGeneratorChange"))
  {
    objc_msgSend(v7, "totpGenerators");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v6, "hasNotesEntryChange"))
  {
    objc_msgSend(v7, "notesEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;

  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v6, "hasCustomTitleChange"))
  {
    objc_msgSend(v7, "customTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __90__WBSSavedAccountStore__performLegacySidecarModificationWithChangeRequest_toSavedAccount___block_invoke;
  v33[3] = &unk_1E649FA00;
  v36 = v10;
  v37 = v12;
  v38 = v14;
  v15 = v7;
  v34 = v15;
  v16 = v6;
  v35 = v16;
  -[WBSSavedAccountStore _saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:](self, "_saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:", v15, v33);
  if (objc_msgSend(v16, "hasTOTPGeneratorChange"))
  {
    objc_msgSend(v16, "totpGenerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 != 0;

  }
  else
  {
    v18 = 0;
  }
  if (objc_msgSend(v16, "hasNotesEntryChange"))
  {
    objc_msgSend(v16, "notesEntry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length") != 0;

  }
  else
  {
    v20 = 0;
  }
  if (objc_msgSend(v16, "hasCustomTitleChange"))
  {
    objc_msgSend(v16, "customTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      objc_msgSend(v16, "customTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userVisibleDomain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = WBSIsEqual(v22, v23) ^ 1;

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __90__WBSSavedAccountStore__performLegacySidecarModificationWithChangeRequest_toSavedAccount___block_invoke_2;
  v27[3] = &unk_1E649FA00;
  v30 = v18;
  v31 = v20;
  v32 = v24;
  v28 = v16;
  v29 = v15;
  v25 = v15;
  v26 = v16;
  -[WBSSavedAccountStore _saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:](self, "_saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:", v25, v27);

}

void __90__WBSSavedAccountStore__performLegacySidecarModificationWithChangeRequest_toSavedAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v5;
  id v6;

  v6 = a3;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v6, "setTotpGenerator:", 0);
  if (*(_BYTE *)(a1 + 49))
    objc_msgSend(v6, "setNotesEntry:", 0);
  if (*(_BYTE *)(a1 + 50))
    objc_msgSend(*(id *)(a1 + 32), "setCustomTitle:performSidecarUpdate:", 0, 0);
  v5 = objc_msgSend(*(id *)(a1 + 40), "hasPasswordChange");
  if (!a2 && v5)
    objc_msgSend(v6, "setHideWarningMarker:", 0);

}

void __90__WBSSavedAccountStore__performLegacySidecarModificationWithChangeRequest_toSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "totpGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTotpGenerator:", v4);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "notesEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNotesEntry:", v5);

  }
  if (*(_BYTE *)(a1 + 50))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "customTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCustomTitle:performSidecarUpdate:", v7, 0);

  }
}

- (void)_updateSavedAccountsAndSavedAccountsWithPasswordsDictionary:(id)a3 withChangeFromOldUser:(id)a4 oldPassword:(id)a5 forSavedAccountWithPassword:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *savedAccounts;
  id v25;

  v25 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v11, "highLevelDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "password");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "user");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v25, "isEqualToString:", v18);

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "removeObjectForKey:", v10);
    if (!objc_msgSend(v20, "count"))
      objc_msgSend(v14, "removeObjectForKey:", v25);
    objc_msgSend(v14, "objectForKeyedSubscript:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v16);
    }
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v11, "_adoptSitesFromSavedAccount:", v21);
    v22 = (void *)-[NSArray mutableCopy](self->_savedAccountsWithPasswords, "mutableCopy");
    objc_msgSend(v22, "removeObject:", v21);
    objc_msgSend(v22, "addObject:", v11);
    objc_storeStrong((id *)&self->_savedAccountsWithPasswords, v22);
    if (-[NSArray containsObject:](self->_savedAccounts, "containsObject:", v21))
    {
      v23 = (NSArray *)-[NSArray mutableCopy](self->_savedAccounts, "mutableCopy");
      -[NSArray removeObject:](v23, "removeObject:", v21);
      -[NSArray addObject:](v23, "addObject:", v11);
      savedAccounts = self->_savedAccounts;
      self->_savedAccounts = v23;

    }
  }
  else
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v17);
  }

}

+ (id)protectionSpaceForNewStandalonePassword
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C92C70]);
  objc_msgSend(v2, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHost:port:protocol:realm:authenticationMethod:", v4, 0, CFSTR("https"), 0, *MEMORY[0x1E0C92B40]);

  return v5;
}

+ (BOOL)getProtectionSpaceAndHighLevelDomainForUserTypedSite:(id)a3 protectionSpace:(id *)a4 highLevelDomain:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  void *v21;
  id v22;

  v7 = a3;
  objc_msgSend(v7, "safari_bestURLForUserTypedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = v9;
  objc_msgSend(v9, "protocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C92B90]))
  {
    objc_msgSend(v7, "safari_stringByTrimmingWhitespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "safari_hasCaseInsensitivePrefix:", CFSTR("http:"));

    if ((v12 & 1) != 0)
      goto LABEL_6;
    v13 = objc_alloc(MEMORY[0x1E0C92C70]);
    objc_msgSend(*a4, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*a4, "port");
    v15 = *MEMORY[0x1E0C92BA0];
    objc_msgSend(*a4, "realm");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*a4, "authenticationMethod");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v13, "initWithHost:port:protocol:realm:authenticationMethod:", v10, v14, v15, v16, v17);

  }
LABEL_6:
  objc_msgSend(*a4, "host");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "safari_isCaseInsensitiveEqualToString:", CFSTR("localhost"));

  if (v19)
  {
    *a5 = CFSTR("localhost");
    v20 = 1;
  }
  else
  {
    objc_msgSend(*a4, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safari_highLevelDomainForUserTypedStringWhenAddingPasswordInPasswordManager");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = v22;
    v20 = v22 != 0;

  }
LABEL_10:

  return v20;
}

- (BOOL)canSaveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 notes:(id)a6 customTitle:(id)a7 groupID:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  BOOL v24;
  id v26;
  id v27;
  id v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (objc_msgSend(v16, "length"))
  {
    if (objc_msgSend(v17, "length"))
    {
      v26 = v15;
      v27 = 0;
      v28 = 0;
      v21 = objc_msgSend((id)objc_opt_class(), "getProtectionSpaceAndHighLevelDomainForUserTypedSite:protectionSpace:highLevelDomain:", v17, &v28, &v27);
      v22 = v28;
      v23 = v27;
      if ((v21 & 1) != 0)
      {
        objc_msgSend(v19, "length");
        v15 = v26;
        v24 = -[WBSSavedAccountStore canSaveUser:password:forProtectionSpace:highLevelDomain:notes:customTitle:groupID:error:](self, "canSaveUser:password:forProtectionSpace:highLevelDomain:notes:customTitle:groupID:error:", v26, v16, v22, v23, v18, v19, v20, a9);
      }
      else
      {
        if (a9)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.SaveUserErrorDomain"), 1, CFSTR("userTypedSite does not have a valid format."));
          v24 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        v15 = v26;
      }
    }
    else if (objc_msgSend(v19, "length"))
    {
      v22 = 0;
      v23 = 0;
      v24 = 1;
    }
    else if (a9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.SaveUserErrorDomain"), 5, CFSTR("Must provide either a website or a custom title"));
      v22 = 0;
      v23 = 0;
      v24 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
    }

  }
  else if (a9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.SaveUserErrorDomain"), 5, CFSTR("Account details provided are incomplete."));
    v24 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 groupID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__15;
  v31 = __Block_byref_object_dispose__15;
  v32 = 0;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__WBSSavedAccountStore_saveUser_password_forUserTypedSite_groupID___block_invoke;
  v21[3] = &unk_1E649FA28;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v26 = &v27;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_sync(queue, v21);
  v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __67__WBSSavedAccountStore_saveUser_password_forUserTypedSite_groupID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_saveAccountOnInternalQueueWithUser:password:forUserTypedSite:groupID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_saveAccountOnInternalQueueWithUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 groupID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v12, "length");
  v15 = (void *)objc_opt_class();
  if (v14)
  {
    v23 = 0;
    v24 = 0;
    v16 = objc_msgSend(v15, "getProtectionSpaceAndHighLevelDomainForUserTypedSite:protectionSpace:highLevelDomain:", v12, &v24, &v23);
    v17 = v24;
    v18 = v23;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);

    if (v19)
    {
      v20 = v12;

      v18 = v20;
    }
    else if ((v16 & 1) == 0)
    {
      v21 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(v15, "protectionSpaceForNewStandalonePassword");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "host");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[WBSSavedAccountStore _saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:](self, "_saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:", v10, v11, v17, v18, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v21;
}

- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 notesEntry:(id)a6 groupID:(id)a7
{
  id v12;
  void *v13;

  v12 = a6;
  -[WBSSavedAccountStore saveUser:password:forUserTypedSite:groupID:](self, "saveUser:password:forUserTypedSite:groupID:", a3, a4, a5, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore saveNotesEntry:forSavedAccount:](self, "saveNotesEntry:forSavedAccount:", v12, v13);

  return v13;
}

- (id)saveUser:(id)a3 password:(id)a4 forUserTypedSite:(id)a5 customTitle:(id)a6 notesEntry:(id)a7 groupID:(id)a8
{
  id v14;
  id v15;
  void *v16;

  v14 = a7;
  v15 = a6;
  -[WBSSavedAccountStore saveUser:password:forUserTypedSite:groupID:](self, "saveUser:password:forUserTypedSite:groupID:", a3, a4, a5, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore saveCustomTitle:forSavedAccount:](self, "saveCustomTitle:forSavedAccount:", v15, v16);

  -[WBSSavedAccountStore saveNotesEntry:forSavedAccount:](self, "saveNotesEntry:forSavedAccount:", v14, v16);
  return v16;
}

- (BOOL)canSaveUser:(id)a3 password:(id)a4 forProtectionSpace:(id)a5 highLevelDomain:(id)a6 notes:(id)a7 customTitle:(id)a8 groupID:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  NSObject *queue;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (v16 && (v23 = objc_msgSend(v17, "length"), v18) && v23 && objc_msgSend(v19, "length"))
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__15;
    v41 = __Block_byref_object_dispose__15;
    v42 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke;
    block[3] = &unk_1E649FA78;
    block[4] = self;
    v29 = v22;
    v35 = &v37;
    v36 = &v43;
    v30 = v19;
    v31 = v16;
    v32 = v18;
    v33 = v20;
    v34 = v21;
    dispatch_sync(queue, block);
    if (a10)
    {
      v24 = (void *)v38[5];
      if (v24)
        *a10 = objc_retainAutorelease(v24);
    }
    v25 = *((_BYTE *)v44 + 24) != 0;

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);
  }
  else if (a10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.SaveUserErrorDomain"), 5, CFSTR("Account details provided are incomplete."));
    v25 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDomainsToUsersExists");
  v2 = objc_msgSend(*(id *)(a1 + 40), "length");
  v3 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(*(id *)(v3 + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_4;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(v3 + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v12;
    if (v12)
    {
LABEL_4:
      v13 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      if (v7)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke_206;
        v14[3] = &unk_1E649FA50;
        v15 = *(id *)(a1 + 64);
        v19 = *(_OWORD *)(a1 + 88);
        v16 = *(id *)(a1 + 48);
        v17 = *(id *)(a1 + 72);
        v18 = *(id *)(a1 + 80);
        objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

      }
      return;
    }
LABEL_8:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
    return;
  }
  v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke_cold_1();
  objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.SaveUserErrorDomain"), 6, CFSTR("Adding password to unknown group."));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
}

void __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke_206(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  if (objc_msgSend(v24, "_containsProtectionSpace:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.SaveUserErrorDomain"), 2, CFSTR("Account details provided already exist."));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
  }
  objc_msgSend(v24, "notesEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "highLevelDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 40))
    && objc_msgSend(*(id *)(a1 + 48), "length")
    && objc_msgSend(v9, "length"))
  {
    v11 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 48));

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.SaveUserErrorDomain"), 3, CFSTR("An account with the same username/password of this highLevelDomain exists, with different notes."));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {

  }
  objc_msgSend(v24, "customTitle");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &stru_1E64A2498;
  if (v15)
    v17 = (__CFString *)v15;
  v18 = v17;

  objc_msgSend(v24, "highLevelDomain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    v20 = WBSIsEqual(*(void **)(a1 + 56), v18);

    if ((v20 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.SaveUserErrorDomain"), 4, CFSTR("An account with the same username/password of this highLevelDomain exists, with different titles."));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {

  }
}

- (id)saveUser:(id)a3 password:(id)a4 forProtectionSpace:(id)a5 highLevelDomain:(id)a6 groupID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__15;
  v36 = __Block_byref_object_dispose__15;
  v37 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__WBSSavedAccountStore_saveUser_password_forProtectionSpace_highLevelDomain_groupID___block_invoke;
  block[3] = &unk_1E649FAA0;
  v30 = v16;
  v31 = &v32;
  block[4] = self;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v29 = v15;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_sync(queue, block);
  v23 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v23;
}

void __85__WBSSavedAccountStore_saveUser_password_forProtectionSpace_highLevelDomain_groupID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_canMoveSavedAccountWithPasskey:(id)a3 toGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__WBSSavedAccountStore__canMoveSavedAccountWithPasskey_toGroup___block_invoke;
  v12[3] = &unk_1E649FAC8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

void __64__WBSSavedAccountStore__canMoveSavedAccountWithPasskey_toGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  WBSPair *v5;
  void *v6;
  WBSPair *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDomainsToUsersExists");
  v2 = (void *)MEMORY[0x1E0C92C70];
  objc_msgSend(*(id *)(a1 + 40), "passkeyRelyingPartyID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [WBSPair alloc];
  objc_msgSend(*(id *)(a1 + 40), "passkeyUserHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSPair initWithFirst:second:](v5, "initWithFirst:second:", v6, v4);

  v8 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  if (!v8)
  {
    objc_msgSend(*(id *)(v9 + 16), "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v10 = *(void **)(v9 + 32);
  objc_msgSend(v8, "groupID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14 == 0;

    goto LABEL_9;
  }
  v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    __64__WBSSavedAccountStore__canMoveSavedAccountWithPasskey_toGroup___block_invoke_cold_1();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_9:

}

- (id)_saveAccountOnInternalQueueWithUser:(id)a3 password:(id)a4 protectionSpace:(id)a5 highLevelDomain:(id)a6 groupID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSMutableDictionary *groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSArray *v31;
  NSArray *savedAccountsWithPasswords;
  void *v33;
  void *v34;
  NSArray *sharedAccountsGroups;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = 0;
  if (!v12 || !v14)
    goto LABEL_33;
  if (!objc_msgSend(v15, "length"))
  {
LABEL_32:
    v17 = 0;
    goto LABEL_33;
  }
  if (!objc_msgSend(v16, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, "setObject:forKeyedSubscript:", v26, v15);
    }
    goto LABEL_14;
  }
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentUserParticipantID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v41 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccountStore _saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:].cold.3();
    goto LABEL_32;
  }
  groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
  if (!groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v22 = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
    self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = v21;

    groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "setObject:forKeyedSubscript:", v24, v16);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v15);

  }
LABEL_14:
  objc_msgSend(v26, "objectForKeyedSubscript:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, v12);
  }
  v43 = v26;
  v44 = v28;
  objc_msgSend(v28, "objectForKeyedSubscript:", v13);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (id)v29;
  if (!v29)
  {
    v30 = -[WBSSavedAccount _initWithHighLevelDomain:user:password:]([WBSSavedAccount alloc], "_initWithHighLevelDomain:user:password:", v15, v12, v13);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, v13);
    v31 = (NSArray *)-[NSArray mutableCopy](self->_savedAccountsWithPasswords, "mutableCopy");
    -[NSArray safari_insertObject:inSortedOrderUsingComparator:](v31, "safari_insertObject:inSortedOrderUsingComparator:", v30, &__block_literal_global_214);
    savedAccountsWithPasswords = self->_savedAccountsWithPasswords;
    self->_savedAccountsWithPasswords = v31;

  }
  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C60], "safari_credentialWithUser:password:persistence:", v12, v13, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "safari_setCredential:forHTMLFormProtectionSpace:forGroupID:", v34, v14, v16);

  if (objc_msgSend(v16, "length"))
  {
    sharedAccountsGroups = self->_sharedAccountsGroups;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __109__WBSSavedAccountStore__saveAccountOnInternalQueueWithUser_password_protectionSpace_highLevelDomain_groupID___block_invoke_2;
    v45[3] = &unk_1E649D508;
    v46 = v16;
    -[NSArray safari_firstObjectPassingTest:](sharedAccountsGroups, "safari_firstObjectPassingTest:", v45);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      v37 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[WBSSavedAccountStore _saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:].cold.2();
    }
    objc_msgSend(v36, "groupID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSharedGroupID:", v38);

  }
  else
  {
    objc_msgSend(v30, "setSharedGroupID:", &stru_1E64A2498);
  }
  objc_msgSend(v30, "_createSidecarsForProtectionSpaceIfNecessary:", v14);
  objc_msgSend(v14, "host");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_addProtectionSpace:forSite:isDefaultCredentialForSite:", v14, v39, v29 == 0);

  if (!v29)
  {
    if (objc_msgSend(v16, "length"))
    {
      if ((objc_msgSend(v30, "markOriginalContributorParticipantID") & 1) == 0)
      {
        v40 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[WBSSavedAccountStore _saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:].cold.1();
      }
    }
  }
  v17 = v30;

LABEL_33:
  return v17;
}

uint64_t __109__WBSSavedAccountStore__saveAccountOnInternalQueueWithUser_password_protectionSpace_highLevelDomain_groupID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __109__WBSSavedAccountStore__saveAccountOnInternalQueueWithUser_password_protectionSpace_highLevelDomain_groupID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_saveSidecarObjectsOnInternalQueueForSavedAccount:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[WBSSavedAccountStore _saveSidecarObjectsOnInternalQueueForSavedAccountWithPassword:withBlock:](self, "_saveSidecarObjectsOnInternalQueueForSavedAccountWithPassword:withBlock:", v7, v6);
  -[WBSSavedAccountStore _saveSidecarOnInternalQueueForSavedAccountWithPasskey:withBlock:](self, "_saveSidecarOnInternalQueueForSavedAccountWithPasskey:withBlock:", v7, v6);

}

- (void)_saveSidecarObjectsOnInternalQueueForSavedAccountWithPassword:(id)a3 withBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(v7, "password");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "_updatePasswordSidecarsIfNecessaryWithBlock:", v5);

}

- (void)_saveSidecarOnInternalQueueForSavedAccountWithPasskey:(id)a3 withBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(v7, "passkeyCredentialID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "_updatePasskeySidecarsIfNecessaryWithBlock:", v5);

}

- (void)_writeSidecarDataForMergedSavedAccount:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "notesEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v5, "setNotesEntry:", v3);
  objc_msgSend(v5, "customTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v5, "setCustomTitle:performSidecarUpdate:", v4, 1);

}

- (void)saveAdditionalSites:(id)a3 forSavedAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSSavedAccountStore_saveAdditionalSites_forSavedAccount___block_invoke;
  block[3] = &unk_1E649B6D8;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

uint64_t __60__WBSSavedAccountStore_saveAdditionalSites_forSavedAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAdditionalSites:", *(_QWORD *)(a1 + 40));
}

- (void)addAdditionalSite:(id)a3 toSavedAccount:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "additionalSites");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v11);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v6, "additionalSites");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore saveAdditionalSites:forSavedAccount:](self, "saveAdditionalSites:forSavedAccount:", v10, v6);

  }
}

- (void)saveTOTPGenerator:(id)a3 forSavedAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WBSSavedAccountStore_saveTOTPGenerator_forSavedAccount___block_invoke;
  block[3] = &unk_1E649B6D8;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

uint64_t __58__WBSSavedAccountStore_saveTOTPGenerator_forSavedAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTOTPGenerator:", *(_QWORD *)(a1 + 40));
}

- (void)removeTOTPGeneratorForSavedAccount:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WBSSavedAccountStore_removeTOTPGeneratorForSavedAccount___block_invoke;
  block[3] = &unk_1E649B768;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __59__WBSSavedAccountStore_removeTOTPGeneratorForSavedAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTOTPGenerator:", 0);
}

- (void)saveNotesEntry:(id)a3 forSavedAccount:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "length"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__WBSSavedAccountStore_saveNotesEntry_forSavedAccount___block_invoke;
    block[3] = &unk_1E649B6D8;
    v10 = v6;
    v11 = v8;
    dispatch_sync(queue, block);

  }
}

uint64_t __55__WBSSavedAccountStore_saveNotesEntry_forSavedAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNotesEntry:", *(_QWORD *)(a1 + 40));
}

- (void)saveCustomTitle:(id)a3 forSavedAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  WBSSavedAccountStore *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSSavedAccountStore_saveCustomTitle_forSavedAccount___block_invoke;
  block[3] = &unk_1E649C7E0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __56__WBSSavedAccountStore_saveCustomTitle_forSavedAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userVisibleDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = WBSIsEqual(v2, v3);

  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCustomTitle:performSidecarUpdate:", *(_QWORD *)(a1 + 32), 0);
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__WBSSavedAccountStore_saveCustomTitle_forSavedAccount___block_invoke_2;
    v6[3] = &unk_1E649ECB8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "_saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:", v5, v6);

  }
}

uint64_t __56__WBSSavedAccountStore_saveCustomTitle_forSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setCustomTitle:", *(_QWORD *)(a1 + 32));
}

- (void)saveHideMarker:(id)a3 forSavedAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WBSSavedAccountStore_saveHideMarker_forSavedAccount___block_invoke;
  block[3] = &unk_1E649C7E0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __55__WBSSavedAccountStore_saveHideMarker_forSavedAccount___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__WBSSavedAccountStore_saveHideMarker_forSavedAccount___block_invoke_2;
  v3[3] = &unk_1E649ECB8;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:", v2, v3);

}

void __55__WBSSavedAccountStore_saveHideMarker_forSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!a2)
  {
    v6 = v5;
    objc_msgSend(v5, "setHideWarningMarker:", *(_QWORD *)(a1 + 32));
    v5 = v6;
  }

}

- (void)removeHideWarningMarkerForSavedAccount:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSSavedAccountStore_removeHideWarningMarkerForSavedAccount___block_invoke;
  block[3] = &unk_1E649B6D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __63__WBSSavedAccountStore_removeHideWarningMarkerForSavedAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:", *(_QWORD *)(a1 + 40), &__block_literal_global_216);
}

void __63__WBSSavedAccountStore_removeHideWarningMarkerForSavedAccount___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  if (!a2)
  {
    v5 = v4;
    objc_msgSend(v4, "setHideWarningMarker:", 0);
    v4 = v5;
  }

}

- (void)resetHiddenSecurityRecommendationsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__WBSSavedAccountStore_resetHiddenSecurityRecommendationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __80__WBSSavedAccountStore_resetHiddenSecurityRecommendationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "hideWarningMarker", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(*(id *)(a1 + 32), "_saveSidecarObjectsOnInternalQueueForSavedAccount:withBlock:", v7, &__block_literal_global_217);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__WBSSavedAccountStore_resetHiddenSecurityRecommendationsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  if (!a2)
  {
    v5 = v4;
    objc_msgSend(v4, "setHideWarningMarker:", 0);
    v4 = v5;
  }

}

- (unint64_t)numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WBSSavedAccountStore_numberOfSavedAccountsInPersonalKeychainForHighLevelDomain___block_invoke;
  block[3] = &unk_1E649B700;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __82__WBSSavedAccountStore_numberOfSavedAccountsInPersonalKeychainForHighLevelDomain___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "count");

}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WBSSavedAccountStore_reset__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__WBSSavedAccountStore_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetOnInternalQueue");
}

uint64_t __68__WBSSavedAccountStore__cleanUpRedundantCredentialsWithoutUsernames__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(v3, "isDuplicateWithoutUserNameOfSavedAccount:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
          {
            v6 = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v6;
}

- (BOOL)_deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:(id)a3 inGroup:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count")
    && (objc_msgSend(v6, "participants"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentUserParticipantID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "participants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __114__WBSSavedAccountStore__deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts_inGroup___block_invoke;
      v36[3] = &unk_1E649FB70;
      v29 = v10;
      v37 = v10;
      objc_msgSend(v12, "safari_mapObjectsUsingBlock:", v36);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = v5;
      v15 = (void *)objc_msgSend(v5, "copy");
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v6, "groupID", v29);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "originalContributorParticipantID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              if ((objc_msgSend(v14, "containsObject:", v23) & 1) == 0)
              {
                v24 = WBS_LOG_CHANNEL_PREFIXPasswords();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138478339;
                  v39 = v22;
                  v40 = 2113;
                  v41 = v23;
                  v42 = 2113;
                  v43 = v14;
                  _os_log_impl(&dword_1B2621000, v24, OS_LOG_TYPE_DEFAULT, "Deleting a shared saved account with a contributor ID that does not map to a participant in group ID: %{private}@, saved account original contributor ID: %{private}@, group participant IDs: %{private}@", buf, 0x20u);
                }
                objc_msgSend(v6, "groupID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBSSavedAccountStore _removeSavedAccount:fromGroupID:](self, "_removeSavedAccount:fromGroupID:", v21, v25);

                v18 = 1;
              }
            }
            else
            {
              v26 = WBS_LOG_CHANNEL_PREFIXPasswords();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138477827;
                v39 = v22;
                _os_log_error_impl(&dword_1B2621000, v26, OS_LOG_TYPE_ERROR, "Found a shared saved account without an original contributor participant ID in group ID: %{private}@", buf, 0xCu);
              }
              -[WBSSavedAccountStore _reportAccountsWithUnknownContributorIDIfNeeded](self, "_reportAccountsWithUnknownContributorIDIfNeeded");
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }

      v10 = v29;
      v5 = v30;
    }
    else
    {
      v27 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[WBSSavedAccountStore _deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:inGroup:].cold.1();
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18 & 1;
}

id __114__WBSSavedAccountStore__deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts_inGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isCurrentUser"))
  {
    v4 = *(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(v3, "participantID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_reportAccountsWithUnknownContributorIDIfNeeded
{
  atomic_flag *p_didReportAccountsWithUnknownContributorID;
  unsigned __int8 v3;
  NSObject *v4;

  p_didReportAccountsWithUnknownContributorID = &self->_didReportAccountsWithUnknownContributorID;
  do
    v3 = __ldaxr((unsigned __int8 *)p_didReportAccountsWithUnknownContributorID);
  while (__stlxr(1u, (unsigned __int8 *)p_didReportAccountsWithUnknownContributorID));
  if ((v3 & 1) == 0)
  {
    dispatch_get_global_queue(17, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, &__block_literal_global_224);

  }
}

void __71__WBSSavedAccountStore__reportAccountsWithUnknownContributorIDIfNeeded__block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __71__WBSSavedAccountStore__reportAccountsWithUnknownContributorIDIfNeeded__block_invoke_cold_1();
}

uint64_t __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke_225(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

- (void)_identifySharedSavedAccountsWithSameUsernameAndHighLevelDomainPairs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  WBSPair *v12;
  void *v13;
  void *v14;
  WBSPair *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  WBSPair *v26;
  void *v27;
  void *v28;
  WBSPair *v29;
  void *v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_groupIdentifiersToSavedAccounts, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_flattenedArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        v12 = [WBSPair alloc];
        objc_msgSend(v11, "highLevelDomain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "user");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[WBSPair initWithFirst:second:](v12, "initWithFirst:second:", v13, v14);

        objc_msgSend(v3, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v15);

        }
        objc_msgSend(v3, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sharedGroupID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v8);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v24);
        v26 = [WBSPair alloc];
        objc_msgSend(v25, "highLevelDomain", (_QWORD)v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "user");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[WBSPair initWithFirst:second:](v26, "initWithFirst:second:", v27, v28);

        objc_msgSend(v3, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v31 >= 2)
          objc_msgSend(v25, "setHasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts:", 1);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v22);
  }

}

- (void)_ensureDomainsToUsersExists
{
  id v2;

  v2 = -[WBSSavedAccountStore _savedAccounts](self, "_savedAccounts");
}

- (void)_mergeSavedAccountWithPassword:(id)a3 toSavedAccountWithPasskey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id obj;
  void *v30;
  uint8_t buf;
  _BYTE v32[15];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPassword:", v7);

  objc_msgSend(v5, "protectionSpaces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v5;
  objc_msgSend(v6, "_addProtectionSpace:forSite:isDefaultCredentialForSite:", v9, v10, objc_msgSend(v5, "isDefaultCredentialForFullyQualifiedHostname:", v10));
  if (objc_msgSend(v6, "hasPasskeySidecars"))
  {
    v28 = v10;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v6, "passkeyCredentialSidecarsDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v12;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (!v13)
      goto LABEL_18;
    v14 = v13;
    v15 = *(_QWORD *)v34;
    v16 = &off_1E6499000;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (objc_class *)WBSSavedAccountSidecar;
LABEL_11:
          v20 = [v19 alloc];
          objc_msgSend(v30, "user");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v20, "initWithUser:protectionSpace:dictionaryRepresentation:", v21, v9, v22);

          v24 = v18;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v24, "setLastOneTimeShareDateForPasskey:", 0);
          objc_msgSend(v23, "protectionSpace");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "host");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "_addSidecar:forSite:", v23, v26);

          v16 = &off_1E6499000;
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (objc_class *)v16[126];
          goto LABEL_11;
        }
        v27 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[WBSSavedAccountStore _mergeSavedAccountWithPassword:toSavedAccountWithPasskey:].cold.1(&buf, v32, v27);
LABEL_16:
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (!v14)
      {
LABEL_18:

        objc_msgSend(v6, "_updatePasswordSidecarsIfNecessaryWithBlock:", 0);
        v10 = v28;
        break;
      }
    }
  }

}

- (void)_mergeSavedAccountWithPasskey:(id)a3 toSavedAccountWithPassword:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v5 = a4;
  objc_msgSend(v25, "passkeyUserHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasskeyUserHandle:", v6);

  objc_msgSend(v25, "passkeyCredentialID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasskeyCredentialID:", v7);

  objc_msgSend(v25, "passkeyRelyingPartyID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasskeyRelyingPartyID:", v8);

  objc_msgSend(v25, "creationDateForPasskey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCreationDateForPasskey:", v9);

  objc_msgSend(v25, "lastModifiedDateForPasskey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastModifiedDateForPasskey:", v10);

  objc_msgSend(v25, "lastUsedDateForPasskey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastUsedDateForPasskey:", v11);

  if (objc_msgSend(v5, "hasPasswordSidecars"))
  {
    objc_msgSend(v5, "allPasswordSidecars");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v25, "passkeyUserHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUser:", v15);

    objc_msgSend(v5, "_addPasskeySidecar:", v14);
    v16 = (void *)MEMORY[0x1E0C92C70];
    objc_msgSend(v25, "passkeyRelyingPartyID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C92C60];
    objc_msgSend(v25, "passkeyUserHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safari_credentialWithUser:password:persistence:", v20, &stru_1E64A2498, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isSavedInPersonalKeychain"))
    {
      objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v13, v21, v18, &stru_1E64A2498, objc_msgSend(v5, "isRecentlyDeleted"));

    }
    if (objc_msgSend(v5, "isSavedInSharedGroup"))
    {
      objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sharedGroupID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v13, v21, v18, v24, objc_msgSend(v5, "isRecentlyDeleted"));

    }
  }

}

- (id)_saveUser:(id)a3 passkeyCredential:(id)a4 passkeyRelyingPartyID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v8, "first");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
      goto LABEL_8;
    objc_msgSend(v8, "second");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "length"))
    {
      v16 = 0;
      goto LABEL_10;
    }
    v12 = objc_msgSend(v9, "length");

    if (v12)
    {
      objc_msgSend((id)objc_opt_class(), "importPasskeyCredential:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
        objc_msgSend(v8, "first");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSSavedAccountStore passkeyDataForPasskeyCredentialID:](WBSSavedAccountStore, "passkeyDataForPasskeyCredentialID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("UserHandle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[WBSSavedAccount _initWithPasskeyRelyingPartyID:user:passkeyUserHandle:passkeyCredentialID:]([WBSSavedAccount alloc], "_initWithPasskeyRelyingPartyID:user:passkeyUserHandle:passkeyCredentialID:", v9, v7, v15, v10);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCreationDateForPasskey:", v17);
        objc_msgSend(v16, "setLastModifiedDateForPasskey:", v17);

LABEL_10:
        goto LABEL_11;
      }
LABEL_8:
      v16 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (void)setSavedAccountAsDefault:(id)a3 forProtectionSpace:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[WBSSavedAccountContext defaultContext](WBSSavedAccountContext, "defaultContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore setSavedAccountAsDefault:forProtectionSpace:context:](self, "setSavedAccountAsDefault:forProtectionSpace:context:", v7, v6, v8);

}

- (void)setSavedAccountAsDefault:(id)a3 forProtectionSpace:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  char v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  char v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "protectionSpaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
    goto LABEL_11;
  v13 = objc_msgSend(v8, "hasProtectionSpace:", v9);
  v14 = objc_msgSend(v8, "hasProtectionSpaceWithHighLevelDomainMatchingProtectionSpace:", v9);
  if ((v13 & 1) == 0 && v14)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      objc_msgSend(v8, "user");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "host");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138740227;
      v45 = v17;
      v46 = 2117;
      v47 = v18;
      _os_log_impl(&dword_1B2621000, v16, OS_LOG_TYPE_INFO, "While setting the account for '%{sensitive}@' as default for host '%{sensitive}@', adding high-level domain to the account's sites list", (uint8_t *)&v44, 0x16u);

    }
    objc_msgSend(v8, "user");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "password");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safari_highLevelDomainFromHost");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharedGroupID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore saveUser:password:forProtectionSpace:highLevelDomain:groupID:](self, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v19, v20, v9, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    if ((id)v24 != v8)
    {
      v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[WBSSavedAccountStore setSavedAccountAsDefault:forProtectionSpace:context:].cold.3(v25, v9, v8);
    }

    v8 = (id)v24;
    goto LABEL_11;
  }
  if ((v13 & 1) != 0)
  {
LABEL_11:
    objc_msgSend(v9, "authenticationMethod");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0C92B40]);

    if ((v27 & 1) != 0)
    {
      if (-[WBSSavedAccountStore _shouldUpdateLastUsedDateForSavedAccount:forProtectionSpace:inContext:](self, "_shouldUpdateLastUsedDateForSavedAccount:forProtectionSpace:inContext:", v8, v9, v10))
      {
        v28 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          objc_msgSend(v8, "user");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "host");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138740227;
          v45 = v30;
          v46 = 2117;
          v47 = v31;
          _os_log_impl(&dword_1B2621000, v29, OS_LOG_TYPE_DEFAULT, "Setting last used date on account for user '%{sensitive}@' and host '%{sensitive}@'", (uint8_t *)&v44, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLastUsedDate:forContext:", v32, v10);

      }
      if (objc_msgSend(v8, "isSavedInPersonalKeychain"))
      {
        v33 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v33;
          objc_msgSend(v8, "user");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "host");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138740227;
          v45 = v35;
          v46 = 2117;
          v47 = v36;
          _os_log_impl(&dword_1B2621000, v34, OS_LOG_TYPE_DEFAULT, "Setting account for user '%{sensitive}@' as default for host '%{sensitive}@'", (uint8_t *)&v44, 0x16u);

        }
        v37 = objc_alloc(MEMORY[0x1E0C92C60]);
        objc_msgSend(v8, "user");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "password");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v37, "initWithUser:password:persistence:", v38, v39, 3);

        objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "safari_setDefaultCredential:forHTMLFormProtectionSpace:", v40, v9);

      }
    }
    else
    {
      v42 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[WBSSavedAccountStore setSavedAccountAsDefault:forProtectionSpace:context:].cold.1(v42, v8);
    }
    goto LABEL_24;
  }
  v43 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    -[WBSSavedAccountStore setSavedAccountAsDefault:forProtectionSpace:context:].cold.2(v43, v8);
LABEL_24:

}

- (void)updateAllSavedAccountsWithPasswordsWithUser:(id)a3 protectionSpace:(id)a4 withNewPassword:(id)a5
{
  id v7;
  id v8;
  id v9;
  WBSSavedAccountMatchCriteria *v10;
  void *v11;
  WBSSavedAccountMatchCriteria *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = [WBSSavedAccountMatchCriteria alloc];
  objc_msgSend(v8, "safari_URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WBSSavedAccountMatchCriteria initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:](v10, "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v11, 16, v7, 0, 0);

  +[WBSSavedAccountStore sharedStore](WBSSavedAccountStore, "sharedStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__WBSSavedAccountStore_updateAllSavedAccountsWithPasswordsWithUser_protectionSpace_withNewPassword___block_invoke;
  v17[3] = &unk_1E649FBE0;
  v18 = v7;
  v19 = v9;
  v20 = v8;
  v14 = v8;
  v15 = v9;
  v16 = v7;
  objc_msgSend(v13, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v12, v17);

}

void __100__WBSSavedAccountStore_updateAllSavedAccountsWithPasswordsWithUser_protectionSpace_withNewPassword___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a2, "exactMatches");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v16 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v16)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        +[WBSSavedAccountStore sharedStore](WBSSavedAccountStore, "sharedStore");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = a1[4];
        v9 = a1[5];
        v10 = (void *)a1[6];
        objc_msgSend(v10, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "savedAccount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sharedGroupID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v7, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v8, v9, v10, v11, v13);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

- (BOOL)_shouldUpdateLastUsedDateForSavedAccount:(id)a3 forProtectionSpace:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "safari_URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSSavedAccountMatchCriteria criteriaForExactFQDNPasswordMatchesOfURL:](WBSSavedAccountMatchCriteria, "criteriaForExactFQDNPasswordMatchesOfURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 0x20);
  objc_msgSend(v12, "setContext:", v10);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__WBSSavedAccountStore__shouldUpdateLastUsedDateForSavedAccount_forProtectionSpace_inContext___block_invoke;
  v15[3] = &unk_1E649FC08;
  v17 = &v18;
  v13 = v8;
  v16 = v13;
  -[WBSSavedAccountStore getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:](self, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v12, v15);
  LOBYTE(self) = *((_BYTE *)v19 + 24) == 0;

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

void __94__WBSSavedAccountStore__shouldUpdateLastUsedDateForSavedAccount_forProtectionSpace_inContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "matchesForPasswordAutoFill");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "savedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

}

- (id)savedAccountForUserTypedSite:(id)a3 userName:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  id v20;
  void *v21;
  id obj;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a4;
  -[WBSSavedAccountStore savedAccounts](self, "savedAccounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = 0;
  v23 = v7;
  LODWORD(self) = objc_msgSend((id)objc_opt_class(), "getProtectionSpaceAndHighLevelDomainForUserTypedSite:protectionSpace:highLevelDomain:", v7, &v30, &v29);
  v9 = v30;
  v10 = v29;
  v11 = 0;
  if ((_DWORD)self)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v8;
    v11 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v11)
    {
      v20 = v10;
      v21 = v8;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "protectionSpaces");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsObject:", v9);
          if ((v16 & 1) != 0
            || (objc_msgSend(v14, "passkeyRelyingPartyID"),
                v4 = (void *)objc_claimAutoreleasedReturnValue(),
                (objc_msgSend(v23, "isEqualToString:", v4) & 1) != 0))
          {
            objc_msgSend(v14, "user");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", v24);

            if ((v16 & 1) == 0)
            if ((v18 & 1) != 0)
            {
              v11 = v14;
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
        v11 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v11);
LABEL_16:
      v10 = v20;
      v8 = v21;
    }

  }
  return v11;
}

uint64_t __69__WBSSavedAccountStore__performRecentlyDeletedMaintenanceIfNecessary__block_invoke_232(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

- (void)_migratePasswordsWithInvalidAuthenticationTypes
{
  int *p_isMigratingKeychainItemsWithInvalidAuthenticationTypes;
  void *v5;
  _QWORD v6[5];

  p_isMigratingKeychainItemsWithInvalidAuthenticationTypes = &self->_isMigratingKeychainItemsWithInvalidAuthenticationTypes;
  while (!__ldaxr((unsigned int *)p_isMigratingKeychainItemsWithInvalidAuthenticationTypes))
  {
    if (!__stlxr(1u, (unsigned int *)p_isMigratingKeychainItemsWithInvalidAuthenticationTypes))
    {
      objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __71__WBSSavedAccountStore__migratePasswordsWithInvalidAuthenticationTypes__block_invoke;
      v6[3] = &unk_1E649B768;
      v6[4] = self;
      objc_msgSend(v5, "safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler:", v6);

      return;
    }
  }
  __clrex();
}

void __71__WBSSavedAccountStore__migratePasswordsWithInvalidAuthenticationTypes__block_invoke(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  _QWORD block[5];

  v2 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 232);
  while (1)
  {
    v3 = __ldaxr(v2);
    if (v3 != 1)
      break;
    if (!__stlxr(0, v2))
      goto LABEL_6;
  }
  __clrex();
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "reset");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WBSSavedAccountStore__migratePasswordsWithInvalidAuthenticationTypes__block_invoke_2;
  block[3] = &unk_1E649B768;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __71__WBSSavedAccountStore__migratePasswordsWithInvalidAuthenticationTypes__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

- (BOOL)_isMigratingKeychainItemsWithInvalidAuthenticationTypes
{
  int *p_isMigratingKeychainItemsWithInvalidAuthenticationTypes;
  unsigned int v3;
  BOOL result;

  p_isMigratingKeychainItemsWithInvalidAuthenticationTypes = &self->_isMigratingKeychainItemsWithInvalidAuthenticationTypes;
  while (1)
  {
    v3 = __ldaxr((unsigned int *)p_isMigratingKeychainItemsWithInvalidAuthenticationTypes);
    if (v3 != 1)
      break;
    result = 1;
    if (!__stlxr(1u, (unsigned int *)p_isMigratingKeychainItemsWithInvalidAuthenticationTypes))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

- (BOOL)_moveSavedAccount:(id)a3 toGroupWithID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  WBSSavedAccountStore *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke;
  v12[3] = &unk_1E649FC30;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, v12);
  LOBYTE(v6) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v6;
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(_QWORD);
  void *v28;
  int v29;
  dispatch_time_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  _QWORD v34[4];
  void (**v35)(_QWORD);
  _QWORD aBlock[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;

  v2 = (id *)(a1 + 32);
  if (!objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v6 = 0;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 48), "sharedGroupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v8)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_1();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    else
    {
      if (objc_msgSend(*v2, "length"))
      {
        +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentUserParticipantID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_4((uint64_t)v2, v12, v13, v14, v15, v16, v17, v18);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        }
      }
      objc_msgSend(*(id *)(a1 + 48), "sharedGroupID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(*(id *)(a1 + 48), "credentialTypes");
      v21 = *(void **)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      if (v20 == 4)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v21, "_moveSignInWithAppleSavedAccount:toGroupID:", v22, *(_QWORD *)(a1 + 32));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
          && objc_msgSend(*(id *)(a1 + 40), "_copySavedAccount:toGroup:", *(_QWORD *)(a1 + 48), v6))
        {
          objc_msgSend(*(id *)(a1 + 40), "_removeSavedAccount:fromGroupID:", *(_QWORD *)(a1 + 48), v19);
        }
        else
        {
          v32 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_2((uint64_t)v19, v32, v6);
        }
      }
      else if ((objc_msgSend(v21, "_copySavedAccount:toGroup:", v22, v6) & 1) != 0)
      {
        if (!objc_msgSend(v19, "length"))
        {
          objc_msgSend(v6, "groupID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "length");

          if (v25)
          {
            objc_msgSend(*(id *)(a1 + 48), "_removeSharableDataFromPersonalPasswordSidecars");
            objc_msgSend(*(id *)(a1 + 48), "_removeSharableDataFromPersonalPasskeySidecars");
            objc_msgSend(*(id *)(a1 + 48), "_updatePasswordSidecarsIfNecessaryWithBlock:", 0);
            objc_msgSend(*(id *)(a1 + 48), "_updatePasskeySidecarsIfNecessaryWithBlock:", 0);
          }
        }
        objc_msgSend(*(id *)(a1 + 40), "_removeSavedAccount:fromGroupID:", *(_QWORD *)(a1 + 48), v19);
        if (objc_msgSend(*(id *)(a1 + 32), "length"))
        {
          v26 = MEMORY[0x1E0C809B0];
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_233;
          aBlock[3] = &unk_1E649B6D8;
          v37 = *(id *)(a1 + 48);
          v38 = *(id *)(a1 + 32);
          v27 = (void (**)(_QWORD))_Block_copy(aBlock);
          objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "BOOLForKey:", CFSTR("useOriginalContributorWorkaround"));

          if (v29)
          {
            v30 = dispatch_time(0, 1000000000);
            v31 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
            v34[0] = v26;
            v34[1] = 3221225472;
            v34[2] = __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_236;
            v34[3] = &unk_1E649CC10;
            v35 = v27;
            dispatch_after(v30, v31, v34);

          }
          else
          {
            v27[2](v27);
          }

        }
      }
      else
      {
        v33 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_2((uint64_t)v19, v33, v6);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }

    }
    goto LABEL_36;
  }
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 136);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_2;
  v39[3] = &unk_1E649D508;
  v40 = v3;
  objc_msgSend(v4, "safari_firstObjectPassingTest:", v39);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)v5;

    goto LABEL_5;
  }
  v23 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_5();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v6 = v40;
LABEL_36:

}

uint64_t __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_233(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "markOriginalContributorParticipantID") & 1) == 0)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_233_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_236(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_copySavedAccount:(id)a3 toGroup:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  char v18;
  void *v19;
  NSMutableDictionary *groupIdentifiersToSavedAccounts;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSArray *v26;
  NSArray *savedAccountsInPersonalKeychain;
  NSObject *v28;
  BOOL v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "credentialTypes");
  objc_msgSend(v7, "groupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
      v12 = objc_msgSend(v10, "safari_copySavedAccountWithPassword:toGroupWithID:", v6, v9);
    else
      v12 = objc_msgSend(v10, "safari_copySavedAccountWithPasswordToPersonalKeychain:", v6);
    v13 = v12;

    if ((v13 & 1) == 0)
    {
      v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[WBSSavedAccountStore _copySavedAccount:toGroup:].cold.2();
      goto LABEL_21;
    }
    -[WBSSavedAccountStore _addSavedAccount:toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:](self, "_addSavedAccount:toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:", v6, v9);
  }
  if ((v8 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v7)
      v16 = objc_msgSend(v14, "safari_copySavedAccountWithPasskey:toGroupWithID:", v6, v9);
    else
      v16 = objc_msgSend(v14, "safari_copySavedAccountWithPasskeyToPersonalKeychain:", v6);
    v18 = v16;

    if ((v18 & 1) != 0)
    {
      -[WBSSavedAccountStore _addSavedAccount:toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:](self, "_addSavedAccount:toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:", v6, v9);
      goto LABEL_15;
    }
    v28 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccountStore _copySavedAccount:toGroup:].cold.1();
LABEL_21:
    v29 = 0;
    goto LABEL_25;
  }
LABEL_15:
  objc_msgSend(v7, "groupID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSharedGroupID:", v19);

  if (v7)
  {
    groupIdentifiersToSavedAccounts = self->_groupIdentifiersToSavedAccounts;
    objc_msgSend(v7, "groupID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](groupIdentifiersToSavedAccounts, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v25;

    objc_msgSend(v30, "addObject:", v6);
    objc_msgSend(v30, "sortUsingSelector:", sel_compare_);
    v31 = self->_groupIdentifiersToSavedAccounts;
    objc_msgSend(v7, "groupID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v30, v32);

  }
  else
  {
    v26 = (NSArray *)-[NSArray mutableCopy](self->_savedAccountsInPersonalKeychain, "mutableCopy");
    -[NSArray addObject:](v26, "addObject:", v6);
    -[NSArray sortUsingSelector:](v26, "sortUsingSelector:", sel_compare_);
    savedAccountsInPersonalKeychain = self->_savedAccountsInPersonalKeychain;
    self->_savedAccountsInPersonalKeychain = v26;

  }
  v29 = 1;
LABEL_25:

  return v29;
}

- (void)_removeSavedAccount:(id)a3 fromGroupID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *v12;
  NSArray *savedAccountsInPersonalKeychain;
  id v14;

  v14 = a3;
  v6 = a4;
  if ((objc_msgSend(v14, "credentialTypes") & 1) != 0)
  {
    objc_msgSend(v14, "_deletePasswordCredentialsForGroupID:", v6);
    -[WBSSavedAccountStore _removeSavedAccount:fromCachedDictionaryForSavedAccountsWithPasswordsForGroupID:](self, "_removeSavedAccount:fromCachedDictionaryForSavedAccountsWithPasswordsForGroupID:", v14, v6);
  }
  if ((objc_msgSend(v14, "credentialTypes") & 2) != 0)
  {
    objc_msgSend(v14, "_deletePasskeyCredentialForGroupID:", v6);
    -[WBSSavedAccountStore _removeSavedAccount:fromCachedDictionaryForSavedAccountsWithPasskeysForGroupID:](self, "_removeSavedAccount:fromCachedDictionaryForSavedAccountsWithPasskeysForGroupID:", v14, v6);
  }
  if (objc_msgSend(v6, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToSavedAccounts, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    objc_msgSend(v11, "removeObject:", v14);
    savedAccountsInPersonalKeychain = (NSArray *)objc_msgSend(v11, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdentifiersToSavedAccounts, "setObject:forKeyedSubscript:", savedAccountsInPersonalKeychain, v6);
  }
  else
  {
    v11 = (void *)-[NSArray mutableCopy](self->_savedAccountsInPersonalKeychain, "mutableCopy");
    objc_msgSend(v11, "removeObject:", v14);
    v12 = (NSArray *)objc_msgSend(v11, "copy");
    savedAccountsInPersonalKeychain = self->_savedAccountsInPersonalKeychain;
    self->_savedAccountsInPersonalKeychain = v12;
  }

}

- (BOOL)_canMoveSavedAccount:(id)a3 toGroupWithID:(id)a4
{
  id v6;
  id v7;
  NSArray *sharedAccountsGroups;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id obj;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isCurrentUserOriginalContributor")
    && objc_msgSend(v6, "canUserEditSavedAccount"))
  {
    if (objc_msgSend(v7, "length"))
    {
      sharedAccountsGroups = self->_sharedAccountsGroups;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__WBSSavedAccountStore__canMoveSavedAccount_toGroupWithID___block_invoke;
      v34[3] = &unk_1E649D508;
      v35 = v7;
      -[NSArray safari_firstObjectPassingTest:](sharedAccountsGroups, "safari_firstObjectPassingTest:", v34);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "participants");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safari_firstObjectPassingTest:", &__block_literal_global_238);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12 || objc_msgSend(v12, "permissionLevel"))
        {

LABEL_10:
          objc_msgSend(v6, "sharedGroupID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = WBSIsEqual(v14, v7);

          if ((v15 & 1) == 0)
          {
            if ((objc_msgSend(v6, "credentialTypes") & 1) != 0)
            {
              objc_msgSend(v6, "user");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "password");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "highLevelDomain");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "notesEntry");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "customTitle");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = 0u;
              v31 = 0u;
              v32 = 0u;
              v33 = 0u;
              objc_msgSend(v6, "protectionSpaces");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v31;
                while (2)
                {
                  for (i = 0; i != v18; ++i)
                  {
                    if (*(_QWORD *)v31 != v19)
                      objc_enumerationMutation(obj);
                    v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
                    v22 = v10;
                    objc_msgSend(v10, "groupID");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v21) = -[WBSSavedAccountStore canSaveUser:password:forProtectionSpace:highLevelDomain:notes:customTitle:groupID:error:](self, "canSaveUser:password:forProtectionSpace:highLevelDomain:notes:customTitle:groupID:error:", v29, v28, v21, v27, v26, v16, v23, 0);

                    if (!(_DWORD)v21)
                    {

                      v13 = 0;
                      v10 = v22;
                      goto LABEL_28;
                    }
                    v10 = v22;
                  }
                  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

            }
            if ((objc_msgSend(v6, "credentialTypes") & 2) == 0
              || -[WBSSavedAccountStore _canMoveSavedAccountWithPasskey:toGroup:](self, "_canMoveSavedAccountWithPasskey:toGroup:", v6, v10))
            {
              v13 = 1;
LABEL_28:

              goto LABEL_29;
            }
          }
LABEL_27:
          v13 = 0;
          goto LABEL_28;
        }

      }
      goto LABEL_27;
    }
    v10 = 0;
    goto LABEL_10;
  }
  v13 = 0;
LABEL_29:

  return v13;
}

uint64_t __59__WBSSavedAccountStore__canMoveSavedAccount_toGroupWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __59__WBSSavedAccountStore__canMoveSavedAccount_toGroupWithID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentUser");
}

- (BOOL)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:(id)a3 isForAlreadyExitedGroup:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  OS_dispatch_queue *queue;
  id v9;
  NSObject *v10;
  char v11;
  _QWORD v13[5];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a4;
  v6 = a3;
  if (v4)
    -[WBSSavedAccountStore _recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:](self, "_recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:", v6);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __130__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID_isForAlreadyExitedGroup___block_invoke;
  v13[3] = &unk_1E649FC78;
  v16 = &v18;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v17 = v4;
  v10 = v7;
  v15 = v10;
  -[WBSSavedAccountStore performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:task:](self, "performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:task:", queue, v13);
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __130__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID_isForAlreadyExitedGroup___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:isForAlreadyExitedGroup:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (BOOL)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:(id)a3 isForAlreadyExitedGroup:(BOOL)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t i;
  id v21;
  void *v22;
  NSMutableDictionary *recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  char v30;
  id v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  WBSPublicKeyCredentialIdentifier *v36;
  void *v37;
  void *v38;
  WBSPublicKeyCredentialIdentifier *v39;
  void *v40;
  void *v41;
  void *v42;
  WBSPair *v43;
  void *v44;
  WBSPair *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  char v63;
  id v64;
  void *v65;
  char v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  const char *v70;
  NSObject *v71;
  uint64_t v72;
  NSObject *v73;
  id v75;
  _BOOL4 v76;
  id obj;
  char v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  WBSSavedAccountStore *v84;
  _QWORD block[5];
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[4];
  uint64_t v92;
  _BYTE v93[128];
  id v94;
  uint8_t buf[4];
  id v96;
  uint64_t v97;

  v76 = a4;
  v97 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v96 = v75;
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Beginning sweep to move contributed credentials back to personal keychain from groupID: %{private}@", buf, 0xCu);
  }
  self->_shouldIgnoreKeychainUpdates = 1;
  if (v76)
  {
    -[WBSSavedAccountStore _loadAndMergeSavedAccountsFromGroupID:intoAllSavedAccounts:](self, "_loadAndMergeSavedAccountsFromGroupID:intoAllSavedAccounts:", v75, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_239);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore _loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:](self, "_loadRecentlyDeletedSavedAccountsFromSharedGroupIDs:", v8);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, "objectForKeyedSubscript:", v75);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_filterObjectsUsingBlock:", &__block_literal_global_239);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    v12 = v10;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToSavedAccounts, "objectForKeyedSubscript:", v75);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_239);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, "objectForKeyedSubscript:", v75);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_filterObjectsUsingBlock:", &__block_literal_global_239);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v7;
  }
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v13;
  v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
  if (!v82)
  {
    LOBYTE(v83) = 1;
    goto LABEL_89;
  }
  v83 = 1;
  v81 = *(_QWORD *)v88;
  v84 = self;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v88 != v81)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v14);
      v16 = objc_msgSend(v15, "credentialTypes");
      if ((v16 & 1) == 0)
      {
        v17 = 0;
        if ((v16 & 2) != 0)
          goto LABEL_44;
LABEL_71:
        if (!v76)
          -[WBSSavedAccountStore _removeSavedAccount:fromGroupID:](self, "_removeSavedAccount:fromGroupID:", v15, v75);
        goto LABEL_82;
      }
      v78 = v16;
      v79 = v14;
      objc_msgSend(v15, "user");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v19 = 0;
      for (i = 0; i != 10; ++i)
      {
        if (i)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%ld)"), v18, i);
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = v18;
        }
        v22 = v21;
        if (objc_msgSend(v15, "isRecentlyDeleted"))
          recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
        else
          recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
        objc_msgSend(v15, "highLevelDomain");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allValues");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke_2;
        v86[3] = &unk_1E649F4C8;
        v86[4] = v15;
        objc_msgSend(v27, "safari_firstObjectPassingTest:", v86);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B2621000, v29, OS_LOG_TYPE_DEFAULT, "Skipping moving saved account from group to personal keychain because there is already an identical copy in personal keychain.", buf, 2u);
          }
          v30 = 1;
          objc_msgSend(v28, "_writeFormerlySharedSavedAccountMarkerForCredentialTypes:", 1);
          v19 = 1;
        }
        else if (objc_msgSend(v27, "count"))
        {
          v30 = 0;
        }
        else
        {
          if (i)
          {
            v31 = v22;

            v17 = v31;
          }
          objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "safari_copySavedAccountWithPasswordToPersonalKeychain:withNewUsername:", v15, v17);

          if (v33)
          {
            self = v84;
            -[WBSSavedAccountStore _addSavedAccount:toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:](v84, "_addSavedAccount:toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:", v15, &stru_1E64A2498);
            v30 = 1;
            v19 = 1;
            goto LABEL_35;
          }
          v34 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v96 = v75;
            _os_log_error_impl(&dword_1B2621000, v34, OS_LOG_TYPE_ERROR, "Failed to copy saved account with password back to personal keychain on exit from group %{private}@.", buf, 0xCu);
          }
          v30 = 0;
          v19 = 0;
          v83 = 0;
        }
        self = v84;
LABEL_35:

        if ((v30 & 1) != 0)
        {
          if ((v19 & 1) != 0)
            goto LABEL_41;
LABEL_53:

          v83 = 0;
          v14 = v79;
          goto LABEL_82;
        }
      }
      if ((v19 & 1) == 0)
      {
        v53 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          -[WBSSavedAccountStore _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:isForAlreadyExitedGroup:].cold.1(v91, &v92, v53);
        goto LABEL_53;
      }
LABEL_41:

      v14 = v79;
      if ((v78 & 2) == 0)
        goto LABEL_71;
      if (v17)
      {
        v35 = (void *)objc_opt_class();
        v36 = [WBSPublicKeyCredentialIdentifier alloc];
        objc_msgSend(v15, "passkeyCredentialID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sharedGroupID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[WBSPublicKeyCredentialIdentifier initWithCredentialID:groupID:](v36, "initWithCredentialID:groupID:", v37, v38);
        objc_msgSend(v35, "updateUserVisibleName:forPasskeyWithIdentifier:", v17, v39);

      }
LABEL_44:
      v40 = (void *)MEMORY[0x1E0C92C70];
      objc_msgSend(v15, "passkeyRelyingPartyID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = [WBSPair alloc];
      objc_msgSend(v15, "passkeyUserHandle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[WBSPair initWithFirst:second:](v43, "initWithFirst:second:", v44, v42);

      v46 = objc_msgSend(v15, "isRecentlyDeleted");
      v47 = 16;
      if (v46)
        v47 = 48;
      objc_msgSend(*(id *)((char *)&self->super.isa + v47), "objectForKeyedSubscript:", v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        if (objc_msgSend(v49, "isEqualForMovingSharedSavedAccountsBackToPersonalKeychainOnGroupExit:", v15))
        {
          v50 = v14;
          v51 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B2621000, v51, OS_LOG_TYPE_DEFAULT, "Skipping moving saved account from group to personal keychain because there is already an identical copy in personal keychain.", buf, 2u);
          }
          objc_msgSend(v49, "_writeFormerlySharedSavedAccountMarkerForCredentialTypes:", 2);
          -[WBSSavedAccountStore _removeSavedAccount:fromGroupID:](self, "_removeSavedAccount:fromGroupID:", v15, v75);
          v52 = v83;
          goto LABEL_81;
        }
        if (objc_msgSend(v15, "isRecentlyDeleted"))
        {
          v50 = v14;
          -[WBSSavedAccountStore _removeSavedAccount:fromGroupID:](self, "_removeSavedAccount:fromGroupID:", v49, &stru_1E64A2498);
          objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "safari_copySavedAccountWithPasskeyToPersonalKeychain:", v15);

          v52 = v55 & v83;
          if (v55 && !v76)
          {
            v52 = v83;
            -[WBSSavedAccountStore _removeSavedAccount:fromGroupID:](self, "_removeSavedAccount:fromGroupID:", v15, v75);
          }
          goto LABEL_81;
        }
        objc_msgSend(v15, "lastModifiedDate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "lastModifiedDate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "earlierDate:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v56;
        LODWORD(v56) = objc_msgSend(v58, "isEqual:", v56);

        v59 = WBS_LOG_CHANNEL_PREFIXPasswords();
        v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v56)
        {
          if (v60)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B2621000, v59, OS_LOG_TYPE_DEFAULT, "Moving shared passkey into Recently Deleted for personal keychain because there is already a more recently modified conflicting passkey in personal keychain.", buf, 2u);
          }
          -[WBSSavedAccountStore _moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:](self, "_moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:", 2, v15);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "safari_copySavedAccountWithPasskeyToPersonalKeychain:", v61);

            v50 = v14;
            if ((v63 & 1) != 0)
            {
              if (!v76)
                -[WBSSavedAccountStore _removeSavedAccount:fromGroupID:](self, "_removeSavedAccount:fromGroupID:", v61, v75);
              v52 = v83;
              goto LABEL_80;
            }
            v71 = WBS_LOG_CHANNEL_PREFIXPasswords();
            if (!os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
LABEL_79:
              v52 = 0;
LABEL_80:

              goto LABEL_81;
            }
            *(_DWORD *)buf = 138477827;
            v96 = v75;
            v69 = v71;
            v70 = "Failed to copy saved account with passkey back to personal keychain on exit from group %{private}@.";
          }
          else
          {
            v50 = v14;
            v68 = WBS_LOG_CHANNEL_PREFIXPasswords();
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              goto LABEL_79;
            *(_DWORD *)buf = 138477827;
            v96 = v75;
            v69 = v68;
            v70 = "Failed to move saved account with passkey back to personal keychain on exit from group %{private}@.";
          }
          _os_log_error_impl(&dword_1B2621000, v69, OS_LOG_TYPE_ERROR, v70, buf, 0xCu);
          goto LABEL_79;
        }
        if (v60)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B2621000, v59, OS_LOG_TYPE_DEFAULT, "Moving passkey already in personal keychain into Recently Deleted because there is a more recently modified conflicting passkey being moved to the personal keychain from a group.", buf, 2u);
        }
        v64 = -[WBSSavedAccountStore _moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:](self, "_moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:", 2, v49);

      }
      objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "safari_copySavedAccountWithPasskeyToPersonalKeychain:", v15);

      if ((v66 & 1) != 0)
      {
        -[WBSSavedAccountStore _addSavedAccount:toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:](self, "_addSavedAccount:toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:", v15, &stru_1E64A2498);

        goto LABEL_71;
      }
      v50 = v14;
      v67 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v96 = v75;
        _os_log_error_impl(&dword_1B2621000, v67, OS_LOG_TYPE_ERROR, "Failed to copy saved account with passkey back to personal keychain on exit from group %{private}@.", buf, 0xCu);
      }
      v52 = 0;
LABEL_81:

      v83 = v52;
      v14 = v50;
LABEL_82:

      ++v14;
    }
    while (v14 != v82);
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    v82 = v72;
  }
  while (v72);
LABEL_89:

  self->_shouldIgnoreKeychainUpdates = 0;
  if (objc_msgSend(obj, "count"))
  {
    -[WBSSavedAccountStore reset](self, "reset");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke_242;
    block[3] = &unk_1E649B768;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (v76)
  {
    -[WBSSavedAccountStore _recordGroupIdentifierForExitCleanup:completionHandler:](self, "_recordGroupIdentifierForExitCleanup:completionHandler:", v75, &__block_literal_global_244);
    -[WBSSavedAccountStore _removeGroupID:fromArrayForUserDefaultsKey:](self, "_removeGroupID:fromArrayForUserDefaultsKey:", v75, CFSTR("groupIdentifiersToMoveContributedCredentialsBackToPersonalKeychainFrom"));
  }
  v73 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v96 = v75;
    _os_log_impl(&dword_1B2621000, v73, OS_LOG_TYPE_DEFAULT, "Ended sweep to move contributed credentials back to personal keychain from groupID: %{private}@", buf, 0xCu);
  }

  return v83 & 1;
}

uint64_t __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentUserOriginalContributor");
}

uint64_t __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualForMovingSharedSavedAccountsBackToPersonalKeychainOnGroupExit:", *(_QWORD *)(a1 + 32));
}

uint64_t __145__WBSSavedAccountStore__moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue_isForAlreadyExitedGroup___block_invoke_242(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

- (void)_addGroupID:(id)a3 toArrayForUserDefaultsKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138478083;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_DEFAULT, "Logging groupID %{private}@ in user defaults list %@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v10, v6);

}

- (void)_removeGroupID:(id)a3 fromArrayForUserDefaultsKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_DEFAULT, "Removing groupID %@ from user defaults list %@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    objc_msgSend(v10, "removeObject:", v5);
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v10, v6);

  }
}

- (void)_addSavedAccount:(id)a3 toCachedDictionaryForSavedAccountsWithPasswordsForGroupID:(id)a4
{
  id v6;
  NSMutableDictionary *groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
    if (!groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
      self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = v8;

      groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "setObject:forKeyedSubscript:", v11, v6);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v6);
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    if (!personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v15 = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
      self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = v14;

      personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    }
    v12 = personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  }
  v16 = v12;
  objc_msgSend(v34, "highLevelDomain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "highLevelDomain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v19, v20);

  }
  objc_msgSend(v34, "highLevelDomain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "user");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "highLevelDomain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "user");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, v28);

  }
  objc_msgSend(v34, "highLevelDomain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "user");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "password");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, v33);

}

- (void)_removeSavedAccount:(id)a3 fromCachedDictionaryForSavedAccountsWithPasswordsForGroupID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
  void *v13;
  id v14;

  v14 = a4;
  v6 = a3;
  if (objc_msgSend(v14, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "highLevelDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts = self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts;
    objc_msgSend(v6, "highLevelDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v6, "password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeObjectForKey:", v13);
}

- (void)_addSavedAccount:(id)a3 toCachedDictionaryForSavedAccountsWithPasskeysForGroupID:(id)a4
{
  id v6;
  NSMutableDictionary *groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  WBSPair *v20;
  void *v21;
  WBSPair *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    if (!groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
      self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = v8;

      groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, "setObject:forKeyedSubscript:", v11, v6);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, "objectForKeyedSubscript:", v6);
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    if (!personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v15 = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
      self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = v14;

      personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
    }
    v12 = personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  }
  v16 = v12;
  v17 = (void *)MEMORY[0x1E0C92C70];
  objc_msgSend(v24, "passkeyRelyingPartyID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [WBSPair alloc];
  objc_msgSend(v24, "passkeyUserHandle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[WBSPair initWithFirst:second:](v20, "initWithFirst:second:", v21, v19);

  -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v23, v22);
  }
  objc_msgSend(v23, "addObject:", v24);

}

- (void)_removeSavedAccount:(id)a3 fromCachedDictionaryForSavedAccountsWithPasskeysForGroupID:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  WBSPair *v10;
  void *v11;
  WBSPair *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a4;
  v6 = (void *)MEMORY[0x1E0C92C70];
  v7 = a3;
  objc_msgSend(v7, "passkeyRelyingPartyID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [WBSPair alloc];
  objc_msgSend(v7, "passkeyUserHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[WBSPair initWithFirst:second:](v10, "initWithFirst:second:", v11, v9);
  if (objc_msgSend(v15, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, "objectForKeyedSubscript:", v15);
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys;
  }
  v14 = v13;
  -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v12);

}

- (id)_allInternetPasswordEntriesFromGroupID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C92C68];
  v4 = a3;
  objc_msgSend(v3, "sharedCredentialStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_allPasswordCredentialItemsFromGroupID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_addNewGroupToCachedSharingGroups:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WBSSavedAccountStore__addNewGroupToCachedSharingGroups___block_invoke;
  block[3] = &unk_1E649B6D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __58__WBSSavedAccountStore__addNewGroupToCachedSharingGroups___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  objc_msgSend(v2, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 136);
  *(_QWORD *)(v7 + 136) = v6;

  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v9 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    v9 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v9 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 32);
    *(_QWORD *)(v14 + 32) = v13;

  }
  objc_msgSend(*(id *)(a1 + 40), "groupID");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setObject:forKeyedSubscript:", v16, v19);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v17, v19);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v18, v19);

}

- (void)_clearExpiredRecentlyDeletedNotificationDates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("lastRecentlyDeletedNotificationDateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -30, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "earlierDate:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v14);

          if (v16)
            objc_msgSend(v4, "removeObjectForKey:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
}

- (NSArray)sharedSavedAccountsInRecentlyDeletedToNotifyUserAbout
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  WBSSavedAccountStore *v31;
  char v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DebugIgnoreLastNotificationDateAndFiveDayGracePeriodForRecentlyDeletedNotifications"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("DebugIgnoreLastNotificationDateAndFiveDayGracePeriodForRecentlyDeletedNotifications"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v31 = self;
  -[WBSSavedAccountStore allRecentlyDeletedSavedAccounts](self, "allRecentlyDeletedSavedAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    v35 = v4;
    v34 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isSavedInPersonalKeychain") & 1) == 0)
        {
          if (objc_msgSend(v11, "isCurrentUserOriginalContributor"))
          {
            objc_msgSend(v11, "participantIDThatMovedSavedAccountToRecentlyDeleted");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "originalContributorParticipantID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqual:", v13);

            if ((v14 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "lastModifiedDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "dateByAddingUnit:value:toDate:options:", 16, 30, v17, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v15, "safari_numberOfDaysUntilDate:", v18) & 0x8000000000000000) == 0)
              {
                if (v4)
                {
                  objc_msgSend(v36, "addObject:", v11);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "dateByAddingUnit:value:toDate:options:", 16, -5, v15, 0);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v11, "lastModifiedDate");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "earlierDate:", v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqual:", v20);

                  if ((v23 & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "dateByAddingUnit:value:toDate:options:", 16, -7, v15, 0);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v11, "lastRecentlyDeletedNotificationDate");
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (!v26)
                      goto LABEL_17;
                    v27 = (void *)v26;
                    objc_msgSend(v11, "lastRecentlyDeletedNotificationDate");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "earlierDate:", v25);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = objc_msgSend(v28, "isEqual:", v25);

                    if ((v32 & 1) == 0)
                    {
LABEL_17:
                      objc_msgSend(v36, "addObject:", v11);
                      objc_msgSend(v11, "setLastRecentlyDeletedNotificationDate:", v15);
                    }

                  }
                  v4 = v35;
                  v6 = v34;
                }
              }

            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v8);
  }

  -[WBSSavedAccountStore _clearExpiredRecentlyDeletedNotificationDates](v31, "_clearExpiredRecentlyDeletedNotificationDates");
  v29 = (void *)objc_msgSend(v36, "copy");

  return (NSArray *)v29;
}

- (void)_recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[WBSSavedAccountStore _addGroupID:toArrayForUserDefaultsKey:](self, "_addGroupID:toArrayForUserDefaultsKey:", v4, CFSTR("groupIdentifiersToMoveContributedCredentialsBackToPersonalKeychainFrom"));
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccountStore _recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:].cold.1();
  }

}

- (void)_recordGroupIdentifierForExitCleanup:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!objc_msgSend(v6, "length"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSavedAccountStore _recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:].cold.1();
      if (!v7)
        goto LABEL_6;
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.CredentialSharingGroupsErrorDomain"), 1, CFSTR("Failed find group with given group ID."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

    goto LABEL_6;
  }
  -[WBSSavedAccountStore _addGroupID:toArrayForUserDefaultsKey:](self, "_addGroupID:toArrayForUserDefaultsKey:", v6, CFSTR("groupIdentifiersToDeleteAllItemsFrom"));
  -[WBSSavedAccountStore _performCleanupForExitedGroupsIfNecessary:](self, "_performCleanupForExitedGroupsIfNecessary:", v7);
LABEL_6:

}

- (BOOL)_hasPersonWithParticipantID:(id)a3 contributedSavedAccountsToGroupWithID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  -[WBSSavedAccountStore savedAccountsForGroupID:](self, "savedAccountsForGroupID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__WBSSavedAccountStore__hasPersonWithParticipantID_contributedSavedAccountsToGroupWithID___block_invoke;
  v10[3] = &unk_1E649F4C8;
  v11 = v6;
  v8 = v6;
  LOBYTE(v6) = objc_msgSend(v7, "safari_containsObjectPassingTest:", v10);

  return (char)v6;
}

uint64_t __90__WBSSavedAccountStore__hasPersonWithParticipantID_contributedSavedAccountsToGroupWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "originalContributorParticipantID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __86__WBSSavedAccountStore__moveContributedSavedAccountsBackToPersonalKeychainIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v13;
    *(_QWORD *)&v4 = 138412290;
    v10 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:isForAlreadyExitedGroup:", v8, 1, v10) & 1) == 0)
        {
          v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v10;
            v17 = v8;
            _os_log_error_impl(&dword_1B2621000, v9, OS_LOG_TYPE_ERROR, "Failed to move contributed credentials back to personal keychain from group ID: %@", buf, 0xCu);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "_removeGroupID:fromArrayForUserDefaultsKey:", v8, CFSTR("groupIdentifiersToMoveContributedCredentialsBackToPersonalKeychainFrom"));
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  objc_msgSend(*(id *)(a1 + 32), "reset");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__WBSSavedAccountStore__moveContributedSavedAccountsBackToPersonalKeychainIfNecessary__block_invoke_247;
  block[3] = &unk_1E649B768;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __86__WBSSavedAccountStore__moveContributedSavedAccountsBackToPersonalKeychainIfNecessary__block_invoke_247(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

void __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  _QWORD block[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_250);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v11)
    {
      v12 = v11;
      v26 = a1;
      v25 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v33 = v16;
            _os_log_impl(&dword_1B2621000, v17, OS_LOG_TYPE_DEFAULT, "Deleting all items for exited groupID: %{private}@", buf, 0xCu);
          }
          if (objc_msgSend(v9, "containsObject:", v16))
          {
            v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v33 = v16;
              _os_log_error_impl(&dword_1B2621000, v18, OS_LOG_TYPE_ERROR, "Skipping clean up for group that user still has access to: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "safari_deleteAllItemsForGroupID:", v16);

            if (v20)
            {
              objc_msgSend(*(id *)(v26 + 32), "_removeGroupID:fromArrayForUserDefaultsKey:", v16, CFSTR("groupIdentifiersToDeleteAllItemsFrom"));
              v21 = WBS_LOG_CHANNEL_PREFIXPasswords();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                v33 = v16;
                _os_log_impl(&dword_1B2621000, v21, OS_LOG_TYPE_DEFAULT, "Successfully deleted all items for exited groupID: %{private}@", buf, 0xCu);
              }
              v13 = 1;
            }
            else
            {
              v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v33 = v16;
                _os_log_error_impl(&dword_1B2621000, v22, OS_LOG_TYPE_ERROR, "Failed to delete all items from group with identifier: %{public}@", buf, 0xCu);
              }
              v25 = 1;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v12);

      a1 = v26;
      *(_BYTE *)(*(_QWORD *)(v26 + 32) + 216) = 0;
      if ((v13 & 1) != 0)
      {
        objc_msgSend(*(id *)(v26 + 32), "reset");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_251;
        block[3] = &unk_1E649B768;
        block[4] = *(_QWORD *)(v26 + 32);
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      v3 = 0;
      if ((v25 & 1) != 0)
      {
        v23 = *(_QWORD *)(v26 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("com.apple.AuthenticationServices.CredentialSharingGroupsErrorDomain"), 3, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_30;
  }
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_31:

}

uint64_t __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_248(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupID");
}

uint64_t __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_251(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

- (void)performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WBSSavedAccountStore_performTaskEnsuringAllAccountSourcesAreLoadedOnQueue_task___block_invoke;
  block[3] = &unk_1E649B990;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __82__WBSSavedAccountStore_performTaskEnsuringAllAccountSourcesAreLoadedOnQueue_task___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 136) && *(_QWORD *)(v2 + 64))
  {
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
  }
  else
  {
    +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(v4 + 112);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__WBSSavedAccountStore_performTaskEnsuringAllAccountSourcesAreLoadedOnQueue_task___block_invoke_2;
    v7[3] = &unk_1E649FD48;
    v7[4] = v4;
    v8 = v5;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v3, "performTaskEnsuringGroupsAreLoadedOnQueue:task:", v6, v7);

  }
}

void __82__WBSSavedAccountStore_performTaskEnsuringAllAccountSourcesAreLoadedOnQueue_task___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateCachedSharedAccountGroupsOnInternalQueue");
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_savedAccounts");
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
}

- (void)setDontSaveMarkerForSavedAccountsWithProtectionSpace:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSSavedAccountStore_setDontSaveMarkerForSavedAccountsWithProtectionSpace___block_invoke;
  block[3] = &unk_1E649B768;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

void __77__WBSSavedAccountStore_setDontSaveMarkerForSavedAccountsWithProtectionSpace___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0C92C60]);
  +[WBSDontSaveMarker dontSaveMarker](WBSDontSaveMarker, "dontSaveMarker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "initWithUser:password:persistence:", v3, CFSTR(" "), 3);

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_setDefaultCredential:forHTMLFormProtectionSpace:", v5, *(_QWORD *)(a1 + 32));

}

- (void)removeDontSaveMarkerForProtectionSpace:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSSavedAccountStore_removeDontSaveMarkerForProtectionSpace___block_invoke;
  block[3] = &unk_1E649B768;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

void __63__WBSSavedAccountStore_removeDontSaveMarkerForProtectionSpace___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialsForProtectionSpace:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "copy");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__WBSSavedAccountStore_removeDontSaveMarkerForProtectionSpace___block_invoke_2;
  v6[3] = &unk_1E649FD70;
  v7 = v2;
  v8 = *(id *)(a1 + 32);
  v4 = v2;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __63__WBSSavedAccountStore_removeDontSaveMarkerForProtectionSpace___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSDontSaveMarker dontSaveMarker](WBSDontSaveMarker, "dontSaveMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11 = *MEMORY[0x1E0C92B78];
    v12[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeCredential:forProtectionSpace:options:", v4, v8, v10);

  }
}

- (void)_updateLastOneTimeShareDateforSavedAccountIfNeeded:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__WBSSavedAccountStore__updateLastOneTimeShareDateforSavedAccountIfNeeded___block_invoke;
  block[3] = &unk_1E649B6D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __75__WBSSavedAccountStore__updateLastOneTimeShareDateforSavedAccountIfNeeded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveSidecarOnInternalQueueForSavedAccountWithPasskey:withBlock:", *(_QWORD *)(a1 + 40), &__block_literal_global_256);
}

void __75__WBSSavedAccountStore__updateLastOneTimeShareDateforSavedAccountIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  if (!a2)
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    v4 = a3;
    objc_msgSend(v3, "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastOneTimeShareDateForPasskey:", v5);

  }
}

- (id)_moveCredentialTypesToRecentlyDeleted:(int64_t)a3 fromSavedAccount:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__WBSSavedAccountStore__moveCredentialTypesToRecentlyDeleted_fromSavedAccount___block_invoke;
  v11[3] = &unk_1E649FDB8;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __79__WBSSavedAccountStore__moveCredentialTypesToRecentlyDeleted_fromSavedAccount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_moveCredentialTypesToRecentlyDeletedOnInternalQueue:(int64_t)a3 fromSavedAccount:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  dispatch_time_t v19;
  NSObject *queue;
  _QWORD block[4];
  id v23;

  v6 = a4;
  -[WBSSavedAccountStore _ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount:](self, "_ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount:", v6);
  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safari_moveCredentialTypesToRecentlyDeleted:onSavedAccount:", a3, v6);

  if ((v8 & 1) != 0)
  {
    if (objc_msgSend(v6, "credentialTypes") == a3)
      a3 = 3;
    objc_msgSend(v6, "setLastRecentlyDeletedNotificationDate:", 0);
    v9 = v6;
    v10 = v9;
    v11 = a3 - 1;
    v12 = 0;
    switch(v11)
    {
      case 0:
        objc_msgSend(v9, "_movePasswordCredentialToNewSavedAccount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setIsRecentlyDeleted:", 1);
        objc_msgSend(v13, "totpGenerators");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
          objc_msgSend(v10, "setTOTPGenerator:", 0);
        goto LABEL_11;
      case 1:
        objc_msgSend(v9, "_movePasskeyCredentialToNewSavedAccount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setIsRecentlyDeleted:", 1);
LABEL_11:
        -[WBSSavedAccountStore _addSavedAccountToRecentlyDeletedCachedCollections:](self, "_addSavedAccountToRecentlyDeletedCachedCollections:", v13);

        goto LABEL_14;
      case 2:
        objc_msgSend(v9, "setIsRecentlyDeleted:", 1);
        -[WBSSavedAccountStore _removeSavedAccount:fromCachedCollectionsForCredentialTypes:](self, "_removeSavedAccount:fromCachedCollectionsForCredentialTypes:", v10, 3);
        -[WBSSavedAccountStore _addSavedAccountToRecentlyDeletedCachedCollections:](self, "_addSavedAccountToRecentlyDeletedCachedCollections:", v10);
        goto LABEL_13;
      case 3:
        goto LABEL_19;
      default:
LABEL_13:
        v13 = v10;
LABEL_14:
        if (objc_msgSend(v13, "isSavedInSharedGroup"))
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("useOriginalContributorWorkaround"));

          if (v18)
          {
            v19 = dispatch_time(0, 1000000000);
            queue = self->_queue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __94__WBSSavedAccountStore__moveCredentialTypesToRecentlyDeletedOnInternalQueue_fromSavedAccount___block_invoke;
            block[3] = &unk_1E649B768;
            v23 = v13;
            dispatch_after(v19, queue, block);

          }
          else
          {
            objc_msgSend(v13, "markParticipantIDThatMovedSavedAccountToRecentlyDeleted");
          }
        }
        v10 = v13;
        v12 = v10;
LABEL_19:

        break;
    }
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccountStore _moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:].cold.1();
    v12 = 0;
  }

  return v12;
}

uint64_t __94__WBSSavedAccountStore__moveCredentialTypesToRecentlyDeletedOnInternalQueue_fromSavedAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "markParticipantIDThatMovedSavedAccountToRecentlyDeleted");
}

- (void)_ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableDictionary *sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  NSMutableArray *recentlyDeletedSavedAccountsInPersonalKeychain;
  id v14;
  _QWORD v15[4];
  void *v16;
  _QWORD v17[4];
  void *v18;
  _QWORD aBlock[4];
  id v20;
  WBSSavedAccountStore *v21;

  v4 = a3;
  -[WBSSavedAccountStore _ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue](self, "_ensureRecentlyDeletedSavedAccountsAreLoadedOnInternalQueue");
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke;
  aBlock[3] = &unk_1E649FDE0;
  v6 = v4;
  v20 = v6;
  v21 = self;
  v7 = _Block_copy(aBlock);
  if (objc_msgSend(v6, "isSavedInSharedGroup"))
  {
    sharedGroupIdentifiersToRecentlyDeletedSavedAccounts = self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts;
    objc_msgSend(v6, "sharedGroupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke_258;
    v17[3] = &unk_1E649FE08;
    v11 = &v18;
    v18 = v7;
    v12 = v7;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);

  }
  else
  {
    recentlyDeletedSavedAccountsInPersonalKeychain = self->_recentlyDeletedSavedAccountsInPersonalKeychain;
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke_2;
    v15[3] = &unk_1E649FE08;
    v11 = &v16;
    v16 = v7;
    v14 = v7;
    -[NSMutableArray enumerateObjectsUsingBlock:](recentlyDeletedSavedAccountsInPersonalKeychain, "enumerateObjectsUsingBlock:", v15);
  }

}

void __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldOverrideRecentlyDeletedSavedAccountWhenDeleted:", v3))
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      objc_msgSend(v3, "user");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "highLevelDomain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 141558787;
      v9 = 1752392040;
      v10 = 2117;
      v11 = v6;
      v12 = 2160;
      v13 = 1752392040;
      v14 = 2117;
      v15 = v7;
      _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Deleting account for %{sensitive, mask.hash}@ on %{sensitive, mask.hash}@ from recently deleted to make room for another account", (uint8_t *)&v8, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "_removeCredentialTypes:forSavedAccount:", 3, v3);
  }

}

uint64_t __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke_258(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__WBSSavedAccountStore__ensureNoRecentlyDeletedSavedAccountsConflictWithSavedAccount___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_recoverRecentlyDeletedSavedAccount:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *queue;
  id v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  WBSSavedAccountStore *v18;

  v4 = a3;
  if ((objc_msgSend(v4, "isRecentlyDeleted") & 1) == 0)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccountStore _recoverRecentlyDeletedSavedAccount:].cold.2();
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_recoverSavedAccountFromRecentlyDeleted:", v4);

  if ((v6 & 1) == 0)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccountStore _recoverRecentlyDeletedSavedAccount:].cold.1();
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  queue = self->_queue;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __60__WBSSavedAccountStore__recoverRecentlyDeletedSavedAccount___block_invoke;
  v16 = &unk_1E649B6D8;
  v8 = v4;
  v17 = v8;
  v18 = self;
  dispatch_sync(queue, &v13);
  if (objc_msgSend(v8, "isSavedInSharedGroup", v13, v14, v15, v16))
    objc_msgSend(v8, "clearParticipantIDThatMovedSavedAccountToRecentlyDeleted");

  v9 = 1;
LABEL_11:

  return v9;
}

uint64_t __60__WBSSavedAccountStore__recoverRecentlyDeletedSavedAccount___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsRecentlyDeleted:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_removeSavedAccountFromRecentlyDeletedCachedCollections:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "setLastRecentlyDeletedNotificationDate:", 0);
}

- (void)savedAccountsMatchingCriteria:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138739971;
    v16 = v6;
    _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_DEFAULT, "Enqueueing asynchronous query for saved accounts matching criteria %{sensitive}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WBSSavedAccountStore_savedAccountsMatchingCriteria_withCompletionHandler___block_invoke;
  block[3] = &unk_1E649D228;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

}

void __76__WBSSavedAccountStore_savedAccountsMatchingCriteria_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_getSavedAccountsMatchingCriteriaOnInternalQueue:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_getSavedAccountsMatchingCriteriaOnInternalQueue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Beginning query for saved accounts matching criteria", buf, 2u);
  }
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[WBSSavedAccountContext defaultContext](WBSSavedAccountContext, "defaultContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContext:", v7);

  }
  if (!self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts)
    v8 = -[WBSSavedAccountStore _loadSavedAccounts](self, "_loadSavedAccounts");
  -[WBSSavedAccountStore _fetchCurrentAutoFillPasskeysWithCriteria:](self, "_fetchCurrentAutoFillPasskeysWithCriteria:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "first");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "second");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passkeyCredentialIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue:credentialIdentifiersToAutoFillPasskeys:](self, "_relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue:credentialIdentifiersToAutoFillPasskeys:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSSavedAccountStore _getSavedAccountTreeMatchesWithCriteriaOnInternalQueue:relyingPartyURL:](self, "_getSavedAccountTreeMatchesWithCriteriaOnInternalQueue:relyingPartyURL:", v4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "requestUsedNonEmptyAllowList");

  objc_msgSend(v10, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccountStore _pruneSavedAccountTreeMatchesOnInternalQueue:basedOnUsernameAndPasswordCriteria:autoFillPasskeyIdentifiers:keepAllPasskeyMatches:](self, "_pruneSavedAccountTreeMatchesOnInternalQueue:basedOnUsernameAndPasswordCriteria:autoFillPasskeyIdentifiers:keepAllPasskeyMatches:", v14, v4, v18, v17);

  -[WBSSavedAccountStore _getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue:withCriteria:mergingAutoFillPasskeys:nearbyDeviceOptions:](self, "_getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue:withCriteria:mergingAutoFillPasskeys:nearbyDeviceOptions:", v14, v4, v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_1B2621000, v20, OS_LOG_TYPE_DEFAULT, "Finished query for saved accounts matching criteria", v22, 2u);
  }

  return v19;
}

- (void)getSavedAccountsMatchingCriteria:(id)a3 withSynchronousCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138739971;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_DEFAULT, "Enqueueing synchronous query for saved accounts matching criteria %{sensitive}@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__WBSSavedAccountStore_getSavedAccountsMatchingCriteria_withSynchronousCompletionHandler___block_invoke;
  block[3] = &unk_1E649B700;
  p_buf = &buf;
  block[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(queue, block);
  v7[2](v7, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
}

void __90__WBSSavedAccountStore_getSavedAccountsMatchingCriteria_withSynchronousCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getSavedAccountsMatchingCriteriaOnInternalQueue:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)getSavedAccountWithPasskeyCredentialForUserHandle:(id)a3 protectionSpace:(id)a4
{
  id v6;
  id v7;
  WBSPair *v8;
  NSObject *queue;
  WBSPair *v10;
  id v11;
  _QWORD block[5];
  WBSPair *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = -[WBSPair initWithFirst:second:]([WBSPair alloc], "initWithFirst:second:", v7, v6);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__WBSSavedAccountStore_getSavedAccountWithPasskeyCredentialForUserHandle_protectionSpace___block_invoke;
  block[3] = &unk_1E649D5A8;
  v14 = v8;
  v15 = &v16;
  block[4] = self;
  v10 = v8;
  dispatch_sync(queue, block);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __90__WBSSavedAccountStore_getSavedAccountWithPasskeyCredentialForUserHandle_protectionSpace___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDomainsToUsersExists");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue:(id)a3 credentialIdentifiersToAutoFillPasskeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSArray *passkeysDataInPersonalKeychain;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__15;
    v34 = __Block_byref_object_dispose__15;
    v35 = 0;
    passkeysDataInPersonalKeychain = self->_passkeysDataInPersonalKeychain;
    v10 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke;
    v28[3] = &unk_1E649FE30;
    v11 = v6;
    v29 = v11;
    -[NSArray safari_firstObjectPassingTest:](passkeysDataInPersonalKeychain, "safari_firstObjectPassingTest:", v28);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v31[5];
    v31[5] = v12;

    v14 = (void *)v31[5];
    if (v14)
      goto LABEL_4;
    -[NSDictionary allValues](self->_groupIdentifiersToPasskeysData, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke_2;
    v25[3] = &unk_1E649FE58;
    v27 = &v30;
    v26 = v11;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v25);

    v14 = (void *)v31[5];
    if (v14)
    {
LABEL_4:
      v16 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CredentialRelyingPartyID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }

    _Block_object_dispose(&v30, 8);
  }
  else if (objc_msgSend(v7, "count"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v20, "setScheme:", CFSTR("https"));
    objc_msgSend(v8, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "relyingPartyIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHost:", v23);

    objc_msgSend(v20, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CredentialID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToData:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke_3;
  v7[3] = &unk_1E649FE30;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(a2, "safari_firstObjectPassingTest:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __126__WBSSavedAccountStore__relyingPartyURLForPasskeyCredentialIdentifierOnInternalQueue_credentialIdentifiersToAutoFillPasskeys___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CredentialID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToData:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_getSavedAccountTreeMatchesWithCriteriaOnInternalQueue:(id)a3 relyingPartyURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  WBSSavedAccountTreeMatch *v14;
  void *v15;
  WBSSavedAccountTreeMatch *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  WBSSavedAccountTreeMatch *v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  os_log_t log;
  NSObject *loga;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_INFO, "Getting credential matches by looking through account store by high level domain.", buf, 2u);
  }
  objc_msgSend(v6, "URL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "safari_highLevelDomainForPasswordManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = -[WBSSavedAccountTreeMatch initWithDomain:savedAccountTree:matchLevel:]([WBSSavedAccountTreeMatch alloc], "initWithDomain:savedAccountTree:matchLevel:", v9, v13, 4);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v10);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts, "objectForKeyedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = -[WBSSavedAccountTreeMatch initWithDomain:savedAccountTree:matchLevel:]([WBSSavedAccountTreeMatch alloc], "initWithDomain:savedAccountTree:matchLevel:", v9, v15, 4);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v11);

  }
  objc_msgSend(v6, "associatedDomainsForURL");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v15;
  if (objc_msgSend(v6, "queryShouldReturnSavedAccountsMatchingAssociatedDomains"))
  {
    v39 = v13;
    v40 = v11;
    log = v10;
    v41 = v9;
    v42 = v7;
    v43 = v6;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v17 = v47;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v51 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v22, "safari_highLevelDomainForPasswordManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v26 = WBS_LOG_CHANNEL_PREFIXAutoFill();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138739971;
                v55 = (uint64_t)log;
                _os_log_debug_impl(&dword_1B2621000, v26, OS_LOG_TYPE_DEBUG, "Associated domain with same high level domain as query URL: %{sensitive}@", buf, 0xCu);
              }
            }
            else
            {
              v27 = -[WBSSavedAccountTreeMatch initWithDomain:savedAccountTree:matchLevel:]([WBSSavedAccountTreeMatch alloc], "initWithDomain:savedAccountTree:matchLevel:", v22, v24, 3);
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, v23);

            }
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      }
      while (v19);
    }

    v7 = v42;
    v6 = v43;
    v11 = v40;
    v9 = v41;
    v10 = log;
    v13 = v39;
    v15 = v44;
  }
  v28 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    loga = v28;
    v29 = v6;
    v30 = v7;
    v31 = v9;
    v32 = objc_msgSend(v12, "count");
    objc_msgSend(v47, "allObjects");
    v33 = v10;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsJoinedByString:", CFSTR(", "));
    v35 = v13;
    v36 = v11;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218499;
    v55 = v32;
    v9 = v31;
    v7 = v30;
    v6 = v29;
    v56 = 2117;
    v57 = v33;
    v58 = 2117;
    v59 = v37;
    _os_log_impl(&dword_1B2621000, loga, OS_LOG_TYPE_DEFAULT, "Found %lu tree matches for %{sensitive}@ and associated domains: %{sensitive}@", buf, 0x20u);

    v10 = v33;
    v11 = v36;
    v13 = v35;
    v15 = v44;
  }

  return v12;
}

- (id)_fetchCurrentAutoFillPasskeysWithCriteria:(id)a3
{
  id v4;
  NSObject *v5;
  WBSPair *v6;
  WBSPair *v7;
  void *v8;
  NSObject *v9;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  WBSPair *v15;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  uint8_t *v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  if (objc_msgSend(v4, "queryShouldOmitAutoFillPasskeyMatches"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Omitting AutoFill passkey matches as requested by match criteria.", buf, 2u);
    }
    v6 = [WBSPair alloc];
    v7 = -[WBSPair initWithFirst:second:](v6, "initWithFirst:second:", MEMORY[0x1E0C9AA70], 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__15;
    v25 = __Block_byref_object_dispose__15;
    v26 = 0;
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariApplicationPlatformBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__WBSSavedAccountStore__fetchCurrentAutoFillPasskeysWithCriteria___block_invoke;
    v17[3] = &unk_1E649FE80;
    v12 = v8;
    v18 = v12;
    v20 = buf;
    v13 = v9;
    v19 = v13;
    -[WBSAuthenticationServicesAgentProxy getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:](authenticationServicesAgentProxy, "getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:", v11, v17);

    v14 = dispatch_time(0, 3000000000);
    dispatch_group_wait(v13, v14);
    v15 = [WBSPair alloc];
    v7 = -[WBSPair initWithFirst:second:](v15, "initWithFirst:second:", v12, *((_QWORD *)v22 + 5));

    _Block_object_dispose(buf, 8);
  }

  return v7;
}

void __66__WBSSavedAccountStore__fetchCurrentAutoFillPasskeysWithCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v6;
  v16 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_pruneSavedAccountTreeMatchesOnInternalQueue:(id)a3 basedOnUsernameAndPasswordCriteria:(id)a4 autoFillPasskeyIdentifiers:(id)a5 keepAllPasskeyMatches:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  int v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v24 = a5;
  objc_msgSend(v10, "partialUsername");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "queryShouldReturnSavedAccountsWithEmptyUsernames");
  v13 = objc_msgSend(v10, "queryShouldIncludePasskeyMatchesForNonAutoFillContext");
  v22 = v10;
  v14 = objc_msgSend(v10, "queryShouldIncludeSavedAccountsWithDoNotSaveMarkers");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v23 = v9;
  objc_msgSend(v9, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    if (v6)
      v19 = v24;
    else
      v19 = (id)MEMORY[0x1E0C9AA60];
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v20);
        if ((v14 & 1) == 0)
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v20), "pruneDontSaveTrees");
        if (v12)
          objc_msgSend(v21, "pruneEmptyUsernameTrees");
        objc_msgSend(v21, "pruneUsernameTreesNotMatchingPartialUsername:orPasskeyIdentifiers:", v11, v19);
        if ((v13 & 1) == 0)
          objc_msgSend(v21, "pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers:", v24);
        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

}

- (id)_getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue:(id)a3 withCriteria:(id)a4 mergingAutoFillPasskeys:(id)a5 nearbyDeviceOptions:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  WBSSavedAccountMatch *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  WBSSavedAccountMatch *v30;
  void *v31;
  WBSSavedAccountMatch *v32;
  WBSSavedAccountMatch *v33;
  void *v34;
  int v35;
  uint64_t v36;
  WBSSavedAccountMatch *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t j;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  id v50;
  int v51;
  void *v53;
  WBSSavedAccountMatch *v54;
  WBSSavedAccountMatch *v55;
  void *v56;
  void *v57;
  void *v58;
  WBSSavedAccountMatch *v59;
  WBSSavedAccountMatch *v60;
  void *v61;
  void *v62;
  id v63;
  WBSSavedAccountMatch *v64;
  void *v65;
  uint64_t v66;
  char *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  char v82;
  id v83;
  WBSSavedAccountMatch *v84;
  void *v85;
  WBSSavedAccountMatch *v86;
  void *v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  NSObject *v94;
  int v95;
  NSObject *v96;
  NSObject *v97;
  int v98;
  NSObject *v99;
  NSObject *v100;
  int v101;
  NSObject *v102;
  NSObject *v103;
  int v104;
  NSObject *v105;
  NSObject *v106;
  int v107;
  void *v108;
  id v109;
  id v110;
  WBSSavedAccountMatchResult *v111;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  id obj;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  uint64_t v133;
  id v134;
  id v135;
  int v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  WBSSavedAccountMatch *v146;
  char *v147;
  void *v148;
  void *v149;
  _QWORD v150[4];
  id v151;
  id v152;
  id v153;
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint8_t buf[4];
  uint64_t v176;
  __int16 v177;
  void *v178;
  __int16 v179;
  uint64_t v180;
  __int16 v181;
  void *v182;
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  uint64_t v188;

  v188 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v114 = a6;
  v125 = objc_msgSend(v10, "queryShouldReturnSavedAccountsMatchingHighLevelAndSimplifiedDomains");
  objc_msgSend(v10, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safari_highLevelDomainForPasswordManager");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "port");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  v122 = v12;
  objc_msgSend(v12, "scheme");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passkeyCredentialIdentifier");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "base64EncodedStringWithOptions:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v11;
  objc_msgSend(v11, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_273);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v116 = v9;
  objc_msgSend(v9, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v187, 16);
  if (v119)
  {
    v118 = *(_QWORD *)v172;
    v131 = v10;
    v132 = v18;
    v127 = v17;
    do
    {
      for (i = 0; i != v119; ++i)
      {
        if (*(_QWORD *)v172 != v118)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * i);
        objc_msgSend(v20, "flattenedSavedAccountsFromTree");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "matchLevel") != 4)
        {
          if (objc_msgSend(v20, "matchLevel") != 3)
            goto LABEL_86;
          v120 = v21;
          v121 = i;
          v161 = 0u;
          v162 = 0u;
          v159 = 0u;
          v160 = 0u;
          v135 = v21;
          v143 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v159, v184, 16);
          if (!v143)
            goto LABEL_85;
          v137 = *(_QWORD *)v160;
          v141 = v20;
          while (1)
          {
            v67 = 0;
            do
            {
              if (*(_QWORD *)v160 != v137)
                objc_enumerationMutation(v135);
              v147 = v67;
              v68 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)v67);
              objc_msgSend(v20, "domain");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "protectionSpaces");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v145 = v68;
              objc_msgSend(v68, "protectionSpacesForAdditionalSites");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "arrayByAddingObjectsFromArray:", v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              v157 = 0u;
              v158 = 0u;
              v155 = 0u;
              v156 = 0u;
              v73 = v72;
              v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v155, v183, 16);
              if (!v74)
              {
LABEL_77:

                goto LABEL_79;
              }
              v75 = v74;
              v76 = *(_QWORD *)v156;
LABEL_69:
              v77 = 0;
              while (1)
              {
                if (*(_QWORD *)v156 != v76)
                  objc_enumerationMutation(v73);
                v78 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v77);
                objc_msgSend(v78, "host");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v78, "port") == v16)
                {
                  objc_msgSend(v78, "protocol");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v81 = objc_msgSend(v80, "isEqualToString:", v149);

                  v82 = objc_msgSend(v79, "isEqualToString:", v69);
                  if (v81)
                  {
                    if ((v82 & 1) != 0)
                      break;
                  }
                }

                if (v75 == ++v77)
                {
                  v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v155, v183, 16);
                  if (!v75)
                    goto LABEL_77;
                  goto LABEL_69;
                }
              }
              v83 = v78;

              if (!v83)
              {
LABEL_79:
                objc_msgSend(v73, "firstObject");
                v83 = (id)objc_claimAutoreleasedReturnValue();
              }
              v84 = [WBSSavedAccountMatch alloc];
              v10 = v131;
              objc_msgSend(v131, "context");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:](v84, "initWithSavedAccount:protectionSpace:context:matchLevel:", v145, v83, v85, 3);

              if (objc_msgSend(v145, "isDefaultCredentialForFullyQualifiedHostname:", v148))
                v87 = v132;
              else
                v87 = v129;
              objc_msgSend(v87, "addObject:", v86);

              v67 = v147 + 1;
              v20 = v141;
            }
            while (v147 + 1 != (char *)v143);
            v17 = v127;
            v18 = v132;
            v143 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v159, v184, 16);
            if (!v143)
              goto LABEL_85;
          }
        }
        v120 = v21;
        v121 = i;
        v169 = 0u;
        v170 = 0u;
        v167 = 0u;
        v168 = 0u;
        v130 = v21;
        v134 = (id)objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v167, v186, 16);
        if (!v134)
          goto LABEL_85;
        v133 = *(_QWORD *)v168;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v168 != v133)
              objc_enumerationMutation(v130);
            v23 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)v22);
            v136 = objc_msgSend(v23, "isDefaultCredentialForFullyQualifiedHostname:", v148);
            objc_msgSend(v23, "passkeyCredentialID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqualToString:", v17);

            if (v25)
            {
              v26 = [WBSSavedAccountMatch alloc];
              objc_msgSend(v10, "context");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = v23;
              v29 = (void *)v27;
              v30 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:](v26, "initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:", v28, 0, v27, 1, 0);
              objc_msgSend(v18, "addObject:", v30);
              goto LABEL_56;
            }
            objc_msgSend(v23, "passkeyCredentialID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "objectForKeyedSubscript:", v31);
            v30 = (WBSSavedAccountMatch *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              v32 = [WBSSavedAccountMatch alloc];
              objc_msgSend(v10, "context");
              v146 = (WBSSavedAccountMatch *)objc_claimAutoreleasedReturnValue();
              v33 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:](v32, "initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:", v23, 0);
              objc_msgSend(v18, "addObject:", v33);
              v29 = 0;
              goto LABEL_54;
            }
            if (objc_msgSend(v10, "queryShouldIncludePasskeyMatchesForNonAutoFillContext"))
            {
              if (objc_msgSend(v23, "credentialTypes") == 2)
              {
                objc_msgSend(v23, "passkeyRelyingPartyID");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "isEqualToString:", v148);

                if (v35)
                {
                  objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", v122);
                  v36 = objc_claimAutoreleasedReturnValue();
                  v37 = [WBSSavedAccountMatch alloc];
                  objc_msgSend(v10, "context");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v146 = (WBSSavedAccountMatch *)v36;
                  v33 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:](v37, "initWithSavedAccount:protectionSpace:context:matchLevel:", v23, v36, v38, 1);

                  objc_msgSend(v126, "addObject:", v33);
                  v29 = 0;
                  goto LABEL_46;
                }
              }
            }
            objc_msgSend(v23, "protectionSpaces");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "protectionSpacesForAdditionalSites");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            v165 = 0u;
            v166 = 0u;
            v163 = 0u;
            v164 = 0u;
            v146 = v41;
            v142 = -[WBSSavedAccountMatch countByEnumeratingWithState:objects:count:](v146, "countByEnumeratingWithState:objects:count:", &v163, v185, 16);
            if (!v142)
            {
              v144 = 0;
              goto LABEL_44;
            }
            v144 = 0;
            v140 = *(_QWORD *)v164;
            while (2)
            {
              for (j = 0; j != v142; ++j)
              {
                if (*(_QWORD *)v164 != v140)
                  objc_enumerationMutation(v146);
                v43 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * j);
                objc_msgSend(v43, "host");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v43, "port") == v16
                  || !v16 && (objc_msgSend(v43, "safari_hasDefaultPortForProtocol") & 1) != 0)
                {
                  v45 = 1;
                }
                else
                {
                  v45 = v16 == objc_msgSend(v43, "safari_defaultPortForProtocol") && objc_msgSend(v43, "port") == 0;
                }
                objc_msgSend(v43, "protocol");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "isEqualToString:", v149);

                objc_msgSend(v44, "safari_highLevelDomainForPasswordManager");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "isEqualToString:", v139);

                if (v49)
                {
                  v50 = v43;

                  v144 = v50;
                }
                v51 = objc_msgSend(v44, "isEqualToString:", v148);
                if ((v47 & v45) == 1 && v51 != 0)
                {
                  v58 = v126;
                  if (v136)
                    v58 = v132;
                  v59 = v58;
                  v60 = [WBSSavedAccountMatch alloc];
                  objc_msgSend(v131, "context");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:](v60, "initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:", v23, v43, v61, 1, 0);

                  -[WBSSavedAccountMatch addObject:](v59, "addObject:", v54);
LABEL_53:

                  v29 = v144;
                  v33 = v146;
                  v10 = v131;
                  v18 = v132;
                  v17 = v127;
                  v30 = 0;
                  goto LABEL_54;
                }
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@"), v44);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);
                v54 = (WBSSavedAccountMatch *)objc_claimAutoreleasedReturnValue();

                if (-[WBSSavedAccountMatch isEqualToString:](v54, "isEqualToString:", v138))
                {
                  v62 = v124;
                  if (v136)
                    v62 = v132;
                  v63 = v62;
                  v64 = [WBSSavedAccountMatch alloc];
                  objc_msgSend(v131, "context");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:](v64, "initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:", v23, v43, v65, 2, 0);

                  objc_msgSend(v63, "addObject:", v59);
                  goto LABEL_53;
                }

              }
              v10 = v131;
              v142 = -[WBSSavedAccountMatch countByEnumeratingWithState:objects:count:](v146, "countByEnumeratingWithState:objects:count:", &v163, v185, 16);
              if (v142)
                continue;
              break;
            }
LABEL_44:

            if (v125)
            {
              v55 = [WBSSavedAccountMatch alloc];
              objc_msgSend(v10, "context");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = v23;
              v29 = v144;
              v33 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:](v55, "initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:", v57, v144, v56, 4, 0);

              objc_msgSend(v123, "addObject:", v33);
              v17 = v127;
              v18 = v132;
LABEL_46:
              v30 = 0;
LABEL_54:

            }
            else
            {
              v17 = v127;
              v30 = 0;
              v18 = v132;
              v29 = v144;
            }

LABEL_56:
            v22 = (char *)v22 + 1;
          }
          while (v22 != v134);
          v66 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v167, v186, 16);
          v134 = (id)v66;
        }
        while (v66);
LABEL_85:
        v21 = v120;

        i = v121;
LABEL_86:

      }
      v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v187, 16);
    }
    while (v119);
  }

  v88 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
    v89 = v88;
    objc_msgSend(v122, "host");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "partialUsername");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558787;
    v176 = 1752392040;
    v177 = 2117;
    v178 = v90;
    v179 = 2160;
    v180 = 1752392040;
    v181 = 2117;
    v182 = v91;
    _os_log_impl(&dword_1B2621000, v89, OS_LOG_TYPE_DEFAULT, "Executed query for host '%{sensitive, mask.hash}@' with partial username '%{sensitive, mask.hash}@'", buf, 0x2Au);

  }
  v92 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  v93 = v126;
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    v94 = v92;
    v95 = objc_msgSend(v126, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v176) = v95;
    _os_log_impl(&dword_1B2621000, v94, OS_LOG_TYPE_DEFAULT, "%d exact domain matches", buf, 8u);

  }
  v96 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    v97 = v96;
    v98 = objc_msgSend(v123, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v176) = v98;
    _os_log_impl(&dword_1B2621000, v97, OS_LOG_TYPE_DEFAULT, "%d high-level domain matches", buf, 8u);

  }
  v99 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    v100 = v99;
    v101 = objc_msgSend(v124, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v176) = v101;
    _os_log_impl(&dword_1B2621000, v100, OS_LOG_TYPE_DEFAULT, "%d simplified domain matches", buf, 8u);

  }
  v102 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    v103 = v102;
    v104 = objc_msgSend(v129, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v176) = v104;
    _os_log_impl(&dword_1B2621000, v103, OS_LOG_TYPE_DEFAULT, "%d associated domain matches", buf, 8u);

  }
  v105 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    v106 = v105;
    v107 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v176) = v107;
    _os_log_impl(&dword_1B2621000, v106, OS_LOG_TYPE_DEFAULT, "%d default matches", buf, 8u);

  }
  if (objc_msgSend(v139, "isEqualToString:", CFSTR("apple.com")))
  {
    v150[0] = MEMORY[0x1E0C809B0];
    v150[1] = 3221225472;
    v150[2] = __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_277;
    v150[3] = &unk_1E649FF38;
    v151 = v126;
    v152 = v18;
    v153 = v123;
    v154 = v10;
    objc_msgSend(v128, "enumerateKeysAndObjectsUsingBlock:", v150);

  }
  if (objc_msgSend(v124, "count"))
  {
    if (objc_msgSend(v126, "count"))
    {
      if (!v125)
        goto LABEL_108;
      v108 = v123;
      objc_msgSend(v124, "addObjectsFromArray:", v123);
      v123 = v124;
    }
    else
    {
      v108 = v126;
      v93 = v124;
    }
    v109 = v124;

  }
LABEL_108:
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "addObjectsFromArray:", v93);
    v110 = v18;

    v93 = v110;
  }
  objc_msgSend(v93, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v123, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v129, "sortUsingSelector:", sel_compare_);
  v111 = -[WBSSavedAccountMatchResult initWithExactMatches:potentialMatches:associatedDomainMatches:nearbyDeviceOptions:]([WBSSavedAccountMatchResult alloc], "initWithExactMatches:potentialMatches:associatedDomainMatches:nearbyDeviceOptions:", v93, v123, v129, v114);

  return v111;
}

uint64_t __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "credentialID");
}

void __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_277(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, _QWORD);
  WBSSavedAccount *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  WBSSavedAccountMatch *v14;
  void *v15;
  WBSSavedAccountMatch *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a2;
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__15;
  v27 = __Block_byref_object_dispose__15;
  v28 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_2;
  v20 = &unk_1E649FF10;
  v7 = v6;
  v21 = v7;
  v22 = &v23;
  v8 = (void (**)(void *, _QWORD))_Block_copy(&v17);
  v8[2](v8, *(_QWORD *)(a1 + 32));
  v8[2](v8, *(_QWORD *)(a1 + 40));
  if (v24[5])
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v17, v18, v19, v20);
  v9 = [WBSSavedAccount alloc];
  objc_msgSend(v7, "relyingPartyIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WBSSavedAccount _initWithPasskeyRelyingPartyID:user:passkeyUserHandle:passkeyCredentialID:](v9, "_initWithPasskeyRelyingPartyID:user:passkeyUserHandle:passkeyCredentialID:", v10, v11, &stru_1E64A2498, v5);

  v13 = *(void **)(a1 + 40);
  v14 = [WBSSavedAccountMatch alloc];
  objc_msgSend(*(id *)(a1 + 56), "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WBSSavedAccountMatch initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:](v14, "initWithSavedAccount:protectionSpace:context:matchLevel:autoFillPasskey:", v12, 0, v15, 1, v7);
  objc_msgSend(v13, "addObject:", v16);

  _Block_object_dispose(&v23, 8);
}

void __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_3;
  v7[3] = &unk_1E649FEE8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v8 = v4;
  v6 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __147__WBSSavedAccountStore__getSavedAccountMatchesFromSavedAccountTreeMatchesOnInternalQueue_withCriteria_mergingAutoFillPasskeys_nearbyDeviceOptions___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "savedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", a3);
  }
}

- (void)_verifyGroupsInSync
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Not running group sync verification because it is not available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B2621000, v6, OS_LOG_TYPE_DEFAULT, "Received reply from group sync verification. Groups were in sync.", v8, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke_cold_2();
      if (!v4)
        goto LABEL_8;
    }
    else if (!v4)
    {
      goto LABEL_8;
    }
    v7 = WBS_LOG_CHANNEL_PREFIXMissingPasswordGroups();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke_cold_1(v7);
  }
LABEL_8:

}

- (id)duplicateAccountsWithGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSSavedAccountStore savedAccountsInPersonalKeychain](self, "savedAccountsInPersonalKeychain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  -[WBSSavedAccountStore savedAccountsForGroupID:](self, "savedAccountsForGroupID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = v6;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              if (objc_msgSend(v12, "isEqualForSuggestingDuplicatesCleanup:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17)))objc_msgSend(v7, "addObject:", v12);
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v15);
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  return v7;
}

- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isSafariFamilyBundleIdentifier:", a3))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_INFO, "Notifying that new passkeys are available.", v5, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("WBSSavedAccountStoreNewAutoFillablePasskeysAvailableNotification"), 0);

  }
}

- (id)persistentIdentifierForCredential:(id)a3 protectionSpace:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSSavedAccountStore _persistentIdentifierForUser:host:](self, "_persistentIdentifierForUser:host:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)persistentIdentifierForSavedAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "protectionSpaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSSavedAccountStore _persistentIdentifierForUser:host:](self, "_persistentIdentifierForUser:host:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_persistentIdentifierForUser:(id)a3 host:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  OSStatus v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  _QWORD v24[8];
  _QWORD v25[9];

  v25[8] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccountStore _persistentIdentifierForUser:host:].cold.2();
    goto LABEL_10;
  }
  v23 = 0;
  v8 = *MEMORY[0x1E0CD6CB8];
  v9 = *MEMORY[0x1E0CD6898];
  v24[0] = *MEMORY[0x1E0CD6C98];
  v24[1] = v9;
  v25[0] = v8;
  v25[1] = CFSTR("com.apple.cfnetwork");
  v10 = *MEMORY[0x1E0CD6B88];
  v11 = *MEMORY[0x1E0CD6910];
  v24[2] = *MEMORY[0x1E0CD6B80];
  v24[3] = v11;
  v12 = *MEMORY[0x1E0CD6920];
  v25[2] = v10;
  v25[3] = v12;
  v13 = *MEMORY[0x1E0CD6F38];
  v14 = *MEMORY[0x1E0CD7020];
  v24[4] = *MEMORY[0x1E0CD6F30];
  v24[5] = v14;
  v25[4] = v13;
  v25[5] = MEMORY[0x1E0C9AAB0];
  v15 = *MEMORY[0x1E0CD68F8];
  v24[6] = *MEMORY[0x1E0CD6B50];
  v24[7] = v15;
  v25[6] = v6;
  v25[7] = v5;
  v16 = SecItemCopyMatching((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8), (CFTypeRef *)&v23);
  if (v16 == -25300)
  {
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v17 = v16;
  if (v16)
  {
    v21 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[WBSSavedAccountStore _persistentIdentifierForUser:host:].cold.1(v17, v21);
    goto LABEL_10;
  }
  v18 = v23;
  objc_msgSend(v23, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v19;
}

+ (id)passkeysData
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    +[WBSSavedAccountStore passkeysData].cold.1();
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)recentlyDeletedPasskeysData
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    +[WBSSavedAccountStore passkeysData].cold.1();
  return (id)MEMORY[0x1E0C9AA60];
}

+ (void)deletePasskeyWithIdentifier:(id)a3
{
  NSObject *v3;

  v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    +[WBSSavedAccountStore deletePasskeyWithIdentifier:].cold.1();
}

+ (void)updateUserVisibleName:(id)a3 forPasskeyWithIdentifier:(id)a4
{
  NSObject *v4;

  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[WBSSavedAccountStore passkeysData].cold.1();
}

- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[WBSAuthenticationServicesAgentProxy test_createPasskeyWithUserName:displayName:relyingPartyIdentifier:userHandle:completionHandler:](self->_authenticationServicesAgentProxy, "test_createPasskeyWithUserName:displayName:relyingPartyIdentifier:userHandle:completionHandler:", v18, v12, v13, v14, v15);

}

- (void)test_setSharedAccountsGroups:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSSavedAccountStore_test_setSharedAccountsGroups___block_invoke;
  block[3] = &unk_1E649B6D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __53__WBSSavedAccountStore_test_setSharedAccountsGroups___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
}

- (void)test_reloadAllSavedAccounts
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WBSSavedAccountStore_test_reloadAllSavedAccounts__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __51__WBSSavedAccountStore_test_reloadAllSavedAccounts__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetOnInternalQueue");
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_savedAccounts");
  return objc_msgSend(*(id *)(a1 + 32), "_loadRecentlyDeletedSavedAccounts");
}

+ (BOOL)shouldShowServiceNamesForPasswordAndPasskeyItems
{
  void *v2;
  void *v3;
  char v4;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AuthenticationServicesAgent"));

  if ((v4 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safari_BOOLForKey:defaultValue:", CFSTR("ShowServiceNamesInPasswords"), 1);

  return v7;
}

+ (void)setShouldShowServiceNamesForPasswordAndPasskeyItems:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ShowServiceNamesInPasswords"));

}

- (WBSSavedAccountStoreWebsiteNameProvider)websiteNameProvider
{
  return 0;
}

- (void)setShouldShowServiceNamesForPasswordAndPasskeyItems:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__WBSSavedAccountStore_setShouldShowServiceNamesForPasswordAndPasskeyItems___block_invoke;
  v4[3] = &unk_1E649EA58;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

uint64_t __76__WBSSavedAccountStore_setShouldShowServiceNamesForPasswordAndPasskeyItems___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  result = *(_QWORD *)(a1 + 32);
  if (v2 != *(unsigned __int8 *)(result + 250))
  {
    objc_msgSend((id)objc_opt_class(), "setShouldShowServiceNamesForPasswordAndPasskeyItems:", v2 != 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 250) = *(_BYTE *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "websiteNameProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_BYTE *)(a1 + 40))
      v6 = *(_QWORD *)(a1 + 32);
    else
      v6 = 0;
    objc_msgSend(v4, "setWebsiteNameConsumer:", v6);

    result = objc_msgSend(*(id *)(a1 + 32), "_reapplyServiceNamesFromProvider");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsAboutWebsiteNamesChanges");
  }
  return result;
}

- (BOOL)_reapplyServiceNamesFromProvider
{
  BOOL v3;

  v3 = -[WBSSavedAccountStore _applyServiceNamesToSavedAccounts:](self, "_applyServiceNamesToSavedAccounts:", self->_savedAccounts);
  return v3 | -[WBSSavedAccountStore _applyServiceNamesToSavedAccounts:](self, "_applyServiceNamesToSavedAccounts:", self->_allRecentlyDeletedSavedAccounts);
}

- (BOOL)_applyServiceNamesToSavedAccounts:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  WBSSavedAccountStore *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  WBSSavedAccountStore *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = self;
  -[WBSSavedAccountStore websiteNameProvider](self, "websiteNameProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_23;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v27;
  v10 = v24;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
      if (objc_msgSend(v12, "hasValidWebsite"))
      {
        objc_msgSend(v12, "serviceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10->_shouldShowServiceNamesForPasswordAndPasskeyItems)
        {
          objc_msgSend(v12, "userVisibleDomain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "knownWebsiteNameForDomain:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length"))
          {
            if (!objc_msgSend(v12, "shouldShowSpecificSubdomainForUserVisibleDomain")
              || objc_msgSend(v14, "safari_isCaseInsensitiveEqualToString:", v15))
            {
              v16 = v12;
              v17 = v15;
              goto LABEL_14;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v15, v14);
            v20 = v5;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setServiceName:", v21);

            v5 = v20;
            v10 = v24;
          }
          else
          {
            v16 = v12;
            v17 = 0;
LABEL_14:
            objc_msgSend(v16, "setServiceName:", v17);
          }

        }
        else
        {
          objc_msgSend(v12, "setServiceName:", 0);
        }
        objc_msgSend(v12, "serviceName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = WBSIsEqual(v13, v18);

        v8 |= v19 ^ 1;
      }
      ++v11;
    }
    while (v7 != v11);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    v7 = v22;
  }
  while (v22);
LABEL_23:

  return v8 & 1;
}

- (void)knownWebsiteNamesDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSSavedAccountStore_knownWebsiteNamesDidChange__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

_BYTE *__50__WBSSavedAccountStore_knownWebsiteNamesDidChange__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[250])
  {
    result = (_BYTE *)objc_msgSend(result, "_reapplyServiceNamesFromProvider");
    if ((_DWORD)result)
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_notifyClientsAboutWebsiteNamesChanges");
  }
  return result;
}

- (void)knownWebsiteNamesDidChangeOnDomains:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSSavedAccountStore_knownWebsiteNamesDidChangeOnDomains___block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

_BYTE *__60__WBSSavedAccountStore_knownWebsiteNamesDidChangeOnDomains___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[250])
  {
    result = (_BYTE *)objc_msgSend(result, "_reapplyServiceNamesFromProvider");
    if ((_DWORD)result)
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_notifyClientsAboutWebsiteNamesChanges");
  }
  return result;
}

- (void)_notifyClientsAboutWebsiteNamesChanges
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSSavedAccountStore__notifyClientsAboutWebsiteNamesChanges__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __62__WBSSavedAccountStore__notifyClientsAboutWebsiteNamesChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSavedAccountStoreDidChangeNotification");
}

- (void)_updateShowServiceNamesInPasswordsPreference
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSSavedAccountStore__updateShowServiceNamesInPasswordsPreference__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __68__WBSSavedAccountStore__updateShowServiceNamesInPasswordsPreference__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowServiceNamesForPasswordAndPasskeyItems:", objc_msgSend((id)objc_opt_class(), "shouldShowServiceNamesForPasswordAndPasskeyItems"));
}

+ (BOOL)userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rangeOfCharacterFromSet:", v4);
  v6 = v5;

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v7 = objc_msgSend((id)objc_opt_class(), "getProtectionSpaceAndHighLevelDomainForUserTypedSite:protectionSpace:highLevelDomain:", v3, &v10, &v9);

  }
  return v7;
}

- (BOOL)hasPasswordsEligibleForAutoFill
{
  return self->_hasPasswordsEligibleForAutoFill;
}

- (BOOL)hasPasskeysEligibleForAutoFill
{
  return self->_hasPasskeysEligibleForAutoFill;
}

- (BOOL)shouldShowServiceNamesForPasswordAndPasskeyItems
{
  return self->_shouldShowServiceNamesForPasswordAndPasskeyItems;
}

- (BOOL)shouldWarmDataStoreAfterReset
{
  return self->_shouldWarmDataStoreAfterReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsStoreIsLimitedTo, 0);
  objc_storeStrong((id *)&self->_warmDataStoreAfterResetTimer, 0);
  objc_storeStrong((id *)&self->_stateCollector, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToRecentlyDeletedPasskeysData, 0);
  objc_storeStrong((id *)&self->_sharedGroupIdentifiersToRecentlyDeletedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedPasskeysDataInPersonalKeychain, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedSavedAccountsInPersonalKeychain, 0);
  objc_storeStrong((id *)&self->_allRecentlyDeletedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_allSavedAccountsHighLevelDomainToUsernameToCredentialTypesToSavedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccountsWithSignInWithAppleRecords, 0);
  objc_storeStrong((id *)&self->_sharedAccountsGroups, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToSavedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccountsInPersonalKeychain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_keychainNotificationRegistrationToken, 0);
  objc_storeStrong((id *)&self->_keychainMonitor, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToPasskeysData, 0);
  objc_storeStrong((id *)&self->_highLevelDomainToLegacyPlatformAuthenticatorCredentials, 0);
  objc_storeStrong((id *)&self->_passkeysDataInPersonalKeychain, 0);
  objc_storeStrong((id *)&self->_savedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccountsWithPasswords, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedPersonalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedPersonalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, 0);
  objc_storeStrong((id *)&self->_groupIdentifiersToHighLevelDomainToUsernameToPasswordToSavedAccounts, 0);
  objc_storeStrong((id *)&self->_personalKeychainUserHandleProtectionSpacePairsToSavedAccountsWithPasskeys, 0);
  objc_storeStrong((id *)&self->_personalKeychainHighLevelDomainToUsernameToPasswordToSavedAccounts, 0);
}

- (void)savedAccountsForGroupID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Queried account store for saved accounts from group but no dictionary exists for groupID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Found %lu keychain items with invalid authentication types", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_loadSavedAccountsWithPasswordsFromKeychainData:forGroupID:withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_0(&dword_1B2621000, v0, v1, "Unmatched sidecars: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_loadSavedAccountsWithPasswordsFromKeychainData:(uint64_t)a1 forGroupID:(void *)a2 withDictionaryForSavedAccountsWithPasswords:fromRecentlyDeleted:.cold.3(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = OUTLINED_FUNCTION_14(a1, a2);
  v5 = (void *)objc_opt_class();
  *v3 = 138412290;
  *v2 = v5;
  v6 = v5;
  OUTLINED_FUNCTION_12(&dword_1B2621000, v7, v8, "kSecAttrAccount value for keychain item was not of type string, got type: %@");

  OUTLINED_FUNCTION_18_0();
}

void __82__WBSSavedAccountStore__reportKeychainItemsWithInvalidAuthenticationTypesIfNeeded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "Found keychain items with invalid authentication types. See rdar://104050278 for more information.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __53__WBSSavedAccountStore__fetchSignInWithAppleAccounts__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Fetching Sign in with Apple accounts failed with error: '%{private}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_convertSignInWithAppleAccountsToSavedAccounts:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_14(a1, a2);
  objc_msgSend(v3, "clientID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138412290;
  *v2 = v6;
  OUTLINED_FUNCTION_12(&dword_1B2621000, v7, v8, "Error, Sign in with Apple account missing app name for clientID: %@, unable to convert to savedAccount");

  OUTLINED_FUNCTION_18_0();
}

void __91__WBSSavedAccountStore__shareSignInWithAppleAccountWithContext_withGroupInfo_savedAccount___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to share Sign in with Apple Account with error %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __66__WBSSavedAccountStore__unshareSignInWithAppleAccountWithContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to unshare Sign in with Apple Account with error %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_loadSavedAccountsWithPasskeysFromPasskeyData:(os_log_t)log forGroupID:fromRecentlyDeleted:withDictionaryForSavedAccountsWithPasskeys:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1B2621000, log, OS_LOG_TYPE_FAULT, "Found passkey with nil credentialID. Skipping.", buf, 2u);
}

void __54__WBSSavedAccountStore_changeSavedAccountWithRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Failed to create password to add to account with passkey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __112__WBSSavedAccountStore_canSaveUser_password_forProtectionSpace_highLevelDomain_notes_customTitle_groupID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Checked if able to save a password to an unknown group.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __64__WBSSavedAccountStore__canMoveSavedAccountWithPasskey_toGroup___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Checked if able to move a passkey to an unknown group.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to set original contributor participant ID on new saved account in groupID: '%{private}@'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Could not find a cached group for a newly saved account on groupID: '%{private}@'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_saveAccountOnInternalQueueWithUser:password:protectionSpace:highLevelDomain:groupID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to save account in groupID because current user participant ID is nil: '%{private}@'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_deleteSavedAccountsWithUnknownOriginalContributorParticipantIDsFromSavedAccounts:inGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Couldn't get current user participant ID, so skipping clean up for saved accounts with unknown contributor ID's.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __71__WBSSavedAccountStore__reportAccountsWithUnknownContributorIDIfNeeded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "Found shared saved accounts without original contributor participant ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __126__WBSSavedAccountStore__cleanUpSharedSavedAccountsWithUnknownOriginalContributorParticipantIDsIfNecessaryFromRecentlyDeleted___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v1, v3, "Aborting clean up for passwords with unmatchable contributor ID because of error fetching groups: %{private}@.", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_mergeSavedAccountWithPassword:(os_log_t)log toSavedAccountWithPasskey:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Received unexpected sidecar type when merging password to passkey", buf, 2u);
}

- (void)setSavedAccountAsDefault:(void *)a1 forProtectionSpace:(void *)a2 context:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "user");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_0(&dword_1B2621000, v5, v6, "Refusing to set account for '%{sensitive}@' as default for host '%{sensitive}@' because the host has an invalid authentication method", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)setSavedAccountAsDefault:(void *)a1 forProtectionSpace:(void *)a2 context:.cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "user");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_0(&dword_1B2621000, v5, v6, "Refusing to set account for '%{sensitive}@' as default for host '%{sensitive}@' because the host is not already registered for this account", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)setSavedAccountAsDefault:(void *)a1 forProtectionSpace:(void *)a2 context:(void *)a3 .cold.3(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "host");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "highLevelDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138740483;
  v9 = a2;
  v10 = 2117;
  v11 = v6;
  v12 = 2117;
  v13 = v7;
  _os_log_error_impl(&dword_1B2621000, v5, OS_LOG_TYPE_ERROR, "Adding '%{sensitive}@' to account for '%{sensitive}@' on '%{sensitive}@' resulted in a new saved account", (uint8_t *)&v8, 0x20u);

}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Tried to move an account to a group it's already in.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_0(&dword_1B2621000, v6, v7, "Failed to copy saved account from group %{private}@ to group %{private}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, a2, a3, "Failed to share save account to groupID because current user participant ID is nil: '%{private}@'.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1_1();
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Tried to move an account to a group that doesn't exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __56__WBSSavedAccountStore__moveSavedAccount_toGroupWithID___block_invoke_233_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, a2, a3, "Failed to set current user participant ID for saved account in group ID: '%{private}@'.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_copySavedAccount:toGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to copy saved account with passkey to group %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_copySavedAccount:toGroup:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to copy saved account with password to group %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupIDOnInternalQueue:(NSObject *)a3 isForAlreadyExitedGroup:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = 10;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, a3, (uint64_t)a3, "Failed to copy password back to personal keychain because there were %zu other passwords with the same username", a1);
}

- (void)_recordGroupIdentifierForMovingContributedCredentialsBackToPersonalKeychain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Invalid group ID passed into method to mark groups for clean up on exit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __66__WBSSavedAccountStore__performCleanupForExitedGroupsIfNecessary___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v1, v3, "Error fetching groups, skipping clean up for now: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_moveCredentialTypesToRecentlyDeletedOnInternalQueue:fromSavedAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Failed to move saved account to recently deleted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_recoverRecentlyDeletedSavedAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Failed to recover saved account from recently deleted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_recoverRecentlyDeletedSavedAccount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Tried to recover an account that isn't recently deleted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v1, v3, "Received error from group sync verification: %{private}@", v4);

  OUTLINED_FUNCTION_4();
}

void __43__WBSSavedAccountStore__verifyGroupsInSync__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "Received reply from group sync verification. Groups were NOT in sync.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_persistentIdentifierForUser:(int)a1 host:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B2621000, a2, OS_LOG_TYPE_ERROR, "Failed to find persistent identifier. SecItemCopyMatching failed with error code %d.", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)_persistentIdentifierForUser:host:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Refusing to look up persistent identifier for credential with no username or host.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)passkeysData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Passkey extras used without loading AuthenticationServices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)deletePasskeyWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "Passkey extras used without loading AuthenticationServices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
