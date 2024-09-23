@implementation TVRDLaunchEventHandlers

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance_0;
}

void __41__TVRDLaunchEventHandlers_sharedInstance__block_invoke(id a1)
{
  TVRDLaunchEventHandlers *v1;
  void *v2;

  v1 = objc_alloc_init(TVRDLaunchEventHandlers);
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (void)setupHandlers
{
  -[TVRDLaunchEventHandlers _setupNotifydHandlers](self, "_setupNotifydHandlers");
  -[TVRDLaunchEventHandlers _setupDistnotedHandlers](self, "_setupDistnotedHandlers");
  -[TVRDLaunchEventHandlers _setupNotificationHandlers](self, "_setupNotificationHandlers");
}

- (void)_setupNotificationHandlers
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up NSNotification handlers", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_enableTVRemoteControlCenterModule", TVRXManagedConfigManagerTVRemoteAllowedTVAdded, 0);

}

- (void)_setupDistnotedHandlers
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD handler[4];
  id v7;
  id buf[2];

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up com.apple.distnoted.matching handlers", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __50__TVRDLaunchEventHandlers__setupDistnotedHandlers__block_invoke;
  handler[3] = &unk_10001C770;
  objc_copyWeak(&v7, buf);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __50__TVRDLaunchEventHandlers__setupDistnotedHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  id v5;
  NSObject *v6;
  xpc_object_t value;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  id v20;
  NSObject *WeakRetained;
  id v22;
  __int16 v23;
  __int16 v24;
  uint8_t buf[16];

  v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (string && !strcmp("tvremote.applicationRegistered", string))
  {
    v5 = _TVRDXPCLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received an application registered LaunchEvent", buf, 2u);
    }

    value = xpc_dictionary_get_value(v3, "UserInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    v9 = v8;
    if (!v8 || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_dictionary)
      goto LABEL_23;
    v10 = (void *)_CFXPCCreateCFObjectFromXPCObject(v9);
    v11 = v10;
    if (!v10)
    {
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleIDs")));
    v13 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
    {
      v20 = _TVRDXPCLog();
      WeakRetained = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
        __50__TVRDLaunchEventHandlers__setupDistnotedHandlers__block_invoke_cold_1(WeakRetained);
      goto LABEL_20;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isPlaceholder")));
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v15 & 1) == 0)
    {
      if (objc_msgSend(v12, "containsObject:", CFSTR("com.apple.TVRemote")))
      {
        v16 = _TVRDXPCLog();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 0;
          v18 = "TVRemote application registered";
          v19 = (uint8_t *)&v24;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (objc_msgSend(v12, "containsObject:", CFSTR("com.apple.Remote")))
      {
        v22 = _TVRDXPCLog();
        v17 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 0;
          v18 = "iTunes Remote application registered";
          v19 = (uint8_t *)&v23;
          goto LABEL_18;
        }
LABEL_19:

        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        -[NSObject _enableTVRemoteControlCenterModule](WeakRetained, "_enableTVRemoteControlCenterModule");
LABEL_20:

      }
    }

    goto LABEL_22;
  }
LABEL_24:

}

