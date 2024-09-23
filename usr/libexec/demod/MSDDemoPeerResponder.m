@implementation MSDDemoPeerResponder

+ (id)sharedInstance
{
  if (qword_100175610 != -1)
    dispatch_once(&qword_100175610, &stru_10013FE40);
  return (id)qword_100175618;
}

- (MSDDemoPeerResponder)init
{
  MSDDemoPeerResponder *v2;
  MSDDemoPeerResponder *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDDemoPeerResponder;
  v2 = -[MSDDemoPeerResponder init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder _constructMessageHandlerTable](v2, "_constructMessageHandlerTable"));
    -[MSDDemoPeerResponder setMessageHandlerTable:](v3, "setMessageHandlerTable:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
    -[MSDDemoPeerResponder setSubscribers:](v3, "setSubscribers:", v5);

  }
  return v3;
}

- (void)start
{
  MSDDemoPeerResponder *v2;
  id v3;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  MSDRapportDeviceAdvertiser *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  MSDRapportMessageHandler *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];

  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerResponder: Starting responder...", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder rpDeviceAdvertiser](v2, "rpDeviceAdvertiser"));
  v6 = v5 == 0;

  if (v6)
  {
    v7 = -[MSDRapportDeviceAdvertiser initWithObserver:]([MSDRapportDeviceAdvertiser alloc], "initWithObserver:", v2);
    -[MSDDemoPeerResponder setRpDeviceAdvertiser:](v2, "setRpDeviceAdvertiser:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder rpDeviceAdvertiser](v2, "rpDeviceAdvertiser"));
    objc_msgSend(v8, "activate");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder rpMessageHandler](v2, "rpMessageHandler"));
  v10 = v9 == 0;

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder messageHandlerTable](v2, "messageHandlerTable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));

    v13 = -[MSDRapportMessageHandler initWithObserver:]([MSDRapportMessageHandler alloc], "initWithObserver:", v2);
    -[MSDDemoPeerResponder setRpMessageHandler:](v2, "setRpMessageHandler:", v13);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder rpMessageHandler](v2, "rpMessageHandler", (_QWORD)v20));
          objc_msgSend(v19, "listenForIncomingRequestMessageOfID:", v18);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v15);
    }

  }
  objc_sync_exit(v2);

}

