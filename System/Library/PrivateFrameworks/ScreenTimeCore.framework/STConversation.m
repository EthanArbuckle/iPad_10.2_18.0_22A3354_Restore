@implementation STConversation

- (STConversation)initWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STConversation *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1D1E0], "communicationBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    v7 = -[STConversation initWithBundleIdentifier:contactStore:](self, "initWithBundleIdentifier:contactStore:", v4, v6);

  }
  else
  {
    v7 = -[STConversation initWithThirdPartyBundleIdentifier:completionHandler:](self, "initWithThirdPartyBundleIdentifier:completionHandler:", v4, 0);
  }

  return v7;
}

- (STConversation)initWithBundleIdentifier:(id)a3 contactStore:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  STConversation *v10;
  STConversation *v11;
  STConversation *v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D1D1E0];
  v8 = a3;
  objc_msgSend(v7, "communicationBundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v8) & 1) != 0)
    v10 = -[STConversation initWithBundleIdentifier:contactStore:completionHandler:](self, "initWithBundleIdentifier:contactStore:completionHandler:", v8, v6, 0);
  else
    v10 = -[STConversation initWithThirdPartyBundleIdentifier:completionHandler:](self, "initWithThirdPartyBundleIdentifier:completionHandler:", v8, 0);
  v11 = v10;

  v12 = v11;
  return v12;
}

- (STConversation)initWithBundleIdentifier:(id)a3 contactStore:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  STConversation *v11;
  NSObject *v12;
  STManagementState *managementState;
  uint64_t v14;
  STConversation *v15;
  DMFCommunicationPolicyMonitor *communicationPolicyMonitor;
  STConversation *v17;
  id v18;
  DMFEmergencyModeMonitor *emergencyModeMonitor;
  STConversation *v20;
  STConversation *v21;
  STConversation *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  STConversation *v28;
  _QWORD v29[4];
  STConversation *v30;
  id v31;
  _QWORD v32[4];
  STConversation *v33;
  objc_super v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34.receiver = self;
  v34.super_class = (Class)STConversation;
  v9 = a5;
  v10 = a4;
  v11 = -[STConversation init](&v34, sel_init);
  +[STLog conversation](STLog, "conversation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v8;
    _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_DEFAULT, "Initializing STConversation asynchronously for bundle identifier: %{public}@", buf, 0xCu);
  }

  -[STConversation _stConversationCommonInitWithBundleIdentifier:contactStore:completionHandler:](v11, "_stConversationCommonInitWithBundleIdentifier:contactStore:completionHandler:", v8, v10, v9);
  managementState = v11->_managementState;
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke;
  v32[3] = &unk_1E93711E8;
  v15 = v11;
  v33 = v15;
  -[STManagementState communicationPoliciesWithCompletionHandler:](managementState, "communicationPoliciesWithCompletionHandler:", v32);
  communicationPolicyMonitor = v15->_communicationPolicyMonitor;
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_76;
  v29[3] = &unk_1E9371210;
  v17 = v15;
  v30 = v17;
  v31 = v8;
  v18 = v8;
  -[DMFCommunicationPolicyMonitor requestPoliciesByBundleIdentifierWithCompletionHandler:](communicationPolicyMonitor, "requestPoliciesByBundleIdentifierWithCompletionHandler:", v29);
  emergencyModeMonitor = v17->_emergencyModeMonitor;
  v24 = v14;
  v25 = 3221225472;
  v26 = __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_78;
  v27 = &unk_1E9371238;
  v20 = v17;
  v28 = v20;
  -[DMFEmergencyModeMonitor emergencyModeStatusWithCompletionHandler:](emergencyModeMonitor, "emergencyModeStatusWithCompletionHandler:", &v24);
  -[STConversation _stConversationCommonInitSetupObservationOfStateChanges](v20, "_stConversationCommonInitSetupObservationOfStateChanges", v24, v25, v26, v27);
  v21 = v28;
  v22 = v20;

  return v22;
}

- (void)_stConversationCommonInitWithBundleIdentifier:(id)a3 contactStore:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNDowntimeWhitelist *v11;
  CNDowntimeWhitelist *whitelist;
  NSString *v13;
  NSString *bundleIdentifier;
  void *v15;
  NSString *v16;
  NSString *processName;
  NSMapTable *v18;
  NSMapTable *contextByHandles;
  NSObject *v20;
  NSObject *didFetchInitialStateLock;
  STManagementState *v22;
  STManagementState *managementState;
  id v24;
  DMFCommunicationPolicyMonitor *v25;
  DMFCommunicationPolicyMonitor *communicationPolicyMonitor;
  DMFEmergencyModeMonitor *v27;
  DMFEmergencyModeMonitor *emergencyModeMonitor;
  void *v29;
  id conversationCompletionHandler;
  _QWORD v31[4];
  id v32;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_storeStrong((id *)&self->_contactStore, a4);
  v11 = (CNDowntimeWhitelist *)objc_msgSend(objc_alloc(MEMORY[0x1E0C972D8]), "initWithContactStore:", self->_contactStore);
  whitelist = self->_whitelist;
  self->_whitelist = v11;

  v13 = (NSString *)objc_msgSend(v8, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v13;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processName");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  processName = self->_processName;
  self->_processName = v16;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v18 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  contextByHandles = self->_contextByHandles;
  self->_contextByHandles = v18;

  v20 = objc_opt_new();
  didFetchInitialStateLock = self->_didFetchInitialStateLock;
  self->_didFetchInitialStateLock = v20;

  v22 = (STManagementState *)objc_opt_new();
  managementState = self->_managementState;
  self->_managementState = v22;

  objc_initWeak(&location, self);
  v24 = objc_alloc(MEMORY[0x1E0D1D1E0]);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __95__STConversation__stConversationCommonInitWithBundleIdentifier_contactStore_completionHandler___block_invoke;
  v31[3] = &unk_1E9371260;
  objc_copyWeak(&v32, &location);
  v25 = (DMFCommunicationPolicyMonitor *)objc_msgSend(v24, "initWithPolicyChangeHandler:", v31);
  communicationPolicyMonitor = self->_communicationPolicyMonitor;
  self->_communicationPolicyMonitor = v25;

  v27 = (DMFEmergencyModeMonitor *)objc_opt_new();
  emergencyModeMonitor = self->_emergencyModeMonitor;
  self->_emergencyModeMonitor = v27;

  v29 = _Block_copy(v10);
  conversationCompletionHandler = self->_conversationCompletionHandler;
  self->_conversationCompletionHandler = v29;

  self->_generalScreenTimePolicy = 0;
  self->_whileLimitedPolicy = 0;
  self->_currentApplicationState = 0;
  self->_emergencyModeEnabled = 1;
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  +[STLog conversation](STLog, "conversation");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.4();

    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNeededWithConversation:error:", 0, v7);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v13 = a2;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_1D22E7000, v9, OS_LOG_TYPE_DEFAULT, "Fetched initial communication policies. General policy: %lld. While limited policy: %lld.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setGeneralScreenTimePolicy:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setWhileLimitedPolicy:", a3);
    LOBYTE(v11) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_updateAllContextsUpdateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", 1, 1, 0, 1, 0, 0, v11);
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(a1 + 32), "setDidFetchInitialScreenTimePolicyState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNeededWithConversation:error:", *(_QWORD *)(a1 + 32), 0);
  }
  objc_sync_exit(v10);

}

