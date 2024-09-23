@implementation STSReader

- (STSReader)initWithType:(unint64_t)a3 queue:(id)a4
{
  id v6;
  STSReader *v7;
  STSReader *v8;
  uint64_t v9;
  STSHardwareManagerWrapper *nfHwManager;
  OS_dispatch_queue *v11;
  NSObject *callbackQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *v14;
  STSXPCClientNotificationListener *v15;
  STSXPCClientNotificationListener *stsNotificationListener;
  uint64_t v17;
  STSCASessionStats *caSessionStats;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)STSReader;
  v7 = -[STSReader init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v7->_transmissionState = 0;
    v9 = objc_opt_new();
    nfHwManager = v8->_nfHwManager;
    v8->_nfHwManager = (STSHardwareManagerWrapper *)v9;

    if (v6)
    {
      v11 = (OS_dispatch_queue *)v6;
      callbackQueue = v8->_callbackQueue;
      v8->_callbackQueue = v11;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      callbackQueue = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("STSReader", callbackQueue);
      v14 = v8->_callbackQueue;
      v8->_callbackQueue = (OS_dispatch_queue *)v13;

    }
    dispatch_suspend((dispatch_object_t)v8->_callbackQueue);
    v8->_queuePaused = 1;
    v8->_state = 0;
    v15 = -[STSXPCClientNotificationListener initWithDelegate:queue:]([STSXPCClientNotificationListener alloc], "initWithDelegate:queue:", v8, v8->_callbackQueue);
    stsNotificationListener = v8->_stsNotificationListener;
    v8->_stsNotificationListener = v15;

    v17 = objc_opt_new();
    caSessionStats = v8->_caSessionStats;
    v8->_caSessionStats = (STSCASessionStats *)v17;

  }
  return v8;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader dealloc]", 190, self, &stru_24D3A78C0, v2, v3, (uint64_t)v10.receiver);
  -[STSReader caSessionStats](self, "caSessionStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postReaderSessionEvent");

  if (-[STSReader state](self, "state") != 2)
  {
    -[STSReader responseTimeout](self, "responseTimeout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopTimer");

    -[STSReader handoverSession](self, "handoverSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endSession");

    -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", 0);
    -[STSReader stsHelper](self, "stsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[STSReader stsNotificationListener](self, "stsNotificationListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateXPCConnection");

  }
  v10.receiver = self;
  v10.super_class = (Class)STSReader;
  -[STSReader dealloc](&v10, sel_dealloc);
}

- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 tnepStatusHandler:(id)a5 invalidationErrorHandler:(id)a6 completion:(id)a7
{
  char v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  os_activity_scope_state_s v20;

  v10 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = _os_activity_create(&dword_2158A9000, "startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationHandler:completion:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v20.opaque[0] = 0;
  v20.opaque[1] = 0;
  os_activity_scope_enter(v16, &v20);
  os_activity_scope_leave(&v20);

  +[STSEngagementConfiguration configurationWithDeviceEngagementType:dataRetrievalType:engagementData:](STSEngagementConfiguration, "configurationWithDeviceEngagementType:dataRetrievalType:engagementData:", 0, v10 & 7, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:](self, "startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:", v17, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)startWithConfiguration:(id)a3 connectionHandler:(id)a4 tnepStatusHandler:(id)a5 invalidationHandler:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  STSReader *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  id v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  STSReader *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[5];
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD block[4];
  id v86;
  id v87;
  _QWORD v88[5];
  id v89;
  os_activity_scope_state_s *p_state;
  os_activity_scope_state_s state;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  _QWORD aBlock[6];
  _QWORD v97[4];
  id v98;
  id v99;
  _QWORD v100[4];
  _QWORD v101[6];

  v101[4] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v79 = a4;
  v80 = a5;
  v78 = a6;
  v14 = a7;
  v15 = objc_msgSend(v13, "deviceEngagementType");
  v16 = objc_msgSend(v13, "dataRetrievalType");
  objc_msgSend(v13, "engagementData");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 237, self, CFSTR("Start with deviceEngagementType = 0x%x, dataRetrievalType = 0x%x and engagementData = %@"), v17, v18, v15);

  v19 = _os_activity_create(&dword_2158A9000, "startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationHandler:completion:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v19, &state);
  os_activity_scope_leave(&state);

  if (-[STSReader queuePaused](self, "queuePaused"))
  {
    -[STSReader setQueuePaused:](self, "setQueuePaused:", 0);
    -[STSReader callbackQueue](self, "callbackQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v20);

  }
  v21 = self;
  objc_sync_enter(v21);
  if (-[STSReader state](v21, "state") && -[STSReader state](v21, "state") != 2)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 257, v21, CFSTR("Unexpected state; invalidate existing sessions"),
      v22,
      v23,
      v74);
    -[STSReader invalidateWithCodeSync:](v21, "invalidateWithCodeSync:", 17);
  }
  -[STSReader setSessionStartCompletion:](v21, "setSessionStartCompletion:", v14);
  -[STSReader setTnepStatusHandler:](v21, "setTnepStatusHandler:", v80);
  -[STSReader setConnectionHandler:](v21, "setConnectionHandler:", v79);
  -[STSReader setState:](v21, "setState:", 1);
  -[STSReader setInvalidationHandler:](v21, "setInvalidationHandler:", v78);
  -[STSReader caSessionStats](v21, "caSessionStats");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTotalTransactionsInSession:", objc_msgSend(v24, "totalTransactionsInSession") + 1);

  objc_sync_exit(v21);
  v25 = (void *)objc_opt_new();
  -[STSReader setStsHelper:](v21, "setStsHelper:", v25);

  if (!objc_msgSend(v13, "deviceEngagementType"))
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 272, v21, CFSTR("NFC Engagement"), v26, v27, v74);
    v36 = objc_msgSend(v13, "dataRetrievalType");
    v37 = objc_msgSend(v13, "dataRetrievalType");
    v38 = v36 & 1 | (8 * ((v37 >> 1) & 1)) & 0xFFFFFFFFFFFFFFEFLL | (16
                                                                   * (((unint64_t)objc_msgSend(v13, "dataRetrievalType") >> 2) & 1));
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 286, v21, CFSTR("Starting nfc handover session with handover Type=0x%lx"), v39, v40, v38);
    v41 = v21;
    objc_sync_enter(v41);
    -[STSReader nfHwManager](v41, "nfHwManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "manager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 291, v41, CFSTR("Hardware not available"), v44, v45, v75);
      v77 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Hardware Not Available");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v53;
      v101[1] = &unk_24D3B2948;
      v100[1] = CFSTR("Line");
      v100[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2), v16, v76);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v101[2] = v54;
      v100[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 292);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v101[3] = v55;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "errorWithDomain:code:userInfo:", v52, 12, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      -[STSReader callbackQueue](v41, "callbackQueue");
      v58 = objc_claimAutoreleasedReturnValue();
      v97[0] = MEMORY[0x24BDAC760];
      v97[1] = 3221225472;
      v97[2] = sub_2158B0954;
      v97[3] = &unk_24D3A6E90;
      v99 = v14;
      v59 = v57;
      v98 = v59;
      dispatch_async(v58, v97);

      v60 = v98;
      v35 = v59;

      objc_sync_exit(v41);
      goto LABEL_19;
    }
    objc_sync_exit(v41);

    v46 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_2158B0964;
    aBlock[3] = &unk_24D3A7070;
    aBlock[4] = v41;
    aBlock[5] = a2;
    v47 = _Block_copy(aBlock);
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    v92 = 0x3032000000;
    v93 = sub_2158B0DE4;
    v94 = sub_2158B0DF4;
    v95 = 0;
    v88[0] = v46;
    v88[1] = 3221225472;
    v88[2] = sub_2158B0DFC;
    v88[3] = &unk_24D3A7098;
    v88[4] = v41;
    v89 = v47;
    p_state = &state;
    v48 = v47;
    objc_msgSend(v43, "startSecureTransactionServicesSessionWithRole:connectionHandoverCofig:completion:", 1, v38, v88);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = *(void **)(state.opaque[1] + 40);
    *(_QWORD *)(state.opaque[1] + 40) = v49;

    _Block_object_dispose(&state, 8);
    goto LABEL_18;
  }
  if (objc_msgSend(v13, "deviceEngagementType") != 1)
  {
LABEL_18:
    v35 = 0;
    goto LABEL_19;
  }
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 341, v21, CFSTR("QR Code Engagement"), v28, v29, v74);
  v21->_engagementConfiguration = 64;
  if ((objc_msgSend(v13, "dataRetrievalType") & 1) != 0)
    v21->_engagementConfiguration |= 1uLL;
  if ((objc_msgSend(v13, "dataRetrievalType") & 2) != 0)
    v21->_engagementConfiguration |= 2uLL;
  if ((objc_msgSend(v13, "dataRetrievalType") & 4) != 0)
    v21->_engagementConfiguration |= 4uLL;
  -[STSReader stsHelper](v21, "stsHelper");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", v21->_engagementConfiguration, 1, v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    -[STSReader stsHelper](v21, "stsHelper");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSReader stsNotificationListener](v21, "stsNotificationListener");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "xpcEndpoint");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "connectToNotificationListener:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      -[STSReader callbackQueue](v21, "callbackQueue");
      v65 = objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x24BDAC760];
      v82[1] = 3221225472;
      v82[2] = sub_2158B0F84;
      v82[3] = &unk_24D3A6E90;
      v84 = v14;
      v66 = v64;
      v83 = v66;
      dispatch_async(v65, v82);

      v67 = v83;
      v35 = v66;

      goto LABEL_19;
    }
    objc_msgSend(v13, "engagementData");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 373, v21, CFSTR("engagementData = %@"), v69, v70, (uint64_t)v68);

    -[STSReader stsHelper](v21, "stsHelper");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "engagementData");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSReader callbackQueue](v21, "callbackQueue");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = sub_2158B0F94;
    v81[3] = &unk_24D3A6F30;
    v81[4] = v21;
    objc_msgSend(v71, "connectRemoteWithQRCodeHandoverData:callbackQueue:responseHandler:", v72, v73, v81);

    goto LABEL_18;
  }
  -[STSReader callbackQueue](v21, "callbackQueue");
  v32 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158B0F74;
  block[3] = &unk_24D3A6E90;
  v87 = v14;
  v33 = v31;
  v86 = v33;
  dispatch_async(v32, block);

  v34 = v86;
  v35 = v33;

LABEL_19:
  return v35;
}

- (void)sendDocumentRequest:(id)a3 timeoutInterval:(double)a4 sessionTermination:(BOOL)a5 responseHandler:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  STSReader *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  STSTimer *v52;
  void *v53;
  STSTimer *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[6];
  _QWORD aBlock[5];
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD block[4];
  id v64;
  id v65;
  os_activity_scope_state_s state;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[4];

  v7 = a5;
  v74[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  v13 = _os_activity_create(&dword_2158A9000, "sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 401, self, CFSTR("timeoutInterval=%f"), v14, v15, *(uint64_t *)&a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v11, "length"))
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 403, self, CFSTR("Invalid parameter"), v16, v17, v57);
    v27 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v29;
    v73[1] = *MEMORY[0x24BDD0FD8];
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid Parameter"));
    v74[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 8, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSReader callbackQueue](self, "callbackQueue");
    v33 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2158B17DC;
    block[3] = &unk_24D3A6E90;
    v64 = v32;
    v65 = v12;
    v34 = v32;
    dispatch_async(v33, block);

    goto LABEL_6;
  }
  v18 = self;
  objc_sync_enter(v18);
  if (-[STSReader state](v18, "state") == 2)
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 417, v18, CFSTR("invalidated flag already set"), v19, v20, v57);
    v21 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v23;
    v71[1] = *MEMORY[0x24BDD0FD8];
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Session invalidated"));
    v72[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 9, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[STSReader sendRequestCompletion](v18, "sendRequestCompletion");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 420, v18, CFSTR("sendRequestCompletion already set"), v36, v37, v57);
    v38 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v23;
    v69[1] = *MEMORY[0x24BDD0FD8];
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Pending send exists"));
    v70[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", v22, 9, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((v18->_engagementConfiguration & 0x40) == 0)
  {
    -[STSReader handoverSession](v18, "handoverSession");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42 == 0;

    if (v43)
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 423, v18, CFSTR("Not a QRCode session and handoverSession is not created"), v44, v45, v57);
      v56 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v23;
      v67[1] = *MEMORY[0x24BDD0FD8];
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Session has not started"));
      v68[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "errorWithDomain:code:userInfo:", v22, 9, v25);
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v39 = (void *)v26;

      if (v39)
      {
        -[STSReader callbackQueue](v18, "callbackQueue");
        v40 = objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x24BDAC760];
        v60[1] = 3221225472;
        v60[2] = sub_2158B17F0;
        v60[3] = &unk_24D3A6E90;
        v61 = v39;
        v62 = v12;
        v41 = v39;
        dispatch_async(v40, v60);

        objc_sync_exit(v18);
        goto LABEL_6;
      }
    }
  }
  if (v7 && !-[STSReader transmissionState](v18, "transmissionState"))
    -[STSReader setTransmissionState:](v18, "setTransmissionState:", 1);
  if (-[STSReader transmissionState](v18, "transmissionState"))
    v46 = -[STSReader transmissionState](v18, "transmissionState") == 1;
  else
    v46 = 1;
  -[STSReader setSendRequestCompletion:](v18, "setSendRequestCompletion:", v12);
  objc_sync_exit(v18);

  v47 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2158B1804;
  aBlock[3] = &unk_24D3A6F30;
  aBlock[4] = v18;
  v48 = _Block_copy(aBlock);
  -[STSReader stsNotificationListener](v18, "stsNotificationListener");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v46)
  {
    objc_msgSend(v49, "sendISO18013SessionEstablishment:completion:", v11, v48);
  }
  else
  {
    if (v7)
      v51 = &unk_24D3B29A8;
    else
      v51 = 0;
    objc_msgSend(v49, "sendISO18013SessionData:status:completion:", v11, v51, v48);
  }

  v52 = [STSTimer alloc];
  v58[0] = v47;
  v58[1] = 3221225472;
  v58[2] = sub_2158B18B0;
  v58[3] = &unk_24D3A70C0;
  v58[4] = v18;
  v58[5] = a2;
  -[STSReader callbackQueue](v18, "callbackQueue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[STSTimer initWithCallback:queue:](v52, "initWithCallback:queue:", v58, v53);
  -[STSReader setResponseTimeout:](v18, "setResponseTimeout:", v54);

  -[STSReader responseTimeout](v18, "responseTimeout");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "startTimer:", a4);

