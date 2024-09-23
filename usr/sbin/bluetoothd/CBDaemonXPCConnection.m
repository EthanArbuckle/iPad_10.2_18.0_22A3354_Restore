@implementation CBDaemonXPCConnection

- (void)_xpcSendReply:(id)a3
{
  id v4;
  OS_xpc_object *xpcCnx;
  uint64_t ResponseHandler;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v4 = a3;
  xpcCnx = self->_xpcCnx;
  v16 = v4;
  if (xpcCnx)
  {
    xpc_connection_send_message(xpcCnx, v4);
  }
  else
  {
    ResponseHandler = CUXPCObjectGetResponseHandler(v4);
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(ResponseHandler);
    if (v7)
    {
      v8 = (void *)CUXPCCreateCFObjectFromXPCObject(v16);
      v9 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          v10 = CUPrintNSObjectOneLine(v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendReply:]", 30, "Remote reply send: %@", v11);

        }
        ((void (**)(_QWORD, void *, _QWORD, _QWORD))v7)[2](v7, v8, 0, 0);
      }
      else
      {
        v12 = CBErrorF(4294960579, "Convert XPC to CF failed");
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (dword_100977FD8 <= 90
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          v14 = CUPrintNSError(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendReply:]", 90, "### Send reply failed: %@", v15);

        }
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v7)[2](v7, 0, 0, v13);

      }
    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendReply:]", 90, "### Send reply with no cnx");
    }

  }
}

- (int64_t)_powerStateForClient
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
  v4 = objc_msgSend(v3, "powerState");

  if (v4 == (id)10)
  {
    if (self->_supportsRestrictedMode)
    {
      return 10;
    }
    else if (self->_activatedDiscovery)
    {
      return 5;
    }
    else if (self->_activatedSpatialInteractionSession)
    {
      return 5;
    }
    else
    {
      return 10;
    }
  }
  return (int64_t)v4;
}

- (void)activate
{
  uint64_t v3;
  id v4;

  self->_isHomePod = GestaltGetDeviceClass(self, a2) == 7;
  if (dword_100977FD8 <= 20 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 20)))
  {
    v3 = CUPrintPID(self->_pid);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection activate]", 20, "XPC connection start: %@", v4);

  }
}

- (void)_xpcCBDiscoveryActivate:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  v12 = 0;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v12);
  v6 = v12;
  if ((v5 & 1) != 0)
  {
    v11 = v6;
    v7 = objc_msgSend(objc_alloc((Class)CBDiscovery), "initWithXPCObject:error:", v4, &v11);
    v8 = v11;

    if (v7)
    {
      objc_msgSend(v7, "setAppID:", self->_appID);
      if (((unint64_t)objc_msgSend(v7, "discoveryFlags") & 0x400000000000) != 0)
        -[CBDaemonXPCConnection _xpcCBDiscoveryActivateWHB:discovery:](self, "_xpcCBDiscoveryActivateWHB:discovery:", v4, v7);
      else
        -[CBDaemonXPCConnection _xpcCBDiscoveryActivateLocal:discovery:](self, "_xpcCBDiscoveryActivateLocal:discovery:", v4, v7);
    }
    else
    {
      if (dword_100977FD8 <= 90
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        v9 = CUPrintNSError(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryActivate:]", 90, "### CBDiscovery activate decode failed: %@", v10);

      }
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v8, v4);
    }

  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    v8 = v6;
  }

}

- (void)_xpcCBDiscoveryUpdate:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id v8;
  id *v9;
  id v10;
  CBDiscovery *activatedDiscovery;
  CBDiscovery *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id obj;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1000624FC;
  v31 = sub_100062338;
  v32 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10006715C;
  v24[3] = &unk_100917C98;
  v26 = &v27;
  v24[4] = self;
  v4 = a3;
  v25 = v4;
  v5 = objc_retainBlock(v24);
  v6 = (id *)(v28 + 5);
  obj = (id)v28[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc((Class)CBDiscovery);
    v9 = (id *)(v28 + 5);
    v22 = (id)v28[5];
    v10 = objc_msgSend(v8, "initWithXPCObject:error:", v4, &v22);
    objc_storeStrong(v9, v22);
    if (v10)
    {
      activatedDiscovery = self->_activatedDiscovery;
      if (activatedDiscovery)
      {
        v12 = activatedDiscovery;
        goto LABEL_6;
      }
      v12 = self->_activatedDiscoveryWHB;
      if (v12)
      {
LABEL_6:
        v13 = -[CBDiscovery updateWithCBDiscovery:](v12, "updateWithCBDiscovery:", v10);
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          v14 = CUPrintPID(self->_pid);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryUpdate:]", 30, "Discovery Update: %@, from %@", v12, v15);

        }
        if (v13)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
          objc_msgSend(v16, "reportCBDiscovery:daemonCnx:action:", v12, self, CFSTR("updt"));

          -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 0);
        }
        goto LABEL_12;
      }
      v19 = CBErrorF(4294960551, "No discovery");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)v28[5];
      v28[5] = v20;

      v12 = 0;
    }
    else
    {
      v17 = CBErrorF(4294960591, "Decode failed");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v12 = (CBDiscovery *)v28[5];
      v28[5] = v18;
    }
LABEL_12:

  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v27, 8);
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  BOOL v3;
  void *v6;
  void *v7;
  const char *string;
  void (**v9)(_QWORD);
  NSString *v10;
  NSString *appID;
  char v12;
  NSString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[5];
  _OWORD v30[2];

  if (!self->_entitled)
  {
    memset(v30, 0, sizeof(v30));
    xpc_connection_get_audit_token(self->_xpcCnx, v30);
    v6 = (void *)xpc_copy_entitlement_for_token(0, v30);
    v7 = v6;
    if (!v6
      || !xpc_dictionary_get_BOOL(v6, "com.apple.bluetooth.system")
      && !xpc_dictionary_get_BOOL(v7, "com.apple.bluetooth.internal"))
    {
      v23 = CBErrorF(4294896128, "Missing entitlement: %s", "com.apple.bluetooth.system");
      v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(v23);
      if (dword_100977FD8 <= 90
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        v24 = CUPrintPID(self->_pid);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = CUPrintNSError(v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _entitledAndReturnError:]", 90, "### CoreBluetooth denied: %@, %@", v25, v27);

      }
      if (a3)
      {
        v9 = objc_retainAutorelease(v9);
        v3 = 0;
        *a3 = v9;
      }
      else
      {
        v3 = 0;
      }
      goto LABEL_36;
    }
    string = (const char *)xpc_copy_code_signing_identity_for_token(v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10006714C;
    v29[3] = &unk_100917378;
    v29[4] = string;
    v9 = objc_retainBlock(v29);
    if (string || (string = xpc_dictionary_get_string(v7, "application-identifier")) != 0)
    {
      v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
      appID = self->_appID;
      self->_appID = v10;

      v12 = 0;
    }
    else
    {
      v12 = 1;
    }
    if (-[CBDaemonServer prefEnforceApprovedList](self->_daemon, "prefEnforceApprovedList"))
    {
      if ((v12 & 1) != 0)
      {
LABEL_15:
        v17 = CBErrorF(4294960523, "App ID not approved: %s", string);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (dword_100977FD8 <= 90
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          v19 = CUPrintPID(self->_pid);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = CUPrintNSError(v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _entitledAndReturnError:]", 90, "### CoreBluetooth denied: %@, %@", v20, v22);

        }
        if (a3)
          *a3 = objc_retainAutorelease(v18);

        v3 = 0;
LABEL_35:
        v9[2](v9);
LABEL_36:

        return v3;
      }
      v13 = self->_appID;
      v14 = CBGenerateObfuscatedSHA256HashedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = 0;
      while ((objc_msgSend(v15, "isEqualToString:", off_100918B58[v16]) & 1) == 0)
      {
        if (++v16 == 167)
        {

          goto LABEL_15;
        }
      }

    }
    if ((v12 & 1) == 0 && !strcmp(string, "com.apple.cloudpaird"))
      self->_supportsRestrictedMode = 1;
    v3 = 1;
    self->_entitled = 1;
    goto LABEL_35;
  }
  return 1;
}

- (void)_xpcCBDiscoveryActivateLocal:(id)a3 discovery:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t Reply;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  CBDaemonXPCConnection *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_activatedDiscovery, a4);
  if (dword_100977FD8 <= 30 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
  {
    v8 = CUPrintPID(self->_pid);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryActivateLocal:discovery:]", 30, "Activate: %@, from %@", v7, v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
  objc_msgSend(v10, "reportCBDiscovery:daemonCnx:action:", v7, self, CFSTR("strt"));

  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 1);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000C3B98;
  v38[3] = &unk_100917058;
  v38[4] = self;
  v11 = v7;
  v39 = v11;
  objc_msgSend(v11, "setBluetoothStateChangedHandler:", v38);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10002A03C;
  v36[3] = &unk_1009171C0;
  v36[4] = self;
  v12 = v11;
  v37 = v12;
  objc_msgSend(v12, "setDeviceFoundHandler:", v36);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C3BF8;
  v34[3] = &unk_1009171C0;
  v34[4] = self;
  v13 = v12;
  v35 = v13;
  objc_msgSend(v13, "setDeviceLostHandler:", v34);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000C3C1C;
  v32[3] = &unk_100917A68;
  v32[4] = self;
  v14 = v13;
  v33 = v14;
  objc_msgSend(v14, "setDevicesBufferedHandler:", v32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C3C40;
  v30[3] = &unk_100917058;
  v30[4] = self;
  v15 = v14;
  v31 = v15;
  objc_msgSend(v15, "setSystemOverrideHandler:", v30);
  Reply = CUXPCDictionaryCreateReply(v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(Reply);
  if (v17)
  {
    xpc_dictionary_set_int64(v17, "pwrS", -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient"));
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = sub_1000624FC;
    v28 = sub_100062338;
    v29 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer deviceMap](self->_daemon, "deviceMap"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000C3C60;
    v20[3] = &unk_100918070;
    v21 = v15;
    v22 = self;
    v23 = &v24;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v20);

    v19 = (void *)v25[5];
    if (v19)
      xpc_dictionary_set_value(v17, "devA", v19);
    -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v17);

    _Block_object_dispose(&v24, 8);
  }
  else if (dword_100977FD8 <= 90
         && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
  {
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryActivateLocal:discovery:]", 90, "### CBDiscovery activate create reply failed");
  }

}

- (void)xpcReceivedMessage:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  xpc_object_t dictionary;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  OS_xpc_object *xpcCnx;
  xpc_object_t xdict;

  xdict = a3;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
  {
    dictionary = xpc_dictionary_get_dictionary(xdict, "rmtD");
    v8 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    if (v8)
      -[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:](self, "_xpcReceivedMessage:remoteDevice:", xdict, v8);
    else
      -[CBDaemonXPCConnection xpcReceivedRequest:](self, "xpcReceivedRequest:", xdict);

    goto LABEL_17;
  }
  v4 = xdict;
  if (xdict == &_xpc_error_connection_invalid)
  {
    if (dword_100977FD8 <= 20
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 20)))
    {
      v9 = CUPrintPID(self->_pid);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection xpcReceivedMessage:]", 20, "XPC connection ended: %@", v10);

    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    -[CBDaemonXPCConnection invalidate](self, "invalidate");
    goto LABEL_17;
  }
  if (dword_100977FD8 <= 90)
  {
    if (dword_100977FD8 != -1 || (v11 = _LogCategory_Initialize(&dword_100977FD8, 90), v4 = xdict, v11))
    {
      v5 = CUPrintXPC(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection xpcReceivedMessage:]", 90, "### XPC connection error: %@", v6);

LABEL_17:
      v4 = xdict;
    }
  }

}

- (void)xpcReceivedRequest:(id)a3
{
  const char *string;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (string)
  {
    v5 = string;
    if (!strcmp(string, "AdvA"))
    {
      -[CBDaemonXPCConnection _xpcCBAdvertiserActivate:](self, "_xpcCBAdvertiserActivate:", v8);
    }
    else if (!strcmp(v5, "AdvU"))
    {
      -[CBDaemonXPCConnection _xpcCBAdvertiserUpdate:](self, "_xpcCBAdvertiserUpdate:", v8);
    }
    else if (!strcmp(v5, "CnxA"))
    {
      -[CBDaemonXPCConnection _xpcCBConnectionActivate:](self, "_xpcCBConnectionActivate:", v8);
    }
    else
    {
      if (!strcmp(v5, "CnxD"))
      {
        -[CBDaemonXPCConnection _xpcCBConnectionDisconnect:](self, "_xpcCBConnectionDisconnect:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "CnPC"))
      {
        -[CBDaemonXPCConnection _xpcCBConnectionPairingContinue:](self, "_xpcCBConnectionPairingContinue:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "CtrA"))
      {
        -[CBDaemonXPCConnection _xpcCBControllerActivate:](self, "_xpcCBControllerActivate:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "GCtI"))
      {
        -[CBDaemonXPCConnection _xpcGetControllerInfo:](self, "_xpcGetControllerInfo:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "GCtS"))
      {
        -[CBDaemonXPCConnection _xpcGetControllerSettings:](self, "_xpcGetControllerSettings:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "MCtS"))
      {
        -[CBDaemonXPCConnection _xpcModifyControllerSettings:](self, "_xpcModifyControllerSettings:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "GtDv"))
      {
        -[CBDaemonXPCConnection _xpcGetDevices:](self, "_xpcGetDevices:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DltD"))
      {
        -[CBDaemonXPCConnection _xpcDeleteDevice:](self, "_xpcDeleteDevice:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "UpDv"))
      {
        -[CBDaemonXPCConnection _xpcModifyDevice:](self, "_xpcModifyDevice:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "PfDR"))
      {
        -[CBDaemonXPCConnection _xpcPerformDeviceRequest:](self, "_xpcPerformDeviceRequest:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DiCt"))
      {
        -[CBDaemonXPCConnection _xpcDiagnosticControl:](self, "_xpcDiagnosticControl:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DiLg"))
      {
        -[CBDaemonXPCConnection _xpcDiagnosticLog:](self, "_xpcDiagnosticLog:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DiSh"))
      {
        -[CBDaemonXPCConnection _xpcDiagnosticShow:](self, "_xpcDiagnosticShow:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "LpmS"))
      {
        -[CBDaemonXPCConnection _xpcSetLowPowerMode:](self, "_xpcSetLowPowerMode:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "PwrG"))
      {
        -[CBDaemonXPCConnection _xpcGetPowerState:](self, "_xpcGetPowerState:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "PwrS"))
      {
        -[CBDaemonXPCConnection _xpcSetPowerState:](self, "_xpcSetPowerState:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "RdPf"))
      {
        -[CBDaemonXPCConnection _xpcReadPrefs:](self, "_xpcReadPrefs:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "WrPf"))
      {
        -[CBDaemonXPCConnection _xpcWritePref:](self, "_xpcWritePref:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SnAE"))
      {
        -[CBDaemonXPCConnection _xpcSendAudioAccessoryEventMessage:](self, "_xpcSendAudioAccessoryEventMessage:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SnAC"))
      {
        -[CBDaemonXPCConnection _xpcSendAudioAccessoryConfigMessage:](self, "_xpcSendAudioAccessoryConfigMessage:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SnCD"))
      {
        -[CBDaemonXPCConnection _xpcSendConversationDetectMessage:](self, "_xpcSendConversationDetectMessage:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SnRM"))
      {
        -[CBDaemonXPCConnection _xpcSendRelayMessage:](self, "_xpcSendRelayMessage:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SnSR"))
      {
        -[CBDaemonXPCConnection _xpcSendSmartRoutingInformation:](self, "_xpcSendSmartRoutingInformation:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "RstE"))
      {
        -[CBDaemonXPCConnection _xpcResetCBExtension:](self, "_xpcResetCBExtension:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "UpId"))
      {
        -[CBDaemonXPCConnection _xpcUpdateIdentities:](self, "_xpcUpdateIdentities:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DscA"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryActivate:](self, "_xpcCBDiscoveryActivate:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DscF"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryFinish:](self, "_xpcCBDiscoveryFinish:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DscU"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryUpdate:](self, "_xpcCBDiscoveryUpdate:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DsCD"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryClearDuplicateFilterCache:](self, "_xpcCBDiscoveryClearDuplicateFilterCache:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "DsGD"))
      {
        -[CBDaemonXPCConnection _xpcCBDiscoveryGetDevices:](self, "_xpcCBDiscoveryGetDevices:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SpIn"))
      {
        -[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionActivate:](self, "_xpcCBSpatialInteractionSessionActivate:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SpIU"))
      {
        -[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionUpdate:](self, "_xpcCBSpatialInteractionSessionUpdate:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SpAT"))
      {
        -[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionAddPeerToken:](self, "_xpcCBSpatialInteractionSessionAddPeerToken:", v8);
        goto LABEL_89;
      }
      if (!strcmp(v5, "SpRT"))
      {
        -[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionRemovePeerToken:](self, "_xpcCBSpatialInteractionSessionRemovePeerToken:", v8);
        goto LABEL_89;
      }
      if (dword_100977FD8 <= 90
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection xpcReceivedRequest:]", 90, "### XPC unknown message type: '%s'", v5);
      }
      if (CUXPCDictionaryExpectsReply(v8))
      {
        v6 = CBErrorF(4294960561, "Unknown message type: '%s'");
        goto LABEL_51;
      }
    }
  }
  else
  {
    if (dword_100977FD8 <= 90
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection xpcReceivedRequest:]", 90, "### XPC no message type");
    }
    if (CUXPCDictionaryExpectsReply(v8))
    {
      v6 = CBErrorF(4294960591, "No message type");
LABEL_51:
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v7, v8);

    }
  }
LABEL_89:

}

- (CBDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (void)reportDeviceFound:(id)a3
{
  CBDiscovery *activatedDiscovery;
  CBDiscovery *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSMutableDictionary *deviceMap;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  activatedDiscovery = self->_activatedDiscovery;
  if (activatedDiscovery)
  {
    v5 = activatedDiscovery;
    goto LABEL_4;
  }
  v5 = self->_activatedDiscoveryWHB;
  if (v5)
  {
LABEL_4:
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    if (!v6)
    {
LABEL_22:

      goto LABEL_23;
    }
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v6));
    if (objc_msgSend(v14, "discoveryTypesContainCBDiscovery:", v5))
    {
      if (v7)
      {
        if (v7 != v14)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:");
        if ((-[CBDiscovery discoveryFlags](v5, "discoveryFlags") & 0x100000) == 0
          && !objc_msgSend(v14, "changedTypesContainCBDiscovery:", v5))
        {
          goto LABEL_21;
        }
      }
      else
      {
        deviceMap = self->_deviceMap;
        v10 = v14;
        if (!deviceMap)
        {
          v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v12 = self->_deviceMap;
          self->_deviceMap = v11;

          v10 = v14;
          deviceMap = self->_deviceMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v10, v6);
      }
      v8 = objc_claimAutoreleasedReturnValue(-[CBDiscovery deviceFoundHandler](v5, "deviceFoundHandler"));
    }
    else
    {
      if (!v7)
      {
LABEL_21:

        goto LABEL_22;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v6);
      v8 = objc_claimAutoreleasedReturnValue(-[CBDiscovery deviceLostHandler](v5, "deviceLostHandler"));
    }
    v13 = (void *)v8;
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v14);

    goto LABEL_21;
  }
LABEL_23:

}

- (void)_xpcDeviceFound:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "DvFo");
  objc_msgSend(v4, "encodeWithXPCObject:", v5);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_xpcSendEvent:(id)a3
{
  id v4;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  RPCompanionLinkClient *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _UNKNOWN **v18;

  v4 = a3;
  v5 = self->_xpcCnx;
  v6 = v5;
  if (v5)
  {
    xpc_connection_send_message(v5, v4);
  }
  else
  {
    v7 = self->_remoteClient;
    if (v7)
    {
      v8 = (void *)CUXPCCreateCFObjectFromXPCObject(v4);
      v9 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_remoteClientID, CFSTR("cid"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("rmtD"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_remoteDevice, "identifier"));
        if (v11)
        {
          if (dword_100977FD8 <= 20
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 20)))
          {
            v12 = CUPrintNSObjectOneLine(v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendEvent:]", 20, "Remote event send: %@", v13);

          }
          v17 = RPOptionTimeoutSeconds;
          v18 = &off_100960508;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1000B9028;
          v15[3] = &unk_1009179A0;
          v16 = v10;
          -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](v7, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.bluetooth.event"), v16, v11, v14, v15);

        }
        else if (dword_100977FD8 <= 90
               && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendEvent:]", 90, "### Remote event send no remote device");
        }

      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendEvent:]", 90, "### Send event failed: convert XPC to CF");
      }

    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendEvent:]", 90, "### Send event with no cnx");
    }

  }
}

- (CBSpatialInteractionSession)activatedSpatialInteractionSession
{
  return self->_activatedSpatialInteractionSession;
}

- (CBAdvertiser)activatedAdvertiser
{
  return self->_activatedAdvertiser;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (id)description
{
  return -[CBDaemonXPCConnection descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned __int8 v3;
  uint64_t v5;
  id v6;
  unint64_t xpcToken;
  void *v8;
  id v9;
  CBDevice *remoteDevice;
  CBAdvertiser *v11;
  CBAdvertiser *v12;
  id *v13;
  int v14;
  CBConnection *v15;
  CBConnection *v16;
  id *v17;
  CBController *v18;
  CBController *v19;
  id *v20;
  CBDiscovery *v21;
  CBDiscovery *v22;
  id *v23;
  CBDiscovery *v24;
  CBDiscovery *v25;
  id *v26;
  unsigned int v27;
  CBDaemonXPCConnection *v28;
  CBSpatialInteractionSession *v29;
  id *v30;
  CBSpatialInteractionSession *v31;
  CBDaemonXPCConnection *v32;
  id v33;
  id *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t *v37;
  id v38;
  BOOL v39;
  int v40;
  void **v41;
  void *v42;
  id v43;
  void *v44;
  id *v45;
  id *v46;
  id *v47;
  NSMutableArray *v48;
  id v49;
  uint64_t v50;
  void *i;
  void *v52;
  id *v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;
  NSMutableDictionary *spatialDeviceMapMatched;
  id *v59;
  NSMutableDictionary *spatialDeviceMapUnmatched;
  id *v61;
  NSMutableDictionary *deviceMap;
  id *v63;
  id v64;
  int v66;
  id v67;
  __int128 v68;
  BOOL v69;
  void *v70;
  CBSpatialInteractionSession *v71;
  id v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  id obj;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  _BYTE v108[128];

  v3 = a3;
  v102 = 0;
  v103 = &v102;
  v104 = 0x3032000000;
  v105 = sub_1000624FC;
  v106 = sub_100062338;
  v107 = 0;
  if (self->_xpcCnx)
  {
    obj = 0;
    v5 = CUPrintPID(self->_pid);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    NSAppendPrintF_safe(&obj, "%@", v6);
    objc_storeStrong(&v107, obj);
    goto LABEL_8;
  }
  xpcToken = self->_xpcToken;
  if (xpcToken)
  {
    v100 = 0;
    NSAppendPrintF_safe(&v100, "Proxy %llu", xpcToken);
    v8 = v100;
LABEL_5:
    v9 = v8;
    v6 = v107;
    v107 = v9;
    goto LABEL_8;
  }
  remoteDevice = self->_remoteDevice;
  if (!remoteDevice)
  {
    v98 = 0;
    NSAppendPrintF_safe(&v98, "Direct %@", self->_appID);
    v8 = v98;
    goto LABEL_5;
  }
  v99 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](remoteDevice, "identifier"));
  NSAppendPrintF_safe(&v99, "Remote %@", v6);
  objc_storeStrong(&v107, v99);
LABEL_8:

  v11 = self->_activatedAdvertiser;
  v12 = v11;
  if (v11)
  {
    v13 = (id *)(v103 + 5);
    v97 = (id)v103[5];
    NSAppendPrintF_safe(&v97, ", %@", v11);
    objc_storeStrong(v13, v97);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  v15 = self->_activatedConnection;
  v16 = v15;
  if (v15)
  {
    v17 = (id *)(v103 + 5);
    v96 = (id)v103[5];
    NSAppendPrintF_safe(&v96, ", %@", v15);
    objc_storeStrong(v17, v96);
    ++v14;
  }

  v18 = self->_activatedController;
  v19 = v18;
  if (v18)
  {
    v20 = (id *)(v103 + 5);
    v95 = (id)v103[5];
    NSAppendPrintF_safe(&v95, ", %@", v18);
    objc_storeStrong(v20, v95);
    ++v14;
  }

  v21 = self->_activatedDiscovery;
  v22 = v21;
  if (v21)
  {
    v23 = (id *)(v103 + 5);
    v94 = (id)v103[5];
    NSAppendPrintF_safe(&v94, ", %@", v21);
    objc_storeStrong(v23, v94);
    ++v14;
  }

  v24 = self->_activatedDiscoveryWHB;
  v25 = v24;
  if (v24)
  {
    v26 = (id *)(v103 + 5);
    v93 = (id)v103[5];
    NSAppendPrintF_safe(&v93, ", %@", v24);
    objc_storeStrong(v26, v93);
    v14 = 1;
  }

  v27 = v3;
  v28 = self;
  v29 = self->_activatedSpatialInteractionSession;
  if (v27 > 0x14)
  {
    if (v29)
    {
      v30 = (id *)(v103 + 5);
      v92 = (id)v103[5];
      v31 = v29;
      NSAppendPrintF_safe(&v92, ", %@", v29);
      objc_storeStrong(v30, v92);
      v29 = v31;
    }

    v32 = self;
    v33 = -[NSMutableArray count](self->_spatialPeers, "count");
    if (v33)
    {
      v34 = (id *)(v103 + 5);
      v91 = (id)v103[5];
      NSAppendPrintF_safe(&v91, ", PeerTokens %d", (_DWORD)v33);
      objc_storeStrong(v34, v91);
      v32 = self;
    }
    v35 = (unint64_t)-[NSMutableDictionary count](v32->_spatialDeviceMapMatched, "count");
    v36 = (unint64_t)-[NSMutableDictionary count](v32->_spatialDeviceMapUnmatched, "count");
    if (v35 | v36)
    {
      v37 = v103;
      v90 = (id)v103[5];
      NSAppendPrintF_safe(&v90, ", Matched %d/%d", v35, v36);
      v38 = v90;
      v70 = (void *)v37[5];
      v37[5] = (uint64_t)v38;

    }
    goto LABEL_72;
  }
  v71 = v29;
  v67 = -[NSMutableArray count](self->_spatialPeers, "count");
  *((_QWORD *)&v68 + 1) = -[NSMutableDictionary count](self->_spatialDeviceMapMatched, "count");
  *(_QWORD *)&v68 = -[NSMutableDictionary count](self->_spatialDeviceMapUnmatched, "count");
  if (v71)
    v39 = v14 == 0;
  else
    v39 = 1;
  v40 = !v39;
  v66 = v40;
  if (v39)
  {
    if (!v71)
      goto LABEL_37;
    v41 = (void **)(v103 + 5);
    v88 = (void *)v103[5];
    NSAppendPrintF_safe(&v88, "%@", v71);
    v42 = v88;
  }
  else
  {
    v41 = (void **)(v103 + 5);
    v89 = (void *)v103[5];
    NSAppendPrintF_safe(&v89, "\n        %@", v71);
    v42 = v89;
  }
  v43 = v42;
  v44 = *v41;
  *v41 = v43;

  v28 = self;
LABEL_37:
  v69 = v67 != 0;
  if (v67)
  {
    v45 = (id *)(v103 + 5);
    v87 = (id)v103[5];
    NSAppendPrintF_safe(&v87, ", PeerTokens: %d", (_DWORD)v67);
    objc_storeStrong(v45, v87);
    if (v68 == 0)
    {
LABEL_42:
      v47 = (id *)(v103 + 5);
      v85 = (id)v103[5];
      NSAppendPrintF_safe(&v85, "\n");
      objc_storeStrong(v47, v85);
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v48 = self->_spatialPeers;
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v81, v108, 16);
      if (v49)
      {
        v50 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v49; i = (char *)i + 1)
          {
            if (*(_QWORD *)v82 != v50)
              objc_enumerationMutation(v48);
            v52 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
            v53 = (id *)(v103 + 5);
            v80 = (id)v103[5];
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "tokenData"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "identifierData"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "irkData"));
            NSAppendPrintF_safe(&v80, "        PeerToken <%@>, IDD <%@>, IRK <%@>, PeerID 0x%X\n", v54, v55, v56, objc_msgSend(v52, "peerID"));
            objc_storeStrong(v53, v80);

          }
          v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v81, v108, 16);
        }
        while (v49);

        v28 = self;
        if (!*((_QWORD *)&v68 + 1))
        {
LABEL_57:
          if (!(_QWORD)v68)
            goto LABEL_64;
          if (v69)
            goto LABEL_60;
          goto LABEL_59;
        }
      }
      else
      {

        v28 = self;
        if (!*((_QWORD *)&v68 + 1))
          goto LABEL_56;
      }
LABEL_55:
      spatialDeviceMapMatched = v28->_spatialDeviceMapMatched;
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_1000B7844;
      v78[3] = &unk_100919098;
      v78[4] = &v102;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](spatialDeviceMapMatched, "enumerateKeysAndObjectsUsingBlock:", v78);
LABEL_56:
      v69 = 1;
      goto LABEL_57;
    }
  }
  else if (v68 == 0)
  {
    goto LABEL_63;
  }
  v46 = (id *)(v103 + 5);
  v86 = (id)v103[5];
  NSAppendPrintF_safe(&v86, ", Matched %d/%d", DWORD2(v68), (_DWORD)v68);
  objc_storeStrong(v46, v86);
  v28 = self;
  if (v67)
    goto LABEL_42;
  if (*((_QWORD *)&v68 + 1))
  {
    v57 = (id *)(v103 + 5);
    v79 = (id)v103[5];
    NSAppendPrintF_safe(&v79, "\n");
    objc_storeStrong(v57, v79);
    v28 = self;
    goto LABEL_55;
  }
  if ((_QWORD)v68)
  {
LABEL_59:
    v59 = (id *)(v103 + 5);
    v77 = (id)v103[5];
    NSAppendPrintF_safe(&v77, "\n");
    objc_storeStrong(v59, v77);
    v28 = self;
LABEL_60:
    spatialDeviceMapUnmatched = v28->_spatialDeviceMapUnmatched;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000B7890;
    v76[3] = &unk_100919098;
    v76[4] = &v102;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](spatialDeviceMapUnmatched, "enumerateKeysAndObjectsUsingBlock:", v76);
    v69 = 1;
    goto LABEL_64;
  }
LABEL_63:
  v69 = 0;
LABEL_64:
  if (v66 && -[NSMutableDictionary count](v28->_deviceMap, "count"))
  {
    if (!v69)
    {
      v61 = (id *)(v103 + 5);
      v75 = (id)v103[5];
      NSAppendPrintF_safe(&v75, "\n");
      objc_storeStrong(v61, v75);
      v28 = self;
    }
    deviceMap = v28->_deviceMap;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1000B78DC;
    v74[3] = &unk_100919098;
    v74[4] = &v102;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v74);
  }
  else if (!v69)
  {
    v63 = (id *)(v103 + 5);
    v73 = (id)v103[5];
    NSAppendPrintF_safe(&v73, "\n");
    objc_storeStrong(v63, v73);
  }

LABEL_72:
  v64 = (id)v103[5];
  _Block_object_dispose(&v102, 8);

  return v64;
}

- (void)invalidate
{
  OS_xpc_object *xpcCnx;
  CBAdvertiser *v4;
  uint64_t v5;
  void *v6;
  CBAdvertiser *activatedAdvertiser;
  CBConnection *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CBConnection *activatedConnection;
  CBController *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CBController *activatedController;
  CBDiscovery *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CBDiscovery *activatedDiscovery;
  CBDiscovery *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CBDiscovery *activatedDiscoveryWHB;
  OS_dispatch_source *whbTimer;
  NSObject *v29;
  OS_dispatch_source *v30;
  CBSpatialInteractionSession *v31;
  uint64_t v32;
  void *v33;
  CBSpatialInteractionSession *activatedSpatialInteractionSession;

  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
    xpc_connection_cancel(xpcCnx);
  v4 = self->_activatedAdvertiser;
  if (v4)
  {
    if (dword_100977FD8 < 31
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v5 = CUPrintPID(self->_pid);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection invalidate]", 30, "Invalidate: %@, from %@", v4, v6);

    }
    -[CBAdvertiser invalidate](v4, "invalidate");
    activatedAdvertiser = self->_activatedAdvertiser;
    self->_activatedAdvertiser = 0;

    -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self->_daemon, "scheduleAdvertiserUpdateImmediate:", 0);
  }

  v8 = self->_activatedConnection;
  if (v8)
  {
    if (dword_100977FD8 < 31
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v9 = CUPrintPID(self->_pid);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection invalidate]", 30, "Invalidate: %@, from %@", v8, v10);

    }
    -[CBConnection invalidate](v8, "invalidate");
    if (self->_connectionAddedPairingClient)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      objc_msgSend(v11, "removePairingClient:", v8);

      self->_connectionAddedPairingClient = 0;
    }
    activatedConnection = self->_activatedConnection;
    self->_activatedConnection = 0;

  }
  v13 = self->_activatedController;
  if (v13)
  {
    if (dword_100977FD8 < 31
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v14 = CUPrintPID(self->_pid);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection invalidate]", 30, "Invalidate: %@, from %@", v13, v15);

    }
    if (self->_addedDiscoverableController)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      objc_msgSend(v16, "removeDiscoverableController:", v13);

      self->_addedDiscoverableController = 0;
    }
    -[CBController invalidate](v13, "invalidate");
    activatedController = self->_activatedController;
    self->_activatedController = 0;

    -[CBDaemonServer scheduleControlUpdateImmediate:](self->_daemon, "scheduleControlUpdateImmediate:", 0);
  }

  v18 = self->_activatedDiscovery;
  if (v18)
  {
    if (dword_100977FD8 < 31
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v19 = CUPrintPID(self->_pid);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection invalidate]", 30, "Invalidate: %@, from %@", v18, v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
    objc_msgSend(v21, "reportCBDiscovery:daemonCnx:action:", v18, self, CFSTR("stop"));

    -[CBDiscovery invalidate](v18, "invalidate");
    activatedDiscovery = self->_activatedDiscovery;
    self->_activatedDiscovery = 0;

    -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 0);
  }

  v23 = self->_activatedDiscoveryWHB;
  if (v23)
  {
    if (dword_100977FD8 < 31
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v24 = CUPrintPID(self->_pid);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection invalidate]", 30, "Invalidate: %@, from %@", v23, v25);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
    objc_msgSend(v26, "reportCBDiscovery:daemonCnx:action:", v23, self, CFSTR("stop"));

    -[CBDiscovery invalidate](v23, "invalidate");
    activatedDiscoveryWHB = self->_activatedDiscoveryWHB;
    self->_activatedDiscoveryWHB = 0;

    -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 0);
  }

  if (self->_remoteClient)
  {
    -[CBDaemonXPCConnection _remoteInvalidate](self, "_remoteInvalidate");
    -[CBDaemonServer scheduleUpdateImmediate:](self->_daemon, "scheduleUpdateImmediate:", 0);
  }
  whbTimer = self->_whbTimer;
  if (whbTimer)
  {
    v29 = whbTimer;
    dispatch_source_cancel(v29);
    v30 = self->_whbTimer;
    self->_whbTimer = 0;

  }
  v31 = self->_activatedSpatialInteractionSession;
  if (v31)
  {
    if (dword_100977FD8 < 31
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v32 = CUPrintPID(self->_pid);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection invalidate]", 30, "Invalidate: %@, from %@", v31, v33);

    }
    -[CBSpatialInteractionSession invalidate](v31, "invalidate");
    activatedSpatialInteractionSession = self->_activatedSpatialInteractionSession;
    self->_activatedSpatialInteractionSession = 0;

    -[CBDaemonServer scheduleSpatialUpdateImmediate:](self->_daemon, "scheduleSpatialUpdateImmediate:", 0);
  }

  -[CBDaemonServer xpcConnectionInvalidated:](self->_daemon, "xpcConnectionInvalidated:", self);
}

- (void)aopMessageReceived:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession aopDataHandler](self->_activatedSpatialInteractionSession, "aopDataHandler"));
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

  }
}

