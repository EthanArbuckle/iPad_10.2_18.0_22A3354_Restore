@implementation TUConversationManager

- (TUConversationManager)init
{
  TUConversationManagerXPCClient *v3;
  void *v4;
  TUConversationManager *v5;

  v3 = objc_alloc_init(TUConversationManagerXPCClient);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUConversationManager initWithDataSource:notificationCenter:](self, "initWithDataSource:notificationCenter:", v3, v4);

  return v5;
}

- (TUConversationManager)initWithDataSource:(id)a3 notificationCenter:(id)a4
{
  id v7;
  id v8;
  TUConversationManager *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMapTable *delegateToQueue;
  uint64_t v14;
  NSMutableSet *conversationsNotBackedByGroupSessions;
  uint64_t v16;
  NSMutableSet *callsNotBackedByGroupSessionsPendingUpgrade;
  _BOOL4 v18;
  NSObject *v19;
  _BOOL4 v20;
  TUCollaborationManager *v21;
  TUCollaborationHighlightProvider *v22;
  uint64_t v23;
  TUCollaborationManager *collaborationManager;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  objc_super v41;
  _BYTE v42[128];
  _QWORD v43[10];

  v43[8] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)TUConversationManager;
  v9 = -[TUConversationManager init](&v41, sel_init);
  if (v9)
  {
    v35 = v7;
    v10 = dispatch_queue_create("com.apple.telephonyutilities.conversationmanager", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_dataSource, a3);
    -[TUConversationManagerDataSource setDelegate:](v9->_dataSource, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_notificationCenter, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v9->_delegateToQueue;
    v9->_delegateToQueue = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    conversationsNotBackedByGroupSessions = v9->_conversationsNotBackedByGroupSessions;
    v9->_conversationsNotBackedByGroupSessions = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    callsNotBackedByGroupSessionsPendingUpgrade = v9->_callsNotBackedByGroupSessionsPendingUpgrade;
    v9->_callsNotBackedByGroupSessionsPendingUpgrade = (NSMutableSet *)v16;

    v18 = -[TUConversationManager currentProcessCanAccessCollaborations](v9, "currentProcessCanAccessCollaborations");
    TUDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "Creating collaboration manager for current process", buf, 2u);
      }

      v21 = [TUCollaborationManager alloc];
      v22 = objc_alloc_init(TUCollaborationHighlightProvider);
      v23 = -[TUCollaborationManager initWithCollaborationProvider:](v21, "initWithCollaborationProvider:", v22);
      collaborationManager = v9->_collaborationManager;
      v9->_collaborationManager = (TUCollaborationManager *)v23;

      -[TUConversationManager collaborationManager](v9, "collaborationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDelegate:", v9);

      -[TUConversationManager collaborationManager](v9, "collaborationManager");
      v19 = objc_claimAutoreleasedReturnValue();
      -[TUConversationManager queue](v9, "queue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUConversationManager addDelegate:queue:](v9, "addDelegate:queue:", v19, v26);

    }
    else if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "Current process is not entitled to access collaborations on the call- not initializing the collaboration manager", buf, 2u);
    }

    v43[0] = CFSTR("TUCallCenterCallStatusChangedNotification");
    v43[1] = CFSTR("TUCallCenterVideoCallStatusChangedNotification");
    v43[2] = CFSTR("TUCallVideoStreamTokenChangedNotification");
    v43[3] = CFSTR("TUCallProviderContextChangedNotification");
    v43[4] = CFSTR("TUCallConversationChangedNotification");
    v43[5] = CFSTR("TUCallCenterCallStartedConnectingNotification");
    v43[6] = CFSTR("TUCallCenterCallConnectedNotification");
    v43[7] = CFSTR("TUCallDowngradedToAudioNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 8);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[TUConversationManager notificationCenter](v9, "notificationCenter");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObserver:selector:name:object:", v9, sel_callPropertiesChanged_, v32, 0);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v29);
    }

    v7 = v35;
  }

  return v9;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)currentProcessCanAccessCollaborations
{
  if (currentProcessCanAccessCollaborations_onceToken != -1)
    dispatch_once(&currentProcessCanAccessCollaborations_onceToken, &__block_literal_global_274);
  return currentProcessCanAccessCollaborations_isCurrentProcessEntitled;
}

- (NSSet)activeConversations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[TUConversationManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationsByGroupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationManager conversationsNotBackedByGroupSessions](self, "conversationsNotBackedByGroupSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v9;
}

- (TUConversationManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableSet)conversationsNotBackedByGroupSessions
{
  return self->_conversationsNotBackedByGroupSessions;
}

+ (BOOL)supportsConversations
{
  void *v2;
  int v3;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "multiwaySupported"))
    v3 = objc_msgSend(v2, "isGreenTea") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

void __43__TUConversationManager_addDelegate_queue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void)refreshActiveConversations
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Asked to refreshActiveConversations", v5, 2u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshActiveConversations");

}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to retrieve all active links", v9, 2u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getActiveLinksWithCreatedOnly:completionHandler:", v4, v6);

}

uint64_t __62__TUConversationManager_currentProcessCanAccessCollaborations__block_invoke()
{
  uint64_t result;

  result = TUCurrentProcessHasEntitlementCapability(CFSTR("access-collaboration"));
  currentProcessCanAccessCollaborations_isCurrentProcessEntitled = result;
  return result;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TUConversationManager_addDelegate_queue___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerWithCompletionHandler:", v4);

}

- (TUConversationManager)initWithDataSource:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  TUConversationManager *v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TUConversationManager initWithDataSource:notificationCenter:](self, "initWithDataSource:notificationCenter:", v5, v6);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[TUConversationManagerDataSource invalidate](self->_dataSource, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)TUConversationManager;
  -[TUConversationManager dealloc](&v4, sel_dealloc);
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUConversationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__TUConversationManager_removeDelegate___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__TUConversationManager_removeDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (NSSet)incomingPendingConversations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[TUConversationManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incomingPendingConversationsByGroupUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (NSSet)activatedConversationLinks
{
  void *v2;
  void *v3;

  -[TUConversationManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activatedConversationLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSDictionary)activityAuthorizedBundleIdentifiers
{
  void *v2;
  void *v3;

  -[TUConversationManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityAuthorizedBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)autoSharePlayEnabled
{
  void *v2;
  char v3;

  -[TUConversationManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autoSharePlayEnabled");

  return v3;
}

- (BOOL)isSharePlayAvailable
{
  void *v2;
  char v3;

  -[TUConversationManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharePlayAvailable");

  return v3;
}

- (BOOL)isScreenSharingAvailable
{
  void *v2;
  char v3;

  -[TUConversationManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenSharingAvailable");

  return v3;
}

- (id)activeConversationWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUConversationManager activeConversations](self, "activeConversations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)activeConversationWithGroupUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUConversationManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationsByGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[TUConversationManager conversationsNotBackedByGroupSessions](self, "conversationsNotBackedByGroupSessions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v7 = 0;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "groupUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v4);

          if (v15)
          {
            v16 = v13;

            v7 = v16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)activeConversationWithRemoteMembers:(id)a3 andLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[TUConversationManager activeConversations](self, "activeConversations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conversationWithRemoteMembers:andLink:fromConversations:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activeConversationWithRemoteMembers:(id)a3 andLink:(id)a4 matchingVideo:(BOOL)a5 backedByGroupSession:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_class();
  -[TUConversationManager activeConversations](self, "activeConversations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "conversationWithRemoteMembers:andLink:fromConversations:matchingVideo:backedByGroupSession:", v11, v10, v13, v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)activeConversationWithLinkForCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[TUConversationManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pseudonymsByCallUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueProxyIdentifierUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_opt_class();
    -[TUConversationManager activeConversations](self, "activeConversations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conversationWithPseudonym:fromConversations:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)pendingConversationWithLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUConversationManager activeConversations](self, "activeConversations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingConversationWithLink:fromConversations:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)conversationWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "conversationsWithRemoteMembers:andLink:fromConversations:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)conversationWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5 matchingVideo:(BOOL)a6 backedByGroupSession:(BOOL)a7
{
  int v7;
  int v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v7 = a7;
  v8 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend((id)objc_opt_class(), "conversationsWithRemoteMembers:andLink:fromConversations:", v11, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v19, "isVideo") == v8
          && objc_msgSend(v19, "isBackedByGroupSession") == v7)
        {
          v20 = v19;
          goto LABEL_12;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_12:

  return v20;
}

+ (id)conversationsWithRemoteMembers:(id)a3 andLink:(id)a4 fromConversations:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v16, "isRepresentedByRemoteMembers:andLink:", v7, v8, (_QWORD)v18))
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

+ (id)conversationWithPseudonym:(id)a3 fromConversations:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "link", (_QWORD)v17);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "link");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "pseudonym");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v5);

          if (v15)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

+ (id)pendingConversationWithLink:(id)a3 fromConversations:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "link");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEquivalentToConversationLink:", v5))
        {
          v14 = objc_msgSend(v12, "letMeInRequestState");

          if (!v14)
            continue;
          v13 = v9;
          v9 = v12;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v8)
        goto LABEL_14;
    }
  }
  v9 = 0;
LABEL_14:

  return v9;
}

+ (id)remoteMembersForCall:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  TUConversationMember *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "remoteParticipantHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "remoteParticipantHandles", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = -[TUConversationMember initWithHandle:nickname:]([TUConversationMember alloc], "initWithHandle:nickname:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), 0);
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)setShouldCreateConversationsForCallsNotBackedByGroupSessions:(BOOL)a3
{
  self->_shouldCreateConversationsForCallsNotBackedByGroupSessions = a3;
  -[TUConversationManager setNonSessionBackedConversationCreationMode:](self, "setNonSessionBackedConversationCreationMode:", a3);
}

- (TUConversationMediaController)mediaController
{
  TUConversationMediaController *mediaController;
  TUConversationMediaController *v4;
  void *v5;
  TUConversationMediaController *v6;
  TUConversationMediaController *v7;

  mediaController = self->_mediaController;
  if (!mediaController)
  {
    v4 = [TUConversationMediaController alloc];
    -[TUConversationManager dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TUConversationMediaController initWithConversationDataSource:](v4, "initWithConversationDataSource:", v5);
    v7 = self->_mediaController;
    self->_mediaController = v6;

    mediaController = self->_mediaController;
  }
  return mediaController;
}

- (TUConversationReactionsController)reactionsController
{
  TUConversationReactionsController *reactionsController;
  TUConversationReactionsController *v4;
  void *v5;
  TUConversationReactionsController *v6;
  TUConversationReactionsController *v7;

  reactionsController = self->_reactionsController;
  if (!reactionsController)
  {
    v4 = [TUConversationReactionsController alloc];
    -[TUConversationManager dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TUConversationReactionsController initWithConversationDataSource:](v4, "initWithConversationDataSource:", v5);
    v7 = self->_reactionsController;
    self->_reactionsController = v6;

    reactionsController = self->_reactionsController;
  }
  return reactionsController;
}

- (TUScreenSharingRemoteController)screenSharingRemoteController
{
  return 0;
}

- (void)addRemoteMembers:(id)a3 toConversation:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TUConversationManager addRemoteMembers:otherInvitedHandles:toConversation:](self, "addRemoteMembers:otherInvitedHandles:toConversation:", v8, v9, v7);

}

- (void)updateMessagesGroupName:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to set new messages group name: %@ on conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateMessagesGroupName:onConversation:", v6, v7);

}

- (void)setGridDisplayMode:(unint64_t)a3 conversation:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = a3;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set grid display mode to: %lu on conversation: %@", (uint8_t *)&v9, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGridDisplayMode:conversation:", a3, v6);

}

- (void)conversationUpdateMessagesGroupPhoto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to update messages group photo on conversation: %@", (uint8_t *)&v7, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationUpdateMessagesGroupPhoto:", v4);

}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Asked to add remote members: %@ otherInvitedHandles: %@ to conversation: %@", (uint8_t *)&v13, 0x20u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addRemoteMembers:otherInvitedHandles:toConversation:", v8, v9, v10);

}

- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to prepare conversation with UUID: %@ with hand off context: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareConversationWithUUID:withHandoffContext:", v6, v7);

}

- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set handed off: %d on conversation with UUID: %@", (uint8_t *)v9, 0x12u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSharePlayHandedOff:onConversationWithUUID:", v4, v6);

}

- (void)createActivitySession:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to add activity: %@ to conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createActivitySession:onConversation:", v6, v7);

}

- (void)leaveActivitySession:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to leave activitySession: %@ to conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leaveActivitySession:onConversation:", v6, v7);

}

- (void)endActivitySession:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to end activitySession: %@ to conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endActivitySession:onConversation:", v6, v7);

}

- (void)presentDismissalAlertForActivitySession:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to present dismissal alert for activitySession: %@ on conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentDismissalAlertForActivitySession:onConversation:", v6, v7);

}

- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set activity authorization to: %d for bundle identifier %@", (uint8_t *)v9, 0x12u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActivityAuthorization:forBundleIdentifier:", v4, v6);

}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Client request to set auto expanse enabled to %@", (uint8_t *)&v8, 0xCu);

  }
  -[TUConversationManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoSharePlayEnabled:", v3);

}

