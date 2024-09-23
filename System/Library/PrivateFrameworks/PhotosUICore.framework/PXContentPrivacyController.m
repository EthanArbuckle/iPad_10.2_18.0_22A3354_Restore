@implementation PXContentPrivacyController

- (void)commonInitWithLogIdentifier:(id)a3 automaticAuthenticationBehavior:(unint64_t)a4
{
  NSString *v6;
  NSString *logIdentifier;
  void *v8;
  NSString *v9;
  NSString *v10;
  PXSystemAuthenticationTypeObserver *v11;
  PXSystemAuthenticationTypeObserver *authenticationTypeObserver;
  BOOL v13;
  NSMutableSet *v14;
  NSMutableSet *observers;
  NSMutableArray *v16;
  NSMutableArray *authenticationStack;
  id v18;

  v6 = (NSString *)objc_msgSend(a3, "copy");
  logIdentifier = self->_logIdentifier;
  self->_logIdentifier = v6;

  if (!-[NSString length](self->_logIdentifier, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_logIdentifier;
    self->_logIdentifier = v9;

  }
  +[PXSystemAuthenticationTypeObserver sharedObserver](PXSystemAuthenticationTypeObserver, "sharedObserver");
  v11 = (PXSystemAuthenticationTypeObserver *)objc_claimAutoreleasedReturnValue();
  authenticationTypeObserver = self->_authenticationTypeObserver;
  self->_authenticationTypeObserver = v11;

  self->_authenticationType = -[PXSystemAuthenticationTypeObserver authenticationType](self->_authenticationTypeObserver, "authenticationType");
  -[PXSystemAuthenticationTypeObserver registerChangeObserver:context:](self->_authenticationTypeObserver, "registerChangeObserver:context:", self, PXSystemAuthenticationTypeObserverContext);
  v13 = -[PXContentPrivacyController _isContentPrivacyPrefEnabled](self, "_isContentPrivacyPrefEnabled");
  self->_contentPrivacyEnabled = v13;
  self->_locked = v13;
  switch(a4)
  {
    case 2uLL:
      self->_willPerformAuthenticationAutomatically = 1;
      break;
    case 1uLL:
      self->_willPerformAuthenticationAutomatically = (unint64_t)(self->_authenticationType - 3) < 3;
      break;
    case 0uLL:
      self->_willPerformAuthenticationAutomatically = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  self->_observers = v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  authenticationStack = self->_authenticationStack;
  self->_authenticationStack = v16;

  -[PXContentPrivacyController _beginObservingApplicationStateChangesAndSystemEvents](self, "_beginObservingApplicationStateChangesAndSystemEvents");
  -[PXContentPrivacyController _beginObservingContentPrivacyPrefs](self, "_beginObservingContentPrivacyPrefs");
  +[PXContentPrivacySettings sharedInstance](PXContentPrivacySettings, "sharedInstance");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addDeferredKeyObserver:", self);

}

- (PXContentPrivacyController)initWithLogIdentifier:(id)a3
{
  id v4;
  PXContentPrivacyController *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXContentPrivacyController;
  v5 = -[PXContentPrivacyController init](&v7, sel_init);
  if (v5)
    -[PXContentPrivacyController commonInitWithLogIdentifier:automaticAuthenticationBehavior:](v5, "commonInitWithLogIdentifier:automaticAuthenticationBehavior:", v4, objc_msgSend((id)objc_opt_class(), "automaticAuthenticationBehaviorFromInternalSettings"));

  return v5;
}

- (PXContentPrivacyController)initWithAssetCollectionToObserve:(id)a3 logIdentifier:(id)a4
{
  id v6;
  PXContentPrivacyController *v7;
  PXContentPrivacyController *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PXContentPrivacyController initWithLogIdentifier:](self, "initWithLogIdentifier:", a4);
  v8 = v7;
  if (v7)
  {
    -[PXContentPrivacyController setAssetCollectionToObserve:](v7, "setAssetCollectionToObserve:", v6);
    v9 = objc_msgSend(v6, "px_isUserSmartAlbum");
    if (-[PXDisplayCollection px_isUserSmartAlbum](v8->_assetCollectionToObserve, "px_isUserSmartAlbum"))
      -[PXContentPrivacyController _beginObservingAssetCollectionChanges](v8, "_beginObservingAssetCollectionChanges");
    if (v8->_contentPrivacyEnabled)
      v10 = v9;
    else
      v10 = 0;
    if (v10 == 1 && (objc_msgSend(v6, "px_isPrivacySensitiveAlbum") & 1) == 0)
    {
      PLContentPrivacyUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[PXContentPrivacyController logIdentifier](v8, "logIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_INFO, "PrivacyController [%{public}@]: Initializing with contentPrivacyEnabled/locked = NO, since this smart album is not currently privacy sensitive", (uint8_t *)&v14, 0xCu);

      }
      v8->_contentPrivacyEnabled = 0;
      v8->_locked = 0;
    }
  }

  return v8;
}

- (PXContentPrivacyController)initWithContentPrivacyEnabledForTesting:(id)a3 availableAuthenticationTypeForTesting:(id)a4 assetCollectionToObserveForTesting:(id)a5 automaticAuthenticationBehaviorForTesting:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PXContentPrivacyController *v14;
  PXContentPrivacyController *v15;
  PXContentPrivacyController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (PFProcessIsLaunchedToExecuteTests())
  {
    v18.receiver = self;
    v18.super_class = (Class)PXContentPrivacyController;
    v14 = -[PXContentPrivacyController init](&v18, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_contentPrivacyEnabledNumberForTesting, a3);
      objc_storeStrong((id *)&v15->_testingOverride_authenticationType, a4);
      -[PXContentPrivacyController commonInitWithLogIdentifier:automaticAuthenticationBehavior:](v15, "commonInitWithLogIdentifier:automaticAuthenticationBehavior:", CFSTR("test"), a6);
      objc_storeStrong((id *)&v15->_assetCollectionToObserve, a5);
      v15->_automaticAuthenticationBehavior = a6;
      -[PXContentPrivacyController _updateAuthenticationType](v15, "_updateAuthenticationType");
      -[PXContentPrivacyController _updateContentPrivacyEnabled](v15, "_updateContentPrivacyEnabled");
      -[PXContentPrivacyController _updateWillPerformAuthenticationAutomatically](v15, "_updateWillPerformAuthenticationAutomatically");
    }
    self = v15;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLContentPrivacyUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: dealloc", buf, 0xCu);

  }
  -[PXContentPrivacyController _stopObservingApplicationStateChanges](self, "_stopObservingApplicationStateChanges");
  -[PXContentPrivacyController _stopObservingContentPrivacyPrefs](self, "_stopObservingContentPrivacyPrefs");
  if (-[PXDisplayCollection px_isUserSmartAlbum](self->_assetCollectionToObserve, "px_isUserSmartAlbum"))
    -[PXContentPrivacyController _stopObservingAssetCollectionChanges](self, "_stopObservingAssetCollectionChanges");
  +[PXContentPrivacySettings sharedInstance](PXContentPrivacySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeKeyObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)PXContentPrivacyController;
  -[PXContentPrivacyController dealloc](&v6, sel_dealloc);
}

