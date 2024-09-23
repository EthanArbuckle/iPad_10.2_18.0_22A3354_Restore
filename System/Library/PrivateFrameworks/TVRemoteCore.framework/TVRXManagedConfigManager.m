@implementation TVRXManagedConfigManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_16);
  return (id)sharedInstance_sharedInstance_5;
}

void __42__TVRXManagedConfigManager_sharedInstance__block_invoke()
{
  TVRXManagedConfigManager *v0;
  void *v1;

  v0 = objc_alloc_init(TVRXManagedConfigManager);
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v0;

}

- (TVRXManagedConfigManager)init
{
  TVRXManagedConfigManager *v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRXManagedConfigManager;
  v2 = -[TVRXManagedConfigManager init](&v7, sel_init);
  if (v2)
  {
    _TVRCMDMLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Adding MCProfileConnection observer", v6, 2u);
    }

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  _TVRCMDMLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Removing MCProfileConnection observer", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)TVRXManagedConfigManager;
  -[TVRXManagedConfigManager dealloc](&v5, sel_dealloc);
}

- (BOOL)isManagedConfigProfileInstalled
{
  void *v2;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ManagedConfigProfileInstalledKey"));

  _TVRCMDMLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Checking if managed config profile is installed and contains TVRemote specific features: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (BOOL)allowedDeviceWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[TVRXManagedConfigManager isManagedConfigProfileInstalled](self, "isManagedConfigProfileInstalled"))
  {
    -[TVRXManagedConfigManager allowedDeviceNames](self, "allowedDeviceNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      _TVRCMDMLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[TVRXManagedConfigManager allowedDeviceNames](self, "allowedDeviceNames");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v8;
        _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "MDM profile contains allowed devices: %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), v4);
      v9 = objc_claimAutoreleasedReturnValue();
      -[TVRXManagedConfigManager allowedDeviceNames](self, "allowedDeviceNames");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filteredSetUsingPredicate:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "count");
      v13 = v12 != 0;
      _TVRCMDMLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          v19 = v4;
          v16 = "[%{public}@] is allowed";
LABEL_13:
          _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
        }
      }
      else if (v15)
      {
        *(_DWORD *)buf = 138543362;
        v19 = v4;
        v16 = "[%{public}@] is NOT allowed";
        goto LABEL_13;
      }

      goto LABEL_15;
    }
  }
  _TVRCMDMLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[TVRXManagedConfigManager allowedDeviceWithName:].cold.1(v9);
  v13 = 1;
LABEL_15:

  return v13;
}

- (void)refreshState
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *p_super;
  _BOOL4 v7;
  NSArray *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSSet *v14;
  NSSet *allowedDeviceNames;
  NSSet *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveValuesForUnionSetting:", *MEMORY[0x24BE63AD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  _TVRCMDMLog();
  p_super = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v20 = 138543362;
      v21 = v4;
      _os_log_impl(&dword_21A51B000, p_super, OS_LOG_TYPE_DEFAULT, "MDM profile contains MCFeatureTVRemoteAllowedTVs: %{public}@", (uint8_t *)&v20, 0xCu);
    }

    -[TVRXManagedConfigManager _convertMACAddressesToData:](self, "_convertMACAddressesToData:", v4);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_allowedTVs->super;
    self->_allowedTVs = v8;
  }
  else if (v7)
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_21A51B000, p_super, OS_LOG_TYPE_DEFAULT, "MDM profile does not contain MCFeatureTVRemoteAllowedTVs", (uint8_t *)&v20, 2u);
  }

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectiveValuesForUnionSetting:", *MEMORY[0x24BE63AC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  _TVRCMDMLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v20 = 138543362;
      v21 = v10;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "MDM profile contains MCFeatureTVRemoteAllowedTVDeviceNames: %{public}@", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
    allowedDeviceNames = self->_allowedDeviceNames;
    self->_allowedDeviceNames = v14;

LABEL_14:
    _TVRCMDMLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_21A51B000, v17, OS_LOG_TYPE_DEFAULT, "Device is managed, posting TVRXManagedConfigManagerTVRemoteAllowedTVAdded", (uint8_t *)&v20, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBool:forKey:", 1, CFSTR("ManagedConfigProfileInstalledKey"));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("TVRXManagedConfigManagerTVRemoteAllowedTVAdded"), 0);

    goto LABEL_17;
  }
  if (v13)
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "MDM profile does not contain MCFeatureTVRemoteAllowedTVDeviceNames", (uint8_t *)&v20, 2u);
  }

  v16 = self->_allowedDeviceNames;
  self->_allowedDeviceNames = 0;

  if (v5)
    goto LABEL_14;
LABEL_17:

}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  _TVRCMDMLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "MDM profile list did change, refreshing state", v6, 2u);
  }

  -[TVRXManagedConfigManager refreshState](self, "refreshState");
}

- (id)_convertMACAddressesToData:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint8_t v16;
  _BYTE v17[15];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
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
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = objc_retainAutorelease(v10);
          if (objc_msgSend(v11, "UTF8String"))
          {
            if (TextToHardwareAddress())
            {
              _TVRCMDMLog();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                -[TVRXManagedConfigManager _convertMACAddressesToData:].cold.1(&v16, v17, v12);
            }
            else
            {
              v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", buf, 6);
              objc_msgSend(v4, "addObject:", v12);
            }
          }
          else
          {
            _TVRCMDMLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v11;
              _os_log_error_impl(&dword_21A51B000, v12, OS_LOG_TYPE_ERROR, "MAC address was not a UTF8String: %{public}@", buf, 0xCu);
            }
          }

        }
        else
        {
          _TVRCMDMLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v23 = v10;
            _os_log_error_impl(&dword_21A51B000, v13, OS_LOG_TYPE_ERROR, "MAC address was not a string: %{public}@", buf, 0xCu);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSSet)allowedDeviceNames
{
  return self->_allowedDeviceNames;
}

- (void)setAllowedDeviceNames:(id)a3
{
  objc_storeStrong((id *)&self->_allowedDeviceNames, a3);
}

- (NSArray)allowedTVs
{
  return self->_allowedTVs;
}

- (void)setAllowedTVs:(id)a3
{
  objc_storeStrong((id *)&self->_allowedTVs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTVs, 0);
  objc_storeStrong((id *)&self->_allowedDeviceNames, 0);
}

- (void)allowedDeviceWithName:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21A51B000, log, OS_LOG_TYPE_DEBUG, "No specified allowed devices so all will be shown", v1, 2u);
}

- (void)_convertMACAddressesToData:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "Error parsing MAC address to 6-byte array", buf, 2u);
}

@end
