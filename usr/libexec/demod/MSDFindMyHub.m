@implementation MSDFindMyHub

+ (id)sharedInstance
{
  if (qword_100175338 != -1)
    dispatch_once(&qword_100175338, &stru_10013EA88);
  return (id)qword_100175330;
}

- (void)handleEnrollmentRetryUponFirstLaunch
{
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  NSObject *v27;
  const char *v28;
  id v29;
  uint8_t v30[14];
  __int16 v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v4 = objc_msgSend(v3, "typeOfDemoDevice");

  v31 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v6 = objc_msgSend(v5, "isDemoEligible");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getDemoEnrollmentFlag"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("enrollmentSuccess"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](MSDDemoUpdateController, "sharedInstance"));
  objc_msgSend(v10, "getDemoUpdateInProgress:operationAllowed:", (char *)&v31 + 1, &v31);

  if ((v6 & 1) == 0)
  {
    v14 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      v13 = "Device is not demo eligible, skipping enrollment retry";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (v4 == (id)3)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      v13 = "Device is factory demo SKU device; skipping enrollment retry";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v30, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    v15 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_WORD *)v30 = 0;
    v13 = "Device is already enrolled; skipping enrollment retry";
    goto LABEL_7;
  }
  if (HIBYTE(v31))
  {
    v16 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_WORD *)v30 = 0;
    v13 = "Content update is in progress, skipping enrollment retry";
    goto LABEL_7;
  }
  if (v4 != (id)5)
  {
    v26 = sub_1000604F0();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      v28 = "Unconditionally retry enrollment upon first launch!";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, v30, 2u);
    }
LABEL_26:

    -[MSDFindMyHub retryEnrollmentWithHub:](self, "retryEnrollmentWithHub:", 1);
    return;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v18 = objc_msgSend(v17, "findMyHubRetryAtTime");

  if ((uint64_t)v18 <= 0)
  {
    v29 = sub_1000604F0();
    v27 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      v28 = "No FMH retry time set? Retry enrollment anyways.";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v19, "timeIntervalSinceDate:", v20);
  v22 = v21;

  v23 = sub_1000604F0();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v22 <= 300.0)
  {
    if (v25)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "FMH retry timer is already expired or is about to expire. Retry now!", v30, 2u);
    }

    -[MSDFindMyHub retryEnrollmentWithHub:](self, "retryEnrollmentWithHub:", 1);
  }
  else
  {
    if (v25)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "FMH retry timer will be scheduled.", v30, 2u);
    }

    -[MSDFindMyHub scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:](self, "scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:", v19, 1);
  }

}

- (void)setAutoEnrollmentInfo:(double)a3 withStoreId:(id)a4 withHelpMenuRowSelection:(id)a5
{
  NSString *v8;
  NSSet *v9;
  NSString *autoEnrollmentStoreId;
  NSSet *helpMenuUserTapped;
  NSString *v12;

  v8 = (NSString *)a4;
  v9 = (NSSet *)a5;
  self->_autoEnrollmentTimeStamp = a3;
  autoEnrollmentStoreId = self->_autoEnrollmentStoreId;
  self->_autoEnrollmentStoreId = v8;
  v12 = v8;

  helpMenuUserTapped = self->_helpMenuUserTapped;
  self->_helpMenuUserTapped = v9;

}

