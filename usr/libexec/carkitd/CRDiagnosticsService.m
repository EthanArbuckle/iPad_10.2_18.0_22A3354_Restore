@implementation CRDiagnosticsService

+ (id)sharedInstance
{
  if (qword_1000DB8B0 != -1)
    dispatch_once(&qword_1000DB8B0, &stru_1000B6F18);
  return (id)qword_1000DB8A8;
}

- (CRDiagnosticsService)init
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  CRDiagnosticsService *v7;

  v3 = objc_alloc((Class)CLLocationManager);
  v4 = CRAutomaticDNDLocationBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithEffectiveBundle:", v5);
  v7 = -[CRDiagnosticsService initWithLocationManager:sleepInterval:](self, "initWithLocationManager:sleepInterval:", v6, 0);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService locationManager](self, "locationManager"));
  objc_msgSend(v3, "stopUpdatingLocation");

  v4.receiver = self;
  v4.super_class = (Class)CRDiagnosticsService;
  -[CRDiagnosticsService dealloc](&v4, "dealloc");
}

- (void)setSessionStatus:(id)a3
{
  CARSessionStatus *v4;
  CARSessionStatus *v5;
  CARSessionStatus *sessionStatus;

  v4 = (CARSessionStatus *)a3;
  v5 = v4;
  if (v4)
    -[CARSessionStatus addSessionObserver:](v4, "addSessionObserver:", self);
  sessionStatus = self->_sessionStatus;
  self->_sessionStatus = v5;

}

- (CRDiagnosticsService)initWithLocationManager:(id)a3 sleepInterval:(unsigned int)a4
{
  id v7;
  CRDiagnosticsService *v8;
  CRDiagnosticsService *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *diagnosticsSerialQueue;
  uint64_t v12;
  DNDStateService *dndStateService;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRDiagnosticsService;
  v8 = -[CRDiagnosticsService init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationManager, a3);
    -[CLLocationManager setDelegate:](v9->_locationManager, "setDelegate:", v9);
    -[CLLocationManager setDesiredAccuracy:](v9->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyHundredMeters);
    -[CLLocationManager setActivityType:](v9->_locationManager, "setActivityType:", 2);
    v9->_sleepInterval = a4;
    v9->_initialDiagnosticsBannerPresented = 0;
    v10 = dispatch_queue_create("com.apple.CarKit.DiagnosticsSerialQueue", 0);
    diagnosticsSerialQueue = v9->_diagnosticsSerialQueue;
    v9->_diagnosticsSerialQueue = (OS_dispatch_queue *)v10;

    v9->_pendingDrafts = 0;
    v12 = objc_claimAutoreleasedReturnValue(+[DNDStateService serviceForClientIdentifier:](DNDStateService, "serviceForClientIdentifier:", CFSTR("com.apple.carkitd.assertion-service")));
    dndStateService = v9->_dndStateService;
    v9->_dndStateService = (DNDStateService *)v12;

  }
  return v9;
}