- (void)callCompletionHandlerIfNeededWithConversation:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[STConversation conversationCompletionHandler](self, "conversationCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (!v9
     || -[STConversation didFetchInitialScreenTimePolicyState](self, "didFetchInitialScreenTimePolicyState")
     && -[STConversation didFetchInitialApplicationState](self, "didFetchInitialApplicationState")
     && -[STConversation didFetchInitialEmergencyModeState](self, "didFetchInitialEmergencyModeState")))
  {
    -[STConversation conversationCompletionHandler](self, "conversationCompletionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

    -[STConversation setConversationCompletionHandler:](self, "setConversationCompletionHandler:", 0);
    -[STConversation setMe:](self, "setMe:", 0);
  }

}

- (id)conversationCompletionHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)_updateAllContextsUpdateGeneral:(BOOL)a3 updateLimited:(BOOL)a4 updateCurrentApplicationState:(BOOL)a5 updateAllowedByContactsHandle:(BOOL)a6 refreshContacts:(BOOL)a7 refreshWhitelist:(BOOL)a8 updateEmergencyMode:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  NSMapTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSMapTable *obj;
  _BOOL4 v22;
  _BOOL4 v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v22 = a5;
  v23 = a6;
  v9 = a4;
  v10 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  obj = self->_contextByHandles;
  objc_sync_enter(obj);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = self->_contextByHandles;
  v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_contextByHandles, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          BYTE2(v20) = a9;
          BYTE1(v20) = a8;
          LOBYTE(v20) = a7;
          -[STConversation _updateContext:forHandles:updateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:](self, "_updateContext:forHandles:updateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", v17, v16, v10, v9, v22, v23, v20);
        }

      }
      v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  -[STConversation processName](self, "processName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("suggestd"));

  if (v19)
    notify_post("com.apple.ScreenTime.ConversationDidObserveChangesNotification");
  objc_sync_exit(obj);

}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWhileLimitedPolicy:(int64_t)a3
{
  self->_whileLimitedPolicy = a3;
}

- (void)setGeneralScreenTimePolicy:(int64_t)a3
{
  self->_generalScreenTimePolicy = a3;
}

- (void)setEmergencyModeEnabled:(BOOL)a3
{
  self->_emergencyModeEnabled = a3;
}

- (void)setDidFetchInitialScreenTimePolicyState:(BOOL)a3
{
  self->_didFetchInitialScreenTimePolicyState = a3;
}

- (void)setDidFetchInitialEmergencyModeState:(BOOL)a3
{
  self->_didFetchInitialEmergencyModeState = a3;
}

- (void)setDidFetchInitialApplicationState:(BOOL)a3
{
  self->_didFetchInitialApplicationState = a3;
}

- (void)setCurrentApplicationState:(unint64_t)a3
{
  self->_currentApplicationState = a3;
}

- (void)_stConversationCommonInitSetupObservationOfStateChanges
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *stateChangeQueue;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD handler[4];
  id v16;
  id location;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.ScreenTimeAgent.%@.conversation"), self->_bundleIdentifier);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), v4);
  stateChangeQueue = self->_stateChangeQueue;
  self->_stateChangeQueue = v6;

  objc_initWeak(&location, self);
  v8 = self->_stateChangeQueue;
  v9 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __73__STConversation__stConversationCommonInitSetupObservationOfStateChanges__block_invoke;
  handler[3] = &unk_1E9371288;
  objc_copyWeak(&v16, &location);
  notify_register_dispatch("com.apple.ScreenTimeAgent.SettingsDidChangeNotification", &self->_policyNotifyToken, v8, handler);
  v10 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D1D1D0], "UTF8String");
  v11 = self->_stateChangeQueue;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __73__STConversation__stConversationCommonInitSetupObservationOfStateChanges__block_invoke_2;
  v13[3] = &unk_1E9371288;
  objc_copyWeak(&v14, &location);
  notify_register_dispatch(v10, &self->_emergencyModeNotifyToken, v11, v13);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__updateAllContextsForNewWhileLimitedPolicyOrWhitelist, *MEMORY[0x1E0C968C0], 0);
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__contactStoreDidChange, *MEMORY[0x1E0C96870], 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (id)allowableByContactsHandles:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = self->_contextByHandles;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](self->_contextByHandles, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    if (-[STConversation isThirdPartyBundleIdentifier](self, "isThirdPartyBundleIdentifier"))
    {
      -[STConversation _updateThirdPartyContext:forHandles:](self, "_updateThirdPartyContext:forHandles:", v6, v4);
    }
    else
    {
      BYTE2(v8) = 0;
      LOWORD(v8) = 0;
      -[STConversation _updateContext:forHandles:updateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:](self, "_updateContext:forHandles:updateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", v6, v4, 1, 1, 0, 1, v8);
    }
    -[NSMapTable setObject:forKey:](self->_contextByHandles, "setObject:forKey:", v6, v4);
  }
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)isThirdPartyBundleIdentifier
{
  return self->_isThirdPartyBundleIdentifier;
}

- (void)_populateAllowedContactsByHandlesForContactHandles:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  _BOOL4 v36;
  _BOOL4 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[STConversation whileLimitedPolicy](self, "whileLimitedPolicy");
  v9 = objc_msgSend(v7, "allowedByScreenTime");
  objc_msgSend(v7, "contactsByHandle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  objc_msgSend(v7, "whitelistedHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[STConversation currentApplicationState](self, "currentApplicationState");
  v12 = v11;
  v14 = v11 == 1 && v8 == 3;
  v37 = v14;
  v15 = !v11 && -[STConversation generalScreenTimePolicy](self, "generalScreenTimePolicy") == 1 || v12 == 1 && v8 == 1;
  v36 = v15;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    v22 = MEMORY[0x1E0C9AAB0];
    v34 = v12;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v23);
        if (v9)
        {
          v25 = v17;
          v26 = v22;
LABEL_25:
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v23));
          goto LABEL_26;
        }
        if (v12 == 2)
          goto LABEL_24;
        if (v37)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v23)));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, v24);

          v22 = MEMORY[0x1E0C9AAB0];
        }
        else
        {
          if (v36)
          {
LABEL_24:
            v25 = v17;
            v26 = MEMORY[0x1E0C9AAA0];
            goto LABEL_25;
          }
          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v35, "objectForKeyedSubscript:", v24);
          v29 = v10;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "numberWithInt:", objc_msgSend(v30, "count") != 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v31, v24);

          v22 = MEMORY[0x1E0C9AAB0];
          v10 = v29;
          v12 = v34;
        }
