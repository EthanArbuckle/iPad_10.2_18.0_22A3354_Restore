@implementation PowerModesManager

- (void)initializeAllModes
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A7CC;
  block[3] = &unk_1000145C0;
  block[4] = self;
  if (qword_10001BED0 != -1)
    dispatch_once(&qword_10001BED0, block);
}

+ (id)sharedInstance
{
  if (qword_10001BEE8 != -1)
    dispatch_once(&qword_10001BEE8, &stru_100014798);
  return (id)qword_10001BEE0;
}

- (PowerModesManager)init
{
  PowerModesManager *v2;
  uint64_t v3;
  DeviceContext *deviceContext;
  uint64_t v5;
  ResourceManager *resourceManager;
  uint64_t v7;
  PowerModesService *powerModesService;
  NSUserDefaults *v9;
  NSUserDefaults *defaults;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _QWORD block[4];
  PowerModesManager *v16;
  uint8_t buf[16];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PowerModesManager;
  v2 = -[PowerModesManager initWithMachServiceName:](&v18, "initWithMachServiceName:", CFSTR("com.apple.powerexperienced.powermodes"));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
    deviceContext = v2->_deviceContext;
    v2->_deviceContext = (DeviceContext *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[ResourceManager sharedInstance](ResourceManager, "sharedInstance"));
    resourceManager = v2->_resourceManager;
    v2->_resourceManager = (ResourceManager *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[PowerModesService sharedInstance](PowerModesService, "sharedInstance"));
    powerModesService = v2->_powerModesService;
    v2->_powerModesService = (PowerModesService *)v7;

    v9 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.powerexperienced.powermodes"));
    defaults = v2->_defaults;
    v2->_defaults = v9;

    -[PowerModesManager initializeAllModes](v2, "initializeAllModes");
    v11 = qword_10001BED8;
    if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "starting service", buf, 2u);
    }
    -[PowerModesManager setDelegate:](v2, "setDelegate:", v2);
    v12 = sub_1000090D4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AB7C;
    block[3] = &unk_1000145C0;
    v16 = v2;
    dispatch_async(v13, block);

  }
  return v2;
}

- (void)start
{
  void *v3;
  ChargeDurationPredictor *v4;
  ChargeDurationPredictor *chargingPredictor;
  id v6;

  -[PowerModesManager activate](self, "activate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager deviceContext](self, "deviceContext"));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("currentContext"), 3, 0);

  v4 = (ChargeDurationPredictor *)objc_claimAutoreleasedReturnValue(+[ChargeDurationPredictor sharedInstance](ChargeDurationPredictor, "sharedInstance"));
  chargingPredictor = self->_chargingPredictor;
  self->_chargingPredictor = v4;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PowerModesManager chargingPredictor](self, "chargingPredictor"));
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("predictorOutput"), 3, 0);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  _DWORD v14[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____PowerModesManagerProtocol));
  objc_msgSend(v5, "setExportedInterface:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.powerexperience.powermode.update")));
  if (v7
    && (v8 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && objc_msgSend(v7, "BOOLValue"))
  {
    v9 = (void *)qword_10001BED8;
    if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      v14[0] = 67109120;
      v14[1] = objc_msgSend(v5, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PowerModesManager: listener: accepted new connection from pid %d", (uint8_t *)v14, 8u);

    }
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
    v11 = 1;
  }
  else
  {
    v12 = (void *)qword_10001BED8;
    if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_ERROR))
      sub_10000D424(v12, v5);
    v11 = 0;
  }

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PowerModesManager *v13;

  v7 = a5;
  v8 = sub_1000090D4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AE70;
  v11[3] = &unk_100014520;
  v12 = v7;
  v13 = self;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)evaluatePowerModes
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = sub_1000090D4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager deviceContext](self, "deviceContext"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentContext"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager resourceManager](self, "resourceManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resourceHints"));

  -[PowerModesManager evaluatePowerModes:withContext:](self, "evaluatePowerModes:withContext:", v7, v8);
}