- (void)joinConversationWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "joinConversationWithRequest %@", (uint8_t *)&v7, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "joinConversationWithRequest:", v4);

}

- (void)leaveConversationWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "leaveConversationWithUUID %@", (uint8_t *)&v7, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leaveConversationWithUUID:", v4);

}

- (void)launchApplicationForActivitySession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to launch application for activitySession %@", (uint8_t *)&v11, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "launchApplicationForActivitySessionUUID:authorizedExternally:forceBackground:completionHandler:", v10, 0, 0, v7);

}

- (void)launchApplicationForActivitySession:(id)a3 authorizedExternally:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v6 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Asked to launch application for activitySession %@ and authorized externally %@", (uint8_t *)&v14, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "launchApplicationForActivitySessionUUID:authorizedExternally:forceBackground:completionHandler:", v13, v6, 0, v9);

}

- (void)launchApplicationForActivitySessionUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to launch application for activitySession UUID %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "launchApplicationForActivitySessionUUID:authorizedExternally:forceBackground:completionHandler:", v6, 0, 0, v7);

}

- (void)launchApplicationForActivitySessionUUID:(id)a3 forceBackground:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Asked to launch application for activitySession UUID %@ and override to background %@", (uint8_t *)&v13, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "launchApplicationForActivitySessionUUID:authorizedExternally:forceBackground:completionHandler:", v8, 0, v6, v9);

}

- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversation:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Notified of airplay state: %@ for activity session %@", (uint8_t *)&v14, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setUsingAirplay:onActivitySession:onConversationWithUUID:", v6, v8, v13);
}

- (void)buzzMember:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to buzz member: %@ conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buzzMember:conversation:", v6, v7);

}

- (void)requestScreenShareFromMember:(id)a3 conversation:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUConversationManager.m"), 482, CFSTR("requestScreenShareFromMembers is deprecated and should not be used"));

}

- (void)kickMember:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to kick member: %@ conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "kickMember:conversation:", v6, v7);

}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversation:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set downlink muted to: (%d) for remote participants in conversation: %@", (uint8_t *)v9, 0x12u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDownlinkMuted:forRemoteParticipantsInConversation:", v4, v6);

}

- (void)addScreenSharingType:(unint64_t)a3 forConversation:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = a3;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to set screen sharing type to: (%ld) for conversation: %@", (uint8_t *)&v9, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addScreenSharingType:forConversation:", a3, v6);

}

- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to get the latest remote screen share attributes", v7, 2u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getLatestRemoteScreenShareAttributesWithCompletionHandler:", v4);

}

- (void)addCollaborationDictionary:(id)a3 forConversation:(id)a4 fromMe:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  __CFString *v15;
  const __CFString *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ci"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ru"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
      v14 = v11 == 0;
    else
      v14 = 1;
    if (v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[__CFString UUID](v9, "UUID");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v19 = 138413058;
        v20 = v8;
        v21 = 2112;
        v22 = v15;
        v23 = 2112;
        v24 = CFSTR("ci");
        v25 = 2112;
        v26 = CFSTR("ru");
        _os_log_error_impl(&dword_19A50D000, v13, OS_LOG_TYPE_ERROR, "Cannot add collaboration dictionary %@ to conversation with UUID %@ because it is missing required keys %@ and/or %@", (uint8_t *)&v19, 0x2Au);

      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = CFSTR("NO");
        v19 = 138412802;
        v20 = v8;
        v21 = 2112;
        if (v5)
          v17 = CFSTR("YES");
        v22 = v17;
        v23 = 2112;
        v24 = v9;
        _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "Asked to add collaboration dictionary %@ (from me %@) to conversation: %@", (uint8_t *)&v19, 0x20u);
      }

      -[TUConversationManager dataSource](self, "dataSource");
      v13 = objc_claimAutoreleasedReturnValue();
      -[__CFString UUID](v9, "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addCollaborationDictionary:forConversationWithUUID:fromMe:](v13, "addCollaborationDictionary:forConversationWithUUID:fromMe:", v8, v18, v5);

    }
  }
  else
  {
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TUConversationManager addCollaborationDictionary:forConversation:fromMe:].cold.1(v9, v10);
  }

}

- (id)ckBundleIDForCollaborationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TUConversationManager collaborationManager](self, "collaborationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collaborationProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ckBundleIDForCollaborationIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addCollaborationIdentifier:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Asked to set collaboration identifier: %@ for conversation: %@", (uint8_t *)&v15, 0x16u);
    }

    -[TUConversationManager collaborationManager](self, "collaborationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collaborationProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collaborationHighlightForIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        v15 = 138412546;
        v16 = v6;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Found collaboration -Adding collaboration identifier: %@ for conversation: %@", (uint8_t *)&v15, 0x16u);
      }

      -[TUConversationManager addCollaboration:forConversation:](self, "addCollaboration:forConversation:", v9, v7);
    }
    else
    {
      if (v13)
      {
        v15 = 138412546;
        v16 = v6;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Not adding collaboration identifier: %@ to conversation: %@, could not find corresponding collaboration. Adding to pending collaborations", (uint8_t *)&v15, 0x16u);
      }

      -[TUConversationManager collaborationManager](self, "collaborationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "queueCollaborationIdentifierForCollaboration:toConversation:", v6, v7);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[TUConversationManager addCollaborationIdentifier:forConversation:].cold.1(v7, v9);
  }

}

- (void)addCollaboration:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "collaborationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "collaborationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = v11;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Asked to add collaboration: %@ for conversation: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_msgSend(v6, "attributions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v6, "attributions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "collaborationMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ckAppBundleIDs");
      v10 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    -[TUConversationManager dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collaborationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addCollaborationIdentifier:collaborationURL:cloudKitAppBundleIDs:forConversationUUID:", v18, v20, v10, v21);

  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[TUConversationManager addCollaboration:forConversation:].cold.1((uint64_t)v6, v7);
  }

}

- (void)startTrackingCollaboration:(id)a3 forConversation:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "collaborationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v12;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Asked to set collaboration identifier: %@ for conversation: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_msgSend(v8, "attributions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v8, "attributions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collaborationMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ckAppBundleIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  -[TUConversationManager dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collaborationIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "description");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startTrackingCollaborationWithIdentifier:collaborationURL:cloudKitAppBundleIDs:forConversationUUID:completionHandler:", v20, v22, v18, v23, v10);

}

- (void)removeCollaborationIdentifier:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Asked to remove collaboration identifier: %@ for conversation: %@", (uint8_t *)&v11, 0x16u);
    }

    -[TUConversationManager dataSource](self, "dataSource");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeCollaborationIdentifier:forConversationUUID:](v9, "removeCollaborationIdentifier:forConversationUUID:", v6, v10);

  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[TUConversationManager removeCollaborationIdentifier:forConversation:].cold.1(v7, v9);
  }

}

- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Checking disclosure of collaboration initiator %@ for conversation UUID %@", (uint8_t *)&v13, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getNeedsDisclosureOfCollaborationInitiator:forConversationUUID:completionHandler:", v8, v9, v10);

}

- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Adding disclosed collaboration initiator %@ to conversation UUID %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDisclosedCollaborationInitiator:toConversationUUID:", v6, v7);

}

- (void)updateURLWithDugongTokenIfNeeded:(id)a3 collaboration:(id)a4 handle:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD *v23;
  void (*v24)(id, uint64_t, id, _QWORD *);
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  _BYTE buf[24];
  void *v38;
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "attributions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "Asked to update collaboration URL %@ with Dugong token for handle %@, if needed", buf, 0x16u);
    }

    -[TUConversationManager queue](self, "queue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __90__TUConversationManager_updateURLWithDugongTokenIfNeeded_collaboration_handle_completion___block_invoke;
    v28[3] = &unk_1E38A3848;
    v29 = v16;
    v32 = v13;
    v30 = v10;
    v31 = v12;
    v21 = v29;
    v22 = v19;
    v23 = v28;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v24 = (void (*)(id, uint64_t, id, _QWORD *))getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_ptr;
    v36 = getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_ptr;
    if (!getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_ptr)
    {
      *(_QWORD *)buf = v20;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_block_invoke;
      v38 = &unk_1E38A1710;
      v39 = &v33;
      __getIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOSSymbolLoc_block_invoke((uint64_t)buf);
      v24 = (void (*)(id, uint64_t, id, _QWORD *))v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (!v24)
      -[TUConversationManager updateURLWithDugongTokenIfNeeded:collaboration:handle:completion:].cold.1();
    v24(v21, 33, v22, v23);

  }
  else
  {
    if (v18)
    {
      objc_msgSend(v11, "attributions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uniqueIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v27;
      _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "Returning collaboration URL without Dugong token because no messageGUID was found in collaboration's attribution: %@", buf, 0xCu);

    }
    (*((void (**)(id, id))v13 + 2))(v13, v10);
  }

}

void __90__TUConversationManager_updateURLWithDugongTokenIfNeeded_collaboration_handle_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138412546;
    v39 = v3;
    v40 = 2112;
    v41 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Retrieved messages for queried GUID %@ to populate Dugong tokens: %@", buf, 0x16u);
  }

  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "richLinkMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "specialization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specialization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v9, "encodedTokens");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = v10;
          objc_msgSend(v10, "objectForKey:", a1[6]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1[5], 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_alloc_init(MEMORY[0x1E0CB3998]);
            objc_msgSend(v13, "scheme");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setScheme:", v15);

            objc_msgSend(v13, "host");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setHost:", v16);

            objc_msgSend(v13, "path");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setPath:", v17);

            v36 = v13;
            objc_msgSend(v13, "fragment");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setFragment:", v18);

            objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v19, "mutableCopy");

            objc_msgSend(v20, "removeCharactersInString:", CFSTR("+=/"));
            objc_msgSend(CFSTR("token"), "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
            v21 = objc_claimAutoreleasedReturnValue();
            v37 = v12;
            objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "base64EncodedStringWithOptions:", 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)v21;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), v21, v32);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setQuery:", v22);
            objc_msgSend(v14, "URL");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            TUDefaultLog();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v23)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v39 = v23;
                _os_log_impl(&dword_19A50D000, v25, OS_LOG_TYPE_DEFAULT, "Sucessfully amended collaboration URL with Dugong token %@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              __90__TUConversationManager_updateURLWithDugongTokenIfNeeded_collaboration_handle_completion___block_invoke_cold_1();
            }

            (*(void (**)(void))(a1[7] + 16))();
            v12 = v37;
          }
          else
          {
            TUDefaultLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = (void *)a1[6];
              *(_DWORD *)buf = 138412290;
              v39 = v31;
              _os_log_impl(&dword_19A50D000, v30, OS_LOG_TYPE_DEFAULT, "Returning collaboration URL without Dugong token because could not lookup token for handle %@", buf, 0xCu);
            }

            (*(void (**)(void))(a1[7] + 16))();
          }

          goto LABEL_21;
        }
      }
      TUDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v9;
        v29 = "[WARN] Returning collaboration URL without Dugong token because encodedTokens was nil for specialization %@";
LABEL_19:
        _os_log_impl(&dword_19A50D000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
      }
    }
    else
    {
      TUDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v7;
        v29 = "[WARN] Returning collaboration URL without Dugong token because specialization was nil for the richLinkMetadata %@";
        goto LABEL_19;
      }
    }

    (*(void (**)(void))(a1[7] + 16))();
LABEL_21:

    goto LABEL_22;
  }
  TUDefaultLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v27;
    _os_log_impl(&dword_19A50D000, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Returning collaboration URL without Dugong token because richLinkMetadata was nil from the message %@", buf, 0xCu);

  }
  (*(void (**)(void))(a1[7] + 16))();
LABEL_22:

}

- (BOOL)openCollaborationWithIdentifier:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to open collaboration identifier: %@", buf, 0xCu);
  }

  -[TUConversationManager collaborationManager](self, "collaborationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collaborationProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collaborationHighlightForIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend(v11, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localMember");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "normalizedValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke;
    v18[3] = &unk_1E38A3898;
    objc_copyWeak(&v22, (id *)buf);
    v19 = v6;
    v20 = v7;
    v21 = v11;
    -[TUConversationManager updateURLWithDugongTokenIfNeeded:collaboration:handle:completion:](self, "updateURLWithDugongTokenIfNeeded:collaboration:handle:completion:", v12, v21, v15, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    TUDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TUConversationManager openCollaborationWithIdentifier:forConversation:].cold.1();

  }
  return v11 != 0;
}

void __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke(id *a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke_2;
  v4[3] = &unk_1E38A3870;
  objc_copyWeak(&v8, a1 + 7);
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  TUOpenURLWithCompletion(v3, v4);

  objc_destroyWeak(&v8);
}

void __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke_2_cold_1(a1);
    }
    else
    {
      objc_msgSend(WeakRetained, "dataSource");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject markCollaborationWithIdentifierOpened:forConversationUUID:](v7, "markCollaborationWithIdentifierOpened:forConversationUUID:", v8, v9);

    }
  }

}

