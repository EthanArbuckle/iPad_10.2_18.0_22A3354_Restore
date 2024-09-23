@implementation MSDMailProcessor

+ (id)sharedInstance
{
  if (qword_1001753D0 != -1)
    dispatch_once(&qword_1001753D0, &stru_10013EE68);
  return (id)qword_1001753C8;
}

- (MSDMailProcessor)init
{
  id v3;
  NSObject *v4;
  MSDMailProcessor *v5;
  MSDMailProcessor *v6;
  void *v7;
  MSDMailProcessor *v8;
  objc_super v10;
  uint8_t buf[16];

  v3 = sub_1000605D0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDMailProcessor init", buf, 2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)MSDMailProcessor;
  v5 = -[MSDMailProcessor init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDMailProcessor setDemodReady:](v5, "setDemodReady:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    -[MSDMailProcessor setDevice:](v6, "setDevice:", v7);

    v8 = v6;
  }

  return v6;
}

- (void)start
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v3 = sub_1000605D0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDMailProcessor start", v11, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hubHostName"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hubPort"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPushNotificationHandler sharedInstance](MSDPushNotificationHandler, "sharedInstance"));
      objc_msgSend(v10, "enablePushNotifications");

      -[MSDMailProcessor setPingInterval:](self, "setPingInterval:", 30);
      -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 1, 0);
      -[MSDMailProcessor startPeriodicPing](self, "startPeriodicPing");
    }
  }
  else
  {

  }
}

- (void)scheduleF200EventPing
{
  -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 4, 0);
}

- (void)reportCachingHubFailed
{
  -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 16, 0);
}

- (void)reportS3ServerFailed
{
  -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 32, 0);
}

- (void)reportBundleInstallCompleted
{
  -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 8, 1);
}

- (void)sendPushNotificationPing
{
  -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 2, 0);
}

- (void)sendImmediateDeviceInfoPing
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[MSDMailProcessor sendImmediateDeviceInfoPing]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - Sending immediate device info ping.", (uint8_t *)&v5, 0xCu);
  }

  -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 8, 0);
}

- (void)startPeriodicPing
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;

  v3 = sub_1000605D0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hubHostName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hubPort"));
    *(_DWORD *)buf = 136315650;
    v12 = "-[MSDMailProcessor startPeriodicPing]";
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: serverAddress is %{public}@, serverPort is %{public}@.", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000613E4;
  block[3] = &unk_10013D840;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)handlePingTimerTicking:(id)a3
{
  -[MSDMailProcessor pingAndProcess:waitForCompletion:](self, "pingAndProcess:waitForCompletion:", 1, 0);
}

- (unint64_t)pingInterval
{
  return self->_pingInterval;
}

- (void)setPingInterval:(unint64_t)a3
{
  unint64_t pingInterval;
  id v5;
  NSObject *v6;
  unint64_t v7;
  int v8;
  unint64_t v9;

  pingInterval = self->_pingInterval;
  self->_pingInterval = a3;
  v5 = sub_1000605D0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_pingInterval;
    v8 = 134217984;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ping interval changed to %tu", (uint8_t *)&v8, 0xCu);
  }

  if (pingInterval)
    -[MSDMailProcessor startPeriodicPing](self, "startPeriodicPing");
}

- (BOOL)waitingForCommand
{
  return self->_waitingForCommand;
}

- (void)setWaitingForCommand:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t v6;

  if (self->_waitingForCommand != a3)
  {
    v3 = a3;
    self->_waitingForCommand = a3;
    v5 = -[MSDMailProcessor pingIntervalToUse](self, "pingIntervalToUse");
    v6 = -[MSDMailProcessor pingInterval](self, "pingInterval");
    if (v3)
    {
      if (v6 <= v5)
        return;
LABEL_6:
      -[MSDMailProcessor setPingInterval:](self, "setPingInterval:", v5);
      return;
    }
    if (v6 != v5)
      goto LABEL_6;
  }
}

- (void)pingAndProcess:(unint64_t)a3 waitForCompletion:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v5;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[6];

  v4 = a4;
  v5 = a3;
  if ((-[MSDMailProcessor queuedPingType](self, "queuedPingType") & a3) == 0)
  {
    if ((v5 & 8) != 0)
      v5 = 1;
    -[MSDMailProcessor setQueuedPingType:](self, "setQueuedPingType:", -[MSDMailProcessor queuedPingType](self, "queuedPingType") | v5);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000616F8;
    v11[3] = &unk_10013EE90;
    v11[4] = self;
    v11[5] = v5;
    v7 = objc_retainBlock(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pollingQueue"));
    v10 = v9;
    if (v4)
      dispatch_sync(v9, v7);
    else
      dispatch_async(v9, v7);

  }
}