- (BOOL)discoverAndEnrollWithHub:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSString *autoEnrollmentStoreId;
  NSSet *helpMenuUserTapped;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableString *storesSearched;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  unsigned int v22;
  id v23;
  id v24;
  unsigned int v25;
  id v26;
  unsigned int v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  NSObject *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  unsigned int v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t v48[8];
  id v49;
  id v50;
  id v51;
  id v52;
  char v53;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v6 = objc_msgSend(v5, "typeOfDemoDevice");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[MSDFindMyHub setIsLogicSync:](self, "setIsLogicSync:", 0);
  if (v6 == (id)5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", self->_autoEnrollmentTimeStamp));
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("AutoEnrollmentTimeStamp"));

    autoEnrollmentStoreId = self->_autoEnrollmentStoreId;
    if (autoEnrollmentStoreId)
      objc_msgSend(v7, "setObject:forKey:", autoEnrollmentStoreId, CFSTR("AutoEnrollmentSelectedStoreID"));
    helpMenuUserTapped = self->_helpMenuUserTapped;
    if (helpMenuUserTapped)
      objc_msgSend(v7, "setObject:forKey:", helpMenuUserTapped, CFSTR("AutoEnrollmentHelpMenuUserTapped"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getCurrentDeviceLanguage"));
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("AutoEnrollmentLanguageCodeInfo"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getCurrentDeviceRegion"));
    objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("AutoEnrollmentCountryCodeInfo"));

    storesSearched = self->_storesSearched;
    if (storesSearched)
      objc_msgSend(v7, "setObject:forKey:", storesSearched, CFSTR("AutoEnrollmentStoresSearchedInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCellularHelper sharedInstance](MSDCellularHelper, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getCellularSimInfo"));

    if (!v17)
      v17 = (void *)objc_opt_new(NSArray, v18);
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("AutoEnrollmentNetworkInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getCurrentWiFiSsid"));

    if (v20)
      v21 = (__CFString *)v20;
    else
      v21 = &stru_100141020;
    objc_msgSend(v7, "setObject:forKey:", v21, CFSTR("AutoEnrollmentWiFiSSID"));

  }
  v53 = 0;
  v52 = 0;
  v22 = -[MSDFindMyHub verifyDeviceEligibility:error:](self, "verifyDeviceEligibility:error:", &v53, &v52);
  v23 = v52;
  v24 = v23;
  if (!v22)
    goto LABEL_28;
  if (!v53)
  {
    v35 = sub_1000604F0();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_1000C00D8();

    v51 = v24;
    sub_1000B63A4(&v51, 3727740941, (uint64_t)CFSTR("Device is not eligible for demo program."));
    v26 = v51;

    goto LABEL_27;
  }
  v50 = v23;
  v25 = -[MSDFindMyHub askFindMyHubForHubInfo:](self, "askFindMyHubForHubInfo:", &v50);
  v26 = v50;

  if (!v25)
  {
LABEL_27:
    v24 = v26;
    goto LABEL_28;
  }
  v49 = v26;
  v27 = -[MSDFindMyHub enrollAndSetup:](self, "enrollAndSetup:", &v49);
  v24 = v49;

  if (!v27)
  {
LABEL_28:
    if (a3)
      *a3 = objc_retainAutorelease(v24);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    v38 = objc_msgSend(v37, "isOfflineMode");

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
      v40 = objc_msgSend(v39, "cachedBundleInstallAttempted");

      if ((v40 & 1) != 0)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
        v42 = objc_msgSend(v41, "dcotaOfflineModeDevice");

        if (v42)
          -[MSDFindMyHub setupOfflineModeEnrollmentRetry](self, "setupOfflineModeEnrollmentRetry");
      }
      else
      {
        v43 = sub_1000604F0();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v48 = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Installing cached bundle from enrollment failure", v48, 2u);
        }

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
        objc_msgSend(v45, "kickOffCachedBundleInstall");

      }
    }
    if (v6 != (id)5)
    {
      v28 = 0;
      goto LABEL_23;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    objc_msgSend(v7, "setObject:forKey:", v46, CFSTR("AutoEnrollmentStatus"));

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v24, "code")));
    objc_msgSend(v7, "setObject:forKey:", v47, CFSTR("ErrorCode"));

    v28 = 0;
