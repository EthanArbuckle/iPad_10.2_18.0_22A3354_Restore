void start()
{
  dispatch_queue_global_t global_queue;
  NSObject *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  signal(15, (void (__cdecl *)(int))1);
  global_queue = dispatch_get_global_queue(21, 0);
  v1 = objc_claimAutoreleasedReturnValue(global_queue);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v1);
  dispatch_source_set_event_handler(v2, &stru_100004110);
  dispatch_activate(v2);
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("adprivacyd launched")));
  _ADLog(CFSTR("LATDLogging"), v4, 0);

  if ((_set_user_dir_suffix("com.apple.adprivacyd") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: Unable to set the temp directory. Please file a radar...")));
    _ADLog(CFSTR("iAdInternalLogging"), v5, 16);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APOdmlDatabaseConfiguration sharedInstance](APOdmlDatabaseConfiguration, "sharedInstance"));
  objc_msgSend(v6, "setProcessToDaemon");

  if (MKBDeviceUnlockedSinceBoot())
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APOdmlStoreServerContainer sharedInstance](APOdmlStoreServerContainer, "sharedInstance"));
    objc_msgSend(v7, "startListening");

  }
  v8 = +[ADAttributionService sharedInstance](ADAttributionService, "sharedInstance");
  v9 = +[ADAdTrackingSchedulingManager sharedInstance](ADAdTrackingSchedulingManager, "sharedInstance");
  if (MGGetBoolAnswer(CFSTR("apple-internal-install")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance"));
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("ResetiAdIDs"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](ADIDManager, "sharedInstance"));
      objc_msgSend(v12, "clearDSIDRecords");

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance"));
      objc_msgSend(v13, "setBool:forKey:", 0, CFSTR("ResetiAdIDs"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reset all iAd ID records.")));
      _ADLog(CFSTR("iAdIDLogging"), v14, 0);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](ADIDManager, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeDSIDRecord"));

  if (!v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](ADIDManager, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "iTunesAccountDSID"));
    objc_msgSend(v17, "setDSID:completionHandler:", v19, &stru_100004130);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("adprivacyd starting")));
  _ADLog(CFSTR("LATDLogging"), v20, 0);

  objc_autoreleasePoolPop(v3);
  dispatch_main();
}

void sub_100003508(id a1)
{
  exit(0);
}

void sub_100003518(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](ADIDManager, "sharedInstance"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "activeDSIDRecord"));

  if (v9)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "DSID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Set DSID to %@"), v2));
    _ADLog(CFSTR("LATDLogging"), v3, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADIDManager sharedInstance](ADIDManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeDSIDRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v5));
    v7 = v6;
    v8 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iTunesAccountDSID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to set DSID to %@"), v5));
    v7 = v6;
    v8 = 16;
  }
  _ADLog(CFSTR("LATDLogging"), v7, v8);

}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DSID");
}

id objc_msgSend_activeDSIDRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDSIDRecord");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_clearDSIDRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearDSIDRecords");
}

id objc_msgSend_iTunesAccountDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesAccountDSID");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setDSID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDSID:completionHandler:");
}

id objc_msgSend_setProcessToDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessToDaemon");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startListening");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}
