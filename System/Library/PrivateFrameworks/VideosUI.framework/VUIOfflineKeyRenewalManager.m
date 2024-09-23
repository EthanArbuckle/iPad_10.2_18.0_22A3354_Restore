@implementation VUIOfflineKeyRenewalManager

- (VUIOfflineKeyRenewalManager)init
{
  VUIOfflineKeyRenewalManager *v2;
  void *v3;
  uint64_t v4;
  TVPStateMachine *stateMachine;
  NSMutableDictionary *v6;
  NSMutableDictionary *keyLoaders;
  NSMutableDictionary *v8;
  NSMutableDictionary *contentKeySessions;
  NSMutableArray *v10;
  NSMutableArray *downloadsForRepairingKeys;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VUIOfflineKeyRenewalManager;
  v2 = -[VUIOfflineKeyRenewalManager init](&v21, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), objc_opt_class());
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB1978]), "initWithName:initialState:mode:", v3, CFSTR("Idle"), 0);
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (TVPStateMachine *)v4;

    -[TVPStateMachine setLogObject:](v2->_stateMachine, "setLogObject:", sLogObject_22);
    -[VUIOfflineKeyRenewalManager _registerStateMachineHandlers](v2, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v2->_stateMachine, "setShouldAcceptEvents:", 1);
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyLoaders = v2->_keyLoaders;
    v2->_keyLoaders = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentKeySessions = v2->_contentKeySessions;
    v2->_contentKeySessions = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    downloadsForRepairingKeys = v2->_downloadsForRepairingKeys;
    v2->_downloadsForRepairingKeys = v10;

    v2->_backgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0DC6B70];
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__networkReachbilityDidChange_, v13, v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__isPlaybackUIBeingShownDidChange_, v16, v17);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

  }
  return v2;
}

- (void)_registerStateMachineHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id location;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  const __CFString *v44;
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[VUIOfflineKeyRenewalManager stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_4;
  aBlock[3] = &unk_1E9FA3BB8;
  objc_copyWeak(&v39, &location);
  v36 = &__block_literal_global_145;
  v37 = &__block_literal_global_73;
  v38 = &__block_literal_global_71_0;
  v5 = _Block_copy(aBlock);
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_78;
  v29[3] = &unk_1E9FA3C08;
  objc_copyWeak(&v34, &location);
  v30 = &__block_literal_global_73;
  v6 = v5;
  v31 = v6;
  v32 = &__block_literal_global_145;
  v33 = &__block_literal_global_69_0;
  v7 = _Block_copy(v29);
  v45[0] = CFSTR("Update requested");
  v45[1] = CFSTR("Key renewal timer did fire");
  v45[2] = CFSTR("Expiration timer did fire");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = CFSTR("Idle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_85;
  v23[3] = &unk_1E9F9D870;
  objc_copyWeak(&v28, &location);
  v10 = v6;
  v24 = v10;
  v25 = &__block_literal_global_145;
  v26 = &__block_literal_global_69_0;
  v11 = v7;
  v27 = v11;
  objc_msgSend(v3, "registerHandlerForEvents:onStates:withBlock:", v8, v9, v23);

  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Update requested"), CFSTR("Waiting for network reachability to check for renewals"), &__block_literal_global_93);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Update requested"), CFSTR("Renewal in progress"), &__block_literal_global_96);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Update requested"), CFSTR("Renewal in progress update when done"), &__block_literal_global_98_0);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Renewal did finish"), CFSTR("Renewal in progress"), &__block_literal_global_99);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Renewal did finish"), CFSTR("Renewal in progress update when done"), &__block_literal_global_100);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_8;
  v21[3] = &unk_1E9F9BFC0;
  v12 = v10;
  v22 = v12;
  objc_msgSend(v3, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Expiration timer did fire"), v21);
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Key renewal timer did fire"), CFSTR("Waiting for network reachability to check for renewals"), &__block_literal_global_101_0);
  v43[0] = CFSTR("Renewal in progress");
  v43[1] = CFSTR("Renewal in progress update when done");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Network error did occur"), v13, &__block_literal_global_102);

  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Network reachability did change"), CFSTR("Waiting for network reachability to check for renewals"), &__block_literal_global_103);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_14;
  v19[3] = &unk_1E9F9BFC0;
  v14 = v12;
  v20 = v14;
  objc_msgSend(v3, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Playback UI being shown did change"), v19);
  v42[0] = CFSTR("Idle");
  v42[1] = CFSTR("Waiting for network reachability to check for renewals");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_15;
  v17[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v3, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Application did enter background"), v15, v17);

  v41[0] = CFSTR("Idle");
  v41[1] = CFSTR("Waiting for network reachability to check for renewals");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Application will enter foreground"), v16, &__block_literal_global_105_0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&location);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)updateKeyRenewalAndExpiration
{
  id v2;

  -[VUIOfflineKeyRenewalManager stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Update requested"));

}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v28;
  id obj;
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sidebandMediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA0BBB98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videosWithDownloadStates:entitlementTypes:useMainThreadContext:", v9, 0, 1);
  v10 = objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v24 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v32)
  {
    v30 = v5;
    v31 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v12, "fpsKeyInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (!v14)
        {

          v22 = v5;
LABEL_21:
          objc_msgSend(v22, "addObject:", v12);
          continue;
        }
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "expirationDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              objc_msgSend(v19, "earlierDate:", v6);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21 == v20)
                objc_msgSend(v4, "addObject:", v12);
              v16 = 1;
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v15);

        v5 = v30;
        v22 = v30;
        if ((v16 & 1) == 0)
          goto LABEL_21;
        v23 = objc_msgSend(v4, "containsObject:", v12);
        v22 = v28;
        if ((v23 & 1) == 0)
          goto LABEL_21;
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v32);
  }

  if (a2)
    *a2 = objc_retainAutorelease(v4);
  if (a3)
    *a3 = objc_retainAutorelease(v28);
  if (a4)
    *a4 = objc_retainAutorelease(v5);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VUIOfflineKeyRenewalManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_33 != -1)
    dispatch_once(&sharedInstance_onceToken_33, block);
  return (id)sharedInstance_instance_7;
}