- (void)generateLinkForConversation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to generate link for conversation: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generateLinkForConversation:completionHandler:", v6, v7);

}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 completionHandler:(id)a4
{
  -[TUConversationManager generateLinkWithInvitedMemberHandles:linkLifetimeScope:completionHandler:](self, "generateLinkWithInvitedMemberHandles:linkLifetimeScope:completionHandler:", a3, 0, a4);
}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Asked to generate link in advance of conversation with invited member handles: %@, linkLifetimeScope: %ld", buf, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke;
  v13[3] = &unk_1E38A38C0;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "generateLinkWithInvitedMemberHandles:linkLifetimeScope:completionHandler:", v8, a4, v13);

}

void __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke_cold_2();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_9:
    v8();
    goto LABEL_10;
  }
  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Link generation succeeded with link %@", (uint8_t *)&v13, 0xCu);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke_cold_1(v10);

  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.telephonyutilities.callservicesd"), 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

LABEL_10:
}

- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Asked to add invited member handles %@ to link %@", (uint8_t *)&v13, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addInvitedMemberHandles:toConversationLink:completionHandler:", v8, v9, v10);

}

- (void)invalidateLink:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Invalidate link: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateLink:deleteReason:completionHandler:", v6, 2, v7);

}

- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2048;
    v20 = a5;
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "Asked to renew link %@ to new expiration date %@ with reason %lu", (uint8_t *)&v15, 0x20u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renewLink:expirationDate:reason:completionHandler:", v10, v11, a5, v12);

}

- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to check validity for link: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "checkLinkValidity:completionHandler:", v6, v7);

}

- (void)getInactiveLinkWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to get an inactive link for vending as suggestion", v7, 2u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getInactiveLinkWithCompletionHandler:", v4);

}

- (void)activateLink:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to activate previously-vended link: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateLink:completionHandler:", v6, v7);

}

- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Asked to set a link name for link: %@", (uint8_t *)&v13, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLinkName:forConversationLink:completionHandler:", v10, v8, v9);

}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to manually schedule a sync for activated conversation links", v7, 2u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleConversationLinkCheckInInitial:", v3);

}

- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to get the link sync state", v9, 2u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "linkSyncStateIncludeLinks:WithCompletion:", v4, v6);

}

- (void)approvePendingMember:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to approve a pending member waiting to be let in: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "approvePendingMember:forConversation:", v6, v7);

}

- (void)rejectPendingMember:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to reject a pending member waiting to be let in: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rejectPendingMember:forConversation:", v6, v7);

}

- (void)setIgnoreLMIRequests:(BOOL)a3 forConversation:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("allow");
    if (v4)
      v8 = CFSTR("ignore");
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Asked to %@ all let me in requests for link: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIgnoreLetMeInRequests:forConversation:", v4, v6);

}

- (void)requestParticipantToShareScreen:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to generate screen share request with requested participant: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestParticipantToShareScreen:forConversation:", v6, v7);

}

- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to cancel screen share request: %@ for conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelOrDenyScreenShareRequest:forConversation:", v6, v7);

}

- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    v13 = 138412802;
    if (v6)
      v11 = CFSTR("YES");
    v14 = v11;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Asked to set screenEnabled %@ screenShareAttributes: %@ conversationWithUUID: %@", (uint8_t *)&v13, 0x20u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScreenEnabled:withScreenShareAttributes:forConversationWithUUID:", v6, v8, v9);

}

+ (BOOL)isAddPersonEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("gft-legacy-upgrade-enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

+ (unint64_t)maximumNumberOfInvitedMembers
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("qr-max-participants"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 32;

  return v4;
}

+ (BOOL)allowsVideo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__TUConversationManager_allowsVideo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowsVideo_onceToken != -1)
    dispatch_once(&allowsVideo_onceToken, block);
  return allowsVideo_allowsVideo;
}

uint64_t __36__TUConversationManager_allowsVideo__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "memorySize");
  allowsVideo_allowsVideo = result > 1610612736;
  return result;
}

+ (BOOL)allowsScreenSharing
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = screenCaptureCapabilities();
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (v2)
      v4 = CFSTR("YES");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "allowsScreenSharing: %@", (uint8_t *)&v6, 0xCu);
  }

  return v2 != 0;
}

+ (BOOL)allowsScreenSharingWithVideo
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = screenCaptureCapabilities();
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (v2 == 2)
      v4 = CFSTR("YES");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "allowsScreenSharingWithVideo: %@", (uint8_t *)&v6, 0xCu);
  }

  return v2 == 2;
}

+ (BOOL)allowsPortraitBlurWhenCaptionsEnabled
{
  int v2;
  uint64_t v3;
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = MGGetSInt32Answer();
  v3 = MGGetSInt64Answer();
  v4 = (v2 - 1) > 1
    || ((unint64_t)(v3 - 0x8000) > 0x30 || ((1 << v3) & 0x100810023000BLL) == 0)
    && ((unint64_t)(v3 - 35152) > 0x10 || ((1 << (v3 - 80)) & 0x10021) == 0)
    && (unint64_t)(v3 - 28672) >= 2;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "allowsPortraitBlurWhenCaptionsEnabled: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

+ (BOOL)supportsEffects
{
  void *v2;
  char v3;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsFunCam");

  return v3;
}

+ (int64_t)memorySize
{
  if (memorySize_onceToken != -1)
    dispatch_once(&memorySize_onceToken, &__block_literal_global_43);
  return memorySize_mem;
}

uint64_t __35__TUConversationManager_memorySize__block_invoke()
{
  size_t v1;
  int v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v2 = 0x1800000006;
  v1 = 8;
  return sysctl(v2, 2u, &memorySize_mem, &v1, 0, 0);
}

- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Fetching Messages group info for conversation: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getMessagesGroupDetailsForConversationUUID:completionHandler:", v6, v7);

}

- (void)setMessagesGroupProvider:(id)a3
{
  TUConversationMessagesGroupProviding **p_messagesGroupProvider;
  id v5;
  id WeakRetained;
  _BOOL4 v7;
  id v8;

  p_messagesGroupProvider = &self->_messagesGroupProvider;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_messagesGroupProvider);
  v7 = WeakRetained == 0;

  objc_storeWeak((id *)p_messagesGroupProvider, v5);
  if ((((v5 != 0) ^ v7) & 1) == 0)
  {
    -[TUConversationManager dataSource](self, "dataSource");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSupportsMessagesGroupProviding:", v5 != 0);

  }
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TUConversationManager dataSource](self, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalParticipantAudioVideoMode:forConversationUUID:", a3, v6);

}

- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TUConversationManager dataSource](self, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateLocalParticipantToAVLessWithPresentationMode:forConversationUUID:", a3, v6);

}

- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUConversationManager dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerMessagesGroupUUIDForConversationUUID:", v4);

}

- (void)conversationsChangedForDataSource:(id)a3 conversationsByGroupUUID:(id)a4 oldConversationsByGroupUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  TUConversationManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUConversationManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__TUConversationManager_conversationsChangedForDataSource_conversationsByGroupUUID_oldConversationsByGroupUUID___block_invoke;
  v15[3] = &unk_1E38A1B38;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __112__TUConversationManager_conversationsChangedForDataSource_conversationsByGroupUUID_oldConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(*(id *)(a1 + 40), "nonSessionBackedConversationCreationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "conversationsChangedForDataSource:oldConversationsByGroupUUID:newConversationsByGroupUUID:creationQueue:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, v2);
  else
    objc_msgSend(v3, "conversationsChangedFromOldConversationsByGroupUUID:newConversationsByGroupUUID:", *(_QWORD *)(a1 + 56), v4);

}

- (void)conversationsChangedForDataSource:(id)a3 oldConversationsByGroupUUID:(id)a4 newConversationsByGroupUUID:(id)a5 creationQueue:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  TUConversationManager *v16;

  v9 = a4;
  v10 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke;
  block[3] = &unk_1E38A19B8;
  v14 = v9;
  v15 = v10;
  v16 = self;
  v11 = v10;
  v12 = v9;
  dispatch_async((dispatch_queue_t)a6, block);

}

void __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[5];
  id v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v36 = (void *)objc_msgSend(a1[4], "mutableCopy");
  v2 = (void *)objc_msgSend(a1[5], "mutableCopy");
  objc_msgSend(a1[6], "callPendingUpgradeInConversationsWithGroupUUID:", a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v3;
  if (v3)
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend((id)v3, "uniqueProxyIdentifierUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "conversationsNotBackedByGroupSessions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationWithUUID:fromConversations:", v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "remoteMembersForCall:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "link");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v2, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversationWithRemoteMembers:andLink:fromConversations:matchingVideo:backedByGroupSession:", v9, v10, v13, objc_msgSend((id)v3, "isVideo"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    TUDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v14;
      v47 = 2112;
      v48 = v7;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Notified of new session-backed conversation %@ to replace non-session-backed conversation %@", buf, 0x16u);
    }

    LODWORD(v3) = v14 != 0;
    if (v7 && v14)
    {
      objc_msgSend(a1[6], "queue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke_116;
      block[3] = &unk_1E38A19B8;
      block[4] = a1[6];
      v7 = v7;
      v42 = v7;
      v34 = v14;
      v43 = v34;
      dispatch_async(v16, block);

      LODWORD(v3) = 1;
    }
    else
    {
      v34 = v14;
    }
  }
  else
  {
    v7 = 0;
    v34 = 0;
  }
  v35 = v2;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v33 = a1;
  objc_msgSend(a1[6], "conversationsNotBackedByGroupSessions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v22, "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v7;
        objc_msgSend(v7, "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "isEqual:", v25) & v3;

        if (v26 == 1)
        {
          v27 = (void *)objc_msgSend(v22, "copy");
          objc_msgSend(v34, "UUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setUUID:", v28);

          objc_msgSend(v34, "groupUUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setGroupUUID:", v29);

          objc_msgSend(v27, "groupUUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v27, v30);

        }
        else
        {
          objc_msgSend(v22, "groupUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v22, v31);

          objc_msgSend(v22, "groupUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v22, v27);
        }

        v7 = v24;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v19);
  }

  objc_msgSend(v33[6], "pruneConversationsPendingUpgradeInConversationsWithGroupUUID:", v33[5]);
  objc_msgSend(v33[6], "conversationsChangedFromOldConversationsByGroupUUID:newConversationsByGroupUUID:", v36, v35);

}

void __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke_116(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke_2;
        block[3] = &unk_1E38A1B38;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

uint64_t __129__TUConversationManager_conversationsChangedForDataSource_oldConversationsByGroupUUID_newConversationsByGroupUUID_creationQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:migratingFromConversation:toConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)conversationsChangedFromOldConversationsByGroupUUID:(id)a3 newConversationsByGroupUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  TUConversationManager *v14;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__TUConversationManager_conversationsChangedFromOldConversationsByGroupUUID_newConversationsByGroupUUID___block_invoke;
  block[3] = &unk_1E38A19B8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __105__TUConversationManager_conversationsChangedFromOldConversationsByGroupUUID_newConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  char v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  char v78;
  int v79;
  int v80;
  void *v81;
  void *v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t k;
  uint64_t v101;
  void *v102;
  NSObject *v103;
  uint64_t v104;
  void *v105;
  id obj;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  uint64_t v137;
  _QWORD block[6];
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v137 = a1;
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v181, 16);
  if (!v110)
  {
    v112 = 0;
    v136 = 0;
    goto LABEL_91;
  }
  v112 = 0;
  v136 = 0;
  v109 = *(_QWORD *)v176;
  do
  {
    for (i = 0; i != v110; ++i)
    {
      if (*(_QWORD *)v176 != v109)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * i);
      v6 = *(void **)(v137 + 32);
      objc_msgSend(v5, "groupUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v127, "addObject:", v5);
        objc_msgSend(v126, "addObject:", v5);
        objc_msgSend(v132, "addObject:", v5);
        objc_msgSend(v108, "addObject:", v5);
        objc_msgSend(v131, "addObject:", v5);
        objc_msgSend(v130, "addObject:", v5);
        objc_msgSend(v129, "addObject:", v5);
        objc_msgSend(v128, "addObject:", v5);
        objc_msgSend(v134, "addObject:", v5);
        objc_msgSend(v125, "addObject:", v5);
        objc_msgSend(v124, "addObject:", v5);
        objc_msgSend(v123, "addObject:", v5);
        objc_msgSend(v122, "addObject:", v5);
        objc_msgSend(v135, "addObject:", v5);
        if (objc_msgSend(v5, "state") != 4)
          objc_msgSend(v105, "addObject:", v5);
        objc_msgSend(v121, "addObject:", v5);
        objc_msgSend(v119, "addObject:", v5);
        objc_msgSend(v120, "addObject:", v5);
        objc_msgSend(v133, "addObject:", v5);
        goto LABEL_67;
      }
      v9 = objc_msgSend(v8, "state");
      if (v9 != objc_msgSend(v5, "state"))
        objc_msgSend(v127, "addObject:", v5);
      v10 = objc_msgSend(v8, "letMeInRequestState");
      if (v10 != objc_msgSend(v5, "letMeInRequestState"))
        objc_msgSend(v126, "addObject:", v5);
      v11 = objc_msgSend(v8, "isVideoEnabled");
      if (v11 != objc_msgSend(v5, "isVideoEnabled"))
        objc_msgSend(v132, "addObject:", v5);
      v12 = objc_msgSend(v8, "isScreenEnabled");
      if (v12 != objc_msgSend(v5, "isScreenEnabled"))
        objc_msgSend(v108, "addObject:", v5);
      objc_msgSend(v8, "remoteMembers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "remoteMembers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToSet:", v14);

      if ((v15 & 1) == 0)
        objc_msgSend(v131, "addObject:", v5);
      objc_msgSend(v8, "pendingMembers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pendingMembers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToSet:", v17);

      if ((v18 & 1) == 0)
        objc_msgSend(v130, "addObject:", v5);
      objc_msgSend(v8, "kickedMembers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "kickedMembers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToSet:", v20);

      if ((v21 & 1) == 0)
        objc_msgSend(v129, "addObject:", v5);
      objc_msgSend(v8, "otherInvitedHandles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "otherInvitedHandles");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToSet:", v23);

      if ((v24 & 1) == 0)
        objc_msgSend(v128, "addObject:", v5);
      objc_msgSend(v8, "activeRemoteParticipants");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeRemoteParticipants");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "isEqualToSet:", v26) & 1) == 0)
      {

LABEL_30:
        objc_msgSend(v134, "addObject:", v5);
        goto LABEL_31;
      }
      objc_msgSend(v8, "activeLightweightParticipants");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeLightweightParticipants");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToSet:", v28);

      if ((v29 & 1) == 0)
        goto LABEL_30;
LABEL_31:
      v30 = objc_msgSend(v8, "isOneToOneModeEnabled");
      if (v30 != objc_msgSend(v5, "isOneToOneModeEnabled"))
        objc_msgSend(v125, "addObject:", v5);
      v31 = objc_msgSend(v8, "avMode");
      if (v31 != objc_msgSend(v5, "avMode"))
        objc_msgSend(v124, "addObject:", v5);
      objc_msgSend(v8, "presentationContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentationContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if ((v34 & 1) == 0)
        objc_msgSend(v123, "addObject:", v5);
      v35 = objc_msgSend(v8, "resolvedAudioVideoMode");
      if (v35 != objc_msgSend(v5, "resolvedAudioVideoMode"))
        objc_msgSend(v122, "addObject:", v5);
      objc_msgSend(v8, "activitySessions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activitySessions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v36, "isEqualToSet:", v37) & 1) == 0)
      {

LABEL_43:
        objc_msgSend(v135, "addObject:", v5);
        goto LABEL_44;
      }
      objc_msgSend(v8, "stagedActivitySession");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stagedActivitySession");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = TUObjectsAreEqualOrNil((unint64_t)v38, (uint64_t)v39);

      if ((v40 & 1) == 0)
        goto LABEL_43;
LABEL_44:
      objc_msgSend(v8, "link");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "link");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v41, "isEquivalentToConversationLink:", v42) & 1) == 0)
      {

LABEL_48:
        objc_msgSend(v116, "addObject:", v5);
        goto LABEL_49;
      }
      objc_msgSend(v8, "link");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "linkName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "link");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "linkName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = TUStringsAreEqualOrNil((unint64_t)v44, (uint64_t)v46);

      if ((v47 & 1) == 0)
        goto LABEL_48;
LABEL_49:
      objc_msgSend(v8, "link");
      v48 = objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        v49 = (void *)v48;
        objc_msgSend(v5, "link");
        v50 = objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v51 = (void *)v50;
          objc_msgSend(v8, "link");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "invitedMemberHandles");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "link");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "invitedMemberHandles");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v53, "isEqualToSet:", v55);

          if ((v56 & 1) == 0)
            objc_msgSend(v111, "addObject:", v5);
        }
        else
        {

        }
      }
      objc_msgSend(v8, "UUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v57, "isEqual:", v58);

      if (v59)
        objc_msgSend(v113, "removeObject:", v8);
      objc_msgSend(v8, "messagesGroupName");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messagesGroupName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqualToString:", v61);

      if ((v62 & 1) == 0)
        objc_msgSend(v121, "addObject:", v5);
      objc_msgSend(v8, "messagesGroupUUID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messagesGroupUUID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = TUObjectsAreEqualOrNil((unint64_t)v63, (uint64_t)v64);

      if ((v65 & 1) == 0)
        objc_msgSend(v119, "addObject:", v5);
      v66 = objc_msgSend(v8, "ignoreLMIRequests");
      if (v66 != objc_msgSend(v5, "ignoreLMIRequests"))
        objc_msgSend(v120, "addObject:", v5);
      objc_msgSend(v8, "rejectedMembers");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rejectedMembers");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v67 != v68)
        objc_msgSend(v133, "addObject:", v5);
      objc_msgSend(v5, "handoffEligibility");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {

      }
      else
      {
        objc_msgSend(v8, "handoffEligibility");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v70)
          goto LABEL_75;
      }
LABEL_67:
      objc_msgSend(v5, "handoffEligibility");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v71 || v136)
      {
        if (!v8)
        {
LABEL_85:
          objc_msgSend(v118, "addObject:", v5);
          v86 = v117;
LABEL_86:
          objc_msgSend(v86, "addObject:", v5);
          goto LABEL_87;
        }
        objc_msgSend(v8, "handoffEligibility");
        v72 = objc_claimAutoreleasedReturnValue();
        if (v72)
        {
          v73 = (void *)v72;
          objc_msgSend(v5, "handoffEligibility");
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v74)
          {
            v75 = v5;

            v112 = v75;
          }
        }
      }
      else
      {
        v136 = v5;
        if (!v8)
          goto LABEL_85;
      }
