@implementation BTSmartRoutingPipe

- (BTSmartRoutingPipe)init
{
  BTSmartRoutingPipe *v2;
  BTSmartRoutingPipe *v3;
  BTSmartRoutingPipe *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTSmartRoutingPipe;
  v2 = -[BTSmartRoutingPipe init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)_activateWithDispatch:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
  -[BTSmartRoutingPipe _pipeEnsureStarted](self, "_pipeEnsureStarted");
}

- (void)_invalidate
{
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _invalidate]", 30, "Invalidating pipe...");
  self->_invalidateCalled = 1;
  -[BTSmartRoutingPipe _pipeCleanup](self, "_pipeCleanup");
}

- (BOOL)_isPipeCleared
{
  return self->_client == 0;
}

- (void)_runPipeStates
{
  int state;
  const char *v4;
  int v5;
  const char *v6;

  if (!self->_invalidateCalled)
  {
    state = self->_state;
    switch(state)
    {
      case 12:
        if (dword_10020FA58 <= 90
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _runPipeStates]", 90, "### Pipe error: %{error}", self->_inError);
        }
        -[BTSmartRoutingPipe _pipeCleanup](self, "_pipeCleanup");
        break;
      case 11:
        if (dword_10020FA58 <= 30
          && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
        {
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _runPipeStates]", 30, "Pipe done");
        }
        -[BTSmartRoutingPipe _pipeDone](self, "_pipeDone");
        break;
      case 10:
        self->_state = 11;
        break;
    }
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      if (state > 10)
      {
        if (state == 11)
        {
          v4 = "BTSmartRoutingPipeDone";
          goto LABEL_30;
        }
        if (state == 12)
        {
          v4 = "BTSmartRoutingPipeError";
          goto LABEL_30;
        }
      }
      else
      {
        if (!state)
        {
          v4 = "Init";
          goto LABEL_30;
        }
        if (state == 10)
        {
          v4 = "BTSmartRoutingPipeRequest";
          goto LABEL_30;
        }
      }
      v4 = "?";
LABEL_30:
      v5 = self->_state;
      if (v5 > 10)
      {
        if (v5 == 11)
        {
          v6 = "BTSmartRoutingPipeDone";
          goto LABEL_40;
        }
        if (v5 == 12)
        {
          v6 = "BTSmartRoutingPipeError";
          goto LABEL_40;
        }
      }
      else
      {
        if (!v5)
        {
          v6 = "Init";
          goto LABEL_40;
        }
        if (v5 == 10)
        {
          v6 = "BTSmartRoutingPipeRequest";
LABEL_40:
          LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _runPipeStates]", 30, "State: %s -> %s", v4, v6);
          return;
        }
      }
      v6 = "?";
      goto LABEL_40;
    }
  }
}

- (void)_pipeEnsureStarted
{
  RPCompanionLinkClient **p_pipeResponder;
  RPCompanionLinkClient *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  p_pipeResponder = &self->_pipeResponder;
  v4 = self->_pipeResponder;
  if (!v4)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeEnsureStarted]", 30, "Route request register");
    }
    v4 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    objc_storeStrong((id *)p_pipeResponder, v4);
    -[RPCompanionLinkClient setControlFlags:](v4, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](v4, "controlFlags") | 2);
    -[RPCompanionLinkClient setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000542A0;
    v6[3] = &unk_1001E2110;
    v6[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v4, "activateWithCompletion:", v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100054348;
    v5[3] = &unk_1001E3770;
    v5[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:](v4, "registerRequestID:options:handler:", CFSTR("com.apple.SmartRoutingRequest"), 0, v5);
  }

}

- (void)_pipeEnsureStopped
{
  RPCompanionLinkClient *pipeResponder;
  RPCompanionLinkClient *client;

  if (self->_pipeResponder)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeEnsureStopped]", 30, "Route request deregister");
    }
    -[RPCompanionLinkClient invalidate](self->_pipeResponder, "invalidate");
    pipeResponder = self->_pipeResponder;
    self->_pipeResponder = 0;

  }
  -[BTSmartRoutingPipe _pipeCleanup](self, "_pipeCleanup");
  client = self->_client;
  if (client)
  {
    self->_client = 0;

  }
}

