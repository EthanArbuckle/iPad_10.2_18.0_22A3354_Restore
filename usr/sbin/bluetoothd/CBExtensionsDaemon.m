@implementation CBExtensionsDaemon

- (void)_triggerPendingExtension
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_extensionMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100917150);
}

- (NSString)description
{
  return (NSString *)-[CBExtensionsDaemon descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v5;
  const char *v6;
  id v7;
  void *v8;
  id *v9;
  NSMutableDictionary *extensionMap;
  int v11;
  id *v12;
  id *v13;
  id *v14;
  NSMutableDictionary *v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD v19[5];
  int v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  id obj;
  id v30;
  int v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3032000000;
  v35 = sub_10006245C;
  v36 = sub_1000622E8;
  v37 = 0;
  v31 = 12;
  v5 = a3;
  v30 = 0;
  if (a3 >= 0x15u)
    v6 = "%@";
  else
    v6 = "== %@";
  v7 = objc_msgSend((id)objc_opt_class(self), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  CUAppendF(&v30, &v31, v6);
  objc_storeStrong(&v37, v30);

  v9 = v33;
  obj = v33[5];
  CUAppendF(&obj, &v31, "extensions %d", -[NSMutableDictionary count](self->_extensionMap, "count"));
  objc_storeStrong(v9 + 5, obj);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  extensionMap = self->_extensionMap;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100074ECC;
  v24[3] = &unk_100916FE0;
  v24[4] = &v25;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](extensionMap, "enumerateKeysAndObjectsUsingBlock:", v24);
  v11 = *((_DWORD *)v26 + 6);
  if (v11 >= 1)
  {
    v12 = v33;
    v23 = v33[5];
    CUAppendF(&v23, &v31, "triggered: %d", v11);
    objc_storeStrong(v12 + 5, v23);
  }
  if (self->_remoteAlertHandle)
  {
    v13 = v33;
    v22 = v33[5];
    CUAppendF(&v22, &v31, "UI active");
    objc_storeStrong(v13 + 5, v22);
  }
  if (v5 <= 0x14)
  {
    v14 = v33;
    v21 = v33[5];
    NSAppendPrintF_safe(&v21, " ==\n");
    objc_storeStrong(v14 + 5, v21);
    v15 = self->_extensionMap;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100074F1C;
    v19[3] = &unk_100917030;
    v19[4] = &v32;
    v20 = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v19);
  }
  v16 = (__CFString *)v33[5];
  if (!v16)
    v16 = &stru_100941758;
  v17 = v16;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (void)activate
{
  CUCoalescer *v3;
  CUCoalescer *updateExtensionsCoalescer;
  CUCoalescer *v5;
  void *v6;
  CUSystemMonitor *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977690 <= 30 && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon activate]", 30, "Activate");
  self->_prefEnforceApprovedExtensions = -[CBDaemonServer prefEnforceApprovedExtensions](self->_daemonServer, "prefEnforceApprovedExtensions");
  if (!self->_appRegistrationObserving)
  {
    v3 = (CUCoalescer *)objc_alloc_init((Class)CUCoalescer);
    updateExtensionsCoalescer = self->_updateExtensionsCoalescer;
    self->_updateExtensionsCoalescer = v3;
    v5 = v3;

    -[CUCoalescer setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](v5, "setMinDelay:", 5.0);
    -[CUCoalescer setMaxDelay:](v5, "setMaxDelay:", 60.0);
    -[CUCoalescer setLeeway:](v5, "setLeeway:", 1.0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100075354;
    v12[3] = &unk_100917058;
    v12[4] = v5;
    v12[5] = self;
    -[CUCoalescer setActionHandler:](v5, "setActionHandler:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_appRegistrationNotification:", CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_appRegistrationNotification:", CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
    self->_appRegistrationObserving = 1;

  }
  v7 = self->_systemMonitor;
  if (!v7)
  {
    v7 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    objc_storeStrong((id *)&self->_systemMonitor, v7);
    -[CUSystemMonitor setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10007536C;
    v11[3] = &unk_100917080;
    v11[4] = self;
    -[CUSystemMonitor setScreenLockedChangedHandler:](v7, "setScreenLockedChangedHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100075374;
    v10[3] = &unk_100917080;
    v10[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](v7, "setScreenOnChangedHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100067554;
    v9[3] = &unk_100917080;
    v9[4] = self;
    -[CUSystemMonitor setSystemUIChangedHandler:](v7, "setSystemUIChangedHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007537C;
    v8[3] = &unk_100917080;
    v8[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v7, "activateWithCompletion:", v8);
  }
  -[CBExtensionsDaemon _findExtensionsStart](self, "_findExtensionsStart");

}

- (void)invalidate
{
  void *v3;
  NSMutableDictionary *extensionMap;
  SBSRemoteAlertHandle *remoteAlertHandle;
  SBSRemoteAlertHandle *v6;
  CUSystemMonitor *systemMonitor;
  CUCoalescer *updateExtensionsCoalescer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100977690 <= 30 && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon invalidate]", 30, "Invalidate");
  self->_invalidateCalled = 1;
  if (self->_appRegistrationObserving)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
    self->_appRegistrationObserving = 0;

  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_extensionMap, "enumerateKeysAndObjectsUsingBlock:", &stru_1009170C0);
  -[NSMutableDictionary removeAllObjects](self->_extensionMap, "removeAllObjects");
  extensionMap = self->_extensionMap;
  self->_extensionMap = 0;

  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    -[SBSRemoteAlertHandle unregisterObserver:](remoteAlertHandle, "unregisterObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_remoteAlertHandle, "invalidate");
    v6 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;

    self->_remoteAlertActivated = 0;
    -[CBDaemonServer setSystemFlags:mask:](self->_daemonServer, "setSystemFlags:mask:", 0, 1);
  }
  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  -[CUCoalescer invalidate](self->_updateExtensionsCoalescer, "invalidate");
  updateExtensionsCoalescer = self->_updateExtensionsCoalescer;
  self->_updateExtensionsCoalescer = 0;

}

- (id)diagnosticControl:(id)a3 error:(id *)a4
{
  id v6;
  CFTypeID TypeID;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const __CFString *v11;
  CFTypeID v12;
  uint64_t TypedValue;
  void *v14;
  void *v15;
  id v16;
  CFTypeID v17;
  uint64_t v18;
  id v19;
  unsigned __int8 v20;
  id v21;
  CFTypeID v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  TypeID = CFStringGetTypeID();
  v8 = (const char *)objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue(v6, CFSTR("iStr"), TypeID, 0)), "UTF8String");
  if (!v8)
  {
    if (a4)
    {
      v10 = CBErrorF(4294960591, "No input string");
      goto LABEL_8;
    }
LABEL_31:
    v11 = 0;
    goto LABEL_28;
  }
  v9 = v8;
  if (!strcasecmp(v8, "extension-found"))
  {
    v12 = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("extensionID"), v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extensionMap, "objectForKeyedSubscript:", v14));
      if (v15)
      {
        v16 = objc_alloc_init((Class)CBDevice);
        objc_msgSend(v16, "setIdentifier:", CFSTR("Test Device"));
        objc_msgSend(v15, "_deviceFound:", v16);

LABEL_25:
        v11 = &stru_100941758;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
LABEL_34:
      if (a4)
      {
        v26 = CBErrorF(4294960569, "Extension not found");
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v26);
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_26;
    }
LABEL_32:
    if (a4)
    {
      v25 = CBErrorF(4294960591, "No extensionID specified");
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v25);
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_27;
  }
  if (!strcasecmp(v9, "extension-launch"))
  {
    v17 = CFStringGetTypeID();
    v18 = CFDictionaryGetTypedValue(v6, CFSTR("extensionID"), v17, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extensionMap, "objectForKeyedSubscript:", v14));
      if (v15)
      {
        v19 = objc_alloc_init((Class)CBDevice);
        objc_msgSend(v19, "setIdentifier:", CFSTR("Test Device"));
        v29 = 0;
        v20 = -[CBExtensionsDaemon remoteAlertStartWithCBExtension:device:error:](self, "remoteAlertStartWithCBExtension:device:error:", v15, v19, &v29);
        v21 = v29;
        if ((v20 & 1) != 0)
        {
          v11 = &stru_100941758;
        }
        else if (a4)
        {
          v27 = v21;
          v28 = objc_retainAutorelease(v21);
          v21 = v27;
          v11 = 0;
          *a4 = v28;
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_26;
      }
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (!strcasecmp(v9, "extension-reset"))
  {
    v22 = CFStringGetTypeID();
    v23 = CFDictionaryGetTypedValue(v6, CFSTR("extensionID"), v22, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extensionMap, "objectForKeyedSubscript:", v14));
      if (v15)
      {
        if (dword_100977690 <= 30
          && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
        {
          LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon diagnosticControl:error:]", 30, "CBExtension: reset, %@", v14);
        }
        objc_msgSend(v15, "reset");
        goto LABEL_25;
      }
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (!strcasecmp(v9, "extension-update"))
  {
    -[CBExtensionsDaemon _findExtensionsStart](self, "_findExtensionsStart");
    v11 = &stru_100941758;
    goto LABEL_28;
  }
  if (!a4)
    goto LABEL_31;
  v10 = CBErrorF(4294960561, "Unsupported command: '%s'");
LABEL_8:
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
LABEL_28:

  return (id)v11;
}

- (void)prefsChanged
{
  _BOOL4 v3;

  v3 = -[CBDaemonServer prefEnforceApprovedExtensions](self->_daemonServer, "prefEnforceApprovedExtensions");
  if (self->_prefEnforceApprovedExtensions != v3)
  {
    self->_prefEnforceApprovedExtensions = v3;
    -[CUCoalescer trigger](self->_updateExtensionsCoalescer, "trigger");
  }
}

- (BOOL)resetCBExtension:(id)a3 error:(id *)a4
{
  id v5;
  NSMutableDictionary *extensionMap;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  extensionMap = self->_extensionMap;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100075998;
  v9[3] = &unk_1009170E8;
  v10 = v5;
  v7 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](extensionMap, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[CBExtensionsDaemon _triggerPendingExtension](self, "_triggerPendingExtension");

  return 1;
}

- (void)_screenLockedChanged
{
  unsigned int v3;
  const char *v4;

  v3 = -[CUSystemMonitor screenLockedSync](self->_systemMonitor, "screenLockedSync");
  if (dword_100977690 <= 30 && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
  {
    v4 = "unlocked";
    if (v3)
      v4 = "locked";
    LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _screenLockedChanged]", 30, "ScreenLocked changed: %s", v4);
  }
  if ((v3 & 1) == 0)
    -[CBExtensionsDaemon _triggerPendingExtension](self, "_triggerPendingExtension");
}

- (void)_screenOnChanged
{
  unsigned int v3;
  const char *v4;

  v3 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  if (dword_100977690 <= 30 && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
  {
    v4 = "no";
    if (v3)
      v4 = "yes";
    LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _screenOnChanged]", 30, "ScreenOn changed: %s", v4);
  }
  if (v3)
    -[CBExtensionsDaemon _triggerPendingExtension](self, "_triggerPendingExtension");
  else
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_extensionMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100917108);
}