LABEL_75:
      objc_msgSend(v8, "systemActivitySessions");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemActivitySessions");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v76, "isEqualToSet:", v77);

      if ((v78 & 1) == 0)
        objc_msgSend(v118, "addObject:", v5);
      v79 = objc_msgSend(v8, "isCameraMixedWithScreen");
      if (v79 != objc_msgSend(v5, "isCameraMixedWithScreen"))
        objc_msgSend(v117, "addObject:", v5);
      v80 = objc_msgSend(v8, "isScreening");
      if (v80 != objc_msgSend(v5, "isScreening"))
        objc_msgSend(v115, "addObject:", v5);
      objc_msgSend(v8, "screenSharingRequests");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "screenSharingRequests");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v81, "isEqualToSet:", v82);

      if ((v83 & 1) == 0)
        objc_msgSend(v114, "addObject:", v5);
      v84 = objc_msgSend(v8, "screenSharingType");
      v85 = objc_msgSend(v5, "screenSharingType");
      v86 = v107;
      if (v84 != v85)
        goto LABEL_86;
LABEL_87:

    }
    v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v181, 16);
  }
  while (v110);
LABEL_91:

  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v87 = v105;
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v171, v180, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v172;
    do
    {
      for (j = 0; j != v89; ++j)
      {
        if (*(_QWORD *)v172 != v90)
          objc_enumerationMutation(v87);
        v92 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * j);
        objc_msgSend(v92, "highlightIdentifiers");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "count");

        if (v94)
        {
          objc_msgSend(*(id *)(v137 + 48), "collaborationManager");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "associateCollaborationWithNewConversation:", v92);

        }
      }
      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v171, v180, 16);
    }
    while (v89);
  }

  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  objc_msgSend(*(id *)(v137 + 48), "delegateToQueue");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v167, v179, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v168;
    do
    {
      for (k = 0; k != v98; ++k)
      {
        if (*(_QWORD *)v168 != v99)
          objc_enumerationMutation(v96);
        v101 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * k);
        objc_msgSend(*(id *)(v137 + 48), "delegateToQueue");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "objectForKey:", v101);
        v103 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __105__TUConversationManager_conversationsChangedFromOldConversationsByGroupUUID_newConversationsByGroupUUID___block_invoke_2;
        block[3] = &unk_1E38A38E8;
        v104 = *(_QWORD *)(v137 + 48);
        block[4] = v101;
        block[5] = v104;
        v139 = v121;
        v140 = *(id *)(v137 + 32);
        v141 = v119;
        v142 = v127;
        v143 = v126;
        v144 = v132;
        v145 = v131;
        v146 = v130;
        v147 = v129;
        v148 = v128;
        v149 = v134;
        v150 = v125;
        v151 = v124;
        v152 = v123;
        v153 = v122;
        v154 = v135;
        v155 = v116;
        v156 = v111;
        v157 = v113;
        v158 = v87;
        v159 = v120;
        v160 = v133;
        v161 = v136;
        v162 = v112;
        v163 = v118;
        v164 = v117;
        v165 = v115;
        v166 = v114;
        dispatch_async(v103, block);

      }
      v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v167, v179, 16);
    }
    while (v98);
  }

}

