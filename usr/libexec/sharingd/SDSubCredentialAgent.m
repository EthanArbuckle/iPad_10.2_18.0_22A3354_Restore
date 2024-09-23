@implementation SDSubCredentialAgent

+ (id)sharedAgent
{
  if (qword_1007C6C10 != -1)
    dispatch_once(&qword_1007C6C10, &stru_100719DB8);
  return (id)qword_1007C6C18;
}

- (SDSubCredentialAgent)init
{
  SDSubCredentialAgent *v2;
  uint64_t v3;
  SDSubCredentialAgent *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  SDStatusMonitor *statusMonitor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SDSubCredentialAgent;
  v2 = -[SDSubCredentialAgent init](&v10, "init");
  v4 = v2;
  if (v2)
  {
    v5 = SFMainQueue(v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[SDSubCredentialAgent setDispatchQueue:](v4, "setDispatchQueue:", v6);

    v7 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    statusMonitor = v4->_statusMonitor;
    v4->_statusMonitor = (SDStatusMonitor *)v7;

  }
  return v4;
}

- (NSString)description
{
  id v2;

  v2 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v2, "appendFormat:", CFSTR("-- SDSubCredentialAgent --"));
  return (NSString *)v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A2410;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3268 <= 50 && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 50)))
    LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _activate]", 50, "Activate");
  -[SDSubCredentialAgent prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A24E8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3268 <= 50 && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 50)))
    LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _invalidate]", 50, "Invalidate");
}

- (void)prefsChanged
{
  uint64_t Int64;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CFTypeID TypeID;
  void *v9;
  NSString *prefAppStoreURL;
  CFTypeID v11;
  void *v12;
  NSString *v13;
  NSString *prefWalletLaunchURL;
  int v15;

  v15 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("alEnableAppInfoDownload"), &v15);
  v4 = Int64 != 0;
  if (self->_prefAppInfoDownload != v4)
  {
    if (dword_1007B3268 <= 40)
    {
      v5 = Int64;
      if (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 40))
      {
        v6 = "yes";
        if (v5)
          v7 = "no";
        else
          v7 = "yes";
        if (!v5)
          v6 = "no";
        LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent prefsChanged]", 40, "App info dowloading enabled: %s -> %s\n", v7, v6);
      }
    }
    self->_prefAppInfoDownload = v4;
  }
  TypeID = CFStringGetTypeID();
  v9 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.Sharing"), CFSTR("alAppStoreURL"), TypeID, &v15);
  if (!v15
    || (prefAppStoreURL = self->_prefAppStoreURL, self->_prefAppStoreURL = 0, prefAppStoreURL, !v15))
  {
    if (v9)
    {
      if (dword_1007B3268 <= 50
        && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 50)))
      {
        LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent prefsChanged]", 50, "App Store URL updated: %@ -> %@\n", self->_prefAppStoreURL, v9);
      }
      objc_storeStrong((id *)&self->_prefAppStoreURL, v9);
    }
  }
  v11 = CFStringGetTypeID();
  v12 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.Sharing"), CFSTR("alWalletLaunchURL"), v11, &v15);

  if (!v15
    || (v13 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("https://wallet.apple.com/setup/"), CFSTR("carkey-pairing?"))), prefWalletLaunchURL = self->_prefWalletLaunchURL, self->_prefWalletLaunchURL = v13, prefWalletLaunchURL, !v15))
  {
    if (v12)
    {
      if (dword_1007B3268 <= 50
        && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 50)))
      {
        LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent prefsChanged]", 50, "Launch URL updated: %@ -> %@\n", self->_prefWalletLaunchURL, v12);
      }
      objc_storeStrong((id *)&self->_prefWalletLaunchURL, v12);
    }
  }

}

- (void)uiPresentWithParams:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A2888;
  block[3] = &unk_100714F68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)uiPresentWithParamsDirect:(id)a3 completion:(id)a4
{
  -[SDSubCredentialAgent _uiPresentWithParams:completion:](self, "_uiPresentWithParams:completion:", a3, a4);
}

