@implementation PKPaymentAuthorizationFlowCoordinator

- (PKPaymentAuthorizationDefaultService)defaultService
{
  PKPaymentAuthorizationDefaultService *defaultService;
  PKPaymentAuthorizationDefaultService *v4;
  PKPaymentAuthorizationDefaultService *v5;

  defaultService = self->_defaultService;
  if (!defaultService)
  {
    v4 = objc_alloc_init(PKPaymentAuthorizationDefaultService);
    v5 = self->_defaultService;
    self->_defaultService = v4;

    -[PKPaymentAuthorizationDefaultService setPresenter:](self->_defaultService, "setPresenter:", self);
    defaultService = self->_defaultService;
  }
  return defaultService;
}

- (PKInAppPaymentService)inAppPaymentService
{
  PKInAppPaymentService *inAppPaymentService;
  PKInAppPaymentService *v4;
  PKInAppPaymentService *v5;

  inAppPaymentService = self->_inAppPaymentService;
  if (!inAppPaymentService)
  {
    v4 = (PKInAppPaymentService *)objc_alloc_init(MEMORY[0x1E0D66E10]);
    v5 = self->_inAppPaymentService;
    self->_inAppPaymentService = v4;

    inAppPaymentService = self->_inAppPaymentService;
  }
  return inAppPaymentService;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  PKPeerPaymentAccount *peerPaymentAccount;
  void *v4;
  void *v5;
  PKPeerPaymentAccount *v6;
  PKPeerPaymentAccount *v7;

  peerPaymentAccount = self->_peerPaymentAccount;
  if (!peerPaymentAccount)
  {
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue();
    v7 = self->_peerPaymentAccount;
    self->_peerPaymentAccount = v6;

    peerPaymentAccount = self->_peerPaymentAccount;
  }
  return peerPaymentAccount;
}

- (PKAsyncTaskProgressTracker)dismissalTaskProgressTracker
{
  PKAsyncTaskProgressTracker *dismissalTaskProgressTracker;
  PKAsyncTaskProgressTracker *v4;
  PKAsyncTaskProgressTracker *v5;

  dismissalTaskProgressTracker = self->_dismissalTaskProgressTracker;
  if (!dismissalTaskProgressTracker)
  {
    v4 = (PKAsyncTaskProgressTracker *)objc_alloc_init(MEMORY[0x1E0D66B88]);
    v5 = self->_dismissalTaskProgressTracker;
    self->_dismissalTaskProgressTracker = v4;

    dismissalTaskProgressTracker = self->_dismissalTaskProgressTracker;
  }
  return dismissalTaskProgressTracker;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
    return 30;
  else
    return 2;
}

- (PKPaymentRequest)paymentRequest
{
  return -[PKPaymentAuthorizationContext request](self->_context, "request");
}

- (PKPaymentAuthorizationServiceProxy)exportedObject
{
  return (PKPaymentAuthorizationServiceProxy *)-[NSXPCConnection exportedObject](self->_hostConnection, "exportedObject");
}

- (PKPaymentAuthorizationHostProtocol)remoteObjectProxy
{
  return (PKPaymentAuthorizationHostProtocol *)-[NSXPCConnection remoteObjectProxy](self->_hostConnection, "remoteObjectProxy");
}

- (PKPaymentAuthorizationFlowCoordinator)initWithContext:(id)a3 scenePresenter:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPaymentAuthorizationFlowCoordinator *v12;
  PKPaymentAuthorizationFlowCoordinator *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentAuthorizationFlowCoordinator;
  v12 = -[PKPaymentAuthorizationFlowCoordinator init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeWeak((id *)&v13->_scenePresenter, v10);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__openApplication_, CFSTR("PKOpenApplicationNotification"), 0);

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentAuthorizationFlowCoordinator invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationFlowCoordinator;
  -[PKPaymentAuthorizationFlowCoordinator dealloc](&v3, sel_dealloc);
}

- (void)willDisappear
{
  NSObject *v3;
  int v4;
  PKPaymentAuthorizationFlowCoordinator *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationFlowCoordinator _stopSuppressingNotifications](self, "_stopSuppressingNotifications");
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134349056;
    v5 = self;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): Dismissing because the remote alert controller will disappear", (uint8_t *)&v4, 0xCu);
  }

  -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](self, "dismissWithReason:error:completion:", 0, 0, 0);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "==== Payment Authorization Flow Start ====", buf, 2u);
  }

  -[PKPaymentAuthorizationFlowCoordinator _startAnalyticsReporting](self, "_startAnalyticsReporting");
  -[PKPaymentAuthorizationFlowCoordinator inAppPaymentService](self, "inAppPaymentService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationContext hostIdentifier](self->_context, "hostIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PKPaymentAuthorizationFlowCoordinator_start__block_invoke;
  v6[3] = &unk_1E3E778C0;
  v6[4] = self;
  objc_msgSend(v4, "retrievePaymentListenerEndpointForHostIdentifier:completion:", v5, v6);

}

void __46__PKPaymentAuthorizationFlowCoordinator_start__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PKPaymentAuthorizationFlowCoordinator_start__block_invoke_2;
  block[3] = &unk_1E3E64908;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __46__PKPaymentAuthorizationFlowCoordinator_start__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v9;
      _os_log_debug_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEBUG, "Retrieved payment listener endpoint: %@", (uint8_t *)&v10, 0xCu);
    }

    v3 = *(_BYTE **)(a1 + 32);
    if (v3[32])
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator invalidated, discarding endpoint.", (uint8_t *)&v10, 2u);
      }

    }
    else
    {
      objc_msgSend(v3, "createConnectionToEndpoint:", *(_QWORD *)(a1 + 40));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 80);
      *(_QWORD *)(v5 + 80) = v4;

      objc_msgSend(*(id *)(a1 + 32), "openConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      v7 = objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle");
      v8 = *(void **)(a1 + 32);
      if (v7 == -1)
        objc_msgSend(v8, "_presentEnrollAccessibilityIntentAlert");
      else
        objc_msgSend(v8, "_presentNextStepDismissingCurrentInterface:withDefaultPassID:", 0, 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  PKPaymentAuthorizationInterface *paymentInterface;
  NSXPCConnection *hostConnection;
  void *v7;
  void *v8;
  id WeakRetained;
  uint8_t v10[16];

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "==== Payment Authorization Flow End ====", v10, 2u);
    }

    -[PKPaymentAuthorizationFlowCoordinator dismissalTaskProgressTracker](self, "dismissalTaskProgressTracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskDidComplete");

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKPaymentAuthorizationInterface invalidate](self->_paymentInterface, "invalidate");
    paymentInterface = self->_paymentInterface;
    self->_paymentInterface = 0;

    -[NSXPCConnection invalidate](self->_hostConnection, "invalidate");
    hostConnection = self->_hostConnection;
    self->_hostConnection = 0;

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pkui_resetSharedRootAuthenticationContext");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

    -[PKPaymentAuthorizationFlowCoordinator _endAnalyticsReporting](self, "_endAnalyticsReporting");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "flowCoordinatorDidInvalidate");

  }
}

- (void)notifyOnDismissal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator dismissalTaskProgressTracker](self, "dismissalTaskProgressTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyOnCompletion:", v4);

}

- (id)createConnectionToEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKPaymentAuthorizationServiceProxy *v8;
  void *v9;
  PKPaymentAuthorizationServiceProxy *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
  PKPaymentAuthorizationHostInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  PKPaymentAuthorizationServiceInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  v8 = [PKPaymentAuthorizationServiceProxy alloc];
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPaymentAuthorizationServiceProxy initWithConnection:paymentRequest:](v8, "initWithConnection:paymentRequest:", v5, v9);

  -[PKPaymentAuthorizationFlowCoordinator defaultService](self, "defaultService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationServiceProxy setDelegate:](v10, "setDelegate:", v11);

  objc_msgSend(v5, "setExportedObject:", v10);
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke;
  v16[3] = &unk_1E3E61310;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v5, "setInterruptionHandler:", v16);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_2;
  v14[3] = &unk_1E3E61310;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v5, "setInvalidationHandler:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v5;
}

void __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator connection interrupted", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_33;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_33(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator connection invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_34;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_34(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)openConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(v4, "resume");
  objc_initWeak(&location, self);
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PKPaymentAuthorizationFlowCoordinator_openConnection___block_invoke;
  v7[3] = &unk_1E3E61B68;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "handleConnectionDidOpenWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__PKPaymentAuthorizationFlowCoordinator_openConnection___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__PKPaymentAuthorizationFlowCoordinator_openConnection___block_invoke_2;
  v2[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __56__PKPaymentAuthorizationFlowCoordinator_openConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reportConnectionEstablishedAnalyticsForConnection:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_startAnalyticsReporting
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientAnalyticsParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)*MEMORY[0x1E0D698F8];
  if ((isKindOfClass & 1) != 0)
    v7 = v5;
  v11 = v7;

  objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v11);
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isPayLaterPaymentRequest") & 1) != 0)
  {
    v9 = *MEMORY[0x1E0D69918];
    objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69918]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      self->_didBeginPayLaterAnalyticsReporter = 1;
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v9);
    }
  }
  else
  {

  }
  if (!-[PKPaymentAuthorizationContext awaitingRemoteNetworkPaymentRequest](self->_context, "awaitingRemoteNetworkPaymentRequest"))-[PKPaymentAuthorizationFlowCoordinator _reportPaymentRequestDetails](self, "_reportPaymentRequestDetails");

}

