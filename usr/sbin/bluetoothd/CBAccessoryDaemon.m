@implementation CBAccessoryDaemon

- (id)description
{
  return -[CBAccessoryDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v5;
  id *v6;
  unsigned int v7;
  const char *v8;
  id *v9;
  CBDiscovery *connectionMonitor;
  id *v11;
  NSMutableDictionary *accessoryInfoMap;
  __CFString *v13;
  __CFString *v14;
  _QWORD v16[5];
  int v17;
  id v18;
  id v19;
  id v20;
  id obj;
  int v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3032000000;
  v26 = sub_10006247C;
  v27 = sub_1000622F8;
  v28 = 0;
  v22 = 12;
  obj = 0;
  v5 = objc_opt_class(self);
  if (a3 >= 0x15u)
    CUAppendF(&obj, &v22, "%@", v5);
  else
    CUAppendF(&obj, &v22, "== %@", v5);
  objc_storeStrong(&v28, obj);
  v6 = v24 + 5;
  v20 = v24[5];
  v7 = -[NSMutableDictionary count](self->_accessoryInfoMap, "count");
  if (self->_connectionMonitor)
    v8 = "yes";
  else
    v8 = "no";
  CUAppendF(&v20, &v22, "devices %d, discovery %s", v7, v8);
  objc_storeStrong(v6, v20);
  if (a3 <= 0x14u)
  {
    v9 = v24;
    v19 = v24[5];
    NSAppendPrintF_safe(&v19, " ==\n");
    objc_storeStrong(v9 + 5, v19);
    connectionMonitor = self->_connectionMonitor;
    if (connectionMonitor)
    {
      v11 = v24;
      v18 = v24[5];
      NSAppendPrintF_safe(&v18, "%@\n", connectionMonitor);
      objc_storeStrong(v11 + 5, v18);
    }
    accessoryInfoMap = self->_accessoryInfoMap;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10007B944;
    v16[3] = &unk_100917738;
    v16[4] = &v23;
    v17 = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryInfoMap, "enumerateKeysAndObjectsUsingBlock:", v16);
  }
  v13 = (__CFString *)v24[5];
  if (!v13)
    v13 = &stru_100941758;
  v14 = v13;
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (void)activate
{
  CUSystemMonitor *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977910 <= 30 && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon activate]", 30, "Activate");
  v3 = self->_systemMonitor;
  if (!v3)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    objc_storeStrong((id *)&self->_systemMonitor, v3);
    -[CUSystemMonitor setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10007BAF0;
    v5[3] = &unk_100917080;
    v5[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](v3, "setScreenOnChangedHandler:", v5);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10007BAF8;
    v4[3] = &unk_100917080;
    v4[4] = self;
    -[CUSystemMonitor setScreenLockedChangedHandler:](v3, "setScreenLockedChangedHandler:", v4);
    -[CUSystemMonitor activateWithCompletion:](v3, "activateWithCompletion:", &stru_100917758);
  }
  -[CBAccessoryDaemon prefsChanged](self, "prefsChanged");

}

- (void)invalidate
{
  OS_dispatch_source *periodicTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  CUSystemMonitor *systemMonitor;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977910 <= 30 && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon invalidate]", 30, "Invalidate");
  -[CBAccessoryDaemon _accessoryDiscoveryEnsureStopped](self, "_accessoryDiscoveryEnsureStopped");
  -[CBAccessoryDaemon _connectionMonitorEnsureStopped](self, "_connectionMonitorEnsureStopped");
  periodicTimer = self->_periodicTimer;
  if (periodicTimer)
  {
    v4 = periodicTimer;
    dispatch_source_cancel(v4);
    v5 = self->_periodicTimer;
    self->_periodicTimer = 0;

  }
  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

}

