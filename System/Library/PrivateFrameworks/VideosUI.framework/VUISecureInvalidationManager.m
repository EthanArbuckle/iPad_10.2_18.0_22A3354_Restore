@implementation VUISecureInvalidationManager

- (void)invalidateKeysForDeletedVideos
{
  id v2;

  -[VUISecureInvalidationManager stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Invalidation requested"));

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_60);
  return (id)sharedInstance_instance_0;
}

__CFString *__61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  if (v3)
  {
    objc_msgSend(WeakRetained, "_invalidateKeysForDeletedVideos");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because network is not reachable", v8, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification"), 0);

    v4 = CFSTR("Waiting for network reachability to invalidate keys");
  }

  return v4;
}

- (id)_invalidateKeysForDeletedVideos
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  BOOL v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  const __CFString *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v63;
  id v64;
  id obj;
  id v66;
  _QWORD v68[4];
  id v69;
  _QWORD v70[5];
  id location;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sidebandMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allFpsKeyDeletionInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 134217984;
    v83 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu key(s) to consider for invalidation", buf, 0xCu);

  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v77;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v77 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v10);
        objc_msgSend(v11, "expirationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12
          && (objc_msgSend(v12, "vui_isInTheFuture") & 1) == 0
          && (objc_msgSend(v11, "playbackExpirationStartDate"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = v14 == 0,
              v14,
              v15))
        {
          v22 = sLogObject_6;
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v83 = (uint64_t)v11;
            _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Not performing invalidation for expired key: %@", buf, 0xCu);
          }
          objc_msgSend(v63, "addObject:", v11);
        }
        else
        {
          objc_msgSend(v11, "objectID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v5;
          if (v16)
          {
            -[VUISecureInvalidationManager penaltyBox](self, "penaltyBox");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "containsObject:", v16);

            v17 = v5;
            if (v19)
            {
              v20 = sLogObject_6;
              v21 = os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT);
              v17 = v64;
              if (v21)
              {
                *(_DWORD *)buf = 138412290;
                v83 = (uint64_t)v11;
                _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Not invalidating key because it's in the penalty box: %@", buf, 0xCu);
                v17 = v64;
              }
            }
          }
          objc_msgSend(v17, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      v8 = v23;
    }
    while (v23);
  }

  v24 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = objc_msgSend(v63, "count");
    *(_DWORD *)buf = 134217984;
    v83 = v26;
    _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "      %lu key(s) are expired and will not be invalidated", buf, 0xCu);

  }
  v27 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    v29 = objc_msgSend(v64, "count");
    *(_DWORD *)buf = 134217984;
    v83 = v29;
    _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "      %lu key(s) are in the penalty box and will not be invalidated", buf, 0xCu);

  }
  v30 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    v32 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    v83 = v32;
    _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "      %lu key(s) are not expired and/or have a playback expiration start date, and are not in the penalty box", buf, 0xCu);

  }
  if (objc_msgSend(v63, "count"))
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sidebandMediaLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deleteFPSKeyDeletionInfos:", v63);

  }
  if (objc_msgSend(v5, "count"))
  {
    v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v75 = 0u;
    v73 = 0u;
    v74 = 0u;
    v72 = 0u;
    v35 = v5;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v73 != v37)
            objc_enumerationMutation(v35);
          v39 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          v40 = sLogObject_6;
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v83 = (uint64_t)v39;
            _os_log_impl(&dword_1D96EE000, v40, OS_LOG_TYPE_DEFAULT, "Will attempt to invalidate %@", buf, 0xCu);
          }
          if (-[VUISecureInvalidationManager _validateParamsForDeletionInfo:](self, "_validateParamsForDeletionInfo:", v39))
          {
            v41 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v39, "fpsNonceURL");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "fpsKeyServerURL");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "dsid");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("%@:%@:%@"), v42, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v66, "objectForKey:", v45);
            v46 = (id)objc_claimAutoreleasedReturnValue();
            if (!v46)
              v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v46, "addObject:", v39);
            objc_msgSend(v66, "setObject:forKey:", v46, v45);
          }
          else
          {
            v47 = sLogObject_6;
            if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v83 = (uint64_t)v39;
              _os_log_impl(&dword_1D96EE000, v47, OS_LOG_TYPE_DEFAULT, "Unable to invalidate key due to param error: %@", buf, 0xCu);
            }
            +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "sidebandMediaLibrary");
            v46 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "deleteFPSKeyDeletionInfo:", v39);
          }

        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      }
      while (v36);
    }

    objc_initWeak(&location, self);
    objc_msgSend(v66, "allValues");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count") == 0;

    if (v49)
    {
      v58 = sLogObject_6;
      if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v58, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because there are no tuples to invalidate", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "postNotificationName:object:", CFSTR("VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification"), 0);

      v57 = CFSTR("Idle");
    }
    else
    {
      v50 = -[VUISecureInvalidationManager backgroundTaskIdentifier](self, "backgroundTaskIdentifier");
      v51 = MEMORY[0x1E0C809B0];
      if (v50 == *MEMORY[0x1E0DC4878])
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v51;
        v70[1] = 3221225472;
        v70[2] = __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke;
        v70[3] = &unk_1E9F98DF0;
        v70[4] = self;
        v53 = objc_msgSend(v52, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("VUISecureInvalidationManager"), v70);

        v54 = sLogObject_6;
        if (v53 == v50)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
            -[VUISecureInvalidationManager _invalidateKeysForDeletedVideos].cold.1();
        }
        else if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v83 = v53;
          _os_log_impl(&dword_1D96EE000, v54, OS_LOG_TYPE_DEFAULT, "Beginning background task with identifier %lu", buf, 0xCu);
        }
        -[VUISecureInvalidationManager setBackgroundTaskIdentifier:](self, "setBackgroundTaskIdentifier:", v53);
      }
      else
      {
        v60 = sLogObject_6;
        if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v60, OS_LOG_TYPE_DEFAULT, "Not beginning background task since one is already in progress", buf, 2u);
        }
      }
      objc_msgSend(v66, "allValues");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v51;
      v68[1] = 3221225472;
      v68[2] = __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke_38;
      v68[3] = &unk_1E9F99C98;
      objc_copyWeak(&v69, &location);
      -[VUISecureInvalidationManager _sendInvalidationRequestsForDeletionInfoArrays:completion:](self, "_sendInvalidationRequestsForDeletionInfoArrays:completion:", v61, v68);

      objc_destroyWeak(&v69);
      v57 = CFSTR("Invalidation in progress");
    }
    objc_destroyWeak(&location);
  }
  else
  {
    v55 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v55, OS_LOG_TYPE_DEFAULT, "No keys need invalidating.", buf, 2u);
    }
    v56 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v56, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because no keys need invalidating", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "postNotificationName:object:", CFSTR("VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification"), 0);
    v57 = CFSTR("Idle");
  }

  return (id)v57;
}

