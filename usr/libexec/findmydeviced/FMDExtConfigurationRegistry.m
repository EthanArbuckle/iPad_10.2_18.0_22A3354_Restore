@implementation FMDExtConfigurationRegistry

+ (FMDExtConfigurationRegistry)sharedInstance
{
  if (qword_100306470 != -1)
    dispatch_once(&qword_100306470, &stru_1002C1CB0);
  return (FMDExtConfigurationRegistry *)(id)qword_100306468;
}

- (FMDExtConfigurationRegistry)init
{
  FMDExtConfigurationRegistry *v2;
  dispatch_queue_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[4];
  FMDExtConfigurationRegistry *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;

  v20.receiver = self;
  v20.super_class = (Class)FMDExtConfigurationRegistry;
  v2 = -[FMDExtConfigurationRegistry init](&v20, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("FMDExtConfigurationRegistry.serialQueue", 0);
    -[FMDExtConfigurationRegistry setSerialQueue:](v2, "setSerialQueue:", v3);

    v4 = objc_alloc_init((Class)NSSet);
    -[FMDExtConfigurationRegistry setSupportedAccessories:](v2, "setSupportedAccessories:", v4);

    v5 = objc_alloc_init((Class)NSMutableDictionary);
    -[FMDExtConfigurationRegistry setConfigurations:](v2, "setConfigurations:", v5);

    v6 = objc_alloc_init((Class)NSDictionary);
    -[FMDExtConfigurationRegistry setDefaultConfigurations:](v2, "setDefaultConfigurations:", v6);

    v7 = objc_alloc_init((Class)FMInternalFileContainer);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fm_preferencesPathURLForDomain:", CFSTR("com.apple.icloud.findmydeviced.extensions.configurations")));

    v10 = sub_1000530AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Initialize configuration from location %@", buf, 0xCu);
    }

    v12 = objc_msgSend(objc_alloc((Class)FMDataArchiver), "initWithFileURL:", v9);
    -[FMDExtConfigurationRegistry setDataArchiver:](v2, "setDataArchiver:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v13, "setDataProtectionClass:", 4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v14, "setBackedUp:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v15, "setCreateDirectories:", 1);

    -[FMDExtConfigurationRegistry setVersion:](v2, "setVersion:", CFSTR("0"));
    v16 = objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry serialQueue](v2, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019EA4;
    block[3] = &unk_1002C1328;
    v19 = v2;
    dispatch_async(v16, block);

  }
  return v2;
}

- (void)_updateDisk
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  v22[0] = CFSTR("version");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry version](self, "version"));
  v23[0] = v4;
  v22[1] = CFSTR("supportedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry supportedAccessories](self, "supportedAccessories"));
  v23[1] = v5;
  v22[2] = CFSTR("configurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry configurations](self, "configurations"));
  v23[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));

  v8 = sub_1000530AC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "saving configurations to disk %@", (uint8_t *)&v20, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry dataArchiver](self, "dataArchiver"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "saveDictionary:", v7));

  if (v11)
  {
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1002261CC((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)_initializeFromDisk
{
  NSObject *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  dispatch_queue_global_t v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD *v25;
  id v26;
  NSObject *v27;
  dispatch_queue_global_t global_queue;
  _QWORD v29[5];
  _QWORD block[5];
  id v31;
  id location;
  uint8_t buf[4];
  void *v34;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_initWeak(&location, self);
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "reading configurations from disk", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry dataArchiver](self, "dataArchiver"));
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(FMDExtAccessoryConfiguration, v8), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v31 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readDictionaryAndClasses:error:", v10, &v31));
  v12 = v31;

  if ((+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("doNotUseDefaultConfigs"), kFMDNotBackedUpPrefDomain) & 1) != 0)
  {
    v13 = sub_1000530AC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "not using default configs", buf, 2u);
    }

  }
  else
  {
    v15 = sub_1000530AC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "using default configs", buf, 2u);
    }

    -[FMDExtConfigurationRegistry readDefaultConfigurations](self, "readDefaultConfigurations");
  }
  if (!v11 || v12)
  {
    v26 = sub_1000530AC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100226230((uint64_t)v12, (uint64_t)v11, v27);

    global_queue = dispatch_get_global_queue(0, 0);
    v23 = objc_claimAutoreleasedReturnValue(global_queue);
    v24 = v23;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A424;
    block[3] = &unk_1002C1328;
    block[4] = self;
    v25 = block;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("version")));
    -[FMDExtConfigurationRegistry setVersion:](self, "setVersion:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("supportedAccessories")));
    -[FMDExtConfigurationRegistry setSupportedAccessories:](self, "setSupportedAccessories:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("configurations")));
    -[FMDExtConfigurationRegistry setConfigurations:](self, "setConfigurations:", v19);

    v20 = sub_1000530AC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "read from disk successful with result %@", buf, 0xCu);
    }

    v22 = dispatch_get_global_queue(0, 0);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = v23;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001A42C;
    v29[3] = &unk_1002C1328;
    v29[4] = self;
    v25 = v29;
  }
  dispatch_async(v23, v25);

  objc_destroyWeak(&location);
}

