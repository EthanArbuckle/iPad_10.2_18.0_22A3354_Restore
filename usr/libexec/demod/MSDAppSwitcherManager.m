@implementation MSDAppSwitcherManager

+ (id)sharedInstance
{
  if (qword_1001752C0 != -1)
    dispatch_once(&qword_1001752C0, &stru_10013E688);
  return (id)qword_1001752C8;
}

- (MSDAppSwitcherManager)init
{
  MSDAppSwitcherManager *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDAppSwitcherManager;
  v2 = -[MSDAppSwitcherManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    -[MSDAppSwitcherManager setFileManager:](v2, "setFileManager:", v3);

    v4 = objc_alloc_init((Class)SBSTestAutomationService);
    -[MSDAppSwitcherManager setSbAppSwitcher:](v2, "setSbAppSwitcher:", v4);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSwitcherManager sbAppSwitcher](self, "sbAppSwitcher"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MSDAppSwitcherManager;
  -[MSDAppSwitcherManager dealloc](&v4, "dealloc");
}

- (void)initializeClearAppSwitcherStateForDemoMode
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSwitcherManager fileManager](self, "fileManager"));
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Application Support/ScreenSaverManager/demoModeAppSwitcher.plist"));

  if (v4)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[MSDAppSwitcherManager initializeClearAppSwitcherStateForDemoMode]";
      v9 = 2114;
      v10 = CFSTR("/var/mobile/Library/Application Support/ScreenSaverManager/demoModeAppSwitcher.plist");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - AppSwitcher model file already exists at path %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    -[MSDAppSwitcherManager createSwitcherModelAtPath:](self, "createSwitcherModelAtPath:", CFSTR("/var/mobile/Library/Application Support/ScreenSaverManager/demoModeAppSwitcher.plist"));
  }
}

- (BOOL)clearAppSwitcherForDemoMode
{
  return -[MSDAppSwitcherManager loadStashedSwitcherModelFromPath:](self, "loadStashedSwitcherModelFromPath:", CFSTR("/var/mobile/Library/Application Support/ScreenSaverManager/demoModeAppSwitcher.plist"));
}

- (BOOL)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSwitcherManager fileManager](self, "fileManager"));
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[MSDAppSwitcherManager sbAppSwitcher](self, "sbAppSwitcher"));
    -[NSObject loadStashedSwitcherModelFromPath:](v7, "loadStashedSwitcherModelFromPath:", v4);
  }
  else
  {
    v8 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BD25C();
  }

  return v6;
}

- (BOOL)stashSwitcherModelToPath:(id)a3 overwrite:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  unsigned __int8 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v21 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingLastPathComponent"));
  if (!a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSwitcherManager fileManager](self, "fileManager"));
    v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

    if (v9)
    {
      v10 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[MSDAppSwitcherManager stashSwitcherModelToPath:overwrite:]";
        v24 = 2114;
        v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - AppSwitcher model file already exists at path %{public}@", buf, 0x16u);
      }
LABEL_13:

      v17 = 0;
      goto LABEL_14;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSwitcherManager fileManager](self, "fileManager"));
  v13 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v7, &v21);
  v14 = v21;

  if (!v13 || !v14)
  {
    v18 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000BD334();
    goto LABEL_13;
  }
  v15 = objc_claimAutoreleasedReturnValue(-[MSDAppSwitcherManager sbAppSwitcher](self, "sbAppSwitcher"));
  objc_msgSend((id)v15, "stashSwitcherModelToPath:", v6);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSwitcherManager fileManager](self, "fileManager"));
  LOBYTE(v15) = objc_msgSend(v16, "fileExistsAtPath:", v6);

  if ((v15 & 1) == 0)
  {
    v19 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000BD2C8();
    goto LABEL_13;
  }
  v17 = 1;
LABEL_14:

  return v17;
}

- (BOOL)createSwitcherModelAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  v12 = 0;
  v6 = objc_msgSend(v4, "writeToURL:error:", v5, &v12);
  v7 = v12;

  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MSDAppSwitcherManager createSwitcherModelAtPath:]";
      v15 = 2114;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - Writing empty app switcher model to path %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_1000BD3A0((uint64_t)v3, v7, v10);
  }

  return v6;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (SBSTestAutomationService)sbAppSwitcher
{
  return self->_sbAppSwitcher;
}

- (void)setSbAppSwitcher:(id)a3
{
  objc_storeStrong((id *)&self->_sbAppSwitcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbAppSwitcher, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