- (void)_reportPaymentRequestDetails
{
  void *v3;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  __CFString *v48;
  unint64_t v49;
  unint64_t v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD *v77;
  void *v78;
  void *v79;
  void *v80;
  char v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  id v85;
  id v86;
  _QWORD *v87;
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  void *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  id v105;
  id v106;
  uint64_t v107;
  void *v108;
  id v109;
  unint64_t v110;
  const __CFString *v111;
  const __CFString *v112;
  const __CFString *v113;
  const __CFString *v114;
  const __CFString *v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  __CFString *v143;
  __CFString *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  _QWORD v152[4];
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientAnalyticsParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)*MEMORY[0x1E0D698F8];
  if ((isKindOfClass & 1) != 0)
    v7 = v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v8);
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  objc_msgSend(v10, "supportedNetworks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D69178]);
  v14 = objc_msgSend(v10, "requestType");
  v149 = v8;
  if (v14 > 0xE)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E3E779D0[v14];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D69180]);
  objc_msgSend(v10, "merchantSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "merchantIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = (_QWORD *)MEMORY[0x1E0D69160];
  if (v17)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D69160]);
  }
  else
  {
    objc_msgSend(v10, "merchantIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, *v18);

  }
  objc_msgSend(v10, "originatingURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v10, "originatingURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "host");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D69158]);

  }
  objc_msgSend(v10, "countryCode");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D69150]);
  v147 = (void *)v23;
  v148 = (void *)v17;
  objc_msgSend(v10, "merchantSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "operationalAnalyticsIdentifier");
  v25 = objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D69118]);
  v146 = (void *)v25;
  objc_msgSend(v10, "requiredBillingContactFields");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D691C8]);

  objc_msgSend(v10, "requiredShippingContactFields");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", "));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D691D0]);

  objc_msgSend(v10, "billingContact");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  if (v32)
  {
    objc_msgSend(v32, "postalAddress");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      objc_msgSend(v33, "addObject:", CFSTR("post"));
    objc_msgSend(v32, "phoneNumber");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      objc_msgSend(v33, "addObject:", CFSTR("phone"));
    objc_msgSend(v32, "emailAddress");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
      objc_msgSend(v33, "addObject:", CFSTR("email"));
    objc_msgSend(v32, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      objc_msgSend(v33, "addObject:", CFSTR("name"));
  }
  objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", "));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D69130]);

  objc_msgSend(v10, "shippingContact");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "removeAllObjects");
  if (v39)
  {
    objc_msgSend(v39, "postalAddress");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
      objc_msgSend(v33, "addObject:", CFSTR("post"));
    objc_msgSend(v39, "phoneNumber");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      objc_msgSend(v33, "addObject:", CFSTR("phone"));
    objc_msgSend(v39, "emailAddress");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      objc_msgSend(v33, "addObject:", CFSTR("email"));
    objc_msgSend(v39, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
      objc_msgSend(v33, "addObject:", CFSTR("name"));
  }
  v151 = v39;
  objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", "));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0D691D8]);

  objc_msgSend(v10, "availableShippingMethods");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "methods");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");

  if (v47 <= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v47);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = CFSTR("5+");
  }

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D691E8]);
  v49 = objc_msgSend(v10, "shippingType");
  v50 = v49;
  if (v49 > 3)
    v51 = CFSTR("unknown");
  else
    v51 = off_1E3E77A48[v49];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0D691F8]);
  if ((v50 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(v151, "postalAddress");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0D69190]);

    objc_msgSend(v10, "isShippingEditable");
    PKAnalyticsReportSwitchToggleResultValue();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0D69188]);

  }
  objc_msgSend(v45, "methods");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "count");

  v145 = v45;
  v150 = v33;
  if (v56)
  {
    v143 = v48;
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    objc_msgSend(v45, "methods");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v154, v158, 16);
    if (v58)
    {
      v59 = v58;
      v60 = 0;
      v61 = 0;
      v62 = *(_QWORD *)v155;
      do
      {
        for (i = 0; i != v59; ++i)
        {
          if (*(_QWORD *)v155 != v62)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * i), "dateComponentsRange");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "startDateComponents");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          v61 |= v65 != 0;
          objc_msgSend(v64, "endDateComponents");
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          v60 |= v66 != 0;
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v154, v158, 16);
      }
      while (v59);
    }

    PKAnalyticsReportSwitchToggleResultValue();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v67, *MEMORY[0x1E0D691F0]);

    PKAnalyticsReportSwitchToggleResultValue();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0D691E0]);

    v33 = v150;
    v48 = v143;
  }
  objc_msgSend(v10, "currencyCode");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v69, *MEMORY[0x1E0D69600]);

  objc_msgSend(v10, "paymentSummaryItems");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "count");

  if (v71 <= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v71);
    v72 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = CFSTR("5+");
  }

  v144 = (__CFString *)v72;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0D69168]);
  objc_msgSend(v10, "supportsCouponCode");
  PKAnalyticsReportSwitchToggleResultValue();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v73, *MEMORY[0x1E0D69140]);

  objc_msgSend(v10, "couponCode");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "length");

  PKAnalyticsReportSwitchToggleResultValue();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v75, *MEMORY[0x1E0D69138]);

  objc_msgSend(v10, "isMultiTokenRequest");
  PKAnalyticsReportSwitchToggleResultValue();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v76, *MEMORY[0x1E0D69170]);

  if (objc_msgSend(v10, "APIType") == 1)
  {
    v77 = (_QWORD *)MEMORY[0x1E0D69878];
  }
  else
  {
    if (objc_msgSend(v10, "APIType") != 2)
      goto LABEL_60;
    v77 = (_QWORD *)MEMORY[0x1E0D69888];
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", *v77, *MEMORY[0x1E0D69880]);
LABEL_60:
  objc_msgSend(v10, "userAgent");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v78, "length"))
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v78, *MEMORY[0x1E0D69620]);
  v142 = v78;
  objc_msgSend(v10, "paymentSummaryItems");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "lastObject");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v81 = objc_opt_isKindOfClass();
  v82 = (_QWORD *)MEMORY[0x1E0D691B0];
  v83 = (_QWORD *)MEMORY[0x1E0D691A8];
  v84 = (_QWORD *)MEMORY[0x1E0D691B8];
  v141 = v80;
  if ((v81 & 1) != 0)
  {
    v85 = v80;
    v86 = v11;
    v87 = v83;
    v88 = v85;
    PKAnalyticsReportSwitchToggleResultValue();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = *MEMORY[0x1E0D691C0];
    objc_msgSend(v86, "setObject:forKeyedSubscript:", v89, *MEMORY[0x1E0D691C0]);

    objc_msgSend(v88, "intervalUnitSpecified");
    PKAnalyticsReportSwitchToggleResultValue();
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setObject:forKeyedSubscript:", v91, *v82);

    objc_msgSend(v88, "intervalCountSpecified");
    PKAnalyticsReportSwitchToggleResultValue();
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setObject:forKeyedSubscript:", v92, *v87);

    objc_msgSend(v88, "startDate");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setObject:forKeyedSubscript:", v94, *v84);

    objc_msgSend(v88, "endDate");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setObject:forKeyedSubscript:", v96, *MEMORY[0x1E0D691A0]);

    v97 = *MEMORY[0x1E0D695A8];
    v98 = *MEMORY[0x1E0D69198];
    objc_msgSend(v86, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D695A8], *MEMORY[0x1E0D69198]);

  }
  else
  {
    objc_opt_class();
    v99 = objc_opt_isKindOfClass();
    v97 = *MEMORY[0x1E0D695A8];
    v90 = *MEMORY[0x1E0D691C0];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D695A8], *MEMORY[0x1E0D691C0]);
    if ((v99 & 1) != 0)
    {
      v100 = *MEMORY[0x1E0D695B0];
      v98 = *MEMORY[0x1E0D69198];
      v101 = v11;
    }
    else
    {
      v98 = *MEMORY[0x1E0D69198];
      v101 = v11;
      v100 = v97;
    }
    objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, v98);
  }
  objc_msgSend(v10, "recurringPaymentRequest");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
    v103 = CFSTR("MPAN");
  else
    v103 = CFSTR("DPAN");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v103, *MEMORY[0x1E0D69200]);
  if (v102)
  {
    objc_msgSend(v102, "billingAgreement");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v11;
    v106 = v104;
    v107 = objc_msgSend(v106, "length");
    PKAnalyticsReportSwitchToggleResultValue();
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setObject:forKeyedSubscript:", v108, *MEMORY[0x1E0D69128]);

    if (v107)
    {
      v109 = v106;
      v110 = objc_msgSend(v109, "length");
      v111 = CFSTR("100 - 200");
      v112 = CFSTR("200 - 300");
      v113 = CFSTR("300 - 400");
      v114 = CFSTR("more");
      if (v110 < 0x1F4)
        v114 = CFSTR("400 - 500");
      if (v110 >= 0x190)
        v113 = v114;
      if (v110 >= 0x12C)
        v112 = v113;
      if (v110 >= 0xC8)
        v111 = v112;
      if ((uint64_t)v110 >= 100)
        v115 = v111;
      else
        v115 = CFSTR("0 - 100");

      objc_msgSend(v105, "setObject:forKeyedSubscript:", v115, *MEMORY[0x1E0D69120]);
    }

    objc_msgSend(v102, "regularBilling");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v105;
    v118 = v116;
    PKAnalyticsReportSwitchToggleResultValue();
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setObject:forKeyedSubscript:", v119, v90);

    objc_msgSend(v118, "intervalUnitSpecified");
    PKAnalyticsReportSwitchToggleResultValue();
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setObject:forKeyedSubscript:", v120, *MEMORY[0x1E0D691B0]);

    objc_msgSend(v118, "intervalCountSpecified");
    PKAnalyticsReportSwitchToggleResultValue();
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setObject:forKeyedSubscript:", v121, *MEMORY[0x1E0D691A8]);

    objc_msgSend(v118, "startDate");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setObject:forKeyedSubscript:", v123, *MEMORY[0x1E0D691B8]);

    objc_msgSend(v118, "endDate");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setObject:forKeyedSubscript:", v125, *MEMORY[0x1E0D691A0]);

    objc_msgSend(v102, "trialBilling");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setObject:forKeyedSubscript:", v127, v98);

    v33 = v150;
  }
  objc_msgSend(v10, "remoteNetworkRequestPaymentTopicID");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v128, "length");

  v130 = *MEMORY[0x1E0D693B0];
  if (v129)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D693B8], v130);
    v97 = *MEMORY[0x1E0D695B0];
  }
  else
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D693A8], v130);
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v97, *MEMORY[0x1E0D68D68]);
  v131 = objc_msgSend(v10, "merchantCategoryCode");
  if ((int)v131 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "stringValue");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v133, *MEMORY[0x1E0D69148]);

  }
  objc_msgSend(v10, "clientAnalyticsParameters");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "PKDictionaryForKey:", *MEMORY[0x1E0D6AE68]);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v152[0] = MEMORY[0x1E0C809B0];
  v152[1] = 3221225472;
  v152[2] = __PKPaymentRequestAnalyticsDescription_block_invoke;
  v152[3] = &unk_1E3E779B0;
  v136 = v11;
  v153 = v136;
  objc_msgSend(v135, "enumerateKeysAndObjectsUsingBlock:", v152);
  objc_msgSend(v10, "analyticsProductType");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "setObject:forKeyedSubscript:", v137, *MEMORY[0x1E0D69028]);

  v138 = v136;
  objc_msgSend(v138, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68C00], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v138, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D693F0], *MEMORY[0x1E0D68F50]);
  v139 = (void *)MEMORY[0x1E0D66A58];
  v140 = (void *)objc_msgSend(v138, "copy");
  objc_msgSend(v139, "subject:sendEvent:", v149, v140);

}