LABEL_20:
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedDescription"));
    objc_msgSend(v7, "setObject:forKey:", v32, CFSTR("ErrorMessage"));

    goto LABEL_21;
  }
  if (v6 != (id)5)
  {
    v28 = 1;
    goto LABEL_23;
  }
  v28 = 1;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v7, "setObject:forKey:", v29, CFSTR("AutoEnrollmentStatus"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v24, "code")));
  objc_msgSend(v7, "setObject:forKey:", v30, CFSTR("ErrorCode"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedDescription"));
  if (v31)
    goto LABEL_20;
LABEL_21:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
  objc_msgSend(v33, "sendAutoEnrollmentResults:", v7);

LABEL_23:
  return v28;
}

- (unint64_t)queryFindMyHubAndDetermineLogicSyncResult
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  NSObject *v6;
  int v8;
  unint64_t v9;

  -[MSDFindMyHub setIsLogicSync:](self, "setIsLogicSync:", 1);
  if (-[MSDFindMyHub askFindMyHubForHubInfo:](self, "askFindMyHubForHubInfo:", 0))
  {
    if (-[MSDFindMyHub compareSavedHubHostNameWithNewHostName](self, "compareSavedHubHostNameWithNewHostName"))
      v3 = 0;
    else
      v3 = 2;
    if (-[MSDFindMyHub compareSavedHubHostsWithNewHosts](self, "compareSavedHubHostsWithNewHosts"))
      v4 = v3;
    else
      v4 = v3 | 4;
  }
  else
  {
    v4 = 0;
  }
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Logic sync completed with result - %lu", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (void)checkInWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  MSDCheckInRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checking in device with DU...", buf, 2u);
  }

  v7 = objc_alloc_init(MSDCheckInRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSVersion"));
  -[MSDCheckInRequest setOsVersion:](v7, "setOsVersion:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serialNumber"));
  -[MSDCheckInRequest setSerialNumber:](v7, "setSerialNumber:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getCurrentDeviceLanguage"));
  -[MSDCheckInRequest setLanguage:](v7, "setLanguage:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getCurrentDeviceRegion"));
  -[MSDCheckInRequest setCountryCode:](v7, "setCountryCode:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  -[MSDCheckInRequest setHasFactoryContent:](v7, "setHasFactoryContent:", objc_msgSend(v16, "typeOfDemoDevice") == (id)5);

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "demoUnitServerURL"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "host"));
      -[MSDCommandServerRequest setServer:](v7, "setServer:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "port"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
      -[MSDCommandServerRequest setPort:](v7, "setPort:", v21);

      -[MSDDemoUnitServerRequest setUrlOverride:](v7, "setUrlOverride:", v18);
    }

  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100053FD8;
  v24[3] = &unk_10013EAB0;
  v25 = v4;
  v22 = v4;
  -[MSDServerRequest setCompletion:](v7, "setCompletion:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  objc_msgSend(v23, "handleRequestAsync:", v7);

}

- (void)markAsNotDemoWithCompletion:(id)a3
{
  id v4;
  MSDNotDemoRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MSDNotDemoRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  -[MSDNotDemoRequest setSerialNumber:](v5, "setSerialNumber:", v7);

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "demoUnitServerURL"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "host"));
      -[MSDCommandServerRequest setServer:](v5, "setServer:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "port"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
      -[MSDCommandServerRequest setPort:](v5, "setPort:", v12);

      -[MSDDemoUnitServerRequest setUrlOverride:](v5, "setUrlOverride:", v9);
    }

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000542AC;
  v15[3] = &unk_10013EAB0;
  v16 = v4;
  v13 = v4;
  -[MSDServerRequest setCompletion:](v5, "setCompletion:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  objc_msgSend(v14, "handleRequestAsync:", v5);

}

