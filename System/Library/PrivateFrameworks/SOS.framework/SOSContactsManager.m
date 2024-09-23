@implementation SOSContactsManager

- (SOSContactsManager)init
{
  return -[SOSContactsManager initWithHealthStore:](self, "initWithHealthStore:", 0);
}

- (SOSContactsManager)initWithHealthStore:(id)a3
{
  id v5;
  SOSContactsManager *v6;
  SOSContactsManager *v7;
  SOSContactsManager *v8;
  HKHealthStore *v9;
  HKHealthStore *healthStore;
  NSObject *v11;
  uint64_t v12;
  HKHealthStore *v13;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *medicalIDContactsInitialStateSemaphore;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  pthread_mutex_t *v26;
  uint32_t v27;
  NSObject *v28;
  dispatch_semaphore_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  uint8_t v44[8];
  _QWORD handler[4];
  pthread_mutex_t *v46;
  objc_super v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  HKHealthStore *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[SOSEntitlement currentProcessHasEntitlement:](SOSEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.sos.contacts")))
  {
    v47.receiver = self;
    v47.super_class = (Class)SOSContactsManager;
    v6 = -[SOSContactsManager init](&v47, sel_init);
    v7 = v6;
    if (v6)
    {
      if (v5)
      {
        objc_storeStrong((id *)&v6->_healthStore, a3);
      }
      else
      {
        v9 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E0CB6780]);
        healthStore = v7->_healthStore;
        v7->_healthStore = v9;

        -[HKHealthStore setDebugIdentifier:](v7->_healthStore, "setDebugIdentifier:", CFSTR("com.apple.sos"));
        -[HKHealthStore resume](v7->_healthStore, "resume");
      }
      sos_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_opt_class();
        v13 = v7->_healthStore;
        *(_DWORD *)buf = 138412546;
        v49 = v12;
        v50 = 2112;
        v51 = v13;
        _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "Initializing %@ with _healthStore: %@", buf, 0x16u);
      }

      v14 = dispatch_semaphore_create(0);
      medicalIDContactsInitialStateSemaphore = v7->_medicalIDContactsInitialStateSemaphore;
      v7->_medicalIDContactsInitialStateSemaphore = (OS_dispatch_semaphore *)v14;

      v16 = pthread_mutex_init(&v7->_medicalIDEmergencyContactsMutex, 0);
      if ((_DWORD)v16)
      {
        sos_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[SOSContactsManager initWithHealthStore:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);

      }
      v24 = (const char *)*MEMORY[0x1E0CB7748];
      v25 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __42__SOSContactsManager_initWithHealthStore___block_invoke;
      handler[3] = &unk_1E5F75BB0;
      v26 = v7;
      v46 = v26;
      v27 = notify_register_dispatch(v24, &v7->_healthContactsNotificationToken, MEMORY[0x1E0C80D38], handler);
      if (v27)
      {
        sos_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v49) = v27;
          _os_log_impl(&dword_1AF4DC000, v28, OS_LOG_TYPE_DEFAULT, "Failed to register for Health contacts notification: %d", buf, 8u);
        }

      }
      -[pthread_mutex_t _fetchMedicalIDEmergencyContacts](v26, "_fetchMedicalIDEmergencyContacts");

      v29 = dispatch_semaphore_create(0);
      v30 = *(void **)&v26->__opaque[48];
      *(_QWORD *)&v26->__opaque[48] = v29;

      v31 = pthread_mutex_init(v26 + 2, 0);
      if ((_DWORD)v31)
      {
        sos_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[SOSContactsManager initWithHealthStore:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

      }
      objc_initWeak((id *)buf, v26);
      sos_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_1AF4DC000, v39, OS_LOG_TYPE_DEFAULT, "Registering SafetyMonitor startMonitoringSessionStateWithHandler", v44, 2u);
      }

      objc_msgSend(getSMSafetyMonitorManagerClass(), "defaultManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v25;
      v42[1] = 3221225472;
      v42[2] = __42__SOSContactsManager_initWithHealthStore___block_invoke_216;
      v42[3] = &unk_1E5F75BD8;
      objc_copyWeak(&v43, (id *)buf);
      objc_msgSend(v40, "startMonitoringSessionStateWithHandler:", v42);

      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __42__SOSContactsManager_initWithHealthStore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_medicalContactsDidChange");
}