- (void)_endAnalyticsReporting
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientAnalyticsParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AE70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)*MEMORY[0x1E0D698F8];
  if ((isKindOfClass & 1) != 0)
    v7 = v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v8);
  if (self->_didBeginPayLaterAnalyticsReporter)
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69918]);

}

- (void)_reportConnectionEstablishedAnalyticsForConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D698F8];
  v7 = *MEMORY[0x1E0D693F0];
  v8 = *MEMORY[0x1E0D68AA0];
  v19[0] = *MEMORY[0x1E0D68F50];
  v19[1] = v8;
  v9 = *MEMORY[0x1E0D68BF8];
  v20[0] = v7;
  v20[1] = v9;
  v19[2] = *MEMORY[0x1E0D686C0];
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  objc_msgSend(v10, "originatingURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (uint64_t *)MEMORY[0x1E0D68D10];
  }
  else
  {
    objc_msgSend(v11, "valueForEntitlement:", CFSTR("com.apple.developer.on-demand-install-capable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v14 = (uint64_t *)MEMORY[0x1E0D68D08];
    if (v16)
      v14 = (uint64_t *)MEMORY[0x1E0D68D00];
  }
  v17 = *v14;

  v20[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", v6, v18);

}

- (void)_reportPaymentPassMissingAnalytics
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D66A58];
  v3 = *MEMORY[0x1E0D698F8];
  v4 = *MEMORY[0x1E0D68B60];
  v5 = *MEMORY[0x1E0D68A90];
  v8[0] = *MEMORY[0x1E0D68AA0];
  v8[1] = v5;
  v6 = *MEMORY[0x1E0D68A88];
  v9[0] = v4;
  v9[1] = v6;
  v8[2] = *MEMORY[0x1E0D69578];
  v9[2] = *MEMORY[0x1E0D69580];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subject:sendEvent:", v3, v7);

}

- (void)_reportUnsupportedPaymentPassAnalytics
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D66A58];
  v3 = *MEMORY[0x1E0D698F8];
  v4 = *MEMORY[0x1E0D68B60];
  v5 = *MEMORY[0x1E0D68A90];
  v8[0] = *MEMORY[0x1E0D68AA0];
  v8[1] = v5;
  v6 = *MEMORY[0x1E0D68A88];
  v9[0] = v4;
  v9[1] = v6;
  v8[2] = *MEMORY[0x1E0D69578];
  v9[2] = *MEMORY[0x1E0D69588];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subject:sendEvent:", v3, v7);

}

- (void)_reportVerificationRequiredAnalytics
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D66A58];
  v3 = *MEMORY[0x1E0D69900];
  v8[0] = *MEMORY[0x1E0D698F8];
  v8[1] = v3;
  v8[2] = *MEMORY[0x1E0D69940];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D68AA0];
  v7 = *MEMORY[0x1E0D68C48];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjects:sendEvent:", v4, v5);

}

- (void)_reportAddCardAlertPresentedAnalytics
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D66A58];
  v3 = *MEMORY[0x1E0D698F8];
  v4 = *MEMORY[0x1E0D68F50];
  v7[0] = *MEMORY[0x1E0D68AA0];
  v7[1] = v4;
  v5 = *MEMORY[0x1E0D68720];
  v8[0] = *MEMORY[0x1E0D68C50];
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subject:sendEvent:", v3, v6);

}

- (void)_startSuppressingNotificationsIfNecessary
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_notificationSuppressionAssertion)
  {
    objc_initWeak(&location, self);
    v2 = (void *)MEMORY[0x1E0D66B80];
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke;
    v3[3] = &unk_1E3E6F340;
    objc_copyWeak(&v4, &location);
    objc_msgSend(v2, "acquireAssertionOfType:withReason:completion:", 4, CFSTR("In-App Payment Interface"), v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke_2;
  block[3] = &unk_1E3E68C58;
  v10 = v6;
  v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v11 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  id *v4;
  NSObject *WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v1;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error acquiring notification suppression assertion: %@", buf, 0xCu);
    }
  }
  else
  {
    v4 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v2 = WeakRetained;
    if (WeakRetained)
    {
      objc_storeStrong((id *)&WeakRetained[2].isa, *(id *)(a1 + 40));
      v6 = *(void **)(a1 + 40);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke_41;
      v7[3] = &unk_1E3E61310;
      objc_copyWeak(&v8, v4);
      objc_msgSend(v6, "setInvalidationHandler:", v7);
      objc_destroyWeak(&v8);
    }
  }

}

void __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke_41(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)_stopSuppressingNotifications
{
  PKAssertion *notificationSuppressionAssertion;

  -[PKAssertion invalidate](self->_notificationSuppressionAssertion, "invalidate");
  notificationSuppressionAssertion = self->_notificationSuppressionAssertion;
  self->_notificationSuppressionAssertion = 0;

}

- (void)_presentNextStepDismissingCurrentInterface:(BOOL)a3 withDefaultPassID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke;
  v9[3] = &unk_1E3E778E8;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  v12 = a3;
  -[PKPaymentAuthorizationFlowCoordinator _canPresentPaymentRequest:completion:](self, "_canPresentPaymentRequest:completion:", v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13[2];
  char v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke_2;
  v10[3] = &unk_1E3E61A08;
  objc_copyWeak(v13, (id *)(a1 + 40));
  v11 = v5;
  v7 = *(id *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 48);
  v12 = v7;
  v13[1] = a2;
  v8 = v10;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_1;
  block[3] = &unk_1E3E61590;
  v16 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v13);
}