- (void)searchStoreWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MSDStoreSearchRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MSDStoreSearchRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Longitude")));
  -[MSDStoreSearchRequest setLongitude:](v8, "setLongitude:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Latitude")));
  -[MSDStoreSearchRequest setLatitude:](v8, "setLatitude:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Text")));
  -[MSDStoreSearchRequest setText:](v8, "setText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("MaxResults")));
  -[MSDStoreSearchRequest setMaxStoreResults:](v8, "setMaxStoreResults:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest text](v8, "text"));
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub storesSearched](self, "storesSearched"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreSearchRequest text](v8, "text"));
    objc_msgSend(v15, "appendString:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub storesSearched](self, "storesSearched"));
    objc_msgSend(v17, "appendString:", CFSTR(","));

  }
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "demoUnitServerURL"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "host"));
      -[MSDCommandServerRequest setServer:](v8, "setServer:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "port"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringValue"));
      -[MSDCommandServerRequest setPort:](v8, "setPort:", v22);

      -[MSDDemoUnitServerRequest setUrlOverride:](v8, "setUrlOverride:", v19);
    }

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100054588;
  v25[3] = &unk_10013EAB0;
  v26 = v6;
  v23 = v6;
  -[MSDServerRequest setCompletion:](v8, "setCompletion:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  objc_msgSend(v24, "handleRequestAsync:", v8);

}

- (void)setupOfflineModeEnrollmentRetry
{
  MSDFindMyHub *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCellularHelper sharedInstance](MSDCellularHelper, "sharedInstance"));
  v4 = objc_msgSend(v3, "hasObserver:", v2);

  if ((v4 & 1) == 0)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting cellular plan monitor for enrollment retry", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCellularHelper sharedInstance](MSDCellularHelper, "sharedInstance"));
    objc_msgSend(v7, "addObserver:", v2);

  }
  objc_sync_exit(v2);

}

- (void)cellularPlanDidChange:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v6 = objc_msgSend(v5, "dcotaOfflineModeDevice");

  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "objectForKey:", CFSTR("SimType")));
          if (objc_msgSend(v12, "isEqualToNumber:", &off_10014D940))
          {
            global_queue = dispatch_get_global_queue(21, 0);
            v14 = objc_claimAutoreleasedReturnValue(global_queue);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100054898;
            block[3] = &unk_10013D868;
            block[4] = self;
            dispatch_async(v14, block);

            goto LABEL_12;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (int64_t)getDefaultRetryDelay
{
  void *v2;
  int64_t v3;
  id v4;
  NSObject *v5;
  int v7;
  int64_t v8;

  if (!os_variant_has_internal_content("com.apple.mobilestoredemod"))
    return 3600;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
  v3 = (int64_t)objc_msgSend(v2, "findMyHubRetryDelay");

  if (v3 < 1)
    return 3600;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Overriding FMH retry delay to: %ld", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (BOOL)verifyDeviceEligibility:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t *v22;
  BOOL v23;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  dispatch_semaphore_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_100054D78;
  v36 = sub_100054D88;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100054D78;
  v30 = sub_100054D88;
  v31 = dispatch_semaphore_create(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("DemoEligible")));

  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Verifying device eligibility...", buf, 2u);
  }

  if (v8)
  {
    *a3 = objc_msgSend(v8, "BOOLValue");
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *a3;
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DU CheckIn completed, eligibility is %d", buf, 8u);
    }

  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100054D90;
    v25[3] = &unk_10013EAD8;
    v25[4] = &v32;
    v25[5] = &v26;
    v25[6] = a3;
    -[MSDFindMyHub checkInWithCompletion:](self, "checkInWithCompletion:", v25);
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Waiting for CheckIn to complete...", buf, 2u);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)v27[5], 0xFFFFFFFFFFFFFFFFLL);
    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *a3;
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CheckIn to completed; eligibility is %{BOOL}d",
        buf,
        8u);
    }

    if (v33[5])
    {
      v19 = sub_1000604F0();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v33[5];
        *(_DWORD *)buf = 136315394;
        v39 = "-[MSDFindMyHub verifyDeviceEligibility:error:]";
        v40 = 2114;
        v41 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: checkIn failed with error: %{public}@", buf, 0x16u);
      }

      -[MSDFindMyHub tryScheduleDefaultEnrollmentRetry](self, "tryScheduleDefaultEnrollmentRetry");
    }
  }
  v22 = v33;
  if (a4)
  {
    *a4 = objc_retainAutorelease((id)v33[5]);
    v22 = v33;
  }
  v23 = v22[5] == 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v23;
}