- (void)_beginObservingApplicationStateChangesAndSystemEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  id *v31;
  id *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id location[2];

  objc_initWeak(location, self);
  if (-[PXContentPrivacyController isRunningInExtension](self, "isRunningInExtension"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0DC4868];
    v6 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_3;
    v53[3] = &unk_1E51441D8;
    objc_copyWeak(&v54, location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v53);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DC4750];
    v51[0] = v6;
    v51[1] = 3221225472;
    v51[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_4;
    v51[3] = &unk_1E51441D8;
    objc_copyWeak(&v52, location);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v10, 0, v9, v51);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXContentPrivacyController observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v7);

    -[PXContentPrivacyController observers](self, "observers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CB2A00];
    v49[0] = v6;
    v49[1] = 3221225472;
    v49[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_5;
    v49[3] = &unk_1E51441D8;
    objc_copyWeak(&v50, location);
    objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v16, 0, v15, v49);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CB29E8];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_6;
    v47[3] = &unk_1E51441D8;
    objc_copyWeak(&v48, location);
    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v19, 0, v18, v47);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXContentPrivacyController observers](self, "observers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v42);

    -[PXContentPrivacyController observers](self, "observers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_7;
    v45[3] = &unk_1E51441D8;
    objc_copyWeak(&v46, location);
    objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIViewServiceHostWillResignActiveNotification"), 0, v24, v45);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_8;
    v43[3] = &unk_1E51441D8;
    objc_copyWeak(&v44, location);
    objc_msgSend(v26, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIViewServiceHostDidBecomeActiveNotification"), 0, v27, v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXContentPrivacyController observers](self, "observers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v25);

    -[PXContentPrivacyController observers](self, "observers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v28);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    v31 = &v52;
    v32 = &v54;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *MEMORY[0x1E0DC4768];
    v36 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke;
    v57[3] = &unk_1E51441D8;
    v32 = &v58;
    objc_copyWeak(&v58, location);
    objc_msgSend(v33, "addObserverForName:object:queue:usingBlock:", v35, 0, v34, v57);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x1E0DC5338];
    v55[0] = v36;
    v55[1] = 3221225472;
    v55[2] = __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_2;
    v55[3] = &unk_1E51441D8;
    v31 = &v56;
    objc_copyWeak(&v56, location);
    objc_msgSend(v37, "addObserverForName:object:queue:usingBlock:", v39, 0, v38, v55);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXContentPrivacyController observers](self, "observers");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v7);

    -[PXContentPrivacyController observers](self, "observers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v11);

  }
  objc_destroyWeak(v31);

  objc_destroyWeak(v32);
  objc_destroyWeak(location);
}

- (void)applicationDidEnterBackground
{
  if (-[PXContentPrivacyController isContentPrivacyEnabled](self, "isContentPrivacyEnabled"))
    -[PXContentPrivacyController _lockWithReasonForLogging:](self, "_lockWithReasonForLogging:", CFSTR("Application entered background"));
}

- (void)applicationWillEnterForeground
{
  if (-[PXContentPrivacyController isContentPrivacyEnabled](self, "isContentPrivacyEnabled"))
    -[PXContentPrivacyController _performUserAuthenticationIfNeededAfterForegrounding](self, "_performUserAuthenticationIfNeededAfterForegrounding");
}

- (void)hostApplicationWillResignActiveFromNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[PXContentPrivacyController isContentPrivacyEnabled](self, "isContentPrivacyEnabled")
    && !-[PXContentPrivacyController isPerformingAuthentication](self, "isPerformingAuthentication"))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginActivityWithOptions:reason:", 0xFFFFFFLL, CFSTR("Photos Lock Privacy-Sensitive Album"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Host application resigned active from notification: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXContentPrivacyController _lockWithReasonForLogging:](self, "_lockWithReasonForLogging:", v8);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endActivity:", v5);

  }
}

- (void)hostApplicationDidBecomeActiveFromNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PXContentPrivacyController isContentPrivacyEnabled](self, "isContentPrivacyEnabled"))
  {
    PLContentPrivacyUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Host application did become active from notification: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    -[PXContentPrivacyController _performUserAuthenticationIfNeededAfterForegrounding](self, "_performUserAuthenticationIfNeededAfterForegrounding");
  }

}

- (void)_lockWithReasonForLogging:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PXContentPrivacyController isContentPrivacyEnabled](self, "isContentPrivacyEnabled"))
  {
    PLContentPrivacyUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Setting privacy controller to LOCKED, because: %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }
  -[PXContentPrivacyController lockImmediately](self, "lockImmediately");

}

- (void)_stopObservingApplicationStateChanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXContentPrivacyController observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[PXContentPrivacyController observers](self, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)_startAutolockTimerForReason:(unint64_t)a3 resetIfActive:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  __CFString *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  -[PXContentPrivacyController autolockTimer](self, "autolockTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_6:
    v11 = CFSTR("Explicit");
    if (a3 == 1)
      v11 = CFSTR("Window Backgrounding");
    if (a3 == 2)
      v11 = CFSTR("Window Minimizing");
    v8 = v11;
    -[PXContentPrivacyController autolockTimeout](self, "autolockTimeout");
    v13 = v12;
    PLContentPrivacyUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2048;
      v25 = v13;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Starting auto-lock timer for %.1fs (reason = %{public}@)", buf, 0x20u);

    }
    -[PXContentPrivacyController setAutolockReason:](self, "setAutolockReason:", a3);
    objc_initWeak((id *)buf, self);
    v16 = (void *)MEMORY[0x1E0C99E88];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__PXContentPrivacyController__startAutolockTimerForReason_resetIfActive___block_invoke;
    v20[3] = &unk_1E5141230;
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v16, "scheduledTimerWithTimeInterval:repeats:block:", 0, v20, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentPrivacyController setAutolockTimer:](self, "setAutolockTimer:", v17);

    -[PXContentPrivacyController autolockTimer](self, "autolockTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTolerance:", 1.0);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
    goto LABEL_13;
  }
  PLContentPrivacyUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Resetting auto-lock timer", buf, 0xCu);

    }
    -[PXContentPrivacyController _stopAutolockTimer](self, "_stopAutolockTimer");
    goto LABEL_6;
  }
  if (v9)
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v19;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Auto-lock timer already running, so not resetting it.", buf, 0xCu);

  }
LABEL_13:

}

- (void)_stopAutolockTimer
{
  void *v3;
  void *v4;

  -[PXContentPrivacyController autolockTimer](self, "autolockTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXContentPrivacyController autolockTimer](self, "autolockTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[PXContentPrivacyController setAutolockTimer:](self, "setAutolockTimer:", 0);
  }
}

- (void)_logCurrentAuthenticationStack
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentPrivacyDescriptionFromAuthenticationContextStack();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLContentPrivacyUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Current authentication stack: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)addContextToStack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PXContentPrivacyDescriptionFromAuthenticationContext(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "addObject:", v4);

    PLContentPrivacyUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v11;
      v23 = 2112;
      v24 = v5;
      v25 = 2048;
      v26 = objc_msgSend(v12, "count");
      v13 = "PrivacyController [%{public}@]: Adding new context: %@. Total: %tu";
LABEL_7:
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, 0x20u);

    }
  }
  else
  {
    v14 = objc_msgSend(v8, "count") - 1;

    if (v7 == v14)
    {
      PLContentPrivacyUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v11;
        v23 = 2112;
        v24 = v5;
        v25 = 2048;
        v26 = objc_msgSend(v12, "count");
        v13 = "PrivacyController [%{public}@]: Context is already at top of stock: %@. Total: %tu";
        goto LABEL_7;
      }
    }
    else
    {
      -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7 + 1;
      v17 = objc_msgSend(v15, "count") - v16;

      -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectsInRange:", v16, v17);

      PLContentPrivacyUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138544130;
        v22 = v19;
        v23 = 2112;
        v24 = v5;
        v25 = 2048;
        v26 = v17;
        v27 = 2048;
        v28 = objc_msgSend(v20, "count");
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context became current: %@, popped %tu contexts. Total: %tu", (uint8_t *)&v21, 0x2Au);

      }
    }
  }

  -[PXContentPrivacyController _logCurrentAuthenticationStack](self, "_logCurrentAuthenticationStack");
}