- (id)pingWithType:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MSDMailProcessor *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  MSDPingRequest *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v87;
  uint8_t buf[16];

  v5 = sub_1000605D0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000C1800();

  if (a3 - 1 <= 1)
  {
    if (-[MSDMailProcessor fullKeysSent](self, "fullKeysSent"))
      v7 = objc_claimAutoreleasedReturnValue(-[MSDMailProcessor reducedKeyList](self, "reducedKeyList"));
    else
      v7 = objc_claimAutoreleasedReturnValue(-[MSDMailProcessor fullKeyList](self, "fullKeyList"));
    v12 = (void *)v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v86 = v12;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceInformationForPing:", v12));

    if (!v9)
    {
      v63 = sub_1000605D0();
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        sub_1000C13F8(self, v64);

      v18 = 0;
      v15 = 0;
      v34 = 0;
      v32 = 0;
      v9 = 0;
      goto LABEL_51;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("InternalStatus")));
    v15 = v14;
    if (v14
      && objc_msgSend(v14, "intValue") != 199
      && !-[MSDMailProcessor demodReady](self, "demodReady"))
    {
      -[MSDMailProcessor setDemodReady:](self, "setDemodReady:", 1);
      -[MSDMailProcessor setPingInterval:](self, "setPingInterval:", -[MSDMailProcessor pingIntervalToUse](self, "pingIntervalToUse"));
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hubSuppliedSettings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("PingFrequency")));

    if (v18
      && (v20 = objc_opt_class(NSNumber, v19), (objc_opt_isKindOfClass(v18, v20) & 1) != 0)
      && objc_msgSend(v18, "unsignedIntegerValue"))
    {
      v21 = objc_msgSend(v18, "integerValue");
    }
    else
    {
      v21 = -[MSDMailProcessor pingInterval](self, "pingInterval");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
    objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("MSDPingFrequency"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MSDMailProcessor convertPingType:](self, "convertPingType:", a3)));
    objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("MSDDemoPingType"));
    goto LABEL_25;
  }
  if (a3 == 32)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "getS3ServerFailureEventForPing"));

    if (v9)
    {
      v10 = self;
      v11 = 32;
      goto LABEL_24;
    }
    v78 = sub_1000605D0();
    v70 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_1000C1790(v70, v79, v80, v81, v82, v83, v84, v85);
LABEL_72:

    v18 = 0;
    v15 = 0;
    v34 = 0;
    v32 = 0;
    v9 = 0;
    v86 = 0;
    goto LABEL_51;
  }
  if (a3 == 16)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getCachingHubFailureEventForPing"));

    if (v9)
    {
      v10 = self;
      v11 = 16;
LABEL_24:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MSDMailProcessor convertPingType:](v10, "convertPingType:", v11)));
      objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("MSDDemoPingType"));
      v18 = 0;
      v15 = 0;
      v86 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v69 = sub_1000605D0();
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_1000C1720(v70, v71, v72, v73, v74, v75, v76, v77);
    goto LABEL_72;
  }
  v18 = 0;
  v15 = 0;
  v9 = 0;
  v86 = 0;
