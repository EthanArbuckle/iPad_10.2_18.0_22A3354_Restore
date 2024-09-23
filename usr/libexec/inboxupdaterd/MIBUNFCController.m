@implementation MIBUNFCController

- (MIBUNFCController)initWithDelegate:(id)a3
{
  id v4;
  MIBUNFCController *v5;
  MIBUHCESession *v6;
  void *v7;
  NSMutableArray *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIBUNFCController;
  v5 = -[MIBUNFCController init](&v13, "init");
  if (v5)
  {
    v6 = -[MIBUHCESession initWithDelegate:]([MIBUHCESession alloc], "initWithDelegate:", v5);
    -[MIBUNFCController setSession:](v5, "setSession:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController _getDispatchTable](v5, "_getDispatchTable"));
    -[MIBUNFCController setDispatchTable:](v5, "setDispatchTable:", v7);

    -[MIBUNFCController setDelegate:](v5, "setDelegate:", v4);
    v8 = objc_opt_new(NSMutableArray);
    -[MIBUNFCController setObservers:](v5, "setObservers:", v8);

    -[MIBUNFCController setSessionRestartTimer:](v5, "setSessionRestartTimer:", 0);
    -[MIBUNFCController setNfcInactivityTimer:](v5, "setNfcInactivityTimer:", 0);
    -[MIBUNFCController setHeartbeatConnectionSem:](v5, "setHeartbeatConnectionSem:", 0);
    -[MIBUNFCController setHeartbeatPeriod:](v5, "setHeartbeatPeriod:", 0.0);
    -[MIBUNFCController setNfcInactivityTimeout:](v5, "setNfcInactivityTimeout:", 0.0);
    -[MIBUNFCController setIsNFCConfigured:](v5, "setIsNFCConfigured:", 0);
    v9 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.mibu_nfc_task_queue", v10);
    -[MIBUNFCController setQueue:](v5, "setQueue:", v11);

  }
  return v5;
}

- (void)addObserver:(id)a3
{
  MIBUNFCController *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController observers](v4, "observers"));
  v6 = objc_msgSend(v5, "containsObject:", v8);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController observers](v4, "observers"));
    objc_msgSend(v7, "addObject:", v8);

  }
  objc_sync_exit(v4);

}

- (void)removeObserver:(id)a3
{
  MIBUNFCController *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController observers](v4, "observers"));
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)start:(id *)a3
{
  id v5;
  id v6;

  v6 = 0;
  -[MIBUNFCController _startHCESession:](self, "_startHCESession:", &v6);
  v5 = v6;
  if (!v5)
    -[MIBUNFCController setTerminated:](self, "setTerminated:", 0);
  if (a3)
    *a3 = objc_retainAutorelease(v5);

}

- (void)terminate:(id *)a3
{
  dispatch_semaphore_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id obj;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100006CCC;
  v25 = sub_100006CDC;
  v26 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = dispatch_time(0, 60000000000);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006CE4;
  v18[3] = &unk_100054F38;
  v20 = &v21;
  v7 = v5;
  v19 = v7;
  -[MIBUNFCController terminateWithCompletion:](self, "terminateWithCompletion:", v18);
  if (dispatch_semaphore_wait(v7, v6))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054F58);
    v8 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003A948(v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = (id *)(v22 + 5);
    obj = (id)v22[5];
    sub_10000D680(&obj, 83886087, 0, CFSTR("NFC termination wait timed out after %ds"), v12, v13, v14, v15, 60);
    objc_storeStrong(v16, obj);
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v22[5]);

  _Block_object_dispose(&v21, 8);
}

- (void)terminateWithCompletion:(id)a3
{
  void (**v4)(id, id);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v4 = (void (**)(id, id))a3;
  if (-[MIBUNFCController _isHeartbeatMode](self, "_isHeartbeatMode"))
  {
    v11 = 0;
    v5 = objc_opt_class(self);
    sub_10000D680(&v11, 2147483651, 0, CFSTR("Cannot terminate %{public}@ in heartbeat mode"), v6, v7, v8, v9, v5);
    v10 = v11;
    if (v4)
      v4[2](v4, v10);

  }
  else
  {
    -[MIBUNFCController setTerminated:](self, "setTerminated:", 1);
    -[MIBUNFCController _restartSessionAfter:forceTerminate:andCompletion:](self, "_restartSessionAfter:forceTerminate:andCompletion:", 0, v4, 0.0);
  }

}