- (BOOL)askFindMyHubForHubInfo:(id *)a3
{
  MSDFMHRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  double v63;
  id v64;
  id v65;
  NSObject *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  id v82;

  v5 = objc_alloc_init(MSDFMHRequest);
  -[MSDFMHRequest setLogicSync:](v5, "setLogicSync:", -[MSDFindMyHub isLogicSync](self, "isLogicSync"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub prepareBundleInfoDictionary](self, "prepareBundleInfoDictionary"));
  -[MSDFMHRequest setBundleInfo:](v5, "setBundleInfo:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub prepareHubOfflineDurationString](self, "prepareHubOfflineDurationString"));
  -[MSDFMHRequest setOfflineDuration:](v5, "setOfflineDuration:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getCurrentDeviceLanguage"));
  -[MSDFMHRequest setLanguage:](v5, "setLanguage:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getCurrentDeviceRegion"));
  -[MSDFMHRequest setCountryCode:](v5, "setCountryCode:", v11);

  if (!-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferredStoreID"));
    -[MSDFMHRequest setStoreId:](v5, "setStoreId:", v13);

  }
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "demoUnitServerURL"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "host"));
      -[MSDCommandServerRequest setServer:](v5, "setServer:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "port"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
      -[MSDCommandServerRequest setPort:](v5, "setPort:", v18);

      -[MSDDemoUnitServerRequest setUrlOverride:](v5, "setUrlOverride:", v15);
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "handleRequestSync:", v5));

  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "error"));
  if (v22 || (v23 = objc_opt_class(MSDFMHResponse, v21), (objc_opt_isKindOfClass(v20, v23) & 1) == 0))
  {
    v46 = sub_1000604F0();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_1000C0250((uint64_t)v22, v47, v48, v49, v50, v51, v52, v53);

    v24 = 0;
    goto LABEL_25;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "retryAfter"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fmhDict"));
  v26 = sub_1000604F0();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v80 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "FindMyHub returned: %{public}@", buf, 0xCu);
  }

  if (!v25)
  {
    if (v24 && (uint64_t)objc_msgSend(v24, "integerValue") >= 1)
    {
      v59 = sub_1000604F0();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v80 = (uint64_t)v24;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "FindMyHub asked for retry in %{public}@ seconds.", buf, 0xCu);
      }

      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)objc_msgSend(v24, "integerValue")));
      if (!-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
        -[MSDFindMyHub scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:](self, "scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:", v61, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
      objc_msgSend(v61, "timeIntervalSinceReferenceDate");
      objc_msgSend(v62, "saveFindMyHubRetryAtTime:", (uint64_t)v63);

      if ((uint64_t)objc_msgSend(v24, "integerValue") >= 31536000)
      {
        v65 = sub_1000604F0();
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          v67 = objc_msgSend(v24, "integerValue");
          *(_DWORD *)buf = 134218240;
          v80 = 31536000;
          v81 = 2048;
          v82 = v67;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "FindMyHub retry value %lu is greater than or equal to threshold %lu, returning unrecoverable error", buf, 0x16u);
        }

        v22 = 0;
      }
      else
      {
        v78 = 0;
        sub_1000B63A4(&v78, 3727740936, (uint64_t)CFSTR("Server requested retry at a later time."));
        v22 = v78;

      }
      goto LABEL_26;
    }
LABEL_25:
    -[MSDFindMyHub tryScheduleDefaultEnrollmentRetry](self, "tryScheduleDefaultEnrollmentRetry");
