@implementation _SBUIBiometricKitInterface

- (_SBUIBiometricKitInterface)init
{
  _SBUIBiometricKitInterface *v2;
  _SBUIBiometricKitInterface *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  OS_dispatch_queue *delegateQueue;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSSet *biometricDevices;
  NSSet *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *mesaDevice;
  char isKindOfClass;
  BKDeviceTouchID *v30;
  void *pearlDevice;
  char v32;
  BKDevicePearl *v33;
  id v34;
  __int128 v36;
  id obj;
  id v38;
  void *v39;
  _QWORD handler[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)_SBUIBiometricKitInterface;
  v2 = -[_SBUIBiometricKitInterface init](&v52, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enrolledIdentitiesCount = 0;
    if (__loadBiometricKitIfNecessary_onceToken != -1)
      dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global);
    if (__loadBiometricKitIfNecessary_biometricKit && __loadBiometricKitIfNecessary_localAuthentication)
    {
      objc_msgSend(MEMORY[0x1E0D01760], "serial");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serviceClass:", 25);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = BSDispatchQueueCreate();
      delegateQueue = v3->_delegateQueue;
      v3->_delegateQueue = (OS_dispatch_queue *)v6;

      -[objc_class availableDevices](_SBUIEffectiveBiometricClassFromString(CFSTR("BKDeviceManager")), "availableDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v8;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v49 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            v13 = _SBUIEffectiveBiometricClassFromString(CFSTR("BKDevice"));
            v47 = 0;
            -[objc_class deviceWithDescriptor:error:](v13, "deviceWithDescriptor:error:", v12, &v47);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v47;
            if (v14)
            {
              objc_msgSend(v39, "addObject:", v14);
            }
            else
            {
              SBLogBiometricResource();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v55 = v12;
                v56 = 2112;
                v57 = v15;
                _os_log_error_impl(&dword_1A471F000, v16, OS_LOG_TYPE_ERROR, "Failed to create biometric device for descriptor %@: %@", buf, 0x16u);
              }

            }
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        }
        while (v9);
      }

      v17 = objc_msgSend(v39, "copy");
      biometricDevices = v3->_biometricDevices;
      v3->_biometricDevices = (NSSet *)v17;

      v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v19 = v3->_biometricDevices;
      v20 = -[NSSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (v20)
      {
        v22 = *(_QWORD *)v44;
        *(_QWORD *)&v21 = 138412546;
        v36 = v21;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v44 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            v42 = 0;
            objc_msgSend(v24, "identitiesWithError:", &v42, v36);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v42;
            if (v25)
            {
              objc_msgSend(v38, "addObjectsFromArray:", v25);
            }
            else
            {
              SBLogBiometricResource();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v36;
                v55 = v24;
                v56 = 2112;
                v57 = v26;
                _os_log_error_impl(&dword_1A471F000, v27, OS_LOG_TYPE_ERROR, "Failed to retrieve identities from device %@: %@", buf, 0x16u);
              }

            }
            if (!v3->_mesaDevice)
            {
              objc_msgSend(v24, "descriptor");
              mesaDevice = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(mesaDevice, "type") == 1)
              {
                _SBUIEffectiveBiometricClassFromString(CFSTR("BKDeviceTouchID"));
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) == 0)
                  goto LABEL_33;
                v30 = v24;
                mesaDevice = v3->_mesaDevice;
                v3->_mesaDevice = v30;
              }

            }
LABEL_33:
            if (v3->_pearlDevice)
              goto LABEL_38;
            objc_msgSend(v24, "descriptor");
            pearlDevice = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(pearlDevice, "type") == 2)
            {
              _SBUIEffectiveBiometricClassFromString(CFSTR("BKDevicePearl"));
              objc_opt_class();
              v32 = objc_opt_isKindOfClass();

              if ((v32 & 1) == 0)
                goto LABEL_38;
              v33 = v24;
              pearlDevice = v3->_pearlDevice;
              v3->_pearlDevice = v33;
            }