- (void)_pipeCleanup
{
  void (**inCompletion)(id);
  uint64_t v4;
  void *v5;
  id v6;
  NSString *senderIDS;
  RPCompanionLinkClient *client;
  RPCompanionLinkClient *v9;

  inCompletion = (void (**)(id))self->_inCompletion;
  if (inCompletion)
  {
    if (self->_inError)
    {
      inCompletion[2](self->_inCompletion);
    }
    else
    {
      v4 = NSErrorF(NSOSStatusErrorDomain, 4294960596, "Cleanup before done");
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      ((void (*)(void (**)(id), void *))inCompletion[2])(inCompletion, v5);

    }
    v6 = self->_inCompletion;
    self->_inCompletion = 0;

  }
  self->_invalidateCalled = 0;
  senderIDS = self->_senderIDS;
  if (senderIDS)
  {
    self->_senderIDS = 0;

  }
  self->_score = 0;
  client = self->_client;
  if (client)
  {
    -[RPCompanionLinkClient invalidate](client, "invalidate");
    v9 = self->_client;
    self->_client = 0;

  }
}

- (void)_pipeConnectionComplete:(id)a3 andWxHeadset:(id)a4 isSender:(BOOL)a5
{
  __CFString *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  BTSmartRoutingPipe *v31;
  _QWORD v32[7];
  _QWORD v33[7];

  v30 = a5;
  v7 = (__CFString *)a4;
  if (a3)
    v8 = 12;
  else
    v8 = 11;
  v31 = self;
  self->_state = v8;
  v9 = a3;
  v10 = CUPrintNSError(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pipePendingRequest"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timer"));

  if (v14)
    dispatch_source_cancel(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pipePendingRequest"));
  objc_msgSend(v15, "setTimer:", 0);

  objc_msgSend(v12, "setPipePendingRequest:", 0);
  objc_msgSend(v12, "_setTipiElectionInProgress:", 0);
  objc_msgSend(v12, "_setTipiElectionReceivedLePipe:", &stru_1001ED4C0);
  objc_msgSend(v12, "_startTipiSetupTicks");
  if (!a3)
    objc_msgSend(v12, "_setIsFirstConnentionAfterSREnable:forDevice:", 0, v7);
  if (v7)
    v16 = v7;
  else
    v16 = &stru_1001ED4C0;
  v17 = v16;
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_getWxFWVersion:", v17));
  v19 = (void *)v18;
  if (v18)
    v20 = (__CFString *)v18;
  else
    v20 = &stru_1001ED4C0;
  v21 = v20;

  v22 = objc_msgSend(v12, "_getWxProductID:", v17);
  v32[0] = CFSTR("pipeError");
  v32[1] = CFSTR("pipeError2");
  v33[0] = v11;
  v33[1] = v11;
  v32[2] = CFSTR("pipeErrorCode");
  v29 = (void *)v11;
  v23 = objc_msgSend(v9, "code");

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23));
  v33[2] = v24;
  v33[3] = v21;
  v32[3] = CFSTR("wxBuildVersion");
  v32[4] = CFSTR("wxPD");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v22));
  v33[4] = v25;
  v32[5] = CFSTR("isSender");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v30));
  v33[5] = v26;
  v32[6] = CFSTR("isSender2");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v30));
  v33[6] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 7));

  CUMetricsLogEx(&dword_10020FA58, CFSTR("com.apple.bluetooth.SmartRoutingPipe"), v28);
  -[BTSmartRoutingPipe _runPipeStates](v31, "_runPipeStates");

}