- (id)handleCommand:(id)a3
{
  id v4;
  MIBUNFCResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  NSString *v14;
  SEL v15;
  uint64_t v16;
  MIBUNFCResponse *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  MIBUNFCResponse *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  v5 = objc_opt_new(MIBUNFCResponse);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController nfcInactivityTimer](self, "nfcInactivityTimer"));

  if (v7)
    -[MIBUNFCController _resetNFCInactivityTimer](self, "_resetNFCInactivityTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "isCommandAllowed:", v6);

  if (!v9)
    goto LABEL_18;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController dispatchTable](self, "dispatchTable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
  v12 = objc_msgSend(v11, "containsObject:", v6);

  if ((v12 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054F78);
    v27 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003A9B4(v27, v4);
LABEL_18:
    -[MIBUNFCResponse setRejected:](v5, "setRejected:", 1);
    goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController dispatchTable](self, "dispatchTable"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v6));
  v15 = NSSelectorFromString(v14);

  v16 = ((uint64_t (*)(MIBUNFCController *, SEL, id))-[MIBUNFCController methodForSelector:](self, "methodForSelector:", v15))(self, v15, v4);
  v17 = (MIBUNFCResponse *)objc_claimAutoreleasedReturnValue(v16);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController observers](self, "observers", 0));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCResponse error](v17, "error"));
        objc_msgSend(v23, "didHandleCommand:withError:", v4, v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v20);
  }

  v5 = v17;
LABEL_13:
  v25 = v5;

  return v25;
}

- (void)sessionDidConnect:(id)a3
{
  NSObject *v4;

  if (-[MIBUNFCController _isHeartbeatMode](self, "_isHeartbeatMode", a3))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MIBUNFCController heartbeatConnectionSem](self, "heartbeatConnectionSem"));
    dispatch_semaphore_signal(v4);

    -[MIBUNFCController heartbeatPeriod](self, "heartbeatPeriod");
    -[MIBUNFCController _restartSessionAfter:forceTerminate:andCompletion:](self, "_restartSessionAfter:forceTerminate:andCompletion:", 1, 0);
  }
}

- (void)sessionDidEndUnexpectedly:(id)a3
{
  if (!-[MIBUNFCController terminated](self, "terminated", a3))
    -[MIBUNFCController _restartSessionAfter:forceTerminate:andCompletion:](self, "_restartSessionAfter:forceTerminate:andCompletion:", 1, 0, 1.0);
}

- (id)_getDispatchTable
{
  _QWORD v3[10];
  _QWORD v4[10];

  v3[0] = &off_10005BBD8;
  v3[1] = &off_10005BBF0;
  v4[0] = CFSTR("_handleSelect:");
  v4[1] = CFSTR("_handleDeviceInfo:");
  v3[2] = &off_10005BC08;
  v3[3] = &off_10005BC20;
  v4[2] = CFSTR("_handleStartUpdate:");
  v4[3] = CFSTR("_handleStatusUpdate:");
  v3[4] = &off_10005BC38;
  v3[5] = &off_10005BC50;
  v4[4] = CFSTR("_handleRetryAfter:");
  v4[5] = CFSTR("_handleHeartbeat:");
  v3[6] = &off_10005BC68;
  v3[7] = &off_10005BC80;
  v4[6] = CFSTR("_handleInstallUpdate:");
  v4[7] = CFSTR("_handleNetworkInfo:");
  v3[8] = &off_10005BC98;
  v3[9] = &off_10005BCB0;
  v4[8] = CFSTR("_handleConfigureNFC:");
  v4[9] = CFSTR("_handleStartDiag:");
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 10));
}

- (id)_handleSelect:(id)a3
{
  id v3;
  MIBUSelectResponse *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;

  v3 = a3;
  v4 = objc_opt_new(MIBUSelectResponse);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100054F98);
  v5 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling select command...", (uint8_t *)&v12, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &unk_10004CB68, 7));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ApplicationID")));
  if ((objc_msgSend(v6, "isEqualToData:", v8) & 1) != 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054FD8);
    v9 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v8;
      v14 = 1024;
      v15 = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Selecting AID: %@; returning protocol version: %d",
        (uint8_t *)&v12,
        0x12u);
    }
    -[MIBUSelectResponse setProtocolVersion:](v4, "setProtocolVersion:", &off_10005BCC8);
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054FB8);
    v11 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AID %@ not supported", (uint8_t *)&v12, 0xCu);
    }
    -[MIBUNFCResponse setRejected:](v4, "setRejected:", 1);
  }

  return v4;
}