- (void)_setupNotifydHandlers
{
  id v3;
  NSObject *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up com.apple.notifyd.matching handlers", buf, 2u);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __48__TVRDLaunchEventHandlers__setupNotifydHandlers__block_invoke;
  handler[3] = &unk_10001C798;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

void __48__TVRDLaunchEventHandlers__setupNotifydHandlers__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  const char *v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  id v13;
  NSObject *v14;
  CFPropertyListRef v15;
  const void *v16;
  _BOOL4 v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSObject *v31;
  _BYTE v32[14];

  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string)
  {
    v4 = string;
    if (!strcmp("tvremote.TapToSetupUsed", string))
    {
      v13 = _TVRDXPCLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received tvremote.TapToSetupUsed LaunchEvent", v32, 2u);
      }

      v15 = CFPreferencesCopyValue(CFSTR("atvSetupCompleted"), CFSTR("com.apple.Sharing"), CFSTR("mobile"), kCFPreferencesCurrentHost);
      if (v15)
      {
        v16 = v15;
        v17 = CFGetInt64(v15, 0) != 0;
        CFRelease(v16);
      }
      else
      {
        v17 = 0;
      }
      v20 = _TVRDXPCLog();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 67109120;
        *(_DWORD *)&v32[4] = v17;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Value for atvSetupCompleted is %d", v32, 8u);
      }

      if (v17)
        goto LABEL_37;
    }
    else
    {
      if (!strcmp("tvremote.ContinuityKeyBoardEnabled", v4))
      {
        v18 = _TVRDXPCLog();
        v10 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          v12 = "Received tvremote.ContinuityKeyBoardEnabled LaunchEvent";
          goto LABEL_22;
        }
LABEL_23:

LABEL_37:
        objc_msgSend(*(id *)(a1 + 32), "_enableTVRemoteControlCenterModule", *(_QWORD *)v32);
        return;
      }
      if (!strcmp("tvremote.connectionRequested", v4))
      {
        v19 = _TVRDXPCLog();
        v10 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          v12 = "Received tvremote.connectionRequested LaunchEvent";
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      if (!strcmp("tvremote.dataMigrationFinished", v4))
      {
        v24 = _TVRDXPCLog();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received tvremote.dataMigrationFinished LaunchEvent", v32, 2u);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v27 = objc_msgSend(v26, "applicationIsInstalled:", CFSTR("com.apple.TVRemote"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v29 = objc_msgSend(v28, "applicationIsInstalled:", CFSTR("com.apple.Remote"));

        v30 = _TVRDXPCLog();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v32 = 67109376;
          *(_DWORD *)&v32[4] = v27;
          *(_WORD *)&v32[8] = 1024;
          *(_DWORD *)&v32[10] = v29;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Value for remoteAppInstalled is %d, iTunesRemoteAppInstalled is %d", v32, 0xEu);
        }

        if ((v27 | v29) == 1)
          goto LABEL_37;
      }
      else
      {
        if (!strcmp("tvremote.airplayTVAdded", v4) || !strcmp("tvremote.appleTVAdded", v4))
        {
          v22 = _TVRDXPCLog();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v32 = 136315138;
            *(_QWORD *)&v32[4] = v4;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received %s LaunchEvent", v32, 0xCu);
          }

          goto LABEL_37;
        }
        if (strcmp("tvremote.mdmProfileInstalled", v4))
          return;
        v5 = _TVRDXPCLog();
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v32 = 136315138;
          *(_QWORD *)&v32[4] = v4;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received %s LaunchEvent", v32, 0xCu);
        }

        v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVRXManagedConfigManager sharedInstance](TVRXManagedConfigManager, "sharedInstance"));
        v8 = objc_msgSend(v7, "isManagedConfigProfileInstalled");

        v9 = _TVRDXPCLog();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          if (v11)
          {
            *(_WORD *)v32 = 0;
            v12 = "MDM Profile installed with MCFeatureTVRemoteAllowedTVs";
LABEL_22:
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, v32, 2u);
            goto LABEL_23;
          }
          goto LABEL_23;
        }
        if (v11)
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MDM Profile installed but did not include MCFeatureTVRemoteAllowedTVs", v32, 2u);
        }

      }
    }
  }
}

- (void)_enableTVRemoteControlCenterModule
{
  id v2;
  NSObject *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD block[4];
  NSObject *v10;
  uint8_t buf[16];

  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling TVRemote module if necessary", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("AppleTVDetectionRanOnce"));
  v6 = _TVRDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Module already enabled once, bailing out without doing anything.", buf, 2u);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client requested enabling TVRemote module in Control Center", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke;
    block[3] = &unk_10001C7E8;
    v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v7 = v10;
  }

}

void __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t DeviceClass;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  DeviceClass = GestaltGetDeviceClass(a1, a2);
  if ((_DWORD)DeviceClass == 3)
  {
    v5 = objc_msgSend(objc_alloc((Class)CCSIconElementRequest), "initWithIntent:moduleIdentifier:containerBundleIdentifier:size:", 0, CFSTR("com.apple.control-center.AppleTVRemoteModule"), CFSTR("com.apple.TVRemoteUIService"), 0);
  }
  else
  {
    if (GestaltGetDeviceClass(DeviceClass, v4) != 1)
      return;
    v5 = objc_msgSend(objc_alloc((Class)CCSIconElementRequest), "initWithIntent:controlKind:controlType:extensionBundleIdentifier:containerBundleIdentifier:size:", 0, CFSTR("com.apple.TVRemoteUIService.widget.button"), 2, CFSTR("com.apple.TVRemoteUIService.TVRemoteWidget"), CFSTR("com.apple.TVRemoteUIService"), 0);
  }
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCSControlCenterService sharedInstance](CCSControlCenterService, "sharedInstance"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke_2;
    v8[3] = &unk_10001C7C0;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "handleIconElementRequest:completionHandler:", v6, v8);

  }
}

void __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = _TVRDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully added TVRemote module to Control Center", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke_2_cold_1((uint64_t)v5, v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", 1, CFSTR("AppleTVDetectionRanOnce"));
}

void __50__TVRDLaunchEventHandlers__setupDistnotedHandlers__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "bundleIDs is not an NSArray", v1, 2u);
}

void __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to add TVRemote module to Control Center %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