LABEL_38:
          }
          v20 = -[NSSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        }
        while (v20);
      }

      v3->_enrolledIdentitiesCount = objc_msgSend(v38, "count");
      objc_initWeak((id *)buf, v3);
      v34 = MEMORY[0x1E0C80D38];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __34___SBUIBiometricKitInterface_init__block_invoke;
      handler[3] = &unk_1E4C3E5D8;
      objc_copyWeak(&v41, (id *)buf);
      notify_register_dispatch("com.apple.BiometricKit.enrollmentChanged", &v3->_enrollmentChangedNotifyToken, MEMORY[0x1E0C80D38], handler);

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);

    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_enrollmentChangedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)_SBUIBiometricKitInterface;
  -[_SBUIBiometricKitInterface dealloc](&v3, sel_dealloc);
}

- (BOOL)isTouchIDCapable
{
  return self->_mesaDevice != 0;
}

- (BOOL)isPearlIDCapable
{
  return self->_pearlDevice != 0;
}

- (id)createPearlDevice
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __int128 v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[objc_class availableDevices](_SBUIEffectiveBiometricClassFromString(CFSTR("BKDeviceManager")), "availableDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138412546;
    v15 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", v15) == 2)
        {
          v10 = _SBUIEffectiveBiometricClassFromString(CFSTR("BKDevice"));
          v16 = 0;
          -[objc_class deviceWithDescriptor:error:](v10, "deviceWithDescriptor:error:", v9, &v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v16;
          if (v11)
          {
            v13 = v6;
            v6 = v11;
          }
          else
          {
            SBLogBiometricResource();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v22 = v9;
              v23 = 2112;
              v24 = v12;
              _os_log_error_impl(&dword_1A471F000, v13, OS_LOG_TYPE_ERROR, "Failed to create biometric device for descriptor %@: %@", buf, 0x16u);
            }
          }

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)enableBackgroundFingerDetection:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v9;

  v5 = a3;
  if (a3 && !self->_mesaDevice)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBUIBiometricKitInterface.m"), 319, CFSTR("can't enable background FDET without mesa"));

  }
  return -[BKDeviceTouchID enableBackgroundFingerDetection:error:](self->_mesaDevice, "enableBackgroundFingerDetection:error:", v5, a4);
}

- (id)createMatchOperationsWithMode:(unint64_t)a3 andCredentialSet:(id)a4 error:(id *)a5
{
  id v7;
  NSSet *v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _SBUIBiometricKitInterfaceOperationStateTracker *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  NSSet *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBUIBiometricKitInterface.m"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchMode != SBUIBiometricMatchModeNone"));

  }
  v8 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSSet count](self->_biometricDevices, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = self->_biometricDevices;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 4;
    if (!v7)
      v12 = 2;
    v24 = v12;
    v13 = *(_QWORD *)v29;
    obj = v9;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "createMatchOperationWithError:", a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {

          v9 = v8;
          v8 = 0;
          goto LABEL_25;
        }
        v16 = v15;
        objc_msgSend(v15, "setDelegate:", self);
        objc_msgSend(v16, "setQueue:", self->_delegateQueue);
        _SBUIEffectiveBiometricClassFromString(CFSTR("BKMatchPearlOperation"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        switch(a3)
        {
          case 0uLL:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBUIBiometricKitInterface.m"), 343, CFSTR("Invalid Match Mode"));

            break;
          case 1uLL:
            objc_msgSend(v16, "setPurpose:", 5);
            break;
          case 2uLL:
            objc_msgSend(v16, "setPurpose:", 5);
            objc_msgSend(v16, "setCaptureOnly:", 1);
            break;
          case 3uLL:
            objc_msgSend(v16, "setPurpose:", v24);
            objc_msgSend(v17, "setShouldAutoRetry:", 1);
            break;
          default:
            break;
        }
        objc_msgSend(v17, "setLongTimeout:", 1);
        objc_msgSend(v17, "setStopOnSuccess:", 1);
        if (v7)
        {
          objc_msgSend(v7, "serializedCredentialSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setCredentialSet:", v19);

        }
        -[NSSet addObject:](v8, "addObject:", v16);
        v20 = -[_SBUIBiometricKitInterfaceOperationStateTracker initWithState:]([_SBUIBiometricKitInterfaceOperationStateTracker alloc], "initWithState:", 0);
        -[_SBUIBiometricKitInterface _setTracker:forOperation:](self, "_setTracker:forOperation:", v20, v16);

      }
      v9 = obj;
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_25:

  v21 = (void *)-[NSSet copy](v8, "copy");
  return v21;
}

- (id)createPresenceDetectOperationsWithError:(id *)a3
{
  return -[_SBUIBiometricKitInterface _createPresenceDetectOperationsForDeviceTypes:error:](self, "_createPresenceDetectOperationsForDeviceTypes:error:", 0, a3);
}

- (id)createFingerDetectOperationsWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E4C7AC08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBUIBiometricKitInterface _createPresenceDetectOperationsForDeviceTypes:error:](self, "_createPresenceDetectOperationsForDeviceTypes:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createFaceDetectOperationsWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E4C7AC20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBUIBiometricKitInterface _createPresenceDetectOperationsForDeviceTypes:error:](self, "_createPresenceDetectOperationsForDeviceTypes:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)lockoutState
{
  uint64_t v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = getuid();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_biometricDevices;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v14 = 0;
        v10 = objc_msgSend(v9, "bioLockoutState:forUser:error:", &v14, v3, 0);
        v11 = v14;
        if (v10)
          v12 = v14 == 1;
        else
          v12 = 1;
        if (!v12)
        {

          if ((unint64_t)(v11 - 2) > 6)
            return 10;
          else
            return qword_1A47AEA90[v11 - 2];
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }

  return 0;
}