- (void)stop
{
  MSDDemoPeerResponder *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerResponder: Stopping responder...", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder rpDeviceAdvertiser](v2, "rpDeviceAdvertiser"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder rpDeviceAdvertiser](v2, "rpDeviceAdvertiser"));
    objc_msgSend(v6, "deactivate");

    -[MSDDemoPeerResponder setRpDeviceAdvertiser:](v2, "setRpDeviceAdvertiser:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder rpMessageHandler](v2, "rpMessageHandler"));

  if (v7)
    -[MSDDemoPeerResponder setRpMessageHandler:](v2, "setRpMessageHandler:", 0);
  objc_sync_exit(v2);

}

- (id)_constructMessageHandlerTable
{
  NSString *v2;
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  void *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;
  NSString *v27;
  void *v28;
  NSString *v29;
  void *v30;
  NSString *v31;
  void *v32;
  NSString *v33;
  void *v34;
  NSString *v35;
  void *v36;
  NSString *v37;
  void *v38;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[27];
  _QWORD v59[27];

  v58[0] = CFSTR("com.apple.MobileStoreDemo.SubscribeDeviceInfo");
  v2 = NSStringFromSelector("_handleSubscribeDeviceInfoRequestMessage:");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v59[0] = v57;
  v58[1] = CFSTR("com.apple.MobileStoreDemo.FetchDeviceInfo");
  v3 = NSStringFromSelector("_handleFetchDeviceInfoRequestMessage:");
  v56 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v59[1] = v56;
  v58[2] = CFSTR("com.apple.MobileStoreDemo.InitiateAirPlayAssisted");
  v4 = NSStringFromSelector("_handleInitiateAirPlayAssistedRequestMessage:");
  v55 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v59[2] = v55;
  v58[3] = CFSTR("com.apple.MobileStoreDemo.TriggerSnapshotRevert");
  v5 = NSStringFromSelector("_handleTriggerSnapshotRevertRequestMessage:");
  v54 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v59[3] = v54;
  v58[4] = CFSTR("com.apple.MobileStoreDemo.InvokeInputRecovery");
  v6 = NSStringFromSelector("_handleInvokeInputRecoveryRequestMessage:");
  v53 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v59[4] = v53;
  v58[5] = CFSTR("com.apple.MobileStoreDemo.AdjustVolume");
  v7 = NSStringFromSelector("_handleAdjustVolumeRequestMessage:");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v59[5] = v52;
  v58[6] = CFSTR("com.apple.MobileStoreDemo.ListApps");
  v8 = NSStringFromSelector("_handleListAppsRequestMessage:");
  v51 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v59[6] = v51;
  v58[7] = CFSTR("com.apple.MobileStoreDemo.LaunchApp");
  v9 = NSStringFromSelector("_handleLaunchAppRequestMessage:");
  v50 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v59[7] = v50;
  v58[8] = CFSTR("com.apple.MobileStoreDemo.TerminateApp");
  v10 = NSStringFromSelector("_handleTerminateAppRequestMessage:");
  v49 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v59[8] = v49;
  v58[9] = CFSTR("com.apple.MobileStoreDemo.ListAvailableEnvironments");
  v11 = NSStringFromSelector("_handleListAvailableEnvironmentsRequestMessage:");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v59[9] = v48;
  v58[10] = CFSTR("com.apple.MobileStoreDemo.SetActiveEnvironment");
  v12 = NSStringFromSelector("_handleSetActiveEnvironmentRequestMessage:");
  v47 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v59[10] = v47;
  v58[11] = CFSTR("com.apple.MobileStoreDemo.SetImmersionLevel");
  v13 = NSStringFromSelector("_handleSetImmersionLevelRequestMessage:");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v59[11] = v46;
  v58[12] = CFSTR("com.apple.MobileStoreDemo.ResetToPassThrough");
  v14 = NSStringFromSelector("_handleResetToPassThroughRequestMessage:");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v59[12] = v45;
  v58[13] = CFSTR("com.apple.MobileStoreDemo.EnumerateScripts");
  v15 = NSStringFromSelector("_handleEnumerateScriptsRequestMessage:");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v59[13] = v44;
  v58[14] = CFSTR("com.apple.MobileStoreDemo.LaunchScript");
  v16 = NSStringFromSelector("_handleLaunchScriptRequestMessage:");
  v43 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v59[14] = v43;
  v58[15] = CFSTR("com.apple.MobileStoreDemo.ObtainGKResults");
  v17 = NSStringFromSelector("_handleObtainGKResultsRequestMessage:");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v59[15] = v42;
  v58[16] = CFSTR("com.apple.MobileStoreDemo.ObtainGKMetrics");
  v18 = NSStringFromSelector("_handleObtainGKMetricsRequestMessage:");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v59[16] = v41;
  v58[17] = CFSTR("com.apple.MobileStoreDemo.LoadLSMeasurements");
  v19 = NSStringFromSelector("_handleLoadLSMeasurementsRequestMessage:");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v59[17] = v20;
  v58[18] = CFSTR("com.apple.MobileStoreDemo.RetrieveHSCoachingSuggestion");
  v21 = NSStringFromSelector("_handleRetrieveHSCoachingSuggestionRequestMessage:");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v59[18] = v22;
  v58[19] = CFSTR("com.apple.MobileStoreDemo.ReadIPDStatus");
  v23 = NSStringFromSelector("_handleReadIPDStatusRequestMessage:");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v59[19] = v24;
  v58[20] = CFSTR("com.apple.MobileStoreDemo.SkipAutoIPDAdjustment");
  v25 = NSStringFromSelector("_handleSkipAutoIPDAdjustmentRequestMessage:");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v59[20] = v26;
  v58[21] = CFSTR("com.apple.MobileStoreDemo.InitiateIPDReset");
  v27 = NSStringFromSelector("_handleInitiateIPDResetRequestMessage:");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v59[21] = v28;
  v58[22] = CFSTR("com.apple.MobileStoreDemo.QueryIPDResetStage");
  v29 = NSStringFromSelector("_handleQueryIPDResetStageRequestMessage:");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v59[22] = v30;
  v58[23] = CFSTR("com.apple.MobileStoreDemo.GetAXSettings");
  v31 = NSStringFromSelector("_handleGetAXSettingsRequestMessage:");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v59[23] = v32;
  v58[24] = CFSTR("com.apple.MobileStoreDemo.SetAXSettings");
  v33 = NSStringFromSelector("_handleSetAXSettingsRequestMessage:");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v59[24] = v34;
  v58[25] = CFSTR("com.apple.MobileStoreDemo.WipeCustomerAssets");
  v35 = NSStringFromSelector("_handleWipeCustomerAssetsRequestMessage:");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v59[25] = v36;
  v58[26] = CFSTR("com.apple.MobileStoreDemo.ChangeWiFiSettings");
  v37 = NSStringFromSelector("_handleChangeWiFiSettingsRequestMessage:");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v59[26] = v38;
  v40 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 27));

  return v40;
}