- (void)collectDiagnosticsWithDeviceScreenshotURL:(id)a3 carScreenshotURL:(id)a4 attachmentURLs:(id)a5 accessoryDetails:(id)a6 accessoryDescription:(id)a7 supportsStartSession:(BOOL)a8 activeBundleIdentifier:(id)a9 wallpaperDescription:(id)a10 assetDescription:(id)a11 loggingFileReceiver:(id)a12 completionHandler:(id)a13
{
  _BOOL8 v13;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  CRDiagnosticsData *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v68;
  _BOOL8 v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[4];
  void (**v90)(_QWORD);
  _QWORD v91[4];
  id v92;
  CRDiagnosticsService *v93;
  CRDiagnosticsData *v94;
  void (**v95)(_QWORD);
  char v96;
  _QWORD v97[5];
  CRDiagnosticsData *v98;
  uint8_t buf[16];

  v13 = a8;
  v85 = a3;
  v18 = a4;
  v19 = a5;
  v88 = a7;
  v87 = a9;
  v86 = a10;
  v84 = a11;
  v20 = a12;
  v21 = (void (**)(_QWORD))a13;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService sessionStatus](self, "sessionStatus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentSession"));

  if (v23)
  {
    v83 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "configuration"));
    -[CRDiagnosticsService setLastConfiguration:](self, "setLastConfiguration:", v26);
    -[CRDiagnosticsService setLoggingFileReceiver:](self, "setLoggingFileReceiver:", v20);
    v27 = objc_alloc_init(CRDiagnosticsData);
    -[CRDiagnosticsService setCurrentDiagnosticsData:](self, "setCurrentDiagnosticsData:", v27);
    v28 = CRIsInternalInstall(-[CRDiagnosticsData setTransportType:](v27, "setTransportType:", objc_msgSend(v26, "transportType")));
    if ((_DWORD)v28)
    {
      v28 = objc_opt_class(TapToRadarService);
      v29 = v85;
      if (v28)
      {
        -[CRDiagnosticsData setActiveBundleIdentifier:](v27, "setActiveBundleIdentifier:", v87);
        v82 = v18;
        v80 = v20;
        if (objc_msgSend(v23, "navigationOwner") == (id)1)
          v30 = 1;
        else
          v30 = (uint64_t)objc_msgSend(v87, "isEqualToString:", CFSTR("com.apple.Maps"));
        -[CRDiagnosticsData setMapsActive:](v27, "setMapsActive:", v30);
        -[CRDiagnosticsData setVehicleSupportsStartSession:](v27, "setVehicleSupportsStartSession:", v13);
        v35 = (void *)objc_opt_new(NSDateFormatter, v34);
        objc_msgSend(v35, "setDateFormat:", CFSTR("MM-dd-yyyy-HH_mm_ss"));
        v36 = objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData _getCreationDateForAttachmentURL:](v27, "_getCreationDateForAttachmentURL:", v85));
        v81 = v35;
        v79 = (void *)v36;
        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringFromDate:", v36));
          v38 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@%@"), CFSTR("DeviceScreenshot"), v37, CFSTR(".png")));

        }
        else
        {
          v38 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("DeviceScreenshot"), CFSTR(".png")));
        }
        v78 = (void *)v38;
        -[CRDiagnosticsData addAttachment:asFilename:](v27, "addAttachment:asFilename:", v85, v38);
        v39 = objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData _getCreationDateForAttachmentURL:](v27, "_getCreationDateForAttachmentURL:", v18));
        v77 = (void *)v39;
        if (v39)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "stringFromDate:", v39));
          v41 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@%@"), CFSTR("CarPlayScreenshot"), v40, CFSTR(".png")));

        }
        else
        {
          v41 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("CarPlayScreenshot"), CFSTR(".png")));
        }
        v76 = (void *)v41;
        -[CRDiagnosticsData addAttachment:asFilename:](v27, "addAttachment:asFilename:", v82, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService _INFOResponseURL](self, "_INFOResponseURL"));
        -[CRDiagnosticsData addAttachment:asFilename:](v27, "addAttachment:asFilename:", v42, CFSTR("INFOResponse.plist"));

        if (objc_msgSend(v86, "length"))
          -[CRDiagnosticsData addTextAttachment:asFilename:](v27, "addTextAttachment:asFilename:", v86, CFSTR("WallpaperPreferences.txt"));
        if (objc_msgSend(v26, "supportsVehicleData"))
        {
          -[CRDiagnosticsData setIsVehicleDataSession:](v27, "setIsVehicleDataSession:", 1);
          v43 = objc_msgSend(v84, "length");
          if (v43)
            v43 = (id)-[CRDiagnosticsData addTextAttachment:asFilename:](v27, "addTextAttachment:asFilename:", v84, CFSTR("VehicleAsset.txt"));
          v45 = CarDiagnosticsLogging(v43, v44);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Gathering CAFTool tree...", buf, 2u);
          }

          v97[0] = _NSConcreteStackBlock;
          v97[1] = 3221225472;
          v97[2] = sub_10004D3E4;
          v97[3] = &unk_1000B6F40;
          v97[4] = self;
          v98 = v27;
          -[CRDiagnosticsService _collectCAFToolTree:](self, "_collectCAFToolTree:", v97);

        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService _collectCarConfigurationForSession:supportingStartSession:](self, "_collectCarConfigurationForSession:supportingStartSession:", v23, v13));
        -[CRDiagnosticsData addTextAttachment:asFilename:](v27, "addTextAttachment:asFilename:", v47, CFSTR("CarPlayConfiguration.txt"));

        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
        v49 = v48;
        if (v88)
          objc_msgSend(v48, "appendString:", v88);
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "descriptionForTransportType"));
        objc_msgSend(v49, "appendFormat:", CFSTR("Transport Type: %@"), v50);

        if (objc_msgSend(v26, "supportsVehicleData"))
          v51 = CFSTR("YES");
        else
          v51 = CFSTR("NO");
        if (objc_msgSend(v26, "supportsLogTransfer"))
          v52 = CFSTR("YES");
        else
          v52 = CFSTR("NO");
        objc_msgSend(v49, "appendFormat:", CFSTR("\nSupports Vehicle Data: %@\nSupports Log Transfer: %@"), v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sourceVersion"));
        if (v53)
        {
          if (qword_1000DB8C0 != -1)
            dispatch_once(&qword_1000DB8C0, &stru_1000B72D0);
          v54 = (void *)qword_1000DB8B8;
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_1000B87A0));
          v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", v55));
          v57 = (void *)v56;
          v58 = CFSTR("Unknown");
          if (v56)
            v58 = (__CFString *)v56;
          v59 = v58;

          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v59, v53));
          objc_msgSend(v49, "appendFormat:", CFSTR("\nPlug-in Source Version: %@"), v60);

          v29 = v85;
        }
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "screens"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService _stringForScreens:](self, "_stringForScreens:", v61));
        objc_msgSend(v49, "appendFormat:", CFSTR("\n%@"), v62);

        -[CRDiagnosticsService _configureDiagnosticsData:withAttachmentURLs:withAdditionalDescription:](self, "_configureDiagnosticsData:withAttachmentURLs:withAdditionalDescription:", v27, v83, v49);
        v63 = -[CRDiagnosticsData isMapsActive](v27, "isMapsActive");
        if (v63)
        {
          v65 = CarDiagnosticsLogging(v63, v64);
          v66 = objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Maps is frontmost or guidance is active, retreiving last location", buf, 2u);
          }

          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carkit.maps-diagnostics-starting"), 0, 0, 1u);
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService locationManager](self, "locationManager"));
          objc_msgSend(v68, "requestLocation");

        }
        v69 = -[CRDiagnosticsService shouldTriggerSysdiagnose](self, "shouldTriggerSysdiagnose");
        if (!v69)
        {
          v74 = CarDiagnosticsLogging(v69, v70);
          v75 = objc_claimAutoreleasedReturnValue(v74);
          v18 = v82;
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "No need for sysdiagnose now", buf, 2u);
          }

          v21[2](v21);
          v20 = v80;
          v73 = v81;
          goto LABEL_54;
        }

        v33 = 1;
        v18 = v82;
        v20 = v80;
      }
      else
      {
        v33 = 0;
      }
    }
    else
    {
      v33 = 0;
      v29 = v85;
    }
    v71 = CarGeneralLogging(v28);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      sub_10006E5A4();

    if (v33)
    {
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_10004D568;
      v91[3] = &unk_1000B6F90;
      v92 = v26;
      v93 = self;
      v94 = v27;
      v96 = v33;
      v95 = v21;
      -[CRDiagnosticsService _mainQueue_promptForInternalSysdiagnoseForDiagnosticData:completion:](self, "_mainQueue_promptForInternalSysdiagnoseForDiagnosticData:completion:", v94, v91);

      v73 = v92;
    }
    else
    {
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_10004D704;
      v89[3] = &unk_1000B5628;
      v90 = v21;
      -[CRDiagnosticsService _mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:isInternal:completion:](self, "_mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:isInternal:completion:", v27, 0, v89);
      v73 = v90;
    }
