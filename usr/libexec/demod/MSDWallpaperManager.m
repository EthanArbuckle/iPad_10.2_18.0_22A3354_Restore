@implementation MSDWallpaperManager

+ (id)sharedInstance
{
  if (qword_1001752F0 != -1)
    dispatch_once(&qword_1001752F0, &stru_10013E7C8);
  return (id)qword_1001752F8;
}

- (MSDWallpaperManager)init
{
  MSDWallpaperManager *v2;
  MSDWallpaperManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDWallpaperManager;
  v2 = -[MSDWallpaperManager init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDWallpaperManager setWallpaperSettingsFilePath:](v2, "setWallpaperSettingsFilePath:", CFSTR("/var/mobile/Library/Application Support/ScreenSaverManager/.savedWallpaperSettings.plist"));
    -[MSDWallpaperManager setJustBootUp:](v3, "setJustBootUp:", 1);
    -[MSDWallpaperManager setUseFactoryDefault:](v3, "setUseFactoryDefault:", 0);
  }
  return v3;
}

- (void)stashWallpaperSettingsIfNeeded
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  _UNKNOWN **v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  _UNKNOWN **v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWallpaperManager wallpaperSettingsFilePath](self, "wallpaperSettingsFilePath"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v6 = objc_alloc((Class)NSDictionary);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWallpaperManager wallpaperSettingsFilePath](self, "wallpaperSettingsFilePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
    v28 = 0;
    v9 = (_UNKNOWN **)objc_msgSend(v6, "initWithContentsOfURL:error:", v8, &v28);
    v10 = v28;

    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Persistent wallpaper settings loaded: %{public}@", buf, 0xCu);
      }

      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("UseFactoryDefault")));
      -[MSDWallpaperManager setUseFactoryDefault:](self, "setUseFactoryDefault:", -[NSObject BOOLValue](v14, "BOOLValue"));
LABEL_11:

      if (!-[MSDWallpaperManager useFactoryDefault](self, "useFactoryDefault"))
        -[MSDWallpaperManager _startPosterConfigChangeMonitor](self, "_startPosterConfigChangeMonitor");
      goto LABEL_13;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000BE2CC(v10);

    v9 = 0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWallpaperManager wallpaperSettingsFilePath](self, "wallpaperSettingsFilePath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByDeletingLastPathComponent"));
    v27 = 0;
    v17 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v27);
    v10 = v27;

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWallpaperManager wallpaperSettingsFilePath](self, "wallpaperSettingsFilePath"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v18));
      v26 = v10;
      v20 = objc_msgSend(&off_10014E718, "writeToURL:error:", v19, &v26);
      v21 = v26;

      v22 = sub_1000604F0();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v14 = v23;
      if ((v20 & 1) != 0)
      {
        v9 = &off_10014E718;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v30 = &off_10014E718;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Persistent wallpaper settings saved: %{public}@", buf, 0xCu);
        }
        v10 = v21;
        goto LABEL_11;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1000BE344(v21);

      v9 = &off_10014E718;
      v10 = v21;
    }
    else
    {
      v24 = sub_1000604F0();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_1000BE3BC(v10);

      v9 = &off_10014E718;
    }
  }
LABEL_13:

}

- (void)restoreWallpaperSettingsIfNeeded
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[MSDWallpaperManager useFactoryDefault](self, "useFactoryDefault"))
  {
    v3 = sub_1000604F0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wallpaper settings have changed. Resetting wallpaper settings to factory default!", v5, 2u);
    }

    -[MSDWallpaperManager _resetWallpaperSettingsToFactoryDefault](self, "_resetWallpaperSettingsToFactoryDefault");
  }
}

- (void)_startPosterConfigChangeMonitor
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  dispatch_queue_global_t global_queue;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up poster config change observer...", buf, 2u);
  }

  v5 = objc_alloc_init((Class)PRSWallpaperLocationStateObserver);
  objc_msgSend(v5, "setLocations:", 12);
  objc_msgSend(v5, "setNeedsSandboxExtensions:", 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041340;
  v11[3] = &unk_10013E7F0;
  v11[4] = self;
  objc_msgSend(v5, "setHandler:", v11);
  v6 = objc_alloc_init((Class)PRSWallpaperObserverConfiguration);
  global_queue = dispatch_get_global_queue(21, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  objc_msgSend(v6, "setQueue:", v8);

  objc_msgSend(v6, "setLocationStateObserver:", v5);
  v9 = objc_msgSend(objc_alloc((Class)PRSWallpaperObserver), "initWithExplanation:", CFSTR("Store Demo Mode"));
  -[MSDWallpaperManager setPosterObserver:](self, "setPosterObserver:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWallpaperManager posterObserver](self, "posterObserver"));
  objc_msgSend(v10, "activateWithConfiguration:", v6);

}

- (void)_handleWallpaperConfigChange
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t v15[16];
  uint8_t buf[16];

  if (-[MSDWallpaperManager justBootUp](self, "justBootUp"))
  {
    v3 = sub_1000604F0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ignore first poster config change call after observer is first registered.", buf, 2u);
    }

    -[MSDWallpaperManager setJustBootUp:](self, "setJustBootUp:", 0);
  }
  else if (!-[MSDWallpaperManager useFactoryDefault](self, "useFactoryDefault"))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will reset wallpaper settings to factory default next time.", v15, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWallpaperManager wallpaperSettingsFilePath](self, "wallpaperSettingsFilePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
    v14 = 0;
    v9 = objc_msgSend(&off_10014E740, "writeToURL:error:", v8, &v14);
    v10 = v14;

    if ((v9 & 1) != 0)
    {
      -[MSDWallpaperManager setUseFactoryDefault:](self, "setUseFactoryDefault:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWallpaperManager posterObserver](self, "posterObserver"));
      objc_msgSend(v11, "invalidate");

      -[MSDWallpaperManager setPosterObserver:](self, "setPosterObserver:", 0);
    }
    else
    {
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000BE344(v10);

    }
  }
}

- (void)_resetWallpaperSettingsToFactoryDefault
{
  id v2;
  dispatch_semaphore_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;

  v2 = objc_alloc_init((Class)PRSService);
  v3 = dispatch_semaphore_create(0);
  v4 = dispatch_time(0, 3000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004169C;
  v8[3] = &unk_10013E818;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v2, "deleteDataStoreWithCompletion:", v8);
  if (dispatch_semaphore_wait(v5, v4))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BE434(v7);

  }
}

- (NSString)wallpaperSettingsFilePath
{
  return self->_wallpaperSettingsFilePath;
}

- (void)setWallpaperSettingsFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperSettingsFilePath, a3);
}

- (PRSWallpaperObserver)posterObserver
{
  return self->_posterObserver;
}

- (void)setPosterObserver:(id)a3
{
  objc_storeStrong((id *)&self->_posterObserver, a3);
}

- (BOOL)justBootUp
{
  return self->_justBootUp;
}

- (void)setJustBootUp:(BOOL)a3
{
  self->_justBootUp = a3;
}

- (BOOL)useFactoryDefault
{
  return self->_useFactoryDefault;
}

- (void)setUseFactoryDefault:(BOOL)a3
{
  self->_useFactoryDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterObserver, 0);
  objc_storeStrong((id *)&self->_wallpaperSettingsFilePath, 0);
}

@end
