@implementation MSDOSUpdaterController

+ (id)sharedInstance
{
  if (qword_100175578 != -1)
    dispatch_once(&qword_100175578, &stru_10013F988);
  return (id)qword_100175570;
}

- (MSDOSUpdaterController)init
{
  MSDOSUpdaterController *v2;
  SUManagerClient *v3;
  SUManagerClient *manager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDOSUpdaterController;
  v2 = -[MSDOSUpdaterController init](&v6, "init");
  if (v2)
  {
    v3 = (SUManagerClient *)objc_alloc_init((Class)SUManagerClient);
    manager = v2->_manager;
    v2->_manager = v3;

    -[SUManagerClient setDelegate:](v2->_manager, "setDelegate:", v2);
  }
  return v2;
}

- (BOOL)isOSUpdateInProgress
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "previousiOSBuild"));

  if (v3)
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "An OS update is already in progress!", v7, 2u);
    }

  }
  return v3 != 0;
}

- (void)startOSUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "previousiOSBuild"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getOSUpdateRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("OSVersion")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_")));

  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0));
  else
    v8 = 0;
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 1));
  -[MSDOSUpdaterController setExpectedOSVersion:](self, "setExpectedOSVersion:", v8);
  -[MSDOSUpdaterController setExpectedOSBuild:](self, "setExpectedOSBuild:", v9);
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "OSBuild"));
    v11 = objc_msgSend(v4, "isEqualToString:", v10);

    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) != 0)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v39 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "OS build number didn't change, still %{public}@, indicating a non-successful OS update.", buf, 0xCu);
      }

      objc_msgSend(v3, "clearCurrentiOSBuild");
      objc_msgSend(v3, "clearOSUpdateRequest");
      -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController startOSUpdate]", 0);
    }
    else
    {
      if (v14)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "OSBuild"));
        *(_DWORD *)buf = 138543618;
        v39 = v4;
        v40 = 2114;
        v41 = v24;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "OS build has been changed from %{public}@ to %{public}@, indicating a successful OS update.", buf, 0x16u);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      objc_msgSend(v25, "updateStage:", 14);

      v26 = sub_1000604F0();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Waiting for data migration to finish", buf, 2u);
      }

      DMPerformMigration(CFSTR("Demod is waiting for data migration to finish."));
      v28 = sub_1000604F0();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Data migration finished.", buf, 2u);
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
      objc_msgSend(v30, "startFullScreenUIWith:allowCancel:", CFSTR("IN_PROGRESS"), 1);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDConfigurationProfileManager sharedInstance](MSDConfigurationProfileManager, "sharedInstance"));
      objc_msgSend(v31, "installDefaultConfigurationProfile");

      sleep(0xB4u);
      objc_msgSend(v3, "clearCurrentiOSBuild");
      objc_msgSend(v3, "clearOSUpdateRequest");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](MSDAnalytics, "sharedInstance"));
      objc_msgSend(v32, "disableCoreAnalticsTransformSampling");

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10009B9D4;
      v36[3] = &unk_10013E320;
      v37 = v3;
      objc_msgSend(v37, "waitForBuddy:", v36);

    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
    objc_msgSend(v15, "startFullScreenUIWith:allowCancel:", CFSTR("IN_PROGRESS"), 1);

    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Wait for some extra time to make sure everything get ready for OS update.", buf, 2u);
    }

    sleep(0x1Eu);
    -[MSDOSUpdaterController cleanup](self, "cleanup");
    if (v8)
    {
      -[MSDOSUpdaterController setStarted:](self, "setStarted:", 1);
      v18 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Starting to scan for updates...", buf, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      objc_msgSend(v20, "updateStage:", 23);

      objc_msgSend(v3, "clearMinOSVersionAvailable");
      v21 = objc_alloc_init((Class)SUScanOptions);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10009B9E0;
      v35[3] = &unk_10013F9B0;
      v35[4] = self;
      v22 = objc_retainBlock(v35);
      objc_msgSend(v21, "setForced:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
      objc_msgSend(v23, "scanForUpdates:withScanResults:", v21, v22);

    }
    else
    {
      v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741032, CFSTR("OS update failed.")));
      v33 = sub_1000604F0();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "UpdateOS command was sent in an invalid format.", buf, 2u);
      }

      -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController startOSUpdate]", v21);
    }

  }
}

- (BOOL)cleanup
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[4];
  NSObject *v15;

  if (!-[MSDOSUpdaterController purged](self, "purged"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v3, "clearCurrentiOSBuild");

    v4 = dispatch_semaphore_create(0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009BB6C;
    v14[3] = &unk_10013F4B8;
    v6 = v4;
    v15 = v6;
    objc_msgSend(v5, "purgeDownload:", v14);

    v7 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      v8 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Didn't wait long enough for purge to complete.", v13, 2u);
      }

    }
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Clean up is done.", v13, 2u);
    }

    -[MSDOSUpdaterController setPurged:](self, "setPurged:", 1);
  }
  return 0;
}