void __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (!v3)
      v3 = *(void **)(a1 + 40);
    v4 = v3;
    if (*(_BYTE *)(a1 + 64))
    {
      v5 = objc_loadWeakRetained(WeakRetained + 9);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke_3;
      v7[3] = &unk_1E3E63480;
      v6 = *(_QWORD *)(a1 + 56);
      v7[4] = WeakRetained;
      v9 = v6;
      v8 = v4;
      objc_msgSend(v5, "dismissSceneAnimated:completion:", 1, v7);

    }
    else
    {
      objc_msgSend(WeakRetained, "_handlePaymentRequestPresentationResultType:relevantUniqueID:", *(_QWORD *)(a1 + 56), v4);
    }

  }
}

uint64_t __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePaymentRequestPresentationResultType:relevantUniqueID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_canPresentPaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[PKPaymentAuthorizationContext awaitingRemoteNetworkPaymentRequest](self->_context, "awaitingRemoteNetworkPaymentRequest"))
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Bypassing PKPassLibrary canPresentPaymentRequest check as remote payment request has been promised", buf, 2u);
      }

      if (PKPassbookIsCurrentlyDeletedByUser())
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Bypassing PKPassLibrary: Wallet must not be deleted", v17, 2u);
        }

        (*((void (**)(id, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 9, 0, 0);
      }
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 10, 0, 0);
    }
    else
    {
      v9 = objc_msgSend(v6, "requestType");
      v10 = objc_msgSend(v6, "isPeerPaymentRequest");
      if (v9 <= 0xD && ((1 << v9) & 0x20C6) != 0 || v10)
      {
        PKLogFacilityTypeGetObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Bypassing PKPassLibrary canPresentPaymentRequest check due to request type", v16, 2u);
        }

        (*((void (**)(id, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 1, 0, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "canPresentPaymentRequest:completion:", v6, v7);
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Error: No pass library to validate payment request. Bailing out", v15, 2u);
          }

          (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
        }

      }
    }
  }

}

- (void)_handlePaymentRequestPresentationResultType:(int64_t)a3 relevantUniqueID:(id)a4
{
  id v7;
  unint64_t paymentSetupState;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  id *v12;
  id v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  id *v18;
  id *v19;
  void *v20;
  id v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BYTE v27[22];
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  paymentSetupState = self->_paymentSetupState;
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("subsequent attempt");
    *(_DWORD *)v27 = 138412802;
    *(_QWORD *)&v27[4] = v10;
    if (!paymentSetupState)
      v11 = CFSTR("first attempt");
    *(_WORD *)&v27[12] = 2112;
    *(_QWORD *)&v27[14] = v11;
    v28 = 2048;
    v29 = a3;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "%@ => %@,  %ld", v27, 0x20u);

  }
  switch(a3)
  {
    case 0:
      v12 = (id *)MEMORY[0x1E0D68420];
      if (paymentSetupState)
        v12 = (id *)MEMORY[0x1E0D68458];
      v13 = *v12;
      -[PKPaymentAuthorizationFlowCoordinator _presentInvalidAlert](self, "_presentInvalidAlert");
      break;
    case 1:
      v14 = (id *)MEMORY[0x1E0D68400];
      if (paymentSetupState)
        v14 = (id *)MEMORY[0x1E0D68470];
      v13 = *v14;
      goto LABEL_12;
    case 2:
      -[PKPaymentAuthorizationFlowCoordinator _reportPaymentPassMissingAnalytics](self, "_reportPaymentPassMissingAnalytics");
      v13 = (id)*MEMORY[0x1E0D68428];
      v15 = (void *)*MEMORY[0x1E0D68460];
      if (paymentSetupState)
        v16 = (void *)*MEMORY[0x1E0D68460];
      else
        v16 = (void *)*MEMORY[0x1E0D68428];
      v17 = v16;
      if (paymentSetupState)
      {
        -[PKPaymentAuthorizationFlowCoordinator authorizationDidFinishWithError:](self, "authorizationDidFinishWithError:", 0);
        goto LABEL_29;
      }
      -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "requestType");

      if (v26 == 5)
      {
        -[PKPaymentAuthorizationFlowCoordinator _presentOnboardingForContext:](self, "_presentOnboardingForContext:", 1);
        break;
      }
      if (-[PKPaymentAuthorizationFlowCoordinator _canPresentPaymentSheetWithEmptyPass](self, "_canPresentPaymentSheetWithEmptyPass"))
      {
        goto LABEL_12;
      }
      -[PKPaymentAuthorizationFlowCoordinator presentPaymentProvisioningDismissingAfterwards:](self, "presentPaymentProvisioningDismissingAfterwards:", 0);
      break;
    case 3:
      v18 = (id *)MEMORY[0x1E0D68410];
      if (paymentSetupState)
        v18 = (id *)MEMORY[0x1E0D68440];
      v13 = *v18;
      -[PKPaymentAuthorizationFlowCoordinator _presentActivatingPassAlertWithRelevantUniqueID:](self, "_presentActivatingPassAlertWithRelevantUniqueID:", v7);
      break;
    case 4:
      v19 = (id *)MEMORY[0x1E0D68438];
      if (paymentSetupState)
        v19 = (id *)MEMORY[0x1E0D68478];
      v13 = *v19;
      -[PKPaymentAuthorizationFlowCoordinator _presentVerifyPassAlertWithRelevantUniqueID:](self, "_presentVerifyPassAlertWithRelevantUniqueID:", v7);
      break;
    case 5:
      -[PKPaymentAuthorizationFlowCoordinator _reportUnsupportedPaymentPassAnalytics](self, "_reportUnsupportedPaymentPassAnalytics");
      v13 = (id)*MEMORY[0x1E0D68418];
      v15 = (void *)*MEMORY[0x1E0D68450];
      if (paymentSetupState)
        v20 = (void *)*MEMORY[0x1E0D68450];
      else
        v20 = (void *)*MEMORY[0x1E0D68418];
      v21 = v20;
      if (paymentSetupState)
      {
        -[PKPaymentAuthorizationFlowCoordinator _presentPassNotSupportedAlertWithRelevantUniqueID:](self, "_presentPassNotSupportedAlertWithRelevantUniqueID:", v7);
LABEL_29:
        v13 = v15;
      }
      else if (-[PKPaymentAuthorizationFlowCoordinator _canPresentPaymentSheetWithEmptyPass](self, "_canPresentPaymentSheetWithEmptyPass"))
      {
LABEL_12:
        -[PKPaymentAuthorizationFlowCoordinator _presentPaymentAuthorizationWithRelevantUniqueID:](self, "_presentPaymentAuthorizationWithRelevantUniqueID:", v7, *(_OWORD *)v27);
      }
      else
      {
        -[PKPaymentAuthorizationFlowCoordinator _presentAddCardAlert](self, "_presentAddCardAlert");
      }
      break;
    case 6:
      v22 = (id *)MEMORY[0x1E0D68430];
      if (paymentSetupState)
        v22 = (id *)MEMORY[0x1E0D68468];
      v13 = *v22;
      -[PKPaymentAuthorizationFlowCoordinator _presentLostModeAlertWithRelevantUniqueID:](self, "_presentLostModeAlertWithRelevantUniqueID:", v7);
      break;
    case 7:
      if (self->_peerPaymentIdentityVerificationCompleted)
        -[PKPaymentAuthorizationFlowCoordinator _presentPeerPaymentIdentityVerificationAlert](self, "_presentPeerPaymentIdentityVerificationAlert");
      else
        -[PKPaymentAuthorizationFlowCoordinator _presentPeerPaymentIdentityVerification](self, "_presentPeerPaymentIdentityVerification");
      goto LABEL_35;
    case 8:
      -[PKPaymentAuthorizationContext request](self->_context, "request");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "installmentConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "feature");
      PKFeatureIdentifierFromPaymentSetupFeatureType();

      if (paymentSetupState || !PKDeviceSupportsApplicationForFeatureIdentifier())
        -[PKPaymentAuthorizationFlowCoordinator authorizationDidFinishWithError:](self, "authorizationDidFinishWithError:", 0, *(_QWORD *)v27, *(_QWORD *)&v27[8]);
      else
        -[PKPaymentAuthorizationFlowCoordinator _presentOnboardingForContext:](self, "_presentOnboardingForContext:", 0);
      goto LABEL_35;
    case 9:
      -[PKPaymentAuthorizationFlowCoordinator _presentWalletUninstalledAlert](self, "_presentWalletUninstalledAlert");
      goto LABEL_35;
    case 10:
      -[PKPaymentAuthorizationFlowCoordinator _presentAwaitingRemoteNetworkPaymentRequestWithRelevantUniqueID:](self, "_presentAwaitingRemoteNetworkPaymentRequestWithRelevantUniqueID:", v7);
      goto LABEL_35;
    default:
      goto LABEL_35;
  }
  if (v13)
  {
    MEMORY[0x1A1AE3A74](v13, 0);

  }
LABEL_35:

}

- (id)_createPaymentInterfaceConfigurationWithRelevantPassID:(id)a3
{
  id v4;
  PKPaymentAuthorizationInterfaceConfiguration *v5;

  v4 = a3;
  v5 = -[PKPaymentAuthorizationInterfaceConfiguration initWithRelevantPassID:presenter:host:supportedOrientations:]([PKPaymentAuthorizationInterfaceConfiguration alloc], "initWithRelevantPassID:presenter:host:supportedOrientations:", v4, self, self, -[PKPaymentAuthorizationFlowCoordinator supportedInterfaceOrientations](self, "supportedInterfaceOrientations"));

  return v5;
}