LABEL_26:
    v54 = sub_1000604F0();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_1000C0104();
    v25 = 0;
    v40 = 0;
    v30 = 0;
    v33 = 0;
    goto LABEL_29;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  objc_msgSend(v28, "saveFindMyHubRetryAtTime:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("URL")));
  if (!v30 || (v31 = objc_opt_class(NSString, v29), (objc_opt_isKindOfClass(v30, v31) & 1) == 0))
  {
    v68 = sub_1000604F0();
    v55 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_1000C0130(v55, v69, v70, v71, v72, v73, v74, v75);
    v40 = 0;
    v33 = 0;
    goto LABEL_45;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v30));
  v33 = v32;
  if (!v32 || (v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "host")), v34, !v34))
  {
    v64 = sub_1000604F0();
    v55 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_1000C01A0((uint64_t)v30, v55);
    v40 = 0;
    goto LABEL_45;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "host"));
  -[MSDFindMyHub setHubHostName:](self, "setHubHostName:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubHostName](self, "hubHostName"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v36));
  -[MSDFindMyHub setServerList:](self, "setServerList:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "port"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringValue"));
  -[MSDFindMyHub setHubPort:](self, "setHubPort:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("device_info")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubHostName](self, "hubHostName"));

  if (!v41)
  {
    v76 = sub_1000604F0();
    v55 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_1000C0224();
LABEL_45:
    v22 = 0;
LABEL_29:

    if (a3)
    {
      v77 = v22;
      sub_1000B6428(&v77, 3727744512, CFSTR("Cannot enroll the device with DemoUnit."));
      v56 = v77;

      v22 = objc_retainAutorelease(v56);
      *a3 = v22;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    objc_msgSend(v57, "sendFMHFailureEvent:", v22);
    v45 = 0;
    goto LABEL_32;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubPort](self, "hubPort"));

  if (!v42)
    -[MSDFindMyHub setHubPort:](self, "setHubPort:", CFSTR("443"));
  if (v40)
  {
    v44 = objc_opt_class(NSNull, v43);
    if ((objc_opt_isKindOfClass(v40, v44) & 1) == 0)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](MSDNPIMaskValues, "sharedInstance"));
      objc_msgSend(v57, "saveDeviceInfo:", v40);
      v22 = 0;
      v45 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }
  v22 = 0;
  v45 = 1;
LABEL_33:

  return v45;
}

- (id)prepareBundleInfoDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  int v16;
  id v17;

  v3 = objc_alloc_init((Class)NSDictionary);
  if (!-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    v5 = objc_msgSend(v4, "typeOfDemoDevice");

    if (v5 == (id)5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readPlistFile:", CFSTR("/private/var/demo_backup/Metadata/Content.plist")));

      v3 = (id)v7;
      if (!v7)
      {
        v8 = sub_1000604F0();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_1000C02E0();

        v3 = objc_alloc_init((Class)NSDictionary);
      }
      if (!+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v3))
      {
        v10 = sub_1000604F0();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1000C02B4();

        v12 = objc_alloc_init((Class)NSDictionary);
        v3 = v12;
      }
    }
  }
  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Bundle Info for FindMyHub: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  return v3;
}

- (id)prepareHubOfflineDurationString
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v18;

  if (-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    v4 = (uint64_t)objc_msgSend(v3, "hubLastOnlineTime");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;

    if (v4 < 1 || (v8 = (uint64_t)v7 - v4, (uint64_t)v7 <= v4))
    {
      v9 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to calculate hub last online time. Use system-up time instead.", buf, 2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      objc_msgSend(v11, "systemUptime");
      v8 = (uint64_t)v12;

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v8));
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Hub has been offline for %{public}@ seconds.", buf, 0xCu);
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)scheduleRetryTimerForEnrollmentAtDate:(id)a3 isFirstLaunch:(BOOL)a4
{
  id v5;
  _QWORD block[4];
  id v7;
  MSDFindMyHub *v8;
  BOOL v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055960;
  block[3] = &unk_10013EB00;
  v9 = a4;
  v7 = a3;
  v8 = self;
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)handleRetryTimerFireForEnrollment:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  unsigned __int8 v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("isFirstLaunch")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "demoUpdateQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100055C34;
  v9[3] = &unk_10013EB28;
  v9[4] = self;
  v10 = v6;
  dispatch_async(v8, v9);

}

