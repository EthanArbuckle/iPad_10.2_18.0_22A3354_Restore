@implementation MSDSettingsInstallOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  if (+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_applySettingToDevice"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, 0));

  }
  return v2;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)_applySettingToDevice
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v16 = 136315394;
    v17 = "-[MSDSettingsInstallOperation _applySettingToDevice]";
    v18 = 2114;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - identifier %{public}@", (uint8_t *)&v16, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("locale"));

  if (v9)
    return -[MSDSettingsInstallOperation _updateLocale](self, "_updateLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("display"));

  if (v13)
    return -[MSDSettingsInstallOperation _saveDisplaySettings](self, "_saveDisplaySettings");
  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1000CB25C(self, v15);

  return 0;
}

- (BOOL)_updateLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataDict"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("language")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("region")));

  if (v5 && v8)
  {
    v29[0] = CFSTR("language");
    v29[1] = CFSTR("region");
    v30[0] = v5;
    v30[1] = v8;
    v9 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315650;
      v24 = "-[MSDSettingsInstallOperation _updateLocale]";
      v25 = 2114;
      v26 = v5;
      v27 = 2114;
      v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s language: %{public}@ region: %{public}@", (uint8_t *)&v23, 0x20u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    v13 = objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("locale"));

  }
  else
  {
    v14 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000CB38C(v9, v15, v16, v17, v18, v19, v20, v21);
    v13 = 0;
  }

  return v13;
}

- (BOOL)_saveDisplaySettings
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  unsigned int v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataDict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("HDR")));

  if (v4 && (v6 = objc_opt_class(NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315394;
      v22 = "-[MSDSettingsInstallOperation _saveDisplaySettings]";
      v23 = 1024;
      v24 = objc_msgSend(v4, "BOOLValue");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - HDR setting:  %{BOOL}d", (uint8_t *)&v21, 0x12u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v9, "setObject:forKey:", v4, CFSTR("HDR"));

    v10 = 1;
  }
  else
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000CB3FC(v13, v14, v15, v16, v17, v18, v19, v20);

    v10 = 0;
  }

  return v10;
}

@end