LABEL_54:

    v19 = v83;
    goto LABEL_55;
  }
  v31 = CarDiagnosticsLogging(v24, v25);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Trying to collect diagnostics but currentSession is nil", buf, 2u);
  }

  v21[2](v21);
  v29 = v85;
LABEL_55:

}

- (void)collectDiagnosticsWithSession:(id)a3 displayReason:(id)a4 additionalDescription:(id)a5 attachmentURLs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  CRDiagnosticsData *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  void (**v36)(_QWORD);
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  -[CRDiagnosticsService setLastSession:](self, "setLastSession:", v12);
  v17 = objc_alloc_init(CRDiagnosticsData);
  -[CRDiagnosticsService setCurrentDiagnosticsData:](self, "setCurrentDiagnosticsData:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transportType"));
  v19 = v18;
  if (v18)
  {
    if ((objc_msgSend(v18, "isEqualToString:", kFigEndpointTransportType_AWDL) & 1) != 0
      || (objc_msgSend(v19, "isEqualToString:", kFigEndpointTransportType_WiFi) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", kFigEndpointTransportType_Ethernet) & 1) != 0)
    {
      v20 = 2;
    }
    else
    {
      v20 = objc_msgSend(v19, "isEqualToString:", kFigEndpointTransportType_USB);
    }
  }
  else
  {
    v20 = 0;
  }
  if (CRIsInternalInstall(-[CRDiagnosticsData setTransportType:](v17, "setTransportType:", v20))
    && objc_opt_class(TapToRadarService))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v22 = v21;
    if (v14)
      objc_msgSend(v21, "appendFormat:", CFSTR("%@\n"), v14);
    v34 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transportType"));
    objc_msgSend(v22, "appendFormat:", CFSTR("Transport Type: %@"), v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vehicleInformation"));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "vehicleInformation"));
      objc_msgSend(v22, "appendFormat:", CFSTR("Vehicle Information: %@"), v25);

    }
    -[CRDiagnosticsService _configureDiagnosticsData:withAttachmentURLs:withAdditionalDescription:](self, "_configureDiagnosticsData:withAttachmentURLs:withAdditionalDescription:", v17, v15, v22);
    v26 = -[CRDiagnosticsService shouldTriggerSysdiagnose](self, "shouldTriggerSysdiagnose");
    v27 = v26;
    v29 = CarDiagnosticsLogging(v26, v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Starting to take a sysdiagnose", buf, 2u);
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService radarDraftFromDiagnosticsData:](self, "radarDraftFromDiagnosticsData:", v17));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](TapToRadarService, "shared"));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10004DA58;
      v35[3] = &unk_1000B6FB8;
      v35[4] = self;
      v36 = v16;
      objc_msgSend(v33, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v32, CFSTR("CarPlay"), v34, v35);

      v13 = v34;
    }
    else
    {
      v13 = v34;
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No need for sysdiagnose now", buf, 2u);
      }

      v16[2](v16);
    }

  }
}

- (void)_configureDiagnosticsData:(id)a3 withAttachmentURLs:(id)a4 withAdditionalDescription:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  DNDStateService *dndStateService;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addAttachment:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService _currentSiriAccount](self, "_currentSiriAccount"));
  objc_msgSend(v8, "setSiriAccount:", v15);

  objc_msgSend(v8, "setAdditionalDescription:", v10);
  dndStateService = self->_dndStateService;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004DD94;
  v18[3] = &unk_1000B6FE0;
  v19 = v8;
  v17 = v8;
  -[DNDStateService queryCurrentStateWithCompletionHandler:](dndStateService, "queryCurrentStateWithCompletionHandler:", v18);

}

- (void)_mainQueue_promptForInternalSysdiagnoseForDiagnosticData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004E07C;
  v10[3] = &unk_1000B7030;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRDiagnosticsService _mainQueue_presentCarAlertWithTitle:dismissTime:completion:](self, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", CFSTR("Gathering CarPlay Diagnostics"), v10, 3.0);

}

- (void)_mainQueue_gatherVehicleLogsThenPerformSysdiagnoseWithDiagnosticData:(id)a3 isInternal:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004E2FC;
  v12[3] = &unk_1000B70A8;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[CRDiagnosticsService _mainQueue_startDiagnosticsOperation:](self, "_mainQueue_startDiagnosticsOperation:", v12);

}