void __45__VUIOfflineKeyRenewalManager_sharedInstance__block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = os_log_create("com.apple.AppleTV.playback", "VUIOfflineKeyRenewalManager");
  v3 = (void *)sLogObject_22;
  sLogObject_22 = (uint64_t)v2;

  v4 = objc_alloc_init(*(Class *)(a1 + 32));
  v5 = (void *)sharedInstance_instance_7;
  sharedInstance_instance_7 = (uint64_t)v4;

}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "expirationTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating expiration timer", buf, 2u);
    }
    objc_msgSend(WeakRetained, "expirationTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(WeakRetained, "setExpirationTimer:", 0);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v68 = 0;
  v69 = 0;
  v67 = 0;
  (*(void (**)(void))(v5 + 16))();
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v73 = v11;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Found %lu expired download(s)", buf, 0xCu);

  }
  v12 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v73 = v14;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu unexpired download(s)", buf, 0xCu);

  }
  v15 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134217984;
    v73 = v17;
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu download(s) that will never expire", buf, 0xCu);

  }
  if (objc_msgSend(v6, "count"))
  {
    v54 = v8;
    v55 = v7;
    v57 = WeakRetained;
    v18 = (void *)objc_msgSend(v6, "mutableCopy");
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v56 = v6;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v64 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
          {
            v25 = sLogObject_22;
            if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v73 = (uint64_t)v24;
              _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "Video is expired, but it is being played.  Will delete when playback ends: %@", buf, 0xCu);
            }
            objc_msgSend(v18, "removeObject:", v24);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v21);
    }

    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v28 = v18;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v60 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          objc_msgSend(v33, "availabilityEndDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v33, "allowsManualRenewal"))
          {
            v38 = sLogObject_22;
            v39 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
            v37 = v26;
            if (!v39)
              goto LABEL_38;
            *(_WORD *)buf = 0;
            v40 = v38;
            v41 = "Deleting expired video since it does not allow manual renewal";
LABEL_37:
            _os_log_impl(&dword_1D96EE000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
            v37 = v26;
            goto LABEL_38;
          }
          if (v34 && !objc_msgSend(v34, "vui_isInTheFuture"))
          {
            v42 = sLogObject_22;
            v43 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
            v37 = v26;
            if (!v43)
              goto LABEL_38;
            *(_WORD *)buf = 0;
            v40 = v42;
            v41 = "Deleting expired video even though it allows manual renewal, since it is outside the availability window";
            goto LABEL_37;
          }
          v35 = sLogObject_22;
          v36 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
          v37 = v27;
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v35, OS_LOG_TYPE_DEFAULT, "Invalidating (but not deleting) expired video since it allows manual key renewal and is still within availability window", buf, 2u);
            v37 = v27;
          }
LABEL_38:
          objc_msgSend(v37, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v30);
    }

    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sidebandMediaLibrary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "removeDownloadedMediaForVideoManagedObjects:markAsDeleted:invalidateImmediately:", v26, 0, 1);

    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sidebandMediaLibrary");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "invalidateKeysForVideoManagedObjects:", v27);

    v6 = v56;
    WeakRetained = v57;
    v8 = v54;
    v7 = v55;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = (uint64_t)v48;
    _os_log_impl(&dword_1D96EE000, v49, OS_LOG_TYPE_DEFAULT, "Next expiration date is %@", buf, 0xCu);
  }
  if (v48)
  {
    objc_msgSend(v48, "dateByAddingTimeInterval:", 5.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v73 = (uint64_t)v50;
      _os_log_impl(&dword_1D96EE000, v51, OS_LOG_TYPE_DEFAULT, "Expiration date for one or more downloads is in the future.  Scheduling expiration timer for %@", buf, 0xCu);
    }
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v50, WeakRetained, sel__expirationTimerDidFire_, 0, 0, 0.0);
    objc_msgSend(WeakRetained, "setExpirationTimer:", v52);
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addTimer:forMode:", v52, *MEMORY[0x1E0C99748]);

  }
}

id __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a2;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v7, "fpsKeyInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "expirationDate");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v13)
              {
                if (v4)
                {
                  objc_msgSend(v13, "earlierDate:", v4);
                  v15 = objc_claimAutoreleasedReturnValue();

                  v4 = (id)v15;
                }
                else
                {
                  v4 = v13;
                }
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v10);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSTimer)keyRenewalTimer
{
  return self->_keyRenewalTimer;
}

