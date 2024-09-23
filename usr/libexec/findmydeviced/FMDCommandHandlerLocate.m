@implementation FMDCommandHandlerLocate

- (void)handleCommand
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  const __CFString *v9;
  BOOL v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  id v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id *v93;
  id v94;
  id v95;
  FMDCommandHandlerLocate *v96;
  void *v97;
  void *v98;
  id *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *oslog;
  os_log_t osloga;
  uint64_t v106;
  id val;
  void *v108;
  _QWORD v109[4];
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  _QWORD v118[5];
  id v119;
  id *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  NSObject *v127;
  _BYTE *v128;
  id v129;
  id location;
  _BYTE buf[24];
  char v132;
  const __CFString *v133;
  void *v134;

  v3 = qword_1003049F0;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v5 = objc_msgSend(v4, "isLocationServicesCapable");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v7 = objc_msgSend(v6, "canHandleLocates");

  v8 = qword_100304A00;
  v9 = CFSTR("Ignored Request - Location Services Not Enabled");
  if (v7)
  {
    v9 = 0;
    v8 = v3;
  }
  v10 = v5 == 0;
  if (v5)
    v11 = v9;
  else
    v11 = CFSTR("Ignored Request - Device Not Capable of Location Services");
  if (v10)
    v8 = qword_1003049F8;
  v106 = v8;
  if (v8 == qword_1003049F0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    val = (id)objc_claimAutoreleasedReturnValue(-[FMDCommandHandlerLocate createLocatorWithParams:](self, "createLocatorWithParams:", v12));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "standardLocator"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "standardLocator"));
      v15 = objc_msgSend(v14, "locatorRunning");

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "standardLocator"));
        objc_msgSend(v16, "desiredAccuracy");
        v18 = v17;
        objc_msgSend(val, "desiredAccuracy");
        v20 = v18 > v19;

        v21 = sub_1000031B8();
        oslog = objc_claimAutoreleasedReturnValue(v21);
        v22 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        if (!v20)
        {
          if (v22)
          {
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "standardLocator"));
            objc_msgSend(v69, "desiredAccuracy");
            v71 = v70;
            objc_msgSend(val, "desiredAccuracy");
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v71;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v72;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Current locate command is already looking for the same/better accuracy. Ignoring new locate - current=%fm,new=%fm", buf, 0x16u);

          }
          goto LABEL_49;
        }
        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "standardLocator"));
          objc_msgSend(v23, "desiredAccuracy");
          v25 = v24;
          objc_msgSend(val, "desiredAccuracy");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v26;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "New locate command asks for a better accuracy than the current locate. Stopping current locate - current=%fm,new=%fm", buf, 0x16u);

        }
      }
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "standardLocator"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "standardLocator"));
      objc_msgSend(v28, "stopLocator");

      objc_msgSend(v108, "setStandardLocator:", 0);
    }
    if (+[FMDPreferencesMgr simulateLocateNotification](FMDPreferencesMgr, "simulateLocateNotification"))
    {
      v29 = sub_1000031B8();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Simulating locate notification...", buf, 2u);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v32 = objc_msgSend(v31, "mutableCopy");

      objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("Find My iPhone"), CFSTR("title"));
      objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("This device's location was accessed using Find My iPhone"), CFSTR("text"));
      objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("OK"), CFSTR("okButtonTitle"));
      v33 = objc_msgSend(v32, "copy");
      -[FMDCommandHandler setCommandParams:](self, "setCommandParams:", v33);

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("text")));

    if (v100
      && +[FMDPreferencesMgr locateNotificationsEnabled](FMDPreferencesMgr, "locateNotificationsEnabled"))
    {
      osloga = (os_log_t)objc_alloc_init((Class)FMAlert);
      -[NSObject setCategory:](osloga, "setCategory:", 3);
      -[NSObject setMsgText:](osloga, "setMsgText:", v100);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("title")));
      -[NSObject setMsgTitle:](osloga, "setMsgTitle:", v36);

      -[NSObject setShowMsgInLockScreen:](osloga, "setShowMsgInLockScreen:", 1);
      -[NSObject setDismissMsgOnUnlock:](osloga, "setDismissMsgOnUnlock:", 0);
      -[NSObject setDismissMsgOnLock:](osloga, "setDismissMsgOnLock:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("okButtonTitle")));
      -[NSObject setDefaultButtonTitle:](osloga, "setDefaultButtonTitle:", v38);

    }
    else
    {
      osloga = 0;
    }
    v133 = CFSTR("id");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandID](self, "commandID"));
    v134 = v39;
    v99 = (id *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1));

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("udid")));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "fm_nullToNil"));

    if (v102)
    {
      v42 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v102);
      -[FMDCommandHandlerLocate setAccessoryIdentifier:](self, "setAccessoryIdentifier:", v42);

    }
    v43 = sub_1000031B8();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "CommandHandlerLocate Will send accessory locations.", buf, 2u);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandlerLocate createLocatorWithParams:](self, "createLocatorWithParams:", v45));

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandlerLocate locationPublisherWithParams:](self, "locationPublisherWithParams:", v46));

    objc_msgSend(v103, "setLocatorPublisher:", v98);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandlerLocate accessoryIdentifier](self, "accessoryIdentifier"));
    -[FMDCommandHandlerLocate _sendAccessoryCurrentLocationsForCmd:reason:locator:accessoryIdentifier:](self, "_sendAccessoryCurrentLocationsForCmd:reason:locator:accessoryIdentifier:", v99, 1, v103, v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("scanDurationInSeconds")));

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "accessoryRegistry"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandlerLocate accessoryIdentifier](self, "accessoryIdentifier"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "accessoryForIdentifier:", v50));

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "accessoryIdentifier"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringValue"));

    objc_msgSend(v101, "doubleValue");
    if (v54 <= 0.0)
    {
      v65 = 0;
    }
    else
    {
      if (objc_msgSend(v51, "category") == (id)3)
      {
        v56 = v51;
        if (v56
          && (v57 = objc_opt_class(FMDExtAccessory, v55), (objc_opt_isKindOfClass(v56, v57) & 1) != 0))
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "accessoryType"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "configForAccessoryType:", v59));

          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "flavorForFeature:", CFSTR("availability")));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "accessoryRegistry"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:withDelegate:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:withDelegate:", CFSTR("availability"), v97, v61));

          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "infoForFeature:", CFSTR("availability")));
          objc_msgSend(v101, "doubleValue");
          objc_msgSend(v62, "startDiscoveryForAccessory:duration:info:withCompletion:", v53, v63, &stru_1002C46B0);

          if (v62)
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
LABEL_47:

            v65 = 0;
            goto LABEL_48;
          }
        }
        else
        {
          v63 = 0;
          v62 = 0;
          v97 = 0;
        }
        v64 = 0;
        goto LABEL_47;
      }
      v66 = sub_1000031B8();
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "FMDCommandHandlerLocate starting BLE discovery.", buf, 2u);
      }

      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "bluetoothManager"));
      v65 = objc_msgSend(v68, "newDiscovery");

      objc_msgSend(v101, "doubleValue");
      objc_msgSend(v65, "startDiscoveryForDuration:");
      if (v65)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        goto LABEL_42;
      }
    }
    v64 = 0;