void __42__SOSContactsManager_initWithHealthStore___block_invoke_216(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  _BOOL4 v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sos_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v10)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor startMonitoringSessionStateWithHandler invoked, updating", v11, 2u);
    }

    objc_msgSend(WeakRetained, "_updateWithSafetyMonitorSessionState:error:", v6, v7);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor startMonitoringSessionStateWithHandler invoked, no self", buf, 2u);
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(getSMSafetyMonitorManagerClass(), "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoringSessionStateWithHandler:", &__block_literal_global);

  notify_cancel(self->_healthContactsNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)SOSContactsManager;
  -[SOSContactsManager dealloc](&v4, sel_dealloc);
}

void __29__SOSContactsManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __29__SOSContactsManager_dealloc__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)refreshCurrentEmergencyContacts
{
  -[SOSContactsManager _fetchMedicalIDEmergencyContacts](self, "_fetchMedicalIDEmergencyContacts");
  -[SOSContactsManager _fetchSafetyMonitorSessionHandles](self, "_fetchSafetyMonitorSessionHandles");
}

- (void)SOSContactsWithTimeout:(double)a3 andCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SOSContactsManager medicalIDEmergencyContacts](self, "medicalIDEmergencyContacts");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (id)SOSContactDestinations
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SOSContactsManager SOSContactRecipients](self, "SOSContactRecipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSRecipient handlesFromRecipients:](SOSRecipient, "handlesFromRecipients:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "sosContactDestinations: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)SOSContactRecipients
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = (id)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SOSContactsManager_SOSContactRecipients__block_invoke;
  v7[3] = &unk_1E5F75C20;
  v7[4] = self;
  v7[5] = &v8;
  -[SOSContactsManager SOSContactsWithTimeout:andCompletion:](self, "SOSContactsWithTimeout:andCompletion:", v7, 10.0);
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v9[5];
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "sosRecipients: %@", buf, 0xCu);
  }

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__SOSContactsManager_SOSContactRecipients__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  __int128 v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[128];
  uint8_t v39[128];
  _BYTE buf[24];
  void *v41;
  uint64_t *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v31;
    *(_QWORD *)&v4 = 138412290;
    v24 = v4;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v7, "phoneNumber", v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        sos_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v7;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "sosContact: %@ phoneNumber: %@", buf, 0x16u);
        }

        if (objc_msgSend(v8, "length"))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "_isEmergencyNumber:", v8))
          {
            sos_default_log();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              *(_QWORD *)&buf[4] = v8;
              _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "NOT adding phoneNumber as it's an emergency #: %@", buf, 0xCu);
            }
          }
          else
          {
            v10 = objc_opt_new();
            -[NSObject setHandle:](v10, "setHandle:", v8);
            -[NSObject setReasons:](v10, "setReasons:", 1);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);
          }

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v3);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "activeSafetyMonitorSessionPrimaryHandles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        if (objc_msgSend(v15, "length"))
        {
          v34 = 0;
          v35 = &v34;
          v36 = 0x2050000000;
          v16 = (void *)getSMHandleClass_softClass;
          v37 = getSMHandleClass_softClass;
          if (!getSMHandleClass_softClass)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getSMHandleClass_block_invoke;
            v41 = &unk_1E5F75CA8;
            v42 = &v34;
            __getSMHandleClass_block_invoke((uint64_t)buf);
            v16 = (void *)v35[3];
          }
          v17 = objc_retainAutorelease(v16);
          _Block_object_dispose(&v34, 8);
          if (objc_msgSend(v17, "getSMHandleTypeWithHandle:", v15) == 2)
          {
            sos_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v15;
              _os_log_impl(&dword_1AF4DC000, v18, OS_LOG_TYPE_DEFAULT, "Adding email safetyMonitorSessionHandle: %@", buf, 0xCu);
            }

            v19 = objc_opt_new();
            -[NSObject setHandle:](v19, "setHandle:", v15);
            -[NSObject setReasons:](v19, "setReasons:", 2);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v19);
          }
          else
          {
            v19 = v15;
            if (objc_msgSend(*(id *)(a1 + 32), "_isEmergencyNumber:", v19))
            {
              sos_default_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v19;
                _os_log_impl(&dword_1AF4DC000, v20, OS_LOG_TYPE_DEFAULT, "NOT adding safetyMonitorSessionPhoneNumber as it's an emergency #: %@", buf, 0xCu);
              }
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "_sosRecipientContainingPhoneNumber:inRecipients:", v19, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
              v20 = objc_claimAutoreleasedReturnValue();
              sos_default_log();
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
              if (v20)
              {
                if (v22)
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v19;
                  _os_log_impl(&dword_1AF4DC000, v21, OS_LOG_TYPE_DEFAULT, "NOT adding safetyMonitorSessionPhoneNumber as it's already there: %@, marking phone number as Zelkova contact", buf, 0xCu);
                }

                -[NSObject setReasons:](v20, "setReasons:", -[NSObject reasons](v20, "reasons") | 2);
              }
              else
              {
                if (v22)
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v19;
                  _os_log_impl(&dword_1AF4DC000, v21, OS_LOG_TYPE_DEFAULT, "Adding safetyMonitorSessionPhoneNumber: %@", buf, 0xCu);
                }

                v23 = (void *)objc_opt_new();
                objc_msgSend(v23, "setHandle:", v19);
                objc_msgSend(v23, "setReasons:", 2);
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v23);

              }
            }

          }
        }
        else
        {
          sos_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AF4DC000, v19, OS_LOG_TYPE_DEFAULT, "NOT adding safetyMonitorSessionHandle as it's empty", buf, 2u);
          }
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v12);
  }

}