- (NSTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (void)storeFPSKeyLoader:(id)a3 didLoadOfflineKeyData:(id)a4 forKeyRequest:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v5 = a5;
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sidebandMediaLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fpsKeyInfoForVideo:keyURI:createIfNeeded:wasCreated:", v6, v7, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "populateFromKeyRequest:video:", v5, v6);
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sidebandMediaLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "saveChangesToManagedObjects");

    if (!objc_msgSend(v6, "downloadState"))
    {
      v13 = sLogObject_22;
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Offline keys renewed for an item that is no longer downloading or downloaded.  Invalidating keys.", v16, 2u);
      }
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sidebandMediaLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeDownloadedMediaForVideoManagedObject:markAsDeleted:invalidateImmediately:", v6, 0, 1);

    }
  }

}

- (void)download:(id)a3 didChangeStateTo:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v7 = v6;
  if ((unint64_t)(a4 - 3) <= 2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__VUIOfflineKeyRenewalManager_download_didChangeStateTo___block_invoke;
    v8[3] = &unk_1E9F98FD8;
    v8[4] = self;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __57__VUIOfflineKeyRenewalManager_download_didChangeStateTo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "downloadsForRepairingKeys");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

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
  v4 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
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
  -[VUIOfflineKeyRenewalManager stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postEvent:", CFSTR("Network reachability did change"));

}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPlaybackUIBeingShown");
    v8 = CFSTR("NO");
    if (v7)
      v8 = CFSTR("YES");
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "isPlaybackUIBeingShown did change to %@", (uint8_t *)&v10, 0xCu);

  }
  -[VUIOfflineKeyRenewalManager stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postEvent:", CFSTR("Playback UI being shown did change"));

}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v3;

  -[VUIOfflineKeyRenewalManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Application did enter background"));

}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v3;

  -[VUIOfflineKeyRenewalManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Application will enter foreground"));

}

- (void)_renewalTimerDidFire:(id)a3
{
  id v4;

  -[VUIOfflineKeyRenewalManager setKeyRenewalTimer:](self, "setKeyRenewalTimer:", 0);
  -[VUIOfflineKeyRenewalManager stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:", CFSTR("Key renewal timer did fire"));

}

- (void)_expirationTimerDidFire:(id)a3
{
  id v4;

  -[VUIOfflineKeyRenewalManager setExpirationTimer:](self, "setExpirationTimer:", 0);
  -[VUIOfflineKeyRenewalManager stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:", CFSTR("Expiration timer did fire"));

}

- (void)_renewKeysForVideosGroupedByCertURL:(id)a3 outCompletedKeyRequests:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  id v22;
  id location;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fpsCertificateURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fpsKeyServerURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v15 = (id)sLogObject_22;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134218498;
      v25 = v16;
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Renewing %lu video(s) for tuple (%@, %@)", buf, 0x20u);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __102__VUIOfflineKeyRenewalManager__renewKeysForVideosGroupedByCertURL_outCompletedKeyRequests_completion___block_invoke;
    v18[3] = &unk_1E9F997F0;
    objc_copyWeak(&v22, &location);
    v19 = v8;
    v20 = v9;
    v21 = v10;
    -[VUIOfflineKeyRenewalManager _renewKeysForVideos:outCompletedKeyRequests:completion:](self, "_renewKeysForVideos:outCompletedKeyRequests:completion:", v11, v20, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  else
  {
    v17 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Done renewing keys for all videos", buf, 2u);
    }
    if (v10)
      v10[2](v10);
  }

}

void __102__VUIOfflineKeyRenewalManager__renewKeysForVideosGroupedByCertURL_outCompletedKeyRequests_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 32), "count") - 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_renewKeysForVideosGroupedByCertURL:outCompletedKeyRequests:completion:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_renewKeysForVideos:(id)a3 outCompletedKeyRequests:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    v29 = v9;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke;
    v42[3] = &unk_1E9FA3A68;
    v30 = v11;
    v43 = v30;
    v13 = v10;
    v44 = v13;
    v14 = v12;
    v45 = v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v42);
    objc_msgSend(v8, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fpsCertificateURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fpsKeyServerURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIOfflineKeyRenewalManager contentKeySessions](self, "contentKeySessions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v21 = sLogObject_22;
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v18;
        _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Creating content key session for tuple %@", buf, 0xCu);
      }
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1920]), "initWithContentKeyLoader:avAsset:", 0, 0);
      -[VUIOfflineKeyRenewalManager contentKeySessions](self, "contentKeySessions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v20, v18);

    }
    objc_initWeak((id *)buf, self);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke_57;
    v32[3] = &unk_1E9FA3A90;
    objc_copyWeak(&v41, (id *)buf);
    v33 = v31;
    v23 = v14;
    v34 = v23;
    v24 = v18;
    v35 = v24;
    v25 = v16;
    v36 = v25;
    v26 = v17;
    v37 = v26;
    v27 = v13;
    v38 = v27;
    v39 = v8;
    v40 = v29;
    objc_msgSend(v20, "generateOfflineKeyRequestsForIdentifiers:completion:", v30, v32);

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);

    v9 = (void (**)(_QWORD))v29;
  }
  else
  {
    v28 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "Done renewing keys for tuple", buf, 2u);
    }
    if (v9)
      v9[2](v9);
  }

}