void __105__TUConversationManager_conversationsChangedFromOldConversationsByGroupUUID_newConversationsByGroupUUID___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t jj;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t kk;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t mm;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t nn;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i1;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i2;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t i3;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t i4;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t i5;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t i6;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  char v142;
  char v143;
  char v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t i7;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t i8;
  id v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t i9;
  id v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t i10;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t i11;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t i12;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t i13;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t i14;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t i15;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  _BYTE v310[128];
  _BYTE v311[128];
  _BYTE v312[128];
  _BYTE v313[128];
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  _BYTE v317[128];
  _BYTE v318[128];
  _BYTE v319[128];
  _BYTE v320[128];
  _BYTE v321[128];
  _BYTE v322[128];
  _BYTE v323[128];
  _BYTE v324[128];
  _BYTE v325[128];
  _BYTE v326[128];
  _BYTE v327[128];
  _BYTE v328[128];
  _BYTE v329[128];
  _BYTE v330[128];
  _BYTE v331[128];
  _BYTE v332[128];
  _BYTE v333[128];
  _BYTE v334[128];
  uint64_t v335;

  v335 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "conversationsChangedForConversationManager:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v309 = 0u;
    v308 = 0u;
    v307 = 0u;
    v306 = 0u;
    v2 = *(id *)(a1 + 48);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v306, v334, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v307;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v307 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v306 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversationUpdatedMessagesGroupName:", *(_QWORD *)(a1 + 40), v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v8 = *(void **)(a1 + 56);
            objc_msgSend(v7, "groupUUID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversationUpdatedMessagesGroupName:fromOldConversation:", *(_QWORD *)(a1 + 40), v7, v10);
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v306, v334, 16);
      }
      while (v4);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v305 = 0u;
    v304 = 0u;
    v303 = 0u;
    v302 = 0u;
    v11 = *(id *)(a1 + 64);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v302, v333, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v303;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v303 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversationUpdatedMessagesGroupUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v302 + 1) + 8 * j));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v302, v333, 16);
      }
      while (v13);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v301 = 0u;
    v300 = 0u;
    v299 = 0u;
    v298 = 0u;
    v16 = *(id *)(a1 + 72);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v298, v332, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v299;
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v299 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v298 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:stateChangedForConversation:", *(_QWORD *)(a1 + 40), v21);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v22 = *(void **)(a1 + 56);
            objc_msgSend(v21, "groupUUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:stateChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v21, v24);
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v298, v332, 16);
      }
      while (v18);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v297 = 0u;
    v296 = 0u;
    v295 = 0u;
    v294 = 0u;
    v25 = *(id *)(a1 + 80);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v294, v331, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v295;
      do
      {
        for (m = 0; m != v27; ++m)
        {
          if (*(_QWORD *)v295 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v294 + 1) + 8 * m);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:letMeInRequestStateChangedForConversation:", *(_QWORD *)(a1 + 40), v30);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v31 = *(void **)(a1 + 56);
            objc_msgSend(v30, "groupUUID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:letMeInRequestStateChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v30, v33);
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v294, v331, 16);
      }
      while (v27);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v293 = 0u;
    v292 = 0u;
    v291 = 0u;
    v290 = 0u;
    v34 = *(id *)(a1 + 88);
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v290, v330, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v291;
      do
      {
        for (n = 0; n != v36; ++n)
        {
          if (*(_QWORD *)v291 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v290 + 1) + 8 * n);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:localVideoToggledForConversation:", *(_QWORD *)(a1 + 40), v39);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v40 = *(void **)(a1 + 56);
            objc_msgSend(v39, "groupUUID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:localVideoToggledForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v39, v42);
          }
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v290, v330, 16);
      }
      while (v36);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v289 = 0u;
    v288 = 0u;
    v287 = 0u;
    v286 = 0u;
    v43 = *(id *)(a1 + 96);
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v286, v329, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v287;
      do
      {
        for (ii = 0; ii != v45; ++ii)
        {
          if (*(_QWORD *)v287 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v286 + 1) + 8 * ii);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:remoteMembersChangedForConversation:", *(_QWORD *)(a1 + 40), v48);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v49 = *(void **)(a1 + 56);
            objc_msgSend(v48, "groupUUID");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectForKeyedSubscript:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:remoteMembersChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v48, v51);
          }
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v286, v329, 16);
      }
      while (v45);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v285 = 0u;
    v284 = 0u;
    v283 = 0u;
    v282 = 0u;
    v52 = *(id *)(a1 + 104);
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v282, v328, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v283;
      do
      {
        for (jj = 0; jj != v54; ++jj)
        {
          if (*(_QWORD *)v283 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v282 + 1) + 8 * jj);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:pendingMembersChangedForConversation:", *(_QWORD *)(a1 + 40), v57);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v58 = *(void **)(a1 + 56);
            objc_msgSend(v57, "groupUUID");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKeyedSubscript:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:pendingMembersChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v57, v60);
          }
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v282, v328, 16);
      }
      while (v54);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v281 = 0u;
    v280 = 0u;
    v279 = 0u;
    v278 = 0u;
    v61 = *(id *)(a1 + 112);
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v278, v327, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v279;
      do
      {
        for (kk = 0; kk != v63; ++kk)
        {
          if (*(_QWORD *)v279 != v64)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v278 + 1) + 8 * kk);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:kickedMembersChangedForConversation:", *(_QWORD *)(a1 + 40), v66);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v67 = *(void **)(a1 + 56);
            objc_msgSend(v66, "groupUUID");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "objectForKeyedSubscript:", v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:kickedMembersChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v66, v69);
          }
        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v278, v327, 16);
      }
      while (v63);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v277 = 0u;
    v276 = 0u;
    v275 = 0u;
    v274 = 0u;
    v70 = *(id *)(a1 + 120);
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v274, v326, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v275;
      do
      {
        for (mm = 0; mm != v72; ++mm)
        {
          if (*(_QWORD *)v275 != v73)
            objc_enumerationMutation(v70);
          v75 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * mm);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:otherInvitedHandlesChangedForConversation:", *(_QWORD *)(a1 + 40), v75);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v76 = *(void **)(a1 + 56);
            objc_msgSend(v75, "groupUUID");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "objectForKeyedSubscript:", v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:otherInvitedHandlesChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v75, v78);
          }
        }
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v274, v326, 16);
      }
      while (v72);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v272 = 0u;
    v273 = 0u;
    v270 = 0u;
    v271 = 0u;
    v79 = *(id *)(a1 + 128);
    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v270, v325, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v271;
      do
      {
        for (nn = 0; nn != v81; ++nn)
        {
          if (*(_QWORD *)v271 != v82)
            objc_enumerationMutation(v79);
          v84 = *(void **)(*((_QWORD *)&v270 + 1) + 8 * nn);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:activeRemoteParticipantsChangedForConversation:", *(_QWORD *)(a1 + 40), v84);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v85 = *(void **)(a1 + 56);
            objc_msgSend(v84, "groupUUID");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "objectForKeyedSubscript:", v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:activeRemoteParticipantsChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v84, v87);
          }
        }
        v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v270, v325, 16);
      }
      while (v81);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v268 = 0u;
    v269 = 0u;
    v266 = 0u;
    v267 = 0u;
    v88 = *(id *)(a1 + 136);
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v266, v324, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v267;
      do
      {
        for (i1 = 0; i1 != v90; ++i1)
        {
          if (*(_QWORD *)v267 != v91)
            objc_enumerationMutation(v88);
          v93 = *(void **)(*((_QWORD *)&v266 + 1) + 8 * i1);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:oneToOneModeChangedForConversation:", *(_QWORD *)(a1 + 40), v93);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v94 = *(void **)(a1 + 56);
            objc_msgSend(v93, "groupUUID");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "objectForKeyedSubscript:", v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:oneToOneModeChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v93, v96);
          }
        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v266, v324, 16);
      }
      while (v90);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v264 = 0u;
    v265 = 0u;
    v262 = 0u;
    v263 = 0u;
    v97 = *(id *)(a1 + 144);
    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v262, v323, 16);
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v263;
      do
      {
        for (i2 = 0; i2 != v99; ++i2)
        {
          if (*(_QWORD *)v263 != v100)
            objc_enumerationMutation(v97);
          v102 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * i2);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:avModeChangedForConversation:", *(_QWORD *)(a1 + 40), v102);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v103 = *(void **)(a1 + 56);
            objc_msgSend(v102, "groupUUID");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "objectForKeyedSubscript:", v104);
            v105 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:avModeChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v102, v105);
          }
        }
        v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v262, v323, 16);
      }
      while (v99);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v260 = 0u;
    v261 = 0u;
    v258 = 0u;
    v259 = 0u;
    v106 = *(id *)(a1 + 152);
    v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v258, v322, 16);
    if (v107)
    {
      v108 = v107;
      v109 = *(_QWORD *)v259;
      do
      {
        for (i3 = 0; i3 != v108; ++i3)
        {
          if (*(_QWORD *)v259 != v109)
            objc_enumerationMutation(v106);
          v111 = *(void **)(*((_QWORD *)&v258 + 1) + 8 * i3);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:presentationContextChangedForConversation:", *(_QWORD *)(a1 + 40), v111);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v112 = *(void **)(a1 + 56);
            objc_msgSend(v111, "groupUUID");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "objectForKeyedSubscript:", v113);
            v114 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:presentationContextChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v111, v114);
          }
        }
        v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v258, v322, 16);
      }
      while (v108);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v256 = 0u;
    v257 = 0u;
    v254 = 0u;
    v255 = 0u;
    v115 = *(id *)(a1 + 160);
    v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v254, v321, 16);
    if (v116)
    {
      v117 = v116;
      v118 = *(_QWORD *)v255;
      do
      {
        for (i4 = 0; i4 != v117; ++i4)
        {
          if (*(_QWORD *)v255 != v118)
            objc_enumerationMutation(v115);
          v120 = *(void **)(*((_QWORD *)&v254 + 1) + 8 * i4);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:resolvedAudioVideoModeChangedForConversation:", *(_QWORD *)(a1 + 40), v120);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v121 = *(void **)(a1 + 56);
            objc_msgSend(v120, "groupUUID");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "objectForKeyedSubscript:", v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:resolvedAudioVideoModeChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v120, v123);
          }
        }
        v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v254, v321, 16);
      }
      while (v117);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v252 = 0u;
    v253 = 0u;
    v250 = 0u;
    v251 = 0u;
    v124 = *(id *)(a1 + 168);
    v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v250, v320, 16);
    if (v125)
    {
      v126 = v125;
      v127 = *(_QWORD *)v251;
      do
      {
        for (i5 = 0; i5 != v126; ++i5)
        {
          if (*(_QWORD *)v251 != v127)
            objc_enumerationMutation(v124);
          v129 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * i5);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:activitySessionsChangedForConversation:", *(_QWORD *)(a1 + 40), v129);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v130 = *(void **)(a1 + 56);
            objc_msgSend(v129, "groupUUID");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "objectForKeyedSubscript:", v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:activitySessionsChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v129, v132);
          }
        }
        v126 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v250, v320, 16);
      }
      while (v126);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v248 = 0u;
    v249 = 0u;
    v246 = 0u;
    v247 = 0u;
    v133 = *(id *)(a1 + 176);
    v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v246, v319, 16);
    if (v134)
    {
      v135 = v134;
      v136 = *(_QWORD *)v247;
      do
      {
        for (i6 = 0; i6 != v135; ++i6)
        {
          if (*(_QWORD *)v247 != v136)
            objc_enumerationMutation(v133);
          v138 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * i6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:linkChangedForConversation:", *(_QWORD *)(a1 + 40), v138);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v139 = *(void **)(a1 + 56);
            objc_msgSend(v138, "groupUUID");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "objectForKeyedSubscript:", v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:linkChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v138, v141);
          }
        }
        v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v246, v319, 16);
      }
      while (v135);
    }

  }
  v142 = objc_opt_respondsToSelector();
  v143 = objc_opt_respondsToSelector();
  v144 = v143;
  if ((v142 & 1) != 0 || (v143 & 1) != 0)
  {
    v244 = 0u;
    v245 = 0u;
    v242 = 0u;
    v243 = 0u;
    v145 = *(id *)(a1 + 184);
    v146 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v242, v318, 16);
    if (v146)
    {
      v147 = v146;
      v148 = *(_QWORD *)v243;
      do
      {
        for (i7 = 0; i7 != v147; ++i7)
        {
          if (*(_QWORD *)v243 != v148)
            objc_enumerationMutation(v145);
          v150 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * i7);
          if ((v142 & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:linkInvitedMemberHandlesChangedForConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v242 + 1) + 8 * i7));
          if ((v144 & 1) != 0)
          {
            v151 = *(void **)(a1 + 56);
            objc_msgSend(v150, "groupUUID");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "objectForKeyedSubscript:", v152);
            v153 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:linkInvitedMemberHandlesChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v150, v153);
          }
        }
        v147 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v242, v318, 16);
      }
      while (v147);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v240 = 0u;
    v241 = 0u;
    v238 = 0u;
    v239 = 0u;
    v154 = *(id *)(a1 + 192);
    v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v238, v317, 16);
    if (v155)
    {
      v156 = v155;
      v157 = *(_QWORD *)v239;
      do
      {
        for (i8 = 0; i8 != v156; ++i8)
        {
          if (*(_QWORD *)v239 != v157)
            objc_enumerationMutation(v154);
          objc_msgSend(*(id *)(a1 + 32), "conversationManager:removedActiveConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v238 + 1) + 8 * i8));
        }
        v156 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v238, v317, 16);
      }
      while (v156);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v236 = 0u;
    v237 = 0u;
    v234 = 0u;
    v235 = 0u;
    v159 = *(id *)(a1 + 200);
    v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v234, v316, 16);
    if (v160)
    {
      v161 = v160;
      v162 = *(_QWORD *)v235;
      do
      {
        for (i9 = 0; i9 != v161; ++i9)
        {
          if (*(_QWORD *)v235 != v162)
            objc_enumerationMutation(v159);
          objc_msgSend(*(id *)(a1 + 32), "conversationManager:addedActiveConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v234 + 1) + 8 * i9));
        }
        v161 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v234, v316, 16);
      }
      while (v161);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    v164 = *(id *)(a1 + 208);
    v165 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v230, v315, 16);
    if (v165)
    {
      v166 = v165;
      v167 = *(_QWORD *)v231;
      do
      {
        for (i10 = 0; i10 != v166; ++i10)
        {
          if (*(_QWORD *)v231 != v167)
            objc_enumerationMutation(v164);
          objc_msgSend(*(id *)(a1 + 32), "conversationManager:ignoreLMIRequestsChangedForConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v230 + 1) + 8 * i10));
        }
        v166 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v230, v315, 16);
      }
      while (v166);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v228 = 0u;
    v229 = 0u;
    v226 = 0u;
    v227 = 0u;
    v169 = *(id *)(a1 + 216);
    v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v226, v314, 16);
    if (v170)
    {
      v171 = v170;
      v172 = *(_QWORD *)v227;
      do
      {
        for (i11 = 0; i11 != v171; ++i11)
        {
          if (*(_QWORD *)v227 != v172)
            objc_enumerationMutation(v169);
          v174 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * i11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:rejectedMembersChangedForConversation:", *(_QWORD *)(a1 + 40), v174);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v175 = *(void **)(a1 + 56);
            objc_msgSend(v174, "groupUUID");
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v175, "objectForKeyedSubscript:", v176);
            v177 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:rejectedMembersChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v174, v177);
          }
        }
        v171 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v226, v314, 16);
      }
      while (v171);
    }

  }
  if (*(_QWORD *)(a1 + 224) && *(_QWORD *)(a1 + 232) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "conversationManager:handoffEligibilityChangedToConversation:fromPreviousConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 232));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 224))
      objc_msgSend(*(id *)(a1 + 32), "conversationManager:handoffEligibilityChangedForConversation:", *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(a1 + 232))
      objc_msgSend(*(id *)(a1 + 32), "conversationManager:handoffEligibilityChangedForConversation:", *(_QWORD *)(a1 + 40));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v224 = 0u;
    v225 = 0u;
    v222 = 0u;
    v223 = 0u;
    v178 = *(id *)(a1 + 240);
    v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v222, v313, 16);
    if (v179)
    {
      v180 = v179;
      v181 = *(_QWORD *)v223;
      do
      {
        for (i12 = 0; i12 != v180; ++i12)
        {
          if (*(_QWORD *)v223 != v181)
            objc_enumerationMutation(v178);
          v183 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * i12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:systemActivitySessionsChangedForConversation:", *(_QWORD *)(a1 + 40), v183);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v184 = *(void **)(a1 + 56);
            objc_msgSend(v183, "groupUUID");
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v184, "objectForKeyedSubscript:", v185);
            v186 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:systemActivitySessionsChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v183, v186);
          }
        }
        v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v222, v313, 16);
      }
      while (v180);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v220 = 0u;
    v221 = 0u;
    v218 = 0u;
    v219 = 0u;
    v187 = *(id *)(a1 + 248);
    v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v218, v312, 16);
    if (v188)
    {
      v189 = v188;
      v190 = *(_QWORD *)v219;
      do
      {
        for (i13 = 0; i13 != v189; ++i13)
        {
          if (*(_QWORD *)v219 != v190)
            objc_enumerationMutation(v187);
          v192 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * i13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "conversationManager:cameraMixedWithScreenDidChangeForConversation:", *(_QWORD *)(a1 + 40), v192);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v193 = *(void **)(a1 + 56);
            objc_msgSend(v192, "groupUUID");
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v193, "objectForKeyedSubscript:", v194);
            v195 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "conversationManager:cameraMixedWithScreenDidChangeForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v192, v195);
          }
        }
        v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v218, v312, 16);
      }
      while (v189);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v216 = 0u;
    v217 = 0u;
    v214 = 0u;
    v215 = 0u;
    v196 = *(id *)(a1 + 256);
    v197 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v214, v311, 16);
    if (v197)
    {
      v198 = v197;
      v199 = *(_QWORD *)v215;
      do
      {
        for (i14 = 0; i14 != v198; ++i14)
        {
          if (*(_QWORD *)v215 != v199)
            objc_enumerationMutation(v196);
          objc_msgSend(*(id *)(a1 + 32), "conversationManager:screeningChangedForConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * i14));
        }
        v198 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v214, v311, 16);
      }
      while (v198);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v212 = 0u;
    v213 = 0u;
    v210 = 0u;
    v211 = 0u;
    v201 = *(id *)(a1 + 264);
    v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v210, v310, 16);
    if (v202)
    {
      v203 = v202;
      v204 = *(_QWORD *)v211;
      do
      {
        for (i15 = 0; i15 != v203; ++i15)
        {
          if (*(_QWORD *)v211 != v204)
            objc_enumerationMutation(v201);
          v206 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * i15);
          v207 = *(void **)(a1 + 56);
          objc_msgSend(v206, "groupUUID", (_QWORD)v210);
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v207, "objectForKeyedSubscript:", v208);
          v209 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "conversationManager:screenSharingRequestsChangedForConversation:fromOldConversation:", *(_QWORD *)(a1 + 40), v206, v209);
        }
        v203 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v210, v310, 16);
      }
      while (v203);
    }

  }
}

