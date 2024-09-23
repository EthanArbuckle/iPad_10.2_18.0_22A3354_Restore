@implementation CarSceneDelegate

- (void)_objc_initiateDealloc
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  if (!pthread_main_np())
  {
    v3 = sub_100431A4C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "CarSceneDelegate deallocation initiated from the background", buf, 2u);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B3290;
  block[3] = &unk_1011B40C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (void)initialize
{
  if ((id)objc_opt_class(CarSceneDelegate) == a1)
    _class_setCustomDeallocInitiation(a1);
}

- (void)dealloc
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v6 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v13 = "-[CarSceneDelegate dealloc]";
        v14 = 2080;
        v15 = "CarSceneDelegate.m";
        v16 = 1024;
        v17 = 112;
        v18 = 2080;
        v19 = "dispatch_get_main_queue()";
        v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v22 = 2080;
        v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v8 = sub_1004318FC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v13 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CarSceneDelegate;
  -[CarSceneDelegate dealloc](&v11, "dealloc");
}

- (NSString)description
{
  uint64_t v3;
  unint64_t sceneType;
  const __CFString *v5;

  v3 = objc_opt_class(self);
  sceneType = self->_sceneType;
  if (sceneType > 7)
    v5 = CFSTR(".Unknown");
  else
    v5 = off_1011C6C18[sceneType];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: %@>"), v3, self, v5);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  unint64_t v31;
  const __CFString *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  unint64_t v37;
  const __CFString *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  id v61;
  unint64_t v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  id v74;
  NSObject *v75;
  id v76;
  NSObject *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  id v82;
  NSObject *v83;
  id v84;
  NSObject *v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  const __CFString *v93;
  CarSceneDelegate *v94;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100431A4C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WillConnectToSession", ", buf, 2u);
  }

  v13 = sub_100431A4C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CarDisplayControllerPrepare", ", buf, 2u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  objc_msgSend(v15, "prepareCarPlay");

  v16 = sub_100431A4C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CarDisplayControllerPrepare", ", buf, 2u);
  }

  v18 = v8;
  -[CarSceneDelegate setScene:](self, "setScene:", v18);
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_FBSScene"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "settings"));
  v21 = objc_opt_class(CRSUIDashboardWidgetSceneSettings);
  isKindOfClass = objc_opt_isKindOfClass(v20, v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "settings"));
  v24 = v23;
  if ((isKindOfClass & 1) != 0)
  {
    v25 = (char *)objc_msgSend(v23, "widgetStyle");
    v26 = 2;
    if (v25 != (char *)3)
      v26 = 0;
    if ((unint64_t)(v25 - 1) >= 2)
      v27 = v26;
    else
      v27 = 3;
LABEL_13:

    goto LABEL_19;
  }
  v28 = objc_opt_class(CRSUIInstrumentClusterSceneSettings);
  v29 = objc_opt_isKindOfClass(v24, v28);

  if ((v29 & 1) != 0)
  {
    if (!GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterEnabled, off_1014B4938)
      || (GEOConfigGetBOOL(MapsConfig_CarPlayHybridInstrumentClusterEverywhere, off_1014B51A8) & 1) == 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "settings"));
      v27 = 5;
      switch((unint64_t)objc_msgSend(v24, "itemType"))
      {
        case 0uLL:
          if (GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterEnabled, off_1014B4938))
            v27 = 7;
          else
            v27 = 4;
          break;
        case 1uLL:
          v27 = 4;
          break;
        case 2uLL:
          goto LABEL_13;
        case 3uLL:
          if (GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterEnabled, off_1014B4938))
            v27 = 7;
          else
            v27 = 6;
          break;
        default:
          v27 = 0;
          break;
      }
      goto LABEL_13;
    }
    v27 = 7;
  }
  else
  {
    v27 = 1;
  }