- (void)_uploadPairingPassword
{
  void *v3;
  void *v4;
  void *v5;
  MSDKVStoreRequest *v6;

  v6 = objc_alloc_init(MSDKVStoreRequest);
  -[MSDKVStoreRequest setIsPost:](v6, "setIsPost:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder devicePublicID](self, "devicePublicID"));
  -[MSDKVStoreRequest setKey:](v6, "setKey:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder pairingPassword](self, "pairingPassword"));
  -[MSDKVStoreRequest setValue:](v6, "setValue:", v4);

  -[MSDServerRequest setCompletion:](v6, "setCompletion:", &stru_10013FE60);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  objc_msgSend(v5, "handleRequestAsync:", v6);

}

- (BOOL)_queryThermalMitigationStatus
{
  return 0;
}

- (id)_getDeviceAddresses
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDIpInterface getIpv4Interfaces](MSDIpInterface, "getIpv4Interfaces"));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("address"), (_QWORD)v17));
          -[NSObject addObject:](v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000CBDAC((uint64_t)v3, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));
  }
  else
  {
    v14 = sub_1000604F0();
    v3 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1000CBD38(v3, v15, v16);
    v12 = 0;
  }

  return v12;
}

- (id)_prepareDeviceInfoDictionaryForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSNumber *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAudioController sharedInstance](MSDAudioController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccountManager sharedInstance](MSDAccountManager, "sharedInstance"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAirPlayAssistedSender sharedInstance](MSDAirPlayAssistedSender, "sharedInstance"));
  v40 = objc_msgSend(v3, "extractProtocolVersion");

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v43 = (void *)v9;
  if (v9)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, kMSDKPeerDemoDevicePropertyDeviceName);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, kMSDKPeerDemoDevicePropertyDeviceName);

  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productType"));
  v42 = (void *)v11;
  if (v11)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, kMSDKPeerDemoDevicePropertyProductType);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, kMSDKPeerDemoDevicePropertyProductType);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
  if (v13)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, kMSDKPeerDemoDevicePropertySerialNumber);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, kMSDKPeerDemoDevicePropertySerialNumber);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSVersion"));
  if (v15)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, kMSDKPeerDemoDevicePropertyOSVersion);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, kMSDKPeerDemoDevicePropertyOSVersion);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "batteryCapacity")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, kMSDKPeerDemoDevicePropertyBatteryCapacity);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getCurrentWiFiSsid"));
  if (v18)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, kMSDKPeerDemoDevicePropertyWiFiNetworkName);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, kMSDKPeerDemoDevicePropertyWiFiNetworkName);

  }
  v45 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "getCurrentWiFiSignalStrength")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, kMSDKPeerDemoDevicePropertyWiFiSignalStrength);

  v44 = v8;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "existingAccounts"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("iCloud")));

  if (v22)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, kMSDKPeerDemoDevicePropertyiCloudAccountName);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, kMSDKPeerDemoDevicePropertyiCloudAccountName);

  }
  objc_msgSend(v6, "getVolumeForCategory:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, kMSDKPeerDemoDevicePropertyMainVolume);

  objc_msgSend(v6, "getVolumeForCategory:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, kMSDKPeerDemoDevicePropertyEnvironmentVolume);

  objc_msgSend(v6, "getVolumeForCategory:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, kMSDKPeerDemoDevicePropertyPhoneCallVolume);

  objc_msgSend(v6, "getVolumeForCategory:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, kMSDKPeerDemoDevicePropertyAudioVideoVolume);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isContentFrozen")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, kMSDKPeerDemoDevicePropertyContentFrozen);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v46, "isSenderReady")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, kMSDKPeerDemoDevicePropertyAirPlayAssistedReady);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDDemoPeerResponder _queryThermalMitigationStatus](self, "_queryThermalMitigationStatus")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, kMSDKPeerDemoDevicePropertyThermalMitigationNeeded);

  if ((unint64_t)v40 >= 2)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder _getDeviceAddresses](self, "_getDeviceAddresses"));
    if (v31)
    {
      v32 = objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, kMSDKPeerDemoDevicePropertyIpAddresses);
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, kMSDKPeerDemoDevicePropertyIpAddresses);

    }
    v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", BYSetupAssistantNeedsToRun(v32));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, kMSDKPeerDemoDevicePropertyBuddyInProgress);

  }
  v36 = sub_1000604F0();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    sub_1000CBE30();

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));
  return v38;
}