LABEL_26:
        ++v23;
      }
      while (v20 != v23);
      v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v20 = v32;
    }
    while (v32);
  }

  objc_msgSend(v33, "setAllowedByContactsHandle:", v17);
}

- (void)_updateContext:(id)a3 forHandles:(id)a4 updateGeneral:(BOOL)a5 updateLimited:(BOOL)a6 updateCurrentApplicationState:(BOOL)a7 updateAllowedByContactsHandle:(BOOL)a8 refreshContacts:(BOOL)a9 refreshWhitelist:(BOOL)a10 updateEmergencyMode:(BOOL)a11
{
  _BOOL4 v11;
  _BOOL4 v13;
  _BOOL4 v14;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  int64_t v24;
  int64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  void *v38;
  int v39;
  int v40;
  int v41;
  int64_t v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  int64_t v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v11 = a8;
  v13 = a6;
  v14 = a5;
  v63 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v44 = a4;
  v18 = objc_msgSend(v17, "allowedByScreenTime");
  v41 = objc_msgSend(v17, "applicationCurrentlyLimited");
  v40 = objc_msgSend(v17, "shouldBeAllowedByScreenTimeWhenLimited");
  v39 = objc_msgSend(v17, "emergencyModeEnabled");
  objc_msgSend(v17, "allowedByContactsHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v19, "copy");

  if (a9)
    objc_msgSend(v17, "setContactsByHandle:", 0);
  if (a10)
    objc_msgSend(v17, "setWhitelistedHandles:", 0);
  v20 = objc_msgSend(v17, "shouldBeAllowedDuringGeneralScreenTime");
  v21 = objc_msgSend(v17, "shouldBeAllowedByScreenTimeWhenLimited");
  v22 = v44;
  if (-[STConversation emergencyModeEnabled](self, "emergencyModeEnabled"))
  {
    v20 = 1;
    v21 = 1;
    goto LABEL_18;
  }
  v23 = !v13;
  if (v14 && (v23 & 1) == 0)
  {
    v20 = -[STConversation _shouldGeneralScreenTimeAllowHandles:context:](self, "_shouldGeneralScreenTimeAllowHandles:context:", v44, v17);
LABEL_12:
    v24 = -[STConversation generalScreenTimePolicy](self, "generalScreenTimePolicy");
    if (v24 == -[STConversation whileLimitedPolicy](self, "whileLimitedPolicy"))
      v21 = v20;
    else
      v21 = -[STConversation _shouldWhileLimitedAllowHandles:context:](self, "_shouldWhileLimitedAllowHandles:context:", v44, v17);
    goto LABEL_18;
  }
  if (!v14 || v13)
  {
    if (((v23 | v14) & 1) != 0)
      goto LABEL_18;
    goto LABEL_12;
  }
  v25 = -[STConversation generalScreenTimePolicy](self, "generalScreenTimePolicy");
  if (v25 == -[STConversation whileLimitedPolicy](self, "whileLimitedPolicy"))
    v20 = v21;
  else
    v20 = -[STConversation _shouldGeneralScreenTimeAllowHandles:context:](self, "_shouldGeneralScreenTimeAllowHandles:context:", v44, v17);
LABEL_18:
  if (a7 || a11 || v13 || v14)
    objc_msgSend(v17, "updateShouldBeAllowedDuringGeneralScreenTime:shouldBeAllowedByScreenTimeWhenLimited:currentApplicationState:emergencyModeEnabled:", v20, v21, -[STConversation currentApplicationState](self, "currentApplicationState"), -[STConversation emergencyModeEnabled](self, "emergencyModeEnabled"));
  if (v11)
    -[STConversation _populateAllowedContactsByHandlesForContactHandles:context:](self, "_populateAllowedContactsByHandlesForContactHandles:context:", v44, v17);
  v26 = objc_msgSend(v17, "allowedByScreenTime");
  v27 = objc_msgSend(v17, "applicationCurrentlyLimited");
  v28 = objc_msgSend(v17, "shouldBeAllowedByScreenTimeWhenLimited");
  v29 = objc_msgSend(v17, "emergencyModeEnabled");
  objc_msgSend(v17, "allowedByContactsHandle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 != v26
    || ((v41 ^ v27) & 1) != 0
    || ((v40 ^ v28) & 1) != 0
    || ((v39 ^ v29) & 1) != 0
    || (objc_msgSend(v43, "isEqualToDictionary:", v30) & 1) == 0)
  {
    +[STLog conversation](STLog, "conversation");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[STConversation bundleIdentifier](self, "bundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[STConversation generalScreenTimePolicy](self, "generalScreenTimePolicy");
      v33 = -[STConversation whileLimitedPolicy](self, "whileLimitedPolicy");
      v34 = objc_msgSend(v17, "allowedByScreenTime");
      v35 = objc_msgSend(v17, "applicationCurrentlyLimited");
      v36 = objc_msgSend(v17, "shouldBeAllowedByScreenTimeWhenLimited");
      v37 = objc_msgSend(v17, "emergencyModeEnabled");
      objc_msgSend(v17, "allowedByContactsHandle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545411;
      v46 = v32;
      v47 = 2113;
      v48 = v44;
      v49 = 2048;
      v50 = v42;
      v51 = 2048;
      v52 = v33;
      v53 = 1024;
      v54 = v34;
      v55 = 1024;
      v56 = v35;
      v57 = 1024;
      v58 = v36;
      v59 = 1024;
      v60 = v37;
      v61 = 2113;
      v62 = v38;
      _os_log_impl(&dword_1D22E7000, v31, OS_LOG_TYPE_DEFAULT, "Updated %{public}@ context for handles:%{private}@. General policy: %lld. While limited policy: %lld. allowedByScreenTime:%d applicationCurrentlyLimited:%d shouldBeAllowedByScreenTimeWhenLimited:%d emergencyModeEnabled:%d allowedByContactsHandle:%{private}@", buf, 0x4Cu);

    }
    v22 = v44;
  }

}

- (int64_t)generalScreenTimePolicy
{
  return self->_generalScreenTimePolicy;
}

- (int64_t)whileLimitedPolicy
{
  return self->_whileLimitedPolicy;
}

- (BOOL)emergencyModeEnabled
{
  return self->_emergencyModeEnabled;
}

- (unint64_t)currentApplicationState
{
  return self->_currentApplicationState;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)_shouldGeneralScreenTimeAllowHandles:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[STConversation generalScreenTimePolicy](self, "generalScreenTimePolicy");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, "contactsByHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      v12 = 0;
    }
    else
    {
      v27 = 0;
      -[STConversation _contactsByHandle:error:](self, "_contactsByHandle:error:", v6, &v27);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v27;
      if (!v11)
      {
        +[STLog conversation](STLog, "conversation");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[STConversation _shouldGeneralScreenTimeAllowHandles:context:].cold.1(v6);
        goto LABEL_25;
      }
    }
    objc_msgSend(v7, "setContactsByHandle:", v11);
    if (v9 == 1)
    {
      v13 = -[STConversation _doesContainAtLeastOneContactInHandles:contactsByHandle:](self, "_doesContainAtLeastOneContactInHandles:contactsByHandle:", v6, v11);
LABEL_26:

      goto LABEL_27;
    }
    if (v9 == 2)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = v6;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "count");

            if (!v20)
            {
              v13 = 0;
              goto LABEL_22;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v16)
            continue;
          break;
        }
      }
      v13 = 1;
