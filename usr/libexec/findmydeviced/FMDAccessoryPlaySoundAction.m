@implementation FMDAccessoryPlaySoundAction

- (FMDAccessoryPlaySoundAction)initWithAccessory:(id)a3 accessoryRegistry:(id)a4 channels:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDAccessoryPlaySoundAction *v11;
  FMDAccessoryPlaySoundAction *v12;
  dispatch_queue_t v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMDAccessoryPlaySoundAction;
  v11 = -[FMDAccessoryPlaySoundAction init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    -[FMDAccessoryPlaySoundAction setAccessory:](v11, "setAccessory:", v8);
    -[FMDAccessoryPlaySoundAction setAccessoryRegistry:](v12, "setAccessoryRegistry:", v9);
    -[FMDAccessoryPlaySoundAction setChannels:](v12, "setChannels:", v10);
    -[FMDAccessoryPlaySoundAction setBypassInEarCheck:](v12, "setBypassInEarCheck:", 0);
    -[FMDAccessoryPlaySoundAction setForceConnection:](v12, "setForceConnection:", 1);
    -[FMDAccessoryPlaySoundAction setPlayingSound:](v12, "setPlayingSound:", 0);
    -[FMDAccessoryPlaySoundAction setTerminated:](v12, "setTerminated:", 0);
    v13 = dispatch_queue_create("FMDAccessoryPlaySoundActionQueue", 0);
    -[FMDAccessoryPlaySoundAction setSerialQueue:](v12, "setSerialQueue:", v13);

  }
  return v12;
}

- (void)setBluetoothManager:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  FMDAccessoryPlaySoundAction *v16;
  __int16 v17;
  void *v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessory](self, "accessory"));
  v7 = objc_msgSend(v6, "category");

  if (v7 != (id)3)
  {
    objc_storeStrong((id *)&self->_bluetoothManager, a3);
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction earlyDiscovery](self, "earlyDiscovery"));

      if (!v8)
      {
        v9 = objc_msgSend(v5, "newDiscovery");
        -[FMDAccessoryPlaySoundAction setEarlyDiscovery:](self, "setEarlyDiscovery:", v9);

        v10 = sub_1000031B8();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction earlyDiscovery](self, "earlyDiscovery"));
          v15 = 134218242;
          v16 = self;
          v17 = 2112;
          v18 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction(0x%lX) - earlyDiscovery %@", (uint8_t *)&v15, 0x16u);

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction earlyDiscovery](self, "earlyDiscovery"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction duration](self, "duration"));
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(v13, "startDiscoveryForDuration:");

      }
    }
  }

}

- (id)actionType
{
  return CFSTR("AccessoryPlaySoundAction");
}

- (void)willCancelAction
{
  id v3;
  NSObject *v4;
  int v5;
  FMDAccessoryPlaySoundAction *v6;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) will cancel.", (uint8_t *)&v5, 0xCu);
  }

  -[FMDAccessoryPlaySoundAction notifyCompletionWithStatus:](self, "notifyCompletionWithStatus:", &off_1002D7FD8);
  -[FMDAccessoryPlaySoundAction terminate](self, "terminate");
  -[FMDAccessoryPlaySoundAction discardEarlyDiscovery](self, "discardEarlyDiscovery");
}

- (NSNumber)timeout
{
  if (self->_timeout)
    return self->_timeout;
  else
    return (NSNumber *)&off_1002D8350;
}