- (id)_sosRecipientContainingPhoneNumber:(id)a3 inRecipients:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "handle", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SOSContactsManager isPhoneNumberEqual:toNumber:](self, "isPhoneNumberEqual:toNumber:", v6, v13);

        if (v14)
        {
          v15 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)isPhoneNumberEqual:(id)a3 toNumber:(id)a4
{
  id v5;
  id v6;
  const void *active;
  const void *v8;
  int v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  active = (const void *)PNCopyBestGuessCountryCodeForNumber();
  if (!active)
    active = (const void *)CPPhoneNumberCopyActiveCountryCode();
  v8 = (const void *)PNCopyBestGuessCountryCodeForNumber();
  if (!v8)
    v8 = (const void *)CPPhoneNumberCopyActiveCountryCode();
  v9 = PNPhoneNumbersEqual();
  CFRelease(active);
  CFRelease(v8);
  sos_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315906;
    v13 = "-[SOSContactsManager isPhoneNumberEqual:toNumber:]";
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 1024;
    v19 = v9;
    _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "%s: numberA: %@, numberB: %@, equal: %d", (uint8_t *)&v12, 0x26u);
  }

  return v9;
}

- (BOOL)SOSContactsExist
{
  void *v2;
  BOOL v3;

  -[SOSContactsManager SOSContactDestinations](self, "SOSContactDestinations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_isEmergencyNumber:(id)a3
{
  id v3;
  uint64_t IsEmergencyNumber;
  NSObject *v5;

  v3 = a3;
  CTSUServerConnectionRef();
  IsEmergencyNumber = _CTServerConnectionIsEmergencyNumber();

  if ((_DWORD)IsEmergencyNumber)
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SOSContactsManager _isEmergencyNumber:].cold.1(IsEmergencyNumber, SHIDWORD(IsEmergencyNumber), v5);

  }
  return 0;
}

- (BOOL)hasValidContactsToMessage
{
  void *v2;
  BOOL v3;

  -[SOSContactsManager phoneNumbersToMessage](self, "phoneNumbersToMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (SOSLegacyContactsManager)legacyContactsManager
{
  SOSLegacyContactsManager *legacyContactsManager;
  SOSLegacyContactsManager *v4;
  SOSLegacyContactsManager *v5;

  legacyContactsManager = self->_legacyContactsManager;
  if (!legacyContactsManager)
  {
    v4 = (SOSLegacyContactsManager *)objc_opt_new();
    v5 = self->_legacyContactsManager;
    self->_legacyContactsManager = v4;

    legacyContactsManager = self->_legacyContactsManager;
  }
  return legacyContactsManager;
}

- (id)_userDefaults
{
  if (_userDefaults_onceToken != -1)
    dispatch_once(&_userDefaults_onceToken, &__block_literal_global_225);
  return (id)_userDefaults_defaults;
}

void __35__SOSContactsManager__userDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobilephone"));
  v1 = (void *)_userDefaults_defaults;
  _userDefaults_defaults = v0;

}

+ (void)preloadContactStoreIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SOSContactsManager_preloadContactStoreIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadContactStoreIfNecessary_once != -1)
    dispatch_once(&preloadContactStoreIfNecessary_once, block);
}