- (void)bail:(const char *)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  _DWORD v26[2];

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == (id)3727741185
      || (uint64_t)objc_msgSend(v7, "code") > 3727741029 && (uint64_t)objc_msgSend(v7, "code") < 3727741034)
    {
      v8 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000CA678((uint64_t)a3, v7);

      v10 = v7;
    }
    else
    {
      v16 = sub_1000604F0();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1000CA678((uint64_t)a3, v7);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:reason:](NSError, "errorDomainMSDWithCode:message:reason:", 3727741032, CFSTR("OS update failed."), v18));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    v14 = v13;
    v15 = v7;
  }
  else
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000CA604((uint64_t)a3, v12);

    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741032, CFSTR("OS update failed.")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    v14 = v13;
    v15 = v10;
  }
  objc_msgSend(v13, "sendOSUpdateFailureEvent:", v15);

  -[MSDOSUpdaterController cleanup](self, "cleanup");
  if (objc_msgSend(v7, "code") != (id)3727741185)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
    objc_msgSend(v19, "demoUpdateFailed:", v10);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v21 = (uint64_t)objc_msgSend(v20, "timeShowingFatalError");

    if ((_DWORD)v21)
    {
      v22 = sub_1000604F0();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v26[0] = 67109120;
        v26[1] = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Override MSDTimeShowingFatalError timeout: %u", (uint8_t *)v26, 8u);
      }

    }
    else
    {
      v21 = 900;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
    v25 = objc_msgSend(v24, "setCompletionTimeForFatalError:", v21);

  }
}

- (BOOL)doesAvailableUpdateVersion:(id)a3 andUpdateBuild:(id)a4 matchExpectedUpdateVersion:(id)a5 andUpdateBuild:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unsigned int v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = 0;
  if (v9 && v11)
  {
    if (objc_msgSend(v11, "length"))
    {
      v14 = objc_msgSend(v9, "isEqualToString:", v11);
      v13 = v14;
      if (!v12 || !v14)
        goto LABEL_11;
    }
    else if (!v12)
    {
LABEL_10:
      v13 = 1;
      goto LABEL_11;
    }
    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(v10, "isEqualToString:", v12);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_11:
  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138544386;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 1024;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Does available update version (%{public}@, %{public}@) match expected update version (%{public}@, %{public}@): %{BOOL}d", (uint8_t *)&v18, 0x30u);
  }

  return v13;
}

- (void)saveAvailableOSVersion:(id)a3 andOSBuild:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = v5;
  if (v10)
  {
    if (v5)
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v10, v5));
    else
      v7 = v10;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  objc_msgSend(v9, "saveMinOSVersionAvailable:", v8);

}

- (void)scanResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  uint8_t buf[4];
  void *v51;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredDescriptor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateDescriptor"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "latestUpdate"));
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received OS update scan results:", buf, 2u);
    }

    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController prettyPrintSUDescriptor:](self, "prettyPrintSUDescriptor:", v8));
      *(_DWORD *)buf = 138543362;
      v51 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, ">> Preferred update: %{public}@", buf, 0xCu);

    }
    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController prettyPrintSUDescriptor:](self, "prettyPrintSUDescriptor:", v9));
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, ">> Alternate update: %{public}@", buf, 0xCu);

    }
    v48 = v7;

    v19 = sub_1000604F0();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController prettyPrintSUDescriptor:](self, "prettyPrintSUDescriptor:", v10));
      *(_DWORD *)buf = 138543362;
      v51 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, ">> Latest update: %{public}@", buf, 0xCu);

    }
    v22 = (void *)v10;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productVersion"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productBuildVersion"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController expectedOSVersion](self, "expectedOSVersion"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController expectedOSBuild](self, "expectedOSBuild"));
    v27 = -[MSDOSUpdaterController doesAvailableUpdateVersion:andUpdateBuild:matchExpectedUpdateVersion:andUpdateBuild:](self, "doesAvailableUpdateVersion:andUpdateBuild:matchExpectedUpdateVersion:andUpdateBuild:", v23, v24, v25, v26);

    v28 = v8;
    if ((v27 & 1) != 0)
      goto LABEL_12;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productVersion"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productBuildVersion"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController expectedOSVersion](self, "expectedOSVersion"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController expectedOSBuild](self, "expectedOSBuild"));
    v33 = -[MSDOSUpdaterController doesAvailableUpdateVersion:andUpdateBuild:matchExpectedUpdateVersion:andUpdateBuild:](self, "doesAvailableUpdateVersion:andUpdateBuild:matchExpectedUpdateVersion:andUpdateBuild:", v29, v30, v31, v32);

    v28 = v9;
    if ((v33 & 1) != 0)
    {
LABEL_12:
      v34 = v28;
      v35 = objc_alloc_init((Class)SUMutableDownloadMetadata);
      v36 = sub_1000604F0();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController prettyPrintSUDescriptor:](self, "prettyPrintSUDescriptor:", v34));
        *(_DWORD *)buf = 138543362;
        v51 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Will start to download update: %{public}@", buf, 0xCu);

      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      objc_msgSend(v39, "updateStage:", 18);

      objc_msgSend(v35, "setDownloadOnly:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[SUDownloadPolicyFactory userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:](SUDownloadPolicyFactory, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v34, 0, 1));
      objc_msgSend(v35, "setDownloadFeeAgreementStatus:", 1);
      objc_msgSend(v35, "applyDownloadPolicy:", v40);
      v41 = objc_msgSend(objc_alloc((Class)SUDownloadOptions), "initWithMetadata:andDescriptor:", v35, v34);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10009C700;
      v49[3] = &unk_10013F4B8;
      v49[4] = self;
      objc_msgSend(v42, "startDownloadWithOptions:withResult:", v41, v49);

    }
    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741030, CFSTR("Unexpected OS update version found.")));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "productVersion"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "productBuildVersion"));
      -[MSDOSUpdaterController saveAvailableOSVersion:andOSBuild:](self, "saveAvailableOSVersion:andOSBuild:", v46, v47);

      -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController scanResult:error:]", v45);
    }

    v7 = v48;
  }
  else
  {
    v43 = sub_1000604F0();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "No update found.", buf, 2u);
    }

    -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController scanResult:error:]", v7);
  }

}