+ (unint64_t)indexForCBApprovedAppID:(id)a3
{
  uint64_t v3;
  void *v4;
  unint64_t i;

  v3 = CBGenerateObfuscatedSHA256HashedString(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  for (i = 0; i != 167; ++i)
  {
    if ((objc_msgSend(v4, "isEqualToString:", off_100918B58[i]) & 1) != 0)
      break;
  }

  return i;
}

- (void)_remoteInvalidate
{
  RPCompanionLinkClient *v3;
  id v4;
  BOOL remoteAccepted;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  RPCompanionLinkClient *remoteClient;
  NSNumber *remoteClientID;
  CBDevice *remoteDevice;
  _QWORD v13[5];
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  _UNKNOWN **v17;

  v3 = self->_remoteClient;
  if (!v3)
    goto LABEL_8;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_remoteClientID, CFSTR("cid"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Invl"), CFSTR("mTyp"));
  remoteAccepted = self->_remoteAccepted;
  v6 = -[NSNumber unsignedIntValue](self->_remoteClientID, "unsignedIntValue");
  if (dword_100977FD8 <= 30 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _remoteInvalidate]", 30, "Remote invalidate send: CID 0x%X", v6);
  v7 = objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_remoteDevice, "identifier"));
  if (v7)
  {
    v8 = (void *)v7;
    v16 = RPOptionTimeoutSeconds;
    v17 = &off_100960508;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B80E8;
    v13[3] = &unk_100917B08;
    v14 = v6;
    v15 = remoteAccepted;
    v13[4] = v3;
    -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](v3, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.bluetooth.event"), v4, v8, v9, v13);

LABEL_8:
    -[CBDaemonServer remoteDeregisterConnection:](self->_daemon, "remoteDeregisterConnection:", self);
    self->_remoteAccepted = 0;
    remoteClient = self->_remoteClient;
    self->_remoteClient = 0;

    remoteClientID = self->_remoteClientID;
    self->_remoteClientID = 0;

    remoteDevice = self->_remoteDevice;
    self->_remoteDevice = 0;

    goto LABEL_9;
  }
  if (dword_100977FD8 <= 90 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _remoteInvalidate]", 90, "### Remote event send no remote device");

LABEL_9:
}

- (void)reportDeviceLost:(id)a3
{
  void *v4;
  void *v5;
  CBDiscovery *activatedDiscovery;
  CBDiscovery *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      activatedDiscovery = self->_activatedDiscovery;
      if (activatedDiscovery)
      {
        v7 = activatedDiscovery;
      }
      else
      {
        v7 = self->_activatedDiscoveryWHB;
        if (!v7)
          goto LABEL_9;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v4);
      v8 = objc_claimAutoreleasedReturnValue(-[CBDiscovery deviceLostHandler](v7, "deviceLostHandler"));
      v9 = (void *)v8;
      if (v8)
        (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);

    }
  }
LABEL_9:

}

- (void)reportDevicesBuffered:(id)a3
{
  id v4;
  CBDiscovery *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = self->_activatedDiscovery;
  if (v5)
  {
    v6 = objc_alloc_init((Class)NSMutableArray);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);
          v13 = objc_autoreleasePoolPush();
          if (objc_msgSend(v12, "discoveryTypesContainCBDiscovery:", v5, (_QWORD)v16))
            objc_msgSend(v6, "addObject:", v12);
          objc_autoreleasePoolPop(v13);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
    {
      v14 = objc_claimAutoreleasedReturnValue(-[CBDiscovery devicesBufferedHandler](v5, "devicesBufferedHandler"));
      v15 = (void *)v14;
      if (v14)
        (*(void (**)(uint64_t, id))(v14 + 16))(v14, v6);

    }
  }

}

- (void)_xpcReceivedMessage:(id)a3 remoteDevice:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  RPCompanionLinkClient *v10;
  RPCompanionLinkClient *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  RPCompanionLinkClient *v35;
  CBDaemonXPCConnection *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _UNKNOWN **v43;

  v6 = a3;
  v7 = a4;
  v40 = 0;
  v8 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v40);
  v9 = v40;
  if ((v8 & 1) == 0)
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v6);
    goto LABEL_41;
  }
  if (!self->_remoteAccepted)
  {
    v10 = self->_remoteClient;
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      v11 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
      objc_storeStrong((id *)&self->_remoteClient, v11);
      -[RPCompanionLinkClient setDispatchQueue:](v11, "setDispatchQueue:", self->_dispatchQueue);
      -[RPCompanionLinkClient setServiceType:](v11, "setServiceType:", CFSTR("com.apple.bluetooth.remote"));
      v39 = v9;
      v41 = 0;
      if (CUXPCDecodeUInt64RangedEx(v6, "cid", 0, 0xFFFFFFFFLL, &v41, &v39) == 6)
        v12 = v41;
      else
        v12 = 0;
      v13 = v39;

      if (v13)
      {
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v13, v6);
        v9 = v13;
        goto LABEL_40;
      }
      if (!(_DWORD)v12)
      {
        v26 = CBErrorF(4294960585, "No client ID");
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v27, v6);

        v9 = 0;
        goto LABEL_40;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12));
      objc_storeStrong((id *)&self->_remoteClientID, v14);
      v38 = 0;
      v15 = objc_msgSend(objc_alloc((Class)CBDevice), "initWithXPCObject:error:", v7, &v38);
      v9 = v38;
      if (!v15)
      {
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v6);
        goto LABEL_39;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      if (!v16)
      {
        v28 = CBErrorF(4294960584, "Remote device without ID");
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v29, v6);

        goto LABEL_37;
      }
      objc_storeStrong((id *)&self->_remoteDevice, v15);
      -[CBDaemonServer remoteRegisterConnection:clientID:](self->_daemon, "remoteRegisterConnection:clientID:", self, v14);
      v17 = objc_alloc_init((Class)RPCompanionLinkDevice);
      objc_msgSend(v17, "setIdentifier:", v16);
      -[RPCompanionLinkClient setDestinationDevice:](v11, "setDestinationDevice:", v17);
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]", 30, "Remote client start: peer %@", v16);
      }
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000B8A90;
      v34[3] = &unk_1009190C0;
      v11 = v11;
      v35 = v11;
      v36 = self;
      v37 = v16;
      -[RPCompanionLinkClient activateWithCompletion:](v11, "activateWithCompletion:", v34);

    }
    v14 = (void *)CUXPCCreateCFObjectFromXPCObject(v6);
    v19 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v19) & 1) == 0)
    {
      v25 = CBErrorF(4294960540, "Remote message non-dict");
      v15 = (id)objc_claimAutoreleasedReturnValue(v25);
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v15, v6);
      goto LABEL_38;
    }
    v15 = objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("rmtD"));
    v42 = RPOptionTimeoutSeconds;
    v43 = &off_100960508;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
    if (CUXPCDictionaryExpectsReply(v6))
    {
      if (dword_100977FD8 <= 20
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 20)))
      {
        v20 = CUPrintNSObjectOneLine(v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]", 20, "Remote request send: request %@", v21);

      }
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000B8BA8;
      v32[3] = &unk_100919110;
      v32[4] = self;
      v33 = v6;
      -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](v11, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.bluetooth.request"), v15, v16, v32);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_remoteDevice, "identifier"));
      if (v22)
      {
        if (dword_100977FD8 <= 20
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 20)))
        {
          v23 = CUPrintNSObjectOneLine(v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]", 20, "Remote event send: %@", v24);

        }
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000B8DA4;
        v30[3] = &unk_1009179A0;
        v31 = v15;
        -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](v11, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.bluetooth.event"), v31, v22, v16, v30);

      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]", 90, "### Remote event send no remote device");
      }

    }
LABEL_37:

LABEL_38:
LABEL_39:

    goto LABEL_40;
  }
  if (dword_100977FD8 <= 90 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcReceivedMessage:remoteDevice:]", 90, "### Remote cycle: %@", self->_remoteDevice);
  if (CUXPCDictionaryExpectsReply(v6))
  {
    v18 = CBErrorF(4294960561, "Remote cycle");
    v11 = (RPCompanionLinkClient *)objc_claimAutoreleasedReturnValue(v18);
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v11, v6);
LABEL_40:

  }
LABEL_41:

}

- (void)xpcReceivedEvent:(id)a3
{
  const char *v4;
  const char *v5;
  CBConnection *v6;
  const char *string;
  OS_xpc_object *v8;
  OS_xpc_object *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  xpc_object_t xdict;

  xdict = a3;
  if (!self->_remoteDevice || (v4 = xpc_dictionary_get_string(xdict, "mTyp")) == 0)
  {
LABEL_5:
    v6 = self->_activatedConnection;
    if (v6 && (string = xpc_dictionary_get_string(xdict, "mTyp")) != 0 && !strcmp(string, "CnxF"))
    {
      -[CBConnection xpcReceivedForwardedEvent:](v6, "xpcReceivedForwardedEvent:", xdict);
    }
    else
    {
      v8 = self->_xpcCnx;
      v9 = v8;
      if (v8)
      {
        xpc_connection_send_message(v8, xdict);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection xpcReceivedEvent:]", 90, "### XPC received event with no handler");
      }

    }
    goto LABEL_21;
  }
  v5 = v4;
  if (strcmp(v4, "Invl"))
  {
    if (!strcmp(v5, "DscU"))
    {
      -[CBDaemonXPCConnection _xpcCBDiscoveryUpdate:](self, "_xpcCBDiscoveryUpdate:", xdict);
      goto LABEL_21;
    }
    goto LABEL_5;
  }
  if (dword_100977FD8 <= 20 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 20)))
  {
    v10 = CUPrintPID(self->_pid);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_remoteDevice, "identifier"));
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection xpcReceivedEvent:]", 20, "XPC connection ended: %@, remote %@", v11, v12);

  }
  -[CBDaemonXPCConnection invalidate](self, "invalidate");
LABEL_21:

}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v6;
  uint64_t Reply;
  void *v8;
  OS_xpc_object *xpcCnx;
  uint64_t ResponseHandler;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  Reply = CUXPCDictionaryCreateReply();
  v8 = (void *)objc_claimAutoreleasedReturnValue(Reply);
  if (v8)
  {
    CUXPCEncodeNSError(v14, v8, "errO", "errC", "errD", "errM", "errO");
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      xpc_connection_send_message(xpcCnx, v8);
    }
    else
    {
      ResponseHandler = CUXPCObjectGetResponseHandler(v6);
      v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(ResponseHandler);
      if (v11)
      {
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          v12 = CUPrintNSError(v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendReplyError:request:]", 30, "Remote reply error: %@", v13);

        }
        ((void (**)(_QWORD, _QWORD, _QWORD, id))v11)[2](v11, 0, 0, v14);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendReplyError:request:]", 90, "### Send error with no cnx");
      }

    }
  }
  else if (dword_100977FD8 <= 90
         && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
  {
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendReplyError:request:]", 90, "### Send error create reply failed");
  }

}

- (BOOL)_entitledCBAdvertiserAndReturnError:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _OWORD v19[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safetyAlertsSignature"));
  if (v7)
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safetyAlertsAlertData"));

    if (!v8)
    {
LABEL_7:
      v11 = 1;
      goto LABEL_15;
    }
  }
  memset(v19, 0, sizeof(v19));
  xpc_connection_get_audit_token(self->_xpcCnx, v19);
  v9 = (void *)xpc_copy_entitlement_for_token(0, v19);
  v10 = v9;
  if (v9 && xpc_dictionary_get_BOOL(v9, "com.apple.bluetooth.safetyalerts"))
  {

    goto LABEL_7;
  }
  self->_entitled = 0;
  v12 = CBErrorF(4294896128, "Missing entitlement for Safety Alerts");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (dword_100977FD8 <= 90 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
  {
    v14 = CUPrintPID(self->_pid);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = CUPrintNSError(v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _entitledCBAdvertiserAndReturnError:error:]", 90, "### CBAdvertiser denied: %@, %@", v15, v17);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v13);

  v11 = 0;
LABEL_15:

  return v11;
}

- (void)_xpcCBAdvertiserActivate:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t Reply;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  const char *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  const char *v29;
  const char *v30;
  id v31;
  int64_t v32;
  id v33;
  _QWORD v34[6];
  _QWORD v35[6];
  id v36;
  id v37;
  id v38[2];

  v4 = a3;
  v38[0] = 0;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", v38);
  v6 = v38[0];
  if ((v5 & 1) != 0)
  {
    v37 = v6;
    v7 = objc_msgSend(objc_alloc((Class)CBAdvertiser), "initWithXPCObject:error:", v4, &v37);
    v8 = v37;

    if (v7)
    {
      v36 = v8;
      v9 = -[CBDaemonXPCConnection _entitledCBAdvertiserAndReturnError:error:](self, "_entitledCBAdvertiserAndReturnError:error:", v7, &v36);
      v6 = v36;

      if ((v9 & 1) != 0)
      {
        objc_storeStrong((id *)&self->_activatedAdvertiser, v7);
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          v10 = CUPrintPID(self->_pid);
          v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBAdvertiserActivate:]", 30, "Activate: %@, from %@", v7, v11);

        }
        -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self->_daemon, "scheduleAdvertiserUpdateImmediate:", 1);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000B9848;
        v35[3] = &unk_100917058;
        v35[4] = v7;
        v35[5] = self;
        objc_msgSend(v7, "setBluetoothStateChangedHandler:", v35);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000B988C;
        v34[3] = &unk_100917058;
        v34[4] = v7;
        v34[5] = self;
        objc_msgSend(v7, "setAdvertisingAddressChangedHandler:", v34);
        Reply = CUXPCDictionaryCreateReply(v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue(Reply);
        if (v15)
        {
          v33 = v4;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connectableAddressData"));

          objc_msgSend(v7, "setAdvertisingAddressDataConnectable:", v17);
          if (v17)
          {
            v18 = objc_retainAutorelease(v17);
            v19 = v15;
            v20 = v18;
            v21 = (const char *)objc_msgSend(v20, "bytes");
            if (v21)
              v22 = v21;
            else
              v22 = "";
            v23 = objc_msgSend(v20, "length");

            xpc_dictionary_set_data(v19, "aaCN", v22, (size_t)v23);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "nonConnectableAddressData"));

          objc_msgSend(v7, "setAdvertisingAddressDataNonConnectable:", v25);
          if (v25)
          {
            v26 = objc_retainAutorelease(v25);
            v27 = v15;
            v28 = v26;
            v29 = (const char *)objc_msgSend(v28, "bytes");
            if (v29)
              v30 = v29;
            else
              v30 = "";
            v31 = objc_msgSend(v28, "length");

            xpc_dictionary_set_data(v27, "aaNC", v30, (size_t)v31);
          }
          v32 = -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient");
          if (v32)
            xpc_dictionary_set_int64(v15, "pwrS", v32);
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v15);

          v4 = v33;
        }
        else if (dword_100977FD8 <= 90
               && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBAdvertiserActivate:]", 90, "### CBAdvertiser activate create reply failed");
        }

      }
      else
      {
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
      }
    }
    else
    {
      if (dword_100977FD8 <= 90
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        v12 = CUPrintNSError(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBAdvertiserActivate:]", 90, "### CBAdvertiser activate decode failed: %@", v13);

      }
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v8, v4);
      v6 = v8;
    }

  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
  }

}