void __46__VUISecureInvalidationManager_sharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;
  VUISecureInvalidationManager *v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUISecureInvalidationManager");
  v1 = (void *)sLogObject_6;
  sLogObject_6 = (uint64_t)v0;

  v2 = objc_alloc_init(VUISecureInvalidationManager);
  v3 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v2;

}

- (VUISecureInvalidationManager)init
{
  VUISecureInvalidationManager *v2;
  void *v3;
  uint64_t v4;
  TVPStateMachine *stateMachine;
  NSMutableArray *v6;
  NSMutableArray *keyLoaders;
  NSMutableSet *v8;
  NSMutableSet *penaltyBox;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VUISecureInvalidationManager;
  v2 = -[VUISecureInvalidationManager init](&v14, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), objc_opt_class());
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB1978]), "initWithName:initialState:mode:", v3, CFSTR("Idle"), 0);
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (TVPStateMachine *)v4;

    -[TVPStateMachine setLogObject:](v2->_stateMachine, "setLogObject:", sLogObject_6);
    -[VUISecureInvalidationManager _registerStateMachineHandlers](v2, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v2->_stateMachine, "setShouldAcceptEvents:", 1);
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    keyLoaders = v2->_keyLoaders;
    v2->_keyLoaders = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    penaltyBox = v2->_penaltyBox;
    v2->_penaltyBox = v8;

    v2->_backgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0DC6B70];
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__networkReachbilityDidChange_, v11, v12);

  }
  return v2;
}

