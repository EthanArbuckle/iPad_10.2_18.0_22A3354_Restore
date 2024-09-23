@implementation PXSystemAuthenticationTypeObserver

- (PXSystemAuthenticationTypeObserver)init
{
  PXSystemAuthenticationTypeObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *observationQueue;
  uint64_t v6;
  NSMutableSet *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSystemAuthenticationTypeObserver;
  v2 = -[PXSystemAuthenticationTypeObserver init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.photos.authenticationtype-observer", v3);
    observationQueue = v2->_observationQueue;
    v2->_observationQueue = (OS_dispatch_queue *)v4;

    v2->_authenticationType = 0;
    -[PXSystemAuthenticationTypeObserver _updateAuthenticationTypeInBackground](v2, "_updateAuthenticationTypeInBackground");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v6;

    -[PXSystemAuthenticationTypeObserver _beginObservingApplicationStateChangesAndSystemEvents](v2, "_beginObservingApplicationStateChangesAndSystemEvents");
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  PLContentPrivacyUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] PXSystemAuthenticationTypeObserver dealloc", buf, 2u);
  }

  -[PXSystemAuthenticationTypeObserver _stopObservingApplicationStateChanges](self, "_stopObservingApplicationStateChanges");
  v4.receiver = self;
  v4.super_class = (Class)PXSystemAuthenticationTypeObserver;
  -[PXSystemAuthenticationTypeObserver dealloc](&v4, sel_dealloc);
}

- (int64_t)_currentlyAvailableBiometryType
{
  id v2;
  int v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  int64_t v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v10 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 1, &v10);
  v4 = v10;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v8 = objc_msgSend(v2, "biometryType");
  }
  else
  {
    PLContentPrivacyUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "[SystemAuthenticationObserver] Biometrics not available for auth. Error: %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (int64_t)_calculateAuthenticationType
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int64_t v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  char v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  PLContentPrivacyUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Calculating authentication type", buf, 2u);
  }

  if (-[PXSystemAuthenticationTypeObserver forcedSystemAuthenticationType](self, "forcedSystemAuthenticationType"))
  {
    PLContentPrivacyUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      PXDebugDescriptionFromSystemAuthenticationType(-[PXSystemAuthenticationTypeObserver forcedSystemAuthenticationType](self, "forcedSystemAuthenticationType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Using forced authentication type: %@", buf, 0xCu);

    }
    return -[PXSystemAuthenticationTypeObserver forcedSystemAuthenticationType](self, "forcedSystemAuthenticationType");
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLContentPrivacyUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CalculateAuthenticationType", ", buf, 2u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PLContentPrivacyUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Calculating authentication type on main thread", buf, 2u);
    }

  }
  v13 = -[PXSystemAuthenticationTypeObserver _currentlyAvailableBiometryType](self, "_currentlyAvailableBiometryType");
  v6 = 3;
  switch(v13)
  {
    case 0:
      v14 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
      v32 = 0;
      v15 = objc_msgSend(v14, "canEvaluatePolicy:error:", 2, &v32);
      v16 = v32;
      objc_msgSend(v16, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CC1280]) & 1) != 0)
      {
        v18 = objc_msgSend(v16, "code");

        if (v18 == -5)
          v19 = v15;
        else
          v19 = 1;
        if ((v19 & 1) == 0)
        {
          PLContentPrivacyUIGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v16;
            _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Passcode/password not available or error encountered while trying to determine. Error: %@", buf, 0xCu);
          }
          v21 = 1;
          goto LABEL_32;
        }
      }
      else
      {

      }
      if ((v15 & 1) != 0)
      {
        v21 = 2;
        goto LABEL_33;
      }
      PLContentPrivacyUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v16;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "[SystemAuthenticationObserver] Error while attempting to determine whether a passcode/password is set: %@", buf, 0xCu);
      }
      v21 = 2;
LABEL_32:

LABEL_33:
      v22 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
      v23 = objc_msgSend(v22, "canEvaluatePolicy:error:", 3, 0);

      if (v23)
        v6 = 6;
      else
        v6 = v21;
      goto LABEL_36;
    case 1:
      goto LABEL_36;
    case 2:
      v6 = 4;
      goto LABEL_36;
    case 4:
      v6 = 5;
      goto LABEL_36;
    default:
      v6 = 2;