- (void)removeContextFromStack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PXContentPrivacyDescriptionFromAuthenticationContext(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLContentPrivacyUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v9;
      v29 = 2112;
      v30 = v5;
      v31 = 2048;
      v32 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Tried to remove context %@ that doesn't exist in stack. Total: %tu", (uint8_t *)&v27, 0x20u);

    }
  }
  else
  {
    -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 == v4)
    {
      objc_msgSend(v13, "removeLastObject");

      -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v17 = objc_claimAutoreleasedReturnValue();

      PXContentPrivacyDescriptionFromAuthenticationContext(v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PLContentPrivacyUIGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138544130;
        v28 = v23;
        v29 = 2114;
        v30 = v5;
        v31 = 2114;
        v32 = (uint64_t)v21;
        v33 = 2048;
        v34 = objc_msgSend(v24, "count");
        _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context was popped: %{public}@. Context became current: %{public}@. Total: %tu", (uint8_t *)&v27, 0x2Au);

      }
    }
    else
    {
      v15 = objc_msgSend(v13, "count") - v7;

      -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectsInRange:", v7, v15);

      PLContentPrivacyUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138544130;
        v28 = v18;
        v29 = 2114;
        v30 = v5;
        v31 = 2048;
        v32 = v15;
        v33 = 2048;
        v34 = objc_msgSend(v19, "count");
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context disappeared but was not at the top: %{public}@, popped %tu contexts until it was removed. Total: %tu", (uint8_t *)&v27, 0x2Au);

      }
    }

    -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (!v26)
    {
      -[PXContentPrivacyController resetHasPerformedAuthenticationInStack](self, "resetHasPerformedAuthenticationInStack");
      -[PXContentPrivacyController setAuthenticationAttemptDidFailOrWasCancelled:](self, "setAuthenticationAttemptDidFailOrWasCancelled:", 0);
    }
    -[PXContentPrivacyController _logCurrentAuthenticationStack](self, "_logCurrentAuthenticationStack");
  }

}

- (void)clearAuthenticationStack
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentPrivacyDescriptionFromAuthenticationContextStack();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLContentPrivacyUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Clearing authentication stack. Was: %{public}@. ", (uint8_t *)&v8, 0x16u);

  }
  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[PXContentPrivacyController setCachedAuthenticationStackCount:](self, "setCachedAuthenticationStackCount:", 0);
  -[PXContentPrivacyController resetHasPerformedAuthenticationInStack](self, "resetHasPerformedAuthenticationInStack");

}

- (void)resetHasPerformedAuthenticationInStack
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLContentPrivacyUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Resetting 'has performed authentication in stack' flag", (uint8_t *)&v5, 0xCu);

  }
  -[PXContentPrivacyController setHasPerformedAuthenticationInStack:](self, "setHasPerformedAuthenticationInStack:", 0);
  -[PXContentPrivacyController _updateWillPerformAuthenticationAutomatically](self, "_updateWillPerformAuthenticationAutomatically");
}

- (void)_updateCachedAuthenticationStackCount
{
  id v3;

  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXContentPrivacyController setCachedAuthenticationStackCount:](self, "setCachedAuthenticationStackCount:", objc_msgSend(v3, "count"));

}

- (void)scheduleAuthenticationStackCountUpdate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PXContentPrivacyController_scheduleAuthenticationStackCountUpdate__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)viewDidAppearForAuthenticationContext:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _BOOL4 v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PXContentPrivacyController cachedAuthenticationStackCount](self, "cachedAuthenticationStackCount");
  PXContentPrivacyDescriptionFromAuthenticationContext(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLContentPrivacyUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context did appear: %@", (uint8_t *)&v13, 0x16u);

  }
  -[PXContentPrivacyController addContextToStack:](self, "addContextToStack:", v4);
  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = -[PXContentPrivacyController shouldPerformAuthenticationUponAppearing](self, "shouldPerformAuthenticationUponAppearing");
  if (-[PXContentPrivacyController shouldLockAfterDelayWhenLeavingViewHierarchy](self, "shouldLockAfterDelayWhenLeavingViewHierarchy"))
  {
    -[PXContentPrivacyController cancelDelayedLockIfNeeded](self, "cancelDelayedLockIfNeeded");
  }
  if (v10 >= v5 && v11)
    -[PXContentPrivacyController performUserAuthenticationIfNeededFromContext:](self, "performUserAuthenticationIfNeededFromContext:", v4);
  -[PXContentPrivacyController scheduleAuthenticationStackCountUpdate](self, "scheduleAuthenticationStackCountUpdate");

}

- (void)viewDidDisappearForAuthenticationContext:(id)a3 withNavigationState:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXContentPrivacyController _updateCachedAuthenticationStackCount](self, "_updateCachedAuthenticationStackCount");
  PXContentPrivacyDescriptionFromAuthenticationContext(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXContentPrivacyController cachedAuthenticationStackCount](self, "cachedAuthenticationStackCount");
  PLContentPrivacyUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4 == 2)
  {
    if (v10)
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v11;
      *(_WORD *)&v20[12] = 2114;
      *(_QWORD *)&v20[14] = v7;
      v12 = "PrivacyController [%{public}@]: Context %{public}@ did disappear, but is still top of navigation hierarchy. "
            "Likely a tab switch of app hide. Removing context from top anyway.";
LABEL_7:
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, v12, v20, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    if (v10)
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v11;
      *(_WORD *)&v20[12] = 2114;
      *(_QWORD *)&v20[14] = v7;
      v12 = "PrivacyController [%{public}@]: Context %{public}@ did disappear, but is still within navigation hierarchy. "
            "Likely pushing into navigation hierarchy.";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if (v10)
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v20 = 138543618;
    *(_QWORD *)&v20[4] = v13;
    *(_WORD *)&v20[12] = 2112;
    *(_QWORD *)&v20[14] = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context did disappear from navigation hierarchy: %@", v20, 0x16u);

  }
  -[PXContentPrivacyController removeContextFromStack:](self, "removeContextFromStack:", v6);
LABEL_12:
  -[PXContentPrivacyController authenticationStack](self, "authenticationStack", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (a4 != 1)
  {
    v16 = v15 || v8 == 0;
    v17 = !v16;
    if (a4 == 2 || v17)
    {
      PLContentPrivacyUIGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138543362;
        *(_QWORD *)&v20[4] = v19;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: View Controller leaving view hierarchy, locking privacy controller, if unlocked, or cancelling authentication.", v20, 0xCu);

      }
      -[PXContentPrivacyController _lockOrCancelAuthenticationIfNeeded](self, "_lockOrCancelAuthenticationIfNeeded");
    }
  }
  -[PXContentPrivacyController scheduleAuthenticationStackCountUpdate](self, "scheduleAuthenticationStackCountUpdate");

}

- (void)_performUserAuthenticationIfNeededAfterForegrounding
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = -[PXContentPrivacyController shouldPerformAuthenticationUponAppearing](self, "shouldPerformAuthenticationUponAppearing");
    if (-[PXContentPrivacyController shouldLockAfterDelayWhenLeavingViewHierarchy](self, "shouldLockAfterDelayWhenLeavingViewHierarchy"))
    {
      -[PXContentPrivacyController cancelDelayedLockIfNeeded](self, "cancelDelayedLockIfNeeded");
    }
    if (v5)
    {
      -[PXContentPrivacyController setAuthenticationAttemptDidFailOrWasCancelled:](self, "setAuthenticationAttemptDidFailOrWasCancelled:", 0);
      -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      -[PXContentPrivacyController performUserAuthenticationIfNeededFromContext:](self, "performUserAuthenticationIfNeededFromContext:", v7);
    }
  }
}

- (void)performUserAuthenticationIfNeededFromContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentPrivacyController.m"), 791, CFSTR("Provided context for user authentication must not be nil"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v5, "canPerformAuthentication"))
  {
    PLContentPrivacyUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Context reported that it cannot perform authentication. Skipping.", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v5, "authenticationTitle");
    v6 = objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXContentPrivacyAuthenticationPasscodeTitle"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passcodeAuthenticationReason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentPrivacyController performUserAuthenticationIfNeededWithTitle:passcodeTitle:passcodeSubtitle:completion:](self, "performUserAuthenticationIfNeededWithTitle:passcodeTitle:passcodeSubtitle:completion:", v6, v7, v8, 0);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXSystemAuthenticationTypeObserverContext == a5)
  {
    -[PXContentPrivacyController _updateAuthenticationType](self, "_updateAuthenticationType", a3);
    -[PXContentPrivacyController _updateContentPrivacyEnabled](self, "_updateContentPrivacyEnabled");
    -[PXContentPrivacyController _updateWillPerformAuthenticationAutomatically](self, "_updateWillPerformAuthenticationAutomatically");
  }
}

- (int64_t)_calculateAuthenticationTypeWithForcedUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  void *v15;
  int64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (PFProcessIsLaunchedToExecuteTests()
    && (-[PXContentPrivacyController testingOverride_authenticationType](self, "testingOverride_authenticationType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[PXContentPrivacyController testingOverride_authenticationType](self, "testingOverride_authenticationType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongValue");
LABEL_15:
    v16 = v7;

    return v16;
  }
  else
  {
    +[PXContentPrivacySettings sharedInstance](PXContentPrivacySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "simulatedAuthenticationType");

    v10 = 1;
    switch(v9)
    {
      case 0:
        if (v3)
        {
          -[PXContentPrivacyController authenticationTypeObserver](self, "authenticationTypeObserver");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "updateAuthenticationTypeImmediately");

        }
        -[PXContentPrivacyController authenticationTypeObserver](self, "authenticationTypeObserver");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "authenticationType");
        goto LABEL_15;
      case 2:
      case 3:
      case 4:
        v10 = v9;
        break;
      default:
        break;
    }
    if (v9 == 5)
      v11 = 6;
    else
      v11 = v10;
    PLContentPrivacyUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2048;
      v20 = v11;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Return SIMULATED authentication type: %ti", (uint8_t *)&v17, 0x16u);

    }
    return v11;
  }
}

- (void)updateAuthenticationTypeImmediately
{
  int64_t v3;
  _QWORD v4[5];

  v3 = -[PXContentPrivacyController _calculateAuthenticationTypeWithForcedUpdate:](self, "_calculateAuthenticationTypeWithForcedUpdate:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__PXContentPrivacyController_updateAuthenticationTypeImmediately__block_invoke;
  v4[3] = &__block_descriptor_40_e71_v16__0__PXContentPrivacyController_PXMutableContentPrivacyController__8l;
  v4[4] = v3;
  -[PXContentPrivacyController performChanges:](self, "performChanges:", v4);
}

- (void)_updateAuthenticationType
{
  int64_t v3;
  _QWORD v4[5];

  v3 = -[PXContentPrivacyController _calculateAuthenticationTypeWithForcedUpdate:](self, "_calculateAuthenticationTypeWithForcedUpdate:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__PXContentPrivacyController__updateAuthenticationType__block_invoke;
  v4[3] = &__block_descriptor_40_e71_v16__0__PXContentPrivacyController_PXMutableContentPrivacyController__8l;
  v4[4] = v3;
  -[PXContentPrivacyController performChanges:](self, "performChanges:", v4);
}

- (void)setAuthenticationType:(int64_t)a3
{
  if (self->_authenticationType != a3)
  {
    self->_authenticationType = a3;
    -[PXContentPrivacyController signalChange:](self, "signalChange:", 4);
  }
}

- (void)_performDelayedAuthenticationTypeUpdate
{
  -[PXContentPrivacyController _updateAuthenticationType](self, "_updateAuthenticationType");
  -[PXContentPrivacyController _updateContentPrivacyEnabled](self, "_updateContentPrivacyEnabled");
  -[PXContentPrivacyController _updateWillPerformAuthenticationAutomatically](self, "_updateWillPerformAuthenticationAutomatically");
}

- (void)setTestingOverride_authenticationType:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;
  char v7;
  NSNumber *v8;

  v8 = (NSNumber *)a3;
  v5 = self->_testingOverride_authenticationType;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSNumber isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_testingOverride_authenticationType, a3);
      -[PXContentPrivacyController _updateAuthenticationType](self, "_updateAuthenticationType");
      -[PXContentPrivacyController _updateContentPrivacyEnabled](self, "_updateContentPrivacyEnabled");
      -[PXContentPrivacyController _updateWillPerformAuthenticationAutomatically](self, "_updateWillPerformAuthenticationAutomatically");
    }
  }

}

- (void)_updateWillPerformAuthenticationAutomatically
{
  BOOL v3;
  BOOL v4;
  _BOOL4 v5;
  _QWORD v6[4];
  char v7;

  v3 = -[PXContentPrivacyController shouldPerformAuthenticationUponAppearing](self, "shouldPerformAuthenticationUponAppearing");
  v4 = -[PXContentPrivacyController authenticationAttemptDidFailOrWasCancelled](self, "authenticationAttemptDidFailOrWasCancelled");
  v5 = -[PXContentPrivacyController shouldOnlyPerformAutomaticAuthenticationOnceInStack](self, "shouldOnlyPerformAutomaticAuthenticationOnceInStack");
  if (v5)
    LOBYTE(v5) = -[PXContentPrivacyController hasPerformedAuthenticationInStack](self, "hasPerformedAuthenticationInStack");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PXContentPrivacyController__updateWillPerformAuthenticationAutomatically__block_invoke;
  v6[3] = &__block_descriptor_33_e71_v16__0__PXContentPrivacyController_PXMutableContentPrivacyController__8l;
  v7 = v3 ^ (v3 && (v4 || v5));
  -[PXContentPrivacyController performChanges:](self, "performChanges:", v6);
}

- (void)setAutomaticAuthenticationBehavior:(unint64_t)a3
{
  if (self->_automaticAuthenticationBehavior != a3)
  {
    self->_automaticAuthenticationBehavior = a3;
    -[PXContentPrivacyController _updateWillPerformAuthenticationAutomatically](self, "_updateWillPerformAuthenticationAutomatically");
  }
}

- (void)setWillPerformAuthenticationAutomatically:(BOOL)a3
{
  _BOOL4 willPerformAuthenticationAutomatically;
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  willPerformAuthenticationAutomatically = self->_willPerformAuthenticationAutomatically;
  if (willPerformAuthenticationAutomatically != a3)
  {
    v4 = a3;
    self->_willPerformAuthenticationAutomatically = a3;
    -[PXContentPrivacyController signalChange:](self, "signalChange:", 8);
    -[PXContentPrivacyController authenticationStack](self, "authenticationStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = -[PXContentPrivacyController hasPerformedAuthenticationInStack](self, "hasPerformedAuthenticationInStack");
      if (!willPerformAuthenticationAutomatically && !v8 && v4)
      {
        PLContentPrivacyUIGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138543362;
          v12 = v10;
          _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: While in privacy sensitive area, we changed authentication type to one that should automatically attempt authentication. Authenticating...", (uint8_t *)&v11, 0xCu);

        }
        -[PXContentPrivacyController _performUserAuthenticationIfNeededAfterForegrounding](self, "_performUserAuthenticationIfNeededAfterForegrounding");
      }
    }
  }
}

- (void)setAuthenticationAttemptDidFailOrWasCancelled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_authenticationAttemptDidFailOrWasCancelled != a3)
  {
    v3 = a3;
    PLContentPrivacyUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v8 = v7;
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Setting 'authentication did fail or cancelled' flag to %@", (uint8_t *)&v9, 0x16u);

    }
    self->_authenticationAttemptDidFailOrWasCancelled = v3;
    -[PXContentPrivacyController _updateWillPerformAuthenticationAutomatically](self, "_updateWillPerformAuthenticationAutomatically");
  }
}

