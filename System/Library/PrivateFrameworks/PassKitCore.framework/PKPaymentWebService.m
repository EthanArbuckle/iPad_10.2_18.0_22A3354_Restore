@implementation PKPaymentWebService

- (BOOL)needsConfiguration
{
  return -[PKPaymentWebService needsConfigurationWithSupportedRegionTimeInterval:unsupportedRegionTimeInterval:](self, "needsConfigurationWithSupportedRegionTimeInterval:unsupportedRegionTimeInterval:", 3600.0, 3600.0);
}

- (BOOL)needsConfigurationWithSupportedRegionTimeInterval:(double)a3 unsupportedRegionTimeInterval:(double)a4
{
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  _BOOL4 v18;
  unint64_t v19;
  __CFString *v20;
  NSObject *v21;
  const char *v22;
  double v23;
  const __CFString *v24;
  int v26;
  const __CFString *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PKPaymentWebService context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "configuration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Configuration parameters not set - Configuration needs update", (uint8_t *)&v26, 2u);
      }
      LOBYTE(v18) = 1;
      goto LABEL_34;
    }
    -[PKPaymentWebServiceTargetDeviceProtocol deviceRegion](self->_targetDevice, "deviceRegion");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject heroImageManifestURLForRegion:](v9, "heroImageManifestURLForRegion:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[PKPaymentHeroImageManifest manifestFileExistsForRegion:](PKPaymentHeroImageManifest, "manifestFileExistsForRegion:", v10);

      if (!v13)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          v17 = "Hero image manifest file does not exist - Configuration needs update";
          goto LABEL_21;
        }
LABEL_22:
        LOBYTE(v18) = 1;
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
    }
    -[NSObject configurationURL](v9, "configurationURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = PKStockholmForceConfigUpdate(v14, objc_msgSend(v7, "devSigned"), -[PKPaymentWebService _isSandboxAccount](self, "_isSandboxAccount"));

    if (v15)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        v17 = "Forcing config update - Configuration needs update";
LABEL_21:
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v26, 2u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    v19 = -[PKPaymentWebService paymentSetupSupportedInRegion](self, "paymentSetupSupportedInRegion");
    if (v19)
    {
      if (v19 == 1)
      {
        objc_msgSend(v8, "dateByAddingTimeInterval:", a3);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PKLogFacilityTypeGetObject(6uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138412546;
          v27 = v20;
          v28 = 2050;
          v29 = (unint64_t)a3;
          v22 = "Region supported, next date for region configuration check: %@ used refresh interval: %{public}lu";
          goto LABEL_25;
        }
LABEL_26:

        -[NSObject timeIntervalSinceDate:](v16, "timeIntervalSinceDate:", v20);
        v18 = v23 > 0.0;

LABEL_28:
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v24 = CFSTR("NO");
          if (v18)
            v24 = CFSTR("YES");
          v26 = 138543362;
          v27 = v24;
          _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Needs updating? %{public}@", (uint8_t *)&v26, 0xCu);
        }

        goto LABEL_33;
      }
      if (v19 != 2)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        v18 = 0;
        goto LABEL_28;
      }
    }
    objc_msgSend(v8, "dateByAddingTimeInterval:", a4);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412546;
      v27 = v20;
      v28 = 2050;
      v29 = (unint64_t)a4;
      v22 = "Region unsupported, next date for region configuration check: %@ used refresh value in the configuration: %{public}lu";
LABEL_25:
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v26, 0x16u);
      goto LABEL_26;
    }
    goto LABEL_26;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Web service never configured - Configuration needs update", (uint8_t *)&v26, 2u);
  }
  LOBYTE(v18) = 1;
LABEL_35:

  return v18;
}

- (BOOL)_isSandboxAccount
{
  void *v2;
  char v3;

  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSandboxAccount");

  return v3;
}

- (id)_appleAccountInformation
{
  return (id)-[PKPaymentWebServiceTargetDeviceProtocol appleAccountInformation](self->_targetDevice, "appleAccountInformation");
}

+ (id)sharedService
{
  void *v2;
  PKPaymentService *v3;
  void *v4;
  PKPaymentWebService *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v2 = (void *)qword_1EE1C5700;
  if (!qword_1EE1C5700)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_33);
    if (!qword_1EE1C5700)
    {
      v3 = objc_alloc_init(PKPaymentService);
      -[PKPaymentService sharedPaymentWebServiceContext](v3, "sharedPaymentWebServiceContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = [PKPaymentWebService alloc];
        +[PKPaymentWebServiceTargetDevice localTargetDevice](PKPaymentWebServiceTargetDevice, "localTargetDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKSharedPaymentWebServiceArchiver sharedPaymentWebServiceArchiver](PKSharedPaymentWebServiceArchiver, "sharedPaymentWebServiceArchiver");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[PKPaymentWebService initWithContext:targetDevice:archiver:tapToRadarDelegate:](v5, "initWithContext:targetDevice:archiver:tapToRadarDelegate:", v4, v6, v7, v3);
        v9 = (void *)qword_1EE1C5700;
        qword_1EE1C5700 = v8;

        objc_msgSend((id)qword_1EE1C5700, "setSharedService:", 1);
      }
      else
      {
        PKLogFacilityTypeGetObject(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18FC92000, v10, OS_LOG_TYPE_ERROR, "Error: Failed to get the shared payment web service context.", buf, 2u);
        }

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_33);
    v2 = (void *)qword_1EE1C5700;
    if (!qword_1EE1C5700)
    {
      PKLogFacilityTypeGetObject(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_18FC92000, v11, OS_LOG_TYPE_ERROR, "Error: Failed to get the shared payment web service, therefore +[PKPaymentWebService sharedService] is not available. This is likely an entitlements issue or passd hasn't initialized yet.", v13, 2u);
      }

      v2 = (void *)qword_1EE1C5700;
    }
  }
  return v2;
}

- (void)setSharedService:(BOOL)a3
{
  id v4;

  self->_sharedService = a3;
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:suspensionBehavior:", self, sel_sharedPaymentServiceChanged_, CFSTR("PDSharedPaymentWebServiceDidChangeNotification"), 0, 2);

}

- (unint64_t)paymentSetupSupportedInRegion
{
  os_unfair_lock_s *p_lock;
  uint64_t paymentSupportInRegion;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint8_t v10[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  paymentSupportInRegion = self->_paymentSupportInRegion;
  if (!paymentSupportInRegion || !self->_sharedService)
  {
    paymentSupportInRegion = -[PKPaymentWebServiceTargetDeviceProtocol paymentSupportedInCurrentRegionForWebService:](self->_targetDevice, "paymentSupportedInCurrentRegionForWebService:", self);
    self->_paymentSupportInRegion = paymentSupportInRegion;
  }
  os_unfair_lock_unlock(p_lock);
  if (paymentSupportInRegion == 1)
  {
    -[PKPaymentWebServiceTargetDeviceProtocol deviceRegion](self->_targetDevice, "deviceRegion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "contextMeetsProvisioningEnablementPercentageThresholdForRegion:", v5);

    if ((v7 & 1) != 0)
    {
      paymentSupportInRegion = 1;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Payment setup is supported in region, however region has a provisioning enablement percentage specified and our current context does not meet it. Forcing paymentSetupSupportedInRegion to PKPaymentSupportInRegionNotSupported.", v10, 2u);
      }

      paymentSupportInRegion = 2;
    }

  }
  return paymentSupportInRegion;
}

- (PKPaymentWebServiceContext)context
{
  os_unfair_lock_s *p_contextLock;
  PKPaymentWebServiceContext *v4;

  p_contextLock = &self->_contextLock;
  os_unfair_lock_lock(&self->_contextLock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_contextLock);
  return v4;
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return self->_targetDevice;
}

- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5 tapToRadarDelegate:(id)a6
{
  id v11;
  PKPaymentWebService *v12;
  PKPaymentWebService *v13;

  v11 = a5;
  v12 = -[PKPaymentWebService initWithContext:targetDevice:tapToRadarDelegate:](self, "initWithContext:targetDevice:tapToRadarDelegate:", a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_archiver, a5);

  return v13;
}

- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 tapToRadarDelegate:(id)a5
{
  id v9;
  id v10;
  PKPaymentWebService *v11;
  PKPaymentWebService *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *passesByLocalURL;
  dispatch_queue_t v15;
  OS_dispatch_queue *backgroundDownloadQueue;
  NSOperationQueue *v17;
  NSOperationQueue *backgroundSessionDelegateQueue;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *backgroundQueue;
  NSMutableSet *v22;
  NSMutableSet *activeRegistrationTasks;
  void *v24;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentWebService;
  v11 = -[PKWebService initWithTapToRadarDelegate:](&v26, sel_initWithTapToRadarDelegate_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    objc_storeStrong((id *)&v12->_targetDevice, a4);
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_delegateLock._os_unfair_lock_opaque = 0;
    v12->_contextLock._os_unfair_lock_opaque = 0;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    passesByLocalURL = v12->_passesByLocalURL;
    v12->_passesByLocalURL = v13;

    v15 = dispatch_queue_create("background download session queue", 0);
    backgroundDownloadQueue = v12->_backgroundDownloadQueue;
    v12->_backgroundDownloadQueue = (OS_dispatch_queue *)v15;

    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    backgroundSessionDelegateQueue = v12->_backgroundSessionDelegateQueue;
    v12->_backgroundSessionDelegateQueue = v17;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v12->_backgroundSessionDelegateQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](v12->_backgroundSessionDelegateQueue, "setUnderlyingQueue:", v12->_backgroundDownloadQueue);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.passkit.paymentwebservice.background", v19);
    backgroundQueue = v12->_backgroundQueue;
    v12->_backgroundQueue = (OS_dispatch_queue *)v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeRegistrationTasks = v12->_activeRegistrationTasks;
    v12->_activeRegistrationTasks = v22;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel__regionChanged, *MEMORY[0x1E0C99720], 0);

  }
  return v12;
}

- (int64_t)logFacilityType
{
  return 6;
}

- (unint64_t)registerAuxiliaryCapabilityWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18[2];
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    objc_initWeak(location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke;
    v14[3] = &unk_1E2AC2968;
    objc_copyWeak(v18, location);
    v17 = v7;
    v15 = v6;
    v16 = v10;
    v18[1] = v8;
    -[PKPaymentWebService _auxiliaryRegistrationServiceURLForRequest:completion:](self, "_auxiliaryRegistrationServiceURLForRequest:completion:", v15, v14);

    objc_destroyWeak(v18);
    objc_destroyWeak(location);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x1CuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Missing deviceID", (uint8_t *)location, 2u);
    }

    if (v7)
    {
      -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v12);

    }
  }

  return (unint64_t)v8;
}

void __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (!v14)
      goto LABEL_9;
    v15 = *(void (**)(void))(v14 + 16);
LABEL_8:
    v15();
    goto LABEL_9;
  }
  if (!v5)
  {
    v16 = *(_QWORD *)(a1 + 48);
    if (!v16)
      goto LABEL_9;
    v15 = *(void (**)(void))(v16 + 16);
    goto LABEL_8;
  }
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1 + 64);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke_2;
  v17[3] = &unk_1E2AC2940;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v8, "performRequest:taskIdentifier:completionHandler:", v12, v13, v17);

  objc_destroyWeak(&v19);
LABEL_9:

}

void __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__5;
    v26 = __Block_byref_object_dispose__5;
    v27 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke_7;
    v19 = &unk_1E2AC2918;
    v21 = &v22;
    v11 = v7;
    v20 = v11;
    v12 = objc_msgSend(WeakRetained, "_auxiliaryCapabilityRegisterResultForResponse:error:successHandler:", v8, v9, &v16);
    v13 = v12;
    if (!v9 && v12 != 1)
    {
      objc_msgSend(WeakRetained, "_errorWithResult:data:", v12, v11, v16, v17, v18, v19);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v23[5], v9);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v15 + 16))(v15, 0, 0, 0);
  }

}

BOOL __106__PKPaymentWebService_PKAuxiliaryCapabilityWebService__registerAuxiliaryCapabilityWithRequest_completion___block_invoke_7(uint64_t a1)
{
  PKAuxiliaryCapabilityRegisterResponse *v2;
  uint64_t v3;
  void *v4;

  v2 = -[PKAuxiliaryCapabilityRegisterResponse initWithData:]([PKAuxiliaryCapabilityRegisterResponse alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)_auxiliaryCapabilityRegisterResultForResponse:(id)a3 error:(id)a4 successHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t (**v9)(_QWORD);
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (uint64_t (**)(_QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v8)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ error: %@", (uint8_t *)&v15, 0x16u);

      }
    }
    goto LABEL_8;
  }
  if ((unint64_t)(objc_msgSend(v7, "statusCode") - 200) > 0x63)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = v9[2](v9);
LABEL_9:

  return v10;
}

- (unint64_t)checkAuxiliaryCapabilityRegistrationStateWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18[2];
  id location[2];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = -[PKWebService nextTaskID](self, "nextTaskID");
    -[PKPaymentWebService context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
      objc_initWeak(location, self);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke;
      v14[3] = &unk_1E2AC2968;
      objc_copyWeak(v18, location);
      v17 = v7;
      v15 = v6;
      v16 = v10;
      v18[1] = v8;
      -[PKPaymentWebService _auxiliaryRegistrationServiceURLForRequest:completion:](self, "_auxiliaryRegistrationServiceURLForRequest:completion:", v15, v14);

      objc_destroyWeak(v18);
      objc_destroyWeak(location);
    }
    else
    {
      PKLogFacilityTypeGetObject(0x1CuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Missing deviceID", (uint8_t *)location, 2u);
      }

      -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v12);

    }
  }
  else
  {
    v8 = 0;
  }

  return (unint64_t)v8;
}

void __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (!v14)
      goto LABEL_9;
    v15 = *(void (**)(void))(v14 + 16);
LABEL_8:
    v15();
    goto LABEL_9;
  }
  if (!v5)
  {
    v16 = *(_QWORD *)(a1 + 48);
    if (!v16)
      goto LABEL_9;
    v15 = *(void (**)(void))(v16 + 16);
    goto LABEL_8;
  }
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1 + 64);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke_2;
  v17[3] = &unk_1E2AC2940;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v8, "performRequest:taskIdentifier:completionHandler:", v12, v13, v17);

  objc_destroyWeak(&v19);
LABEL_9:

}

void __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__5;
    v19[4] = __Block_byref_object_dispose__5;
    v20 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke_3;
    v16 = &unk_1E2AC2918;
    v18 = v19;
    v11 = v7;
    v17 = v11;
    v12 = objc_msgSend(WeakRetained, "_resultForResponse:error:successHandler:", v8, v9, &v13);
    if (!v9 && v12 != 1)
    {
      objc_msgSend(WeakRetained, "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

BOOL __120__PKPaymentWebService_PKAuxiliaryCapabilityWebService__checkAuxiliaryCapabilityRegistrationStateWithRequest_completion___block_invoke_3(uint64_t a1)
{
  PKAuxiliaryCapabilityRegistrationStateResponse *v2;
  uint64_t v3;
  void *v4;

  v2 = -[PKAuxiliaryCapabilityRegistrationStateResponse initWithData:]([PKAuxiliaryCapabilityRegistrationStateResponse alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)auxiliaryCapabilityKeyCreationMetadataWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18[2];
  id location[2];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = -[PKWebService nextTaskID](self, "nextTaskID");
    -[PKPaymentWebService context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
      objc_initWeak(location, self);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke;
      v14[3] = &unk_1E2AC2968;
      objc_copyWeak(v18, location);
      v17 = v7;
      v15 = v6;
      v16 = v10;
      v18[1] = v8;
      -[PKPaymentWebService _auxiliaryRegistrationServiceURLForRequest:completion:](self, "_auxiliaryRegistrationServiceURLForRequest:completion:", v15, v14);

      objc_destroyWeak(v18);
      objc_destroyWeak(location);
    }
    else
    {
      PKLogFacilityTypeGetObject(0x1CuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Missing deviceID", (uint8_t *)location, 2u);
      }

      -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (unint64_t)v8;
}

void __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (!v14)
      goto LABEL_9;
    v15 = *(void (**)(void))(v14 + 16);
LABEL_8:
    v15();
    goto LABEL_9;
  }
  if (!v5)
  {
    v16 = *(_QWORD *)(a1 + 48);
    if (!v16)
      goto LABEL_9;
    v15 = *(void (**)(void))(v16 + 16);
    goto LABEL_8;
  }
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1 + 64);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke_2;
  v17[3] = &unk_1E2AC2940;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v8, "performRequest:taskIdentifier:completionHandler:", v12, v13, v17);

  objc_destroyWeak(&v19);
LABEL_9:

}

void __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__5;
    v19[4] = __Block_byref_object_dispose__5;
    v20 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke_3;
    v16 = &unk_1E2AC2918;
    v18 = v19;
    v11 = v7;
    v17 = v11;
    v12 = objc_msgSend(WeakRetained, "_resultForResponse:error:successHandler:", v8, v9, &v13);
    if (!v9 && v12 != 1)
    {
      objc_msgSend(WeakRetained, "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

BOOL __117__PKPaymentWebService_PKAuxiliaryCapabilityWebService__auxiliaryCapabilityKeyCreationMetadataWithRequest_completion___block_invoke_3(uint64_t a1)
{
  PKAuxiliaryCapabilityKeyCreationMetadataResponse *v2;
  uint64_t v3;
  void *v4;

  v2 = -[PKAuxiliaryCapabilityKeyCreationMetadataResponse initWithData:]([PKAuxiliaryCapabilityKeyCreationMetadataResponse alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)fetchBarcodesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    objc_initWeak(&location, self);
    objc_msgSend(v6, "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "passTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "regionForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "partnerServiceURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v14, v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __92__PKPaymentWebService_PKAuxiliaryCapabilityWebService__fetchBarcodesWithRequest_completion___block_invoke;
    v19[3] = &unk_1E2AC2940;
    objc_copyWeak(&v21, &location);
    v20 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v16, v8, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v17);

  }
  return v8;
}

void __92__PKPaymentWebService_PKAuxiliaryCapabilityWebService__fetchBarcodesWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__5;
    v26 = __Block_byref_object_dispose__5;
    v27 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __92__PKPaymentWebService_PKAuxiliaryCapabilityWebService__fetchBarcodesWithRequest_completion___block_invoke_2;
    v19 = &unk_1E2AC2918;
    v21 = &v22;
    v11 = v7;
    v20 = v11;
    v12 = objc_msgSend(WeakRetained, "_resultForResponse:error:successHandler:", v8, v9, &v16);
    v13 = v12;
    if (!v9 && v12 != 1)
    {
      objc_msgSend(WeakRetained, "_errorWithResult:data:", v12, v11, v16, v17, v18, v19);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v23[5], v9);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v15 + 16))(v15, 0, 0, 0);
  }

}

BOOL __92__PKPaymentWebService_PKAuxiliaryCapabilityWebService__fetchBarcodesWithRequest_completion___block_invoke_2(uint64_t a1)
{
  PKAuxiliaryCapabilityFetchBarcodeResponse *v2;
  uint64_t v3;
  void *v4;

  v2 = -[PKAuxiliaryCapabilityFetchBarcodeResponse initWithData:]([PKAuxiliaryCapabilityFetchBarcodeResponse alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)_auxiliaryRegistrationServiceURLForRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  void (**v20)(id, uint64_t, _QWORD);
  uint64_t *v21;
  uint8_t buf[16];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v8, "primaryRegionIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  objc_msgSend(v8, "regionForIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "partnerServiceURL");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  v15 = v24[5];
  if (v15)
  {
    v7[2](v7, v15, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x1CuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Context missing partnerServiceURL, reregistering", buf, 2u);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __110__PKPaymentWebService_PKAuxiliaryCapabilityWebService___auxiliaryRegistrationServiceURLForRequest_completion___block_invoke;
    v17[3] = &unk_1E2AC2990;
    v21 = &v23;
    v18 = v8;
    v19 = v13;
    v20 = v7;
    -[PKPaymentWebService registerDeviceWithCompletion:](self, "registerDeviceWithCompletion:", v17);

  }
  _Block_object_dispose(&v23, 8);

}

void __110__PKPaymentWebService_PKAuxiliaryCapabilityWebService___auxiliaryRegistrationServiceURLForRequest_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "regionForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "partnerServiceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "primaryRegion");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "partnerServiceURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);
  if (!v4)
  {

  }
  v7 = a1 + 48;
  v6 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 8) + 8) + 40))
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2938];
    v12[0] = CFSTR("partnerServiceURL was nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v10);

  }
}

- (unint64_t)_performPaymentOfferRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  _QWORD v13[5];
  id v14;
  Class v15;

  v8 = a5;
  v9 = a3;
  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PKPaymentWebService_PaymentOffers___performPaymentOfferRequest_responseClass_completion___block_invoke;
  v13[3] = &unk_1E2AC2A10;
  v14 = v8;
  v15 = a4;
  v13[4] = self;
  v11 = v8;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v10, v13);

  return v10;
}

void __91__PKPaymentWebService_PaymentOffers___performPaymentOfferRequest_responseClass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v10 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PKPaymentWebService_PaymentOffers___performPaymentOfferRequest_responseClass_completion___block_invoke_7;
  v15[3] = &unk_1E2AC29E8;
  v11 = *(_QWORD *)(a1 + 48);
  v17 = &v19;
  v18 = v11;
  v12 = v7;
  v16 = v12;
  v13 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, v15);
  if (!v9 && v13 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v13, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v20[5], v9);

  _Block_object_dispose(&v19, 8);
}

BOOL __91__PKPaymentWebService_PaymentOffers___performPaymentOfferRequest_responseClass_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 48), "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)paymentOfferCatalogWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performPaymentOfferRequest:responseClass:completion:](self, "_performPaymentOfferRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)paymentOffersDynamicContentWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performPaymentOfferRequest:responseClass:completion:](self, "_performPaymentOfferRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)paymentOffersWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performPaymentOfferRequest:responseClass:completion:](self, "_performPaymentOfferRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)cancelPaymentOfferSessionWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performPaymentOfferRequest:responseClass:completion:](self, "_performPaymentOfferRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)paymentRewardsBalancesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performPaymentOfferRequest:responseClass:completion:](self, "_performPaymentOfferRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)paymentRewardsRedemptionsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performPaymentOfferRequest:responseClass:completion:](self, "_performPaymentOfferRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)transferEligibilityWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)scheduleTransferWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  PKPaymentWebService *v14;
  id v15;
  unint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PKPaymentWebService_Savings__scheduleTransferWithRequest_completion___block_invoke;
  v12[3] = &unk_1E2AC4FB0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = v8;
  v9 = v7;
  v10 = v6;
  -[PKPaymentWebService _applePayTrustPublicKeyHashWithCompletion:](self, "_applePayTrustPublicKeyHashWithCompletion:", v12);

  return v8;
}

void __71__PKPaymentWebService_Savings__scheduleTransferWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPublicKeyHash:", a2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_appleAccountInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithAppleAccountInformation:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_performAccountApplePayTrustProtocolRequest:originalRequest:taskID:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (unint64_t)transfersWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountBalanceHistoryWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)dailyCashEligibilityWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)savingsAccountStatementsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountTaxFormsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)savingsAccountUserInfoWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountReportFraudEventWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)discoveryManifestWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPaymentConfigurationRequest *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKCurrentRegion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "discoveryManifestURLForRegion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(PKPaymentConfigurationRequest);
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
    -[PKPaymentConfigurationRequest _requestWithServiceURL:](v10, "_requestWithServiceURL:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x10uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Fetching Discovery Manifest at URL: %@...", buf, 0xCu);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__PKPaymentWebService_PKDiscoveryWebService__discoveryManifestWithCompletion___block_invoke;
    v15[3] = &unk_1E2AC5308;
    v16 = v4;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v5, v15);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Discovery Manifest URL is nil. Not updating.", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

  return v5;
}

void __78__PKPaymentWebService_PKDiscoveryWebService__discoveryManifestWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKDiscoveryManifestResponse *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a2;
  v9 = -[PKDiscoveryManifestResponse initWithData:]([PKDiscoveryManifestResponse alloc], "initWithData:", v8);

  if (a3)
  {
    -[PKDiscoveryManifestResponse manifest](v9, "manifest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "version");
      PKLogFacilityTypeGetObject(0x10uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134217984;
        v15 = v12;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Discovery Manifest version is %ld", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (unint64_t)discoveryBundleForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  PKPaymentConfigurationRequest *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  v9 = objc_alloc_init(PKPaymentConfigurationRequest);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v9);
  -[PKPaymentConfigurationRequest _requestWithServiceURL:](v9, "_requestWithServiceURL:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v10, v8, v6);
  return v8;
}

- (unint64_t)vpanNonceForPaymentPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  PKPaymentCredentialNonceRequest *v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  if (v7)
  {
    if (v6)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Getting nonce for VPAN", buf, 2u);
        }

        -[PKPaymentWebService context](self, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "primaryRegion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "paymentServicesURL");
        v16 = objc_claimAutoreleasedReturnValue();

        v17 = -[PKPaymentCredentialNonceRequest initWithPaymentPass:deviceIdentifier:]([PKPaymentCredentialNonceRequest alloc], "initWithPaymentPass:deviceIdentifier:", v6, v9);
        -[PKPaymentCredentialNonceRequest _urlRequestWithServiceURL:appleAccountInformation:](v17, "_urlRequestWithServiceURL:appleAccountInformation:", v16, v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __64__PKPaymentWebService_VPAN__vpanNonceForPaymentPass_completion___block_invoke;
        v21[3] = &unk_1E2AC5308;
        v22 = v7;
        -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v18, v11, v21);

        goto LABEL_16;
      }
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Can't retrieve VPAN nonce without a deviceID", buf, 2u);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Can't retrieve VPAN nonce without a pass", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, NSObject *))v7 + 2))(v7, 0, v16);
    goto LABEL_16;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Can't retrieve VPAN nonce without a completion", buf, 2u);
  }
LABEL_16:

  return v11;
}

void __64__PKPaymentWebService_VPAN__vpanNonceForPaymentPass_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  PKVPANNonceResponse *v10;

  v6 = a4;
  v7 = a2;
  v10 = -[PKVPANNonceResponse initWithData:]([PKVPANNonceResponse alloc], "initWithData:", v7);

  v8 = *(_QWORD *)(a1 + 32);
  -[PKVPANNonceResponse nonce](v10, "nonce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v6);

}

- (unint64_t)vpanPaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 merchantHost:(id)a7 regenerate:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  unint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  PKPaymentWebService *v48;
  id v49;
  unint64_t v50;
  uint8_t buf[16];

  v9 = a8;
  v15 = a3;
  v42 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v41 = a9;
  -[PKPaymentWebService context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PKWebService nextTaskID](self, "nextTaskID");
  v23 = v22;
  if (v20)
  {
    v38 = v20;
    v39 = v22;
    v40 = v16;
    -[PKPaymentWebService context](self, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "primaryRegion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "paymentServicesURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v27 = (objc_class *)objc_opt_class();

      v28 = 0;
      v29 = v42;
      v30 = v40;
    }
    else
    {
      v27 = (objc_class *)objc_opt_class();
      v29 = v42;
      v30 = v40;
      v28 = v18;
    }
    v43 = v28;
    v34 = (void *)objc_msgSend([v27 alloc], "initWithPaymentPass:vpanIdentifier:deviceIdentifier:nonce:encryptionFields:merchantHost:", v15, v29, v38, v30, v17, v28);
    -[PKPaymentWebService _paymentDevice](self, "_paymentDevice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke;
    v44[3] = &unk_1E2ACFB80;
    v45 = v34;
    v46 = v26;
    v47 = v21;
    v48 = self;
    v23 = v39;
    v50 = v39;
    v33 = v41;
    v49 = v41;
    v36 = v26;
    v32 = v34;
    objc_msgSend(v35, "rewrapDataWithCompletionHandler:", v44);

    v16 = v40;
    v20 = v38;
    v18 = v43;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Error: Trying to get VPAN credentials without a deviceID. Device registration is necessary.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v41;
    (*((void (**)(id, _QWORD, id))v41 + 2))(v41, 0, v32);
    v29 = v42;
  }

  return v23;
}

void __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke_2;
  v9[3] = &unk_1E2ACB750;
  v8 = (void *)a1[8];
  v7 = a1[9];
  v9[4] = v6;
  v11 = v7;
  v10 = v8;
  objc_msgSend(v3, "_urlRequestWithServiceURL:rewrapData:appleAccountInformation:webService:completion:", v4, a2, v5, v6, v9);

}

void __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke_3;
  v5[3] = &unk_1E2AC5308;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performRequest:taskIdentifier:completionHandler:", a2, v4, v5);

}

void __139__PKPaymentWebService_VPAN__vpanPaymentCredentialsForPaymentPass_vpanIdentifier_nonce_encryptionFields_merchantHost_regenerate_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  PKVPANPaymentCredentialResponse *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  v9 = v7;
  if (!v9 || !v11 || v8 || objc_msgSend(v9, "statusCode") != 200)
    goto LABEL_8;
  v10 = -[PKVPANPaymentCredentialResponse initWithData:]([PKVPANPaymentCredentialResponse alloc], "initWithData:", v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_9:
}

- (unint64_t)vpanPaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 merchantHost:(id)a7 completion:(id)a8
{
  return -[PKPaymentWebService vpanPaymentCredentialsForPaymentPass:vpanIdentifier:nonce:encryptionFields:merchantHost:regenerate:completion:](self, "vpanPaymentCredentialsForPaymentPass:vpanIdentifier:nonce:encryptionFields:merchantHost:regenerate:completion:", a3, a4, a5, a6, a7, 0, a8);
}

- (unint64_t)regeneratePaymentCredentialsForPaymentPass:(id)a3 vpanIdentifier:(id)a4 nonce:(id)a5 encryptionFields:(id)a6 completion:(id)a7
{
  return -[PKPaymentWebService vpanPaymentCredentialsForPaymentPass:vpanIdentifier:nonce:encryptionFields:merchantHost:regenerate:completion:](self, "vpanPaymentCredentialsForPaymentPass:vpanIdentifier:nonce:encryptionFields:merchantHost:regenerate:completion:", a3, a4, a5, a6, 0, 1, a7);
}

- (unint64_t)virtualCardPaymentSessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PKVPANPaymentSessionRequest *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v4 = a3;
  -[PKPaymentWebService context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paymentServicesURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v12 = -[PKVPANPaymentSessionRequest initWithDeviceIdentifier:]([PKVPANPaymentSessionRequest alloc], "initWithDeviceIdentifier:", v6);
    -[PKVPANPaymentSessionRequest _urlRequestWithServiceURL:appleAccountInformation:](v12, "_urlRequestWithServiceURL:appleAccountInformation:", v11, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__PKPaymentWebService_VPAN__virtualCardPaymentSessionWithCompletion___block_invoke;
    v16[3] = &unk_1E2AC5308;
    v17 = v4;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error: Trying to start a VPAN session without a deviceID. Device registration is necessary.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v12 = (PKVPANPaymentSessionRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, PKVPANPaymentSessionRequest *))v4 + 2))(v4, 0, v12);
  }

  return v8;
}

void __69__PKPaymentWebService_VPAN__virtualCardPaymentSessionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  PKPaymentMerchantSession *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = -[PKPaymentMerchantSession initWithDictionary:]([PKPaymentMerchantSession alloc], "initWithDictionary:", v10);
        v13 = *(_QWORD *)(a1 + 32);
        if (v12)
        {
          (*(void (**)(uint64_t, PKPaymentMerchantSession *, _QWORD))(v13 + 16))(v13, v12, 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2005, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v15);

        }
      }
      else
      {
        v14 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2005, 0);
        v12 = (PKPaymentMerchantSession *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, PKPaymentMerchantSession *))(v14 + 16))(v14, 0, v12);
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (unint64_t)accountsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  objc_msgSend(v7, "accountServicesURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:AppleAccountInformation:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PKPaymentWebService_PKAccountWebService__accountsWithRequest_completion___block_invoke;
  v15[3] = &unk_1E2AD4078;
  v16 = v6;
  v12 = v6;
  v13 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v10, v11, v15);

  return v13;
}

uint64_t __75__PKPaymentWebService_PKAccountWebService__accountsWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)accountWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)deleteAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountActionWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountTermsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountTermsDataWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountPassDetailsRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:deviceIdentifier:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v11, objc_opt_class(), v6);
  return v12;
}

- (unint64_t)accountBankLookupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountStatementsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountDocumentActionWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)schedulePaymentWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  PKPaymentWebService *v14;
  id v15;
  unint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__PKPaymentWebService_PKAccountWebService__schedulePaymentWithRequest_completion___block_invoke;
  v12[3] = &unk_1E2AC4FB0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = v8;
  v9 = v7;
  v10 = v6;
  -[PKPaymentWebService _applePayTrustPublicKeyHashWithCompletion:](self, "_applePayTrustPublicKeyHashWithCompletion:", v12);

  return v8;
}

void __82__PKPaymentWebService_PKAccountWebService__schedulePaymentWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPublicKeyHash:", a2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_appleAccountInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithAppleAccountInformation:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_performAccountApplePayTrustProtocolRequest:originalRequest:taskID:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (unint64_t)paymentsWithRequest:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_urlRequestWithAppleAccountInformation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKPaymentWebService _performAccountRequest:account:responseClass:completion:](self, "_performAccountRequest:account:responseClass:completion:", v12, v9, objc_opt_class(), v8);
  return v13;
}

- (unint64_t)cancelPaymentWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)fundingSourcesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)addFundingSourceWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)deleteFundingSourceWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountServiceCertificatesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)customizePhysicalCardWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)requestPhysicalCardWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  PKPaymentWebService *v14;
  id v15;
  unint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__PKPaymentWebService_PKAccountWebService__requestPhysicalCardWithRequest_completion___block_invoke;
  v12[3] = &unk_1E2AC4FB0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = v8;
  v9 = v7;
  v10 = v6;
  -[PKPaymentWebService _applePayTrustPublicKeyHashWithCompletion:](self, "_applePayTrustPublicKeyHashWithCompletion:", v12);

  return v8;
}

void __86__PKPaymentWebService_PKAccountWebService__requestPhysicalCardWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPublicKeyHash:", a2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_appleAccountInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithAppleAccountInformation:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_performOptionalAccountApplePayTrustProtocolRequest:originalRequest:taskID:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (unint64_t)physicalCardActionWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  PKPaymentWebService *v14;
  id v15;
  unint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__PKPaymentWebService_PKAccountWebService__physicalCardActionWithRequest_completion___block_invoke;
  v12[3] = &unk_1E2AC4FB0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = v8;
  v9 = v7;
  v10 = v6;
  -[PKPaymentWebService _applePayTrustPublicKeyHashWithCompletion:](self, "_applePayTrustPublicKeyHashWithCompletion:", v12);

  return v8;
}

void __85__PKPaymentWebService_PKAccountWebService__physicalCardActionWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPublicKeyHash:", a2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_appleAccountInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithAppleAccountInformation:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_performOptionalAccountApplePayTrustProtocolRequest:originalRequest:taskID:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (unint64_t)physicalCardsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountUserInfoWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountUpdateUserInfoWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountDeleteBeneficiaryWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)createVirtualCardWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)virtualCardActionWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)virtualCardListWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)virtualCardLegacyCredentialsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)virtualCardSecurityCodeActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountTransactionAnswerWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)applePayTrustSignatureRequestWithRequest:(id)a3 completion:(id)a4
{
  return -[PKPaymentWebService applePayTrustSignatureRequestWithRequest:account:completion:](self, "applePayTrustSignatureRequestWithRequest:account:completion:", a3, 0, a4);
}

- (unint64_t)applePayTrustSignatureRequestWithRequest:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_urlRequestWithAppleAccountInformation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "responseClass");
  v14 = -[PKPaymentWebService _performAccountRequest:account:responseClass:completion:](self, "_performAccountRequest:account:responseClass:completion:", v12, v9, v13, v8);

  return v14;
}

- (unint64_t)performInstallmentBindWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)performInstallmentAuthorizationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  PKPaymentWebService *v14;
  id v15;
  unint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PKPaymentWebService_PKAccountWebService__performInstallmentAuthorizationWithRequest_completion___block_invoke;
  v12[3] = &unk_1E2AC4FB0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = v8;
  v9 = v7;
  v10 = v6;
  -[PKPaymentWebService _applePayTrustPublicKeyHashWithCompletion:](self, "_applePayTrustPublicKeyHashWithCompletion:", v12);

  return v8;
}