LABEL_6:
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader invalidate]", 478, self, &stru_24D3A78C0, v2, v3, v5);
  MEMORY[0x24BEDD108](self, sel_invalidateWithCode_);
}

- (void)invalidateWithCode:(unsigned int)a3
{
  uint64_t v3;
  STSReader *obj;

  v3 = *(_QWORD *)&a3;
  obj = self;
  objc_sync_enter(obj);
  -[STSReader invalidateWithCodeSync:](obj, "invalidateWithCodeSync:", v3);
  objc_sync_exit(obj);

}

- (void)invalidateWithCodeSync:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  SEL v25;
  _QWORD block[4];
  id v27;
  SEL v28;
  int v29;
  os_activity_scope_state_s state;
  _QWORD v31[4];
  _QWORD v32[6];

  v3 = *(_QWORD *)&a3;
  v32[4] = *MEMORY[0x24BDAC8D0];
  v6 = _os_activity_create(&dword_2158A9000, "invalidateWithCodeSync:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  if (-[STSReader state](self, "state") == 2)
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader invalidateWithCodeSync:]", 495, self, CFSTR("Previously invalidated"), v7, v8, v24);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader invalidateWithCodeSync:]", 499, self, CFSTR("code=%d"), v7, v8, v3);
    -[STSReader responseTimeout](self, "responseTimeout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopTimer");

    -[STSReader setResponseTimeout:](self, "setResponseTimeout:", 0);
    -[STSReader setSessionTranscriptBytes:](self, "setSessionTranscriptBytes:", 0);
    -[STSReader handoverSession](self, "handoverSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endSession");

    -[STSReader setHandoverSession:](self, "setHandoverSession:", 0);
    -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", 0);
    -[STSReader stsHelper](self, "stsHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[STSReader setStsHelper:](self, "setStsHelper:", 0);
    -[STSReader setState:](self, "setState:", 2);
    -[STSReader invalidationHandler](self, "invalidationHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSReader setInvalidationHandler:](self, "setInvalidationHandler:", 0);
    -[STSReader stsNotificationListener](self, "stsNotificationListener");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateXPCConnection");

    -[STSReader setTransmissionState:](self, "setTransmissionState:", 0);
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x24BDD0FC8];
    if (v3 >= 0x18)
      v16 = 24;
    else
      v16 = v3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", off_24D3A6FA0[v16]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v17;
    v32[1] = &unk_24D3B29D8;
    v31[1] = CFSTR("Line");
    v31[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v18;
    v31[3] = *MEMORY[0x24BDD0BA0];
    v25 = a2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 515);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v3, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSReader _activateSendRequestCompletion:terminationRequested:error:](self, "_activateSendRequestCompletion:terminationRequested:error:", 0, 0, v21);

    if (v12)
    {
      -[STSReader callbackQueue](self, "callbackQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_2158B1ED0;
      block[3] = &unk_24D3A70E8;
      v29 = v3;
      v27 = v12;
      v28 = v25;
      v23 = v12;
      dispatch_async(v22, block);

    }
  }
}

- (void)executeOnSEProxyWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  dispatch_time_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NFSecureElementReaderProxyListener *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  dispatch_queue_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  id *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v62[4];
  _QWORD v63[2];
  _QWORD v64[4];
  id v65;
  STSReader *v66;
  id v67;
  _QWORD v68[4];
  NSObject *v69;
  SEL v70;
  _QWORD v71[4];
  NSObject *v72;
  SEL v73;
  _QWORD v74[4];
  id v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _QWORD block[4];
  id v84;
  uint64_t *v85;
  id v86;
  uint64_t v87;
  id *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _QWORD aBlock[5];
  NSObject *v94;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 526, self, &stru_24D3A78C0, v5, v6, v57);
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2158B282C;
  aBlock[3] = &unk_24D3A6EE0;
  aBlock[4] = self;
  v9 = v7;
  v94 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[STSReader initiatingSession](self, "initiatingSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    -[STSReader proxyReaderSESession](self, "proxyReaderSESession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_5;
  }
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 555, self, CFSTR("initiatingSession or proxyReaderSESession already exists. Clean it up first"), v12, v13, v58);
  -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", 0);