- (void)_xpcCBAdvertiserUpdate:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id v8;
  id *v9;
  id v10;
  id *v11;
  unsigned int v12;
  CBAdvertiser *v13;
  CBAdvertiser *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id obj;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1000624FC;
  v33 = sub_100062338;
  v34 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000B9D34;
  v26[3] = &unk_100917C98;
  v28 = &v29;
  v26[4] = self;
  v4 = a3;
  v27 = v4;
  v5 = objc_retainBlock(v26);
  v6 = (id *)(v30 + 5);
  obj = (id)v30[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc((Class)CBAdvertiser);
    v9 = (id *)(v30 + 5);
    v24 = (id)v30[5];
    v10 = objc_msgSend(v8, "initWithXPCObject:error:", v4, &v24);
    objc_storeStrong(v9, v24);
    if (v10)
    {
      v11 = (id *)(v30 + 5);
      v23 = (id)v30[5];
      v12 = -[CBDaemonXPCConnection _entitledCBAdvertiserAndReturnError:error:](self, "_entitledCBAdvertiserAndReturnError:error:", v10, &v23);
      objc_storeStrong(v11, v23);
      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      v13 = self->_activatedAdvertiser;
      v14 = v13;
      if (v13)
      {
        v15 = -[CBAdvertiser updateWithCBAdvertiser:](v13, "updateWithCBAdvertiser:", v10);
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          v16 = CUPrintPID(self->_pid);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBAdvertiserUpdate:]", 30, "CBAdvertiser Update: %@, from %@", v14, v17);

        }
        if (!v15)
          goto LABEL_12;
        -[CBDaemonServer scheduleAdvertiserUpdateImmediate:](self->_daemon, "scheduleAdvertiserUpdateImmediate:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
        objc_msgSend(v18, "reportxpcCBAdvertiserUpdate:", v10);
      }
      else
      {
        v21 = CBErrorF(4294960551, "No advertiser");
        v22 = objc_claimAutoreleasedReturnValue(v21);
        v18 = (void *)v30[5];
        v30[5] = v22;
      }

    }
    else
    {
      v19 = CBErrorF(4294960591, "Decode failed");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v14 = (CBAdvertiser *)v30[5];
      v30[5] = v20;
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v29, 8);
}

- (void)_xpcCBConnectionActivate:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  unsigned __int8 v14;
  NSString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  CBDaemonServer *daemon;
  void *v23;
  id *v24;
  unsigned __int8 v25;
  uint64_t Reply;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD v35[6];
  id v36;
  id v37;
  _QWORD v38[6];
  id v39;
  _QWORD v40[6];
  id obj;
  _QWORD v42[6];
  _QWORD v43[6];
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v49 = 0;
  v50 = (id *)&v49;
  v51 = 0x3032000000;
  v52 = sub_1000624FC;
  v53 = sub_100062338;
  v54 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000BA2E8;
  v46[3] = &unk_100917C98;
  v48 = &v49;
  v46[4] = self;
  v4 = a3;
  v47 = v4;
  v5 = objc_retainBlock(v46);
  v6 = v50;
  v45 = v50[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v45);
  objc_storeStrong(v6 + 5, v45);
  if ((v7 & 1) != 0)
  {
    if (self->_activatedConnection)
    {
      v30 = CBErrorF(4294960575, "Already activated");
      v31 = objc_claimAutoreleasedReturnValue(v30);
      v10 = v50[5];
      v50[5] = (id)v31;
      goto LABEL_25;
    }
    v8 = objc_alloc((Class)CBConnection);
    v9 = v50;
    v44 = v50[5];
    v10 = objc_msgSend(v8, "initWithXPCObject:error:", v4, &v44);
    objc_storeStrong(v9 + 5, v44);
    if (!v10)
    {
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v10, "setDispatchQueue:", self->_dispatchQueue);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerDevice"));
    if (!v11)
    {
      v32 = CBErrorF(4294960591, "No device");
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v34 = v50[5];
      v50[5] = (id)v33;

      goto LABEL_24;
    }
    if ((objc_msgSend(v10, "internalFlags") & 0x100) != 0)
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000BA3B0;
      v43[3] = &unk_100919138;
      v43[4] = v10;
      v43[5] = self;
      objc_msgSend(v10, "setPairingCompletedHandler:", v43);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000BA3D0;
      v42[3] = &unk_100919160;
      v42[4] = v10;
      v42[5] = self;
      objc_msgSend(v10, "setPairingPromptHandler:", v42);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      v13 = v50;
      obj = v50[5];
      v14 = objc_msgSend(v12, "addPairingClient:error:", v10, &obj);
      objc_storeStrong(v13 + 5, obj);

      if ((v14 & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      self->_connectionAddedPairingClient = 1;
    }
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000BA3EC;
    v40[3] = &unk_100917A40;
    v40[4] = v10;
    v40[5] = self;
    objc_msgSend(v10, "setXpcSendEventHandler:", v40);
    objc_storeStrong((id *)&self->_activatedConnection, v10);
    v15 = self->_appID;
    if (dword_100977FD8 <= 30
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v16 = CUPrintPID(self->_pid);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBConnectionActivate:]", 30, "Activate: %@, from %@ (%@)", v10, v17, v15);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientBundleID"));
    v19 = objc_msgSend(v18, "length");

    if (!v19)
      objc_msgSend(v10, "setClientBundleID:", v15);
    v20 = objc_msgSend(v10, "serviceFlags");
    if ((_DWORD)v20)
    {
      v21 = objc_msgSend(v10, "connectionFlags");
      daemon = self->_daemon;
      if ((v21 & 2) == 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](daemon, "stackController"));
        v24 = v50;
        v37 = v50[5];
        v25 = objc_msgSend(v23, "connectDevice:connectionFlags:serviceFlags:error:", v11, v21, v20, &v37);
        objc_storeStrong(v24 + 5, v37);

        if ((v25 & 1) != 0)
        {
          Reply = CUXPCDictionaryCreateReply(v4);
          v27 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v27);

        }
        goto LABEL_23;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](daemon, "stackController"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000BA408;
      v38[3] = &unk_1009190C0;
      v38[4] = v10;
      v38[5] = self;
      v39 = v4;
      objc_msgSend(v29, "connectWithCBConnection:completionHandler:", v10, v38);

      v28 = v39;
    }
    else
    {
      if (self->_remoteClient)
        objc_msgSend(v10, "setInternalFlags:", objc_msgSend(v10, "internalFlags") | 0x20);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000BA544;
      v35[3] = &unk_1009190C0;
      v35[4] = v10;
      v35[5] = self;
      v36 = v4;
      objc_msgSend(v10, "activateWithCompletion:", v35);
      v28 = v36;
    }

LABEL_23:
    goto LABEL_24;
  }
LABEL_26:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v49, 8);
}

- (void)_xpcCBConnectionDisconnect:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  unsigned __int8 v17;
  uint64_t Reply;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id obj;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1000624FC;
  v33 = sub_100062338;
  v34 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000BA9A8;
  v26[3] = &unk_100917C98;
  v28 = &v29;
  v26[4] = self;
  v4 = a3;
  v27 = v4;
  v5 = objc_retainBlock(v26);
  v6 = (id *)(v30 + 5);
  obj = (id)v30[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc((Class)CBConnection);
    v9 = (id *)(v30 + 5);
    v24 = (id)v30[5];
    v10 = objc_msgSend(v8, "initWithXPCObject:error:", v4, &v24);
    objc_storeStrong(v9, v24);
    if (!v10)
    {
LABEL_14:

      goto LABEL_15;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerDevice"));
    if (v11)
    {
      v12 = objc_msgSend(v10, "serviceFlags");
      if ((_DWORD)v12)
      {
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          v13 = CUPrintFlags32(v12, &unk_100738770);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBConnectionDisconnect:]", 30, "CBConnection disconnect: %@, %@", v11, v14);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        v16 = (id *)(v30 + 5);
        v23 = (id)v30[5];
        v17 = objc_msgSend(v15, "disconnectDevice:serviceFlags:error:", v11, v12, &v23);
        objc_storeStrong(v16, v23);

        if ((v17 & 1) == 0)
          goto LABEL_13;
        Reply = CUXPCDictionaryCreateReply(v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue(Reply);
        if (v19)
        {
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v19);
        }
        else if (dword_100977FD8 <= 90
               && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBConnectionDisconnect:]", 90, "### CBConnection disconnect create reply failed");
        }
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      v22 = CBErrorF(4294960591, "No service flags");
      v21 = objc_claimAutoreleasedReturnValue(v22);
    }
    else
    {
      v20 = CBErrorF(4294960591, "No device");
      v21 = objc_claimAutoreleasedReturnValue(v20);
    }
    v19 = (void *)v30[5];
    v30[5] = v21;
    goto LABEL_12;
  }
LABEL_15:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v29, 8);
}

- (void)_xpcCBConnection:(id)a3 pairingCompletedWithDevice:(id)a4 error:(id)a5
{
  id v7;
  xpc_object_t v8;
  id v9;

  v9 = a5;
  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "mTyp", "PrCm");
  CUXPCEncodeObject(v8, "devi", v7, 0);

  if (v9)
    CUXPCEncodeNSError(v9, v8, "errO", "errC", "errD", "errM", "errO");
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v8);

}

- (void)_xpcCBConnection:(id)a3 pairingPromptWithPairingInfo:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "mTyp", "PrPm");
  CUXPCEncodeObject(v6, "prIn", v5, 0);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v6);
}

- (void)_xpcCBConnectionPairingContinue:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  CBConnection *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  id *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t Reply;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id obj;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1000624FC;
  v34 = sub_100062338;
  v35 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000BAEF0;
  v27[3] = &unk_100917C98;
  v29 = &v30;
  v27[4] = self;
  v4 = a3;
  v28 = v4;
  v5 = objc_retainBlock(v27);
  v6 = (id *)(v31 + 5);
  obj = (id)v31[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    v8 = self->_activatedConnection;
    if (v8)
    {
      v25 = 0;
      v9 = objc_opt_class(CBPairingInfo);
      v10 = (id *)(v31 + 5);
      v24 = (id)v31[5];
      CUXPCDecodeObject(v4, "prIn", v9, &v25, &v24);
      objc_storeStrong(v10, v24);
      if (!v31[5])
      {
        if (v25)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
          v12 = (id *)(v31 + 5);
          v23 = (id)v31[5];
          objc_msgSend(v11, "pairingContinueWithPairingInfo:error:", v25, &v23);
          objc_storeStrong(v12, v23);

          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            v13 = v25;
            v14 = CUPrintNSError(v31[5]);
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBConnectionPairingContinue:]", 30, "CBConnection pairing continue: %@, %@, %@", v8, v13, v15);

          }
          Reply = CUXPCDictionaryCreateReply(v4);
          v17 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v17)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v17);
          }
          else if (dword_100977FD8 <= 90
                 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBConnectionPairingContinue:]", 90, "### CBController PairingContinue create reply failed");
          }
        }
        else
        {
          v21 = CBErrorF(4294960591, "No pairingInfo");
          v22 = objc_claimAutoreleasedReturnValue(v21);
          v17 = (void *)v31[5];
          v31[5] = v22;
        }

      }
    }
    else
    {
      v18 = CBErrorF(4294960551, "No connection");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)v31[5];
      v31[5] = v19;

    }
  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v30, 8);
}

- (void)_xpcCBControllerActivate:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t Reply;
  void *v14;
  void *v15;
  signed int v16;
  void *v17;
  signed int v18;
  int64_t v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[6];
  id v26;
  id v27;

  v4 = a3;
  v27 = 0;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v27);
  v6 = v27;
  if ((v5 & 1) != 0)
  {
    v26 = v6;
    v7 = objc_msgSend(objc_alloc((Class)CBController), "initWithXPCObject:error:", v4, &v26);
    v8 = v26;

    if (v7)
    {
      objc_msgSend(v7, "setAppID:", self->_appID);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000BB3A8;
      v25[3] = &unk_100917058;
      v25[4] = v7;
      v25[5] = self;
      objc_msgSend(v7, "setBluetoothStateChangedHandler:", v25);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000BB3EC;
      v24[3] = &unk_100917058;
      v24[4] = v7;
      v24[5] = self;
      objc_msgSend(v7, "setDiscoverableStateChangedHandler:", v24);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000BB450;
      v23[3] = &unk_100917058;
      v23[4] = v7;
      v23[5] = self;
      objc_msgSend(v7, "setInquiryStateChangedHandler:", v23);
      if ((objc_msgSend(v7, "internalFlags") & 0x40) != 0)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000BB4B4;
        v22[3] = &unk_100917A90;
        v22[4] = v7;
        v22[5] = self;
        objc_msgSend(v7, "setRelayMessageHandler:", v22);
      }
      if ((objc_msgSend(v7, "internalFlags") & 0x200) != 0)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000BB4DC;
        v21[3] = &unk_1009171C0;
        v21[4] = v7;
        v21[5] = self;
        objc_msgSend(v7, "setTipiChangedHandler:", v21);
      }
      objc_storeStrong((id *)&self->_activatedController, v7);
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        v9 = CUPrintPID(self->_pid);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBControllerActivate:]", 30, "Activate: %@, from %@", v7, v10);

      }
      -[CBDaemonServer scheduleControlUpdateImmediate:](self->_daemon, "scheduleControlUpdateImmediate:", 0);
      Reply = CUXPCDictionaryCreateReply(v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        v16 = objc_msgSend(v15, "discoverableState");
        if (v16)
          xpc_dictionary_set_int64(v14, "dsSt", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        v18 = objc_msgSend(v17, "inquiryState");
        if (v18)
          xpc_dictionary_set_int64(v14, "inqS", v18);

        v19 = -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient");
        if (v19)
          xpc_dictionary_set_int64(v14, "pwrS", v19);
        if ((objc_msgSend(v7, "internalFlags") & 0x2000) != 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer getAudioAccessoryDeviceArray](self->_daemon, "getAudioAccessoryDeviceArray"));
          if (v20)
            xpc_dictionary_set_value(v14, "aaDD", v20);

        }
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v14);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBControllerActivate:]", 90, "### CBController activate create reply failed");
      }

    }
    else
    {
      if (dword_100977FD8 <= 90
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        v11 = CUPrintNSError(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBControllerActivate:]", 90, "### CBController activate decode failed: %@", v12);

      }
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v8, v4);
    }

  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    v8 = v6;
  }

}

- (void)_xpcGetControllerInfo:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  uint64_t Reply;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  xpc_object_t v13;
  id v14;

  v14 = 0;
  v4 = a3;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v14);
  v6 = v14;
  if ((v5 & 1) != 0)
  {
    Reply = CUXPCDictionaryCreateReply(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(Reply);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "controllerInfo"));

      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        v11 = CUDescriptionWithLevel(v10, 134217778);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcGetControllerInfo:]", 30, "GetControllerInfo: %@", v12);

      }
      v13 = xpc_dictionary_create(0, 0, 0);
      objc_msgSend(v10, "encodeWithXPCObject:", v13);
      xpc_dictionary_set_value(v8, "ctrI", v13);
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v8);

    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcGetControllerInfo:]", 90, "### GetControllerInfo create reply failed");
    }
  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    v8 = v4;
  }

}

- (void)_xpcGetControllerSettings:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  uint64_t Reply;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  signed __int8 v16;
  CBDaemonXPCConnection *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  void *v28;
  xpc_object_t v29;
  void *v30;
  id v31;
  id v32;

  v32 = 0;
  v4 = a3;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v32);
  v6 = v32;
  if ((v5 & 1) != 0)
  {
    Reply = CUXPCDictionaryCreateReply(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(Reply);

    if (v8)
    {
      v31 = v6;
      v9 = objc_alloc_init((Class)CBControllerSettings);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      objc_msgSend(v9, "setDiscoverableState:", objc_msgSend(v10, "discoverableState"));

      v11 = (void *)CFPreferencesCopyValue(CFSTR("move3PPLEMSToLegacyMode"), CFSTR("com.apple.bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      v12 = objc_opt_class(NSNumber);
      v13 = 1;
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        if (objc_msgSend(v11, "BOOLValue"))
          v13 = 1;
        else
          v13 = 2;
      }
      objc_msgSend(v9, "setHid3ppLELegacyMode:", v13);
      v14 = (void *)CFPreferencesCopyValue(CFSTR("btvcDefaultAdvRSSI"), CFSTR("com.apple.bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      v15 = objc_opt_class(NSNumber);
      v30 = v11;
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        v16 = objc_msgSend(v14, "intValue");
      else
        v16 = -60;
      v17 = self;
      objc_msgSend(v9, "setBleAdvRSSI:", v16);
      v18 = (void *)CFPreferencesCopyValue(CFSTR("BluetoothAutoSeekKeyboard"), CFSTR("com.apple.Bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      v19 = objc_opt_class(NSNumber);
      v20 = 1;
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      {
        if (objc_msgSend(v18, "BOOLValue"))
          v20 = 1;
        else
          v20 = 2;
      }
      objc_msgSend(v9, "setSetupAssistantIfNoKeyboard:", v20);
      v21 = (void *)CFPreferencesCopyValue(CFSTR("BluetoothAutoSeekPointingDevice"), CFSTR("com.apple.Bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      v22 = objc_opt_class(NSNumber);
      v23 = 1;
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
      {
        if (objc_msgSend(v21, "BOOLValue"))
          v23 = 1;
        else
          v23 = 2;
      }
      objc_msgSend(v9, "setSetupAssistantIfNoPointingDevice:", v23);
      v24 = (void *)CFPreferencesCopyValue(CFSTR("SpatialSoundProfileAllowed"), CFSTR("com.apple.bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
      v25 = objc_opt_class(NSNumber);
      v26 = 1;
      if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      {
        if (objc_msgSend(v24, "BOOLValue"))
          v26 = 1;
        else
          v26 = 2;
      }
      objc_msgSend(v9, "setSpatialSoundProfileAllowed:", v26);
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        v27 = CUDescriptionWithLevel(v9, 134217778);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcGetControllerSettings:]", 30, "GetControllerSettings: %@", v28, v30);

      }
      v29 = xpc_dictionary_create(0, 0, 0);
      objc_msgSend(v9, "encodeWithXPCObject:", v29);
      xpc_dictionary_set_value(v8, "ctrS", v29);
      -[CBDaemonXPCConnection _xpcSendReply:](v17, "_xpcSendReply:", v8);

      v6 = v31;
    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcGetControllerSettings:]", 90, "### GetControllerSettings create reply failed");
    }
  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    v8 = v4;
  }

}

- (void)_xpcModifyControllerSettings:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  uint64_t v8;
  id *v9;
  id v10;
  int v11;
  unsigned int v12;
  CBController *v13;
  CBController *v14;
  void *v15;
  id *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  CFBooleanRef v21;
  const char *v22;
  char i;
  signed __int8 v24;
  CFNumberRef v25;
  unsigned int v26;
  unsigned int v27;
  CFBooleanRef v28;
  const char *v29;
  unsigned int v30;
  unsigned int v31;
  CFBooleanRef v32;
  const char *v33;
  unsigned int v34;
  unsigned int v35;
  CFBooleanRef v36;
  const char *v37;
  uint64_t Reply;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 valuePtr;
  id v42;
  id v43;
  id v44;
  id obj;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v49 = 0;
  v50 = (id *)&v49;
  v51 = 0x3032000000;
  v52 = sub_1000624FC;
  v53 = sub_100062338;
  v54 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000BC22C;
  v46[3] = &unk_100917C98;
  v48 = &v49;
  v46[4] = self;
  v4 = a3;
  v47 = v4;
  v5 = objc_retainBlock(v46);
  v6 = v50;
  obj = v50[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    v44 = 0;
    v8 = objc_opt_class(CBControllerSettings);
    v9 = v50;
    v43 = v50[5];
    CUXPCDecodeObject(v4, "ctrS", v8, &v44, &v43);
    objc_storeStrong(v9 + 5, v43);
    if (!v50[5])
    {
      v10 = v44;
      if (!v44)
      {
        v39 = CBErrorF(4294960591, "No settings");
        v40 = objc_claimAutoreleasedReturnValue(v39);
        v14 = (CBController *)v50[5];
        v50[5] = (id)v40;
        goto LABEL_80;
      }
      if (dword_100977FD8 <= 30)
      {
        if (dword_100977FD8 != -1 || (v11 = _LogCategory_Initialize(&dword_100977FD8, 30), v10 = v44, v11))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]", 30, "ModifyControllerSettings: %@", v10);
          v10 = v44;
        }
      }
      v12 = objc_msgSend(v10, "discoverableState");
      if (!v12)
        goto LABEL_17;
      v13 = self->_activatedController;
      v14 = v13;
      if (v12 != 2)
      {
        if (!v13)
        {
LABEL_17:
          v19 = objc_msgSend(v44, "hid3ppLELegacyMode");
          v20 = v19;
          if (v19 == 1)
            v21 = kCFBooleanTrue;
          else
            v21 = kCFBooleanFalse;
          if (v19)
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              if (v20 > 2)
                v22 = "?";
              else
                v22 = off_100919320[v20];
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]", 30, "hid3ppLELegacyMode: %s", v22);
            }
            CFPreferencesSetValue(CFSTR("move3PPLEMSToLegacyMode"), v21, CFSTR("com.apple.bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
            notify_post("com.apple.bluetooth.prefsChanged");
          }
          valuePtr = objc_msgSend(v44, "bleAdvRSSI");
          for (i = 1; ; i = 0)
          {
            if ((i & 1) == 0 || (v24 = valuePtr) == 0)
            {
              v26 = objc_msgSend(v44, "setupAssistantIfNoKeyboard");
              v27 = v26;
              if (v26 == 1)
                v28 = kCFBooleanTrue;
              else
                v28 = kCFBooleanFalse;
              if (v26)
              {
                if (dword_100977FD8 <= 30
                  && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
                {
                  if (v27 > 2)
                    v29 = "?";
                  else
                    v29 = off_100919320[v27];
                  LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]", 30, "SetupAssistantIfNoKeyboard: %s", v29);
                }
                CFPreferencesSetValue(CFSTR("BluetoothAutoSeekKeyboard"), v28, CFSTR("com.apple.Bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
              }
              v30 = objc_msgSend(v44, "setupAssistantIfNoPointingDevice");
              v31 = v30;
              if (v30 == 1)
                v32 = kCFBooleanTrue;
              else
                v32 = kCFBooleanFalse;
              if (v30)
              {
                if (dword_100977FD8 <= 30
                  && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
                {
                  if (v31 > 2)
                    v33 = "?";
                  else
                    v33 = off_100919320[v31];
                  LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]", 30, "SetupAssistantIfNoPointingDevice: %s", v33);
                }
                CFPreferencesSetValue(CFSTR("BluetoothAutoSeekPointingDevice"), v32, CFSTR("com.apple.Bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
              }
              v34 = objc_msgSend(v44, "spatialSoundProfileAllowed");
              v35 = v34;
              if (v34 == 1)
                v36 = kCFBooleanTrue;
              else
                v36 = kCFBooleanFalse;
              if (v34)
              {
                if (dword_100977FD8 <= 30
                  && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
                {
                  if (v35 > 2)
                    v37 = "?";
                  else
                    v37 = off_100919320[v35];
                  LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]", 30, "spatialSoundProfileAllowed: %s", v37);
                }
                CFPreferencesSetValue(CFSTR("SpatialSoundProfileAllowed"), v36, CFSTR("com.apple.bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
                notify_post("com.apple.bluetooth.prefsChanged");
              }
              Reply = CUXPCDictionaryCreateReply(v4);
              v14 = (CBController *)objc_claimAutoreleasedReturnValue(Reply);
              if (v14)
              {
                -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v14);
              }
              else if (dword_100977FD8 <= 90
                     && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
              {
                LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]", 90, "### ModifyControllerSettings create reply failed");
              }
              goto LABEL_80;
            }
            if (dword_100977FD8 <= 50)
            {
              if (dword_100977FD8 != -1)
                goto LABEL_35;
              if (_LogCategory_Initialize(&dword_100977FD8, 50))
                break;
            }
LABEL_37:
            v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &valuePtr);
            CFPreferencesSetValue(CFSTR("btvcDefaultAdvRSSI"), v25, CFSTR("com.apple.bluetooth"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
            notify_post("com.apple.bluetooth.prefsChanged");
          }
          v24 = valuePtr;
LABEL_35:
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyControllerSettings:]", 50, "bleAdvRSSI: %d", v24);
          goto LABEL_37;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        objc_msgSend(v18, "removeDiscoverableController:", v14);

LABEL_16:
        goto LABEL_17;
      }
      if (!v13)
      {
        v14 = (CBController *)objc_alloc_init((Class)CBController);
        -[CBController setAppID:](v14, "setAppID:", self->_appID);
        objc_storeStrong((id *)&self->_activatedController, v14);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      v16 = v50;
      v42 = v50[5];
      v17 = objc_msgSend(v15, "addDiscoverableController:error:", v14, &v42);
      objc_storeStrong(v16 + 5, v42);

      if ((v17 & 1) != 0)
      {
        self->_addedDiscoverableController = 1;
        goto LABEL_16;
      }
LABEL_80:

    }
  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v49, 8);
}

- (void)_xpcGetDevices:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t Reply;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id obj;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000624FC;
  v28 = sub_100062338;
  v29 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000BC5F0;
  v21[3] = &unk_100917C98;
  v23 = &v24;
  v21[4] = self;
  v4 = a3;
  v22 = v4;
  v5 = objc_retainBlock(v21);
  v6 = (id *)(v25 + 5);
  obj = (id)v25[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  v8 = (id *)(v25 + 5);
  if ((v7 & 1) != 0)
  {
    v19 = (id)v25[5];
    v30 = 0;
    if (CUXPCDecodeUInt64RangedEx(v4, "gDvF", 0, 0xFFFFFFFFLL, &v30, &v19) == 6)
      v9 = v30;
    else
      v9 = 0;
    objc_storeStrong(v8, v19);
    if (!v25[5])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      v11 = (id *)(v25 + 5);
      v18 = (id)v25[5];
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getDevicesWithFlags:error:", v9, &v18));
      objc_storeStrong(v11, v18);

      if (v12)
      {
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          v13 = CUPrintFlags32(v9, &unk_1007388D0);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcGetDevices:]", 30, "GetDevices: flags %@, total %d", v14, objc_msgSend(v12, "count"));

        }
        Reply = CUXPCDictionaryCreateReply(v4);
        v16 = objc_claimAutoreleasedReturnValue(Reply);
        v17 = (void *)v16;
        if (v16)
        {
          CUXPCEncodeNSArrayOfObjects(v16, "devA", v12);
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v17);
        }
        else if (dword_100977FD8 <= 90
               && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcGetDevices:]", 90, "### GetDevices create reply failed");
        }

      }
    }
  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v25[5], v4);
  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v24, 8);
}

- (void)_xpcDeleteDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  xpc_object_t dictionary;
  void *v9;
  id v10;
  id *v11;
  id v12;
  void *v13;
  id *v14;
  unsigned __int8 v15;
  uint64_t Reply;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id obj;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1000624FC;
  v30 = sub_100062338;
  v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000BC99C;
  v23[3] = &unk_100917C98;
  v25 = &v26;
  v23[4] = self;
  v4 = a3;
  v24 = v4;
  v5 = objc_retainBlock(v23);
  v6 = (id *)(v27 + 5);
  obj = (id)v27[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    dictionary = xpc_dictionary_get_dictionary(v4, "devi");
    v9 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    if (v9)
    {
      v10 = objc_alloc((Class)CBDevice);
      v11 = (id *)(v27 + 5);
      v21 = (id)v27[5];
      v12 = objc_msgSend(v10, "initWithXPCObject:error:", v9, &v21);
      objc_storeStrong(v11, v21);
      if (v12)
      {
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDeleteDevice:]", 30, "DeleteDevice: %@", v12);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        v14 = (id *)(v27 + 5);
        v20 = (id)v27[5];
        v15 = objc_msgSend(v13, "deleteDevice:error:", v12, &v20);
        objc_storeStrong(v14, v20);

        if ((v15 & 1) != 0)
        {
          Reply = CUXPCDictionaryCreateReply(v4);
          v17 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v17)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v17);
          }
          else if (dword_100977FD8 <= 90
                 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDeleteDevice:]", 90, "### DeleteDevice create reply failed");
          }

        }
      }
    }
    else
    {
      v18 = CBErrorF(4294960591, "No device");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v12 = (id)v27[5];
      v27[5] = v19;
    }

  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v26, 8);
}