- (void)_pipeSendRouteRequestToSFDevice:(id)a3 andWxHeadset:(id)a4 newPipe:(BOOL)a5 connectionResult:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSError *inError;
  id v20;
  id inCompletion;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSNumber *v27;
  void *v28;
  RPCompanionLinkClient *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  BTSmartRoutingPipe *v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[3];
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[3];
  BOOL v45;
  uint64_t v46;
  _UNKNOWN **v47;

  v9 = a5;
  v13 = a3;
  v14 = a4;
  v33 = a6;
  v15 = a7;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = v9;
  v16 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = v16;
  if (v9)
  {
    v18 = objc_alloc_init((Class)RPCompanionLinkDevice);
    objc_msgSend(v18, "setIdentifier:", v13);
    inError = self->_inError;
    self->_inError = 0;

    v20 = objc_retainBlock(v15);
    inCompletion = self->_inCompletion;
    self->_inCompletion = v20;

    objc_storeStrong((id *)&self->_senderIDS, a3);
    v22 = objc_alloc_init((Class)RPCompanionLinkClient);
    objc_storeStrong((id *)&self->_client, v22);
    objc_msgSend(v22, "setControlFlags:", (unint64_t)objc_msgSend(v22, "controlFlags") | 0x600100);
    objc_msgSend(v22, "setDestinationDevice:", v18);
    objc_msgSend(v22, "setDispatchQueue:", self->_dispatchQueue);
    if ((objc_opt_respondsToSelector(v22, "setBleClientUseCase:") & 1) != 0)
      objc_msgSend(v22, "setBleClientUseCase:", 18);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100054C40;
    v42[3] = &unk_1001E2410;
    v42[4] = self;
    v23 = v14;
    v43 = v23;
    objc_msgSend(v22, "activateWithCompletion:", v42);
    self->_state = 10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_myBluetoothAddressString"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("btAddress"));

    v26 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("btName"));

    v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", arc4random());
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, CFSTR("btXID"));

    objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("wxAddress"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", &off_1001F3D38, CFSTR("version"));

  }
  else
  {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v33, CFSTR("btConnectionResult"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", &off_1001F3D38, CFSTR("version"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("wxAddress"));
  }
  v29 = self->_client;
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeSendRouteRequestToSFDevice:andWxHeadset:newPipe:connectionResult:completion:]", 30, "Send route request start: peer %@, %##@", v13, v17);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v41 = mach_absolute_time();
  v46 = RPOptionTimeoutSeconds;
  v47 = &off_1001F45C0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100054CBC;
  v34[3] = &unk_1001E3798;
  v31 = v13;
  v35 = v31;
  v36 = self;
  v32 = v14;
  v37 = v32;
  v38 = v40;
  v39 = v44;
  -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](v29, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.SmartRoutingRequest"), v17, v30, v34);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v44, 8);

}