LABEL_22:

      goto LABEL_26;
    }
    +[STLog conversation](STLog, "conversation");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[STConversation _shouldGeneralScreenTimeAllowHandles:context:].cold.2();

LABEL_25:
    v13 = 1;
    goto LABEL_26;
  }
  v13 = 1;
LABEL_27:

  return v13;
}

- (id)initSynchronouslyWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  STConversation *v6;
  NSObject *v7;
  void *v8;
  STManagementState *managementState;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  STConversation *v17;
  NSObject *v18;
  STConversation *v19;
  NSObject *v20;
  DMFCommunicationPolicyMonitor *communicationPolicyMonitor;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  DMFEmergencyModeMonitor *emergencyModeMonitor;
  void *v30;
  id v31;
  double v32;
  double v33;
  BOOL v34;
  NSObject *v35;
  NSObject *v36;
  id v38;
  id v39;
  id v40;
  objc_super v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.ScreenTimeAgent"));
    if (!objc_msgSend(v5, "BOOLForKey:", CFSTR("ScreenTimeEnabled")))
    {
      +[STLog conversation](STLog, "conversation");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v43 = (uint64_t)v4;
        _os_log_impl(&dword_1D22E7000, v18, OS_LOG_TYPE_DEFAULT, "Returning STConversation early since Screen Time is OFF. Initializing STConversation asynchronously for bundle identifier: %{public}@", buf, 0xCu);
      }

      v17 = -[STConversation initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v4);
      goto LABEL_15;
    }

  }
  objc_msgSend(MEMORY[0x1E0D1D1E0], "communicationBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) == 0)
  {
    v17 = -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:](self, "initSynchronouslyWithThirdPartyBundleIdentifier:", v4);
LABEL_15:
    v19 = v17;
    goto LABEL_37;
  }
  v41.receiver = self;
  v41.super_class = (Class)STConversation;
  v6 = -[STConversation init](&v41, sel_init);
  +[STLog conversation](STLog, "conversation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = (uint64_t)v4;
    _os_log_impl(&dword_1D22E7000, v7, OS_LOG_TYPE_DEFAULT, "Initializing STConversation synchronously for bundle identifier: %{public}@", buf, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  -[STConversation _stConversationCommonInitWithBundleIdentifier:contactStore:completionHandler:](v6, "_stConversationCommonInitWithBundleIdentifier:contactStore:completionHandler:", v4, v8, 0);

  managementState = v6->_managementState;
  v40 = 0;
  -[STManagementState communicationPoliciesWithError:](managementState, "communicationPoliciesWithError:", &v40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v40;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", 0x1E9379A78);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "longLongValue");

    objc_msgSend(v10, "objectForKeyedSubscript:", 0x1E9379A98);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "longLongValue");

    +[STLog conversation](STLog, "conversation");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v43 = v13;
      v44 = 2048;
      v45 = v15;
      _os_log_impl(&dword_1D22E7000, v16, OS_LOG_TYPE_DEFAULT, "Fetched initial communication policies. General policy: %lld. While limited policy: %lld.", buf, 0x16u);
    }

    v6->_generalScreenTimePolicy = v13;
    v6->_whileLimitedPolicy = v15;
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.4();

  }
  communicationPolicyMonitor = v6->_communicationPolicyMonitor;
  v39 = v11;
  -[DMFCommunicationPolicyMonitor requestPoliciesByBundleIdentifierWithError:](communicationPolicyMonitor, "requestPoliciesByBundleIdentifierWithError:", &v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v39;

  if (v22)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", v4);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = -[NSObject unsignedIntegerValue](v24, "unsignedIntegerValue");
      +[STLog conversation](STLog, "conversation");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v43 = (uint64_t)v4;
        v44 = 2048;
        v45 = v26;
        _os_log_impl(&dword_1D22E7000, v27, OS_LOG_TYPE_DEFAULT, "Fetched initial %{public}@ application state: %lu", buf, 0x16u);
      }

      v6->_currentApplicationState = v26;
    }
    else
    {
      +[STLog conversation](STLog, "conversation");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[STConversation initSynchronouslyWithBundleIdentifier:].cold.3();

    }
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.2();
  }

  emergencyModeMonitor = v6->_emergencyModeMonitor;
  v38 = v23;
  -[DMFEmergencyModeMonitor emergencyModeStatusWithError:](emergencyModeMonitor, "emergencyModeStatusWithError:", &v38);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v38;

  if (v30)
  {
    objc_msgSend(v30, "doubleValue");
    v33 = v32;
    v34 = v32 > 0.0;
    +[STLog conversation](STLog, "conversation");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v33 > 0.0;
      _os_log_impl(&dword_1D22E7000, v35, OS_LOG_TYPE_DEFAULT, "Fetched initial emergency mode status: %d", buf, 8u);
    }

    v6->_emergencyModeEnabled = v34;
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.1();

  }
  -[STConversation _stConversationCommonInitSetupObservationOfStateChanges](v6, "_stConversationCommonInitSetupObservationOfStateChanges");
  v19 = v6;

LABEL_37:
  return v19;
}

- (id)initSynchronouslyWithThirdPartyBundleIdentifier:(id)a3
{
  id v4;
  STConversation *v5;
  NSObject *v6;
  DMFApplicationPolicyMonitor *thirdPartyApplicationPolicyMonitor;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  STConversation *v16;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STConversation;
  v5 = -[STConversation init](&v19, sel_init);
  +[STLog conversation](STLog, "conversation");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v4;
    _os_log_impl(&dword_1D22E7000, v6, OS_LOG_TYPE_DEFAULT, "Initializing STConversation synchronously for third party bundle identifier: %{public}@", buf, 0xCu);
  }

  -[STConversation _stConversationCommonInitWithThirdPartyBundleIdentifier:completionHandler:](v5, "_stConversationCommonInitWithThirdPartyBundleIdentifier:completionHandler:", v4, 0);
  thirdPartyApplicationPolicyMonitor = v5->_thirdPartyApplicationPolicyMonitor;
  v24[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  -[DMFApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:withError:](thirdPartyApplicationPolicyMonitor, "requestPoliciesForBundleIdentifiers:withError:", v8, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = -[NSObject integerValue](v11, "integerValue");
      +[STLog conversation](STLog, "conversation");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v21 = v4;
        v22 = 2048;
        v23 = v13;
        _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "Fetched initial %{public}@ application state: %ld", buf, 0x16u);
      }

      v5->_currentThirdPartyApplicationState = v13;
    }
    else
    {
      +[STLog conversation](STLog, "conversation");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:].cold.2();

    }
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:].cold.1();
  }

  v16 = v5;
  return v16;
}