- (id)_handleSubscribeDeviceInfoRequestMessage:(id)a3
{
  id v4;
  void *v5;
  MSDRapportDevice *v6;
  void *v7;
  MSDRapportDevice *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  MSDRapportMessage *v12;
  void *v13;
  MSDRapportMessage *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v6 = [MSDRapportDevice alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
  v8 = -[MSDRapportDevice initWithIncomingOptions:](v6, "initWithIncomingOptions:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder subscribers](self, "subscribers"));
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder subscribers](self, "subscribers"));
    objc_msgSend(v11, "addObject:", v8);

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Result"));
  v12 = [MSDRapportMessage alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v14 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v12, "initWithIdentifier:andPayload:usingOptions:", v13, v5, 0);

  return v14;
}

- (id)_handleFetchDeviceInfoRequestMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder _prepareDeviceInfoDictionaryForRequest:](self, "_prepareDeviceInfoDictionaryForRequest:", v4));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("DeviceInfo"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Result"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v5, 0);
  return v9;
}

- (id)_handleInitiateAirPlayAssistedRequestMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  MSDRapportMessage *v13;
  void *v14;
  MSDRapportMessage *v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAirPlayAssistedSender sharedInstance](MSDAirPlayAssistedSender, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("APParameters")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("APDiscoveryMode")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v10 = objc_msgSend(v4, "activateSenderUsingParametersData:discoveryMode:", v6, objc_msgSend(v8, "unsignedIntegerValue"));
  v11 = CFSTR("Result");
  if (v10)
  {
    v12 = (const __CFString *)&__kCFBooleanTrue;
  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
    v11 = CFSTR("Reason");
    v12 = CFSTR("An error has occurred.");
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v11);
  v13 = [MSDRapportMessage alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v15 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v13, "initWithIdentifier:andPayload:usingOptions:", v14, v9, 0);

  return v15;
}

- (id)_handleTriggerSnapshotRevertRequestMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  dispatch_time_t v10;
  MSDRapportMessage *v11;
  void *v12;
  MSDRapportMessage *v13;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RebootAfterRevert")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  if (objc_msgSend(v4, "canRevertSnapshot"))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    v10 = dispatch_time(0, 3000000000);
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1000AE4F0;
    v18 = &unk_10013DE28;
    v19 = v4;
    v20 = v6;
    dispatch_after(v10, v9, &v15);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Result"), v15, v16, v17, v18);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("An error has occurred."), CFSTR("Reason"));
  }
  v11 = [MSDRapportMessage alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v13 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v11, "initWithIdentifier:andPayload:usingOptions:", v12, v7, 0);

  return v13;
}

- (id)_handleInvokeInputRecoveryRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CBE9C();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleAdjustVolumeRequestMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  double v13;
  unsigned int v14;
  const __CFString *v15;
  const __CFString *v16;
  MSDRapportMessage *v17;
  void *v18;
  MSDRapportMessage *v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAudioController sharedInstance](MSDAudioController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VolumeValue")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VolumeCategory")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  objc_msgSend(v6, "floatValue");
  v11 = v10;
  v12 = objc_msgSend(v8, "unsignedIntegerValue");
  LODWORD(v13) = v11;
  v14 = objc_msgSend(v4, "setVolumeTo:forCategory:", v12, v13);
  v15 = CFSTR("Result");
  if (v14)
  {
    v16 = (const __CFString *)&__kCFBooleanTrue;
  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
    v15 = CFSTR("Reason");
    v16 = CFSTR("An error has occurred.");
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);
  v17 = [MSDRapportMessage alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v19 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v17, "initWithIdentifier:andPayload:usingOptions:", v18, v9, 0);

  return v19;
}