void __52__SOSContactsManager_preloadContactStoreIfNecessary__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  _QWORD block[5];

  v2 = dispatch_queue_create("com.apple.sos.contactStoreQueue", 0);
  v3 = (void *)__contactStoreQueue;
  __contactStoreQueue = (uint64_t)v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SOSContactsManager_preloadContactStoreIfNecessary__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)__contactStoreQueue, block);
}

void __52__SOSContactsManager_preloadContactStoreIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "authorizedToUseContactStore"))
  {
    objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 1);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__contactStore;
    __contactStore = v1;

  }
}

+ (id)contactStore
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  objc_msgSend(a1, "preloadContactStoreIfNecessary");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SOSContactsManager_contactStore__block_invoke;
  block[3] = &unk_1E5F75CA8;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__contactStoreQueue, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SOSContactsManager_contactStore__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)__contactStore);
}

+ (BOOL)authorizedToUseContactStore
{
  if (authorizedToUseContactStore_onceToken != -1)
    dispatch_once(&authorizedToUseContactStore_onceToken, &__block_literal_global_230);
  return authorizedToUseContactStore_contactStoreAuthorized;
}

void __49__SOSContactsManager_authorizedToUseContactStore__block_invoke()
{
  uint64_t v0;

  v0 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
  authorizedToUseContactStore_contactStoreAuthorized = v0 == 3;
  if (v0 != 3)
    NSLog(CFSTR("Not authorized to access contact store (authorization status: %ld)"), v0);
}

- (NSArray)medicalIDEmergencyContacts
{
  _opaque_pthread_mutex_t *p_medicalIDEmergencyContactsMutex;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SOSContactsManager _waitForMedicalIDInitialState](self, "_waitForMedicalIDInitialState");
  p_medicalIDEmergencyContactsMutex = &self->_medicalIDEmergencyContactsMutex;
  pthread_mutex_lock(&self->_medicalIDEmergencyContactsMutex);
  v4 = (void *)-[NSArray copy](self->_medicalIDEmergencyContacts, "copy");
  pthread_mutex_unlock(p_medicalIDEmergencyContactsMutex);
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Get medicalIDEmergencyContacts: %@", (uint8_t *)&v7, 0xCu);
  }

  return (NSArray *)v4;
}

- (void)setMedicalIDEmergencyContacts:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pthread_mutex_lock(&self->_medicalIDEmergencyContactsMutex);
  objc_storeStrong((id *)&self->_medicalIDEmergencyContacts, a3);
  pthread_mutex_unlock(&self->_medicalIDEmergencyContactsMutex);
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "Set medicalIDEmergencyContacts: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("SOSContactsChangedNotification"), self);

}

- (void)_fetchMedicalIDEmergencyContacts
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SOSContactsManager__fetchMedicalIDEmergencyContacts__block_invoke;
  v3[3] = &unk_1E5F75CF0;
  objc_copyWeak(&v4, &location);
  -[SOSContactsManager _medicalIDEmergencyContactsWithCompletion:](self, "_medicalIDEmergencyContactsWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__SOSContactsManager__fetchMedicalIDEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setMedicalIDEmergencyContacts:", v3);

  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Received initial medical ID emergency contacts", v7, 2u);
  }

  objc_msgSend(WeakRetained, "medicalIDContactsInitialStateSemaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

}

- (void)_medicalIDEmergencyContactsWithCompletion:(id)a3
{
  id v4;
  HKHealthStore *healthStore;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  healthStore = self->_healthStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SOSContactsManager__medicalIDEmergencyContactsWithCompletion___block_invoke;
  v7[3] = &unk_1E5F75D18;
  v8 = v4;
  v6 = v4;
  -[HKHealthStore fetchMedicalIDEmergencyContactsWithCompletion:](healthStore, "fetchMedicalIDEmergencyContactsWithCompletion:", v7);

}

void __64__SOSContactsManager__medicalIDEmergencyContactsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v5;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "emergencyContacts: %@ error: %@", buf, 0x16u);
  }

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = (void *)objc_opt_new();
          objc_msgSend(v14, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setName:", v16);

          objc_msgSend(v14, "phoneNumber");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPhoneNumber:", v17);

          objc_msgSend(v14, "nameContactIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setNameContactIdentifier:", v18);

          objc_msgSend(v14, "phoneNumberContactIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPhoneNumberContactIdentifier:", v19);

          objc_msgSend(v8, "addObject:", v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v20;
  }

}

- (void)_waitForMedicalIDInitialState
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_1AF4DC000, a1, a3, "Timed out waiting for initial medical ID state", v3);
  OUTLINED_FUNCTION_2();
}