LABEL_42:
    v97 = 0;
    v62 = 0;
    v63 = 0;
LABEL_48:
    v73 = v108;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v132 = 0;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandlerLocate locationPublisherWithParams:](self, "locationPublisherWithParams:", v74));

    objc_initWeak(&location, val);
    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_100090760;
    v118[3] = &unk_1002C4700;
    v96 = self;
    v118[4] = v96;
    v76 = v64;
    v119 = v76;
    v93 = v99;
    v120 = v93;
    v77 = v51;
    v121 = v77;
    v78 = v62;
    v122 = v78;
    v79 = v53;
    v123 = v79;
    v80 = v63;
    v124 = v80;
    v81 = v65;
    v125 = v81;
    v82 = v73;
    v126 = v82;
    objc_copyWeak(&v129, &location);
    v128 = buf;
    oslog = osloga;
    v127 = oslog;
    objc_msgSend(v75, "startPublishingWithBlock:", v118);
    objc_msgSend(val, "setLocatorPublisher:", v75);
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_100090CC0;
    v109[3] = &unk_1002C4728;
    v83 = v82;
    v110 = v83;
    v94 = v76;
    v111 = v94;
    v95 = v77;
    v112 = v95;
    v84 = v78;
    v113 = v84;
    v85 = v79;
    v114 = v85;
    v86 = v80;
    v115 = v86;
    v87 = v81;
    v116 = v87;
    v88 = v75;
    v117 = v88;
    objc_msgSend(val, "setStoppedLocatorBlock:", v109);
    objc_msgSend(v83, "setStandardLocator:", val);
    objc_msgSend(val, "startLocator");

    objc_destroyWeak(&v129);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