void __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[VUIOfflineKeyRenewalManager _keyInfosForVideo:outKeyIdentifiers:](VUIOfflineKeyRenewalManager, "_keyInfosForVideo:outKeyIdentifiers:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3
    && (v10 = objc_msgSend(a1[4], "count"),
        v11 = objc_msgSend(v8, "count") + v10,
        v11 >= +[VUIStoreFPSKeyLoader maximumRequestBatchSize](VUIStoreFPSKeyLoader, "maximumRequestBatchSize")))
  {
    *a4 = 1;
  }
  else
  {
    v12 = (void *)sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v7, "canonicalID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Renewing keys for %@ (%@)", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(a1[5], "addObject:", v7);
    objc_msgSend(a1[4], "addObjectsFromArray:", v8);
    objc_msgSend(a1[6], "unionSet:", v9);
  }

}

void __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  VUIStoreFPSKeyLoader *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id *from;
  id *froma;
  id WeakRetained;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  id v80;
  __int16 v81;
  uint64_t v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v51 = a1;
  from = (id *)(a1 + 96);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v4 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 134217984;
    v78 = objc_msgSend(v3, "count", from);
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Generated %lu key requests", buf, 0xCu);

  }
  objc_msgSend(*(id *)(v51 + 32), "addObjectsFromArray:", v3, from);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v3;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  if (v52)
  {
    v49 = *(id *)v74;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(id *)v74 != v49)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v8 = *(id *)(v51 + 40);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v70;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v70 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
              objc_msgSend(v12, "keyURI");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "keyIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "isEqual:", v14);

              if (v15)
              {
                objc_msgSend(v12, "video");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setContext:", v16);

                objc_msgSend(v12, "video");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "additionalFPSRequestParams");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setAdditionalRequestParams:", v18);

                objc_msgSend(v12, "keyData");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setOfflineKeyData:", v19);

                objc_msgSend(v12, "contentID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setContentID:", v20);

                goto LABEL_18;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
    }
    while (v52);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v50 = *(id *)(v51 + 40);
  v21 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
  if (!v21)
    goto LABEL_43;
  v53 = *(_QWORD *)v66;
  do
  {
    for (k = 0; k != v21; ++k)
    {
      if (*(_QWORD *)v66 != v53)
        objc_enumerationMutation(v50);
      v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
      objc_msgSend(v23, "keyURI");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (v25)
        goto LABEL_35;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v26 = obj;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v83, 16);
      if (!v27)
      {
LABEL_34:

LABEL_35:
        objc_msgSend(v23, "renewalInterval");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          objc_msgSend(v34, "dateByAddingTimeInterval:");
          v26 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v26 = 0;
        }
        v35 = sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v78 = (uint64_t)v23;
          v79 = 2112;
          v80 = v26;
          _os_log_error_impl(&dword_1D96EE000, v35, OS_LOG_TYPE_ERROR, "Unable to generate key request for %@.  Resetting renewal date to %@", buf, 0x16u);
        }
        objc_msgSend(v23, "setRenewalDate:", v26);

        goto LABEL_41;
      }
      v28 = *(_QWORD *)v62;
LABEL_28:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v62 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v29);
        objc_msgSend(v23, "keyURI");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "keyIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v30) = objc_msgSend(v31, "isEqual:", v32);

        if ((v30 & 1) != 0)
          break;
        if (v27 == ++v29)
        {
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v83, 16);
          if (v27)
            goto LABEL_28;
          goto LABEL_34;
        }
      }
LABEL_41:

    }
    v21 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
  }
  while (v21);
LABEL_43:

  objc_msgSend(WeakRetained, "keyLoaders");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKey:", *(_QWORD *)(v51 + 48));
  v37 = (VUIStoreFPSKeyLoader *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    v38 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(_QWORD *)(v51 + 48);
      *(_DWORD *)buf = 138412290;
      v78 = v39;
      _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "Creating key loader for tuple %@", buf, 0xCu);
    }
    v37 = -[VUIStoreFPSKeyLoader initWithCertificateURL:keyServerURL:]([VUIStoreFPSKeyLoader alloc], "initWithCertificateURL:keyServerURL:", *(_QWORD *)(v51 + 56), *(_QWORD *)(v51 + 64));
    -[VUIStoreFPSKeyLoader setUsesKeyIdentifierPenaltyBox:](v37, "setUsesKeyIdentifierPenaltyBox:", 0);
    -[VUIStoreFPSKeyLoader setDelegate:](v37, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "keyLoaders");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKey:", v37, *(_QWORD *)(v51 + 48));

  }
  v41 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    v42 = v41;
    v43 = objc_msgSend(obj, "count");
    v44 = *(void **)(v51 + 56);
    v45 = *(_QWORD *)(v51 + 64);
    *(_DWORD *)buf = 134218498;
    v78 = v43;
    v79 = 2112;
    v80 = v44;
    v81 = 2112;
    v82 = v45;
    _os_log_impl(&dword_1D96EE000, v42, OS_LOG_TYPE_DEFAULT, "Sending %lu offline key request(s) to key loader for tuple (%@, %@)", buf, 0x20u);

  }
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke_59;
  v55[3] = &unk_1E9F9A128;
  objc_copyWeak(&v60, froma);
  v56 = *(id *)(v51 + 72);
  v57 = *(id *)(v51 + 80);
  v58 = *(id *)(v51 + 32);
  v59 = *(id *)(v51 + 88);
  -[VUIStoreFPSKeyLoader loadFairPlayStreamingKeyRequests:completion:](v37, "loadFairPlayStreamingKeyRequests:completion:", obj, v55);

  objc_destroyWeak(&v60);
}