- (void)_pipeReceivedRouteRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  BTSmartRoutingRouteRequest *v19;
  uint64_t NSNumber;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  CFTypeID v29;
  uint64_t v30;
  CFTypeID v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  void *v37;
  BOOL v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  CFTypeID v48;
  uint64_t v49;
  CFTypeID v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v95[4];
  id v96;
  void *v97;
  void *v98;
  id v99;
  BTSmartRoutingPipe *v100;
  BTSmartRoutingRouteRequest *v101;
  _QWORD handler[4];
  id v103;
  id v104;
  BTSmartRoutingPipe *v105;
  BTSmartRoutingRouteRequest *v106;
  void *v107;
  id v108;
  _QWORD v109[4];
  id v110;
  id v111;
  BTSmartRoutingPipe *v112;
  BTSmartRoutingRouteRequest *v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  _QWORD v121[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = RPOptionSenderIDSDeviceID;
  TypeID = CFStringGetTypeID();
  v93 = v8;
  TypedValue = CFDictionaryGetTypedValue(v8, v10, TypeID, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));
  if (!v15
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "senderIDS")),
        v18 = objc_msgSend(v17, "isEqualToString:", v13),
        v17,
        v16,
        v15,
        (v18 & 1) != 0))
  {
    v19 = objc_alloc_init(BTSmartRoutingRouteRequest);
    NSNumber = NSDictionaryGetNSNumber(v7, CFSTR("btXID"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    -[BTSmartRoutingRouteRequest setBtXID:](v19, "setBtXID:", v21);

    -[BTSmartRoutingRouteRequest setRequest:](v19, "setRequest:", v7);
    -[BTSmartRoutingRouteRequest setResponseHandler:](v19, "setResponseHandler:", v9);
    -[BTSmartRoutingRouteRequest setSenderIDS:](v19, "setSenderIDS:", v13);
    v115 = 0;
    v116 = &v115;
    v117 = 0x3032000000;
    v118 = sub_10001E9DC;
    v119 = sub_10001E9EC;
    v120 = 0;
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_100055CF4;
    v109[3] = &unk_1001E37C0;
    v114 = &v115;
    v22 = v13;
    v110 = v22;
    v23 = v7;
    v111 = v23;
    v112 = self;
    v113 = v19;
    v24 = objc_retainBlock(v109);
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]", 30, "Received route request: from %@, %##@", v22, v23);
    }
    objc_msgSend(v14, "_powerLogSmartIncomingConnection");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
    v28 = objc_msgSend(v27, "_isForceRejectPipe");

    if (v28)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]", 30, "Reject any LE pipe because default write is enabled");
      }
      v33 = NSErrorF(NSOSStatusErrorDomain, 4294960596, "The device is forced to reject any LE pipe as default write enabled");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      v35 = (void *)v116[5];
      v116[5] = v34;
      goto LABEL_56;
    }
    v29 = CFStringGetTypeID();
    v30 = CFDictionaryGetTypedValue(v23, CFSTR("btConnectionResult"), v29, 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v31 = CFStringGetTypeID();
    v32 = CFDictionaryGetTypedValue(v23, CFSTR("wxAddress"), v31, 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("version")));
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]", 30, "Version %@", v92);
    }
    -[BTSmartRoutingRouteRequest setVersion:](v19, "setVersion:", v92);
    objc_msgSend(v92, "doubleValue");
    if (v36 >= 1.2)
    {
      if (v90)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));
        v38 = v37 == 0;

        if (!v38)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));
          v40 = objc_msgSend(v39, "progressStarted");

          if (v40)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));
            objc_msgSend(v41, "setProgressStarted:", 0);

            objc_msgSend(v14, "_setTipiElectionInProgress:", 0);
            objc_msgSend(v14, "_setTipiElectionReceivedLePipe:", &stru_1001ED4C0);
            -[BTSmartRoutingPipe _pipeRequestCompleted:error:](self, "_pipeRequestCompleted:error:", v19, 0);
            if (objc_msgSend(v90, "isEqual:", CFSTR("connectionResultError")))
            {
              if (dword_10020FA58 <= 90
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]", 90, "Connection result is failure. Remove knowledge of other %@", v92);
              }
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));
              v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "wxAddress"));

              v67 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
              v68 = NSErrorF(NSOSStatusErrorDomain, 4294960595, "Connection failed");
              v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
              objc_msgSend(v67, "_updateOtherTipiDevice:otherAddress:otherName:otherVersion:withResult:", v86, 0, 0, 0, v69);

              v70 = NSErrorF(NSOSStatusErrorDomain, 4294960595, "Connection failed");
              v84 = (void *)objc_claimAutoreleasedReturnValue(v70);
              -[BTSmartRoutingPipe _pipeConnectionComplete:andWxHeadset:isSender:](self, "_pipeConnectionComplete:andWxHeadset:isSender:", v84, v86, 0);

LABEL_54:
              goto LABEL_55;
            }
            -[BTSmartRoutingPipe _pipeConnectionComplete:andWxHeadset:isSender:](self, "_pipeConnectionComplete:andWxHeadset:isSender:", 0, v91, 0);
            v87 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
            objc_msgSend(v87, "_notifyOtherTipiDeviceTipiScoreChanged:andNewScore:", 0, 0);

          }
LABEL_55:

          v35 = v90;