- (id)diagnosticControl:(id)a3 error:(id *)a4
{
  id v6;
  CFTypeID TypeID;
  uint64_t TypedValue;
  id v9;
  const char *v10;
  const char *v11;
  __CFString *v12;
  CBDevice *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __CFString *v26;
  id v27;
  char v28;
  char v29;
  BOOL v30;
  void *v31;
  void *v32;
  CBDevice *accessoryFakeDevice;
  uint64_t v35;
  uint64_t v36;
  id *v37;
  CBAccessoryDaemon *v38;
  BOOL v39;
  char v40;
  unsigned int v41;
  id v42;
  unsigned int v43;
  unsigned __int8 v44;
  unsigned int v45;
  unsigned __int8 v46;
  unsigned int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v6 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("iStr"), TypeID, 0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(TypedValue));
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  if (v10)
  {
    v11 = v10;
    if (!strcasecmp(v10, "accessory-help"))
    {
      v12 = CFSTR("accessory-fake-add[,paramKey1=paramValue1][,paramKey2=paramValue2][,etc.] -- Add/update fake accessory.\n    id=accessoryID\n    leftPercent=0-100\n    leftState=unknown/charging/discharging\n    rightPercent=0-100\n    rightState=unknown/charging/discharging\n    casePercent=0-100\n    caseState=unknown/charging/discharging\n    lidClosed=yes/no\n    obc=yes/no\naccessory-fake-remove -- Remove fake accessory\n\nExample: accessory-fake-add,casePercent=54,lidClosed=yes\n\n");
      goto LABEL_70;
    }
    if (!strcasecmp(v11, "accessory-fake-remove"))
    {
      v13 = self->_accessoryFakeDevice;
      if (v13)
      {
        if (dword_100977910 <= 30
          && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
        {
          LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon diagnosticControl:error:]", 30, "Fake accessory remove: %@", v13);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](v13, "identifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accessoryInfoMap, "objectForKeyedSubscript:", v31));
        objc_msgSend(v32, "invalidate");
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accessoryInfoMap, "setObject:forKeyedSubscript:", 0, v31);
        accessoryFakeDevice = self->_accessoryFakeDevice;
        self->_accessoryFakeDevice = 0;

        v12 = CFSTR("Removed accessory\n");
      }
      else
      {
        v12 = CFSTR("No fake accessory\n");
      }

    }
    else
    {
      if (stricmp_prefix(v11, "accessory-fake-add"))
      {
        v12 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("error: unsupported command '%s'. See accessory-help\n"), v11);
        goto LABEL_70;
      }
      v37 = a4;
      v38 = self;
      v42 = v6;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11 + 18));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(",")));

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v16)
      {
        v17 = v16;
        v41 = 0;
        v39 = 0;
        v40 = 2;
        v18 = *(_QWORD *)v49;
        v45 = 82;
        v46 = 1;
        v19 = CFSTR("FakeAccessoryID");
        v47 = 78;
        v43 = 43;
        v44 = 1;
LABEL_13:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v20);
          if (!objc_msgSend(v21, "length"))
            goto LABEL_58;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("=")));
          if ((unint64_t)objc_msgSend(v22, "count") <= 1)
          {
            v12 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("error: bad parameter format '%@'. See accessory-help\n"), v21);
LABEL_63:

            goto LABEL_66;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 0));
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 1)));
          v25 = objc_msgSend(v24, "UTF8String");
          if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("id")))
          {
            if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("leftPercent")))
            {
              if (!objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("leftState")))
              {
                v27 = v24;
                if (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("Charging")))
                {
                  if (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("Discharging")))
                  {
                    if (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("FullyCharged")))
                      v28 = 4 * (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("OBC")) == 0);
                    else
                      v28 = 3;
                  }
                  else
                  {
                    v28 = 2;
                  }
                }
                else
                {
                  v28 = 1;
                }
                v46 = v28;