void __86__VUIOfflineKeyRenewalManager__renewKeysForVideos_outCompletedKeyRequests_completion___block_invoke_59(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v1);
        v6 = (void *)sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v8 = v6;
          objc_msgSend(v7, "canonicalID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "title");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v19 = v9;
          v20 = 2112;
          v21 = v10;
          _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Done renewing keys for %@ (%@)", buf, 0x16u);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", objc_msgSend(*(id *)(a1 + 32), "count"), objc_msgSend(*(id *)(a1 + 40), "count") - objc_msgSend(*(id *)(a1 + 32), "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_renewKeysForVideos:outCompletedKeyRequests:completion:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

+ (id)_keyInfosForVideo:(id)a3 outKeyIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "fpsKeyInfo", 0);
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
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "addObject:", v13);
        objc_msgSend(v13, "keyURI");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v6, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)_fetchNewKeysForVideosWithBrokenKeys:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  VUIStoreAuxMediaItem *v11;
  void *v12;
  void *v13;
  VUIStoreAuxMediaItem *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 138412290;
    v18 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v10 = sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v25 = v9;
          _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Fetching new keys for %@", buf, 0xCu);
        }
        v11 = -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:]([VUIStoreAuxMediaItem alloc], "initWithVideoManagedObject:isForStartingDownload:", v9, 0);
        +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentMediaItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "isEqualToMediaItem:", v11))
        {
          v14 = v13;

          v11 = v14;
        }
        objc_msgSend(MEMORY[0x1E0DB1930], "sharedInstance", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "downloadForMediaItem:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUIOfflineKeyRenewalManager downloadsForRepairingKeys](self, "downloadsForRepairingKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v16);

        -[VUIStoreAuxMediaItem setIgnoreExistingOfflineKeyData:](v11, "setIgnoreExistingOfflineKeyData:", 1);
        objc_msgSend(v16, "setPerformKeyFetchOnly:", 1);
        objc_msgSend(v16, "addDelegate:", self);
        objc_msgSend(v16, "start");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_67(uint64_t a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  void *v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a2;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  v4 = 0;
  v5 = 0;
  if (v29)
  {
    v28 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v7, "fpsKeyInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v31 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v13, "renewalDate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (v14)
              {
                if (v5)
                {
                  objc_msgSend(v14, "earlierDate:", v5);
                  v16 = objc_claimAutoreleasedReturnValue();

                  v5 = (id)v16;
                }
                else
                {
                  v5 = v14;
                }
              }
              objc_msgSend(v13, "renewalInterval");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17;
              if (v17)
              {
                if (!v4 || (objc_msgSend(v17, "doubleValue"), v20 = v19, objc_msgSend(v4, "doubleValue"), v20 < v21))
                {
                  v22 = v18;

                  v4 = v22;
                }
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v10);
        }

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v29);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v5);
  if (a4)
    *a4 = objc_retainAutorelease(v4);
  if (v5)
    v23 = objc_msgSend(v5, "vui_isInThePast");
  else
    v23 = 0;

  return v23;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "canonicalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPlaybackUIBeingShown");

    if ((_DWORD)v4)
    {
      +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentMediaItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v4 = objc_msgSend(v7, "isEqual:", v2);
      else
        v4 = 0;

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_78(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id *v21;
  id *from;
  id WeakRetained;
  id obj;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = a1;
  from = a1 + 8;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "fpsCertificateURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fpsKeyServerURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%@"), v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKey:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v13, "addObject:", v8);
        objc_msgSend(v4, "setObject:forKey:", v13, v12);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v5);
  }

  v14 = (void *)sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = objc_msgSend(obj, "count");
    v17 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134218240;
    v37 = v16;
    v38 = 2048;
    v39 = v17;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Will renew keys for %lu videos with %lu tuple(s) of (certificateURL, keyServerURL)", buf, 0x16u);

  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_79;
  v25[3] = &unk_1E9FA3BE0;
  objc_copyWeak(&v31, from);
  v20 = v18;
  v26 = v20;
  v27 = v21[4];
  v28 = v21[5];
  v29 = v21[6];
  v30 = v21[7];
  objc_msgSend(WeakRetained, "_renewKeysForVideosGroupedByCertURL:outCompletedKeyRequests:completion:", v19, v20, v25);

  objc_destroyWeak(&v31);
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_79(uint64_t a1)
{
  id v2;
  _UNKNOWN **v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  int v46;
  id v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  NSObject *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  id WeakRetained;
  _QWORD *v74;
  uint64_t v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  id obj;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  void *v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v76 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v74 = (_QWORD *)a1;
  obj = *(id *)(a1 + 32);
  v3 = &off_1E9F96000;
  v77 = v2;
  v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  v4 = 0;
  if (v84)
  {
    v83 = *(_QWORD *)v86;
    v81 = *MEMORY[0x1E0DB1FB0];
    v80 = *MEMORY[0x1E0CB32E8];
    v78 = *MEMORY[0x1E0C8A2F8];
    v75 = *MEMORY[0x1E0CB3388];
    do
    {
      for (i = 0; i != v84; ++i)
      {
        v6 = v4;
        if (*(_QWORD *)v86 != v83)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_msgSend(v7, "error");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "keyIdentifier");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v8)
          v12 = 1;
        else
          v12 = v10 == 0;
        if (!v12)
          goto LABEL_42;
        objc_msgSend(v8, "domain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v81))
        {
          v14 = objc_msgSend(v8, "code");

          if (v14 == -345015)
          {
            if (v9 && (objc_msgSend(v76, "containsObject:", v9) & 1) == 0)
            {
              v15 = (*(uint64_t (**)(void))(v74[5] + 16))();
              v16 = sLogObject_22;
              v17 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
              if (v15)
              {
                if (v17)
                {
                  *(_DWORD *)buf = 138412290;
                  v90 = (uint64_t)v9;
                  _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "User is no longer entitled to video, but it is being played.  Will delete when playback ends: %@", buf, 0xCu);
                }
                objc_msgSend(v3[453], "defaultManager");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "sidebandMediaLibrary");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "fpsKeyInfoForVideo:keyURI:createIfNeeded:wasCreated:", v9, v11, 0, 0);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setExpirationDate:", v21);

              }
              else
              {
                if (v17)
                {
                  *(_DWORD *)buf = 138412290;
                  v90 = (uint64_t)v9;
                  _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Deleting download that user is no longer entitled to: %@", buf, 0xCu);
                }
                objc_msgSend(v76, "addObject:", v9);
              }
            }
LABEL_42:
            v4 = v6;
            goto LABEL_43;
          }
        }
        else
        {

        }
        objc_msgSend(v8, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v80);

        v4 = v23 | v4;
        if ((v23 & 1) == 0 && v11)
        {
          objc_msgSend(v3[453], "defaultManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sidebandMediaLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "fpsKeyInfoForVideo:keyURI:createIfNeeded:wasCreated:", v9, v11, 0, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "renewalInterval");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v27;
          if (v27)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "doubleValue");
            objc_msgSend(v28, "dateByAddingTimeInterval:");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v29 = sLogObject_22;
          if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v90 = (uint64_t)v26;
            v91 = 2112;
            v92 = v27;
            _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Error occurred for key %@.  Resetting renewal date to %@", buf, 0x16u);
          }
          objc_msgSend(v26, "setRenewalDate:", v27);
          v30 = objc_msgSend(v26, "isInvalid");
          objc_msgSend(v8, "domain");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "isEqualToString:", v78))
          {
            v32 = objc_msgSend(v8, "code");

            v12 = v32 == -11800;
            v2 = v77;
            if (!v12)
            {
LABEL_32:
              if (v30 && v9 && (objc_msgSend(v2, "containsObject:", v9) & 1) == 0)
              {
                v34 = sLogObject_22;
                if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v90 = (uint64_t)v9;
                  _os_log_error_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_ERROR, "Key refresh failed due to key integrity issue.  Will get new keys for %@", buf, 0xCu);
                }
                objc_msgSend(v2, "addObject:", v9);
              }

              v4 = v6;
              v3 = &off_1E9F96000;
              goto LABEL_43;
            }
            objc_msgSend(v8, "userInfo");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKey:", v75);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v2 = v77;
            if (objc_msgSend(v31, "code") == -42801)
              v30 = 1;
          }

          goto LABEL_32;
        }