- (void)serverDisconnectedForDataSource:(id)a3 oldConversationsByGroupUUID:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUConversationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__TUConversationManager_serverDisconnectedForDataSource_oldConversationsByGroupUUID___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __85__TUConversationManager_serverDisconnectedForDataSource_oldConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id obj;
  _QWORD block[6];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Removing conversationsNotBackedByGroupSessions since dataSource got disconnected", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "conversationsNotBackedByGroupSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = objc_claimAutoreleasedReturnValue();

        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __85__TUConversationManager_serverDisconnectedForDataSource_oldConversationsByGroupUUID___block_invoke_215;
        block[3] = &unk_1E38A19B8;
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(a1 + 40);
        block[4] = v9;
        block[5] = v12;
        v16 = v13;
        dispatch_async(v11, block);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

}

void __85__TUConversationManager_serverDisconnectedForDataSource_oldConversationsByGroupUUID___block_invoke_215(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "serverDisconnectedForConversationManager:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "allValues", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(a1 + 32), "conversationManager:removedActiveConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (void)conversation:(id)a3 participant:(id)a4 addedNotice:(id)a5
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
  -[TUConversationManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__TUConversationManager_conversation_participant_addedNotice___block_invoke;
  v15[3] = &unk_1E38A1B38;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __62__TUConversationManager_conversation_participant_addedNotice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  id v16;
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
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v18;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __62__TUConversationManager_conversation_participant_addedNotice___block_invoke_2;
        block[3] = &unk_1E38A3910;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        v16 = *(id *)(a1 + 56);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);
  }

}

uint64_t __62__TUConversationManager_conversation_participant_addedNotice___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:participant:addedNotice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return result;
}

- (void)activeParticipant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[TUConversationManager collaborationManager](self, "collaborationManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "participant:addedHighlightToConversation:highlightIdentifier:oldHighlightIdentifier:isFirstAdd:", v15, v14, v13, v12, v7);

}

- (void)activeParticipant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUConversationManager collaborationManager](self, "collaborationManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "participant:removedHighlightFromConversation:highlightIdentifier:", v10, v9, v8);

}

- (void)conversation:(id)a3 participant:(id)a4 addedCollaborationNotice:(id)a5
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
  -[TUConversationManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__TUConversationManager_conversation_participant_addedCollaborationNotice___block_invoke;
  v15[3] = &unk_1E38A1B38;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __75__TUConversationManager_conversation_participant_addedCollaborationNotice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  id v16;
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
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v18;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __75__TUConversationManager_conversation_participant_addedCollaborationNotice___block_invoke_2;
        block[3] = &unk_1E38A3910;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        v16 = *(id *)(a1 + 56);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);
  }

}

uint64_t __75__TUConversationManager_conversation_participant_addedCollaborationNotice___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:participant:addedCollaborationNotice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return result;
}

- (void)conversation:(id)a3 collaborationStateChanged:(int64_t)a4 highlightIdentifier:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a4;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "TUConversationManager received collaborationStateChanged : %lu", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager collaborationManager](self, "collaborationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCollaborationState:forCollaborationIdentifier:", a4, v7);

}

- (void)addedCollaborationDictionary:(id)a3 forConversation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Received collaboration dictionary: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationManager collaborationManager](self, "collaborationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collaborationProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "addTemporaryCollaboration:", v5);

}

- (void)conversation:(id)a3 addedMembersLocally:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__TUConversationManager_conversation_addedMembersLocally___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __58__TUConversationManager_conversation_addedMembersLocally___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __58__TUConversationManager_conversation_addedMembersLocally___block_invoke_2;
        block[3] = &unk_1E38A1B38;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

uint64_t __58__TUConversationManager_conversation_addedMembersLocally___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:addedMembersLocally:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)conversation:(id)a3 buzzedMember:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__TUConversationManager_conversation_buzzedMember___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __51__TUConversationManager_conversation_buzzedMember___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __51__TUConversationManager_conversation_buzzedMember___block_invoke_2;
        block[3] = &unk_1E38A1B38;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

uint64_t __51__TUConversationManager_conversation_buzzedMember___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:buzzedMember:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)conversationsChangedForDataSource:(id)a3 updatedIncomingPendingConversationsByGroupUUID:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUConversationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__TUConversationManager_conversationsChangedForDataSource_updatedIncomingPendingConversationsByGroupUUID___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __106__TUConversationManager_conversationsChangedForDataSource_updatedIncomingPendingConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __106__TUConversationManager_conversationsChangedForDataSource_updatedIncomingPendingConversationsByGroupUUID___block_invoke_2;
        block[3] = &unk_1E38A19B8;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

}

void __106__TUConversationManager_conversationsChangedForDataSource_updatedIncomingPendingConversationsByGroupUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "allValues");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "conversationManager:updatedIncomingPendingConversations:", v3, v4);

  }
}

- (void)conversationUpdatedMessagesGroupPhoto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUConversationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__TUConversationManager_conversationUpdatedMessagesGroupPhoto___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __63__TUConversationManager_conversationUpdatedMessagesGroupPhoto___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __63__TUConversationManager_conversationUpdatedMessagesGroupPhoto___block_invoke_2;
        block[3] = &unk_1E38A19B8;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

}

void __63__TUConversationManager_conversationUpdatedMessagesGroupPhoto___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (void *)a1[4];
    v3 = a1[5];
    v4 = (void *)a1[6];
    objc_msgSend(v4, "messagesGroupPhotoData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "conversationManager:conversation:updatedMessagesGroupPhoto:", v3, v4, v5);

  }
}

- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUConversationManager_conversation_didChangeStateForActivitySession___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __71__TUConversationManager_conversation_didChangeStateForActivitySession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __71__TUConversationManager_conversation_didChangeStateForActivitySession___block_invoke_2;
        block[3] = &unk_1E38A1B38;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

uint64_t __71__TUConversationManager_conversation_didChangeStateForActivitySession___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:didChangeStateForActivitySession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__TUConversationManager_conversation_didChangeSceneAssociationForActivitySession___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __82__TUConversationManager_conversation_didChangeSceneAssociationForActivitySession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __82__TUConversationManager_conversation_didChangeSceneAssociationForActivitySession___block_invoke_2;
        block[3] = &unk_1E38A1B38;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

uint64_t __82__TUConversationManager_conversation_didChangeSceneAssociationForActivitySession___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:didChangeSceneAssociationForActivitySession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__TUConversationManager_conversation_receivedActivitySessionEvent___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __67__TUConversationManager_conversation_receivedActivitySessionEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __67__TUConversationManager_conversation_receivedActivitySessionEvent___block_invoke_2;
        block[3] = &unk_1E38A1B38;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

uint64_t __67__TUConversationManager_conversation_receivedActivitySessionEvent___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:receivedActivitySessionEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)conversationManagerDataSource:(id)a3 didChangeActivatedConversationLinks:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUConversationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__TUConversationManager_conversationManagerDataSource_didChangeActivatedConversationLinks___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __91__TUConversationManager_conversationManagerDataSource_didChangeActivatedConversationLinks___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[6];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKey:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __91__TUConversationManager_conversationManagerDataSource_didChangeActivatedConversationLinks___block_invoke_2;
        block[3] = &unk_1E38A19B8;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v8;
        block[5] = v10;
        v13 = v11;
        dispatch_async(v9, block);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __91__TUConversationManager_conversationManagerDataSource_didChangeActivatedConversationLinks___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:didChangeActivatedLinks:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)conversationManagerDataSource:(id)a3 messagesGroupDetailsForMessagesGroupId:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[TUConversationManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__TUConversationManager_conversationManagerDataSource_messagesGroupDetailsForMessagesGroupId_completionHandler___block_invoke;
  block[3] = &unk_1E38A3068;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __112__TUConversationManager_conversationManagerDataSource_messagesGroupDetailsForMessagesGroupId_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagesGroupProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "getMessagesGroupDetailsForGroupId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __112__TUConversationManager_conversationManagerDataSource_messagesGroupDetailsForMessagesGroupId_completionHandler___block_invoke_cold_1(a1, v4, v5);

    v6 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("No messages group details provider available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("TUConversationManagerMessagesErrorDomain"), 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchUpcomingNoticeWithCompletionHandler:", v4);

}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "activateConversationNoticeWithActionURL: %@ bundleID %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConversationNoticeWithActionURL:bundleIdentifier:", v6, v7);

}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "UUID: %@", (uint8_t *)&v7, 0xCu);
  }

  -[TUConversationManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeConversationNoticeWithUUID:", v4);

}

- (void)conversationManagerDataSource:(id)a3 conversation:(id)a4 appLaunchState:(unint64_t)a5 forActivitySession:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  TUConversationManager *v17;
  unint64_t v18;

  v9 = a4;
  v10 = a6;
  -[TUConversationManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__TUConversationManager_conversationManagerDataSource_conversation_appLaunchState_forActivitySession___block_invoke;
  v14[3] = &unk_1E38A1768;
  v15 = v10;
  v16 = v9;
  v17 = self;
  v18 = a5;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, v14);

}

void __102__TUConversationManager_conversationManagerDataSource_conversation_appLaunchState_forActivitySession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id obj;
  int8x16_t v16;
  _QWORD block[5];
  int8x16_t v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v27 = v3;
    v28 = 2112;
    v29 = v4;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager app launch state %@ session %@ conversation %@", buf, 0x20u);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 48), "delegateToQueue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = objc_claimAutoreleasedReturnValue();

        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __102__TUConversationManager_conversationManagerDataSource_conversation_appLaunchState_forActivitySession___block_invoke_241;
        block[3] = &unk_1E38A3938;
        block[4] = v11;
        v16 = *(int8x16_t *)(a1 + 40);
        v14 = (id)v16.i64[0];
        v18 = vextq_s8(v16, v16, 8uLL);
        v20 = *(_QWORD *)(a1 + 56);
        v19 = *(id *)(a1 + 32);
        dispatch_async(v13, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

uint64_t __102__TUConversationManager_conversationManagerDataSource_conversation_appLaunchState_forActivitySession___block_invoke_241(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:launchStateChanged:forActivitySession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)receivedTrackedPendingMember:(id)a3 forConversationLink:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  TUConversationManager *v14;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__TUConversationManager_receivedTrackedPendingMember_forConversationLink___block_invoke;
  block[3] = &unk_1E38A19B8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __74__TUConversationManager_receivedTrackedPendingMember_forConversationLink___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id obj;
  _QWORD block[6];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v24 = v3;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager receivedTrackedPendingMember %@ forConversationLink %@", buf, 0x16u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1[6], "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_msgSend(a1[6], "delegateToQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = objc_claimAutoreleasedReturnValue();

        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __74__TUConversationManager_receivedTrackedPendingMember_forConversationLink___block_invoke_244;
        block[3] = &unk_1E38A1B38;
        v13 = a1[6];
        block[4] = v10;
        block[5] = v13;
        v16 = a1[4];
        v17 = a1[5];
        dispatch_async(v12, block);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

uint64_t __74__TUConversationManager_receivedTrackedPendingMember_forConversationLink___block_invoke_244(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:trackedPendingMember:forConversationLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)conversation:(id)a3 screenSharingChangedForParticipant:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__TUConversationManager_conversation_screenSharingChangedForParticipant___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __73__TUConversationManager_conversation_screenSharingChangedForParticipant___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD block[6];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __73__TUConversationManager_conversation_screenSharingChangedForParticipant___block_invoke_2;
        block[3] = &unk_1E38A1B38;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v14 = v11;
        v15 = *(id *)(a1 + 48);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

uint64_t __73__TUConversationManager_conversation_screenSharingChangedForParticipant___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:conversation:screenSharingChangedForParticipant:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)remoteScreenShareAttributesChanged:(id)a3 isLocallySharing:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  TUConversationManager *v11;
  BOOL v12;

  v6 = a3;
  -[TUConversationManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__TUConversationManager_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke;
  block[3] = &unk_1E38A26F0;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __77__TUConversationManager_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id obj;
  int8x16_t v15;
  _QWORD block[5];
  int8x16_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 48))
      v4 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v25 = v3;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager remoteScreenShareAttributesChanged %@, isLocallySharing: %@", buf, 0x16u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 40), "delegateToQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = objc_claimAutoreleasedReturnValue();

        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __77__TUConversationManager_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke_249;
        block[3] = &unk_1E38A2818;
        block[4] = v10;
        v15 = *(int8x16_t *)(a1 + 32);
        v13 = (id)v15.i64[0];
        v17 = vextq_s8(v15, v15, 8uLL);
        v18 = *(_BYTE *)(a1 + 48);
        dispatch_async(v12, block);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

}