- (void)_mainQueue_startDiagnosticsOperation:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  dispatch_semaphore_t v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t description;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)os_transaction_create("com.apple.carkit.diagnostics.transaction");
  v8 = CarDiagnosticsLogging(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    description = os_transaction_get_description(v6);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "began idle-exit transaction for CarPlay diagnostics: %s", buf, 0xCu);
  }

  v12 = CarDiagnosticsLogging(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "waiting on previous diagnostics", buf, 2u);
  }

  v14 = objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService diagnosticsSerialQueue](self, "diagnosticsSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E74C;
  block[3] = &unk_1000B70D0;
  v20 = v6;
  v21 = v4;
  v19 = v5;
  v15 = v6;
  v16 = v5;
  v17 = v4;
  dispatch_async(v14, block);

}

- (void)_backgroundQueue_finishDiagnosticsOperationSemaphore:(id)a3 transaction:(id)a4
{
  id v5;
  intptr_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t description;

  v5 = a4;
  v6 = dispatch_semaphore_signal((dispatch_semaphore_t)a3);
  v9 = CarDiagnosticsLogging(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    description = os_transaction_get_description(v5);
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ended idle-exit transaction for CarPlay diagnostics: %s", (uint8_t *)&v11, 0xCu);
  }

}

- (void)_mainQueue_gatherVehicleLogsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService loggingFileReceiver](self, "loggingFileReceiver"));

  v8 = CarDiagnosticsLogging(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting vehicle log archive", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService loggingFileReceiver](self, "loggingFileReceiver"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004EAA8;
    v12[3] = &unk_1000B70F8;
    v13 = v4;
    objc_msgSend(v11, "requestLogsWithCompletion:", v12);

  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "logging file receiver not supported", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)_mainQueue_performSysdiagnoseIncludingData:(id)a3 isInternal:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v11 = CarDiagnosticsLogging(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting to take a sysdiagnose", buf, 2u);
  }

  v15 = CarDiagnosticsLogging(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "internal version of sysdiagnose", buf, 2u);
    }

    v18 = (id)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService radarDraftFromDiagnosticsData:](self, "radarDraftFromDiagnosticsData:", v8));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](TapToRadarService, "shared"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004ECFC;
    v24[3] = &unk_1000B6FB8;
    v24[4] = self;
    v25 = v9;
    v20 = v9;
    objc_msgSend(v19, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v18, CFSTR("CarPlay"), 0, v24);

  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "public version of sysdiagnose", buf, 2u);
    }

    -[CRDiagnosticsService _performVibrate](self, "_performVibrate");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10004EEC8;
    v21[3] = &unk_1000B7120;
    v22 = 0;
    v23 = v9;
    v18 = v9;
    +[Libsysdiagnose sysdiagnoseWithMetadata:onCompletion:](Libsysdiagnose, "sysdiagnoseWithMetadata:onCompletion:", &__NSDictionary0__struct, v21);

    v20 = v22;
  }

}

- (id)_currentSiriAccount
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)AFSettingsConnection);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accounts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1000B7160));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  return v5;
}

- (void)_mainQueue_displayDraftCountBanner
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Number of Drafts Scheduled: %ld"), -[CRDiagnosticsService pendingDrafts](self, "pendingDrafts")));
  -[CRDiagnosticsService _mainQueue_presentCarAlertWithTitle:dismissTime:completion:](self, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", v3, 0, 3.0);

}

- (void)_mainQueue_displayDraftErrorBanner
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[CRDiagnosticsService _mainQueue_presentCarAlertWithTitle:dismissTime:completion:](self, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", CFSTR("ERROR: Failed to create a draft!"), 0, 3.0);
}

- (void)_mainQueue_displayFetchingVehicleLogsBannerWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004F120;
  v6[3] = &unk_1000B63C0;
  v7 = v4;
  v5 = v4;
  -[CRDiagnosticsService _mainQueue_presentCarAlertWithTitle:dismissTime:completion:](self, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", CFSTR("Fetching vehicle logs, please wait..."), v6, 3.0);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a4;
  v7 = a3;
  v9 = CarDiagnosticsLogging(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed fetching diagnostics device location with %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004F254;
  v13[3] = &unk_1000B5390;
  v13[4] = self;
  v14 = v11;
  v12 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v9 = CarDiagnosticsLogging(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received diagnostics location manager update response.", buf, 2u);
  }

  objc_msgSend(v7, "stopUpdatingLocation");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004F47C;
  v12[3] = &unk_1000B5390;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

}

- (BOOL)shouldTriggerSysdiagnose
{
  Class v2;
  uint64_t v3;
  uint64_t v4;
  Class v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = NSClassFromString(CFSTR("XCTestCase"));
  v5 = v2;
  if (v2)
  {
    v6 = CarDiagnosticsLogging(v2, v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping sysdiagnose in testing context.", v9, 2u);
    }

  }
  return v5 == 0;
}

- (void)_mainQueue_presentDictationBannerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[16];
  _QWORD v29[5];
  id v30;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRDictationService sharedInstance](CRDictationService, "sharedInstance"));
  v6 = objc_msgSend(v5, "dictationEnabled");

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRDictationService sharedInstance](CRDictationService, "sharedInstance"));
    v10 = objc_msgSend(v9, "dictationEnabledInKeyboardSettings");

    if (v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRDictationService sharedInstance](CRDictationService, "sharedInstance"));
      v14 = objc_msgSend(v13, "dictationAvailable");

      if (v14)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10004F8D4;
        v29[3] = &unk_1000B7188;
        v29[4] = self;
        v30 = v4;
        -[CRDiagnosticsService _mainQueue_presentCarAlertWithTitle:dismissTime:completion:](self, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", CFSTR("Tap to Dictate Issue"), v29, 5.0);
        v17 = v30;
      }
      else
      {
        v22 = CarDiagnosticsLogging(v15, v16);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Dictation is not available", buf, 2u);
        }

        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10004F968;
        v26[3] = &unk_1000B63C0;
        v27 = v4;
        -[CRDiagnosticsService _mainQueue_presentCarAlertWithTitle:dismissTime:completion:](self, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", CFSTR("Dictation Not Available"), v26, 3.0);
        v17 = v27;
      }
    }
    else
    {
      v20 = CarDiagnosticsLogging(v11, v12);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Dictation is not enabled in keyboard settings", buf, 2u);
      }

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10004F978;
      v24[3] = &unk_1000B63C0;
      v25 = v4;
      -[CRDiagnosticsService _mainQueue_presentCarAlertWithTitle:dismissTime:completion:](self, "_mainQueue_presentCarAlertWithTitle:dismissTime:completion:", CFSTR("Dictation Not Enabled In Settings"), v24, 3.0);
      v17 = v25;
    }

  }
  else
  {
    v18 = CarDiagnosticsLogging(v7, v8);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Dictation is not enabled via user preference", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)_beginDictationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRDictationService sharedInstance](CRDictationService, "sharedInstance"));
  objc_msgSend(v5, "reset");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRDictationService sharedInstance](CRDictationService, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004FA3C;
  v8[3] = &unk_1000B7218;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "beginRecordingWithCompletion:", v8);

}

