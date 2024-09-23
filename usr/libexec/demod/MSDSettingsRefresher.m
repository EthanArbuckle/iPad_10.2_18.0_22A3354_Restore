@implementation MSDSettingsRefresher

+ (id)sharedInstance
{
  if (qword_100175510 != -1)
    dispatch_once(&qword_100175510, &stru_10013F5C0);
  return (id)qword_100175518;
}

- (MSDSettingsRefresher)init
{
  MSDSettingsRefresher *v2;
  MSDSettingsRefresher *v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDSettingsRefresher;
  v2 = -[MSDSettingsRefresher init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_initialized = 0;
    v4 = objc_alloc_init((Class)BrightnessSystemClient);
    -[MSDSettingsRefresher setBrightnessClient:](v3, "setBrightnessClient:", v4);

    v5 = objc_alloc_init((Class)SFAirDropDiscoveryController);
    -[MSDSettingsRefresher setSfAirDropController:](v3, "setSfAirDropController:", v5);

    -[MSDSettingsRefresher setSettingsFilePath:](v3, "setSettingsFilePath:", CFSTR("/var/mobile/Library/Application Support/ScreenSaverManager/DeviceSettings.plist"));
  }
  return v3;
}

- (void)initializeWithOverwrite:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (self->_initialized)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[MSDSettingsRefresher initializeWithOverwrite:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - MSDSettingsRefresher object already initialized", (uint8_t *)&v17, 0xCu);
    }

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher settingsFilePath](self, "settingsFilePath"));
    v9 = objc_msgSend(v5, "fileExistsAtPath:", v8);

    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
      v13 = !v3;
    else
      v13 = 0;
    if (v13)
    {
      if (v12)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher settingsFilePath](self, "settingsFilePath"));
        v17 = 136315394;
        v18 = "-[MSDSettingsRefresher initializeWithOverwrite:]";
        v19 = 2114;
        v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - Settings file already exists at %{public}@", (uint8_t *)&v17, 0x16u);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher getSavedValues](self, "getSavedValues"));
      -[MSDSettingsRefresher initializeCacheWithValues:](self, "initializeCacheWithValues:", v16);

      self->_initialized = 1;
    }
    else
    {
      if (v12)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher settingsFilePath](self, "settingsFilePath"));
        v17 = 136315394;
        v18 = "-[MSDSettingsRefresher initializeWithOverwrite:]";
        v19 = 2114;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - Settings file doesn't exist at %{public}@: creating a new file...", (uint8_t *)&v17, 0x16u);

      }
      self->_initialized = -[MSDSettingsRefresher initializeSettingsFileWithDeviceValues](self, "initializeSettingsFileWithDeviceValues");
    }
  }

}

- (BOOL)initializeSettingsFileWithDeviceValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher trueTone](self, "trueTone"));
  if (v5)
  {
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("TrueTone"));
  }
  else
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000C81F0();

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher airDropMode](self, "airDropMode"));

  if (v8)
  {
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("AirDrop"));
  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C81C4();

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher volume](self, "volume"));

  if (v11)
  {
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("Volume"));
  }
  else
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C8198();

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher airplaneMode](self, "airplaneMode"));

  if (v14)
  {
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("AirplaneMode"));
  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C816C();

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher settingsFilePath](self, "settingsFilePath"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByDeletingLastPathComponent"));

  if ((objc_msgSend(v4, "fileExistsAtPath:", v18) & 1) != 0)
  {
    v19 = 0;
  }
  else
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[MSDSettingsRefresher initializeSettingsFileWithDeviceValues]";
      v41 = 2114;
      v42 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s - creating directory at %{public}@", buf, 0x16u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v18));
    v38 = 0;
    v23 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v22, 1, 0, &v38);
    v19 = v38;

    if ((v23 & 1) == 0)
    {
      v35 = sub_1000604F0();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_1000C80D0((uint64_t)v18, v19);

      goto LABEL_30;
    }
  }
  v24 = v19;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher settingsFilePath](self, "settingsFilePath"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v25));
  v37 = v19;
  objc_msgSend(v3, "writeToURL:error:", v26, &v37);
  v19 = v37;

  v27 = sub_1000604F0();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  if (v19)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000C8024(self, v19);

LABEL_30:
    v30 = 0;
    goto LABEL_36;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher settingsFilePath](self, "settingsFilePath"));
    *(_DWORD *)buf = 136315394;
    v40 = "-[MSDSettingsRefresher initializeSettingsFileWithDeviceValues]";
    v41 = 2114;
    v42 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s - Initialized the default system settings file '%{public}@' and cache with values", buf, 0x16u);

  }
  v32 = sub_1000604F0();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[MSDSettingsRefresher initializeSettingsFileWithDeviceValues]";
    v41 = 2114;
    v42 = v3;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s - System Settings Values: %{public}@", buf, 0x16u);
  }

  -[MSDSettingsRefresher initializeCacheWithValues:](self, "initializeCacheWithValues:", v3);
  v19 = 0;
  v30 = 1;
LABEL_36:

  return v30;
}

- (void)initializeCacheWithValues:(id)a3
{
  id v4;
  NSString *v5;
  NSString *trueTone;
  NSString *v7;
  NSString *airDrop;
  NSNumber *v9;
  NSNumber *volume;
  NSString *v11;
  NSString *airplaneMode;
  id v13;
  NSObject *v14;

  v4 = a3;
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("TrueTone")));
  trueTone = self->_trueTone;
  self->_trueTone = v5;

  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("AirDrop")));
  airDrop = self->_airDrop;
  self->_airDrop = v7;

  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Volume")));
  volume = self->_volume;
  self->_volume = v9;

  v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("AirplaneMode")));
  airplaneMode = self->_airplaneMode;
  self->_airplaneMode = v11;

  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_1000C821C(v14);

}