LABEL_19:

  -[CarSceneDelegate setSceneType:](self, "setSceneType:", v27);
  v94 = self;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v94, 1));
  v31 = -[CarSceneDelegate sceneType](self, "sceneType");
  if (v31 > 7)
    v32 = CFSTR(".Unknown");
  else
    v32 = off_1011C6C18[v31];
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%p"), v32, self));
  objc_msgSend(v18, "_registerSettingsDiffActionArray:forKey:", v30, v33);

  v34 = sub_100431A4C();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "description"));
    v37 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v37 > 7)
      v38 = CFSTR(".Unknown");
    else
      v38 = off_1011C6C18[v37];
    *(_DWORD *)buf = 138413058;
    v87 = v36;
    v88 = 2112;
    v89 = v9;
    v90 = 2112;
    v91 = v10;
    v92 = 2112;
    v93 = v38;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "-scene:willConnectToSession:withOptions: %@, %@, %@, carSceneType: %@", buf, 0x2Au);

  }
  v39 = sub_100431A4C();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlatformController", ", buf, 2u);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate appSessionController](self, "appSessionController"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "primaryPlatformController"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  objc_msgSend(v43, "setPlatformController:", v42);

  v44 = sub_100431A4C();
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlatformController", ", buf, 2u);
  }

  v46 = sub_100431A4C();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IdleTimerConfiguration", ", buf, 2u);
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v48, "updateNavigationIdleTimerConfiguration");

  v49 = sub_100431A4C();
  v50 = objc_claimAutoreleasedReturnValue(v49);
  if (os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IdleTimerConfiguration", ", buf, 2u);
  }

  v51 = sub_100431A4C();
  v52 = objc_claimAutoreleasedReturnValue(v51);
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneController", ", buf, 2u);
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v53, "_mapsCar_scene:willConnectToSession:options:", v18, v9, v10);

  v54 = sub_100431A4C();
  v55 = objc_claimAutoreleasedReturnValue(v54);
  if (os_signpost_enabled(v55))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneController", ", buf, 2u);
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "chromeViewController"));
  if (!v56)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "chromeViewController"));
    objc_msgSend(v42, "setChromeViewController:", v58);

  }
  if ((id)-[CarSceneDelegate sceneType](self, "sceneType") != (id)1)
  {
    v59 = sub_100431A4C();
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_signpost_enabled(v60))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateWindow", ", buf, 2u);
    }

    v61 = objc_msgSend(objc_alloc(-[CarSceneDelegate _windowClass](self, "_windowClass")), "initWithWindowScene:", v18);
    -[CarSceneDelegate setWindow:](self, "setWindow:", v61);

    v62 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v62 > 7)
      v63 = CFSTR(".Unknown");
    else
      v63 = off_1011C6C18[v62];
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Maps"), "stringByAppendingString:", v63));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate window](self, "window"));
    objc_msgSend(v65, "setAccessibilityIdentifier:", v64);

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "chromeViewController"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate window](self, "window"));
    objc_msgSend(v68, "setRootViewController:", v67);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate window](self, "window"));
    objc_msgSend(v69, "setHidden:", 0);

    v70 = sub_100431A4C();
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (os_signpost_enabled(v71))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v71, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateWindow", ", buf, 2u);
    }

    if ((id)-[CarSceneDelegate sceneType](self, "sceneType") == (id)7)
    {
      v72 = sub_100431A4C();
      v73 = objc_claimAutoreleasedReturnValue(v72);
      if (os_signpost_enabled(v73))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RebuildContexts", ", buf, 2u);
      }

      -[CarSceneDelegate rebuildContextsForCurrentAppState](self, "rebuildContextsForCurrentAppState");
      v74 = sub_100431A4C();
      v75 = objc_claimAutoreleasedReturnValue(v74);
      if (os_signpost_enabled(v75))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v75, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RebuildContexts", ", buf, 2u);
      }

    }
  }
  v76 = sub_100431A4C();
  v77 = objc_claimAutoreleasedReturnValue(v76);
  if (os_signpost_enabled(v77))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v77, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EntryPointCoordinator", ", buf, 2u);
  }

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coordinateSpace"));
  objc_msgSend(v79, "bounds");
  objc_msgSend(v78, "willConnectToSession:options:windowSize:scene:", v9, v10, v18, v80, v81);

  v82 = sub_100431A4C();
  v83 = objc_claimAutoreleasedReturnValue(v82);
  if (os_signpost_enabled(v83))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EntryPointCoordinator", ", buf, 2u);
  }

  v84 = sub_100431A4C();
  v85 = objc_claimAutoreleasedReturnValue(v84);
  if (os_signpost_enabled(v85))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v85, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WillConnectToSession", ", buf, 2u);
  }

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  char *v9;
  unint64_t v10;
  const __CFString *v11;
  const char *label;
  const char *v13;
  id v14;
  unint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  id v31;
  NSObject *v32;
  char *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidDisconnect", ", buf, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v10 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v10 > 7)
      v11 = CFSTR(".Unknown");
    else
      v11 = off_1011C6C18[v10];
    *(_DWORD *)buf = 138412546;
    v35 = v9;
    v36 = 2112;
    v37 = (const char *)v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "-sceneDidDisconnect: %@, carSceneType: %@", buf, 0x16u);

  }
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v13 = dispatch_queue_get_label(0);
  if (label != v13 && (!label || !v13 || strcmp(label, v13)))
  {
    v27 = sub_1004318FC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      v30 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136316418;
      v35 = "-[CarSceneDelegate sceneDidDisconnect:]";
      v36 = 2080;
      v37 = "CarSceneDelegate.m";
      v38 = 1024;
      v39 = 182;
      v40 = 2080;
      v41 = "dispatch_get_main_queue()";
      v42 = 2080;
      v43 = v29;
      v44 = 2080;
      v45 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
        buf,
        0x3Au);

    }
    if (sub_100A70734())
    {
      v31 = sub_1004318FC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v14 = v4;
  v15 = -[CarSceneDelegate sceneType](self, "sceneType");
  if (v15 > 7)
    v16 = CFSTR(".Unknown");
  else
    v16 = off_1011C6C18[v15];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%p"), v16, self));
  objc_msgSend(v14, "_unregisterSettingsDiffActionArrayForKey:", v17);

  if ((id)-[CarSceneDelegate sceneType](self, "sceneType") != (id)1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate window](self, "window"));
    objc_msgSend(v18, "setHidden:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate window](self, "window"));
    v20 = objc_opt_class(CRSUIDashboardWidgetWindow);
    isKindOfClass = objc_opt_isKindOfClass(v19, v20);

    if ((isKindOfClass & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate window](self, "window"));
      objc_msgSend(v22, "invalidate");

    }
    -[CarSceneDelegate setWindow:](self, "setWindow:", 0);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v23, "sceneDidDisconnect:", v14);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v24, "updateNavigationIdleTimerConfiguration");

  v25 = sub_100431A4C();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidDisconnect", ", buf, 2u);
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidBecomeActive", ", (uint8_t *)&v19, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v10 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v10 > 7)
      v11 = CFSTR(".Unknown");
    else
      v11 = off_1011C6C18[v10];
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "-sceneDidBecomeActive: %@, carSceneType: %@", (uint8_t *)&v19, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
  v13 = objc_opt_respondsToSelector(v12, "sceneDidBecomeActive:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    objc_msgSend(v14, "sceneDidBecomeActive:", v4);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v15, "didBecomeActiveWithSession:", v16);

  v17 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidBecomeActive", ", (uint8_t *)&v19, 2u);
  }

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneWillResignActive", ", (uint8_t *)&v19, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v10 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v10 > 7)
      v11 = CFSTR(".Unknown");
    else
      v11 = off_1011C6C18[v10];
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "-sceneWillResignActive: %@, carSceneType: %@", (uint8_t *)&v19, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
  v13 = objc_opt_respondsToSelector(v12, "sceneWillResignActive:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    objc_msgSend(v14, "sceneWillResignActive:", v4);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v15, "willResignActiveWithSession:", v16);

  v17 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneWillResignActive", ", (uint8_t *)&v19, 2u);
  }

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneWillEnterForeground", ", (uint8_t *)&v19, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v10 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v10 > 7)
      v11 = CFSTR(".Unknown");
    else
      v11 = off_1011C6C18[v10];
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "-sceneWillEnterForeground: %@, carSceneType: %@", (uint8_t *)&v19, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
  v13 = objc_opt_respondsToSelector(v12, "sceneWillEnterForeground:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    objc_msgSend(v14, "sceneWillEnterForeground:", v4);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v15, "willEnterForegroundWithSession:", v16);

  v17 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneWillEnterForeground", ", (uint8_t *)&v19, 2u);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidEnterBackground", ", (uint8_t *)&v19, 2u);
  }

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v10 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v10 > 7)
      v11 = CFSTR(".Unknown");
    else
      v11 = off_1011C6C18[v10];
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "-sceneDidEnterBackground: %@, carSceneType: %@", (uint8_t *)&v19, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
  v13 = objc_opt_respondsToSelector(v12, "sceneDidEnterBackground:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    objc_msgSend(v14, "sceneDidEnterBackground:", v4);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate entryPointsCoordinator](self, "entryPointsCoordinator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v15, "didEnterBackgroundWithSession:", v16);

  v17 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidEnterBackground", ", (uint8_t *)&v19, 2u);
  }

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "-[CarSceneDelegate scene:continueUserActivity:]";
        v24 = 2080;
        v25 = "CarSceneDelegate.m";
        v26 = 1024;
        v27 = 252;
        v28 = 2080;
        v29 = "dispatch_get_main_queue()";
        v30 = 2080;
        v31 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v32 = 2080;
        v33 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v15 = sub_1004318FC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v23 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1007AC944;
  v18[3] = &unk_1011AF1B0;
  v18[4] = self;
  v19 = v7;
  v20 = v6;
  v21 = v20;
  v11 = v7;
  v12 = v20;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v24 = "-[CarSceneDelegate scene:openURLContexts:]";
        v25 = 2080;
        v26 = "CarSceneDelegate.m";
        v27 = 1024;
        v28 = 266;
        v29 = 2080;
        v30 = "dispatch_get_main_queue()";
        v31 = 2080;
        v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v33 = 2080;
        v34 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v24 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v11 = v6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1007ACC40;
  v19[3] = &unk_1011AF1B0;
  v19[4] = self;
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  v21 = v11;
  v22 = v11;
  v12 = v11;
  v13 = v20;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  CarSceneDelegate *v20;
  int64_t v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  char v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  BOOL v61;
  double v62;
  char v63;
  id v64;
  unint64_t v65;
  id v66;
  NSObject *v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  os_log_type_t v71;
  id v72;
  NSObject *v73;
  const __CFString *v74;
  id v75;
  const __CFString *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  BOOL v91;
  void *v92;
  void *v93;
  const __CFString *v94;
  id v95;
  __CFString *v96;
  void *v97;
  unint64_t v98;
  id v99;
  const __CFString *v100;
  uint8_t buf[4];
  CarSceneDelegate *v102;
  __int16 v103;
  const __CFString *v104;
  __int16 v105;
  id v106;

  v12 = a3;
  v13 = (__CFString *)a4;
  v14 = (__CFString *)a5;
  v15 = a6;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));

  if (v16 != v12)
  {
    v17 = sub_100431A4C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));
      v20 = (CarSceneDelegate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_FBSScene"));
      *(_DWORD *)buf = 138412546;
      v102 = v20;
      v103 = 2112;
      v104 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_ERROR, "CarSceneController - FBSceneUpdateAction: received callback for _FBScene that differs from current scene's _FBScene, current: %@ new: %@", buf, 0x16u);

    }
    goto LABEL_85;
  }
  v100 = v14;
  v21 = -[CarSceneDelegate sceneType](self, "sceneType");
  v22 = v13;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString settings](v22, "settings"));
  v24 = objc_opt_class(CRSUIDashboardWidgetSceneSettings);
  isKindOfClass = objc_opt_isKindOfClass(v23, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString settings](v22, "settings"));
  v27 = v26;
  if ((isKindOfClass & 1) == 0)
  {
    v30 = objc_opt_class(CRSUIInstrumentClusterSceneSettings);
    v31 = objc_opt_isKindOfClass(v27, v30);

    v98 = v21;
    if ((v31 & 1) != 0)
    {
      if (!GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterEnabled, off_1014B4938)
        || (GEOConfigGetBOOL(MapsConfig_CarPlayHybridInstrumentClusterEverywhere, off_1014B51A8) & 1) == 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString settings](v22, "settings"));
        v29 = 5;
        switch((unint64_t)objc_msgSend(v27, "itemType"))
        {
          case 0uLL:
            if (GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterEnabled, off_1014B4938))
              v29 = 7;
            else
              v29 = 4;
            goto LABEL_24;
          case 1uLL:
            v29 = 4;
            goto LABEL_24;
          case 2uLL:
            goto LABEL_24;
          case 3uLL:
            if (GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterEnabled, off_1014B4938))
              v29 = 7;
            else
              v29 = 6;
            goto LABEL_24;
          default:
            goto LABEL_18;
        }
      }
      v96 = v13;
      v32 = v15;
      v29 = 7;
    }
    else
    {
      v96 = v13;
      v32 = v15;
      v29 = 1;
    }