- (id)prettyPrintSUDescriptor:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  uint64_t updated;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v3 = a3;
  v5 = (objc_class *)objc_opt_class(SUDescriptor, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  updated = SUStringFromUpdateType(objc_msgSend(v3, "updateType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(updated);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "humanReadableUpdateName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productSystemName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productBuildVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "releaseType"));
  v15 = objc_msgSend(v3, "downloadSize");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p] Update type: %@, Update name: %@, System name: %@, OS version: %@, Build version: %@, Release type: %@, Download size: %lld>"), v7, self, v9, v10, v11, v12, v13, v14, v15));
  return v16;
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  if (-[MSDOSUpdaterController started](self, "started", a3, a4))
    -[MSDOSUpdaterController setPurged:](self, "setPurged:", 0);
}

- (void)client:(id)a3 downloadDidFinish:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[MSDOSUpdaterController started](self, "started", a3, a4))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Downloading finished, will install it.", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009C938;
    block[3] = &unk_10013D868;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  -[MSDOSUpdaterController downloadFailed:](self, "downloadFailed:", a5, a4);
}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phase"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
  objc_msgSend(v7, "percentComplete");
  v9 = v8;

  LODWORD(v10) = v9;
  -[MSDOSUpdaterController downloadProgressChanged:withPercent:](self, "downloadProgressChanged:withPercent:", v11, v10);

}

- (void)client:(id)a3 installDidStart:(id)a4
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  if (-[MSDOSUpdaterController started](self, "started", a3, a4))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v4, "saveCurrentiOSBuild");

    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Installation started.", v7, 2u);
    }

  }
}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v6;

  v6 = a5;
  if (-[MSDOSUpdaterController started](self, "started"))
    -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController client:installDidFail:withError:]", v6);

}

- (void)client:(id)a3 installDidFinish:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  if (-[MSDOSUpdaterController started](self, "started", a3, a4))
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[MSDOSUpdaterController client:installDidFinish:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)downloadProgressChanged:(id)a3 withPercent:(float)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  double v21;

  v6 = a3;
  if (-[MSDOSUpdaterController started](self, "started"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
    v17 = 0;
    v8 = objc_msgSend(v7, "shouldCleanUp:", &v17);
    v9 = v17;

    if (v8)
    {
      -[MSDOSUpdaterController setStarted:](self, "setStarted:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
      objc_msgSend(v10, "demoUpdateFailed:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOSUpdaterController manager](self, "manager"));
      objc_msgSend(v11, "cancelDownload:", &stru_10013F9F0);

    }
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2048;
      v21 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Download/Prepare progress: %{public}@: %lf", buf, 0x16u);
    }

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("SUDownloadPhaseFetching")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
      v15 = v14;
      v16 = (uint64_t)(float)(a4 * 50.0);
LABEL_11:
      objc_msgSend(v14, "demoUpdateProgress:", v16);

      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("SUDownloadPhasePreparingForInstallation")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](MSDDemoUpdateStatusHub, "sharedInstance"));
      v15 = v14;
      v16 = (uint64_t)(float)(a4 * 50.0) + 50;
      goto LABEL_11;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

}

- (void)downloadFailed:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[MSDOSUpdaterController started](self, "started"))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Download failed.", v7, 2u);
    }

    -[MSDOSUpdaterController bail:error:](self, "bail:error:", "-[MSDOSUpdaterController downloadFailed:]", v4);
  }

}

- (NSString)expectedOSVersion
{
  return self->_expectedOSVersion;
}

- (void)setExpectedOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_expectedOSVersion, a3);
}

- (NSString)expectedOSBuild
{
  return self->_expectedOSBuild;
}

- (void)setExpectedOSBuild:(id)a3
{
  objc_storeStrong((id *)&self->_expectedOSBuild, a3);
}

- (SUManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)purged
{
  return self->_purged;
}

- (void)setPurged:(BOOL)a3
{
  self->_purged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_expectedOSBuild, 0);
  objc_storeStrong((id *)&self->_expectedOSVersion, 0);
}

@end
