@implementation CAFDStateCaptureManager

- (CAFDStateCaptureManager)init
{
  CAFDStateCaptureManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pluginStateCaptures;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CAFDStateCaptureManager;
  v2 = -[CAFDStateCaptureManager init](&v15, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    pluginStateCaptures = v2->_pluginStateCaptures;
    v2->_pluginStateCaptures = v3;

    objc_initWeak(&location, v2);
    v5 = objc_alloc((Class)CAFStateCapture);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __31__CAFDStateCaptureManager_init__block_invoke;
    v12[3] = &unk_100030B58;
    objc_copyWeak(&v13, &location);
    v6 = objc_msgSend(v5, "initWithIdentifier:capture:", CFSTR("Notification Registrations"), v12);
    -[CAFDStateCaptureManager setRegistrationsStateCapture:](v2, "setRegistrationsStateCapture:", v6);

    v7 = objc_alloc((Class)CAFStateCapture);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __31__CAFDStateCaptureManager_init__block_invoke_2;
    v10[3] = &unk_100030B58;
    objc_copyWeak(&v11, &location);
    v8 = objc_msgSend(v7, "initWithIdentifier:capture:", CFSTR("Car"), v10);
    -[CAFDStateCaptureManager setCarStateCapture:](v2, "setCarStateCapture:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

NSMutableDictionary *__31__CAFDStateCaptureManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSMutableDictionary *v2;
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_opt_new(NSMutableDictionary);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    v4 = objc_msgSend(v3, "pluginCount");

    if (v4)
    {
      v5 = 0;
      do
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "registrationsForPluginID:", v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, v9);

        ++v5;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
        v11 = objc_msgSend(v10, "pluginCount");

      }
      while (v5 < (unint64_t)v11);
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *__31__CAFDStateCaptureManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  _QWORD v15[4];
  _QWORD v16[4];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentCarConfiguration"));
    v4 = v3;
    if (v3)
    {
      v15[0] = CFSTR("name");
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
      v6 = (void *)v5;
      v7 = CFSTR("Unknown Name");
      if (v5)
        v7 = (const __CFString *)v5;
      v16[0] = v7;
      v15[1] = CFSTR("uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
      v16[1] = v9;
      v15[2] = CFSTR("pluginCount");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "pluginCount")));
      v16[2] = v11;
      v15[3] = CFSTR("configs");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "carConfigSummary"));
      v16[3] = v12;
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));

    }
    else
    {
      v13 = CFSTR("No Car");
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setCurrentCarConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_currentCarConfiguration, a3);
  -[CAFDStateCaptureManager carConfigDidUpdate](self, "carConfigDidUpdate");
}

- (void)carConfigDidUpdate
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  unint64_t v29;

  v3 = CAFStateCaptureLogging(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDStateCaptureManager pluginStateCaptures](self, "pluginStateCaptures"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 136315394;
    v27 = "-[CAFDStateCaptureManager carConfigDidUpdate]";
    v28 = 2112;
    v29 = (unint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s fired, capturing [%@]", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDStateCaptureManager delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "pluginCount");

  if (v9)
  {
    v11 = 0;
    *(_QWORD *)&v10 = 136315394;
    v25 = v10;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDStateCaptureManager pluginStateCaptures](self, "pluginStateCaptures", v25));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

      if (!v14)
      {
        v17 = CAFStateCaptureLogging(v15, v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v25;
          v27 = "-[CAFDStateCaptureManager carConfigDidUpdate]";
          v28 = 2048;
          v29 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s setting up captures for pluginID %lu", buf, 0x16u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDStateCaptureManager stateCaptureForPluginID:](self, "stateCaptureForPluginID:", v19));

        if (objc_msgSend(v20, "count"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDStateCaptureManager pluginStateCaptures](self, "pluginStateCaptures"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

        }
      }
      ++v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDStateCaptureManager delegate](self, "delegate"));
      v24 = objc_msgSend(v23, "pluginCount");

    }
    while (v11 < (unint64_t)v24);
  }
}