LABEL_25:

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString settings](v22, "settings"));
    v35 = objc_opt_class(UIApplicationSceneSettings);
    if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
      v36 = v34;
    else
      v36 = 0;
    v37 = v36;

    v18 = (uint64_t)v37;
    v38 = objc_opt_class(CRSUIInstrumentClusterSceneSettings);
    if ((objc_opt_isKindOfClass(v18, v38) & 1) != 0)
      v39 = (void *)v18;
    else
      v39 = 0;
    v40 = v39;

    v15 = v32;
    v41 = v32;
    v42 = objc_opt_class(UIApplicationSceneSettings);
    if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
      v43 = v41;
    else
      v43 = 0;
    v44 = v43;

    v45 = (unint64_t)v44;
    v46 = objc_opt_class(CRSUIInstrumentClusterSceneSettings);
    if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0)
      v47 = (void *)v45;
    else
      v47 = 0;
    v48 = v47;

    v49 = v18 | v45;
    v95 = v40;
    v97 = v48;
    if (v18 | v45)
    {
      objc_msgSend((id)v18, "safeAreaInsetsPortrait");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;
      objc_msgSend((id)v45, "safeAreaInsetsPortrait");
      v61 = v53 != v60;
      if (v51 != v62)
        v61 = 1;
      if (v57 != v59)
        v61 = 1;
      v63 = v55 != v58 || v61;
      v64 = objc_msgSend(v48, "layoutJustification");
      if (v64 == objc_msgSend(v40, "layoutJustification"))
        v49 = v63;
      else
        v49 = 1;
    }
    v65 = v29;
    v13 = v96;
    if (v98 == v29)
    {
      if (v98 != 7)
        v49 = 0;
      if ((v49 & 1) == 0)
      {
        v66 = sub_100431A4C();
        v67 = objc_claimAutoreleasedReturnValue(v66);
        v68 = v95;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349314;
          v102 = self;
          v103 = 2112;
          v14 = (__CFString *)v100;
          v104 = v100;
          v69 = "[%{public}p] CarSceneController - FBSceneUpdateAction: scene has updated, but nothing meaningful has cha"
                "nged: %@. -> ignoring the call.";
          v70 = v67;
          v71 = OS_LOG_TYPE_INFO;
LABEL_82:
          _os_log_impl((void *)&_mh_execute_header, v70, v71, v69, buf, 0x16u);
          goto LABEL_83;
        }
        v14 = (__CFString *)v100;
LABEL_83:

LABEL_84:
        goto LABEL_85;
      }
    }
    else if (v98 < 4 || v29 <= 3)
    {
      v75 = sub_100431A4C();
      v67 = objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        if (v98 > 7)
          v76 = CFSTR(".Unknown");
        else
          v76 = off_1011C6C18[v98];
        v14 = (__CFString *)v100;
        if (v65 - 1 > 6)
          v94 = CFSTR(".Unknown");
        else
          v94 = off_1011C6BE0[v65 - 1];
        v68 = v95;
        *(_DWORD *)buf = 138412546;
        v102 = (CarSceneDelegate *)v76;
        v103 = 2112;
        v104 = v94;
        v69 = "CarSceneController - FBSceneUpdateAction: scene was of type: %@, update to scenetype: %@, which is not sup"
              "ported -> ignoring the call.";
        v70 = v67;
        v71 = OS_LOG_TYPE_ERROR;
        goto LABEL_82;
      }
      v14 = (__CFString *)v100;
      goto LABEL_73;
    }
    v72 = sub_100431A4C();
    v73 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      if (v98 - 4 > 3)
        v74 = CFSTR(".Unknown");
      else
        v74 = off_1011C6BC0[v98 - 4];
      v99 = v15;
      if (v29 - 1 > 6)
        v77 = CFSTR(".Unknown");
      else
        v77 = off_1011C6BE0[v29 - 1];
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));
      *(_DWORD *)buf = 138412802;
      v102 = (CarSceneDelegate *)v74;
      v103 = 2112;
      v104 = v77;
      v105 = 2048;
      v106 = objc_msgSend(v78, "activationState");
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "CarSceneController - FBSceneUpdateAction: updating scene type from: %@, to: %@, sceneState: %ld", buf, 0x20u);

      v15 = v99;
    }

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate window](self, "window"));
    objc_msgSend(v79, "setRootViewController:", 0);

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));
    objc_msgSend(v80, "sceneDidDisconnect:", v81);

    -[CarSceneDelegate setSceneController:](self, "setSceneController:", 0);
    -[CarSceneDelegate setSceneType:](self, "setSceneType:", v65);
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "session"));
    objc_msgSend(v82, "_mapsCar_scene:willConnectToSession:options:", v83, v85, 0);

    v86 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "chromeViewController"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate window](self, "window"));
    objc_msgSend(v88, "setRootViewController:", v87);

    if ((id)-[CarSceneDelegate sceneType](self, "sceneType") == (id)7)
      -[CarSceneDelegate rebuildContextsForCurrentAppState](self, "rebuildContextsForCurrentAppState");
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));
    v90 = objc_msgSend(v89, "activationState");

    v91 = v90 == (id)2;
    v14 = (__CFString *)v100;
    if ((unint64_t)v90 >= 2)
    {
      v68 = v95;
      if (!v91)
        goto LABEL_84;
      v67 = objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));
      -[NSObject sceneDidEnterBackground:](v67, "sceneDidEnterBackground:", v93);

      goto LABEL_83;
    }
    v67 = objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate scene](self, "scene"));
    -[NSObject sceneWillEnterForeground:](v67, "sceneWillEnterForeground:", v92);