- (void)restoreSavedDeviceSettings
{
  _BOOL4 initialized;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  int v15;
  const char *v16;

  initialized = self->_initialized;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (initialized)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[MSDSettingsRefresher restoreSavedDeviceSettings]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - Reverting system settings to defaults", (uint8_t *)&v15, 0xCu);
    }

    if (self->_trueTone)
    {
      -[MSDSettingsRefresher setTrueTone:](self, "setTrueTone:");
    }
    else
    {
      v7 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000C8398();

    }
    if (self->_airDrop)
    {
      -[MSDSettingsRefresher setAirDropMode:](self, "setAirDropMode:");
    }
    else
    {
      v9 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000C836C();

    }
    if (self->_volume)
    {
      -[MSDSettingsRefresher setVolume:](self, "setVolume:");
    }
    else
    {
      v11 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000C8340();

    }
    if (self->_airplaneMode)
    {
      -[MSDSettingsRefresher setAirplaneMode:](self, "setAirplaneMode:");
    }
    else
    {
      v13 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1000C8314();

    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000C8298(v6);

    -[MSDSettingsRefresher initializeWithOverwrite:](self, "initializeWithOverwrite:", 0);
  }
}

- (NSNumber)volume
{
  void *v2;
  int v3;
  int v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAudioController sharedInstance](MSDAudioController, "sharedInstance"));
  objc_msgSend(v2, "getVolumeForCategory:", 3);
  v4 = v3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000C83C4(v6, v7, v8, v9, v10, v11, v12, v13);

  LODWORD(v14) = v4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));

  return (NSNumber *)v15;
}

- (void)setVolume:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  NSObject *v9;
  float v10;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher volume](self, "volume"));
  v6 = objc_msgSend(v4, "isEqualToNumber:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAudioController sharedInstance](MSDAudioController, "sharedInstance"));
    objc_msgSend(v4, "floatValue");
    objc_msgSend(v7, "setVolumeTo:forCategory:", 3);
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "floatValue");
      v11 = 136315394;
      v12 = "-[MSDSettingsRefresher setVolume:]";
      v13 = 2050;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - Set system volume to %{public}1.2f", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (NSString)trueTone
{
  void *v2;
  id v3;
  unsigned int v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  NSObject *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher brightnessClient](self, "brightnessClient"));
  v3 = objc_msgSend(v2, "copyPropertyForKey:", CFSTR("ColorAdaptationEnabled"));

  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  v6 = v5;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000C8444();

  return (NSString *)v6;
}

- (void)setTrueTone:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher trueTone](self, "trueTone"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = objc_msgSend(v4, "isEqual:", CFSTR("YES"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher brightnessClient](self, "brightnessClient"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    objc_msgSend(v8, "setProperty:forKey:", v9, CFSTR("ColorAdaptationEnabled"));

    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[MSDSettingsRefresher setTrueTone:]";
      v14 = 2114;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - Set system true tone setting to %{public}@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (NSString)airplaneMode
{
  const __CFString *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E43C;
  block[3] = &unk_10013F5E8;
  block[4] = &v14;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  if (*((_BYTE *)v15 + 24))
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v2));
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000C84B0((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);
  return (NSString *)v3;
}

- (void)setAirplaneMode:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  _QWORD block[4];
  id v8;
  unsigned __int8 v9;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher airplaneMode](self, "airplaneMode"));
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008E540;
    block[3] = &unk_10013EB28;
    v9 = objc_msgSend(v6, "isEqual:", CFSTR("YES"));
    v8 = v6;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (id)airDropMode
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher sfAirDropController](self, "sfAirDropController"));
  v3 = (unint64_t)objc_msgSend(v2, "discoverableMode");

  if (v3 >= 3)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000C8594();

    v4 = CFSTR("Off");
  }
  else
  {
    v4 = off_10013F608[v3];
  }
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000C8528();

  return (id)v4;
}

- (void)setAirDropMode:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher airDropMode](self, "airDropMode"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Off")) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Contacts Only")) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Everyone")))
    {
      v7 = 2;
    }
    else
    {
      v7 = 0;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher sfAirDropController](self, "sfAirDropController"));
    objc_msgSend(v8, "setDiscoverableMode:", v7);

    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[MSDSettingsRefresher setAirDropMode:]";
      v13 = 2114;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - Set system AirDrop mode setting to %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (id)getSavedValues
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher settingsFilePath](self, "settingsFilePath"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSettingsRefresher settingsFilePath](self, "settingsFilePath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v7));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)airDrop
{
  return self->_airDrop;
}

- (void)setAirDrop:(id)a3
{
  objc_storeStrong((id *)&self->_airDrop, a3);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (NSString)settingsFilePath
{
  return self->_settingsFilePath;
}

- (void)setSettingsFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_settingsFilePath, a3);
}

- (BrightnessSystemClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setBrightnessClient:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessClient, a3);
}

- (SFAirDropDiscoveryController)sfAirDropController
{
  return self->_sfAirDropController;
}

- (void)setSfAirDropController:(id)a3
{
  objc_storeStrong((id *)&self->_sfAirDropController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfAirDropController, 0);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
  objc_storeStrong((id *)&self->_settingsFilePath, 0);
  objc_storeStrong((id *)&self->_airplaneMode, 0);
  objc_storeStrong((id *)&self->_airDrop, 0);
  objc_storeStrong((id *)&self->_trueTone, 0);
  objc_storeStrong((id *)&self->_volume, 0);
}

@end