- (void)setAssertionFlags:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_assertionFlags = a3;
  -[CBExtensionsDaemon _triggerPendingExtension](self, "_triggerPendingExtension");
}

- (void)_appRegistrationNotification:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075BF4;
  block[3] = &unk_100917080;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_findExtensionsStart
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[6];

  if (self->_findExtensionsRunning)
  {
    if (dword_100977690 <= 30
      && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    {
      LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _findExtensionsStart]", 30, "FindExtensions: defer while running");
    }
    self->_findExtensionsDeferred = 1;
  }
  else
  {
    if (dword_100977690 <= 30
      && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    {
      LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _findExtensionsStart]", 30, "FindExtensions: start");
    }
    self->_findExtensionsRunning = 1;
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("CBExtensionFindLatest", v6);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100075DCC;
    v8[3] = &unk_100917130;
    v8[4] = self;
    v8[5] = mach_absolute_time();
    dispatch_async(v7, v8);

  }
}

- (void)_updateExtensions:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CBExtension *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableDictionary *extensionMap;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  uint64_t v22;
  CFTypeID TypeID;
  void *v24;
  id v25;
  id v26;
  int v27;
  uint64_t v28;
  void *j;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  int v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v4 = a3;
  if (dword_100977690 <= 30 && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _updateExtensions:]", 30, "Update extensions start: count %d", objc_msgSend(v4, "count"));
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_extensionMap, "enumerateKeysAndObjectsUsingBlock:", &stru_100917170);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v6)
  {
    v33 = 0;
    v34 = 0;
    goto LABEL_40;
  }
  v7 = v6;
  v33 = 0;
  v34 = 0;
  v8 = *(_QWORD *)v40;
  v32 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v40 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "discoveryInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "xpcDiscoveryInfo"));
      if (v13)
      {
        if (-[CBDaemonServer xpcEventAllowedInfo:](self->_daemonServer, "xpcEventAllowedInfo:", v13))
        {
          v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extensionMap, "objectForKeyedSubscript:", v10));
          if (v14)
          {
            v15 = (CBExtension *)v14;
            ++v34;
            if (dword_100977690 > 30
              || dword_100977690 == -1 && !_LogCategory_Initialize(&dword_100977690, 30))
            {
              goto LABEL_35;
            }
            v16 = CUPrintNSObjectOneLine(v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _updateExtensions:]", 30, "CBExtension: updated %@, %@", v10, v17);
          }
          else
          {
            v15 = objc_alloc_init(CBExtension);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID"));
            -[CBExtension setBundleID:](v15, "setBundleID:", v18);

            -[CBExtension setDispatchQueue:](v15, "setDispatchQueue:", self->_dispatchQueue);
            -[CBExtension setExtensionID:](v15, "setExtensionID:", v10);
            -[CBExtension setExtensionsDaemon:](v15, "setExtensionsDaemon:", self);
            extensionMap = self->_extensionMap;
            if (!extensionMap)
            {
              v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              v21 = self->_extensionMap;
              self->_extensionMap = v20;

              extensionMap = self->_extensionMap;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](extensionMap, "setObject:forKeyedSubscript:", v15, v10);
            v8 = v32;
            ++v33;
            if (dword_100977690 > 30
              || dword_100977690 == -1 && !_LogCategory_Initialize(&dword_100977690, 30))
            {
              goto LABEL_35;
            }
            v22 = CUPrintNSObjectOneLine(v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
            LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _updateExtensions:]", 30, "CBExtension: added %@, %@", v10, v17);
          }

          v8 = v32;