- (void)evaluatePowerModes:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  id v35;
  id v36;
  dispatch_time_t when;
  id v38;
  _QWORD block[4];
  NSObject *v40;
  PowerModesManager *v41;
  NSObject *v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;

  v6 = a3;
  v38 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager overridePresent](self, "overridePresent"));

  if (!v7)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (!v11)
      goto LABEL_26;
    v12 = v11;
    v13 = *(_QWORD *)v45;
    v36 = v6;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v15));

        if ((objc_msgSend(v17, "isEnabled") & 1) == 0)
        {
          v26 = (void *)qword_10001BED8;
          if (!os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_INFO))
            goto LABEL_22;
          v21 = v26;
          v27 = (objc_class *)objc_opt_class(v17);
          v28 = NSStringFromClass(v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          *(_DWORD *)buf = 138412290;
          v50 = v29;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ is disabled. Skipping evaluation", buf, 0xCu);

          goto LABEL_18;
        }
        if ((objc_msgSend(v17, "isSupportedPlatform") & 1) != 0)
        {
          if (objc_msgSend(v17, "evaluatePowerModeWithResourceHints:andContext:", v6, v38))
          {
            if ((objc_msgSend(v17, "getState") & 1) != 0)
              goto LABEL_22;
            objc_msgSend(v17, "getEntryDelay");
            v19 = v18;
            v20 = v17;
            v21 = v20;
            if (v19 <= 0.0)
            {
              -[PowerModesManager enterMode:](self, "enterMode:", v20);
            }
            else if ((-[NSObject pendingDelayedEntryTimer](v20, "pendingDelayedEntryTimer") & 1) == 0)
            {
              when = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v19 * 1000000000.0));
              v22 = sub_1000090D4();
              v23 = objc_claimAutoreleasedReturnValue(v22);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10000B3A4;
              block[3] = &unk_1000147C0;
              v40 = v21;
              v41 = self;
              v24 = v40;
              v42 = v24;
              v43 = v19;
              dispatch_after(when, v23, block);

              v25 = v24;
              v6 = v36;
              -[NSObject setPendingDelayedEntryTimer:](v25, "setPendingDelayedEntryTimer:", 1);

            }
LABEL_18:

            goto LABEL_22;
          }
          -[PowerModesManager exitMode:](self, "exitMode:", v17);
        }
        else
        {
          v30 = (void *)qword_10001BED8;
          if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_INFO))
          {
            v31 = v30;
            v32 = (objc_class *)objc_opt_class(v17);
            v33 = NSStringFromClass(v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
            *(_DWORD *)buf = 138412290;
            v50 = v34;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@ is not supported on this platform. Skipping evaluation", buf, 0xCu);

          }
        }
LABEL_22:

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v35 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v12 = v35;
      if (!v35)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
  }
  v8 = (void *)qword_10001BED8;
  if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager overridePresent](self, "overridePresent"));
    *(_DWORD *)buf = 138412290;
    v50 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Override present. Skipping evaluation. Please exit %@ mode using powerexperienceutil", buf, 0xCu);

    goto LABEL_26;
  }
LABEL_27:

}

- (void)enterMode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  char **v9;
  void *i;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  objc_class *v23;
  NSString *v24;
  char **v25;
  void *v26;
  void *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  double v31;
  double v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  NSObject *v39;
  double v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  dispatch_time_t v46;
  id v47;
  NSObject *v48;
  PowerModesManager *v49;
  _QWORD block[4];
  id v51;
  PowerModesManager *v52;
  double v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  double v61;
  _BYTE v62[128];

  v4 = a3;
  if ((objc_msgSend(v4, "getState") & 1) == 0)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v55;
      v9 = &selRef_predictionQueryQueue;
      v49 = self;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v12 = (objc_class *)objc_opt_class(v4);
          v13 = NSStringFromClass(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = objc_msgSend(v11, "isEqualToString:", v14);

          if ((v15 & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v11));

            if (objc_msgSend(v17, "getState")
              && objc_msgSend(v17, "isEnabled")
              && objc_msgSend(v17, "isSupportedPlatform"))
            {
              v18 = v9[475];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = v18;
                v20 = (objc_class *)objc_opt_class(v17);
                v21 = NSStringFromClass(v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                v23 = (objc_class *)objc_opt_class(v4);
                v24 = NSStringFromClass(v23);
                v25 = v9;
                v26 = (void *)objc_claimAutoreleasedReturnValue(v24);
                *(_DWORD *)buf = 138412546;
                v59 = v22;
                v60 = 2112;
                v61 = *(double *)&v26;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "exiting mode %@ before entering %@", buf, 0x16u);

                v9 = v25;
                self = v49;

              }
              -[PowerModesManager exitMode:](self, "exitMode:", v17);
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "enterPowerMode");
    if (objc_msgSend(v4, "getState"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModesService](self, "powerModesService"));
      v28 = (objc_class *)objc_opt_class(v4);
      v29 = NSStringFromClass(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      objc_msgSend(v27, "updateClientsforMode:withState:", v30, 1);

      objc_msgSend(v4, "getMaxEngagementDuration");
      if (v31 != 0.0)
      {
        v32 = v31;
        v33 = (objc_class *)objc_opt_class(v4);
        v34 = NSStringFromClass(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager getSavedExitDate:](self, "getSavedExitDate:", v35));

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
          v38 = objc_msgSend(v36, "isEqualToDate:", v37);

          if ((v38 & 1) == 0)
          {
            v39 = qword_10001BED8;
            if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v36;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Saved exit date %@", buf, 0xCu);
            }
            objc_msgSend(v36, "timeIntervalSinceNow");
            v32 = v40;
          }
        }
        v41 = (void *)qword_10001BED8;
        if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
        {
          v42 = v41;
          v43 = (objc_class *)objc_opt_class(v4);
          v44 = NSStringFromClass(v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          *(_DWORD *)buf = 138412546;
          v59 = v45;
          v60 = 2048;
          v61 = v32;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Setting a timer to exit %@ after %f seconds", buf, 0x16u);

        }
        v46 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v32 * 1000000000.0));
        v47 = sub_1000090D4();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000B988;
        block[3] = &unk_1000143B8;
        v53 = v32;
        v51 = v4;
        v52 = self;
        dispatch_after(v46, v48, block);

      }
    }
    -[PowerModesManager saveState](self, "saveState");
  }

}