- (NSNumber)inEarDetectionTimeout
{
  if (self->_inEarDetectionTimeout)
    return self->_inEarDetectionTimeout;
  else
    return (NSNumber *)&off_1002D8360;
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id location;
  uint8_t buf[4];
  FMDAccessoryPlaySoundAction *v33;
  __int16 v34;
  double v35;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v5, "beginTransaction:", CFSTR("FMDAccessoryPlaySoundActionActivity"));

  -[FMDAccessoryPlaySoundAction setCompletion:](self, "setCompletion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction timeout](self, "timeout"));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v8));
  -[FMDAccessoryPlaySoundAction setTimeoutDate:](self, "setTimeoutDate:", v9);

  if (v8 >= 0.0)
  {
    objc_initWeak(&location, self);
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v33 = self;
      v34 = 2048;
      v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) will timeout after %f", buf, 0x16u);
    }

    v15 = objc_alloc((Class)FMDispatchTimer);
    v16 = &_dispatch_main_q;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100025FA0;
    v29[3] = &unk_1002C11E8;
    objc_copyWeak(&v30, &location);
    v29[4] = self;
    v17 = objc_msgSend(v15, "initWithQueue:timeout:completion:", &_dispatch_main_q, v29, v8);
    -[FMDAccessoryPlaySoundAction setTimeoutTimer:](self, "setTimeoutTimer:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v18, "start");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction bluetoothManager](self, "bluetoothManager"));
    v20 = objc_msgSend(v19, "newDiscovery");
    -[FMDAccessoryPlaySoundAction setDiscovery:](self, "setDiscovery:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction discovery](self, "discovery"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction duration](self, "duration"));
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v21, "startDiscoveryForDuration:");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction discovery](self, "discovery"));
    LODWORD(v21) = v23 == 0;

    if ((_DWORD)v21)
    {
      v24 = sub_1000031B8();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100226AC0();

    }
    v26 = sub_1000031B8();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction discovery](self, "discovery"));
      *(_DWORD *)buf = 134218242;
      v33 = self;
      v34 = 2112;
      v35 = *(double *)&v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction(0x%lX) - init newDiscovery %@", buf, 0x16u);

    }
    -[FMDAccessoryPlaySoundAction discardEarlyDiscovery](self, "discardEarlyDiscovery");
    -[FMDAccessoryPlaySoundAction executePlaySound](self, "executePlaySound");
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) the given command expired before starting.", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", qword_1003049B0));
    -[FMDAccessoryPlaySoundAction notifyCompletionWithStatus:](self, "notifyCompletionWithStatus:", v12);

    -[FMDAccessoryPlaySoundAction terminate](self, "terminate");
  }

}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  LOBYTE(self) = objc_opt_isKindOfClass(v4, v6);

  return self & 1;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (void)executePlaySound
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026254;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopDiscoveryForExtAccessory
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessory](self, "accessory"));
  if (v13)
  {
    v4 = objc_opt_class(FMDExtAccessory, v3);
    if ((objc_opt_isKindOfClass(v13, v4) & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction statusController](self, "statusController"));

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessoryType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configForAccessoryType:", v7));

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "infoForFeature:", CFSTR("availability")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction statusController](self, "statusController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessoryIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
        objc_msgSend(v10, "stopDiscoveryForAccessory:info:withCompletion:", v12, v9, &stru_1002C2108);

      }
    }
  }

}