LABEL_56:

                goto LABEL_57;
              }
              if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("rightPercent")))
              {
                if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("rightState")))
                {
                  if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("casePercent")))
                  {
                    if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("caseState")))
                    {
                      if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("lidClosed")))
                      {
                        if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("obcMinutes")))
                        {
                          v12 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("error: bad parameter key '%@'. See accessory-help\n"), v23);

                          goto LABEL_63;
                        }
                        v41 = objc_msgSend(v24, "intValue");
                      }
                      else
                      {
                        v30 = !strnicmpx(v25, -1, "true")
                           || !strnicmpx(v25, -1, "yes")
                           || !strnicmpx(v25, -1, "y")
                           || !strnicmpx(v25, -1, "on")
                           || strnicmpx(v25, -1, "1") == 0;
                        v39 = v30;
                      }
                    }
                    else
                    {
                      v40 = sub_10007C2C0(v24);
                    }
                  }
                  else
                  {
                    v43 = objc_msgSend(v24, "intValue");
                  }
                  goto LABEL_57;
                }
                v27 = v24;
                if (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("Charging")))
                {
                  if (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("Discharging")))
                  {
                    if (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("FullyCharged")))
                      v29 = 4 * (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("OBC")) == 0);
                    else
                      v29 = 3;
                  }
                  else
                  {
                    v29 = 2;
                  }
                }
                else
                {
                  v29 = 1;
                }
                v44 = v29;
                goto LABEL_56;
              }
              v45 = objc_msgSend(v24, "intValue");
            }
            else
            {
              v47 = objc_msgSend(v24, "intValue");
            }
          }
          else
          {
            v26 = (__CFString *)v24;

            v19 = v26;
          }
LABEL_57:

LABEL_58:
          if (v17 == (id)++v20)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
            if (v17)
              goto LABEL_13;
            goto LABEL_65;
          }
        }
      }
      v41 = 0;
      v39 = 0;
      v40 = 2;
      v45 = 82;
      v46 = 1;
      v47 = 78;
      v43 = 43;
      v44 = 1;
      v19 = CFSTR("FakeAccessoryID");
LABEL_65:

      HIDWORD(v36) = v41;
      BYTE1(v36) = v39;
      LOBYTE(v36) = v40;
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CBAccessoryDaemon diagnosticAccessoryFakeWithIdentifier:leftPercent:leftState:rightPercent:rightState:casePercent:caseState:lidClosed:obcMinutes:error:](v38, "diagnosticAccessoryFakeWithIdentifier:leftPercent:leftState:rightPercent:rightState:casePercent:caseState:lidClosed:obcMinutes:error:", v19, v47, v46, v45, v44, v43, v36, v37));
LABEL_66:
      v6 = v42;

    }
  }
  else if (a4)
  {
    v35 = CBErrorF(4294960591, "No input string");
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v35);
  }
  else
  {
    v12 = 0;
  }
LABEL_70:

  return v12;
}

- (id)diagnosticAccessoryFakeWithIdentifier:(id)a3 leftPercent:(int)a4 leftState:(unsigned __int8)a5 rightPercent:(int)a6 rightState:(unsigned __int8)a7 casePercent:(int)a8 caseState:(unsigned __int8)a9 lidClosed:(BOOL)a10 obcMinutes:(int)a11 error:(id *)a12
{
  int v14;
  id v17;
  CBDevice **p_accessoryFakeDevice;
  CBDevice *accessoryFakeDevice;
  CBDevice *v20;
  CBDevice *v21;
  int v22;
  int v23;
  int v24;
  __CFString *v25;
  __CFString *v26;
  int v28;
  CBAccessoryDaemon *v29;

  v28 = a7;
  v14 = a5;
  v17 = a3;
  v29 = self;
  accessoryFakeDevice = self->_accessoryFakeDevice;
  p_accessoryFakeDevice = &self->_accessoryFakeDevice;
  v20 = accessoryFakeDevice;
  v21 = v20;
  if (!v20)
  {
    v21 = (CBDevice *)objc_alloc_init((Class)CBDevice);
    objc_storeStrong((id *)p_accessoryFakeDevice, v21);
  }
  -[CBDevice setAccessoryStatusFlags:](v21, "setAccessoryStatusFlags:", a10);
  -[CBDevice setAccessoryStatusOBCTime:](v21, "setAccessoryStatusOBCTime:", (double)(60 * a11));
  if (a4 >= 100)
    v22 = 100;
  else
    v22 = a4;
  -[CBDevice setBatteryInfoLeft:](v21, "setBatteryInfoLeft:", v22 & ~(v22 >> 31) | (v14 << 8));
  if (a6 >= 100)
    v23 = 100;
  else
    v23 = a6;
  -[CBDevice setBatteryInfoRight:](v21, "setBatteryInfoRight:", v23 & ~(v23 >> 31) | (v28 << 8));
  if (a8 >= 100)
    v24 = 100;
  else
    v24 = a8;
  -[CBDevice setBatteryInfoCase:](v21, "setBatteryInfoCase:", v24 & ~(v24 >> 31) | (a9 << 8));
  -[CBDevice setIdentifier:](v21, "setIdentifier:", v17);
  -[CBDevice setName:](v21, "setName:", CFSTR("Fake Accessory"));
  -[CBDevice setProductID:](v21, "setProductID:", 8206);
  -[CBDevice setVendorID:](v21, "setVendorID:", 76);
  -[CBDevice setVendorIDSource:](v21, "setVendorIDSource:", 1);
  if (dword_100977910 <= 30 && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon diagnosticAccessoryFakeWithIdentifier:leftPercent:leftState:rightPercent:rightState:casePercent:caseState:lidClosed:obcMinutes:error:]", 30, "Fake accessory add/update: %@", v21);
  -[CBAccessoryDaemon _accessoryDiscoveryFoundDevice:](v29, "_accessoryDiscoveryFoundDevice:", v21);
  if (v20)
    v25 = CFSTR("Updated accessory\n");
  else
    v25 = CFSTR("Added accessory\n");
  v26 = v25;

  return v26;
}