LABEL_49:

    v11 = CFSTR("OK");
  }
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams", v93));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("includeTrackingInfo")));

  if (v90 && objc_msgSend(v90, "BOOLValue"))
    -[FMDCommandHandlerLocate _sendTrackedLocations](self, "_sendTrackedLocations");
  -[FMDCommandHandlerLocate _notifyAboutLocatingState](self, "_notifyAboutLocatingState");
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v106));
  objc_msgSend(v91, "setObject:forKeyedSubscript:", v92, CFSTR("status"));

  if (v11)
    objc_msgSend(v91, "setObject:forKeyedSubscript:", v11, CFSTR("message"));
  -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", v91);

}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  signed int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FMDActingRequestDecorator *v12;
  id v13;
  FMDActingRequestDecorator *v14;
  void *v15;
  FMDRequestAckLocate *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FMDRequestAckLocate *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[8];
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[6];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler ackDataForCommand](self, "ackDataForCommand"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status")));
  v7 = objc_msgSend(v6, "intValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("message")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v10)
  {
    v26 = v7;
    v25 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
    v12 = [FMDActingRequestDecorator alloc];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10009115C;
    v32[3] = &unk_1002C1D20;
    v32[4] = self;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000911F0;
    v30[3] = &unk_1002C1D48;
    v30[4] = self;
    v13 = v11;
    v31 = v13;
    v14 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v12, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", v32, v30, 0, 0);
    v15 = v8;
    v16 = [FMDRequestAckLocate alloc];
    v17 = v10;
    v18 = v5;
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v22 = -[FMDRequestAckLocate initWithAccount:locateCommand:ackURL:cmdStatusCode:cmdStatusMessage:](v16, "initWithAccount:locateCommand:ackURL:cmdStatusCode:cmdStatusMessage:", v20, v21, v25, v26, v15);

    v11 = v19;
    v5 = v18;
    v10 = v17;
    -[FMDRequest setDecorator:](v22, "setDecorator:", v14);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000912F0;
    v28[3] = &unk_1002C1130;
    v29 = v4;
    -[FMDRequest setCompletionHandler:](v22, "setCompletionHandler:", v28);
    objc_msgSend(v13, "enqueueRequest:", v22);

    v8 = v15;
    v23 = v25;

  }
  else
  {
    v24 = sub_1000031B8();
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not acking the locate command because there is no ack URL", buf, 2u);
    }
  }

}