uint64_t __77__TUConversationManager_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke_249(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:remoteScreenShareAttributesChanged:isLocallySharing:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return result;
}

- (void)remoteScreenShareEndedWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUConversationManager *v9;

  v4 = a3;
  -[TUConversationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__TUConversationManager_remoteScreenShareEndedWithReason___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__TUConversationManager_remoteScreenShareEndedWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id obj;
  int8x16_t v14;
  _QWORD block[5];
  int8x16_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager remoteScreenShareEndedWithReason: %@", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 40), "delegateToQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = objc_claimAutoreleasedReturnValue();

        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __58__TUConversationManager_remoteScreenShareEndedWithReason___block_invoke_252;
        block[3] = &unk_1E38A19B8;
        block[4] = v9;
        v14 = *(int8x16_t *)(a1 + 32);
        v12 = (id)v14.i64[0];
        v16 = vextq_s8(v14, v14, 8uLL);
        dispatch_async(v11, block);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

uint64_t __58__TUConversationManager_remoteScreenShareEndedWithReason___block_invoke_252(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:remoteScreenShareEndedWithReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)sharePlayAvailableChanged:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[TUConversationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__TUConversationManager_sharePlayAvailableChanged___block_invoke;
  v6[3] = &unk_1E38A19E0;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

void __51__TUConversationManager_sharePlayAvailableChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id obj;
  _QWORD block[6];
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    v22 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager sharePlayAvailable: %d", buf, 8u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = objc_claimAutoreleasedReturnValue();

        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __51__TUConversationManager_sharePlayAvailableChanged___block_invoke_255;
        block[3] = &unk_1E38A26F0;
        v12 = *(_QWORD *)(a1 + 32);
        block[4] = v9;
        block[5] = v12;
        v15 = *(_BYTE *)(a1 + 40);
        dispatch_async(v11, block);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

uint64_t __51__TUConversationManager_sharePlayAvailableChanged___block_invoke_255(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:sharePlayAvailableChanged:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)screenSharingAvailableChanged:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[TUConversationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__TUConversationManager_screenSharingAvailableChanged___block_invoke;
  v6[3] = &unk_1E38A19E0;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

void __55__TUConversationManager_screenSharingAvailableChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id obj;
  _QWORD block[6];
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    v22 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "TUConversationManager screenSharingAvailable: %d", buf, 8u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = objc_claimAutoreleasedReturnValue();

        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __55__TUConversationManager_screenSharingAvailableChanged___block_invoke_258;
        block[3] = &unk_1E38A26F0;
        v12 = *(_QWORD *)(a1 + 32);
        block[4] = v9;
        block[5] = v12;
        v15 = *(_BYTE *)(a1 + 40);
        dispatch_async(v11, block);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

uint64_t __55__TUConversationManager_screenSharingAvailableChanged___block_invoke_258(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:screenSharingAvailableChanged:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)activityAuthorizationsChangedForDataSource:(id)a3 oldActivityAuthorizedBundleIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  TUConversationManager *v14;

  v6 = a3;
  v7 = a4;
  -[TUConversationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__TUConversationManager_activityAuthorizationsChangedForDataSource_oldActivityAuthorizedBundleIdentifiers___block_invoke;
  block[3] = &unk_1E38A19B8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __107__TUConversationManager_activityAuthorizationsChangedForDataSource_oldActivityAuthorizedBundleIdentifiers___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id obj;
  _QWORD block[5];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "activityAuthorizedBundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v10))
          objc_msgSend(v3, "removeObjectForKey:", v9);
        else
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1[6], "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(a1[6], "delegateToQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v16);
        v18 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __107__TUConversationManager_activityAuthorizationsChangedForDataSource_oldActivityAuthorizedBundleIdentifiers___block_invoke_2;
        block[3] = &unk_1E38A19B8;
        block[4] = v16;
        v19 = v3;
        v20 = a1[6];
        v23 = v19;
        v24 = v20;
        dispatch_async(v18, block);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v13);
  }

}

void __107__TUConversationManager_activityAuthorizationsChangedForDataSource_oldActivityAuthorizedBundleIdentifiers___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(a1 + 32), "conversationManager:changedActivityAuthorizationForBundleIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (void)collaborationChanged:(id)a3 forConversation:(id)a4 collaborationState:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "collaborationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Notifying delegate of collaboration changed %@ with document state %@", buf, 0x16u);

  }
  -[TUConversationManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__TUConversationManager_collaborationChanged_forConversation_collaborationState___block_invoke;
  v16[3] = &unk_1E38A1768;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v14 = v9;
  v15 = v8;
  dispatch_async(v13, v16);

}

void __81__TUConversationManager_collaborationChanged_forConversation_collaborationState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id obj;
  _QWORD block[6];
  id v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v20;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = objc_claimAutoreleasedReturnValue();

        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __81__TUConversationManager_collaborationChanged_forConversation_collaborationState___block_invoke_2;
        block[3] = &unk_1E38A3938;
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        block[4] = v7;
        block[5] = v10;
        v16 = v11;
        v12 = *(id *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 56);
        v17 = v12;
        v18 = v13;
        dispatch_async(v9, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v3);
  }

}

uint64_t __81__TUConversationManager_collaborationChanged_forConversation_collaborationState___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "conversationManager:collaborationChanged:forConversation:collaborationState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  return result;
}

- (id)collaborationForConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUConversationManager collaborationManager](self, "collaborationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collaborationForConversation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)collaborationStateForConversation:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[TUConversationManager collaborationManager](self, "collaborationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "collaborationStateForConversation:", v4);

  return v6;
}

- (void)setNonSessionBackedConversationCreationQueue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUConversationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__TUConversationManager_setNonSessionBackedConversationCreationQueue___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__TUConversationManager_setNonSessionBackedConversationCreationQueue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void)callPropertiesChanged:(id)a3
{
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "object");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[TUConversationManager updateConversationsNotBackedByGroupSessionWithCall:](self, "updateConversationsNotBackedByGroupSessionWithCall:", v6);

    }
  }

}

- (void)updateConversationsNotBackedByGroupSessionWithCall:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[TUConversationManager nonSessionBackedConversationCreationMode](self, "nonSessionBackedConversationCreationMode"))
  {
    -[TUConversationManager queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall___block_invoke;
    v6[3] = &unk_1E38A1388;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __76__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "nonSessionBackedConversationCreationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "conversationsByGroupUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    objc_msgSend(*(id *)(a1 + 32), "updateConversationsNotBackedByGroupSessionWithCall:conversationsByGroupUUID:creationQueue:", *(_QWORD *)(a1 + 40), v4, v5);
  }

}

- (void)updateConversationsNotBackedByGroupSessionWithCall:(id)a3 conversationsByGroupUUID:(id)a4 creationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall_conversationsByGroupUUID_creationQueue___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async((dispatch_queue_t)a5, block);

}

void __115__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall_conversationsByGroupUUID_creationQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD block[6];
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "conversationsNotBackedByGroupSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "createConversationForCallNotBackedByGroupSession:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = a1;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "state"))
      objc_msgSend(v5, "addObject:", v4);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v52 = v3;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v64 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v11, "groupUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "groupUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) == 0)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(v54 + 32), "setConversationsNotBackedByGroupSessions:", v5);
    v15 = (void *)objc_msgSend(*(id *)(v54 + 48), "mutableCopy");
    v16 = (void *)objc_msgSend(*(id *)(v54 + 48), "mutableCopy");
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v60 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          objc_msgSend(v22, "groupUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
      }
      while (v19);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(*(id *)(v54 + 32), "conversationsNotBackedByGroupSessions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v56 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
          objc_msgSend(v29, "groupUUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
      }
      while (v26);
    }

    objc_msgSend(*(id *)(v54 + 32), "conversationsChangedFromOldConversationsByGroupUUID:newConversationsByGroupUUID:", v15, v16);
    goto LABEL_28;
  }
  v31 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "uniqueProxyIdentifierUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "conversationWithUUID:fromConversations:", v32, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "isConversation") && v5)
  {
    TUDefaultLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v78 = v34;
      _os_log_impl(&dword_19A50D000, v33, OS_LOG_TYPE_DEFAULT, "Adding call %@ to calls pending upgrade to session-backed architecture", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "callsNotBackedByGroupSessionsPendingUpgrade");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", *(_QWORD *)(a1 + 40));

    v36 = *(void **)(a1 + 32);
    objc_msgSend(v36, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "conversationsByGroupUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "conversationsChangedForDataSource:conversationsByGroupUUID:oldConversationsByGroupUUID:", v15, v37, *(_QWORD *)(a1 + 48));

    goto LABEL_34;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isVideo") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 32), "nonSessionBackedConversationCreationMode") == 1)
  {
    v38 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "uniqueProxyIdentifierUUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "conversationsNotBackedByGroupSessions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "conversationWithUUID:fromConversations:", v39, v40);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_35;
    TUDefaultLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "UUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v78 = v42;
      _os_log_impl(&dword_19A50D000, v41, OS_LOG_TYPE_DEFAULT, "Call downgraded to isVideo=NO, but sessionCreationMode=.faceTimeVideo, and we already made a fake TUConversation, removing it now: %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "conversationsNotBackedByGroupSessions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeObject:", v15);

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    if (!v44)
    {
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    v45 = v44;
    v52 = v3;
    v53 = *(_QWORD *)v70;
    do
    {
      for (m = 0; m != v45; ++m)
      {
        if (*(_QWORD *)v70 != v53)
          objc_enumerationMutation(v16);
        v47 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * m);
        objc_msgSend(*(id *)(v54 + 32), "delegateToQueue");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKey:", v47);
        v49 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __115__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall_conversationsByGroupUUID_creationQueue___block_invoke_267;
        block[3] = &unk_1E38A19B8;
        v50 = *(_QWORD *)(v54 + 32);
        block[4] = v47;
        block[5] = v50;
        v51 = v15;
        v68 = v51;
        dispatch_async(v49, block);

      }
      v45 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v45);
    v15 = v51;
LABEL_28:
    v3 = v52;
    goto LABEL_34;
  }
LABEL_36:

}

uint64_t __115__TUConversationManager_updateConversationsNotBackedByGroupSessionWithCall_conversationsByGroupUUID_creationQueue___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "conversationManager:removedActiveConversation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)pruneConversationsPendingUpgradeInConversationsWithGroupUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUConversationManager nonSessionBackedConversationCreationQueue](self, "nonSessionBackedConversationCreationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUConversationManager callPendingUpgradeInConversationsWithGroupUUID:](self, "callPendingUpgradeInConversationsWithGroupUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "uniqueProxyIdentifierUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationManager conversationsNotBackedByGroupSessions](self, "conversationsNotBackedByGroupSessions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversationWithUUID:fromConversations:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Stopping tracking conversation not backed by session %@ since it is now backed by session", (uint8_t *)&v14, 0xCu);
    }

    -[TUConversationManager conversationsNotBackedByGroupSessions](self, "conversationsNotBackedByGroupSessions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v10);

    -[TUConversationManager callsNotBackedByGroupSessionsPendingUpgrade](self, "callsNotBackedByGroupSessionsPendingUpgrade");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v6);

  }
}

- (id)callPendingUpgradeInConversationsWithGroupUUID:(id)a3
{
  NSObject *v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  int v14;
  int v15;
  id v16;
  id obj;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  -[TUConversationManager nonSessionBackedConversationCreationQueue](self, "nonSessionBackedConversationCreationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[TUConversationManager callsNotBackedByGroupSessionsPendingUpgrade](self, "callsNotBackedByGroupSessionsPendingUpgrade");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v22 = 0;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v20, "allValues");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend((id)objc_opt_class(), "remoteMembersForCall:", v6);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isRepresentedByRemoteMembers:andLink:", v13, 0))
              {
                v14 = objc_msgSend(v12, "isVideo");
                v15 = objc_msgSend(v6, "isVideo");

                if (v14 == v15)
                {
                  v16 = v6;

                  v22 = v16;
                  goto LABEL_17;
                }
              }
              else
              {

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v9);
        }
LABEL_17:

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)createConversationForCallNotBackedByGroupSession:(id)a3
{
  id v4;
  NSObject *v5;
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
  TUMutableConversation *v16;
  void *v17;
  TUMutableConversation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  TUConversationMember *v28;
  void *v29;
  void *v30;
  TUConversationMember *v31;
  NSObject *v32;
  unint64_t v34;
  int v35;
  TUMutableConversation *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUConversationManager nonSessionBackedConversationCreationQueue](self, "nonSessionBackedConversationCreationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!v4
    || (objc_msgSend(v4, "isConversation") & 1) != 0
    || (objc_msgSend(v4, "isVideo") & 1) == 0
    && -[TUConversationManager nonSessionBackedConversationCreationMode](self, "nonSessionBackedConversationCreationMode") == 1)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isFaceTimeProvider") & 1) == 0)
  {
    objc_msgSend(v4, "provider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isSuperboxProvider"))
    {

      goto LABEL_9;
    }
    v34 = -[TUConversationManager nonSessionBackedConversationCreationMode](self, "nonSessionBackedConversationCreationMode");

    if (v34 == 3)
      goto LABEL_10;