- (void)_presentPaymentInterface:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  PKPaymentAuthorizationInterface **p_paymentInterface;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  PKPaymentAuthorizationInterface *paymentInterface;
  id WeakRetained;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  PKPaymentAuthorizationFlowCoordinator *v23;
  __int16 v24;
  PKPaymentAuthorizationInterface *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  p_paymentInterface = &self->_paymentInterface;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentAuthorizationInterface invalidate](*p_paymentInterface, "invalidate");
  objc_storeStrong((id *)&self->_paymentInterface, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[PKPaymentAuthorizationInterface serviceDelegate](*p_paymentInterface, "serviceDelegate"),
        (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    -[PKPaymentAuthorizationFlowCoordinator exportedObject](self, "exportedObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v11;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      paymentInterface = self->_paymentInterface;
      *(_DWORD *)buf = 134349312;
      v23 = self;
      v24 = 2050;
      v25 = paymentInterface;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): displayed interface (%{public}p) didn't provide a service delegate - using default one.", buf, 0x16u);
    }

    -[PKPaymentAuthorizationFlowCoordinator exportedObject](self, "exportedObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationFlowCoordinator defaultService](self, "defaultService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v14 = v13;
  }
  objc_msgSend(v12, "setDelegate:", v14);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentAuthorizationInterface willAppear](*p_paymentInterface, "willAppear");
  WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);
  -[PKPaymentAuthorizationInterface primaryViewController](self->_paymentInterface, "primaryViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__PKPaymentAuthorizationFlowCoordinator__presentPaymentInterface_completion___block_invoke;
  v20[3] = &unk_1E3E61850;
  v20[4] = self;
  v21 = v8;
  v19 = v8;
  objc_msgSend(WeakRetained, "presentPrimaryViewController:animated:completion:", v18, 1, v20);

}

uint64_t __77__PKPaymentAuthorizationFlowCoordinator__presentPaymentInterface_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "authorizationDidPresent");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "didAppear");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_openApplication:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  PKPaymentAuthorizationFlowCoordinator *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): asked to open application for notification %{public}@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PKPaymentAuthorizationFlowCoordinator__openApplication___block_invoke;
  v7[3] = &unk_1E3E612E8;
  v8 = v4;
  v6 = v4;
  -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](self, "dismissWithReason:error:completion:", 3, 0, v7);

}

uint64_t __58__PKPaymentAuthorizationFlowCoordinator__openApplication___block_invoke(uint64_t a1)
{
  return PKOpenApplication(*(NSNotification **)(a1 + 32));
}

- (void)_presentOnboardingForContext:(int64_t)a3
{
  NSObject *v4;
  PKPaymentAuthorizationOnboardingInterface *v6;
  PKPaymentAuthorizationOnboardingInterface *v7;
  NSObject *v8;
  int v9;
  PKPaymentAuthorizationFlowCoordinator *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_paymentSetupState)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134349056;
      v10 = self;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): asked to show onboarding flow but payment setup was already initiated. Ignoring request.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    self->_paymentSetupState = 1;
    -[PKPaymentAuthorizationFlowCoordinator _createPaymentInterfaceConfigurationWithRelevantPassID:](self, "_createPaymentInterfaceConfigurationWithRelevantPassID:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = -[PKPaymentAuthorizationOnboardingInterface initWithOnboardingContext:authorizationContext:configuration:]([PKPaymentAuthorizationOnboardingInterface alloc], "initWithOnboardingContext:authorizationContext:configuration:", a3, self->_context, v4);
    v7 = v6;
    if (v6)
    {
      -[PKPaymentAuthorizationOnboardingInterface setDelegate:](v6, "setDelegate:", self);
      -[PKPaymentAuthorizationFlowCoordinator _presentPaymentInterface:completion:](self, "_presentPaymentInterface:completion:", v7, 0);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134349056;
        v10 = self;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): cannot create onboarding interface - dismissing.", (uint8_t *)&v9, 0xCu);
      }

      -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](self, "dismissWithReason:error:completion:", 1, 0, 0);
    }

  }
}

- (void)paymentAuthorizationOnboardingDidFinishWithError:(id)a3
{
  self->_paymentSetupState = 2;
  if (a3)
    -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](self, "dismissWithReason:error:completion:", 1, a3, 0);
  else
    -[PKPaymentAuthorizationFlowCoordinator _presentNextStepDismissingCurrentInterface:withDefaultPassID:](self, "_presentNextStepDismissingCurrentInterface:withDefaultPassID:", 1);
}

- (void)_presentPeerPaymentIdentityVerification
{
  NSObject *v3;
  void *v4;
  PKPaymentAuthorizationContext *context;
  _QWORD v6[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presenting peer payment identity verification.", buf, 2u);
  }

  -[PKPaymentAuthorizationFlowCoordinator _createPaymentInterfaceConfigurationWithRelevantPassID:](self, "_createPaymentInterfaceConfigurationWithRelevantPassID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerification__block_invoke;
  v6[3] = &unk_1E3E77910;
  v6[4] = self;
  +[PKPeerPaymentIdentityVerificationInterface interfaceWithContext:configuration:completion:](PKPeerPaymentIdentityVerificationInterface, "interfaceWithContext:configuration:completion:", context, v4, v6);

}

void __80__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_presentPaymentInterface:completion:", v4, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134349056;
      v10 = v6;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): failed to create peer identity verification interface.", buf, 0xCu);
    }

    if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentPeerPaymentIdentityVerificationAlert");
    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __80__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerification__block_invoke_58;
      v8[3] = &unk_1E3E612E8;
      v8[4] = *(_QWORD *)(a1 + 32);
      PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_presentAlertController:", v7);

    }
  }

}

uint64_t __80__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerification__block_invoke_58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "authorizationDidFinishWithError:", 0);
}

- (void)peerPaymentIdentityVerificationDidFinishWithAccount:(id)a3
{
  self->_peerPaymentIdentityVerificationCompleted = 1;
  -[PKPaymentAuthorizationFlowCoordinator setPeerPaymentAccount:](self, "setPeerPaymentAccount:", a3);
  -[PKPaymentAuthorizationFlowCoordinator _presentNextStepDismissingCurrentInterface:withDefaultPassID:](self, "_presentNextStepDismissingCurrentInterface:withDefaultPassID:", 0, 0);
}

- (BOOL)_peerPaymentIdentityVerificationRequired
{
  void *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;

  -[PKPaymentAuthorizationFlowCoordinator peerPaymentAccount](self, "peerPaymentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "identityVerificationForDisbursementsRequired"))
  {
    if ((objc_msgSend(v2, "identityVerificationRequired") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v4 = objc_msgSend(v2, "state");
      v5 = objc_msgSend(v2, "stage");
      v3 = v4 == 1 && v5 == 2;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_presentAwaitingRemoteNetworkPaymentRequestWithRelevantUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PKRemoteNetworkPaymentLoadingViewInterface *v7;
  uint8_t v8[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "FlowCoordinator: Displaying awaiting remote request view", v8, 2u);
  }

  -[PKPaymentAuthorizationFlowCoordinator _createPaymentInterfaceConfigurationWithRelevantPassID:](self, "_createPaymentInterfaceConfigurationWithRelevantPassID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKRemoteNetworkPaymentLoadingViewInterface initWithContext:configuration:]([PKRemoteNetworkPaymentLoadingViewInterface alloc], "initWithContext:configuration:", self->_context, v6);
  -[PKPaymentAuthorizationFlowCoordinator _presentPaymentInterface:completion:](self, "_presentPaymentInterface:completion:", v7, 0);

}

- (void)_presentPaymentAuthorizationWithRelevantUniqueID:(id)a3
{
  NSObject *v5;
  id v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  PKPaymentAuthorizationContext *context;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  PKPaymentAuthorizationFlowCoordinator *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = os_signpost_id_make_with_pointer(v5, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "present:paymentSheet", ", buf, 2u);
    }
  }

  -[PKPaymentAuthorizationFlowCoordinator _createPaymentInterfaceConfigurationWithRelevantPassID:](self, "_createPaymentInterfaceConfigurationWithRelevantPassID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  v15 = 0;
  +[PKPaymentAuthorizationInterfaceManager paymentInterfaceForContext:configuration:error:](PKPaymentAuthorizationInterfaceManager, "paymentInterfaceForContext:configuration:error:", context, v9, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__PKPaymentAuthorizationFlowCoordinator__presentPaymentAuthorizationWithRelevantUniqueID___block_invoke;
    v14[3] = &unk_1E3E612E8;
    v14[4] = self;
    -[PKPaymentAuthorizationFlowCoordinator _presentPaymentInterface:completion:](self, "_presentPaymentInterface:completion:", v11, v14);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v17 = self;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): cannot create authorization interface - dismissing.", buf, 0xCu);
    }

    -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](self, "dismissWithReason:error:completion:", 1, v12, 0);
  }

}

void __90__PKPaymentAuthorizationFlowCoordinator__presentPaymentAuthorizationWithRelevantUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v2, OS_SIGNPOST_INTERVAL_END, v4, "present:paymentSheet", ", v5, 2u);
    }
  }

}