- (void)_sendCurrentLocation:(id)a3 isFinished:(BOOL)a4 forCmd:(id)a5 withReason:(int64_t)a6 andAccuracyChange:(double)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FMDLocation *v22;
  void *v23;
  FMDActingRequestDecorator *v24;
  id v25;
  id v26;
  FMDActingRequestDecorator *v27;
  void *v28;
  FMDRequestCurrentLocation *v29;
  void *v30;
  double v31;
  FMDRequestCurrentLocation *v32;
  uint64_t v33;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v35;
  NSObject *v36;
  void **v37;
  uint64_t v38;
  id (*v39)(uint64_t);
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = sub_1000031B8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_10022BDCC(v15);

  v16 = sub_100052EEC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "horizontalAccuracy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "longitude"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "latitude"));
    *(_DWORD *)buf = 138478339;
    v45 = v18;
    v46 = 2113;
    v47 = v19;
    v48 = 2113;
    v49 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Publishing Location with Accuracy: %{private}@ Longitude: %{private}@ Latitude: %{private}@", buf, 0x20u);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v22 = -[FMDLocation initWithLocation:eventType:positionType:]([FMDLocation alloc], "initWithLocation:eventType:positionType:", v12, 0, 255);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("id")));
  v24 = [FMDActingRequestDecorator alloc];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100091880;
  v42[3] = &unk_1002C1D20;
  v25 = v23;
  v43 = v25;
  v37 = _NSConcreteStackBlock;
  v38 = 3221225472;
  v39 = sub_1000918E0;
  v40 = &unk_1002C1D20;
  v26 = v21;
  v41 = v26;
  v27 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v24, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", v42, &v37, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("locationValidityDuration"), v37, v38, v39, v40));

  v29 = [FMDRequestCurrentLocation alloc];
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "account"));
  objc_msgSend(v28, "doubleValue");
  v32 = -[FMDRequestCurrentLocation initWithAccount:location:finalLocation:reason:accuracyChange:cacheValidityDuration:](v29, "initWithAccount:location:finalLocation:reason:accuracyChange:cacheValidityDuration:", v30, v22, v10, a6, a7, v31);

  -[FMDRequest setDecorator:](v32, "setDecorator:", v27);
  -[FMDRequest setCompletionHandler:](v32, "setCompletionHandler:", &stru_1002C4748);
  v33 = ct_green_tea_logger_create_static("findmydeviced");
  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v33);
  v35 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
  v36 = v35;
  if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Transmitting Location.", buf, 2u);
  }

  objc_msgSend(v26, "enqueueRequest:", v32);
}

- (void)_sendAccessoryCurrentLocationsForCmd:(id)a3 reason:(int64_t)a4 locator:(id)a5 accessoryIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  FMDActingRequestDecorator *v19;
  id v20;
  FMDActingRequestDecorator *v21;
  id v22;
  NSObject *v23;
  void *v24;
  FMDActingRequestDecorator *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  FMDActingRequestDecorator *v39;
  id v40;
  FMDActingRequestDecorator *v41;
  FMDRequestAccessoryLocations *v42;
  void *v43;
  FMDRequestAccessoryLocations *v44;
  uint64_t v45;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id obj;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  FMDActingRequestDecorator *v65;
  id v66;
  int64_t v67;
  _QWORD v68[4];
  id v69;
  FMDCommandHandlerLocate *v70;
  _QWORD v71[4];
  id v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("locationValidityDuration")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessoryRegistry"));
  v17 = v16;
  if (!v12)
  {
    v51 = v10;
    v52 = v15;
    v49 = v14;
    v50 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allAccessories"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v27;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v59 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
          v33 = sub_1000031B8();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v32;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CommandHandlerLocate fetching historical location for %@.", buf, 0xCu);
          }

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessoryLocationStore"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "historicalLocationForAccessory:", v32));

          if (v36)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dictionaryValue"));
            objc_msgSend(v37, "addEntriesFromDictionary:", v38);

            objc_msgSend(v26, "addObject:", v37);
          }

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
      }
      while (v29);
    }

    if (objc_msgSend(v26, "count"))
    {
      v39 = [FMDActingRequestDecorator alloc];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100092610;
      v56[3] = &unk_1002C1D20;
      v57 = v52;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100092670;
      v54[3] = &unk_1002C1D20;
      v40 = v13;
      v55 = v40;
      v41 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v39, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", v56, v54, 0, 0);
      v42 = [FMDRequestAccessoryLocations alloc];
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "account"));
      v44 = -[FMDRequestAccessoryLocations initWithAccount:accessoryLocations:](v42, "initWithAccount:accessoryLocations:", v43, v26);

      -[FMDRequest setDecorator:](v44, "setDecorator:", v41);
      v45 = ct_green_tea_logger_create_static("findmydeviced");
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v45);
      v47 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
      v48 = v47;
      v12 = 0;
      v11 = v50;
      if (v47 && os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Transmitting Location.", buf, 2u);
      }

      objc_msgSend(v40, "enqueueRequest:", v44);
      v10 = v51;
    }
    else
    {
      v11 = v50;
      v10 = v51;
      v12 = 0;
    }
    v14 = v49;
    goto LABEL_24;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accessoryForIdentifier:", v12));

  obj = v18;
  if (objc_msgSend(v18, "connectionState") == (id)1)
  {
    v19 = [FMDActingRequestDecorator alloc];
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_100092120;
    v71[3] = &unk_1002C1D20;
    v52 = v15;
    v72 = v15;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100092180;
    v68[3] = &unk_1002C1D48;
    v20 = v13;
    v69 = v20;
    v70 = self;
    v21 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v19, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", v71, v68, 0, 0);
    v22 = sub_1000031B8();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "CommandHandlerLocate requesting location for %@.", buf, 0xCu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "accessoryLocationStore"));
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10009222C;
    v62[3] = &unk_1002C4790;
    v63 = v20;
    v67 = a4;
    v64 = v14;
    v65 = v21;
    v66 = v12;
    v25 = v21;
    objc_msgSend(v24, "locationForAccessory:locator:completion:", v18, v11, v62);

    v26 = v72;