LABEL_73:
    v68 = v95;
    goto LABEL_83;
  }
  v28 = (char *)objc_msgSend(v26, "widgetStyle");
  if ((unint64_t)(v28 - 1) < 2)
  {
    v98 = v21;
    v29 = 3;
LABEL_24:
    v96 = v13;
    v32 = v15;

    goto LABEL_25;
  }
  if (v28 == (char *)3)
  {
    v98 = v21;
    v29 = 2;
    goto LABEL_24;
  }
LABEL_18:

  v33 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v33);
  v14 = (__CFString *)v100;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_ERROR, "CarSceneController - FBSceneUpdateAction: received an update request to .Unspecified scene type. Ignoring.", buf, 2u);
  }
LABEL_85:

}

- (id)appSessionController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appSessionController"));

  return v3;
}

- (CarSceneController)sceneController
{
  CarSceneController *sceneController;
  unint64_t v4;
  unint64_t v5;
  __objc2_class *v6;
  CarSceneController *v7;
  CarSceneController *v8;

  sceneController = self->_sceneController;
  if (!sceneController)
  {
    v4 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v4 <= 7)
    {
      v5 = v4;
      if (((1 << v4) & 0xD4) != 0)
      {
        v6 = CarMapWidgetController;
LABEL_7:
        v7 = (CarSceneController *)objc_msgSend([v6 alloc], "initWithCarSceneType:", v5);
LABEL_8:
        v8 = self->_sceneController;
        self->_sceneController = v7;

        sceneController = self->_sceneController;
        return sceneController;
      }
      if (((1 << v4) & 0x28) != 0)
      {
        v6 = CarSmallWidgetController;
        goto LABEL_7;
      }
      if (v4 == 1)
      {
        v7 = (CarSceneController *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        goto LABEL_8;
      }
    }
    v7 = objc_alloc_init(CarUnspecifiedWidgetController);
    goto LABEL_8;
  }
  return sceneController;
}