- (BOOL)hasEnrolledIdentities
{
  return self->_enrolledIdentitiesCount != 0;
}

- (BOOL)isFingerOn
{
  return self->_isFingerDetected;
}

- (void)forceBioLockout
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_biometricDevices;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v8 = getuid();
        SBLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v7;
          _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_INFO, "Forcing Bio Lockout for device: %@", buf, 0xCu);
        }

        v13 = 0;
        v10 = objc_msgSend(v7, "forceBioLockoutForUser:error:", v8, &v13);
        v11 = v13;
        if ((v10 & 1) == 0)
        {
          SBLogCommon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v19 = v7;
            v20 = 2114;
            v21 = v11;
            _os_log_error_impl(&dword_1A471F000, v12, OS_LOG_TYPE_ERROR, "Failed to force Bio Lockout for device: %{public}@ with error: %{public}@", buf, 0x16u);
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v4);
  }

}

- (BOOL)isPeriocularMatchingEnabled
{
  BKDevicePearl *pearlDevice;
  void *v3;
  id v4;
  NSObject *v5;
  char v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  pearlDevice = self->_pearlDevice;
  v8 = 0;
  -[BKDevicePearl protectedConfigurationForUser:error:](pearlDevice, "protectedConfigurationForUser:error:", getuid(), &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Could not get protected config: %@", buf, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "periocularFaceIDMatchEnabled");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject BOOLValue](v5, "BOOLValue");
  }

  return v6;
}

- (void)_setTracker:(id)a3 forOperation:(id)a4
{
  objc_setAssociatedObject(a4, __tracker, a3, (void *)0x301);
}