- (BOOL)isPerformingAuthentication
{
  void *v2;
  BOOL v3;

  -[PXContentPrivacyController currentAuthenticationContext](self, "currentAuthenticationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)cancelAuthentication
{
  px_dispatch_on_main_queue();
}

- (void)_cancelAuthentication
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PXContentPrivacyController currentAuthenticationContext](self, "currentAuthenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLContentPrivacyUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXContentPrivacyController currentAuthenticationContext](self, "currentAuthenticationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Cancelling current authentication request: %@", (uint8_t *)&v9, 0x16u);

    }
    -[PXContentPrivacyController currentAuthenticationContext](self, "currentAuthenticationContext");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidate](v4, "invalidate");
  }
  else if (v5)
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Received request to cancel authentication, but there wasn't an active authentication request.", (uint8_t *)&v9, 0xCu);

  }
}

- (void)setLocked:(BOOL)a3
{
  if (self->_locked != a3)
  {
    self->_locked = a3;
    -[PXContentPrivacyController signalChange:](self, "signalChange:", 1);
  }
}

- (void)_lockOrCancelAuthenticationIfNeeded
{
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[PXContentPrivacyController shouldLockAfterDelayWhenLeavingViewHierarchy](self, "shouldLockAfterDelayWhenLeavingViewHierarchy");
  PLContentPrivacyUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("immediately");
    if (v3)
      v7 = CFSTR("after delay");
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: View Controller leaving view hierarchy, locking privacy controller %{public}@, if unlocked, or cancelling authentication.", (uint8_t *)&v8, 0x16u);

  }
  if (v3)
    -[PXContentPrivacyController scheduleDelayedLock](self, "scheduleDelayedLock");
  else
    -[PXContentPrivacyController lockImmediately](self, "lockImmediately");
}

- (void)lockImmediately
{
  px_dispatch_on_main_queue();
}

- (void)scheduleDelayedLock
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[PXContentPrivacyController isPerformingAuthentication](self, "isPerformingAuthentication"))
  {
    PLContentPrivacyUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Scheduled lock requested. But we are locked and in the middle of authentication. Cancelling active user authentication.", (uint8_t *)&v7, 0xCu);

    }
    -[PXContentPrivacyController _cancelAuthentication](self, "_cancelAuthentication");
  }
  else if (!-[PXContentPrivacyController isLocked](self, "isLocked"))
  {
    PLContentPrivacyUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Scheduled lock requested. Resetting any ongoing auto-lock timer.", (uint8_t *)&v7, 0xCu);

    }
    -[PXContentPrivacyController _startAutolockTimerForReason:resetIfActive:](self, "_startAutolockTimerForReason:resetIfActive:", 0, 1);
  }
}

- (void)cancelDelayedLockIfNeeded
{
  -[PXContentPrivacyController _cancelDelayedLockIfNeededWithReason:](self, "_cancelDelayedLockIfNeededWithReason:", CFSTR("explicitly requested"));
}

- (void)_cancelDelayedLockIfNeededWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXContentPrivacyController autolockTimer](self, "autolockTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PLContentPrivacyUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Cancelling scheduled auto-lock with reason: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    -[PXContentPrivacyController _stopAutolockTimer](self, "_stopAutolockTimer");
  }

}

- (BOOL)isDelayedLockScheduled
{
  void *v2;
  BOOL v3;

  -[PXContentPrivacyController autolockTimer](self, "autolockTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)unlock
{
  px_dispatch_on_main_queue();
}

- (void)_finishAuthenticationChallengeWithCompletionHandler:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  px_dispatch_on_main_queue();

}

- (void)performUserAuthenticationIfNeededWithTitle:(id)a3 passcodeTitle:(id)a4 passcodeSubtitle:(id)a5 completion:(id)a6
{
  -[PXContentPrivacyController _performUserAuthenticationWithTitle:passcodeTitle:passcodeSubtitle:reason:completion:](self, "_performUserAuthenticationWithTitle:passcodeTitle:passcodeSubtitle:reason:completion:", a3, a4, a5, 0, a6);
}

- (void)performUserAuthenticationIfNeededWithLocalizedReason:(id)a3 completion:(id)a4
{
  -[PXContentPrivacyController _performUserAuthenticationWithTitle:passcodeTitle:passcodeSubtitle:reason:completion:](self, "_performUserAuthenticationWithTitle:passcodeTitle:passcodeSubtitle:reason:completion:", 0, 0, 0, a3, a4);
}

- (void)_performUserAuthenticationWithTitle:(id)a3 passcodeTitle:(id)a4 passcodeSubtitle:(id)a5 reason:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void (**v21)(_QWORD, _QWORD);
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  PLContentPrivacyUIGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v18;
    _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Got a request to perform authentication.", buf, 0xCu);

  }
  -[PXContentPrivacyController _cancelDelayedLockIfNeededWithReason:](self, "_cancelDelayedLockIfNeededWithReason:", CFSTR("performing user authentication requested"));
  if (-[PXContentPrivacyController isLocked](self, "isLocked"))
  {
    objc_initWeak(&location, self);
    if (PFProcessIsLaunchedToExecuteTests())
    {
      -[PXContentPrivacyController authChallengeHandlerForTesting](self, "authChallengeHandlerForTesting");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (!v20)
      {
        -[PXContentPrivacyController authChallengeHandlerForTesting](self, "authChallengeHandlerForTesting");
        v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __115__PXContentPrivacyController__performUserAuthenticationWithTitle_passcodeTitle_passcodeSubtitle_reason_completion___block_invoke;
        v37[3] = &unk_1E5141338;
        objc_copyWeak(&v39, &location);
        v38 = v16;
        ((void (**)(_QWORD, _QWORD *))v21)[2](v21, v37);

        objc_destroyWeak(&v39);
LABEL_14:
        objc_destroyWeak(&location);
        goto LABEL_31;
      }
    }
    if (-[PXContentPrivacyController isPerformingAuthentication](self, "isPerformingAuthentication"))
    {
      PLContentPrivacyUIGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v25;
        _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "PrivacyController [%{public}@]: Got a request to perform authentication while already performing authentication. Ignoring.", buf, 0xCu);

      }
      goto LABEL_14;
    }
    if (-[PXContentPrivacyController authenticationType](self, "authenticationType") == 1)
    {
      PLContentPrivacyUIGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v27;
        _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: LocalAuthentication not possible because the device has no biometrics or passcode/password set at all.", buf, 0xCu);

      }
      -[PXContentPrivacyController _finishAuthenticationChallengeWithCompletionHandler:success:error:](self, "_finishAuthenticationChallengeWithCompletionHandler:success:error:", v16, 1, 0);
    }
    else
    {
      PXDebugDescriptionFromSystemAuthenticationType(-[PXContentPrivacyController authenticationType](self, "authenticationType"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PLContentPrivacyUIGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v30;
        v43 = 2114;
        v44 = v28;
        _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Performing user authentication challenge. Expected authentication type: %{public}@", buf, 0x16u);

      }
      v31 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      v33 = v32;
      if (v12)
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v12, &unk_1E53EF468);
      if (v13)
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v13, &unk_1E53EF480);
      if (v14)
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v14, &unk_1E53EF498);
      if (v15)
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v15, &unk_1E53EF4B0);
      -[PXContentPrivacyController setCurrentAuthenticationContext:](self, "setCurrentAuthenticationContext:", v31);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __115__PXContentPrivacyController__performUserAuthenticationWithTitle_passcodeTitle_passcodeSubtitle_reason_completion___block_invoke_218;
      v34[3] = &unk_1E5141360;
      v34[4] = self;
      objc_copyWeak(&v36, &location);
      v35 = v16;
      objc_msgSend(v31, "evaluatePolicy:options:reply:", 2, v33, v34);

      objc_destroyWeak(&v36);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    PLContentPrivacyUIGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v23;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Tried to perform a user authentication, but was already unlocked.", buf, 0xCu);

    }
    -[PXContentPrivacyController _finishAuthenticationChallengeWithCompletionHandler:success:error:](self, "_finishAuthenticationChallengeWithCompletionHandler:success:error:", v16, 1, 0);
  }