- (void)_uiPresentWithParams:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSString *prefAppStoreURL;
  NSString *prefWalletLaunchURL;
  id v26;
  void *v27;
  SBSRemoteAlertHandle *alertHandle;
  SBSRemoteAlertHandle *v29;
  SBSRemoteAlertHandle *v30;
  SBSRemoteAlertHandle *v31;
  SBSRemoteAlertHandle *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamIDs"));
  if (v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID")),
        v36 = v9,
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1)),
        v9,
        v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    if (!v10)
    {
      if (dword_1007B3268 <= 90
        && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 90)))
      {
        LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 90, "### Title missing for prox card presentation.");
      }
      v13 = NSErrorWithOSStatusF(4294960591, "Title missing.");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (v7)
        v7[2](v7, v11);
      goto LABEL_56;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subtitle"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "issuerID"));
      if (v12 || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID"))) != 0)
      {
        if (gSDProxCardsSuppressed)
        {
          if (dword_1007B3268 <= 90
            && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 90)))
          {
            LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 90, "### Skipping presentation, all prox cards suppressed.");
          }
          v19 = NSErrorWithOSStatusF(4294960561, "Prox cards currently suppressed.");
        }
        else if (-[SDSubCredentialAgent _uiShowing](self, "_uiShowing"))
        {
          if (dword_1007B3268 <= 90
            && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 90)))
          {
            LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 90, "### Skipping presentation, prox card already visible.");
          }
          v19 = NSErrorWithOSStatusF(4294960575, "Prox card already visible.");
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v15 = objc_msgSend(v14, "systemUIFlags");

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v17 = objc_msgSend(v16, "systemUIFlags") & 0x5C808;

          if (!v17)
          {
            if (dword_1007B3268 <= 30
              && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 30)))
            {
              LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 30, "UI start for adam IDs: %@", v8);
            }
            v22 = objc_alloc_init((Class)NSMutableDictionary);
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, CFSTR("adamIDs"));
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, CFSTR("title"));
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, CFSTR("subtitle"));
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("issuerID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_prefAppInfoDownload));
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("appInfoDownload"));

            prefAppStoreURL = self->_prefAppStoreURL;
            if (prefAppStoreURL)
              objc_msgSend(v22, "setObject:forKeyedSubscript:", prefAppStoreURL, CFSTR("appStoreURL"));
            prefWalletLaunchURL = self->_prefWalletLaunchURL;
            if (prefWalletLaunchURL)
              objc_msgSend(v22, "setObject:forKeyedSubscript:", prefWalletLaunchURL, CFSTR("launchURL"));
            v26 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SharingViewService"), CFSTR("SubCredentialActivationMainController"));
            v27 = (void *)objc_opt_new(SBSRemoteAlertConfigurationContext);
            objc_msgSend(v27, "setUserInfo:", v22);
            alertHandle = self->_alertHandle;
            if (alertHandle)
            {
              -[SBSRemoteAlertHandle removeObserver:](alertHandle, "removeObserver:", self);
              -[SBSRemoteAlertHandle invalidate](self->_alertHandle, "invalidate");
              v29 = self->_alertHandle;
              self->_alertHandle = 0;

            }
            v30 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v26, v27);
            v31 = self->_alertHandle;
            self->_alertHandle = v30;

            v32 = self->_alertHandle;
            if (!v32)
            {
              v35 = v26;
              if (dword_1007B3268 <= 90
                && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 90)))
              {
                LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 90, "### Presentation failed, alert handle couldn't be created.");
              }
              v33 = NSErrorWithOSStatusF(4294960556, "Alert creation failed.");
              v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
              if (v7)
                v7[2](v7, v34);

              v32 = self->_alertHandle;
              v26 = v35;
            }
            -[SBSRemoteAlertHandle addObserver:](v32, "addObserver:", self);
            -[SBSRemoteAlertHandle activateWithContext:](self->_alertHandle, "activateWithContext:", 0);
            if (v7)
              v7[2](v7, 0);

            goto LABEL_55;
          }
          if (dword_1007B3268 <= 90
            && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 90)))
          {
            LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 90, "### Skipping presentation, not supported over current UI: %%#{flags}.", v15, &unk_1005CCC04);
          }
          v19 = NSErrorWithOSStatusF(4294960587, "Card not supported over current UI.");
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (v7)
          v7[2](v7, v21);

LABEL_55:
LABEL_56:

        goto LABEL_57;
      }
      if (dword_1007B3268 <= 90
        && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 90)))
      {
        LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 90, "### Issuer ID missing for prox card presentation.");
      }
      v18 = NSErrorWithOSStatusF(4294960591, "Issuer ID missing.");
    }
    else
    {
      if (dword_1007B3268 <= 90
        && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 90)))
      {
        LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 90, "### Subtitle missing for prox card presentation.");
      }
      v18 = NSErrorWithOSStatusF(4294960591, "Subtitle missing.");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (v7)
      v7[2](v7, v12);
    goto LABEL_55;
  }
  if (dword_1007B3268 <= 90 && (dword_1007B3268 != -1 || _LogCategory_Initialize(&dword_1007B3268, 90)))
    LogPrintF(&dword_1007B3268, "-[SDSubCredentialAgent _uiPresentWithParams:completion:]", 90, "### Adam IDs missing for prox card presentation.");
  v20 = NSErrorWithOSStatusF(4294960591, "Adam IDs missing.");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (v7)
    v7[2](v7, v8);
LABEL_57:

}

- (BOOL)_uiShowing
{
  return self->_alertHandle != 0;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDSubCredentialAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A3048;
  v7[3] = &unk_100714860;
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
  SDSubCredentialAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A31A4;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SDSubCredentialAgent *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A332C;
  block[3] = &unk_100715138;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

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
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_prefWalletLaunchURL, 0);
  objc_storeStrong((id *)&self->_prefAppStoreURL, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
}

@end
