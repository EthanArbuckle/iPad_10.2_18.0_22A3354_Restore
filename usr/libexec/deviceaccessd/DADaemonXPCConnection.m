@implementation DADaemonXPCConnection

- (id)description
{
  return -[DADaemonXPCConnection descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  DADiscovery *activatedDiscovery;
  DADiscovery *v8;
  id v9;
  DASession *activatedSession;
  DASession *v11;
  id v12;
  id v14;
  id v15;
  id v16;

  v16 = 0;
  v4 = CUPrintPID(self->_pid, a2, *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v16, "%@", v5);
  v6 = v16;

  activatedDiscovery = self->_activatedDiscovery;
  if (activatedDiscovery)
  {
    v15 = v6;
    v8 = activatedDiscovery;
    NSAppendPrintF(&v15, ", %@", v8);
    v9 = v15;

    v6 = v9;
  }
  activatedSession = self->_activatedSession;
  if (activatedSession)
  {
    v14 = v6;
    v11 = activatedSession;
    NSAppendPrintF(&v14, ", %@", v11);
    v12 = v14;

    v6 = v12;
  }
  return v6;
}

- (void)activate
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  int v16;
  const char *string;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  NSString *v22;
  NSString *appID;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t entitledState;
  const char *v28;
  void *v29;
  NSNumber *v30;
  void *v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v38 = 0u;
  v39 = 0u;
  xpc_connection_get_audit_token(self->_xpcCnx, &v38);
  v37[0] = v38;
  v37[1] = v39;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v37, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoDictionary"));
  v6 = objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("NSAccessorySetupKitSupports"), objc_opt_class(NSArray, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("Bluetooth")))
          self->_accessLevel = 4;
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("WiFi")))
          self->_accessLevel = 4;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v9);
  }

  v13 = (void *)xpc_copy_entitlement_for_token(0, &v38);
  v14 = v13;
  if (v13)
  {
    v15 = xpc_dictionary_get_BOOL(v13, "com.apple.DeviceAccess");
    if (v15)
      v16 = 6;
    else
      v16 = 5;
    self->_entitledState = v16;
    if (v15)
      self->_accessLevel = 7;
    if (xpc_dictionary_get_BOOL(v14, "com.apple.DeviceAccess.private"))
      self->_accessLevel = 10;
  }
  string = (const char *)xpc_copy_code_signing_identity_for_token(&v38);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100019F80;
  v32[3] = &unk_100039290;
  v32[4] = string;
  v20 = objc_retainBlock(v32);
  if (string)
    v21 = 1;
  else
    v21 = v14 == 0;
  if (!v21)
    string = xpc_dictionary_get_string(v14, "application-identifier");
  if (string)
  {
    v22 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    appID = self->_appID;
    self->_appID = v22;

  }
  if (dword_10003F6E0 <= 20 && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 20)))
  {
    v24 = CUPrintPID(self->_pid, v18, v19);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)v25;
    entitledState = self->_entitledState;
    if (entitledState >= 8)
    {
      if ((int)entitledState <= 9)
        v28 = "?";
      else
        v28 = "User";
    }
    else
    {
      v28 = off_100039530[entitledState];
    }
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection activate]", 20, "XPC connection start: %@, appID %@, entitled %s", v25, self->_appID, v28);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_pid));
  v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  +[DADeviceAccessAnalytics markSessionActivationForPid:atTime:](DADeviceAccessAnalytics, "markSessionActivationForPid:atTime:", v29, v31);

  ((void (*)(_QWORD *))v20[2])(v20);
}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  DADiscovery *v5;
  uint64_t v6;
  void *v7;
  DADiscovery *activatedDiscovery;
  uint64_t v9;
  uint64_t v10;
  DASession *v11;
  uint64_t v12;
  void *v13;
  DASession *activatedSession;
  OS_xpc_object *connection;

  connection = self->_xpcCnx;
  if (connection)
    xpc_connection_cancel(connection);
  v5 = self->_activatedDiscovery;
  if (v5)
  {
    if (dword_10003F6E0 <= 30
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
    {
      v6 = CUPrintPID(self->_pid, v3, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection invalidate]", 30, "Invalidate: %@, from %@", v5, v7);

    }
    activatedDiscovery = self->_activatedDiscovery;
    self->_activatedDiscovery = 0;

    -[DADaemonServer removeDiscovery:](self->_daemon, "removeDiscovery:", v5);
    -[DADiscovery invalidate](v5, "invalidate");
  }
  v11 = self->_activatedSession;
  if (v11)
  {
    if (dword_10003F6E0 <= 30
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
    {
      v12 = CUPrintPID(self->_pid, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection invalidate]", 30, "Invalidate: %@, from %@", v11, v13);

    }
    -[DASession invalidate](v11, "invalidate");
    activatedSession = self->_activatedSession;
    self->_activatedSession = 0;

  }
  -[DADaemonServer xpcConnectionInvalidated:](self->_daemon, "xpcConnectionInvalidated:", self);

}

- (void)reportDeviceChanged:(id)a3 appID:(id)a4 discovery:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  v9 = -[DADaemonXPCConnection accessLevel](self, "accessLevel");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DASession bundleID](self->_activatedSession, "bundleID"));
  if (!v10)
  {
    if (v5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADiscovery configuration](self->_activatedDiscovery, "configuration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));

      if (v10)
        goto LABEL_2;
    }
    else
    {
      v10 = 0;
    }
    if (v9 == 10)
    {
      v10 = 0;
      goto LABEL_14;
    }
  }
LABEL_2:
  if (self->_accessLevel != 4)
  {
    if ((objc_msgSend(v10, "isEqual:", v8) & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appAccessInfoMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));
  if (v12)
  {

LABEL_14:
    v15 = objc_msgSend(objc_alloc((Class)DADeviceEvent), "initWithEventType:device:", 42, v16);
    -[DADaemonXPCConnection _xpcReportDAEvent:](self, "_xpcReportDAEvent:", v15);

    goto LABEL_15;
  }
  v14 = objc_msgSend(v10, "isEqual:", v8);

  if (v14)
    goto LABEL_14;
LABEL_15:

}

- (void)reportDevicesPresentChanged:(BOOL)a3 appID:(id)a4
{
  _BOOL8 v4;
  DASession *activatedSession;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unsigned int v14;
  id v15;
  id v16;

  v4 = a3;
  activatedSession = self->_activatedSession;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DASession bundleID](activatedSession, "bundleID"));
  v9 = v8;
  if (v8)
  {
    v16 = v8;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADiscovery configuration](self->_activatedDiscovery, "configuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = (id)objc_claimAutoreleasedReturnValue(-[DADiscovery bundleID](self->_activatedDiscovery, "bundleID"));
    v16 = v13;

  }
  v14 = objc_msgSend(v16, "isEqual:", v7);

  if (v14)
  {
    v15 = objc_msgSend(objc_alloc((Class)DAEventDevicesPresent), "initWithPresent:devicesMigrated:", v4, 0);
    -[DADaemonXPCConnection _xpcReportDAEvent:](self, "_xpcReportDAEvent:", v15);

  }
}

- (void)reportDevicesMigrated:(id)a3 appID:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  BOOL v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADiscovery configuration](self->_activatedDiscovery, "configuration"));
  v8 = -[DADaemonXPCConnection accessLevel](self, "accessLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DASession bundleID](self->_activatedSession, "bundleID"));
  if (!v9
    && ((v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"))) == 0
      ? (v10 = v8 == 10)
      : (v10 = 0),
        v10))
  {
    v9 = 0;
  }
  else if (!objc_msgSend(v9, "isEqual:", v6))
  {
    goto LABEL_10;
  }
  -[DADaemonXPCConnection _xpcReportDAEvent:](self, "_xpcReportDAEvent:", v11);
LABEL_10:

}

- (void)reportDiscoveryEvent:(id)a3 appID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADiscovery configuration](self->_activatedDiscovery, "configuration"));
  if ((objc_msgSend(v7, "presenceOnly") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DASession bundleID](self->_activatedSession, "bundleID"));
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    v11 = v10;

    v12 = -[DADaemonXPCConnection accessLevel](self, "accessLevel");
    if (v12 != 4 && (!v11 && v12 == 10 || objc_msgSend(v11, "isEqual:", v6)))
      -[DADaemonXPCConnection _xpcReportDAEvent:](self, "_xpcReportDAEvent:", v13);

  }
}

- (void)reportRemovedDevice:(id)a3 appID:(id)a4 discovery:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  unsigned int v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  id v22;

  v5 = a5;
  v22 = a3;
  v8 = a4;
  v9 = -[DADaemonXPCConnection accessLevel](self, "accessLevel");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[DASession bundleID](self->_activatedSession, "bundleID"));
  if (!v10)
  {
    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADiscovery configuration](self->_activatedDiscovery, "configuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID"));
      v13 = v12;
      if (v12)
        v14 = v12;
      else
        v14 = (NSString *)objc_claimAutoreleasedReturnValue(-[DADiscovery bundleID](self->_activatedDiscovery, "bundleID"));
      v10 = v14;

    }
    else
    {
      v10 = self->_appID;
    }
  }
  if (v9 != 10)
  {
    if (self->_accessLevel == 4)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "appAccessInfoMap"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v10));
      if (v16)
      {

      }
      else
      {
        v21 = -[NSString isEqual:](v10, "isEqual:", v8);

        if (!v21)
          goto LABEL_17;
      }
    }
    else if ((-[NSString isEqual:](v10, "isEqual:", v8) & 1) == 0)
    {
      goto LABEL_17;
    }
  }
  v17 = objc_msgSend(v22, "flags");
  v18 = objc_alloc((Class)DADeviceEvent);
  if ((v17 & 8) != 0)
    v19 = 41;
  else
    v19 = 42;
  v20 = objc_msgSend(v18, "initWithEventType:device:", v19, v22);
  -[DADaemonXPCConnection _xpcReportDAEvent:](self, "_xpcReportDAEvent:", v20);