void __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "unsignedIntegerValue");
      +[STLog conversation](STLog, "conversation");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v18 = v11;
        v19 = 2048;
        v20 = v9;
        _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "Fetched initial %{public}@ application state: %lu", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setCurrentApplicationState:", v9);
      LOBYTE(v16) = 0;
      objc_msgSend(*(id *)(a1 + 32), "_updateAllContextsUpdateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", 0, 0, 1, 1, 0, 0, v16);
    }
    else
    {
      +[STLog conversation](STLog, "conversation");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_76_cold_2(a1 + 40, a1);

    }
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v15);
    objc_msgSend(*(id *)(a1 + 32), "setDidFetchInitialApplicationState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNeededWithConversation:error:", *(_QWORD *)(a1 + 32), 0);
    objc_sync_exit(v15);

    v13 = v8;
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.2();

    v13 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v13);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNeededWithConversation:error:", 0, v6);
    objc_sync_exit(v13);
  }

}

void __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
    +[STLog conversation](STLog, "conversation");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v8 > 0.0;
      _os_log_impl(&dword_1D22E7000, v9, OS_LOG_TYPE_DEFAULT, "Fetched initial emergency mode status: %d", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setEmergencyModeEnabled:", v8 > 0.0);
    LOBYTE(v12) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_updateAllContextsUpdateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", 1, 1, 0, 1, 0, 0, v12);
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(a1 + 32), "setDidFetchInitialEmergencyModeState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNeededWithConversation:error:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.1();

    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v10);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNeededWithConversation:error:", 0, v6);
  }
  objc_sync_exit(v10);

}

- (STConversation)initWithThirdPartyBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  STConversation *v8;
  NSObject *v9;
  DMFApplicationPolicyMonitor *thirdPartyApplicationPolicyMonitor;
  void *v11;
  STConversation *v12;
  id v13;
  void *v14;
  STConversation *v15;
  _QWORD v17[4];
  STConversation *v18;
  id v19;
  objc_super v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STConversation;
  v7 = a4;
  v8 = -[STConversation init](&v20, sel_init);
  +[STLog conversation](STLog, "conversation");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_1D22E7000, v9, OS_LOG_TYPE_DEFAULT, "Initializing STConversation asynchronously for third party bundle identifier: %{public}@", buf, 0xCu);
  }

  -[STConversation _stConversationCommonInitWithThirdPartyBundleIdentifier:completionHandler:](v8, "_stConversationCommonInitWithThirdPartyBundleIdentifier:completionHandler:", v6, v7);
  thirdPartyApplicationPolicyMonitor = v8->_thirdPartyApplicationPolicyMonitor;
  v21 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__STConversation_initWithThirdPartyBundleIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E9371210;
  v12 = v8;
  v18 = v12;
  v19 = v6;
  v13 = v6;
  -[DMFApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:completionHandler:](thirdPartyApplicationPolicyMonitor, "requestPoliciesForBundleIdentifiers:completionHandler:", v11, v17);

  v14 = v19;
  v15 = v12;

  return v15;
}

void __71__STConversation_initWithThirdPartyBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "integerValue");
      +[STLog conversation](STLog, "conversation");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v16 = 138543618;
        v17 = v11;
        v18 = 2048;
        v19 = v9;
        _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "Fetched initial %{public}@ application state: %ld", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setCurrentThirdPartyApplicationState:", v9);
      objc_msgSend(*(id *)(a1 + 32), "_updateAllThirdPartyContexts");
    }
    else
    {
      +[STLog conversation](STLog, "conversation");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __71__STConversation_initWithThirdPartyBundleIdentifier_completionHandler___block_invoke_cold_2(a1 + 40, a1);

    }
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v15);
    objc_msgSend(*(id *)(a1 + 32), "setDidFetchInitialThirdPartyApplicationState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNeededWithThirdPartyConversation:error:", *(_QWORD *)(a1 + 32), 0);
    objc_sync_exit(v15);

    v13 = v8;
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:].cold.1();

    v13 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v13);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandlerIfNeededWithThirdPartyConversation:error:", 0, v6);
    objc_sync_exit(v13);
  }

}

void __95__STConversation__stConversationCommonInitWithBundleIdentifier_contactStore_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_currentApplicationStateDidChange");

}

void __73__STConversation__stConversationCommonInitSetupObservationOfStateChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_screenTimePolicyDidChange");

}

void __73__STConversation__stConversationCommonInitSetupObservationOfStateChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_emergencyModeDidChange");

}

- (void)_stConversationCommonInitWithThirdPartyBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *bundleIdentifier;
  void *v10;
  NSString *v11;
  NSString *processName;
  NSMapTable *v13;
  NSMapTable *contextByHandles;
  NSObject *v15;
  NSObject *didFetchInitialStateLock;
  id v17;
  DMFApplicationPolicyMonitor *v18;
  DMFApplicationPolicyMonitor *thirdPartyApplicationPolicyMonitor;
  void *v20;
  id conversationCompletionHandler;
  _QWORD v22[4];
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (NSString *)objc_msgSend(v6, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v8;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processName");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  processName = self->_processName;
  self->_processName = v11;

  self->_isThirdPartyBundleIdentifier = 1;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v13 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  contextByHandles = self->_contextByHandles;
  self->_contextByHandles = v13;

  v15 = objc_opt_new();
  didFetchInitialStateLock = self->_didFetchInitialStateLock;
  self->_didFetchInitialStateLock = v15;

  objc_initWeak(&location, self);
  v17 = objc_alloc(MEMORY[0x1E0D1D1D8]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__STConversation__stConversationCommonInitWithThirdPartyBundleIdentifier_completionHandler___block_invoke;
  v22[3] = &unk_1E9371260;
  objc_copyWeak(&v23, &location);
  v18 = (DMFApplicationPolicyMonitor *)objc_msgSend(v17, "initWithPolicyChangeHandler:", v22);
  thirdPartyApplicationPolicyMonitor = self->_thirdPartyApplicationPolicyMonitor;
  self->_thirdPartyApplicationPolicyMonitor = v18;

  v20 = _Block_copy(v7);
  conversationCompletionHandler = self->_conversationCompletionHandler;
  self->_conversationCompletionHandler = v20;

  self->_currentThirdPartyApplicationState = 0;
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __92__STConversation__stConversationCommonInitWithThirdPartyBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_currentThirdPartyApplicationStateDidChange");

}

+ (void)requestConversationWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void *)MEMORY[0x1E0D1D1E0];
  v7 = a4;
  objc_msgSend(v6, "communicationBundleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v13);
  v9 = objc_alloc((Class)a1);
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v11 = objc_opt_new();
    v12 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:contactStore:completionHandler:", v13, v11, v7);

    v7 = (id)v11;
  }
  else
  {
    v12 = (void *)objc_msgSend(v9, "initWithThirdPartyBundleIdentifier:completionHandler:", v13, v7);
  }

  objc_msgSend(v12, "setMe:", v12);
}