LABEL_31:

}

- (BOOL)shouldPerformAuthenticationUponAppearing
{
  void *v3;
  void *v4;
  char v5;
  _BOOL4 v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  BOOL result;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (PFProcessIsLaunchedToExecuteTests()
    && (-[PXContentPrivacyController testingOverride_shouldPerformAuthenticationOnAppearing](self, "testingOverride_shouldPerformAuthenticationOnAppearing"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    -[PXContentPrivacyController testingOverride_shouldPerformAuthenticationOnAppearing](self, "testingOverride_shouldPerformAuthenticationOnAppearing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = -[PXContentPrivacyController shouldOnlyPerformAutomaticAuthenticationOnceInStack](self, "shouldOnlyPerformAutomaticAuthenticationOnceInStack");
    if ((v5 & 1) == 0)
      return 0;
  }
  else
  {
    v7 = -[PXContentPrivacyController automaticAuthenticationBehavior](self, "automaticAuthenticationBehavior");
    if (!v7)
    {
      -[PXContentPrivacyController shouldOnlyPerformAutomaticAuthenticationOnceInStack](self, "shouldOnlyPerformAutomaticAuthenticationOnceInStack");
      return 0;
    }
    if (v7 == 1)
    {
      v8 = -[PXContentPrivacyController authenticationType](self, "authenticationType");
      v9 = v8 - 3;
      PXDebugDescriptionFromSystemAuthenticationType(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PLContentPrivacyUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("NO");
        if (v9 < 3)
          v13 = CFSTR("YES");
        v14 = v13;
        v20 = 138543874;
        v21 = v12;
        v22 = 2114;
        v23 = v14;
        v24 = 2114;
        v25 = v10;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Should perform authentication upon appearing: %{public}@ (authentication type: %{public}@)", (uint8_t *)&v20, 0x20u);

      }
      v6 = -[PXContentPrivacyController shouldOnlyPerformAutomaticAuthenticationOnceInStack](self, "shouldOnlyPerformAutomaticAuthenticationOnceInStack");
      if (v9 > 2)
        return 0;
    }
    else
    {
      v6 = -[PXContentPrivacyController shouldOnlyPerformAutomaticAuthenticationOnceInStack](self, "shouldOnlyPerformAutomaticAuthenticationOnceInStack");
    }
  }
  v15 = v6;
  v16 = -[PXContentPrivacyController hasPerformedAuthenticationInStack](self, "hasPerformedAuthenticationInStack");
  result = 1;
  if (v16 && v15)
  {
    PLContentPrivacyUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v19;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Skipping automatic authentication because we've already perform authentication once while in this stack", (uint8_t *)&v20, 0xCu);

    }
    return 0;
  }
  return result;
}

- (BOOL)shouldOnlyPerformAutomaticAuthenticationOnceInStack
{
  void *v3;
  void *v4;
  char v5;

  if (!PFProcessIsLaunchedToExecuteTests())
    return -[PXContentPrivacyController isRunningInExtension](self, "isRunningInExtension");
  -[PXContentPrivacyController testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce](self, "testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[PXContentPrivacyController isRunningInExtension](self, "isRunningInExtension");
  -[PXContentPrivacyController testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce](self, "testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)shouldLockAfterDelayWhenLeavingViewHierarchy
{
  void *v3;
  void *v4;
  char v5;

  if (!PFProcessIsLaunchedToExecuteTests())
    return 0;
  -[PXContentPrivacyController testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy](self, "testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PXContentPrivacyController testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy](self, "testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (double)autolockTimeout
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!PFProcessIsLaunchedToExecuteTests())
    return 0.0;
  -[PXContentPrivacyController testingOverride_autolockTimeout](self, "testingOverride_autolockTimeout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[PXContentPrivacyController testingOverride_autolockTimeout](self, "testingOverride_autolockTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setAssetCollectionToObserve:(id)a3
{
  PXDisplayCollection *v5;
  PXDisplayCollection **p_assetCollectionToObserve;
  PXDisplayCollection *assetCollectionToObserve;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (PXDisplayCollection *)a3;
  p_assetCollectionToObserve = &self->_assetCollectionToObserve;
  assetCollectionToObserve = self->_assetCollectionToObserve;
  if (assetCollectionToObserve != v5)
  {
    v8 = -[PXDisplayCollection px_isPrivacySensitiveAlbum](assetCollectionToObserve, "px_isPrivacySensitiveAlbum");
    objc_storeStrong((id *)&self->_assetCollectionToObserve, a3);
    v9 = -[PXDisplayCollection px_isPrivacySensitiveAlbum](*p_assetCollectionToObserve, "px_isPrivacySensitiveAlbum");
    if (v8 != v9)
    {
      v10 = v9;
      PLContentPrivacyUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXDisplayCollection localizedTitle](*p_assetCollectionToObserve, "localizedTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("NO");
        if (v10)
          v14 = CFSTR("YES");
        v15 = v14;
        v16 = 138543874;
        v17 = v12;
        v18 = 2112;
        v19 = v13;
        v20 = 2114;
        v21 = v15;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Smart album '%@' just changed privacy sensitivity to %{public}@", (uint8_t *)&v16, 0x20u);

      }
      -[PXContentPrivacyController _updateContentPrivacyEnabled](self, "_updateContentPrivacyEnabled");
    }
  }

}

- (void)setAssetCollectionToObserveForTesting:(id)a3
{
  id v4;

  v4 = a3;
  if (PFProcessIsLaunchedToExecuteTests())
    -[PXContentPrivacyController setAssetCollectionToObserve:](self, "setAssetCollectionToObserve:", v4);

}

- (BOOL)_isContentPrivacyPrefEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  uint64_t v8;
  int v9;
  int64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (PFProcessIsLaunchedToExecuteTests())
  {
    -[PXContentPrivacyController contentPrivacyEnabledNumberForTesting](self, "contentPrivacyEnabledNumberForTesting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PXContentPrivacyController contentPrivacyEnabledNumberForTesting](self, "contentPrivacyEnabledNumberForTesting");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "BOOLValue");

      return v5;
    }
  }
  +[PXContentPrivacySettings sharedInstance](PXContentPrivacySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "simulationMode");
  if (v8 == 1)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    if (!v8)
    {
      v9 = PLIsContentPrivacyEnabled();
      v10 = -[PXContentPrivacyController authenticationType](self, "authenticationType");
      if (!v9 || v10 != 1)
        goto LABEL_13;
      PLContentPrivacyUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Even though the content privacy pref is enabled, there is no configured authentication method. Treating content privacy as if it were DISABLED.", (uint8_t *)&v13, 0xCu);

      }
    }
    LOBYTE(v9) = 0;
  }
LABEL_13:

  return v9;
}

- (void)setContentPrivacyEnabled:(BOOL)a3
{
  if (self->_contentPrivacyEnabled != a3)
  {
    self->_contentPrivacyEnabled = a3;
    -[PXContentPrivacyController signalChange:](self, "signalChange:", 2);
  }
}

- (void)_updateContentPrivacyEnabled
{
  px_dispatch_on_main_queue();
}

- (void)_beginObservingContentPrivacyPrefs
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_preferencesDidChange, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_stopObservingContentPrivacyPrefs
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0);
}

- (void)_beginObservingAssetCollectionChanges
{
  void *v3;
  void *v4;
  id v5;

  -[PXContentPrivacyController assetCollectionToObserve](self, "assetCollectionToObserve");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v5 = v3;

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_registerChangeObserver:", self);
LABEL_6:

    v4 = v5;
  }

}