LABEL_17:
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  int entitledState;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  entitledState = self->_entitledState;
  if (entitledState != 6)
  {
    v6 = DAErrorF(350005, "Missing entitlement: %s", "com.apple.DeviceAccess");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (dword_10003F6E0 <= 90
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      v10 = CUPrintPID(self->_pid, v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = CUPrintNSError(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _entitledAndReturnError:]", 90, "### DeviceAccess denied: %@, %@", v11, v13);

    }
    if (a3)
      *a3 = objc_retainAutorelease(v9);

  }
  return entitledState == 6;
}

- (BOOL)_findSyncExtensionPoint:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)_EXQuery);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleIdentifier == %@"), v5));

  v9 = objc_msgSend(v7, "initWithExtensionPointIdentifier:predicate:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_EXQueryController executeQuery:](_EXQueryController, "executeQuery:", v9));
  LOBYTE(v5) = objc_msgSend(v10, "count") != 0;

  return (char)v5;
}

- (BOOL)_entitledForAccessLevel:(int)a3 returnError:(id *)a4
{
  int accessLevel;
  const char *v7;
  uint64_t v8;

  accessLevel = self->_accessLevel;
  if (a4 && accessLevel < a3)
  {
    v7 = "com.apple.DeviceAccess";
    if (a3 > 9)
      v7 = "com.apple.DeviceAccess.private";
    v8 = DAErrorF(350005, "Requires entitlement: %s", v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v8);
  }
  return accessLevel >= a3;
}

- (void)xpcReceivedMessage:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  OS_xpc_object *xpcCnx;
  id v12;

  v12 = a3;
  if (xpc_get_type(v12) == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[DADaemonXPCConnection xpcReceivedRequest:](self, "xpcReceivedRequest:", v12);
    goto LABEL_14;
  }
  v5 = v12;
  if (v12 == &_xpc_error_connection_invalid)
  {
    if (dword_10003F6E0 <= 20
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 20)))
    {
      v8 = CUPrintPID(self->_pid, v5, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection xpcReceivedMessage:]", 20, "XPC connection ended: %@", v9);

    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    -[DADaemonXPCConnection invalidate](self, "invalidate");
    goto LABEL_14;
  }
  if (dword_10003F6E0 <= 90)
  {
    if (dword_10003F6E0 != -1 || (v10 = _LogCategory_Initialize(&dword_10003F6E0, 90), v5 = v12, v10))
    {
      v6 = CUPrintXPC(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection xpcReceivedMessage:]", 90, "### XPC connection error: %@", v7);

LABEL_14:
      v5 = v12;
    }
  }

}