- (id)_handleDeviceInfo:(id)a3
{
  MIBUDeviceInfoResponse *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  uint8_t buf[16];

  v3 = objc_opt_new(MIBUDeviceInfoResponse);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100054FF8);
  v4 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling device info command...", buf, 2u);
  }
  v9 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
  if (!v9)
  {
    v58 = 0;
    sub_10000D680(&v58, 100663299, 0, CFSTR("Failed to fetch device serial number"), v5, v6, v7, v8, v51);
    v26 = v58;
LABEL_26:
    v24 = v26;
    goto LABEL_19;
  }
  v10 = MGCopyAnswer(CFSTR("UniqueChipID"), 0);
  if (!v10)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055018);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AA44();
    v57 = 0;
    sub_10000D680(&v57, 100663299, 0, CFSTR("Failed to fetch device ecid"), v27, v28, v29, v30, v51);
    v26 = v57;
    goto LABEL_26;
  }
  v11 = (void *)v10;
  v12 = MGCopyAnswer(CFSTR("BoardId"), 0);
  if (!v12)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055038);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AA70();
    v56 = 0;
    sub_10000D680(&v56, 100663299, 0, CFSTR("Failed to fetch device boardID"), v31, v32, v33, v34, v51);
    v24 = v56;
    goto LABEL_54;
  }
  v13 = (void *)v12;
  v14 = MGCopyAnswer(CFSTR("ChipID"), 0);
  if (!v14)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055058);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AA9C();
    v55 = 0;
    sub_10000D680(&v55, 100663299, 0, CFSTR("Failed to fetch device chipID"), v35, v36, v37, v38, v51);
    v24 = v55;
    goto LABEL_53;
  }
  v15 = (void *)v14;
  v16 = MGCopyAnswer(CFSTR("SecurityDomain"), 0);
  if (!v16)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055078);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AAC8();
    v54 = 0;
    sub_10000D680(&v54, 100663299, 0, CFSTR("Failed to fetch device security domain"), v39, v40, v41, v42, v51);
    v24 = v54;
    goto LABEL_52;
  }
  v17 = (void *)v16;
  v18 = objc_claimAutoreleasedReturnValue(+[MIBUTatsuVerifier apNonce](MIBUTatsuVerifier, "apNonce"));
  if (!v18)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055098);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AAF4();
    v53 = 0;
    sub_10000D680(&v53, 100663299, 0, CFSTR("Failed to fetch device apNonce"), v43, v44, v45, v46, v51);
    v24 = v53;

    goto LABEL_52;
  }
  v19 = (void *)v18;
  v20 = objc_claimAutoreleasedReturnValue(+[MIBUTatsuVerifier sepNonce](MIBUTatsuVerifier, "sepNonce"));
  if (!v20)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000550B8);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AB20();
    v52 = 0;
    sub_10000D680(&v52, 100663299, 0, CFSTR("Failed to fetch device sepNonce"), v47, v48, v49, v50, v51);
    v24 = v52;

LABEL_52:
LABEL_53:

LABEL_54:
    goto LABEL_19;
  }
  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTatsuVerifier sikaFuse](MIBUTatsuVerifier, "sikaFuse"));
  if (!v22)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000550D8);
    v23 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No SikAFuse key detected", buf, 2u);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    -[MIBUDeviceInfoResponse setSikaFuseExists:](v3, "setSikaFuseExists:", 0);
  }
  -[MIBUDeviceInfoResponse setSerialNumber:](v3, "setSerialNumber:", v9);
  -[MIBUDeviceInfoResponse setEcid:](v3, "setEcid:", v11);
  -[MIBUDeviceInfoResponse setBoardID:](v3, "setBoardID:", v13);
  -[MIBUDeviceInfoResponse setChipID:](v3, "setChipID:", v15);
  -[MIBUDeviceInfoResponse setSecurityDomain:](v3, "setSecurityDomain:", v17);
  -[MIBUDeviceInfoResponse setApNonce:](v3, "setApNonce:", v19);
  -[MIBUDeviceInfoResponse setSepNonce:](v3, "setSepNonce:", v21);
  -[MIBUDeviceInfoResponse setSikaFuse:](v3, "setSikaFuse:", v22);
  -[MIBUDeviceInfoResponse setProductionMode:](v3, "setProductionMode:", MGGetBoolAnswer(CFSTR("CertificateProductionStatus")));
  -[MIBUDeviceInfoResponse setSecurityMode:](v3, "setSecurityMode:", MGGetBoolAnswer(CFSTR("CertificateSecurityMode")));
  -[MIBUDeviceInfoResponse setUidMode:](v3, "setUidMode:", 0);

  v24 = 0;