LABEL_56:

          ((void (*)(_QWORD *))v24[2])(v24);
          _Block_object_dispose(&v115, 8);

          goto LABEL_57;
        }
      }
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));

    if (v42)
    {
      if (dword_10020FA58 <= 30
        && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
      {
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]", 30, "Previous pipe request exists, clean it up");
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));
      v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "timer"));

      if (v46)
        dispatch_source_cancel(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));
      objc_msgSend(v47, "setTimer:", 0);

      objc_msgSend(v14, "setPipePendingRequest:", 0);
    }
    v48 = CFStringGetTypeID();
    v49 = CFDictionaryGetTypedValue(v23, CFSTR("btAddress"), v48, 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue(v49);
    if (v86)
    {
      v50 = CFStringGetTypeID();
      v51 = CFDictionaryGetTypedValue(v23, CFSTR("btName"), v50, 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue(v51);
      if (v83)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_verifyWxConnectedBTAddress:withVersion:", v91, v92));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "identifier"));
        v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("FF:FF:FF:FF:FF:FF"));

        if (v53)
        {
          v54 = NSErrorF(NSOSStatusErrorDomain, 4294960587, "Source has SR disabled!!! BACK OFF!");
          v55 = objc_claimAutoreleasedReturnValue(v54);
          v56 = (void *)v116[5];
          v116[5] = v55;
        }
        else
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "btAddressData"));
          v58 = CUPrintNSDataAddress(v57);
          v82 = objc_claimAutoreleasedReturnValue(v58);

          if ((objc_msgSend(v14, "_verifyWxConnectedRouted:", v82) & 1) != 0)
          {
            v59 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
            -[BTSmartRoutingRouteRequest setTimer:](v19, "setTimer:", v59);
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_100055DB4;
            handler[3] = &unk_1001E37E8;
            v103 = v22;
            v104 = v23;
            v105 = self;
            v106 = v19;
            v107 = v14;
            v60 = v88;
            v108 = v60;
            dispatch_source_set_event_handler(v59, handler);
            CUDispatchTimerSet(v59, 25.0, -1.0, 1.0);
            dispatch_activate(v59);
            -[BTSmartRoutingRouteRequest setWxAddress:](v19, "setWxAddress:", v82);
            v79 = v59;
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "_myBluetoothAddressString"));

            if (v81)
            {
              v121[0] = v81;
              v121[1] = v86;
              v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v121, 2));
              if (dword_10020FA58 <= 30
                && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
              {
                LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]", 30, "Route request update Tipi table: Wx %@, addresses %##@", v60, v62);
              }
              objc_msgSend(v14, "setPipePendingRequest:", v19);
              objc_msgSend(v14, "_setTipiElectionInProgress:", 1);
              objc_msgSend(v14, "_setTipiElectionReceivedLePipe:", v82);
              -[BTSmartRoutingRouteRequest setProgressStarted:](v19, "setProgressStarted:", 1);
              objc_msgSend(v14, "_startTipiSetupTicks");
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "btAddressData"));
              v64 = CUPrintNSDataAddress(v63);
              v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
              objc_msgSend(v14, "_updateOtherTipiDevice:otherAddress:otherName:otherVersion:withResult:", v65, v86, v83, v92, 0);

              v95[0] = _NSConcreteStackBlock;
              v95[1] = 3221225472;
              v95[2] = sub_100055EE0;
              v95[3] = &unk_1001E3810;
              v96 = v91;
              v97 = v62;
              v98 = v14;
              v99 = v60;
              v100 = self;
              v101 = v19;
              objc_msgSend(v14, "_updateAccessoryID:connectionDeviceAddresses:completion:", v99, v62, v95);

            }
            else
            {
              v77 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "No self Bluetooth address.");
              v78 = objc_claimAutoreleasedReturnValue(v77);
              v62 = (void *)v116[5];
              v116[5] = v78;
            }

          }
          else
          {
            v75 = NSErrorF(NSOSStatusErrorDomain, 4294960576, "Wx device is not routed... reject incoming pipe!");
            v76 = objc_claimAutoreleasedReturnValue(v75);
            v80 = (void *)v116[5];
            v116[5] = v76;

          }
          v56 = (void *)v82;
        }

      }
      else
      {
        v73 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "No device name");
        v74 = objc_claimAutoreleasedReturnValue(v73);
        v89 = (void *)v116[5];
        v116[5] = v74;

      }
    }
    else
    {
      v71 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "No device address");
      v72 = objc_claimAutoreleasedReturnValue(v71);
      v85 = (void *)v116[5];
      v116[5] = v72;

    }
    goto LABEL_54;
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pipePendingRequest"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "senderIDS"));
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeReceivedRouteRequest:options:responseHandler:]", 30, "Received route request: from %@ however we already have requesting pending with %@ reject this.", v13, v26);

  }
  v43 = NSErrorF(NSOSStatusErrorDomain, 4294960595, "Reject connection already have pending request.");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v44);