- (void)xpcReceivedEvent:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  xpc_object_t message;

  message = a3;
  v4 = self->_xpcCnx;
  v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (dword_10003F6E0 <= 90
         && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
  {
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection xpcReceivedEvent:]", 90, "### XPC received event with no handler");
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
    if (!strncmp(string, "BTIG", 4uLL))
    {
      -[DADaemonXPCConnection _xpcBluetoothAccessInfoGet:](self, "_xpcBluetoothAccessInfoGet:", v8);
    }
    else if (!strncmp(v5, "DscA", 4uLL))
    {
      -[DADaemonXPCConnection _xpcDADiscoveryActivate:](self, "_xpcDADiscoveryActivate:", v8);
    }
    else if (!strncmp(v5, "DscM", 4uLL))
    {
      -[DADaemonXPCConnection _xpcDADiscoveryMigrationComplete:](self, "_xpcDADiscoveryMigrationComplete:", v8);
    }
    else
    {
      if (!strncmp(v5, "DsSp", 4uLL))
      {
        -[DADaemonXPCConnection _xpcDADiscoveryInvalidateWithReason:](self, "_xpcDADiscoveryInvalidateWithReason:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "SesA", 4uLL))
      {
        -[DADaemonXPCConnection _xpcDASessionActivate:](self, "_xpcDASessionActivate:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "DgSh", 4uLL))
      {
        -[DADaemonXPCConnection _xpcDiagnosticShow:](self, "_xpcDiagnosticShow:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "RvAi", 4uLL))
      {
        -[DADaemonXPCConnection _xpcRemoveDeviceAppAccessInfo:](self, "_xpcRemoveDeviceAppAccessInfo:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "SAAi", 4uLL))
      {
        -[DADaemonXPCConnection _xpcSetDeviceAppAccessInfo:](self, "_xpcSetDeviceAppAccessInfo:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "GAAc", 4uLL))
      {
        -[DADaemonXPCConnection _xpcGetAuthorizedAccessories:](self, "_xpcGetAuthorizedAccessories:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "GADv", 4uLL))
      {
        -[DADaemonXPCConnection _xpcGetAuthorizedDevices:](self, "_xpcGetAuthorizedDevices:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "GDvs", 4uLL))
      {
        -[DADaemonXPCConnection _xpcGetDevices:](self, "_xpcGetDevices:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "MdSt", 4uLL))
      {
        -[DADaemonXPCConnection _xpcModifyDeviceSettings:](self, "_xpcModifyDeviceSettings:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "SDvS", 4uLL))
      {
        -[DADaemonXPCConnection _xpcSetDeviceState:](self, "_xpcSetDeviceState:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "GIFs", 4uLL))
      {
        -[DADaemonXPCConnection _xpcGetPartialIPs:](self, "_xpcGetPartialIPs:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "SIFs", 4uLL))
      {
        -[DADaemonXPCConnection _xpcSetPartialIPs:](self, "_xpcSetPartialIPs:", v8);
        goto LABEL_47;
      }
      if (!strncmp(v5, "BTPM", 4uLL))
      {
        -[DADaemonXPCConnection _xpcBluetoothPairingMsg:](self, "_xpcBluetoothPairingMsg:", v8);
        goto LABEL_47;
      }
      if (dword_10003F6E0 <= 90
        && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
      {
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection xpcReceivedRequest:]", 90, "### XPC unknown message type: '%s'", v5);
      }
      if (CUXPCDictionaryExpectsReply(v8))
      {
        v6 = DAErrorF(350002, "Unknown message type: '%s'");
        goto LABEL_30;
      }
    }
  }
  else
  {
    if (dword_10003F6E0 <= 90
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection xpcReceivedRequest:]", 90, "### XPC no message type");
    }
    if (CUXPCDictionaryExpectsReply(v8))
    {
      v6 = DAErrorF(350001, "No message type");
LABEL_30:
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v7, v8);

    }
  }
LABEL_47:

}

- (void)_xpcSendEvent:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  xpc_object_t message;

  message = a3;
  v4 = self->_xpcCnx;
  v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (dword_10003F6E0 <= 90
         && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
  {
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSendEvent:]", 90, "### Send event with no cnx");
  }

}

- (void)_xpcSendReply:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  xpc_object_t message;

  message = a3;
  v4 = self->_xpcCnx;
  v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (dword_10003F6E0 <= 90
         && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
  {
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSendReply:]", 90, "### Send reply with no cnx");
  }

}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  uint64_t Reply;
  void *v7;
  OS_xpc_object *v8;
  OS_xpc_object *v9;
  id v10;

  v10 = a3;
  Reply = CUXPCDictionaryCreateReply(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(Reply);
  if (v7)
  {
    CUXPCEncodeNSError(v10, v7, "errO", "errC", "errD", "errM", "errO");
    v8 = self->_xpcCnx;
    v9 = v8;
    if (v8)
    {
      xpc_connection_send_message(v8, v7);
    }
    else if (dword_10003F6E0 <= 90
           && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSendReplyError:request:]", 90, "### Send error with no cnx");
    }

  }
  else if (dword_10003F6E0 <= 90
         && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
  {
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSendReplyError:request:]", 90, "### Send error create reply failed");
  }

}

- (void)_xpcBluetoothAccessInfoGet:(id)a3
{
  id *v3;
  unsigned __int8 v4;
  DASession *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  id *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  uint64_t v21;
  CFTypeID v22;
  uint64_t v23;
  void *v24;
  CFTypeID v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  xpc_object_t reply;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  DASession *v41;
  _QWORD *v42;
  xpc_object_t original;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id obj;
  _QWORD v58[5];
  id v59;
  uint64_t *v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _BYTE v67[128];

  v61 = 0;
  v62 = (id *)&v61;
  v63 = 0x3032000000;
  v64 = sub_10001B688;
  v65 = sub_10001B698;
  v66 = 0;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10001B6A0;
  v58[3] = &unk_1000391F8;
  v60 = &v61;
  v58[4] = self;
  original = a3;
  v59 = original;
  v42 = objc_retainBlock(v58);
  v3 = v62;
  obj = v62[5];
  v4 = -[DADaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v3 + 5, obj);
  if ((v4 & 1) != 0)
  {
    v5 = self->_activatedSession;
    v41 = v5;
    if (v5)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[DASession bundleID](v5, "bundleID"));
      if (v47)
      {
        v45 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@.%@"), v47, CFSTR("daappdata"));
        v6 = NSTemporaryDirectory();
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v45, 0));

        v9 = objc_alloc((Class)NSDictionary);
        v10 = v62 + 5;
        v56 = v62[5];
        v49 = objc_msgSend(v9, "initWithContentsOfURL:error:", v44, &v56);
        objc_storeStrong(v10, v56);
        if (v49)
        {
          TypeID = CFDictionaryGetTypeID();
          TypedValue = CFDictionaryGetTypedValue(v49, CFSTR("devices"), TypeID, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
          v50 = objc_alloc_init((Class)DABluetoothAccessInfo);
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v14 = v13;
          v15 = 0;
          v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v53;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(_QWORD *)v53 != v18)
                  objc_enumerationMutation(v14);
                v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
                v21 = objc_opt_class(NSString, v16);
                if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
                {
                  v22 = CFDictionaryGetTypeID();
                  v23 = CFDictionaryGetTypedValue(v14, v20, v22, 0);
                  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
                  if (v24)
                  {
                    v25 = CFStringGetTypeID();
                    v26 = CFDictionaryGetTypedValue(v24, CFSTR("bluetoothIdentifier"), v25, 0);
                    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
                    if (v27)
                    {
                      v28 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v27);
                      if (v28)
                      {
                        v29 = objc_alloc_init((Class)DABluetoothDeviceAccessInfo);
                        objc_msgSend(v29, "setIdentifier:", v28);
                        if (!v15)
                          v15 = objc_alloc_init((Class)NSMutableArray);
                        objc_msgSend(v15, "addObject:", v29);

                      }
                    }

                  }
                }
              }
              v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
            }
            while (v17);
          }

          objc_msgSend(v50, "setBluetoothDevices:", v15);
          if (dword_10003F6E0 <= 30
            && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
          {
            v32 = CUPrintPID(self->_pid, v30, v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcBluetoothAccessInfoGet:]", 30, "BluetoothAccessInfo get: %@, from %@", v50, v33);

          }
          reply = xpc_dictionary_create_reply(original);
          CUXPCEncodeObject(reply, "btAI", v50, 0);
          -[DADaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", reply);

        }
        else
        {
          v39 = DANestedErrorF(v62[5], 350001, "Read settings failed");
          v40 = objc_claimAutoreleasedReturnValue(v39);
          v14 = v62[5];
          v62[5] = (id)v40;
        }

      }
      else
      {
        v37 = DAErrorF(350001, "No bundleID");
        v38 = objc_claimAutoreleasedReturnValue(v37);
        v46 = v62[5];
        v62[5] = (id)v38;

      }
    }
    else
    {
      v35 = DAErrorF(350001, "No session");
      v36 = objc_claimAutoreleasedReturnValue(v35);
      v48 = v62[5];
      v62[5] = (id)v36;

    }
  }
  ((void (*)(_QWORD *))v42[2])(v42);

  _Block_object_dispose(&v61, 8);
}

- (void)_xpcDADiscoveryActivate:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  xpc_object_t reply;
  void *v26;
  char v27;
  NSNumber *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;

  v4 = a3;
  v34 = 0;
  v5 = objc_msgSend(objc_alloc((Class)DADiscovery), "initWithXPCObject:error:", v4, &v34);
  v6 = v34;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    if (!v8)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurations"));
      if (objc_msgSend(v8, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleID"));

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));

        if (!v13)
        {
          if (dword_10003F6E0 <= 90
            && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
          {
            LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryActivate:]", 90, "### DADiscovery activate failed: no bundleID");
          }
          v30 = DAErrorF(350001, "No bundleID");
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v31, v4);

          goto LABEL_41;
        }
        if (dword_10003F6E0 <= 30
          && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
        {
          LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryActivate:]", 30, "### DADiscovery use the bundleID from the discovery object");
        }
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
      }

      v8 = (void *)v10;
    }
    v14 = objc_msgSend(v7, "presenceOnly");
    if ((v14 & 1) != 0)
    {
      if (-[NSString isEqualToString:](self->_appID, "isEqualToString:", v8))
        goto LABEL_26;
      v32 = v6;
      v15 = -[DADaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v32);
      v16 = v32;

      if ((v15 & 1) == 0)
      {
        v17 = DAErrorF(350001, "Mismatched bundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v18, v4);

LABEL_49:
        v6 = v16;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      v33 = v6;
      v19 = -[DADaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v33);
      v16 = v33;

      if ((v19 & 1) == 0)
      {
        -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v16, v4);
        goto LABEL_49;
      }
    }
    v6 = v16;
LABEL_26:
    objc_storeStrong((id *)&self->_activatedDiscovery, v5);
    if (dword_10003F6E0 <= 30
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
    {
      v22 = CUPrintPID(self->_pid, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryActivate:]", 30, "Activate: %@, from %@", v5, v23);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer addDiscovery:](self->_daemon, "addDiscovery:", v5));
    reply = xpc_dictionary_create_reply(v4);
    v26 = reply;
    if (reply)
    {
      if (v24)
        v27 = v14;
      else
        v27 = 1;
      if ((v27 & 1) == 0)
        CUXPCEncodeNSArrayOfObjects(reply, "devs", v24);
      if (v8 && -[DADaemonServer devicesPresentWithAppID:](self->_daemon, "devicesPresentWithAppID:", v8))
        xpc_dictionary_set_BOOL(v26, "dvPr", 1);
      v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      +[DADeviceAccessAnalytics markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:](DADeviceAccessAnalytics, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:", 10, v8, 0, v5, 8, 6, v29, 0);
      -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v26);

    }
    else if (dword_10003F6E0 <= 90
           && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryActivate:]", 90, "### DADiscovery activate create reply failed");
    }

    goto LABEL_41;
  }
  if (dword_10003F6E0 <= 90 && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
  {
    v11 = CUPrintNSError(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryActivate:]", 90, "### DADiscovery activate decode failed: %@", v12);

  }
  -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
LABEL_42:

}

- (void)_xpcDADiscoveryMigrationComplete:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  xpc_object_t reply;
  void *v19;
  uint64_t v20;
  id v21;

  v4 = a3;
  v21 = 0;
  v5 = objc_msgSend(objc_alloc((Class)DADiscovery), "initWithXPCObject:error:", v4, &v21);
  v6 = v21;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    if (!v10)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurations"));
      if (objc_msgSend(v10, "count"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID"));

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));

        if (!v15)
        {
          if (dword_10003F6E0 <= 90
            && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
          {
            LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryMigrationComplete:]", 90, "### DADiscovery complete migration failed: no bundleID");
          }
          v20 = DAErrorF(350001, "No bundleID");
          v19 = (void *)objc_claimAutoreleasedReturnValue(v20);
          -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v19, v4);
          goto LABEL_26;
        }
        if (dword_10003F6E0 <= 30
          && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
        {
          LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryMigrationComplete:]", 30, "### DADiscovery use the bundleID from the discovery object");
        }
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
      }

      v10 = (void *)v12;
    }
    if (dword_10003F6E0 <= 30
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
    {
      v16 = CUPrintPID(self->_pid, v8, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryMigrationComplete:]", 30, "Migrate: %@, from %@", v5, v17);

    }
    -[DADaemonServer runMigrationWithDiscovery:](self->_daemon, "runMigrationWithDiscovery:", v5);
    reply = xpc_dictionary_create_reply(v4);
    v19 = reply;
    if (reply)
    {
      xpc_dictionary_set_BOOL(reply, "dvPr", 1);
      -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v19);
    }
    else if (dword_10003F6E0 <= 90
           && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryMigrationComplete:]", 90, "### DADiscovery complete migration create reply failed");
    }
LABEL_26:

    goto LABEL_27;
  }
  if (dword_10003F6E0 <= 90 && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
  {
    v13 = CUPrintNSError(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryMigrationComplete:]", 90, "### DADiscovery complete migration decode failed: %@", v14);

  }
  -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
LABEL_27:

}

- (void)_xpcDADiscoveryInvalidateWithReason:(id)a3
{
  id v4;
  DADiscovery *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSNumber *v15;
  void *v16;
  xpc_object_t reply;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v5 = self->_activatedDiscovery;
  if (v5)
  {
    v19 = 0;
    if (CUXPCDecodeUInt64RangedEx(v4, "DSpRn", 0, -1, &v19, 0) == 6)
      v6 = v19;
    else
      v6 = 0;
    if (dword_10003F6E0 <= 30
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryInvalidateWithReason:]", 30, "Invalidating %@ due to %lu", v5, v6);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADiscovery configuration](v5, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleID"));
    if (!v10)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADiscovery configurations](v5, "configurations"));
      if (objc_msgSend(v10, "count"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID"));

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADiscovery bundleID](v5, "bundleID"));

        if (!v13)
        {
          if (dword_10003F6E0 <= 90
            && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
          {
            LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryInvalidateWithReason:]", 90, "### DADiscovery complete migration failed: no bundleID");
          }
          v18 = DAErrorF(350001, "No bundleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
          -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v16, v4);
          goto LABEL_37;
        }
        if (dword_10003F6E0 <= 30
          && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
        {
          LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryInvalidateWithReason:]", 30, "### DADiscovery use the bundleID from the discovery object");
        }
        v12 = objc_claimAutoreleasedReturnValue(-[DADiscovery bundleID](v5, "bundleID"));
      }

      v10 = (void *)v12;
    }
    switch(v6)
    {
      case 10:
        v14 = 200;
        break;
      case 5:
        v14 = 1;
        break;
      case 1:
        v14 = 4;
        break;
      default:
        v14 = 0;
        break;
    }
    v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    +[DADeviceAccessAnalytics markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:](DADeviceAccessAnalytics, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:", 30, v10, 0, v5, 8, 6, v16, v14);
    reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", reply);
    }
    else if (dword_10003F6E0 <= 90
           && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryInvalidateWithReason:]", 90, "### DADiscovery invalidation report create reply failed");
    }