- (void)_xpcModifyDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  xpc_object_t dictionary;
  void *v9;
  id v10;
  id *v11;
  id v12;
  id *v13;
  char v14;
  uint64_t v15;
  id *v16;
  char v17;
  id *v18;
  int v19;
  unsigned __int8 v20;
  id *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  char v26;
  id *v27;
  char v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  const char *v33;
  id v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id *v40;
  unsigned __int8 v41;
  void *v42;
  id *v43;
  unsigned __int8 v44;
  void *v45;
  id *v46;
  unsigned int v47;
  uint64_t Reply;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  CBDaemonXPCConnection *v57;
  id v58;
  id v59;
  double v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id obj;
  _QWORD v70[5];
  id v71;
  uint64_t *v72;
  uint64_t v73;
  id *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  id v79[2];

  v73 = 0;
  v74 = (id *)&v73;
  v75 = 0x3032000000;
  v76 = sub_1000624FC;
  v77 = sub_100062338;
  v78 = 0;
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1000BD1B4;
  v70[3] = &unk_100917C98;
  v72 = &v73;
  v70[4] = self;
  v4 = a3;
  v71 = v4;
  v5 = objc_retainBlock(v70);
  v6 = v74;
  obj = v74[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    dictionary = xpc_dictionary_get_dictionary(v4, "devi");
    v9 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    if (!v9)
    {
      v50 = CBErrorF(4294960591, "No device");
      v51 = objc_claimAutoreleasedReturnValue(v50);
      v12 = v74[5];
      v74[5] = (id)v51;
      goto LABEL_51;
    }
    v10 = objc_alloc((Class)CBDevice);
    v11 = v74;
    v68 = v74[5];
    v12 = objc_msgSend(v10, "initWithXPCObject:error:", v9, &v68);
    objc_storeStrong(v11 + 5, v68);
    if (!v12)
    {
LABEL_51:

      goto LABEL_52;
    }
    v13 = v74;
    v66 = v74[5];
    v67 = 0;
    v14 = CUXPCDecodeNSArrayOfNSString(v4, "dvIA", &v67, &v66);
    objc_storeStrong(v13 + 5, v66);
    if ((v14 & 1) == 0)
    {
LABEL_50:

      goto LABEL_51;
    }
    v65 = 0;
    v15 = objc_opt_class(CBDevice);
    v16 = v74;
    v64 = v74[5];
    v17 = CUXPCDecodeObject(v4, "prSD", v15, &v65, &v64);
    objc_storeStrong(v16 + 5, v64);
    if ((v17 & 1) == 0)
      goto LABEL_49;
    v18 = v74 + 5;
    v63 = v74[5];
    v79[0] = 0;
    v19 = CUXPCDecodeSInt64RangedEx(v4, "prSS", -128, 127, v79, &v63);
    v20 = v19 == 6 ? LOBYTE(v79[0]) : 0;
    objc_storeStrong(v18, v63);
    if (v19 == 5
      || ((v21 = v74 + 5,
           v62 = v74[5],
           v79[0] = 0,
           v22 = CUXPCDecodeUInt64RangedEx(v4, "dvRF", 0, 0xFFFFFFFFLL, v79, &v62),
           v22 != 6)
        ? (v23 = 0)
        : (v23 = LODWORD(v79[0])),
          objc_storeStrong(v21, v62),
          v22 == 5))
    {
LABEL_49:

      goto LABEL_50;
    }
    v79[0] = 0;
    v24 = objc_opt_class(CBDeviceSettings);
    v25 = v74;
    v61 = v74[5];
    v26 = CUXPCDecodeObject(v4, "dvSt", v24, v79, &v61);
    objc_storeStrong(v25 + 5, v61);
    if ((v26 & 1) == 0
      || (v27 = v74,
          v59 = v74[5],
          v60 = 0.0,
          v28 = CUXPCDecodeDouble(v4, "timO", &v60, &v59),
          objc_storeStrong(v27 + 5, v59),
          (v28 & 1) == 0))
    {
LABEL_48:

      goto LABEL_49;
    }
    v29 = v67;
    if (v67)
    {
      if (dword_100977FD8 <= 30)
      {
        if (dword_100977FD8 == -1)
        {
          if (!_LogCategory_Initialize(&dword_100977FD8, 30))
            goto LABEL_30;
          v29 = v67;
        }
        v30 = CUPrintNSObjectOneLine(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyDevice:]", 30, "ModifyDevice CnxPri start: %@, %@", v12, v31);

      }
LABEL_30:
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      v36 = v60;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_1000BD27C;
      v55[3] = &unk_100919188;
      v55[4] = v12;
      v56 = v67;
      v57 = self;
      v58 = v4;
      objc_msgSend(v35, "modifyDevice:connectionPriorityDevices:timeoutSeconds:completionHandler:", v12, v56, v55, v36);

      goto LABEL_48;
    }
    v32 = v65;
    if (v65)
    {
      if (dword_100977FD8 > 30)
        goto LABEL_38;
      if (dword_100977FD8 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100977FD8, 30))
          goto LABEL_38;
        v32 = v65;
      }
      if (v20 > 3u)
        v33 = "?";
      else
        v33 = off_100919300[(char)v20];
      v37 = CUPrintFlags32(v23, &unk_100738850);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyDevice:]", 30, "ModifyDevice: %@, PeerSourceDevice %@, PeerSourceState %s RequestFlags %@", v12, v32, v33, v38);

LABEL_38:
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      v40 = v74;
      v54 = v74[5];
      v41 = objc_msgSend(v39, "modifyDevice:peerSourceDevice:peerSourceState:requestFlags:error:", v12, v65, (char)v20, v23, &v54);
      objc_storeStrong(v40 + 5, v54);

      if ((v41 & 1) == 0)
        goto LABEL_48;
LABEL_45:
      Reply = CUXPCDictionaryCreateReply(v4);
      v49 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v49)
      {
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v49);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyDevice:]", 90, "### ModifyDevice create reply failed");
      }

      goto LABEL_48;
    }
    v34 = v79[0];
    if (!v79[0])
    {
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyDevice:]", 30, "ModifyDevice: %@ (in-place)", v12);
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      v46 = v74;
      v52 = v74[5];
      v47 = objc_msgSend(v45, "modifyDevice:error:", v12, &v52);
      objc_storeStrong(v46 + 5, v52);

      if (!v47)
        goto LABEL_48;
      goto LABEL_45;
    }
    if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 != -1)
      {
LABEL_28:
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcModifyDevice:]", 30, "ModifyDevice: %@, %@", v12, v34);
        goto LABEL_41;
      }
      if (_LogCategory_Initialize(&dword_100977FD8, 30))
      {
        v34 = v79[0];
        goto LABEL_28;
      }
    }
LABEL_41:
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
    v43 = v74;
    v53 = v74[5];
    v44 = objc_msgSend(v42, "modifyDevice:settings:error:", v12, v79[0], &v53);
    objc_storeStrong(v43 + 5, v53);

    if ((v44 & 1) == 0)
      goto LABEL_48;
    goto LABEL_45;
  }
LABEL_52:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v73, 8);
}

- (void)_xpcPerformDeviceRequest:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  uint64_t v8;
  id *v9;
  char v10;
  uint64_t v11;
  id *v12;
  char v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  CBDaemonXPCConnection *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id obj;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3032000000;
  v32 = sub_1000624FC;
  v33 = sub_100062338;
  v34 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000BD6A8;
  v26[3] = &unk_100917C98;
  v28 = &v29;
  v26[4] = self;
  v4 = a3;
  v27 = v4;
  v5 = objc_retainBlock(v26);
  v6 = v30;
  obj = v30[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    v24 = 0;
    v8 = objc_opt_class(CBDevice);
    v9 = v30;
    v23 = v30[5];
    v10 = CUXPCDecodeObject(v4, "devi", v8, &v24, &v23);
    objc_storeStrong(v9 + 5, v23);
    if ((v10 & 1) != 0)
    {
      v22 = 0;
      v11 = objc_opt_class(CBDeviceRequest);
      v12 = v30;
      v21 = v30[5];
      v13 = CUXPCDecodeObject(v4, "dvRq", v11, &v22, &v21);
      objc_storeStrong(v12 + 5, v21);
      if ((v13 & 1) != 0)
      {
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcPerformDeviceRequest:]", 30, "PerformDeviceRequest start: %@, %@", v24, v22);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        v15 = v22;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000BD770;
        v16[3] = &unk_1009191B0;
        v17 = v24;
        v18 = v22;
        v19 = self;
        v20 = v4;
        objc_msgSend(v14, "performDeviceRequest:device:completionHandler:", v15, v17, v16);

      }
    }

  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v29, 8);
}

- (void)_xpcDiagnosticControl:(id)a3
{
  id v4;
  id *v5;
  unsigned __int8 v6;
  xpc_object_t value;
  const char *string;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t Reply;
  void *v36;
  void *v37;
  __CFString *v38;
  id v39;
  const char *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v48;
  CFTypeID v49;
  uint64_t v50;
  id v51;
  CFTypeID v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *j;
  id v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  void *v82;
  void *v83;
  unsigned int v84;
  const char *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  _QWORD *v136;
  xpc_object_t xdict;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  id v174;
  id v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  id v180;
  id v181;
  id v182;
  id v183;
  void *v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  void *v189;
  id v190;
  id v191;
  void *v192;
  id v193;
  id v194;
  void *v195;
  id v196;
  id v197;
  id obj;
  _QWORD v199[5];
  id v200;
  uint64_t *v201;
  uint64_t v202;
  id *v203;
  uint64_t v204;
  uint64_t (*v205)(uint64_t, uint64_t);
  void (*v206)(uint64_t);
  id v207;
  _BYTE v208[128];
  _BYTE v209[128];

  v202 = 0;
  v203 = (id *)&v202;
  v204 = 0x3032000000;
  v205 = sub_1000624FC;
  v206 = sub_100062338;
  v207 = 0;
  v199[0] = _NSConcreteStackBlock;
  v199[1] = 3221225472;
  v199[2] = sub_1000BF2CC;
  v199[3] = &unk_100917C98;
  v201 = &v202;
  v199[4] = self;
  v4 = a3;
  v200 = v4;
  v136 = objc_retainBlock(v199);
  v5 = v203;
  obj = v203[5];
  v6 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v5 + 5, obj);
  if ((v6 & 1) == 0)
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v203[5], v4);
    goto LABEL_76;
  }
  value = xpc_dictionary_get_value(v4, "parm");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  if (xdict)
  {
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = xpc_dictionary_get_string(xdict, "iStr");
      v9 = string;
      if (!string)
      {
        v73 = CBErrorF(4294960591, "No input string");
        v74 = objc_claimAutoreleasedReturnValue(v73);
        v75 = v203[5];
        v203[5] = (id)v74;

        goto LABEL_138;
      }
      if (stricmp_prefix(string, "accessory-"))
      {
        if (!stricmp_prefix(v9, "advertise"))
        {
          -[CBDaemonXPCConnection _xpcDiagnosticAdvertiser](self, "_xpcDiagnosticAdvertiser");
          v195 = 0;
          NSAppendPrintF_safe(&v195, "");
          v18 = v195;
          goto LABEL_33;
        }
        if (!strcasecmp(v9, "aop-read-debug"))
        {
          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s", v9);
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "diagnosticControl:", xdict));

          v194 = 0;
          NSAppendPrintF_safe(&v194, "%@\n", v24);
          v19 = (__CFString *)v194;

          goto LABEL_67;
        }
        if (!strcasecmp(v9, "aop-write-debug"))
        {
          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s", v9);
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "diagnosticControl:", xdict));

          v193 = 0;
          NSAppendPrintF_safe(&v193, "%@\n", v26);
          v19 = (__CFString *)v193;

          goto LABEL_67;
        }
        if (!stricmp_prefix(v9, "assert"))
        {
          -[CBDaemonXPCConnection _xpcDiagnosticAssertion](self, "_xpcDiagnosticAssertion");
          v192 = 0;
          NSAppendPrintF_safe(&v192, "");
          v18 = v192;
          goto LABEL_33;
        }
        if (!stricmp_prefix(v9, "coredump"))
        {
          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s", v9);
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "diagnosticControl:", xdict));

          v191 = 0;
          NSAppendPrintF_safe(&v191, "%@", v28);
          v19 = (__CFString *)v191;

          goto LABEL_67;
        }
        if (!stricmp_prefix(v9, "crash"))
        {
          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s", v9);
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "diagnosticControl:", xdict));

          v190 = 0;
          NSAppendPrintF_safe(&v190, "%@", v34);
          v19 = (__CFString *)v190;

          goto LABEL_67;
        }
        if (!stricmp_prefix(v9, "discover"))
        {
          -[CBDaemonXPCConnection _xpcDiagnosticDiscovery](self, "_xpcDiagnosticDiscovery");
          v189 = 0;
          NSAppendPrintF_safe(&v189, "");
          v18 = v189;
          goto LABEL_33;
        }
        if (!stricmp_prefix(v9, "evaluate"))
        {
          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: evaluate");
          }
          v187 = 0u;
          v188 = 0u;
          v185 = 0u;
          v186 = 0u;
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer xpcConnections](self->_daemon, "xpcConnections"));
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v185, v209, 16);
          if (v42)
          {
            v43 = *(_QWORD *)v186;
            do
            {
              for (i = 0; i != v42; i = (char *)i + 1)
              {
                if (*(_QWORD *)v186 != v43)
                  objc_enumerationMutation(v41);
                objc_msgSend(*(id *)(*((_QWORD *)&v185 + 1) + 8 * (_QWORD)i), "_spatialInteractionReevaluateDevices");
              }
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v185, v209, 16);
            }
            while (v42);
          }

          v184 = 0;
          NSAppendPrintF_safe(&v184, "");
          v18 = v184;
          goto LABEL_33;
        }
        if (stricmp_prefix(v9, "extension"))
        {
          if (!stricmp_prefix(v9, "fakeAccessoryCrash"))
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s", v9);
            }
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "diagnosticControl:", xdict));

            v181 = 0;
            NSAppendPrintF_safe(&v181, "%@", v69);
            v19 = (__CFString *)v181;

            goto LABEL_67;
          }
          if (!stricmp_prefix(v9, "gapa"))
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s", v9);
            }
            v76 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "diagnosticControl:", xdict));

            v180 = 0;
            NSAppendPrintF_safe(&v180, "%@", v77);
            v19 = (__CFString *)v180;

            goto LABEL_67;
          }
          if (!strcasecmp(v9, "LoD-connected"))
          {
            v45 = (void *)CUXPCCreateCFObjectFromXPCObject(xdict);
            if (!v45)
            {
              v122 = CBErrorF(4294960591, "Convert params failed");
              v123 = objc_claimAutoreleasedReturnValue(v122);
              v124 = v203[5];
              v203[5] = (id)v123;

              goto LABEL_138;
            }
            TypeID = CFStringGetTypeID();
            TypedValue = CFDictionaryGetTypedValue(v45, CFSTR("deviceID"), TypeID, 0);
            v48 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
            if (!v48)
            {
              v125 = CBErrorF(4294960591, "No device UUID");
              v126 = objc_claimAutoreleasedReturnValue(v125);
              v127 = v203[5];
              v203[5] = (id)v126;

              goto LABEL_138;
            }
            v135 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v48);
            if (!v135)
            {
              v128 = CBErrorF(4294960591, "Bad device UUID");
              v129 = objc_claimAutoreleasedReturnValue(v128);
              v130 = v203[5];
              v203[5] = (id)v129;

              goto LABEL_138;
            }
            v131 = v48;
            v49 = CFStringGetTypeID();
            v50 = CFDictionaryGetTypedValue(v45, CFSTR("name"), v49, 0);
            v133 = (void *)objc_claimAutoreleasedReturnValue(v50);
            v134 = v45;
            v51 = objc_alloc_init((Class)NSMutableArray);
            v52 = CFStringGetTypeID();
            v53 = CFDictionaryGetTypedValue(v45, CFSTR("serviceUUIDs"), v52, 0);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            v178 = 0u;
            v179 = 0u;
            v176 = 0u;
            v177 = 0u;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "componentsSeparatedByString:", CFSTR(",")));
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v176, v208, 16);
            v132 = v54;
            if (v56)
            {
              v57 = *(_QWORD *)v177;
              do
              {
                for (j = 0; j != v56; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v177 != v57)
                    objc_enumerationMutation(v55);
                  v59 = objc_msgSend(objc_alloc((Class)CBUUID), "initWithString:safe:", *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * (_QWORD)j), 1);
                  if (v59)
                    objc_msgSend(v51, "addObject:", v59);

                }
                v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v176, v208, 16);
              }
              while (v56);
            }

            v60 = v135;
            v61 = v132;
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "UUIDString"));
              v63 = CUPrintNSObjectOneLine(v51);
              v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s: device %@, serviceUUIDs %@", v9, v62, v64, v131);

              v60 = v135;
              v61 = v132;
            }
            -[CBDaemonServer notifyConnectedDeviceUUID:name:servicesUUIDs:](self->_daemon, "notifyConnectedDeviceUUID:name:servicesUUIDs:", v60, v133, v51);
            v175 = 0;
            NSAppendPrintF_safe(&v175, "");
            v19 = (__CFString *)v175;

            goto LABEL_67;
          }
          if (!strcasecmp(v9, "mp-error"))
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s", v9);
            }
            v82 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "diagnosticControl:", xdict));

            v174 = 0;
            NSAppendPrintF_safe(&v174, "%@\n", v83);
            v19 = (__CFString *)v174;

            goto LABEL_67;
          }
          if (!strcasecmp(v9, "mp-keys-reset"))
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s", v9);
            }
            v86 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "diagnosticControl:", xdict));

            v173 = 0;
            NSAppendPrintF_safe(&v173, "%@\n", v87);
            v19 = (__CFString *)v173;

            goto LABEL_67;
          }
          if (stricmp_prefix(v9, "tipiChanged"))
          {
            if (stricmp_prefix(v9, "whbEvent"))
            {
              if (stricmp_prefix(v9, "wifiCritical"))
              {
                if (stricmp_prefix(v9, "writeStackshot"))
                {
                  if (*v9 && strcasecmp(v9, "help"))
                  {
                    v10 = CBErrorF(4294960591, "Unsupported diag command: '%s'", v9);
                    v11 = objc_claimAutoreleasedReturnValue(v10);
                    v12 = v203[5];
                    v203[5] = (id)v11;

LABEL_138:
                    v19 = 0;
                    goto LABEL_75;
                  }
                  if (dword_100977FD8 <= 30
                    && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
                  {
                    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: help");
                  }
                  v167 = 0;
                  NSAppendPrintF_safe(&v167, "%s", "Commands:\n");
                  v89 = v167;
                  v166 = v89;
                  NSAppendPrintF_safe(&v166, "%s", "    accessory-fake        Publish/unpublish fake accessory.\n");
                  v90 = v166;

                  v165 = v90;
                  NSAppendPrintF_safe(&v165, "%s", "    advertise             Start/stop test advertister.\n");
                  v91 = v165;

                  v164 = v91;
                  NSAppendPrintF_safe(&v164, "%s", "    aop-read-debug \t   Send Read commands to AOP for debug testing\n");
                  v92 = v164;

                  v163 = v92;
                  NSAppendPrintF_safe(&v163, "%s", "    aop-write-debug\t   Send Write commands to AOP for debug testing\n");
                  v93 = v163;

                  v162 = v93;
                  NSAppendPrintF_safe(&v162, "%s", "    assert                Start/stop test assertion.\n");
                  v94 = v162;

                  v161 = v94;
                  NSAppendPrintF_safe(&v161, "%s", "    coredump              Trigger a Bluetooth stack core dump.\n");
                  v95 = v161;

                  v160 = v95;
                  NSAppendPrintF_safe(&v160, "%s", "    crash                 Force a crash.\n");
                  v96 = v160;

                  v159 = v96;
                  NSAppendPrintF_safe(&v159, "%s", "    crash-FE              Call FatalError.\n");
                  v97 = v159;

                  v158 = v97;
                  NSAppendPrintF_safe(&v158, "%s", "    crash-RC              Call RestartWithContext.\n");
                  v98 = v158;

                  v157 = v98;
                  NSAppendPrintF_safe(&v157, "%s", "    crash-sim             Simulate a crash.\n");
                  v99 = v157;

                  v156 = v99;
                  NSAppendPrintF_safe(&v156, "%s", "    discover              Start/stop test discovery.\n");
                  v100 = v156;

                  v155 = v100;
                  NSAppendPrintF_safe(&v155, "%s", "    evaluate              Re-evaluate spatial devices.\n");
                  v101 = v155;

                  v154 = v101;
                  NSAppendPrintF_safe(&v154, "%s", "    extension-found <ID>  Simulate finding a device.\n");
                  v102 = v154;

                  v153 = v102;
                  NSAppendPrintF_safe(&v153, "%s", "    extension-launch <ID> Start extension by ID.\n");
                  v103 = v153;

                  v152 = v103;
                  NSAppendPrintF_safe(&v152, "%s", "    extension-reset <ID>  Reset extension UI state.\n");
                  v104 = v152;

                  v151 = v104;
                  NSAppendPrintF_safe(&v151, "%s", "    extension-update      Update the list of Bluetooth extensions.\n");
                  v105 = v151;

                  v150 = v105;
                  NSAppendPrintF_safe(&v150, "%s", "    fakeAccessoryCrash    Fake an accessory crashing.\n");
                  v106 = v150;

                  v149 = v106;
                  NSAppendPrintF_safe(&v149, "%s", "    forcejustwork         Enables/disables forcejustwork.\n");
                  v107 = v149;

                  v148 = v107;
                  NSAppendPrintF_safe(&v148, "%s", "    gapa                  Set GAPA flags: deviceID <UUID/MAC> flags <flags> mask <mask>\n");
                  v108 = v148;

                  v147 = v108;
                  NSAppendPrintF_safe(&v147, "%s", "    hciUnlimited          Enables/disables unlimited file size HCI tracing.\n");
                  v109 = v147;

                  v146 = v109;
                  NSAppendPrintF_safe(&v146, "%s", "    help                  Show this help menu.\n");
                  v110 = v146;

                  v145 = v110;
                  NSAppendPrintF_safe(&v145, "%s", "    LoD-connected         Launch-on-demand connection: deviceID <UUID> serviceUUIDs UUID1,UUID2,etc.\n");
                  v111 = v145;

                  v144 = v111;
                  NSAppendPrintF_safe(&v144, "%s", "    logRawAudio           Enables/disables HCI audio tracing.\n");
                  v112 = v144;

                  v143 = v112;
                  NSAppendPrintF_safe(&v143, "%s", "    mp-error <ID> <error> Simulate Magic Pairing error 1 or 7. deviceID <UUID> status <Int>\n");
                  v113 = v143;

                  v142 = v113;
                  NSAppendPrintF_safe(&v142, "%s", "    mp-keys-reset <ID>    Magic Pairing keys reset to initial keys from current account keys. deviceID <UUID> \n");
                  v114 = v142;

                  v141 = v114;
                  NSAppendPrintF_safe(&v141, "%s", "    timeline              Enables/disables timeline logging.\n");
                  v115 = v141;

                  v140 = v115;
                  NSAppendPrintF_safe(&v140, "%s", "    tipiChanged           Simulate Tipi change.\n");
                  v116 = v140;

                  v139 = v116;
                  NSAppendPrintF_safe(&v139, "%s", "    wifiCritical          Override WiFi critical on/off.\n");
                  v117 = v139;

                  v138 = v117;
                  NSAppendPrintF_safe(&v138, "%s", "    writeStackshot        Trigger bluetoothd stackshot manually.\n");
                  v19 = (__CFString *)v138;

                }
                else
                {
                  if (dword_100977FD8 <= 30
                    && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
                  {
                    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: writeStackshot");
                  }
                  v169 = 0;
                  NSAppendPrintF_safe(&v169, "");
                  v118 = v169;
                  v119 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
                  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "diagnosticControl:", xdict));

                  v168 = v118;
                  NSAppendPrintF_safe(&v168, "%@", v120);
                  v19 = (__CFString *)v168;

                }
              }
              else
              {
                -[CBDaemonServer setWifiCriticalOverride:](self->_daemon, "setWifiCriticalOverride:", -[CBDaemonServer wifiCriticalOverride](self->_daemon, "wifiCriticalOverride") == 0);
                if (dword_100977FD8 <= 30
                  && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
                {
                  v84 = -[CBDaemonServer wifiCriticalOverride](self->_daemon, "wifiCriticalOverride");
                  if (v84 > 2)
                    v85 = "?";
                  else
                    v85 = off_100919320[v84];
                  LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: wifiCritical: %s", v85);
                }
                v170 = 0;
                NSAppendPrintF_safe(&v170, "");
                v19 = (__CFString *)v170;
                -[CBDaemonServer scheduleUpdateImmediate:](self->_daemon, "scheduleUpdateImmediate:", 0);
              }
LABEL_67:
              Reply = CUXPCDictionaryCreateReply(v4);
              v36 = (void *)objc_claimAutoreleasedReturnValue(Reply);
              v37 = v36;
              if (v36)
              {
                if (v19)
                  v38 = v19;
                else
                  v38 = CFSTR("None\n");
                v39 = v36;
                v40 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v38), "UTF8String");
                if (v40)
                  xpc_dictionary_set_string(v39, "oStr", v40);

                -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v39);
              }
              else if (dword_100977FD8 <= 90
                     && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
              {
                LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 90, "### DiagnosticControl create reply failed");
              }

              goto LABEL_75;
            }
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: WHBEvent");
            }
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer whbDiscoveryDaemon](self->_daemon, "whbDiscoveryDaemon"));
            objc_msgSend(v88, "diagnosticControl:", &off_100960FD8);

            v171 = 0;
            NSAppendPrintF_safe(&v171, "");
            v18 = v171;
          }
          else
          {
            -[CBDaemonXPCConnection _xpcDiagnosticTipiChanged](self, "_xpcDiagnosticTipiChanged");
            v172 = 0;
            NSAppendPrintF_safe(&v172, "");
            v18 = v172;
          }