- (void)_executePlaySoundUsingExtensions
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  void *v41;
  dispatch_time_t v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  const char *v47;
  void *v48;
  unsigned int v49;
  id v50;
  NSObject *v51;
  int v52;
  int v53;
  uint64_t v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  id v72;
  NSObject *v73;
  int v74;
  int v75;
  uint64_t v76;
  id v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  double v82;
  double v83;
  id v84;
  NSObject *v85;
  id v86;
  id v87;
  NSObject *v88;
  void *v89;
  dispatch_time_t v90;
  id v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *group;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[5];
  id v103;
  id v104;
  id v105;
  id location;
  _QWORD v107[4];
  NSObject *v108;
  uint64_t *v109;
  _BYTE *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  _QWORD v115[4];
  NSObject *v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  BOOL v121;
  _QWORD v122[4];
  id v123;
  FMDAccessoryPlaySoundAction *v124;
  _QWORD v125[5];
  uint8_t v126[4];
  _BYTE v127[10];
  __int16 v128;
  uint64_t v129;
  _BYTE buf[24];
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;

  v3 = sub_10005311C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction timeoutDate](self, "timeoutDate"));
    objc_msgSend(v6, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "started at time = %@ with timeout = %f", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessory](self, "accessory"));
  if (v9)
  {
    v10 = objc_opt_class(FMDExtAccessory, v8);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryIdentifier"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configForAccessoryType:", v13));

      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flavorForFeature:", CFSTR("sound")));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flavorForFeature:", CFSTR("availability")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flavorForFeature:", CFSTR("connection")));
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessoryRegistry](self, "accessoryRegistry"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "infoForFeature:", CFSTR("sound")));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "infoForFeature:", CFSTR("availability")));
      group = dispatch_group_create();
      if (!v15 || !v101)
      {
        v25 = sub_10005311C();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_100226BF4();

        -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("Unssuported device"), qword_1003049C8);
        goto LABEL_69;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction channels](self, "channels"));
      v17 = objc_msgSend(v16, "count") == 0;

      if (v17)
      {
        -[FMDAccessoryPlaySoundAction cancelTimer](self, "cancelTimer");
        v27 = sub_10005311C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "PlaySoundAction (0x%lX) Stopping sound for accessory %@", buf, 0x16u);

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:", CFSTR("sound"), v101));
        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction channels](self, "channels"));
          v125[0] = _NSConcreteStackBlock;
          v125[1] = 3221225472;
          v125[2] = sub_100028188;
          v125[3] = &unk_1002C1328;
          v125[4] = self;
          objc_msgSend(v99, "updateAccessory:playbackChannels:completion:", v9, v31, v125);

          v32 = sub_10005311C();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v30;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "daemon stop sound controller = %@", buf, 0xCu);
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction rampDownDuration](self, "rampDownDuration"));
          objc_msgSend(v34, "doubleValue");
          v36 = v35;
          v122[0] = _NSConcreteStackBlock;
          v122[1] = 3221225472;
          v122[2] = sub_1000281DC;
          v122[3] = &unk_1002C2130;
          v123 = v9;
          v124 = self;
          objc_msgSend(v30, "stopSoundForAccessory:info:rampDownDuration:withCompletion:", v100, v98, v122, v36);

        }
        else
        {
          v37 = sub_10005311C();
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            sub_100226C70();

          -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("unable to get sound controller"), qword_1003049C8);
        }

        goto LABEL_69;
      }
      v118 = 0;
      v119 = &v118;
      v120 = 0x2020000000;
      v121 = 0;
      v121 = objc_msgSend(v9, "connectionState") != 0;
      if (!*((_BYTE *)v119 + 24) && -[FMDAccessoryPlaySoundAction forceConnection](self, "forceConnection"))
      {
        v18 = objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:", CFSTR("connection"), v15));
        if (!v18)
        {
          v39 = sub_10005311C();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
            sub_100226C9C(v41, (uint64_t)buf, v40);
          }

          -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("Not able to get connectionController"), qword_1003049C8);
          goto LABEL_68;
        }
        v19 = (void *)v18;
        dispatch_group_enter(group);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "infoForFeature:", CFSTR("connection")));
        v115[0] = _NSConcreteStackBlock;
        v115[1] = 3221225472;
        v115[2] = sub_100028248;
        v115[3] = &unk_1002C2158;
        v117 = &v118;
        v21 = group;
        v116 = v21;
        objc_msgSend(v19, "forceConnectToAccessory:info:withCompletion:", v100, v20, v115);
        v94 = v19;

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction timeoutDate](self, "timeoutDate"));
        objc_msgSend(v22, "timeIntervalSinceNow");
        v24 = v23;

        if (v24 < 0.0)
        {
          -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("timeout occured before we can try to connect"), qword_1003049B0);
LABEL_33:

LABEL_67:
          goto LABEL_68;
        }
        v42 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
        if (dispatch_group_wait(v21, v42))
        {
          v43 = sub_10005311C();
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            sub_100226DC4();

          -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("timeout occured before we can connect"), qword_1003049B0);
          goto LABEL_33;
        }

      }
      if (!*((_BYTE *)v119 + 24))
      {
        -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("Unable to Connect"), qword_1003049B0);
LABEL_68:
        _Block_object_dispose(&v118, 8);