LABEL_37:
    goto LABEL_38;
  }
  if (dword_10003F6E0 <= 90 && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
  {
    v7 = CUPrintNSError(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDADiscoveryInvalidateWithReason:]", 90, "### DADiscovery invalidating with reason decode failed: %@", v8);

  }
  -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", 0, v4);
LABEL_38:

}

- (void)_xpcDASessionActivate:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  xpc_object_t reply;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  NSObject *dispatchQueue;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  _QWORD block[5];
  id v35;
  uint64_t *v36;
  _QWORD v37[6];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _QWORD v44[6];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  _BYTE v53[128];

  v4 = a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_10001B688;
  v50 = sub_10001B698;
  v51 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v45 = 0;
  v5 = objc_msgSend(objc_alloc((Class)DASession), "initWithXPCObject:error:", v4, &v45);
  v6 = v45;
  if (v5)
  {
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10001C9B0;
    v44[3] = &unk_1000393F8;
    v44[4] = self;
    v44[5] = v5;
    objc_msgSend(v5, "setEventHandler:", v44);
    objc_storeStrong((id *)&self->_activatedSession, v5);
    if (dword_10003F6E0 <= 30
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
    {
      v9 = CUPrintPID(self->_pid, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDASessionActivate:]", 30, "Activate: %@, from %@", v5, v10);

    }
    reply = xpc_dictionary_create_reply(v4);
    if (!reply)
    {
      if (dword_10003F6E0 <= 90
        && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
      {
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDASessionActivate:]", 90, "### DASession activate create reply failed");
      }
      goto LABEL_38;
    }
    v52 = 0;
    if (CUXPCDecodeUInt64RangedEx(v4, "dvFl", 0, -1, &v52, 0) == 6)
      v14 = v52;
    else
      v14 = 0;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
    v16 = (void *)v15;
    if (!v14 || v15 || self->_accessLevel == 10)
    {
      if (-[NSString isEqualToString:](self->_appID, "isEqualToString:", v15))
        goto LABEL_19;
      v43 = v6;
      v17 = -[DADaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v43);
      v18 = v43;

      if ((v17 & 1) != 0)
      {
        v6 = v18;
LABEL_19:
        if (v16)
        {
          if (-[DADaemonServer devicesPresentWithAppID:](self->_daemon, "devicesPresentWithAppID:", v16))
            xpc_dictionary_set_BOOL(reply, "dvPr", 1);
          -[DADaemonServer reportAuthorizedDevices:](self->_daemon, "reportAuthorizedDevices:", v16);
          if (!v14)
            goto LABEL_34;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self->_daemon, "getDevicesWithFlags:appID:", v14, v16));
          CUXPCEncodeNSArrayOfObjects(reply, "devs", v19);
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
          v33 = v6;
          v22 = 0;
          if (v21)
          {
            v23 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(_QWORD *)v40 != v23)
                  objc_enumerationMutation(v20);
                v22 |= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "flags");
              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
            }
            while (v21);
          }

          v6 = v33;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count")));
          objc_msgSend((id)v47[5], "setObject:forKeyedSubscript:", v25, CFSTR("AccessoriesCount"));

          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v22));
          objc_msgSend((id)v47[5], "setObject:forKeyedSubscript:", v26, CFSTR("AccessoryFlags"));

          objc_msgSend((id)v47[5], "setObject:forKeyedSubscript:", v16, CFSTR("BundleID"));
        }
        else
        {
          if (!v14)
          {
LABEL_34:
            -[DADaemonServer updateAppInfo:](self->_daemon, "updateAppInfo:", v16);
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[ACXDeviceConnection sharedDeviceConnection](ACXDeviceConnection, "sharedDeviceConnection"));
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472;
            v37[2] = sub_10001C9D4;
            v37[3] = &unk_100039448;
            v37[4] = v5;
            v37[5] = self;
            v38 = reply;
            objc_msgSend(v27, "applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:completion:", v16, v37);

            if (-[NSString isEqualToString:](self->_appID, "isEqualToString:", v16))
            {
              dispatchQueue = self->_dispatchQueue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10001CB10;
              block[3] = &unk_100039498;
              block[4] = self;
              v36 = &v46;
              v35 = v16;
              dispatch_async(dispatchQueue, block);

            }
            goto LABEL_37;
          }
          v20 = (id)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self->_daemon, "getDevicesWithFlags:appID:", v14, 0));
          CUXPCEncodeNSArrayOfObjects(reply, "devs", v20);
        }

        goto LABEL_34;
      }
      v29 = DAErrorF(350001, "Mismatched bundleID");
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v30, v4);

      v6 = v18;
    }
    else
    {
      v31 = DAErrorF(350001, "Global session requires private entitlement");
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v32, v4);

    }
LABEL_37:

LABEL_38:
    goto LABEL_41;
  }
  if (dword_10003F6E0 <= 90 && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
  {
    v11 = CUPrintNSError(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDASessionActivate:]", 90, "### DASession activate decode failed: %@", v12);

  }
  -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
LABEL_41:

  _Block_object_dispose(&v46, 8);
}

- (void)_xpcDiagnosticShow:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t Reply;
  void *v11;
  __CFString *v12;
  const char *v13;
  id v14;
  id v15;

  v4 = a3;
  v15 = 0;
  v5 = -[DADaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v15);
  v6 = v15;
  if ((v5 & 1) != 0)
  {
    v14 = 0;
    v7 = CUDescriptionWithLevel(self->_daemon, 20);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    NSAppendPrintF(&v14, "%@", v8);
    v9 = (__CFString *)v14;

    Reply = CUXPCDictionaryCreateReply(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(Reply);
    if (v11)
    {
      if (v9)
        v12 = v9;
      else
        v12 = CFSTR("None\n");
      v13 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
      if (v13)
        xpc_dictionary_set_string(v11, "oStr", v13);
      -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v11);
    }
    else if (dword_10003F6E0 <= 90
           && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcDiagnosticShow:]", 90, "### DiagnosticShow create reply failed");
    }

  }
  else
  {
    -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
  }

}

