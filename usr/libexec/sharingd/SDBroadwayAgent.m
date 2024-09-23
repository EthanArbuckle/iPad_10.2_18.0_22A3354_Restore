@implementation SDBroadwayAgent

+ (id)sharedAgent
{
  if (qword_1007C69D0 != -1)
    dispatch_once(&qword_1007C69D0, &stru_100717D08);
  return (id)qword_1007C69D8;
}

- (SDBroadwayAgent)init
{
  SDBroadwayAgent *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDBroadwayAgent;
  v2 = -[SDBroadwayAgent init](&v7, "init");
  if (v2)
  {
    v3 = CUMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (NSString)description
{
  id v2;
  const char *v3;

  v2 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v2, "appendFormat:", CFSTR("-- SDBroadwayAgent --"));
  if (byte_1007D7F3C)
    v3 = "yes";
  else
    v3 = "no";
  objc_msgSend(v2, "appendFormat:", CFSTR("Suppressed: %s"), v3);
  return (NSString *)v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117224;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117328;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B1FE8 <= 30 && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 30)))
    LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent _invalidate]", 30, "Invalidate");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)_uiShowing
{
  return self->_alertHandle != 0;
}

- (void)_applePayCardDectected:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  -[SDBroadwayAgent preparePresentationWithBroadwayActivationCode:testInfo:](self, "preparePresentationWithBroadwayActivationCode:testInfo:", v6, v5);
}

- (void)preparePresentationWithBroadwayActivationCode:(id)a3 testInfo:(id)a4
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
  block[2] = sub_1001174F0;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_preparePresentationWithBroadwayActivationCode:(id)a3 testInfo:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (byte_1007D7F3C)
  {
    if (dword_1007B1FE8 <= 30
      && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 30)))
    {
      LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent _preparePresentationWithBroadwayActivationCode:testInfo:]", 30, "Suppressing presentation preparation due to assertion");
    }
  }
  else
  {
    if (dword_1007B1FE8 <= 30
      && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 30)))
    {
      LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent _preparePresentationWithBroadwayActivationCode:testInfo:]", 30, "Presentation preparation with activation code: %@", v7);
    }
    -[SDBroadwayAgent lookUpValidAccountWithBroadwayActivationCode:testInfo:](self, "lookUpValidAccountWithBroadwayActivationCode:testInfo:", v7, v6);
  }

}