- (void)_stopObservingAssetCollectionChanges
{
  void *v3;
  void *v4;
  id v5;

  -[PXContentPrivacyController assetCollectionToObserve](self, "assetCollectionToObserve");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v5 = v3;

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_unregisterChangeObserver:", self);
LABEL_6:

    v4 = v5;
  }

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXContentPrivacyController assetCollectionToObserve](self, "assetCollectionToObserve");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "px_isUserSmartAlbum");

  if (!v7)
    goto LABEL_13;
  -[PXContentPrivacyController assetCollectionToObserve](self, "assetCollectionToObserve");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentPrivacyController.m"), 1416, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollectionToObserve"), v22);
LABEL_16:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentPrivacyController.m"), 1416, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollectionToObserve"), v22, v24);

    goto LABEL_16;
  }
LABEL_4:
  objc_msgSend(v5, "changeDetailsForObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectAfterChanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "px_isPrivacySensitiveAlbum");
    v13 = objc_msgSend(v11, "px_isPrivacySensitiveAlbum");
    if (v12 != v13)
    {
      v14 = v13;
      PLContentPrivacyUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("NO");
        if (v14)
          v18 = CFSTR("YES");
        v19 = v18;
        *(_DWORD *)buf = 138543874;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        v29 = 2114;
        v30 = v19;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Smart album '%@' just changed privacy sensitivity to %{public}@", buf, 0x20u);

      }
    }
    -[PXContentPrivacyController setAssetCollectionToObserve:](self, "setAssetCollectionToObserve:", v11);

  }
LABEL_13:

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  NSStringFromSelector(sel_simulationMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

  }
  else
  {
    NSStringFromSelector(sel_simulatedAuthenticationType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if (!v8)
      goto LABEL_7;
  }
  PLContentPrivacyUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentPrivacyController logIdentifier](self, "logIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Internal settings key '%@' changed. Updating content privacy enabled state.", (uint8_t *)&v11, 0x16u);

  }
  -[PXContentPrivacyController _updateAuthenticationType](self, "_updateAuthenticationType");
  -[PXContentPrivacyController _updateContentPrivacyEnabled](self, "_updateContentPrivacyEnabled");
  -[PXContentPrivacyController _updateWillPerformAuthenticationAutomatically](self, "_updateWillPerformAuthenticationAutomatically");
LABEL_7:

}

- (BOOL)isContentPrivacyEnabled
{
  return self->_contentPrivacyEnabled;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (unint64_t)automaticAuthenticationBehavior
{
  return self->_automaticAuthenticationBehavior;
}

- (BOOL)willPerformAuthenticationAutomatically
{
  return self->_willPerformAuthenticationAutomatically;
}

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (PXSystemAuthenticationTypeObserver)authenticationTypeObserver
{
  return self->_authenticationTypeObserver;
}

- (LAContext)currentAuthenticationContext
{
  return self->_currentAuthenticationContext;
}

- (void)setCurrentAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentAuthenticationContext, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSTimer)autolockTimer
{
  return self->_autolockTimer;
}

- (void)setAutolockTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autolockTimer, a3);
}

- (unint64_t)autolockReason
{
  return self->_autolockReason;
}

- (void)setAutolockReason:(unint64_t)a3
{
  self->_autolockReason = a3;
}

- (PXDisplayCollection)assetCollectionToObserve
{
  return self->_assetCollectionToObserve;
}

- (NSMutableArray)authenticationStack
{
  return self->_authenticationStack;
}

- (unint64_t)cachedAuthenticationStackCount
{
  return self->_cachedAuthenticationStackCount;
}

- (void)setCachedAuthenticationStackCount:(unint64_t)a3
{
  self->_cachedAuthenticationStackCount = a3;
}

- (BOOL)hasPerformedAuthenticationInStack
{
  return self->_hasPerformedAuthenticationInStack;
}

- (void)setHasPerformedAuthenticationInStack:(BOOL)a3
{
  self->_hasPerformedAuthenticationInStack = a3;
}

- (BOOL)authenticationAttemptDidFailOrWasCancelled
{
  return self->_authenticationAttemptDidFailOrWasCancelled;
}

- (NSNumber)contentPrivacyEnabledNumberForTesting
{
  return self->_contentPrivacyEnabledNumberForTesting;
}

- (void)setContentPrivacyEnabledNumberForTesting:(id)a3
{
  objc_storeStrong((id *)&self->_contentPrivacyEnabledNumberForTesting, a3);
}

- (NSNumber)testingOverride_authenticationType
{
  return self->_testingOverride_authenticationType;
}

- (NSNumber)testingOverride_shouldPerformAuthenticationOnAppearing
{
  return self->_testingOverride_shouldPerformAuthenticationOnAppearing;
}

- (void)setTestingOverride_shouldPerformAuthenticationOnAppearing:(id)a3
{
  objc_storeStrong((id *)&self->_testingOverride_shouldPerformAuthenticationOnAppearing, a3);
}

- (NSNumber)testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce
{
  return self->_testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce;
}

- (void)setTestingOverride_shouldOnlyPerformAutomaticAuthenticationOnce:(id)a3
{
  objc_storeStrong((id *)&self->_testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce, a3);
}

- (NSNumber)testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy
{
  return self->_testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy;
}

- (void)setTestingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy:(id)a3
{
  objc_storeStrong((id *)&self->_testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy, a3);
}

- (NSNumber)testingOverride_autolockTimeout
{
  return self->_testingOverride_autolockTimeout;
}

- (void)setTestingOverride_autolockTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_testingOverride_autolockTimeout, a3);
}

- (id)authChallengeHandlerForTesting
{
  return self->_authChallengeHandlerForTesting;
}

- (void)setAuthChallengeHandlerForTesting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authChallengeHandlerForTesting, 0);
  objc_storeStrong((id *)&self->_testingOverride_autolockTimeout, 0);
  objc_storeStrong((id *)&self->_testingOverride_shouldLockAfterDelayWhenLeavingViewHierarchy, 0);
  objc_storeStrong((id *)&self->_testingOverride_shouldOnlyPerformAutomaticAuthenticationOnce, 0);
  objc_storeStrong((id *)&self->_testingOverride_shouldPerformAuthenticationOnAppearing, 0);
  objc_storeStrong((id *)&self->_testingOverride_authenticationType, 0);
  objc_storeStrong((id *)&self->_contentPrivacyEnabledNumberForTesting, 0);
  objc_storeStrong((id *)&self->_authenticationStack, 0);
  objc_storeStrong((id *)&self->_assetCollectionToObserve, 0);
  objc_storeStrong((id *)&self->_autolockTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_authenticationTypeObserver, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

uint64_t __58__PXContentPrivacyController__updateContentPrivacyEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PXContentPrivacyController__updateContentPrivacyEnabled__block_invoke_2;
  v3[3] = &unk_1E5141388;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

void __58__PXContentPrivacyController__updateContentPrivacyEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isContentPrivacyEnabled");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isContentPrivacyPrefEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetCollectionToObserve");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "px_isUserSmartAlbum");

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "assetCollectionToObserve");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "px_isPrivacySensitiveAlbum");

      if (v4 == (_DWORD)v8)
        goto LABEL_18;
    }
    else
    {
      if ((v4 & 1) != 0)
        goto LABEL_18;
      v8 = 1;
    }
  }
  else
  {
    if ((v4 & 1) == 0)
      goto LABEL_18;
    v8 = 0;
  }
  objc_msgSend(v3, "setContentPrivacyEnabled:", v8);
  objc_msgSend(v3, "setLocked:", v8);
  PLContentPrivacyUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v8)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = v11;
    v13 = v12;
    if (objc_msgSend(v3, "isLocked"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
    v16 = 138543874;
    v17 = v10;
    v18 = 2114;
    v19 = v12;
    v20 = 2114;
    v21 = v15;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Content privacy 'enabled' just changed to %{public}@. Setting locked to %{public}@", (uint8_t *)&v16, 0x20u);

  }
LABEL_18:

}