LABEL_24:
    v15 = v52;

  }
}

- (void)_sendTrackedLocations
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locationTracker"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100092764;
  v5[3] = &unk_1002C47B8;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "actOnTrackedLocationsUsingBlock:", v5);

}

- (void)_showAlertAfterUnlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  objc_msgSend(v5, "setPendingLocateAlert:", v4);

}

- (id)createLocatorWithParams:(id)a3
{
  id v4;
  void *v5;
  FMDLocator *v6;
  id v7;
  FMDLocator *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FMDLocator *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v6 = [FMDLocator alloc];
  v7 = objc_msgSend(v5, "newLocationManager");
  v8 = -[FMDLocator initWithLocationManager:](v6, "initWithLocationManager:", v7);

  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler fm_logID](self, "fm_logID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
    v19 = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Created %@ for service %@", (uint8_t *)&v19, 0x16u);

  }
  v13 = objc_autoreleasePoolPush();
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationTimeout")));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    -[FMDLocator setDuration:](v8, "setDuration:");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("desiredAccuracy")));

  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
    -[FMDLocator setDesiredAccuracy:](v8, "setDesiredAccuracy:");
  }

  v17 = v8;
  objc_autoreleasePoolPop(v13);

  return v17;
}

- (id)locationPublisherWithParams:(id)a3
{
  id v3;
  FMDConservativeLocatorPublisher *v4;
  FMCompareLocatorPublisher *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(FMDConservativeLocatorPublisher);
  v5 = -[FMCompareLocatorPublisher initWithPrimaryPublisher:compareToPublishers:]([FMCompareLocatorPublisher alloc], "initWithPrimaryPublisher:compareToPublishers:", v4, &__NSArray0__struct);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startThreshold")));
  if (v6)
    -[FMCompareLocatorPublisher setStartThreshold:](v5, "setStartThreshold:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("endThreshold")));

  if (v7)
    -[FMCompareLocatorPublisher setEndThreshold:](v5, "setEndThreshold:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("decayFactor")));

  if (v8)
    -[FMCompareLocatorPublisher setDecayFactor:](v5, "setDecayFactor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationValidityDuration")));

  if (v9)
    -[FMCompareLocatorPublisher setCachedLocationValidityTimeInterval:](v5, "setCachedLocationValidityTimeInterval:", v9);

  return v5;
}

- (void)_notifyAboutLocatingState
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kFMIPLocatableStateReportedNotification, 0, 0, 1u);
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSNumber)lastPublishedAccuracy
{
  return self->_lastPublishedAccuracy;
}

- (void)setLastPublishedAccuracy:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublishedAccuracy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPublishedAccuracy, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