- (void)_performVibrate
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;

  global_queue = dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_1000B7238);

}

- (void)_mainQueue_presentCarAlertWithTitle:(id)a3 dismissTime:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CRDiagnosticsAlert *v13;
  int v14;
  id v15;

  v7 = a3;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v11 = CarDiagnosticsLogging(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Presenting diagnostics alert: %@", (uint8_t *)&v14, 0xCu);
  }

  v13 = objc_alloc_init(CRDiagnosticsAlert);
  -[CRDiagnosticsAlert setTimeoutInterval:](v13, "setTimeoutInterval:", a4);
  -[CRDiagnosticsAlert setBannerMessage:](v13, "setBannerMessage:", v7);
  -[CRAlert presentAlertWithCompletion:](v13, "presentAlertWithCompletion:", v8);

}

- (id)_keywordsToAttachForDiagnosticsData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void ***v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _UNKNOWN **v36;
  void *v37;
  uint64_t v39;
  void **v40;
  uint64_t v41;
  id (*v42)(uint64_t, void *);
  void *v43;
  id v44;
  _UNKNOWN **v45;
  uint8_t buf[4];
  void *v47;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_1000BE0C8, &off_1000BE0E0, 0));
  v40 = _NSConcreteStackBlock;
  v41 = 3221225472;
  v42 = sub_1000505E4;
  v43 = &unk_1000B7260;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000BF2B0, "allKeys"));
  v44 = v6;
  v45 = &off_1000BF2B0;
  v7 = objc_retainBlock(&v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService lastConfiguration](self, "lastConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vehicleManufacturer"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vehicleManufacturer"));
    v11 = ((uint64_t (*)(void ***, void *))v7[2])(v7, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);

    if (v12)
      goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "manufacturerName"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "manufacturerName"));
    v15 = ((uint64_t (*)(void ***, void *))v7[2])(v7, v14);
    v12 = objc_claimAutoreleasedReturnValue(v15);

    if (v12)
      goto LABEL_13;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vehicleName"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vehicleName"));
    v18 = ((uint64_t (*)(void ***, void *))v7[2])(v7, v17);
    v12 = objc_claimAutoreleasedReturnValue(v18);

    if (v12)
      goto LABEL_13;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v21 = ((uint64_t (*)(void ***, void *))v7[2])(v7, v20);
    v12 = objc_claimAutoreleasedReturnValue(v21);

    if (v12)
      goto LABEL_13;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vehicleModelName"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vehicleModelName"));
    v24 = ((uint64_t (*)(void ***, void *))v7[2])(v7, v23);
    v12 = objc_claimAutoreleasedReturnValue(v24);

    if (v12)
      goto LABEL_13;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelName"));

  if (v25
    && (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelName")),
        v28 = ((uint64_t (*)(void ***, void *))v7[2])(v7, v27),
        v12 = objc_claimAutoreleasedReturnValue(v28),
        v27,
        v12))
  {
LABEL_13:
    objc_msgSend(v5, "addObject:", v12);
  }
  else
  {
    v39 = CarGeneralLogging(v26);
    v12 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not resolve a model keyword for %@", buf, 0xCu);
    }
  }

  v29 = objc_alloc((Class)NSDictionary);
  v30 = objc_msgSend(v29, "initWithObjectsAndKeys:", &off_1000BE4E8, CFSTR("com.apple.iBooks"), &off_1000BE500, CFSTR("com.apple.MobileSMS"), &off_1000BE518, CFSTR("com.apple.Music"), &off_1000BE530, CFSTR("com.apple.mobilephone"), &off_1000BE530, CFSTR("com.apple.InCallService"), &off_1000BE548, CFSTR("com.apple.podcasts"), &off_1000BE560, CFSTR("com.apple.mobilecal"), &off_1000BE578, CFSTR("com.apple.CarPlaySettings"), &off_1000BE590,
          CFSTR("com.apple.internal.Neatline"),
          &off_1000BE5A8,
          &off_1000BE5C0,
          &off_1000BE5D8,
          &off_1000BE5F0,
          0,
          v40,
          v41,
          v42,
          v43);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeBundleIdentifier"));

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeBundleIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v32));

    if (v33)
      objc_msgSend(v5, "addObject:", v33);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "transportType")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v34));

  if (v35)
    objc_msgSend(v5, "addObject:", v35);
  if (objc_msgSend(v4, "vehicleSupportsStartSession"))
    v36 = &off_1000BE608;
  else
    v36 = &off_1000BE620;
  objc_msgSend(v5, "addObject:", v36);
  if (_os_feature_enabled_impl("Siri", "sirix"))
    objc_msgSend(v5, "addObject:", &off_1000BE638);
  if (objc_msgSend(v8, "hasGaugeClusterScreen"))
  {
    objc_msgSend(v5, "addObject:", &off_1000BE650);
    objc_msgSend(v5, "addObject:", &off_1000BE668);
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService lastSession](self, "lastSession"));
  if (v37)
  {
    objc_msgSend(v5, "addObject:", &off_1000BE680);
    objc_msgSend(v5, "addObject:", &off_1000BE698);
  }

  return v5;
}