- (void)_xpcRemoveDeviceAppAccessInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  int accessLevel;
  unsigned __int8 v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  xpc_object_t reply;
  char *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  id v40;
  DADaemonServer *daemon;
  id *v42;
  unsigned __int8 v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  _QWORD *v61;
  void *v62;
  id v63;
  NSString *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id obj;
  id v75;
  id v76;
  id v77;
  _QWORD v78[5];
  id v79;
  uint64_t *v80;
  uint64_t v81;
  id *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;

  v81 = 0;
  v82 = (id *)&v81;
  v83 = 0x3032000000;
  v84 = sub_10001B688;
  v85 = sub_10001B698;
  v86 = 0;
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_10001DB28;
  v78[3] = &unk_1000391F8;
  v80 = &v81;
  v78[4] = self;
  v4 = a3;
  v79 = v4;
  v61 = objc_retainBlock(v78);
  v64 = self->_appID;
  if (!v64)
  {
    v45 = DAErrorF(350001, "No valid app identifier");
    v46 = objc_claimAutoreleasedReturnValue(v45);
    v47 = v82[5];
    v82[5] = (id)v46;

    goto LABEL_37;
  }
  v77 = 0;
  v6 = objc_opt_class(DASession, v5);
  v7 = v82;
  v76 = v82[5];
  CUXPCDecodeObject(v4, "sess", v6, &v77, &v76);
  objc_storeStrong(v7 + 5, v76);
  if (!v82[5])
  {
    if (!v77)
    {
      v48 = DAErrorF(350001, "No session");
      v49 = objc_claimAutoreleasedReturnValue(v48);
      v63 = v82[5];
      v82[5] = (id)v49;

      goto LABEL_36;
    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "bundleID"));
    if (v62)
    {
      accessLevel = self->_accessLevel;
      if (accessLevel == 4)
        v10 = -[NSString isEqualToString:](v64, "isEqualToString:", v62);
      else
        v10 = 0;
      if (accessLevel == 10 || (v10 & 1) != 0)
      {
        v75 = 0;
        v11 = objc_opt_class(DADeviceAppAccessInfo, v8);
        v12 = v82;
        obj = v82[5];
        CUXPCDecodeObject(v4, "dAaI", v11, &v75, &obj);
        objc_storeStrong(v12 + 5, obj);
        if (v75)
        {
          if (!objc_msgSend(v75, "state"))
          {
            if (dword_10003F6E0 <= 30
              && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
            {
              v15 = v75;
              v16 = v77;
              v17 = CUPrintPID(self->_pid, v13, v14);
              v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
              LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcRemoveDeviceAppAccessInfo:]", 30, "RemoveDeviceAppAccessInfo: %@, %@, from %@", v15, v16, v18);

            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self->_daemon, "getDevicesWithFlags:appID:", 8, 0));
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = sub_10001DBF4;
            v72[3] = &unk_1000394C0;
            v73 = v75;
            v60 = v19;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cuFilteredArrayUsingBlock:", v72));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
            v22 = v21;
            if (v21)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "appAccessInfoMap"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "bundleIdentifier"));
              reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v24));

              v26 = (char *)objc_msgSend(reply, "state");
              if (accessLevel != 10 && (unint64_t)(v26 - 10) >= 0x10)
              {
                v57 = DAErrorF(350006, "%@ access restricted for removal", v64);
                v58 = objc_claimAutoreleasedReturnValue(v57);
                goto LABEL_48;
              }
              if (-[DADaemonServer alwaysConfirmBeforeAccessoryRemoval](self->_daemon, "alwaysConfirmBeforeAccessoryRemoval")|| (objc_msgSend(v22, "flags") & 0x100) != 0|| (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "appAccessInfoMap")), v28 = objc_msgSend(v27, "count"), v27, (unint64_t)v28 > 1))
              {
                if (!qword_10003F9D0)
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(reply, "bundleIdentifier"));
                  v30 = (id)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v29, 1, 0));

                  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name"));
                  v32 = (void *)v31;
                  v33 = CFSTR("Accessory");
                  if (v31)
                    v33 = (__CFString *)v31;
                  v34 = v33;

                  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedName"));
                  v36 = (void *)v35;
                  v37 = CFSTR("App");
                  if (v35)
                    v37 = (__CFString *)v35;
                  v38 = v37;

                  v39 = (void *)objc_claimAutoreleasedReturnValue(+[DAUserAlert accessoryRemovalAlert:appName:](DAUserAlert, "accessoryRemovalAlert:appName:", v34, v38));
                  objc_storeStrong((id *)&qword_10003F9D0, v39);
                  objc_msgSend(v39, "setDispatchQueue:", self->_dispatchQueue);
                  v67[0] = _NSConcreteStackBlock;
                  v67[1] = 3221225472;
                  v67[2] = sub_10001DC68;
                  v67[3] = &unk_1000394E8;
                  v67[4] = self;
                  v68 = v22;
                  v69 = reply;
                  v40 = v4;
                  v70 = v40;
                  objc_msgSend(v39, "setActionHandler:", v67);
                  v65[0] = _NSConcreteStackBlock;
                  v65[1] = 3221225472;
                  v65[2] = sub_10001DC9C;
                  v65[3] = &unk_100039510;
                  v65[4] = self;
                  v66 = v40;
                  objc_msgSend(v39, "activateWithCompletionHandler:", v65);

                  goto LABEL_28;
                }
                v59 = DAErrorF(350011, "Waiting for user input for device removal");
                v58 = objc_claimAutoreleasedReturnValue(v59);
LABEL_48:
                v30 = v82[5];
                v82[5] = (id)v58;
LABEL_28:

LABEL_33:
                v44 = v60;
LABEL_34:

LABEL_35:
                goto LABEL_36;
              }
              objc_msgSend(reply, "setState:", 0);
              daemon = self->_daemon;
              v42 = v82;
              v71 = v82[5];
              v43 = -[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:](daemon, "updateAppAccessInfo:accessoryDevice:removalType:error:", reply, v22, 2, &v71);
              objc_storeStrong(v42 + 5, v71);
              if ((v43 & 1) == 0)
                goto LABEL_33;

            }
            reply = xpc_dictionary_create_reply(v4);
            if (reply)
            {
              -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", reply);
            }
            else if (dword_10003F6E0 <= 90
                   && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
            {
              LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcRemoveDeviceAppAccessInfo:]", 90, "### RemoveDeviceAppAccessInfo create reply failed");
            }
            goto LABEL_33;
          }
          v56 = DAErrorF(350001, "Device state should be invalid");
          v55 = objc_claimAutoreleasedReturnValue(v56);
        }
        else
        {
          v54 = DAErrorF(350001, "No access info");
          v55 = objc_claimAutoreleasedReturnValue(v54);
        }
        v44 = v82[5];
        v82[5] = (id)v55;
        goto LABEL_34;
      }
      v52 = DAErrorF(350006, "Invalid app access");
      v51 = objc_claimAutoreleasedReturnValue(v52);
    }
    else
    {
      v50 = DAErrorF(350001, "No session bundleID");
      v51 = objc_claimAutoreleasedReturnValue(v50);
    }
    v53 = v82[5];
    v82[5] = (id)v51;

    goto LABEL_35;
  }
LABEL_36:

LABEL_37:
  ((void (*)(_QWORD *))v61[2])(v61);

  _Block_object_dispose(&v81, 8);
}

- (void)_xpcRemoveDeviceConfirmation:(id)a3 accessInfo:(id)a4 userConfirmed:(BOOL)a5 request:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  DADaemonServer *daemon;
  id *v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  xpc_object_t reply;
  uint64_t v22;
  uint64_t v23;
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

  v10 = a3;
  v11 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10001B688;
  v32 = sub_10001B698;
  v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001DFE4;
  v25[3] = &unk_1000391F8;
  v27 = &v28;
  v25[4] = self;
  v12 = a6;
  v26 = v12;
  v13 = objc_retainBlock(v25);
  if (!a5)
  {
    v22 = DAErrorF(350006, "User canceled device removal");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    reply = (xpc_object_t)v29[5];
    v29[5] = v23;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v11, "setState:", 0);
  daemon = self->_daemon;
  v15 = (id *)(v29 + 5);
  obj = (id)v29[5];
  v16 = -[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:](daemon, "updateAppAccessInfo:accessoryDevice:removalType:error:", v11, v10, 2, &obj);
  objc_storeStrong(v15, obj);
  if ((v16 & 1) != 0)
  {
    if (dword_10003F6E0 <= 40
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 40)))
    {
      v19 = CUPrintPID(self->_pid, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcRemoveDeviceConfirmation:accessInfo:userConfirmed:request:]", 40, "### RemoveDeviceConfirmation %@ success for %@", v20, v10);

    }
    reply = xpc_dictionary_create_reply(v12);
    if (reply)
    {
      -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", reply);
    }
    else if (dword_10003F6E0 <= 90
           && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcRemoveDeviceConfirmation:accessInfo:userConfirmed:request:]", 90, "### RemoveDeviceConfirmation create reply failed");
    }
    goto LABEL_9;
  }
LABEL_10:
  ((void (*)(_QWORD *))v13[2])(v13);

  _Block_object_dispose(&v28, 8);
}

- (void)_xpcReportDAEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "mTyp", "Evnt");
  objc_msgSend(v4, "encodeWithXPCObject:", v5);

  -[DADaemonXPCConnection _xpcSendEvent:](self, "_xpcSendEvent:", v5);
}

- (void)_xpcSetDeviceAppAccessInfo:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id *v21;
  unsigned __int8 v22;
  _BOOL4 v23;
  DADaemonServer *daemon;
  id *v25;
  unsigned __int8 v26;
  xpc_object_t reply;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id obj;
  id v44;
  _QWORD v45[5];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  id *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v48 = 0;
  v49 = (id *)&v48;
  v50 = 0x3032000000;
  v51 = sub_10001B688;
  v52 = sub_10001B698;
  v53 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10001E55C;
  v45[3] = &unk_1000391F8;
  v47 = &v48;
  v45[4] = self;
  v4 = a3;
  v46 = v4;
  v5 = objc_retainBlock(v45);
  v44 = 0;
  v7 = objc_opt_class(DASession, v6);
  v8 = v49;
  obj = v49[5];
  CUXPCDecodeObject(v4, "sess", v7, &v44, &obj);
  objc_storeStrong(v8 + 5, obj);
  if (!v49[5])
  {
    if (!v44)
    {
      v28 = DAErrorF(350001, "No session");
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v30 = v49[5];
      v49[5] = (id)v29;

      goto LABEL_17;
    }
    v42 = 0;
    v10 = objc_opt_class(DADeviceAppAccessInfo, v9);
    v11 = v49;
    v41 = v49[5];
    CUXPCDecodeObject(v4, "dAaI", v10, &v42, &v41);
    objc_storeStrong(v11 + 5, v41);
    if (!v42)
    {
      v31 = DAErrorF(350001, "No access info");
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = v49[5];
      v49[5] = (id)v32;

      goto LABEL_16;
    }
    v40 = 0;
    v13 = objc_opt_class(DADevice, v12);
    v14 = v49;
    v39 = v49[5];
    CUXPCDecodeObject(v4, "devi", v13, &v40, &v39);
    objc_storeStrong(v14 + 5, v39);
    v17 = v42;
    if (!v42)
    {
      v34 = DAErrorF(350001, "No device");
      v35 = objc_claimAutoreleasedReturnValue(v34);
      goto LABEL_22;
    }
    if (dword_10003F6E0 <= 30)
    {
      if (dword_10003F6E0 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10003F6E0, 30))
          goto LABEL_9;
        v17 = v42;
      }
      v18 = v44;
      v19 = CUPrintPID(self->_pid, v15, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetDeviceAppAccessInfo:]", 30, "SetDeviceAppAccessInfo: %@, %@, from %@", v17, v18, v20);

    }