- (void)_registerStateMachineHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[VUISecureInvalidationManager stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke;
  v17[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Invalidation requested"), CFSTR("Idle"), v17);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Invalidation requested"), CFSTR("Invalidation in progress"), &__block_literal_global_50);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Invalidation requested"), CFSTR("Invalidation in progress refresh when done"), &__block_literal_global_51);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Invalidation requested"), CFSTR("Waiting for network reachability to invalidate keys"), &__block_literal_global_52);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_4;
  v15[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Network reachability did change"), CFSTR("Waiting for network reachability to invalidate keys"), v15);
  v21[0] = CFSTR("Invalidation in progress");
  v21[1] = CFSTR("Invalidation in progress refresh when done");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_5;
  v13[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v3, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Network reachability did change"), v5, v13);

  v20[0] = CFSTR("Invalidation in progress");
  v20[1] = CFSTR("Invalidation in progress refresh when done");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_6;
  v11[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Network error did occur"), v6, v11);

  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_7;
  v9[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Invalidation did finish"), CFSTR("Invalidation in progress"), v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_54;
  v7[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Invalidation did finish"), CFSTR("Invalidation in progress refresh when done"), v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUISecureInvalidationManager;
  -[VUISecureInvalidationManager dealloc](&v4, sel_dealloc);
}

- (void)addDeletionInfoToPenaltyBox:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager addDeletionInfoToPenaltyBox:].cold.1((uint64_t)v4, v6, v7);
    -[VUISecureInvalidationManager penaltyBox](self, "penaltyBox");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);

  }
}

- (void)removeDeletionInfoFromPenaltyBox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VUISecureInvalidationManager penaltyBox](self, "penaltyBox");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
    {
      v8 = sLogObject_6;
      if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Removing deletion info from penalty box: %@", (uint8_t *)&v10, 0xCu);
      }
      -[VUISecureInvalidationManager penaltyBox](self, "penaltyBox");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v5);

    }
  }

}

- (BOOL)storeFPSKeyLoader:(id)a3 shouldKeyRequestContinueInvalidationAfterLoadingNonce:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];

  objc_msgSend(a4, "keyIdentifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sidebandMediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingFpsKeyInfoForKeyURI:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7 == 0;
    if (v7)
    {
      v9 = sLogObject_6;
      if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Found new key while trying to delete old one.  Not continuing invalidation.", v11, 2u);
      }
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke(uint64_t a1)
{
  void **v1;
  uint64_t result;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = (void **)(a1 + 32);
  result = objc_msgSend(*(id *)(a1 + 32), "backgroundTaskIdentifier");
  v3 = *MEMORY[0x1E0DC4878];
  if (result != *MEMORY[0x1E0DC4878])
  {
    v4 = (void *)sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke_cold_1(v1, v4);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*v1, "backgroundTaskIdentifier"));

    return objc_msgSend(*v1, "setBackgroundTaskIdentifier:", v3);
  }
  return result;
}

void __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke_38(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because invalidation has finished", v5, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification"), 0);

  objc_msgSend(WeakRetained, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:", CFSTR("Invalidation did finish"));

}

- (void)_sendInvalidationRequestsForDeletionInfoArrays:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = 134217984;
    v11 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Will invalidate %lu tuple(s) of (keyServerURL, nonceURL, dsid)", (uint8_t *)&v10, 0xCu);

  }
  -[VUISecureInvalidationManager _sendInvalidationRequestsForFirstArray:completion:](self, "_sendInvalidationRequestsForFirstArray:completion:", v6, v7);

}