- (id)_stringForViewArea:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  NSRect v12;
  NSRect v13;

  v3 = a3;
  objc_msgSend(v3, "visibleFrame");
  v4 = NSStringFromRect(v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "safeFrame");
  v6 = NSStringFromRect(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "displaysTransitionControl");

  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\t\t\tVisible Frame: %@\n\t\t\tSafe Frame: %@\n\t\t\tDisplays Transition Control: %@\n"), v5, v7, v9));

  return v10;
}

- (id)_stringForScreens:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  const __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  NSSize v45;
  NSSize v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("Number of screens: %lu\n"), objc_msgSend(v4, "count")));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v4;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v40;
    v6 = 1;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v7);
        objc_msgSend(v5, "appendFormat:", CFSTR("\t{\n\t\tScreen %d\n"), v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tIdentifier: %@\n"), v9);
        v10 = objc_msgSend(v8, "screenType");
        v11 = CFSTR("Secondary");
        if (!v10)
          v11 = CFSTR("Primary");
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tType: %@\n"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "descriptionForAvailableInteractionModels"));
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tAvailable Interaction Models: %@\n"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "descriptionForPrimaryInteractionModel"));
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tPrimary Interaction Model: %@\n"), v13);
        objc_msgSend(v8, "physicalSize");
        v14 = NSStringFromSize(v45);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tPhysical Size: %@\n"), v15);

        objc_msgSend(v8, "pixelSize");
        v16 = NSStringFromSize(v46);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tPixel Size: %@\n"), v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "maxFramesPerSecond")));
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tMax FPS: %@\n"), v18);

        v19 = objc_msgSend(v8, "supportsHighFidelityTouch");
        v20 = CFSTR("NO");
        if (v19)
          v20 = CFSTR("YES");
        objc_msgSend(v5, "appendFormat:", CFSTR("\t\tSupports HiFi Touch: %@\n"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewAreas"));
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          v33 = v12;
          v34 = v9;
          objc_msgSend(v5, "appendFormat:", CFSTR("\t\tView Areas:\n"));
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewAreas"));
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v36;
            do
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v36 != v26)
                  objc_enumerationMutation(v23);
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService _stringForViewArea:](self, "_stringForViewArea:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v27)));
                objc_msgSend(v5, "appendString:", v28);

                v27 = (char *)v27 + 1;
              }
              while (v25 != v27);
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v25);
          }

          v12 = v33;
          v9 = v34;
        }
        objc_msgSend(v5, "appendFormat:", CFSTR("\t}\n"));
        v6 = (v6 + 1);

        v7 = (char *)v7 + 1;
      }
      while (v7 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v32);
  }

  return v5;
}

- (void)_collectCAFToolTree:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  global_queue = dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050C70;
  block[3] = &unk_1000B5628;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

+ (BOOL)_accessorySupportsLocationDeadReckoning
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v9;
  void *v10;

  v2 = CLGetAccessoryTypeBitSet(a1, a2);
  v4 = CarDiagnosticsLogging(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2));
    v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received location bitset %@", (uint8_t *)&v9, 0xCu);

  }
  return (v2 >> 3) & 1;
}

- (id)_INFOResponseURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService lastConfiguration](self, "lastConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "infoResponse"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "temporaryDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("INFOResponse.plist")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  if (v7)
    objc_msgSend(v3, "writeToFile:atomically:", v7, 1);

  return v6;
}