void __98__PKPaymentWebService_PKAccountWebService__performInstallmentAuthorizationWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPublicKeyHash:", a2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_appleAccountInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithAppleAccountInformation:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_performAccountApplePayTrustProtocolRequest:originalRequest:taskID:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (unint64_t)exportTransactionDataWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:request:responseClass:completion:](self, "_performAccountRequest:request:responseClass:completion:", v9, v7, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountUsersWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)deleteAccountUserWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)updateAccountUserPreferencesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)sharedAccountCloudStoreWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)createdZoneWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)promotionsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)enhancedMerchantsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountSendReportWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)supportTopicsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)creditRecoveryPaymentPlansWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  PKPaymentWebService *v39;
  id v40;
  id v41;
  objc_super v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  objc_super v47;
  uint8_t buf[16];
  id location[2];

  v12 = a3;
  v33 = a4;
  v34 = a5;
  objc_initWeak(location, a6);
  v13 = a7;
  WeakRetained = objc_loadWeakRetained(location);
  objc_msgSend(WeakRetained, "currentRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v12, "statusCode");
  if (v16 != 301)
  {
    if (v16 == 412)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Received Status Code 412.", buf, 2u);
      }

      objc_msgSend(v12, "pk_valueForHTTPHeaderField:", CFSTR("X-Pod-Region"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebService context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "regionForIdentifier:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23
        || (objc_msgSend(v23, "trustedServiceManagerPushTopic"),
            (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v22, "primaryRegion", v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "trustedServiceManagerPushTopic");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v27 = (void *)objc_msgSend(v15, "mutableCopy", v33);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __76__PKPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke;
      v43[3] = &unk_1E2AD4758;
      v43[4] = self;
      v28 = v25;
      v44 = v28;
      objc_copyWeak(&v46, location);
      v45 = v13;
      -[PKPaymentWebService processRetryRequest:responseData:orginalRequest:completion:](self, "processRetryRequest:responseData:orginalRequest:completion:", v27, v34, v15, v43);

      objc_destroyWeak(&v46);
    }
    else if (v16 == 452)
    {
      if (self->_handlingApplePayTrustReRegister)
      {
        v17 = objc_loadWeakRetained(location);
        v42.receiver = self;
        v42.super_class = (Class)PKPaymentWebService;
        -[PKWebService handleResponse:withError:data:task:completionHandler:](&v42, sel_handleResponse_withError_data_task_completionHandler_, v12, v33, v34, v17, v13);
      }
      else
      {
        self->_handlingApplePayTrustReRegister = 1;
        PKLogFacilityTypeGetObject(6uLL);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "Received Status Code 452.", buf, 2u);
        }

        PKLogFacilityTypeGetObject(0xFuLL);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Submitting Apple Pay Trust enrollment data because of HTTP 452.", buf, 2u);
        }

        v17 = objc_loadWeakRetained(location);
        objc_msgSend(v17, "originalRequest");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentWebService _handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest:completionHandler:](self, "_handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest:completionHandler:", v32, v13);

      }
    }
    else
    {
      v29 = objc_loadWeakRetained(location);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __76__PKPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke_82;
      v35[3] = &unk_1E2AD4780;
      v40 = v13;
      v36 = v12;
      v37 = v33;
      v38 = v34;
      objc_copyWeak(&v41, location);
      v39 = self;
      -[PKPaymentWebService _registerIfNeededWithResponse:task:isRedirect:completion:](self, "_registerIfNeededWithResponse:task:isRedirect:completion:", v36, v29, 0, v35);

      objc_destroyWeak(&v41);
      v17 = v40;
    }
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(v12, "pk_valueForHTTPHeaderField:", CFSTR("Location"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(6uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Server requested redirect which was handled early. Not Reregistering.", buf, 2u);
    }

    v17 = objc_loadWeakRetained(location);
    v47.receiver = self;
    v47.super_class = (Class)PKPaymentWebService;
    -[PKWebService handleResponse:withError:data:task:completionHandler:](&v47, sel_handleResponse_withError_data_task_completionHandler_, v12, v33, v34, v17, v13);
    goto LABEL_22;
  }
  if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Received Status Code 301.", buf, 2u);
  }

  -[PKPaymentWebService _handleRetryAfterRegisterWithRequest:response:completionHandler:](self, "_handleRetryAfterRegisterWithRequest:response:completionHandler:", v15, v12, v13);
LABEL_23:

  objc_destroyWeak(location);
}

void __76__PKPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  id WeakRetained;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = (id *)(a1 + 7);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v3, "_handleRetryAfterTSMSyncForPushTopic:withRequest:taskIdentifier:completionHandler:", v4, v6, objc_msgSend(WeakRetained, "taskIdentifier"), a1[6]);

}

void __76__PKPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  objc_super v11;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v4 + 16))(v4, 0, 0, v3);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v10 = *(_QWORD *)(a1 + 64);
    v11.receiver = v8;
    v11.super_class = (Class)PKPaymentWebService;
    objc_msgSendSuper2(&v11, sel_handleResponse_withError_data_task_completionHandler_, v5, v6, v7, WeakRetained, v10);

  }
}

- (BOOL)canBypassTrustValidation
{
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentWebService;
  if (-[PKWebService canBypassTrustValidation](&v8, sel_canBypassTrustValidation))
    return 1;
  -[PKPaymentWebService context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "devSigned");

  if (v4)
  {
    PKLogFacilityTypeGetObject(2uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Allowing bypass of extended trust validation by dev-signed SE", v7, 2u);
    }

    return 1;
  }
  return 0;
}

+ (id)remoteDeviceWebService
{
  void *v2;
  id v3;
  void *v4;

  +[PKPassLibrary sharedInstanceWithRemoteLibrary](PKPassLibrary, "sharedInstanceWithRemoteLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_hasRemoteLibrary"))
  {
    v3 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_3[0]());
    objc_msgSend(v3, "watchPaymentWebService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PKPaymentWebService)initWithTapToRadarDelegate:(id)a3
{
  return -[PKPaymentWebService initWithContext:targetDevice:tapToRadarDelegate:](self, "initWithContext:targetDevice:tapToRadarDelegate:", 0, 0, a3);
}

- (PKPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5
{
  return -[PKPaymentWebService initWithContext:targetDevice:archiver:tapToRadarDelegate:](self, "initWithContext:targetDevice:archiver:tapToRadarDelegate:", a3, a4, a5, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_sharedService)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PDSharedPaymentWebServiceDidChangeNotification"), 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentWebService;
  -[PKPaymentWebService dealloc](&v5, sel_dealloc);
}

- (void)setContext:(id)a3
{
  PKPaymentWebServiceContext *v4;
  PKPaymentWebServiceContext *context;

  v4 = (PKPaymentWebServiceContext *)a3;
  os_unfair_lock_lock(&self->_contextLock);
  context = self->_context;
  self->_context = v4;

  self->_paymentSupportInRegion = 0;
  self->_registrationSupportInRegion = 0;
  os_unfair_lock_unlock(&self->_contextLock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSHashTable *delegates;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_delegateLock);
    delegates = self->_delegates;
    if (!delegates)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_delegates;
      self->_delegates = v6;

      delegates = self->_delegates;
    }
    -[NSHashTable addObject:](delegates, "addObject:", v8);
    os_unfair_lock_unlock(&self->_delegateLock);
    v4 = v8;
  }

}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_delegateLock;
  id v5;

  if (a3)
  {
    p_delegateLock = &self->_delegateLock;
    v5 = a3;
    os_unfair_lock_lock(p_delegateLock);
    -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

    os_unfair_lock_unlock(p_delegateLock);
  }
}

- (void)sharedPaymentServiceChanged:(id)a3
{
  PKPaymentService *v4;
  PKPaymentService *v5;
  _QWORD v6[4];
  PKPaymentService *v7;
  PKPaymentWebService *v8;

  if (self->_sharedService)
  {
    v4 = objc_alloc_init(PKPaymentService);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PKPaymentWebService_sharedPaymentServiceChanged___block_invoke;
    v6[3] = &unk_1E2AD47A8;
    v7 = v4;
    v8 = self;
    v5 = v4;
    -[PKPaymentService sharedPaymentWebServiceContextWithCompletion:](v5, "sharedPaymentWebServiceContextWithCompletion:", v6);

  }
}

uint64_t __51__PKPaymentWebService_sharedPaymentServiceChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_updateSharedServiceWithContext:", a2);
}

- (void)updateContextAndNotifyIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (self->_sharedService)
      -[PKPaymentWebService _updateSharedServiceWithContext:](self, "_updateSharedServiceWithContext:", v4);
    else
      -[PKPaymentWebService setContext:](self, "setContext:", v4);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[PKPaymentWebService updateContextAndNotifyIfNeeded:]";
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%s called without a context. Ignoring.", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_updateSharedServiceWithContext:(id)a3
{
  id v4;
  _BOOL4 sharedService;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sharedService = self->_sharedService;
  if (v4 && self->_sharedService)
  {
    -[PKPaymentWebService context](self, "context");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject archivedDate](v6, "archivedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(v4, "archivedDate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqualToDate:", v8),
          v8,
          v9))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        PKW3CDateStringFromDate(v7);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v17 = 136315394;
        v18 = "-[PKPaymentWebService _updateSharedServiceWithContext:]";
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "%s called, however the archivedDates matched with a value of %@. Ignoring.", (uint8_t *)&v17, 0x16u);

      }
    }
    else
    {
      -[PKPaymentWebService setContext:](self, "setContext:", v4);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("PKSharedPaymentWebServiceDidChangeNotification"), 0);

      -[NSObject configuration](v6, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v10, "postNotificationName:object:", CFSTR("PKSharedPaymentWebServiceRegionConfigurationChangedNotification"), 0);
    }

    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("on non-shared service");
    if (sharedService)
      v12 = CFSTR("without a context");
    v17 = 136315394;
    v18 = "-[PKPaymentWebService _updateSharedServiceWithContext:]";
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%s called %@. Ignoring.", (uint8_t *)&v17, 0x16u);
  }
LABEL_15:

}

- (void)_regionChanged
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Device region changed - removing region cache", v4, 2u);
  }

  -[PKPaymentWebService _resetSupportInRegionCache](self, "_resetSupportInRegionCache");
}

- (void)_resetSupportInRegionCache
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_paymentSupportInRegion = 0;
  self->_registrationSupportInRegion = 0;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)registrationSetupSupportedInRegion
{
  os_unfair_lock_s *p_lock;
  uint64_t registrationSupportInRegion;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  registrationSupportInRegion = self->_registrationSupportInRegion;
  if (!registrationSupportInRegion || !self->_sharedService)
  {
    registrationSupportInRegion = -[PKPaymentWebServiceTargetDeviceProtocol registrationSupportedInCurrentRegionForWebService:](self->_targetDevice, "registrationSupportedInCurrentRegionForWebService:", self);
    self->_registrationSupportInRegion = registrationSupportInRegion;
  }
  os_unfair_lock_unlock(p_lock);
  return registrationSupportInRegion == 1;
}

- (BOOL)needsRegistration
{
  return -[PKPaymentWebService _needsRegistrationShouldCheckSecureElementOwnership:](self, "_needsRegistrationShouldCheckSecureElementOwnership:", 1);
}

- (BOOL)_needsRegistrationShouldCheckSecureElementOwnership:(BOOL)a3
{
  return -[PKPaymentWebService _needsRegistrationForBrokerURL:shouldCheckSecureElementOwnership:](self, "_needsRegistrationForBrokerURL:shouldCheckSecureElementOwnership:", 0, a3);
}

- (BOOL)needsRegistrationForBrokerURL:(id)a3
{
  return -[PKPaymentWebService _needsRegistrationForBrokerURL:shouldCheckSecureElementOwnership:](self, "_needsRegistrationForBrokerURL:shouldCheckSecureElementOwnership:", a3, 1);
}

- (BOOL)_needsRegistrationForBrokerURL:(id)a3 shouldCheckSecureElementOwnership:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  char v29;
  const __CFString *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  const __CFString *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  const __CFString *v44;
  void *v45;
  PKPaymentWebService *v47;
  _BOOL4 v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v4 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentWebService context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "registrationType");
  if (v8 == 2)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "PKPaymentWebService: needs registration - registration type unknown.";
      goto LABEL_7;
    }
LABEL_8:
    v12 = 1;
    goto LABEL_42;
  }
  v9 = v8;
  if (!v8)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "PKPaymentWebService: needs registration - never registered.";
LABEL_7:
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSObject addObject:](v10, "addObject:", CFSTR("Has Previously Registered: YES"));
  v49 = v9;
  v50 = v7;
  v47 = self;
  v48 = v4;
  if (v6)
  {
    objc_msgSend(v7, "regions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v52 != v17)
            objc_enumerationMutation(v13);
          objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "brokerURL");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            v22 = objc_msgSend(v6, "isEqual:", v20);

            if ((v22 & 1) != 0)
            {
              objc_msgSend(v19, "certificates");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "count") != 0;

              v16 |= v24;
            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }
    v31 = objc_alloc(MEMORY[0x1E0CB3940]);
    if ((v16 & 1) != 0)
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    v33 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("Has Certificates: %@"), v32);
    -[NSObject addObject:](v10, "addObject:", v33);

    v29 = v16 ^ 1;
  }
  else
  {
    objc_msgSend(v7, "primaryRegion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "certificates");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    v29 = v27 == 0;
    if (v27)
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    v13 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("Has Certificates: %@"), v30);
    -[NSObject addObject:](v10, "addObject:", v13);
  }

  if (v48)
  {
    -[PKPaymentWebService targetDevice](v47, "targetDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "secureElementOwnershipStateForCurrentUser");

    v36 = objc_alloc(MEMORY[0x1E0CB3940]);
    if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v37 = CFSTR("YES");
    else
      v37 = CFSTR("NO");
    v38 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("User Owns Secure Element: %@"), v37);
    -[NSObject addObject:](v10, "addObject:", v38);

    v29 |= (v35 & 0xFFFFFFFFFFFFFFFELL) != 2;
  }
  else
  {
    -[NSObject addObject:](v10, "addObject:", CFSTR("Secure Element Ownership Check Skipped"));
  }
  v39 = objc_alloc(MEMORY[0x1E0CB3940]);
  PKPaymentWebServiceRegistrationTypeToString(v49);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentWebServiceRegistrationTypeToString(1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("Registration Type: %@ -> %@"), v40, v41);
  -[NSObject addObject:](v10, "addObject:", v42);

  v12 = (v49 != 1) | v29;
  PKLogFacilityTypeGetObject(6uLL);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    if ((v12 & 1) != 0)
      v44 = CFSTR("YES");
    else
      v44 = CFSTR("NO");
    -[NSObject componentsJoinedByString:](v10, "componentsJoinedByString:", CFSTR(", "));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v56 = v44;
    v57 = 2114;
    v58 = v45;
    _os_log_impl(&dword_18FC92000, v43, OS_LOG_TYPE_DEFAULT, "Needs Registration: %{public}@ (%{public}@)", buf, 0x16u);

  }
  v7 = v50;
LABEL_42:

  return v12 & 1;
}

- (id)supportedRegionFeatureOfType:(int64_t)a3 didFailOSVersionRequirements:(BOOL *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a4)
    *a4 = 0;
  -[PKPaymentWebService context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PKPaymentWebService targetDevice](self, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supportedFeatureOfType:inRegion:osVersion:deviceClass:didFailOSVersionRequirements:", a3, v10, v12, v11, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSURL)primaryBrokerURL
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PKPaymentWebService context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKStockholmBrokerURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Overriding broker url %@", (uint8_t *)&v12, 0xCu);
    }

    v6 = v4;
    goto LABEL_5;
  }
  objc_msgSend(v3, "primaryRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "brokerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v3, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceTargetDeviceProtocol deviceRegion](self->_targetDevice, "deviceRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "brokerURLForRegion:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      PKLocalBrokerURL(objc_msgSend(v3, "devSigned"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v7 = v6;
    }
  }

  return (NSURL *)v7;
}

- (id)_brokerUrlForRegion:(id)a3 regionOut:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentWebService context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
LABEL_7:
    objc_msgSend(v8, "primaryRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v7, "regionForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "brokerURL");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v9 || !v10)
  {
    PKLogFacilityTypeGetObject(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: error: region identifier %@ provided but not registered for region.", (uint8_t *)&v14, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:
  if (a4)
    objc_storeStrong(a4, v9);

  return v11;
}

- (BOOL)_supportsAccounts
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PKPaymentWebServiceTargetDeviceProtocol paymentWebServiceSupportsAccounts:](self->_targetDevice, "paymentWebServiceSupportsAccounts:", self);
  else
    return 0;
}

- (BOOL)_canRegisterForPeerPayment
{
  return -[PKPaymentWebServiceTargetDeviceProtocol paymentWebServiceSupportsPeerPaymentRegistration:](self->_targetDevice, "paymentWebServiceSupportsPeerPaymentRegistration:", self);
}

- (void)_canRegisterForPeerPaymentWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  _QWORD v5[5];
  void (**v6)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    if (-[PKPaymentWebService _canRegisterForPeerPayment](self, "_canRegisterForPeerPayment"))
    {
      v4[2](v4, 1);
    }
    else if (-[PKPaymentWebService needsRegistration](self, "needsRegistration"))
    {
      v4[2](v4, 0);
    }
    else
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __64__PKPaymentWebService__canRegisterForPeerPaymentWithCompletion___block_invoke;
      v5[3] = &unk_1E2AD47D0;
      v5[4] = self;
      v6 = v4;
      -[PKPaymentWebService _recentConfiguration:](self, "_recentConfiguration:", v5);

    }
  }

}

void __64__PKPaymentWebService__canRegisterForPeerPaymentWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  const __CFString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v5;
    v31 = objc_msgSend(v5, "peerPaymentEnabledForRegion:", v7);
    v32 = a1;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "regions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "regionCode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "uppercaseString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "uppercaseString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqualToString:", v18);

          }
          else
          {
            v19 = 0;
          }
          v12 |= v19;

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    if (!v31)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v25 = objc_claimAutoreleasedReturnValue();
      v20 = v33;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = CFSTR("NO");
        if ((v12 & 1) != 0)
          v26 = CFSTR("YES");
        *(_DWORD *)buf = 138543618;
        v42 = v26;
        v43 = 2114;
        v44 = CFSTR("YES");
        _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Skipping registration update. hasMatchingRegisteredRegion: %{public}@ hasMissingRegisteredRegionCode: %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(v32 + 40) + 16))();
      v5 = v34;
      goto LABEL_31;
    }
    v20 = v33;
    objc_msgSend(v33, "registrationDate");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[__CFString compare:](v21, "compare:", v22);

      v5 = v34;
      if (v23 != -1)
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v21;
          _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Skipping registration update as data is not stale. Date: %{public}@", buf, 0xCu);
        }

        (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v32 + 40) + 16))(*(_QWORD *)(v32 + 40), objc_msgSend(*(id *)(v32 + 32), "_canRegisterForPeerPayment"));
        goto LABEL_30;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v27 = objc_claimAutoreleasedReturnValue();
      v5 = v34;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "No previous registration date. Performing update", buf, 2u);
      }

    }
    v28 = *(void **)(v32 + 32);
    objc_msgSend(v28, "primaryBrokerURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __64__PKPaymentWebService__canRegisterForPeerPaymentWithCompletion___block_invoke_133;
    v35[3] = &unk_1E2ACAF88;
    v30 = *(id *)(v32 + 40);
    v35[4] = *(_QWORD *)(v32 + 32);
    v36 = v30;
    objc_msgSend(v28, "updateRegistrationDataAtBrokerURL:completion:", v29, v35);

LABEL_30:
LABEL_31:

    goto LABEL_32;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_32:

}

uint64_t __64__PKPaymentWebService__canRegisterForPeerPaymentWithCompletion___block_invoke_133(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_canRegisterForPeerPayment"));
}

- (void)_recentConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    if (-[PKPaymentWebService needsConfiguration](self, "needsConfiguration"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __44__PKPaymentWebService__recentConfiguration___block_invoke;
      v7[3] = &unk_1E2ACAF88;
      v7[4] = self;
      v8 = v4;
      -[PKPaymentWebService configurePaymentServiceWithCompletion:](self, "configurePaymentServiceWithCompletion:", v7);

    }
    else
    {
      -[PKPaymentWebService context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1, v6);

    }
  }

}

void __44__PKPaymentWebService__recentConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a2 == 1 && a3 == 0;
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, void *))(v5 + 16))(v5, v4, v6);

}

- (void)startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5
{
  -[PKPaymentWebService startBackgroundURLSessionWithIdentifier:context:backgroundDelegate:completion:](self, "startBackgroundURLSessionWithIdentifier:context:backgroundDelegate:completion:", a3, a4, a5, 0);
}

- (void)startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *backgroundDownloadQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke;
  block[3] = &unk_1E2ABE260;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_sync(backgroundDownloadQueue, block);

}

void __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke(id *a1)
{
  _QWORD *v2;
  void (**v3)(void);
  int v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = a1[4];
  if (v2[15])
  {
    v3 = (void (**)(void))a1[8];
    if (v3)
      v3[2]();
  }
  else
  {
    v4 = objc_msgSend(v2, "_hasConfiguration");
    v5 = a1[4];
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke_2;
      v6[3] = &unk_1E2AD47F8;
      v6[4] = v5;
      v7 = a1[5];
      v8 = a1[6];
      v9 = a1[7];
      v10 = a1[8];
      objc_msgSend(v5, "_deviceConfigurationDataWithCompletion:", v6);

    }
    else
    {
      objc_msgSend(a1[4], "_startBackgroundURLSessionWithIdentifier:context:backgroundDelegate:completion:", a1[5], a1[6], a1[7], a1[8]);
    }
  }
}

void __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
      (*(void (**)(void))(v14 + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDevSigned:", objc_msgSend(v5, "devSigned"));

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v11 = *(NSObject **)(v9 + 176);
    v15[2] = __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke_3;
    v15[3] = &unk_1E2ABE260;
    v12 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[4] = v9;
    v16 = v10;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v13 = v15;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E2ABD9A0;
    v21 = v13;
    dispatch_async(v11, block);

  }
}

uint64_t __101__PKPaymentWebService_startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startBackgroundURLSessionWithIdentifier:context:backgroundDelegate:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)invalidateBackgroundSession
{
  NSObject *backgroundDownloadQueue;
  _QWORD block[5];

  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PKPaymentWebService_invalidateBackgroundSession__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_sync(backgroundDownloadQueue, block);
}

uint64_t __50__PKPaymentWebService_invalidateBackgroundSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "invalidateAndCancel");
}

- (NSArray)delegates
{
  os_unfair_lock_s *p_delegateLock;
  void *v4;
  void *v5;

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_delegateLock);
  return (NSArray *)v5;
}

- (id)forbiddenErrorWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentWebService;
  -[PKWebService forbiddenErrorWithResponse:](&v22, sel_forbiddenErrorWithResponse_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  v8 = 0;
  if (v7 <= 40420)
  {
    if (v7 <= 40101)
    {
      if (v7 > 40013)
      {
        if (v7 == 40014)
        {
          PKLocalizedPaymentString(CFSTR("INVALID_NAME_TITLE"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("INVALID_NAME_MESSAGE"), 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
          if (v7 != 40016)
            goto LABEL_51;
          PKLocalizedPaymentString(CFSTR("SECURE_ELEMENT_LIMIT_EXCEEDED_TITLE"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("SECURE_ELEMENT_LIMIT_EXCEEDED_MESSAGE"), 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (v7 == 40001)
      {
        PKLocalizedPaymentString(CFSTR("INVALID_PAN_TITLE"), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("INVALID_PAN_MESSAGE"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
        if (v7 != 40013)
          goto LABEL_51;
        PKLocalizedPaymentString(CFSTR("INVALID_EXPIRATION_TITLE"), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("INVALID_EXPIRATION_MESSAGE"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_50;
    }
    if (v7 <= 40300)
    {
      v9 = 0;
      switch(v7)
      {
        case 40102:
          PKLocalizedPaymentString(CFSTR("PROVISIONING_COUNT_EXCEEDED_TITLE"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("PROVISIONING_COUNT_EXCEEDED_MESSAGE"), 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        case 40103:
        case 40104:
        case 40105:
        case 40108:
        case 40109:
          goto LABEL_51;
        case 40106:
          PKLocalizedPaymentString(CFSTR("INVALID_CSC_TITLE"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("INVALID_CSC_MESSAGE"), 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        case 40107:
          PKLocalizedPaymentString(CFSTR("READER_MODE_ERROR_CARD_COULD_NOT_BE_ADDED_TITLE"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = CFSTR("READER_MODE_ERROR_INCORRECT_CARD_DETAILS_MESSAGE");
          goto LABEL_37;
        case 40110:
          PKLocalizedPaymentString(CFSTR("READER_MODE_ACCOUNT_NAME_MISMATCH_TITLE"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = CFSTR("READER_MODE_ACCOUNT_NAME_MISMATCH_MESSAGE");
LABEL_37:
          PKLocalizedPaymentString(&v11->isa, 0);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_38;
        default:
          v9 = 0;
          goto LABEL_51;
      }
    }
    if (v7 != 40301)
    {
      if (v7 != 40307)
      {
        v9 = 0;
        if (v7 != 40403)
          goto LABEL_51;
        PKLocalizedPaymentString(CFSTR("PROVISIONING_RED_FLOW_TITLE"), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("PROVISIONING_RED_FLOW_MESSAGE"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
LABEL_46:
      AnalyticsSendEvent();
      v8 = 0;
      v9 = 0;
      goto LABEL_51;
    }
    PKLocalizedPaymentString(CFSTR("INELIGIBLE_ACCOUNT_TITLE"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:
    AnalyticsSendEvent();
    v8 = 0;
    goto LABEL_51;
  }
  if (v7 <= 40500)
  {
    if (v7 <= 40453)
    {
      if (v7 == 40421)
      {
        PKLocalizedPaymentString(CFSTR("VERIFICATION_PERIOD_ENDED_TITLE"), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("VERIFICATION_PERIOD_ENDED_MESSAGE"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
        if (v7 != 40423)
          goto LABEL_51;
        PKLocalizedPaymentString(CFSTR("VERIFICATION_REQUEST_LIMIT_REACHED_TITLE"), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("VERIFICATION_REQUEST_LIMIT_REACHED_MESSAGE"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_50;
    }
    if (v7 == 40454)
    {
      PKLocalizedPaymentString(CFSTR("VERIFICATION_ATTEMPT_LIMIT_REACHED_TITLE"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    if (v7 == 40456)
    {
      PKLocalizedPaymentString(CFSTR("INVALID_VERIFICATION_CODE_TITLE"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("INVALID_VERIFICATION_CODE_MESSAGE"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
      if (v7 != 40457)
        goto LABEL_51;
      PKLocalizedPaymentString(CFSTR("EXPIRED_VERIFICATION_CODE_TITLE"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("EXPIRED_VERIFICATION_CODE_MESSAGE"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_50:
    AnalyticsSendEvent();
    goto LABEL_51;
  }
  if (v7 <= 60009)
  {
    if (v7 != 40501)
    {
      v9 = 0;
      if (v7 != 60009)
        goto LABEL_51;
      goto LABEL_46;
    }
    PKLocalizedPaymentString(CFSTR("HSA_REQUIRED_TITLE"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("HSA_REQUIRED_MESSAGE"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }
  if (v7 == 60010 || v7 == 60011)
    goto LABEL_46;
  v9 = 0;
  if (v7 == 60104)
  {
    PKLocalizedString(CFSTR("PASS_ERROR_MANAGED_APPLE_ID_TITLE"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("PASS_ERROR_MANAGED_APPLE_ID_BODY"), 0);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_38:
    v8 = (void *)v10;
  }
LABEL_51:
  objc_msgSend(v4, "localizedTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

LABEL_54:
    objc_msgSend(v4, "localizedTitle");
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localizedDescription");
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
    v9 = (void *)v14;
    goto LABEL_55;
  }
  objc_msgSend(v4, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    goto LABEL_54;
LABEL_55:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D80]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v9, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB3388]);
  v18 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PKPaymentWebServiceErrorDomain"), v7, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)signNonce:(id)a3 withCompletion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E0C99DF0];
    v8 = a3;
    v9 = objc_alloc_init(v7);
    objc_msgSend(v9, "appendData:", v8);

    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryAppleAccountHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendData:", v11);

    targetDevice = self->_targetDevice;
    objc_msgSend(v9, "SHA256Hash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__PKPaymentWebService_signNonce_withCompletion___block_invoke;
    v14[3] = &unk_1E2AD4820;
    v15 = v6;
    -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:signData:signatureEntanglementMode:withCompletionHandler:](targetDevice, "paymentWebService:signData:signatureEntanglementMode:withCompletionHandler:", self, v13, 0, v14);

  }
}

uint64_t __48__PKPaymentWebService_signNonce_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_renewAppleAccountWithCompletionHandler:(id)a3
{
  id v4;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  targetDevice = self->_targetDevice;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKPaymentWebService__renewAppleAccountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E2ABDBF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKPaymentWebServiceTargetDeviceProtocol renewAppleAccountWithCompletionHandler:](targetDevice, "renewAppleAccountWithCompletionHandler:", v7);

}

void __63__PKPaymentWebService__renewAppleAccountWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString **v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = PKWebServiceAccountCredentialRenewalSucceededNotification;
  if (a2)
    v5 = &PKWebServiceAccountCredentialRenewalFailedNotification;
  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = *v5;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", v7, *(_QWORD *)(a1 + 32));

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10);

}

- (void)processRetryRequest:(id)a3 responseData:(id)a4 orginalRequest:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C92C78], "propertyForKey:inRequest:", CFSTR("overlayRequest"), a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3710];
  v15 = objc_opt_class();
  objc_msgSend(v13, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unarchivedObjectOfClass:fromData:error:", v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && objc_msgSend(v17, "requiresConfigurationForRetry"))
  {
    if (v10 && v11)
    {
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 0, &v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v29;
      if (v19)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v19;
          v21 = "Error: Retry response JSON is invalid with error :%@";
          v22 = v20;
          v23 = 12;
LABEL_8:
          _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __82__PKPaymentWebService_processRetryRequest_responseData_orginalRequest_completion___block_invoke;
          v27[3] = &unk_1E2AD44F0;
          v28 = v12;
          objc_msgSend(v17, "_updateRequestForRetry:retryFields:webService:withCompletion:", v10, v18, self, v27);
          v24 = v28;
          goto LABEL_19;
        }
        if (v18)
        {
LABEL_10:
          if (!v12)
          {
LABEL_20:

            goto LABEL_21;
          }
          v24 = (void *)objc_msgSend(v10, "copy");
          (*((void (**)(id, void *))v12 + 2))(v12, v24);
LABEL_19:

          goto LABEL_20;
        }
        PKLogFacilityTypeGetObject(6uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v21 = "Error: No retry response json";
          v22 = v20;
          v23 = 2;
          goto LABEL_8;
        }
      }

      goto LABEL_10;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "No requests or response data to use", buf, 2u);
    }

  }
  if (v12)
  {
    v26 = (void *)objc_msgSend(v10, "copy");
    (*((void (**)(id, void *))v12 + 2))(v12, v26);

  }
LABEL_21:

}

void __82__PKPaymentWebService_processRetryRequest_responseData_orginalRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__PKPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke;
  v9[3] = &unk_1E2ABD9C8;
  v10 = v7;
  v8 = v7;
  -[PKPaymentWebService _registerIfNeededWithResponse:task:isRedirect:completion:](self, "_registerIfNeededWithResponse:task:isRedirect:completion:", a3, 0, 1, v9);

}

uint64_t __100__PKPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (BOOL)isChinaRegionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[PKPaymentWebService context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "regionCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("CN")) == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)configurePaymentServiceWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke;
  v8[3] = &unk_1E2AD48C0;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v4;
  -[PKPaymentWebService _deviceConfigurationDataWithCompletion:](self, "_deviceConfigurationDataWithCompletion:", v8);

  return v5;
}

void __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPaymentConfigurationRequest *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void (*v21)(void);
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v20 = *(_QWORD *)(a1 + 40);
    if (!v20)
      goto LABEL_17;
    v21 = *(void (**)(void))(v20 + 16);
LABEL_16:
    v21();
    goto LABEL_17;
  }
  v7 = objc_msgSend(v5, "devSigned");
  if (!os_variant_has_internal_ui()
    || !(_DWORD)v7
    || (PKStockholmEnvironmentName(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsString:", CFSTR("QA")),
        v8,
        (v9 & 1) != 0))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v30 = v7;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: set devSigned=%i from device data during configuration", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secureElementIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v11, "setSecureElementID:", v12);
    objc_msgSend(v11, "setDevSigned:", v7);
    objc_msgSend(v11, "setConfigurationDate:", 0);
    PKStockholmConfigURL(v7, objc_msgSend(*(id *)(a1 + 32), "_isSandboxAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(PKPaymentConfigurationRequest);
    objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v14);
    -[PKPaymentConfigurationRequest _requestWithServiceURL:](v14, "_requestWithServiceURL:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_223;
    v24[3] = &unk_1E2AD4898;
    v16 = *(void **)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v25 = *(id *)(a1 + 32);
    v26 = v13;
    v27 = v11;
    v28 = v16;
    v18 = v11;
    v19 = v13;
    objc_msgSend(v25, "performRequest:taskIdentifier:completionHandler:", v15, v17, v24);

    goto LABEL_17;
  }
  PKLogFacilityTypeGetObject(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FC92000, v22, OS_LOG_TYPE_ERROR, "******** ERROR: Using DevSE with non QA Enviroment - refusing to update configuration **********", buf, 2u);
  }

  v23 = *(_QWORD *)(a1 + 40);
  if (v23)
  {
    v21 = *(void (**)(void))(v23 + 16);
    goto LABEL_16;
  }
LABEL_17:

}

void __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_223(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void (**v21)(id, uint64_t, id);
  void (**v22)(id, uint64_t, id);
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = a1[4];
  v10 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_2;
  v28[3] = &unk_1E2AD4848;
  v11 = v7;
  v29 = v11;
  v12 = a1[5];
  v13 = a1[4];
  v30 = v12;
  v31 = v13;
  v32 = a1[6];
  v14 = objc_msgSend(v9, "_resultForResponse:error:successHandler:", a3, v8, v28);
  objc_msgSend(a1[4], "_archiveContext");
  if (v14 == 1)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Updated server config data successfully", buf, 2u);
    }

    objc_msgSend(*((id *)a1[4] + 32), "deviceRegion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentHeroImageManifest removeManifestFileForRegion:](PKPaymentHeroImageManifest, "removeManifestFileForRegion:", v16);
    objc_msgSend(a1[6], "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heroImageManifestURLForRegion:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      +[PKObjectDownloader sharedImageAssetDownloader](PKObjectDownloader, "sharedImageAssetDownloader");
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_228;
      v23[3] = &unk_1E2AD4870;
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v26 = a1[7];
      v27 = 1;
      v25 = v8;
      v19 = v24;
      +[PKPaymentHeroImageManifest downloadManifestForRegion:url:fileDownloader:completion:](PKPaymentHeroImageManifest, "downloadManifestForRegion:url:fileDownloader:completion:", v16, v18, v19, v23);

    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Hero manifest URL is nil - skipping download.", buf, 2u);
      }

      v22 = (void (**)(id, uint64_t, id))a1[7];
      if (v22)
        v22[2](v22, 1, v8);
    }

  }
  else
  {
    if (!v8)
    {
      objc_msgSend(a1[4], "_errorWithResult:data:", v14, v11);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(6uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Failed to update server config data with error %@", buf, 0xCu);
    }

    v21 = (void (**)(id, uint64_t, id))a1[7];
    if (v21)
      v21[2](v21, v14, v8);
  }

}

uint64_t __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  PKPaymentWebServiceConfiguration *v6;
  void *v7;
  PKPaymentWebServiceConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[PKWebServiceResponse responseWithData:](PKPaymentConfigurationResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "version");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Version is %@", (uint8_t *)&v14, 0xCu);
    }

    v6 = [PKPaymentWebServiceConfiguration alloc];
    objc_msgSend(v3, "JSONObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPaymentWebServiceConfiguration initWithConfiguration:url:](v6, "initWithConfiguration:url:", v7, *(_QWORD *)(a1 + 40));

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "_resetSupportInRegionCache");
      objc_msgSend(*(id *)(a1 + 56), "setConfiguration:", v8);
      v9 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setConfigurationDate:", v10);

      if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 225))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postNotificationName:object:", CFSTR("PKSharedPaymentWebServiceRegionConfigurationChangedNotification"), 0);

      }
      v12 = 1;
      PKSetNFRemoteAdminV2Enabled(1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 256), "paymentWebServiceDidUpdateConfiguration:");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __61__PKPaymentWebService_configurePaymentServiceWithCompletion___block_invoke_228(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = PKScreenScale();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "images", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v14, "hasCachedImageWithScale:", v7) & 1) == 0)
            objc_msgSend(v14, "downloadImageWithScale:fileDownloader:completion:", a1[4], 0, v7);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  v15 = a1[6];
  if (v15)
  {
    if (a1[5])
      v16 = (id)a1[5];
    else
      v16 = v5;
    (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, a1[7], v16);
  }

}

- (unint64_t)registerDeviceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentWebService registerDeviceAtBrokerURL:consistencyCheckResults:completion:](self, "registerDeviceAtBrokerURL:consistencyCheckResults:completion:", v5, 0, v4);

  return v6;
}

- (unint64_t)registerDeviceAtBrokerURL:(id)a3 consistencyCheckResults:(id)a4 completion:(id)a5
{
  return -[PKPaymentWebService registerDeviceAtBrokerURL:withConsistencyCheckResults:retries:completion:](self, "registerDeviceAtBrokerURL:withConsistencyCheckResults:retries:completion:", a3, a4, 2, a5);
}

- (unint64_t)registerDeviceAtBrokerURL:(id)a3 withConsistencyCheckResults:(id)a4 retries:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[PKWebService nextTaskID](self, "nextTaskID");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke;
  v18[3] = &unk_1E2AD4988;
  v18[4] = self;
  v19 = v11;
  v20 = v10;
  v21 = v12;
  v22 = v13;
  v23 = a5;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  -[PKPaymentWebService _deviceRegistrationDataWithCompletion:](self, "_deviceRegistrationDataWithCompletion:", v18);

  return v13;
}

void __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PKPaymentRegistrationRequest *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  void (*v35)(void);
  NSObject *v36;
  uint64_t v37;
  PKPaymentRegistrationRequest *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint8_t buf[4];
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v35 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_20:
    v35();
    goto LABEL_21;
  }
  v7 = objc_msgSend(v5, "devSigned");
  if (!os_variant_has_internal_ui()
    || !(_DWORD)v7
    || (PKStockholmEnvironmentName(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsString:", CFSTR("QA")),
        v8,
        (v9 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secureElementIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSecureElementID:", v11);

    objc_msgSend(v10, "setDevSigned:", v7);
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v53 = v7;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: set devSigned=%i from device data during registration", buf, 8u);
    }
    v41 = v6;

    v13 = objc_alloc_init(PKPaymentRegistrationRequest);
    objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v13);
    objc_msgSend(v10, "pushToken");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextPushToken");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = (void *)v14;
    v18 = v17;
    v19 = v10;
    if (!v18)
    {
      v20 = v14;
      v21 = v19;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "*** WARNING ***: Push token is missing!", buf, 2u);
      }

      AnalyticsSendEvent();
      v19 = v21;
      v14 = v20;
    }
    v39 = (void *)v14;
    v40 = v19;
    objc_msgSend(*(id *)(a1 + 40), "summary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRegistrationRequest _requestWithServiceURL:deviceData:pushToken:consistencyData:appleAccountInformation:](v13, "_requestWithServiceURL:deviceData:pushToken:consistencyData:appleAccountInformation:", v23, v5, v18, v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v13;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 168));
    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v27);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 168));
    v28 = *(void **)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 64);
    v29 = *(_QWORD *)(a1 + 72);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_233;
    v42[3] = &unk_1E2AD4960;
    v51 = v22 != 0;
    v42[4] = v28;
    v43 = v16;
    v49 = v30;
    v44 = v18;
    v31 = v5;
    v32 = *(_QWORD *)(a1 + 72);
    v45 = v31;
    v50 = v32;
    v46 = *(id *)(a1 + 48);
    v47 = *(id *)(a1 + 40);
    v48 = *(id *)(a1 + 56);
    v33 = v18;
    v34 = v16;
    objc_msgSend(v28, "performRequest:taskIdentifier:retries:authHandling:completionHandler:", v25, v30, v29, 0, v42);

    v6 = v41;
    goto LABEL_21;
  }
  PKLogFacilityTypeGetObject(0);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FC92000, v36, OS_LOG_TYPE_ERROR, "******** ERROR: Using DevSE with non QA Enviroment - refusing to register **********", buf, 2u);
  }

  v37 = *(_QWORD *)(a1 + 56);
  if (v37)
  {
    v35 = *(void (**)(void))(v37 + 16);
    goto LABEL_20;
  }
LABEL_21:

}

void __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_233(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[8];
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  char v58;
  _QWORD v59[4];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 168));
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v11);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 168));
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0;
  v12 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_2;
  v51[3] = &unk_1E2AD48E8;
  v14 = v7;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  v52 = v14;
  v53 = v15;
  v58 = *(_BYTE *)(a1 + 104);
  v57 = v59;
  v54 = v16;
  v55 = *(id *)(a1 + 48);
  v56 = *(id *)(a1 + 56);
  v17 = objc_msgSend(v12, "_resultForResponse:error:successHandler:", v8, v9, v51);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "statusCode") == 401)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v18 = *(void **)(a1 + 32);
      v43[0] = v13;
      v43[1] = 3221225472;
      v43[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_3;
      v43[3] = &unk_1E2AD4910;
      v43[4] = v18;
      v44 = *(id *)(a1 + 64);
      v19 = *(id *)(a1 + 72);
      v20 = *(_QWORD *)(a1 + 96);
      v45 = v19;
      v49 = v20;
      v21 = *(id *)(a1 + 80);
      v50 = v17;
      v47 = v21;
      v48 = v59;
      v9 = v9;
      v46 = v9;
      objc_msgSend(v18, "handleAuthenticationFailureWithCompletionHandler:", v43);

      v22 = v44;
LABEL_5:

      goto LABEL_24;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "Exceeded maximum retries (giving up).", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    goto LABEL_24;
  }
  if (v17 == 1)
  {
    AnalyticsSendEvent();
    objc_msgSend(*(id *)(a1 + 32), "performApplePayTrustRegistrationWithCompletion:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    goto LABEL_24;
  }
  if (v17)
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v17, v14);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_17;
  }
  AnalyticsSendEvent();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v23 = v8, v24 = objc_msgSend(v23, "statusCode"), v23, v24 != 428))
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", 0, v14);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_17:
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    goto LABEL_24;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Received Secure Element Reinitialization Response Code (428)...", buf, 2u);
  }

  if (*(_QWORD *)(a1 + 96))
  {
    objc_msgSend(*(id *)(a1 + 32), "targetDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 32);
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_239;
    v33[3] = &unk_1E2AD4938;
    v33[4] = v27;
    v34 = *(id *)(a1 + 64);
    v28 = *(id *)(a1 + 72);
    v29 = *(_QWORD *)(a1 + 96);
    v35 = v28;
    v40 = v29;
    v38 = *(id *)(a1 + 80);
    v9 = v9;
    v36 = v9;
    v41 = 0;
    v37 = v14;
    v39 = v59;
    objc_msgSend(v26, "paymentWebService:setNewAuthRandom:", v27, v33);

    v22 = v34;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Exceeded maximum retries (giving up).", buf, 2u);
  }

  if (v9)
  {
    v31 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", 0, v14);
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v31;
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

LABEL_24:
  _Block_object_dispose(v59, 8);

}

uint64_t __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[PKWebServiceResponse responseWithData:](PKPaymentRegistrationResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (*(_BYTE *)(a1 + 80))
      v5 = objc_msgSend(v3, "registrationType");
    else
      v5 = 1;
    objc_msgSend(v2, "cardsOnFile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v7, "unsignedIntegerValue");

    v6 = objc_msgSend(*(id *)(a1 + 40), "_updateContextWithRegistrationType:response:", v5, v2);
    if (v6 == 1)
    {
      objc_msgSend(v4, "nextPushToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_QWORD *)(a1 + 48) && v8 && objc_msgSend(v8, "isEqual:"))
      {
        objc_msgSend(v4, "setPushToken:", *(_QWORD *)(a1 + 56));
        objc_msgSend(v4, "setNextPushToken:", 0);
      }
      objc_msgSend(*(id *)(a1 + 64), "companionSerialNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCompanionSerialNumber:", v10);

    }
    objc_msgSend(*(id *)(a1 + 40), "_archiveContext");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  uint8_t buf[16];

  v5 = a3;
  if (a2 == 2)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v12 = 0;
    v8 = "Credential Renewal Failed.";
    v9 = (uint8_t *)&v12;
LABEL_13:
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_14;
  }
  if (a2 == 1)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v11 = 0;
    v8 = "Credential Renewal Rejected by User.";
    v9 = (uint8_t *)&v11;
    goto LABEL_13;
  }
  if (a2)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v8 = "Credential Renewal: Unknown result.";
      v9 = (uint8_t *)&v10;
      goto LABEL_13;
    }
LABEL_14:

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
    goto LABEL_15;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Credential Renewal succeeded, retrying request.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "registerDeviceAtBrokerURL:withConsistencyCheckResults:retries:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80) - 1, *(_QWORD *)(a1 + 64));
LABEL_15:

}