LABEL_26:
  if ((os_variant_has_internal_content("com.apple.mobilestoredemod") & 1) != 0)
  {
    v25 = sub_1000604F0();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_1000C16C0();
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("MSDExistingAccounts")));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("iCloudRecoveryKey")));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MSDExistingAccounts")));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("<redacted>"), CFSTR("iCloudRecoveryKey"));

    v29 = sub_1000604F0();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      sub_1000C16C0();

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MSDExistingAccounts")));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v26, CFSTR("iCloudRecoveryKey"));

  }
  v32 = objc_alloc_init(MSDPingRequest);
  -[MSDPingRequest setRequestInfo:](v32, "setRequestInfo:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "handleRequestSync:", v32));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "error"));
  if (v35)
  {
    v62 = sub_1000604F0();
    v53 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      sub_1000C1638(v34, v53);
    goto LABEL_50;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "data"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "statusCode"));
  v38 = objc_msgSend(v37, "intValue");

  if (!v36)
  {
    v52 = sub_1000605D0();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      sub_1000C1484(v53, v54, v55, v56, v57, v58, v59, v60);
LABEL_50:

LABEL_51:
    v49 = 0;
    v47 = 0;
    v36 = 0;
LABEL_54:
    v51 = 0;
    goto LABEL_55;
  }
  if (a3 == 1 && (v38 & 0xFFFFFFFB) == 0xC8)
  {
    -[MSDMailProcessor setFullKeysSent:](self, "setFullKeysSent:", 1);
    if (objc_msgSend(v15, "intValue") == 20 || objc_msgSend(v15, "intValue") == 100)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("MSDExistingAccounts"), v86));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("iCloudCDPState")));

      v41 = objc_msgSend(v40, "integerValue");
      if (v41 == objc_msgSend(&off_10014D9A0, "integerValue"))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "iCloudAccountRecoveryKey"));

        if (v43)
        {
          v44 = sub_1000604F0();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "iCloud account recovery key successfully uploaded. Removing local copy...", buf, 2u);
          }

          v46 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          objc_msgSend(v46, "saveiCloudAccountRecoveryKey:", 0);

        }
      }

    }
  }
  if (!objc_msgSend(v36, "length", v86))
  {
    v49 = 0;
LABEL_53:
    v47 = 0;
    goto LABEL_54;
  }
  v87 = 0;
  v47 = (id)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v36, 0, &v87));
  v49 = v87;
  if (!v47)
  {
    v65 = sub_1000605D0();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      sub_1000C14F4(v49, (uint64_t)v36, v66);

    goto LABEL_53;
  }
  v50 = objc_opt_class(NSDictionary, v48);
  if ((objc_opt_isKindOfClass(v47, v50) & 1) == 0)
  {
    v67 = sub_1000605D0();
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_1000C15C8();

    goto LABEL_54;
  }
  v47 = v47;
  v51 = v47;
LABEL_55:

  return v51;
}

- (BOOL)ack:(BOOL)a3
{
  _BOOL8 v3;
  MSDAckRequest *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(MSDAckRequest);
  -[MSDAckRequest setStatus:](v4, "setStatus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "handleRequestSync:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
  LOBYTE(v5) = v7 == 0;

  return (char)v5;
}

- (id)fullKeyList
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("UniqueDeviceID"), CFSTR("MSDTotalStorageAvailable"), CFSTR("MSDPricingRequestUpdate"), CFSTR("BatteryCurrentCapacity"), CFSTR("BatteryIsCharging"), CFSTR("ExternalPowerSourceConnected"), CFSTR("MSDDemoContentStatus"), CFSTR("MSDDemoManualUpdateState"), CFSTR("MSDNetworkInterfacesEnabled"), CFSTR("MSDCurrentWiFiSSID"), CFSTR("MSDPersistentWiFiSSID"), CFSTR("MSDCellularConfiguration"), CFSTR("MSDHubSuppliedSettingsID"), CFSTR("MSDApnsKey"), CFSTR("MinOSVersionAvailable"), CFSTR("ProductVersion"), CFSTR("BuildVersion"),
           CFSTR("MSDDemoProductDescription"),
           CFSTR("MSDDemoLastRebootTime"),
           CFSTR("MSDDemoLastRevertTime"),
           CFSTR("MSDLastShallowRefreshTime"),
           CFSTR("MSDDemoSystemLanguage"),
           CFSTR("MSDDemoSystemRegion"),
           CFSTR("MSDDemoPreferencesLanguage"),
           CFSTR("MSDDemoPreferencesRegion"),
           CFSTR("IdleDuration"),
           CFSTR("PairedDeviceInfo"),
           0);
}

- (id)reducedKeyList
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("UniqueDeviceID"), CFSTR("MSDPricingRequestUpdate"), CFSTR("BatteryCurrentCapacity"), CFSTR("BatteryIsCharging"), CFSTR("ExternalPowerSourceConnected"), CFSTR("MSDDemoContentStatus"), CFSTR("MSDTotalStorageAvailable"), CFSTR("MSDDemoManualUpdateState"), CFSTR("MSDNetworkInterfacesEnabled"), CFSTR("MSDCurrentWiFiSSID"), CFSTR("MSDPersistentWiFiSSID"), CFSTR("MSDCellularConfiguration"), CFSTR("MSDHubSuppliedSettingsID"), CFSTR("MSDApnsKey"), CFSTR("MinOSVersionAvailable"), CFSTR("MSDLastShallowRefreshTime"), CFSTR("MSDDemoSystemLanguage"),
           CFSTR("MSDDemoSystemRegion"),
           CFSTR("MSDDemoPreferencesLanguage"),
           CFSTR("MSDDemoPreferencesRegion"),
           CFSTR("IdleDuration"),
           CFSTR("PairedDeviceInfo"),
           0);
}