- (id)_collectCarConfigurationForSession:(id)a3 supportingStartSession:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
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
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  unsigned int v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  unsigned int v74;
  const __CFString *v75;
  void *v76;
  void *v78;
  void *v80;
  void *v81;
  void *v82;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Connected CarPlay Session\n\n"), "stringByAppendingString:", CFSTR("Session Configuration\n")));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("Name: %@\n"), v82));

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleModelName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("Model Name: %@\n"), v81));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("Model Name (AirPlay): %@\n"), v10));

  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleManufacturer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("Manufacturer: %@\n"), v80));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manufacturerName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("Manufacturer (AirPlay): %@\n"), v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vehicleSerialNumber"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("Serial Number: %@\n"), v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "PPID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("PPID: %@\n"), v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endpointIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("Endpoint Identifier: %@\n"), v19));

  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionForTransportType"));
  v78 = (void *)v21;
  v22 = CFSTR("Bonjour");
  if (v4)
    v22 = CFSTR("Start Session");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("Transport types: %@\nSession Type: %@\n"), v21, v22));

  if (objc_msgSend(v6, "nightModeSupported"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("Night Mode Supported: %@\n"), v24));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionForLimitableUserInterfaces"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingFormat:", CFSTR("Limitable UI Types: %@\n"), v26));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "limitUserInterfaces"));
  v29 = objc_msgSend(v28, "BOOLValue");

  if (v29)
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("Limited UI Enabled: %@\n"), v30));

  if (objc_msgSend(v6, "supportsElectronicTollCollection"))
    v32 = CFSTR("YES");
  else
    v32 = CFSTR("NO");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingFormat:", CFSTR("ETC Supported: %@\n"), v32));

  if (objc_msgSend(v6, "rightHandDrive"))
    v34 = CFSTR("YES");
  else
    v34 = CFSTR("NO");
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingFormat:", CFSTR("Right Hand Drive: %@\n"), v34));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[CARSessionConfiguration descriptionForCapability:](CARSessionConfiguration, "descriptionForCapability:", objc_msgSend(v6, "nowPlayingAlbumArtMode")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingFormat:", CFSTR("Capability - Album Art : %@\n"), v36));

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringByAppendingFormat:", CFSTR("Capability - User Interface Style: %@\n"), v38));

  objc_msgSend(v6, "viewAreaInsets");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CARSessionConfiguration descriptionForEdgeInsets:](CARSessionConfiguration, "descriptionForEdgeInsets:"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringByAppendingFormat:", CFSTR("Capability - Safe Area Insets: %@\n"), v40));

  objc_msgSend(v6, "dashboardRoundedCorners");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[CARSessionConfiguration descriptionForEdgeInsets:](CARSessionConfiguration, "descriptionForEdgeInsets:"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingFormat:", CFSTR("Capability - Dashboard Rounded Corners: %@\n"), v42));

  if (objc_msgSend(v6, "supportsACBack"))
    v44 = CFSTR("YES");
  else
    v44 = CFSTR("NO");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByAppendingFormat:", CFSTR("Supports AC_BACK: %@\n"), v44));

  if (objc_msgSend(v6, "vehicleSupportsDestinationSharing"))
    v46 = CFSTR("YES");
  else
    v46 = CFSTR("NO");
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringByAppendingFormat:", CFSTR("Supports Destination Sharing: %@\n"), v46));

  if (objc_msgSend(v6, "supportsSiriZLL"))
    v48 = CFSTR("YES");
  else
    v48 = CFSTR("NO");
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "stringByAppendingFormat:", CFSTR("Supports Siri ZLL: %@\n"), v48));

  if (objc_msgSend(v6, "supportsSiriZLLButton"))
    v50 = CFSTR("YES");
  else
    v50 = CFSTR("NO");
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "stringByAppendingFormat:", CFSTR("Supports Siri ZLL Button: %@\n"), v50));

  if (objc_msgSend(v6, "supportsSiriMixable"))
    v52 = CFSTR("YES");
  else
    v52 = CFSTR("NO");
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByAppendingFormat:", CFSTR("Supports Siri Mixable: %@\n"), v52));

  v54 = CARStringFromVoiceTriggerMode(objc_msgSend(v5, "voiceTriggerMode"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringByAppendingFormat:", CFSTR("Voice Trigger Mode: %@\n"), v55));

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "stringByAppendingString:", CFSTR("\nManufacturer Icons\n")));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "manufacturerIconLabel"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "stringByAppendingFormat:", CFSTR("Icon Label: %@\n"), v58));

  if (objc_msgSend(v6, "manufacturerIconVisible"))
    v60 = CFSTR("YES");
  else
    v60 = CFSTR("NO");
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "stringByAppendingFormat:", CFSTR("Icon Visible: %@\n"), v60));

  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screens"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService _stringForScreens:](self, "_stringForScreens:", v62));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stringByAppendingString:", v63));

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "stringByAppendingString:", CFSTR("\nCurrent session info\n")));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemNightMode"));
  LODWORD(v61) = objc_msgSend(v66, "BOOLValue");

  if ((_DWORD)v61)
    v67 = CFSTR("YES");
  else
    v67 = CFSTR("NO");
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "stringByAppendingFormat:", CFSTR("Night Mode Enabled (without fallbacks): %@\n"), v67));

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nightMode"));
  v70 = objc_msgSend(v69, "BOOLValue");

  if (v70)
    v71 = CFSTR("YES");
  else
    v71 = CFSTR("NO");
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "stringByAppendingFormat:", CFSTR("Night Mode Enabled (with fallbacks): %@\n"), v71));

  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "electronicTollCollectionAvailable"));
  v74 = objc_msgSend(v73, "BOOLValue");

  if (v74)
    v75 = CFSTR("YES");
  else
    v75 = CFSTR("NO");
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "stringByAppendingFormat:", CFSTR("ETC Enabled: %@\n"), v75));

  return v76;
}

- (id)_extensionIdentifiersForDiagnosticsData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = objc_msgSend(v3, "isMapsActive");

  if (v6)
  {
    objc_msgSend(v5, "addObjectsFromArray:", &off_1000BF218);
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Maps")))
      objc_msgSend(v5, "addObject:", CFSTR("com.apple.CoreRoutine.RTDiagnosticExtension"));
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
  {
    v7 = CFSTR("com.apple.podcasts.DiagnosticExtension");
LABEL_8:
    objc_msgSend(v5, "addObject:", v7);
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Music")))
  {
    v7 = CFSTR("com.apple.MediaPlayer.DiagnosticExtension");
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v5, "addObject:", CFSTR("com.apple.DiagnosticExtensions.Cellular"));
  objc_msgSend(v5, "addObject:", CFSTR("com.apple.voiceservices.diagnosticextension"));

  return v5;
}

- (id)radarTitleTagsForData:(id)a3
{
  void *v3;
  __CFString *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService lastSession](self, "lastSession", a3));
  if (v3)
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("[CarPlay]"), "stringByAppendingString:", CFSTR(" Connection Time Issue")));
  else
    v4 = CFSTR("[CarPlay]");

  return v4;
}