- (id)findPrimaryCBDevice:(id)a3
{
  id v3;
  char v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  int v21;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = a3;
  v4 = 1;
  while ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemonServer, "stackController"));
    v6 = 1;
    v25 = v5;
    do
    {
      v7 = (v5 != 0) & v6;
      if (v7 != 1)
        break;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDevicesWithFlags:error:", 2, 0));
      v9 = v8;
      if (v8)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "findMyCaseIdentifier"));
              v17 = v3;
              v18 = v16;
              if (v18 == v17)
              {

LABEL_21:
                if (dword_100977910 <= 30
                  && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
                {
                  LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon findPrimaryCBDevice:]", 30, "Found primary CBDevice for accessory with identifier %@: %@", v17, v15);
                }
                v24 = v15;
                v21 = 1;
                v9 = v10;
                goto LABEL_27;
              }
              v19 = v18;
              if ((v3 == 0) != (v18 != 0))
              {
                v20 = objc_msgSend(v17, "isEqual:", v18);

                if (v20)
                  goto LABEL_21;
              }
              else
              {

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v12)
              continue;
            break;
          }
          v21 = 0;
LABEL_27:
          v5 = v25;
          v7 = 1;
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

      v6 = 0;
    }
    while (!v21);

    v4 = 0;
    if (v7)
      goto LABEL_33;
  }
  v24 = 0;
LABEL_33:

  return v24;
}