- (BOOL)processRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  double v18;
  unsigned __int8 v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  unsigned __int8 v63;
  void *v64;
  NSObject *v65;
  unsigned __int8 v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  NSObject *v72;
  void *v73;
  unsigned __int8 v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  unsigned int v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  NSObject *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  unsigned int v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  id v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  unsigned int v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  NSObject *v115;
  id v116;
  NSObject *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  int v127;
  void *v128;
  unsigned int v129;
  NSObject *v130;
  uint64_t v131;
  void *v132;
  _QWORD block[4];
  id v134;
  unsigned int v135;
  char v136;
  uint64_t v137;
  uint8_t buf[4];
  _QWORD v139[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPairedWatchProxy sharedInstance](MSDPairedWatchProxy, "sharedInstance"));
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Command")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("IgnorePairedDevice")));
    v8 = objc_msgSend(v7, "BOOLValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    if (objc_msgSend(v9, "isBetterTogetherDemo"))
      v10 = objc_msgSend(v5, "paired") & (v8 ^ 1);
    else
      v10 = 0;

    v15 = -[MSDMailProcessor isAllowedRequest:relayNeeded:](self, "isAllowedRequest:relayNeeded:", v4, v10);
    -[MSDMailProcessor ack:](self, "ack:", v15);
    if (!v15)
    {
      v118 = sub_1000605D0();
      v115 = objc_claimAutoreleasedReturnValue(v118);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        sub_1000C199C();
      v40 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      goto LABEL_132;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Duration")));
    v13 = v16;
    v127 = v10;
    if (v16 && (uint64_t)objc_msgSend(v16, "integerValue") >= 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)objc_msgSend(v13, "integerValue")));
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v129 = (int)v18;

    }
    else
    {
      v129 = 0;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ContentType")));
    if (objc_msgSend(v12, "containsObject:", CFSTR("Demo")))
    {
      v137 = 0;
      v131 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ManifestInfo")));
      v19 = -[MSDMailProcessor updateManifestInfo:error:](self, "updateManifestInfo:error:");
      v11 = 0;
      if ((v19 & 1) == 0)
      {
        v120 = sub_1000604F0();
        v115 = objc_claimAutoreleasedReturnValue(v120);
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
          sub_1000C1910(v11, v115);
        goto LABEL_128;
      }
      v20 = 1;
    }
    else
    {
      v131 = 0;
      v11 = 0;
      v20 = 0;
    }
    if (objc_msgSend(v12, "containsObject:", CFSTR("Pricing")))
      v20 |= 2u;
    v132 = v12;
    if (objc_msgSend(v12, "containsObject:", CFSTR("Account")))
      v20 |= 4u;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("RevertSnapshot")))
      v21 = v20 | 8;
    else
      v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("BackgroundDownloadOnly")));
    v23 = objc_msgSend(v22, "BOOLValue");

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("UpdateContent")) && !v23
      || objc_msgSend(v6, "isEqualToString:", CFSTR("UpdateOS")))
    {
      v24 = v13;
      v25 = v5;
      v26 = v11;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](MSDDemoUpdateTimeKeeper, "sharedInstance"));
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "setCompletionTime:reserveTimeForCleanup:", v129, 1));

      if (v28)
      {
        v11 = (id)v28;
        v40 = (void *)v131;
        v12 = v132;
        v5 = v25;
        v13 = v24;
        goto LABEL_133;
      }
      v11 = 0;
      v5 = v25;
      v13 = v24;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ChangePingFrequency")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("ChangeSettings")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("HoldPowerAssertion")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("LiftPowerAssertion")) & 1) == 0)
    {
      v125 = v11;
      if (((objc_msgSend(v6, "isEqualToString:", CFSTR("UpdateContent")) ^ 1 | v23) & 1) == 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("OnlyInstallCriticalComponents")));

        if (v29)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("OnlyInstallCriticalComponents")));
          v31 = objc_msgSend(v30, "BOOLValue");
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          objc_msgSend(v32, "setCriticalUpdatePrioritized:", v31);

        }
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      v34 = objc_msgSend(v33, "saveOperationRequest:requestFlag:completeBy:", v6, v21, v129);

      v11 = v125;
      if ((v34 & 1) == 0)
      {
        v121 = sub_1000605D0();
        v115 = objc_claimAutoreleasedReturnValue(v121);
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
          sub_1000C18E4();
        v40 = (void *)v131;
        v12 = v132;
        v11 = v125;
        goto LABEL_132;
      }
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("UpdateContent")))
    {
      if ((v21 & 4) == 0)
      {
        v124 = v13;
        v126 = v11;
        v35 = v5;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "manifestPath"));
        objc_msgSend(v36, "removeItemAtPath:error:", v38, 0);

        if (v23)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBackgroundDownload sharedInstance](MSDBackgroundDownload, "sharedInstance"));
          objc_msgSend(v39, "kickOffBackgroundDownload");

          v14 = 1;
          v5 = v35;
          v13 = v124;