LABEL_69:

        goto LABEL_70;
      }
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flavorForFeature:", CFSTR("safetyAlert")));
      v111 = 0;
      v112 = &v111;
      v113 = 0x2020000000;
      v114 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v131 = sub_1000282B4;
      v132 = sub_1000282C4;
      v133 = 0;
      if (-[FMDAccessoryPlaySoundAction bypassInEarCheck](self, "bypassInEarCheck"))
      {
LABEL_37:
        *((_BYTE *)v112 + 24) = 1;
        v45 = sub_10005311C();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v126 = 0;
          v47 = "warning safet alert disabled";
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v47, v126, 2u);
          goto LABEL_47;
        }
        goto LABEL_47;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
      if ((objc_msgSend(v48, "isInternalBuild") & 1) != 0)
      {
        v49 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("DisableInEarCheck"), kFMDNotBackedUpPrefDomain);

        if (v49)
          goto LABEL_37;
      }
      else
      {

      }
      if (objc_msgSend(v94, "isEqualToString:", CFSTR("ALWAYS")))
      {
        *((_BYTE *)v112 + 24) = 0;
        v46 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = CFSTR("ALWAYS");
        goto LABEL_47;
      }
      if (v94)
      {
        v46 = objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:", CFSTR("safetyAlert")));
        if (!v46)
        {
          v87 = sub_10005311C();
          v88 = objc_claimAutoreleasedReturnValue(v87);
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
            sub_100226D14(v89, (uint64_t)v126, v88);
          }

          -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("Not safe to play"), qword_1003049C8);
          goto LABEL_66;
        }
        dispatch_group_enter(group);
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "infoForFeature:", CFSTR("safetyAlert")));
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_1000282CC;
        v107[3] = &unk_1002C2180;
        v109 = &v111;
        v110 = buf;
        v80 = group;
        v108 = v80;
        -[NSObject safetyAlertForAccessory:info:withCompletion:](v46, "safetyAlertForAccessory:info:withCompletion:", v100, v79, v107);
        v93 = v46;

        v81 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction timeoutDate](self, "timeoutDate"));
        objc_msgSend(v81, "timeIntervalSinceNow");
        v83 = v82;

        v84 = sub_10005311C();
        v85 = objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v126 = 134217984;
          *(double *)v127 = v83;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "safety check timeout = %f", v126, 0xCu);
        }

        if (v83 >= 0.0)
        {
          v90 = dispatch_time(0, (uint64_t)(v83 * 1000000000.0));
          if (!dispatch_group_wait(v80, v90))
          {

            goto LABEL_47;
          }
          v91 = sub_10005311C();
          v92 = objc_claimAutoreleasedReturnValue(v91);
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            sub_100226D60();

          -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("timeout occured while doing safety check"), qword_1003049B0);
        }
        else
        {
          -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("timeout occured before we can try to check safety status"), qword_1003049B0);
        }
        v60 = v108;
        goto LABEL_58;
      }
      *((_BYTE *)v112 + 24) = 1;
      v86 = sub_10005311C();
      v46 = objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v126 = 0;
        v47 = "warning safet alert feature not found";
        goto LABEL_39;
      }