LABEL_9:
    if (self->_appID)
    {
      v21 = v49;
      v38 = v49[5];
      v22 = -[DADaemonXPCConnection _entitledForAccessLevel:returnError:](self, "_entitledForAccessLevel:returnError:", 10, &v38);
      objc_storeStrong(v21 + 5, v38);
      if ((v22 & 1) == 0)
        goto LABEL_15;
      v23 = objc_msgSend(v42, "state") == 0;
      daemon = self->_daemon;
      v25 = v49;
      v37 = v49[5];
      v26 = -[DADaemonServer updateAppAccessInfo:accessoryDevice:removalType:error:](daemon, "updateAppAccessInfo:accessoryDevice:removalType:error:", v42, v40, 2 * v23, &v37);
      objc_storeStrong(v25 + 5, v37);
      if ((v26 & 1) == 0)
        goto LABEL_15;
      reply = xpc_dictionary_create_reply(v4);
      if (reply)
      {
        -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", reply);
      }
      else if (dword_10003F6E0 <= 90
             && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
      {
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetDeviceAppAccessInfo:]", 90, "### SetDeviceAppAccessInfo create reply failed");
      }
LABEL_14:

LABEL_15:
LABEL_16:

      goto LABEL_17;
    }
    v36 = DAErrorF(350001, "No client appID");
    v35 = objc_claimAutoreleasedReturnValue(v36);
LABEL_22:
    reply = v49[5];
    v49[5] = (id)v35;
    goto LABEL_14;
  }
LABEL_17:

  ((void (*)(_QWORD *))v5[2])(v5);
  _Block_object_dispose(&v48, 8);

}

- (void)_xpcGetAuthorizedAccessories:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  id *v16;
  unsigned __int8 v17;
  void *v18;
  xpc_object_t reply;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id obj;
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10001B688;
  v36 = sub_10001B698;
  v37 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001E990;
  v29[3] = &unk_1000391F8;
  v31 = &v32;
  v29[4] = self;
  v4 = a3;
  v30 = v4;
  v5 = objc_retainBlock(v29);
  v28 = 0;
  v7 = objc_opt_class(DASession, v6);
  v8 = (id *)(v33 + 5);
  obj = (id)v33[5];
  CUXPCDecodeObject(v4, "sess", v7, &v28, &obj);
  objc_storeStrong(v8, obj);
  if (!v33[5])
  {
    v11 = v28;
    if (!v28)
    {
      v21 = DAErrorF(350001, "No session");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      v15 = (void *)v33[5];
      v33[5] = v22;
      goto LABEL_16;
    }
    if (dword_10003F6E0 <= 30)
    {
      if (dword_10003F6E0 != -1 || (v14 = _LogCategory_Initialize(&dword_10003F6E0, 30), v11 = v28, v14))
      {
        v12 = CUPrintPID(self->_pid, v9, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetAuthorizedAccessories:]", 30, "GetAuthorizedAccessories: %@, from %@", v11, v13);

        v11 = v28;
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID"));
    if (v15)
    {
      if (-[NSString isEqualToString:](self->_appID, "isEqualToString:", v15)
        || (v16 = (id *)(v33 + 5),
            v26 = (id)v33[5],
            v17 = -[DADaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26),
            objc_storeStrong(v16, v26),
            (v17 & 1) != 0))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getAuthorizedDevices:](self->_daemon, "getAuthorizedDevices:", v15));
        reply = xpc_dictionary_create_reply(v4);
        v20 = reply;
        if (reply)
        {
          if (v18)
            CUXPCEncodeNSArrayOfObjects(reply, "devs", v18);
          -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v20);
        }
        else if (dword_10003F6E0 <= 90
               && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
        {
          LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetAuthorizedAccessories:]", 90, "### GetAuthorizedDevices create reply failed");
        }

        goto LABEL_15;
      }
      v25 = DAErrorF(350001, "Mismatched bundleID");
      v24 = objc_claimAutoreleasedReturnValue(v25);
    }
    else
    {
      v23 = DAErrorF(350001, "No appID");
      v24 = objc_claimAutoreleasedReturnValue(v23);
    }
    v18 = (void *)v33[5];
    v33[5] = v24;
LABEL_15:

LABEL_16:
  }

  ((void (*)(_QWORD *))v5[2])(v5);
  _Block_object_dispose(&v32, 8);

}

- (void)_xpcGetAuthorizedDevices:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  id *v16;
  unsigned __int8 v17;
  void *v18;
  xpc_object_t reply;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id obj;
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10001B688;
  v36 = sub_10001B698;
  v37 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001EDD4;
  v29[3] = &unk_1000391F8;
  v31 = &v32;
  v29[4] = self;
  v4 = a3;
  v30 = v4;
  v5 = objc_retainBlock(v29);
  v28 = 0;
  v7 = objc_opt_class(DASession, v6);
  v8 = (id *)(v33 + 5);
  obj = (id)v33[5];
  CUXPCDecodeObject(v4, "sess", v7, &v28, &obj);
  objc_storeStrong(v8, obj);
  if (!v33[5])
  {
    v11 = v28;
    if (!v28)
    {
      v21 = DAErrorF(350001, "No session");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      v15 = (void *)v33[5];
      v33[5] = v22;
      goto LABEL_16;
    }
    if (dword_10003F6E0 <= 30)
    {
      if (dword_10003F6E0 != -1 || (v14 = _LogCategory_Initialize(&dword_10003F6E0, 30), v11 = v28, v14))
      {
        v12 = CUPrintPID(self->_pid, v9, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetAuthorizedDevices:]", 30, "GetAuthorizedDevices: %@, from %@", v11, v13);

        v11 = v28;
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID"));
    if (v15)
    {
      if (-[NSString isEqualToString:](self->_appID, "isEqualToString:", v15)
        || (v16 = (id *)(v33 + 5),
            v26 = (id)v33[5],
            v17 = -[DADaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26),
            objc_storeStrong(v16, v26),
            (v17 & 1) != 0))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getAuthorizedDevices:](self->_daemon, "getAuthorizedDevices:", v15));
        reply = xpc_dictionary_create_reply(v4);
        v20 = reply;
        if (reply)
        {
          if (v18)
            CUXPCEncodeNSArrayOfObjects(reply, "devs", v18);
          -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v20);
        }
        else if (dword_10003F6E0 <= 90
               && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
        {
          LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetAuthorizedDevices:]", 90, "### GetAuthorizedDevices create reply failed");
        }

        goto LABEL_15;
      }
      v25 = DAErrorF(350001, "Mismatched bundleID");
      v24 = objc_claimAutoreleasedReturnValue(v25);
    }
    else
    {
      v23 = DAErrorF(350001, "No appID");
      v24 = objc_claimAutoreleasedReturnValue(v23);
    }
    v18 = (void *)v33[5];
    v33[5] = v24;
LABEL_15:

LABEL_16:
  }

  ((void (*)(_QWORD *))v5[2])(v5);
  _Block_object_dispose(&v32, 8);

}

- (void)_xpcGetDevices:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int accessLevel;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  void *v18;
  id *v19;
  int v20;
  uint64_t v21;
  void *v22;
  xpc_object_t reply;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id obj;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_10001B688;
  v44 = sub_10001B698;
  v45 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001F2A0;
  v37[3] = &unk_1000391F8;
  v39 = &v40;
  v37[4] = self;
  v4 = a3;
  v38 = v4;
  v5 = objc_retainBlock(v37);
  v7 = self->_appID;
  if (!v7)
  {
    v25 = DAErrorF(350001, "No valid app identifier");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)v41[5];
    v41[5] = v26;

    goto LABEL_25;
  }
  v36 = 0;
  v8 = objc_opt_class(DASession, v6);
  v9 = (id *)(v41 + 5);
  obj = (id)v41[5];
  CUXPCDecodeObject(v4, "sess", v8, &v36, &obj);
  objc_storeStrong(v9, obj);
  if (!v41[5])
  {
    if (v36)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bundleID"));
      v13 = v10;
      accessLevel = self->_accessLevel;
      if (accessLevel == 4)
        v15 = objc_msgSend(v10, "isEqualToString:", v7);
      else
        v15 = 0;
      if (accessLevel == 10 || (v15 & 1) != 0)
      {
        if (dword_10003F6E0 <= 30
          && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
        {
          v16 = v36;
          v17 = CUPrintPID(self->_pid, v11, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetDevices:]", 30, "GetDevices: %@, from %@", v16, v18);

        }
        v19 = (id *)(v41 + 5);
        v34 = (id)v41[5];
        v46 = 0;
        v20 = CUXPCDecodeUInt64RangedEx(v4, "dvFl", 0, -1, &v46, &v34);
        if (v20 == 6)
          v21 = v46;
        else
          v21 = 0;
        objc_storeStrong(v19, v34);
        if (v20 == 5)
          goto LABEL_23;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer getDevicesWithFlags:appID:](self->_daemon, "getDevicesWithFlags:appID:", v21, v13));
        reply = xpc_dictionary_create_reply(v4);
        v24 = reply;
        if (reply)
        {
          if (v22)
            CUXPCEncodeNSArrayOfObjects(reply, "devs", v22);
          -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v24);
        }
        else if (dword_10003F6E0 <= 90
               && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
        {
          v32 = DADeviceFlagsToString(v21);
          v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetDevices:]", 90, "### GetDevices with flags %@ create reply failed", v33);

        }
      }
      else
      {
        v30 = DAErrorF(350006, "Invalid app access");
        v31 = objc_claimAutoreleasedReturnValue(v30);
        v22 = (void *)v41[5];
        v41[5] = v31;
      }

    }
    else
    {
      v28 = DAErrorF(350001, "No session");
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v13 = (void *)v41[5];
      v41[5] = v29;
    }