- (void)exitMode:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "getState");
  v5 = v10;
  if (v4)
  {
    objc_msgSend(v10, "exitPowerMode");
    if ((objc_msgSend(v10, "getState") & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModesService](self, "powerModesService"));
      v7 = (objc_class *)objc_opt_class(v10);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v6, "updateClientsforMode:withState:", v9, 0);

    }
    -[PowerModesManager saveState](self, "saveState");
    v5 = v10;
  }

}

- (void)saveState
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _BYTE v30[128];

  v3 = sub_1000090D4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
          if (objc_msgSend(v11, "getState"))
          {
            objc_msgSend(v11, "getMaxEngagementDuration");
            if (v13 != 0.0)
            {
              objc_msgSend(v11, "getMaxEngagementDuration");
              v14 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:"));

              v12 = (void *)v14;
            }
          }
          v28[0] = CFSTR("state");
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v11, "getState")));
          v29[0] = v15;
          v28[1] = CFSTR("enabled");
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v11, "isEnabled")));
          v28[2] = CFSTR("exitDate");
          v29[1] = v16;
          v29[2] = v12;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));

          v18 = (objc_class *)objc_opt_class(v11);
          v19 = NSStringFromClass(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, v20);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v6);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager defaults](self, "defaults"));
  objc_msgSend(v21, "setValue:forKey:", v23, CFSTR("modes"));

}

- (void)restoreState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = sub_1000090D4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager defaults](self, "defaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("modes")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager getModeFromName:](self, "getModeFromName:", v12));
          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
            objc_msgSend(v14, "restoreState:", v15);

            if (objc_msgSend(v14, "getState"))
              -[PowerModesManager enterMode:](self, "enterMode:", v14);
            else
              -[PowerModesManager exitMode:](self, "exitMode:", v14);
          }

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)clearState
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = qword_10001BED8;
  if (os_log_type_enabled((os_log_t)qword_10001BED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing state after a reboot", v7, 2u);
  }
  v4 = sub_1000090D4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager defaults](self, "defaults"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("modes"));

}

- (id)getSavedExitDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager defaults](self, "defaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("modes")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("exitDate")));

  return v8;
}

- (id)getModeFromName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)disablePowerMode:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000090D4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C1B8;
  block[3] = &unk_1000147E8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)enablePowerMode:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000090D4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C310;
  block[3] = &unk_1000147E8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)updatePowerMode:(id)a3 withState:(BOOL)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v10 = sub_1000090D4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C46C;
  v14[3] = &unk_100014810;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (void)updateAllowOnCharger:(id)a3 withState:(BOOL)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v10 = sub_1000090D4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C6BC;
  v14[3] = &unk_100014810;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (void)updateEntryDelay:(id)a3 withDelay:(double)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  v10 = sub_1000090D4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C7F4;
  v14[3] = &unk_100014838;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (void)updateMaxEngagementDuration:(id)a3 withDuration:(double)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  v10 = sub_1000090D4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C924;
  v14[3] = &unk_100014838;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (NSMutableDictionary)powerModes
{
  return self->_powerModes;
}

- (void)setPowerModes:(id)a3
{
  objc_storeStrong((id *)&self->_powerModes, a3);
}

- (DeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
  objc_storeStrong((id *)&self->_deviceContext, a3);
}

- (ResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (void)setResourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_resourceManager, a3);
}

- (PowerModesService)powerModesService
{
  return self->_powerModesService;
}

- (void)setPowerModesService:(id)a3
{
  objc_storeStrong((id *)&self->_powerModesService, a3);
}

- (ChargeDurationPredictor)chargingPredictor
{
  return self->_chargingPredictor;
}

- (void)setChargingPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_chargingPredictor, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSString)overridePresent
{
  return self->_overridePresent;
}

- (void)setOverridePresent:(id)a3
{
  objc_storeStrong((id *)&self->_overridePresent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridePresent, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_chargingPredictor, 0);
  objc_storeStrong((id *)&self->_powerModesService, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_powerModes, 0);
}

@end