- (id)stateCaptureForPluginID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSMutableArray *v13;
  id v14;
  NSMutableArray *v15;
  _QWORD v17[4];
  NSMutableArray *v18;
  id v19;
  CAFDStateCaptureManager *v20;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_class(NSArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDStateCaptureManager currentCarConfiguration](self, "currentCarConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pluginConfigs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v4));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kCarDataConfigurationAccessoriesKey));
  v11 = v10;
  if (v10 && (objc_opt_isKindOfClass(v10, v6) & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke;
  v17[3] = &unk_100030BD0;
  v13 = v5;
  v18 = v13;
  v19 = v4;
  v20 = self;
  v14 = v4;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
  v15 = v13;

  return v15;
}

void __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  int8x16_t v24;
  _QWORD v25[4];
  int8x16_t v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v6 = v5;
  if (v5 && (objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = objc_opt_class(NSNumber);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCarDataConfigurationIIDKey));
  v10 = v9;
  if (v9 && (objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v7));
  v13 = *(void **)(a1 + 32);
  v14 = objc_alloc((Class)CAFStateCapture);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PluginConfig %@.%@"), *(_QWORD *)(a1 + 40), v11));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke_2;
  v28[3] = &unk_100030B80;
  v16 = v7;
  v29 = v16;
  v17 = objc_msgSend(v14, "initWithIdentifier:capture:", v15, v28);
  objc_msgSend(v13, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CAFAccessoryTypes stateCaptureValues](CAFAccessoryTypes, "stateCaptureValues"));
  LODWORD(v17) = objc_msgSend(v18, "containsObject:", v12);

  if ((_DWORD)v17)
  {
    v19 = *(void **)(a1 + 32);
    v20 = objc_alloc((Class)CAFStateCapture);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PluginValues %@.%@"), *(_QWORD *)(a1 + 40), v11));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke_3;
    v25[3] = &unk_100030BA8;
    v24 = *(int8x16_t *)(a1 + 40);
    v22 = (id)v24.i64[0];
    v26 = vextq_s8(v24, v24, 8uLL);
    v27 = v16;
    v23 = objc_msgSend(v20, "initWithIdentifier:capture:", v21, v25);
    objc_msgSend(v19, "addObject:", v23);

  }
}

id __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v3 = objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "valueCaptureIIDsFromAccessoryConfig:", *(_QWORD *)(a1 + 48)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valuesForPluginID:iids:", v3, v4));

  return v5;
}

- (id)carConfigSummary
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  _QWORD v8[4];
  NSMutableDictionary *v9;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDStateCaptureManager currentCarConfiguration](self, "currentCarConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pluginConfigs"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __43__CAFDStateCaptureManager_carConfigSummary__block_invoke;
  v8[3] = &unk_100030C20;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __43__CAFDStateCaptureManager_carConfigSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  id v13;
  _QWORD v14[4];
  NSMutableDictionary *v15;

  v5 = a3;
  v6 = a2;
  v7 = objc_opt_new(NSMutableDictionary);
  v8 = objc_opt_class(NSArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kCarDataConfigurationAccessoriesKey));

  v10 = v9;
  v11 = v10;
  if (v10 && (objc_opt_isKindOfClass(v10, v8) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_2;
  v14[3] = &unk_100030BF8;
  v15 = v7;
  v12 = v7;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v6);

}

void __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSMutableDictionary *v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v6 = v5;
  if (v5 && (objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = objc_opt_class(NSNumber);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCarDataConfigurationIIDKey));
  v10 = v9;
  if (v9 && (objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v12 = objc_opt_new(NSMutableDictionary);
  v13 = objc_opt_class(NSArray);
  v14 = kCarDataConfigurationServicesKey;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCarDataConfigurationServicesKey));
  v16 = v15;
  if (v15 && (objc_opt_isKindOfClass(v15, v13) & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_3;
  v24 = &unk_100030BF8;
  v25 = v12;
  v18 = v12;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v21);
  v26[0] = kCarDataConfigurationTypeKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v7, v21, v22, v23, v24));
  v26[1] = v14;
  v27[0] = v19;
  v27[1] = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, v11);

}