LABEL_36:
      v24 = v11;
      v25 = v24;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v25, OS_SIGNPOST_INTERVAL_END, v9, "CalculateAuthenticationType", ", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", v7);
      v28 = v27;

      PLContentPrivacyUIGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        PXDebugDescriptionFromSystemAuthenticationType(v6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v30;
        v35 = 2048;
        v36 = v28;
        _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Calculated authentication type as %@, took %.1fs", buf, 0x16u);

      }
      return v6;
  }
}

- (void)updateAuthenticationTypeImmediately
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = -[PXSystemAuthenticationTypeObserver authenticationType](self, "authenticationType");
  v4 = -[PXSystemAuthenticationTypeObserver _calculateAuthenticationType](self, "_calculateAuthenticationType");
  if (v3 != v4)
  {
    v5 = v4;
    PLContentPrivacyUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Calculating authentication type on demand changed the authentication type", buf, 2u);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__PXSystemAuthenticationTypeObserver_updateAuthenticationTypeImmediately__block_invoke;
    v7[3] = &__block_descriptor_40_e87_v16__0__PXSystemAuthenticationTypeObserver_PXMutableSystemAuthenticationTypeObserver__8l;
    v7[4] = v5;
    -[PXSystemAuthenticationTypeObserver performChanges:](self, "performChanges:", v7);
  }
}

- (void)_updateAuthenticationTypeInBackground
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  PLContentPrivacyUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Scheduling async authentication type update", buf, 2u);
  }

  -[PXSystemAuthenticationTypeObserver observationQueue](self, "observationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)setAuthenticationType:(int64_t)a3
{
  if (self->_authenticationType != a3)
  {
    self->_authenticationType = a3;
    -[PXSystemAuthenticationTypeObserver signalChange:](self, "signalChange:", 1);
  }
}

- (void)setForcedSystemAuthenticationType:(int64_t)a3
{
  if (self->_forcedSystemAuthenticationType != a3)
  {
    self->_forcedSystemAuthenticationType = a3;
    -[PXSystemAuthenticationTypeObserver updateAuthenticationTypeImmediately](self, "updateAuthenticationTypeImmediately");
  }
}

- (void)_beginObservingApplicationStateChangesAndSystemEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC5338];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __91__PXSystemAuthenticationTypeObserver__beginObservingApplicationStateChangesAndSystemEvents__block_invoke;
  v11 = &unk_1E51441D8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSystemAuthenticationTypeObserver observers](self, "observers", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
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
  -[PXSystemAuthenticationTypeObserver observers](self, "observers", 0);
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

  -[PXSystemAuthenticationTypeObserver observers](self, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (int64_t)forcedSystemAuthenticationType
{
  return self->_forcedSystemAuthenticationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
}

void __91__PXSystemAuthenticationTypeObserver__beginObservingApplicationStateChangesAndSystemEvents__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAuthenticationTypeInBackground");

}

void __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[6];
  uint8_t buf[16];

  PLContentPrivacyUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Performing authentication type update in background", buf, 2u);
  }

  v3 = objc_msgSend(*(id *)(a1 + 32), "_calculateAuthenticationType");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke_9;
  v4[3] = &unk_1E5144EB8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke_9(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke_2;
  v3[3] = &__block_descriptor_40_e87_v16__0__PXSystemAuthenticationTypeObserver_PXMutableSystemAuthenticationTypeObserver__8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAuthenticationType:", *(_QWORD *)(a1 + 32));
}

uint64_t __73__PXSystemAuthenticationTypeObserver_updateAuthenticationTypeImmediately__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAuthenticationType:", *(_QWORD *)(a1 + 32));
}

+ (PXSystemAuthenticationTypeObserver)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_54690);
  return (PXSystemAuthenticationTypeObserver *)(id)sharedObserver_sharedInstance;
}

void __52__PXSystemAuthenticationTypeObserver_sharedObserver__block_invoke()
{
  PXSystemAuthenticationTypeObserver *v0;
  void *v1;

  v0 = objc_alloc_init(PXSystemAuthenticationTypeObserver);
  v1 = (void *)sharedObserver_sharedInstance;
  sharedObserver_sharedInstance = (uint64_t)v0;

}

@end
