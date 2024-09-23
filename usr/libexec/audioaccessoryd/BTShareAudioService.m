@implementation BTShareAudioService

- (BTShareAudioService)init
{
  BTShareAudioService *v2;
  BTShareAudioService *v3;
  BTShareAudioService *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTShareAudioService;
  v2 = -[BTShareAudioService init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056CC4;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056D8C;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  id configRequestHandler;
  id connectRequestHandler;
  SFService *sfService;

  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    -[BTShareAudioService _handleSessionEnded:error:](self, "_handleSessionEnded:error:", self->_sfSession, 0);
    configRequestHandler = self->_configRequestHandler;
    self->_configRequestHandler = 0;

    connectRequestHandler = self->_connectRequestHandler;
    self->_connectRequestHandler = 0;

    -[SFService invalidate](self->_sfService, "invalidate");
    sfService = self->_sfService;
    self->_sfService = 0;

    if (dword_10020FAC8 <= 30
      && (dword_10020FAC8 != -1 || _LogCategory_Initialize(&dword_10020FAC8, 30)))
    {
      LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _invalidate]", 30, "Invalidated\n");
    }
  }
}

- (void)_sfServiceStart
{
  SFService *v3;
  SFService *sfService;
  SFService *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];

  if (dword_10020FAC8 <= 30 && (dword_10020FAC8 != -1 || _LogCategory_Initialize(&dword_10020FAC8, 30)))
    LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _sfServiceStart]", 30, "SFService start\n");
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = (SFService *)objc_alloc_init((Class)SFService);
  sfService = self->_sfService;
  self->_sfService = v3;
  v5 = v3;

  -[SFService setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setFixedPIN:](v5, "setFixedPIN:", CFSTR("public"));
  -[SFService setIdentifier:](v5, "setIdentifier:", CFSTR("com.apple.sharing.ShareAudio"));
  -[SFService setLabel:](v5, "setLabel:", CFSTR("ShareAudio"));
  -[SFService setSessionFlags:](v5, "setSessionFlags:", 2305);
  -[SFService setServiceType:](v5, "setServiceType:", 21);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057070;
  v8[3] = &unk_1001E3E88;
  v8[4] = v5;
  v8[5] = self;
  -[SFService setSessionStartedHandler:](v5, "setSessionStartedHandler:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005708C;
  v7[3] = &unk_1001E3EB0;
  v7[4] = v5;
  v7[5] = self;
  -[SFService setSessionEndedHandler:](v5, "setSessionEndedHandler:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000570AC;
  v6[3] = &unk_1001E2410;
  v6[4] = v5;
  v6[5] = self;
  -[SFService activateWithCompletion:](v5, "activateWithCompletion:", v6);

}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession *sfSession;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (dword_10020FAC8 <= 60)
    {
      if (dword_10020FAC8 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FAC8, 60))
          goto LABEL_7;
        sfSession = self->_sfSession;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFSession peer](sfSession, "peer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peer"));
      LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _handleSessionStarted:]", 60, "### Ignoring session when already active: existing peer %@, new peer %@\n", v8, v9);

    }
  }
  else
  {
    if (dword_10020FAC8 <= 30
      && (dword_10020FAC8 != -1 || _LogCategory_Initialize(&dword_10020FAC8, 30)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peer"));
      LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _handleSessionStarted:]", 30, "Session start: peer %@\n", v7);

    }
    objc_msgSend(v5, "setStatusMonitor:", self->_statusMonitor);
    objc_storeStrong((id *)&self->_sfSession, a3);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000573C0;
    v12[3] = &unk_1001E3ED8;
    v12[4] = self;
    objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("_shAu"), &off_1001F4200, v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000573C8;
    v11[3] = &unk_1001E3ED8;
    v11[4] = self;
    objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("_shCf"), &off_1001F4228, v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000574D8;
    v10[3] = &unk_1001E3ED8;
    v10[4] = self;
    objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("_shCn"), &off_1001F4250, v10);
  }
