@implementation CarDisplayConfigAuxiliaryTask

- (CarDisplayConfigAuxiliaryTask)init
{
  CarDisplayConfigAuxiliaryTask *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  CarDisplayConfigAuxiliaryTask *v13;

  v11.receiver = self;
  v11.super_class = (Class)CarDisplayConfigAuxiliaryTask;
  v2 = -[CarDisplayConfigAuxiliaryTask init](&v11, "init");
  if (v2)
  {
    v3 = sub_10026F3AC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v13 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "sceneDidActivateNotification:", UISceneDidActivateNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "sceneDidEnterBackgroundNotification:", UISceneDidEnterBackgroundNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "sceneDidDisconnectNotification:", UISceneDidDisconnectNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "chromeViewControllerDidLoadMapViewNotification:", CFSTR("ChromeViewControllerDidLoadMapViewNotification"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "chromeDeactivationReasonsDidChangeNotification:", CFSTR("ChromeViewControllerDidChangeDeactivationReasonsNotification"), 0);

    -[CarDisplayConfigAuxiliaryTask _updateCarDisplayConfig](v2, "_updateCarDisplayConfig");
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  CarDisplayConfigAuxiliaryTask *v7;

  v3 = sub_10026F3AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)CarDisplayConfigAuxiliaryTask;
  -[CarDisplayConfigAuxiliaryTask dealloc](&v5, "dealloc");
}

+ (unint64_t)instrumentClusterSceneCount
{
  return (unint64_t)_objc_msgSend(a1, "_countScenesForInstrumentCluster:", 1);
}

+ (unint64_t)centerConsoleSceneCount
{
  return (unint64_t)_objc_msgSend(a1, "_countScenesForInstrumentCluster:", 0);
}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)sceneDidActivateNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_opt_class(UIScene);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) == 0)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315906;
      v18 = "-[CarDisplayConfigAuxiliaryTask sceneDidActivateNotification:]";
      v19 = 2080;
      v20 = "CarDisplayConfigAuxiliaryTask.m";
      v21 = 1024;
      v22 = 95;
      v23 = 2080;
      v24 = "[notification.object isKindOfClass:UIScene.class]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v17 = 138412290;
        v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v9 = objc_opt_class(UIScene);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  -[CarDisplayConfigAuxiliaryTask _processSceneChange:](self, "_processSceneChange:", v11);
}

- (void)sceneDidEnterBackgroundNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_opt_class(UIScene);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) == 0)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315906;
      v18 = "-[CarDisplayConfigAuxiliaryTask sceneDidEnterBackgroundNotification:]";
      v19 = 2080;
      v20 = "CarDisplayConfigAuxiliaryTask.m";
      v21 = 1024;
      v22 = 101;
      v23 = 2080;
      v24 = "[notification.object isKindOfClass:UIScene.class]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v17 = 138412290;
        v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v9 = objc_opt_class(UIScene);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  -[CarDisplayConfigAuxiliaryTask _processSceneChange:](self, "_processSceneChange:", v11);
}

- (void)sceneDidDisconnectNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_opt_class(UIScene);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) == 0)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315906;
      v18 = "-[CarDisplayConfigAuxiliaryTask sceneDidDisconnectNotification:]";
      v19 = 2080;
      v20 = "CarDisplayConfigAuxiliaryTask.m";
      v21 = 1024;
      v22 = 107;
      v23 = 2080;
      v24 = "[notification.object isKindOfClass:UIScene.class]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v17 = 138412290;
        v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v9 = objc_opt_class(UIScene);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  -[CarDisplayConfigAuxiliaryTask _processSceneChange:](self, "_processSceneChange:", v11);
}

- (void)chromeViewControllerDidLoadMapViewNotification:(id)a3
{
  -[CarDisplayConfigAuxiliaryTask _processChromeVCNotification:](self, "_processChromeVCNotification:", a3);
}

- (void)chromeDeactivationReasonsDidChangeNotification:(id)a3
{
  -[CarDisplayConfigAuxiliaryTask _processChromeVCNotification:](self, "_processChromeVCNotification:", a3);
}

- (void)_processChromeVCNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_opt_class(ChromeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) == 0)
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315906;
      v26 = "-[CarDisplayConfigAuxiliaryTask _processChromeVCNotification:]";
      v27 = 2080;
      v28 = "CarDisplayConfigAuxiliaryTask.m";
      v29 = 1024;
      v30 = 123;
      v31 = 2080;
      v32 = "[notification.object isKindOfClass:ChromeViewController.class]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v25, 0x26u);
    }

    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v25 = 138412290;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v9 = objc_opt_class(ChromeViewController);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  if ((objc_msgSend(v11, "isViewLoaded") & 1) == 0)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315906;
      v26 = "-[CarDisplayConfigAuxiliaryTask _processChromeVCNotification:]";
      v27 = 2080;
      v28 = "CarDisplayConfigAuxiliaryTask.m";
      v29 = 1024;
      v30 = 125;
      v31 = 2080;
      v32 = "chromeVC.isViewLoaded";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v25, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v25 = 138412290;
        v26 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

      }
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewIfLoaded"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "windowScene"));

  if (v14)
    -[CarDisplayConfigAuxiliaryTask _processSceneChange:](self, "_processSceneChange:", v14);

}