- (id)_trackerForOperation:(id)a3
{
  return objc_getAssociatedObject(a3, __tracker);
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  _SBUIBiometricKitInterface *v10;
  int64_t v11;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___SBUIBiometricKitInterface_operation_finishedWithReason___block_invoke;
  block[3] = &unk_1E4C3E600;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  id v6;
  _QWORD block[5];
  id v8;
  int64_t v9;

  v6 = a3;
  if ((objc_msgSend(v6, "isMemberOfClass:", _SBUIEffectiveBiometricClassFromString(CFSTR("BKFaceDetectOperation"))) & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke;
    block[3] = &unk_1E4C3E600;
    block[4] = self;
    v8 = v6;
    v9 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  _SBUIBiometricKitInterface *v10;
  int64_t v11;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___SBUIBiometricKitInterface_matchOperation_failedWithReason___block_invoke;
  block[3] = &unk_1E4C3E600;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  _SBUIBiometricKitInterface *v10;
  BOOL v11;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___SBUIBiometricKitInterface_operation_presenceStateChanged___block_invoke;
  block[3] = &unk_1E4C3E628;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)matchOperation:(id)a3 matchedWithResult:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___SBUIBiometricKitInterface_matchOperation_matchedWithResult___block_invoke;
  block[3] = &unk_1E4C3E650;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62___SBUIBiometricKitInterface_matchOperation_providedFeedback___block_invoke;
  v4[3] = &unk_1E4C3E678;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

- (void)matchOperation:(id)a3 providedFaceOcclusionInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___SBUIBiometricKitInterface_matchOperation_providedFaceOcclusionInfo___block_invoke;
  v7[3] = &unk_1E4C3E6A0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)matchOperation:(id)a3 providedFaceWUPoseEligibilityInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79___SBUIBiometricKitInterface_matchOperation_providedFaceWUPoseEligibilityInfo___block_invoke;
  v7[3] = &unk_1E4C3E6A0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)_sendDelegateEvent:(unint64_t)a3
{
  -[_SBUIBiometricKitInterfaceDelegate biometricKitInterface:handleEvent:](self->_delegate, "biometricKitInterface:handleEvent:", self, a3);
}

- (void)_sendDelegateEventForFeedback:(int64_t)a3
{
  -[_SBUIBiometricKitInterface _sendDelegateEvent:](self, "_sendDelegateEvent:", -[_SBUIBiometricKitInterface _biometricEventForFaceDetectFeedback:](self, "_biometricEventForFaceDetectFeedback:", a3));
}

- (void)_sendDelegateEventForFaceOcclusionInfo:(id)a3
{
  if (objc_msgSend(a3, "hasFaceOcclusion"))
    -[_SBUIBiometricKitInterface _sendDelegateEvent:](self, "_sendDelegateEvent:", 21);
}

- (void)_sendDelegateEventForFaceWUPoseEligibilityInfo:(id)a3
{
  if (objc_msgSend(a3, "isEligible"))
    -[_SBUIBiometricKitInterface _sendDelegateEvent:](self, "_sendDelegateEvent:", 29);
}

- (unint64_t)_eventForLockoutState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 5;
  else
    return qword_1A47AEAC8[a3 - 1];
}

- (unint64_t)_biometricEventForFaceDetectFeedback:(int64_t)a3
{
  unint64_t result;

  switch(a3)
  {
    case 2:
    case 5:
    case 9:
      result = 22;
      break;
    case 3:
      result = 18;
      break;
    case 4:
      result = 17;
      break;
    case 6:
      result = 20;
      break;
    case 7:
      result = 21;
      break;
    case 8:
      result = 19;
      break;
    case 10:
      result = 23;
      break;
    case 11:
      result = 28;
      break;
    case 12:
      result = 30;
      break;
    case 13:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled())
        result = 31;
      else
        result = 16;
      break;
    default:
      result = 16;
      break;
  }
  return result;
}

- (id)_createPresenceDetectOperationsForDeviceTypes:(id)a3 error:(id *)a4
{
  id v5;
  NSSet *v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSSet *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSSet *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSSet count](self->_biometricDevices, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->_biometricDevices;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    obj = v7;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (!v5)
          goto LABEL_8;
        v13 = v6;
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "descriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "type"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v5, "containsObject:", v16);

        v6 = v13;
        if (v17)
        {
LABEL_8:
          objc_msgSend(v12, "createPresenceDetectOperationWithError:", a4, obj);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {

            v7 = v6;
            v6 = 0;
            goto LABEL_14;
          }
          v19 = v18;
          objc_msgSend(v18, "setDelegate:", self);
          objc_msgSend(v19, "setQueue:", self->_delegateQueue);
          -[NSSet addObject:](v6, "addObject:", v19);

        }
      }
      v7 = obj;
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

  v20 = (void *)-[NSSet copy](v6, "copy");
  return v20;
}

- (_SBUIBiometricKitInterfaceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_SBUIBiometricKitInterfaceDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_mesaDevice, 0);
  objc_storeStrong((id *)&self->_biometricDevices, 0);
}

@end