void __96__PKPaymentWebService_registerDeviceAtBrokerURL_withConsistencyCheckResults_retries_completion___block_invoke_239(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Secure Element reinitialized, retrying request.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "registerDeviceAtBrokerURL:withConsistencyCheckResults:retries:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88) - 1, *(_QWORD *)(a1 + 72));
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to reinitialize Secure Element.", v9, 2u);
    }

    v6 = *(void **)(a1 + 56);
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 64));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
}

- (void)_shouldPerformApplePayTrustRegistrationWithCompletion:(id)a3
{
  id v4;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    if ((unint64_t)PKCurrentPassbookState() <= 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      targetDevice = self->_targetDevice;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __77__PKPaymentWebService__shouldPerformApplePayTrustRegistrationWithCompletion___block_invoke;
      v6[3] = &unk_1E2AD49B0;
      v7 = v4;
      -[PKPaymentWebServiceTargetDeviceProtocol applePayTrustKeyForIdentifier:completion:](targetDevice, "applePayTrustKeyForIdentifier:completion:", CFSTR("com.apple.wallet.applepaytrust"), v6);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

uint64_t __77__PKPaymentWebService__shouldPerformApplePayTrustRegistrationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_createApplePayTrustKeyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKApplePayTrustKeyRequest *v8;
  void *v9;
  PKApplePayTrustKeyRequest *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "aidaAlternateDSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = [PKApplePayTrustKeyRequest alloc];
      objc_msgSend(v7, "SHA256Hash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKApplePayTrustKeyRequest initWithKeyIdentifier:subjectIdentifier:](v8, "initWithKeyIdentifier:subjectIdentifier:", CFSTR("com.apple.wallet.applepaytrust"), v9);

      -[PKPaymentWebServiceTargetDeviceProtocol createApplePayTrustKeyWithRequest:completion:](self->_targetDevice, "createApplePayTrustKeyWithRequest:completion:", v10, v11);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    }
    v4 = v11;
  }

}

- (unint64_t)performApplePayTrustRegistrationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKPaymentWebService _performApplePayTrustRegistrationWithURL:pushToken:completion:](self, "_performApplePayTrustRegistrationWithURL:pushToken:completion:", v5, v7, v4);

  return v8;
}

- (unint64_t)_performApplePayTrustRegistrationWithURL:(id)a3 pushToken:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v18[16];
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(id, _QWORD, void *);
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (!v8)
      goto LABEL_13;
    PKLogFacilityTypeGetObject(0xFuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Error: Asked to register for Apple Pay Trust with nil service deviceID. Perform device registration first.", v18, 2u);
    }

    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v8[2](v8, 0, v13);
LABEL_12:

    goto LABEL_13;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error: Asked to register for Apple Pay Trust with nil service URL.", v18, 2u);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("Error: Asked to register for Apple Pay Trust with nil service URL.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
    goto LABEL_11;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke;
  v19[3] = &unk_1E2AD49D8;
  v19[4] = self;
  v20 = v7;
  v21 = v11;
  v23 = v9;
  v22 = v8;
  -[PKPaymentWebService _createApplePayTrustKeyWithCompletion:](self, "_createApplePayTrustKeyWithCompletion:", v19);

LABEL_13:
  return v9;
}

void __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PKApplePayTrustRegistrationRequest *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc_init(PKApplePayTrustRegistrationRequest);
    objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v7);
    -[PKApplePayTrustRegistrationRequest setApplePayTrustKey:](v7, "setApplePayTrustKey:", v5);
    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplePayTrustRegistrationRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v9, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke_2;
    v16[3] = &unk_1E2ACB700;
    v16[4] = v12;
    v13 = *(_QWORD *)(a1 + 64);
    v18 = *(id *)(a1 + 56);
    v17 = v5;
    objc_msgSend(v12, "performRequest:taskIdentifier:completionHandler:", v11, v13, v16);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error: Failed to get enrollment data for Apple Pay Trust registration with error: %@", buf, 0xCu);
    }

    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v6);
  }

}

void __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void (*v12)(void);
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 || !objc_msgSend(a1[4], "_isValidResponse:error:", v8, 0))
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust registration request failed with error: %@", buf, 0xCu);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)*((_QWORD *)a1[4] + 32);
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke_254;
      v17[3] = &unk_1E2ABDDB0;
      v19 = a1[6];
      v18 = v9;
      objc_msgSend(v14, "deleteApplePayTrustKeyWithIdentifier:completion:", v15, v17);

    }
    else
    {
      v16 = a1[6];
      if (v16)
      {
        v12 = (void (*)(void))*((_QWORD *)v16 + 2);
        goto LABEL_13;
      }
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust registration succeeded.", buf, 2u);
    }

    v11 = a1[6];
    if (v11)
    {
      v12 = (void (*)(void))*((_QWORD *)v11 + 2);
LABEL_13:
      v12();
    }
  }

}

uint64_t __85__PKPaymentWebService__performApplePayTrustRegistrationWithURL_pushToken_completion___block_invoke_254(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)_isValidResponse:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v5;
    v8 = -[NSObject statusCode](v7, "statusCode");
    v9 = v8 == 200;
    if (v8 != 200)
    {
      v10 = v8;
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject URL](v7, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v13;
        v19 = 2048;
        v20 = v10;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Error executing request: %@; statusCode: %ld; error: %@",
          (uint8_t *)&v17,
          0x20u);

      }
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = (uint64_t)v15;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Invalid response with error: %@; Expected 'NSHTTPURLResponse' but got '%@'",
        (uint8_t *)&v17,
        0x16u);

    }
    v9 = 0;
  }

  return v9;
}

- (unint64_t)_updateContextWithRegistrationType:(int64_t)a3 response:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  PKPaymentWebService *v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v31 = "*** ERROR ***: No Device ID";
LABEL_26:
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    goto LABEL_27;
  }
  objc_msgSend(v6, "primaryRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v31 = "*** ERROR ***: No Primary Region";
    goto LABEL_26;
  }
  objc_msgSend(v6, "regions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = "*** ERROR ***: Empty Regions Dictionary";
      goto LABEL_26;
    }
LABEL_27:
    v33 = 0;
    goto LABEL_37;
  }
  v43 = self;
  -[PKPaymentWebService context](self, "context");
  v11 = objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v6, "regions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v6, "regions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "certificates");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((PKPaymentCreateAndValidateTrustWithCerts(v20, 0, -[NSObject devSigned](v11, "devSigned")) & 1) == 0)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v17;
            _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "*** ERROR ***: Invalid Certificate Chain for %@", buf, 0xCu);
          }

          v33 = 0;
          goto LABEL_36;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v14)
        continue;
      break;
    }
  }

  -[PKPaymentWebService _resetSupportInRegionCache](v43, "_resetSupportInRegionCache");
  objc_msgSend(v6, "regions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setRegions:](v11, "setRegions:", v21);

  objc_msgSend(v6, "deviceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setDeviceID:](v11, "setDeviceID:", v22);

  objc_msgSend(v6, "primaryRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v6, "regions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSObject setPrimaryRegionIdentifier:](v11, "setPrimaryRegionIdentifier:", v12);
  -[NSObject setRegistrationType:](v11, "setRegistrationType:", a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setRegistrationDate:](v11, "setRegistrationDate:", v25);

  PKDeviceBuildVersion();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __67__PKPaymentWebService__updateContextWithRegistrationType_response___block_invoke;
  v44[3] = &unk_1E2AD4A00;
  v19 = v26;
  v45 = v19;
  -[NSObject atomicallyUpdateEveryRegion:](v11, "atomicallyUpdateEveryRegion:", v44);
  objc_msgSend(v6, "maxCards");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
    v30 = objc_msgSend(v27, "unsignedIntegerValue");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKPaymentWebServiceTargetDeviceProtocol setMaximumPaymentCards:](v43->_targetDevice, "setMaximumPaymentCards:", v30);
    else
      PKSetMaxPaymentCards(v30);
    v28 = v29;
  }
  objc_msgSend(v6, "environmentName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  PKStockholmEnvironmentDisplayName();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v34, "isEqualToString:") & 1) == 0)
  {
    if (objc_msgSend(v34, "length"))
      v35 = v34;
    else
      v35 = 0;
    PKSetStockholmEnvironmentDisplayName(v35);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "postNotificationName:object:", CFSTR("PKSharedPaymentWebServiceRegionConfigurationChangedNotification"), 0);

  }
  targetDevice = v43->_targetDevice;
  -[NSObject TSMURLStringByPushTopic](v11, "TSMURLStringByPushTopic");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject primaryRegion](v11, "primaryRegion");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trustedServiceManagerPushTopic");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:didRegisterWithRegionMap:primaryRegionTopic:](targetDevice, "paymentWebService:didRegisterWithRegionMap:primaryRegionTopic:", v43, v38, v40);

  v33 = 1;
  v20 = v45;
LABEL_36:

LABEL_37:
  return v33;
}

uint64_t __67__PKPaymentWebService__updateContextWithRegistrationType_response___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "regionBySettingLastDeviceCheckInBuildVersion:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)deviceCheckInDeviceCheckInForRegion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  PKPaymentDeviceCheckinRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  v9 = objc_alloc_init(PKPaymentDeviceCheckinRequest);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v9);
  -[PKPaymentWebService context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "regionForIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "brokerURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDeviceCheckinRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v9, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v13, v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__PKPaymentWebService_deviceCheckInDeviceCheckInForRegion_completion___block_invoke;
    v18[3] = &unk_1E2AC70F8;
    v18[4] = self;
    v19 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v8, v18);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

  }
  return v8;
}

void __70__PKPaymentWebService_deviceCheckInDeviceCheckInForRegion_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__53;
  v24 = __Block_byref_object_dispose__53;
  v25 = 0;
  v10 = *(void **)(a1 + 32);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __70__PKPaymentWebService_deviceCheckInDeviceCheckInForRegion_completion___block_invoke_262;
  v17 = &unk_1E2AC2918;
  v19 = &v20;
  v11 = v7;
  v18 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v14);
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v14, v15, v16, v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v21[5], v9);

  _Block_object_dispose(&v20, 8);
}

BOOL __70__PKPaymentWebService_deviceCheckInDeviceCheckInForRegion_completion___block_invoke_262(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentDeviceCheckInResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)sendOwnershipTokensForReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  PKAsyncUnaryOperationComposer *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v24[6];
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[PKWebService nextTaskID](self, "nextTaskID");
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__53;
  v28[4] = __Block_byref_object_dispose__53;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__53;
  v26[4] = __Block_byref_object_dispose__53;
  v27 = 0;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      PKPaymentSendOwnershipTokensRequestReasonToString(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v11;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Sending ownership tokens with reason %@", buf, 0xCu);

    }
    v12 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v13 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke;
    v25[3] = &unk_1E2AC5118;
    v25[4] = v28;
    -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v25);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_268;
    v24[3] = &unk_1E2AC7148;
    v24[4] = self;
    v24[5] = v26;
    -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v24);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_3;
    v17[3] = &unk_1E2AD4A98;
    v22 = a3;
    v20 = v28;
    v17[4] = self;
    v18 = v9;
    v21 = v26;
    v23 = v7;
    v19 = v6;
    v15 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v12, "evaluateWithInput:completion:", v14, v17);

    goto LABEL_7;
  }
  if (v6)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v12 = (PKAsyncUnaryOperationComposer *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, PKAsyncUnaryOperationComposer *))v6 + 2))(v6, 0, v12);
LABEL_7:

  }
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v28, 8);
  return v7;
}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_2;
  v11[3] = &unk_1E2AD4A28;
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  +[PKPassOwnershipToken queryKeychainForOwnershipTokens:](PKPassOwnershipToken, "queryKeychainForOwnershipTokens:", v11);

}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error getting pass ownership tokens %@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_268(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_2_269;
  v12[3] = &unk_1E2AD4A50;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "_deviceDataIncludingMetadataFields:withCompletionHandler:", 498, v12);

}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_2_269(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_3(uint64_t a1)
{
  PKPaymentSendOwnershipTokensRequest *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v2 = objc_alloc_init(PKPaymentSendOwnershipTokensRequest);
  -[PKPaymentSendOwnershipTokensRequest setPassOwnershipTokens:](v2, "setPassOwnershipTokens:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  -[PKPaymentSendOwnershipTokensRequest setReason:](v2, "setReason:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v2);
  objc_msgSend(*(id *)(a1 + 32), "primaryBrokerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSendOwnershipTokensRequest _urlRequestWithServiceURL:deviceIdentifier:deviceMetadata:appleAccountInformation:](v2, "_urlRequestWithServiceURL:deviceIdentifier:deviceMetadata:appleAccountInformation:", v3, v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 80);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_4;
  v10[3] = &unk_1E2AC70F8;
  v10[4] = v8;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v8, "performRequest:taskIdentifier:completionHandler:", v7, v9, v10);

}

void __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a4;
  v8 = objc_msgSend(*(id *)(a1 + 32), "_resultForResponse:error:successHandler:", a3, v7, &__block_literal_global_155);
  if (!v7 && v8 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v8, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, 1, v7);

}

uint64_t __63__PKPaymentWebService_sendOwnershipTokensForReason_completion___block_invoke_5()
{
  return 1;
}

- (unint64_t)repopulateZonesWithCloudStoreZoneNames:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PKPaymentRepopulateZonesRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v6 && v10 && objc_msgSend(v6, "count"))
  {
    v12 = -[PKPaymentRepopulateZonesRequest initWithCloudStoreZoneNames:]([PKPaymentRepopulateZonesRequest alloc], "initWithCloudStoreZoneNames:", v6);
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v12);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRepopulateZonesRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v12, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v13, v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__PKPaymentWebService_repopulateZonesWithCloudStoreZoneNames_completion___block_invoke;
    v18[3] = &unk_1E2AC70F8;
    v18[4] = self;
    v19 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v8, v18);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

  }
  return v8;
}

void __73__PKPaymentWebService_repopulateZonesWithCloudStoreZoneNames_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a4;
  v8 = objc_msgSend(*(id *)(a1 + 32), "_resultForResponse:error:successHandler:", a3, v7, &__block_literal_global_275);
  if (!v7 && v8 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v8, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, 1, v7);

}

uint64_t __73__PKPaymentWebService_repopulateZonesWithCloudStoreZoneNames_completion___block_invoke_2()
{
  return 1;
}

- (void)backgroundPerformDeviceCheckInForRegion:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *backgroundDownloadQueue;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__PKPaymentWebService_backgroundPerformDeviceCheckInForRegion_identifier___block_invoke;
  v13[3] = &unk_1E2ABE0F8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v13;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v17 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(backgroundDownloadQueue, block);

}

void __74__PKPaymentWebService_backgroundPerformDeviceCheckInForRegion_identifier___block_invoke(uint64_t a1)
{
  PKPaymentDeviceCheckinRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  PKPaymentDeviceCheckinRequest *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id WeakRetained;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  _BYTE buf[24];
  void *v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PKPaymentDeviceCheckinRequest);
  objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v2);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "regionForIdentifier:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brokerURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    -[PKPaymentDeviceCheckinRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v2, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v6, v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "downloadTaskWithRequest:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentBackgroundDownloadRecord taskWithType:](PKPaymentDeviceCheckinDownloadRecord, "taskWithType:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRegion:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v10, "setIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addBackgroundDownloadRecord:forTaskIdentifier:", v10, objc_msgSend(v9, "taskIdentifier"));

    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v3;
      v14 = v2;
      v15 = objc_msgSend(v9, "taskIdentifier");
      objc_msgSend(v8, "URL");
      v25 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v15;
      v2 = v14;
      v3 = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu for %@:", buf, 0x16u);

      v6 = v25;
    }

    objc_msgSend(*(id *)(a1 + 32), "logRequest:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_archiveBackgroundContext");
    objc_msgSend(v9, "resume");

    v4 = v26;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Device check in failed - no device ID present", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
    dispatch_get_global_queue(21, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __74__PKPaymentWebService_backgroundPerformDeviceCheckInForRegion_identifier___block_invoke_277;
    v27[3] = &unk_1E2AC0F90;
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(a1 + 40);
    v28 = WeakRetained;
    v29 = v22;
    v30 = v23;
    v31 = *(id *)(a1 + 48);
    v24 = v27;
    *(_QWORD *)buf = v21;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke_14;
    v33 = &unk_1E2ABD9A0;
    v34 = v24;
    v6 = WeakRetained;
    dispatch_async(v20, buf);

    v8 = v28;
  }

}

uint64_t __74__PKPaymentWebService_backgroundPerformDeviceCheckInForRegion_identifier___block_invoke_277(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentWebService:deviceCheckInReturnedAction:success:region:identifier:", *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (unint64_t)updateRegistrationDataAtBrokerURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  PKPaymentUpdateRegistrationDataRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  v9 = objc_alloc_init(PKPaymentUpdateRegistrationDataRequest);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v9);
  -[PKPaymentWebService context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentUpdateRegistrationDataRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v9, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__PKPaymentWebService_updateRegistrationDataAtBrokerURL_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
  return v8;
}

void __68__PKPaymentWebService_updateRegistrationDataAtBrokerURL_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __68__PKPaymentWebService_updateRegistrationDataAtBrokerURL_completion___block_invoke_2;
  v18 = &unk_1E2AD4AE0;
  v10 = v7;
  v11 = *(_QWORD *)(a1 + 32);
  v19 = v10;
  v20 = v11;
  v12 = objc_msgSend(v9, "_resultForResponse:error:successHandler:", a3, v8, &v15);
  v13 = v12;
  if (!v8 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v10, v15, v16, v17, v18);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v8);

}

uint64_t __68__PKPaymentWebService_updateRegistrationDataAtBrokerURL_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentRegistrationResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 40), "_updateContextWithRegistrationType:response:", objc_msgSend(v3, "registrationType"), v2);
    if (v4 == 1)
      objc_msgSend(*(id *)(a1 + 40), "_archiveContext");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)unregisterDeviceWithCompletion:(id)a3
{
  return -[PKPaymentWebService unregisterDeviceWithCompanionSerialNumber:completion:](self, "unregisterDeviceWithCompanionSerialNumber:completion:", 0, a3);
}

- (unint64_t)unregisterDeviceWithCompanionSerialNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  PKPaymentUnregisterRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(PKPaymentUnregisterRequest);
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v11);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentUnregisterRequest _urlRequestWithServiceURL:deviceIdentifier:companionSerialNumber:appleAccountInformation:](v11, "_urlRequestWithServiceURL:deviceIdentifier:companionSerialNumber:appleAccountInformation:", v12, v10, v6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__PKPaymentWebService_unregisterDeviceWithCompanionSerialNumber_completion___block_invoke;
    v17[3] = &unk_1E2AC70F8;
    v17[4] = self;
    v18 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v14, v8, v17);

  }
  else
  {
    AnalyticsSendEvent();
    if (v7)
    {
      -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

    }
  }

  return v8;
}

void __76__PKPaymentWebService_unregisterDeviceWithCompanionSerialNumber_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a4;
  v8 = objc_msgSend(*(id *)(a1 + 32), "_resultForResponse:error:successHandler:", a3, v7, &__block_literal_global_280);
  if (v8 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "paymentWebService:didRegisterWithRegionMap:primaryRegionTopic:", *(_QWORD *)(a1 + 32), 0, 0);
  }
  else
  {
    AnalyticsSendEvent();
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v8, v11);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, v8, v7);

}

uint64_t __76__PKPaymentWebService_unregisterDeviceWithCompanionSerialNumber_completion___block_invoke_2()
{
  AnalyticsSendEvent();
  return 1;
}

- (unint64_t)issuerProvisioningCertificatesForRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  PKPaymentWebService *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v7 || !v6 || !v10)
  {
    if (!v7)
      goto LABEL_15;
    if (v10)
    {
      if (v6)
      {
LABEL_14:
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
        goto LABEL_15;
      }
      PKLogFacilityTypeGetObject(0x26uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Failed to fetch certificates because of nil request.";
        v17 = v15;
        v18 = 2;
LABEL_12:
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0x26uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = self;
        v25 = 2112;
        v26 = v9;
        v16 = "Failed to fetch certificates because of nil deviceID. \nWebService: %@ \nContext: %@";
        v17 = v15;
        v18 = 22;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v12, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke;
  v20[3] = &unk_1E2ACB638;
  v20[4] = self;
  v21 = v9;
  v22 = v7;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v14, v8, v20);

LABEL_15:
  return v8;
}

void __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  CFArrayRef v14;
  const void *BasicX509;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void *values;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__53;
  v30 = __Block_byref_object_dispose__53;
  v31 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = a1[4];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke_2;
  v23[3] = &unk_1E2AC2918;
  v25 = &v26;
  v12 = v7;
  v24 = v12;
  v13 = objc_msgSend(v11, "_resultForResponse:error:successHandler:", v8, v9, v23);
  if (v27[5])
  {
    if (objc_msgSend(a1[5], "devSigned"))
    {
      values = PKCreateQARootCACertificate();
      if (values)
        v14 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, 0);
      else
        v14 = 0;
      BasicX509 = SecPolicyCreateBasicX509();
    }
    else
    {
      values = 0;
      BasicX509 = (const void *)SecPolicyCreateApplePayIssuerEncryption();
      v14 = 0;
    }
    v16 = (id)v27[5];
    objc_msgSend(v16, "certificates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke_3;
    v19[3] = &unk_1E2AD4B08;
    v18 = v16;
    v20 = v18;
    v21 = a1[6];
    PKCreateTrustAndValidateAsync(v17, BasicX509, v14, v19);

    if (BasicX509)
      CFRelease(BasicX509);
    if (v14)
      CFRelease(v14);
    if (values)
      CFRelease(values);

  }
  else
  {
    if (!v9)
    {
      objc_msgSend(a1[4], "_errorWithResult:data:", v13, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(void))a1[6] + 2))();
  }

  _Block_object_dispose(&v26, 8);
}

BOOL __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  PKPaymentIssuerProvisioningCertificatesResponse *v2;
  uint64_t v3;
  void *v4;

  v2 = -[PKPaymentIssuerProvisioningCertificatesResponse initWithData:]([PKPaymentIssuerProvisioningCertificatesResponse alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

uint64_t __79__PKPaymentWebService_issuerProvisioningCertificatesForRequest_withCompletion___block_invoke_3(uint64_t a1, int a2, SecTrustRef trust)
{
  uint64_t v5;
  const void *v6;

  if (trust)
  {
    if (a2)
    {
      if (SecTrustGetCertificateCount(trust) >= 1)
      {
        if (PKSecTrustGetCertificateAtIndex(trust, 0))
        {
          v5 = SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
          if (v5)
          {
            v6 = (const void *)v5;
            objc_msgSend(*(id *)(a1 + 32), "setPublicKeyHash:", v5);
            CFRelease(v6);
          }
        }
      }
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)remotePaymentCredentialsForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__PKPaymentWebService_remotePaymentCredentialsForRequest_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  }
  else
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

  }
  return v8;
}

void __69__PKPaymentWebService_remotePaymentCredentialsForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v7 = a2;
  v8 = a4;
  v9 = a3;
  +[PKWebServiceResponse responseWithData:](PKPaymentRemoteCredentialsResponse, "responseWithData:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PKPaymentWebService_remotePaymentCredentialsForRequest_completion___block_invoke_2;
  v14[3] = &unk_1E2AD4B30;
  v12 = v10;
  v15 = v12;
  v13 = objc_msgSend(v11, "_resultForResponse:error:successHandler:", v9, v8, v14);

  if (!v8 && v13 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v13, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

BOOL __69__PKPaymentWebService_remotePaymentCredentialsForRequest_completion___block_invoke_2(uint64_t a1)
{
  _BOOL8 v1;

  v1 = *(_QWORD *)(a1 + 32) != 0;
  AnalyticsSendEvent();
  return v1;
}

- (unint64_t)remotePaymentCredentialsUpdateForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__PKPaymentWebService_remotePaymentCredentialsUpdateForRequest_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  }
  else
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

  }
  return v8;
}

void __75__PKPaymentWebService_remotePaymentCredentialsUpdateForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v7 = a2;
  v8 = a4;
  v9 = a3;
  +[PKWebServiceResponse responseWithData:](PKPaymentRemoteCredentialsUpdateResponse, "responseWithData:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__PKPaymentWebService_remotePaymentCredentialsUpdateForRequest_completion___block_invoke_2;
  v14[3] = &unk_1E2AD4B30;
  v12 = v10;
  v15 = v12;
  v13 = objc_msgSend(v11, "_resultForResponse:error:successHandler:", v9, v8, v14);

  if (!v8 && v13 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v13, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

BOOL __75__PKPaymentWebService_remotePaymentCredentialsUpdateForRequest_completion___block_invoke_2(uint64_t a1)
{
  _BOOL8 v1;

  v1 = *(_QWORD *)(a1 + 32) != 0;
  AnalyticsSendEvent();
  return v1;
}

- (unint64_t)requirementsForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v6, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _brokerUrlForRegion:regionOut:](self, "_brokerUrlForRegion:regionOut:", v11, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v26)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    objc_msgSend(v6, "paymentCredential");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "couldSupportSuperEasyProvisioning");

    if (v14)
      v15 = 499;
    else
      v15 = 257;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke;
    v18[3] = &unk_1E2ACB660;
    v18[4] = self;
    v19 = v6;
    v20 = v12;
    v21 = v10;
    v22 = v26;
    v23 = v9;
    v25 = v8;
    v24 = v7;
    -[PKPaymentWebService _deviceDataIncludingMetadataFields:withCompletionHandler:](self, "_deviceDataIncludingMetadataFields:withCompletionHandler:", v15, v18);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v16);

  }
  return v8;
}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "paymentCredential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_2;
  v12[3] = &unk_1E2AD4B80;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v7;
  v15 = v3;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v10 = *(void **)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 88);
  v19 = v8;
  v21 = v9;
  v20 = v10;
  v11 = v3;
  objc_msgSend(v4, "_passOwnershipTokenForPaymentCredential:completion:", v5, v12);

}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  PKDSPContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;

  objc_msgSend(*(id *)(a1 + 32), "setPassOwnershipToken:", a2);
  if (+[PKDeviceScorer deviceScoringSupported](PKDeviceScorer, "deviceScoringSupported"))
  {
    objc_msgSend(*(id *)(a1 + 32), "paymentCredential");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "couldSupportSuperEasyProvisioning");

    if (v4)
    {
      v5 = objc_alloc_init(PKDSPContext);
      objc_msgSend(*(id *)(a1 + 40), "_paymentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "primarySecureElementIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDSPContext setSecureElementID:](v5, "setSecureElementID:", v7);
      -[PKDSPContext setServerEndpointIdentifier:](v5, "setServerEndpointIdentifier:", CFSTR("enable"));
      objc_msgSend(*(id *)(a1 + 48), "phoneNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDSPContext setPhoneNumber:](v5, "setPhoneNumber:", v8);

      objc_msgSend(*(id *)(a1 + 40), "_appleAccountInformation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDSPContext setPrimaryAppleAccount:](v5, "setPrimaryAppleAccount:", v9);

      objc_msgSend(*(id *)(a1 + 32), "cardholderName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDSPContext setCardholderName:](v5, "setCardholderName:", v10);

      objc_msgSend(*(id *)(a1 + 32), "setContext:", v5);
    }
  }
  v11 = *(void **)(a1 + 32);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_3;
  block[3] = &unk_1E2AD4B58;
  v19 = v11;
  v20 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 40);
  v21 = v13;
  v22 = v14;
  v23 = *(id *)(a1 + 72);
  v24 = *(id *)(a1 + 80);
  v15 = *(id *)(a1 + 48);
  v17 = *(void **)(a1 + 88);
  v16 = *(_QWORD *)(a1 + 96);
  v25 = v15;
  v27 = v16;
  v26 = v17;
  dispatch_async(v12, block);

}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "_appleAccountInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "certificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 72), "devSigned");
  v8 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_4;
  v11[3] = &unk_1E2ACB750;
  v9 = *(_QWORD *)(a1 + 96);
  v11[4] = v8;
  v13 = v9;
  v10 = *(_QWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  objc_msgSend(v2, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:certChain:devSigned:deviceData:webService:completion:", v3, v4, v5, v6, v7, v10, v8, v11);

}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_4(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_5;
  v5[3] = &unk_1E2AC70F8;
  v3 = (void *)a1[5];
  v4 = a1[6];
  v6 = (id)a1[4];
  v7 = v3;
  objc_msgSend(v6, "performRequest:taskIdentifier:cacheResponse:completionHandler:", a2, v4, 0, v5);

}

void __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__53;
  v18[4] = __Block_byref_object_dispose__53;
  v19 = 0;
  v10 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_6;
  v14[3] = &unk_1E2AD5080;
  v11 = v8;
  v15 = v11;
  v17 = v18;
  v12 = v7;
  v16 = v12;
  v13 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v11, v9, v14);
  if (!v9 && v13 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v13, v11, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  _Block_object_dispose(v18, 8);
}