- (void)_sendInvalidationRequestsForFirstArray:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  VUIStoreFPSKeyLoader *v25;
  void *v26;
  VUIStoreFPSKeyLoader *v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  id v33;
  uint64_t v35;
  _QWORD v36[4];
  VUIStoreFPSKeyLoader *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v30 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v29 = v6;
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v7;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v35)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v32 = *(_QWORD *)v50;
      do
      {
        v11 = 0;
        v12 = v8;
        v13 = v9;
        v14 = v10;
        do
        {
          if (*(_QWORD *)v50 != v32)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v11);
          v47 = v13;
          v48 = v14;
          v45 = 0;
          v46 = 0;
          v43 = 0;
          v44 = v12;
          v42 = 0;
          -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:](self, "_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:", v15, &v48, &v47, &v46, &v45, &v44, &v43, &v42);
          v10 = v48;

          v9 = v47;
          v16 = v46;
          v17 = v45;
          v8 = v44;

          v18 = v43;
          v19 = v42;
          objc_msgSend(MEMORY[0x1E0DB1918], "secureInvalidationRequestForIdentifier:offlineKeyData:additionalRequestParams:contentID:", v16, v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setContext:", v15);
          objc_msgSend(v33, "addObject:", v20);

          ++v11;
          v12 = v8;
          v13 = v9;
          v14 = v10;
        }
        while (v35 != v11);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v35);
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }

    v22 = (void *)sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = objc_msgSend(v33, "count");
      *(_DWORD *)buf = 134218754;
      v54 = v24;
      v55 = 2112;
      v56 = v10;
      v57 = 2112;
      v58 = v9;
      v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "Sending %lu invalidation request(s) to key loader for tuple (%@, %@, %@)", buf, 0x2Au);

    }
    v25 = -[VUIStoreFPSKeyLoader initWithCertificateURL:keyServerURL:]([VUIStoreFPSKeyLoader alloc], "initWithCertificateURL:keyServerURL:", 0, v10);
    -[VUIStoreFPSKeyLoader setUsesKeyIdentifierPenaltyBox:](v25, "setUsesKeyIdentifierPenaltyBox:", 0);
    -[VUIStoreFPSKeyLoader setDelegate:](v25, "setDelegate:", self);
    -[VUIStoreFPSKeyLoader setSecureInvalidationNonceURL:](v25, "setSecureInvalidationNonceURL:", v9);
    -[VUIStoreFPSKeyLoader setSecureInvalidationDSID:](v25, "setSecureInvalidationDSID:", v8);
    -[VUISecureInvalidationManager keyLoaders](self, "keyLoaders");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v25);

    objc_initWeak((id *)buf, self);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke;
    v36[3] = &unk_1E9F9A128;
    objc_copyWeak(&v41, (id *)buf);
    v27 = v25;
    v37 = v27;
    v28 = v33;
    v38 = v28;
    v39 = v30;
    v40 = v29;
    -[VUIStoreFPSKeyLoader invalidateKeysWithRequests:completion:](v27, "invalidateKeysWithRequests:completion:", v28, v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);

    v6 = (void (**)(_QWORD))v29;
  }
  else
  {
    v21 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Done making invalidation requests", buf, 2u);
    }
    if (v6)
      v6[2](v6);
  }

}

void __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id WeakRetained;
  uint8_t v28;
  _BYTE v29[15];
  uint8_t v30;
  _BYTE v31[15];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "keyLoaders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = a1;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    v7 = *MEMORY[0x1E0CB32E8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v9, "context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = sLogObject_6;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
          {
            v20 = v12;
            objc_msgSend(v9, "error");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v37 = v10;
            v38 = 2112;
            v39 = v21;
            _os_log_error_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_ERROR, "Error invalidating key: %@, %@", buf, 0x16u);

          }
          objc_msgSend(v9, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "domain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v7);

          if (v15)
          {
            v16 = sLogObject_6;
            if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
              __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke_cold_1(&v30, v31, v16);
            objc_msgSend(WeakRetained, "stateMachine");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "postEvent:", CFSTR("Network error did occur"));
          }
          else
          {
            objc_msgSend(v10, "objectID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = sLogObject_6;
              if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
                __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke_cold_2(&v28, v29, v18);
              objc_msgSend(WeakRetained, "penaltyBox");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v17);

            }
          }

        }
        else
        {
          if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v10;
            _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Successfully invalidated %@", buf, 0xCu);
          }
          if (v10)
            objc_msgSend(v26, "addObject:", v10);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v26, "count"))
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sidebandMediaLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deleteFPSKeyDeletionInfos:", v26);

  }
  objc_msgSend(*(id *)(v25 + 48), "subarrayWithRange:", 1, objc_msgSend(*(id *)(v25 + 48), "count") - 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sendInvalidationRequestsForFirstArray:completion:", v24, *(_QWORD *)(v25 + 56));

}