LABEL_57:
}

- (void)_pipeRequestCompleted:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = v6;
  if (v5)
    v8 = CFSTR("NO");
  else
    v8 = CFSTR("YES");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("connectionResultACK"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "wxAddress"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("wxAddress"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_1001F3D38, CFSTR("version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "btXID"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("btXID"));

  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "senderIDS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "request"));
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeRequestCompleted:error:]", 30, "Route request completed: senderIDS %@ version %@, request %##@, response %##@", v11, &off_1001F3D38, v12, v7);

  }
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "responseHandler"));
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, void *, _QWORD, id))(v13 + 16))(v13, v7, 0, v5);

  objc_msgSend(v17, "setResponseHandler:", 0);
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timer"));
  v16 = v15;
  if (v15)
    dispatch_source_cancel(v15);
  objc_msgSend(v17, "setTimer:", 0);

}

- (void)_pipeRequestResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (v6)
  {
    if (dword_10020FA58 <= 90
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 90)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "senderIDS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "request"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeRequestResponse:error:]", 90, "### Route request failed: senderIDS %@, request %##@, %{error}", v7, v8, v6);

    }
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "responseHandler"));
    v17 = (void *)v16;
    if (v16)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v16 + 16))(v16, 0, 0, v6);

    objc_msgSend(v22, "setResponseHandler:", 0);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "timer"));
    v9 = v18;
    if (v18)
      dispatch_source_cancel(v18);
    objc_msgSend(v22, "setTimer:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wxAddress"));
    -[BTSmartRoutingPipe _pipeConnectionComplete:andWxHeadset:isSender:](self, "_pipeConnectionComplete:andWxHeadset:isSender:", v6, v19, 0);

  }
  else
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_myBluetoothAddressString"));
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, CFSTR("btAddress"));

    v12 = (void *)GestaltCopyAnswer(CFSTR("DeviceName"), 0, 0);
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, CFSTR("btName"));

    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &off_1001F3D38, CFSTR("version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "btXID"));
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, CFSTR("btXID"));

    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "senderIDS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "request"));
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingPipe _pipeRequestResponse:error:]", 30, "Route request response: senderIDS %@ version %@, request %##@, response %##@", v14, &off_1001F3D38, v15, v9);

    }
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "responseHandler"));
    v21 = (void *)v20;
    if (v20)
      (*(void (**)(uint64_t, NSObject *, _QWORD, _QWORD))(v20 + 16))(v20, v9, 0, 0);

    objc_msgSend(v22, "setResponseHandler:", 0);
  }

}

- (void)_pipeDone
{
  void (**inCompletion)(id, _QWORD);
  id v4;

  inCompletion = (void (**)(id, _QWORD))self->_inCompletion;
  if (inCompletion)
  {
    inCompletion[2](inCompletion, 0);
    v4 = self->_inCompletion;
    self->_inCompletion = 0;

  }
  -[BTSmartRoutingPipe _pipeCleanup](self, "_pipeCleanup");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIDS, 0);
  objc_storeStrong((id *)&self->_pipeResponder, 0);
  objc_storeStrong((id *)&self->_inError, 0);
  objc_storeStrong(&self->_inCompletion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
