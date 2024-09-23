@implementation MIBUXPCResponder

- (void)isInBoxUpdateModeWithReply:(id)a3
{
  void (**v3)(id, id, _QWORD);
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (void (**)(id, id, _QWORD))a3;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055FD0);
  v4 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling isInBoxUpdateMode: xpc call", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDeviceController sharedInstance](MIBUDeviceController, "sharedInstance"));
  v3[2](v3, objc_msgSend(v5, "isInBoxUpdateMode"), 0);

}

- (void)isInDiagnosticModeWithReply:(id)a3
{
  void (**v3)(id, id, _QWORD);
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = (void (**)(id, id, _QWORD))a3;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055FF0);
  v4 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling isInDiagnosticMode: xpc call", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDeviceController sharedInstance](MIBUDeviceController, "sharedInstance"));
  v3[2](v3, objc_msgSend(v5, "isInDiagnosticMode"), 0);

}

- (void)eapConfigurationWithReply:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, uint64_t, uint64_t);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  int v36;

  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100012FEC;
  v33 = sub_100012FFC;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100012FEC;
  v27 = sub_100012FFC;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100012FEC;
  v21 = sub_100012FFC;
  v22 = 0;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056010);
  v5 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling eapConfigurationWithCompletion: xpc call", buf, 2u);
  }
  v6 = objc_claimAutoreleasedReturnValue(-[MIBUXPCResponder _verifyBooleanEntitlement:](self, "_verifyBooleanEntitlement:", CFSTR("com.apple.private.mobileinboxupdater.eapCredentialEnabled")));
  v7 = (void *)v18[5];
  v18[5] = v6;

  if (v18[5])
    goto LABEL_13;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100013068;
  v16[3] = &unk_100056038;
  v16[4] = &v17;
  v16[5] = &v29;
  v16[6] = &v23;
  +[MIBUCertHelper readSUIdentityWithCompletion:](MIBUCertHelper, "readSUIdentityWithCompletion:", v16);
  if (!os_variant_has_internal_content("com.apple.inboxupdaterd"))
    goto LABEL_13;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "factorySUKeyPath"));

  if (!v9)
    goto LABEL_13;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "factorySUKeyIsSEP"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "factorySUKeyIsSEP"));
    v14 = (uint64_t)objc_msgSend(v13, "BOOLValue");

    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056058);
    v15 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Overriding isSEPKey=%d", buf, 8u);
    }
  }
  else
  {
LABEL_13:
    v14 = 1;
  }
  v4[2](v4, v30[5], v24[5], v14, v18[5]);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

}

- (void)terminateInBoxUpdateWithReply:(id)a3
{
  void (**v4)(id, id);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[16];

  v4 = (void (**)(id, id))a3;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056078);
  v5 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling terminateInBoxUpdateWithCompletion: xpc call", buf, 2u);
  }
  v6 = objc_claimAutoreleasedReturnValue(-[MIBUXPCResponder _verifyBooleanEntitlement:](self, "_verifyBooleanEntitlement:", CFSTR("com.apple.private.mobileinboxupdater.terminationEnabled")));
  if (v6)
  {
    v8 = (id)v6;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUMainController sharedInstance](MIBUMainController, "sharedInstance"));
    v9 = 0;
    objc_msgSend(v7, "cleanup:", &v9);
    v8 = v9;

  }
  v4[2](v4, v8);

}

- (void)connectToWiFiWithReply:(id)a3
{
  void (**v3)(id, id);
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;

  v3 = (void (**)(id, id))a3;
  if (os_variant_has_internal_content("com.apple.inboxupdaterd"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056098);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling connectToWiFi: xpc call", buf, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUWiFiHelper sharedInstance](MIBUWiFiHelper, "sharedInstance"));
    v8 = 0;
    objc_msgSend(v5, "connectAndMonitor:", &v8);
    v6 = v8;
    v3[2](v3, v6);

    v3 = (void (**)(id, id))v6;
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000560B8);
    v7 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[MIBUXPCResponder connectToWiFiWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s is only supported on internal builds", buf, 0xCu);
    }
    v3[2](v3, 0);
  }

}

- (void)stopWiFiMonitorWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v3 = (void (**)(id, _QWORD))a3;
  if (os_variant_has_internal_content("com.apple.inboxupdaterd"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000560D8);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling stopWiFiMonitor: xpc call", (uint8_t *)&v7, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUWiFiHelper sharedInstance](MIBUWiFiHelper, "sharedInstance"));
    objc_msgSend(v5, "stopMonitor");

  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000560F8);
    v6 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[MIBUXPCResponder stopWiFiMonitorWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is only supported on internal builds", (uint8_t *)&v7, 0xCu);
    }
  }
  v3[2](v3, 0);

}

- (id)_verifyBooleanEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  id *v21;
  uint64_t *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUXPCResponder xpcConnection](self, "xpcConnection"));
  v6 = v5;
  if (!v5)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056118);
    v12 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BC78(v12, v13, v14, v15, v16, v17, v18, v19);
    v43 = 0;
    v20 = CFSTR("Failed to get XPC connection");
    v21 = (id *)&v43;
    v22 = &v43;
    v23 = 2415919104;
    goto LABEL_17;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", v4));
  if (!v7)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056138);
    v24 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BCA8((uint64_t)v4, v24, v25, v26, v16, v17, v18, v19);
    v42 = 0;
    v20 = CFSTR("Entitlement %@ not found");
    v39 = (uint64_t)v4;
    v21 = (id *)&v42;
    v22 = &v42;
    v23 = 2415919105;
LABEL_17:
    sub_10000D680(v22, v23, 0, v20, v16, v17, v18, v19, v39);
    v8 = 0;
LABEL_28:
    v10 = *v21;
    goto LABEL_6;
  }
  v8 = (void *)v7;
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056158);
    v27 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BD78((uint64_t)v4, v27);
    v41 = 0;
    v21 = (id *)&v41;
    sub_10000D680(&v41, 2415919105, 0, CFSTR("Entitlement %@ invalid"), v28, v29, v30, v31, (uint64_t)v4);
    goto LABEL_28;
  }
  if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056178);
    v32 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BD10((uint64_t)v4, v32, v33, v34, v35, v36, v37, v38);
    v40 = 0;
    v21 = (id *)&v40;
    sub_10000D680(&v40, 2415919105, 0, CFSTR("Entitlement %@ is FALSE"), v35, v36, v37, v38, (uint64_t)v4);
    goto LABEL_28;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end