- (void)prefsChanged
{
  uint64_t Int64;
  BOOL v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  uint64_t Double;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;

  v22 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.bluetooth"), CFSTR("accessoryDaemonConnections"), &v22);
  if (v22)
    v4 = 0;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  if (self->_prefAccessoryDaemonConnectionMonitor != v5)
  {
    if (dword_100977910 <= 30
      && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    {
      v6 = "yes";
      if (v5)
        v7 = "no";
      else
        v7 = "yes";
      if (!v5)
        v6 = "no";
      LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon prefsChanged]", 30, "AccessoryDaemonConnectionMonitor: %s -> %s", v7, v6);
    }
    self->_prefAccessoryDaemonConnectionMonitor = v5;
  }
  Double = CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("accessoryDaemonConnectSeconds"), &v22);
  if (v22)
  {
    Double = arc4random_uniform(0x3840u);
    v10 = (double)(Double + 72000);
  }
  else
  {
    v10 = v9;
  }
  if (v10 != self->_prefAccessoryDaemonConnectSeconds)
  {
    if (dword_100977910 <= 30)
    {
      if (dword_100977910 != -1 || (Double = _LogCategory_Initialize(&dword_100977910, 30), (_DWORD)Double))
      {
        v11 = CUPrintDurationDouble(Double);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = CUPrintDurationDouble(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon prefsChanged]", 30, "AccessoryDaemonConnectSeconds: %@ -> %@", v12, v14);

      }
    }
    self->_prefAccessoryDaemonConnectSeconds = v10;
  }
  v15 = CFPrefs_GetDouble(CFSTR("com.apple.bluetooth"), CFSTR("accessoryDaemonStayConnectSeconds"), &v22);
  if (v22)
    v17 = 30.0;
  else
    v17 = v16;
  if (v17 != self->_prefAccessoryDaemonStayConnectedSeconds)
  {
    if (dword_100977910 <= 30)
    {
      if (dword_100977910 != -1 || (v15 = _LogCategory_Initialize(&dword_100977910, 30), (_DWORD)v15))
      {
        v18 = CUPrintDurationDouble(v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = CUPrintDurationDouble(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon prefsChanged]", 30, "AccessoryDaemonStayConnectSeconds: %@ -> %@", v19, v21);

      }
    }
    self->_prefAccessoryDaemonStayConnectedSeconds = v17;
  }
  -[CBAccessoryDaemon _update](self, "_update");
}

- (void)_screenOnChanged
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  const char *v6;
  const char *v7;

  v3 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  v4 = -[CUSystemMonitor screenLocked](self->_systemMonitor, "screenLocked");
  if (dword_100977910 <= 30)
  {
    v5 = v4;
    if (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30))
    {
      v6 = "off";
      if (v3)
        v6 = "on";
      v7 = "no";
      if (v5)
        v7 = "yes";
      LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _screenOnChanged]", 30, "ScreenOn changed: %s, ScreenLocked changed: %s", v6, v7);
    }
  }
  -[CBAccessoryDaemon _update](self, "_update");
}

- (void)_update
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unsigned __int8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDaemonServer stackController](self->_daemonServer, "stackController"));
  if (!v3)
    goto LABEL_15;
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getDevicesWithFlags:error:", 1, 0));
  if (!v5)
  {
LABEL_12:

LABEL_15:
    -[CBAccessoryDaemon _accessoryDiscoveryEnsureStopped](self, "_accessoryDiscoveryEnsureStopped", (_QWORD)v14);
    goto LABEL_16;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v7)
  {
LABEL_11:

    goto LABEL_12;
  }
  v8 = v7;
  v9 = *(_QWORD *)v15;
LABEL_5:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v9)
      objc_enumerationMutation(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "productID", (_QWORD)v14)));
    v12 = objc_msgSend(v11, "flags");

    if ((v12 & 0x100000) != 0)
      break;
    if (v8 == (id)++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  v13 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");

  if ((v13 & 1) == 0)
    goto LABEL_15;
  -[CBAccessoryDaemon _accessoryDiscoveryEnsureStarted](self, "_accessoryDiscoveryEnsureStarted");
LABEL_16:
  if (self->_prefAccessoryDaemonConnectionMonitor)
    -[CBAccessoryDaemon _connectionMonitorEnsureStarted](self, "_connectionMonitorEnsureStarted");
  else
    -[CBAccessoryDaemon _connectionMonitorEnsureStopped](self, "_connectionMonitorEnsureStopped");
  -[CBAccessoryDaemon _connectionMonitorUpdate](self, "_connectionMonitorUpdate");
}

- (void)_accessoryDiscoveryEnsureStarted
{
  CBDiscovery *v3;
  CBDiscovery *accessoryDiscovery;
  CBDiscovery *v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  if (!self->_accessoryDiscovery)
  {
    if (dword_100977910 <= 30
      && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    {
      LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _accessoryDiscoveryEnsureStarted]", 30, "Accessory discovery start");
    }
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    accessoryDiscovery = self->_accessoryDiscovery;
    self->_accessoryDiscovery = v3;
    v5 = v3;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAccessoryDaemon description](self, "description"));
    -[CBDiscovery setAppID:](v5, "setAppID:", v6);

    -[CBDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", 0x180000000080);
    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007CDEC;
    v8[3] = &unk_1009171C0;
    v8[4] = v5;
    v8[5] = self;
    -[CBDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007CE08;
    v7[3] = &unk_1009171E8;
    v7[4] = v5;
    v7[5] = self;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v7);

  }
}