BOOL __57__PKPaymentWebService_requirementsForRequest_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "allHeaderFields");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  +[PKWebServiceResponse responseWithData:headers:](PKPaymentRequirementsResponse, "responseWithData:headers:", *(_QWORD *)(a1 + 40), v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v6;
}

- (unint64_t)eligibilityForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v24 = 0;
    objc_msgSend(v6, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _brokerUrlForRegion:regionOut:](self, "_brokerUrlForRegion:regionOut:", v11, &v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke;
    v16[3] = &unk_1E2AD4BA8;
    v16[4] = self;
    v17 = v6;
    v18 = v12;
    v19 = v10;
    v20 = v24;
    v21 = v9;
    v23 = v8;
    v22 = v7;
    v13 = v12;
    -[PKPaymentWebService _deviceConfigurationDataWithCompletion:](self, "_deviceConfigurationDataWithCompletion:", v16);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

  }
  return v8;
}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "paymentCredential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_2;
  v10[3] = &unk_1E2AD4B80;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  v17 = v3;
  v8 = *(void **)(a1 + 80);
  v19 = *(_QWORD *)(a1 + 88);
  v18 = v8;
  v9 = v3;
  objc_msgSend(v4, "_passOwnershipTokenForPaymentCredential:completion:", v5, v10);

}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  objc_msgSend(*(id *)(a1 + 32), "setPassOwnershipToken:", a2);
  v3 = *(void **)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_3;
  block[3] = &unk_1E2AD4B58;
  v11 = v3;
  v12 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  v14 = v6;
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  v7 = *(id *)(a1 + 80);
  v9 = *(void **)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v17 = v7;
  v19 = v8;
  v18 = v9;
  dispatch_async(v4, block);

}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "_appleAccountInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "certificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 72), "devSigned");
  v8 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_4;
  v11[3] = &unk_1E2ACB750;
  v9 = *(_QWORD *)(a1 + 96);
  v11[4] = v8;
  v13 = v9;
  v10 = *(_QWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  objc_msgSend(v2, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:certChain:devSigned:deviceData:webService:completion:", v3, v4, v5, v6, v7, v10, v8, v11);

}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_4(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_5;
  v5[3] = &unk_1E2AC70F8;
  v3 = (void *)a1[5];
  v4 = a1[6];
  v6 = (id)a1[4];
  v7 = v3;
  objc_msgSend(v6, "performRequest:taskIdentifier:cacheResponse:completionHandler:", a2, v4, 0, v5);

}

void __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__53;
  v24 = __Block_byref_object_dispose__53;
  v25 = 0;
  v10 = *(void **)(a1 + 32);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_6;
  v17 = &unk_1E2AC2918;
  v19 = &v20;
  v11 = v7;
  v18 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v14);
  if (v12 != 1 && !v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v12, v8, v11, v14, v15, v16, v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  AnalyticsSendEvent();
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v13 + 16))(v13, v12, v21[5], v9);

  _Block_object_dispose(&v20, 8);
}

BOOL __56__PKPaymentWebService_eligibilityForRequest_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentEligibilityResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)provisionPassesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  PKPaymentWebService *v15;
  id v16;
  unint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  targetDevice = self->_targetDevice;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke;
  v13[3] = &unk_1E2AD4C48;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = v8;
  v10 = v7;
  v11 = v6;
  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:setNewAuthRandomIfNecessaryReturningPairingState:](targetDevice, "paymentWebService:setNewAuthRandomIfNecessaryReturningPairingState:", self, v13);

  return v8;
}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isDeviceProvisioningDataExpected"))
      v9 = 498;
    else
      v9 = 256;
    if (objc_msgSend(*(id *)(a1 + 32), "sendReducedDeviceData"))
      v9 &= ~0x80uLL;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_2;
    v16[3] = &unk_1E2AD4C20;
    v10 = *(void **)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v18 = v10;
    v19 = v7;
    v11 = v8;
    v13 = *(void **)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v20 = v11;
    v22 = v12;
    v21 = v13;
    objc_msgSend(v17, "_deviceDataIncludingMetadataFields:withCompletionHandler:", v9, v16);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 40), "_errorWithResult:data:", 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, v15);

    }
  }

}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PKDSPContext *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (+[PKDeviceScorer deviceScoringSupported](PKDeviceScorer, "deviceScoringSupported"))
    {
      v4 = objc_alloc_init(PKDSPContext);
      objc_msgSend(*(id *)(a1 + 32), "_paymentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "primarySecureElementIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDSPContext setSecureElementID:](v4, "setSecureElementID:", v6);
      -[PKDSPContext setServerEndpointIdentifier:](v4, "setServerEndpointIdentifier:", CFSTR("enable"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "secureElementIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v6);

      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "setCryptogram:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 40), "setChallengeResponse:", *(_QWORD *)(a1 + 56));
      }
      objc_msgSend(v3, "phoneNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDSPContext setPhoneNumber:](v4, "setPhoneNumber:", v9);

      objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDSPContext setPrimaryAppleAccount:](v4, "setPrimaryAppleAccount:", v10);

      objc_msgSend(*(id *)(a1 + 40), "cardholderName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDSPContext setCardholderName:](v4, "setCardholderName:", v11);

      objc_msgSend(*(id *)(a1 + 40), "setContext:", v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v21 = *(_QWORD *)(a1 + 64);
      if (v21)
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v21 + 16))(v21, 0, 0, 0);
      AnalyticsSendEvent();
      goto LABEL_22;
    }
    objc_msgSend(*(id *)(a1 + 40), "eligibilityResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "region");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "regionForIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v15 || v16)
    {
      if (v16)
      {
        objc_msgSend(v16, "brokerURL");
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v23 = (void *)v22;
        objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", *(_QWORD *)(a1 + 40));
        v24 = *(void **)(a1 + 40);
        v25 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_317;
        block[3] = &unk_1E2AD4B58;
        v34 = v24;
        v35 = v23;
        v26 = v13;
        v27 = *(_QWORD *)(a1 + 32);
        v36 = v26;
        v37 = v27;
        v38 = v17;
        v39 = v12;
        v28 = v3;
        v30 = *(void **)(a1 + 64);
        v29 = *(_QWORD *)(a1 + 72);
        v40 = v28;
        v42 = v29;
        v41 = v30;
        v31 = v17;
        v32 = v23;
        dispatch_async(v25, block);

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v15;
        _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: error: eligibility region %@ provided but not registered for region.", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "primaryBrokerURL");
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v19 = *(_QWORD *)(a1 + 64);
  if (v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v19 + 16))(v19, 0, 0, v20);

  }
  AnalyticsSendEvent();
LABEL_23:

}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_317(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "_appleAccountInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "certificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 72), "devSigned");
  v8 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_2_318;
  v11[3] = &unk_1E2ACB750;
  v9 = *(_QWORD *)(a1 + 96);
  v11[4] = v8;
  v13 = v9;
  v10 = *(_QWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  objc_msgSend(v2, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:certChain:devSigned:deviceData:webService:completion:", v3, v4, v5, v6, v7, v10, v8, v11);

}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_2_318(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_3;
  v5[3] = &unk_1E2AC70F8;
  v3 = (void *)a1[5];
  v4 = a1[6];
  v6 = (id)a1[4];
  v7 = v3;
  objc_msgSend(v6, "performRequest:taskIdentifier:cacheResponse:completionHandler:", a2, v4, 0, v5);

}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  PKAsyncUnaryOperationComposer *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint8_t buf[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__53;
  v56 = __Block_byref_object_dispose__53;
  v57 = 0;
  v10 = *(void **)(a1 + 32);
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_4;
  v49[3] = &unk_1E2AD4BD0;
  v26 = v8;
  v27 = v7;
  v50 = v27;
  v51 = &v52;
  v11 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, v49);
  objc_msgSend((id)v53[5], "downloadablePasses");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = (id *)&v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__53;
  v47 = __Block_byref_object_dispose__53;
  v48 = 0;
  v29 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  if (v11 == 1)
  {
    if (objc_msgSend(v28, "count"))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v12 = v28;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v58, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v40 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v17 = *(void **)(a1 + 32);
            objc_msgSend(v16, "ownershipToken");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "ownershipTokenIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "_storePassOwnershipToken:withIdentifier:", v18, v19);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v58, 16);
        }
        while (v13);
      }
LABEL_17:

      goto LABEL_18;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKPaymentWebService: Error - Provisioning succeeded but returned no downloadable passes", buf, 2u);
    }

  }
  v12 = v9;
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v11, v26, v27);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong(v44 + 5, v12);
  if (!v9)
    goto LABEL_17;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_320;
  v30[3] = &unk_1E2AD4BF8;
  v35 = &v43;
  v22 = v28;
  v23 = *(_QWORD *)(a1 + 32);
  v31 = v22;
  v32 = v23;
  v37 = v11;
  v24 = v27;
  v33 = v24;
  v34 = *(id *)(a1 + 40);
  v36 = &v52;
  v25 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v29, "evaluateWithInput:completion:", v21, v30);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v52, 8);

}

uint64_t __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[PKWebServiceResponse responseWithData:](PKPaymentProvisioningResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __61__PKPaymentWebService_provisionPassesWithRequest_completion___block_invoke_320(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v8)

  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v12 = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 == 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (unint64_t)initiateExternalProvisioningForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    objc_msgSend(v6, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _brokerUrlForRegion:regionOut:](self, "_brokerUrlForRegion:regionOut:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v12, v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__PKPaymentWebService_initiateExternalProvisioningForRequest_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v14, v8, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

  return v8;
}

void __73__PKPaymentWebService_initiateExternalProvisioningForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(*(id *)(a1 + 32), "_resultForResponse:error:successHandler:", v7, v8, &__block_literal_global_328);
  v10 = v9;
  if (!v8 && v9 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v9, v7, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v10, v8);

}

uint64_t __73__PKPaymentWebService_initiateExternalProvisioningForRequest_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)deprovisionForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__PKPaymentWebService_deprovisionForRequest_completion___block_invoke;
    v15[3] = &unk_1E2AC70F8;
    v15[4] = self;
    v16 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v15);

  }
  return v8;
}

void __56__PKPaymentWebService_deprovisionForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(*(id *)(a1 + 32), "_resultForResponse:error:successHandler:", v7, v8, &__block_literal_global_329_0);
  v10 = v9;
  if (!v8 && v9 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v9, v7, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v10, v8);

}

uint64_t __56__PKPaymentWebService_deprovisionForRequest_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)deleteForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:appleAccountInformation:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__PKPaymentWebService_deleteForRequest_completion___block_invoke;
    v15[3] = &unk_1E2AC70F8;
    v15[4] = self;
    v16 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v15);

  }
  return v8;
}

void __51__PKPaymentWebService_deleteForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(*(id *)(a1 + 32), "_resultForResponse:error:successHandler:", v7, v8, &__block_literal_global_330);
  v10 = v9;
  if (!v8 && v9 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v9, v7, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v10, v8);

}

uint64_t __51__PKPaymentWebService_deleteForRequest_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)prepareToProvisionForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __63__PKPaymentWebService_prepareToProvisionForRequest_completion___block_invoke;
      v15[3] = &unk_1E2AC70F8;
      v15[4] = self;
      v16 = v7;
      -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v15);

    }
    else if (v7)
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

  return v8;
}

void __63__PKPaymentWebService_prepareToProvisionForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(*(id *)(a1 + 32), "_resultForResponse:error:successHandler:", v7, v8, &__block_literal_global_331);
  v10 = v9;
  if (!v8 && v9 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v9, v7, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v10, v8);

}

uint64_t __63__PKPaymentWebService_prepareToProvisionForRequest_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)provisionPrecursorPassForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__PKPaymentWebService_provisionPrecursorPassForRequest_completion___block_invoke;
    v15[3] = &unk_1E2AC70F8;
    v15[4] = self;
    v16 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

  return v8;
}

void __67__PKPaymentWebService_provisionPrecursorPassForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__53;
  v24 = __Block_byref_object_dispose__53;
  v25 = 0;
  v10 = *(void **)(a1 + 32);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __67__PKPaymentWebService_provisionPrecursorPassForRequest_completion___block_invoke_2;
  v17 = &unk_1E2AC2918;
  v19 = &v20;
  v11 = v7;
  v18 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v14);
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v12, v8, v11, v14, v15, v16, v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v21[5], v9);

  _Block_object_dispose(&v20, 8);
}

BOOL __67__PKPaymentWebService_provisionPrecursorPassForRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentProvisionPrecursorPassResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)tapToProvisionConfigurationForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__PKPaymentWebService_tapToProvisionConfigurationForRequest_completion___block_invoke;
    v15[3] = &unk_1E2AC70F8;
    v15[4] = self;
    v16 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

  return v8;
}

void __72__PKPaymentWebService_tapToProvisionConfigurationForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__53;
  v24 = __Block_byref_object_dispose__53;
  v25 = 0;
  v10 = *(void **)(a1 + 32);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __72__PKPaymentWebService_tapToProvisionConfigurationForRequest_completion___block_invoke_2;
  v17 = &unk_1E2AC2918;
  v19 = &v20;
  v11 = v7;
  v18 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v14);
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v12, v8, v11, v14, v15, v16, v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v21[5], v9);

  _Block_object_dispose(&v20, 8);
}

BOOL __72__PKPaymentWebService_tapToProvisionConfigurationForRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentTapToProvisionConfigurationResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)verificationOptionsForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
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
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "passTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "regionForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v13, "brokerURL");
    else
      -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v15, v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "pass");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebService _performVerificationRequest:selectedChannel:paymentPass:taskID:completion:](self, "_performVerificationRequest:selectedChannel:paymentPass:taskID:completion:", v17, 0, v18, v8, v7);

    }
    else
    {
      if (v7)
      {
        -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v19);

      }
      AnalyticsSendEvent();
    }

  }
  else
  {
    if (v7)
    {
      -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

    }
    AnalyticsSendEvent();
  }

  return v8;
}

- (unint64_t)updateVerification:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *, _QWORD);
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v25;
  unint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  PKPaymentWebService *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(id, uint64_t, void *, _QWORD);
  unint64_t v37;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, _QWORD))a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  objc_msgSend(v6, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService verificationRecordForPass:](self, "verificationRecordForPass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    +[PKVerificationRequestRecord verificationRequestRecordForPass:](PKVerificationRequestRecord, "verificationRequestRecordForPass:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v6, "channel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "needsServerRequest") & 1) == 0)
  {
    objc_msgSend(v13, "setChannel:", v15);
    objc_msgSend(v13, "setVerificationStatus:", 4000);
    -[PKPaymentWebService updateVerificationRecord:](self, "updateVerificationRecord:", v13);
    if (v7)
      v7[2](v7, 1, v13, 0);
  }
  else
  {
    -[PKPaymentWebService context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deviceID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v26 = v8;
      objc_msgSend(v9, "passTypeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "regionForIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        objc_msgSend(v19, "brokerURL");
      else
        -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6, v13);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __53__PKPaymentWebService_updateVerification_completion___block_invoke;
      v27[3] = &unk_1E2AD4D18;
      v28 = v6;
      v29 = v21;
      v30 = v17;
      v31 = self;
      v32 = v19;
      v33 = v16;
      v34 = v15;
      v35 = v9;
      v37 = v26;
      v36 = v7;
      v22 = v19;
      v23 = v21;
      -[PKPaymentWebService _deviceConfigurationDataWithCompletion:](self, "_deviceConfigurationDataWithCompletion:", v27);

      v8 = v26;
      v13 = v25;
    }
    else
    {
      if (v7)
      {
        -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *, void *))v7)[2](v7, 0, 0, v20);

      }
      AnalyticsSendEvent();
    }

  }
  return v8;
}

void __53__PKPaymentWebService_updateVerification_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v7 = a2;
  objc_msgSend(v5, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "certificates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 72), "devSigned");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__PKPaymentWebService_updateVerification_completion___block_invoke_2;
  v16[3] = &unk_1E2AD4CF0;
  v16[4] = *(_QWORD *)(a1 + 56);
  v17 = *(id *)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  v14 = *(void **)(a1 + 96);
  v13 = *(_QWORD *)(a1 + 104);
  v18 = v12;
  v20 = v13;
  v19 = v14;
  LOBYTE(v15) = v11;
  objc_msgSend(v3, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:deviceData:webService:certChain:devSigned:completion:", v4, v6, v8, v7, v9, v10, v15, v16);

}

void __53__PKPaymentWebService_updateVerification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performVerificationRequest:selectedChannel:paymentPass:taskID:completion:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, v4);

    }
    AnalyticsSendEvent();
  }

}

- (void)_performVerificationRequest:(id)a3 selectedChannel:(id)a4 paymentPass:(id)a5 taskID:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke;
  v18[3] = &unk_1E2AD4898;
  v18[4] = self;
  v19 = v13;
  v20 = v12;
  v21 = v14;
  v15 = v14;
  v16 = v12;
  v17 = v13;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", a3, a6, v18);

}

void __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__53;
  v37 = __Block_byref_object_dispose__53;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v10 = a1[4];
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke_2;
  v22[3] = &unk_1E2AD4D40;
  v12 = v7;
  v23 = v12;
  v13 = a1[5];
  v14 = a1[4];
  v24 = v13;
  v25 = v14;
  v27 = &v33;
  v28 = &v29;
  v26 = a1[6];
  v15 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, v22);
  if (v15 != 1)
  {
    if (!v9)
    {
      objc_msgSend(a1[4], "_errorWithResult:response:data:", v15, v8, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    AnalyticsSendEvent();
    goto LABEL_8;
  }
  AnalyticsSendEvent();
  if ((unint64_t)v30[3] > 1 || objc_msgSend((id)v34[5], "verificationStatus") != 3)
  {
LABEL_8:
    (*((void (**)(void))a1[7] + 2))();
    goto LABEL_9;
  }
  v16 = a1[4];
  objc_msgSend(a1[5], "passTypeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "serialNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke_354;
  v19[3] = &unk_1E2AD4D68;
  v20 = a1[7];
  v21 = &v33;
  objc_msgSend(v16, "passWithPassTypeIdentifier:serialNumber:completion:", v17, v18, v19);

LABEL_9:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

}

uint64_t __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int16 v22;
  uint8_t buf[2];

  +[PKPaymentActivationResponse responseWithData:forPass:](PKPaymentActivationResponse, "responseWithData:forPass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    PKLogFacilityTypeGetObject(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v22 = 0;
    v13 = "no activation response";
    v14 = (uint8_t *)&v22;
LABEL_26:
    _os_log_error_impl(&dword_18FC92000, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 48), "verificationRecordForPass:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    +[PKVerificationRequestRecord verificationRequestRecordForPass:](PKVerificationRequestRecord, "verificationRequestRecordForPass:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v4);
  if (!v3)

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v2, "previousStepIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviousStepIdentifier:", v6);

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v2, "stepIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentStepIdentifier:", v8);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "verificationStatus");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setVerificationStatus:", objc_msgSend(v2, "verificationStatus"));
  v9 = objc_msgSend(v2, "verificationStatus");
  switch(v9)
  {
    case 3:
      if (*(_QWORD *)(a1 + 56))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setChannel:");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setRequiredFieldData:", 0);
      goto LABEL_23;
    case 2:
      objc_msgSend(v2, "verificationChannels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (PKShowFakeVerificationChannels())
      {
        objc_msgSend(*(id *)(a1 + 48), "_fakeVerificationChannelsWithRealChannels:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 256), "paymentWebService:filterVerificationChannels:", *(_QWORD *)(a1 + 48), v15);
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "removeRedundantChannelsFromChannels:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)v18;
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setAllChannels:", v16);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "channel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "type");

      if (v20 == 7)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setChannel:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setRequiredFieldData:", 0);

      goto LABEL_23;
    case 1:
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(v2, "requiredVerificationFieldData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRequiredFieldData:", v11);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setChannel:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setAllChannels:", 0);
LABEL_23:
      objc_msgSend(*(id *)(a1 + 48), "updateVerificationRecord:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v17 = 1;
      goto LABEL_24;
  }
  PKLogFacilityTypeGetObject(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v13 = "Unknown state";
    v14 = buf;
    goto LABEL_26;
  }
LABEL_18:

  v17 = 0;
LABEL_24:

  return v17;
}

uint64_t __97__PKPaymentWebService__performVerificationRequest_selectedChannel_paymentPass_taskID_completion___block_invoke_354(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)removeRedundantChannelsFromChannels:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v4)
  {
    v7 = 0;
    v6 = 0;
LABEL_16:
    v15 = v3;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (objc_msgSend(v10, "type") == 5)
      {
        v11 = v7;
        v12 = v6;
        v7 = v10;
      }
      else
      {
        v11 = v6;
        v12 = v10;
        if (objc_msgSend(v10, "type") != 8)
          continue;
      }
      v13 = v10;

      v6 = v12;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v5);
  if (!v7 || !v6)
    goto LABEL_16;
  v14 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v14, "removeObjectIdenticalTo:", v7);
  v15 = (void *)objc_msgSend(v14, "copy");

LABEL_17:
  v16 = v15;

  return v16;
}

- (id)_fakeVerificationChannelsWithRealChannels:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[6];
  _QWORD v41[6];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[7];

  v53[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = objc_msgSend(a3, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  v53[0] = CFSTR("fake_email");
  v52[0] = CFSTR("identifier");
  v52[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v5;
  v53[2] = MEMORY[0x1E0C9AAA0];
  v52[2] = CFSTR("requiresUserInteraction");
  v52[3] = CFSTR("contactPoint");
  v52[4] = CFSTR("sourceAddress");
  v53[3] = CFSTR("fakebank@apple.com");
  v53[4] = CFSTR("fakebank@apple.com");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v6, CFSTR("Fake Bank"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  v51[0] = CFSTR("fake_sms");
  v50[0] = CFSTR("identifier");
  v50[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v8;
  v50[2] = CFSTR("requiresUserInteraction");
  v50[3] = CFSTR("contactPoint");
  v50[4] = CFSTR("sourceAddress");
  v51[2] = MEMORY[0x1E0C9AAA0];
  v51[3] = CFSTR("123-456");
  v51[4] = CFSTR("123-456");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v9, CFSTR("Fake Bank"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  v49[0] = CFSTR("fake_inbound_call");
  v48[0] = CFSTR("identifier");
  v48[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C9AAB0];
  v49[1] = v11;
  v49[2] = MEMORY[0x1E0C9AAB0];
  v48[2] = CFSTR("requiresUserInteraction");
  v48[3] = CFSTR("contactPoint");
  v48[4] = CFSTR("sourceAddress");
  v49[3] = CFSTR("123-456");
  v49[4] = CFSTR("123-456");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v13, CFSTR("Fake Bank"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  v47[0] = CFSTR("fake_outbound_call");
  v46[0] = CFSTR("identifier");
  v46[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v15;
  v47[2] = v12;
  v46[2] = CFSTR("requiresUserInteraction");
  v46[3] = CFSTR("contactPoint");
  v46[4] = CFSTR("sourceAddress");
  v47[3] = CFSTR("(408) 300 2752");
  v47[4] = CFSTR("Bank");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v16, CFSTR("Fake Bank"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v17);

  v45[0] = CFSTR("fake_outbound_call_no_number");
  v44[0] = CFSTR("identifier");
  v44[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v18;
  v45[2] = v12;
  v44[2] = CFSTR("requiresUserInteraction");
  v44[3] = CFSTR("sourceAddress");
  v45[3] = CFSTR("Bank");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v19, CFSTR("Fake Bank"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v20);

  v43[0] = CFSTR("fake_bank_app");
  v42[0] = CFSTR("identifier");
  v42[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v21;
  v43[2] = v12;
  v42[2] = CFSTR("requiresUserInteraction");
  v42[3] = CFSTR("contactPoint");
  v42[4] = CFSTR("sourceAddress");
  v43[3] = CFSTR("Our Bank App");
  v43[4] = CFSTR("Bank");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v22, CFSTR("Fake Bank"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v23);

  v41[0] = CFSTR("fake_url");
  v40[0] = CFSTR("identifier");
  v40[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v24;
  v41[2] = CFSTR("Other");
  v40[2] = CFSTR("typeDescription");
  v40[3] = CFSTR("requiresUserInteraction");
  v25 = MEMORY[0x1E0C9AAB0];
  v41[3] = MEMORY[0x1E0C9AAB0];
  v41[4] = CFSTR("Chase App Clip or Web Page");
  v40[4] = CFSTR("contactPoint");
  v40[5] = CFSTR("sourceAddress");
  v41[5] = CFSTR("https://www.fakebank.com");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v26, CFSTR("JP Morgan Chase"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v27);

  v39[0] = CFSTR("fake_statement");
  v38[0] = CFSTR("identifier");
  v38[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v28;
  v39[2] = v25;
  v38[2] = CFSTR("requiresUserInteraction");
  v38[3] = CFSTR("contactPoint");
  v38[4] = CFSTR("sourceAddress");
  v39[3] = CFSTR("Bank Statement");
  v39[4] = CFSTR("Bank Statement");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v29, CFSTR("Fake Bank"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v30);

  v37[0] = CFSTR("fake_other");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 7, CFSTR("identifier"), CFSTR("type"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v31;
  v37[2] = CFSTR("Other");
  v36[2] = CFSTR("typeDescription");
  v36[3] = CFSTR("requiresUserInteraction");
  v37[3] = MEMORY[0x1E0C9AAB0];
  v37[4] = CFSTR("Some other method...");
  v36[4] = CFSTR("contactPoint");
  v36[5] = CFSTR("sourceAddress");
  v37[5] = CFSTR("Other");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKVerificationChannel verificationChannelWithDictionary:andOrganizationName:](PKVerificationChannel, "verificationChannelWithDictionary:andOrganizationName:", v32, CFSTR("Fake Bank"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v33);

  v34 = (void *)objc_msgSend(v4, "copy");
  return v34;
}

- (id)verificationRecordForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPaymentWebService context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "verificationRequestRecordForUniqueID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateVerificationRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PKPaymentWebService context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passUniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addVerificationRequestRecord:forUniqueID:", v4, v6);

    -[PKPaymentWebService _archiveContext](self, "_archiveContext");
  }
  if (objc_msgSend(v4, "verificationStatus") == 2)
  {
    objc_msgSend(v4, "channel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typeDescriptionUnlocalized");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v10 = CFSTR("type");
      v11[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

    }
  }

}

- (void)removeVerificationRequestRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[PKPaymentWebService context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passUniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "removeVerificationRequestRecordForUniqueID:", v6);
    -[PKPaymentWebService _archiveContext](self, "_archiveContext");
  }
}

- (unint64_t)submitVerificationCode:(id)a3 verificationData:(id)a4 forPass:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  PKPaymentSubmitActivationCodeRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKPaymentSubmitActivationCodeRequest *v24;
  unint64_t v26;
  id v27;
  id v28;
  _QWORD v29[5];
  PKPaymentSubmitActivationCodeRequest *v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v26 = v14;
    v17 = objc_alloc_init(PKPaymentSubmitActivationCodeRequest);
    -[PKPaymentSubmitActivationCodeRequest setPass:](v17, "setPass:", v12);
    -[PKPaymentSubmitActivationCodeRequest setVerificationCode:](v17, "setVerificationCode:", v10);
    v27 = v11;
    -[PKPaymentSubmitActivationCodeRequest setVerificationData:](v17, "setVerificationData:", v11);
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v17);
    objc_msgSend(v12, "passTypeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "regionForIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v10;
    if (v19)
      objc_msgSend(v19, "brokerURL");
    else
      -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSubmitActivationCodeRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v17, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v21, v16, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __82__PKPaymentWebService_submitVerificationCode_verificationData_forPass_completion___block_invoke;
    v29[3] = &unk_1E2AD4898;
    v29[4] = self;
    v30 = v17;
    v31 = v12;
    v32 = v13;
    v24 = v17;
    v14 = v26;
    -[PKWebService performRequest:taskIdentifier:cacheResponse:completionHandler:](self, "performRequest:taskIdentifier:cacheResponse:completionHandler:", v23, v26, 0, v29);

    v11 = v27;
    v10 = v28;
  }
  else
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v20);

  }
  return v14;
}

void __82__PKPaymentWebService_submitVerificationCode_verificationData_forPass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(*(id *)(a1 + 32), "_resultForResponse:error:successHandler:", v7, v8, &__block_literal_global_412);
  if (v9 == 1)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "verificationRecordForPass:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      +[PKVerificationRequestRecord verificationRequestRecordForPass:](PKVerificationRequestRecord, "verificationRequestRecordForPass:", *(_QWORD *)(a1 + 48));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v14;

    objc_msgSend(v16, "setVerificationStatus:", 3);
    objc_msgSend(*(id *)(a1 + 32), "updateVerificationRecord:", v16);
    v17 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "passTypeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "serialNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "passWithPassTypeIdentifier:serialNumber:completion:", v18, v19, *(_QWORD *)(a1 + 56));

    AnalyticsSendEvent();
  }
  else
  {
    v15 = v9;
    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v9, v7, v20);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (!v15)
      AnalyticsSendEvent();
  }

}

uint64_t __82__PKPaymentWebService_submitVerificationCode_verificationData_forPass_completion___block_invoke_2()
{
  return 1;
}

- (unint64_t)verificationChannelsForPass:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  +[PKPaymentVerificationOptionsRequest requestWithPass:](PKPaymentVerificationOptionsRequest, "requestWithPass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PKPaymentWebService_verificationChannelsForPass_completion___block_invoke;
  v11[3] = &unk_1E2AD4DB0;
  v12 = v6;
  v8 = v6;
  v9 = -[PKPaymentWebService verificationOptionsForRequest:completion:](self, "verificationOptionsForRequest:completion:", v7, v11);

  return v9;
}

void __62__PKPaymentWebService_verificationChannelsForPass_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  objc_msgSend(a3, "allChannels");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, id))(v6 + 16))(v6, a2, v8, v7);

}

- (unint64_t)requestVerificationCodeForPass:(id)a3 usingChannel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentVerificationUpdateRequest *v11;
  unint64_t v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PKPaymentVerificationUpdateRequest);
  -[PKPaymentVerificationUpdateRequest setPass:](v11, "setPass:", v10);

  -[PKPaymentVerificationUpdateRequest setChannel:](v11, "setChannel:", v9);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v11);
  v12 = -[PKPaymentWebService updateVerification:completion:](self, "updateVerification:completion:", v11, v8);

  return v12;
}

- (unint64_t)devicePassesSinceLastUpdatedTag:(BOOL)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  PKPaymentDevicePassesRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  id obj;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v18 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v20 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v6, "regions");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v21)
    {
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKeyedSubscript:", v8, v17);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_alloc_init(PKPaymentDevicePassesRequest);
          if (v18)
          {
            objc_msgSend(v9, "lastUpdatedTag");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentDevicePassesRequest setUpdatedSince:](v10, "setUpdatedSince:", v11);

          }
          -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
          objc_msgSend(v9, "brokerURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentDevicePassesRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v10, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v12, v19, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke;
          v23[3] = &unk_1E2AD4898;
          v23[4] = self;
          v24 = v6;
          v25 = v8;
          v26 = v5;
          -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v14, v20, v23);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v21);
    }

  }
  else
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v15);

  }
  return v20;
}

void __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD block[4];
  id v41;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__53;
  v38 = __Block_byref_object_dispose__53;
  v39 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = *(void **)(a1 + 32);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_2;
  v30[3] = &unk_1E2AD5080;
  v33 = &v34;
  v12 = v7;
  v31 = v12;
  v13 = v8;
  v32 = v13;
  v14 = objc_msgSend(v11, "_resultForResponse:error:successHandler:", v13, v9, v30);
  if (v14 == 1
    && (objc_msgSend((id)v35[5], "passURLs"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "count"),
        v15,
        v16))
  {
    v17 = dispatch_queue_create("passDownloadQueue", 0);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_3;
    v23[3] = &unk_1E2AD4DD8;
    v18 = *(void **)(a1 + 40);
    v23[4] = *(_QWORD *)(a1 + 32);
    v28 = &v34;
    v19 = v18;
    v20 = *(_QWORD *)(a1 + 48);
    v21 = *(void **)(a1 + 56);
    v24 = v19;
    v25 = v20;
    v27 = v21;
    v29 = 1;
    v9 = v9;
    v26 = v9;
    v22 = v23;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E2ABD9A0;
    v41 = v22;
    dispatch_async(v17, block);

  }
  else
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v14, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

  _Block_object_dispose(&v34, 8);
}

BOOL __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentPassesResponse, "responseWithData:", a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return a1[5] != 0;
}

void __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "passURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_downloadPassesWithURLs:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v11, "count");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "passURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 == v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "lastUpdatedTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_4;
      v12[3] = &unk_1E2AD4A00;
      v13 = v7;
      objc_msgSend(v9, "atomicallyUpdateRegionWithIdentifier:updateBlock:", v10, v12);
      objc_msgSend(*(id *)(a1 + 32), "_archiveContext");

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

uint64_t __70__PKPaymentWebService_devicePassesSinceLastUpdatedTag_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "regionBySettingLastUpdatedTag:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)passesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "brokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__PKPaymentWebService_passesWithRequest_completion___block_invoke;
  v16[3] = &unk_1E2AC70F8;
  v16[4] = self;
  v17 = v6;
  v14 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  return v8;
}

void __52__PKPaymentWebService_passesWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD block[4];
  id v36;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__53;
  v33 = __Block_byref_object_dispose__53;
  v34 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__PKPaymentWebService_passesWithRequest_completion___block_invoke_2;
  v25[3] = &unk_1E2AD5080;
  v28 = &v29;
  v12 = v7;
  v26 = v12;
  v13 = v8;
  v27 = v13;
  v14 = objc_msgSend(v11, "_resultForResponse:error:successHandler:", v13, v9, v25);
  if (v14 == 1
    && (objc_msgSend((id)v30[5], "passURLs"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "count"),
        v15,
        v16))
  {
    v17 = dispatch_queue_create("passDownloadQueue", 0);
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __52__PKPaymentWebService_passesWithRequest_completion___block_invoke_3;
    v20[3] = &unk_1E2AD4E00;
    v18 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v23 = &v29;
    v22 = v18;
    v24 = 1;
    v9 = v9;
    v21 = v9;
    v19 = v20;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E2ABD9A0;
    v36 = v19;
    dispatch_async(v17, block);

  }
  else
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v14, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  _Block_object_dispose(&v29, 8);
}

BOOL __52__PKPaymentWebService_passesWithRequest_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentPassesResponse, "responseWithData:", a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return a1[5] != 0;
}

void __52__PKPaymentWebService_passesWithRequest_completion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "passURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_downloadPassesWithURLs:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16))();
}

- (unint64_t)notifyIssuerAppletStateDirtyWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    objc_msgSend(v10, "brokerURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v13, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__PKPaymentWebService_notifyIssuerAppletStateDirtyWithRequest_completion___block_invoke;
    v17[3] = &unk_1E2AC5308;
    v18 = v7;
    -[PKWebService performRequest:taskIdentifier:retries:authHandling:completionHandler:](self, "performRequest:taskIdentifier:retries:authHandling:completionHandler:", v15, v8, 3, 1, v17);

  }
  return v8;
}