- (void)readDefaultConfigurations
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  FMDExtAccessoryConfiguration *v18;
  FMDExtAccessoryConfiguration *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathForResource:ofType:", CFSTR("findkit-default-configs"), CFSTR("json")));

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "read from path %@", buf, 0xCu);
  }

  v6 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v3));
  v23 = (void *)v6;
  v24 = (void *)v3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, 0));
    v8 = sub_1000530AC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "read from disk successful with result %@", buf, 0xCu);
    }
  }
  else
  {
    v10 = sub_1000530AC();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "file not found at path %@", buf, 0xCu);
    }
    v7 = 0;
  }

  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("configurations")));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v18 = -[FMDExtAccessoryConfiguration initWithConfigurationInfo:]([FMDExtAccessoryConfiguration alloc], "initWithConfigurationInfo:", v17);
        v19 = v18;
        if (v18)
        {
          v20 = objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration accessoryType](v18, "accessoryType"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v20);
        }
        else
        {
          v21 = sub_1000530AC();
          v20 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = (uint64_t)v17;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Invalid configuration received %@", buf, 0xCu);
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  -[FMDExtConfigurationRegistry setDefaultConfigurations:](self, "setDefaultConfigurations:", v11);
}

- (void)fetchSupportedAccessoryTypes
{
  id v3;
  NSObject *v4;
  void *v5;
  FMDSupportedAccessoryTypesAction *v6;
  void *v7;
  void *v8;
  FMDSupportedAccessoryTypesAction *v9;
  void *v10;
  id v11;
  uint8_t v12[16];

  v3 = sub_1000530AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fetching supported accessory type from server", v12, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v6 = [FMDSupportedAccessoryTypesAction alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverInteractionController"));
  v9 = -[FMDSupportedAccessoryTypesAction initWithAccount:registry:serverInteractionController:](v6, "initWithAccount:registry:serverInteractionController:", v7, self, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
  v11 = objc_msgSend(v10, "enqueueAction:", v9);

}

- (void)fetchConfigForAccessoryTypes:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  FMDAccessoryInfoAction *v8;
  void *v9;
  void *v10;
  FMDAccessoryInfoAction *v11;
  void *v12;
  id v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetching config from server for %@", (uint8_t *)&v14, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
  v8 = [FMDAccessoryInfoAction alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverInteractionController"));
  v11 = -[FMDAccessoryInfoAction initWithAccount:registry:accessoryTypes:serverInteractionController:](v8, "initWithAccount:registry:accessoryTypes:serverInteractionController:", v9, self, v4, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
  v13 = objc_msgSend(v12, "enqueueAction:", v11);

}

- (void)updateSupportedAccessoryTypes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FMDExtConfigurationRegistry *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001AAC0;
  v7[3] = &unk_1002C13E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateConfigurations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  FMDExtConfigurationRegistry *v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configurations")));
  v6 = sub_1000530AC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received configuration %@", buf, 0xCu);
  }

  v8 = objc_alloc_init((Class)NSMutableArray);
  if (v5)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AF78;
    block[3] = &unk_1002C1BA0;
    v11 = v5;
    v12 = self;
    v13 = v8;
    dispatch_async(v9, block);

  }
}

- (BOOL)supportsAccessoryType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B480;
  block[3] = &unk_1002C18B8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)configForAccessoryType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10001B618;
  v16 = sub_10001B628;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B630;
  block[3] = &unk_1002C1410;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)prepareForAccessoryType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (-[FMDExtConfigurationRegistry supportsAccessoryType:](self, "supportsAccessoryType:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtConfigurationRegistry configForAccessoryType:](self, "configForAccessoryType:", v4));

    if (!v5)
    {
      v7 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
      -[FMDExtConfigurationRegistry fetchConfigForAccessoryTypes:](self, "fetchConfigForAccessoryTypes:", v6);

    }
  }

}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (FMDExtConfigurationUpdatedListner)listner
{
  return (FMDExtConfigurationUpdatedListner *)objc_loadWeakRetained((id *)&self->_listner);
}

- (void)setListner:(id)a3
{
  objc_storeWeak((id *)&self->_listner, a3);
}

- (NSSet)supportedAccessories
{
  return self->_supportedAccessories;
}

- (void)setSupportedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_supportedAccessories, a3);
}

- (NSMutableDictionary)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_configurations, a3);
}

- (NSDictionary)defaultConfigurations
{
  return self->_defaultConfigurations;
}

- (void)setDefaultConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConfigurations, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_defaultConfigurations, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_supportedAccessories, 0);
  objc_destroyWeak((id *)&self->_listner);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