- (void)_medicalContactsDidChange
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id buf[2];

  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "_medicalContactsDidChange", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SOSContactsManager__medicalContactsDidChange__block_invoke;
  v4[3] = &unk_1E5F75CF0;
  objc_copyWeak(&v5, buf);
  -[SOSContactsManager _medicalIDEmergencyContactsWithCompletion:](self, "_medicalIDEmergencyContactsWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __47__SOSContactsManager__medicalContactsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setMedicalIDEmergencyContacts:", v3);

}

- (NSArray)activeSafetyMonitorSessionPrimaryHandles
{
  _opaque_pthread_mutex_t *p_safetyMonitorSessionHandleMutex;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SOSContactsManager _waitForSafetyMonitorInitialState](self, "_waitForSafetyMonitorInitialState");
  p_safetyMonitorSessionHandleMutex = &self->_safetyMonitorSessionHandleMutex;
  pthread_mutex_lock(&self->_safetyMonitorSessionHandleMutex);
  v4 = (void *)-[NSArray copy](self->_activeSafetyMonitorSessionPrimaryHandles, "copy");
  pthread_mutex_unlock(p_safetyMonitorSessionHandleMutex);
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Get activeSafetyMonitorSessionPrimaryHandles: %@", (uint8_t *)&v7, 0xCu);
  }

  return (NSArray *)v4;
}

- (void)setActiveSafetyMonitorSessionPrimaryHandles:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pthread_mutex_lock(&self->_safetyMonitorSessionHandleMutex);
  objc_storeStrong((id *)&self->_activeSafetyMonitorSessionPrimaryHandles, a3);
  pthread_mutex_unlock(&self->_safetyMonitorSessionHandleMutex);
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "Set activeSafetyMonitorSessionPrimaryHandles: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_fetchSafetyMonitorSessionHandles
{
  void *v2;
  id *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(getSMSafetyMonitorManagerClass(), "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke;
    v6[3] = &unk_1E5F75D40;
    v3 = &v7;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v2, "fetchSOSReceiversWithCompletion:", v6);
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke_238;
    v4[3] = &unk_1E5F75BD8;
    v3 = &v5;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v2, "fetchCurrentSessionStateWithHandler:", v4);
  }
  objc_destroyWeak(v3);

  objc_destroyWeak(&location);
}

void __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    sos_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor fetchSOSReceiversWithCompletion, no self", (uint8_t *)&v16, 2u);
    }
    goto LABEL_7;
  }
  sos_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
LABEL_7:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor fetchSOSReceiversWithCompletion, updating with receivers: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(WeakRetained, "_updateWithSafetyMonitorHandles:", v5);
LABEL_11:

}

void __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke_238(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  _BOOL4 v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sos_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v10)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor fetchCurrentSessionStateWithHandler, updating", v11, 2u);
    }

    objc_msgSend(WeakRetained, "_updateWithSafetyMonitorSessionState:error:", v6, v7);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SafetyMonitor fetchCurrentSessionStateWithHandler, no self", buf, 2u);
    }

  }
}

- (void)_updateWithSafetyMonitorSessionState:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint8_t buf[4];
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    sos_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SOSContactsManager _updateWithSafetyMonitorSessionState:error:].cold.2((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_4:
    v15 = 0;
    goto LABEL_5;
  }
  if ((objc_msgSend(v6, "isActiveState") & 1) == 0)
  {
    sos_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "_updateWithSafetyMonitorSessionState, Zelkova Session not in active state", buf, 2u);
    }
    goto LABEL_4;
  }
  objc_msgSend(v6, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  objc_msgSend(v6, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v17 & 1) != 0)
  {
    objc_msgSend(v18, "sosReceivers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "receiverHandles");
    v15 = objc_claimAutoreleasedReturnValue();

    sos_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "_updateWithSafetyMonitorSessionState, sosReceivers: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v18, "handle");
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject primaryHandle](v8, "primaryHandle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22)
    {
      v26 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v15 = objc_claimAutoreleasedReturnValue();
      sos_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl(&dword_1AF4DC000, v23, OS_LOG_TYPE_DEFAULT, "_updateWithSafetyMonitorSessionState, Active state with handle: %@", buf, 0xCu);
      }
    }
    else
    {
      sos_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[SOSContactsManager _updateWithSafetyMonitorSessionState:error:].cold.1(v23, v24, v25);
      v15 = 0;
    }

  }
LABEL_5:

  -[SOSContactsManager _updateWithSafetyMonitorHandles:](self, "_updateWithSafetyMonitorHandles:", v15);
}

