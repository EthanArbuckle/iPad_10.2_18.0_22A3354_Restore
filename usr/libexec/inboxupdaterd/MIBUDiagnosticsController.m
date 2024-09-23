@implementation MIBUDiagnosticsController

- (MIBUDiagnosticsController)initWithDelegate:(id)a3
{
  id v4;
  MIBUDiagnosticsController *v5;
  MIBUDiagnosticsController *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MIBUDiagnosticsController;
  v5 = -[MIBUDiagnosticsController init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[MIBUDiagnosticsController setDelegate:](v5, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUWiFiHelper sharedInstance](MIBUWiFiHelper, "sharedInstance"));
    -[MIBUDiagnosticsController setWifiHelper:](v6, "setWifiHelper:", v7);

    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v8 = (void *)qword_1000688A8;
    v17 = qword_1000688A8;
    if (!qword_1000688A8)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001076C;
      v13[3] = &unk_100055DB8;
      v13[4] = &v14;
      sub_10001076C((uint64_t)v13);
      v8 = (void *)v15[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v14, 8);
    v10 = objc_msgSend([v9 alloc], "initWithDelegate:", v6);
    -[MIBUDiagnosticsController setDiagsLauncher:](v6, "setDiagsLauncher:", v10);

  }
  return v6;
}

- (void)start
{
  MIBUDiagnosticsController *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  id *v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id obj;
  _QWORD block[6];
  uint8_t buf[16];
  uint64_t v31;
  id *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v31 = 0;
  v32 = (id *)&v31;
  v33 = 0x3032000000;
  v34 = sub_10000FCE0;
  v35 = sub_10000FCF0;
  v36 = 0;
  v2 = self;
  objc_sync_enter(v2);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055C40);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting diagnostics controller...", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDiagnosticsController diagsLauncher](v2, "diagsLauncher"));

  if (!v4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055C60);
    v11 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BA3C(v11, v12, v13, v14, v15, v16, v17, v18);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000FDC0;
    block[3] = &unk_100055C88;
    block[4] = v2;
    block[5] = &v31;
    v10 = block;
    goto LABEL_19;
  }
  if (os_variant_has_internal_content("com.apple.inboxupdaterd"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v6 = objc_msgSend(v5, "skipWiFiAssociation");

    if (v6)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055CA8);
      v7 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping WiFi Association...", buf, 2u);
      }
      goto LABEL_13;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDiagnosticsController wifiHelper](v2, "wifiHelper"));
  v9 = v32;
  obj = v32[5];
  objc_msgSend(v8, "connectAndMonitor:", &obj);
  objc_storeStrong(v9 + 5, obj);

  if (!v32[5])
  {
LABEL_13:
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000FF04;
    v27[3] = &unk_100055CF0;
    v27[4] = v2;
    v10 = v27;
LABEL_19:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    goto LABEL_20;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055CC8);
  v19 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003BA6C(v19, v20, v21, v22, v23, v24, v25, v26);
LABEL_20:
  objc_sync_exit(v2);

  _Block_object_dispose(&v31, 8);
}

- (BOOL)terminate:(id *)a3
{
  MIBUDiagnosticsController *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  unsigned __int8 v11;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;

  v4 = self;
  objc_sync_enter(v4);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055D10);
  v5 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Terminating diagnostics controller...", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDiagnosticsController wifiHelper](v4, "wifiHelper"));
  objc_msgSend(v6, "stopMonitor");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", CFSTR("com.apple.Diagnostics")));
  v8 = objc_msgSend(objc_alloc((Class)RBSTerminateContext), "initWithExplanation:", CFSTR("Terminated by inboxupdaterd"));
  v9 = objc_msgSend(objc_alloc((Class)RBSTerminateRequest), "initWithPredicate:context:", v7, v8);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055D30);
  v10 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = CFSTR("com.apple.Diagnostics");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Terminating app: %{public}@", buf, 0xCu);
  }
  v13 = 0;
  v11 = objc_msgSend(v9, "execute:", &v13);
  if (a3)
    *a3 = objc_retainAutorelease(v13);

  objc_sync_exit(v4);
  return v11;
}