- (void)_presentActivatingPassAlertWithRelevantUniqueID:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originatingURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("Web payment");
    if (!v7)
      v8 = CFSTR("In app payment");
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@: displaying card activating alert", (uint8_t *)&v12, 0xCu);

  }
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_ACTIVATING_CARDS_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_ACTIVATING_CARDS_BODY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:](self, "_presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:", v9, v10, v11, 0, 0);

}

- (void)_presentVerifyPassAlertWithRelevantUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originatingURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("Web payment");
    if (!v8)
      v9 = CFSTR("In app payment");
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "%@: displaying card verification required alert", buf, 0xCu);

  }
  -[PKPaymentAuthorizationFlowCoordinator _reportVerificationRequiredAnalytics](self, "_reportVerificationRequiredAnalytics");
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_VERIFICATION_REQUIRED_CARDS_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_VERIFICATION_REQUIRED_CARDS_BODY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_VERIFICATION_REQUIRED_CARDS_VERIFY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__PKPaymentAuthorizationFlowCoordinator__presentVerifyPassAlertWithRelevantUniqueID___block_invoke;
  v14[3] = &unk_1E3E61388;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:actionTitle:actionHandler:](self, "_presentAlertWithTitle:message:actionTitle:actionHandler:", v10, v11, v12, v14);

}

void __85__PKPaymentAuthorizationFlowCoordinator__presentVerifyPassAlertWithRelevantUniqueID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "authorizationDidFinishWithError:", 0);
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentWalletWithRelevantPassUniqueID:", *(_QWORD *)(a1 + 40));

}

- (void)_presentLostModeAlertWithRelevantUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originatingURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("Web payment");
    if (!v8)
      v9 = CFSTR("In app payment");
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "%@: displaying card in lost mode alert", buf, 0xCu);

  }
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_LOST_MODE_CARDS_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_LOST_MODE_CARDS_BODY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("WALLET"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PKPaymentAuthorizationFlowCoordinator__presentLostModeAlertWithRelevantUniqueID___block_invoke;
  v14[3] = &unk_1E3E61388;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:actionTitle:actionHandler:](self, "_presentAlertWithTitle:message:actionTitle:actionHandler:", v10, v11, v12, v14);

}

void __83__PKPaymentAuthorizationFlowCoordinator__presentLostModeAlertWithRelevantUniqueID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "authorizationDidFinishWithError:", 0);
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentWalletWithRelevantPassUniqueID:", *(_QWORD *)(a1 + 40));

}

- (void)_presentPeerPaymentIdentityVerificationAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originatingURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("Web payment");
    if (!v6)
      v7 = CFSTR("In app payment");
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "%@: displaying peer payment identity verification alert", buf, 0xCu);

  }
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IDENTITY_VERIFICATION_ALERT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IDENTITY_VERIFICATION_ALERT_MESSAGE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_IDENTITY_VERIFICATION_ALERT_OK_BUTTON"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerificationAlert__block_invoke;
  v11[3] = &unk_1E3E612E8;
  v11[4] = self;
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:actionTitle:actionHandler:](self, "_presentAlertWithTitle:message:actionTitle:actionHandler:", v8, v9, v10, v11);

}

uint64_t __85__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerificationAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "authorizationDidFinishWithError:", 0);
}

- (void)_presentAddCardAlert
{
  void *v2;
  NSObject *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originatingURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("Web payment");
    if (!v2)
      v7 = CFSTR("In app payment");
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@: displaying add card alert", buf, 0xCu);

  }
  -[PKPaymentAuthorizationFlowCoordinator _reportAddCardAlertPresentedAnalytics](self, "_reportAddCardAlertPresentedAnalytics");
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_UNSUPPORTED_CARDS_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originatingURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_UNSUPPORTED_CARDS_WEB_BODY"));
  }
  else
  {
    -[PKPaymentAuthorizationContext hostLocalizedAppName](self->_context, "hostLocalizedAppName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_UNSUPPORTED_CARDS_INAPP_BODY_FORMAT"), CFSTR("%@"), v2);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_UNSUPPORTED_CARDS_ADD"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PKPaymentAuthorizationFlowCoordinator__presentAddCardAlert__block_invoke;
  v13[3] = &unk_1E3E612E8;
  v13[4] = self;
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:actionTitle:actionHandler:](self, "_presentAlertWithTitle:message:actionTitle:actionHandler:", v8, v11, v12, v13);

  if (!v10)
  {

    v11 = v2;
  }

}

void __61__PKPaymentAuthorizationFlowCoordinator__presentAddCardAlert__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD v3[5];
  _QWORD block[4];
  id v5;

  v1 = MEMORY[0x1E0C809B0];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentAuthorizationFlowCoordinator__presentAddCardAlert__block_invoke_2;
  v3[3] = &unk_1E3E612E8;
  v3[4] = *(_QWORD *)(a1 + 32);
  v2 = v3;
  block[0] = v1;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_1;
  block[3] = &unk_1E3E61590;
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__PKPaymentAuthorizationFlowCoordinator__presentAddCardAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPaymentProvisioningDismissingAfterwards:", 0);
}

- (void)_presentPassNotSupportedAlertWithRelevantUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originatingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("Web payment");
    if (!v7)
      v9 = CFSTR("In app payment");
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "%@: displaying pass not supported alert", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passWithUniqueID:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "devicePrimaryPaymentApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentNetworkIdentifier");
  PKDisplayablePaymentNetworkNameForPaymentCredentialType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v11, "organizationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKPaymentAuthorizationContext hostLocalizedAppName](self->_context, "hostLocalizedAppName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_CARD_NOT_SUPPORTED_BY_MERCHANT_INAPP_TITLE"), CFSTR("%1$@%2$@"), v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentAuthorizationContext hostLocalizedAppName](self->_context, "hostLocalizedAppName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_CARD_NOT_SUPPORTED_BY_MERCHANT_INAPP_BODY"), CFSTR("%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_UNSUPPORTED_CARDS_ADD"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentAuthorizationFlowCoordinator__presentPassNotSupportedAlertWithRelevantUniqueID___block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  if (v7)
  {
    PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_CARD_NOT_SUPPORTED_BY_MERCHANT_WEB_TITLE"), CFSTR("%@"), v13);
    v21 = objc_claimAutoreleasedReturnValue();

    PKLocalizedPaymentString(CFSTR("LOCAL_SETUP_CARD_NOT_SUPPORTED_BY_MERCHANT_WEB_BODY"));
    v22 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v21;
    v17 = (void *)v22;
  }
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:](self, "_presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:", v15, v17, v18, v19, v20);

}

void __91__PKPaymentAuthorizationFlowCoordinator__presentPassNotSupportedAlertWithRelevantUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD v3[5];
  _QWORD block[4];
  id v5;

  v1 = MEMORY[0x1E0C809B0];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__PKPaymentAuthorizationFlowCoordinator__presentPassNotSupportedAlertWithRelevantUniqueID___block_invoke_2;
  v3[3] = &unk_1E3E612E8;
  v3[4] = *(_QWORD *)(a1 + 32);
  v2 = v3;
  block[0] = v1;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_1;
  block[3] = &unk_1E3E61590;
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__PKPaymentAuthorizationFlowCoordinator__presentPassNotSupportedAlertWithRelevantUniqueID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPaymentProvisioningDismissingAfterwards:", 0);
}