LABEL_5:
  -[STSReader handoverSession](self, "handoverSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[STSReader proxyReaderSESession](self, "proxyReaderSESession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 592, self, CFSTR("Previous session exists, tear down now"), v24, v25, v58);
      -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", v10);
    }
    else
    {
      v10[2](v10);
    }
LABEL_19:
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 599, self, CFSTR(" Waiting for SE Proxy Session"), v26, v27, v58);
    v37 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v9, v37);
    -[STSReader proxyReaderSESession](self, "proxyReaderSESession");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 612, self, CFSTR(" Create SE ProxyListener"), v39, v40, v59);
      v41 = -[NFSecureElementReaderProxyListener initWithSTSReaderSession:]([NFSecureElementReaderProxyListener alloc], "initWithSTSReaderSession:", self);
      -[STSReader setSeProxyListener:](self, "setSeProxyListener:", v41);

      -[STSReader seProxyListener](self, "seProxyListener");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = dispatch_queue_create("STSXPCReader", v45);

        -[STSReader stsHelper](self, "stsHelper");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[STSReader seProxyListener](self, "seProxyListener");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "startReaderSEProxyListener:workQueue:", v48, v46);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          -[STSReader callbackQueue](self, "callbackQueue");
          v52 = objc_claimAutoreleasedReturnValue();
          v64[0] = v8;
          v64[1] = 3221225472;
          v64[2] = sub_2158B2D68;
          v64[3] = &unk_24D3A7160;
          v53 = &v67;
          v67 = v4;
          v65 = v49;
          v66 = self;
          dispatch_async(v52, v64);

        }
        else
        {
          sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 637, self, CFSTR("Could not startReaderSEProxyListener"), v50, v51, v60);
          -[STSReader callbackQueue](self, "callbackQueue");
          v56 = objc_claimAutoreleasedReturnValue();
          v62[0] = v8;
          v62[1] = 3221225472;
          v62[2] = sub_2158B2DB8;
          v62[3] = &unk_24D3A7138;
          v53 = (id *)v63;
          v63[0] = v4;
          v63[1] = a2;
          dispatch_async(v56, v62);

          -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", 0);
        }

      }
      else
      {
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 617, self, CFSTR("Could not get the  Proxy Listener"), v43, v44, v60);
        -[STSReader callbackQueue](self, "callbackQueue");
        v55 = objc_claimAutoreleasedReturnValue();
        v68[0] = v8;
        v68[1] = 3221225472;
        v68[2] = sub_2158B2BBC;
        v68[3] = &unk_24D3A7138;
        v69 = v4;
        v70 = a2;
        dispatch_async(v55, v68);

        -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", 0);
        v46 = v69;
      }
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 604, self, CFSTR("Could not get the SE Proxy session"), v39, v40, v59);
      -[STSReader callbackQueue](self, "callbackQueue");
      v54 = objc_claimAutoreleasedReturnValue();
      v71[0] = v8;
      v71[1] = 3221225472;
      v71[2] = sub_2158B2A10;
      v71[3] = &unk_24D3A7138;
      v72 = v4;
      v73 = a2;
      dispatch_async(v54, v71);

      -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", 0);
      v46 = v72;
    }

    goto LABEL_28;
  }
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 560, self, CFSTR("Create a handoffToken"), v16, v17, v58);
  v87 = 0;
  v88 = (id *)&v87;
  v89 = 0x3032000000;
  v90 = sub_2158B0DE4;
  v91 = sub_2158B0DF4;
  v92 = 0;
  -[STSReader handoverSession](self, "handoverSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v88;
  v86 = v88[5];
  objc_msgSend(v18, "createSessionHandoffToken:", &v86);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v19 + 5, v86);

  if (v88[5])
  {
    -[STSReader callbackQueue](self, "callbackQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = sub_2158B29D8;
    block[3] = &unk_24D3A7110;
    v84 = v4;
    v85 = &v87;
    dispatch_async(v21, block);

    -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", 0);
    v22 = 1;
  }
  else
  {
    -[STSReader proxyReaderSESession](self, "proxyReaderSESession");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 573, self, CFSTR("Previous session exists, tear down now"), v29, v30, v58);
      -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", v10);
    }
    else
    {
      v10[2](v10);
    }
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 579, self, CFSTR("Activating session with token: %@"), v31, v32, (uint64_t)v20);
    v77 = 0;
    v78 = &v77;
    v79 = 0x3032000000;
    v80 = sub_2158B0DE4;
    v81 = sub_2158B0DF4;
    -[STSReader initiatingSession](self, "initiatingSession");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateWithToken:", v20);
    v82 = (id)objc_claimAutoreleasedReturnValue();

    if (v78[5])
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 582, self, CFSTR("Session switching error=%@"), v34, v35, v78[5]);
      -[STSReader callbackQueue](self, "callbackQueue");
      v36 = objc_claimAutoreleasedReturnValue();
      v74[0] = v8;
      v74[1] = 3221225472;
      v74[2] = sub_2158B29F4;
      v74[3] = &unk_24D3A7110;
      v75 = v4;
      v76 = &v77;
      dispatch_async(v36, v74);

      -[STSReader _seProxyCleanup:](self, "_seProxyCleanup:", 0);
      v22 = 1;
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 589, self, CFSTR("Activated session with token: %@"), v34, v35, (uint64_t)v20);
      v22 = 0;
    }
    _Block_object_dispose(&v77, 8);

  }
  _Block_object_dispose(&v87, 8);

  if (!v22)
    goto LABEL_19;
LABEL_28:

}

- (void)relinquishSEProxy
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader relinquishSEProxy]", 648, self, &stru_24D3A78C0, v2, v3, v6);
  -[STSReader stsHelper](self, "stsHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSEProxyListener");

  -[STSReader setSeProxyListener:](self, "setSeProxyListener:", 0);
}

- (void)transactionStarted:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader transactionStarted:]", 656, self, CFSTR("status=%lu"), v3, v4, a3);
  if (a3)
  {
    -[STSReader _translateXPCClientNotificationStatus:](self, "_translateXPCClientNotificationStatus:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[STSReader _activateInvalidationHandler:](self, "_activateInvalidationHandler:", v7);

  }
}

- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader transactionEndedWithIdentifier:error:]", 664, self, CFSTR("identifier=%@, error=%@"), v4, v5, (uint64_t)a3);
}

- (void)notificationClientConnected
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader notificationClientConnected]", 668, self, &stru_24D3A78C0, v2, v3, v4);
}