LABEL_19:
  -[MIBUNFCResponse setError:](v3, "setError:", v24);

  return v3;
}

- (id)_handleStartUpdate:(id)a3
{
  id v4;
  MIBUNFCResponse *v5;
  NSObject *v6;
  id v7;
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_opt_new(MIBUNFCResponse);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000550F8);
  v6 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling start update command...", buf, 2u);
  }
  v9 = 0;
  -[MIBUNFCController _verifyTatsuTicketFromCmd:error:](self, "_verifyTatsuTicketFromCmd:error:", v4, &v9);

  v7 = v9;
  -[MIBUNFCResponse setError:](v5, "setError:", v7);

  return v5;
}

- (id)_handleStatusUpdate:(id)a3
{
  MIBUStatusResponse *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __CFString *v22;
  id *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[16];

  v4 = objc_opt_new(MIBUStatusResponse);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055118);
  v5 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling status update command...", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceStatus"));
  -[MIBUStatusResponse setStatus:](v4, "setStatus:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDeviceController sharedInstance](MIBUDeviceController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "osVersion"));
  -[MIBUStatusResponse setOsVersion:](v4, "setOsVersion:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse osVersion](v4, "osVersion"));
  if (!v10)
  {
    v28 = 0;
    v22 = CFSTR("Failed to fetch device os version");
    v23 = (id *)&v28;
    v24 = &v28;
LABEL_13:
    sub_10000D680(v24, 100663299, 0, v22, v11, v12, v13, v14, v25);
    v20 = *v23;
    goto LABEL_9;
  }
  v15 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
  -[MIBUStatusResponse setSerialNumber:](v4, "setSerialNumber:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse serialNumber](v4, "serialNumber"));
  if (!v16)
  {
    v27 = 0;
    v22 = CFSTR("Failed to fetch device os serial number");
    v23 = (id *)&v27;
    v24 = &v27;
    goto LABEL_13;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDeviceController sharedInstance](MIBUDeviceController, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "buildVersion"));
  -[MIBUStatusResponse setBuildVersion:](v4, "setBuildVersion:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse buildVersion](v4, "buildVersion"));
  if (!v19)
  {
    v26 = 0;
    v22 = CFSTR("Failed to fetch device build version");
    v23 = (id *)&v26;
    v24 = &v26;
    goto LABEL_13;
  }
  v20 = 0;
LABEL_9:
  -[MIBUNFCResponse setError:](v4, "setError:", v20);

  return v4;
}

- (id)_handleRetryAfter:(id)a3
{
  id v4;
  MIBUNFCResponse *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  v5 = objc_opt_new(MIBUNFCResponse);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055138);
  v6 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling retry after command...", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("RetryAfter")));
  if (v8)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055158);
    v13 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Retry after %{public}@ seconds", buf, 0xCu);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController session](self, "session"));
    objc_msgSend(v14, "stopListening");

    objc_msgSend(v8, "doubleValue");
    -[MIBUNFCController _restartSessionAfter:forceTerminate:andCompletion:](self, "_restartSessionAfter:forceTerminate:andCompletion:", 0, &stru_100055198);
    v15 = 0;
  }
  else
  {
    v17 = 0;
    sub_10000D680(&v17, 0x80000000, 0, CFSTR("Request does not contain %{public}@ in payload"), v9, v10, v11, v12, (uint64_t)CFSTR("RetryAfter"));
    v15 = v17;
  }
  -[MIBUNFCResponse setError:](v5, "setError:", v15);

  return v5;
}