- (void)_updateWithSafetyMonitorHandles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  SOSContactsManager *v15;
  uint8_t v16;
  _BYTE v17[15];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v15 = self;
  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "primaryHandle", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");
        sos_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v10;
            _os_log_impl(&dword_1AF4DC000, v13, OS_LOG_TYPE_DEFAULT, "_updateWithSafetyMonitorHandles, adding handle: %@", buf, 0xCu);
          }

          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[SOSContactsManager _updateWithSafetyMonitorHandles:].cold.1(&v16, v17, v13);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  -[SOSContactsManager setActiveSafetyMonitorSessionPrimaryHandles:](v15, "setActiveSafetyMonitorSessionPrimaryHandles:", v4);
  -[SOSContactsManager safetyMonitorSessionInitialStateSemaphore](v15, "safetyMonitorSessionInitialStateSemaphore");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v14);

}

- (void)_waitForSafetyMonitorInitialState
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_1AF4DC000, a1, a3, "Timed out waiting for initial SafetyMonitorSessionState", v3);
  OUTLINED_FUNCTION_2();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (OS_dispatch_semaphore)medicalIDContactsInitialStateSemaphore
{
  return self->_medicalIDContactsInitialStateSemaphore;
}

- (void)setMedicalIDContactsInitialStateSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDContactsInitialStateSemaphore, a3);
}

- (_opaque_pthread_mutex_t)medicalIDEmergencyContactsMutex
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[1].__opaque[40];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setMedicalIDEmergencyContactsMutex:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_medicalIDEmergencyContactsMutex.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_medicalIDEmergencyContactsMutex.__opaque[40] = v5;
  *(_OWORD *)&self->_medicalIDEmergencyContactsMutex.__sig = v3;
  *(_OWORD *)&self->_medicalIDEmergencyContactsMutex.__opaque[8] = v4;
}

- (OS_dispatch_semaphore)safetyMonitorSessionInitialStateSemaphore
{
  return self->_safetyMonitorSessionInitialStateSemaphore;
}

- (void)setSafetyMonitorSessionInitialStateSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_safetyMonitorSessionInitialStateSemaphore, a3);
}

- (_opaque_pthread_mutex_t)safetyMonitorSessionHandleMutex
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[2].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[2].__opaque[40];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[2].__opaque[24];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setSafetyMonitorSessionHandleMutex:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_safetyMonitorSessionHandleMutex.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_safetyMonitorSessionHandleMutex.__opaque[40] = v5;
  *(_OWORD *)&self->_safetyMonitorSessionHandleMutex.__sig = v3;
  *(_OWORD *)&self->_safetyMonitorSessionHandleMutex.__opaque[8] = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyMonitorSessionInitialStateSemaphore, 0);
  objc_storeStrong((id *)&self->_medicalIDContactsInitialStateSemaphore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_activeSafetyMonitorSessionPrimaryHandles, 0);
  objc_storeStrong((id *)&self->_medicalIDEmergencyContacts, 0);
  objc_storeStrong((id *)&self->_legacyContactsManager, 0);
}

- (void)initWithHealthStore:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1AF4DC000, a2, a3, "_safetyMonitorSessionHandleMutex pthread_mutex_init failure: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithHealthStore:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1AF4DC000, a2, a3, "_medicalIDEmergencyContactsMutex pthread_mutex_init failure: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __29__SOSContactsManager_dealloc__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, a2, a3, "stopMonitoringSessionStateWithHandler, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_isEmergencyNumber:(os_log_t)log .cold.1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1AF4DC000, log, OS_LOG_TYPE_ERROR, "Received error from _CTServerConnectionIsEmergencyNumber(): domain: %d, error: %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_3();
}

void __55__SOSContactsManager__fetchSafetyMonitorSessionHandles__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, a2, a3, "SafetyMonitor fetchSOSReceiversWithCompletion, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_updateWithSafetyMonitorSessionState:(uint64_t)a3 error:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_1AF4DC000, a1, a3, "_updateWithSafetyMonitorSessionState, Active state but empty handle", v3);
  OUTLINED_FUNCTION_2();
}

- (void)_updateWithSafetyMonitorSessionState:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, a2, a3, "_updateWithSafetyMonitorSessionState, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_updateWithSafetyMonitorHandles:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_1AF4DC000, a3, (uint64_t)a3, "_updateWithSafetyMonitorHandles, empty handle", a1);
}

@end