LABEL_35:
          -[CBExtension setPresent:](v15, "setPresent:", 1);
          -[CBExtension setScreenLocked:](v15, "setScreenLocked:", CFDictionaryGetInt64(v12, CFSTR("screenLocked"), 0) != 0);
          TypeID = CFStringGetTypeID();
          -[CBExtension setViewControllerClassName:](v15, "setViewControllerClassName:", CFDictionaryGetTypedValue(v12, CFSTR("viewControllerClassName"), TypeID, 0));
          -[CBExtension updateWithXPCDiscoveryInfo:](v15, "updateWithXPCDiscoveryInfo:", v13);

          goto LABEL_36;
        }
        if (dword_100977690 <= 30
          && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
        {
          LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _updateExtensions:]", 30, "CBExtension: not allowed, %@", v10);
        }
      }
      else if (dword_100977690 <= 90
             && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 90)))
      {
        LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _updateExtensions:]", 90, "### CBExtension: no discovery info, %@", v10);
      }
LABEL_36:

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  }
  while (v7);
LABEL_40:

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_extensionMap, "allKeys"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v24);
        v30 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extensionMap, "objectForKeyedSubscript:", v30));
        if ((objc_msgSend(v31, "present") & 1) == 0)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extensionMap, "setObject:forKeyedSubscript:", 0, v30);
          objc_msgSend(v31, "invalidate");
          ++v27;
          if (dword_100977690 <= 30
            && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
          {
            LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _updateExtensions:]", 30, "CBExtension: removed %@", v30);
          }
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v26);
  }
  else
  {
    v27 = 0;
  }

  if (dword_100977690 <= 30 && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
    LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon _updateExtensions:]", 30, "Update extensions done: added %d, updated %d, removed %d", v33, v34, v27);

}

