@implementation MCWatchSettingsMirror

+ (id)sharedMirror
{
  if (qword_1000FD958 != -1)
    dispatch_once(&qword_1000FD958, &stru_1000E3F98);
  return (id)qword_1000FD950;
}

- (MCWatchSettingsMirror)init
{
  MCWatchSettingsMirror *v2;
  void *v3;
  uint64_t v4;
  NSDictionary *syncableSettings;
  objc_super v7;
  _QWORD v8[2];
  _QWORD v9[4];
  _QWORD v10[4];

  v7.receiver = self;
  v7.super_class = (Class)MCWatchSettingsMirror;
  v2 = -[MCWatchSettingsMirror init](&v7, "init");
  v9[0] = MCRestrictedBoolKey;
  v8[0] = MCFeatureAppInstallationAllowed;
  v8[1] = MCFeatureAutomaticAppDownloadsAllowed;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v10[0] = v3;
  v10[1] = &__NSArray0__struct;
  v9[1] = MCRestrictedValueKey;
  v9[2] = MCIntersectionKey;
  v9[3] = MCUnionKey;
  v10[2] = &__NSArray0__struct;
  v10[3] = &__NSArray0__struct;
  v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));
  syncableSettings = v2->_syncableSettings;
  v2->_syncableSettings = (NSDictionary *)v4;

  return v2;
}

- (int)effectiveBoolValueForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  os_log_t v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCWatchSettingsMirror syncableSettings](self, "syncableSettings"));
  v12 = MCRestrictedBoolKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCRestrictedBoolKey));

  if (objc_msgSend(v13, "containsObject:", v8))
  {
    v14 = objc_msgSend(objc_alloc((Class)NPSDomainAccessor), "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.ManagedConfiguration.WatchEffectiveSettingsMirror"), v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "synchronize"));
    if (v15)
    {
      v16 = _MCLogObjects[2];
      v17 = 0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v16;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
        v25 = 138543362;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to synchronize accessor. Error: %{public}@", (uint8_t *)&v25, 0xCu);

        v17 = 0;
      }
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));
      v21 = v20;
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v8));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", MCRestrictedBoolValueKey));

        if (v23)
        {
          if (objc_msgSend(v23, "BOOLValue"))
            v17 = 1;
          else
            v17 = 2;
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)effectiveValueForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCWatchSettingsMirror syncableSettings](self, "syncableSettings"));
  v12 = MCRestrictedValueKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCRestrictedValueKey));

  if (objc_msgSend(v13, "containsObject:", v8))
  {
    v14 = objc_msgSend(objc_alloc((Class)NPSDomainAccessor), "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.ManagedConfiguration.WatchEffectiveSettingsMirror"), v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "synchronize"));
    if (v15)
    {
      v16 = _MCLogObjects[2];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
        v25 = 138543362;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to synchronize accessor. Error: %{public}@", (uint8_t *)&v25, 0xCu);

      }
      v19 = 0;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));
      v21 = v20;
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v8));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", MCRestrictedValueValueKey));

      }
      else
      {
        v23 = 0;
      }
      v19 = v23;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)effectiveIntersectionValuesForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCWatchSettingsMirror syncableSettings](self, "syncableSettings"));
  v12 = MCIntersectionKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCIntersectionKey));

  if (objc_msgSend(v13, "containsObject:", v8))
  {
    v14 = objc_msgSend(objc_alloc((Class)NPSDomainAccessor), "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.ManagedConfiguration.WatchEffectiveSettingsMirror"), v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "synchronize"));
    if (v15)
    {
      v16 = _MCLogObjects[2];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
        v25 = 138543362;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to synchronize accessor. Error: %{public}@", (uint8_t *)&v25, 0xCu);

      }
      v19 = 0;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));
      v21 = v20;
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v8));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", MCIntersectionValuesKey));

      }
      else
      {
        v23 = 0;
      }
      v19 = v23;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)effectiveUnionValuesForSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCWatchSettingsMirror syncableSettings](self, "syncableSettings"));
  v12 = MCUnionKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MCUnionKey));

  if (objc_msgSend(v13, "containsObject:", v8))
  {
    v14 = objc_msgSend(objc_alloc((Class)NPSDomainAccessor), "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.ManagedConfiguration.WatchEffectiveSettingsMirror"), v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "synchronize"));
    if (v15)
    {
      v16 = _MCLogObjects[2];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
        v25 = 138543362;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to synchronize accessor. Error: %{public}@", (uint8_t *)&v25, 0xCu);

      }
      v19 = 0;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));
      v21 = v20;
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v8));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", MCUnionValuesKey));

      }
      else
      {
        v23 = 0;
      }
      v19 = v23;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSDictionary)syncableSettings
{
  return self->_syncableSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncableSettings, 0);
}

@end