- (id)entryPointsCoordinator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CarMapsActionController *v7;
  void *v8;
  void *v9;
  CarMapsActionController *v10;
  CarMapsActionController *carActionController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate appSessionController](self, "appSessionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryPlatformController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryPointsCoordinator"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  if (!v6)
  {
    v7 = [CarMapsActionController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate appSessionController](self, "appSessionController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primaryPlatformController"));
    v10 = -[CarMapsActionController initWithPlatformController:](v7, "initWithPlatformController:", v9);

    objc_msgSend(v5, "setDelegate:", v10);
    carActionController = self->_carActionController;
    self->_carActionController = v10;

  }
  return v5;
}

- (Class)_windowClass
{
  unint64_t v3;
  __objc2_class *v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  unint64_t v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;

  v3 = -[CarSceneDelegate sceneType](self, "sceneType");
  if (v3 <= 7)
  {
    if (((1 << v3) & 0xF0) != 0)
    {
      v4 = CarInstrumentClusterWindow;
LABEL_6:
      v5 = objc_opt_class(v4);
      return (Class)(id)objc_claimAutoreleasedReturnValue(v5);
    }
    if (((1 << v3) & 0xD) != 0)
    {
      v4 = (__objc2_class *)CRSUIDashboardWidgetWindow;
      goto LABEL_6;
    }
  }
  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = -[CarSceneDelegate sceneType](self, "sceneType");
    if (v9 > 7)
      v10 = CFSTR(".Unknown");
    else
      v10 = off_1011C6C18[v9];
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "windowClass called for carSceneType: %@, which is invalid", (uint8_t *)&v11, 0xCu);
  }

  return (Class)0;
}