LABEL_23:

  }
LABEL_25:

  ((void (*)(_QWORD *))v5[2])(v5);
  _Block_object_dispose(&v40, 8);

}

- (void)_xpcModifyDeviceSettings:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int accessLevel;
  id v21;
  uint64_t v22;
  uint64_t v23;
  xpc_object_t reply;
  uint64_t v25;
  void *v26;
  DADaemonServer *daemon;
  id *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id obj;
  id v50;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  id *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v54 = 0;
  v55 = (id *)&v54;
  v56 = 0x3032000000;
  v57 = sub_10001B688;
  v58 = sub_10001B698;
  v59 = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10001F89C;
  v51[3] = &unk_1000391F8;
  v53 = &v54;
  v51[4] = self;
  v4 = a3;
  v52 = v4;
  v5 = objc_retainBlock(v51);
  v6 = self->_appID;
  if (!v6)
  {
    v30 = DAErrorF(350001, "No appID");
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = v55[5];
    v55[5] = (id)v31;

    goto LABEL_30;
  }
  v7 = v55;
  obj = v55[5];
  v50 = 0;
  CUXPCDecodeNSString(v4, "id", &v50, &obj);
  objc_storeStrong(v7 + 5, obj);
  if (!v55[5])
  {
    if (!v50)
    {
      v33 = DAErrorF(350001, "No device ID");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      v35 = v55[5];
      v55[5] = (id)v34;

      goto LABEL_29;
    }
    v48 = 0;
    v9 = objc_opt_class(DADeviceSettings, v8);
    v10 = v55;
    v47 = v55[5];
    CUXPCDecodeObject(v4, "dvSt", v9, &v48, &v47);
    objc_storeStrong(v10 + 5, v47);
    if (v55[5])
      goto LABEL_28;
    if (!v48)
    {
      v36 = DAErrorF(350001, "No device settings");
      v37 = objc_claimAutoreleasedReturnValue(v36);
      v38 = v55[5];
      v55[5] = (id)v37;

      goto LABEL_28;
    }
    v46 = 0;
    v12 = objc_opt_class(DASession, v11);
    v13 = v55;
    v45 = v55[5];
    CUXPCDecodeObject(v4, "sess", v12, &v46, &v45);
    objc_storeStrong(v13 + 5, v45);
    if (v55[5])
    {
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    if (!v46)
    {
      v39 = DAErrorF(350001, "No session");
      v40 = objc_claimAutoreleasedReturnValue(v39);
      v14 = v55[5];
      v55[5] = (id)v40;
      goto LABEL_26;
    }
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bundleID"));
    if (!v14)
    {
      v41 = DAErrorF(350001, "No session bundleID");
      v42 = objc_claimAutoreleasedReturnValue(v41);
      v16 = v55[5];
      v55[5] = (id)v42;
      goto LABEL_25;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADaemonServer appAccessInfoForDeviceID:appID:](self->_daemon, "appAccessInfoForDeviceID:appID:", v50, v14));
    v16 = v15;
    if (!v15)
    {
      v43 = DAErrorF(350001, "No access info found for %@", v14);
      v23 = objc_claimAutoreleasedReturnValue(v43);
      goto LABEL_15;
    }
    v17 = objc_msgSend(v15, "state");
    accessLevel = self->_accessLevel;
    if (accessLevel == 4)
    {
      v21 = v17;
      if (!-[NSString isEqualToString:](v6, "isEqualToString:", v14) || v21 != (id)20 && v21 != (id)25)
        goto LABEL_14;
    }
    else if (accessLevel != 10)
    {
LABEL_14:
      v22 = DAErrorF(350006, "App's access restricted");
      v23 = objc_claimAutoreleasedReturnValue(v22);
LABEL_15:
      reply = v55[5];
      v55[5] = (id)v23;
LABEL_24:

LABEL_25:
LABEL_26:

      goto LABEL_27;
    }
    if (dword_10003F6E0 <= 30
      && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
    {
      v25 = CUPrintPID(self->_pid, v18, v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcModifyDeviceSettings:]", 30, "[%@] ModifyDeviceSettings: %@, %@, from %@", v26, v50, v48, v46);

    }
    daemon = self->_daemon;
    v28 = v55;
    v44 = v55[5];
    v29 = -[DADaemonServer modifyDeviceIdentifier:session:settings:error:](daemon, "modifyDeviceIdentifier:session:settings:error:", v50, v46, v48, &v44);
    objc_storeStrong(v28 + 5, v44);
    if (!v29)
      goto LABEL_25;
    reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", reply);
    }
    else if (dword_10003F6E0 <= 90
           && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
    {
      LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcModifyDeviceSettings:]", 90, "### ModifyDeviceSettings create reply failed");
    }
    goto LABEL_24;
  }
LABEL_29:

LABEL_30:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v54, 8);
}

- (void)_xpcSetDeviceState:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  _BOOL8 v7;
  uint64_t v8;
  id *v9;
  id *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  void *v15;
  id *v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  DADaemonServer *daemon;
  id *v27;
  xpc_object_t reply;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id obj;
  id v41;
  _QWORD v42[5];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  id v51[2];

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_10001B688;
  v49 = sub_10001B698;
  v50 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10001FDFC;
  v42[3] = &unk_1000391F8;
  v44 = &v45;
  v42[4] = self;
  v4 = a3;
  v43 = v4;
  v6 = objc_retainBlock(v42);
  v7 = self->_entitledState == 6 && !xpc_dictionary_get_BOOL(v4, "simA");
  v41 = 0;
  v8 = objc_opt_class(DADevice, v5);
  v9 = (id *)(v46 + 5);
  obj = (id)v46[5];
  CUXPCDecodeObject(v4, "devi", v8, &v41, &obj);
  objc_storeStrong(v9, obj);
  v10 = (id *)(v46 + 5);
  if (!v46[5])
  {
    if (!v41)
    {
      v29 = DAErrorF(350001, "No device");
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)v46[5];
      v46[5] = v30;

      goto LABEL_24;
    }
    v39 = 0;
    v51[0] = 0;
    v11 = CUXPCDecodeSInt64RangedEx(v4, "dvSt", 0x8000000000000000, 0x7FFFFFFFFFFFFFFFLL, v51, &v39) == 6
        ? v51[0]
        : 0;
    objc_storeStrong(v10, v39);
    if (!v46[5])
    {
      objc_msgSend(v41, "setState:", v11);
      v51[0] = 0;
      v13 = objc_opt_class(DASession, v12);
      v14 = (id *)(v46 + 5);
      v38 = (id)v46[5];
      CUXPCDecodeObject(v4, "sess", v13, v51, &v38);
      objc_storeStrong(v14, v38);
      if (v46[5])
      {
LABEL_23:

        goto LABEL_24;
      }
      if (v51[0])
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51[0], "bundleID"));
        if (-[NSString isEqualToString:](self->_appID, "isEqualToString:", v15)
          || (v16 = (id *)(v46 + 5),
              v37 = (id)v46[5],
              v17 = -[DADaemonXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v37),
              objc_storeStrong(v16, v37),
              (v17 & 1) != 0))
        {
          if (dword_10003F6E0 <= 30
            && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
          {
            v18 = v51[0];
            v19 = v41;
            v20 = DADeviceStateToString(v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            v24 = CUPrintPID(self->_pid, v22, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetDeviceState:]", 30, "SetDeviceState: %@, %@, state %@, from %@", v18, v19, v21, v25);

          }
          daemon = self->_daemon;
          v27 = (id *)(v46 + 5);
          v36 = (id)v46[5];
          -[DADaemonServer saveDevice:session:allowCreate:error:](daemon, "saveDevice:session:allowCreate:error:", v41, v51[0], v7, &v36);
          objc_storeStrong(v27, v36);
          if (v46[5])
            goto LABEL_22;
          reply = xpc_dictionary_create_reply(v4);
          if (reply)
          {
            -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", reply);
          }
          else if (dword_10003F6E0 <= 90
                 && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
          {
            LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetDeviceState:]", 90, "### SetDeviceState create reply failed");
          }
        }
        else
        {
          v34 = DAErrorF(350001, "Mismatched bundleID");
          v35 = objc_claimAutoreleasedReturnValue(v34);
          reply = (xpc_object_t)v46[5];
          v46[5] = v35;
        }

      }
      else
      {
        v32 = DAErrorF(350001, "No session");
        v33 = objc_claimAutoreleasedReturnValue(v32);
        v15 = (void *)v46[5];
        v46[5] = v33;
      }
LABEL_22:

      goto LABEL_23;
    }
  }