LABEL_3:
    v6 = 0;
    goto LABEL_24;
  }
LABEL_9:

LABEL_10:
  v9 = (void *)objc_opt_class();
  objc_msgSend(v4, "uniqueProxyIdentifierUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationManager conversationsNotBackedByGroupSessions](self, "conversationsNotBackedByGroupSessions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationWithUUID:fromConversations:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "groupUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isFaceTimeProvider") & 1) != 0)
    +[TUConversationProvider faceTimeProvider](TUConversationProvider, "faceTimeProvider");
  else
    +[TUConversationProvider unknownProvider](TUConversationProvider, "unknownProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [TUMutableConversation alloc];
  objc_msgSend(v4, "uniqueProxyIdentifierUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v18 = -[TUConversation initWithUUID:groupUUID:provider:](v16, "initWithUUID:groupUUID:provider:", v17, v13, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TUConversation initWithUUID:groupUUID:provider:](v16, "initWithUUID:groupUUID:provider:", v17, v19, v15);

  }
  -[TUConversation setVideo:](v18, "setVideo:", objc_msgSend(v4, "isVideo"));
  -[TUConversation setState:](v18, "setState:", objc_msgSend((id)objc_opt_class(), "conversationStateForCall:", v4));
  objc_msgSend((id)objc_opt_class(), "remoteMembersForCall:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setRemoteMembers:](v18, "setRemoteMembers:", v20);

  v21 = (void *)objc_opt_class();
  -[TUConversation remoteMembers](v18, "remoteMembers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activeRemoteParticipantsForCall:remoteMembers:", v4, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setActiveRemoteParticipants:](v18, "setActiveRemoteParticipants:", v23);

  -[TUConversation setAudioEnabled:](v18, "setAudioEnabled:", objc_msgSend(v4, "isUplinkMuted"));
  -[TUConversation setVideoEnabled:](v18, "setVideoEnabled:", objc_msgSend(v4, "isSendingVideo"));
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setActivitySessions:](v18, "setActivitySessions:", v24);

  -[TUConversation setOneToOneModeEnabled:](v18, "setOneToOneModeEnabled:", 1);
  -[TUConversation setBackedByGroupSession:](v18, "setBackedByGroupSession:", 0);
  -[TUConversation setAvcSessionToken:](v18, "setAvcSessionToken:", objc_msgSend(v4, "videoStreamToken"));
  if (objc_msgSend(v4, "isVideo"))
    v25 = 2;
  else
    v25 = 1;
  -[TUConversation setAvMode:](v18, "setAvMode:", v25);
  objc_msgSend(v4, "localSenderIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = [TUConversationMember alloc];
    objc_msgSend(v4, "localSenderIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[TUConversationMember initWithHandle:](v28, "initWithHandle:", v30);
    -[TUConversation setLocalMember:](v18, "setLocalMember:", v31);

  }
  TUDefaultLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 138412546;
    v36 = v18;
    v37 = 2112;
    v38 = v4;
    _os_log_impl(&dword_19A50D000, v32, OS_LOG_TYPE_DEFAULT, "Created conversation: %@ for call: %@", (uint8_t *)&v35, 0x16u);
  }

  v6 = (void *)-[TUMutableConversation copy](v18, "copy");
LABEL_24:

  return v6;
}

+ (int64_t)conversationStateForCall:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v5;
  int64_t v6;

  v3 = a3;
  switch(objc_msgSend(v3, "status"))
  {
    case 1u:
      v4 = objc_msgSend(v3, "isConnected") == 0;
      v5 = 2;
      goto LABEL_5;
    case 2u:
      v6 = 3;
      break;
    case 3u:
    case 4u:
      v4 = objc_msgSend(v3, "isConnecting") == 0;
      v5 = 1;
LABEL_5:
      if (v4)
        v6 = v5;
      else
        v6 = v5 + 1;
      break;
    case 5u:
      v6 = 4;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

+ (id)activeRemoteParticipantsForCall:(id)a3 remoteMembers:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  TUConversationParticipant *v13;
  void *v14;
  TUConversationParticipant *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TUConversationParticipantCapabilities *v19;
  void *v20;
  void *v21;
  id v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "status");
  if (v7 <= 4 && ((1 << v7) & 0x16) != 0)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v13 = [TUConversationParticipant alloc];
          objc_msgSend(v12, "handle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[TUConversationParticipant initWithIdentifier:handle:](v13, "initWithIdentifier:handle:", 0, v14);

          -[TUConversationParticipant setStreamToken:](v15, "setStreamToken:", objc_msgSend(v5, "videoStreamToken"));
          -[TUConversationParticipant setAudioEnabled:](v15, "setAudioEnabled:", 1);
          -[TUConversationParticipant setVideoEnabled:](v15, "setVideoEnabled:", objc_msgSend(v5, "isVideo"));
          if (objc_msgSend(v5, "isVideo"))
            v16 = 2;
          else
            v16 = 1;
          -[TUConversationParticipant setAudioVideoMode:](v15, "setAudioVideoMode:", v16);
          objc_msgSend(v5, "providerContext");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeRemoteIDSDestinationKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUConversationParticipant setActiveIDSDestination:](v15, "setActiveIDSDestination:", v18);

          v19 = objc_alloc_init(TUConversationParticipantCapabilities);
          objc_msgSend(v5, "providerContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeRemoteMomentsAvailableKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUConversationParticipantCapabilities setMomentsAvailable:](v19, "setMomentsAvailable:", objc_msgSend(v21, "BOOLValue"));

          -[TUConversationParticipant setCapabilities:](v15, "setCapabilities:", v19);
          objc_msgSend(v25, "addObject:", v15);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }

    v6 = v23;
  }

  return v25;
}

+ (id)conversationWithUUID:(id)a3 fromConversations:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "UUID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v5);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (TUConversation)handoffEligibleConversation
{
  return (TUConversation *)-[TUConversationManager handoffEligibleConversationForEligibility:](self, "handoffEligibleConversationForEligibility:", 0);
}

- (id)handoffEligibleConversationForEligibility:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[TUConversationManager dataSource](self, "dataSource", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationsByGroupUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
      if (objc_msgSend(v14, "state"))
        goto LABEL_18;
      if (v5
        && (objc_msgSend(v5, "conversationGroupUUID"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "groupUUID"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v7, "isEqual:", v3)))
      {

      }
      else
      {
        objc_msgSend(v14, "handoffEligibility");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {

        }
        if (!v15)
          goto LABEL_14;
      }
      v16 = v14;

      v11 = v16;
LABEL_14:
      if (v10 == ++v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v17 = v11;
        if (v10)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
  }
  v11 = 0;
LABEL_18:
  v17 = 0;
LABEL_19:

  v18 = v17;
  return v18;
}

- (TUConversation)avLessConversation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
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
  -[TUConversationManager dataSource](self, "dataSource", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationsByGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v8, "avMode") && (objc_msgSend(v8, "state") == 3 || objc_msgSend(v8, "state") == 2))
        {
          v5 = v8;
          goto LABEL_13;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return (TUConversation *)v5;
}

- (id)joinRequestForApplicableConversationWithHandoffEligibility:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  TUJoinConversationRequest *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[TUConversationManager handoffEligibleConversationForEligibility:](self, "handoffEligibleConversationForEligibility:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = v4;
    }
    else
    {
      objc_msgSend(v5, "handoffEligibility");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    v8 = -[TUJoinConversationRequest initWithConversation:]([TUJoinConversationRequest alloc], "initWithConversation:", v6);
    -[TUJoinConversationRequest setAvMode:](v8, "setAvMode:", objc_msgSend(v6, "avMode"));
    objc_msgSend(v6, "presentationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest setPresentationMode:](v8, "setPresentationMode:", objc_msgSend(v10, "mode"));

    if (objc_msgSend(v6, "avMode") == 2)
      v11 = objc_msgSend(v9, "isSendingVideo");
    else
      v11 = 0;
    -[TUJoinConversationRequest setVideoEnabled:](v8, "setVideoEnabled:", v11);
    -[TUJoinConversationRequest setUplinkMuted:](v8, "setUplinkMuted:", objc_msgSend(v9, "isUplinkMuted"));
    v12 = objc_msgSend(v6, "avMode") != 1 && objc_msgSend(v6, "resolvedAudioVideoMode") == 2;
    -[TUJoinConversationRequest setWantsStagingArea:](v8, "setWantsStagingArea:", v12);
    objc_msgSend(v9, "association");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[TUJoinConversationRequest setParticipantAssociation:](v8, "setParticipantAssociation:", v14);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (OS_dispatch_queue)nonSessionBackedConversationCreationQueue
{
  return self->_nonSessionBackedConversationCreationQueue;
}

- (NSMutableSet)callsNotBackedByGroupSessionsPendingUpgrade
{
  return self->_callsNotBackedByGroupSessionsPendingUpgrade;
}

- (void)setCallsNotBackedByGroupSessionsPendingUpgrade:(id)a3
{
  objc_storeStrong((id *)&self->_callsNotBackedByGroupSessionsPendingUpgrade, a3);
}

- (void)setConversationsNotBackedByGroupSessions:(id)a3
{
  objc_storeStrong((id *)&self->_conversationsNotBackedByGroupSessions, a3);
}

- (BOOL)shouldCreateConversationsForCallsNotBackedByGroupSessions
{
  return self->_shouldCreateConversationsForCallsNotBackedByGroupSessions;
}

- (unint64_t)nonSessionBackedConversationCreationMode
{
  return self->_nonSessionBackedConversationCreationMode;
}

- (void)setNonSessionBackedConversationCreationMode:(unint64_t)a3
{
  self->_nonSessionBackedConversationCreationMode = a3;
}

- (TUCollaborationManager)collaborationManager
{
  return self->_collaborationManager;
}

- (void)setCollaborationManager:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationManager, a3);
}

- (TUConversationMessagesGroupProviding)messagesGroupProvider
{
  return (TUConversationMessagesGroupProviding *)objc_loadWeakRetained((id *)&self->_messagesGroupProvider);
}

- (id)overriddenCallForGroupUUID
{
  return self->_overriddenCallForGroupUUID;
}

- (void)setOverriddenCallForGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overriddenCallForGroupUUID, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_messagesGroupProvider);
  objc_storeStrong((id *)&self->_collaborationManager, 0);
  objc_storeStrong((id *)&self->_conversationsNotBackedByGroupSessions, 0);
  objc_storeStrong((id *)&self->_callsNotBackedByGroupSessionsPendingUpgrade, 0);
  objc_storeStrong((id *)&self->_nonSessionBackedConversationCreationQueue, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reactionsController, 0);
  objc_storeStrong((id *)&self->_mediaController, 0);
}

- (void)addCollaborationDictionary:(void *)a1 forConversation:(NSObject *)a2 fromMe:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, a2, v4, "Cannot add nil collaboration dictionary to conversation UUID %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)addCollaborationIdentifier:(void *)a1 forConversation:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, a2, v4, "Cannot add nil collaboration identifier to conversation UUID %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)addCollaboration:(uint64_t)a1 forConversation:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5(&dword_19A50D000, v2, v3, "Cannot add collaboration %@ to conversation UUID %@ because the collaboration identifier is nil", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_1();
}

- (void)removeCollaborationIdentifier:(void *)a1 forConversation:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, a2, v4, "Cannot remove nil collaboration identifier from conversation UUID %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)updateURLWithDugongTokenIfNeeded:collaboration:handle:completion:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL LocalIMSPIQueryMessageWithGUIDAndLoadAttachmentsWithQOS(NSString *__strong, dispatch_qos_class_t, __strong dispatch_queue_t, __strong IMSPIMessageQueryCallback)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUConversationManager.m"), 52, CFSTR("%s"), dlerror());

  __break(1u);
}

void __90__TUConversationManager_updateURLWithDugongTokenIfNeeded_collaboration_handle_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, v0, v1, "Returning collaboration URL without Dugong token because could not construct updated url from components %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)openCollaborationWithIdentifier:forConversation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, v0, v1, "Could not find a collaboration highlight for identifier %@", v2);
  OUTLINED_FUNCTION_1();
}

void __73__TUConversationManager_openCollaborationWithIdentifier_forConversation___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 48), "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_19A50D000, v2, v3, "Failed to open collaboration url: %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

void __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A50D000, log, OS_LOG_TYPE_FAULT, "Something has gone very wrong and we have no link and no error", v1, 2u);
}

void __98__TUConversationManager_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, v0, v1, "Link generation failed with error %@", v2);
  OUTLINED_FUNCTION_1();
}

void __112__TUConversationManager_conversationManagerDataSource_messagesGroupDetailsForMessagesGroupId_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, a2, a3, "No messages group provider is available to fetch details for messages group %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