- (void)callCompletionHandlerIfNeededWithThirdPartyConversation:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[STConversation conversationCompletionHandler](self, "conversationCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (!v9
     || -[STConversation didFetchInitialThirdPartyApplicationState](self, "didFetchInitialThirdPartyApplicationState")))
  {
    -[STConversation conversationCompletionHandler](self, "conversationCompletionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

    -[STConversation setConversationCompletionHandler:](self, "setConversationCompletionHandler:", 0);
    -[STConversation setMe:](self, "setMe:", 0);
  }

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_policyNotifyToken);
  notify_cancel(self->_emergencyModeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)STConversation;
  -[STConversation dealloc](&v3, sel_dealloc);
}

- (void)_updateThirdPartyContext:(id)a3 forHandles:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "allowedByScreenTime");
  objc_msgSend(v6, "updateForThirdPartyApplicationState:", -[STConversation currentThirdPartyApplicationState](self, "currentThirdPartyApplicationState"));
  -[STConversation _populateThirdPartyAllowedContactsByHandlesForContactHandles:context:](self, "_populateThirdPartyAllowedContactsByHandlesForContactHandles:context:", v7, v6);
  if (v8 != objc_msgSend(v6, "allowedByScreenTime"))
  {
    +[STLog conversation](STLog, "conversation");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[STConversation bundleIdentifier](self, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "allowedByScreenTime");
      objc_msgSend(v6, "allowedByContactsHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544131;
      v14 = v10;
      v15 = 2113;
      v16 = v7;
      v17 = 1024;
      v18 = v11;
      v19 = 2113;
      v20 = v12;
      _os_log_impl(&dword_1D22E7000, v9, OS_LOG_TYPE_DEFAULT, "Updated %{public}@ third party context for handles:%{private}@. allowedByScreenTime:%d allowedByContactsHandle:%{private}@", (uint8_t *)&v13, 0x26u);

    }
  }

}

- (void)_updateAllThirdPartyContexts
{
  NSMapTable *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = self->_contextByHandles;
  objc_sync_enter(v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_contextByHandles;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_contextByHandles, "objectForKey:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[STConversation _updateThirdPartyContext:forHandles:](self, "_updateThirdPartyContext:forHandles:", v9, v8);

      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[STConversation processName](self, "processName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("suggestd"));

  if (v11)
    notify_post("com.apple.ScreenTime.ConversationDidObserveChangesNotification");
  objc_sync_exit(v3);

}

- (void)_screenTimePolicyDidChange
{
  void *v3;
  _QWORD v4[5];

  -[STConversation managementState](self, "managementState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__STConversation__screenTimePolicyDidChange__block_invoke;
  v4[3] = &unk_1E93711E8;
  v4[4] = self;
  objc_msgSend(v3, "communicationPoliciesWithCompletionHandler:", v4);

}

void __44__STConversation__screenTimePolicyDidChange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v7)
  {
    +[STLog conversation](STLog, "conversation");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.4();

  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "generalScreenTimePolicy");
    v10 = objc_msgSend(*(id *)(a1 + 32), "whileLimitedPolicy");
    v11 = v10;
    if (v9 == a2)
    {
      if (v10 != a3)
      {
        +[STLog conversation](STLog, "conversation");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(*(id *)(a1 + 32), "whileLimitedPolicy");
          *(_DWORD *)buf = 134218240;
          v23 = v13;
          v24 = 2048;
          v25 = a3;
          _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_DEFAULT, "While limited policy changed from %lld to %lld.", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "setWhileLimitedPolicy:", a3);
        objc_msgSend(*(id *)(a1 + 32), "_updateAllContextsForNewWhileLimitedPolicyOrWhitelist");
      }
    }
    else
    {
      +[STLog conversation](STLog, "conversation");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(*(id *)(a1 + 32), "generalScreenTimePolicy");
        *(_DWORD *)buf = 134218240;
        v23 = v15;
        v24 = 2048;
        v25 = a2;
        _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "General policy changed from %lld to %lld.", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setGeneralScreenTimePolicy:", a2);
      if (v11 == a3)
      {
        v16 = objc_msgSend(*(id *)(a1 + 32), "currentApplicationState") == 0;
        v17 = *(void **)(a1 + 32);
        LOBYTE(v21) = 0;
        v18 = 0;
      }
      else
      {
        +[STLog conversation](STLog, "conversation");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(*(id *)(a1 + 32), "whileLimitedPolicy");
          *(_DWORD *)buf = 134218240;
          v23 = v20;
          v24 = 2048;
          v25 = a3;
          _os_log_impl(&dword_1D22E7000, v19, OS_LOG_TYPE_DEFAULT, "While limited policy changed from %lld to %lld.", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "setWhileLimitedPolicy:", a3);
        v16 = objc_msgSend(*(id *)(a1 + 32), "currentApplicationState") != 2;
        v17 = *(void **)(a1 + 32);
        LOBYTE(v21) = 0;
        v18 = 1;
      }
      objc_msgSend(v17, "_updateAllContextsUpdateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", 1, v18, 0, v16, 0, 0, v21);
    }
  }

}

- (void)_updateAllContextsForNewWhileLimitedPolicyOrWhitelist
{
  NSObject *stateChangeQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  stateChangeQueue = self->_stateChangeQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__STConversation__updateAllContextsForNewWhileLimitedPolicyOrWhitelist__block_invoke;
  v4[3] = &unk_1E9371260;
  objc_copyWeak(&v5, &location);
  dispatch_async(stateChangeQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__STConversation__updateAllContextsForNewWhileLimitedPolicyOrWhitelist__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _BOOL8 v3;
  uint64_t v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "currentApplicationState") == 1;

  v5 = objc_loadWeakRetained(v1);
  LOBYTE(v4) = 0;
  objc_msgSend(v5, "_updateAllContextsUpdateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", 0, 1, 0, v3, 0, 1, v4);

}

- (void)_contactStoreDidChange
{
  NSObject *stateChangeQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  stateChangeQueue = self->_stateChangeQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__STConversation__contactStoreDidChange__block_invoke;
  v4[3] = &unk_1E9371260;
  objc_copyWeak(&v5, &location);
  dispatch_async(stateChangeQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__STConversation__contactStoreDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LOBYTE(v1) = 0;
  objc_msgSend(WeakRetained, "_updateAllContextsUpdateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", 1, 1, 0, 1, 1, 1, v1);

}

- (void)_currentApplicationStateDidChange
{
  void *v3;
  _QWORD v4[5];

  -[STConversation communicationPolicyMonitor](self, "communicationPolicyMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__STConversation__currentApplicationStateDidChange__block_invoke;
  v4[3] = &unk_1E93712B0;
  v4[4] = self;
  objc_msgSend(v3, "requestPoliciesByBundleIdentifierWithCompletionHandler:", v4);

}

void __51__STConversation__currentApplicationStateDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v7 = (id *)(a1 + 32);
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[NSObject unsignedIntegerValue](v10, "unsignedIntegerValue");
      if (objc_msgSend(*v7, "currentApplicationState") != v11)
      {
        +[STLog conversation](STLog, "conversation");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v7, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v17 = v13;
          v18 = 2048;
          v19 = v11;
          _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ application state changed to %lu", buf, 0x16u);

        }
        objc_msgSend(*v7, "setCurrentApplicationState:", v11);
        LOBYTE(v15) = 0;
        objc_msgSend(*v7, "_updateAllContextsUpdateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", 0, 0, 1, 1, 0, 0, v15);
      }
    }
    else
    {
      +[STLog conversation](STLog, "conversation");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __51__STConversation__currentApplicationStateDidChange__block_invoke_cold_2(v7);

    }
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.2();
  }

}