LABEL_7:

}

- (void)_handleSessionEnded:(id)a3 error:(id)a4
{
  id v6;
  SFSession *sfSession;
  void *v8;
  SFBluetoothPairingSession *pairingSession;
  OS_dispatch_source *searchTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  CUBluetoothClient *searchBTClient;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  id responseHandler;
  SFSession *v19;

  v19 = (SFSession *)a3;
  v6 = a4;
  if (self->_sfSession == v19)
  {
    if (v19)
    {
      sfSession = v19;
      if (dword_10020FAC8 <= 30)
      {
        sfSession = v19;
        if (dword_10020FAC8 != -1
          || (v17 = _LogCategory_Initialize(&dword_10020FAC8, 30), sfSession = self->_sfSession, v17))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFSession peer](sfSession, "peer"));
          LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _handleSessionEnded:error:]", 30, "Session end: peer %@, %{error}\n", v8, v6);

          sfSession = self->_sfSession;
        }
      }
    }
    else
    {
      sfSession = 0;
    }
    self->_sfSession = 0;

    -[SFBluetoothPairingSession invalidate](self->_pairingSession, "invalidate");
    pairingSession = self->_pairingSession;
    self->_pairingSession = 0;

    searchTimer = self->_searchTimer;
    if (searchTimer)
    {
      v11 = searchTimer;
      dispatch_source_cancel(v11);
      v12 = self->_searchTimer;
      self->_searchTimer = 0;

    }
    -[CUBluetoothClient invalidate](self->_searchBTClient, "invalidate");
    searchBTClient = self->_searchBTClient;
    self->_searchBTClient = 0;

    v14 = objc_retainBlock(self->_responseHandler);
    if (v14)
    {
      v15 = NSErrorF(NSOSStatusErrorDomain, 4294960544, "Session ended");
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (dword_10020FAC8 < 91
        && (dword_10020FAC8 != -1 || _LogCategory_Initialize(&dword_10020FAC8, 90)))
      {
        LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _handleSessionEnded:error:]", 90, "### ShareAudio request aborted: %{error}\n", v16);
      }
      (*((void (**)(id, void *, _QWORD, _QWORD))v14 + 2))(v14, v16, 0, 0);
      responseHandler = self->_responseHandler;
      self->_responseHandler = 0;

    }
  }

}

- (void)_handleShareAudioRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v12;
  id v13;
  id responseHandler;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  if (dword_10020FAC8 <= 30 && (dword_10020FAC8 != -1 || _LogCategory_Initialize(&dword_10020FAC8, 30)))
    LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _handleShareAudioRequest:responseHandler:]", 30, "ShareAudio request received: %##.16@\n", v6);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100057A08;
  v28 = sub_100057A18;
  v29 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100057A20;
  v21[3] = &unk_1001E2A58;
  v23 = &v24;
  v8 = v7;
  v22 = v8;
  v9 = objc_retainBlock(v21);
  if (self->_responseHandler)
  {
    v15 = NSErrorF(NSOSStatusErrorDomain, 4294960575, "Requesting");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)v25[5];
    v25[5] = v16;

  }
  else
  {
    v20 = 0;
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("btAd"), TypeID, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    if (v12)
    {
      objc_storeStrong((id *)&self->_guestDeviceAddress, v12);
      v13 = objc_retainBlock(v8);
      responseHandler = self->_responseHandler;
      self->_responseHandler = v13;
    }
    else
    {
      v18 = NSErrorF(NSOSStatusErrorDomain, v20, "No BT addr");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      responseHandler = (id)v25[5];
      v25[5] = v19;
    }

  }
  ((void (*)(_QWORD *))v9[2])(v9);

  _Block_object_dispose(&v24, 8);
}