- (BOOL)shouldIgnoreActivationStateForBanner
{
  unint64_t sceneType;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;

  sceneType = self->_sceneType;
  if (sceneType == 7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate chromeViewController](self, "chromeViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

    v5 = objc_opt_class(CarHybridInstrumentClusterNavigationModeController);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "desiredCards"));
      v9 = objc_msgSend(v8, "containsObject:", CFSTR("Guidance")) ^ 1;

    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  else
  {
    LOBYTE(v9) = sceneType > 3;
  }
  return v9;
}

- (void)rebuildContextsForCurrentAppState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
  objc_msgSend(v2, "_mapsCar_rebuildContextsForCurrentAppState");

}

- (PPTTestCoordinatorProtocol)testCoordinator
{
  CarTestCoordinator *carTestCoordinator;
  CarTestCoordinator *v4;
  CarTestCoordinator *v5;
  CarTestCoordinator *v6;

  if ((id)-[CarSceneDelegate sceneType](self, "sceneType") != (id)1)
    goto LABEL_6;
  carTestCoordinator = self->_carTestCoordinator;
  if (!carTestCoordinator)
  {
    v4 = objc_alloc_init(CarTestCoordinator);
    v5 = self->_carTestCoordinator;
    self->_carTestCoordinator = v4;

    carTestCoordinator = self->_carTestCoordinator;
  }
  if (-[CarTestCoordinator conformsToProtocol:](carTestCoordinator, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestCoordinatorProtocol))v6 = self->_carTestCoordinator;
  else
LABEL_6:
    v6 = 0;
  return (PPTTestCoordinatorProtocol *)v6;
}

- (ChromeViewController)chromeViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSceneDelegate sceneController](self, "sceneController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));

  return (ChromeViewController *)v3;
}

- (NSString)sceneIdentifier
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[CarSceneDelegate sceneType](self, "sceneType");
  if (v2 > 7)
    v3 = CFSTR(".Unknown");
  else
    v3 = off_1011C6C18[v2];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CarPlay%@"), v3);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(int64_t)a3
{
  self->_sceneType = a3;
}

- (UIScene)scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)setSceneController:(id)a3
{
  objc_storeStrong((id *)&self->_sceneController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneController, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_carTestCoordinator, 0);
  objc_storeStrong((id *)&self->_carActionController, 0);
}

@end