- (void)_currentThirdPartyApplicationStateDidChange
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[STConversation thirdPartyApplicationPolicyMonitor](self, "thirdPartyApplicationPolicyMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STConversation bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__STConversation__currentThirdPartyApplicationStateDidChange__block_invoke;
  v6[3] = &unk_1E93712B0;
  v6[4] = self;
  objc_msgSend(v3, "requestPoliciesForBundleIdentifiers:completionHandler:", v5, v6);

}

void __61__STConversation__currentThirdPartyApplicationStateDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v7 = (id *)(a1 + 32);
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[NSObject integerValue](v10, "integerValue");
      if (objc_msgSend(*v7, "currentThirdPartyApplicationState") != v11)
      {
        +[STLog conversation](STLog, "conversation");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v7, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543618;
          v16 = v13;
          v17 = 2048;
          v18 = v11;
          _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ application state changed to %ld", (uint8_t *)&v15, 0x16u);

        }
        objc_msgSend(*v7, "setCurrentThirdPartyApplicationState:", v11);
        objc_msgSend(*v7, "_updateAllThirdPartyContexts");
      }
    }
    else
    {
      +[STLog conversation](STLog, "conversation");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __61__STConversation__currentThirdPartyApplicationStateDidChange__block_invoke_cold_2(v7);

    }
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:].cold.1();
  }

}

- (void)_emergencyModeDidChange
{
  void *v3;
  _QWORD v4[5];

  -[STConversation emergencyModeMonitor](self, "emergencyModeMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__STConversation__emergencyModeDidChange__block_invoke;
  v4[3] = &unk_1E9371238;
  v4[4] = self;
  objc_msgSend(v3, "emergencyModeStatusWithCompletionHandler:", v4);

}

void __41__STConversation__emergencyModeDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
    v9 = v7 > 0.0;
    if (v9 != objc_msgSend(*(id *)(a1 + 32), "emergencyModeEnabled"))
    {
      +[STLog conversation](STLog, "conversation");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v14 = v9;
        _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "Emergency mode changed to %d", buf, 8u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setEmergencyModeEnabled:", v8 > 0.0);
      LOBYTE(v12) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_updateAllContextsUpdateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", 1, 1, 0, 1, 0, 0, v12);
    }
  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.1();

  }
}

- (BOOL)_shouldWhileLimitedAllowHandles:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[STConversation whileLimitedPolicy](self, "whileLimitedPolicy");
  if (v8)
  {
    v9 = v8;
    if (v8 <= 2)
    {
      objc_msgSend(v7, "contactsByHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v10;
        v12 = 0;
      }
      else
      {
        v36 = 0;
        -[STConversation _contactsByHandle:error:](self, "_contactsByHandle:error:", v6, &v36);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v36;
        if (!v11)
        {
          +[STLog conversation](STLog, "conversation");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[STConversation _shouldGeneralScreenTimeAllowHandles:context:].cold.1(v6);
          v26 = 1;
LABEL_33:

          v18 = v26;
          goto LABEL_38;
        }
      }
      objc_msgSend(v7, "setContactsByHandle:", v11);
      if (v9 == 2)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v19 = v6;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v33 != v22)
                objc_enumerationMutation(v19);
              -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "count");

              if (!v25)
              {
                v26 = 0;
                goto LABEL_25;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v21)
              continue;
            break;
          }
        }
        v26 = 1;
LABEL_25:

      }
      else
      {
        v26 = -[STConversation _doesContainAtLeastOneContactInHandles:contactsByHandle:](self, "_doesContainAtLeastOneContactInHandles:contactsByHandle:", v6, v11);
      }
      goto LABEL_33;
    }
    if (v8 == 3)
    {
      -[STConversation _filteredArrayForKnownHandlesInArray:](self, "_filteredArrayForKnownHandlesInArray:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "whitelistedHandles");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = 0;
      }
      else
      {
        -[STConversation whitelist](self, "whitelist");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(v27, "whitelistedHandleStringsFromHandleStrings:error:", v13, &v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v31;

        if (!v15)
        {
          +[STLog conversation](STLog, "conversation");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[STConversation _shouldWhileLimitedAllowHandles:context:].cold.2(v6);

          v15 = 0;
          v18 = 1;
          goto LABEL_37;
        }
      }
      objc_msgSend(v7, "setWhitelistedHandles:", v15);
      if ((objc_msgSend(v6, "containsObject:", &stru_1E9372498) & 1) != 0)
      {
        v18 = 0;
      }
      else
      {
        v28 = objc_msgSend(v15, "count");
        v18 = v28 == objc_msgSend(v6, "count");
      }
LABEL_37:

      goto LABEL_38;
    }
    +[STLog conversation](STLog, "conversation");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[STConversation _shouldWhileLimitedAllowHandles:context:].cold.3();

  }
  v18 = 1;
LABEL_38:

  return v18;
}

- (BOOL)_doesContainAtLeastOneContactInHandles:(id)a3 contactsByHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *, void *, _BYTE *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[STConversation contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v8, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v9, &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;

  if (!v10)
  {
    +[STLog conversation](STLog, "conversation");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STConversation _doesContainAtLeastOneContactInHandles:contactsByHandle:].cold.1();

  }
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __74__STConversation__doesContainAtLeastOneContactInHandles_contactsByHandle___block_invoke;
  v22 = &unk_1E9371300;
  v14 = v13;
  v23 = v14;
  v24 = &v26;
  v25 = &v31;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v19);
  if (v27[3])
  {
    v15 = objc_msgSend(v6, "count", v19, v20, v21, v22);
    v16 = v32;
    if (v15 == v27[3])
      *((_BYTE *)v32 + 24) = 1;
  }
  else
  {
    v16 = v32;
  }
  v17 = *((_BYTE *)v16 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __74__STConversation__doesContainAtLeastOneContactInHandles_contactsByHandle___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v9 = (void *)a1[4];
    if (!v9)
      goto LABEL_4;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__STConversation__doesContainAtLeastOneContactInHandles_contactsByHandle___block_invoke_2;
    v10[3] = &unk_1E93712D8;
    v11 = v9;
    v12 = &v14;
    v13 = a1[5];
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    if (!*((_BYTE *)v15 + 24))
    {
LABEL_4:
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      *a4 = 1;
    }
    _Block_object_dispose(&v14, 8);
  }

}