- (id)_handleHeartbeat:(id)a3
{
  id v4;
  MIBUNFCResponse *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v22;
  _QWORD v23[7];
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  id location;
  uint8_t v40[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_opt_new(MIBUNFCResponse);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000551D8);
  v6 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling heartbeat command...", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v34 = buf;
  v35 = 0x3032000000;
  v36 = sub_100006CCC;
  v37 = sub_100006CDC;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("HeartbeatPeriod")));

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100006CCC;
  v31 = sub_100006CDC;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("HeartbeatTimeout")));

  if (!*((_QWORD *)v34 + 5))
  {
    v26 = 0;
    sub_10000D680(&v26, 0x80000000, 0, CFSTR("Request does not contain %{public}@ in payload"), v9, v10, v11, v12, (uint64_t)CFSTR("HeartbeatPeriod"));
    v22 = v26;
LABEL_15:
    v20 = v22;
    goto LABEL_12;
  }
  if (!v28[5])
  {
    v25 = 0;
    sub_10000D680(&v25, 0x80000000, 0, CFSTR("Request does not contain %{public}@ in payload"), v9, v10, v11, v12, (uint64_t)CFSTR("HeartbeatTimeout"));
    v22 = v25;
    goto LABEL_15;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000551F8);
  v13 = (id)qword_100068950;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*((id *)v34 + 5), "doubleValue");
    v15 = v14;
    objc_msgSend((id)v28[5], "doubleValue");
    *(_DWORD *)v40 = 134218240;
    v41 = v15;
    v42 = 2048;
    v43 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Heartbeat period = %lfs; timeout = %lfs",
      v40,
      0x16u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController session](self, "session"));
  objc_msgSend(v17, "stopListening");

  objc_msgSend(*((id *)v34 + 5), "doubleValue");
  v19 = v18;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100008BF4;
  v23[3] = &unk_100055288;
  v23[4] = self;
  objc_copyWeak(&v24, &location);
  v23[5] = buf;
  v23[6] = &v27;
  -[MIBUNFCController _restartSessionAfter:forceTerminate:andCompletion:](self, "_restartSessionAfter:forceTerminate:andCompletion:", 0, v23, v19);
  objc_destroyWeak(&v24);
  v20 = 0;
LABEL_12:
  -[MIBUNFCResponse setError:](v5, "setError:", v20);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_handleInstallUpdate:(id *)a3
{
  MIBUNFCResponse *v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = objc_opt_new(MIBUNFCResponse);
  -[MIBUNFCResponse setError:](v3, "setError:", 0);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000552A8);
  v4 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling Install Update command...", v6, 2u);
  }
  return v3;
}

- (id)_handleNetworkInfo:(id *)a3
{
  MIBUNetworkInfoResponse *v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  v3 = objc_opt_new(MIBUNetworkInfoResponse);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000552C8);
  v4 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling network info command...", v7, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUNetworkInfo queryNetworkInfo](MIBUNetworkInfo, "queryNetworkInfo"));
  -[MIBUNetworkInfoResponse setNetworkInfo:](v3, "setNetworkInfo:", v5);

  return v3;
}

- (id)_handleConfigureNFC:(id)a3
{
  id v4;
  MIBUNFCResponse *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  id v20;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;

  v4 = a3;
  v5 = objc_opt_new(MIBUNFCResponse);
  if (!-[MIBUNFCController isNFCConfigured](self, "isNFCConfigured"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055308);
    v7 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling configureNFC command...", buf, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("NFCInactivityTimeout")));

    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      if (v18 >= 0.0)
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100055328);
        v19 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v9;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "nfcInactivity timeout: %{public}@ seconds", buf, 0xCu);
        }
        objc_msgSend(v9, "doubleValue");
        -[MIBUNFCController setNfcInactivityTimeout:](self, "setNfcInactivityTimeout:");
        -[MIBUNFCController nfcInactivityTimeout](self, "nfcInactivityTimeout");
        -[MIBUNFCController _startNFCInactivityTimer:](self, "_startNFCInactivityTimer:");
        -[MIBUNFCController setIsNFCConfigured:](self, "setIsNFCConfigured:", 1);
        v20 = 0;
        goto LABEL_18;
      }
      v24 = 0;
      sub_10000D680(&v24, 0x1000000, 0, CFSTR("nfcInactivity timeout value must be >= 0"), v14, v15, v16, v17, v23);
      v22 = v24;
    }
    else
    {
      v25 = 0;
      sub_10000D680(&v25, 0x80000000, 0, CFSTR("Request does not contain %{public}@ in payload"), v10, v11, v12, v13, (uint64_t)CFSTR("NFCInactivityTimeout"));
      v22 = v25;
    }
    v20 = v22;