- (BOOL)remoteAlertAllowedAndReturnReason:(id *)a3 extension:(id)a4
{
  id v6;
  id v7;
  id v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a4;
  if ((-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") & 1) == 0)
  {
    if (!a3)
      goto LABEL_8;
    v9 = *a3;
    v10 = CFSTR("Screen off");
    goto LABEL_19;
  }
  if ((objc_msgSend(v6, "screenLocked") & 1) == 0
    && -[CUSystemMonitor screenLockedSync](self->_systemMonitor, "screenLockedSync"))
  {
    if (!a3)
      goto LABEL_8;
    v9 = *a3;
    v10 = CFSTR("Screen locked");
LABEL_19:
    *a3 = v10;
    goto LABEL_20;
  }
  if (self->_remoteAlertActivated)
  {
    if (!a3)
      goto LABEL_8;
    v9 = *a3;
    v10 = CFSTR("UI already active");
    goto LABEL_19;
  }
  if ((self->_assertionFlags & 2) != 0)
  {
    if (!a3)
      goto LABEL_8;
    v9 = *a3;
    v10 = CFSTR("SuppressUIExtensions assertion");
    goto LABEL_19;
  }
  v7 = -[CUSystemMonitor systemUIFlags](self->_systemMonitor, "systemUIFlags");
  if ((v7 & 0x7E409) != 0)
  {
    if (!a3)
      goto LABEL_8;
    v11 = CUPrintFlags32(v7, &unk_100737448);
    v9 = (id)objc_claimAutoreleasedReturnValue(v11);
    v12 = NSPrintF("SystemUI active: %@", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = *a3;
    *a3 = v13;

LABEL_20:
    LOBYTE(a3) = 0;
    goto LABEL_8;
  }
  LOBYTE(a3) = 1;
LABEL_8:

  return (char)a3;
}

- (BOOL)remoteAlertStartWithCBExtension:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  SBSRemoteAlertHandle *remoteAlertHandle;
  SBSRemoteAlertHandle *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SBSRemoteAlertHandle *v19;
  SBSRemoteAlertHandle *v20;
  SBSRemoteAlertHandle *v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllerClassName"));
    if (v11)
    {
      if ((-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") & 1) != 0)
      {
        if ((objc_msgSend(v8, "screenLocked") & 1) != 0
          || !-[CUSystemMonitor screenLockedSync](self->_systemMonitor, "screenLockedSync"))
        {
          if (!self->_remoteAlertActivated)
          {
            if (dword_100977690 <= 30
              && (dword_100977690 != -1 || _LogCategory_Initialize(&dword_100977690, 30)))
            {
              LogPrintF_safe(&dword_100977690, "-[CBExtensionsDaemon remoteAlertStartWithCBExtension:device:error:]", 30, "Remote alert start: %@, %@", v8, v9);
            }
            remoteAlertHandle = self->_remoteAlertHandle;
            if (remoteAlertHandle)
            {
              -[SBSRemoteAlertHandle unregisterObserver:](remoteAlertHandle, "unregisterObserver:", self);
              -[SBSRemoteAlertHandle invalidate](self->_remoteAlertHandle, "invalidate");
              v13 = self->_remoteAlertHandle;
              self->_remoteAlertHandle = 0;

              self->_remoteAlertActivated = 0;
              -[CBDaemonServer setSystemFlags:mask:](self->_daemonServer, "setSystemFlags:mask:", 0, 1);
            }
            v14 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", v10, v11);
            v15 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryRepresentation"));
            v17 = (void *)v16;
            if (v16)
            {
              v28 = CFSTR("device");
              v29 = v16;
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
              objc_msgSend(v15, "setUserInfo:", v18);

            }
            v19 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v14, v15);
            v20 = self->_remoteAlertHandle;
            self->_remoteAlertHandle = v19;

            v21 = self->_remoteAlertHandle;
            v22 = v21 != 0;
            if (v21)
            {
              -[SBSRemoteAlertHandle registerObserver:](v21, "registerObserver:", self);
              -[SBSRemoteAlertHandle activateWithContext:](self->_remoteAlertHandle, "activateWithContext:", 0);
            }
            else if (a5)
            {
              v27 = CBErrorF(4294960596, "Remote alert start failed");
              *a5 = (id)objc_claimAutoreleasedReturnValue(v27);
            }

            goto LABEL_18;
          }
          if (a5)
          {
            v25 = CBErrorF(4294960575, "UI already active");
            goto LABEL_33;
          }
          goto LABEL_34;
        }
        if (!a5)
          goto LABEL_34;
        v26 = "Screen locked";
      }
      else
      {
        if (!a5)
          goto LABEL_34;
        v26 = "Screen off";
      }
      v25 = CBErrorF(4294960587, v26);
      goto LABEL_33;
    }
    if (a5)
    {
      v25 = CBErrorF(4294960591, "no viewControllerClassName");
LABEL_33:
      v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v25);
LABEL_18:

      goto LABEL_19;
    }
LABEL_34:
    v22 = 0;
    goto LABEL_18;
  }
  if (a5)
  {
    v24 = CBErrorF(4294960534, "no bundleID");
    v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v24);
  }
  else
  {
    v22 = 0;
  }
LABEL_19:

  return v22;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CBExtensionsDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100076EA4;
  v7[3] = &unk_100917058;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CBExtensionsDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100076FF8;
  v7[3] = &unk_100917058;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  CBExtensionsDaemon *v10;

  v5 = a3;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100077148;
  v8[3] = &unk_100917058;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

- (unsigned)assertionFlags
{
  return self->_assertionFlags;
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

- (BOOL)remoteAlertActivated
{
  return self->_remoteAlertActivated;
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_updateExtensionsCoalescer, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_extensionMap, 0);
}

@end