+ (unint64_t)_countScenesForInstrumentCluster:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_carPlayScenes](UIApplication, "_maps_carPlayScenes"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v10, "activationState") <= 1)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_FBSScene"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "settings"));
          v13 = objc_opt_class(CRSUIInstrumentClusterSceneSettings);
          isKindOfClass = objc_opt_isKindOfClass(v12, v13);

          if (((isKindOfClass ^ v3) & 1) == 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "carChromeViewController"));
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapView"));
            if (v17)
            {
              v18 = (void *)v17;
              v19 = objc_msgSend(v16, "isInactive");

              v7 += v19 ^ 1;
            }

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_processSceneChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;

  v4 = a3;
  if (!v4)
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315906;
      v11 = "-[CarDisplayConfigAuxiliaryTask _processSceneChange:]";
      v12 = 2080;
      v13 = "CarDisplayConfigAuxiliaryTask.m";
      v14 = 1024;
      v15 = 162;
      v16 = 2080;
      v17 = "scene != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v10, 0x26u);
    }

    if (sub_100A70734())
    {
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v10 = 138412290;
        v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);

      }
    }
  }
  if (objc_msgSend(v4, "isCarScene"))
    -[CarDisplayConfigAuxiliaryTask _updateCarDisplayConfig](self, "_updateCarDisplayConfig");

}

- (void)_updateCarDisplayConfig
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  const char *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  unint64_t v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  int BOOL;
  __CFString *v36;
  const __CFString *v37;
  __CFString *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  void *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  CarDisplayConfigAuxiliaryTask *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  __CFString *v63;
  __int16 v64;
  const __CFString *v65;
  _BYTE v66[128];

  v3 = sub_10026F3AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v57 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Updating car display config", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_carPlayScenes](UIApplication, "_maps_carPlayScenes"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v10, "activationState") < 2)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject carChromeViewController](v12, "carChromeViewController"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapView"));
          if (v14
            && (v15 = (void *)v14,
                v16 = objc_msgSend(v13, "isInactive"),
                v15,
                (v16 & 1) == 0))
          {
            v23 = sub_10026F3AC();
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349314;
              v57 = self;
              v58 = 2112;
              v59 = v10;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Processing scene: %@", buf, 0x16u);
            }

            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapView"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _mapLayer](v19, "_mapLayer"));
            objc_msgSend(v45, "addObject:", v25);

          }
          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapView"));

            v18 = sub_10026F3AC();
            v19 = objc_claimAutoreleasedReturnValue(v18);
            v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
            if (v17)
            {
              if (v20)
              {
                *(_DWORD *)buf = 134349314;
                v57 = self;
                v58 = 2112;
                v59 = v10;
                v21 = v19;
                v22 = "[%{public}p] Skipping inactive scene: %@";
                goto LABEL_21;
              }
            }
            else if (v20)
            {
              *(_DWORD *)buf = 134349314;
              v57 = self;
              v58 = 2112;
              v59 = v10;
              v21 = v19;
              v22 = "[%{public}p] Skipping scene with no map view: %@";
LABEL_21:
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, 0x16u);
            }
          }

          goto LABEL_23;
        }
        v11 = sub_10026F3AC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349314;
          v57 = self;
          v58 = 2112;
          v59 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Skipping inactive scene: %@", buf, 0x16u);
        }
LABEL_23:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
    }
    while (v7);
  }

  v26 = objc_msgSend(v45, "count");
  v27 = v26;
  v28 = (unint64_t)v26;
  if (v26)
  {
    if (v26 == (id)1
      || (GEOConfigGetBOOL(MapsConfig_InstrumentClusterConnectionCameraStyleToggleEnabled, off_1014B4D48) & 1) == 0)
    {
      v28 = 1;
    }
    else
    {
      v28 = 2;
    }
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v30 = objc_msgSend(v29, "BOOLForKey:", CFSTR("CarDisplayConfigForceDualDisplayKey"));

  if (v30)
  {
    v31 = sub_10026F3AC();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v57 = self;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Forcing dual display config from user default", buf, 0xCu);
    }

    v28 = 2;
  }
  v33 = sub_10026F3AC();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_InstrumentClusterConnectionCameraStyleToggleEnabled, off_1014B4D48);
    v36 = CFSTR("NO");
    if (BOOL)
      v36 = CFSTR("YES");
    if (v28 > 2)
      v37 = CFSTR("unknown");
    else
      v37 = off_1011AE4F8[v28];
    *(_DWORD *)buf = 134350082;
    v57 = self;
    v58 = 2048;
    v59 = v27;
    v60 = 2112;
    v61 = v45;
    v62 = 2112;
    v63 = v36;
    v64 = 2112;
    v65 = v37;
    v38 = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}p] Detected %lu map views: %@; InstrumentClusterConnectionCameraStyleToggleEnabled: %@; updating VKCarDi"
      "splayConfigs to %@",
      buf,
      0x34u);

  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v39 = v45;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(_QWORD *)v48 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j), "setCarDisplayConfig:animated:", v28, 1);
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v41);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v44, "postNotificationName:object:", CFSTR("CarDisplayConfigDidChangeNotification"), 0);

}

@end