- (BOOL)_validateParamsForDeletionInfo:(id)a3
{
  return -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:](self, "_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:", a3, 0, 0, 0, 0, 0, 0, 0);
}

- (BOOL)_getParamsForDeletionInfo:(id)a3 keyServerURL:(id *)a4 nonceURL:(id *)a5 keyIdentifier:(id *)a6 offlineKeyData:(id *)a7 dsid:(id *)a8 additionalRequestParams:(id *)a9 contentID:(id *)a10
{
  id v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;

  v15 = a3;
  objc_msgSend(v15, "keyData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  v18 = v17 != 0;
  if (v17 || !os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
  {
    if (!a7)
      goto LABEL_5;
    goto LABEL_4;
  }
  -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.9();
  if (a7)
LABEL_4:
    *a7 = objc_retainAutorelease(v16);
LABEL_5:
  objc_msgSend(v15, "fpsKeyServerURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.8();
    v18 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v19);
  objc_msgSend(v15, "fpsNonceURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.7();
    v18 = 0;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v20);
  objc_msgSend(v15, "keyURI");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.6();
    v18 = 0;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v21);
  objc_msgSend(v15, "dsid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22 || objc_msgSend(v22, "isEqualToNumber:", &unk_1EA0B9550))
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.5();
    v18 = 0;
  }
  if (a8)
    *a8 = objc_retainAutorelease(v23);
  objc_msgSend(v15, "additionalFPSRequestParamsJSONData", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v16;
  if (!objc_msgSend(v24, "length"))
  {
    v27 = (id)MEMORY[0x1E0C9AA70];
    goto LABEL_41;
  }
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v24, 0, &v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v34;
  if (!v25)
  {
    v28 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.3((uint64_t)v26, v28, v29);
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.4();
LABEL_39:
    v27 = (id)MEMORY[0x1E0C9AA70];
    goto LABEL_40;
  }
  v27 = v25;
LABEL_40:

LABEL_41:
  if (!objc_msgSend(v27, "count"))
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.2();
    v18 = 0;
  }
  if (a9)
    *a9 = objc_retainAutorelease(v27);
  objc_msgSend(v15, "contentID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v30, "length"))
  {
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_ERROR))
      -[VUISecureInvalidationManager _getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:].cold.1();
    v18 = 0;
  }
  if (a10)
    *a10 = objc_retainAutorelease(v30);

  return v18;
}

- (void)_networkReachbilityDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0DC6A38];
    v6 = v4;
    objc_msgSend(v5, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isNetworkReachable");
    v9 = CFSTR("NO");
    if (v8)
      v9 = CFSTR("YES");
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Network reachability did change.  Is reachable: %@", (uint8_t *)&v11, 0xCu);

  }
  -[VUISecureInvalidationManager stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postEvent:", CFSTR("Network reachability did change"));

}

const __CFString *__61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_49()
{
  return CFSTR("Invalidation in progress refresh when done");
}

uint64_t __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

uint64_t __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

id __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isNetworkReachable");

  if (v7)
  {
    objc_msgSend(WeakRetained, "_invalidateKeysForDeletedVideos");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

id __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNetworkReachable");

  if ((v6 & 1) == 0)
    objc_msgSend(WeakRetained, "setNetworkErrorOccurredDuringInvalidation:", 1);
  objc_msgSend(v3, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setNetworkErrorOccurredDuringInvalidation:", 1);
  objc_msgSend(v3, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *__61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "networkErrorOccurredDuringInvalidation"))
  {
    v2 = sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Network error occurred during invalidation.  Waiting for reachability to change and try again.", (uint8_t *)&v11, 2u);
    }
    objc_msgSend(WeakRetained, "setNetworkErrorOccurredDuringInvalidation:", 0);
    v3 = CFSTR("Waiting for network reachability to invalidate keys");
  }
  else
  {
    v3 = CFSTR("Idle");
  }
  v4 = objc_msgSend(WeakRetained, "backgroundTaskIdentifier");
  v5 = *MEMORY[0x1E0DC4878];
  if (v4 != *MEMORY[0x1E0DC4878])
  {
    v6 = (void *)sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = objc_msgSend(WeakRetained, "backgroundTaskIdentifier");
      v11 = 134217984;
      v12 = v8;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Ending background task with identifier %lu", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskIdentifier"));

    objc_msgSend(WeakRetained, "setBackgroundTaskIdentifier:", v5);
  }

  return v3;
}