- (void)retryEnrollmentWithHub:(BOOL)a3
{
  _BOOL4 v3;
  MSDFindMyHub *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
  v6 = objc_msgSend(v5, "isOfflineMode");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getDemoEnrollmentFlag"));

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("enrollmentSuccess")))
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enrollment successful, ignoring enrollment retry", buf, 2u);
    }
  }
  else
  {
    if ((v6 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
      objc_msgSend(v11, "startFullScreenUIWith:allowCancel:", CFSTR("IN_PROGRESS"), 0);

    }
    if (v3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      objc_msgSend(v12, "configureNetworkInterface");

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      objc_msgSend(v13, "waitForNetworkReachability");

    }
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getDemoEnrollmentFlag"));
      *(_DWORD *)buf = 136315394;
      v26 = "-[MSDFindMyHub retryEnrollmentWithHub:]";
      v27 = 2114;
      v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: requesting discoverAndEnrollWithHub, currentEnrollFlag:%{public}@", buf, 0x16u);

    }
    v24 = 0;
    v18 = -[MSDFindMyHub discoverAndEnrollWithHub:](v4, "discoverAndEnrollWithHub:", &v24);
    v10 = v24;
    if (v18)
    {
      -[MSDFindMyHub cancelOfflineModeEnrollmentRetry](v4, "cancelOfflineModeEnrollmentRetry");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      objc_msgSend(v19, "setDemoEnrollmentFlag:", CFSTR("enrollmentSuccess"));

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](v4, "device"));
      objc_msgSend(v20, "setDemoEnrollmentFlag:", CFSTR("enrollmentFailed"));

      if ((v6 & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
        objc_msgSend(v21, "stopFullScreenUI:", v10);

      }
      v22 = sub_1000604F0();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = (const char *)v10;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Enrollment retry failed with error: %{public}@", buf, 0xCu);
      }

    }
  }

  objc_sync_exit(v4);
}

- (BOOL)enrollAndSetup:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  NSObject *v29;

  v5 = objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubHostName](self, "hubHostName"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubPort](self, "hubPort")),
        v7,
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](MSDDemoUpdateController, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    objc_msgSend(v9, "configureNetworkInterface");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    objc_msgSend(v10, "waitForNetworkReachability");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubHostName](self, "hubHostName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubPort](self, "hubPort"));
    v25 = 0;
    v13 = objc_msgSend(v8, "enrollForDeviceName:pairingCredential:hubHostName:hubPort:error:", 0, 0, v11, v12, &v25);
    v14 = v25;

    if ((v13 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub serverList](self, "serverList"));
      objc_msgSend(v15, "saveHubHostNameList:", v16);

      v17 = 1;
      goto LABEL_14;
    }
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[MSDFindMyHub enrollAndSetup:]";
      v28 = 2114;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: enrollment failed with error: %{public}@", buf, 0x16u);
    }

    -[MSDFindMyHub tryScheduleDefaultEnrollmentRetry](self, "tryScheduleDefaultEnrollmentRetry");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741088, CFSTR("Cannot enroll the device with vHub.")));
  }
  else
  {
    v18 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C030C(self, v14);
    v19 = 0;
    v8 = 0;
  }

  v24 = v19;
  sub_1000B6428(&v24, 3727744512, CFSTR("Cannot enroll the device with vHub."));
  v14 = v24;

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
  objc_msgSend(v22, "sendEnrollmentFailureEvent:", v14);

  if (a3)
  {
    v14 = objc_retainAutorelease(v14);
    v17 = 0;
    *a3 = v14;
  }
  else
  {
    v17 = 0;
  }
LABEL_14:

  return v17;
}