- (void)lookUpValidAccountWithBroadwayActivationCode:(id)a3 testInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  id location;

  v6 = a3;
  v7 = a4;
  if (dword_1007B1FE8 <= 30 && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 30)))
    LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent lookUpValidAccountWithBroadwayActivationCode:testInfo:]", 30, "Look up valid account with activation code: %@", v6);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("testParams")));
  v9 = (void *)v8;
  if (v8)
    v10 = SFTestFlagsFromString(v8) & 1;
  else
    v10 = 0;
  v11 = objc_msgSend((Class)off_1007B2058[0](), "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  location = 0;
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001177AC;
  v15[3] = &unk_100717D30;
  v19 = v10;
  objc_copyWeak(&v18, &location);
  v13 = v6;
  v16 = v13;
  v14 = v7;
  v17 = v14;
  objc_msgSend(v12, "defaultAccountForFeature:completion:", 2, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)lookupPhysicalCardWithBroadwayActivationCode:(id)a3 testInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  id *v16;
  id v17;
  _QWORD v18[7];
  id v19;
  char v20;
  char v21;
  _QWORD v22[7];
  id v23;
  char v24;
  char v25;
  id location;

  v6 = a3;
  v7 = a4;
  if (dword_1007B1FE8 <= 30 && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 30)))
    LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent lookupPhysicalCardWithBroadwayActivationCode:testInfo:]", 30, "Look up physical card with activation code: %@", v6);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("testParams")));
  v9 = (void *)v8;
  if (v8)
    v10 = SFTestFlagsFromString(v8);
  else
    v10 = 0;
  v11 = objc_msgSend((Class)off_1007B2058[0](), "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  location = 0;
  objc_initWeak(&location, self);
  v13 = v10 & 1;
  v14 = HIDWORD(v10) & 1;
  if ((objc_opt_respondsToSelector(v12, "physicalCardForFeatureIdentifier:activationCode:completion:") & 1) != 0)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100117B40;
    v22[3] = &unk_100717D80;
    v15 = v22;
    v22[4] = self;
    v24 = v13;
    v25 = v14;
    v16 = &v23;
    objc_copyWeak(&v23, &location);
    v17 = v6;
    v22[5] = v17;
    v22[6] = v7;
    objc_msgSend(v12, "physicalCardForFeatureIdentifier:activationCode:completion:", 2, v17, v22);
  }
  else
  {
    if (dword_1007B1FE8 <= 90
      && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 90)))
    {
      LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent lookupPhysicalCardWithBroadwayActivationCode:testInfo:]", 90, "PKAccountService does not respond to new selector");
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100117D50;
    v18[3] = &unk_100717D80;
    v15 = v18;
    v18[4] = self;
    v20 = v13;
    v21 = v14;
    v16 = &v19;
    objc_copyWeak(&v19, &location);
    v18[5] = v6;
    v18[6] = v7;
    objc_msgSend(v12, "inactivePhysicalCardForFeatureIdentifier:completion:", 2, v18);
  }

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (void)_startUIWithPhysicalCard:(id)a3 activationCode:(id)a4 testInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  SBSRemoteAlertHandle *alertHandle;
  SBSRemoteAlertHandle *v23;
  SBSRemoteAlertHandle *v24;
  SBSRemoteAlertHandle *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v28 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v8)
  {
    v26 = NSErrorWithOSStatusF(4294960591, "Missing activation code");
LABEL_35:
    v16 = (void *)objc_claimAutoreleasedReturnValue(v26);
LABEL_9:
    v17 = 0;
    v18 = 0;
    v19 = 0;
    if (!v16)
      goto LABEL_28;
    goto LABEL_10;
  }
  if (v28)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("physicalCard")));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("physicalCard")));
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

    }
    else
    {
      v12 = objc_msgSend(v28, "state");
    }

    if (v12 == (id)5 || !v12)
    {
      v13 = off_1007B2070((uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSErrorWithOSStatusF(4294960591, "Physical card has invalid state %@", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      goto LABEL_9;
    }
  }
  if (gSDProxCardsSuppressed)
  {
    v26 = NSErrorWithOSStatusF(4294960561, "");
    goto LABEL_35;
  }
  if (-[SDBroadwayAgent _uiShowing](self, "_uiShowing"))
  {
    v26 = NSErrorWithOSStatusF(4294960575, "");
    goto LABEL_35;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v21 = objc_msgSend(v20, "systemUIFlags") & 0x5C808;

  if (v21)
  {
    v26 = NSErrorWithOSStatusF(4294960587, "");
    goto LABEL_35;
  }
  if (dword_1007B1FE8 <= 30 && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 30)))
    LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent _startUIWithPhysicalCard:activationCode:testInfo:]", 30, "UI Start for card: %@ with code: %@", v28, v8);
  v19 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v9);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v8, CFSTR("activationCode"));
  v17 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SharingViewService"), CFSTR("BroadwayActivationMainController"));
  v18 = (void *)objc_opt_new(SBSRemoteAlertConfigurationContext);
  objc_msgSend(v18, "setUserInfo:", v19);
  alertHandle = self->_alertHandle;
  if (alertHandle)
  {
    -[SBSRemoteAlertHandle removeObserver:](alertHandle, "removeObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_alertHandle, "invalidate");
  }
  v23 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v17, v18);
  v24 = self->_alertHandle;
  self->_alertHandle = v23;

  v25 = self->_alertHandle;
  if (!v25)
  {
    v27 = NSErrorWithOSStatusF(4294960556, "Create remote alert handle failed");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if (!v16)
      goto LABEL_28;
LABEL_10:
    if (dword_1007B1FE8 <= 60
      && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 60)))
    {
      LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent _startUIWithPhysicalCard:activationCode:testInfo:]", 60, "### Start UI failed: %{error}, with activation code: %@", v16, v8);
    }
    goto LABEL_28;
  }
  -[SBSRemoteAlertHandle addObserver:](v25, "addObserver:", self);
  -[SBSRemoteAlertHandle activateWithContext:](self->_alertHandle, "activateWithContext:", 0);
  if (dword_1007B1FE8 <= 30 && (dword_1007B1FE8 != -1 || _LogCategory_Initialize(&dword_1007B1FE8, 30)))
    LogPrintF(&dword_1007B1FE8, "-[SDBroadwayAgent _startUIWithPhysicalCard:activationCode:testInfo:]", 30, "Starting apple pay card UI with activation code %@", v8);
  v16 = 0;
LABEL_28:

}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDBroadwayAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011831C;
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
  SDBroadwayAgent *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100118478;
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
  SDBroadwayAgent *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118600;
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
  objc_storeStrong((id *)&self->_alertHandle, 0);
}

@end