LABEL_33:
          v19 = v18;
          goto LABEL_67;
        }
        v13 = (void *)CUXPCCreateCFObjectFromXPCObject(xdict);
        if (v13)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer extensionsDaemon](self->_daemon, "extensionsDaemon"));
          v30 = v29 == 0;

          if (!v30)
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              v31 = CUPrintNSObjectOneLine(v13);
              v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: Extension: %s, %@", v9, v32);

            }
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer extensionsDaemon](self->_daemon, "extensionsDaemon"));
            v66 = v203 + 5;
            v183 = v203[5];
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "diagnosticControl:error:", v13, &v183));
            objc_storeStrong(v66, v183);

            if (!v67)
            {

              goto LABEL_138;
            }
            v182 = 0;
            NSAppendPrintF_safe(&v182, "%@", v67);
            v19 = (__CFString *)v182;

            goto LABEL_67;
          }
          v121 = CBErrorF(4294960561, "Extensions disabled");
          v79 = objc_claimAutoreleasedReturnValue(v121);
          goto LABEL_136;
        }
      }
      else
      {
        v13 = (void *)CUXPCCreateCFObjectFromXPCObject(xdict);
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer accessoryDaemon](self->_daemon, "accessoryDaemon"));
          v15 = v14 == 0;

          if (!v15)
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              v16 = CUPrintNSObjectOneLine(v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticControl:]", 30, "Diags: %s, %@", v9, v17);

            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer accessoryDaemon](self->_daemon, "accessoryDaemon"));
            v21 = v203 + 5;
            v197 = v203[5];
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "diagnosticControl:error:", v13, &v197));
            objc_storeStrong(v21, v197);

            if (!v22)
            {

              goto LABEL_138;
            }
            v196 = 0;
            NSAppendPrintF_safe(&v196, "%@", v22);
            v19 = (__CFString *)v196;

            goto LABEL_67;
          }
          v80 = CBErrorF(4294960561, "AccessoryDaemon disabled");
          v79 = objc_claimAutoreleasedReturnValue(v80);
LABEL_136:
          v81 = v203[5];
          v203[5] = (id)v79;

          goto LABEL_138;
        }
      }
      v78 = CBErrorF(4294960591, "Convert params failed");
      v79 = objc_claimAutoreleasedReturnValue(v78);
      goto LABEL_136;
    }
    v72 = CBErrorF(4294960591, "Non-dict input params");
    v71 = objc_claimAutoreleasedReturnValue(v72);
  }
  else
  {
    v70 = CBErrorF(4294960591, "No input params");
    v71 = objc_claimAutoreleasedReturnValue(v70);
  }
  v19 = (__CFString *)v203[5];
  v203[5] = (id)v71;
LABEL_75:

LABEL_76:
  ((void (*)(_QWORD *))v136[2])(v136);

  _Block_object_dispose(&v202, 8);
}

- (void)_xpcDiagnosticAdvertiser
{
  uint64_t v3;
  void *v4;
  int v5;
  CBAdvertiserDaemon *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[6];
  _QWORD v15[5];
  void *v16;

  v3 = objc_claimAutoreleasedReturnValue(-[CBDaemonServer testAdvertiser](self->_daemon, "testAdvertiser"));
  if (v3)
  {
    v4 = (void *)v3;
    v12 = (id)v3;
    if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 != -1 || (v5 = _LogCategory_Initialize(&dword_100977FD8, 30), v4 = v12, v5))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticAdvertiser]", 30, "Diags: advertiser stop", v12);
        v4 = v12;
      }
    }
    objc_msgSend(v4, "invalidate", v12);
    -[CBDaemonServer setTestAdvertiser:](self->_daemon, "setTestAdvertiser:", 0);

  }
  else
  {
    if (dword_100977FD8 <= 30
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticAdvertiser]", 30, "Diags: advertiser start");
    }
    v6 = objc_alloc_init(CBAdvertiserDaemon);
    -[CBDaemonServer setTestAdvertiser:](self->_daemon, "setTestAdvertiser:", v6);
    -[CBAdvertiserDaemon setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
    -[CBAdvertiserDaemon setSpatialInteractionFlags:](v6, "setSpatialInteractionFlags:", 9);
    v7 = NSRandomData(4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v16 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    -[CBAdvertiserDaemon setSpatialInteractionIdentifiers:](v6, "setSpatialInteractionIdentifiers:", v9);

    v10 = NSRandomData(5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[CBAdvertiserDaemon setSpatialInteractionUWBConfigData:](v6, "setSpatialInteractionUWBConfigData:", v11);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BF600;
    v15[3] = &unk_100917080;
    v15[4] = v6;
    -[CBAdvertiserDaemon setInvalidationHandler:](v6, "setInvalidationHandler:", v15);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BF67C;
    v14[3] = &unk_1009171E8;
    v14[4] = v6;
    v14[5] = self;
    -[CBAdvertiserDaemon activateWithCompletion:](v6, "activateWithCompletion:", v14);

  }
}

- (void)_xpcDiagnosticAssertion
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  _QWORD v8[6];

  v3 = objc_claimAutoreleasedReturnValue(-[CBDaemonServer testAssertion](self->_daemon, "testAssertion"));
  if (v3)
  {
    v4 = (void *)v3;
    v7 = (id)v3;
    if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 != -1 || (v5 = _LogCategory_Initialize(&dword_100977FD8, 30), v4 = v7, v5))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticAssertion]", 30, "Diags: assertion stop");
        v4 = v7;
      }
    }
    objc_msgSend(v4, "invalidate");
    -[CBDaemonServer setTestAssertion:](self->_daemon, "setTestAssertion:", 0);

  }
  else
  {
    if (dword_100977FD8 <= 30
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticAssertion]", 30, "Diags: assertion start");
    }
    v6 = objc_alloc_init((Class)CBController);
    -[CBDaemonServer setTestAssertion:](self->_daemon, "setTestAssertion:", v6);
    objc_msgSend(v6, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v6, "setLabel:", CFSTR("CBDiags"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000BF930;
    v8[3] = &unk_1009171E8;
    v8[4] = v6;
    v8[5] = self;
    objc_msgSend(v6, "activateAssertionWithFlags:completion:", 1, v8);

  }
}

- (void)_xpcDiagnosticDiscovery
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[6];
  _QWORD v10[5];
  _QWORD v11[6];
  _QWORD v12[6];

  v3 = objc_claimAutoreleasedReturnValue(-[CBDaemonServer testDiscovery](self->_daemon, "testDiscovery"));
  if (v3)
  {
    v4 = (void *)v3;
    v7 = (id)v3;
    if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 != -1 || (v5 = _LogCategory_Initialize(&dword_100977FD8, 30), v4 = v7, v5))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticDiscovery]", 30, "Diags: discovery stop", v7);
        v4 = v7;
      }
    }
    objc_msgSend(v4, "invalidate", v7);
    -[CBDaemonServer setTestDiscovery:](self->_daemon, "setTestDiscovery:", 0);

  }
  else
  {
    if (dword_100977FD8 <= 30
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticDiscovery]", 30, "Diags: discovery start");
    }
    v6 = objc_alloc_init((Class)CBDiscovery);
    -[CBDaemonServer setTestDiscovery:](self->_daemon, "setTestDiscovery:", v6);
    objc_msgSend(v6, "setDiscoveryFlags:", 16);
    objc_msgSend(v6, "setDispatchQueue:", self->_dispatchQueue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BFC7C;
    v12[3] = &unk_1009171C0;
    v12[4] = v6;
    v12[5] = self;
    objc_msgSend(v6, "setDeviceFoundHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000BFD24;
    v11[3] = &unk_1009171C0;
    v11[4] = v6;
    v11[5] = self;
    objc_msgSend(v6, "setDeviceLostHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BFDCC;
    v10[3] = &unk_100917080;
    v10[4] = v6;
    objc_msgSend(v6, "setInvalidationHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000BFE48;
    v9[3] = &unk_1009171E8;
    v9[4] = v6;
    v9[5] = self;
    objc_msgSend(v6, "activateWithCompletion:", v9);

  }
}

- (void)_xpcDiagnosticLog:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  xpc_object_t value;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Reply;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *string;
  id obj;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1000624FC;
  v31 = sub_100062338;
  v32 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000C0238;
  v24[3] = &unk_100917C98;
  v26 = &v27;
  v24[4] = self;
  v4 = a3;
  v25 = v4;
  v5 = objc_retainBlock(v24);
  v6 = (id *)(v28 + 5);
  obj = (id)v28[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) == 0)
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v28[5], v4);
    goto LABEL_11;
  }
  value = xpc_dictionary_get_value(v4, "parm");
  v9 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (!v9)
    goto LABEL_6;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v10 = xpc_dictionary_get_string(v9, "iStr");
    if (!v10 || (v11 = LogControl(v10), !(_DWORD)v11))
    {
LABEL_6:
      string = 0;
      v12 = LogShow(&string);
      if (string)
      {
        Reply = CUXPCDictionaryCreateReply(v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue(Reply);
        v15 = v14;
        if (v14)
        {
          xpc_dictionary_set_string(v14, "oStr", string);
          free(string);
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v15);
        }
        else if (dword_100977FD8 <= 90
               && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticLog:]", 90, "### DiagnosticLog create reply failed");
        }
      }
      else
      {
        v16 = CBErrorF(v12, "LogShow failed");
        v17 = objc_claimAutoreleasedReturnValue(v16);
        v15 = (void *)v28[5];
        v28[5] = v17;
      }

      goto LABEL_10;
    }
    v20 = CBErrorF(v11, "LogControl failed");
    v19 = objc_claimAutoreleasedReturnValue(v20);
  }
  else
  {
    v18 = CBErrorF(4294960591, "Non-dict input");
    v19 = objc_claimAutoreleasedReturnValue(v18);
  }
  v21 = (void *)v28[5];
  v28[5] = v19;

LABEL_10:
LABEL_11:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v27, 8);
}

- (void)_xpcDiagnosticShow:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  xpc_object_t value;
  void *v8;
  const char *string;
  int64_t int64;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  uint64_t Reply;
  void *v20;
  __CFString *v21;
  const char *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  id v39;
  _BYTE v40[128];

  v4 = a3;
  v39 = 0;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v39);
  v6 = v39;
  if ((v5 & 1) == 0)
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    goto LABEL_33;
  }
  value = xpc_dictionary_get_value(v4, "parm");
  v8 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (!v8)
  {
    v15 = 20;
    goto LABEL_13;
  }
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v8, "iStr");
    int64 = xpc_dictionary_get_int64(v8, "vrbL");
    if (string)
    {
      if (stricmp_prefix(string, "ident"))
      {
        v11 = CBErrorF(4294960591, "Unknown show type: '%s'", string);
        v12 = objc_claimAutoreleasedReturnValue(v11);

        if (dword_100977FD8 <= 90
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          v13 = CUPrintNSError(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticShow:]", 90, "### DiagnosticShow failed: %@", v14);

        }
        -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v12, v4);
        v6 = (id)v12;
        goto LABEL_32;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer identityArray](self->_daemon, "identityArray"));
      v37 = 0;
      NSAppendPrintF_safe(&v37, "-- Identities: %d total --\n", objc_msgSend(v23, "count"));
      v18 = (__CFString *)v37;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v17 = v23;
      v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v34;
        do
        {
          v27 = 0;
          v28 = v18;
          do
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v17);
            v29 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v27);
            v32 = v28;
            NSAppendPrintF_safe(&v32, "%@\n", v29);
            v18 = v32;

            v27 = (char *)v27 + 1;
            v28 = v18;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v25);
      }

LABEL_14:
      Reply = CUXPCDictionaryCreateReply(v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v20)
      {
        if (v18)
          v21 = v18;
        else
          v21 = CFSTR("None\n");
        v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
        if (v22)
          xpc_dictionary_set_string(v20, "oStr", v22);
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v20);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticShow:]", 90, "### DiagnosticShow create reply failed");
      }

      goto LABEL_32;
    }
    if (int64 <= 0)
      v15 = 20;
    else
      v15 = 10;
LABEL_13:
    v38 = 0;
    v16 = CUDescriptionWithLevel(self->_daemon, v15);
    v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    NSAppendPrintF_safe(&v38, "%@", v17);
    v18 = (__CFString *)v38;
    goto LABEL_14;
  }
  v30 = CBErrorF(4294960591, "Non-dict input params");
  v31 = objc_claimAutoreleasedReturnValue(v30);

  v6 = (id)v31;
LABEL_32:

LABEL_33:
}

- (void)_xpcDiagnosticTipiChanged
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t i;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = objc_alloc_init((Class)CBDevice);
  v2 = NSRandomData(6, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v13, "setBtAddressData:", v3);

  v4 = objc_alloc_init((Class)NSMutableArray);
  for (i = 0; i != 3; ++i)
  {
    v6 = objc_alloc_init((Class)CBDevice);
    v7 = NSRandomData(6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "setBtAddressData:", v8);

    if (i == 1)
      v9 = 2;
    else
      v9 = 3;
    if (i == 1)
      v10 = 3;
    else
      v10 = 1;
    if (i)
      v11 = v9;
    else
      v11 = 1;
    objc_msgSend(v6, "setTipiConnectionStatus:", v11);
    objc_msgSend(v6, "setTipiState:", v10);
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(v13, "setTipiDevices:", v4);
  if (dword_100977FD8 < 31 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcDiagnosticTipiChanged]", 30, "Diags: Tipi changed: %@", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("com.apple.bluetooth.TipiChanged"), v13, 0);

}

- (void)_xpcSetLowPowerMode:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  int64_t int64;
  const char *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  int v12;
  id v13;

  v4 = a3;
  v13 = 0;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v13);
  v6 = v13;
  if ((v5 & 1) != 0)
  {
    int64 = xpc_dictionary_get_int64(v4, "ctrP");
    if (dword_100977FD8 <= 30
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      if (int64 > 2)
        v8 = "?";
      else
        v8 = off_100919338[(int)int64];
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSetLowPowerMode:]", 30, "SetLowPowerMode: %s", v8);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C09EC;
    v10[3] = &unk_1009191D8;
    v12 = int64;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v9, "setLowPowerModeWithReason:completionHandler:", int64, v10);

  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
  }

}

- (void)_xpcGetPowerState:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  uint64_t Reply;
  void *v8;
  unint64_t v9;
  const char *v10;
  id v11;

  v11 = 0;
  v4 = a3;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  v6 = v11;
  if ((v5 & 1) != 0)
  {
    Reply = CUXPCDictionaryCreateReply(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(Reply);

    if (v8)
    {
      v9 = -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient");
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        if (v9 > 0xA)
          v10 = "?";
        else
          v10 = off_100919350[v9];
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcGetPowerState:]", 30, "Get power state: %s", v10);
      }
      xpc_dictionary_set_int64(v8, "pwrS", v9);
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v8);
    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcGetPowerState:]", 90, "### GetPowerState create reply failed");
    }
  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
    v8 = v4;
  }

}

- (void)_xpcSetPowerState:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  unint64_t int64;
  const char *v9;
  void *v10;
  id *v11;
  uint64_t Reply;
  void *v13;
  id v14;
  id obj;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1000624FC;
  v23 = sub_100062338;
  v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000C0FF0;
  v16[3] = &unk_100917C98;
  v18 = &v19;
  v16[4] = self;
  v4 = a3;
  v17 = v4;
  v5 = objc_retainBlock(v16);
  v6 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    int64 = xpc_dictionary_get_int64(v4, "pwrS");
    if (dword_100977FD8 <= 30
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      if (int64 > 0xA)
        v9 = "?";
      else
        v9 = off_100919350[int64];
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSetPowerState:]", 30, "SetPowerState: %s", v9);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
    v11 = (id *)(v20 + 5);
    v14 = (id)v20[5];
    objc_msgSend(v10, "setPowerState:error:", int64, &v14);
    objc_storeStrong(v11, v14);

    if (!v20[5])
    {
      Reply = CUXPCDictionaryCreateReply(v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v13)
      {
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v13);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSetPowerState:]", 90, "### SetPowerState create reply failed");
      }

    }
  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v19, 8);
}

- (void)_xpcReadPrefs:(id)a3
{
  id *v3;
  unsigned __int8 v4;
  id *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *j;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *k;
  uint64_t v29;
  void *v30;
  uint64_t Reply;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  _QWORD *v39;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  id obj;
  _QWORD v57[5];
  id v58;
  uint64_t *v59;
  uint64_t v60;
  id *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _QWORD v66[7];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];

  v60 = 0;
  v61 = (id *)&v60;
  v62 = 0x3032000000;
  v63 = sub_1000624FC;
  v64 = sub_100062338;
  v65 = 0;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1000C171C;
  v57[3] = &unk_100917C98;
  v59 = &v60;
  v57[4] = self;
  v41 = a3;
  v58 = v41;
  v39 = objc_retainBlock(v57);
  v3 = v61;
  obj = v61[5];
  v4 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v3 + 5, obj);
  if ((v4 & 1) != 0)
  {
    v5 = v61 + 5;
    v54 = v61[5];
    v55 = 0;
    CUXPCDecodeNSArrayOfNSString(v41, "pfKs", &v55, &v54);
    objc_storeStrong(v5, v54);
    if (v61[5])
    {
LABEL_41:

      goto LABEL_42;
    }
    v6 = v55;
    if (!v55)
    {
      v34 = CBErrorF(4294960591, "No pref keys");
      v35 = objc_claimAutoreleasedReturnValue(v34);
      v9 = v61[5];
      v61[5] = (id)v35;
LABEL_40:

      goto LABEL_41;
    }
    if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100977FD8, 30))
          goto LABEL_8;
        v6 = v55;
      }
      v7 = CUPrintNSObjectOneLine(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcReadPrefs:]", 30, "ReadPrefs: %@", v8);

    }
LABEL_8:
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    if (objc_msgSend(v55, "count"))
    {
      v44 = 0uLL;
      v45 = 0uLL;
      v42 = 0uLL;
      v43 = 0uLL;
      v10 = v55;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v67, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v43 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
            v66[0] = CFSTR("btvcDefaultAdvRSSI");
            v66[1] = CFSTR("disableCentralSkipSniff");
            v66[2] = CFSTR("enableSpecialSniffTransitions");
            v66[3] = CFSTR("move3PPLEMSToLegacyMode");
            v66[4] = CFSTR("move3PPLEMSToLegacyModeSerial");
            v66[5] = CFSTR("BluetoothAutoSeekKeyboard");
            v66[6] = CFSTR("BluetoothAutoSeekPointingDevice");
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 7));
            if (objc_msgSend(v15, "containsObject:", v14))
              v16 = CFSTR("com.apple.Bluetooth");
            else
              v16 = CFSTR("com.apple.bluetooth");
            v17 = v16;

            v18 = (void *)CFPrefs_CopyTypedValue(v17, v14, 0, 0);
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v14);

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v67, 16);
        }
        while (v11);
      }
    }
    else
    {
      v52 = 0uLL;
      v53 = 0uLL;
      v50 = 0uLL;
      v51 = 0uLL;
      v19 = (void *)CFPrefs_CopyKeys(CFSTR("com.apple.Bluetooth"), 0);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v69, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(_QWORD *)v51 != v21)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
            v24 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.Bluetooth"), v23, 0, 0);
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, v23);

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v69, 16);
        }
        while (v20);
      }

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v10 = (id)CFPrefs_CopyKeys(CFSTR("com.apple.bluetooth"), 0);
      v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
      if (v25)
      {
        v26 = v10;
        v27 = *(_QWORD *)v47;
        do
        {
          for (k = 0; k != v25; k = (char *)k + 1)
          {
            if (*(_QWORD *)v47 != v27)
              objc_enumerationMutation(v26);
            v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)k);
            v30 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.bluetooth"), v29, 0, 0);
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, v29);

          }
          v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
        }
        while (v25);
        v10 = v26;
      }
    }

    Reply = CUXPCDictionaryCreateReply(v41);
    v32 = (void *)objc_claimAutoreleasedReturnValue(Reply);
    if (v32)
    {
      v33 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);
      if (v33)
      {
        xpc_dictionary_set_value(v32, "pfVs", v33);
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v32);
      }
      else
      {
        v36 = CBErrorF(4294960596, "Convert pref values to XPC failed");
        v37 = objc_claimAutoreleasedReturnValue(v36);
        v38 = v61[5];
        v61[5] = (id)v37;

      }
    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcReadPrefs:]", 90, "### ReadPrefs create reply failed");
    }

    goto LABEL_40;
  }
LABEL_42:
  ((void (*)(_QWORD *))v39[2])(v39);

  _Block_object_dispose(&v60, 8);
}

- (void)_xpcWritePref:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id *v8;
  xpc_object_t value;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t Reply;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id obj;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[7];

  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = sub_1000624FC;
  v37 = sub_100062338;
  v38 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C1C2C;
  v30[3] = &unk_100917C98;
  v32 = &v33;
  v30[4] = self;
  v4 = a3;
  v31 = v4;
  v5 = objc_retainBlock(v30);
  v6 = v34;
  obj = v34[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    v8 = v34 + 5;
    v27 = v34[5];
    v28 = 0;
    CUXPCDecodeNSString(v4, "pfKy", &v28, &v27);
    objc_storeStrong(v8, v27);
    if (!v34[5])
    {
      if (v28)
      {
        value = xpc_dictionary_get_value(v4, "pfVl");
        v10 = objc_claimAutoreleasedReturnValue(value);
        v11 = (id)v10;
        if (v10)
        {
          v12 = (id)_CFXPCCreateCFObjectFromXPCObject(v10);
          if (v12)
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcWritePref:]", 30, "WritePref: '%@' = '%@'", v28, v12);
            }
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v14 = objc_msgSend(v12, "isEqual:", v13);

            if (v14)
            {
              CFPrefs_RemoveValue(CFSTR("com.apple.bluetooth"), v28);
              CFPrefs_RemoveValue(CFSTR("com.apple.Bluetooth"), v28);
            }
            else
            {
              v39[0] = CFSTR("btvcDefaultAdvRSSI");
              v39[1] = CFSTR("disableCentralSkipSniff");
              v39[2] = CFSTR("enableSpecialSniffTransitions");
              v39[3] = CFSTR("move3PPLEMSToLegacyMode");
              v39[4] = CFSTR("move3PPLEMSToLegacyModeSerial");
              v39[5] = CFSTR("BluetoothAutoSeekKeyboard");
              v39[6] = CFSTR("BluetoothAutoSeekPointingDevice");
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 7));
              v16 = objc_msgSend(v15, "containsObject:", v28);
              v17 = CFSTR("com.apple.bluetooth");
              if (v16)
                v17 = CFSTR("com.apple.Bluetooth");
              v18 = v17;

              CFPrefs_SetValue(v18, v28, v12);
            }
            Reply = CUXPCDictionaryCreateReply(v4);
            v20 = (id)objc_claimAutoreleasedReturnValue(Reply);
            if (v20)
            {
              -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v20);
            }
            else if (dword_100977FD8 <= 90
                   && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
            {
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcWritePref:]", 90, "### WritePrefs create reply failed");
            }
          }
          else
          {
            v25 = CBErrorF(4294960591, "Bad pref value");
            v26 = objc_claimAutoreleasedReturnValue(v25);
            v20 = v34[5];
            v34[5] = (id)v26;
          }

        }
        else
        {
          v23 = CBErrorF(4294960591, "No pref value");
          v24 = objc_claimAutoreleasedReturnValue(v23);
          v12 = v34[5];
          v34[5] = (id)v24;
        }

      }
      else
      {
        v21 = CBErrorF(4294960591, "No pref key");
        v22 = objc_claimAutoreleasedReturnValue(v21);
        v11 = v34[5];
        v34[5] = (id)v22;
      }

    }
  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v33, 8);
}