- (void)_handleShareAudioPairingCompleted:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SFBluetoothPairingSession *pairingSession;
  id v9;
  id responseHandler;
  SFSession *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v18;
  void *v19;
  _QWORD v20[8];

  v6 = a3;
  v7 = a4;
  -[SFBluetoothPairingSession invalidate](self->_pairingSession, "invalidate");
  pairingSession = self->_pairingSession;
  self->_pairingSession = 0;

  v9 = objc_retainBlock(self->_responseHandler);
  if (v9)
  {
    responseHandler = self->_responseHandler;
    self->_responseHandler = 0;

    if (v7)
    {
      if (dword_10020FAC8 <= 90
        && (dword_10020FAC8 != -1 || _LogCategory_Initialize(&dword_10020FAC8, 90)))
      {
        LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _handleShareAudioPairingCompleted:error:]", 90, "### Configure device failed: %{error}\n", v7);
      }
      (*((void (**)(id, id, _QWORD, _QWORD))v9 + 2))(v9, v7, 0, 0);
    }
    else
    {
      v11 = self->_sfSession;
      if (v11)
      {
        v12 = objc_alloc_init((Class)NSMutableDictionary);
        v13 = objc_msgSend(v6, "colorCode");
        if ((_DWORD)v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("colorCode"));

        }
        v15 = objc_msgSend(v6, "productIdentifier");
        if ((_DWORD)v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("productID"));

        }
        dispatchQueue = self->_dispatchQueue;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100057D54;
        v20[3] = &unk_1001E3F00;
        v20[4] = v11;
        v20[5] = self;
        v20[6] = v12;
        v20[7] = v9;
        -[SFSession appleIDAddProof:dispatchQueue:completion:](v11, "appleIDAddProof:dispatchQueue:completion:", v12, dispatchQueue, v20);

      }
      else
      {
        v18 = SFErrorF(4294960596, "No session");
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if (dword_10020FAC8 <= 90
          && (dword_10020FAC8 != -1 || _LogCategory_Initialize(&dword_10020FAC8, 90)))
        {
          LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _handleShareAudioPairingCompleted:error:]", 90, "### Configure device failed: %{error}\n", v19);
        }
        (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v19, 0, 0);

      }
    }
  }

}

- (void)_handleShareAudioSearchTimeout
{
  OS_dispatch_source *searchTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  CUBluetoothClient *searchBTClient;
  id v7;
  id responseHandler;
  uint64_t v9;
  void *v10;
  id v11;

  if (dword_10020FAC8 <= 90 && (dword_10020FAC8 != -1 || _LogCategory_Initialize(&dword_10020FAC8, 90)))
    LogPrintF(&dword_10020FAC8, "-[BTShareAudioService _handleShareAudioSearchTimeout]", 90, "### Connected device search timeout\n");
  searchTimer = self->_searchTimer;
  if (searchTimer)
  {
    v4 = searchTimer;
    dispatch_source_cancel(v4);
    v5 = self->_searchTimer;
    self->_searchTimer = 0;

  }
  -[CUBluetoothClient invalidate](self->_searchBTClient, "invalidate");
  searchBTClient = self->_searchBTClient;
  self->_searchBTClient = 0;

  v7 = objc_retainBlock(self->_responseHandler);
  if (v7)
  {
    responseHandler = self->_responseHandler;
    self->_responseHandler = 0;
    v11 = v7;

    v9 = NSErrorF(NSOSStatusErrorDomain, 4294960569, "No connected device found");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    (*((void (**)(id, void *, _QWORD, _QWORD))v11 + 2))(v11, v10, 0, 0);

    v7 = v11;
  }

}

- (id)configRequestHandler
{
  return self->_configRequestHandler;
}

- (void)setConfigRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)connectRequestHandler
{
  return self->_connectRequestHandler;
}

- (void)setConnectRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_statusMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectRequestHandler, 0);
  objc_storeStrong(&self->_configRequestHandler, 0);
  objc_storeStrong((id *)&self->_searchTimer, 0);
  objc_storeStrong((id *)&self->_searchBTClient, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_headphonesAddress, 0);
  objc_storeStrong((id *)&self->_guestDeviceAddress, 0);
}

@end
