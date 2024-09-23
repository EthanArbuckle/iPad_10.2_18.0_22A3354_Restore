uint64_t start()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v0 = objc_autoreleasePoolPush();
  v1 = sqlite3_config(13, 96, 64);
  _ATXInitializeInOwnerProcess(v1);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004160);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ATXDistributedNotificationHandler sharedInstance](ATXDistributedNotificationHandler, "sharedInstance"));
  objc_msgSend(v2, "registerXPCHandler");

  +[ATXAssets2 onUpdateRestartThisProcess](ATXAssets2, "onUpdateRestartThisProcess");
  objc_autoreleasePoolPop(v0);
  do
  {
    v3 = objc_autoreleasePoolPush();
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v6 = objc_msgSend(v4, "runMode:beforeDate:", NSDefaultRunLoopMode, v5);

    objc_autoreleasePoolPop(v3);
  }
  while ((v6 & 1) != 0);
  return 0;
}

void sub_1000033BC(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  void *v4;
  const char *string;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint8_t buf[4];
  void *v12;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v3 = (void *)os_transaction_create("com.apple.notifyd.matching");
    v4 = objc_autoreleasePoolPush();
    string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received notifyd notification: %@", buf, 0xCu);
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.coreduetd.knowledgebase.launch.duetexpertd")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Preferences.ResetPrivacyWarningsNotification")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.spotlightui.prefschanged")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetexpertd.prefschanged")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("dmf.policy.monitor.app")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.siri.cloud.storage.deleted")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.siri.cloud.synch.changed")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetexpertd.clientModelRefreshBlendingLayer")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.managedconfiguration.restrictionchanged")) & 1) != 0|| (objc_msgSend(v6,
                          "isEqualToString:",
                          CFSTR("com.apple.managedconfiguration.managedorginfochanged")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetexpertd.updateDefaultsDueToRelevantHomeScreenConfigUpdate")) & 1) != 0|| objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ManagedConfiguration.managedAppsChanged")))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
      objc_msgSend(v7, "postNotificationName:object:", v8, 0);

      NSLog(CFSTR("--- handled event %s ---"), string);
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duet.expertcenter.appRefresh")))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Forced app predictions refresh notification", buf, 2u);
      }
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetexpertd.feedbackavailable")))
    {
      +[_PASDeviceState runBlockWhenDeviceIsClassCUnlockedWithQoS:block:](_PASDeviceState, "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:", 17, &stru_1000041A0);
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("_CalDatabaseChangedNotification")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v10, "postNotificationName:object:", EKEventStoreChangedNotification, 0);

    }
    objc_autoreleasePoolPop(v4);
    v9 = (id)objc_opt_self(v3);

  }
}

void sub_10000370C(id a1)
{
  ATXUpdatePredictionsDefaultInterval(2);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_onUpdateRestartThisProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onUpdateRestartThisProcess");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_registerXPCHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerXPCHandler");
}

id objc_msgSend_runBlockWhenDeviceIsClassCUnlockedWithQoS_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runBlockWhenDeviceIsClassCUnlockedWithQoS:block:");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}