LABEL_39:
          v12 = v132;
LABEL_40:
          v40 = (void *)v131;
          v11 = v126;
LABEL_54:

          goto LABEL_55;
        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
        objc_msgSend(v52, "startFullScreenUIWith:allowCancel:", CFSTR("IN_PROGRESS"), 1);

        v53 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        objc_msgSend(v53, "setWaitingForCommand:", 0);

        -[MSDMailProcessor setWaitingForCommand:](self, "setWaitingForCommand:", 0);
        v5 = v35;
        v12 = v132;
        if ((v21 & 2) != 0)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          v55 = objc_msgSend(v54, "mode");

          if (v55 == 5)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
            objc_msgSend(v56, "switchModeImmediately:", 2);

          }
        }
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
        v13 = v124;
        if ((objc_msgSend(v57, "macOS") & 1) == 0)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
          if ((objc_msgSend(v58, "iOS") & 1) == 0)
          {

            v11 = v126;
LABEL_73:
            if ((v21 & 1) != 0)
            {
              v64 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
              v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "demoUpdateQueue"));
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100063404;
              block[3] = &unk_10013EEB8;
              v136 = v127;
              v134 = v5;
              v135 = v129;
              dispatch_async(v65, block);

              v11 = v126;
            }
            goto LABEL_52;
          }

        }
        v11 = v126;
        if ((_DWORD)v21 == 2)
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPricingUpdateController sharedInstance](MSDPricingUpdateController, "sharedInstance"));
          v14 = 1;
          objc_msgSend(v59, "setSwitchModeAfterCompletion:", 1);

          v45 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
          objc_msgSend(v45, "updateStage:", 17);
          goto LABEL_43;
        }
        goto LABEL_73;
      }
      v48 = sub_1000604F0();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      v12 = v132;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Account update.", buf, 2u);
      }

      v50 = objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      -[NSObject switchModeImmediately:](v50, "switchModeImmediately:", 2);
LABEL_51:

LABEL_52:
      v14 = 1;
      goto LABEL_53;
    }
    v12 = v132;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("UpdateOS")))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](MSDUIHelper, "sharedInstance"));
      v14 = 1;
      objc_msgSend(v41, "startFullScreenUIWith:allowCancel:", CFSTR("IN_PROGRESS"), 1);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      objc_msgSend(v42, "saveOSUpdateRequest:", v4);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      objc_msgSend(v43, "setWaitingForCommand:", 0);

      -[MSDMailProcessor setWaitingForCommand:](self, "setWaitingForCommand:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      objc_msgSend(v44, "switchModeImmediately:", 7);

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
      v46 = v11;
      v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "demoUpdateQueue"));
      dispatch_async(v47, &stru_10013EED8);

      v11 = v46;
LABEL_43:

LABEL_53:
      v40 = (void *)v131;
      goto LABEL_54;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Restart")))
    {
      if (!v127 || objc_msgSend(v5, "reboot"))
      {
        v50 = objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        -[NSObject reboot](v50, "reboot");
        goto LABEL_51;
      }
      v40 = (void *)v131;
LABEL_133:
      v14 = 0;
      goto LABEL_54;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("TurnSnapshotON")))
    {
      v60 = v11;
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      objc_msgSend(v61, "setWaitingForCommand:", 0);

      -[MSDMailProcessor setWaitingForCommand:](self, "setWaitingForCommand:", 0);
      if (v127 && !objc_msgSend(v5, "lockSnapshot"))
        goto LABEL_140;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      v63 = objc_msgSend(v62, "lockSnapshot");
LABEL_79:
      v66 = v63;

      if ((v66 & 1) != 0)
      {
        v14 = 1;
LABEL_81:
        v40 = (void *)v131;
        v11 = v60;
        goto LABEL_54;
      }
LABEL_140:
      v40 = (void *)v131;
      v11 = v60;
      goto LABEL_133;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("TurnSnapshotOFF")))
    {
      v60 = v11;
      if (v127 && !objc_msgSend(v5, "unlockSnapshot"))
        goto LABEL_140;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      v63 = objc_msgSend(v62, "unlockSnapshot");
      goto LABEL_79;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("RevertSnapshot")))
    {
      v60 = v11;
      if (v127 && !objc_msgSend(v5, "revertSnapshot"))
        goto LABEL_140;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      v63 = objc_msgSend(v62, "revertSnapshot");
      goto LABEL_79;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Virgin")))
    {
      v126 = v11;
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ObliterateDevice")));
      v68 = objc_msgSend(v67, "BOOLValue");

      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PreserveESim")));
      v70 = objc_msgSend(v69, "BOOLValue");

      v71 = sub_1000604F0();
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v139[0]) = (_DWORD)v68;
        WORD2(v139[0]) = 1024;
        *(_DWORD *)((char *)v139 + 6) = (_DWORD)v70;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Unenrolling device with obliteration: %{BOOL}d and preserve eSim: %{BOOL}d", buf, 0xEu);
      }

      if (v127)
        objc_msgSend(v5, "unenrollWithObliteration:callUnregister:", v68, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      v74 = objc_msgSend(v73, "unenrollWithObliteration:preserveESim:callUnregister:preserveDDLFlag:", v68, v70, 0, 0);

      if ((v74 & 1) != 0)
      {
        v14 = 1;
        goto LABEL_40;
      }
      v40 = (void *)v131;
      v11 = v126;
      goto LABEL_133;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("ChangeSettings")))
    {
      v126 = v11;
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "hubSuppliedSettings"));

      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Settings")));
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      objc_msgSend(v78, "saveHubSuppliedSettings:", v77);

      v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v76, "objectForKey:", CFSTR("StoreHours")));
      v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", CFSTR("StoreHours")));
      v123 = (void *)v80;
      if (v80)
      {
        v82 = (void *)v80;
        v83 = objc_opt_class(NSArray, v81);
        if ((objc_opt_isKindOfClass(v82, v83) & 1) != 0
          && objc_msgSend(v82, "count")
          && (objc_msgSend(v79, "isEqualToArray:", v82) & 1) == 0)
        {
          v84 = sub_1000604F0();
          v85 = objc_claimAutoreleasedReturnValue(v84);
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v139[0] = "-[MSDMailProcessor processRequest:]";
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%s - ChangeSettings has new 'StoreHours' set.", buf, 0xCu);
          }

          v86 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          objc_msgSend(v86, "refreshStoreHoursManagerUsingSettings");

          v87 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          v88 = objc_msgSend(v87, "isContentFrozen");

          if (v88)
          {
            v89 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
            objc_msgSend(v89, "setupSnapshotRevertTimer");

          }
        }
      }
      v130 = v76;
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", CFSTR("PingFrequency")));
      if (v91)
      {
        v92 = objc_opt_class(NSNumber, v90);
        if ((objc_opt_isKindOfClass(v91, v92) & 1) != 0)
        {
          if (objc_msgSend(v91, "unsignedIntegerValue"))
          {
            v93 = objc_msgSend(v91, "unsignedIntegerValue");
            if (v93 != (id)-[MSDMailProcessor pingInterval](self, "pingInterval"))
            {
              v94 = sub_1000604F0();
              v95 = objc_claimAutoreleasedReturnValue(v94);
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v139[0] = "-[MSDMailProcessor processRequest:]";
                _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%s - ChangeSettings has new 'PingFrequency' set.", buf, 0xCu);
              }

              -[MSDMailProcessor setPingInterval:](self, "setPingInterval:", -[MSDMailProcessor pingIntervalToUse](self, "pingIntervalToUse"));
            }
          }
        }
      }
      v122 = v91;
      v128 = v5;
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", CFSTR("DeviceOptions")));
      if (!v97
        || (v98 = objc_opt_class(NSDictionary, v96), (objc_opt_isKindOfClass(v97, v98) & 1) == 0)
        || (v99 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device")),
            v100 = objc_msgSend(v99, "updateDeviceOptions:skipImutableKeys:", v97, 1),
            v99,
            v100))
      {
        v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v130, "objectForKey:", CFSTR("FeatureFlags")));
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", CFSTR("FeatureFlags")));
        if (v103)
        {
          v104 = objc_opt_class(NSDictionary, v102);
          if ((objc_opt_isKindOfClass(v103, v104) & 1) != 0
            && (objc_msgSend(v101, "isEqualToDictionary:", v103) & 1) == 0)
          {
            v105 = sub_1000604F0();
            v106 = objc_claimAutoreleasedReturnValue(v105);
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v139[0] = "-[MSDMailProcessor processRequest:]";
              _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "%s - ChangeSettings has new 'FeatureFlags' set.", buf, 0xCu);
            }

            v107 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
            objc_msgSend(v107, "processNewFeatureFlags:oldFeatureFlags:", v103, v101);

          }
        }

        v14 = 1;
        v5 = v128;
        goto LABEL_39;
      }

      v11 = v126;
      v40 = (void *)v131;
      v12 = v132;
      v115 = v130;
      goto LABEL_132;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("StopBackgroundDownload")))
    {
      v50 = objc_claimAutoreleasedReturnValue(+[MSDBackgroundDownload sharedInstance](MSDBackgroundDownload, "sharedInstance"));
      -[NSObject quitBackgroundDownload](v50, "quitBackgroundDownload");
      goto LABEL_51;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("DemoDeviceLock")))
    {
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      if ((objc_msgSend(v108, "isDDLDevice") & 1) != 0)
      {
        v60 = v11;
        v109 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        v110 = objc_msgSend(v109, "isContentFrozen");

        v11 = v60;
        if (v110)
        {
          v111 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
          v112 = objc_msgSend(v111, "watchOS");

          v113 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          v14 = 1;
          LOBYTE(v112) = objc_msgSend(v113, "unenrollWithObliteration:preserveESim:callUnregister:preserveDDLFlag:", v112, 1, 0, 1);

          if ((v112 & 1) != 0)
            goto LABEL_81;
          v114 = sub_1000604F0();
          v115 = objc_claimAutoreleasedReturnValue(v114);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            sub_1000C1860();
          v40 = (void *)v131;
          v12 = v132;
          v11 = v60;
LABEL_132:

          goto LABEL_133;
        }
      }
      else
      {

      }
      v119 = sub_1000604F0();
      v50 = objc_claimAutoreleasedReturnValue(v119);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        sub_1000C188C();
      goto LABEL_51;
    }
    v116 = sub_1000605D0();
    v117 = objc_claimAutoreleasedReturnValue(v116);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      sub_1000C18B8();

    v115 = objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    -[NSObject deleteOperationRequest](v115, "deleteOperationRequest");