LABEL_43:

      }
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v84);
  }

  objc_msgSend(v3[453], "defaultManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sidebandMediaLibrary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "saveChangesToManagedObjects");

  if (objc_msgSend(v76, "count"))
  {
    objc_msgSend(v3[453], "defaultManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sidebandMediaLibrary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "allObjects");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "removeDownloadedMediaForVideoManagedObjects:markAsDeleted:invalidateImmediately:", v39, 0, 1);

  }
  if (objc_msgSend(v2, "count"))
    objc_msgSend(WeakRetained, "_fetchNewKeysForVideosWithBrokenKeys:", v2);
  (*(void (**)(void))(v74[6] + 16))();
  objc_msgSend(WeakRetained, "contentKeySessions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "removeAllObjects");

  objc_msgSend(WeakRetained, "keyLoaders");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "removeAllObjects");

  objc_msgSend(WeakRetained, "keyRenewalTimer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "Invalidating key renewal timer", buf, 2u);
    }
    objc_msgSend(WeakRetained, "keyRenewalTimer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "invalidate");

    objc_msgSend(WeakRetained, "setKeyRenewalTimer:", 0);
  }
  (*(void (**)(void))(v74[7] + 16))();
  v45 = 0;
  v46 = (*(uint64_t (**)(void))(v74[8] + 16))();
  v47 = 0;
  v48 = 0;
  v49 = sLogObject_22;
  if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v90 = (uint64_t)v47;
    _os_log_impl(&dword_1D96EE000, v49, OS_LOG_TYPE_DEFAULT, "Earliest unexpired renewal date is %@", buf, 0xCu);
  }
  v50 = sLogObject_22;
  if (v46)
  {
    if (v48)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v50, OS_LOG_TYPE_DEFAULT, "Renewal date for one or more downloads is in the past after attempting renewal.  Will try again after renewal interval", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "doubleValue");
      objc_msgSend(v51, "dateByAddingTimeInterval:");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
        goto LABEL_73;
LABEL_65:
      v54 = sLogObject_22;
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = (uint64_t)v52;
        _os_log_impl(&dword_1D96EE000, v54, OS_LOG_TYPE_DEFAULT, "Scheduling renewal timer for %@", buf, 0xCu);
      }
      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v52, WeakRetained, sel__renewalTimerDidFire_, 0, 0, 0.0);
      objc_msgSend(WeakRetained, "setKeyRenewalTimer:", v55);
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addTimer:forMode:", v55, *MEMORY[0x1E0C99748]);

      goto LABEL_73;
    }
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR))
      __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_79_cold_1(v50, v57, v58, v59, v60, v61, v62, v63);