uint64_t __74__PKPaymentWebService_notifyIssuerAppletStateDirtyWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t result;

  v4 = objc_msgSend(a3, "statusCode");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v4 == 200);
  return result;
}

- (unint64_t)performNotificationActionRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__PKPaymentWebService_performNotificationActionRequest_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  }
  else
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

  }
  return v8;
}

void __67__PKPaymentWebService_performNotificationActionRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__53;
  v23 = __Block_byref_object_dispose__53;
  v24 = 0;
  v10 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __67__PKPaymentWebService_performNotificationActionRequest_completion___block_invoke_2;
  v16 = &unk_1E2AC2918;
  v18 = &v19;
  v11 = v7;
  v17 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v13);
  if (v12 == 1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, v20[5], 0);
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  _Block_object_dispose(&v19, 8);
}

BOOL __67__PKPaymentWebService_performNotificationActionRequest_completion___block_invoke_2(uint64_t a1)
{
  PKPaymentNotificationActionResponse *v2;
  uint64_t v3;
  void *v4;

  v2 = -[PKPaymentNotificationActionResponse initWithData:]([PKPaymentNotificationActionResponse alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)backgroundDownloadPassesSinceLastUpdatedTag:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKPaymentWebService context](self, "context", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[PKPaymentWebService backgroundDownloadPassesForPushTopic:sinceLastUpdatedTag:](self, "backgroundDownloadPassesForPushTopic:sinceLastUpdatedTag:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)backgroundDownloadPassesForPushTopic:(id)a3 sinceLastUpdatedTag:(BOOL)a4
{
  id v6;
  NSObject *backgroundDownloadQueue;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  _QWORD block[4];
  id v15;

  v6 = a3;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PKPaymentWebService_backgroundDownloadPassesForPushTopic_sinceLastUpdatedTag___block_invoke;
  v11[3] = &unk_1E2AC2F58;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v9 = v11;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v15 = v9;
  v10 = v6;
  dispatch_async(backgroundDownloadQueue, block);

}

void __80__PKPaymentWebService_backgroundDownloadPassesForPushTopic_sinceLastUpdatedTag___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  PKPaymentDevicePassesRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "regionForIdentifier:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(PKPaymentDevicePassesRequest);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v4, "lastUpdatedTag");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDevicePassesRequest setUpdatedSince:](v5, "setUpdatedSince:", v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v5);
    objc_msgSend(v4, "brokerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDevicePassesRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v5, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v7, v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C92C78], "setProperty:forKey:inRequest:", *(_QWORD *)(a1 + 40), CFSTR("regionPushTopic"), v10);
    v11 = (void *)MEMORY[0x1E0C92C78];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:inRequest:", v12, CFSTR("requestDate"), v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "downloadTaskWithRequest:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentBackgroundDownloadRecord taskWithType:](PKPaymentBackgroundDownloadRecord, "taskWithType:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addBackgroundDownloadRecord:forTaskIdentifier:", v14, objc_msgSend(v13, "taskIdentifier"));

    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = objc_msgSend(v13, "taskIdentifier");
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu:", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "logRequest:", v10);
    objc_msgSend(v13, "resume");
    objc_msgSend(*(id *)(a1 + 32), "_archiveBackgroundContext");

  }
}

- (void)getHasBackgroundDownloadTaskPassesForPushTopic:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *backgroundDownloadQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(backgroundDownloadQueue, block);

}

void __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 120);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke_2;
  v5[3] = &unk_1E2AD4E28;
  v5[1] = 3221225472;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "getTasksWithCompletionHandler:", v5);

}

void __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a4;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 176);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke_3;
  v10[3] = &unk_1E2ABE1E8;
  v10[1] = 3221225472;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v9 = v5;
  dispatch_async(v8, v10);

}

void __81__PKPaymentWebService_getHasBackgroundDownloadTaskPassesForPushTopic_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v1 = a1;
  v35 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v2 = *(id *)(a1 + 32);
  v24 = v1;
  v25 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (!v25)
  {

LABEL_24:
    (*(void (**)(void))(*(_QWORD *)(v24 + 56) + 16))();
    return;
  }
  v3 = *(_QWORD *)v27;
  v22 = 0;
  v23 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v27 != v3)
        objc_enumerationMutation(v2);
      v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      v6 = objc_msgSend(v5, "taskIdentifier", v22);
      objc_msgSend(*(id *)(v1 + 40), "backgroundContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "backgroundDownloadRecordForTaskIdentifier:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "taskType") == 1)
      {
        v9 = v2;
        v10 = (void *)MEMORY[0x1E0C92C78];
        objc_msgSend(v5, "originalRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "propertyForKey:inRequest:", CFSTR("regionPushTopic"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(v1 + 48)))
        {
          v13 = (void *)MEMORY[0x1E0C92C78];
          objc_msgSend(v5, "originalRequest");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "propertyForKey:inRequest:", CFSTR("requestDate"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = v15;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          v18 = v17;

          if (!v22 || objc_msgSend(v22, "compare:", v18) == -1)
          {
            v19 = v18;

            v22 = v19;
          }
          v2 = v9;

        }
        else
        {
          v2 = v9;
        }
        v3 = v23;
        v1 = v24;

      }
    }
    v25 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  }
  while (v25);

  if (!v22)
    goto LABEL_24;
  PKLogFacilityTypeGetObject(6uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(v24 + 48);
    *(_DWORD *)buf = 138412546;
    v31 = v21;
    v32 = 2112;
    v33 = v22;
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Found existing background download passes request with push topic: %@; request date: %@",
      buf,
      0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(v24 + 56) + 16))();
}

- (unint64_t)passAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__PKPaymentWebService_passAtURL_completion___block_invoke;
  v10[3] = &unk_1E2AD4E50;
  v11 = v6;
  v7 = v6;
  v8 = -[PKPaymentWebService _downloadPassAtURL:completion:](self, "_downloadPassAtURL:completion:", a3, v10);

  return v8;
}

uint64_t __44__PKPaymentWebService_passAtURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)backgroundDownloadPassAtURL:(id)a3
{
  id v4;
  NSObject *backgroundDownloadQueue;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PKPaymentWebService_backgroundDownloadPassAtURL___block_invoke;
  v9[3] = &unk_1E2ABE0D0;
  v9[4] = self;
  v10 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  v8 = v4;
  dispatch_async(backgroundDownloadQueue, block);

}

void __51__PKPaymentWebService_backgroundDownloadPassAtURL___block_invoke(uint64_t a1)
{
  PKPaymentWebServiceRequest *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PKPaymentWebServiceRequest);
  objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v2);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKWebServiceRequest _murlRequestWithURL:appleAccountInformation:](v2, "_murlRequestWithURL:appleAccountInformation:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "downloadTaskWithRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentBackgroundDownloadRecord taskWithType:](PKPaymentBackgroundDownloadRecord, "taskWithType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addBackgroundDownloadRecord:forTaskIdentifier:", v7, objc_msgSend(v6, "taskIdentifier"));

  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "taskIdentifier");
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 134218242;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu for %@:", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logRequest:", v5);
  objc_msgSend(v6, "resume");
  objc_msgSend(*(id *)(a1 + 32), "_archiveBackgroundContext");

}

- (void)backgroundDownloadRemotePassAssets:(id)a3
{
  -[PKPaymentWebService backgroundDownloadRemotePassAssets:cloudStoreCoordinatorDelegate:](self, "backgroundDownloadRemotePassAssets:cloudStoreCoordinatorDelegate:", a3, 0);
}

- (void)backgroundDownloadRemotePassAssets:(id)a3 cloudStoreCoordinatorDelegate:(id)a4
{
  -[PKPaymentWebService backgroundDownloadRemotePassAssets:forSuffixesAndScreenScales:cloudStoreCoordinatorDelegate:](self, "backgroundDownloadRemotePassAssets:forSuffixesAndScreenScales:cloudStoreCoordinatorDelegate:", a3, 0, a4);
}

- (void)backgroundDownloadRemotePassAssets:(id)a3 forSuffixesAndScreenScales:(id)a4
{
  -[PKPaymentWebService backgroundDownloadRemotePassAssets:forSuffixesAndScreenScales:cloudStoreCoordinatorDelegate:](self, "backgroundDownloadRemotePassAssets:forSuffixesAndScreenScales:cloudStoreCoordinatorDelegate:", a3, a4, 0);
}

- (void)backgroundDownloadRemotePassAssets:(id)a3 forSuffixesAndScreenScales:(id)a4 cloudStoreCoordinatorDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *backgroundDownloadQueue;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PKPaymentWebService *v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v25 = &stru_1E2ADF4C0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", PKScreenScale());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke;
  v18[3] = &unk_1E2AC0F90;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v22 = v10;
  v14 = v18;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v24 = v14;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  dispatch_async(backgroundDownloadQueue, block);

}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  id WeakRetained;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  id v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  void *v33;
  id v34;
  id v35;
  int8x16_t v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  int8x16_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint8_t v61[128];
  _BYTE buf[24];
  void *v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "organizationName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serialNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Downloading Remote Pass Assets for %@:%@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_movePassToDownloadCache:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v5;
  if (v5)
  {
    objc_msgSend(v5, "dataAccessor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "secureElementIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteAssetManagerForSEIDs:", v7);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "remoteAssetManifests");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      +[PKPaymentBackgroundDownloadRecord taskWithType:](PKPaymentBackgroundDownloadRecord, "taskWithType:", 3);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "dataAccessor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPassURL:", v9);

      v57 = 0;
      v58 = &v57;
      v59 = 0x2020000000;
      v60 = 1;
      v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v11 = v33;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v54 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
            v16 = *(void **)(a1 + 48);
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_436;
            v46[3] = &unk_1E2AD4E78;
            v46[4] = v15;
            v47 = v10;
            v17 = v37;
            v52 = &v57;
            v18 = *(_QWORD *)(a1 + 40);
            v48 = v17;
            v49 = v18;
            v50 = v35;
            v51 = *(id *)(a1 + 56);
            objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v46);

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v12);
      }

      if (*((_BYTE *)v58 + 24))
      {
        PKLogFacilityTypeGetObject(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v34, "organizationName");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "serialNumber");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v21;
          _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "No background download tasks -- delivering pass immediately: %@:%@", buf, 0x16u);

        }
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 248));
        dispatch_get_global_queue(21, 0);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = MEMORY[0x1E0C809B0];
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_441;
        v42[3] = &unk_1E2ABE0F8;
        v25 = *(_QWORD *)(a1 + 40);
        v43 = WeakRetained;
        v44 = v25;
        v45 = v34;
        v26 = v42;
        *(_QWORD *)buf = v24;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke_14;
        v63 = &unk_1E2ABD9A0;
        v64 = v26;
        v27 = WeakRetained;
        dispatch_async(v23, buf);

      }
      objc_msgSend(*(id *)(a1 + 40), "_archiveBackgroundContext");

      _Block_object_dispose(&v57, 8);
    }
    else
    {
      v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 248));
      dispatch_get_global_queue(21, 0);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_443;
      v38[3] = &unk_1E2AC0F90;
      v39 = v28;
      v36 = *(int8x16_t *)(a1 + 32);
      v31 = (id)v36.i64[0];
      v40 = vextq_s8(v36, v36, 8uLL);
      v41 = v34;
      v32 = v38;
      *(_QWORD *)buf = v30;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke_14;
      v63 = &unk_1E2ABD9A0;
      v64 = v32;
      v35 = v28;
      dispatch_async(v29, buf);

    }
    v5 = v34;
  }

}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_436(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  float v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  os_log_t loga;
  NSObject *log;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "length"))
  {

    v5 = 0;
  }
  objc_msgSend(v6, "floatValue");
  objc_msgSend(*(id *)(a1 + 32), "deviceSpecificAssetForScreenScale:suffix:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = (uint64_t)v12;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "**** ERROR **** : Could not find device specific asset for manifest: %@", buf, 0xCu);

LABEL_31:
    goto LABEL_32;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9))
  {
    objc_msgSend(v8, "localURL");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v10, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

    if (v15)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v10);
      objc_msgSend(v12, "SHA1Hash");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hexEncoding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "sha1Hex");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v17);

      if (v19)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v39 = (uint64_t)v9;
          _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Not downloading: %@ since the asset already exists in the pass directory", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 48), "addRemoteAssetData:shouldWriteData:forManifestItem:error:", v12, 0, v8, 0);
      }

      goto LABEL_31;
    }
    objc_msgSend(v8, "sha1Hex");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKCachedFileForSHA1(v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        PKPassAssetDownloadCachePath();
        loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sha1Hex");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringByAppendingPathComponent:](loga, "stringByAppendingPathComponent:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = (uint64_t)v9;
        v40 = 2112;
        v41 = v24;
        _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Using cached copy of %@ at %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 48), "addRemoteAssetData:forManifestItem:error:", v12, v8, 0);
      goto LABEL_31;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    v25 = objc_msgSend(v8, "itemType");
    if (v25 == 1)
    {
      v27 = v8;
      objc_msgSend(v27, "recordName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(6uLL);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = (uint64_t)v26;
        _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "Background downloading from the cloud store: \"%@\", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 64), "setRemoteCloudStoreAsset:forRecordName:", v27, v26);
      objc_msgSend(*(id *)(a1 + 56), "backgroundContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addBackgroundDownloadRecord:forRecordName:", *(_QWORD *)(a1 + 64), v26);

      objc_msgSend(*(id *)(a1 + 56), "_backgroundDownloadCloudStoreAssetsforItem:cloudStoreCoordinatorDelegate:", v27, *(_QWORD *)(a1 + 72));
    }
    else
    {
      if (v25)
      {
LABEL_30:
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        v12 = 0;
        goto LABEL_31;
      }
      PKLogFacilityTypeGetObject(6uLL);
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = (uint64_t)v9;
        _os_log_impl(&dword_18FC92000, log, OS_LOG_TYPE_DEFAULT, "Background downloading: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 120), "downloadTaskWithRequest:", v26);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "taskIdentifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setRemoteURLAsset:forTaskIdentifier:", v8, v29);

      objc_msgSend(*(id *)(a1 + 56), "backgroundContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addBackgroundDownloadRecord:forTaskIdentifier:", *(_QWORD *)(a1 + 64), objc_msgSend(v27, "taskIdentifier"));

      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_msgSend(v27, "taskIdentifier");
        objc_msgSend(v8, "localURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v39 = v35;
        v40 = 2112;
        v41 = v32;
        _os_log_impl(&dword_18FC92000, log, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu for %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 56), "logRequest:", v26);
      objc_msgSend(v27, "resume");
    }

    goto LABEL_30;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = (uint64_t)v9;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Download already requested for %@", buf, 0xCu);
  }
LABEL_32:

}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_441(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = (void *)a1[6];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_2;
  v4[3] = &unk_1E2ABE120;
  v5 = v3;
  objc_msgSend(v1, "paymentWebService:didDownloadPassRemoteAssets:completion:", v2, v5, v4);

}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_2(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataAccessor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up download cache copy of pass: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtURL:error:", v5, 0);

  }
}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_443(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_2_444;
  v4[3] = &unk_1E2ABE120;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "paymentWebService:didDownloadPassRemoteAssets:completion:", v2, v3, v4);

}

void __115__PKPaymentWebService_backgroundDownloadRemotePassAssets_forSuffixesAndScreenScales_cloudStoreCoordinatorDelegate___block_invoke_2_444(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataAccessor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up download cache copy of pass: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtURL:error:", v5, 0);

  }
}

- (unint64_t)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  PKPaymentPassRequest *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "regionForIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "brokerURL");
  else
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKPaymentPassRequest initWithPassTypeID:serialNumber:]([PKPaymentPassRequest alloc], "initWithPassTypeID:serialNumber:", v8, v10);

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v15);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassRequest _urlRequestWithServiceURL:appleAccountInformation:](v15, "_urlRequestWithServiceURL:appleAccountInformation:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__PKPaymentWebService_passWithPassTypeIdentifier_serialNumber_completion___block_invoke;
  v20[3] = &unk_1E2AC70F8;
  v20[4] = self;
  v21 = v9;
  v18 = v9;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v17, v11, v20);

  return v11;
}

uint64_t __74__PKPaymentWebService_passWithPassTypeIdentifier_serialNumber_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_passWithData:response:error:completion:", a2, a3, a4, *(_QWORD *)(a1 + 40));
}

- (void)backgroundDownloadWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6;
  id v7;
  NSObject *backgroundDownloadQueue;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PKPaymentWebService_backgroundDownloadWithPassTypeIdentifier_serialNumber___block_invoke;
  v13[3] = &unk_1E2ABE0F8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v13;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v17 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(backgroundDownloadQueue, block);

}

void __77__PKPaymentWebService_backgroundDownloadWithPassTypeIdentifier_serialNumber___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  PKPaymentPassRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "brokerURL");
  else
    objc_msgSend(*(id *)(a1 + 32), "primaryBrokerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPaymentPassRequest initWithPassTypeID:serialNumber:]([PKPaymentPassRequest alloc], "initWithPassTypeID:serialNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassRequest _urlRequestWithServiceURL:appleAccountInformation:](v5, "_urlRequestWithServiceURL:appleAccountInformation:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "logRequest:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "downloadTaskWithRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "taskIdentifier");
    objc_msgSend(v7, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218242;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu: %@", (uint8_t *)&v14, 0x16u);

  }
  +[PKPaymentBackgroundDownloadRecord taskWithType:](PKPaymentBackgroundDownloadRecord, "taskWithType:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addBackgroundDownloadRecord:forTaskIdentifier:", v12, objc_msgSend(v8, "taskIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "_archiveBackgroundContext");
  objc_msgSend(v8, "resume");

}

- (void)backgroundRegisterCredentialWithRequest:(id)a3
{
  id v4;
  NSObject *backgroundDownloadQueue;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PKPaymentWebService_backgroundRegisterCredentialWithRequest___block_invoke;
  v9[3] = &unk_1E2ABE0D0;
  v9[4] = self;
  v10 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  v8 = v4;
  dispatch_async(backgroundDownloadQueue, block);

}

void __63__PKPaymentWebService_backgroundRegisterCredentialWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPaymentBackgroundRegisterCredentialRecord *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "primaryBrokerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v5, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logRequest:", v7);
  objc_msgSend(*(id *)(a1 + 40), "credential");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentBackgroundRegisterCredentialRecord initWithCredentialIdentifier:]([PKPaymentBackgroundRegisterCredentialRecord alloc], "initWithCredentialIdentifier:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "dataTaskWithRequest:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0x16uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v15 = 134218242;
      v16 = objc_msgSend(v11, "taskIdentifier");
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Creating background credential registration task (%lu) for credential: %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addBackgroundDownloadRecord:forTaskIdentifier:", v10, objc_msgSend(v11, "taskIdentifier"));

    objc_msgSend(*(id *)(a1 + 32), "_archiveBackgroundContext");
    objc_msgSend(v11, "resume");
  }
  else
  {
    if (v13)
    {
      v15 = 138412290;
      v16 = (uint64_t)v9;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create background credential registration task for credential: %@", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (unint64_t)pushProvisioningSharingIdentifiersWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PKPaymentWebService_pushProvisioningSharingIdentifiersWithRequest_completion___block_invoke;
  v16[3] = &unk_1E2AC5308;
  v17 = v6;
  v14 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v10, v16);

  return v10;
}

void __80__PKPaymentWebService_pushProvisioningSharingIdentifiersWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  PKPaymentPushProvisioningSharingIdentifiersResponse *v8;

  v6 = a4;
  v7 = a2;
  v8 = -[PKPaymentPushProvisioningSharingIdentifiersResponse initWithData:]([PKPaymentPushProvisioningSharingIdentifiersResponse alloc], "initWithData:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)pushProvisioningSharingStatusRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__PKPaymentWebService_pushProvisioningSharingStatusRequest_completion___block_invoke;
  v16[3] = &unk_1E2AC5308;
  v17 = v6;
  v14 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v10, v16);

  return v10;
}

void __71__PKPaymentWebService_pushProvisioningSharingStatusRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  PKPaymentPushProvisioningSharingStatusResponse *v8;

  v6 = a4;
  v7 = a2;
  v8 = -[PKPaymentPushProvisioningSharingStatusResponse initWithData:]([PKPaymentPushProvisioningSharingStatusResponse alloc], "initWithData:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)provideEncryptedPushProvisioningTargetWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PKPaymentWebService_provideEncryptedPushProvisioningTargetWithRequest_completion___block_invoke;
  v16[3] = &unk_1E2AC5308;
  v17 = v6;
  v14 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v10, v16);

  return v10;
}

uint64_t __84__PKPaymentWebService_provideEncryptedPushProvisioningTargetWithRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)contactInformationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__PKPaymentWebService_contactInformationWithRequest_completion___block_invoke;
  v16[3] = &unk_1E2AC70F8;
  v16[4] = self;
  v17 = v6;
  v14 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v10, v16);

  return v10;
}

void __64__PKPaymentWebService_contactInformationWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__53;
  v26 = __Block_byref_object_dispose__53;
  v27 = 0;
  v10 = *(void **)(a1 + 32);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__PKPaymentWebService_contactInformationWithRequest_completion___block_invoke_2;
  v19 = &unk_1E2AC2918;
  v21 = &v22;
  v11 = v7;
  v20 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v16);
  if (!v9)
  {
    v13 = v12;
    if (v12 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v16, v17, v18, v19);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
  {
    objc_msgSend((id)v23[5], "contactInformation", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v9);

  }
  _Block_object_dispose(&v22, 8);

}

BOOL __64__PKPaymentWebService_contactInformationWithRequest_completion___block_invoke_2(uint64_t a1)
{
  PKContactInformationResponse *v2;
  uint64_t v3;
  void *v4;

  v2 = -[PKContactInformationResponse initWithData:]([PKContactInformationResponse alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)availableProductsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    PKProductsURL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v13;

    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v15, v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__PKPaymentWebService_availableProductsWithRequest_completion___block_invoke;
    v19[3] = &unk_1E2AC70F8;
    v19[4] = self;
    v20 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v17, v8, v19);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

  }
  return v8;
}

void __63__PKPaymentWebService_availableProductsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__53;
  v28 = __Block_byref_object_dispose__53;
  v29 = 0;
  v10 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __63__PKPaymentWebService_availableProductsWithRequest_completion___block_invoke_2;
  v20[3] = &unk_1E2AD5080;
  v11 = v8;
  v21 = v11;
  v23 = &v24;
  v12 = v7;
  v22 = v12;
  v13 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v11, v9, v20);
  PKGetPaymentSetupProductState();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = PKPaymentSetupProductStateFromString(v14);

  if (!v15 || v13)
  {
    if (!v9 && v13 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v13, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", &unk_1E2C40FD0, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKWebServiceResponse responseWithData:](PKPaymentAvailableProductsResponse, "responseWithData:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v25[5];
    v25[5] = v17;

    v13 = 1;
  }
  v19 = *(_QWORD *)(a1 + 40);
  if (v19)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v19 + 16))(v19, v13, v25[5], v9);

  _Block_object_dispose(&v24, 8);
}

BOOL __63__PKPaymentWebService_availableProductsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "allHeaderFields");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  +[PKWebServiceResponse responseWithData:headers:](PKPaymentAvailableProductsResponse, "responseWithData:headers:", *(_QWORD *)(a1 + 40), v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v6;
}

- (unint64_t)availableCommonProductsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  objc_msgSend(v7, "_urlRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKPaymentWebService_availableCommonProductsWithRequest_completion___block_invoke;
  v12[3] = &unk_1E2AC70F8;
  v12[4] = self;
  v13 = v6;
  v10 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v8, v12);

  return v8;
}

void __69__PKPaymentWebService_availableCommonProductsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__53;
  v24 = __Block_byref_object_dispose__53;
  v25 = 0;
  v10 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PKPaymentWebService_availableCommonProductsWithRequest_completion___block_invoke_2;
  v16[3] = &unk_1E2AD5080;
  v11 = v8;
  v17 = v11;
  v19 = &v20;
  v12 = v7;
  v18 = v12;
  v13 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v11, v9, v16);
  v14 = v13;
  if (!v9 && v13 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", v13, v11, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v15 + 16))(v15, v14, v21[5], v9);

  _Block_object_dispose(&v20, 8);
}

BOOL __69__PKPaymentWebService_availableCommonProductsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "allHeaderFields");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  +[PKWebServiceResponse responseWithData:headers:](PKPaymentAvailableProductsResponse, "responseWithData:headers:", *(_QWORD *)(a1 + 40), v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v6;
}

- (unint64_t)performProductActionRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    PKProductsURL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v13;

    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v15, v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__PKPaymentWebService_performProductActionRequest_completion___block_invoke;
    v19[3] = &unk_1E2AC70F8;
    v19[4] = self;
    v20 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v17, v8, v19);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

  }
  return v8;
}

void __62__PKPaymentWebService_performProductActionRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__53;
  v29 = __Block_byref_object_dispose__53;
  v30 = 0;
  v10 = *(void **)(a1 + 32);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __62__PKPaymentWebService_performProductActionRequest_completion___block_invoke_2;
  v22 = &unk_1E2AC2918;
  v24 = &v25;
  v11 = v7;
  v23 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v19);
  PKGetPaymentSetupProductState();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PKPaymentSetupProductStateFromString(v13);

  if (!v14 || v12)
  {
    if (!v9 && v12 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v19, v20, v21, v22);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", &unk_1E2C40FF8, 0, 0, v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKWebServiceResponse responseWithData:](PKPaymentAvailableProductsResponse, "responseWithData:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v26[5];
    v26[5] = v16;

    v12 = 1;
  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v18 + 16))(v18, v12, v26[5], v9);

  _Block_object_dispose(&v25, 8);
}

BOOL __62__PKPaymentWebService_performProductActionRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentAvailableProductsResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)browseableBankAppsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__PKPaymentWebService_browseableBankAppsWithRequest_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

  }
  return v8;
}

void __64__PKPaymentWebService_browseableBankAppsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__53;
  v26 = __Block_byref_object_dispose__53;
  v27 = 0;
  v10 = *(void **)(a1 + 32);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__PKPaymentWebService_browseableBankAppsWithRequest_completion___block_invoke_2;
  v19 = &unk_1E2AC2918;
  v21 = &v22;
  v11 = v7;
  v20 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v16);
  v13 = v12;
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v16, v17, v18, v19);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error retreiving partner banks: %@", buf, 0xCu);
    }

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v15 + 16))(v15, v13, v23[5], v9);

  _Block_object_dispose(&v22, 8);
}

BOOL __64__PKPaymentWebService_browseableBankAppsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentBrowseableBankAppsResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)provisioningMethodWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__PKPaymentWebService_provisioningMethodWithRequest_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);

  }
  return v8;
}

void __64__PKPaymentWebService_provisioningMethodWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__53;
  v25 = __Block_byref_object_dispose__53;
  v26 = 0;
  v10 = *(void **)(a1 + 32);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __64__PKPaymentWebService_provisioningMethodWithRequest_completion___block_invoke_2;
  v18 = &unk_1E2AC2918;
  v20 = &v21;
  v11 = v7;
  v19 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v15);
  v13 = v12;
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v15, v16, v17, v18);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v22[5], v9);

  _Block_object_dispose(&v21, 8);
}

BOOL __64__PKPaymentWebService_provisioningMethodWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentProvisioningMethodMetadataResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)passUpgradeWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__PKPaymentWebService_passUpgradeWithRequest_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  }
  else if (v7)
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v14, 0);

  }
  return v8;
}

void __57__PKPaymentWebService_passUpgradeWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__53;
  v25 = __Block_byref_object_dispose__53;
  v26 = 0;
  v10 = *(void **)(a1 + 32);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __57__PKPaymentWebService_passUpgradeWithRequest_completion___block_invoke_2;
  v18 = &unk_1E2AC2918;
  v20 = &v21;
  v11 = v7;
  v19 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v15);
  if (v12 != 1)
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v15, v16, v17, v18);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Pass update request action failed with error %@", buf, 0xCu);
    }

  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, id, uint64_t))(v14 + 16))(v14, v9, v22[5]);

  _Block_object_dispose(&v21, 8);
}

BOOL __57__PKPaymentWebService_passUpgradeWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentRequestPassUpdateResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)paymentProvisioningNonceOfType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentProvisioningNonceRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPaymentProvisioningNonceRequest initWithNonceType:]([PKPaymentProvisioningNonceRequest alloc], "initWithNonceType:", a3);
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v11);
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentProvisioningNonceRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v11, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v10, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__PKPaymentWebService_paymentProvisioningNonceOfType_completion___block_invoke;
    v16[3] = &unk_1E2AC70F8;
    v16[4] = self;
    v17 = v6;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v7, v16);

  }
  else
  {
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v14);

  }
  return v7;
}

void __65__PKPaymentWebService_paymentProvisioningNonceOfType_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__53;
  v19[4] = __Block_byref_object_dispose__53;
  v20 = 0;
  v10 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __65__PKPaymentWebService_paymentProvisioningNonceOfType_completion___block_invoke_2;
  v16 = &unk_1E2AC2918;
  v18 = v19;
  v11 = v7;
  v17 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v13);
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  _Block_object_dispose(v19, 8);
}

BOOL __65__PKPaymentWebService_paymentProvisioningNonceOfType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentProvisioningNonceResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 forPass:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "remoteContentConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requiresAppletData");

  if (v12)
    v13 = -[PKPaymentWebService _passActionIncludingAppletDataWithRemoteContentPassAction:pass:completion:](self, "_passActionIncludingAppletDataWithRemoteContentPassAction:pass:completion:", v10, v9, v8);
  else
    v13 = -[PKPaymentWebService _passActionWithRemoteContentPassAction:pass:completion:](self, "_passActionWithRemoteContentPassAction:pass:completion:", v10, v9, v8);
  v14 = v13;

  return v14;
}

- (unint64_t)_passActionIncludingAppletDataWithRemoteContentPassAction:(id)a3 pass:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    targetDevice = self->_targetDevice;
    objc_msgSend(v9, "secureElementPass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteContentConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "appletDataRequiresEncryption");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__PKPaymentWebService__passActionIncludingAppletDataWithRemoteContentPassAction_pass_completion___block_invoke;
    v21[3] = &unk_1E2AD4EA0;
    v24 = v10;
    v21[4] = self;
    v22 = v8;
    v23 = v9;
    -[PKPaymentWebServiceTargetDeviceProtocol serviceProviderDataForSecureElementPass:encrypted:completion:](targetDevice, "serviceProviderDataForSecureElementPass:encrypted:completion:", v15, v17, v21);

    v18 = v24;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "No device identifier present - exiting early", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v18);
  }

  return v11;
}

void __97__PKPaymentWebService__passActionIncludingAppletDataWithRemoteContentPassAction_pass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_passActionWithRemoteContentPassAction:serviceProviderData:pass:completion:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Received nil service provider data with error %@", (uint8_t *)&v9, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 forDeviceIdentifier:(id)a4 passTypeIdentifier:(id)a5 passSerialNumber:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  PKPaymentRemoteContentPassActionRequest *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v26;
  uint8_t buf[16];
  _QWORD v28[4];
  id v29;
  id v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[PKWebService nextTaskID](self, "nextTaskID");
  if (v13)
  {
    v18 = objc_alloc_init(PKPaymentRemoteContentPassActionRequest);
    -[PKPaymentRemoteContentPassActionRequest setAction:](v18, "setAction:", v12);
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v18);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v20 = v12;
    v21 = v17;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRemoteContentPassActionRequest _urlRequestWithServiceURL:deviceIdentifier:passTypeIdentifier:passSerialNumber:appleAccountInformation:](v18, "_urlRequestWithServiceURL:deviceIdentifier:passTypeIdentifier:passSerialNumber:appleAccountInformation:", v19, v13, v14, v15, v22);
    v26 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v21;
    v12 = v20;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __128__PKPaymentWebService_passActionWithRemoteContentPassAction_forDeviceIdentifier_passTypeIdentifier_passSerialNumber_completion___block_invoke;
    v28[3] = &unk_1E2AC70F8;
    v29 = v20;
    v30 = v16;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v23, v17, v28);

    v14 = v26;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action, deviceID is nil", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }

  return v17;
}

void __128__PKPaymentWebService_passActionWithRemoteContentPassAction_forDeviceIdentifier_passTypeIdentifier_passSerialNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  PKPaymentRemoteContentPassActionResponse *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action failed with error %@", (uint8_t *)&v15, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v11 = -[PKPaymentRemoteContentPassActionResponse initWithExistingAction:pass:data:]([PKPaymentRemoteContentPassActionResponse alloc], "initWithExistingAction:pass:data:", *(_QWORD *)(a1 + 32), 0, v7);
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    -[PKPaymentRemoteContentPassActionResponse updatedAction](v11, "updatedAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v10);

  }
}

- (unint64_t)_passActionWithRemoteContentPassAction:(id)a3 pass:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PKPaymentRemoteContentPassActionRequest *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  void *v27;
  uint8_t buf[8];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "passTypeIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v27 = v15;
    v16 = objc_alloc_init(PKPaymentRemoteContentPassActionRequest);
    -[PKPaymentRemoteContentPassActionRequest setAction:](v16, "setAction:", v8);
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v16);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v18 = v10;
    v19 = v11;
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRemoteContentPassActionRequest _urlRequestWithServiceURL:deviceIdentifier:passTypeIdentifier:passSerialNumber:appleAccountInformation:](v16, "_urlRequestWithServiceURL:deviceIdentifier:passTypeIdentifier:passSerialNumber:appleAccountInformation:", v17, v13, v14, v27, v21);
    v26 = (void *)v14;
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v20;
    v11 = v19;
    v10 = v18;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __78__PKPaymentWebService__passActionWithRemoteContentPassAction_pass_completion___block_invoke;
    v29[3] = &unk_1E2ACB638;
    v30 = v8;
    v31 = v9;
    v32 = v18;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v22, v11, v29);

    v23 = v26;
    v15 = v27;
  }
  else
  {
    v23 = (void *)v14;
    PKLogFacilityTypeGetObject(6uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action, deviceID is nil", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

  return v11;
}

void __78__PKPaymentWebService__passActionWithRemoteContentPassAction_pass_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  PKPaymentRemoteContentPassActionResponse *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action failed with error %@", (uint8_t *)&v15, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v11 = -[PKPaymentRemoteContentPassActionResponse initWithExistingAction:pass:data:]([PKPaymentRemoteContentPassActionResponse alloc], "initWithExistingAction:pass:data:", a1[4], a1[5], v7);
  }
  v13 = a1[6];
  if (v13)
  {
    -[PKPaymentRemoteContentPassActionResponse updatedAction](v11, "updatedAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v10);

  }
}

- (unint64_t)passActionWithRemoteContentPassAction:(id)a3 serviceProviderData:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  unint64_t v16;
  unint64_t v17;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v13, "remoteContentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "requiresAppletData");

  if (v15)
    v16 = -[PKPaymentWebService _passActionWithRemoteContentPassAction:serviceProviderData:pass:completion:](self, "_passActionWithRemoteContentPassAction:serviceProviderData:pass:completion:", v13, v10, v12, v11);
  else
    v16 = -[PKPaymentWebService _passActionWithRemoteContentPassAction:pass:completion:](self, "_passActionWithRemoteContentPassAction:pass:completion:", v13, v12, v11);
  v17 = v16;

  return v17;
}

- (unint64_t)_passActionWithRemoteContentPassAction:(id)a3 serviceProviderData:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[PKWebService nextTaskID](self, "nextTaskID");
  if (v11)
  {
    objc_msgSend(v10, "setAppletData:", v11);
    -[PKPaymentWebService _passActionWithRemoteContentPassAction:pass:completion:](self, "_passActionWithRemoteContentPassAction:pass:completion:", v10, v12, v13);
    v15 = v13;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Error: Found nil encrypted service provider data.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v19;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Found nil service provider data; returning error: %@",
        (uint8_t *)&v21,
        0xCu);

    }
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v15);

  }
  return v14;
}

- (unint64_t)passActionGroupWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  unint64_t v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKPaymentWebService context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "remoteContentConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "requiresAppletData");

  if (v14)
    v15 = -[PKPaymentWebService _passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup:forPass:forDeviceIdentifier:completion:](self, "_passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup:forPass:forDeviceIdentifier:completion:", v10, v9, v12, v8);
  else
    v15 = -[PKPaymentWebService _passActionGroupWithRemoteContentPassActionGroup:forPass:forDeviceIdentifier:completion:](self, "_passActionGroupWithRemoteContentPassActionGroup:forPass:forDeviceIdentifier:completion:", v10, v9, v12, v8);
  v16 = v15;

  return v16;
}