- (BOOL)compareSavedHubHostNameWithNewHostName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hubHostNameList"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hubHostName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));

  if (objc_msgSend(v7, "hasSuffix:", CFSTR(".")))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringToIndex:", (char *)objc_msgSend(v7, "length") - 1));

    v7 = (void *)v8;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "lowercaseString", (_QWORD)v19));
        if (objc_msgSend(v14, "hasSuffix:", CFSTR(".")))
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", (char *)objc_msgSend(v14, "length") - 1));

          v14 = (void *)v15;
        }
        v16 = objc_msgSend(v14, "isEqualToString:", v7);

        if ((v16 & 1) != 0)
        {
          v17 = 1;
          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)compareSavedHubHostsWithNewHosts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hubHostNameList"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "hasSuffix:", CFSTR(".")))
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringToIndex:", (char *)objc_msgSend(v11, "length") - 1));
        else
          v12 = v11;
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));
        objc_msgSend(v3, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub serverList](self, "serverList", 0));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v20, "hasSuffix:", CFSTR(".")))
          v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringToIndex:", (char *)objc_msgSend(v20, "length") - 1));
        else
          v21 = v20;
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lowercaseString"));
        objc_msgSend(v4, "addObject:", v23);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  v24 = objc_msgSend(v3, "isEqualToSet:", v4);
  return v24;
}

- (void)tryScheduleDefaultEnrollmentRetry
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  v4 = objc_msgSend(v3, "dcotaOfflineModeDevice");

  if (v4)
  {
    -[MSDFindMyHub setupOfflineModeEnrollmentRetry](self, "setupOfflineModeEnrollmentRetry");
  }
  else if (-[MSDFindMyHub isLogicSync](self, "isLogicSync"))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[MSDFindMyHub tryScheduleDefaultEnrollmentRetry]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: not scheduling default enrollment retry for logic sync", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    v7 = -[MSDFindMyHub getDefaultRetryDelay](self, "getDefaultRetryDelay");
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "-[MSDFindMyHub tryScheduleDefaultEnrollmentRetry]";
      v16 = 2048;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: retrying enrollment in %ld seconds", (uint8_t *)&v14, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)v7));
    -[MSDFindMyHub scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:](self, "scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    objc_msgSend(v11, "saveFindMyHubRetryAtTime:", (uint64_t)v13);

  }
}

- (void)cancelOfflineModeEnrollmentRetry
{
  MSDFindMyHub *v2;
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCellularHelper sharedInstance](MSDCellularHelper, "sharedInstance"));
  v4 = objc_msgSend(v3, "hasObserver:", v2);

  if (v4)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Terminating cellular plan monitor for enrollment retry", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCellularHelper sharedInstance](MSDCellularHelper, "sharedInstance"));
    objc_msgSend(v7, "removeObserver:", v2);

  }
  objc_sync_exit(v2);

}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)serverList
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServerList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSTimer)retryTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)hubHostName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHubHostName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)hubPort
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHubPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isLogicSync
{
  return self->_isLogicSync;
}

- (void)setIsLogicSync:(BOOL)a3
{
  self->_isLogicSync = a3;
}

- (double)autoEnrollmentTimeStamp
{
  return self->_autoEnrollmentTimeStamp;
}

- (void)setAutoEnrollmentTimeStamp:(double)a3
{
  self->_autoEnrollmentTimeStamp = a3;
}

- (NSString)autoEnrollmentStoreId
{
  return self->_autoEnrollmentStoreId;
}

- (void)setAutoEnrollmentStoreId:(id)a3
{
  objc_storeStrong((id *)&self->_autoEnrollmentStoreId, a3);
}

- (NSSet)helpMenuUserTapped
{
  return self->_helpMenuUserTapped;
}

- (void)setHelpMenuUserTapped:(id)a3
{
  objc_storeStrong((id *)&self->_helpMenuUserTapped, a3);
}

- (NSMutableString)storesSearched
{
  return self->_storesSearched;
}

- (void)setStoresSearched:(id)a3
{
  objc_storeStrong((id *)&self->_storesSearched, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storesSearched, 0);
  objc_storeStrong((id *)&self->_helpMenuUserTapped, 0);
  objc_storeStrong((id *)&self->_autoEnrollmentStoreId, 0);
  objc_storeStrong((id *)&self->_hubPort, 0);
  objc_storeStrong((id *)&self->_hubHostName, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_serverList, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