LABEL_18:
    -[MIBUNFCResponse setError:](v5, "setError:", v20);

    goto LABEL_19;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000552E8);
  v6 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NFC has already been configured. Rejecting command", buf, 2u);
  }
  -[MIBUNFCResponse setRejected:](v5, "setRejected:", 1);
LABEL_19:

  return v5;
}

- (id)_handleStartDiag:(id)a3
{
  id v4;
  MIBUNFCResponse *v5;
  NSObject *v6;
  id v7;
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_opt_new(MIBUNFCResponse);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055348);
  v6 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling start diag command...", buf, 2u);
  }
  v9 = 0;
  -[MIBUNFCController _verifyTatsuTicketFromCmd:error:](self, "_verifyTatsuTicketFromCmd:error:", v4, &v9);

  v7 = v9;
  -[MIBUNFCResponse setError:](v5, "setError:", v7);

  return v5;
}

- (void)_startHCESession:(id *)a3
{
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  void *v8;
  id v9;
  dispatch_semaphore_t v10;
  dispatch_time_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  id obj;
  _QWORD v23[5];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100006CCC;
  v30 = sub_100006CDC;
  v31 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController session](self, "session"));
  v6 = objc_msgSend(v5, "running");

  if ((v6 & 1) != 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000553D0);
    v7 = (id)qword_100068950;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v33 = v8;
      v9 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not starting %{public}@ since HCE session already running", buf, 0xCu);

    }
  }
  else
  {
    v10 = dispatch_semaphore_create(0);
    v11 = dispatch_time(0, 60000000000);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController session](self, "session"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100009AA8;
    v23[3] = &unk_100055390;
    v25 = &v26;
    v23[4] = self;
    v7 = v10;
    v24 = v7;
    objc_msgSend(v12, "startHCESessionWithCompletion:", v23);

    if (dispatch_semaphore_wait(v7, v11))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000553B0);
      v13 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003AC20(v13, v14, v15, v16, v17, v18, v19, v20);
      v21 = (id *)(v27 + 5);
      obj = (id)v27[5];
      sub_10000D680(&obj, 83886086, 0, CFSTR("NFC termination wait timed out after %ds"), v17, v18, v19, v20, 60);
      objc_storeStrong(v21, obj);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v27[5]);
  _Block_object_dispose(&v26, 8);

}

- (void)_restartSessionAfter:(double)a3 forceTerminate:(BOOL)a4 andCompletion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13[2];
  BOOL v14;
  id location;

  v8 = a5;
  objc_initWeak(&location, self);
  v9 = objc_claimAutoreleasedReturnValue(-[MIBUNFCController queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009DDC;
  v11[3] = &unk_100055418;
  objc_copyWeak(v13, &location);
  v14 = a4;
  v13[1] = *(id *)&a3;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_startSessionRestartTimer:(double)a3 error:(id *)a4
{
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A0C8;
  v6[3] = &unk_100055460;
  v6[4] = self;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_stopSessionRestartTimer
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController sessionRestartTimer](self, "sessionRestartTimer"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController sessionRestartTimer](self, "sessionRestartTimer"));

  if (v4)
  {
    if (!-[MIBUNFCController _isHeartbeatMode](self, "_isHeartbeatMode"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055480);
      v5 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping session restart timer", v7, 2u);
      }
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController sessionRestartTimer](self, "sessionRestartTimer"));
    objc_msgSend(v6, "invalidate");

    -[MIBUNFCController setSessionRestartTimer:](self, "setSessionRestartTimer:", 0);
  }
  objc_sync_exit(v3);

}

- (BOOL)_isHeartbeatMode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController heartbeatConnectionSem](self, "heartbeatConnectionSem"));
  v3 = v2 != 0;

  return v3;
}

- (void)_restartSession:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (!-[MIBUNFCController _isHeartbeatMode](self, "_isHeartbeatMode", a3))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000554A0);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session Restart Timer Fired! Restarting HCE Session...", v5, 2u);
    }
  }
  -[MIBUNFCController _startHCESession:](self, "_startHCESession:", 0);
}