- (unint64_t)_passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 forDeviceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(id, _QWORD, void *);
  id v31;
  unint64_t v32;
  _QWORD v33[4];
  id v34;
  PKPaymentWebService *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = -[PKWebService nextTaskID](self, "nextTaskID");
  objc_msgSend(v11, "passTypeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "No device identifier present - exiting early", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v18);

  }
  objc_msgSend(v11, "secureElementPass", self->_targetDevice);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteContentConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "appletDataRequiresEncryption");
  v22 = v14;
  v32 = v14;
  v23 = v21;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __130__PKPaymentWebService__passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke;
  v33[3] = &unk_1E2AD4EC8;
  v34 = v10;
  v35 = self;
  v36 = v12;
  v37 = v15;
  v40 = v13;
  v41 = v22;
  v38 = v16;
  v39 = v11;
  v24 = v11;
  v25 = v16;
  v26 = v15;
  v27 = v12;
  v28 = v10;
  v29 = v13;
  objc_msgSend(v31, "serviceProviderDataForSecureElementPass:encrypted:completion:", v19, v23, v33);

  return v32;
}

void __130__PKPaymentWebService__passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKPaymentRemoteContentPassActionGroupRequest *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAppletData:", v5);
    objc_msgSend(*(id *)(a1 + 40), "primaryBrokerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(PKPaymentRemoteContentPassActionGroupRequest);
    -[PKPaymentRemoteContentPassActionGroupRequest setActionGroup:](v8, "setActionGroup:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_updateRequestWithCurrentTargetDevice:", v8);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_appleAccountInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRemoteContentPassActionGroupRequest _urlRequestWithServiceURL:deviceIdentifier:passTypeIdentifier:passSerialNumber:appleAccountInformation:](v8, "_urlRequestWithServiceURL:deviceIdentifier:passTypeIdentifier:passSerialNumber:appleAccountInformation:", v7, v11, v9, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 88);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __130__PKPaymentWebService__passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke_472;
    v18[3] = &unk_1E2ACB638;
    v15 = *(void **)(a1 + 40);
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 72);
    v21 = *(id *)(a1 + 80);
    objc_msgSend(v15, "performRequest:taskIdentifier:completionHandler:", v13, v14, v18);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Received nil service provider data with error %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

void __130__PKPaymentWebService__passActionGroupIncludingAppletDataWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke_472(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  PKPaymentRemoteContentPassActionGroupResponse *v11;
  uint64_t v12;
  void *v13;
  PKPaymentRemoteContentPassActionGroupResponse *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Get pass action group with group identifier failed with error %@", (uint8_t *)&v18, 0xCu);
    }

    v14 = 0;
  }
  else
  {
    v11 = [PKPaymentRemoteContentPassActionGroupResponse alloc];
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "secureElementPass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKPaymentRemoteContentPassActionGroupResponse initWithExistingActionGroup:data:pass:](v11, "initWithExistingActionGroup:data:pass:", v12, v7, v13);

  }
  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
  {
    -[PKPaymentRemoteContentPassActionGroupResponse updatedActionGroup](v14, "updatedActionGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v10);

  }
}

- (unint64_t)_passActionGroupWithRemoteContentPassActionGroup:(id)a3 forPass:(id)a4 forDeviceIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PKPaymentRemoteContentPassActionGroupRequest *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[8];
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[PKWebService nextTaskID](self, "nextTaskID");
  objc_msgSend(v11, "passTypeIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialNumber");
  v16 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(PKPaymentRemoteContentPassActionGroupRequest);
  -[PKPaymentRemoteContentPassActionGroupRequest setActionGroup:](v18, "setActionGroup:", v10);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v18);
  v32 = v12;
  if (v12)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v18);
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v30 = v13;
    v19 = v11;
    v20 = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRemoteContentPassActionGroupRequest _urlRequestWithServiceURL:deviceIdentifier:passTypeIdentifier:passSerialNumber:appleAccountInformation:](v18, "_urlRequestWithServiceURL:deviceIdentifier:passTypeIdentifier:passSerialNumber:appleAccountInformation:", v17, v12, v15, v16, v21);
    v22 = (void *)v16;
    v23 = (void *)v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v20;
    v25 = v10;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __111__PKPaymentWebService__passActionGroupWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke;
    v34[3] = &unk_1E2ACB638;
    v35 = v10;
    v26 = v19;
    v36 = v19;
    v13 = v30;
    v37 = v30;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v24, v14, v34);

    v27 = v32;
  }
  else
  {
    v31 = v11;
    v22 = (void *)v16;
    v23 = (void *)v15;
    PKLogFacilityTypeGetObject(6uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Get pass action with remote content pass action, deviceID is nil", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
    v25 = v10;
    v26 = v31;
    v27 = 0;
  }

  return v14;
}

void __111__PKPaymentWebService__passActionGroupWithRemoteContentPassActionGroup_forPass_forDeviceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  PKPaymentRemoteContentPassActionGroupResponse *v11;
  uint64_t v12;
  void *v13;
  PKPaymentRemoteContentPassActionGroupResponse *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Get pass action group with group identifier failed with error %@", (uint8_t *)&v18, 0xCu);
    }

    v14 = 0;
  }
  else
  {
    v11 = [PKPaymentRemoteContentPassActionGroupResponse alloc];
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "secureElementPass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKPaymentRemoteContentPassActionGroupResponse initWithExistingActionGroup:data:pass:](v11, "initWithExistingActionGroup:data:pass:", v12, v7, v13);

  }
  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
  {
    -[PKPaymentRemoteContentPassActionGroupResponse updatedActionGroup](v14, "updatedActionGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v10);

  }
}

- (unint64_t)moreInfoItemAtURL:(id)a3 withMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  PKPaymentWebServiceRequest *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  v12 = objc_alloc_init(PKPaymentWebServiceRequest);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v12);
  PKURLByAppendingQueryParams(v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(6uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Downloading More Info Item with URL: '%@'.", buf, 0xCu);
  }

  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKWebServiceRequest _murlRequestWithURL:appleAccountInformation:](v12, "_murlRequestWithURL:appleAccountInformation:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__PKPaymentWebService_moreInfoItemAtURL_withMetadata_completion___block_invoke;
  v19[3] = &unk_1E2AC70F8;
  v19[4] = self;
  v20 = v8;
  v17 = v8;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v16, v11, v19);

  return v11;
}

void __65__PKPaymentWebService_moreInfoItemAtURL_withMetadata_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  PKPaymentSetupMoreInfoItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  PKPaymentSetupMoreInfoItem *v23;
  id v24;
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v25 = v9;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v25;

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = -[PKPaymentSetupMoreInfoItem initWithMoreInfoDictionary:]([PKPaymentSetupMoreInfoItem alloc], "initWithMoreInfoDictionary:", v10);
      -[PKPaymentSetupMoreInfoItem imageURL](v12, "imageURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0C92C80];
        -[PKPaymentSetupMoreInfoItem imageURL](v12, "imageURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "requestWithURL:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = *(void **)(a1 + 32);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __65__PKPaymentWebService_moreInfoItemAtURL_withMetadata_completion___block_invoke_2;
        v22[3] = &unk_1E2AC70F8;
        v12 = v12;
        v23 = v12;
        v24 = *(id *)(a1 + 40);
        objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v16, v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "resume");

      }
      else
      {
        v21 = *(_QWORD *)(a1 + 40);
        if (v21)
          (*(void (**)(uint64_t, PKPaymentSetupMoreInfoItem *, _QWORD))(v21 + 16))(v21, v12, 0);
      }
    }
    else
    {
      v19 = *(_QWORD *)(a1 + 40);
      if (v19)
        (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(v19, 0, v11);
      v12 = 0;
    }

  }
  else
  {
    v20 = *(_QWORD *)(a1 + 40);
    if (v20)
      (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v9);
    v11 = v9;
  }

}

void __65__PKPaymentWebService_moreInfoItemAtURL_withMetadata_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "setImageData:", v10);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 32), 0);

}

- (unint64_t)cardInfoForMerchantIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  PKAMPCardInfoForMerchantRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  NSObject *v28;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint8_t buf[16];
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v10)
  {
    v34 = v7;
    v11 = -[PKAMPCardInfoForMerchantRequest initWithMerchantIdentifier:]([PKAMPCardInfoForMerchantRequest alloc], "initWithMerchantIdentifier:", v6);
    -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v10;
    -[PKAMPCardInfoForMerchantRequest _urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:](v11, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v12, v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C92C50], "sharedURLCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cachedResponseForRequest:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PDLastPaymentPassInsertionOrRemovalDate();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && v16)
    {
      v31 = v15;
      v32 = v8;
      objc_msgSend(v16, "response");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allHeaderFields");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Date"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v21, "setDateFormat:", CFSTR("EEEE, dd LLL yyyy HH:mm:ss zzz"));
      objc_msgSend(v21, "dateFromString:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {

        v15 = v31;
        v8 = v32;
        goto LABEL_15;
      }
      v23 = v22;
      v30 = objc_msgSend(v22, "compare:", v17);

      v15 = v31;
      v8 = v32;
      if (v30 != 1)
      {
LABEL_16:
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __64__PKPaymentWebService_cardInfoForMerchantIdentifier_completion___block_invoke;
        v36[3] = &unk_1E2AC5308;
        v7 = v34;
        v37 = v34;
        -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v14, v8, v36);

        v10 = v33;
        goto LABEL_17;
      }
    }
    v19 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v19, "setCachePolicy:", 0);
    v20 = v14;
    v14 = (void *)objc_msgSend(v19, "copy");
LABEL_15:

    goto LABEL_16;
  }
  if (v6)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR("Device not registered; cannot retrieve merchant info");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v39;
    v27 = &v38;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "AMP Card Enrollment was attempted without a merchant identifier!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("Cannot perform enrollment without a merchant identifier");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = (const __CFString **)v41;
    v27 = &v40;
  }
  objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
  v11 = (PKAMPCardInfoForMerchantRequest *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 1, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);
LABEL_17:

  return v8;
}

uint64_t __64__PKPaymentWebService_cardInfoForMerchantIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)retrievePrivacyDeviceAssessmentStateWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentServicesURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v13, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__PKPaymentWebService_retrievePrivacyDeviceAssessmentStateWithRequest_completion___block_invoke;
  v18[3] = &unk_1E2AC5308;
  v19 = v6;
  v16 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v10, v18);

  return v10;
}

void __82__PKPaymentWebService_retrievePrivacyDeviceAssessmentStateWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  PKPrivacyDeviceAssessmentRetrieveStateResponse *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v6 = a2;
  v7 = -[PKPrivacyDeviceAssessmentRetrieveStateResponse initWithData:]([PKPrivacyDeviceAssessmentRetrieveStateResponse alloc], "initWithData:", v6);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, PKPrivacyDeviceAssessmentRetrieveStateResponse *, id))(v8 + 16))(v8, v7, v9);

}

- (unint64_t)sendPrivacyDeviceAssessmentStateWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentServicesURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v13, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__PKPaymentWebService_sendPrivacyDeviceAssessmentStateWithRequest_completion___block_invoke;
  v18[3] = &unk_1E2AC5308;
  v19 = v6;
  v16 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v10, v18);

  return v10;
}

void __78__PKPaymentWebService_sendPrivacyDeviceAssessmentStateWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v9 = objc_msgSend(v8, "statusCode");
    if (v9 == 200)
    {
      v10 = *(_QWORD *)(a1 + 32);
      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v11 = *(void (**)(void))(v10 + 16);
    }
    else
    {
      v16 = v9;
      PKLogFacilityTypeGetObject(6uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "URL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "absoluteString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412802;
        v22 = v19;
        v23 = 2048;
        v24 = v16;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ status code: %lu error: %@", (uint8_t *)&v21, 0x20u);

      }
      v20 = *(_QWORD *)(a1 + 32);
      if (!v20)
        goto LABEL_15;
      v11 = *(void (**)(void))(v20 + 16);
    }
    v11();
    goto LABEL_15;
  }
  if (v7)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v14;
      v23 = 2112;
      v24 = (uint64_t)v7;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ error: %@", (uint8_t *)&v21, 0x16u);

    }
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v7);
  }
LABEL_16:

}

- (unint64_t)retrieveMerchantTokensWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  dispatch_time_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  if (PKMerchantTokensDemoModeEnabled())
  {
    v11 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PKPaymentWebService_retrieveMerchantTokensWithRequest_completion___block_invoke;
    block[3] = &unk_1E2ABDA18;
    v23 = v7;
    v22 = v6;
    v12 = v7;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);

    v13 = v23;
  }
  else
  {
    -[PKPaymentWebService context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "primaryRegion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "paymentServicesURL");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v12, v9, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__PKPaymentWebService_retrieveMerchantTokensWithRequest_completion___block_invoke_489;
    v19[3] = &unk_1E2AC5308;
    v20 = v7;
    v17 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v10, v19);

  }
  return v10;
}

void __68__PKPaymentWebService_retrieveMerchantTokensWithRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  id v12;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "merchantTokenId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");

    if (v3)
    {
      if (PKMerchantTokensAMPTransactionDemoEnabled())
      {
        v4 = *(_QWORD *)(a1 + 40);
        +[PKMerchantTokenDemoData responseForSingleAMPMerchantToken](PKMerchantTokenDemoData, "responseForSingleAMPMerchantToken");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v12 = (id)v5;
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v5, 0);
LABEL_17:

        return;
      }
      v10 = PKMerchantTokensCashDemoEnabled();
      v4 = *(_QWORD *)(a1 + 40);
      if (!v10)
      {
        +[PKMerchantTokenDemoData responseForSingleMerchantToken](PKMerchantTokenDemoData, "responseForSingleMerchantToken");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      if (PKMerchantTokensPagedDemoEnabled())
      {
        v6 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "pageNumber");
        v7 = objc_claimAutoreleasedReturnValue();
        v12 = (id)v7;
        if (v7)
          v8 = (void *)v7;
        else
          v8 = &unk_1E2C3F358;
        +[PKMerchantTokenDemoData responseForPageNumber:](PKMerchantTokenDemoData, "responseForPageNumber:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v9, 0);

        goto LABEL_17;
      }
      v11 = PKMerchantTokensCashDemoEnabled();
      v4 = *(_QWORD *)(a1 + 40);
      if (!v11)
      {
        +[PKMerchantTokenDemoData responseForSinglePage](PKMerchantTokenDemoData, "responseForSinglePage");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    +[PKMerchantTokenDemoData responseForSingleCashMerchantToken](PKMerchantTokenDemoData, "responseForSingleCashMerchantToken");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
}

void __68__PKPaymentWebService_retrieveMerchantTokensWithRequest_completion___block_invoke_489(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  PKRetrieveMerchantTokensResponse *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v6 = a2;
  v7 = -[PKRetrieveMerchantTokensResponse initWithData:]([PKRetrieveMerchantTokensResponse alloc], "initWithData:", v6);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, PKRetrieveMerchantTokensResponse *, id))(v8 + 16))(v8, v7, v9);

}

- (unint64_t)deleteMerchantTokenWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  dispatch_time_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  if (PKMerchantTokensDemoModeEnabled())
  {
    v9 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PKPaymentWebService_deleteMerchantTokenWithRequest_completion___block_invoke;
    block[3] = &unk_1E2ABD9A0;
    v20 = v7;
    v10 = v7;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
    v11 = v20;
  }
  else
  {
    -[PKPaymentWebService context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryRegion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "paymentServicesURL");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_urlRequestWithServiceURL:appleAccountInformation:", v10, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__PKPaymentWebService_deleteMerchantTokenWithRequest_completion___block_invoke_2;
    v17[3] = &unk_1E2AC5308;
    v18 = v7;
    v15 = v7;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v17);

  }
  return v8;
}

uint64_t __65__PKPaymentWebService_deleteMerchantTokenWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __65__PKPaymentWebService_deleteMerchantTokenWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void (*v12)(void);
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v8;
      v11 = objc_msgSend(v10, "statusCode");
      if (v11 == 200)
      {
        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      }
      else
      {
        v16 = v11;
        PKLogFacilityTypeGetObject(6uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "URL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "absoluteString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412802;
          v21 = v19;
          v22 = 2048;
          v23 = v16;
          v24 = 2112;
          v25 = v9;
          _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ status code: %lu error: %@", (uint8_t *)&v20, 0x20u);

        }
        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      }
      v12();

    }
    else if (v9)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v15;
        v22 = 2112;
        v23 = (uint64_t)v9;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ error: %@", (uint8_t *)&v20, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

- (unint64_t)transactionReceiptAuthorizationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PKPaymentWebService_transactionReceiptAuthorizationWithRequest_completion___block_invoke;
  v13[3] = &unk_1E2ACB750;
  v14 = v6;
  v15 = v8;
  v13[4] = self;
  v11 = v6;
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:webService:completion:", v9, v10, self, v13);

  return v8;
}

void __77__PKPaymentWebService_transactionReceiptAuthorizationWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKPaymentWebService_transactionReceiptAuthorizationWithRequest_completion___block_invoke_2;
  v5[3] = &unk_1E2AC5308;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performRequest:taskIdentifier:completionHandler:", a2, v4, v5);

}

void __77__PKPaymentWebService_transactionReceiptAuthorizationWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  PKTransactionReceiptAuthorizationResponse *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = 0;
  if (v13)
  {
    if (!v8)
    {
      v9 = -[PKTransactionReceiptAuthorizationResponse initWithData:]([PKTransactionReceiptAuthorizationResponse alloc], "initWithData:", v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "allHeaderFields");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("x-conversation-id"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKTransactionReceiptAuthorizationResponse setConversationIdentifier:](v9, "setConversationIdentifier:", v11);
      }
    }
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, PKTransactionReceiptAuthorizationResponse *, id))(v12 + 16))(v12, v9, v8);

}

- (unint64_t)transactionReceiptWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  objc_msgSend(v7, "_urlRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PKPaymentWebService_transactionReceiptWithRequest_completion___block_invoke;
  v12[3] = &unk_1E2AC5308;
  v13 = v6;
  v10 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v8, v12);

  return v8;
}

void __64__PKPaymentWebService_transactionReceiptWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSURL *v9;
  PKTransactionReceipt *v10;
  uint64_t v11;
  uint64_t v12;
  NSData *v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (!v13 || v8)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v8);
  }
  else
  {
    PKTemporaryItemURLWithExtension(CFSTR("pkreceipt"), 1);
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    PKTemporaryItemPrepareDirectory();
    if (PKUnarchiverZip(v13, v9))
      v10 = -[PKTransactionReceipt initWithFileURL:]([PKTransactionReceipt alloc], "initWithFileURL:", v9);
    else
      v10 = 0;
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, PKTransactionReceipt *, _QWORD))(v12 + 16))(v12, v10, 0);

  }
}

- (unint64_t)vehicleManufacturerWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PKPaymentWebService_vehicleManufacturerWithRequest_withCompletion___block_invoke;
  v16[3] = &unk_1E2AC5308;
  v17 = v6;
  v14 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  return v8;
}

void __69__PKPaymentWebService_vehicleManufacturerWithRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  PKPaymentVehicleManufacturerResponse *v11;
  PKPaymentVehicleManufacturerResponse *v12;
  uint8_t v13[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_QWORD *)(a1 + 32))
  {
    if (PKSharingForceEmptyVehicleManufacturerResponse())
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKSharingForceEmptyVehicleManufacturerResponse enabled", v13, 2u);
      }

      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "statusCode") == 204)
    {
LABEL_8:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_13;
    }
    v11 = -[PKPaymentVehicleManufacturerResponse initWithData:]([PKPaymentVehicleManufacturerResponse alloc], "initWithData:", v7);
    if (v9)
      v12 = 0;
    else
      v12 = v11;
    (*(void (**)(_QWORD, PKPaymentVehicleManufacturerResponse *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v12, v9);

  }
LABEL_13:

}

- (unint64_t)registerCredentialWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PKPaymentWebService_registerCredentialWithRequest_withCompletion___block_invoke;
  v16[3] = &unk_1E2AC7650;
  v16[4] = self;
  v17 = v6;
  v14 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  return v8;
}

void __68__PKPaymentWebService_registerCredentialWithRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  PKPaymentRegisterCredentialResponse *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = -[PKPaymentRegisterCredentialResponse initWithData:]([PKPaymentRegisterCredentialResponse alloc], "initWithData:", v13);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    if (v9)
    {
      (*(void (**)(uint64_t, PKPaymentRegisterCredentialResponse *, _QWORD))(v10 + 16))(v10, v9, 0);
    }
    else
    {
      if (v8)
      {
        v11 = v8;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:response:data:", 0, v7, v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

- (unint64_t)revokeSharedCredentialWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__PKPaymentWebService_revokeSharedCredentialWithRequest_withCompletion___block_invoke;
  v16[3] = &unk_1E2AC5308;
  v17 = v6;
  v14 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  return v8;
}

void __72__PKPaymentWebService_revokeSharedCredentialWithRequest_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  PKPaymentRevokeSharedCredentialResponse *v8;
  id v9;

  v9 = a4;
  if (v9)
  {
    v6 = 0;
  }
  else
  {
    v7 = a2;
    v8 = -[PKPaymentRevokeSharedCredentialResponse initWithData:]([PKPaymentRevokeSharedCredentialResponse alloc], "initWithData:", v7);

    -[PKPaymentRevokeSharedCredentialResponse passURL](v8, "passURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (unint64_t)credentialAccountAttesationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  unint64_t v17;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__PKPaymentWebService_credentialAccountAttesationWithRequest_completion___block_invoke;
  v15[3] = &unk_1E2ACB750;
  v16 = v6;
  v17 = v8;
  v15[4] = self;
  v13 = v6;
  objc_msgSend(v7, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:webService:completion:", v11, v10, v12, self, v15);

  return v8;
}

void __73__PKPaymentWebService_credentialAccountAttesationWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__PKPaymentWebService_credentialAccountAttesationWithRequest_completion___block_invoke_2;
  v5[3] = &unk_1E2AC5308;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performRequest:taskIdentifier:completionHandler:", a2, v4, v5);

}

void __73__PKPaymentWebService_credentialAccountAttesationWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  PKPaymentAccountAttesationResponse *v8;
  id v9;

  v9 = a4;
  if (v9)
  {
    v6 = 0;
  }
  else
  {
    v7 = a2;
    v8 = -[PKPaymentAccountAttesationResponse initWithData:]([PKPaymentAccountAttesationResponse alloc], "initWithData:", v7);

    -[PKPaymentAccountAttesationResponse attestation](v8, "attestation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (unint64_t)inAppPaymentNonceForPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPaymentNonceRequest *v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PKPaymentNonceRequest);
  -[PKPaymentAugmentBaseRequest setPass:](v8, "setPass:", v7);

  -[PKPaymentNonceRequest setUseLegacyGetAPI:](v8, "setUseLegacyGetAPI:", 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PKPaymentWebService_inAppPaymentNonceForPass_completion___block_invoke;
  v12[3] = &unk_1E2AD4EF0;
  v13 = v6;
  v9 = v6;
  v10 = -[PKPaymentWebService inAppPaymentNonceWithRequest:serviceURL:completion:](self, "inAppPaymentNonceWithRequest:serviceURL:completion:", v8, 0, v12);

  return v10;
}

void __59__PKPaymentWebService_inAppPaymentNonceForPass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "nonceData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);

}

- (unint64_t)inAppPaymentNonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    -[PKPaymentWebService context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "passTypeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regionForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "inAppPaymentServicesURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      PKOverrideInAppPaymentServicesURL();
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  v15 = -[PKPaymentWebService _nonceWithRequest:serviceURL:completion:](self, "_nonceWithRequest:serviceURL:completion:", v8, v9, v10);

  return v15;
}

- (unint64_t)_nonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  NSObject *v18;
  _QWORD v20[5];
  void (**v21)(_QWORD);
  id v22;
  uint64_t *v23;
  uint8_t buf[16];
  _QWORD aBlock[5];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__53;
  v35 = __Block_byref_object_dispose__53;
  -[PKPaymentWebService context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceID");
  v36 = (id)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke;
  aBlock[3] = &unk_1E2AD4F18;
  aBlock[4] = self;
  v14 = v8;
  v26 = v14;
  v15 = v9;
  v27 = v15;
  v29 = &v31;
  v30 = v11;
  v16 = v10;
  v28 = v16;
  v17 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend((id)v32[5], "length"))
  {
    v17[2](v17);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Context missing deviceID, registering", buf, 2u);
    }

    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_500;
    v20[3] = &unk_1E2AD4F40;
    v23 = &v31;
    v20[4] = self;
    v21 = v17;
    v22 = v16;
    -[PKPaymentWebService registerDeviceWithCompletion:](self, "registerDeviceWithCompletion:", v20);

  }
  _Block_object_dispose(&v31, 8);

  return v11;
}

void __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 40), "useLegacyGetAPI");
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "_appleAccountInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v4, "_legacyGetURLRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v3, v5, v6);
  else
    objc_msgSend(v4, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 72);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_2;
  v10[3] = &unk_1E2AC70F8;
  v10[4] = v8;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v8, "performRequest:taskIdentifier:completionHandler:", v7, v9, v10);

}

void __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__53;
  v19[4] = __Block_byref_object_dispose__53;
  v20 = 0;
  v10 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_3;
  v16 = &unk_1E2AC2918;
  v18 = v19;
  v11 = v7;
  v17 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v13);
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  _Block_object_dispose(v19, 8);
}

BOOL __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentNonceResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

void __63__PKPaymentWebService__nonceWithRequest_serviceURL_completion___block_invoke_500(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceID");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v8, 0);

  }
}

- (unint64_t)augmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    -[PKPaymentWebService context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "passTypeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regionForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "inAppPaymentServicesURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      PKOverrideInAppPaymentServicesURL();
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  v15 = -[PKPaymentWebService _augmentSessionWithRequest:serviceURL:completion:](self, "_augmentSessionWithRequest:serviceURL:completion:", v8, v9, v10);

  return v15;
}

- (unint64_t)_augmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v9, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__PKPaymentWebService__augmentSessionWithRequest_serviceURL_completion___block_invoke;
  v18[3] = &unk_1E2AC70F8;
  v18[4] = self;
  v19 = v8;
  v16 = v8;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v11, v18);

  return v11;
}

void __72__PKPaymentWebService__augmentSessionWithRequest_serviceURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__53;
  v19[4] = __Block_byref_object_dispose__53;
  v20 = 0;
  v10 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __72__PKPaymentWebService__augmentSessionWithRequest_serviceURL_completion___block_invoke_2;
  v16 = &unk_1E2AC2918;
  v18 = v19;
  v11 = v7;
  v17 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v13);
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v13, v14, v15, v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  _Block_object_dispose(v19, 8);
}

BOOL __72__PKPaymentWebService__augmentSessionWithRequest_serviceURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentAugmentSessionResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (unint64_t)rewrapInAppPayment:(id)a3 merchantIdentifier:(id)a4 merchantSession:(id)a5 hostApplicationIdentifier:(id)a6 applicationData:(id)a7 pass:(id)a8 paymentApplication:(id)a9 completion:(id)a10
{
  return -[PKPaymentWebService rewrapInAppPayment:merchantIdentifier:hostApplicationIdentifier:applicationData:pass:completion:](self, "rewrapInAppPayment:merchantIdentifier:hostApplicationIdentifier:applicationData:pass:completion:", a3, a4, a6, a7, a8, a10);
}

- (unint64_t)rewrapInAppPayment:(id)a3 merchantIdentifier:(id)a4 hostApplicationIdentifier:(id)a5 applicationData:(id)a6 pass:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PKPaymentRewrapRequest *v20;
  void *v21;
  id v22;
  unint64_t v23;
  _QWORD v25[4];
  id v26;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(PKPaymentRewrapRequest);
  -[PKPaymentRewrapRequestBase setWrappedPayment:](v20, "setWrappedPayment:", v19);

  objc_msgSend(v15, "devicePrimaryInAppPaymentApplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRewrapRequestBase setPaymentApplication:](v20, "setPaymentApplication:", v21);

  -[PKPaymentRewrapRequest setMerchantIdentifier:](v20, "setMerchantIdentifier:", v18);
  -[PKPaymentRewrapRequest setHostApplicationIdentifier:](v20, "setHostApplicationIdentifier:", v17);

  -[PKPaymentRewrapRequestBase setApplicationData:](v20, "setApplicationData:", v16);
  -[PKPaymentRewrapRequestBase setPass:](v20, "setPass:", v15);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __119__PKPaymentWebService_rewrapInAppPayment_merchantIdentifier_hostApplicationIdentifier_applicationData_pass_completion___block_invoke;
  v25[3] = &unk_1E2AC7FF8;
  v26 = v14;
  v22 = v14;
  v23 = -[PKPaymentWebService rewrapInAppPaymentWithRequest:serviceURL:completion:](self, "rewrapInAppPaymentWithRequest:serviceURL:completion:", v20, 0, v25);

  return v23;
}

uint64_t __119__PKPaymentWebService_rewrapInAppPayment_merchantIdentifier_hostApplicationIdentifier_applicationData_pass_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)rewrapInAppPaymentWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  unint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v8);
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__PKPaymentWebService_rewrapInAppPaymentWithRequest_serviceURL_completion___block_invoke;
  v19[3] = &unk_1E2AD4F68;
  v20 = v8;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __75__PKPaymentWebService_rewrapInAppPaymentWithRequest_serviceURL_completion___block_invoke_2;
  v16[3] = &unk_1E2AC7FA8;
  v17 = v20;
  v18 = v9;
  v12 = v9;
  v13 = v20;
  v14 = -[PKPaymentWebService _performRewrapRequest:serviceURL:responseHandler:completion:](self, "_performRewrapRequest:serviceURL:responseHandler:completion:", v13, v10, v19, v16);

  return v14;
}

id __75__PKPaymentWebService_rewrapInAppPaymentWithRequest_serviceURL_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  __objc2_class **v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "type");
  v5 = off_1E2AA0A70;
  if (v4 != 2)
    v5 = off_1E2A9FB10;
  -[__objc2_class responseWithData:](*v5, "responseWithData:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __75__PKPaymentWebService_rewrapInAppPaymentWithRequest_serviceURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v8 = a3;
  v9 = a5;
  objc_msgSend(*(id *)(a1 + 32), "pass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "associatedApplicationIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hostApplicationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "pass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    objc_msgSend(v15, "sanitizePaymentApplications");
    objc_msgSend(v8, "paymentMethod");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPaymentPass:", v15);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (unint64_t)completeSession:(id)a3 wrappedPayment:(id)a4 pass:(id)a5 applicationData:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKPaymentCompleteSessionRequest *v17;
  void *v18;
  id v19;
  unint64_t v20;
  _QWORD v22[4];
  id v23;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(PKPaymentCompleteSessionRequest);
  -[PKPaymentRewrapRequestBase setWrappedPayment:](v17, "setWrappedPayment:", v15);

  -[PKPaymentRewrapRequestBase setPass:](v17, "setPass:", v14);
  objc_msgSend(v14, "devicePrimaryInAppPaymentApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentRewrapRequestBase setPaymentApplication:](v17, "setPaymentApplication:", v18);
  -[PKPaymentCompleteSessionRequest setMerchantSession:](v17, "setMerchantSession:", v16);

  -[PKPaymentRewrapRequestBase setApplicationData:](v17, "setApplicationData:", v13);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__PKPaymentWebService_completeSession_wrappedPayment_pass_applicationData_completion___block_invoke;
  v22[3] = &unk_1E2AD4F90;
  v23 = v12;
  v19 = v12;
  v20 = -[PKPaymentWebService completeSessionWithRequest:serviceURL:completion:](self, "completeSessionWithRequest:serviceURL:completion:", v17, 0, v22);

  return v20;
}

uint64_t __86__PKPaymentWebService_completeSession_wrappedPayment_pass_applicationData_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)completeSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  unint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v8);
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__PKPaymentWebService_completeSessionWithRequest_serviceURL_completion___block_invoke;
  v19[3] = &unk_1E2AD4F68;
  v20 = v8;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __72__PKPaymentWebService_completeSessionWithRequest_serviceURL_completion___block_invoke_2;
  v16[3] = &unk_1E2AC7FA8;
  v17 = v20;
  v18 = v9;
  v12 = v9;
  v13 = v20;
  v14 = -[PKPaymentWebService _performRewrapRequest:serviceURL:responseHandler:completion:](self, "_performRewrapRequest:serviceURL:responseHandler:completion:", v13, v10, v19, v16);

  return v14;
}

id __72__PKPaymentWebService_completeSessionWithRequest_serviceURL_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  __objc2_class **v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "type");
  v5 = off_1E2AA0A70;
  if (v4 != 2)
    v5 = off_1E2A9F568;
  -[__objc2_class responseWithData:](*v5, "responseWithData:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __72__PKPaymentWebService_completeSessionWithRequest_serviceURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "pass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "associatedWebDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "merchantSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "containsObject:", v15);

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "pass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    objc_msgSend(v18, "sanitizePaymentApplications");
    objc_msgSend(v9, "paymentMethod");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPaymentPass:", v18);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (unint64_t)_performRewrapRequest:(id)a3 serviceURL:(id)a4 responseHandler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  NSObject *v26;
  _QWORD v28[5];
  void (**v29)(_QWORD);
  id v30;
  uint8_t buf[16];
  _QWORD aBlock[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v10, "pass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "passTypeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "regionForIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "inAppPaymentServicesURL");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      PKOverrideInAppPaymentServicesURL();
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke;
  aBlock[3] = &unk_1E2AD5030;
  aBlock[4] = self;
  v20 = v10;
  v33 = v20;
  v21 = v11;
  v34 = v21;
  v22 = v16;
  v35 = v22;
  v38 = v14;
  v23 = v12;
  v36 = v23;
  v24 = v13;
  v37 = v24;
  v25 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v22, "length"))
  {
    v25[2](v25);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Context missing deviceID, registering", buf, 2u);
    }

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_522;
    v28[3] = &unk_1E2AD5058;
    v29 = v25;
    v30 = v24;
    v28[4] = self;
    -[PKPaymentWebService registerDeviceWithCompletion:](self, "registerDeviceWithCompletion:", v28);

  }
  return v14;
}

void __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "_paymentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_2;
  v5[3] = &unk_1E2AD5008;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v12 = *(_QWORD *)(a1 + 80);
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(v2, "rewrapDataWithCompletionHandler:", v5);

}

void __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v7 = a2;
  objc_msgSend(v6, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithServiceURL:deviceIdentifier:rewrapData:appleAccountInformation:", v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(a1 + 80);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_3;
  v12[3] = &unk_1E2AD4FE0;
  v11 = *(void **)(a1 + 64);
  v13 = *(id *)(a1 + 56);
  v15 = v11;
  v14 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 72);
  objc_msgSend(v13, "performRequest:taskIdentifier:completionHandler:", v9, v10, v12);

}

void __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PKPaymentMethod *v15;
  void *v16;
  void *v17;
  PKPaymentMethod *v18;
  PKPaymentToken *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__53;
  v34 = __Block_byref_object_dispose__53;
  v35 = 0;
  v10 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_4;
  v26[3] = &unk_1E2AD4FB8;
  v29 = &v30;
  v28 = *(id *)(a1 + 48);
  v11 = v7;
  v27 = v11;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, v26);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "pk_valueForHTTPHeaderField:", CFSTR("X-Apple-Retry-Nonce"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (v12 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "pass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "paymentApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "type") == 1)
    {
      v15 = [PKPaymentMethod alloc];
      objc_msgSend(*(id *)(a1 + 40), "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "primaryAccountNumberSuffix");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PKPaymentMethod initWithPayLaterAccount:primaryAccountNumberSuffix:obfuscateNetworks:](v15, "initWithPayLaterAccount:primaryAccountNumberSuffix:obfuscateNetworks:", v16, v17, 0);

    }
    else
    {
      v18 = -[PKPaymentMethod initWithPaymentPass:paymentApplication:obfuscateNetworks:]([PKPaymentMethod alloc], "initWithPaymentPass:paymentApplication:obfuscateNetworks:", v25, v14, 0);
    }
    v19 = objc_alloc_init(PKPaymentToken);
    objc_msgSend((id)v31[5], "transactionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "wrappedPayment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transactionIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PKPaymentToken setTransactionIdentifier:](v19, "setTransactionIdentifier:", v20);
    -[PKPaymentMethod displayName](v18, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setPaymentInstrumentName:](v19, "setPaymentInstrumentName:", v22);

    -[PKPaymentMethod network](v18, "network");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setPaymentNetwork:](v19, "setPaymentNetwork:", v23);

    objc_msgSend((id)v31[5], "rewrappedPaymentData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentToken setPaymentData:](v19, "setPaymentData:", v24);

    -[PKPaymentToken setPaymentMethod:](v19, "setPaymentMethod:", v18);
    AnalyticsSendEvent();

  }
  else
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    AnalyticsSendEvent();
    v19 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  _Block_object_dispose(&v30, 8);
}