void __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSMutableDictionary *v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v6 = v5;
  if (v5 && (objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = objc_opt_class(NSNumber);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCarDataConfigurationIIDKey));
  v10 = v9;
  if (v9 && (objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v12 = objc_opt_new(NSMutableDictionary);
  v13 = objc_opt_class(NSArray);
  v14 = kCarDataConfigurationCharacteristicsKey;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCarDataConfigurationCharacteristicsKey));
  v16 = v15;
  if (v15 && (objc_opt_isKindOfClass(v15, v13) & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_4;
  v24 = &unk_100030BF8;
  v25 = v12;
  v18 = v12;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v21);
  v26[0] = kCarDataConfigurationTypeKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v7, v21, v22, v23, v24));
  v26[1] = v14;
  v27[0] = v19;
  v27[1] = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, v11);

}

void __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v12 = v5;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v6 = v12;
    else
      v6 = 0;
    v5 = v12;
  }
  else
  {
    v6 = 0;
  }

  v7 = objc_opt_class(NSNumber);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCarDataConfigurationIIDKey));
  v9 = v8;
  if (v8 && (objc_opt_isKindOfClass(v8, v7) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v6));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v10);

}

- (id)valueCaptureIIDsFromAccessoryConfig:(id)a3
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSMutableArray *v10;
  _QWORD v12[4];
  NSMutableArray *v13;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_class(NSArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCarDataConfigurationServicesKey));

  v7 = v6;
  v8 = v7;
  if (v7 && (objc_opt_isKindOfClass(v7, v5) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __63__CAFDStateCaptureManager_valueCaptureIIDsFromAccessoryConfig___block_invoke;
  v12[3] = &unk_100030BF8;
  v10 = v4;
  v13 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  return v10;
}

void __63__CAFDStateCaptureManager_valueCaptureIIDsFromAccessoryConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v14 = v5;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v6 = v14;
    else
      v6 = 0;
    v5 = v14;
  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAFServiceTypes stateCaptureValues](CAFServiceTypes, "stateCaptureValues"));
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    v10 = objc_opt_class(NSArray);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCarDataConfigurationCharacteristicsKey));
    v12 = v11;
    if (v11 && (objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __63__CAFDStateCaptureManager_valueCaptureIIDsFromAccessoryConfig___block_invoke_2;
    v15[3] = &unk_100030BF8;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

  }
}

void __63__CAFDStateCaptureManager_valueCaptureIIDsFromAccessoryConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_opt_class(NSDictionary);
  v5 = v3;
  v14 = v5;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v6 = v14;
    else
      v6 = 0;
    v5 = v14;
  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAFCharacteristicTypes stateCaptureValues](CAFCharacteristicTypes, "stateCaptureValues"));
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    v10 = objc_opt_class(NSNumber);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCarDataConfigurationIIDKey));
    v12 = v11;
    if (v11 && (objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
  }

}

- (CAFDStateCaptureManagerDelegate)delegate
{
  return (CAFDStateCaptureManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAFCarConfiguration)currentCarConfiguration
{
  return (CAFCarConfiguration *)objc_loadWeakRetained((id *)&self->_currentCarConfiguration);
}

- (CAFStateCapture)registrationsStateCapture
{
  return self->_registrationsStateCapture;
}

- (void)setRegistrationsStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_registrationsStateCapture, a3);
}

- (CAFStateCapture)carStateCapture
{
  return self->_carStateCapture;
}

- (void)setCarStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_carStateCapture, a3);
}

- (NSArray)cachedValuesStateCaptures
{
  return self->_cachedValuesStateCaptures;
}

- (void)setCachedValuesStateCaptures:(id)a3
{
  objc_storeStrong((id *)&self->_cachedValuesStateCaptures, a3);
}

- (NSMutableDictionary)pluginStateCaptures
{
  return self->_pluginStateCaptures;
}

- (void)setPluginStateCaptures:(id)a3
{
  objc_storeStrong((id *)&self->_pluginStateCaptures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginStateCaptures, 0);
  objc_storeStrong((id *)&self->_cachedValuesStateCaptures, 0);
  objc_storeStrong((id *)&self->_carStateCapture, 0);
  objc_storeStrong((id *)&self->_registrationsStateCapture, 0);
  objc_destroyWeak((id *)&self->_currentCarConfiguration);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