LABEL_128:
    v40 = (void *)v131;
    goto LABEL_132;
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 1;
LABEL_55:

  return v14;
}

- (BOOL)isAllowedRequest:(id)a3 relayNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Command")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPairedWatchProxy sharedInstance](MSDPairedWatchProxy, "sharedInstance"));
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("UpdateContent")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("StopBackgroundDownload")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      v12 = objc_msgSend(v11, "canStopBackgroundDownload");
      goto LABEL_10;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("UpdateOS")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      v12 = objc_msgSend(v11, "canStartOSUpdate");
      goto LABEL_10;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("TurnSnapshotON")))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      LOBYTE(self) = objc_msgSend(v18, "canLockSnapshot");

      if (!v4)
        goto LABEL_15;
      v19 = objc_msgSend(v8, "canLockSnapshot");
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("TurnSnapshotOFF")))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      LOBYTE(self) = objc_msgSend(v20, "canUnlockSnapshot");

      if (!v4)
        goto LABEL_15;
      v19 = objc_msgSend(v8, "canUnlockSnapshot");
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("RevertSnapshot")))
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Virgin")))
        {
          if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Restart")) & 1) != 0
            || (objc_msgSend(v7, "isEqualToString:", CFSTR("ChangeSettings")) & 1) != 0)
          {
            LOBYTE(self) = 1;
            goto LABEL_15;
          }
          if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Shutdown")) & 1) != 0
            || (objc_msgSend(v7, "isEqualToString:", CFSTR("HoldPowerAssertion")) & 1) != 0
            || (objc_msgSend(v7, "isEqualToString:", CFSTR("LiftPowerAssertion")) & 1) != 0
            || (objc_msgSend(v7, "isEqualToString:", CFSTR("MigrateToNewHub")) & 1) != 0
            || (objc_msgSend(v7, "isEqualToString:", CFSTR("ChangePingFrequency")) & 1) != 0
            || (objc_msgSend(v7, "isEqualToString:", CFSTR("ConfigScreenSaver")) & 1) != 0
            || !objc_msgSend(v7, "isEqualToString:", CFSTR("DemoDeviceLock")))
          {
            LOBYTE(self) = 0;
            goto LABEL_15;
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
          if (objc_msgSend(v11, "isDDLDevice"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
            LOBYTE(self) = objc_msgSend(v24, "isContentFrozen");

          }
          else
          {
            LOBYTE(self) = 0;
          }
          goto LABEL_11;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("ObliterateDevice")));
        v23 = objc_msgSend(v22, "BOOLValue");

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        v12 = objc_msgSend(v11, "canUnenrollWithObliteration:consultDeviceOptions:", v23, 0);
LABEL_10:
        LOBYTE(self) = v12;