- (void)_presentInvalidAlert
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requestType");

  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 5)
  {
    objc_msgSend(v5, "installmentConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feature");
    v8 = PKFeatureIdentifierFromPaymentSetupFeatureType();

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__PKPaymentAuthorizationFlowCoordinator__presentInvalidAlert__block_invoke;
    v17[3] = &unk_1E3E77938;
    v17[4] = self;
    v17[5] = v8;
    objc_msgSend(v9, "defaultAccountForFeature:completion:", v8, v17);
  }
  else
  {
    objc_msgSend(v5, "originatingURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("Web payment");
      if (!v11)
        v13 = CFSTR("In app payment");
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "%@: displaying invalid alert", buf, 0xCu);
    }

    if (v11)
    {
      PKLocalizedPaymentString(CFSTR("WEB_PAYMENT_ERROR_NOT_AVAILABLE_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
    else
    {
      -[PKPaymentAuthorizationContext hostLocalizedAppName](self->_context, "hostLocalizedAppName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_AVAILABLE_TITLE"), CFSTR("%@"), v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_AVAILABLE_MESSAGE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:](self, "_presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:", v9, v14, v16, 0, 0);

  }
}

void __61__PKPaymentAuthorizationFlowCoordinator__presentInvalidAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentAuthorizationFlowCoordinator__presentInvalidAlert__block_invoke_2;
  block[3] = &unk_1E3E63480;
  v4 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __61__PKPaymentAuthorizationFlowCoordinator__presentInvalidAlert__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  if (v2 && (unint64_t)(objc_msgSend(v2, "state") - 2) <= 2)
  {
    PKLocalizedFeatureString();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -2016, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  if (v7 && v3)
  {
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:finalError:", v7, v3, v6, 0, 0, v4);

  }
  else
  {
    objc_msgSend(v5, "authorizationDidFinishWithError:", v4);
  }

}

- (void)_presentAlertController:(id)a3
{
  id v4;
  PKPaymentAuthorizationMinimalInterface *v5;

  v4 = a3;
  v5 = -[PKPaymentAuthorizationMinimalInterface initWithPrimaryViewController:]([PKPaymentAuthorizationMinimalInterface alloc], "initWithPrimaryViewController:", v4);

  -[PKPaymentAuthorizationFlowCoordinator _presentPaymentInterface:completion:](self, "_presentPaymentInterface:completion:", v5, 0);
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7 finalError:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v16)
  {
    PKLocalizedString(CFSTR("CANCEL"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = (void *)MEMORY[0x1E0DC3448];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __121__PKPaymentAuthorizationFlowCoordinator__presentAlertWithTitle_message_cancelTitle_actionTitle_actionHandler_finalError___block_invoke;
  v30[3] = &unk_1E3E61D90;
  v30[4] = self;
  v23 = v19;
  v31 = v23;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v16, 1, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v24);

  if (v17)
  {
    v25 = (void *)MEMORY[0x1E0DC3448];
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __121__PKPaymentAuthorizationFlowCoordinator__presentAlertWithTitle_message_cancelTitle_actionTitle_actionHandler_finalError___block_invoke_2;
    v28[3] = &unk_1E3E61CA8;
    v29 = v18;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v17, 0, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v26);

  }
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertController:](self, "_presentAlertController:", v20);

}

uint64_t __121__PKPaymentAuthorizationFlowCoordinator__presentAlertWithTitle_message_cancelTitle_actionTitle_actionHandler_finalError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "authorizationDidFinishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __121__PKPaymentAuthorizationFlowCoordinator__presentAlertWithTitle_message_cancelTitle_actionTitle_actionHandler_finalError___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 actionTitle:(id)a5 actionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  PKLocalizedString(CFSTR("CANCEL"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:](self, "_presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:", v13, v12, v14, v11, v10);

}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7
{
  -[PKPaymentAuthorizationFlowCoordinator _presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:finalError:](self, "_presentAlertWithTitle:message:cancelTitle:actionTitle:actionHandler:finalError:", a3, a4, a5, a6, a7, 0);
}

- (void)_presentEnrollAccessibilityIntentAlert
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *AccesibilityIntentUnavailable;
  PKPaymentAuthorizationMinimalInterface *v7;
  _QWORD v8[4];
  id v9;
  _QWORD aBlock[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentAuthorizationFlowCoordinator__presentEnrollAccessibilityIntentAlert__block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v11, &location);
  v4 = _Block_copy(aBlock);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __79__PKPaymentAuthorizationFlowCoordinator__presentEnrollAccessibilityIntentAlert__block_invoke_2;
  v8[3] = &unk_1E3E73920;
  objc_copyWeak(&v9, &location);
  v5 = _Block_copy(v8);
  AccesibilityIntentUnavailable = PKAlertCreateAccesibilityIntentUnavailable(v4, v5);
  v7 = -[PKPaymentAuthorizationMinimalInterface initWithPrimaryViewController:]([PKPaymentAuthorizationMinimalInterface alloc], "initWithPrimaryViewController:", AccesibilityIntentUnavailable);
  -[PKPaymentAuthorizationFlowCoordinator _presentPaymentInterface:completion:](self, "_presentPaymentInterface:completion:", v7, 0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __79__PKPaymentAuthorizationFlowCoordinator__presentEnrollAccessibilityIntentAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissWithReason:error:completion:", 3, 0, 0);
    WeakRetained = v2;
  }

}

void __79__PKPaymentAuthorizationFlowCoordinator__presentEnrollAccessibilityIntentAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dismissWithReason:error:completion:", 3, 0, 0);
    v6 = objc_alloc_init(MEMORY[0x1E0CA5938]);
    objc_msgSend(v6, "setSensitive:", 1);
    v8 = *MEMORY[0x1E0D22D88];
    v9[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFrontBoardOptions:", v7);

    PKOpenApplication(v3, v6);
  }

}

- (void)_presentWalletUninstalledAlert
{
  void *v3;
  PKPaymentAuthorizationMinimalInterface *v4;
  PKPaymentAuthorizationMinimalInterface *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __71__PKPaymentAuthorizationFlowCoordinator__presentWalletUninstalledAlert__block_invoke;
  v9 = &unk_1E3E61310;
  objc_copyWeak(&v10, &location);
  v3 = PKCreateAlertControllerForWalletUninstalled(&v6);
  v4 = [PKPaymentAuthorizationMinimalInterface alloc];
  v5 = -[PKPaymentAuthorizationMinimalInterface initWithPrimaryViewController:](v4, "initWithPrimaryViewController:", v3, v6, v7, v8, v9);
  -[PKPaymentAuthorizationFlowCoordinator _presentPaymentInterface:completion:](self, "_presentPaymentInterface:completion:", v5, 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __71__PKPaymentAuthorizationFlowCoordinator__presentWalletUninstalledAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "authorizationDidFinishWithError:", 0);
    WeakRetained = v2;
  }

}

- (void)authorizationWillStart
{
  id v2;

  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationWillStart");

}

- (void)authorizationDidRequestMerchantSession
{
  id v2;

  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidRequestMerchantSession");

}

- (void)authorizationDidFinishWithError:(id)a3
{
  id v4;
  id v5;

  if (!self->_didSendAuthorizationDidFinish)
  {
    self->_didSendAuthorizationDidFinish = 1;
    v4 = a3;
    -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authorizationDidFinishWithError:", v4);

  }
}

- (void)authorizationDidAuthorizeContext
{
  id v2;

  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidAuthorizeContext");

}

- (void)authorizationDidAuthorizePayment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidAuthorizePayment:", v4);

  if (self->_paymentSetupState == 2)
    JUMPOUT(0x1A1AE3A74);
}

- (void)authorizationDidAuthorizePurchase:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidAuthorizePurchase:", v4);

}

- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidAuthorizePeerPaymentQuote:", v4);

}

- (void)authorizationDidAuthorizeApplePayTrustSignature:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidAuthorizeApplePayTrustSignature:", v4);

}

- (void)authorizationDidUpdateAccountServicePaymentMethod:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidUpdateAccountServicePaymentMethod:", v4);

}

- (void)authorizationDidSelectShippingMethod:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidSelectShippingMethod:", v4);

}

- (void)authorizationDidSelectShippingAddress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidSelectShippingAddress:", v4);

}

- (void)authorizationDidSelectPaymentMethod:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidSelectPaymentMethod:", v4);

}

- (void)authorizationDidChangeCouponCode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationDidChangeCouponCode:", v4);

}

- (void)didEncounterAuthorizationEvent:(unint64_t)a3
{
  id v4;

  -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didEncounterAuthorizationEvent:", a3);

}

- (void)authorizationDidPresent
{
  id v2;

  if (!self->_didSendAuthorizationDidPresent)
  {
    self->_didSendAuthorizationDidPresent = 1;
    -[PKPaymentAuthorizationFlowCoordinator remoteObjectProxy](self, "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "authorizationDidPresent");

  }
}

- (void)authorizationDidFulfillPaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKPaymentAuthorizationContext fulfillPromisedRemoteNetworkPaymentRequest:](self->_context, "fulfillPromisedRemoteNetworkPaymentRequest:", v6);
  -[PKPaymentAuthorizationFlowCoordinator _reportPaymentRequestDetails](self, "_reportPaymentRequestDetails");
  objc_initWeak(&location, self);
  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke;
  v10[3] = &unk_1E3E77988;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  -[PKPaymentAuthorizationFlowCoordinator _canPresentPaymentRequest:completion:](self, "_canPresentPaymentRequest:completion:", v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14[2];
  _QWORD block[4];
  id v16;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke_2;
  v11[3] = &unk_1E3E77960;
  objc_copyWeak(v14, (id *)(a1 + 48));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14[1] = a2;
  v11[4] = v7;
  v12 = v5;
  v13 = v8;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_1;
  block[3] = &unk_1E3E61590;
  v16 = v9;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v14);
}

void __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  char v5;
  char v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3 == 5 || v3 == 2)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "_canPresentPaymentSheetWithEmptyPass");
      v3 = *(_QWORD *)(a1 + 64);
    }
    else
    {
      v5 = 0;
    }
    if (v3 == 1)
      v6 = 1;
    else
      v6 = v5;
    v7 = *(_QWORD *)(a1 + 48);
    if (v7 && (v6 & 1) == 0)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    v8 = objc_loadWeakRetained(WeakRetained + 9);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke_3;
    v10[3] = &unk_1E3E6C3B8;
    v9 = *(_QWORD *)(a1 + 64);
    v10[4] = WeakRetained;
    v13 = v9;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v14 = v6;
    objc_msgSend(v8, "dismissSceneAnimated:completion:", 1, v10);

  }
}