- (void)_accessoryDiscoveryEnsureStopped
{
  CBDiscovery *accessoryDiscovery;
  CBDevice *accessoryFakeDevice;
  NSMutableDictionary *accessoryInfoMap;

  if (self->_accessoryDiscovery
    && dword_100977910 <= 30
    && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
  {
    LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _accessoryDiscoveryEnsureStopped]", 30, "Accessory discovery stop");
  }
  -[CBDiscovery invalidate](self->_accessoryDiscovery, "invalidate");
  accessoryDiscovery = self->_accessoryDiscovery;
  self->_accessoryDiscovery = 0;

  accessoryFakeDevice = self->_accessoryFakeDevice;
  self->_accessoryFakeDevice = 0;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_accessoryInfoMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100917798);
  accessoryInfoMap = self->_accessoryInfoMap;
  self->_accessoryInfoMap = 0;

}

- (void)_accessoryDiscoveryFoundDevice:(id)a3
{
  void *v4;
  CBAccessoryInfo *v5;
  NSMutableDictionary *accessoryInfoMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  if (v4)
  {
    v5 = (CBAccessoryInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accessoryInfoMap, "objectForKeyedSubscript:", v4));
    if (!v5)
    {
      v5 = objc_alloc_init(CBAccessoryInfo);
      accessoryInfoMap = self->_accessoryInfoMap;
      if (!accessoryInfoMap)
      {
        v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v8 = self->_accessoryInfoMap;
        self->_accessoryInfoMap = v7;

        accessoryInfoMap = self->_accessoryInfoMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](accessoryInfoMap, "setObject:forKeyedSubscript:", v5, v4);
    }
    -[CBAccessoryInfo setCbDevice:](v5, "setCbDevice:", v14);
    v9 = objc_claimAutoreleasedReturnValue(-[CBAccessoryInfo primaryCBDevice](v5, "primaryCBDevice"));
    if (!v9
      || (v10 = (void *)v9,
          v11 = (unint64_t)objc_msgSend(v14, "changeFlags"),
          v10,
          (v11 & 0x80000000000) != 0))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBAccessoryDaemon findPrimaryCBDevice:](self, "findPrimaryCBDevice:", v12));
      -[CBAccessoryInfo setPrimaryCBDevice:](v5, "setPrimaryCBDevice:", v13);

    }
    if (dword_100977910 <= 30
      && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    {
      LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _accessoryDiscoveryFoundDevice:]", 30, "Accessory found: %@, device: %@", v5, v14);
    }
    -[CBAccessoryInfo powerSourceUpdate](v5, "powerSourceUpdate");

  }
}

- (void)_connectionMonitorEnsureStarted
{
  CBDiscovery *v3;
  CBDiscovery *connectionMonitor;
  CBDiscovery *v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];

  if (!self->_connectionMonitor)
  {
    if (dword_100977910 <= 30
      && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    {
      LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorEnsureStarted]", 30, "Connection monitor: start");
    }
    v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    connectionMonitor = self->_connectionMonitor;
    self->_connectionMonitor = v3;
    v5 = v3;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAccessoryDaemon description](self, "description"));
    -[CBDiscovery setAppID:](v5, "setAppID:", v6);

    -[CBDiscovery setDiscoveryFlags:](v5, "setDiscoveryFlags:", 0x80000A00000);
    -[CBDiscovery setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007D274;
    v9[3] = &unk_1009171C0;
    v9[4] = v5;
    v9[5] = self;
    -[CBDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007D328;
    v8[3] = &unk_1009171C0;
    v8[4] = v5;
    v8[5] = self;
    -[CBDiscovery setDeviceLostHandler:](v5, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007D3D4;
    v7[3] = &unk_1009171E8;
    v7[4] = v5;
    v7[5] = self;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v7);

  }
}