BOOL __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

void __83__PKPaymentWebService__performRewrapRequest_serviceURL_responseHandler_completion___block_invoke_522(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  if (a2 == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", 0, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, v3, 0, 0, 0);

  }
}

- (unint64_t)availableDevicesWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  PKPaymentAvailableDevicesRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(PKPaymentAvailableDevicesRequest);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v8);
  objc_msgSend(v7, "brokerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAvailableDevicesRequest _urlRequestWithServiceURL:appleAccountInformation:](v8, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__PKPaymentWebService_availableDevicesWithCompletion___block_invoke;
  v14[3] = &unk_1E2AC5308;
  v15 = v4;
  v12 = v4;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v5, v14);

  return v5;
}

void __54__PKPaymentWebService_availableDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (!v14 || v8)
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v8);
  }
  else
  {
    +[PKWebServiceResponse responseWithData:](PKPaymentAvailableDevicesResponse, "responseWithData:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v9, "devices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v12, 0);

    }
  }

}

- (unint64_t)checkMerchantStatus:(id)a3 forDomain:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  PKPaymentCheckMerchantRequest *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryRegion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PKPaymentCheckMerchantRequest initWithMerchantIdentifier:domainName:]([PKPaymentCheckMerchantRequest alloc], "initWithMerchantIdentifier:domainName:", v10, v9);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v14);
  objc_msgSend(v13, "inAppPaymentServicesURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCheckMerchantRequest _urlRequestWithServiceURL:](v14, "_urlRequestWithServiceURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__PKPaymentWebService_checkMerchantStatus_forDomain_withCompletion___block_invoke;
  v19[3] = &unk_1E2AC5308;
  v20 = v8;
  v17 = v8;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v16, v11, v19);

  return v11;
}

void __68__PKPaymentWebService_checkMerchantStatus_forDomain_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (!v13 || v8)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v8);
  }
  else
  {
    +[PKWebServiceResponse responseWithData:](PKPaymentCheckMerchantResponse, "responseWithData:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v11 + 16))(v11, objc_msgSend(v9, "isRegistered"), 0);

  }
}

- (unint64_t)prepareTransactionDetailsForMerchantSession:(id)a3 secureElementIdentifier:(id)a4 amount:(id)a5 currencyCode:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKPaymentPrepareTransactionDetailsRequest *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[PKPaymentPrepareTransactionDetailsRequest initWithMerchantSession:secureElementIdentifier:amount:currencyCode:]([PKPaymentPrepareTransactionDetailsRequest alloc], "initWithMerchantSession:secureElementIdentifier:amount:currencyCode:", v16, v15, v14, v13);

  v18 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "primaryRegion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "inAppPaymentServicesURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPrepareTransactionDetailsRequest _urlRequestWithServiceURL:appleAccountInformation:](v17, "_urlRequestWithServiceURL:appleAccountInformation:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __122__PKPaymentWebService_prepareTransactionDetailsForMerchantSession_secureElementIdentifier_amount_currencyCode_completion___block_invoke;
  v26[3] = &unk_1E2AC70F8;
  v26[4] = self;
  v27 = v12;
  v24 = v12;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v23, v18, v26);

  return v18;
}

void __122__PKPaymentWebService_prepareTransactionDetailsForMerchantSession_secureElementIdentifier_amount_currencyCode_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  PKPaymentInstructions *v14;
  void *v15;
  PKPaymentInstructions *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__53;
  v26 = __Block_byref_object_dispose__53;
  v27 = 0;
  v10 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __122__PKPaymentWebService_prepareTransactionDetailsForMerchantSession_secureElementIdentifier_amount_currencyCode_completion___block_invoke_2;
  v18[3] = &unk_1E2AD5080;
  v11 = v7;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v21 = &v22;
  v13 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v12, v18);
  if (v13 == 1)
  {
    v14 = [PKPaymentInstructions alloc];
    objc_msgSend((id)v23[5], "instructionsDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKPaymentInstructions initWithDictionary:](v14, "initWithDictionary:", v15);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v13, v11);
    v16 = 0;
    v15 = v12;
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, id, PKPaymentInstructions *))(v17 + 16))(v17, v12, v16);

  _Block_object_dispose(&v22, 8);
}

uint64_t __122__PKPaymentWebService_prepareTransactionDetailsForMerchantSession_secureElementIdentifier_amount_currencyCode_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a1[4] && !a1[5])
  {
    +[PKWebServiceResponse responseWithData:](PKPaymentPrepareTransactionDetailsResponse, "responseWithData:");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  AnalyticsSendEvent();
  return v2;
}

- (unint64_t)serviceProviderNonceWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    -[PKPaymentWebService context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "passTypeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regionForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "paymentServicesURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = -[PKPaymentWebService _nonceWithRequest:serviceURL:completion:](self, "_nonceWithRequest:serviceURL:completion:", v8, v9, v10);

  return v15;
}

- (unint64_t)serviceProviderAugmentSessionWithRequest:(id)a3 serviceURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    -[PKPaymentWebService context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "passTypeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regionForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "paymentServicesURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = -[PKPaymentWebService _augmentSessionWithRequest:serviceURL:completion:](self, "_augmentSessionWithRequest:serviceURL:completion:", v8, v9, v10);

  return v15;
}

- (unint64_t)performServiceProviderPayment:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v18[8];
  _QWORD v19[5];
  id v20;
  unint64_t v21;

  v6 = a3;
  v7 = a4;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passTypeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "regionForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKWebService nextTaskID](self, "nextTaskID");
  if (v9)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
    objc_msgSend(v12, "paymentServicesURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke;
    v19[3] = &unk_1E2ACB750;
    v19[4] = self;
    v21 = v13;
    v20 = v7;
    objc_msgSend(v6, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:webService:completion:", v14, v9, v15, self, v19);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Perform Payment, deviceID is nil", v18, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

  return v13;
}

void __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke_2;
  v5[3] = &unk_1E2AC70F8;
  v3 = (void *)a1[5];
  v4 = a1[6];
  v6 = (id)a1[4];
  v7 = v3;
  objc_msgSend(v6, "performRequest:taskIdentifier:completionHandler:", a2, v4, v5);

}

void __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__53;
  v24 = __Block_byref_object_dispose__53;
  v25 = 0;
  v10 = *(void **)(a1 + 32);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke_3;
  v17 = &unk_1E2AD4BD0;
  v11 = v7;
  v18 = v11;
  v19 = &v20;
  v12 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, &v14);
  if (!v9 && v12 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v12, v11, v14, v15, v16, v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v21[5], v9);

  _Block_object_dispose(&v20, 8);
}

uint64_t __64__PKPaymentWebService_performServiceProviderPayment_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  +[PKWebServiceResponse responseWithData:](PKPaymentServiceProviderPerformPaymentResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "purchase"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    objc_msgSend(v3, "purchase");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)serviceProviderPurchasesWithRequest:(id)a3 inRegion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  PKPaymentWebService *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v9)
  {
    objc_msgSend(v12, "primaryRegionIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "regionForIdentifier:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceID");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v14 && v15)
  {
    -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v8);
    objc_msgSend(v14, "paymentServicesURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v28 = self;
    v18 = v9;
    v19 = v14;
    v20 = v13;
    v21 = v10;
    v22 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_urlRequestWithServiceURL:deviceIdentifier:appleAccountInformation:", v17, v16, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v22;
    v10 = v21;
    v13 = v20;
    v14 = v19;
    v9 = v18;

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __79__PKPaymentWebService_serviceProviderPurchasesWithRequest_inRegion_completion___block_invoke;
    v29[3] = &unk_1E2AC70F8;
    v30 = v18;
    v31 = v10;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](v28, "performRequest:taskIdentifier:completionHandler:", v24, v11, v29);

LABEL_17:
    goto LABEL_18;
  }
  if (v14)
  {
    if (v15)
      goto LABEL_8;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v9;
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Can't ask for purchases, region %{public}@ unknown", buf, 0xCu);
    }

    if (v16)
    {
LABEL_8:
      if (!v10)
        goto LABEL_18;
      goto LABEL_16;
    }
  }
  PKLogFacilityTypeGetObject(6uLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Can't ask for purchases, no deviceID", buf, 2u);
  }

  if (v10)
  {
LABEL_16:
    -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, MEMORY[0x1E0C9AA60], v24);
    goto LABEL_17;
  }
LABEL_18:

  return v11;
}

void __79__PKPaymentWebService_serviceProviderPurchasesWithRequest_inRegion_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Purchases request failed with error %@", buf, 0xCu);
    }
    v17 = 0;
    v11 = 0;
  }
  else
  {
    +[PKWebServiceResponse responseWithData:](PKPaymentServiceProviderPurchasesResponse, "responseWithData:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "purchases");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "setRegionIdentifier:", *(_QWORD *)(a1 + 32), (_QWORD)v19);
        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v14);
    }
    v17 = v12;
  }

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, NSObject *, void *))(v18 + 16))(v18, v17, v10);

}

- (unint64_t)serviceProviderPurchaseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  PKPaymentServiceProviderPurchaseRequest *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPaymentServiceProviderPurchaseRequest initWithPurchaseIdentifier:]([PKPaymentServiceProviderPurchaseRequest alloc], "initWithPurchaseIdentifier:", v7);

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentServiceProviderPurchaseRequest _urlRequestWithServiceURL:appleAccountInformation:](v10, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PKPaymentWebService_serviceProviderPurchaseWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E2AC5308;
  v16 = v6;
  v13 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v12, v8, v15);

  return v8;
}

void __72__PKPaymentWebService_serviceProviderPurchaseWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Purchase request failed with error %@", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
    v11 = 0;
  }
  else
  {
    +[PKWebServiceResponse responseWithData:](PKPaymentServiceProviderPurchasesResponse, "responseWithData:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "purchases");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v13, v10);

}

- (unint64_t)performAction:(id)a3 onServiceProviderPurchase:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  PKPaymentServiceProviderPerformActionRequest *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPaymentWebService primaryBrokerURL](self, "primaryBrokerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKPaymentServiceProviderPerformActionRequest initWithAction:purchase:]([PKPaymentServiceProviderPerformActionRequest alloc], "initWithAction:purchase:", v10, v9);

  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v13);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentServiceProviderPerformActionRequest _urlRequestWithServiceURL:appleAccountInformation:](v13, "_urlRequestWithServiceURL:appleAccountInformation:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__PKPaymentWebService_performAction_onServiceProviderPurchase_completion___block_invoke;
  v18[3] = &unk_1E2AC5308;
  v19 = v8;
  v16 = v8;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v11, v18);

  return v11;
}

void __74__PKPaymentWebService_performAction_onServiceProviderPurchase_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Perform action request failed with error %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = 0;
    v11 = 0;
  }
  else
  {
    +[PKWebServiceResponse responseWithData:](PKPaymentServiceProviderPerformActionResponse, "responseWithData:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updatedPurchase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v12, v10);

}

- (unint64_t)networkManifestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  PKPaymentNetworkCardImagesManifestRequest *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[PKPaymentWebService context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceTargetDeviceProtocol deviceRegion](self->_targetDevice, "deviceRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heroImageManifestURLForRegion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PKWebService nextTaskID](self, "nextTaskID");
  if (v8)
  {
    v10 = objc_alloc_init(PKPaymentNetworkCardImagesManifestRequest);
    -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentNetworkCardImagesManifestRequest _urlRequestWithServiceURL:appleAccountInformation:](v10, "_urlRequestWithServiceURL:appleAccountInformation:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v12, v9, v4);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
  }

  return v9;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  NSURLSession *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = (NSURLSession *)a3;
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = (uint64_t)v9;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Task finish download: %@", buf, 0xCu);
  }

  if (self->_backgroundSession == v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "taskIdentifier");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "originalRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v35 = v13;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Finished downloading task %lu: %@", buf, 0x16u);

    }
    v16 = (void *)MEMORY[0x19400CFE8]();
    -[PKPaymentWebService backgroundContext](self, "backgroundContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundDownloadRecordForTaskIdentifier:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      switch(objc_msgSend(v18, "taskType"))
      {
        case 1:
          objc_msgSend(v9, "response");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKWebService logResponse:withData:](self, "logResponse:withData:", v19, v12);

          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_msgSend(v9, "taskIdentifier");
            *(_DWORD *)buf = 134217984;
            v35 = v20;
            _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Handling passes query task %lu", buf, 0xCu);
          }

          -[PKPaymentWebService _handlePassListDownloadTask:data:](self, "_handlePassListDownloadTask:data:", v9, v12);
          break;
        case 2:
          objc_msgSend(v9, "response");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKWebService logResponse:withData:](self, "logResponse:withData:", v23, v12);

          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend(v9, "taskIdentifier");
            *(_DWORD *)buf = 134217984;
            v35 = v24;
            _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Handling pass download task %lu", buf, 0xCu);
          }

          -[PKPaymentWebService _handlePassDownloadTask:data:](self, "_handlePassDownloadTask:data:", v9, v12);
          break;
        case 3:
          v33 = v16;
          objc_msgSend(v9, "response");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<omitted>: %lu bytes"), objc_msgSend(v12, "length"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dataUsingEncoding:", 4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKWebService logResponse:withData:](self, "logResponse:withData:", v25, v27);

          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v28 = objc_msgSend(v9, "taskIdentifier");
            *(_DWORD *)buf = 134217984;
            v35 = v28;
            _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Handling remote asset task %lu", buf, 0xCu);
          }

          -[PKPaymentWebService _handleRemoteURLAssetDownloadTask:data:](self, "_handleRemoteURLAssetDownloadTask:data:", v9, v12);
          v16 = v33;
          break;
        case 4:
          objc_msgSend(v9, "response");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKWebService logResponse:withData:](self, "logResponse:withData:", v29, v12);

          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v30 = objc_msgSend(v9, "taskIdentifier");
            *(_DWORD *)buf = 134217984;
            v35 = v30;
            _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Handling Device check in task %lu", buf, 0xCu);
          }

          -[PKPaymentWebService _handleDeviceCheckInTask:downloadRecord:data:](self, "_handleDeviceCheckInTask:downloadRecord:data:", v9, v18, v12);
          break;
        default:
          objc_msgSend(v9, "response");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKWebService logResponse:withData:](self, "logResponse:withData:", v31, v12);

          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            goto LABEL_25;
          v32 = objc_msgSend(v9, "taskIdentifier");
          *(_DWORD *)buf = 134217984;
          v35 = v32;
          v22 = "Unknown task type for task %lu";
          goto LABEL_24;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v9, "taskIdentifier");
        *(_DWORD *)buf = 134217984;
        v35 = v21;
        v22 = "***** No match found for task %lu *****: FILE A BUG!";
LABEL_24:
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      }
LABEL_25:

    }
    objc_autoreleasePoolPop(v16);

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSURLSession *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (NSURLSession *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_backgroundSession == v8)
  {
    v11 = (void *)MEMORY[0x19400CFE8]();
    -[PKPaymentWebService backgroundContext](self, "backgroundContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundDownloadRecordForTaskIdentifier:", objc_msgSend(v9, "taskIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "taskType") == 5)
    {
      v14 = v13;
      PKLogFacilityTypeGetObject(0x16uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "credentialIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v16;
        v24 = 2048;
        v25 = objc_msgSend(v9, "taskIdentifier");
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Receiving response data for background credential registration task: %@ (%lu)", buf, 0x16u);

      }
      objc_msgSend(v14, "responseData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v19, "appendData:", v10);
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(v14, "setResponseData:", v20);

      }
      else
      {
        objc_msgSend(v14, "setResponseData:", v10);
      }
      -[PKPaymentWebService _archiveContext](self, "_archiveContext");

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PKPaymentWebService;
    -[PKWebService URLSession:dataTask:didReceiveData:](&v21, sel_URLSession_dataTask_didReceiveData_, v8, v9, v10);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  PKPaymentRegisterCredentialResponse *v26;
  id v27;
  void *v28;
  PKPaymentWebService *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  _QWORD *v37;
  id v38;
  PKPaymentRegisterCredentialResponse *v39;
  PKPaymentRegisterCredentialResponse *v40;
  void *v41;
  id v42;
  PKPaymentWebService *v43;
  PKPaymentRegisterCredentialResponse *v44;
  char v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  BOOL v50;
  id v51;
  void *v52;
  PKPaymentRegisterCredentialResponse *v53;
  void *v54;
  PKPaymentRegisterCredentialResponse *v55;
  NSObject *v56;
  uint64_t v57;
  id WeakRetained;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  dispatch_time_t v62;
  id v63;
  dispatch_time_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  uint64_t v70;
  _QWORD *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *queue;
  NSObject *oslog;
  id v78;
  void *v79;
  void *v80;
  PKPaymentWebService *v81;
  void *v82;
  void *v83;
  void *v84;
  NSURLSession *v85;
  objc_super v86;
  _QWORD aBlock[4];
  id v88;
  PKPaymentWebService *v89;
  PKPaymentRegisterCredentialResponse *v90;
  PKPaymentRegisterCredentialResponse *v91;
  id v92;
  _QWORD v93[4];
  PKPaymentRegisterCredentialResponse *v94;
  PKPaymentWebService *v95;
  id v96;
  uint64_t v97;
  char v98;
  _QWORD v99[4];
  id v100;
  PKPaymentWebService *v101;
  id v102;
  id v103;
  _QWORD v104[5];
  id v105;
  id v106;
  id v107;
  _BYTE buf[24];
  PKPaymentRegisterCredentialResponse *v109;
  id v110[6];

  v110[3] = *(id *)MEMORY[0x1E0C80C00];
  v85 = (NSURLSession *)a3;
  v8 = a4;
  v9 = a5;
  PKLogFacilityTypeGetObject(6uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Task Completed: %@", buf, 0xCu);
  }

  if (self->_backgroundSession != v85)
  {
    v86.receiver = self;
    v86.super_class = (Class)PKPaymentWebService;
    -[PKWebService URLSession:task:didCompleteWithError:](&v86, sel_URLSession_task_didCompleteWithError_, v85, v8, v9);
    goto LABEL_54;
  }
  v11 = (void *)MEMORY[0x19400CFE8]();
  objc_msgSend(v8, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originalRequest");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService backgroundContext](self, "backgroundContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundDownloadRecordForTaskIdentifier:", objc_msgSend(v8, "taskIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v83 = v13;
  v84 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(v12, "statusCode");
    v16 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v15 == 401)
    {
      if (v16)
      {
        v17 = objc_msgSend(v8, "taskIdentifier");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Task %lu Received Status Code 401.", buf, 0xCu);
      }

      v14 = v84;
      if (v84 && objc_msgSend(v84, "retryCount") <= 1)
      {
        v104[0] = MEMORY[0x1E0C809B0];
        v104[1] = 3221225472;
        v104[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke;
        v104[3] = &unk_1E2AD50D0;
        v104[4] = self;
        v105 = v82;
        v106 = v84;
        v107 = v13;
        -[PKPaymentWebService handleAuthenticationFailureWithCompletionHandler:](self, "handleAuthenticationFailureWithCompletionHandler:", v104);

      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v84, "retryCount");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v20;
          _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request failed after %lu retries. Aborting.", buf, 0xCu);
        }

      }
    }
    else
    {
      if (v16)
      {
        v18 = objc_msgSend(v8, "taskIdentifier");
        objc_msgSend(v8, "originalRequest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Task %lu completed: %@", buf, 0x16u);

        v13 = v83;
      }

      v14 = v84;
    }
  }
  v81 = self;
  v21 = objc_msgSend(v14, "taskType");
  v22 = v21;
  v80 = v11;
  if (!v9)
  {
    if (v21 == 3)
      goto LABEL_23;
LABEL_28:
    v41 = v84;
    if (objc_msgSend(v84, "taskType") != 4)
    {
      v50 = v22 == 5;
      v29 = v81;
      if (!v50)
        goto LABEL_51;
      v79 = v12;
      v51 = v84;
      objc_msgSend(v51, "credentialIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = [PKPaymentRegisterCredentialResponse alloc];
      objc_msgSend(v51, "responseData");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[PKPaymentRegisterCredentialResponse initWithData:](v53, "initWithData:", v54);

      PKLogFacilityTypeGetObject(0x16uLL);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = objc_msgSend(v8, "taskIdentifier");
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v52;
        *(_WORD *)&buf[22] = 2112;
        v109 = v55;
        LOWORD(v110[0]) = 2112;
        *(id *)((char *)v110 + 2) = v9;
        _os_log_impl(&dword_18FC92000, v56, OS_LOG_TYPE_DEFAULT, "Background credential registration task (%lu) for credential %@ completed with response %@, error %@", buf, 0x2Au);
      }
      oslog = v56;

      WeakRetained = objc_loadWeakRetained((id *)&v81->_backgroundDelegate);
      v59 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_553;
      aBlock[3] = &unk_1E2AC0F68;
      v78 = WeakRetained;
      v88 = v78;
      v89 = v81;
      v40 = v52;
      v90 = v40;
      v39 = v55;
      v91 = v39;
      v92 = v9;
      v60 = _Block_copy(aBlock);
      dispatch_get_global_queue(21, 0);
      v61 = objc_claimAutoreleasedReturnValue();
      if (PKSharingDelayAttestation())
      {
        v75 = v60;
        queue = v61;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "Delay attestation is enabled", buf, 2u);
        }

        v62 = dispatch_time(0, 20000000000);
        *(_QWORD *)buf = v59;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __dispatch_after_ar_block_invoke;
        v109 = (PKPaymentRegisterCredentialResponse *)&unk_1E2ABD9A0;
        v110[0] = v75;
        v63 = v75;
        v64 = v62;
        v65 = queue;
        dispatch_after(v64, queue, buf);

      }
      else
      {
        *(_QWORD *)buf = v59;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke_14;
        v109 = (PKPaymentRegisterCredentialResponse *)&unk_1E2ABD9A0;
        v110[0] = v60;
        v68 = v60;
        dispatch_async(v61, buf);

        v65 = v61;
      }

LABEL_45:
      v11 = v80;
      v13 = v83;
LABEL_49:

      v12 = v79;
      goto LABEL_50;
    }
    v79 = v12;
    v42 = v84;
    v43 = v81;
    v44 = (PKPaymentRegisterCredentialResponse *)objc_loadWeakRetained((id *)&v81->_backgroundDelegate);
    if (v9)
    {
      v45 = 0;
      v46 = 0;
      v47 = v84;
    }
    else
    {
      objc_msgSend(v42, "responseData");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKWebServiceResponse responseWithData:](PKPaymentDeviceCheckInResponse, "responseWithData:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (v67)
      {
        v46 = objc_msgSend(v67, "action");

        v45 = 1;
      }
      else
      {
        v45 = 0;
        v46 = 0;
      }
      v47 = v84;
      v43 = v81;
    }
LABEL_48:
    dispatch_get_global_queue(21, 0);
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = MEMORY[0x1E0C809B0];
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_552;
    v93[3] = &unk_1E2AD5138;
    v94 = v44;
    v95 = v43;
    v98 = v45;
    v96 = v47;
    v97 = v46;
    v71 = v93;
    *(_QWORD *)buf = v70;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke_14;
    v109 = (PKPaymentRegisterCredentialResponse *)&unk_1E2ABD9A0;
    v110[0] = v71;
    v40 = v44;
    v72 = v47;
    dispatch_async(v69, buf);

    v39 = v94;
    v11 = v80;
    v13 = v83;
    v29 = v43;
    goto LABEL_49;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v8, "taskIdentifier");
    objc_msgSend(v8, "originalRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v26 = (PKPaymentRegisterCredentialResponse *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v23;
    v13 = v83;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2112;
    v109 = v26;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error performing background download task %lu: %@. %@", buf, 0x20u);

    v11 = v80;
  }

  if (v22 != 2)
  {
    if (v22 == 3)
    {
LABEL_23:
      v27 = v84;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "taskIdentifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeRemoteURLAssetForTaskIdentifier:", v28);

      v13 = v83;
      v29 = v81;
      if ((objc_msgSend(v27, "hasOutstandingRemoteAssetTasks") & 1) != 0)
      {
LABEL_50:
        v41 = v84;

        goto LABEL_51;
      }
      v79 = v12;
      objc_msgSend(v27, "passURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebService _passWithFileURL:](v81, "_passWithFileURL:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v31, "organizationName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "serialNumber");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v33;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Asset downloads complete for %@:%@ -- delivering pass", buf, 0x16u);

      }
      v34 = objc_loadWeakRetained((id *)&v81->_backgroundDelegate);
      dispatch_get_global_queue(21, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = MEMORY[0x1E0C809B0];
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_550;
      v99[3] = &unk_1E2AC0F90;
      v100 = v34;
      v101 = v81;
      v102 = v31;
      v103 = v30;
      v37 = v99;
      *(_QWORD *)buf = v36;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke_14;
      v109 = (PKPaymentRegisterCredentialResponse *)&unk_1E2ABD9A0;
      v110[0] = v37;
      v38 = v34;
      v39 = v31;
      v40 = v30;
      dispatch_async(v35, buf);

      goto LABEL_45;
    }
    goto LABEL_28;
  }
  v29 = v81;
  -[PKPaymentWebService context](v81, "context");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "atomicallyUpdatePrimaryRegion:", &__block_literal_global_549);

  -[PKPaymentWebService _archiveContext](v81, "_archiveContext");
  v41 = v84;
  if (objc_msgSend(v84, "taskType") == 4)
  {
    v79 = v12;
    v49 = v84;
    v43 = v81;
    v47 = v84;
    v44 = (PKPaymentRegisterCredentialResponse *)objc_loadWeakRetained((id *)&v81->_backgroundDelegate);
    v45 = 0;
    v46 = 0;
    goto LABEL_48;
  }
LABEL_51:
  objc_msgSend(v13, "removeBackgroundDownloadRecordForTaskIdentifier:", objc_msgSend(v8, "taskIdentifier"));
  -[PKPaymentWebService _archiveBackgroundContext](v29, "_archiveBackgroundContext");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPaymentWebService backgroundContext](v29, "backgroundContext");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "remainingTasks");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v74;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Remaining background tasks: %@", buf, 0xCu);

    v41 = v84;
  }

  objc_autoreleasePoolPop(v11);
LABEL_54:

}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
  v11[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_2;
  v11[3] = &unk_1E2AD50A8;
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v17 = a2;
  v12 = v6;
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v9 = v11;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v19 = v9;
  v10 = v5;
  dispatch_async(v7, block);

}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 72);
  if (v1 == 2)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v11) = 0;
    v10 = "Credential Renewal Failed.";
LABEL_13:
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 2u);
    goto LABEL_14;
  }
  if (v1 == 1)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(v11) = 0;
    v10 = "Credential Renewal Rejected by User.";
    goto LABEL_13;
  }
  if (v1)
    return;
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Credentials renewed. Retrying request.", (uint8_t *)&v11, 2u);
  }

  v4 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "authorizationHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setValue:forHTTPHeaderField:](v4, "setValue:forHTTPHeaderField:", v5, CFSTR("Authorization"));

  objc_msgSend(*(id *)(a1 + 48), "logRequest:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 120), "downloadTaskWithRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentBackgroundDownloadRecord taskWithType:](PKPaymentBackgroundDownloadRecord, "taskWithType:", objc_msgSend(*(id *)(a1 + 56), "taskType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRetryCount:", objc_msgSend(*(id *)(a1 + 56), "retryCount") + 1);
  objc_msgSend(*(id *)(a1 + 64), "addBackgroundDownloadRecord:forTaskIdentifier:", v7, objc_msgSend(v6, "taskIdentifier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "taskIdentifier");
    -[NSObject URL](v4, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Creating background download task %lu: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v6, "resume");

LABEL_14:
}

uint64_t __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_548(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "regionBySettingLastUpdatedTag:", 0);
}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_550(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_2_551;
  v4[3] = &unk_1E2ABE120;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "paymentWebService:didDownloadPassRemoteAssets:completion:", v2, v3, v4);

}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_2_551(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up download cache copy of pass: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

void __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_552(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "region");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentWebService:deviceCheckInReturnedAction:success:region:identifier:", v3, v5, v4, v7, v6);

}

uint64_t __60__PKPaymentWebService_URLSession_task_didCompleteWithError___block_invoke_553(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentWebService:didRegisterCredentialWithIdentifier:response:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  NSURLSession *v6;
  NSURLSession *backgroundSession;
  id WeakRetained;
  id v9;
  NSURLSession *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentWebService;
  v6 = (NSURLSession *)a3;
  -[PKWebService URLSession:didBecomeInvalidWithError:](&v11, sel_URLSession_didBecomeInvalidWithError_, v6, a4);
  backgroundSession = self->_backgroundSession;

  if (backgroundSession == v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundDelegate);

    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)&self->_backgroundDelegate);
      objc_msgSend(v9, "paymentWebServiceBackgroundSessionDidBecomeInvalid:", self, v11.receiver, v11.super_class);

    }
    v10 = self->_backgroundSession;
    self->_backgroundSession = 0;

  }
}

- (void)_startBackgroundURLSessionWithIdentifier:(id)a3 context:(id)a4 backgroundDelegate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSURLSession *v23;
  NSURLSession *backgroundSession;
  NSURLSession *v25;
  void *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  if (!self->_backgroundSession)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Starting background URL session…", buf, 2u);
    }

    objc_storeStrong((id *)&self->_backgroundContext, a4);
    v15 = -[PKPaymentWebService canBypassTrustValidation](self, "canBypassTrustValidation");
    if (v15)
    {
      objc_msgSend(v10, "stringByAppendingString:", CFSTR("-nonEV"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v10;
    }
    v17 = v16;
    objc_msgSend(MEMORY[0x1E0C92CA0], "backgroundSessionConfigurationWithIdentifier:", v16, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "set_overridesBackgroundSessionAutoRedirect:", 1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("YES");
      if (v15)
        v19 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v29 = v17;
      v30 = 2114;
      v31 = v19;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Initializing background URL session: %@ with extended validation: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v18, "set_performsEVCertCheck:", !v15);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", v21);
    objc_msgSend(v18, "set_appleIDContext:", v22);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "paymentWebService:willCreateSessionWithConfiguration:", self, v18);
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v18, self, self->_backgroundSessionDelegateQueue);
    v23 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    backgroundSession = self->_backgroundSession;
    self->_backgroundSession = v23;

    objc_storeWeak((id *)&self->_backgroundDelegate, v12);
    v25 = self->_backgroundSession;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __102__PKPaymentWebService__startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke;
    v27[3] = &unk_1E2AD5160;
    v27[4] = self;
    -[NSURLSession getTasksWithCompletionHandler:](v25, "getTasksWithCompletionHandler:", v27);

    v11 = v26;
  }
  if (v13)
    v13[2](v13);

}

uint64_t __102__PKPaymentWebService__startBackgroundURLSessionWithIdentifier_context_backgroundDelegate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;
  NSObject *v6;
  uint8_t v7[16];

  result = objc_msgSend(a4, "count");
  if (!result)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "No pending background download tasks, cleaning up download cache", v7, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_cleanupPassDownloadCache");
  }
  return result;
}

- (BOOL)_hasConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PKPaymentWebService context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)_updateRequestWithCurrentTargetDevice:(id)a3
{
  objc_msgSend(a3, "setTargetDevice:", self->_targetDevice);
}

- (id)_passWithFileURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_passesByLocalURL, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = +[PKObject createWithFileURL:warnings:error:](PKPass, "createWithFileURL:warnings:error:", v4, 0, 0);
    if (objc_msgSend(v6, "passType") == 1 && (v7 = v6) != 0)
    {
      v5 = v7;
      -[PKPaymentWebServiceTargetDeviceProtocol secureElementIdentifiers](self->_targetDevice, "secureElementIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v8);

      -[NSMutableDictionary setObject:forKey:](self->_passesByLocalURL, "setObject:forKey:", v5, v4);
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "*** ERROR ***: Couldn't find local pass %@ for downloaded asset.", (uint8_t *)&v11, 0xCu);
      }

      v5 = 0;
    }

  }
  return v5;
}

- (void)_backgroundDownloadCloudStoreAssetsforItem:(id)a3 cloudStoreCoordinatorDelegate:(id)a4
{
  id v6;
  id v7;
  NSObject *backgroundDownloadQueue;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PKPaymentWebService *v16;
  _QWORD block[4];
  id v18;

  v6 = a3;
  v7 = a4;
  backgroundDownloadQueue = self->_backgroundDownloadQueue;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke;
  v13[3] = &unk_1E2ABE0F8;
  v14 = v6;
  v15 = v7;
  v16 = self;
  v10 = v13;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(backgroundDownloadQueue, block);

}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_2;
  v3[3] = &unk_1E2AD51B0;
  v3[4] = a1[6];
  v4 = v1;
  objc_msgSend(v4, "downloadAssetWithCloudStoreCoordinatorDelegate:completion:", v2, v3);

}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  _QWORD block[4];
  id v24;

  v7 = a2;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
  v17[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_3;
  v17[3] = &unk_1E2AD5188;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v12 = v9;
  v13 = *(_QWORD *)(a1 + 32);
  v18 = v12;
  v19 = v13;
  v20 = v8;
  v21 = v7;
  v22 = a3;
  v14 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_14;
  block[3] = &unk_1E2ABD9A0;
  v24 = v14;
  v15 = v7;
  v16 = v8;
  dispatch_async(v10, block);

}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  _BYTE buf[24];
  void *v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "recordName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "backgroundContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundDownloadRecordForRecordName:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v2;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v28 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Finished downloading task with recordName \"%@\", taskRecord:%@, error: %@,", buf, 0x20u);
  }

  if (v4)
  {
    if (*(_QWORD *)(a1 + 56) && !*(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 40), "_handleRemoteCloudStoreAssetForRecordName:taskRecord:data:shouldWriteData:", v2, v4);
    objc_msgSend(v4, "removeRemoteCloudStoreAssetForRecordName:", v2);
    if ((objc_msgSend(v4, "hasOutstandingRemoteAssetTasks") & 1) == 0)
    {
      objc_msgSend(v4, "passURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_passWithFileURL:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "organizationName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "serialNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Asset downloads complete for %@:%@ -- delivering pass", buf, 0x16u);

      }
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 248));
      dispatch_get_global_queue(21, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_567;
      v22[3] = &unk_1E2AC0F90;
      v14 = *(_QWORD *)(a1 + 40);
      v23 = WeakRetained;
      v24 = v14;
      v25 = v8;
      v26 = v7;
      v15 = v22;
      *(_QWORD *)buf = v13;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke_14;
      v28 = &unk_1E2ABD9A0;
      v29 = v15;
      v16 = v7;
      v17 = v8;
      v18 = WeakRetained;
      dispatch_async(v12, buf);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "backgroundContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeBackgroundDownloadRecordForRecordName:", v2);

  objc_msgSend(*(id *)(a1 + 40), "_archiveBackgroundContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "backgroundContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "remainingTasks");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Remaining background tasks: %@", buf, 0xCu);

  }
}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_567(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_2_568;
  v4[3] = &unk_1E2ABE120;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "paymentWebService:didDownloadPassRemoteAssets:completion:", v2, v3, v4);

}

void __96__PKPaymentWebService__backgroundDownloadCloudStoreAssetsforItem_cloudStoreCoordinatorDelegate___block_invoke_2_568(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up download cache copy of pass: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_handleRemoteAssetDownloadForManifestItem:(id)a3 taskPassURL:(id)a4 data:(id)a5 shouldWriteData:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    -[PKPaymentWebService _passWithFileURL:](self, "_passWithFileURL:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "dataAccessor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebServiceTargetDeviceProtocol secureElementIdentifiers](self->_targetDevice, "secureElementIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "remoteAssetManagerForSEIDs:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      v17 = objc_msgSend(v16, "addRemoteAssetData:shouldWriteData:forManifestItem:error:", v11, v6, v10, &v27);
      v18 = v27;
      objc_msgSend(v11, "SHA1Hash");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hexEncoding");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((PKCachedFileForSHA1Exists(v20) & 1) == 0)
        PKCacheFile(v11, v20);
      if ((v17 & 1) == 0)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

        if (v22)
        {
          objc_msgSend(v18, "userInfo");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CB3388]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            v25 = v24;
          else
            v25 = v18;
          objc_msgSend(v25, "localizedDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v26;
            _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "*** ERROR ***: Could not add asset to pass: %@", buf, 0xCu);
          }

        }
      }

    }
  }

}