- (void)diagnosticsAppLaunchedWithResult:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[16];

  if (a3 == 2)
  {
    v14 = 0;
    sub_10000D680(&v14, 3221225472, 0, CFSTR("Diagnostics app failed to launch!"), v3, v4, v5, v6, v12);
    v10 = v14;
LABEL_12:
    v9 = v10;
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    v15 = 0;
    sub_10000D680(&v15, 3221225472, 0, CFSTR("Diagnostics app launched, but unable to communicate with launcher service over XPC"), v3, v4, v5, v6, v12);
    v10 = v15;
    goto LABEL_12;
  }
  if (a3)
  {
    v13 = 0;
    sub_10000D680(&v13, 3221225472, 0, CFSTR("Unhandled Diagnostics app launch result %ld."), v3, v4, v5, v6, a3);
    v10 = v13;
    goto LABEL_12;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055D50);
  v8 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Diagnostics app launched successfully. Waiting for exit...", buf, 2u);
  }
  v9 = 0;
LABEL_13:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDiagnosticsController delegate](self, "delegate"));
  objc_msgSend(v11, "appDidLaunchWithError:", v9);

}

- (void)diagnosticsAppDidExitWithReason:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  NSObject *v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[8];
  void *v20;

  switch(a3)
  {
    case -1:
      v20 = 0;
      sub_10000D680(&v20, 3221225477, 0, CFSTR("Diagnostics app exited without sending a reason"), v3, v4, v5, v6, v13);
      v8 = v20;
      goto LABEL_18;
    case 0:
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055D70);
      v9 = qword_100068950;
      if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v10 = "Diagnostics app was exited by the user.";
      goto LABEL_12;
    case 2:
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055D90);
      v9 = qword_100068950;
      if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v10 = "Diagnostics app was exited because the session archived.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
LABEL_13:
      v11 = 0;
      break;
    case 3:
      v18 = 0;
      sub_10000D680(&v18, 3221225473, 0, CFSTR("Diagnostics app was exited because of a fatal AST2 error"), v3, v4, v5, v6, v13);
      v8 = v18;
      goto LABEL_18;
    case 4:
      v17 = 0;
      sub_10000D680(&v17, 3221225474, 0, CFSTR("Diagnostics app was exited because the network is not reachable."), v3, v4, v5, v6, v13);
      v8 = v17;
      goto LABEL_18;
    case 5:
      v16 = 0;
      sub_10000D680(&v16, 3221225475, 0, CFSTR("Diagnostics app was exited due to inactivity."), v3, v4, v5, v6, v13);
      v8 = v16;
      goto LABEL_18;
    case 6:
      v15 = 0;
      sub_10000D680(&v15, 3221225476, 0, CFSTR("Diagnostics app exited due to a fatal error."), v3, v4, v5, v6, v13);
      v8 = v15;
      goto LABEL_18;
    default:
      v14 = 0;
      sub_10000D680(&v14, 3221225477, 0, CFSTR("Unhandled Diagnostics app exit reason: %ld"), v3, v4, v5, v6, a3);
      v8 = v14;
LABEL_18:
      v11 = v8;
      break;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDiagnosticsController delegate](self, "delegate"));
  objc_msgSend(v12, "appDidExitWithError:", v11);

}

- (MIBUDiagnosticsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (MIBUWiFiHelper)wifiHelper
{
  return self->_wifiHelper;
}

- (void)setWifiHelper:(id)a3
{
  objc_storeStrong((id *)&self->_wifiHelper, a3);
}

- (DADiagnosticsLauncher)diagsLauncher
{
  return self->_diagsLauncher;
}

- (void)setDiagsLauncher:(id)a3
{
  objc_storeStrong((id *)&self->_diagsLauncher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagsLauncher, 0);
  objc_storeStrong((id *)&self->_wifiHelper, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