- (void)_connectionMonitorEnsureStopped
{
  CBDiscovery *connectionMonitor;

  if (self->_connectionMonitor
    && dword_100977910 <= 30
    && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
  {
    LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorEnsureStopped]", 30, "Connection monitor: stop");
  }
  -[CBDiscovery invalidate](self->_connectionMonitor, "invalidate");
  connectionMonitor = self->_connectionMonitor;
  self->_connectionMonitor = 0;

}

- (void)_connectionMonitorFoundDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CFTypeID TypeID;
  void *v9;
  double Double;
  uint64_t v11;
  double Current;
  id v13;
  id v14;
  NSMutableDictionary *connectionMap;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[10];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", objc_msgSend(v4, "productID")));
  if ((objc_msgSend(v5, "flags") & 0x100000) != 0)
  {
    if ((objc_msgSend(v4, "deviceFlags") & 0x40) != 0)
    {
      if (((unint64_t)objc_msgSend(v4, "deviceFlags") & 0x8000000000) != 0)
      {
        if (dword_100977910 <= 30
          && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
        {
          LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]", 30, "Connection monitor: skip FindMy managed: %@", v4);
        }
      }
      else
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMyCaseIdentifier"));
        if (v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionMap, "objectForKeyedSubscript:", v6));
          if (v7)
          {
            if (dword_100977910 <= 30
              && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
            {
              LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]", 30, "Connection monitor: skip already connected: %@", v4);
            }
          }
          else
          {
            TypeID = CFDictionaryGetTypeID();
            v9 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.bluetooth"), CFSTR("accessoryDaemonConnectTimes"), TypeID, 0);
            Double = CFDictionaryGetDouble(v9, v6, 0);
            Current = CFAbsoluteTimeGetCurrent();
            if (Current - Double < self->_prefAccessoryDaemonConnectSeconds)
            {
              if (dword_100977910 <= 30)
              {
                if (dword_100977910 != -1 || (v11 = _LogCategory_Initialize(&dword_100977910, 30), (_DWORD)v11))
                {
                  v18 = CUPrintDurationDouble(v11);
                  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
                  LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]", 30, "Connection monitor: skip connected too recently: %@, %@", v4, v19);

                }
              }
            }
            else
            {
              v13 = objc_alloc_init((Class)CBDevice);
              objc_msgSend(v13, "setIdentifier:", v6);
              if (dword_100977910 <= 30
                && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
              {
                LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]", 30, "Connection monitor: connect start %@", v13);
              }
              v14 = objc_alloc_init((Class)CBConnection);
              objc_msgSend(v14, "setConnectionFlags:", 256);
              objc_msgSend(v14, "setConnectionScanDutyCycle:", 6);
              objc_msgSend(v14, "setDispatchQueue:", self->_dispatchQueue);
              objc_msgSend(v14, "setPeerDevice:", v13);
              v20[0] = _NSConcreteStackBlock;
              v20[1] = 3221225472;
              v20[2] = sub_10007D974;
              v20[3] = &unk_1009177C0;
              v20[4] = v13;
              v20[5] = v14;
              v20[6] = self;
              v20[7] = v6;
              v20[8] = v9;
              *(double *)&v20[9] = Current;
              objc_msgSend(v14, "activateWithCompletion:", v20);
              connectionMap = self->_connectionMap;
              if (!connectionMap)
              {
                v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                v17 = self->_connectionMap;
                self->_connectionMap = v16;

                connectionMap = self->_connectionMap;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](connectionMap, "setObject:forKeyedSubscript:", v14, v6);

            }
          }

        }
        else if (dword_100977910 <= 30
               && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
        {
          LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]", 30, "Connection monitor: skip no FindMy case ID: %@", v4);
        }

      }
    }
    else if (dword_100977910 <= 30
           && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    {
      LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]", 30, "Connection monitor: skip not active route: %@", v4);
    }
  }
  else if (dword_100977910 <= 30
         && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
  {
    LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorFoundDevice:]", 30, "Connection monitor: skip non-BTC: %@", v4);
  }

}