- (void)receiveISO18013DeviceResponse:(id)a3 sessionDataStatus:(id)a4 mDocResponseStatus:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  STSReader *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[4];
  _QWORD v37[6];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_msgSend(v11, "length");
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]", 677, self, CFSTR("dataLen=%ld, SessionData.status=%@, mDocResponseStatus=%@, error=%@"), v16, v17, v15);
  -[STSReader responseTimeout](self, "responseTimeout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stopTimer");

  -[STSReader setResponseTimeout:](self, "setResponseTimeout:", 0);
  v19 = objc_msgSend(v12, "unsignedIntegerValue");
  if ((unint64_t)(v19 - 10) < 2)
    goto LABEL_4;
  if (v19 == 20)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]", 686, self, CFSTR("Session termination requested in session data status"), v20, v21, v32);
LABEL_4:
    v22 = 1;
    goto LABEL_6;
  }
  v22 = 0;
LABEL_6:
  v23 = self;
  objc_sync_enter(v23);
  if (-[STSReader transmissionState](v23, "transmissionState") == 1)
  {
    -[STSReader stsNotificationListener](v23, "stsNotificationListener");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_2158B345C;
    v35[3] = &unk_24D3A6F30;
    v35[4] = v23;
    objc_msgSend(v24, "sendISO18013SessionData:status:completion:", 0, &unk_24D3B29A8, v35);

  }
  objc_sync_exit(v23);

  if (objc_msgSend(v11, "length"))
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]", 708, v23, CFSTR("activating send request completion: terminationRequested: %d"), v25, v26, v22);
    -[STSReader _activateSendRequestCompletion:terminationRequested:error:](v23, "_activateSendRequestCompletion:terminationRequested:error:", v11, v22, 0);
  }
  else if ((_DWORD)v22)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]", 711, v23, CFSTR("Session termination request received"), v25, v26, v32);
    v33 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalidated");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v27;
    v37[1] = &unk_24D3B2A50;
    v36[1] = CFSTR("Line");
    v36[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2), v12, v13, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v28;
    v36[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 712);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 17, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSReader _activateInvalidationHandler:](v23, "_activateInvalidationHandler:", v31);

  }
}

- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader alternativeCarrierReceived:dataPending:]", 717, self, &stru_24D3A78C0, v4, v5, v6);
}

- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader alternativeCarrierConnectedWithStatus:]", 725, self, CFSTR("status=%lu"), v3, v4, a3);
  if (a3)
  {
    -[STSReader _translateXPCClientNotificationStatus:](self, "_translateXPCClientNotificationStatus:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[STSReader _activateInvalidationHandler:](self, "_activateInvalidationHandler:");
  }
  else
  {
    -[STSReader _activateOnConnectCompletion](self, "_activateOnConnectCompletion");
    -[STSReader handoverSession](self, "handoverSession");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopTNEPOperation");
  }

}

- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  id v8;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader alternativeCarrierDisconnectedWithStatus:]", 738, self, &stru_24D3A78C0, v3, v4, v7);
  -[STSReader _translateXPCClientNotificationStatus:](self, "_translateXPCClientNotificationStatus:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[STSReader _activateInvalidationHandler:](self, "_activateInvalidationHandler:", v8);

}

- (void)sessionTranscriptGenerated:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sessionTranscriptGenerated:]", 744, self, &stru_24D3A78C0, v4, v5, v6);
  -[STSReader setSessionTranscriptBytes:](self, "setSessionTranscriptBytes:", v7);

}

- (void)xpcInvalidated
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader xpcInvalidated]", 749, self, &stru_24D3A78C0, v2, v3, v5);
  MEMORY[0x24BEDD108](self, sel_invalidateWithCode_);
}

- (void)xpcInterrupted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader xpcInterrupted]", 754, self, &stru_24D3A78C0, v2, v3, v5);
  MEMORY[0x24BEDD108](self, sel_invalidateWithCode_);
}

- (void)session:(id)a3 fieldNotification:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader session:fieldNotification:]", 762, self, CFSTR("fieldNotification=%@"), v4, v5, (uint64_t)a4);
}

- (void)session:(id)a3 tnepService:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader session:tnepService:]", 766, self, CFSTR("Selected tnepService=%@"), v4, v5, (uint64_t)a4);
}

- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader session:connectionHandoverProcessFailure:]", 771, self, CFSTR("error=%@"), v6, v7, (uint64_t)v5);
  v14 = v5;
  objc_msgSend(v14, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("STSXPCHelperErrorDomain"));

  v10 = v14;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v14, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v14;
    if (v12)
    {
      v10 = v12;

    }
  }
  -[STSReader _translateSTSXPCHelperError:](self, "_translateSTSXPCHelperError:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[STSReader _activateTnepStatusHandler:](self, "_activateTnepStatusHandler:", v13);
  -[STSReader _activateInvalidationHandler:](self, "_activateInvalidationHandler:", v13);

}

- (void)connectionHandoverCompleted:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader connectionHandoverCompleted:]", 788, self, &stru_24D3A78C0, v5, v6, v7);
  objc_msgSend(v4, "stopTNEPOperation");

  -[STSReader _activateTnepStatusHandler:](self, "_activateTnepStatusHandler:", 0);
}

- (void)session:(id)a3 didEndUnexpectedly:(id)a4
{
  void *v4;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  _QWORD v22[6];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = objc_msgSend(v7, "code");
  v9 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 47)
  {
    v21[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Reader mode protection enable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v22[1] = &unk_24D3B2A68;
    v21[1] = CFSTR("Line");
    v21[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v4;
    v21[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 796);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 20, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    goto LABEL_7;
  }
  v19[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Aborted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = *MEMORY[0x24BDD1398];
  v12 = v7;
  if (!v7)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v4, 5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v12;
  v20[2] = &unk_24D3B2A80;
  v19[2] = CFSTR("Line");
  v19[3] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  v19[4] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 798);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 3, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
LABEL_7:

  -[STSReader _activateInvalidationHandler:](self, "_activateInvalidationHandler:", v14);
}

- (void)_seProxyCleanup:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader _seProxyCleanup:]", 807, self, &stru_24D3A78C0, v4, v5, v13);
  -[STSReader proxyReaderSESession](self, "proxyReaderSESession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader _seProxyCleanup:]", 810, self, CFSTR("relinquish SE back"), v7, v8, v14);
    -[STSReader proxyReaderSESession](self, "proxyReaderSESession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endSessionWithCompletion:", &unk_24D3A71A0);

    -[STSReader setProxyReaderSESession:](self, "setProxyReaderSESession:", 0);
  }
  -[STSReader initiatingSession](self, "initiatingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[STSReader initiatingSession](self, "initiatingSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endSessionWithCompletion:", &unk_24D3A71C0);

    -[STSReader setInitiatingSession:](self, "setInitiatingSession:", 0);
  }
  v12 = v15;
  if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
    v12 = v15;
  }

}