LABEL_72:
    v52 = 0;
    goto LABEL_73;
  }
  v53 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
  if (!v47)
  {
    if (v53)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v50, OS_LOG_TYPE_DEFAULT, "Earliest unexpired renewal is nil. Not performing or scheduling renewals", buf, 2u);
    }
    goto LABEL_72;
  }
  if (v53)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v50, OS_LOG_TYPE_DEFAULT, "Renewal date for one or more downloads is in the future", buf, 2u);
  }
  objc_msgSend(v47, "dateByAddingTimeInterval:", 5.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
    goto LABEL_65;
LABEL_73:
  v64 = objc_msgSend(WeakRetained, "backgroundTaskIdentifier");
  v65 = *MEMORY[0x1E0DC4878];
  if (v64 != *MEMORY[0x1E0DC4878])
  {
    v66 = (void *)sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      v67 = v66;
      v68 = objc_msgSend(WeakRetained, "backgroundTaskIdentifier");
      *(_DWORD *)buf = 134217984;
      v90 = v68;
      _os_log_impl(&dword_1D96EE000, v67, OS_LOG_TYPE_DEFAULT, "Ending background task with identifier %lu", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "endBackgroundTask:", objc_msgSend(WeakRetained, "backgroundTaskIdentifier"));

    objc_msgSend(WeakRetained, "setBackgroundTaskIdentifier:", v65);
  }
  objc_msgSend(WeakRetained, "stateMachine");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if ((v4 & 1) != 0)
    v72 = CFSTR("Network error did occur");
  else
    v72 = CFSTR("Renewal did finish");
  objc_msgSend(v70, "postEvent:", v72);

}

const __CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  const __CFString *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[7];
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = *(_QWORD *)(a1 + 40);
  v48[6] = 0;
  (*(void (**)(void))(v5 + 16))();
  v6 = 0;
  objc_msgSend(WeakRetained, "keyRenewalTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating key renewal timer", buf, 2u);
    }
    objc_msgSend(WeakRetained, "keyRenewalTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    objc_msgSend(WeakRetained, "setKeyRenewalTimer:", 0);
  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_activeiTunesAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 48);
    v48[5] = 0;
    v13 = (*(uint64_t (**)(void))(v12 + 16))();
    v14 = 0;
    v15 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v14;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Earliest unexpired renewal date is %@", buf, 0xCu);
    }
    if (v13)
    {
      v16 = sLogObject_22;
      if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Renewal date for one or more downloads is in the past", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isNetworkReachable");

      v19 = sLogObject_22;
      v20 = os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Network is reachable, will renew all keys", buf, 2u);
        }
        v21 = objc_msgSend(WeakRetained, "backgroundTaskIdentifier");
        v22 = MEMORY[0x1E0C809B0];
        if (v21 == *MEMORY[0x1E0DC4878])
        {
          v23 = v21;
          objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v22;
          v26 = v24;
          v48[0] = v25;
          v48[1] = 3221225472;
          v48[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_89;
          v48[3] = &unk_1E9F98DF0;
          v48[4] = WeakRetained;
          v27 = objc_msgSend(v24, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("VUIOfflineKeyRenewalManager"), v48);

          v28 = sLogObject_22;
          if (v27 == v23)
          {
            if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR))
              __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_85_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
          }
          else if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v50 = v27;
            _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "Beginning background task with identifier %lu", buf, 0xCu);
          }
          objc_msgSend(WeakRetained, "setBackgroundTaskIdentifier:", v27);
          v22 = MEMORY[0x1E0C809B0];
        }
        else
        {
          v43 = sLogObject_22;
          if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "Not beginning background task since one is already in progress", buf, 2u);
          }
        }
        v45[0] = v22;
        v45[1] = 3221225472;
        v45[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_90;
        v45[3] = &unk_1E9F99420;
        v47 = *(id *)(a1 + 56);
        v46 = v6;
        objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v45);

        v37 = CFSTR("Renewal in progress");
      }
      else
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Network is not reachable.  Will renew keys when network becomes reachable", buf, 2u);
        }
        v37 = CFSTR("Waiting for network reachability to check for renewals");
      }
    }
    else
    {
      if (v14)
      {
        objc_msgSend(v14, "dateByAddingTimeInterval:", 5.0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v50 = (uint64_t)v38;
          _os_log_impl(&dword_1D96EE000, v39, OS_LOG_TYPE_DEFAULT, "Renewal date for one or more downloads is in the future.  Scheduling renewal timer for %@", buf, 0xCu);
        }
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v38, WeakRetained, sel__renewalTimerDidFire_, 0, 0, 0.0);
        objc_msgSend(WeakRetained, "setKeyRenewalTimer:", v40);
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addTimer:forMode:", v40, *MEMORY[0x1E0C99748]);

      }
      else
      {
        v42 = sLogObject_22;
        if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v42, OS_LOG_TYPE_DEFAULT, "Earliest unexpired renewal is nil. Not performing or scheduling renewals", buf, 2u);
        }
      }
      v37 = CFSTR("Idle");
    }

  }
  else
  {
    v36 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v36, OS_LOG_TYPE_DEFAULT, "No user is signed in.  Not performing or scheduling renewals", buf, 2u);
    }
    v37 = CFSTR("Idle");
  }

  return v37;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_89(uint64_t a1)
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
    v4 = (void *)sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_ERROR))
      __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_89_cold_1(v1, v4);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*v1, "backgroundTaskIdentifier"));

    return objc_msgSend(*v1, "setBackgroundTaskIdentifier:", v3);
  }
  return result;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