void __74__STConversation__doesContainAtLeastOneContactInHandles_contactsByHandle___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", a1[4]);

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    *a4 = 1;
  }
}

- (void)_populateThirdPartyAllowedContactsByHandlesForContactHandles:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "allowedByScreenTime");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    if (v7)
      v13 = MEMORY[0x1E0C9AAB0];
    else
      v13 = MEMORY[0x1E0C9AAA0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setAllowedByContactsHandle:", v8);
}

- (id)_contactsByHandle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[STConversation managementState](self, "managementState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryiCloudCardDAVAccountIdentifierWithError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C972C0], "predicateForContainersInAccountWithExternalIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    -[STConversation contactStore](self, "contactStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containersMatchingPredicate:error:", v9, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0C97210]);
      v14 = *MEMORY[0x1E0C966A8];
      v28[0] = *MEMORY[0x1E0C966E8];
      v28[1] = v14;
      v28[2] = *MEMORY[0x1E0C967C0];
      v25 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "initWithKeysToFetch:", v15);

      -[STConversation _filteredArrayForKnownHandlesInArray:](self, "_filteredArrayForKnownHandlesInArray:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v12, "identifier");
      v26 = v6;
      v27 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "predicateForContactsMatchingHandleStrings:inContainersWithIdentifiers:", v17, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPredicate:](v16, "setPredicate:", v21);

      v11 = v25;
      objc_msgSend(v10, "executeFetchRequest:error:", v16, a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v26;
    }
    else
    {
      +[STLog conversation](STLog, "conversation");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[STConversation _contactsByHandle:error:].cold.2();
      v23 = 0;
    }

  }
  else
  {
    +[STLog conversation](STLog, "conversation");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[STConversation _contactsByHandle:error:].cold.1(v9);
    v23 = 0;
  }

  return v23;
}

- (id)_filteredArrayForKnownHandlesInArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __55__STConversation__filteredArrayForKnownHandlesInArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", &stru_1E9372498) ^ 1;
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 48, 1);
}

- (CNDowntimeWhitelist)whitelist
{
  return (CNDowntimeWhitelist *)objc_getProperty(self, a2, 56, 1);
}

- (STManagementState)managementState
{
  return (STManagementState *)objc_getProperty(self, a2, 64, 1);
}

- (void)setManagementState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (DMFCommunicationPolicyMonitor)communicationPolicyMonitor
{
  return (DMFCommunicationPolicyMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCommunicationPolicyMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (DMFApplicationPolicyMonitor)thirdPartyApplicationPolicyMonitor
{
  return (DMFApplicationPolicyMonitor *)objc_getProperty(self, a2, 80, 1);
}

- (void)setThirdPartyApplicationPolicyMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)currentThirdPartyApplicationState
{
  return self->_currentThirdPartyApplicationState;
}

- (void)setCurrentThirdPartyApplicationState:(int64_t)a3
{
  self->_currentThirdPartyApplicationState = a3;
}

- (DMFEmergencyModeMonitor)emergencyModeMonitor
{
  return (DMFEmergencyModeMonitor *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEmergencyModeMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)didFetchInitialScreenTimePolicyState
{
  return self->_didFetchInitialScreenTimePolicyState;
}

- (BOOL)didFetchInitialApplicationState
{
  return self->_didFetchInitialApplicationState;
}

- (BOOL)didFetchInitialEmergencyModeState
{
  return self->_didFetchInitialEmergencyModeState;
}

- (BOOL)didFetchInitialThirdPartyApplicationState
{
  return self->_didFetchInitialThirdPartyApplicationState;
}

- (void)setDidFetchInitialThirdPartyApplicationState:(BOOL)a3
{
  self->_didFetchInitialThirdPartyApplicationState = a3;
}

- (int)policyNotifyToken
{
  return self->_policyNotifyToken;
}

- (int)emergencyModeNotifyToken
{
  return self->_emergencyModeNotifyToken;
}

- (STConversation)me
{
  return (STConversation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setConversationCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_conversationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_emergencyModeMonitor, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_thirdPartyApplicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_communicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_didFetchInitialStateLock, 0);
  objc_storeStrong((id *)&self->_stateChangeQueue, 0);
  objc_storeStrong((id *)&self->_contextByHandles, 0);
}

- (void)initSynchronouslyWithBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Could not fetch emergency mode status: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initSynchronouslyWithBundleIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Could not fetch application state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initSynchronouslyWithBundleIdentifier:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_2_4(&dword_1D22E7000, v0, (uint64_t)v0, "%{public}@ application state does not exist, preferring to keep state as %lu", v1);
  OUTLINED_FUNCTION_1();
}

- (void)initSynchronouslyWithBundleIdentifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Could not fetch communication policies: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initSynchronouslyWithThirdPartyBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Could not fetch third party application state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initSynchronouslyWithThirdPartyBundleIdentifier:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_2_4(&dword_1D22E7000, v0, (uint64_t)v0, "%{public}@ application state does not exist, preferring to keep state as %ld", v1);
  OUTLINED_FUNCTION_1();
}

void __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_76_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a2 + 32), "currentApplicationState");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "%{public}@ application state does not exist, preferring to keep state as %lu", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_3();
}

void __71__STConversation_initWithThirdPartyBundleIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a2 + 32), "currentThirdPartyApplicationState");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "%{public}@ application state does not exist, preferring to keep state as %ld", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_3();
}

void __51__STConversation__currentApplicationStateDidChange__block_invoke_cold_2(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "currentApplicationState");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v3, v4, "%{public}@ application state does not exist, preferring to keep state as %lu", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_3();
}

void __61__STConversation__currentThirdPartyApplicationStateDidChange__block_invoke_cold_2(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "currentThirdPartyApplicationState");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v3, v4, "%{public}@ application state does not exist, preferring to keep state as %ld", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_3();
}

- (void)_shouldGeneralScreenTimeAllowHandles:(void *)a1 context:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "Error fetching contacts (%{private}@), preferring to allow all handles: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)_shouldGeneralScreenTimeAllowHandles:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Unknown communication policy: %lld, preferring to allow all handles", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_shouldWhileLimitedAllowHandles:(void *)a1 context:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "Error fetching whitelisted contacts (%{private}@), preferring to allow all handles: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)_shouldWhileLimitedAllowHandles:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Unknown communication while limited policy: %lld, preferring to allow all handles", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_doesContainAtLeastOneContactInHandles:contactsByHandle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Error fetching Me Contact, preferring to allow Me Contact in groups: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_contactsByHandle:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "No CardDAV identifier found for user", v1, 2u);
}

- (void)_contactsByHandle:error:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_2_4(&dword_1D22E7000, v1, (uint64_t)v1, "Failed to fetch contacts container with identifier %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