LABEL_11:

        goto LABEL_15;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
      LOBYTE(self) = objc_msgSend(v21, "canRevertSnapshot");

      if (!v4)
        goto LABEL_15;
      v19 = objc_msgSend(v8, "canRevertSnapshot");
    }
    LOBYTE(self) = self & v19;
    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("ContentType")));
  if (objc_msgSend(v9, "containsObject:", CFSTR("Account")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    LOBYTE(self) = objc_msgSend(v10, "canStartAccountContentUpdate");

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("BackgroundDownloadOnly")));
    v14 = objc_msgSend(v13, "BOOLValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
    v16 = v15;
    if (v14)
    {
      LOBYTE(self) = objc_msgSend(v15, "canStartBackgroundDownload");

    }
    else
    {
      LODWORD(self) = objc_msgSend(v15, "canStartContentUpdate");

      if (v4)
        LODWORD(self) = self & objc_msgSend(v8, "canUpdateContent");
    }
  }

LABEL_15:
  return (char)self;
}

- (int64_t)pingIntervalToUse
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hubSuppliedSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PingFrequency")));

  if (-[MSDMailProcessor waitingForCommand](self, "waitingForCommand"))
  {
    v7 = 30;
  }
  else if (v5
         && (v8 = objc_opt_class(NSNumber, v6), (objc_opt_isKindOfClass(v5, v8) & 1) != 0)
         && objc_msgSend(v5, "unsignedIntegerValue"))
  {
    v7 = (int64_t)objc_msgSend(v5, "integerValue");
  }
  else
  {
    v7 = 600;
  }

  return v7;
}

- (BOOL)updateManifestInfo:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  int v28;
  id v29;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileDownloadCredentials sharedInstance](MSDFileDownloadCredentials, "sharedInstance"));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138543362;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "receiveDict:%{public}@", (uint8_t *)&v28, 0xCu);
  }

  if (!objc_msgSend(v5, "count"))
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000C1A54(v18, v19, v20, v21, v22, v23, v24, v25);

    sub_1000B63A4(a4, 3727740937, (uint64_t)CFSTR("No suitable demo content found."));
    v10 = 0;
    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Ready")));
  if (!v10
    || (v11 = objc_opt_class(NSNumber, v9), (objc_opt_isKindOfClass(v10, v11) & 1) == 0)
    || (objc_msgSend(v10, "BOOLValue") & 1) == 0)
  {
    sub_1000B63A4(a4, 3727740939, (uint64_t)CFSTR("Hub still downloading contents. Please wait."));
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v12 = objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v12, "removeObjectForKey:", CFSTR("Ready"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    v26 = sub_1000604F0();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1000C1AC4();

    sub_1000B63A4(a4, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    goto LABEL_16;
  }
  if ((objc_msgSend(v6, "updateWithResponseFromGetManifestInfo:", v12) & 1) == 0)
  {
LABEL_16:
    v15 = 0;
    goto LABEL_10;
  }
  v15 = 1;
LABEL_10:

  return v15;
}

- (unint64_t)convertPingType:(unint64_t)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](MSDNPIMaskValues, "sharedInstance"));
  v5 = objc_msgSend(v4, "isNPIDevice");

  if (v5)
    return a3 | 0x40;
  else
    return a3;
}

- (NSTimer)pingTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)fullKeysSent
{
  return self->_fullKeysSent;
}

- (void)setFullKeysSent:(BOOL)a3
{
  self->_fullKeysSent = a3;
}

- (unint64_t)queuedPingType
{
  return self->_queuedPingType;
}

- (void)setQueuedPingType:(unint64_t)a3
{
  self->_queuedPingType = a3;
}

- (BOOL)demodReady
{
  return self->_demodReady;
}

- (void)setDemodReady:(BOOL)a3
{
  self->_demodReady = a3;
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pingTimer, 0);
}

@end