- (id)radarDescriptionForData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transcription"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transcription"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Please provide a brief description of this radar.\n\n"), "stringByAppendingFormat:", CFSTR("Dictated description: %@"), v6));

  }
  else
  {
    v7 = CFSTR("Please provide a brief description of this radar.\n\n");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeBundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("\n\nActive App: %@"), v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hostname"));
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriAccount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hostname"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("\nSiri Server Hostname: %@"), v14));

    v9 = (void *)v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "focusModeDescription"));
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "focusModeDescription"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("\nActive Focus Mode: %@"), v18));

    v9 = (void *)v19;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestamp"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("\nTimestamp: %@"), v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationDescription"));
  v23 = objc_msgSend(v22, "length");

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationDescription"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("\n\nLast known location (for Maps/location investigation):\n%@"), v24));

    v21 = (void *)v25;
  }
  v26 = objc_msgSend(v3, "vehicleSupportsStartSession");
  v27 = CFSTR("Bonjour");
  if (v26)
    v27 = CFSTR("Start Session");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("\nSession Type: %@"), v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "additionalDescription"));
  v30 = objc_msgSend(v29, "length");

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "additionalDescription"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingFormat:", CFSTR("\n\n%@"), v31));

    v28 = (void *)v32;
  }

  return v28;
}

- (id)radarDraftFromDiagnosticsData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init((Class)RadarDraft);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService radarTitleTagsForData:](self, "radarTitleTagsForData:", v4));
  objc_msgSend(v5, "setTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService radarDescriptionForData:](self, "radarDescriptionForData:", v4));
  objc_msgSend(v5, "setProblemDescription:", v7);

  v8 = objc_msgSend(objc_alloc((Class)RadarComponent), "initWithName:version:identifier:", CFSTR("CarPlay"), CFSTR("(New Bugs)"), 597444);
  objc_msgSend(v5, "setComponent:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attachmentURLs"));
  objc_msgSend(v5, "setAttachments:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService _extensionIdentifiersForDiagnosticsData:](self, "_extensionIdentifiersForDiagnosticsData:", v4));
  objc_msgSend(v5, "setDiagnosticExtensionIDs:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsService _keywordsToAttachForDiagnosticsData:](self, "_keywordsToAttachForDiagnosticsData:", v4));
  objc_msgSend(v5, "setKeywords:", v11);

  objc_msgSend(v5, "setAutoDiagnostics:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));

  objc_msgSend(v5, "setTimeOfIssue:", v12);
  objc_msgSend(v5, "setIsUserInitiated:", 1);
  return v5;
}

- (void)session:(id)a3 didUpdateConfiguration:(id)a4
{
  id v5;

  v5 = a4;
  if (CRIsInternalInstall(v5))
    -[CRDiagnosticsService setLastConfiguration:](self, "setLastConfiguration:", v5);

}

- (void)sessionDidDisconnect:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052130;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (BOOL)initialDiagnosticsBannerPresented
{
  return self->_initialDiagnosticsBannerPresented;
}

- (void)setInitialDiagnosticsBannerPresented:(BOOL)a3
{
  self->_initialDiagnosticsBannerPresented = a3;
}

- (CRDiagnosticsData)currentDiagnosticsData
{
  return self->_currentDiagnosticsData;
}

- (void)setCurrentDiagnosticsData:(id)a3
{
  objc_storeStrong((id *)&self->_currentDiagnosticsData, a3);
}

- (OS_dispatch_queue)diagnosticsSerialQueue
{
  return self->_diagnosticsSerialQueue;
}

- (void)setDiagnosticsSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsSerialQueue, a3);
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
  objc_storeStrong((id *)&self->_dndStateService, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (unsigned)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(unsigned int)a3
{
  self->_sleepInterval = a3;
}

- (OS_os_transaction)idleExitTransaction
{
  return self->_idleExitTransaction;
}

- (void)setIdleExitTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_idleExitTransaction, a3);
}

- (CRLoggingFileReceiver)loggingFileReceiver
{
  return (CRLoggingFileReceiver *)objc_loadWeakRetained((id *)&self->_loggingFileReceiver);
}

- (void)setLoggingFileReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_loggingFileReceiver, a3);
}

- (CARSessionConfiguration)lastConfiguration
{
  return self->_lastConfiguration;
}

- (void)setLastConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_lastConfiguration, a3);
}

- (CARConnectionSession)lastSession
{
  return self->_lastSession;
}

- (void)setLastSession:(id)a3
{
  objc_storeStrong((id *)&self->_lastSession, a3);
}

- (int64_t)pendingDrafts
{
  return self->_pendingDrafts;
}

- (void)setPendingDrafts:(int64_t)a3
{
  self->_pendingDrafts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSession, 0);
  objc_storeStrong((id *)&self->_lastConfiguration, 0);
  objc_destroyWeak((id *)&self->_loggingFileReceiver);
  objc_storeStrong((id *)&self->_idleExitTransaction, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_diagnosticsSerialQueue, 0);
  objc_storeStrong((id *)&self->_currentDiagnosticsData, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end