LABEL_47:

      if (!*((_BYTE *)v112 + 24))
      {
        v72 = sub_10005311C();
        v73 = objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          v74 = *((unsigned __int8 *)v119 + 24);
          v75 = *((unsigned __int8 *)v112 + 24);
          v76 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v126 = 67109634;
          *(_DWORD *)v127 = v74;
          *(_WORD *)&v127[4] = 1024;
          *(_DWORD *)&v127[6] = v75;
          v128 = 2112;
          v129 = v76;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "returning playing sound connected = %d safe = %d safetyAlertType = %@", v126, 0x18u);
        }

        -[FMDAccessoryPlaySoundAction setSafetyAlertType:](self, "setSafetyAlertType:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("Not safe to play"), qword_1003049C0);
        goto LABEL_66;
      }
      v50 = sub_10005311C();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = *((unsigned __int8 *)v119 + 24);
        v53 = *((unsigned __int8 *)v112 + 24);
        v54 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v126 = 67109634;
        *(_DWORD *)v127 = v52;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v53;
        v128 = 2112;
        v129 = v54;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "palying sound with connected = %d safe = %d safetyAlertType = %@", v126, 0x18u);
      }

      v93 = objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:", CFSTR("sound"), v101));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction statusController](self, "statusController"));
      v56 = v55 == 0;

      if (v56)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:withDelegate:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:withDelegate:", CFSTR("availability"), v95, v99));
        -[FMDAccessoryPlaySoundAction setStatusController:](self, "setStatusController:", v57);

      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction statusController](self, "statusController"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction duration](self, "duration"));
      objc_msgSend(v59, "doubleValue");
      objc_msgSend(v58, "startDiscoveryForAccessory:duration:info:withCompletion:", v100, v96, &stru_1002C21A0);

      if (!v93)
      {
        v77 = sub_10005311C();
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          sub_100226CE8();

        -[FMDAccessoryPlaySoundAction _playSoundEnd:withCode:](self, "_playSoundEnd:withCode:", CFSTR("unable to get sound controller"), qword_1003049C8);
        goto LABEL_65;
      }
      v60 = objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction channels](self, "channels"));
      v61 = sub_10005311C();
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v126 = 138412290;
        *(_QWORD *)v127 = v60;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "channel Array = %@", v126, 0xCu);
      }

      objc_initWeak(&location, self);
      v63 = sub_10005311C();
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v126 = 138412290;
        *(_QWORD *)v127 = v93;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "daemon play sound controller = %@", v126, 0xCu);
      }

      -[FMDAccessoryPlaySoundAction setPlaySoundRetryCounter:](self, "setPlaySoundRetryCounter:", (char *)-[FMDAccessoryPlaySoundAction playSoundRetryCounter](self, "playSoundRetryCounter") + 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction duration](self, "duration"));
      objc_msgSend(v65, "doubleValue");
      v67 = v66;
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction rampDownDuration](self, "rampDownDuration"));
      objc_msgSend(v68, "doubleValue");
      v70 = v69;
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction channels](self, "channels"));
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_100028488;
      v102[3] = &unk_1002C21F0;
      v102[4] = self;
      objc_copyWeak(&v105, &location);
      v103 = v99;
      v104 = v9;
      -[NSObject playSoundForAccessory:info:duration:rampUpDuration:channels:withCompletion:](v93, "playSoundForAccessory:info:duration:rampUpDuration:channels:withCompletion:", v100, v98, v71, v102, v67, v70);

      objc_destroyWeak(&v105);
      objc_destroyWeak(&location);
LABEL_58:

LABEL_65:
LABEL_66:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v111, 8);
      goto LABEL_67;
    }
  }
LABEL_70:

}

- (void)_playSoundEnd:(id)a3 withCode:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = sub_10005311C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessory](self, "accessory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "play sound failed for %@ with %@", (uint8_t *)&v12, 0x16u);

  }
  -[FMDAccessoryPlaySoundAction cancelTimer](self, "cancelTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  -[FMDAccessoryPlaySoundAction notifyCompletionWithStatus:](self, "notifyCompletionWithStatus:", v11);

  -[FMDAccessoryPlaySoundAction terminate](self, "terminate");
}