void __115__PXContentPrivacyController__performUserAuthenticationWithTitle_passcodeTitle_passcodeSubtitle_reason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_finishAuthenticationChallengeWithCompletionHandler:success:error:", *(_QWORD *)(a1 + 32), a2, v6);

}

void __115__PXContentPrivacyController__performUserAuthenticationWithTitle_passcodeTitle_passcodeSubtitle_reason_completion___block_invoke_218(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  id WeakRetained;
  int v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[__CFString domain](v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CC1280]))
    v6 = -[__CFString code](v4, "code") == -2 || -[__CFString code](v4, "code") == -9;
  else
    v6 = 0;

  PLContentPrivacyUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("NO");
    if (!v4)
      v9 = CFSTR("YES");
    v10 = v9;
    v18 = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: LocalAuthentication returned with success: %{public}@.", (uint8_t *)&v18, 0x16u);

  }
  if (v4)
  {
    PLContentPrivacyUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v13;
        v20 = 2112;
        v21 = v4;
        v14 = "PrivacyController [%{public}@]: LocalAuthentication cancellation: %@.";
        v15 = v12;
        v16 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
        _os_log_impl(&dword_1A6789000, v15, v16, v14, (uint8_t *)&v18, 0x16u);

      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v4;
      v14 = "PrivacyController [%{public}@]: LocalAuthentication error: %@.";
      v15 = v12;
      v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishAuthenticationChallengeWithCompletionHandler:success:error:", *(_QWORD *)(a1 + 40), v4 == 0, v4);

}

uint64_t __96__PXContentPrivacyController__finishAuthenticationChallengeWithCompletionHandler_success_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentAuthenticationContext:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasPerformedAuthenticationInStack:", 1);
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __96__PXContentPrivacyController__finishAuthenticationChallengeWithCompletionHandler_success_error___block_invoke_2;
  v5[3] = &__block_descriptor_33_e71_v16__0__PXContentPrivacyController_PXMutableContentPrivacyController__8l;
  v6 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v2, "performChanges:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_updateWillPerformAuthenticationAutomatically");
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setAuthenticationAttemptDidFailOrWasCancelled:", *(_BYTE *)(a1 + 56) == 0);
}

uint64_t __96__PXContentPrivacyController__finishAuthenticationChallengeWithCompletionHandler_success_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLocked:", *(_BYTE *)(a1 + 32) == 0);
}

uint64_t __36__PXContentPrivacyController_unlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_209_262057);
}

uint64_t __36__PXContentPrivacyController_unlock__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLocked:", 0);
}

void __45__PXContentPrivacyController_lockImmediately__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isContentPrivacyEnabled") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isPerformingAuthentication"))
    {
      PLContentPrivacyUIGetLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138543362;
        v7 = v3;
        _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Lock immediately requested, cancelling active user authentication.", (uint8_t *)&v6, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_cancelAuthentication");
    }
    else if ((objc_msgSend(*(id *)(a1 + 32), "isLocked") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_cancelDelayedLockIfNeededWithReason:", CFSTR("locking immediately requested"));
      objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_206_262066);
    }
  }
  else
  {
    PLContentPrivacyUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController [%{public}@]: Ignoring request to lock immediately, as the content privacy pref is disabled.", (uint8_t *)&v6, 0xCu);

    }
  }
}

uint64_t __45__PXContentPrivacyController_lockImmediately__block_invoke_205(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLocked:", 1);
}

uint64_t __50__PXContentPrivacyController_cancelAuthentication__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAuthentication");
}

uint64_t __75__PXContentPrivacyController__updateWillPerformAuthenticationAutomatically__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWillPerformAuthenticationAutomatically:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __55__PXContentPrivacyController__updateAuthenticationType__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAuthenticationType:", *(_QWORD *)(a1 + 32));
}

uint64_t __65__PXContentPrivacyController_updateAuthenticationTypeImmediately__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAuthenticationType:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__PXContentPrivacyController_scheduleAuthenticationStackCountUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCachedAuthenticationStackCount");
}

void __73__PXContentPrivacyController__startAutolockTimerForReason_resetIfActive___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopAutolockTimer");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_lockWithReasonForLogging:", CFSTR("Auto locking timer fired."));

}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applicationDidEnterBackground");

}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applicationWillEnterForeground");

}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "hostApplicationWillResignActiveFromNotification:", v3);

}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "hostApplicationDidBecomeActiveFromNotification:", v3);

}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "hostApplicationWillResignActiveFromNotification:", v3);

}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "hostApplicationDidBecomeActiveFromNotification:", v3);

}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "hostApplicationWillResignActiveFromNotification:", v3);

}

void __83__PXContentPrivacyController__beginObservingApplicationStateChangesAndSystemEvents__block_invoke_8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "hostApplicationDidBecomeActiveFromNotification:", v3);

}

+ (id)privacyControllerForCollection:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PXContentPrivacyController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v5, "px_isPrivacySensitiveAlbum") & 1) == 0
    && !objc_msgSend(v5, "px_isUserSmartAlbum"))
  {
    v12 = 0;
    goto LABEL_19;
  }
  if (!_privacyControllersByKey)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)_privacyControllersByKey;
    _privacyControllersByKey = (uint64_t)v6;

  }
  v8 = v5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentPrivacyController.m"), 158, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v26);
LABEL_22:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentPrivacyController.m"), 158, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v26, v28);

    goto LABEL_22;
  }
LABEL_8:
  v9 = objc_msgSend(v8, "assetCollectionSubtype");
  objc_msgSend(v8, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld_%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_privacyControllersByKey, "objectForKeyedSubscript:", v11);
  v12 = (PXContentPrivacyController *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    PLContentPrivacyUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v11;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_INFO, "PrivacyController: Creating instance of privacy controller, tracked by key: %@ for asset collection: %@", buf, 0x16u);
    }

    objc_msgSend(v8, "localizedTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v8, "title");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v17, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E5149688);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v21, "length"))
    {
      v22 = v11;

      v21 = v22;
    }
    v12 = -[PXContentPrivacyController initWithAssetCollectionToObserve:logIdentifier:]([PXContentPrivacyController alloc], "initWithAssetCollectionToObserve:logIdentifier:", v8, v21);
    objc_msgSend((id)_privacyControllersByKey, "setObject:forKeyedSubscript:", v12, v11);

  }
LABEL_19:

  return v12;
}

+ (void)tearDownPrivacyControllersIfNeeded
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)_privacyControllersByKey, "count"))
  {
    objc_msgSend((id)_privacyControllersByKey, "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PLContentPrivacyUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PrivacyController: Tearing down all privacy controller instances: %{public}@", buf, 0xCu);
    }

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "clearAuthenticationStack", (_QWORD)v11);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  objc_msgSend((id)_privacyControllersByKey, "removeAllObjects", (_QWORD)v11);
  v10 = (void *)_privacyControllersByKey;
  _privacyControllersByKey = 0;

}

+ (unint64_t)automaticAuthenticationBehaviorFromInternalSettings
{
  void *v2;
  uint64_t v3;

  +[PXContentPrivacySettings sharedInstance](PXContentPrivacySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authenticationBehaviorUponAppearing");

  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

uint64_t __64__PXContentPrivacyController_tearDownPrivacyControllersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logIdentifier");
}

@end