__CFString *__61__VUISecureInvalidationManager__registerStateMachineHandlers__block_invoke_54(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNetworkErrorOccurredDuringInvalidation:", 0);
  v2 = objc_msgSend(WeakRetained, "backgroundTaskIdentifier");
  v3 = *MEMORY[0x1E0DC4878];
  if (v2 != *MEMORY[0x1E0DC4878])
  {
    v4 = (void *)sLogObject_6;
    if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v11 = 134217984;
      v12 = objc_msgSend(WeakRetained, "backgroundTaskIdentifier");
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Ending background task with identifier %lu", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskIdentifier"));

    objc_msgSend(WeakRetained, "setBackgroundTaskIdentifier:", v3);
  }
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNetworkReachable");

  if (v8)
  {
    objc_msgSend(WeakRetained, "_invalidateKeysForDeletedVideos");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("Waiting for network reachability to invalidate keys");
  }

  return v9;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (NSMutableArray)keyLoaders
{
  return self->_keyLoaders;
}

- (void)setKeyLoaders:(id)a3
{
  objc_storeStrong((id *)&self->_keyLoaders, a3);
}

- (NSMutableSet)penaltyBox
{
  return self->_penaltyBox;
}

- (void)setPenaltyBox:(id)a3
{
  objc_storeStrong((id *)&self->_penaltyBox, a3);
}

- (BOOL)networkErrorOccurredDuringInvalidation
{
  return self->_networkErrorOccurredDuringInvalidation;
}

- (void)setNetworkErrorOccurredDuringInvalidation:(BOOL)a3
{
  self->_networkErrorOccurredDuringInvalidation = a3;
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_penaltyBox, 0);
  objc_storeStrong((id *)&self->_keyLoaders, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

- (void)addDeletionInfoToPenaltyBox:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_22(&dword_1D96EE000, a2, a3, "Adding deletion info to penalty box: %@", (uint8_t *)&v3);
}

- (void)_invalidateKeysForDeletedVideos
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to begin background task since identifier is UIBackgroundTaskInvalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __63__VUISecureInvalidationManager__invalidateKeysForDeletedVideos__block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  v5 = 134217984;
  v6 = objc_msgSend(v2, "backgroundTaskIdentifier");
  OUTLINED_FUNCTION_1_22(&dword_1D96EE000, v3, v4, "VUISecureInvalidationManager with task identifier %lu expired.  Ending background task", (uint8_t *)&v5);

}

void __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_11(&dword_1D96EE000, a3, (uint64_t)a3, "Not adding to penalty box because this is a network error", a1);
}

void __82__VUISecureInvalidationManager__sendInvalidationRequestsForFirstArray_completion___block_invoke_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_11(&dword_1D96EE000, a3, (uint64_t)a3, "Adding to penalty box", a1);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to invalidate key since contentID is not present", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to invalidate key since key additional request params are empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_getParamsForDeletionInfo:(uint64_t)a3 keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_22(&dword_1D96EE000, a2, a3, "Unable to deserialize fpsAdditionalServerParams: %@", (uint8_t *)&v3);
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Ignoring fpsAdditionalServerParams because it is not a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to invalidate key since key dsid is nil or zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to invalidate key since key identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to invalidate key since nonce URL is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to invalidate key since key server URL is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_getParamsForDeletionInfo:keyServerURL:nonceURL:keyIdentifier:offlineKeyData:dsid:additionalRequestParams:contentID:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to invalidate key since key data has zero length", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

@end