uint64_t __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_handlePaymentRequestPresentationResultType:relevantUniqueID:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    if (*(_BYTE *)(a1 + 64))
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)authorizationDidRejectPaymentRequestPromise
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "FlowCoordinator: Dismissing prayment request promise with failure", v4, 2u);
  }

  -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](self, "dismissWithReason:error:completion:", 3, 0, 0);
}

- (BOOL)supportsSecondaryViewController
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);
  v3 = objc_msgSend(WeakRetained, "supportsSecondaryViewController");

  return v3;
}

- (void)presentSecondaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  PKPaymentAuthorizationScenePresenter **p_scenePresenter;
  id v8;
  id v9;
  id WeakRetained;

  v5 = a4;
  p_scenePresenter = &self->_scenePresenter;
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scenePresenter);
  objc_msgSend(WeakRetained, "presentSecondaryViewController:animated:completion:", v9, v5, v8);

}

- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  PKPaymentAuthorizationScenePresenter **p_scenePresenter;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_scenePresenter = &self->_scenePresenter;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_scenePresenter);
  objc_msgSend(WeakRetained, "dismissSecondaryViewControllerAnimated:completion:", v4, v6);

}

- (void)presentPaymentProvisioningDismissingAfterwards:(BOOL)a3
{
  id WeakRetained;
  _QWORD v5[5];

  self->_dismissAfterPaymentSetup = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__PKPaymentAuthorizationFlowCoordinator_presentPaymentProvisioningDismissingAfterwards___block_invoke;
  v5[3] = &unk_1E3E612E8;
  v5[4] = self;
  objc_msgSend(WeakRetained, "dismissSceneAnimated:completion:", 1, v5);

}

void __88__PKPaymentAuthorizationFlowCoordinator_presentPaymentProvisioningDismissingAfterwards___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  PKPaymentAuthorizationProvisioningInterface *v4;
  PKPaymentAuthorizationProvisioningInterface *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 40) == 1)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134349056;
      v9 = v1;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): Asked to show provisioning flow but payment setup already in progress. Ignoring request", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68480], 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_createPaymentInterfaceConfigurationWithRelevantPassID:", 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v4 = -[PKPaymentAuthorizationProvisioningInterface initWithContext:configuration:]([PKPaymentAuthorizationProvisioningInterface alloc], "initWithContext:configuration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v2);
    v5 = v4;
    if (v4)
    {
      -[PKPaymentAuthorizationProvisioningInterface setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "_presentPaymentInterface:completion:", v5, 0);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 134349056;
        v9 = v7;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): cannot create provisioning interface - dismissing", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "dismissWithReason:error:completion:", 1, 0, 0);
    }

  }
}

- (void)paymentAuthorizationProvisioningDidFinishWithPass:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  PKPaymentAuthorizationFlowCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  self->_paymentSetupState = 2;
  if (self->_dismissAfterPaymentSetup)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134349056;
      v9 = self;
      v6 = "PKPaymentAuthorizationFlowCoordinator (%{public}p): Dismissing following completed payment setup";
LABEL_4:
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v4, "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentAuthorizationFlowCoordinator _presentNextStepDismissingCurrentInterface:withDefaultPassID:](self, "_presentNextStepDismissingCurrentInterface:withDefaultPassID:", 1, v7);

      goto LABEL_8;
    }
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134349056;
      v9 = self;
      v6 = "PKPaymentAuthorizationFlowCoordinator (%{public}p): Provisioning didn't produce any pass. Dismissing";
      goto LABEL_4;
    }
  }

  -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](self, "dismissWithReason:error:completion:", 1, 0, 0);
LABEL_8:

}

- (void)dismissWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  _BOOL4 invalidated;
  id WeakRetained;
  void *v19;
  _QWORD aBlock[5];

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    -[PKPaymentAuthorizationFlowCoordinator dismissalTaskProgressTracker](self, "dismissalTaskProgressTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notifyOnCompletion:", v9);

  }
  -[PKPaymentAuthorizationFlowCoordinator dismissalTaskProgressTracker](self, "dismissalTaskProgressTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "status");

  if (!v12)
  {
    -[PKPaymentAuthorizationFlowCoordinator dismissalTaskProgressTracker](self, "dismissalTaskProgressTracker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "taskDidStart");

    if (self->_paymentSetupState == 2 && !self->_dismissAfterPaymentSetup)
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68448], 0);
    -[PKPaymentAuthorizationFlowCoordinator exportedObject](self, "exportedObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "handleHostApplicationDidCancel");
    if (a3 != 2)
      -[PKPaymentAuthorizationFlowCoordinator authorizationDidFinishWithError:](self, "authorizationDidFinishWithError:", v8);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PKPaymentAuthorizationFlowCoordinator_dismissWithReason_error_completion___block_invoke;
    aBlock[3] = &unk_1E3E612E8;
    aBlock[4] = self;
    v16 = (void (**)(_QWORD))_Block_copy(aBlock);
    invalidated = self->_invalidated;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);
    v19 = WeakRetained;
    if (invalidated)
    {
      objc_msgSend(WeakRetained, "dismissSceneAnimated:completion:", 0, 0);

      v16[2](v16);
    }
    else
    {
      objc_msgSend(WeakRetained, "dismissSceneAnimated:completion:", 1, v16);

    }
  }

}

uint64_t __76__PKPaymentAuthorizationFlowCoordinator_dismissWithReason_error_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)_shouldBlockHardwareCancels
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PKPaymentAuthorizationInterface shouldBlockHardwareCancels](self->_paymentInterface, "shouldBlockHardwareCancels");
  else
    return 0;
}

- (BOOL)handleHomeButtonPressed
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int IsAvailable;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  int v12;
  PKPaymentAuthorizationFlowCoordinator *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[PKPaymentAuthorizationFlowCoordinator _shouldBlockHardwareCancels](self, "_shouldBlockHardwareCancels");
  if (!v3)
  {
    -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "requestType");

    if (v5 == 1)
    {
      if (PKHomeButtonIsAvailable())
        v6 = 6;
      else
        v6 = 10;
      -[PKPaymentAuthorizationFlowCoordinator didEncounterAuthorizationEvent:](self, "didEncounterAuthorizationEvent:", v6);
    }
    IsAvailable = PKHomeButtonIsAvailable();
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (IsAvailable)
    {
      if (v9)
      {
        v12 = 134349056;
        v13 = self;
        v10 = "PKPaymentAuthorizationFlowCoordinator (%{public}p): Dismissing because the home button was pressed";
LABEL_12:
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
      }
    }
    else if (v9)
    {
      v12 = 134349056;
      v13 = self;
      v10 = "PKPaymentAuthorizationFlowCoordinator (%{public}p): Dismissing because the home indicator was swiped";
      goto LABEL_12;
    }

    -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](self, "dismissWithReason:error:completion:", 3, 0, 0);
  }
  return !v3;
}

- (BOOL)_canPresentPaymentSheetWithEmptyPass
{
  void *v2;
  BOOL v3;

  -[PKPaymentAuthorizationFlowCoordinator paymentRequest](self, "paymentRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "requestType"))
    v3 = objc_msgSend(v2, "requestType") == 10;
  else
    v3 = 1;

  return v3;
}

- (PKPaymentAuthorizationContext)context
{
  return self->_context;
}

- (PKPaymentAuthorizationFlowCoordinatorDelegate)delegate
{
  return (PKPaymentAuthorizationFlowCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentAuthorizationScenePresenter)scenePresenter
{
  return (PKPaymentAuthorizationScenePresenter *)objc_loadWeakRetained((id *)&self->_scenePresenter);
}

- (void)setScenePresenter:(id)a3
{
  objc_storeWeak((id *)&self->_scenePresenter, a3);
}

- (NSXPCConnection)hostConnection
{
  return self->_hostConnection;
}

- (void)setHostConnection:(id)a3
{
  objc_storeStrong((id *)&self->_hostConnection, a3);
}

- (void)setDefaultService:(id)a3
{
  objc_storeStrong((id *)&self->_defaultService, a3);
}

- (void)setInAppPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPaymentService, a3);
}

- (void)setPeerPaymentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
}

- (void)setDismissalTaskProgressTracker:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalTaskProgressTracker, a3);
}

- (BOOL)dismissAfterPaymentSetup
{
  return self->_dismissAfterPaymentSetup;
}

- (void)setDismissAfterPaymentSetup:(BOOL)a3
{
  self->_dismissAfterPaymentSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalTaskProgressTracker, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_inAppPaymentService, 0);
  objc_storeStrong((id *)&self->_defaultService, 0);
  objc_storeStrong((id *)&self->_hostConnection, 0);
  objc_destroyWeak((id *)&self->_scenePresenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_paymentInterface, 0);
  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, 0);
}

@end