- (void)notifyCompletionWithStatus:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD);
  const __CFString *v24;
  id v25;
  uint8_t buf[4];
  FMDAccessoryPlaySoundAction *v27;
  __int16 v28;
  id v29;

  v4 = a3;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v27 = self;
    v28 = 2048;
    v29 = objc_msgSend(v4, "integerValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) did finish %li", buf, 0x16u);
  }

  -[FMDAccessoryPlaySoundAction setTerminated:](self, "setTerminated:", 1);
  v24 = CFSTR("status");
  v25 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v8 = objc_msgSend(v7, "mutableCopy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction safetyAlertType](self, "safetyAlertType"));
  objc_msgSend(v8, "fm_safeSetObject:forKey:", v9, CFSTR("safetyAlertType"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction timeoutError](self, "timeoutError"));
  objc_msgSend(v8, "fm_safeSetObject:forKey:", v10, CFSTR("timeoutError"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction future](self, "future"));
  -[FMDAccessoryPlaySoundAction setFuture:](self, "setFuture:", 0);
  v12 = objc_msgSend(v4, "integerValue");
  if (v12 == (id)qword_1003049B0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.findmydeviced.FMDAccessoryPlaySoundAction"), objc_msgSend(v4, "integerValue"), 0));
    objc_msgSend(v11, "finishWithError:", v13);

  }
  else
  {
    objc_msgSend(v11, "finishWithResult:", v8);
  }
  v14 = objc_msgSend(v4, "integerValue");
  if (v14 == (id)qword_1003049B0
    || (v15 = objc_msgSend(v4, "integerValue"), v15 == (id)qword_1003049B8)
    || (v16 = objc_msgSend(v4, "integerValue"), v16 == (id)qword_1003049C0)
    || (v17 = objc_msgSend(v4, "integerValue"), v17 == (id)qword_1003049D8)
    || (v18 = objc_msgSend(v4, "integerValue"), v18 == (id)qword_1003049D0)
    || (v19 = objc_msgSend(v4, "integerValue"), v19 == (id)qword_1003049E0)
    || (v20 = objc_msgSend(v4, "integerValue"), v20 == (id)qword_1003049E8))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction discovery](self, "discovery"));
    objc_msgSend(v21, "stopDiscovery");

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction actionCompletion](self, "actionCompletion"));

  if (v22)
  {
    v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction actionCompletion](self, "actionCompletion"));
    ((void (**)(_QWORD, id))v23)[2](v23, v8);

    -[FMDAccessoryPlaySoundAction setActionCompletion:](self, "setActionCompletion:", 0);
  }

}

- (void)cancelTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction inEarTimer](self, "inEarTimer"));
  objc_msgSend(v3, "cancel");

  -[FMDAccessoryPlaySoundAction setInEarTimer:](self, "setInEarTimer:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction timeoutTimer](self, "timeoutTimer"));
  objc_msgSend(v4, "cancel");

  -[FMDAccessoryPlaySoundAction setTimeoutTimer:](self, "setTimeoutTimer:", 0);
}

- (void)terminate
{
  id v3;
  NSObject *v4;
  void (**v5)(_QWORD);
  void *v6;
  int v7;
  FMDAccessoryPlaySoundAction *v8;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) will terminate.", (uint8_t *)&v7, 0xCu);
  }

  -[FMDAccessoryPlaySoundAction setPlaySoundRetryCounter:](self, "setPlaySoundRetryCounter:", 0);
  -[FMDAccessoryPlaySoundAction cancelTimer](self, "cancelTimer");
  v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction completion](self, "completion"));
  -[FMDAccessoryPlaySoundAction setCompletion:](self, "setCompletion:", 0);
  if (v5)
    v5[2](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "endTransaction:", CFSTR("FMDAccessoryPlaySoundActionActivity"));

  -[FMDAccessoryPlaySoundAction discardEarlyDiscovery](self, "discardEarlyDiscovery");
  -[FMDAccessoryPlaySoundAction _stopDiscoveryForExtAccessory](self, "_stopDiscoveryForExtAccessory");

}

- (void)discardEarlyDiscovery
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  FMDAccessoryPlaySoundAction *v9;
  __int16 v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction earlyDiscovery](self, "earlyDiscovery"));

  if (v3)
  {
    v4 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction earlyDiscovery](self, "earlyDiscovery"));
      v8 = 134218242;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction(0x%lX) - discard earlyDiscovery %@", (uint8_t *)&v8, 0x16u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction earlyDiscovery](self, "earlyDiscovery"));
    objc_msgSend(v7, "stopDiscovery");

    -[FMDAccessoryPlaySoundAction setEarlyDiscovery:](self, "setEarlyDiscovery:", 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[FMDAccessoryPlaySoundAction discardEarlyDiscovery](self, "discardEarlyDiscovery");
  -[FMDAccessoryPlaySoundAction _stopDiscoveryForExtAccessory](self, "_stopDiscoveryForExtAccessory");
  v3.receiver = self;
  v3.super_class = (Class)FMDAccessoryPlaySoundAction;
  -[FMDAccessoryPlaySoundAction dealloc](&v3, "dealloc");
}

