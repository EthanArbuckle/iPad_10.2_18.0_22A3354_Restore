@implementation SDKeyValueStore

+ (NSDictionary)devicesDictionary
{
  id v3;
  void *v4;
  void *v5;

  if (_os_feature_enabled_impl())
  {
    v3 = a1;
    objc_sync_enter(v3);
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronize");
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("BetaDevices"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v3);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v5;
}

+ (id)deviceDictionaryForDeviceIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = a1;
    objc_sync_enter(v5);
    objc_msgSend(v5, "devicesDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

+ (void)insertOrUpdateDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (_os_feature_enabled_impl())
  {
    v4 = a1;
    objc_sync_enter(v4);
    v5 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v4, "devicesDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDictionary:forKey:", v7, CFSTR("BetaDevices"));

    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "synchronize");

    objc_sync_exit(v4);
  }

}

+ (void)synchronize
{
  void *v3;
  id obj;

  if (_os_feature_enabled_impl())
  {
    obj = a1;
    objc_sync_enter(obj);
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronize");

    objc_sync_exit(obj);
  }
}

@end