- (void)_activateSessionStartCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[STSReader callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158B3DD0;
  block[3] = &unk_24D3A71E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_activateTnepStatusHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[STSReader callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158B3F5C;
  block[3] = &unk_24D3A71E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_activateOnConnectCompletion
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[STSReader callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_2158B40C0;
  v4[3] = &unk_24D3A7210;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_activateSendRequestCompletion:(id)a3 terminationRequested:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  STSReader *v16;
  id v17;
  BOOL v18;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[STSReader callbackQueue](self, "callbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2158B4248;
  v13[3] = &unk_24D3A7238;
  objc_copyWeak(&v17, &location);
  v14 = v9;
  v15 = v8;
  v18 = a4;
  v16 = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_activateInvalidationHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader _activateInvalidationHandler:]", 895, self, CFSTR("error=%@"), v5, v6, (uint64_t)v4);
  -[STSReader handoverSession](self, "handoverSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endSession");

  objc_initWeak(&location, self);
  -[STSReader callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158B4464;
  block[3] = &unk_24D3A71E8;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)_translateXPCClientNotificationStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id result;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
      v4 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Cancelled");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v6;
      v34[1] = &unk_24D3B2A98;
      v33[1] = CFSTR("Line");
      v33[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v34[2] = v7;
      v33[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 922);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v34[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4;
      v11 = v5;
      v12 = 13;
      goto LABEL_10;
    case 3uLL:
      v14 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Timeout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v6;
      v32[1] = &unk_24D3B2AB0;
      v31[1] = CFSTR("Line");
      v31[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v7;
      v31[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 924);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = v5;
      v12 = 4;
      goto LABEL_10;
    case 5uLL:
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "No alernative carrier available");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v6;
      v30[1] = &unk_24D3B2AC8;
      v29[1] = CFSTR("Line");
      v29[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v7;
      v29[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 926);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15;
      v11 = v5;
      v12 = 14;
      goto LABEL_10;
    case 6uLL:
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Requires Wifi power on");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v6;
      v28[1] = &unk_24D3B2AE0;
      v27[1] = CFSTR("Line");
      v27[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v7;
      v27[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 928);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v11 = v5;
      v12 = 15;
      goto LABEL_10;
    case 7uLL:
      v17 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Requires Bluetooth power on");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v6;
      v26[1] = &unk_24D3B2AF8;
      v25[1] = CFSTR("Line");
      v25[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v7;
      v25[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 930);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v17;
      v11 = v5;
      v12 = 16;
      goto LABEL_10;
    case 8uLL:
      v18 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Alternative Carrier transmission error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v6;
      v24[1] = &unk_24D3B2B10;
      v23[1] = CFSTR("Line");
      v23[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v7;
      v23[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 932);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v18;
      v11 = v5;
      v12 = 19;
      goto LABEL_10;
    case 9uLL:
      v19 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v6;
      v22[1] = &unk_24D3B2B28;
      v21[1] = CFSTR("Line");
      v21[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v7;
      v21[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 934);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v19;
      v11 = v5;
      v12 = 9;
LABEL_10:
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      result = v20;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_translateSTSXPCHelperError:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  _QWORD *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD v78[5];
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[5];
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[5];
  _QWORD v97[5];
  _QWORD v98[5];
  _QWORD v99[5];
  _QWORD v100[5];
  _QWORD v101[4];
  _QWORD v102[4];
  _QWORD v103[5];
  _QWORD v104[6];

  v104[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      v10 = v6;
LABEL_7:
      a2 = v10;
      goto LABEL_15;
    }
    objc_msgSend(v6, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", CFSTR("nfcd"));

    if (v12)
    {
      -[STSReader _translateNfcdXPCHelperError:](self, "_translateNfcdXPCHelperError:", v6);
      v10 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v6, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("STSXPCHelperErrorDomain"));

    if ((v14 & 1) != 0)
    {
      switch(objc_msgSend(v6, "code"))
      {
        case 0:
          v55 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v101[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v102[0] = v17;
          v102[1] = &unk_24D3B2B58;
          v101[1] = CFSTR("Line");
          v101[2] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v102[2] = v19;
          v101[3] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 958);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v102[3] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v55;
          v27 = v16;
          v28 = 10;
          break;
        case 1:
          v56 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v99[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = *MEMORY[0x24BDD1398];
          v100[0] = v17;
          v100[1] = v6;
          v99[1] = v57;
          v99[2] = CFSTR("Line");
          v100[2] = &unk_24D3B2B70;
          v99[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v100[3] = v19;
          v99[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 960);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v100[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v56;
          v27 = v16;
          v28 = 11;
          break;
        case 2:
          v32 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v97[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *MEMORY[0x24BDD1398];
          v98[0] = v17;
          v98[1] = v6;
          v97[1] = v33;
          v97[2] = CFSTR("Line");
          v98[2] = &unk_24D3B2B88;
          v97[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v98[3] = v19;
          v97[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 962);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v98[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, v97, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v32;
          v27 = v16;
          v28 = 9;
          break;
        case 3:
        case 9:
        case 10:
        case 11:
          v15 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v85[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unknown Error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *MEMORY[0x24BDD1398];
          v86[0] = v17;
          v86[1] = v6;
          v85[1] = v18;
          v85[2] = CFSTR("Line");
          v86[2] = &unk_24D3B2C18;
          v85[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v86[3] = v19;
          v85[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 978);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v86[4] = v20;
          v21 = (void *)MEMORY[0x24BDBCE70];
          v22 = v86;
          v23 = v85;
          goto LABEL_12;
        case 4:
          v34 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = *MEMORY[0x24BDD1398];
          v94[0] = v17;
          v94[1] = v6;
          v93[1] = v35;
          v93[2] = CFSTR("Line");
          v94[2] = &unk_24D3B2BB8;
          v93[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v94[3] = v19;
          v93[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 966);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v94[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, v93, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v34;
          v27 = v16;
          v28 = 6;
          break;
        case 5:
          v58 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v91[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = *MEMORY[0x24BDD1398];
          v92[0] = v17;
          v92[1] = v6;
          v91[1] = v59;
          v91[2] = CFSTR("Line");
          v92[2] = &unk_24D3B2BD0;
          v91[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v92[3] = v19;
          v91[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 968);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v92[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v58;
          v27 = v16;
          v28 = 8;
          break;
        case 6:
          v36 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v89[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Hardware Not Available");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *MEMORY[0x24BDD1398];
          v90[0] = v17;
          v90[1] = v6;
          v89[1] = v37;
          v89[2] = CFSTR("Line");
          v90[2] = &unk_24D3B2BE8;
          v89[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v90[3] = v19;
          v89[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 970);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v90[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v36;
          v27 = v16;
          v28 = 12;
          break;
        case 7:
          v60 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v87[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Timeout");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = *MEMORY[0x24BDD1398];
          v88[0] = v17;
          v88[1] = v6;
          v87[1] = v61;
          v87[2] = CFSTR("Line");
          v88[2] = &unk_24D3B2C00;
          v87[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v88[3] = v19;
          v87[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 972);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v88[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, v87, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v60;
          v27 = v16;
          v28 = 4;
          break;
        case 8:
          v38 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "No alernative carrier available");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = *MEMORY[0x24BDD1398];
          v96[0] = v17;
          v96[1] = v6;
          v95[1] = v39;
          v95[2] = CFSTR("Line");
          v96[2] = &unk_24D3B2BA0;
          v95[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v96[3] = v19;
          v95[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 964);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v96[4] = v20;
          v40 = (void *)MEMORY[0x24BDBCE70];
          v41 = v96;
          v42 = v95;
          goto LABEL_40;
        case 12:
          objc_msgSend(v6, "userInfo");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = *MEMORY[0x24BDD1398];
          objc_msgSend(v43, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "domain");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v45, "isEqual:", CFSTR("BluetoothDomain")))
          {
            v46 = objc_msgSend(v16, "code");

            if (!v46)
            {
              v47 = (void *)MEMORY[0x24BDD1540];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v83[0] = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Requires Bluetooth power on");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v84[0] = v48;
              v84[1] = v6;
              v83[1] = v44;
              v83[2] = CFSTR("Line");
              v84[2] = &unk_24D3B2C30;
              v83[3] = CFSTR("Method");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v84[3] = v49;
              v83[4] = *MEMORY[0x24BDD0BA0];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 984);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v84[4] = v50;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 5);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v47;
              v53 = v17;
              v54 = 16;
LABEL_36:
              objc_msgSend(v52, "errorWithDomain:code:userInfo:", v53, v54, v51);
              a2 = (SEL)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }
          }
          else
          {

          }
          objc_msgSend(v16, "domain");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v68, "isEqual:", CFSTR("WifiDomain")))
          {
            v69 = objc_msgSend(v16, "code");

            if (v69 == 3)
            {
              v70 = (void *)MEMORY[0x24BDD1540];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v81[0] = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Requires Wifi power on");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v82[0] = v48;
              v82[1] = v6;
              v81[1] = v44;
              v81[2] = CFSTR("Line");
              v82[2] = &unk_24D3B2C48;
              v81[3] = CFSTR("Method");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v82[3] = v49;
              v81[4] = *MEMORY[0x24BDD0BA0];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 988);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v82[4] = v50;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 5);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v70;
              v53 = v17;
              v54 = 15;
              goto LABEL_36;
            }
          }
          else
          {

          }
LABEL_39:
          v38 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v79[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "No alernative carrier available");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v80[0] = v17;
          v80[1] = v6;
          v79[1] = v44;
          v79[2] = CFSTR("Line");
          v80[2] = &unk_24D3B2C60;
          v79[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v80[3] = v19;
          v79[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 992);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v80[4] = v20;
          v40 = (void *)MEMORY[0x24BDBCE70];
          v41 = v80;
          v42 = v79;
LABEL_40:
          objc_msgSend(v40, "dictionaryWithObjects:forKeys:count:", v41, v42, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v38;
          v27 = v16;
          v28 = 14;
          break;
        case 13:
          v44 = *MEMORY[0x24BDD1398];
          goto LABEL_39;
        case 14:
        case 15:
          v30 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v77[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Alternative Carrier transmission error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *MEMORY[0x24BDD1398];
          v78[0] = v17;
          v78[1] = v6;
          v77[1] = v31;
          v77[2] = CFSTR("Line");
          v78[2] = &unk_24D3B2C78;
          v77[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v78[3] = v19;
          v77[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 995);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v78[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v30;
          v27 = v16;
          v28 = 19;
          break;
        case 16:
          v62 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v75[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Cancelled");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = *MEMORY[0x24BDD1398];
          v76[0] = v17;
          v76[1] = v6;
          v75[1] = v63;
          v75[2] = CFSTR("Line");
          v76[2] = &unk_24D3B2C90;
          v75[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v76[3] = v19;
          v75[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 997);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v76[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v62;
          v27 = v16;
          v28 = 13;
          break;
        case 17:
          v64 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v73[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalidated");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = *MEMORY[0x24BDD1398];
          v74[0] = v17;
          v74[1] = v6;
          v73[1] = v65;
          v73[2] = CFSTR("Line");
          v74[2] = &unk_24D3B2CA8;
          v73[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v74[3] = v19;
          v73[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 999);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v74[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v64;
          v27 = v16;
          v28 = 17;
          break;
        case 18:
          v66 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "QRCode decoding error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = *MEMORY[0x24BDD1398];
          v72[0] = v17;
          v72[1] = v6;
          v71[1] = v67;
          v71[2] = CFSTR("Line");
          v72[2] = &unk_24D3B2CC0;
          v71[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v72[3] = v19;
          v71[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1001);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v72[4] = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v66;
          v27 = v16;
          v28 = 21;
          break;
        default:
          goto LABEL_15;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v103[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unknown Error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *MEMORY[0x24BDD1398];
      v104[0] = v17;
      v104[1] = v6;
      v103[1] = v24;
      v103[2] = CFSTR("Line");
      v104[2] = &unk_24D3B2B40;
      v103[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v104[3] = v19;
      v103[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 950);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v104[4] = v20;
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = v104;
      v23 = v103;
LABEL_12:
      objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v15;
      v27 = v16;
      v28 = 5;
    }
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, v28, v25);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();

LABEL_14:
  }
  else
  {
    a2 = 0;
  }
LABEL_15:

  return (id)(id)a2;
}

- (id)_translateNfcdXPCHelperError:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[6];

  v40[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("nfcd"));

    if ((v8 & 1) == 0)
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader _translateNfcdXPCHelperError:]", 1009, self, CFSTR("Wrong domain"), v9, v10, v32);
      v12 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unknown Error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x24BDD1398];
      v40[0] = v14;
      v40[1] = v6;
      v39[1] = v22;
      v39[2] = CFSTR("Line");
      v40[2] = &unk_24D3B2CD8;
      v39[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40[3] = v16;
      v39[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1010);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40[4] = v17;
      v18 = (void *)MEMORY[0x24BDBCE70];
      v19 = v40;
      v20 = v39;
      goto LABEL_9;
    }
    v11 = objc_msgSend(v6, "code");
    if (v11 > 14)
    {
      if (v11 == 21)
      {
        v29 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TNEP connection error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *MEMORY[0x24BDD1398];
        v36[0] = v14;
        v36[1] = v6;
        v35[1] = v30;
        v35[2] = CFSTR("Line");
        v36[2] = &unk_24D3B2D08;
        v35[3] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v36[3] = v16;
        v35[4] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1023);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v36[4] = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v29;
        v25 = v13;
        v26 = 23;
        goto LABEL_14;
      }
      if (v11 != 15)
        goto LABEL_6;
      goto LABEL_12;
    }
    if (v11)
    {
      if (v11 != 5)
      {
LABEL_6:
        v12 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unknown Error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *MEMORY[0x24BDD1398];
        v34[0] = v14;
        v34[1] = v6;
        v33[1] = v15;
        v33[2] = CFSTR("Line");
        v34[2] = &unk_24D3B2D20;
        v33[3] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34[3] = v16;
        v33[4] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1025);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v34[4] = v17;
        v18 = (void *)MEMORY[0x24BDBCE70];
        v19 = v34;
        v20 = v33;
LABEL_9:
        objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v12;
        v25 = v13;
        v26 = 5;
LABEL_14:
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v26, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
LABEL_12:
      v27 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NFC tear");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x24BDD1398];
      v38[0] = v14;
      v38[1] = v6;
      v37[1] = v28;
      v37[2] = CFSTR("Line");
      v38[2] = &unk_24D3B2CF0;
      v37[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v16;
      v37[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 1021);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[4] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v27;
      v25 = v13;
      v26 = 22;
      goto LABEL_14;
    }
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSData)sessionTranscriptBytes
{
  return self->_sessionTranscriptBytes;
}

- (void)setSessionTranscriptBytes:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTranscriptBytes, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (STSXPCClientNotificationListener)stsNotificationListener
{
  return self->_stsNotificationListener;
}

- (void)setStsNotificationListener:(id)a3
{
  objc_storeStrong((id *)&self->_stsNotificationListener, a3);
}

- (NFSecureTransactionServicesHandoverSession)handoverSession
{
  return self->_handoverSession;
}

- (void)setHandoverSession:(id)a3
{
  objc_storeStrong((id *)&self->_handoverSession, a3);
}

- (id)tnepStatusHandler
{
  return self->_tnepStatusHandler;
}

- (void)setTnepStatusHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)sessionStartCompletion
{
  return self->_sessionStartCompletion;
}

- (void)setSessionStartCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)sendRequestCompletion
{
  return self->_sendRequestCompletion;
}

- (void)setSendRequestCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)alternativeCarrierConnected
{
  return self->_alternativeCarrierConnected;
}

- (void)setAlternativeCarrierConnected:(BOOL)a3
{
  self->_alternativeCarrierConnected = a3;
}

- (STSTimer)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_responseTimeout, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)queuePaused
{
  return self->_queuePaused;
}

- (void)setQueuePaused:(BOOL)a3
{
  self->_queuePaused = a3;
}

- (int64_t)transmissionState
{
  return self->_transmissionState;
}

- (void)setTransmissionState:(int64_t)a3
{
  self->_transmissionState = a3;
}

- (STSHardwareManagerWrapper)nfHwManager
{
  return self->_nfHwManager;
}

- (void)setNfHwManager:(id)a3
{
  objc_storeStrong((id *)&self->_nfHwManager, a3);
}

- (STSHelperLibrary)stsHelper
{
  return self->_stsHelper;
}

- (void)setStsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_stsHelper, a3);
}

- (unint64_t)engagementConfiguration
{
  return self->_engagementConfiguration;
}

- (void)setEngagementConfiguration:(unint64_t)a3
{
  self->_engagementConfiguration = a3;
}

- (STSCASessionStats)caSessionStats
{
  return self->_caSessionStats;
}

- (void)setCaSessionStats:(id)a3
{
  objc_storeStrong((id *)&self->_caSessionStats, a3);
}

- (NFSession)initiatingSession
{
  return self->_initiatingSession;
}

- (void)setInitiatingSession:(id)a3
{
  objc_storeStrong((id *)&self->_initiatingSession, a3);
}

- (NFSecureElementManagerSession)proxyReaderSESession
{
  return self->_proxyReaderSESession;
}

- (void)setProxyReaderSESession:(id)a3
{
  objc_storeStrong((id *)&self->_proxyReaderSESession, a3);
}

- (NFSecureElementReaderProxyListener)seProxyListener
{
  return self->_seProxyListener;
}

- (void)setSeProxyListener:(id)a3
{
  objc_storeStrong((id *)&self->_seProxyListener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seProxyListener, 0);
  objc_storeStrong((id *)&self->_proxyReaderSESession, 0);
  objc_storeStrong((id *)&self->_initiatingSession, 0);
  objc_storeStrong((id *)&self->_caSessionStats, 0);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_nfHwManager, 0);
  objc_storeStrong((id *)&self->_responseTimeout, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_sendRequestCompletion, 0);
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong(&self->_sessionStartCompletion, 0);
  objc_storeStrong(&self->_tnepStatusHandler, 0);
  objc_storeStrong((id *)&self->_handoverSession, 0);
  objc_storeStrong((id *)&self->_stsNotificationListener, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_sessionTranscriptBytes, 0);
}

@end