const __CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_92(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2_94;
  v5[3] = &unk_1E9F98DF0;
  v6 = v2;
  v3 = v2;
  objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v5);

  return CFSTR("Idle");
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2_94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Update requested"));
}

const __CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_3_95()
{
  return CFSTR("Renewal in progress update when done");
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_4_97(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

const __CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_5()
{
  return CFSTR("Idle");
}

const __CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_7;
  v5[3] = &unk_1E9F98DF0;
  v6 = v2;
  v3 = v2;
  objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v5);

  return CFSTR("Idle");
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Update requested"));
}

id __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  id v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_10;
  v5[3] = &unk_1E9F98DF0;
  v6 = v2;
  v3 = v2;
  objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v5);

  return CFSTR("Idle");
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Update requested"));
}

const __CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_11()
{
  return CFSTR("Waiting for network reachability to check for renewals");
}

__CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;
  int v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  objc_msgSend(v2, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNetworkReachable");

  if (v5)
  {

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_13;
    v7[3] = &unk_1E9F98DF0;
    v8 = v2;
    objc_msgSend(v8, "executeBlockAfterCurrentStateTransition:", v7);

    v3 = CFSTR("Idle");
  }

  return v3;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Update requested"));
}

id __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaybackUIBeingShown");

  if ((v5 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v3, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

const __CFString *__60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_15(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "keyRenewalTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating key renewal timer.  Will recreate if necessary when app enters foreground", buf, 2u);
    }
    objc_msgSend(WeakRetained, "keyRenewalTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(WeakRetained, "setKeyRenewalTimer:", 0);
  }
  objc_msgSend(WeakRetained, "expirationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = sLogObject_22;
    if (os_log_type_enabled((os_log_t)sLogObject_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating expiration timer.  Will recreate if necessary when app enters foreground", v9, 2u);
    }
    objc_msgSend(WeakRetained, "expirationTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(WeakRetained, "setExpirationTimer:", 0);
  }

  return CFSTR("Idle");
}

id __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_104(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2_106;
  v6[3] = &unk_1E9F98DF0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v6);
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_2_106(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Update requested"));
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (NSMutableDictionary)keyLoaders
{
  return self->_keyLoaders;
}

- (void)setKeyLoaders:(id)a3
{
  objc_storeStrong((id *)&self->_keyLoaders, a3);
}

- (BOOL)networkErrorOccurredDuringInvalidation
{
  return self->_networkErrorOccurredDuringInvalidation;
}

- (void)setNetworkErrorOccurredDuringInvalidation:(BOOL)a3
{
  self->_networkErrorOccurredDuringInvalidation = a3;
}

- (void)setKeyRenewalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_keyRenewalTimer, a3);
}

- (void)setExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_expirationTimer, a3);
}

- (NSMutableDictionary)contentKeySessions
{
  return self->_contentKeySessions;
}

- (void)setContentKeySessions:(id)a3
{
  objc_storeStrong((id *)&self->_contentKeySessions, a3);
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (NSMutableArray)downloadsForRepairingKeys
{
  return self->_downloadsForRepairingKeys;
}

- (void)setDownloadsForRepairingKeys:(id)a3
{
  objc_storeStrong((id *)&self->_downloadsForRepairingKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsForRepairingKeys, 0);
  objc_storeStrong((id *)&self->_contentKeySessions, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_keyRenewalTimer, 0);
  objc_storeStrong((id *)&self->_keyLoaders, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_79_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Renewal date for one or more downloads is in the past after attempting renewal, but no renewal interval exists for any key.  Not setting renewal timer", a5, a6, a7, a8, 0);
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_85_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Unable to begin background task since identifier is UIBackgroundTaskInvalid", a5, a6, a7, a8, 0);
}

void __60__VUIOfflineKeyRenewalManager__registerStateMachineHandlers__block_invoke_89_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  v4 = 134217984;
  v5 = objc_msgSend(v2, "backgroundTaskIdentifier");
  _os_log_error_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_ERROR, "VUIOfflineKeyRenewalManager with task identifier %lu expired.  Ending background task", (uint8_t *)&v4, 0xCu);

}

@end