- (void)_playSoundNow:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  FMDAccessoryPlaySoundAction *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  FMDAccessoryPlaySoundAction *v28;
  __int16 v29;
  id v30;

  v4 = a3;
  if (-[FMDAccessoryPlaySoundAction playingSound](self, "playingSound"))
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) already playing - ignoring.", buf, 0xCu);
    }

  }
  -[FMDAccessoryPlaySoundAction setPlayingSound:](self, "setPlayingSound:", 1);
  -[FMDAccessoryPlaySoundAction cancelTimer](self, "cancelTimer");
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v28 = self;
    v29 = 2112;
    v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction (0x%lX) Playing sound for accessory %@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction channels](self, "channels"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction duration](self, "duration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction rampUpDuration](self, "rampUpDuration"));
  if (+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("CustomRampUpDurationEnabled"), kFMDPrefDomain))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("CustomRampUpDuration"), kFMDPrefDomain)));

    v11 = (void *)v12;
  }
  -[FMDAccessoryPlaySoundAction setPlaySoundRetryCounter:](self, "setPlaySoundRetryCounter:", (char *)-[FMDAccessoryPlaySoundAction playSoundRetryCounter](self, "playSoundRetryCounter") + 1);
  objc_initWeak((id *)buf, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  objc_msgSend(v10, "doubleValue");
  v15 = v14;
  objc_msgSend(v11, "doubleValue");
  v17 = v16;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100029478;
  v21[3] = &unk_1002C2240;
  objc_copyWeak(&v26, (id *)buf);
  v18 = v4;
  v22 = v18;
  v23 = self;
  v19 = v9;
  v24 = v19;
  v20 = v10;
  v25 = v20;
  objc_msgSend(v13, "startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion:", v18, v19, v21, v15, v17);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

- (id)commandStatusForInternalAccessoryAudioSafetyStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 7)
    self = (FMDAccessoryPlaySoundAction *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *off_1002C2260[a3], v3, v4));
  return self;
}

- (void)accessoryDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  int v13;
  FMDAccessoryPlaySoundAction *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessory](self, "accessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryIdentifier"));
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    -[FMDAccessoryPlaySoundAction setAccessory:](self, "setAccessory:", v4);
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218498;
      v14 = self;
      v15 = 2112;
      v16 = (id)objc_opt_class(v4, v11);
      v17 = 2048;
      v18 = v4;
      v12 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDAccessoryPlaySoundAction(%lu) playsound accessoryDidUpdate %@(%lu)", (uint8_t *)&v13, 0x20u);

    }
    -[FMDAccessoryPlaySoundAction executePlaySound](self, "executePlaySound");
    -[FMDAccessoryPlaySoundAction stopSoundFromUnexpectedPanning](self, "stopSoundFromUnexpectedPanning");
  }

}

- (void)stopSoundFromUnexpectedPanning
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  uint8_t buf[16];

  if (-[FMDAccessoryPlaySoundAction terminated](self, "terminated")
    || -[FMDAccessoryPlaySoundAction playingSound](self, "playingSound"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessory](self, "accessory"));
    if ((objc_opt_respondsToSelector(v9, "shouldStopSoundNow") & 1) != 0)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessory](self, "accessory"));
      v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___FMDAudioAccessory);

      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryPlaySoundAction accessory](self, "accessory"));
        if (objc_msgSend(v5, "shouldStopSoundNow"))
        {
          v6 = sub_1000031B8();
          v7 = objc_claimAutoreleasedReturnValue(v6);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stop sound from panning", buf, 2u);
          }

          objc_msgSend(v5, "updatePlaybackChannels:", &__NSArray0__struct);
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v10[2] = sub_100029F7C;
          v10[3] = &unk_1002C1690;
          v10[4] = self;
          objc_msgSend(v8, "stopPlayingSoundForAccessory:rampDownDuration:completion:", v5, v10, 1.0);

        }
      }
    }
    else
    {

    }
  }
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (void)setTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_timeout, a3);
}