- (id)_handleListAppsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  MSDRapportMessage *v31;
  void *v32;
  MSDRapportMessage *v33;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v3 = a3;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppListKind")));

  v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v8 = objc_msgSend(v5, "unsignedIntegerValue");
  v37 = v5;
  if (v8 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "runningApps:", 1));
  }
  else if (v8)
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000CBF70();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "visibleApps"));
  }
  v35 = (void *)v6;
  v36 = v3;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v42;
    obj = v12;
    while (2)
    {
      v17 = 0;
      v18 = v15;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bundleLocalizedNameForInstalledApp:", v19, v35));
        v21 = objc_msgSend(objc_alloc((Class)MSDKPeerDemoApp), "initWithIdentifier:andLocalizedName:", v19, v20);
        v40 = v18;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, &v40));
        v15 = v40;

        if (!v22)
        {
          v23 = sub_1000604F0();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            sub_1000CBEC8(v19, v15, v24);

          v12 = obj;
          v25 = v35;
          objc_msgSend(v35, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
          v27 = (__CFString *)v26;
          if (v26)
            v28 = (const __CFString *)v26;
          else
            v28 = CFSTR("An error has occurred.");
          v29 = CFSTR("Reason");
          v30 = v35;
          goto LABEL_25;
        }
        objc_msgSend(v7, "addObject:", v22);

        v17 = (char *)v17 + 1;
        v18 = v15;
      }
      while (v14 != v17);
      v12 = obj;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }

  v25 = v35;
  objc_msgSend(v35, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Result"));
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v7));
  v29 = CFSTR("AppArchiveList");
  v30 = v35;
  v28 = v27;
LABEL_25:
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, v29, v35);

  v31 = [MSDRapportMessage alloc];
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
  v33 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v31, "initWithIdentifier:andPayload:usingOptions:", v32, v25, 0);

  return v33;
}

- (id)_handleLaunchAppRequestMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  MSDRapportMessage *v12;
  void *v13;
  MSDRapportMessage *v14;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppIdentifier")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v16 = 0;
  v7 = +[MSDAppLauncherTerminator launchApp:withOptions:outError:](MSDAppLauncherTerminator, "launchApp:withOptions:outError:", v5, 0, &v16);
  v8 = v16;
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Result"));
  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = CFSTR("An error has occurred.");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("Reason"));

  }
  v12 = [MSDRapportMessage alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v14 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v12, "initWithIdentifier:andPayload:usingOptions:", v13, v6, 0);
  return v14;
}

- (id)_handleTerminateAppRequestMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  MSDRapportMessage *v12;
  void *v13;
  MSDRapportMessage *v14;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppIdentifier")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v16 = 0;
  v7 = +[MSDAppLauncherTerminator terminateApp:outError:](MSDAppLauncherTerminator, "terminateApp:outError:", v5, &v16);
  v8 = v16;
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Result"));
  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = CFSTR("An error has occurred.");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("Reason"));

  }
  v12 = [MSDRapportMessage alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v14 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v12, "initWithIdentifier:andPayload:usingOptions:", v13, v6, 0);
  return v14;
}

- (id)_handleListAvailableEnvironmentsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CBFD4();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleSetActiveEnvironmentRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CBFD4();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleSetImmersionLevelRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CBFD4();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleResetToPassThroughRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CBFD4();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleEnumerateScriptsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC000();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleLaunchScriptRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC02C();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleObtainGKResultsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC058();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleObtainGKMetricsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC084();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleLoadLSMeasurementsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC0B0();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleRetrieveHSCoachingSuggestionRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC0DC();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleReadIPDStatusRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC108();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleSkipAutoIPDAdjustmentRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC134();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleInitiateIPDResetRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC160();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleQueryIPDResetStageRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC18C();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleGetAXSettingsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC1B8();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleSetAXSettingsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC1E4();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleWipeCustomerAssetsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  MSDRapportMessage *v7;
  void *v8;
  MSDRapportMessage *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000CC210();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Operation not supported"), CFSTR("Reason"));
  v7 = [MSDRapportMessage alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v9 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v7, "initWithIdentifier:andPayload:usingOptions:", v8, v4, 0);
  return v9;
}

- (id)_handleChangeWiFiSettingsRequestMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  MSDRapportMessage *v20;
  void *v21;
  MSDRapportMessage *v22;
  id v24;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v6 = objc_opt_class(MSDKPeerDemoWiFiSettings, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WiFiSettingsArchive")));
  v24 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v6, v8, &v24));
  v10 = v24;

  if (v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](MSDWiFiHelper, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ssid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "password"));
    if (objc_msgSend(v13, "length"))
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "password"));
    else
      v14 = 0;

    if ((-[NSObject configureWiFi:password:](v11, "configureWiFi:password:", v12, v14) & 1) != 0)
    {

      objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Result"));
      goto LABEL_14;
    }
    v16 = objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741072, CFSTR("Failed to configure WiFi.")));

    v10 = (id)v16;
  }
  else
  {
    v15 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000CC23C(v10, v11);
  }

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Result"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription"));
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("An error has occurred.");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("Reason"));

LABEL_14:
  v20 = [MSDRapportMessage alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v22 = -[MSDRapportMessage initWithIdentifier:andPayload:usingOptions:](v20, "initWithIdentifier:andPayload:usingOptions:", v21, v4, 0);

  return v22;
}

- (void)advertiserDidUpdateLocalDevicePublicIDFrom:(id)a3 to:(id)a4
{
  id v6;
  MSDDemoPeerResponder *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[MSDDemoPeerResponder setDevicePublicID:](v7, "setDevicePublicID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder pairingPassword](v7, "pairingPassword"));

  if (v8)
    -[MSDDemoPeerResponder _uploadPairingPassword](v7, "_uploadPairingPassword");
  objc_sync_exit(v7);

}

- (void)advertiserDidShowPairingPassword:(id)a3
{
  MSDDemoPeerResponder *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MSDDemoPeerResponder setPairingPassword:](v4, "setPairingPassword:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder devicePublicID](v4, "devicePublicID"));

  if (v5)
    -[MSDDemoPeerResponder _uploadPairingPassword](v4, "_uploadPairingPassword");
  objc_sync_exit(v4);

}

- (void)advertiserDidHidePairingPassword
{
  MSDDemoPeerResponder *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MSDDemoPeerResponder setPairingPassword:](obj, "setPairingPassword:", 0);
  objc_sync_exit(obj);

}

- (id)didReceiveRequestMessage:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  SEL v11;
  uint64_t (*v12)(MSDDemoPeerResponder *, SEL, id);
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerResponder messageHandlerTable](self, "messageHandlerTable"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));
  v11 = NSSelectorFromString(v10);

  if (!v11)
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000CC2BC();

    goto LABEL_12;
  }
  v12 = (uint64_t (*)(MSDDemoPeerResponder *, SEL, id))-[MSDDemoPeerResponder methodForSelector:](self, "methodForSelector:", v11);
  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000CC320();

LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerResponder: Received request message: %{public}@ from device: %{public}@", (uint8_t *)&v21, 0x16u);
  }

  v16 = v12(self, v11, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
LABEL_13:

  return v17;
}

- (void)didReceiveEventMessage:(id)a3 fromDevice:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;

  v5 = a3;
  v6 = a4;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1000CC384();

}

- (MSDRapportDeviceAdvertiser)rpDeviceAdvertiser
{
  return self->_rpDeviceAdvertiser;
}

- (void)setRpDeviceAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_rpDeviceAdvertiser, a3);
}

- (MSDRapportMessageHandler)rpMessageHandler
{
  return self->_rpMessageHandler;
}

- (void)setRpMessageHandler:(id)a3
{
  objc_storeStrong((id *)&self->_rpMessageHandler, a3);
}

- (NSDictionary)messageHandlerTable
{
  return self->_messageHandlerTable;
}

- (void)setMessageHandlerTable:(id)a3
{
  objc_storeStrong((id *)&self->_messageHandlerTable, a3);
}

- (NSMutableArray)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
  objc_storeStrong((id *)&self->_subscribers, a3);
}

- (NSString)devicePublicID
{
  return self->_devicePublicID;
}

- (void)setDevicePublicID:(id)a3
{
  objc_storeStrong((id *)&self->_devicePublicID, a3);
}

- (NSString)pairingPassword
{
  return self->_pairingPassword;
}

- (void)setPairingPassword:(id)a3
{
  objc_storeStrong((id *)&self->_pairingPassword, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingPassword, 0);
  objc_storeStrong((id *)&self->_devicePublicID, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_messageHandlerTable, 0);
  objc_storeStrong((id *)&self->_rpMessageHandler, 0);
  objc_storeStrong((id *)&self->_rpDeviceAdvertiser, 0);
}

@end