- (void)_xpcSendRelayMessage:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  id *v11;
  id *v12;
  int v13;
  unsigned __int8 v14;
  id *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  id *v24;
  unsigned int v25;
  uint64_t Reply;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id obj;
  _QWORD v45[5];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  id *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  id v54;

  v48 = 0;
  v49 = (id *)&v48;
  v50 = 0x3032000000;
  v51 = sub_1000624FC;
  v52 = sub_100062338;
  v53 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000C21D8;
  v45[3] = &unk_100917C98;
  v47 = &v48;
  v45[4] = self;
  v4 = a3;
  v46 = v4;
  v5 = objc_retainBlock(v45);
  v6 = v49;
  obj = v49[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    v43 = 0;
    v8 = objc_opt_class(CBDevice);
    v9 = v49;
    v42 = v49[5];
    CUXPCDecodeObject(v4, "cduD", v8, &v43, &v42);
    objc_storeStrong(v9 + 5, v42);
    if (!v43)
    {
      v28 = NSErrorNestedF(CBErrorDomain, 4294960591, v49[5], "bad conduit device");
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v30 = v49[5];
      v49[5] = (id)v29;

      goto LABEL_23;
    }
    v41 = 0;
    v10 = objc_opt_class(CBDevice);
    v11 = v49;
    v40 = v49[5];
    CUXPCDecodeObject(v4, "dstD", v10, &v41, &v40);
    objc_storeStrong(v11 + 5, v40);
    if (v41)
    {
      v12 = v49 + 5;
      v39 = v49[5];
      v54 = 0;
      v13 = CUXPCDecodeUInt64RangedEx(v4, "rlMT", 0, 255, &v54, &v39);
      if (v13 == 6)
        v14 = v54;
      else
        v14 = 0;
      objc_storeStrong(v12, v39);
      if (v13 != 5)
      {
        v54 = 0;
        v15 = v49;
        v38 = v49[5];
        CUXPCDecodeNSData(v4, "rlMD", &v54, &v38);
        objc_storeStrong(v15 + 5, v38);
        v16 = v54;
        if (!v54)
        {
          v35 = NSErrorNestedF(CBErrorDomain, 4294960591, v49[5], "bad message data");
          v36 = objc_claimAutoreleasedReturnValue(v35);
          v27 = v49[5];
          v49[5] = (id)v36;
          goto LABEL_20;
        }
        if (dword_100977FD8 <= 30)
        {
          if (dword_100977FD8 != -1)
          {
LABEL_11:
            v17 = v43;
            v18 = v41;
            v19 = CUPrintNSDataHex(v16, 300, 0);
            v20 = objc_claimAutoreleasedReturnValue(v19);
            v21 = (void *)v20;
            v22 = "?";
            if (v14 == 1)
              v22 = "AudioArbitration";
            if (!v14)
              v22 = "Invalid";
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendRelayMessage:]", 30, "SendRelayMessage: conduit %@, destination %@, type %s, data <%@>", v17, v18, v22, v20);

            goto LABEL_17;
          }
          if (_LogCategory_Initialize(&dword_100977FD8, 30))
          {
            v16 = v54;
            goto LABEL_11;
          }
        }
LABEL_17:
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
        v24 = v49;
        v37 = v49[5];
        v25 = objc_msgSend(v23, "sendRelayMessageType:messageData:conduitDevice:destinationDevice:error:", v14, v54, v43, v41, &v37);
        objc_storeStrong(v24 + 5, v37);

        if (!v25)
        {
LABEL_21:

LABEL_22:
LABEL_23:

          goto LABEL_24;
        }
        Reply = CUXPCDictionaryCreateReply(v4);
        v27 = (id)objc_claimAutoreleasedReturnValue(Reply);
        if (v27)
        {
          -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v27);
        }
        else if (dword_100977FD8 <= 90
               && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendRelayMessage:]", 90, "### SendRelayMessage create reply failed");
        }
LABEL_20:

        goto LABEL_21;
      }
      v33 = NSErrorNestedF(CBErrorDomain, 4294960591, v49[5], "bad message type");
      v32 = objc_claimAutoreleasedReturnValue(v33);
    }
    else
    {
      v31 = NSErrorNestedF(CBErrorDomain, 4294960591, v49[5], "bad destination device");
      v32 = objc_claimAutoreleasedReturnValue(v31);
    }
    v34 = v49[5];
    v49[5] = (id)v32;

    goto LABEL_22;
  }
LABEL_24:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v48, 8);
}

- (void)_xpcSendSmartRoutingInformation:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  uint64_t v8;
  id *v9;
  id *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  unsigned __int8 v17;
  uint64_t Reply;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id obj;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v34 = 0;
  v35 = (id *)&v34;
  v36 = 0x3032000000;
  v37 = sub_1000624FC;
  v38 = sub_100062338;
  v39 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000C262C;
  v31[3] = &unk_100917C98;
  v33 = &v34;
  v31[4] = self;
  v4 = a3;
  v32 = v4;
  v5 = objc_retainBlock(v31);
  v6 = v35;
  obj = v35[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    v29 = 0;
    v8 = objc_opt_class(CBDevice);
    v9 = v35;
    v28 = v35[5];
    CUXPCDecodeObject(v4, "dstD", v8, &v29, &v28);
    objc_storeStrong(v9 + 5, v28);
    if (!v29)
    {
      v20 = NSErrorNestedF(CBErrorDomain, 4294960591, v35[5], "bad destination device");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = v35[5];
      v35[5] = (id)v21;

      goto LABEL_13;
    }
    v10 = v35;
    v26 = v35[5];
    v27 = 0;
    CUXPCDecodeNSData(v4, "rlMD", &v27, &v26);
    objc_storeStrong(v10 + 5, v26);
    v11 = v27;
    if (!v27)
    {
      v23 = NSErrorNestedF(CBErrorDomain, 4294960591, v35[5], "bad message data");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v19 = v35[5];
      v35[5] = (id)v24;
      goto LABEL_11;
    }
    if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100977FD8, 30))
          goto LABEL_8;
        v11 = v27;
      }
      v12 = v29;
      v13 = CUPrintNSDataHex(v11, 300, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendSmartRoutingInformation:]", 30, "SendSmartRoutingInformation: destination %@, data <%@>", v12, v14);

    }
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
    v16 = v35;
    v25 = v35[5];
    v17 = objc_msgSend(v15, "sendSmartRoutingInformation:device:error:", v27, v29, &v25);
    objc_storeStrong(v16 + 5, v25);

    if ((v17 & 1) == 0)
    {
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
    Reply = CUXPCDictionaryCreateReply(v4);
    v19 = (id)objc_claimAutoreleasedReturnValue(Reply);
    if (v19)
    {
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v19);
    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendSmartRoutingInformation:]", 90, "### SendSmartRoutingInformation create reply failed");
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_14:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v34, 8);
}

- (void)_xpcSendAudioAccessoryEventMessage:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  uint64_t v8;
  id *v9;
  id *v10;
  int v11;
  unsigned __int8 v12;
  id *v13;
  const char *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id *v19;
  unsigned __int8 v20;
  uint64_t Reply;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id obj;
  _QWORD v35[5];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  id v44;

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1000624FC;
  v42 = sub_100062338;
  v43 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000C2B3C;
  v35[3] = &unk_100917C98;
  v37 = &v38;
  v35[4] = self;
  v4 = a3;
  v36 = v4;
  v5 = objc_retainBlock(v35);
  v6 = (id *)(v39 + 5);
  obj = (id)v39[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    v33 = 0;
    v8 = objc_opt_class(CBDevice);
    v9 = (id *)(v39 + 5);
    v32 = (id)v39[5];
    CUXPCDecodeObject(v4, "dstD", v8, &v33, &v32);
    objc_storeStrong(v9, v32);
    if (v33)
    {
      v10 = (id *)(v39 + 5);
      v31 = (id)v39[5];
      v44 = 0;
      v11 = CUXPCDecodeUInt64RangedEx(v4, "acET", 0, 255, &v44, &v31);
      if (v11 == 6)
        v12 = v44;
      else
        v12 = 0;
      objc_storeStrong(v10, v31);
      if (v11 != 5)
      {
        v44 = 0;
        v13 = (id *)(v39 + 5);
        v30 = (id)v39[5];
        CUXPCDecodeNSData(v4, "acMd", &v44, &v30);
        objc_storeStrong(v13, v30);
        if (v44)
        {
          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            if (v12 > 6u)
              v14 = "?";
            else
              v14 = off_1009193A8[(char)v12];
            v15 = v33;
            v16 = CUPrintNSDataHex(v44, 300, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendAudioAccessoryEventMessage:]", 30, "SendAudioAccessoryEventMessage: type: %s, destination %@, data <%@>", v14, v15, v17);

          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
          v19 = (id *)(v39 + 5);
          v29 = (id)v39[5];
          v20 = objc_msgSend(v18, "sendAudioAccessoryEventMessage:eventType:device:error:", v44, v12, v33, &v29);
          objc_storeStrong(v19, v29);

          if ((v20 & 1) == 0)
            goto LABEL_20;
          Reply = CUXPCDictionaryCreateReply(v4);
          v22 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v22)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v22);
          }
          else if (dword_100977FD8 <= 90
                 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendAudioAccessoryEventMessage:]", 90, "### SendAudioAccessoryEventMessage create reply failed");
          }
        }
        else
        {
          v27 = NSErrorNestedF(CBErrorDomain, 4294960591, v39[5], "bad message data");
          v28 = objc_claimAutoreleasedReturnValue(v27);
          v22 = (void *)v39[5];
          v39[5] = v28;
        }

LABEL_20:
LABEL_21:

        goto LABEL_22;
      }
      v25 = NSErrorNestedF(CBErrorDomain, 4294960591, v39[5], "bad accessory event type");
      v24 = objc_claimAutoreleasedReturnValue(v25);
    }
    else
    {
      v23 = NSErrorNestedF(CBErrorDomain, 4294960591, v39[5], "bad destination device");
      v24 = objc_claimAutoreleasedReturnValue(v23);
    }
    v26 = (void *)v39[5];
    v39[5] = v24;

    goto LABEL_21;
  }
LABEL_22:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v38, 8);
}

- (void)_xpcSendAudioAccessoryConfigMessage:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  uint64_t v8;
  id *v9;
  xpc_object_t value;
  void *v11;
  void *v12;
  id *v13;
  unsigned __int8 v14;
  uint64_t Reply;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id obj;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1000624FC;
  v32 = sub_100062338;
  v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000C2F08;
  v25[3] = &unk_100917C98;
  v27 = &v28;
  v25[4] = self;
  v4 = a3;
  v26 = v4;
  v5 = objc_retainBlock(v25);
  v6 = (id *)(v29 + 5);
  obj = (id)v29[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    v23 = 0;
    v8 = objc_opt_class(CBDevice);
    v9 = (id *)(v29 + 5);
    v22 = (id)v29[5];
    CUXPCDecodeObject(v4, "dstD", v8, &v23, &v22);
    objc_storeStrong(v9, v22);
    if (!v23)
    {
      v17 = NSErrorNestedF(CBErrorDomain, 4294960591, v29[5], "bad destination device");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v11 = (void *)v29[5];
      v29[5] = v18;
      goto LABEL_8;
    }
    value = xpc_dictionary_get_value(v4, "acMd");
    v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
      v13 = (id *)(v29 + 5);
      v21 = (id)v29[5];
      v14 = objc_msgSend(v12, "sendAudioAccessoryConfig:device:error:", v11, v23, &v21);
      objc_storeStrong(v13, v21);

      if ((v14 & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      Reply = CUXPCDictionaryCreateReply(v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v16)
      {
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v16);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendAudioAccessoryConfigMessage:]", 90, "### SendAudioAccessoryConfigMessage create reply failed");
      }
    }
    else
    {
      v19 = NSErrorNestedF(CBErrorDomain, 4294960591, v29[5], "non-dict message");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v16 = (void *)v29[5];
      v29[5] = v20;
    }

    goto LABEL_8;
  }
LABEL_9:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v28, 8);
}

- (void)_xpcSendConversationDetectMessage:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  uint64_t v8;
  id *v9;
  id *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  unsigned __int8 v17;
  uint64_t Reply;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id obj;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v34 = 0;
  v35 = (id *)&v34;
  v36 = 0x3032000000;
  v37 = sub_1000624FC;
  v38 = sub_100062338;
  v39 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000C335C;
  v31[3] = &unk_100917C98;
  v33 = &v34;
  v31[4] = self;
  v4 = a3;
  v32 = v4;
  v5 = objc_retainBlock(v31);
  v6 = v35;
  obj = v35[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    v29 = 0;
    v8 = objc_opt_class(CBDevice);
    v9 = v35;
    v28 = v35[5];
    CUXPCDecodeObject(v4, "dstD", v8, &v29, &v28);
    objc_storeStrong(v9 + 5, v28);
    if (!v29)
    {
      v20 = NSErrorNestedF(CBErrorDomain, 4294960591, v35[5], "bad destination device");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = v35[5];
      v35[5] = (id)v21;

      goto LABEL_13;
    }
    v10 = v35;
    v26 = v35[5];
    v27 = 0;
    CUXPCDecodeNSData(v4, "cdMd", &v27, &v26);
    objc_storeStrong(v10 + 5, v26);
    v11 = v27;
    if (!v27)
    {
      v23 = NSErrorNestedF(CBErrorDomain, 4294960591, v35[5], "bad message data");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v19 = v35[5];
      v35[5] = (id)v24;
      goto LABEL_11;
    }
    if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100977FD8, 30))
          goto LABEL_8;
        v11 = v27;
      }
      v12 = v29;
      v13 = CUPrintNSDataHex(v11, 300, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendConversationDetectMessage:]", 30, "SendConversationDetectMessage: destination %@, data <%@>", v12, v14);

    }
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemon, "stackController"));
    v16 = v35;
    v25 = v35[5];
    v17 = objc_msgSend(v15, "sendConversationDetectMessage:device:error:", v27, v29, &v25);
    objc_storeStrong(v16 + 5, v25);

    if ((v17 & 1) == 0)
    {
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
    Reply = CUXPCDictionaryCreateReply(v4);
    v19 = (id)objc_claimAutoreleasedReturnValue(Reply);
    if (v19)
    {
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v19);
    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcSendConversationDetectMessage:]", 90, "### SendConversationDetectMessage create reply failed");
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_14:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v34, 8);
}

- (void)_xpcResetCBExtension:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id *v8;
  id v9;
  void *v10;
  id *v11;
  uint64_t Reply;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id obj;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1000624FC;
  v27 = sub_100062338;
  v28 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C36EC;
  v20[3] = &unk_100917C98;
  v22 = &v23;
  v20[4] = self;
  v4 = a3;
  v21 = v4;
  v5 = objc_retainBlock(v20);
  v6 = (id *)(v24 + 5);
  obj = (id)v24[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    v8 = (id *)(v24 + 5);
    v17 = (id)v24[5];
    v18 = 0;
    CUXPCDecodeNSString(v4, "id", &v18, &v17);
    objc_storeStrong(v8, v17);
    if (v24[5])
      goto LABEL_12;
    v9 = v18;
    if (!v18)
    {
      v14 = CBErrorF(4294960591, "No extensionID");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v13 = (void *)v24[5];
      v24[5] = v15;
LABEL_11:

      goto LABEL_12;
    }
    if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 != -1)
      {
LABEL_6:
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcResetCBExtension:]", 30, "ResetCBExtension: '%@'", v9);
        goto LABEL_8;
      }
      if (_LogCategory_Initialize(&dword_100977FD8, 30))
      {
        v9 = v18;
        goto LABEL_6;
      }
    }
LABEL_8:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer extensionsDaemon](self->_daemon, "extensionsDaemon"));
    v11 = (id *)(v24 + 5);
    v16 = (id)v24[5];
    objc_msgSend(v10, "resetCBExtension:error:", v18, &v16);
    objc_storeStrong(v11, v16);

    if (!v24[5])
    {
      Reply = CUXPCDictionaryCreateReply(v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v13)
      {
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v13);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcResetCBExtension:]", 90, "### ResetCBExtension create reply failed");
      }
      goto LABEL_11;
    }
LABEL_12:

  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v23, 8);
}

- (void)_xpcUpdateIdentities:(id)a3
{
  id v4;
  unsigned __int8 v5;
  xpc_object_t array;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t Reply;
  void *v15;
  _QWORD applier[6];
  id obj;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000624FC;
  v22 = sub_100062338;
  v23 = 0;
  obj = 0;
  v5 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(&v23, obj);
  if ((v5 & 1) != 0)
  {
    array = xpc_dictionary_get_array(v4, "idtA");
    v7 = (void *)objc_claimAutoreleasedReturnValue(array);
    if (v7)
    {
      v8 = objc_alloc_init((Class)NSMutableArray);
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1000C3A8C;
      applier[3] = &unk_100919200;
      applier[4] = v8;
      applier[5] = &v18;
      xpc_array_apply(v7, applier);
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcUpdateIdentities:]", 30, "UpdateIdentities: %d total", objc_msgSend(v8, "count"));
      }
      -[CBDaemonServer updateIdentities:](self->_daemon, "updateIdentities:", v8);
      Reply = CUXPCDictionaryCreateReply(v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v15)
      {
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v15);
      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcUpdateIdentities:]", 90, "### UpdateIdentities create reply failed");
      }

    }
    else
    {
      v9 = CBErrorF(4294960591, "No identities");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)v19[5];
      v19[5] = v10;

      if (dword_100977FD8 <= 90
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        v12 = CUPrintNSError(v19[5]);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcUpdateIdentities:]", 90, "### UpdateIdentities failed: %@", v13);

      }
      -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v19[5], v4);
    }

  }
  else
  {
    -[CBDaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v19[5], v4);
  }
  _Block_object_dispose(&v18, 8);

}

- (void)_xpcCBDiscoveryActivateWHB:(id)a3 discovery:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t Reply;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  CBDaemonXPCConnection *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;

  v6 = a3;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000C4074;
  v31[3] = &unk_100917058;
  v31[4] = self;
  v7 = a4;
  v32 = v7;
  objc_msgSend(v7, "setBluetoothStateChangedHandler:", v31);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000C40D4;
  v29[3] = &unk_1009171C0;
  v29[4] = self;
  v8 = v7;
  v30 = v8;
  objc_msgSend(v8, "setDeviceFoundHandler:", v29);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C40F8;
  v27[3] = &unk_1009171C0;
  v27[4] = self;
  v9 = v8;
  v28 = v9;
  objc_msgSend(v9, "setDeviceLostHandler:", v27);
  objc_storeStrong((id *)&self->_activatedDiscoveryWHB, a4);
  if (dword_100977FD8 <= 30 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
  {
    v10 = CUPrintPID(self->_pid);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryActivateWHB:discovery:]", 30, "Activate: %@, from %@", v9, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
  objc_msgSend(v12, "reportCBDiscovery:daemonCnx:action:", v9, self, CFSTR("strt"));

  -[CBDaemonServer scheduleDiscoveryUpdateImmediate:](self->_daemon, "scheduleDiscoveryUpdateImmediate:", 0);
  Reply = CUXPCDictionaryCreateReply(v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(Reply);
  if (v14)
  {
    xpc_dictionary_set_int64(v14, "pwrS", -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient"));
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_1000624FC;
    v25 = sub_100062338;
    v26 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer whbDeviceMap](self->_daemon, "whbDeviceMap"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000C411C;
    v17[3] = &unk_100918070;
    v18 = v9;
    v19 = self;
    v20 = &v21;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v17);

    v16 = (void *)v22[5];
    if (v16)
      xpc_dictionary_set_value(v14, "devA", v16);
    -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v14);

    _Block_object_dispose(&v21, 8);
  }
  else if (dword_100977FD8 <= 90
         && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
  {
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryActivateWHB:discovery:]", 90, "### CBDiscovery activate create reply failed");
  }

}

- (void)_xpcCBDiscoveryFinish:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  CBDiscovery *activatedDiscovery;
  CBDiscovery *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t Reply;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  CBDaemonXPCConnection *v21;
  id obj;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1000624FC;
  v30 = sub_100062338;
  v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000C4590;
  v23[3] = &unk_100917C98;
  v25 = &v26;
  v23[4] = self;
  v4 = a3;
  v24 = v4;
  v5 = objc_retainBlock(v23);
  v6 = (id *)(v27 + 5);
  obj = (id)v27[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    activatedDiscovery = self->_activatedDiscovery;
    if (activatedDiscovery)
    {
      v9 = activatedDiscovery;
    }
    else
    {
      v9 = self->_activatedDiscoveryWHB;
      if (!v9)
      {
        v17 = CBErrorF(4294960551, "No discovery");
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v9 = (CBDiscovery *)v27[5];
        v27[5] = v18;
LABEL_19:

        goto LABEL_20;
      }
    }
    if (dword_100977FD8 <= 30
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v10 = -[CBDiscovery clientID](v9, "clientID");
      v11 = CUPrintPID(self->_pid);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryFinish:]", 30, "Discovery Finish start: CID 0x%X, from %@", v10, v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackBLEScanner](self->_daemon, "stackBLEScanner"));
    if (v13)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000C4658;
      v19[3] = &unk_100919228;
      v19[4] = v9;
      v20 = v4;
      v21 = self;
      objc_msgSend(v13, "finishDiscovery:completionHandler:", v9, v19);

    }
    else
    {
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryFinish:]", 30, "Discovery Finish completed: CID 0x%X, not scanning", -[CBDiscovery clientID](v9, "clientID"));
      }
      Reply = CUXPCDictionaryCreateReply(v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue(Reply);
      if (v15)
      {
        v16 = objc_alloc_init((Class)CBDiscoverySummary);
        CUXPCEncodeObject(v15, "dsSm", v16, 0);
        -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v15);

      }
      else if (dword_100977FD8 <= 90
             && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryFinish:]", 90, "### Discovery Finish create reply failed");
      }

    }
    goto LABEL_19;
  }
LABEL_20:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v26, 8);
}

- (void)_xpcCBDiscoveryClearDuplicateFilterCache:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  CBDiscovery *activatedDiscovery;
  CBDiscovery *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000624FC;
  v21 = sub_100062338;
  v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C495C;
  v14[3] = &unk_100917C98;
  v16 = &v17;
  v14[4] = self;
  v4 = a3;
  v15 = v4;
  v5 = objc_retainBlock(v14);
  v6 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    activatedDiscovery = self->_activatedDiscovery;
    if (activatedDiscovery)
    {
      v9 = activatedDiscovery;
    }
    else
    {
      v9 = self->_activatedDiscoveryWHB;
      if (!v9)
      {
        v10 = CBErrorF(4294960551, "No discovery");
        v11 = objc_claimAutoreleasedReturnValue(v10);
        v12 = (void *)v18[5];
        v18[5] = v11;

        v9 = 0;
        goto LABEL_6;
      }
    }
    -[CBDaemonServer clearDuplicateFilterCache:](self->_daemon, "clearDuplicateFilterCache:", v9);
LABEL_6:

  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v17, 8);
}

- (void)_xpcCBDiscoveryGetDevices:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  uint64_t uint64;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t Reply;
  void *v14;
  xpc_object_t v15;
  void *v16;
  _QWORD v17[6];
  id obj;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1000624FC;
  v26 = sub_100062338;
  v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000C4CEC;
  v19[3] = &unk_100917C98;
  v21 = &v22;
  v19[4] = self;
  v4 = a3;
  v20 = v4;
  v5 = objc_retainBlock(v19);
  v6 = (id *)(v23 + 5);
  obj = (id)v23[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "dsFl");
    if (dword_100977FD8 <= 30
      && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    {
      v9 = CBDiscoveryFlagsToString(uint64);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = CUPrintPID(self->_pid);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryGetDevices:]", 30, "CBDiscoveryGetDevices: %@, from %@", v10, v12);

    }
    Reply = CUXPCDictionaryCreateReply(v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(Reply);
    if (v14)
    {
      v15 = xpc_array_create(0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer deviceMap](self->_daemon, "deviceMap"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000C4DB4;
      v17[3] = &unk_100919250;
      v17[4] = v15;
      v17[5] = uint64;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v17);

      xpc_dictionary_set_value(v14, "devA", v15);
      -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v14);

    }
    else if (dword_100977FD8 <= 90
           && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
    {
      LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBDiscoveryGetDevices:]", 90, "### CBDiscoveryGetDevices create reply failed");
    }

  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v22, 8);
}

