@implementation MSDLanguageAndRegionManager

+ (id)sharedInstance
{
  if (qword_100175468 != -1)
    dispatch_once(&qword_100175468, &stru_10013F1B0);
  return (id)qword_100175460;
}

- (MSDLanguageAndRegionManager)init
{
  MSDLanguageAndRegionManager *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDLanguageAndRegionManager;
  v2 = -[MSDLanguageAndRegionManager init](&v5, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.msd_language_and_region", 0);
    -[MSDLanguageAndRegionManager setQueue:](v2, "setQueue:", v3);

  }
  return v2;
}

- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4 sbRestartNeeded:(BOOL *)a5 sbRestartHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  int *v17;
  NSObject *v18;
  BOOL v19;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  _QWORD handler[5];
  id v40;
  uint64_t *v41;
  _QWORD block[5];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  int v48;

  v10 = a3;
  v11 = a4;
  v38 = a6;
  v45 = 0;
  v46 = (int *)&v45;
  v47 = 0x2020000000;
  v48 = -1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance"));
  v13 = objc_msgSend(v12, "setDeviceLanguage:andRegion:", v10, v11);

  if (v13 != 2)
  {
    v14 = dispatch_time(0, 60000000000);
    v15 = objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075EAC;
    block[3] = &unk_10013F1D8;
    v44 = &v45;
    block[4] = self;
    v16 = v38;
    v43 = v16;
    dispatch_after(v14, v15, block);

    v17 = v46;
    v18 = objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager queue](self, "queue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100075F50;
    handler[3] = &unk_10013F200;
    handler[4] = self;
    v41 = &v45;
    v40 = v16;
    notify_register_dispatch("com.apple.springboard.finishedstartup", v17 + 6, v18, handler);

  }
  if (!-[MSDLanguageAndRegionManager saveDeviceLanguageIdentifier:](self, "saveDeviceLanguageIdentifier:", v10))
  {
    v21 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000C3C50(v22, v23, v24, v25, v26, v27, v28, v29);
LABEL_12:

    -[MSDLanguageAndRegionManager cancelNotifyToken:](self, "cancelNotifyToken:", v46[6]);
    v19 = 0;
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (!-[MSDLanguageAndRegionManager saveDeviceRegionCode:](self, "saveDeviceRegionCode:", v11))
  {
    v30 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000C3C20(v22, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_12;
  }
  v19 = 1;
  if (a5)
LABEL_6:
    *a5 = v13 != 2;
LABEL_7:
  _Block_object_dispose(&v45, 8);

  return v19;
}

- (void)restoreDeviceLanguageAndRegionIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager deviceLanguageIdentifier](self, "deviceLanguageIdentifier"));
  v4 = objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager deviceRegionCode](self, "deviceRegionCode"));
  v5 = (void *)v4;
  if (v3)
  {
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance"));
      v7 = objc_msgSend(v6, "setDeviceLanguage:andRegion:", v3, v5);

      if (v7 == 1)
      {
        v8 = sub_1000604F0();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_1000C3C80(v9, v10, v11, v12, v13, v14, v15, v16);

      }
    }
  }

}

- (id)getCurrentDeviceLanguage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getCurrentDeviceLanguage"));

  return v3;
}

- (id)getCurrentDevicePreferredLanguage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getCurrentDevicePreferredLanguage"));

  return v3;
}

- (id)getCurrentDeviceRegion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getCurrentDeviceRegion"));

  return v3;
}

- (id)getCurrentDeviceLocaleCode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionHelper sharedInstance](MSDLanguageAndRegionHelper, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getCurrentLocaleCode"));

  return v3;
}

- (BOOL)saveCurrentDeviceLanguageIdentifier
{
  MSDLanguageAndRegionManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager getCurrentDeviceLanguage](self, "getCurrentDeviceLanguage"));
  LOBYTE(v2) = -[MSDLanguageAndRegionManager saveDeviceLanguageIdentifier:](v2, "saveDeviceLanguageIdentifier:", v3);

  return (char)v2;
}

- (BOOL)saveCuurentDeviceRegionCode
{
  MSDLanguageAndRegionManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionManager getCurrentDeviceRegion](self, "getCurrentDeviceRegion"));
  LOBYTE(v2) = -[MSDLanguageAndRegionManager saveDeviceRegionCode:](v2, "saveDeviceRegionCode:", v3);

  return (char)v2;
}

- (BOOL)saveDeviceLanguageIdentifier:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("DeviceLanguageIdentifier"));

  return v5;
}

- (id)deviceLanguageIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("DeviceLanguageIdentifier")));

  return v3;
}

- (BOOL)saveDeviceRegionCode:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("DeviceRegionCode"));

  return v5;
}

- (id)deviceRegionCode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("DeviceRegionCode")));

  return v3;
}

- (void)cancelNotifyToken:(int)a3
{
  if (a3 != -1)
    notify_cancel(a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