- (void)setInEarDetectionTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_inEarDetectionTimeout, a3);
}

- (NSNumber)rampUpDuration
{
  return self->_rampUpDuration;
}

- (void)setRampUpDuration:(id)a3
{
  objc_storeStrong((id *)&self->_rampUpDuration, a3);
}

- (NSNumber)rampDownDuration
{
  return self->_rampDownDuration;
}

- (void)setRampDownDuration:(id)a3
{
  objc_storeStrong((id *)&self->_rampDownDuration, a3);
}

- (unint64_t)defaultAudioSafetyStatus
{
  return self->_defaultAudioSafetyStatus;
}

- (void)setDefaultAudioSafetyStatus:(unint64_t)a3
{
  self->_defaultAudioSafetyStatus = a3;
}

- (FMFuture)future
{
  return self->_future;
}

- (void)setFuture:(id)a3
{
  objc_storeStrong((id *)&self->_future, a3);
}

- (FMDBluetoothManaging)bluetoothManager
{
  return self->_bluetoothManager;
}

- (BOOL)bypassInEarCheck
{
  return self->_bypassInEarCheck;
}

- (void)setBypassInEarCheck:(BOOL)a3
{
  self->_bypassInEarCheck = a3;
}

- (BOOL)forceConnection
{
  return self->_forceConnection;
}

- (void)setForceConnection:(BOOL)a3
{
  self->_forceConnection = a3;
}

- (id)actionCompletion
{
  return self->_actionCompletion;
}

- (void)setActionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAccessory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (FMDAccessoryRegistry)accessoryRegistry
{
  return (FMDAccessoryRegistry *)objc_loadWeakRetained((id *)&self->_accessoryRegistry);
}

- (void)setAccessoryRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryRegistry, a3);
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_storeStrong((id *)&self->_channels, a3);
}

- (FMDispatchTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (NSDate)timeoutDate
{
  return self->_timeoutDate;
}

- (void)setTimeoutDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutDate, a3);
}

- (NSError)timeoutError
{
  return self->_timeoutError;
}

- (void)setTimeoutError:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutError, a3);
}

- (NSString)safetyAlertType
{
  return self->_safetyAlertType;
}

- (void)setSafetyAlertType:(id)a3
{
  objc_storeStrong((id *)&self->_safetyAlertType, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)playingSound
{
  return self->_playingSound;
}

- (void)setPlayingSound:(BOOL)a3
{
  self->_playingSound = a3;
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMDBluetoothDeviceDiscovering)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (FMDispatchTimer)inEarTimer
{
  return self->_inEarTimer;
}

- (void)setInEarTimer:(id)a3
{
  objc_storeStrong((id *)&self->_inEarTimer, a3);
}

- (int64_t)playSoundRetryCounter
{
  return self->_playSoundRetryCounter;
}

- (void)setPlaySoundRetryCounter:(int64_t)a3
{
  self->_playSoundRetryCounter = a3;
}

- (FMDExtAccessoryProtocol)statusController
{
  return self->_statusController;
}

- (void)setStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_statusController, a3);
}

- (FMDBluetoothDeviceDiscovering)earlyDiscovery
{
  return self->_earlyDiscovery;
}

- (void)setEarlyDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_earlyDiscovery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earlyDiscovery, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_inEarTimer, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_safetyAlertType, 0);
  objc_storeStrong((id *)&self->_timeoutError, 0);
  objc_storeStrong((id *)&self->_timeoutDate, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_destroyWeak((id *)&self->_accessoryRegistry);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong(&self->_actionCompletion, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_rampDownDuration, 0);
  objc_storeStrong((id *)&self->_rampUpDuration, 0);
  objc_storeStrong((id *)&self->_inEarDetectionTimeout, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

@end