- (void)_xpcCBSpatialInteractionSessionActivate:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  _QWORD *v7;
  id *v8;
  unsigned __int8 v9;
  id v10;
  id *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t Reply;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  const char *v33;
  id v34;
  id v35;
  id v36;
  const char *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  _QWORD *v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD v50[5];
  _QWORD v51[6];
  _QWORD v52[6];
  _QWORD v53[6];
  unsigned int v54;
  _QWORD v55[6];
  _QWORD v56[6];
  _QWORD v57[6];
  _QWORD v58[6];
  _QWORD v59[6];
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  uint64_t *v64;
  uint64_t v65;
  id *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;

  v65 = 0;
  v66 = (id *)&v65;
  v67 = 0x3032000000;
  v68 = sub_1000624FC;
  v69 = sub_100062338;
  v70 = 0;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000C56DC;
  v62[3] = &unk_100917C98;
  v64 = &v65;
  v62[4] = self;
  v6 = a3;
  v63 = v6;
  v7 = objc_retainBlock(v62);
  v8 = v66;
  v61 = v66[5];
  v46 = v7;
  v9 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v61);
  objc_storeStrong(v8 + 5, v61);
  if ((v9 & 1) != 0)
  {
    v10 = objc_alloc((Class)CBSpatialInteractionSession);
    v11 = v66;
    v60 = v66[5];
    v12 = objc_msgSend(v10, "initWithXPCObject:error:", v6, &v60);
    objc_storeStrong(v11 + 5, v60);
    if (!v12)
    {
      v40 = CBErrorF(4294960591, "Decode failed");
      v41 = objc_claimAutoreleasedReturnValue(v40);
      v42 = v66[5];
      v66[5] = (id)v41;

LABEL_39:
      goto LABEL_40;
    }
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_1000C57A4;
    v59[3] = &unk_100917058;
    v59[4] = v12;
    v59[5] = self;
    objc_msgSend(v12, "setAdvertisingAddressChangedHandler:", v59);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000C58A0;
    v58[3] = &unk_100919278;
    v58[4] = v12;
    v58[5] = self;
    objc_msgSend(v12, "setAopDataHandler:", v58);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000C58BC;
    v57[3] = &unk_100917058;
    v57[4] = v12;
    v57[5] = self;
    objc_msgSend(v12, "setBluetoothStateChangedHandler:", v57);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1000C5900;
    v56[3] = &unk_1009171C0;
    v56[4] = v12;
    v56[5] = self;
    objc_msgSend(v12, "setDeviceFoundHandler:", v56);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000C591C;
    v55[3] = &unk_1009171C0;
    v55[4] = v12;
    v55[5] = self;
    objc_msgSend(v12, "setDeviceLostHandler:", v55);
    v49 = objc_alloc_init((Class)NSMutableDictionary);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientIrkData"));
    if (v13
      && (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientIrkData")),
          objc_msgSend(v3, "length") == (id)16))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientIrkData"));
    }
    else
    {
      v14 = NSRandomData(16, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (!v13)
      {
LABEL_8:

        objc_msgSend(v12, "setIrkData:", v48);
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, &off_100960520);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientIdentifierData"));
        if (v15
          && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientIdentifierData")),
              objc_msgSend(v4, "length") == (id)3))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientIdentifierData"));
        }
        else
        {
          v16 = NSRandomData(3, 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (!v15)
          {
LABEL_13:

            objc_msgSend(v12, "setIdentifierData:", v47);
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v47, &off_100960538);
            v17 = objc_msgSend(v12, "uwbTokenFlags");
            if ((_DWORD)v17)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
              objc_msgSend(v49, "setObject:forKeyedSubscript:", v18, &off_100960550);

            }
            v54 = 0;
            v19 = (void *)OPACKEncoderCreateData(v49, 8, &v54);
            if (v19)
            {
              objc_msgSend(v12, "setTokenData:", v19);
              objc_storeStrong((id *)&self->_activatedSpatialInteractionSession, v12);
              if (dword_100977FD8 <= 30
                && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
              {
                v20 = CUPrintPID(self->_pid);
                v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
                LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionActivate:]", 30, "Spatial Activate: %@, from %@", v12, v21);

              }
              v22 = objc_alloc_init((Class)CBDiscovery);
              objc_storeStrong((id *)&self->_activatedDiscovery, v22);
              objc_msgSend(v22, "setBleScanRate:", objc_msgSend(v12, "scanRate"));
              objc_msgSend(v22, "setBleScanRateScreenOff:", objc_msgSend(v12, "scanRateScreenOff"));
              objc_msgSend(v22, "setBleRSSIThresholdHint:", objc_msgSend(v12, "bleRSSIThresholdHint"));
              objc_msgSend(v22, "setBleRSSIThresholdOrder:", objc_msgSend(v12, "bleRSSIThresholdOrder"));
              objc_msgSend(v22, "setDiscoveryFlags:", 0x40000);
              if ((objc_msgSend(v12, "controlFlags") & 0x1000) != 0)
                v23 = (unint64_t)objc_msgSend(v22, "discoveryFlags") | 0x2000000;
              else
                v23 = (unint64_t)objc_msgSend(v22, "discoveryFlags") & 0xFFFFFFFFFDFFFFFFLL;
              objc_msgSend(v22, "setDiscoveryFlags:", v23);
              if ((objc_msgSend(v12, "controlFlags") & 0x2000) != 0)
                v24 = (unint64_t)objc_msgSend(v22, "discoveryFlags") | 0x200000000;
              else
                v24 = (unint64_t)objc_msgSend(v22, "discoveryFlags") & 0xFFFFFFFDFFFFFFFFLL;
              objc_msgSend(v22, "setDiscoveryFlags:", v24);
              if ((objc_msgSend(v12, "controlFlags") & 0x10) != 0)
                v25 = objc_msgSend(v22, "internalFlags") | 0x10;
              else
                v25 = (unint64_t)objc_msgSend(v22, "internalFlags") & 0xFFFFFFEF;
              objc_msgSend(v22, "setInternalFlags:", v25);
              v53[0] = _NSConcreteStackBlock;
              v53[1] = 3221225472;
              v53[2] = sub_1000C5938;
              v53[3] = &unk_1009171C0;
              v53[4] = v22;
              v53[5] = self;
              objc_msgSend(v22, "setDeviceFoundHandler:", v53);
              v52[0] = _NSConcreteStackBlock;
              v52[1] = 3221225472;
              v52[2] = sub_1000C5958;
              v52[3] = &unk_1009171C0;
              v52[4] = v22;
              v52[5] = self;
              objc_msgSend(v22, "setDeviceLostHandler:", v52);
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = sub_1000C5980;
              v51[3] = &unk_100917058;
              v51[4] = v22;
              v51[5] = self;
              objc_msgSend(v22, "setSystemOverrideHandler:", v51);
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
              objc_msgSend(v26, "reportCBDiscovery:daemonCnx:action:", v22, self, CFSTR("strt"));

              -[CBDaemonServer scheduleSpatialUpdateImmediate:](self->_daemon, "scheduleSpatialUpdateImmediate:", 1);
              v45 = v6;
              Reply = CUXPCDictionaryCreateReply(v6);
              v28 = (void *)objc_claimAutoreleasedReturnValue(Reply);
              if (v28)
              {
                xpc_dictionary_set_int64(v28, "pwrS", -[CBDaemonXPCConnection _powerStateForClient](self, "_powerStateForClient"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "nonConnectableAddressData"));

                objc_msgSend(v12, "setAdvertisingAddressData:", v30);
                if (v30)
                {
                  v31 = objc_retainAutorelease(v30);
                  v32 = v28;
                  v33 = (const char *)objc_msgSend(v31, "bytes");
                  v34 = objc_msgSend(v31, "length");
                  if (!v33)
                    v33 = "";

                  xpc_dictionary_set_data(v32, "aaNC", v33, (size_t)v34);
                }
                v35 = objc_retainAutorelease(v19);
                v36 = v28;
                v37 = (const char *)objc_msgSend(v35, "bytes");
                v38 = objc_msgSend(v35, "length");
                if (!v37)
                  v37 = "";

                xpc_dictionary_set_data(v36, "siTD", v37, (size_t)v38);
                -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v36);
                self->_spatialActivateResponded = 1;
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer deviceMap](self->_daemon, "deviceMap"));
                v50[0] = _NSConcreteStackBlock;
                v50[1] = 3221225472;
                v50[2] = sub_1000C5A08;
                v50[3] = &unk_100917BA8;
                v50[4] = self;
                objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v50);

              }
              else if (dword_100977FD8 <= 90
                     && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
              {
                LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionActivate:]", 90, "### Spatial Activate create reply failed");
              }

              v6 = v45;
            }
            else
            {
              v43 = CBErrorF(v54, "Encode token failed");
              v44 = objc_claimAutoreleasedReturnValue(v43);
              v22 = v66[5];
              v66[5] = (id)v44;
            }

            v7 = v46;
            goto LABEL_39;
          }
        }

        goto LABEL_13;
      }
    }

    goto LABEL_8;
  }
LABEL_40:
  ((void (*)(_QWORD *))v7[2])(v7);

  _Block_object_dispose(&v65, 8);
}

- (void)_xpcCBSpatialInteractionSessionUpdate:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id v8;
  id *v9;
  id v10;
  CBSpatialInteractionSession *v11;
  CBSpatialInteractionSession *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  CBDiscovery *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id obj;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1000624FC;
  v33 = sub_100062338;
  v34 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000C5DB4;
  v26[3] = &unk_100917C98;
  v28 = &v29;
  v26[4] = self;
  v4 = a3;
  v27 = v4;
  v5 = objc_retainBlock(v26);
  v6 = (id *)(v30 + 5);
  obj = (id)v30[5];
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6, obj);
  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc((Class)CBSpatialInteractionSession);
    v9 = (id *)(v30 + 5);
    v24 = (id)v30[5];
    v10 = objc_msgSend(v8, "initWithXPCObject:error:", v4, &v24);
    objc_storeStrong(v9, v24);
    if (v10)
    {
      v11 = self->_activatedSpatialInteractionSession;
      v12 = v11;
      if (v11)
      {
        v13 = -[CBSpatialInteractionSession updateWithSession:](v11, "updateWithSession:", v10);
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          v14 = CUPrintPID(self->_pid);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionUpdate:]", 30, "Spatial Update: %@, from %@", v12, v15);

        }
        v16 = self->_activatedDiscovery;
        if ((-[CBSpatialInteractionSession controlFlags](v12, "controlFlags") & 0x1000) != 0)
          v17 = (unint64_t)-[CBDiscovery discoveryFlags](v16, "discoveryFlags") | 0x2000000;
        else
          v17 = (unint64_t)-[CBDiscovery discoveryFlags](v16, "discoveryFlags") & 0xFFFFFFFFFDFFFFFFLL;
        -[CBDiscovery setDiscoveryFlags:](v16, "setDiscoveryFlags:", v17);
        -[CBDiscovery setBleScanRate:](self->_activatedDiscovery, "setBleScanRate:", -[CBSpatialInteractionSession scanRate](v12, "scanRate"));
        -[CBDiscovery setBleScanRateScreenOff:](self->_activatedDiscovery, "setBleScanRateScreenOff:", -[CBSpatialInteractionSession scanRateScreenOff](v12, "scanRateScreenOff"));
        -[CBDiscovery setBleRSSIThresholdHint:](self->_activatedDiscovery, "setBleRSSIThresholdHint:", -[CBSpatialInteractionSession bleRSSIThresholdHint](v12, "bleRSSIThresholdHint"));
        -[CBDiscovery setBleRSSIThresholdOrder:](self->_activatedDiscovery, "setBleRSSIThresholdOrder:", -[CBSpatialInteractionSession bleRSSIThresholdOrder](v12, "bleRSSIThresholdOrder"));
        if ((-[CBSpatialInteractionSession controlFlags](v12, "controlFlags") & 0x10) != 0)
          v18 = -[CBDiscovery internalFlags](v16, "internalFlags") | 0x10;
        else
          v18 = (unint64_t)-[CBDiscovery internalFlags](v16, "internalFlags") & 0xFFFFFFEF;
        -[CBDiscovery setInternalFlags:](v16, "setInternalFlags:", v18);
        if (v13)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
          objc_msgSend(v19, "reportCBDiscovery:daemonCnx:action:", v16, self, CFSTR("updt"));

          -[CBDaemonServer scheduleSpatialUpdateImmediate:](self->_daemon, "scheduleSpatialUpdateImmediate:", 0);
        }
      }
      else
      {
        v22 = CBErrorF(4294960551, "No session");
        v23 = objc_claimAutoreleasedReturnValue(v22);
        v16 = (CBDiscovery *)v30[5];
        v30[5] = v23;
      }

    }
    else
    {
      v20 = CBErrorF(4294960591, "Decode failed");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v12 = (CBSpatialInteractionSession *)v30[5];
      v30[5] = v21;
    }

  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v29, 8);
}

- (void)_xpcCBSpatialInteractionSessionAddPeerToken:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  unsigned __int8 v7;
  id *v8;
  void *v9;
  void *v10;
  id *v11;
  int v12;
  uint64_t v13;
  char *v14;
  char *v15;
  id v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  char v24;
  unsigned int v25;
  NSMutableDictionary *spatialDeviceMapMatched;
  const char *v27;
  id v28;
  NSMutableArray *spatialPeers;
  NSMutableArray *v30;
  NSMutableArray *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t Reply;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CBSpatialInteractionSession *v46;
  id v47;
  _QWORD *v48;
  id v49;
  _QWORD v50[4];
  unsigned int v51;
  int v52;
  id v53;
  id v54;
  id obj;
  _QWORD v56[5];
  id v57;
  uint64_t *v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v59 = 0;
  v60 = (id *)&v59;
  v61 = 0x3032000000;
  v62 = sub_1000624FC;
  v63 = sub_100062338;
  v64 = 0;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000C63A0;
  v56[3] = &unk_100917C98;
  v58 = &v59;
  v56[4] = self;
  v4 = a3;
  v57 = v4;
  v5 = objc_retainBlock(v56);
  v6 = v60;
  obj = v60[5];
  v48 = v5;
  v7 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((v7 & 1) != 0)
  {
    v8 = v60;
    v54 = v60[5];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonXPCConnection _spatialInteractionDecodePeerTokenRequest:error:](self, "_spatialInteractionDecodePeerTokenRequest:error:", v4, &v54));
    objc_storeStrong(v8 + 5, v54);
    if (!v9)
    {
LABEL_36:

      v5 = v48;
      goto LABEL_37;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "irkData"));
    v11 = v60 + 5;
    v53 = v60[5];
    v65 = 0;
    v12 = CUXPCDecodeUInt64RangedEx(v4, "siPI", 0, 0xFFFFFFFFLL, &v65, &v53);
    if (v12 == 6)
      v13 = v65;
    else
      v13 = 0;
    objc_storeStrong(v11, v53);
    if (v12 == 5)
    {
LABEL_35:

      goto LABEL_36;
    }
    if (!(_DWORD)v13)
    {
      v40 = CBErrorF(4294960591, "No peer ID");
      v41 = objc_claimAutoreleasedReturnValue(v40);
      v47 = v60[5];
      v60[5] = (id)v41;

      goto LABEL_35;
    }
    objc_msgSend(v9, "setPeerID:", v13);
    v46 = self->_activatedSpatialInteractionSession;
    if (v46)
    {
      v14 = (char *)-[NSMutableArray count](self->_spatialPeers, "count");
      v49 = v4;
      v45 = v13;
      if (v14)
      {
        v15 = 0;
        v16 = 0;
        v17 = v14 - 1;
        do
        {
          v18 = objc_autoreleasePoolPush();
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_spatialPeers, "objectAtIndexedSubscript:", v15));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "irkData"));
          v21 = objc_msgSend(v20, "isEqual:", v10);

          if ((v21 & 1) != 0)
          {
            v22 = v19;

            -[NSMutableArray setObject:atIndexedSubscript:](self->_spatialPeers, "setObject:atIndexedSubscript:", v9, v15);
            v16 = v22;
          }

          objc_autoreleasePoolPop(v18);
          if (v17 == v15++)
            v24 = 1;
          else
            v24 = v21;
        }
        while ((v24 & 1) == 0);
        v4 = v49;
        if (v16)
        {
          v25 = objc_msgSend(v16, "peerID");
          spatialDeviceMapMatched = self->_spatialDeviceMapMatched;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1000C6468;
          v50[3] = &unk_100919298;
          v51 = v25;
          v52 = v45;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](spatialDeviceMapMatched, "enumerateKeysAndObjectsUsingBlock:", v50);
          v27 = "replaced";
LABEL_23:
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierData"));
          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "irkData"));
            v34 = CUPrintNSObjectMasked(v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            v36 = CUPrintPID(self->_pid);
            v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionAddPeerToken:]", 30, "Spatial AddPeerToken: ID <%@>, IRK %@, PeerID 0x%X, from %@, %s", v32, v35, v45, v37, v27);

          }
          v4 = v49;
          Reply = CUXPCDictionaryCreateReply(v49);
          v39 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v39)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v39);
          }
          else if (dword_100977FD8 <= 90
                 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionAddPeerToken:]", 90, "### Spatial AddPeerToken create reply failed");
          }
          -[CBDaemonXPCConnection _spatialInteractionReevaluateDevices](self, "_spatialInteractionReevaluateDevices");

          goto LABEL_34;
        }
      }
      v28 = -[NSMutableArray count](self->_spatialPeers, "count");
      if ((unint64_t)v28 < 0x1E)
      {
        spatialPeers = self->_spatialPeers;
        if (!spatialPeers)
        {
          v30 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          v31 = self->_spatialPeers;
          self->_spatialPeers = v30;

          spatialPeers = self->_spatialPeers;
        }
        -[NSMutableArray addObject:](spatialPeers, "addObject:", v9);
        v16 = 0;
        v27 = "added";
        goto LABEL_23;
      }
      v44 = CBErrorF(312901, "Too many peer tokens (%d)", (_DWORD)v28);
      v43 = objc_claimAutoreleasedReturnValue(v44);
    }
    else
    {
      v42 = CBErrorF(4294960551, "No session");
      v43 = objc_claimAutoreleasedReturnValue(v42);
    }
    v16 = v60[5];
    v60[5] = (id)v43;
LABEL_34:

    goto LABEL_35;
  }
LABEL_37:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v59, 8);
}

- (void)_xpcCBSpatialInteractionSessionRemovePeerToken:(id)a3
{
  id v4;
  id *v5;
  unsigned __int8 v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t Reply;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  CBSpatialInteractionSession *v35;
  _QWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id obj;
  _QWORD v43[5];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];

  v46 = 0;
  v47 = (id *)&v46;
  v48 = 0x3032000000;
  v49 = sub_1000624FC;
  v50 = sub_100062338;
  v51 = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000C697C;
  v43[3] = &unk_100917C98;
  v45 = &v46;
  v43[4] = self;
  v4 = a3;
  v44 = v4;
  v36 = objc_retainBlock(v43);
  v5 = v47;
  obj = v47[5];
  v6 = -[CBDaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v5 + 5, obj);
  if ((v6 & 1) != 0)
  {
    v7 = v47 + 5;
    v41 = v47[5];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonXPCConnection _spatialInteractionDecodePeerTokenRequest:error:](self, "_spatialInteractionDecodePeerTokenRequest:error:", v4, &v41));
    objc_storeStrong(v7, v41);
    if (!v8)
    {
LABEL_32:

      goto LABEL_33;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "irkData"));
    v35 = self->_activatedSpatialInteractionSession;
    if (v35)
    {
      v10 = -[NSMutableArray count](self->_spatialPeers, "count");
      if (v10)
      {
        v11 = 0;
        while (1)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_spatialPeers, "objectAtIndexedSubscript:", v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "irkData"));
          v14 = objc_msgSend(v13, "isEqual:", v9);

          if ((v14 & 1) != 0)
            break;

          if (v10 == (id)++v11)
            goto LABEL_8;
        }
        v17 = v12;
        -[NSMutableArray removeObjectAtIndex:](self->_spatialPeers, "removeObjectAtIndex:", v11);

        if (v17)
        {
          v18 = objc_msgSend(v17, "peerID");
          if (dword_100977FD8 <= 30
            && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifierData"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "irkData"));
            v20 = CUPrintNSObjectMasked(v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            v22 = CUPrintPID(self->_pid);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionRemovePeerToken:]", 30, "Spatial RemovePeerToken: ID <%@>, IRK %@, PeerID 0x%X, from %@", v33, v21, v18, v23);

          }
          Reply = CUXPCDictionaryCreateReply(v4);
          v25 = (void *)objc_claimAutoreleasedReturnValue(Reply);
          if (v25)
          {
            -[CBDaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v25);
          }
          else if (dword_100977FD8 <= 90
                 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 90)))
          {
            LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _xpcCBSpatialInteractionSessionRemovePeerToken:]", 90, "### Spatial RemovePeerToken create reply failed");
          }
          v32 = v8;
          v34 = v4;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_spatialDeviceMapMatched, "allValues"));
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(_QWORD *)v38 != v28)
                  objc_enumerationMutation(v26);
                v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v30, "spatialInteractionPeerID") == (_DWORD)v18)
                  -[CBDaemonXPCConnection _spatialInteractionDeviceLost:removeUnmatched:reason:](self, "_spatialInteractionDeviceLost:removeUnmatched:reason:", v30, 0, "removed token");
              }
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
            }
            while (v27);
          }

          v8 = v32;
          v4 = v34;

          goto LABEL_31;
        }
      }
LABEL_8:
      v15 = CBErrorF(4294960569, "Peer token not found");
      v16 = objc_claimAutoreleasedReturnValue(v15);
    }
    else
    {
      v31 = CBErrorF(4294960551, "No session");
      v16 = objc_claimAutoreleasedReturnValue(v31);
    }
    v17 = v47[5];
    v47[5] = (id)v16;
LABEL_31:

    goto LABEL_32;
  }
LABEL_33:
  ((void (*)(_QWORD *))v36[2])(v36);

  _Block_object_dispose(&v46, 8);
}

- (void)_spatialInteractionDeviceFound:(id)a3 checkOnly:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  const char *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  char v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  _WORD *v48;
  __int16 v49;
  _BYTE *v50;
  char v51;
  id v52;
  id v53;
  uint64_t v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned __int16 *v60;
  _BOOL4 v62;
  id v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  id v80;
  void *v81;
  char v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  unsigned int v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  unsigned __int8 v97;
  id v98;
  id v99;
  void *v100;
  unsigned __int8 v101;
  void *v102;
  NSMutableDictionary *spatialDeviceMapMatched;
  NSMutableDictionary *v104;
  NSMutableDictionary *v105;
  id v106;
  NSObject *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSMutableDictionary *spatialDeviceMapUnmatched;
  NSMutableDictionary *v115;
  NSMutableDictionary *v116;
  id v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  unsigned int v128;
  uint64_t v129;
  void *v130;
  int v131;
  BOOL v132;
  void *v133;
  CBSpatialInteractionSession *v134;
  uint64_t v135;
  NSMutableArray *v136;
  void *v137;
  void *v138;
  id v139;
  id v140;
  void *context;
  uint64_t v142;
  id v143;
  CBDaemonXPCConnection *v144;
  id v145;
  int v146;
  int v147;
  void *v148;
  void *v149;
  void *v150;
  id obj;
  char obja;
  id v153;
  int v154;
  id v155;
  id v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint8_t v173[128];
  uint8_t buf[4];
  uint64_t v175;
  __int16 v176;
  id v177;
  __int16 v178;
  uint64_t v179;
  __int16 v180;
  const char *v181;
  __int16 v182;
  id v183;
  _BYTE v184[128];
  unint64_t v185;
  uint64_t v186;
  char v187;
  _BYTE v188[128];
  _BYTE v189[128];

  v153 = a3;
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "identifier"));
  if (!v133)
    goto LABEL_150;
  v139 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "btAddressData"));
  if (objc_msgSend(v139, "length") != (id)6)
    goto LABEL_149;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "spatialInteractionIdentifiers"));
  v134 = self->_activatedSpatialInteractionSession;
  v144 = self;
  v138 = v6;
  v132 = a4;
  if ((-[CBSpatialInteractionSession controlFlags](v134, "controlFlags") & 0x3E0) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    if (objc_msgSend(v7, "length") == (id)3)
    {
      v171 = 0u;
      v172 = 0u;
      v169 = 0u;
      v170 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[CBDaemonServer identityArray](self->_daemon, "identityArray"));
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v189, 16);
      if (v8)
      {
        v9 = v8;
        v154 = 0;
        v10 = 0;
        v11 = *(_QWORD *)v170;
        v149 = v7;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v170 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * (_QWORD)v12);
            v14 = objc_autoreleasePoolPush();
            if ((objc_msgSend(v13, "verifyAuthTag:data:type:error:", v7, v139, 2, 0) & 1) != 0)
            {
              objc_msgSend(v153, "setInternalFlags:", objc_msgSend(v153, "internalFlags") | 8);
              objc_msgSend(v153, "updateWithRPIdentity:", v13);
              v15 = -[CBSpatialInteractionSession matchesWithDevice:](v134, "matchesWithDevice:", v153);
              if (self->_isHomePod)
              {
                v16 = sub_1000C78AC();
                v17 = objc_claimAutoreleasedReturnValue(v16);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v28 = "no";
                  if (v15)
                    v28 = "yes";
                  v175 = (uint64_t)v28;
                  v176 = 2112;
                  v177 = v153;
                  v178 = 2112;
                  v179 = (uint64_t)v13;
                  _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Spatial found match sys: match %s, %@, %@", buf, 0x20u);
                }

                v7 = v149;
              }
              else if (dword_100977FD8 <= 20
                     && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 20)))
              {
                v20 = "no";
                if (v15)
                  v20 = "yes";
                LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]", 20, "Spatial found match sys: match %s, %@, %@", v20, v153, v13);
              }
              v27 = v154;
              if (v15)
                v27 = 1;
              v154 = v27;
              if (v15)
                v10 = 1;
            }
            else if (self->_isHomePod)
            {
              v18 = sub_1000C78AC();
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                v29 = objc_retainAutorelease(v139);
                v30 = CUPrintHex(objc_msgSend(v29, "bytes"), objc_msgSend(v29, "length"), 32, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceIRKData"));
                v33 = CUPrintNSObjectMasked(v32);
                v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                *(_DWORD *)buf = 138413058;
                v175 = (uint64_t)v31;
                v176 = 2112;
                v177 = v34;
                v178 = 2112;
                v179 = (uint64_t)v153;
                v180 = 2112;
                v181 = (const char *)v13;
                _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Spatial found check sys: SRC <%@>, IRK %@, match no, %@, %@", buf, 0x2Au);

                v7 = v149;
                self = v144;

              }
            }
            else if (dword_100977FD8 <= 5
                   && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 5)))
            {
              v21 = objc_retainAutorelease(v139);
              v22 = CUPrintHex(objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"), 32, 0);
              v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceIRKData"));
              v25 = CUPrintNSObjectMasked(v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]", 5, "Spatial found check sys: SRC <%@>, IRK %@, match no, %@, %@", v23, v26, v153, v13);

              v7 = v149;
              self = v144;
            }
            objc_autoreleasePoolPop(v14);
            v12 = (char *)v12 + 1;
          }
          while (v9 != v12);
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v189, 16);
          v9 = v35;
        }
        while (v35);
      }
      else
      {
        LOBYTE(v154) = 0;
        v10 = 0;
      }

      v6 = v138;
      v36 = v154;
    }
    else
    {
      v36 = 0;
      v10 = 0;
    }

    v146 = v36 & 1;
    v131 = v10 & 1;
  }
  else
  {
    v146 = 0;
    v131 = 0;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession identifierData](v134, "identifierData"));
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v38 = self->_spatialPeers;
  v137 = v37;
  v140 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v165, v188, 16);
  if (!v140)
  {
    obja = 0;
    goto LABEL_92;
  }
  obja = 0;
  v39 = *(_QWORD *)v166;
  v135 = *(_QWORD *)v166;
  v136 = v38;
  do
  {
    v40 = 0;
    do
    {
      if (*(_QWORD *)v166 != v39)
      {
        v41 = v40;
        objc_enumerationMutation(v38);
        v40 = v41;
      }
      v142 = v40;
      v42 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * v40);
      context = objc_autoreleasePoolPush();
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifierData"));
      v44 = (void *)v43;
      if (v43)
        v45 = (void *)v43;
      else
        v45 = v37;
      v46 = v45;

      v143 = v46;
      if (objc_msgSend(v46, "length") != (id)3)
        goto LABEL_88;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "irkData"));
      if (objc_msgSend(v47, "length") != (id)16)
        goto LABEL_87;
      v187 = 0;
      v186 = 0;
      v48 = objc_msgSend(objc_retainAutorelease(v139), "bytes");
      v49 = v48[2];
      LODWORD(v186) = *(_DWORD *)v48;
      WORD2(v186) = v49;
      v50 = objc_msgSend(objc_retainAutorelease(v46), "bytes");
      v51 = v50[2];
      HIWORD(v186) = *(_WORD *)v50;
      v187 = v51;
      v145 = objc_retainAutorelease(v47);
      v185 = bswap64(SipHash(objc_msgSend(v145, "bytes"), &v186, 9));
      v161 = 0u;
      v162 = 0u;
      v163 = 0u;
      v164 = 0u;
      v155 = v6;
      v52 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v161, v184, 16);
      if (!v52)
      {
        v55 = v146;
        goto LABEL_86;
      }
      v53 = v52;
      v150 = v42;
      v54 = *(_QWORD *)v162;
      v55 = v146;
      do
      {
        v56 = 0;
        do
        {
          v57 = v47;
          if (*(_QWORD *)v162 != v54)
            objc_enumerationMutation(v155);
          v58 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)v56);
          v59 = objc_autoreleasePoolPush();
          if (objc_msgSend(v58, "length") == (id)3)
          {
            v60 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v58), "bytes");
            v62 = (unsigned __int16)v185 != *v60 || BYTE2(v185) != *((unsigned __int8 *)v60 + 2);
            if (self->_isHomePod)
            {
              v63 = sub_1000C78AC();
              v64 = objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v72 = CUPrintHex(&v186, 9, 32, 0);
                v73 = objc_claimAutoreleasedReturnValue(v72);
                v148 = (void *)v73;
                v74 = CUPrintNSObjectMasked(v145);
                v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
                v76 = CUPrintHex(&v185, 3, 32, 0);
                v77 = objc_claimAutoreleasedReturnValue(v76);
                *(_DWORD *)buf = 138413314;
                v78 = "no";
                if (!v62)
                  v78 = "yes";
                v175 = v73;
                v176 = 2112;
                v177 = v75;
                v178 = 2112;
                v179 = v77;
                v79 = (void *)v77;
                v180 = 2080;
                v181 = v78;
                v182 = 2112;
                v183 = v153;
                _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Spatial found check token: SRC <%@>, IRK %@, Hash <%@>, match %s, %@", buf, 0x34u);

                self = v144;
              }
              goto LABEL_69;
            }
            if (dword_100977FD8 <= 10
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 10)))
            {
              v65 = CUPrintHex(&v186, 9, 32, 0);
              v64 = objc_claimAutoreleasedReturnValue(v65);
              v66 = CUPrintNSObjectMasked(v145);
              v147 = v55;
              v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
              v68 = CUPrintHex(&v185, 3, 32, 0);
              v69 = objc_claimAutoreleasedReturnValue(v68);
              v70 = (void *)v69;
              v71 = "no";
              if (!v62)
                v71 = "yes";
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]", 10, "Spatial found check token: SRC <%@>, IRK %@, Hash <%@>, match %s, %@", v64, v67, v69, v71, v153);

              self = v144;
              v55 = v147;