- (void)_handleRemoteURLAssetDownloadTask:(id)a3 data:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "taskIdentifier"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService backgroundContext](self, "backgroundContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "taskIdentifier");

  objc_msgSend(v9, "backgroundDownloadRecordForTaskIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "remoteAssetsByTaskIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "passURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _handleRemoteAssetDownloadForManifestItem:taskPassURL:data:shouldWriteData:](self, "_handleRemoteAssetDownloadForManifestItem:taskPassURL:data:shouldWriteData:", v13, v14, v7, 1);

}

- (void)_handleRemoteCloudStoreAssetForRecordName:(id)a3 taskRecord:(id)a4 data:(id)a5 shouldWriteData:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "remoteAssetsByRecordName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "passURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService _handleRemoteAssetDownloadForManifestItem:taskPassURL:data:shouldWriteData:](self, "_handleRemoteAssetDownloadForManifestItem:taskPassURL:data:shouldWriteData:", v15, v14, v10, v6);
}

- (void)_handlePassListDownloadTask:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  PKPaymentWebService *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t v50[128];
  __int128 buf;
  void (*v52)(uint64_t);
  void *v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__53;
  v48 = __Block_byref_object_dispose__53;
  v49 = 0;
  objc_msgSend(v6, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke;
  v41[3] = &unk_1E2AC2918;
  v43 = &v44;
  v10 = v7;
  v42 = v10;
  -[PKPaymentWebService _resultForResponse:error:successHandler:](self, "_resultForResponse:error:successHandler:", v8, v9, v41);

  objc_msgSend(v6, "originalRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C78], "propertyForKey:inRequest:", CFSTR("regionPushTopic"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Region push topic: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend((id)v45[5], "devicePassSerialNumbers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundDelegate);
    dispatch_get_global_queue(21, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke_570;
    v36[3] = &unk_1E2AC0F90;
    v37 = WeakRetained;
    v38 = self;
    v39 = v14;
    v40 = v12;
    v18 = v36;
    *(_QWORD *)&buf = v17;
    *((_QWORD *)&buf + 1) = 3221225472;
    v52 = __dispatch_async_ar_block_invoke_14;
    v53 = &unk_1E2ABD9A0;
    v54 = v18;
    v19 = WeakRetained;
    dispatch_async(v16, &buf);

  }
  objc_msgSend((id)v45[5], "passURLs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = v20;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
    if (v21)
    {
      v29 = v6;
      v22 = v12;
      v23 = v11;
      v24 = v10;
      v25 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v13);
          -[PKPaymentWebService backgroundDownloadPassAtURL:](self, "backgroundDownloadPassAtURL:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v29);
        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
      }
      while (v21);
      v10 = v24;
      v11 = v23;
      v12 = v22;
      v6 = v29;
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "*** WARNING ***: No results returned for pass list", (uint8_t *)&buf, 2u);
  }

  objc_msgSend((id)v45[5], "lastUpdatedTag");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[PKPaymentWebService context](self, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke_571;
    v30[3] = &unk_1E2AD4A00;
    v31 = v27;
    objc_msgSend(v28, "atomicallyUpdatePrimaryRegion:", v30);

    -[PKPaymentWebService _archiveContext](self, "_archiveContext");
  }

  _Block_object_dispose(&v44, 8);
}

BOOL __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[PKWebServiceResponse responseWithData:](PKPaymentPassesResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

uint64_t __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke_570(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentWebService:didDownloadSerialNumbersForInstalledPasses:inRegion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __56__PKPaymentWebService__handlePassListDownloadTask_data___block_invoke_571(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "regionBySettingLastUpdatedTag:", *(_QWORD *)(a1 + 32));
}

- (void)_handlePassDownloadTask:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke;
  v10[3] = &unk_1E2AD51F8;
  v10[4] = self;
  -[PKPaymentWebService _passWithData:response:error:completion:](self, "_passWithData:response:error:completion:", v6, v8, v9, v10);

}

void __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a3;
  v6 = *(id **)(a1 + 32);
  if (a2 == 1)
  {
    WeakRetained = objc_loadWeakRetained(v6 + 31);
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke_2;
    v14[3] = &unk_1E2ABE0F8;
    v10 = *(_QWORD *)(a1 + 32);
    v15 = WeakRetained;
    v16 = v10;
    v17 = v5;
    v11 = v14;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E2ABD9A0;
    v19 = v11;
    v12 = WeakRetained;
    dispatch_async(v8, block);

  }
  else
  {
    objc_msgSend(v6, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "atomicallyUpdatePrimaryRegion:", &__block_literal_global_572);

    objc_msgSend(*(id *)(a1 + 32), "_archiveContext");
  }

}

uint64_t __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentWebService:didDownloadPass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __52__PKPaymentWebService__handlePassDownloadTask_data___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "regionBySettingLastUpdatedTag:", 0);
}

- (void)_handleDeviceCheckInTask:(id)a3 downloadRecord:(id)a4 data:(id)a5
{
  id v7;
  id v8;
  NSObject *backgroundDownloadQueue;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PKPaymentWebService *v15;
  _QWORD block[4];
  id v17;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    backgroundDownloadQueue = self->_backgroundDownloadQueue;
    v10 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__PKPaymentWebService__handleDeviceCheckInTask_downloadRecord_data___block_invoke;
    v12[3] = &unk_1E2ABE0F8;
    v13 = v7;
    v14 = v8;
    v15 = self;
    v11 = v12;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E2ABD9A0;
    v17 = v11;
    dispatch_async(backgroundDownloadQueue, block);

  }
}

uint64_t __68__PKPaymentWebService__handleDeviceCheckInTask_downloadRecord_data___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setResponseData:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "_archiveBackgroundContext");
}

- (void)_handleRetryAfterTSMSyncForPushTopic:(id)a3 withRequest:(id)a4 taskIdentifier:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[PKWebService webServiceTaskIdentifierForTaskIdentifier:](self, "webServiceTaskIdentifierForTaskIdentifier:", a5);
  v14 = (void *)MEMORY[0x19400CFE8]();
  os_unfair_lock_lock(&self->_delegateLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  os_unfair_lock_unlock(&self->_delegateLock);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v21++), "paymentWebService:didQueueTSMConnectionForTaskID:", self, v13);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

  objc_autoreleasePoolPop(v14);
  targetDevice = self->_targetDevice;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __105__PKPaymentWebService__handleRetryAfterTSMSyncForPushTopic_withRequest_taskIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E2ACD600;
  v25[4] = self;
  v26 = v11;
  v27 = v12;
  v28 = v13;
  v23 = v12;
  v24 = v11;
  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:queueConnectionToTrustedServiceManagerForPushTopic:withCompletion:](targetDevice, "paymentWebService:queueConnectionToTrustedServiceManagerForPushTopic:withCompletion:", self, v10, v25);

}

void __105__PKPaymentWebService__handleRetryAfterTSMSyncForPushTopic_withRequest_taskIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AnalyticsSendEvent();
  objc_msgSend(*(id *)(a1 + 32), "urlRequestTaggedWithUniqueRequestIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logRequest:", v5);
  v6 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105__PKPaymentWebService__handleRetryAfterTSMSyncForPushTopic_withRequest_taskIdentifier_completionHandler___block_invoke_2;
  v20[3] = &unk_1E2AC70F8;
  v20[4] = v6;
  v21 = *(id *)(a1 + 48);
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v5, v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

  v8 = (void *)MEMORY[0x19400CFE8]();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 172));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 172));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "paymentWebService:didCompleteTSMConnectionForTaskID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v13);
  }

  objc_autoreleasePoolPop(v8);
}

void __105__PKPaymentWebService__handleRetryAfterTSMSyncForPushTopic_withRequest_taskIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  objc_super v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "logResponse:withData:", v8, v7);
    v10 = *(_QWORD *)(a1 + 40);
    v11.receiver = *(id *)(a1 + 32);
    v11.super_class = (Class)PKPaymentWebService;
    objc_msgSendSuper2(&v11, sel_handleResponse_withError_data_task_completionHandler_, v8, v9, v7, 0, v10);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_handleRetryAfterRegisterWithRequest:(id)a3 response:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Registering device, and then retrying same request", buf, 2u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__PKPaymentWebService__handleRetryAfterRegisterWithRequest_response_completionHandler___block_invoke;
  v14[3] = &unk_1E2AD5220;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v12 = v10;
  v13 = v8;
  -[PKPaymentWebService _registerIfNeededWithResponse:task:isRedirect:completion:](self, "_registerIfNeededWithResponse:task:isRedirect:completion:", v9, 0, 1, v14);

}

void __87__PKPaymentWebService__handleRetryAfterRegisterWithRequest_response_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, void *);
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Registration failed with error %@. Aborting original request.", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Registration succeeded, retrying original request", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "urlRequestTaggedWithUniqueRequestIdentifier:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "logRequest:", v6);
    v7 = *(void **)(a1 + 32);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __87__PKPaymentWebService__handleRetryAfterRegisterWithRequest_response_completionHandler___block_invoke_580;
    v12 = &unk_1E2AC70F8;
    v13 = v7;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v7, "dataTaskWithRequest:completionHandler:", v6, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume", v9, v10, v11, v12, v13);

  }
}

void __87__PKPaymentWebService__handleRetryAfterRegisterWithRequest_response_completionHandler___block_invoke_580(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "logResponse:withData:", v7, v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0xFuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Enrolling Apple Pay Trust Key", buf, 2u);
  }

  objc_msgSend(v6, "HTTPBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PKPaymentWebService__handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E2AD5248;
  v13[4] = self;
  v14 = v6;
  v15 = v9;
  v16 = v7;
  v10 = v7;
  v11 = v9;
  v12 = v6;
  -[PKPaymentWebService performApplePayTrustRegistrationWithCompletion:](self, "performApplePayTrustRegistrationWithCompletion:", v13);

}

void __101__PKPaymentWebService__handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "urlRequestTaggedWithUniqueRequestIdentifier:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = *(_QWORD *)(a1 + 48);
    if (!v10)
    {
      PKLogFacilityTypeGetObject(0xFuLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust registration succeded, but no request body to modify for retry", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = 0;
      goto LABEL_21;
    }
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, &v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v25;
    if (v12 || !v11)
    {
      if (!v11)
      {
        v13 = CFSTR("nil");
        goto LABEL_17;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (__CFString *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v5, "publicKeyHash");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hexEncoding");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v15, CFSTR("publicKeyHash"));

        +[PKWebServiceRequest _HTTPBodyWithDictionary:](PKWebServiceRequest, "_HTTPBodyWithDictionary:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHTTPBody:", v16);

        objc_msgSend(*(id *)(a1 + 32), "logRequest:", v9);
        v17 = *(void **)(a1 + 32);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __101__PKPaymentWebService__handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest_completionHandler___block_invoke_2;
        v23[3] = &unk_1E2AC70F8;
        v23[4] = v17;
        v24 = *(id *)(a1 + 56);
        objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v9, v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "resume");

LABEL_20:
LABEL_21:

        goto LABEL_22;
      }
    }
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    PKLogFacilityTypeGetObject(0xEuLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v13;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust registration succeded, but could not retry request after Apple Pay Trust registration. Expected dictionary and received %@ with JSON error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = 0;
    goto LABEL_20;
  }
  PKLogFacilityTypeGetObject(0xFuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust enrollment failed with error: %@\n", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = 0;
LABEL_22:

}

void __101__PKPaymentWebService__handleRetryAfterApplePayTrustEnrollmentWithOriginalRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "logResponse:withData:", v7, v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = 0;

}

- (void)_registerIfNeededWithResponse:(id)a3 task:(id)a4 isRedirect:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *activeRegistrationTasks;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD *v29;
  id *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id location;
  uint8_t buf[4];
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_initWeak(&location, a4);
  v11 = a6;
  os_unfair_lock_lock(&self->_lock);
  activeRegistrationTasks = objc_loadWeakRetained(&location);

  if (activeRegistrationTasks)
  {
    v13 = objc_loadWeakRetained(&location);
    v14 = -[PKWebService webServiceTaskIdentifierForTaskIdentifier:](self, "webServiceTaskIdentifierForTaskIdentifier:", objc_msgSend(v13, "taskIdentifier"));

    activeRegistrationTasks = self->_activeRegistrationTasks;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(activeRegistrationTasks) = objc_msgSend(activeRegistrationTasks, "containsObject:", v15);

  }
  os_unfair_lock_unlock(&self->_lock);
  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v10, "pk_valueForHTTPHeaderField:", CFSTR("BrokerURL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((activeRegistrationTasks & 1) != 0)
    goto LABEL_4;
  if (v18 && a5)
  {
    v19 = 0;
    v20 = CFSTR("Server requested registration during HTTP Redirect");
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "pk_valueForHTTPHeaderField:", CFSTR("regionbrokerurl"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URLWithString:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "pk_valueForHTTPHeaderField:", CFSTR("x-pod-region"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService context](self, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "regionForIdentifier:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26 != 0;

    v20 = CFSTR("Wallet noticed missing registration during HTTP response");
    v18 = (void *)v23;
    if (!v23)
      goto LABEL_4;
  }
  if (!v19)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v20;
      _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Request device registration because: %@", buf, 0xCu);
    }

    -[PKPaymentWebService targetDevice](self, "targetDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke;
      v34[3] = &unk_1E2AC2800;
      v29 = v34;
      v34[4] = v11;
      objc_msgSend(v28, "performDeviceRegistrationForReason:brokerURL:completion:", v20, v18, v34);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke_603;
        v31[3] = &unk_1E2AD5270;
        v32 = v11;
        -[PKPaymentWebService registerDeviceAtBrokerURL:consistencyCheckResults:completion:](self, "registerDeviceAtBrokerURL:consistencyCheckResults:completion:", v18, 0, v31);
        v30 = &v32;
        goto LABEL_18;
      }
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke_601;
      v33[3] = &unk_1E2ACFCF8;
      v29 = v33;
      v33[4] = v11;
      objc_msgSend(v28, "performDeviceRegistrationReturningContextForReason:brokerURL:completion:", v20, v18, v33);
    }
    v30 = (id *)(v29 + 4);
LABEL_18:

    goto LABEL_19;
  }
LABEL_4:
  (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_19:

  objc_destroyWeak(&location);
}

void __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 0x10) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Registration failed with error %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 32);
    PKDisplayableErrorForCommonType(0, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke_601(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((a2 & 0x10) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Registration failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 32);
    PKDisplayableErrorForCommonType(0, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
}

void __80__PKPaymentWebService__registerIfNeededWithResponse_task_isRedirect_completion___block_invoke_603(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a2 == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Registration failed with error %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 32);
    PKDisplayableErrorForCommonType(0, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
}

- (void)_applePayTrustPublicKeyHashWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Fetching Apple Pay Trust key from NearField", buf, 2u);
    }

    -[PKPaymentWebService targetDevice](self, "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__PKPaymentWebService__applePayTrustPublicKeyHashWithCompletion___block_invoke;
    v7[3] = &unk_1E2ABDEC8;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "applePayTrustKeyForIdentifier:completion:", CFSTR("com.apple.wallet.applepaytrust"), v7);

  }
}

void __65__PKPaymentWebService__applePayTrustPublicKeyHashWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "publicKeyHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Fetched Apple Pay Trust key from with publicKeyHash: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (!a2)
    {
      PKLogFacilityTypeGetObject(0xFuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Apple Pay Trust Key does not exist.", buf, 2u);
      }

    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__PKPaymentWebService__applePayTrustPublicKeyHashWithCompletion___block_invoke_604;
    v8[3] = &unk_1E2AD5298;
    v7 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performApplePayTrustRegistrationWithCompletion:", v8);

  }
}

void __65__PKPaymentWebService__applePayTrustPublicKeyHashWithCompletion___block_invoke_604(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "publicKeyHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0xFuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v10 = 138412290;
      v11 = v4;
      v7 = "Created Apple Pay Trust key with publicKeyHash: %@";
      v8 = v5;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10) = 0;
    v7 = "Failed to create Apple Pay Trust Key.";
    v8 = v5;
    v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4);
}

- (id)_downloadPassesWithURLs:(id)a3
{
  id v4;
  dispatch_queue_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = dispatch_queue_create("passQueue", 0);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = dispatch_group_create();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        dispatch_group_enter(v7);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __47__PKPaymentWebService__downloadPassesWithURLs___block_invoke;
        v15[3] = &unk_1E2AD52C0;
        v16 = v5;
        v17 = v6;
        v18 = v7;
        -[PKPaymentWebService passAtURL:completion:](self, "passAtURL:completion:", v12, v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  return v6;
}

void __47__PKPaymentWebService__downloadPassesWithURLs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;

  v5 = a3;
  if (a2 == 1)
  {
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__PKPaymentWebService__downloadPassesWithURLs___block_invoke_2;
    v9[3] = &unk_1E2ABE0F8;
    v7 = *(NSObject **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = v5;
    v12 = *(id *)(a1 + 48);
    v8 = v9;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_14;
    block[3] = &unk_1E2ABD9A0;
    v14 = v8;
    dispatch_async(v7, block);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

void __47__PKPaymentWebService__downloadPassesWithURLs___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)_deviceConfigurationDataWithCompletion:(id)a3
{
  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:configurationDataWithCompletionHandler:](self->_targetDevice, "paymentWebService:configurationDataWithCompletionHandler:", self, a3);
}

- (void)_deviceRegistrationDataWithCompletion:(id)a3
{
  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:registrationDataWithCompletionHandler:](self->_targetDevice, "paymentWebService:registrationDataWithCompletionHandler:", self, a3);
}

- (void)_deviceProvisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v4 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67240192;
    v8[1] = v4;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Requesting device provisioning data including metadata: %{public}d", (uint8_t *)v8, 8u);
  }

  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:provisioningDataIncludingDeviceMetadata:withCompletionHandler:](self->_targetDevice, "paymentWebService:provisioningDataIncludingDeviceMetadata:withCompletionHandler:", self, v4, v6);
}

- (void)_deviceDataIncludingMetadataFields:(unint64_t)a3 withCompletionHandler:(id)a4
{
  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:deviceMetadataWithFields:completion:](self->_targetDevice, "paymentWebService:deviceMetadataWithFields:completion:", self, a3, a4);
}

- (unint64_t)_downloadPassAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  PKPaymentWebServiceRequest *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  v9 = objc_alloc_init(PKPaymentWebServiceRequest);
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v9);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKWebServiceRequest _murlRequestWithURL:appleAccountInformation:](v9, "_murlRequestWithURL:appleAccountInformation:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__PKPaymentWebService__downloadPassAtURL_completion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v14);

  return v8;
}

uint64_t __53__PKPaymentWebService__downloadPassAtURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_passWithData:response:error:completion:", a2, a3, a4, *(_QWORD *)(a1 + 40));
}

- (void)_passWithData:(id)a3 response:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, unint64_t, _QWORD, id);
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  _QWORD v20[4];
  id v21;
  PKPaymentWebService *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, unint64_t, _QWORD, id))a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__53;
  v28 = __Block_byref_object_dispose__53;
  v29 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __63__PKPaymentWebService__passWithData_response_error_completion___block_invoke;
  v20[3] = &unk_1E2AD5080;
  v14 = v10;
  v22 = self;
  v23 = &v24;
  v21 = v14;
  v15 = -[PKPaymentWebService _resultForResponse:error:successHandler:](self, "_resultForResponse:error:successHandler:", v11, v12, v20);
  if (v15 != 1)
  {
    if (!v12)
      goto LABEL_7;
    objc_msgSend(v12, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v12, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("PKWebServiceErrorDomain")))
    {

      goto LABEL_8;
    }
    objc_msgSend(v12, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("PKPaymentWebServiceErrorDomain"));

    if ((v19 & 1) == 0)
    {
LABEL_7:
      -[PKPaymentWebService _errorWithResult:data:](self, "_errorWithResult:data:", v15, v14);
      v16 = v12;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_9:
  v13[2](v13, v15, v25[5], v12);

  _Block_object_dispose(&v24, 8);
}

uint64_t __63__PKPaymentWebService__passWithData_response_error_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v11 = 0;
  v3 = +[PKObject createWithData:warnings:error:](PKPass, "createWithData:warnings:error:", v2, 0, &v11);
  v4 = v11;
  if (objc_msgSend(v3, "passType") == 1)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v3);
  v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(*(id *)(a1[5] + 256), "secureElementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v6);

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v7 = 1;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Unable to initialize pass with downloaded data: %@", buf, 0xCu);

    }
    v7 = 3;
  }

  return v7;
}

- (void)_passOwnershipTokenForPaymentCredential:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  PKPaymentService *v14;
  id v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD);
  _QWORD v18[5];
  id v19;
  void (**v20)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!v7)
    goto LABEL_14;
  if (objc_msgSend(v6, "isRemoteCredential"))
  {
    objc_msgSend(v6, "remoteCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isAccountCredential"))
  {
    objc_msgSend(v6, "accountCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isPeerPaymentCredential"))
    {
LABEL_12:
      v7[2](v7, 0);
      goto LABEL_14;
    }
    objc_msgSend(v6, "peerPaymentCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "ownershipTokenIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_12;
  -[PKPaymentWebServiceTargetDeviceProtocol deviceName](self->_targetDevice, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Apple Watch"));

  if (v12 && (PKRunningInPassd() & 1) == 0)
  {
    v14 = objc_alloc_init(PKPaymentService);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke;
    v18[3] = &unk_1E2AD52E8;
    v19 = v10;
    v20 = v7;
    v18[4] = self;
    v15 = v10;
    -[PKPaymentService passOwnershipTokenWithIdentifier:completion:](v14, "passOwnershipTokenWithIdentifier:completion:", v15, v18);

  }
  else
  {
    targetDevice = self->_targetDevice;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke_3;
    v16[3] = &unk_1E2ABE390;
    v17 = v7;
    -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:passOwnershipTokenWithIdentifier:completion:](targetDevice, "paymentWebService:passOwnershipTokenWithIdentifier:completion:", self, v10, v16);

  }
LABEL_14:

}

void __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v2 + 256);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke_2;
    v5[3] = &unk_1E2ABE390;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "paymentWebService:passOwnershipTokenWithIdentifier:completion:", v2, v3, v5);

  }
}

uint64_t __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__PKPaymentWebService__passOwnershipTokenForPaymentCredential_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v6;
  PKPaymentService *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:storePassOwnershipToken:withIdentifier:](self->_targetDevice, "paymentWebService:storePassOwnershipToken:withIdentifier:", self, v8, v6);
    }
    else
    {
      v7 = objc_alloc_init(PKPaymentService);
      -[PKPaymentService storePassOwnershipToken:withIdentifier:](v7, "storePassOwnershipToken:withIdentifier:", v8, v6);

    }
  }

}

- (unint64_t)_resultForResponse:(id)a3 error:(id)a4 successHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (**)(_QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v8, "statusCode");
    if (v11 == 207 || v11 == 200)
      v12 = v10[2](v10);
    else
      v12 = -[PKPaymentWebService _resultForUnexpectedStatusCode:](self, "_resultForUnexpectedStatusCode:", v11);
    v14 = v12;
  }
  else
  {
    if (v9)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "URL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "absoluteString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v17;
        v20 = 2112;
        v21 = v9;
        _os_log_error_impl(&dword_18FC92000, v13, OS_LOG_TYPE_ERROR, "Error executing request: %@ error: %@", (uint8_t *)&v18, 0x16u);

      }
    }
    v14 = 0;
  }

  return v14;
}

- (unint64_t)_resultForUnexpectedStatusCode:(int64_t)a3
{
  return 2 * (a3 == 417);
}

- (id)_errorWithResult:(unint64_t)a3 data:(id)a4
{
  return -[PKPaymentWebService _errorWithResult:response:data:](self, "_errorWithResult:response:data:", a3, 0, a4);
}

- (id)_errorWithResult:(unint64_t)a3 response:(id)a4 data:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = 0;
  if (a3 <= 3 && a3 != 1)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    PKLocalizedPaymentString(CFSTR("UNEXPECTED_ERROR"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D50]);

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "statusCode"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("PKErrorHTTPResponseStatusCodeKey"));

      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentWebServiceErrorDomain"), a3, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_paymentDevice
{
  PKPaymentDevice *paymentDevice;
  PKPaymentDevice *v4;
  PKPaymentDevice *v5;

  paymentDevice = self->_paymentDevice;
  if (!paymentDevice)
  {
    v4 = objc_alloc_init(PKPaymentDevice);
    v5 = self->_paymentDevice;
    self->_paymentDevice = v4;

    paymentDevice = self->_paymentDevice;
  }
  return paymentDevice;
}

- (id)_movePassToDownloadCache:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  const __CFUUID *v14;
  CFStringRef v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "serializedFileWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithSerializedRepresentation:", v4);
  -[PKPaymentWebService _downloadCacheLocation](self, "_downloadCacheLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v23);
    v10 = v23;

    if ((v12 & 1) == 0 && v10)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Could not create download cache at %@", buf, 0xCu);
      }

    }
  }
  v14 = CFUUIDCreate(0);
  v15 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14);
  objc_msgSend(v6, "URLByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("pkpass"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(v15);
  CFRelease(v14);
  objc_msgSend(v5, "writeToURL:options:originalContentsURL:error:", v17, 1, 0, 0);
  v18 = +[PKObject createWithFileURL:warnings:error:](PKPass, "createWithFileURL:warnings:error:", v17, 0, 0);
  if (objc_msgSend(v18, "passType") == 1)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;
  -[PKPaymentWebServiceTargetDeviceProtocol secureElementIdentifiers](self->_targetDevice, "secureElementIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v21);

  return v20;
}

- (id)_downloadCacheLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  PKCacheDirectoryPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("PassDownloadCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_cleanupPassDownloadCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _downloadCacheLocation](self, "_downloadCacheLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeItemAtPath:error:", v12, 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_archiveContext
{
  void *v3;
  id v4;

  -[PKPaymentWebService context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKPaymentWebService archiver](self, "archiver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "archiveContext:", v4);

  }
}

- (void)_archiveBackgroundContext
{
  void *v3;
  id v4;

  -[PKPaymentWebService archiver](self, "archiver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService backgroundContext](self, "backgroundContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archiveBackgroundContext:", v3);

}

- (PKPaymentWebServiceBackgroundContext)backgroundContext
{
  return (PKPaymentWebServiceBackgroundContext *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBackgroundContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (PKPaymentWebServiceArchiver)archiver
{
  return (PKPaymentWebServiceArchiver *)objc_getProperty(self, a2, 240, 1);
}

- (void)setArchiver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (PKPaymentWebServiceBackgroundDelegate)backgroundDelegate
{
  return (PKPaymentWebServiceBackgroundDelegate *)objc_loadWeakRetained((id *)&self->_backgroundDelegate);
}

- (void)setBackgroundDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundDelegate, a3);
}

- (BOOL)sharedService
{
  return self->_sharedService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_destroyWeak((id *)&self->_backgroundDelegate);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_backgroundContext, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_backgroundSessionDelegateQueue, 0);
  objc_storeStrong((id *)&self->_backgroundDownloadQueue, 0);
  objc_storeStrong((id *)&self->_activeRegistrationTasks, 0);
  objc_storeStrong((id *)&self->_passesByLocalURL, 0);
  objc_storeStrong((id *)&self->_paymentDevice, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
}

- (unint64_t)_performAccountApplePayTrustProtocolRequest:(id)a3 originalRequest:(id)a4 taskID:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __112__PKPaymentWebService_PKAccount___performAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke;
  v18[3] = &unk_1E2AD6FD8;
  v19 = v10;
  v20 = v11;
  v14 = v11;
  v15 = v10;
  v16 = -[PKPaymentWebService _performAccountRequest:taskID:responseClass:completion:](self, "_performAccountRequest:taskID:responseClass:completion:", v12, a5, v13, v18);

  return v16;
}

void __112__PKPaymentWebService_PKAccount___performAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (v8 && !v5)
    objc_msgSend(*(id *)(a1 + 32), "setHashResponse:");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v8, v6);

}

- (unint64_t)_performOptionalAccountApplePayTrustProtocolRequest:(id)a3 originalRequest:(id)a4 taskID:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!a5)
    a5 = -[PKWebService nextTaskID](self, "nextTaskID");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __120__PKPaymentWebService_PKAccount___performOptionalAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke;
  v16[3] = &unk_1E2ACB638;
  v16[4] = self;
  v17 = v11;
  v18 = v12;
  v13 = v12;
  v14 = v11;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v10, a5, v16);

  return a5;
}

void __120__PKPaymentWebService_PKAccount___performOptionalAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 1;
  if (v7 && !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("referenceIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v13 != 0;

      }
    }

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__60;
  v34 = __Block_byref_object_dispose__60;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__60;
  v28 = __Block_byref_object_dispose__60;
  v29 = 0;
  v14 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __120__PKPaymentWebService_PKAccount___performOptionalAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke_12;
  v18[3] = &unk_1E2AD7000;
  v23 = v11;
  v21 = &v30;
  v15 = v7;
  v19 = v15;
  v20 = *(id *)(a1 + 40);
  v22 = &v24;
  v16 = objc_msgSend(v14, "_resultForResponse:error:successHandler:", v8, v10, v18);
  if (!v10 && v16 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v16, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v17 + 16))(v17, v31[5], v25[5], v10);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

BOOL __120__PKPaymentWebService_PKAccount___performOptionalAccountApplePayTrustProtocolRequest_originalRequest_taskID_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (*(_BYTE *)(a1 + 64))
  {
    +[PKWebServiceResponse responseWithData:](PKApplePayTrustHashResponse, "responseWithData:", *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(a1 + 40), "setHashResponse:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "signatureResponseClass"), "responseWithData:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
      || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
}

- (unint64_t)_performAccountRequest:(id)a3 taskID:(unint64_t)a4 responseClass:(Class)a5 completion:(id)a6
{
  return -[PKPaymentWebService _performAccountRequest:account:request:taskID:responseClass:completion:](self, "_performAccountRequest:account:request:taskID:responseClass:completion:", a3, 0, 0, a4, a5, a6);
}

- (unint64_t)_performAccountRequest:(id)a3 account:(id)a4 request:(id)a5 taskID:(unint64_t)a6 responseClass:(Class)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  Class v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (!a6)
    a6 = -[PKWebService nextTaskID](self, "nextTaskID");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__PKPaymentWebService_PKAccount___performAccountRequest_account_request_taskID_responseClass_completion___block_invoke;
  v22[3] = &unk_1E2AD7050;
  v22[4] = self;
  v23 = v15;
  v25 = v17;
  v26 = a7;
  v24 = v16;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v14, a6, v22);

  return a6;
}

void __105__PKPaymentWebService_PKAccount___performAccountRequest_account_request_taskID_responseClass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__60;
  v25 = __Block_byref_object_dispose__60;
  v26 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__PKPaymentWebService_PKAccount___performAccountRequest_account_request_taskID_responseClass_completion___block_invoke_2;
  v15[3] = &unk_1E2AD7028;
  v10 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v19 = &v21;
  v20 = v11;
  v12 = v7;
  v18 = v12;
  v13 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v8, v9, v15);
  if (!v9 && v13 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v13, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v22[5], v9);

  _Block_object_dispose(&v21, 8);
}

BOOL __105__PKPaymentWebService_PKAccount___performAccountRequest_account_request_taskID_responseClass_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = a1[4];
  v3 = a1[5];
  v4 = (void *)a1[8];
  v5 = a1[6];
  if (v2 | v3)
    objc_msgSend(v4, "responseWithData:account:request:", v5);
  else
    objc_msgSend(v4, "responseWithData:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) != 0;
}

- (unint64_t)_performAccountRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;

  v8 = a5;
  v9 = a3;
  v10 = -[PKPaymentWebService _performAccountRequest:taskID:responseClass:completion:](self, "_performAccountRequest:taskID:responseClass:completion:", v9, -[PKWebService nextTaskID](self, "nextTaskID"), a4, v8);

  return v10;
}

- (unint64_t)_performAccountRequest:(id)a3 account:(id)a4 responseClass:(Class)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[PKPaymentWebService _performAccountRequest:account:request:taskID:responseClass:completion:](self, "_performAccountRequest:account:request:taskID:responseClass:completion:", v12, v11, 0, -[PKWebService nextTaskID](self, "nextTaskID"), a5, v10);

  return v13;
}

- (unint64_t)_performAccountRequest:(id)a3 request:(id)a4 responseClass:(Class)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[PKPaymentWebService _performAccountRequest:account:request:taskID:responseClass:completion:](self, "_performAccountRequest:account:request:taskID:responseClass:completion:", v12, 0, v11, -[PKWebService nextTaskID](self, "nextTaskID"), a5, v10);

  return v13;
}

- (unint64_t)generateTopUpTokenWithRequest:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_urlRequestWithAppleAccountInformation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKPaymentWebService _performAccountRequest:account:responseClass:completion:](self, "_performAccountRequest:account:responseClass:completion:", v12, v9, objc_opt_class(), v8);
  return v13;
}

- (unint64_t)resolveStorefrontCountryMismatchWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)_performApplyRequest:(id)a3 responseClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  _QWORD v13[5];
  id v14;
  Class v15;

  v8 = a5;
  v9 = a3;
  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__PKPaymentWebService_PKApplyWebService___performApplyRequest_responseClass_completion___block_invoke;
  v13[3] = &unk_1E2AC2A10;
  v14 = v8;
  v15 = a4;
  v13[4] = self;
  v11 = v8;
  -[PKWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v10, v13);

  return v10;
}

void __88__PKPaymentWebService_PKApplyWebService___performApplyRequest_responseClass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__81;
  v28 = __Block_byref_object_dispose__81;
  v29 = 0;
  v10 = *(void **)(a1 + 32);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __88__PKPaymentWebService_PKApplyWebService___performApplyRequest_responseClass_completion___block_invoke_7;
  v19 = &unk_1E2ADB6B0;
  v11 = *(_QWORD *)(a1 + 48);
  v22 = &v24;
  v23 = v11;
  v12 = v7;
  v20 = v12;
  v13 = v8;
  v21 = v13;
  v14 = objc_msgSend(v10, "_resultForResponse:error:successHandler:", v13, v9, &v16);
  if (!v9 && v14 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithResult:data:", v14, v12, v16, v17, v18, v19, v20);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, v25[5], v9);

  _Block_object_dispose(&v24, 8);
}

BOOL __88__PKPaymentWebService_PKApplyWebService___performApplyRequest_responseClass_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 56), "responseWithData:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "allHeaderFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PKStringForKey:", CFSTR("x-conversation-id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setConversationIdentifier:", v6);
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

- (unint64_t)applicationsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  objc_msgSend(v7, "applyServiceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PKPaymentWebService_PKApplyWebService__applicationsWithRequest_completion___block_invoke;
  v15[3] = &unk_1E2ADB6D8;
  v16 = v6;
  v12 = v6;
  v13 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v10, v11, v15);

  return v13;
}

uint64_t __77__PKPaymentWebService_PKApplyWebService__applicationsWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)deleteApplicationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)createWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  objc_msgSend(v7, "applyServiceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v10, objc_opt_class(), v6);
  return v11;
}

- (unint64_t)applyWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)submitDocumentsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)submitVerificationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)resendVerificationRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)termsDataWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;

  v6 = a3;
  v7 = a4;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v6);
  objc_msgSend(v6, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[PKPaymentWebService context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyServiceURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBaseURL:", v11);

  }
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_urlRequestWithAppleAccountInformation:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v13, objc_opt_class(), v7);
  return v14;
}

- (unint64_t)featureTermsDataWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  objc_msgSend(v9, "applyServiceURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v12, objc_opt_class(), v6);
  return v13;
}

- (unint64_t)shownTermsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)submitTermsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)augmentedProductWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  objc_msgSend(v9, "applyServiceURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKPaymentWebService _performApplyRequest:responseClass:completion:](self, "_performApplyRequest:responseClass:completion:", v12, objc_opt_class(), v6);
  return v13;
}

- (unint64_t)accountFinancingOptionsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountFinancingPlansWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountFinancingPlanPaymentIntentWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountFinancingPlanNonceWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountPayLaterChangeAutoPaymentWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountPayLaterDisputeSendEmailWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountPayLaterContentWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountPayLaterFinancingOptionCancellationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

- (unint64_t)accountPayLaterFinancingPlanCancellationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithAppleAccountInformation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentWebService _performAccountRequest:responseClass:completion:](self, "_performAccountRequest:responseClass:completion:", v9, objc_opt_class(), v6);
  return v10;
}

@end