LABEL_24:

  ((void (*)(_QWORD *))v6[2])(v6);
  _Block_object_dispose(&v45, 8);

}

- (void)_xpcSetPartialIPs:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id *v17;
  DADaemonServer *daemon;
  xpc_object_t reply;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _OWORD v27[2];
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = sub_10001B688;
  v39 = sub_10001B698;
  v40 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000202A4;
  v32[3] = &unk_1000391F8;
  v34 = &v35;
  v32[4] = self;
  v4 = a3;
  v33 = v4;
  v5 = objc_retainBlock(v32);
  v30 = 0u;
  v31 = 0u;
  xpc_connection_get_audit_token(self->_xpcCnx, &v30);
  v6 = (void *)xpc_copy_entitlement_for_token(0, &v30);
  v7 = v6;
  if (v6)
  {
    v29 = 0;
    if (xpc_dictionary_get_BOOL(v6, "com.apple.DeviceAccess"))
    {
      if (dword_10003F6E0 <= 30
        && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 30)))
      {
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetPartialIPs:]", 30, "setPartialIPs: allowing entitled process to set for arbitrary app");
      }
      CUXPCDecodeNSString(v4, "bndI", &v29, 0);
      goto LABEL_12;
    }
  }
  else
  {
    v29 = 0;
  }
  v8 = v36;
  obj = v36[5];
  v27[0] = v30;
  v27[1] = v31;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v27, &obj));
  objc_storeStrong(v8 + 5, obj);
  v11 = objc_opt_class(LSApplicationRecord, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    v13 = v29;
    v29 = v12;

  }
LABEL_12:
  if (!v29)
  {
    v20 = DAErrorF(350001, "No App Bundle ID");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = v36[5];
    v36[5] = (id)v21;

    goto LABEL_20;
  }
  *(_QWORD *)&v27[0] = 0;
  v15 = objc_opt_class(DAPartialIP, v14);
  v16 = v36;
  v26 = v36[5];
  CUXPCDecodeNSArrayOfClass(v4, "IPFr", v15, v27, &v26);
  objc_storeStrong(v16 + 5, v26);
  v17 = v36 + 5;
  if (!v36[5])
  {
    if (!*(_QWORD *)&v27[0])
    {
      v23 = DAErrorF(350001, "No partial IPs");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      reply = v36[5];
      v36[5] = (id)v24;
LABEL_18:

      goto LABEL_19;
    }
    daemon = self->_daemon;
    v25 = 0;
    -[DADaemonServer setPartialIPsForAppBundleID:partialIPs:error:](daemon, "setPartialIPsForAppBundleID:partialIPs:error:", v29, *(_QWORD *)&v27[0], &v25);
    objc_storeStrong(v17, v25);
    if (!v36[5])
    {
      reply = xpc_dictionary_create_reply(v4);
      if (reply)
      {
        -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", reply);
      }
      else if (dword_10003F6E0 <= 90
             && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
      {
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcSetPartialIPs:]", 90, "### SetPartialIPs create reply failed");
      }
      goto LABEL_18;
    }
  }
LABEL_19:

LABEL_20:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v35, 8);
}

- (void)_xpcBluetoothPairingMsg:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  DADaemonServer *daemon;
  void *v11;
  id v12;
  id v13;
  void *v14;
  xpc_object_t reply;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id obj;
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10001B688;
  v37 = sub_10001B698;
  v38 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10002070C;
  v30[3] = &unk_1000391F8;
  v32 = &v33;
  v30[4] = self;
  v4 = a3;
  v31 = v4;
  v5 = objc_retainBlock(v30);
  if (-[DADaemonXPCConnection accessLevel](self, "accessLevel") != 10)
  {
    v17 = DAErrorF(350001, "process not entitled");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)v34[5];
    v34[5] = v18;

    goto LABEL_14;
  }
  v6 = (id *)(v34 + 5);
  obj = (id)v34[5];
  v29 = 0;
  CUXPCDecodeNSString(v4, "mSTyp", &v29, &obj);
  objc_storeStrong(v6, obj);
  if (v29)
  {
    if (objc_msgSend(v29, "isEqualToString:", CFSTR("BTPRsp")))
    {
      v27 = 0;
      v8 = objc_opt_class(DABluetoothPairingInfo, v7);
      v9 = (id *)(v34 + 5);
      v26 = (id)v34[5];
      CUXPCDecodeObject(v4, "btPI", v8, &v27, &v26);
      objc_storeStrong(v9, v26);
      if (!v27)
      {
        v23 = DAErrorF(350001, "Invalid Bluetooth pairing info");
        v24 = objc_claimAutoreleasedReturnValue(v23);
        v25 = (void *)v34[5];
        v34[5] = v24;

        goto LABEL_13;
      }
      daemon = self->_daemon;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bluetoothIdentifier"));
      v12 = objc_msgSend(v27, "accept");
      v13 = objc_msgSend(v27, "pairingType");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "passkey"));
      -[DADaemonServer respondToBluetoothPairingRequest:accept:pairingType:passkey:](daemon, "respondToBluetoothPairingRequest:accept:pairingType:passkey:", v11, v12, v13, v14);

      reply = xpc_dictionary_create_reply(v4);
      -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", reply);
    }
    else
    {
      if (dword_10003F6E0 <= 90
        && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
      {
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcBluetoothPairingMsg:]", 90, "### XPC unknown message subtype: '%@'", v29);
      }
      if (!CUXPCDictionaryExpectsReply(v4))
        goto LABEL_13;
      v16 = DAErrorF(350002, "Unknown message type: '%@'", v29);
      reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v16);
      -[DADaemonXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", reply, v4);
    }

  }
  else
  {
    v20 = DAErrorF(350001, "Invalid Bluetooth pairing message subtype");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)v34[5];
    v34[5] = v21;

  }
LABEL_13:

LABEL_14:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v33, 8);
}

- (void)_xpcGetPartialIPs:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  DADaemonServer *daemon;
  id *v15;
  id v16;
  xpc_object_t reply;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id obj;
  id v23;
  _OWORD v24[2];
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = (id *)&v28;
  v30 = 0x3032000000;
  v31 = sub_10001B688;
  v32 = sub_10001B698;
  v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100020B0C;
  v25[3] = &unk_1000391F8;
  v27 = &v28;
  v25[4] = self;
  v4 = a3;
  v26 = v4;
  v5 = objc_retainBlock(v25);
  memset(v24, 0, sizeof(v24));
  xpc_connection_get_audit_token(self->_xpcCnx, v24);
  v6 = (void *)xpc_copy_entitlement_for_token(0, v24);
  v7 = v6;
  if (v6 && xpc_dictionary_get_BOOL(v6, "com.apple.DeviceAccess"))
  {
    v8 = v29;
    obj = v29[5];
    v23 = 0;
    CUXPCDecodeNSString(v4, "bndI", &v23, &obj);
    objc_storeStrong(v8 + 5, obj);
    v9 = v23;
    if (v23)
    {
      if (dword_10003F6E0 <= 30)
      {
        if (dword_10003F6E0 != -1 || (v13 = _LogCategory_Initialize(&dword_10003F6E0, 30), v9 = v23, v13))
        {
          LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetPartialIPs:]", 30, "getPartialIPsWithAppBundleID: %@", v9);
          v9 = v23;
        }
      }
      daemon = self->_daemon;
      v15 = v29;
      v21 = v29[5];
      v16 = (id)objc_claimAutoreleasedReturnValue(-[DADaemonServer getPartialIPsWithAppBundleID:error:](daemon, "getPartialIPsWithAppBundleID:error:", v9, &v21));
      objc_storeStrong(v15 + 5, v21);
      reply = xpc_dictionary_create_reply(v4);
      v18 = reply;
      if (reply)
      {
        if (v16)
          CUXPCEncodeNSArrayOfObjects(reply, "IPFr", v16);
        -[DADaemonXPCConnection _xpcSendReply:](self, "_xpcSendReply:", v18);
      }
      else if (dword_10003F6E0 <= 90
             && (dword_10003F6E0 != -1 || _LogCategory_Initialize(&dword_10003F6E0, 90)))
      {
        LogPrintF(&dword_10003F6E0, "-[DADaemonXPCConnection _xpcGetPartialIPs:]", 90, "### GetPartialIPs create reply failed");
      }

    }
    else
    {
      v19 = DAErrorF(350001, "No App ID");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v16 = v29[5];
      v29[5] = (id)v20;
    }

  }
  else
  {
    v10 = DAErrorF(350001, "process not entitled");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v29[5];
    v29[5] = (id)v11;

  }
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v28, 8);
}

- (int)accessLevel
{
  return self->_accessLevel;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (DADaemonServer)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_activatedSession, 0);
  objc_storeStrong((id *)&self->_activatedDiscovery, 0);
}

@end