LABEL_69:

            }
            if (!v62)
            {
              objc_msgSend(v153, "setSpatialInteractionPeerID:", objc_msgSend(v150, "peerID"));
              v55 = 1;
              obja = 1;
            }
          }
          objc_autoreleasePoolPop(v59);
          v56 = (char *)v56 + 1;
          v47 = v57;
        }
        while (v53 != v56);
        v80 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v161, v184, 16);
        v53 = v80;
      }
      while (v80);
LABEL_86:
      v146 = v55;

      v37 = v137;
      v6 = v138;
      v39 = v135;
      v38 = v136;
LABEL_87:

LABEL_88:
      objc_autoreleasePoolPop(context);
      v40 = v142 + 1;
    }
    while ((id)(v142 + 1) != v140);
    v140 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v165, v188, 16);
  }
  while (v140);
LABEL_92:

  v81 = v6;
  v82 = obja;
  if (v132)
    goto LABEL_148;
  if ((v146 & 1) == 0)
  {
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_spatialDeviceMapMatched, "objectForKeyedSubscript:", v133));
    if (v102)
    {
      -[CBDaemonXPCConnection _spatialInteractionDeviceLost:removeUnmatched:reason:](self, "_spatialInteractionDeviceLost:removeUnmatched:reason:", v102, 0, "no match");
    }
    else
    {
      spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      if (!spatialDeviceMapUnmatched)
      {
        v115 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v116 = self->_spatialDeviceMapUnmatched;
        self->_spatialDeviceMapUnmatched = v115;

        spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](spatialDeviceMapUnmatched, "setObject:forKeyedSubscript:", v153, v133);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_spatialDeviceMapMatched, "setObject:forKeyedSubscript:", 0, v133);
      if (self->_isHomePod)
      {
        v117 = sub_1000C78AC();
        v118 = objc_claimAutoreleasedReturnValue(v117);
        v82 = obja;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          sub_1006CE664((uint64_t)v153, v118, v119, v120, v121, v122, v123, v124);

      }
      else
      {
        v82 = obja;
        if (dword_100977FD8 <= 30
          && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
        {
          LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]", 30, "Spatial found no match device: %@", v153);
        }
      }
    }
    goto LABEL_140;
  }
  v83 = v153;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_spatialDeviceMapMatched, "allValues"));
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v157, v173, 16);
  if (!v85)
  {

    v37 = v137;
    v81 = v138;
    goto LABEL_118;
  }
  v86 = v85;
  v87 = *(_QWORD *)v158;
  v156 = v83;
  while (2)
  {
    v88 = 0;
    while (2)
    {
      if (*(_QWORD *)v158 != v87)
        objc_enumerationMutation(v84);
      v89 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v88);
      v90 = objc_autoreleasePoolPush();
      v91 = objc_msgSend(v89, "spatialInteractionPeerID");
      if (v91 == objc_msgSend(v83, "spatialInteractionPeerID"))
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "idsDeviceID"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "idsDeviceID"));
        v94 = v92;
        v95 = v93;
        if (v94 != v95)
        {
          v96 = v95;
          if ((v94 == 0) == (v95 != 0))
          {

          }
          else
          {
            v97 = objc_msgSend(v94, "isEqual:", v95);

            self = v144;
            if ((v97 & 1) == 0)
              goto LABEL_111;
LABEL_105:
            v98 = objc_msgSend(v89, "lastSeenTicks");
            if (v98 > objc_msgSend(v83, "lastSeenTicks"))
            {
              v99 = v89;

              v156 = v99;
              goto LABEL_111;
            }
            v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "identifier"));
            v101 = objc_msgSend(v100, "isEqual:", v133);

            if ((v101 & 1) == 0)
            {
              self = v144;
              -[CBDaemonXPCConnection _spatialInteractionDeviceLost:removeUnmatched:reason:](v144, "_spatialInteractionDeviceLost:removeUnmatched:reason:", v89, 1, "replaced matched");
              goto LABEL_111;
            }
          }
          self = v144;
          goto LABEL_111;
        }

        self = v144;
        goto LABEL_105;
      }
LABEL_111:
      v82 = obja;
      objc_autoreleasePoolPop(v90);
      if (v86 != (id)++v88)
        continue;
      break;
    }
    v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v157, v173, 16);
    if (v86)
      continue;
    break;
  }

  v102 = v156;
  v37 = v137;
  v81 = v138;
  if (v156 == v83)
  {
LABEL_118:
    spatialDeviceMapMatched = self->_spatialDeviceMapMatched;
    if (!spatialDeviceMapMatched)
    {
      v104 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v105 = self->_spatialDeviceMapMatched;
      self->_spatialDeviceMapMatched = v104;

      spatialDeviceMapMatched = self->_spatialDeviceMapMatched;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](spatialDeviceMapMatched, "setObject:forKeyedSubscript:", v83, v133);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_spatialDeviceMapUnmatched, "setObject:forKeyedSubscript:", 0, v133);
    if (self->_isHomePod)
    {
      v106 = sub_1000C78AC();
      v107 = objc_claimAutoreleasedReturnValue(v106);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
        sub_1006CE600((uint64_t)v83, v107, v108, v109, v110, v111, v112, v113);

      v82 = obja;
    }
    else
    {
      v82 = obja;
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:]", 30, "Spatial found device: %@", v83);
      }
    }
    v125 = objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession deviceFoundHandler](v134, "deviceFoundHandler"));
    v126 = (void *)v125;
    if (v125)
      (*(void (**)(uint64_t, id))(v125 + 16))(v125, v83);

    v102 = v83;
  }
LABEL_140:

  if (IsAppleInternalBuild(v127))
  {
    if (v131)
      v128 = 2;
    else
      v128 = 1;
    if ((v82 & 1) != 0)
      v129 = 4;
    else
      v129 = v128;
    v130 = objc_autoreleasePoolPush();
    -[CBDaemonXPCConnection _updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:device:](self, "_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:device:", v129, v153);
    objc_autoreleasePoolPop(v130);
  }
LABEL_148:

LABEL_149:
LABEL_150:

}

- (void)_spatialInteractionDeviceLost:(id)a3 removeUnmatched:(BOOL)a4 reason:(const char *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableDictionary *spatialDeviceMapUnmatched;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_spatialDeviceMapMatched, "objectForKeyedSubscript:", v9));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_spatialDeviceMapMatched, "setObject:forKeyedSubscript:", 0, v9);
    if (a4)
    {
      v11 = -[NSMutableDictionary setObject:forKeyedSubscript:](self->_spatialDeviceMapUnmatched, "setObject:forKeyedSubscript:", 0, v9);
      if (!v10)
        goto LABEL_22;
    }
    else
    {
      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
      spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      if (!spatialDeviceMapUnmatched)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v14 = self->_spatialDeviceMapUnmatched;
        self->_spatialDeviceMapUnmatched = v13;

        spatialDeviceMapUnmatched = self->_spatialDeviceMapUnmatched;
      }
      v11 = -[NSMutableDictionary setObject:forKeyedSubscript:](spatialDeviceMapUnmatched, "setObject:forKeyedSubscript:", v10, v9);
    }
    if (self->_isHomePod)
    {
      v15 = sub_1000C78AC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        sub_1006CE6C8((uint64_t)v8, (uint64_t)a5, v16);

    }
    else if (dword_100977FD8 <= 30)
    {
      if (dword_100977FD8 != -1 || (v11 = (id)_LogCategory_Initialize(&dword_100977FD8, 30), (_DWORD)v11))
        v11 = (id)LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _spatialInteractionDeviceLost:removeUnmatched:reason:]", 30, "Spatial lost device: %@ (%s)", v8, a5);
    }
    if (IsAppleInternalBuild(v11))
    {
      v17 = objc_autoreleasePoolPush();
      -[CBDaemonXPCConnection _updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:device:](self, "_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:device:", 8, v8);
      objc_autoreleasePoolPop(v17);
    }
    v18 = objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession deviceLostHandler](self->_activatedSpatialInteractionSession, "deviceLostHandler"));
    v19 = (void *)v18;
    if (v18)
      (*(void (**)(uint64_t, id))(v18 + 16))(v18, v8);

    goto LABEL_22;
  }
LABEL_23:

}

- (void)_spatialInteractionReevaluateDevices
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *m;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  if (dword_100977FD8 <= 30 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _spatialInteractionReevaluateDevices]", 30, "Spatial re-evaluate devices: %d matched, %d unmatched", -[NSMutableDictionary count](self->_spatialDeviceMapMatched, "count"), -[NSMutableDictionary count](self->_spatialDeviceMapUnmatched, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_spatialDeviceMapMatched, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_spatialDeviceMapUnmatched, "allValues"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v11 = objc_autoreleasePoolPush();
        -[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:](self, "_spatialInteractionDeviceFound:checkOnly:", v10, 1);
        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v7);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
        v18 = objc_autoreleasePoolPush();
        -[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:](self, "_spatialInteractionDeviceFound:checkOnly:", v17, 1);
        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v14);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = v5;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k);
        v25 = objc_autoreleasePoolPush();
        -[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:](self, "_spatialInteractionDeviceFound:checkOnly:", v24, 0);
        objc_autoreleasePoolPop(v25);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v21);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v12;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      for (m = 0; m != v28; m = (char *)m + 1)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)m);
        v32 = objc_autoreleasePoolPush();
        -[CBDaemonXPCConnection _spatialInteractionDeviceFound:checkOnly:](self, "_spatialInteractionDeviceFound:checkOnly:", v31, 0);
        objc_autoreleasePoolPop(v32);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v28);
  }

}

- (id)_spatialInteractionDecodePeerTokenRequest:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t CFDataOfLength;
  void *v8;
  uint64_t v9;
  void *v10;
  CBSpatialInteractionPeerInfoDaemon *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  id v20;

  v20 = 0;
  if (!CUXPCDecodeNSData(a3, "siTD", &v20, a4))
    goto LABEL_12;
  if (!v20)
  {
    if (a4)
    {
      v13 = CBErrorF(312900, "No token data");
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
      goto LABEL_9;
    }
LABEL_12:
    v11 = 0;
    goto LABEL_9;
  }
  v19 = 0;
  v5 = (void *)OPACKDecodeData(v20, 8, &v19);
  if (!v5)
  {
    if (a4)
    {
      v14 = CUPrintErrorCode(v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = CBErrorF(312900, "Decode token failed: %@", v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v16);

    }
LABEL_17:
    v11 = 0;
    goto LABEL_8;
  }
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    CFDataOfLength = CFDictionaryGetCFDataOfLength(v5, &off_100960538, 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
    v9 = CFDictionaryGetCFDataOfLength(v5, &off_100960520, 16, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      v11 = objc_alloc_init(CBSpatialInteractionPeerInfoDaemon);
      -[CBSpatialInteractionPeerInfoDaemon setIdentifierData:](v11, "setIdentifierData:", v8);
      -[CBSpatialInteractionPeerInfoDaemon setIrkData:](v11, "setIrkData:", v10);
      -[CBSpatialInteractionPeerInfoDaemon setTokenData:](v11, "setTokenData:", v20);
    }
    else if (a4)
    {
      v18 = CBErrorF(312900, "Bad IRK length");
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_8;
  }
  if (!a4)
    goto LABEL_17;
  v17 = CBErrorF(312900, "Non-dict token");
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(v17);
LABEL_8:

LABEL_9:
  return v11;
}

- (void)_updateDeviceMapSpatialInteractionDeviceTimestampArrayDictionary:(unsigned __int8)a3 device:(id)a4
{
  int v4;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v13;
  char v14;

  v4 = a3;
  v6 = a4;
  v7 = -[CBSpatialInteractionSession clientID](self->_activatedSpatialInteractionSession, "clientID");
  if (v4 && v6 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer deviceMap](self->_daemon, "deviceMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

    if (v10)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C8114;
      block[3] = &unk_1009192C0;
      block[4] = self;
      v13 = v10;
      v14 = v4;
      dispatch_async(dispatchQueue, block);

    }
  }

}

- (void)_xpcAdvertisingAddressChanged
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  const char *v16;
  id v17;

  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v17, "mTyp", "AdAC");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectableAddressData"));
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v17;
    v8 = (const char *)objc_msgSend(v6, "bytes");
    if (v8)
      v9 = v8;
    else
      v9 = "";
    xpc_dictionary_set_data(v7, "aaCN", v9, (size_t)objc_msgSend(v6, "length"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer addressMonitor](self->_daemon, "addressMonitor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nonConnectableAddressData"));
  v12 = v11;
  if (v11)
  {
    v13 = objc_retainAutorelease(v11);
    v14 = v17;
    v15 = (const char *)objc_msgSend(v13, "bytes");
    if (v15)
      v16 = v15;
    else
      v16 = "";
    xpc_dictionary_set_data(v14, "aaNC", v16, (size_t)objc_msgSend(v13, "length"));

  }
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v17);

}

- (void)_xpcDeviceLost:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "DvLo");
  objc_msgSend(v4, "encodeWithXPCObject:", v5);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_xpcDevicesBuffered:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "DsBf");
  CUXPCEncodeNSArrayOfObjects(v5, "devA", v4);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_xpcDiscoverableStateChanged:(int)a3
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "DscC");
  xpc_dictionary_set_int64(xdict, "dsSt", a3);
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);

}

- (void)_xpcInquiryStateChanged:(int)a3
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "InqC");
  xpc_dictionary_set_int64(xdict, "inqS", a3);
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);

}

- (void)_xpcPowerStateChanged:(int64_t)a3
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "PwrC");
  xpc_dictionary_set_int64(xdict, "pwrS", a3);
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);

}

- (void)xpcReceivedAudioAccessoryEventType:(unsigned __int8)a3 messageData:(id)a4 sourceDevice:(id)a5
{
  unsigned int v6;
  id v8;
  xpc_object_t v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  id v15;
  id v16;

  v6 = a3;
  v16 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "mTyp", "AcRc");
  if (v6)
    xpc_dictionary_set_uint64(v9, "acET", v6);
  if (v16)
  {
    v10 = objc_retainAutorelease(v16);
    v11 = v9;
    v12 = v10;
    v13 = (const char *)objc_msgSend(v12, "bytes");
    if (v13)
      v14 = v13;
    else
      v14 = "";
    v15 = objc_msgSend(v12, "length");

    xpc_dictionary_set_data(v11, "acMd", v14, (size_t)v15);
  }
  CUXPCEncodeObject(v9, "srcD", v8, 0);
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v9);

}

- (void)xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  xpc_object_t xdict;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "AcIC");
  xpc_dictionary_set_value(xdict, "aaID", v5);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);
}

- (void)_xpcReceivedRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 sourceDevice:(id)a6
{
  unsigned int v8;
  id v10;
  id v11;
  xpc_object_t v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  const char *v17;
  id v18;
  id v19;

  v8 = a3;
  v19 = a4;
  v10 = a5;
  v11 = a6;
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "mTyp", "RlMR");
  if (v8)
    xpc_dictionary_set_uint64(v12, "rlMT", v8);
  if (v19)
  {
    v13 = objc_retainAutorelease(v19);
    v14 = v12;
    v15 = v13;
    v16 = (const char *)objc_msgSend(v15, "bytes");
    if (v16)
      v17 = v16;
    else
      v17 = "";
    v18 = objc_msgSend(v15, "length");

    xpc_dictionary_set_data(v14, "rlMD", v17, (size_t)v18);
  }
  CUXPCEncodeObject(v12, "cduD", v10, 0);
  CUXPCEncodeObject(v12, "srcD", v11, 0);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v12);
}

- (void)_xpcSpatialInteractionAOPDataReceived:(id)a3
{
  xpc_object_t v4;
  id v5;
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  id v10;
  id v11;

  v11 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "mTyp", "SpAD");
  if (v11)
  {
    v5 = objc_retainAutorelease(v11);
    v6 = v4;
    v7 = v5;
    v8 = (const char *)objc_msgSend(v7, "bytes");
    if (v8)
      v9 = v8;
    else
      v9 = "";
    v10 = objc_msgSend(v7, "length");

    xpc_dictionary_set_data(v6, "siAD", v9, (size_t)v10);
  }
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v4);

}

- (void)_xpcSystemOverrideChanged
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(xdict, "mTyp", "SyOC");
  xpc_dictionary_set_int64(xdict, "scRO", (int)-[CBDiscovery bleScanRateOverride](self->_activatedDiscovery, "bleScanRateOverride"));
  xpc_dictionary_set_uint64(xdict, "syOF", -[CBDiscovery systemOverrideFlags](self->_activatedDiscovery, "systemOverrideFlags"));
  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", xdict);

}

- (void)_xpcTipiChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "TpiC");
  CUXPCEncodeObject(v5, "devi", v4, 0);

  -[CBDaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_setupWHBTimer
{
  OS_dispatch_source **p_whbTimer;
  OS_dispatch_source *v4;
  dispatch_source_t v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *whbLostDevicesMap;
  void **v8;
  uint64_t v9;
  _QWORD *(*v10)(uint64_t);
  void *v11;
  OS_dispatch_source *v12;
  CBDaemonXPCConnection *v13;

  if (!self->_activatedDiscoveryWHB)
  {
    p_whbTimer = &self->_whbTimer;
    v4 = self->_whbTimer;
    if (!v4)
    {
      v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)p_whbTimer, v5);
      v8 = _NSConcreteStackBlock;
      v9 = 3221225472;
      v10 = sub_1000C8D4C;
      v11 = &unk_100917058;
      v4 = v5;
      v12 = v4;
      v13 = self;
      dispatch_source_set_event_handler((dispatch_source_t)v4, &v8);
      CUDispatchTimerSet(self->_whbTimer, 5.0, -1.0, 1.0);
      dispatch_activate((dispatch_object_t)self->_whbTimer);
      if (dword_100977FD8 <= 30
        && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
      {
        LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _setupWHBTimer]", 30, "WHBTimer successfully setup", v8, v9, v10, v11);
      }

    }
    if (!self->_whbLostDevicesMap)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      whbLostDevicesMap = self->_whbLostDevicesMap;
      self->_whbLostDevicesMap = v6;

    }
  }
}

- (void)_whbTimerFired
{
  CBDiscovery *activatedDiscovery;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  OS_dispatch_source *whbTimer;
  CBDiscovery *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (dword_100977FD8 <= 20 && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 20)))
    LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _whbTimerFired]", 20, "WHBTimer fired");
  activatedDiscovery = self->_activatedDiscovery;
  if (activatedDiscovery)
  {
    v18 = activatedDiscovery;
  }
  else
  {
    v18 = self->_activatedDiscoveryWHB;
    if (!v18)
      return;
  }
  v4 = mach_absolute_time();
  v5 = UpTicksToSeconds(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_whbLostDevicesMap, "allKeys"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_whbLostDevicesMap, "objectForKeyedSubscript:", v11));
        v13 = v12;
        if (v12 && (unint64_t)(v5 - (_QWORD)objc_msgSend(v12, "unsignedLongLongValue")) >= 0x2D)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v11));
          if (v14)
          {
            if (dword_100977FD8 <= 30
              && (dword_100977FD8 != -1 || _LogCategory_Initialize(&dword_100977FD8, 30)))
            {
              LogPrintF_safe(&dword_100977FD8, "-[CBDaemonXPCConnection _whbTimerFired]", 30, "WHB lost timer expired for device: %@. Marked as lost", v14);
            }
            v15 = objc_claimAutoreleasedReturnValue(-[CBDiscovery deviceLostHandler](v18, "deviceLostHandler"));
            v16 = (void *)v15;
            if (v15)
              (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v14);

            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v11);
          }
          -[NSMutableDictionary removeObjectForKey:](self->_whbLostDevicesMap, "removeObjectForKey:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  whbTimer = self->_whbTimer;
  if (whbTimer)
    CUDispatchTimerSet(whbTimer, 5.0, -1.0, 1.0);

}

- (void)whbStop
{
  OS_dispatch_source *whbTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  whbTimer = self->_whbTimer;
  if (whbTimer)
  {
    v5 = whbTimer;
    dispatch_source_cancel(v5);
    v4 = self->_whbTimer;
    self->_whbTimer = 0;

  }
}

- (void)setActivatedAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_activatedAdvertiser, a3);
}

- (CBConnection)activatedConnection
{
  return self->_activatedConnection;
}

- (void)setActivatedConnection:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConnection, a3);
}

- (CBController)activatedController
{
  return self->_activatedController;
}

- (void)setActivatedController:(id)a3
{
  objc_storeStrong((id *)&self->_activatedController, a3);
}

- (void)setActivatedDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_activatedDiscovery, a3);
}

- (CBDiscovery)activatedDiscoveryWHB
{
  return self->_activatedDiscoveryWHB;
}

- (void)setActivatedDiscoveryWHB:(id)a3
{
  objc_storeStrong((id *)&self->_activatedDiscoveryWHB, a3);
}

- (void)setActivatedSpatialInteractionSession:(id)a3
{
  objc_storeStrong((id *)&self->_activatedSpatialInteractionSession, a3);
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMap, a3);
}

- (CBDaemonServer)daemon
{
  return self->_daemon;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (BOOL)remoteAccepted
{
  return self->_remoteAccepted;
}

- (void)setRemoteAccepted:(BOOL)a3
{
  self->_remoteAccepted = a3;
}

- (RPCompanionLinkClient)remoteClient
{
  return self->_remoteClient;
}

- (void)setRemoteClient:(id)a3
{
  objc_storeStrong((id *)&self->_remoteClient, a3);
}

- (NSNumber)remoteClientID
{
  return self->_remoteClientID;
}

- (void)setRemoteClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (unint64_t)xpcToken
{
  return self->_xpcToken;
}

- (void)setXpcToken:(unint64_t)a3
{
  self->_xpcToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_remoteClientID, 0);
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_activatedSpatialInteractionSession, 0);
  objc_storeStrong((id *)&self->_activatedDiscoveryWHB, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
  objc_storeStrong((id *)&self->_activatedController, 0);
  objc_storeStrong((id *)&self->_activatedConnection, 0);
  objc_storeStrong((id *)&self->_activatedAdvertiser, 0);
  objc_storeStrong((id *)&self->_whbTimer, 0);
  objc_storeStrong((id *)&self->_whbLostDevicesMap, 0);
  objc_storeStrong((id *)&self->_spatialPeers, 0);
  objc_storeStrong((id *)&self->_spatialDeviceMapUnmatched, 0);
  objc_storeStrong((id *)&self->_spatialDeviceMapMatched, 0);
}

@end