- (void)_startNFCInactivityTimer:(double)a3
{
  _QWORD v5[5];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A694;
  v5[3] = &unk_100055460;
  v5[4] = self;
  objc_copyWeak(v6, &location);
  v6[1] = *(id *)&a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)_nfcInactivityTimeoutHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000554C0);
  v5 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NFC Inactivity timer Fired!", v9, 2u);
  }
  -[MIBUNFCController _stopNFCInactivityTimer](self, "_stopNFCInactivityTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "nfcActivityDidTimeout");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController delegate](self, "delegate"));
    objc_msgSend(v8, "nfcActivityDidTimeout");

  }
}

- (void)_stopNFCInactivityTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController nfcInactivityTimer](self, "nfcInactivityTimer"));

  if (v3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000554E0);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping nfcInactivityTimer...", v6, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController nfcInactivityTimer](self, "nfcInactivityTimer"));
    objc_msgSend(v5, "invalidate");

    -[MIBUNFCController setNfcInactivityTimer:](self, "setNfcInactivityTimer:", 0);
  }
}

- (void)_resetNFCInactivityTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController nfcInactivityTimer](self, "nfcInactivityTimer"));

  if (v3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055500);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping isNFCActive Timer...", (uint8_t *)&v9, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCController nfcInactivityTimer](self, "nfcInactivityTimer"));
    objc_msgSend(v5, "invalidate");

    -[MIBUNFCController setNfcInactivityTimer:](self, "setNfcInactivityTimer:", 0);
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055520);
  v6 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[MIBUNFCController nfcInactivityTimeout](self, "nfcInactivityTimeout");
    v9 = 134217984;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting nfcInactivityTimer with timeout: %lf", (uint8_t *)&v9, 0xCu);

  }
  -[MIBUNFCController nfcInactivityTimeout](self, "nfcInactivityTimeout");
  -[MIBUNFCController _startNFCInactivityTimer:](self, "_startNFCInactivityTimer:");
}

- (void)_verifyTatsuTicketFromCmd:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("TatsuTicket")));

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055540);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received Tatsu ticket: %{public}@", buf, 0xCu);
  }
  if (v6)
  {
    v15 = 0;
    v12 = (id *)&v15;
    +[MIBUTatsuVerifier verifyTatsuEntitlement:error:](MIBUTatsuVerifier, "verifyTatsuEntitlement:error:", v6, &v15);
  }
  else
  {
    v16 = 0;
    v12 = (id *)&v16;
    sub_10000D680(&v16, 100663297, 0, CFSTR("No Tatsu Ticket"), v8, v9, v10, v11, v15);
  }
  v13 = *v12;
  v14 = v13;
  if (v13)
    *a4 = objc_retainAutorelease(v13);

}

- (MIBUHCESession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (MIBUNFCControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSDictionary)dispatchTable
{
  return self->_dispatchTable;
}

- (void)setDispatchTable:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchTable, a3);
}

- (PCPersistentTimer)sessionRestartTimer
{
  return self->_sessionRestartTimer;
}

- (void)setSessionRestartTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sessionRestartTimer, a3);
}

- (PCPersistentTimer)nfcInactivityTimer
{
  return self->_nfcInactivityTimer;
}

- (void)setNfcInactivityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nfcInactivityTimer, a3);
}

- (OS_dispatch_semaphore)heartbeatConnectionSem
{
  return self->_heartbeatConnectionSem;
}

- (void)setHeartbeatConnectionSem:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatConnectionSem, a3);
}

- (double)heartbeatPeriod
{
  return self->_heartbeatPeriod;
}

- (void)setHeartbeatPeriod:(double)a3
{
  self->_heartbeatPeriod = a3;
}

- (double)nfcInactivityTimeout
{
  return self->_nfcInactivityTimeout;
}

- (void)setNfcInactivityTimeout:(double)a3
{
  self->_nfcInactivityTimeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (BOOL)isNFCConfigured
{
  return self->_isNFCConfigured;
}

- (void)setIsNFCConfigured:(BOOL)a3
{
  self->_isNFCConfigured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heartbeatConnectionSem, 0);
  objc_storeStrong((id *)&self->_nfcInactivityTimer, 0);
  objc_storeStrong((id *)&self->_sessionRestartTimer, 0);
  objc_storeStrong((id *)&self->_dispatchTable, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