- (void)_connectionMonitorUpdate
{
  double Current;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  double v11;
  CFTypeID TypeID;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  OS_dispatch_source *v24;
  OS_dispatch_source *periodicTimer;
  dispatch_source_t v26;
  OS_dispatch_source *v27;
  _QWORD handler[4];
  OS_dispatch_source *v29;
  CBAccessoryDaemon *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  Current = CFAbsoluteTimeGetCurrent();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_connectionMap, "allKeys"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionMap, "objectForKeyedSubscript:", v9));
        objc_msgSend(v10, "connectedTime");
        if (v11 != 0.0 && Current - v11 >= self->_prefAccessoryDaemonStayConnectedSeconds)
        {
          if (dword_100977910 <= 30
            && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
          {
            LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorUpdate]", 30, "Connection monitor: auto-disconnect %@", v9);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionMap, "setObject:forKeyedSubscript:", 0, v9);
          objc_msgSend(v10, "invalidate");
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v6);
  }

  TypeID = CFDictionaryGetTypeID();
  v13 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.bluetooth"), CFSTR("accessoryDaemonConnectTimes"), TypeID, 0);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
        if (Current - CFDictionaryGetDouble(v13, v20, 0) >= self->_prefAccessoryDaemonConnectSeconds)
        {
          if (dword_100977910 <= 30
            && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
          {
            LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorUpdate]", 30, "Connection monitor: remove stale connect time %@", v20);
          }
          if (!v17)
          {
            v21 = objc_msgSend(v13, "mutableCopy");
            v22 = v21;
            if (v21)
              v23 = v21;
            else
              v23 = objc_alloc_init((Class)NSMutableDictionary);
            v17 = v23;

          }
          objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v20);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  if (objc_msgSend(v17, "count"))
  {
    CFPrefs_SetValue(CFSTR("com.apple.bluetooth"), CFSTR("accessoryDaemonConnectTimes"), v17);
  }
  else if (v17)
  {
    CFPrefs_RemoveValue(CFSTR("com.apple.bluetooth"), CFSTR("accessoryDaemonConnectTimes"));
  }
  if (objc_msgSend(v17, "count") || -[NSMutableDictionary count](self->_connectionMap, "count"))
  {
    v24 = self->_periodicTimer;
    if (v24)
    {
LABEL_52:

      goto LABEL_53;
    }
    if (dword_100977910 <= 30
      && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
    {
      LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorUpdate]", 30, "Connection monitor: periodic timer start");
    }
    v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_periodicTimer, v26);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007DFF0;
    handler[3] = &unk_100917058;
    v24 = v26;
    v29 = v24;
    v30 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v24, handler);
    CUDispatchTimerSet(v24, 30.0, 30.0, 5.0);
    dispatch_activate((dispatch_object_t)v24);
    v27 = v29;
LABEL_51:

    goto LABEL_52;
  }
  periodicTimer = self->_periodicTimer;
  if (periodicTimer)
  {
    if (dword_100977910 >= 31)
    {
      v24 = periodicTimer;
LABEL_57:
      dispatch_source_cancel((dispatch_source_t)v24);
      v27 = self->_periodicTimer;
      self->_periodicTimer = 0;
      goto LABEL_51;
    }
    if (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30))
      LogPrintF_safe(&dword_100977910, "-[CBAccessoryDaemon _connectionMonitorUpdate]", 30, "Connection monitor: periodic timer stop");
    v24 = self->_periodicTimer;
    if (v24)
      goto LABEL_57;
  }
LABEL_53:

}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
  objc_storeStrong((id *)&self->_daemonServer, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_periodicTimer, 0);
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_connectionMap, 0);
  objc_storeStrong((id *)&self->_accessoryFakeDevice, 0);
  objc_storeStrong((id *)&self->_accessoryInfoMap, 0);
  objc_storeStrong((id *)&self->_accessoryDiscovery, 0);
}

@end
