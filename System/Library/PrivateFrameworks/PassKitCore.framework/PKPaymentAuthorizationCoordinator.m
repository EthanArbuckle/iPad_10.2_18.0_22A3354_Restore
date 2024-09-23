@implementation PKPaymentAuthorizationCoordinator

+ (BOOL)canMakePayments
{
  _BOOL8 Payments;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  Payments = PKCanMakePayments();
  v3 = (void *)MEMORY[0x1E0C99E08];
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", Payments);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "PKSanitizedBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("bundle"));
  AnalyticsSendEvent();

  return Payments;
}

+ (BOOL)canMakePaymentsUsingNetworks:(id)a3 webDomain:(id)a4
{
  return objc_msgSend(a1, "canMakePaymentsUsingNetworks:capabilities:webDomain:", a3, 31, a4);
}

+ (BOOL)canMakePaymentsUsingNetworks:(id)a3 capabilities:(unint64_t)a4 webDomain:(id)a5
{
  return objc_msgSend(a1, "_canMakePaymentsUsingNetworks:capabilities:webDomain:paymentRequestType:", a3, a4, a5, 0);
}

+ (BOOL)_canMakePaymentsUsingNetworks:(id)a3 capabilities:(unint64_t)a4 webDomain:(id)a5 paymentRequestType:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  PKCanMakePayments();
  PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType = PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType(v9, 0, a4, v10, v11);
  PKMerchantCapabilityToStrings(a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  v15 = v13;
  v16 = v10;
  v17 = (void *)MEMORY[0x1E0C99E08];
  v26 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "PKSanitizedBundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("bundle"));
  if (v14 && objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("networks"));

  }
  if (v15 && objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("capabilities"));

  }
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("domain"));
  AnalyticsSendEvent();

  return PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType;
}

+ (BOOL)supportsDisbursementsUsingNetworks:(id)a3
{
  return objc_msgSend(a1, "_canMakePaymentsUsingNetworks:capabilities:webDomain:paymentRequestType:", a3, 31, 0, &unk_1E2C3EBF0);
}

+ (BOOL)supportsDisbursementsUsingNetworks:(id)a3 capabilities:(unint64_t)a4
{
  return objc_msgSend(a1, "_canMakePaymentsUsingNetworks:capabilities:webDomain:paymentRequestType:", a3, a4, 0, &unk_1E2C3EBF0);
}

- (PKPaymentAuthorizationCoordinator)initWithDisbursementRequest:(id)a3
{
  id v4;
  PKDisbursementPaymentRequest *v5;
  PKPaymentAuthorizationCoordinator *v6;

  v4 = a3;
  v5 = -[PKDisbursementPaymentRequest initWithDisbursementRequest:]([PKDisbursementPaymentRequest alloc], "initWithDisbursementRequest:", v4);

  v6 = -[PKPaymentAuthorizationCoordinator initWithPaymentRequest:](self, "initWithPaymentRequest:", v5);
  return v6;
}

- (PKPaymentAuthorizationCoordinator)init
{
  return -[PKPaymentAuthorizationCoordinator initWithPaymentRequest:](self, "initWithPaymentRequest:", 0);
}

- (PKPaymentAuthorizationCoordinator)initWithRemotePaymentRequestPromised
{
  PKPaymentRequest *v3;
  PKPaymentAuthorizationCoordinator *v4;

  v3 = objc_alloc_init(PKPaymentRequest);
  v4 = -[PKPaymentAuthorizationCoordinator initWithPaymentRequest:remotePaymentRequestPromised:](self, "initWithPaymentRequest:remotePaymentRequestPromised:", v3, 1);

  return v4;
}

- (PKPaymentAuthorizationCoordinator)initWithPaymentRequest:(id)a3
{
  return -[PKPaymentAuthorizationCoordinator initWithPaymentRequest:remotePaymentRequestPromised:](self, "initWithPaymentRequest:remotePaymentRequestPromised:", a3, 0);
}

- (PKPaymentAuthorizationCoordinator)initWithPaymentRequest:(id)a3 remotePaymentRequestPromised:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  PKPaymentAuthorizationCoordinator *v21;
  PKPaymentAuthorizationCoordinator *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *queue;
  void *v25;
  uint64_t v26;
  NSString *hostIdentifier;
  uint64_t v28;
  NSXPCListener *listener;
  PKPaymentAuthorizationCoordinatorExportedObject *v30;
  PKPaymentAuthorizationCoordinatorExportedObject *exportedObject;
  PKPaymentAuthorizationCoordinator *v32;
  NSObject *v33;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  objc_super v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v4)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Remote Payment Request has been promised, will check validity on fulfillment", buf, 2u);
    }

    v10 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "requestType") == 10 && objc_msgSend(v8, "APIType") == 2)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Skipping initial validation for a PKDisbursementRequest originating from the Web", buf, 2u);
    }

    +[PKDisbursementPaymentRequestValidator validatorWithObject:shouldSkipValidation:](PKDisbursementPaymentRequestValidator, "validatorWithObject:shouldSkipValidation:", v8, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v13 = objc_msgSend(v12, "isValidWithError:", &v40);
    v10 = v40;

    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v10;
        _os_log_error_impl(&dword_18FC92000, v11, OS_LOG_TYPE_ERROR, "Payment request is invalid: %{public}@", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
  else
  {
    +[PKPaymentRequestValidator validatorWithObject:](PKPaymentRequestValidator, "validatorWithObject:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v15 = objc_msgSend(v14, "isValidWithError:", &v39);
    v10 = v39;

    if ((v15 & 1) == 0)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v10;
        v35 = "Payment request is invalid: %{public}@";
        v36 = v33;
        v37 = 12;
        goto LABEL_28;
      }
LABEL_22:

LABEL_23:
      v32 = 0;
      goto LABEL_24;
    }
  }
  if (!objc_msgSend(v8, "requestType") && (objc_msgSend(v8, "isPeerPaymentRequest") & 1) == 0)
  {
    objc_msgSend(v8, "supportedNetworks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v8, "merchantCapabilities");
    objc_msgSend(v8, "originatingURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[PKPaymentAuthorizationCoordinator canMakePaymentsUsingNetworks:capabilities:webDomain:](PKPaymentAuthorizationCoordinator, "canMakePaymentsUsingNetworks:capabilities:webDomain:", v16, v17, v19);

    if (!v20
      && !+[PKPaymentAuthorizationCoordinator canMakePayments](PKPaymentAuthorizationCoordinator, "canMakePayments"))
    {
      PKLogFacilityTypeGetObject(7uLL);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v35 = "This device cannot make payments.";
        v36 = v33;
        v37 = 2;
LABEL_28:
        _os_log_error_impl(&dword_18FC92000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
LABEL_18:
  v38.receiver = self;
  v38.super_class = (Class)PKPaymentAuthorizationCoordinator;
  v21 = -[PKPaymentAuthorizationCoordinator init](&v38, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_paymentRequest, a3);
    v22->_remotePaymentRequestPromised = v4;
    v23 = dispatch_queue_create("com.apple.passkit.PaymentAuthorization", 0);
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v23;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = objc_claimAutoreleasedReturnValue();
    hostIdentifier = v22->_hostIdentifier;
    v22->_hostIdentifier = (NSString *)v26;

    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v28 = objc_claimAutoreleasedReturnValue();
    listener = v22->_listener;
    v22->_listener = (NSXPCListener *)v28;

    -[NSXPCListener setDelegate:](v22->_listener, "setDelegate:", v22);
    v30 = -[PKPaymentAuthorizationCoordinatorExportedObject initWithController:]([PKPaymentAuthorizationCoordinatorExportedObject alloc], "initWithController:", v22);
    exportedObject = v22->_exportedObject;
    v22->_exportedObject = v30;

    v22->_connectionTimeout = 10.0;
  }
  self = v22;
  v32 = self;
LABEL_24:

  return v32;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationCoordinator;
  -[PKPaymentAuthorizationCoordinator dealloc](&v3, sel_dealloc);
}

- (PKInAppPaymentService)inAppPaymentService
{
  PKInAppPaymentService *inAppPaymentService;
  PKInAppPaymentService *v4;
  PKInAppPaymentService *v5;

  inAppPaymentService = self->_inAppPaymentService;
  if (!inAppPaymentService)
  {
    v4 = objc_alloc_init(PKInAppPaymentService);
    v5 = self->_inAppPaymentService;
    self->_inAppPaymentService = v4;

    inAppPaymentService = self->_inAppPaymentService;
  }
  return inAppPaymentService;
}

- (void)setDelegate:(id)a3
{
  -[PKPaymentAuthorizationCoordinatorExportedObject setDelegate:](self->_exportedObject, "setDelegate:", a3);
}

- (PKPaymentAuthorizationCoordinatorDelegate)delegate
{
  return -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self->_exportedObject, "delegate");
}

- (void)_setPrivateDelegate:(id)a3
{
  -[PKPaymentAuthorizationCoordinatorExportedObject setPrivateDelegate:](self->_exportedObject, "setPrivateDelegate:", a3);
}

- (PKPaymentAuthorizationCoordinatorPrivateDelegate)_privateDelegate
{
  return -[PKPaymentAuthorizationCoordinatorExportedObject privateDelegate](self->_exportedObject, "privateDelegate");
}

- (void)setServiceProxy:(id)a3
{
  PKPaymentAuthorizationServiceProtocol **p_serviceProxy;
  id v5;

  p_serviceProxy = &self->_serviceProxy;
  v5 = a3;
  objc_storeWeak((id *)p_serviceProxy, v5);
  -[PKPaymentAuthorizationCoordinatorExportedObject setServiceProxy:](self->_exportedObject, "setServiceProxy:", v5);

}

- (PKPaymentAuthorizationHostProtocol)hostDelegate
{
  return (PKPaymentAuthorizationHostProtocol *)self->_exportedObject;
}

- (void)presentWithCompletion:(id)a3
{
  -[PKPaymentAuthorizationCoordinator presentWithOrientation:completion:](self, "presentWithOrientation:completion:", 0, a3);
}

- (void)presentWithOrientation:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id presentationCompletionBlock;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  char v23;
  int v24;
  void *v25;
  void *v26;
  NSTimer *v27;
  NSTimer *timer;
  void *v29;
  void *v30;
  NSString *hostIdentifier;
  void *v32;
  void *v33;
  NSString *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  char v45;
  uint8_t buf[4];
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v6 = a4;
  if (self->_didPresent)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@ can only present one payment request."), v10);

  }
  self->_didPresent = 1;
  v11 = (void *)objc_msgSend(v6, "copy");
  presentationCompletionBlock = self->_presentationCompletionBlock;
  self->_presentationCompletionBlock = v11;

  -[PKPaymentAuthorizationCoordinator delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "presentationSceneIdentifierForPaymentAuthorizationCoordinator:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "presentationSceneBundleIdentifierForPaymentAuthorizationCoordinator:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "analyticsSessionSubjectForPaymentAuthorizationCoordinator:", self);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v37 = (void *)v16;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "analyticsSessionTokenForPaymentAuthorizationCoordinator:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = objc_msgSend(v14, "hasPrefix:", CFSTR("UIHostedScene"));
  PKLogFacilityTypeGetObject(7uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = v18;
    _os_log_debug_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEBUG, "Presentation: is scene a _UIHostedWindowScene: %d", buf, 8u);
  }

  v20 = objc_msgSend((Class)getLNClientConnectionClass[0](), "currentAuditToken");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v35 = CFSTR("not present");
    if (v20)
      v35 = CFSTR("present");
    *(_DWORD *)buf = 138412290;
    v47 = v35;
    _os_log_debug_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEBUG, "Presentation: Intent audit token: %@", buf, 0xCu);
  }

  if (self->_remoteNetworkPaymentInvokingProcess)
  {
    if (PKRemoteNetworkPaymentDisableEntitlementCheck())
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEBUG, "Presentation: Remote network payment universal link entitlement check disabled", buf, 2u);
      }

      LOBYTE(v18) = 1;
    }
    else
    {
      v21 = v15;
      v22 = -[BSProcessHandle hasEntitlement:](self->_remoteNetworkPaymentInvokingProcess, "hasEntitlement:", CFSTR("com.apple.private.payment.remote-network-payment-initiate"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v36 = CFSTR("not entitled");
        if (v22)
          v36 = CFSTR("entitled");
        *(_DWORD *)buf = 138412290;
        v47 = v36;
        _os_log_debug_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEBUG, "Presentation: Remote network payment universal link: %@", buf, 0xCu);
      }

      if (v20)
        v23 = 1;
      else
        v23 = v22;
      LOBYTE(v18) = v23 | v18;
      v15 = v21;
    }
  }
  else if (v20)
  {
    LOBYTE(v18) = 1;
  }
  -[NSXPCListener resume](self->_listener, "resume");
  v24 = MKBGetDeviceLockState();
  if (v24 && v24 != 3)
  {
    -[PKPaymentAuthorizationCoordinator _invokeCallbackWithSuccess:](self, "_invokeCallbackWithSuccess:", 0);
    v33 = v37;
    v32 = v38;
  }
  else
  {
    -[NSXPCListener endpoint](self->_listener, "endpoint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0C99E88];
      -[PKPaymentAuthorizationCoordinator connectionTimeout](self, "connectionTimeout");
      objc_msgSend(v26, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__viewServiceTimerFired_, 0, 0);
      v27 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      timer = self->_timer;
      self->_timer = v27;

      -[PKPaymentAuthorizationCoordinator inAppPaymentService](self, "inAppPaymentService");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v15;
      hostIdentifier = self->_hostIdentifier;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke;
      v39[3] = &unk_1E2AC8858;
      v39[4] = self;
      v40 = v14;
      v41 = v30;
      v32 = v38;
      v42 = v38;
      v45 = v18;
      v33 = v37;
      v43 = v37;
      v44 = v17;
      v34 = hostIdentifier;
      v15 = v30;
      objc_msgSend(v29, "registerPaymentListenerEndpoint:forHostIdentifier:completion:", v25, v34, v39);

    }
    else
    {
      -[PKPaymentAuthorizationCoordinator _invokeCallbackWithSuccess:](self, "_invokeCallbackWithSuccess:", 0);
      v33 = v37;
      v32 = v38;
    }

  }
}

void __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(7uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationCoordinator - Presenting payment authorization sheet", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "inAppPaymentService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = *(unsigned __int8 *)(v8 + 9);
    v10 = *(_QWORD *)(v8 + 56);
    v11 = *(_QWORD *)(v8 + 64);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_BYTE *)(a1 + 80);
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 72);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke_51;
    v18[3] = &unk_1E2AC2F80;
    v18[4] = v8;
    LOBYTE(v17) = v14;
    objc_msgSend(v6, "presentInAppPaymentInterfaceWithPaymentRequest:awaitingRemoteNetworkPaymentRequest:forHostIdentifier:hostSceneIdentifier:hostSceneBundleIdentifier:orientation:omitPresentationTarget:analyticsSubject:analyticsArchivedSessionToken:completion:", v10, v9, v11, v7, v12, v13, v17, v15, v16, v18);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "PKPaymentAuthorizationCoordinator - failed to register payment listener endpoint", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_invokeCallbackWithSuccess:", 0);
  }
}

void __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke_51(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138543362;
        v16 = v5;
        v8 = "PKPaymentAuthorizationCoordinator - Failed to present in-app payment interface: %{public}@";
        v9 = v6;
        v10 = 12;
LABEL_9:
        _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      v8 = "PKPaymentAuthorizationCoordinator - Failed to present in-app payment interface";
      v9 = v6;
      v10 = 2;
      goto LABEL_9;
    }

    objc_msgSend(*(id *)(a1 + 32), "inAppPaymentService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(v12 + 64);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke_52;
    v14[3] = &unk_1E2AC35F8;
    v14[4] = v12;
    objc_msgSend(v11, "registerPaymentListenerEndpoint:forHostIdentifier:completion:", 0, v13, v14);

  }
}

uint64_t __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invokeCallbackWithSuccess:", 0);
}

- (void)dismissWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[8];
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;

  v4 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationCoordinator - dismissWithCompletion", buf, 2u);
  }

  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PKPaymentAuthorizationCoordinator_dismissWithCompletion___block_invoke;
  v10[3] = &unk_1E2ABE058;
  v10[4] = self;
  v11 = v4;
  v8 = v10;
  *(_QWORD *)buf = v7;
  v13 = 3221225472;
  v14 = __dispatch_async_ar_block_invoke_7;
  v15 = &unk_1E2ABD9A0;
  v16 = v8;
  v9 = v4;
  dispatch_async(queue, buf);

}

void __59__PKPaymentAuthorizationCoordinator_dismissWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __59__PKPaymentAuthorizationCoordinator_dismissWithCompletion___block_invoke_2;
  v9 = &unk_1E2ABE058;
  v2 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v2;
  v3 = (void (**)(_QWORD))_Block_copy(&v6);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v3, v6, v7, v8, v9, v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "handleDismissWithCompletion:", v3);
  else
    v3[2](v3);

}

void __59__PKPaymentAuthorizationCoordinator_dismissWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationCoordinator - invalidate connection", (uint8_t *)v9, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v7 = v5;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __dispatch_async_ar_block_invoke_7;
    v9[3] = &unk_1E2ABD9A0;
    v10 = v7;
    v8 = v7;
    dispatch_async(v6, v9);

  }
}

- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id remoteRequestPromisePresentationCompletionBlock;
  NSObject *queue;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x2DuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "AuthorizationCoordinator: fulfillRemotePaymentRequestPromise", buf, 2u);
  }

  v9 = (void *)objc_msgSend(v7, "copy");
  remoteRequestPromisePresentationCompletionBlock = self->_remoteRequestPromisePresentationCompletionBlock;
  self->_remoteRequestPromisePresentationCompletionBlock = v9;

  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__PKPaymentAuthorizationCoordinator_fulfillRemotePaymentRequestPromise_completion___block_invoke;
  v16[3] = &unk_1E2ABE030;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v13 = v16;
  *(_QWORD *)buf = v12;
  v20 = 3221225472;
  v21 = __dispatch_async_ar_block_invoke_7;
  v22 = &unk_1E2ABD9A0;
  v23 = v13;
  v14 = v7;
  v15 = v6;
  dispatch_async(queue, buf);

}

void __83__PKPaymentAuthorizationCoordinator_fulfillRemotePaymentRequestPromise_completion___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentAuthorizationCoordinator_fulfillRemotePaymentRequestPromise_completion___block_invoke_2;
  aBlock[3] = &unk_1E2ABE120;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "fulfillRemotePaymentRequestPromise:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    v2[2](v2);

}

void __83__PKPaymentAuthorizationCoordinator_fulfillRemotePaymentRequestPromise_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(0x2DuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "AuthorizationCoordinator: fulfill: invalidate connection", v5, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *queue;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v10[6];
  __int128 buf;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x2DuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "AuthorizationCoordinator: rejectRemotePaymentRequestPromiseWithFailure: %@", (uint8_t *)&buf, 0xCu);

  }
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PKPaymentAuthorizationCoordinator_rejectRemotePaymentRequestPromiseWithFailure___block_invoke;
  v10[3] = &unk_1E2AC4430;
  v10[4] = self;
  v10[5] = a3;
  v9 = v10;
  *(_QWORD *)&buf = v8;
  *((_QWORD *)&buf + 1) = 3221225472;
  v12 = __dispatch_async_ar_block_invoke_7;
  v13 = &unk_1E2ABD9A0;
  v14 = v9;
  dispatch_async(queue, &buf);

}

void __82__PKPaymentAuthorizationCoordinator_rejectRemotePaymentRequestPromiseWithFailure___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPaymentAuthorizationCoordinator_rejectRemotePaymentRequestPromiseWithFailure___block_invoke_2;
  aBlock[3] = &unk_1E2ABE120;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "rejectRemotePaymentRequestPromiseWithFailure:", *(_QWORD *)(a1 + 40));
  else
    v2[2](v2);

}

void __82__PKPaymentAuthorizationCoordinator_rejectRemotePaymentRequestPromiseWithFailure___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(0x2DuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "AuthorizationCoordinator: reject: invalidate connection", v5, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  NSXPCConnection *connection;
  uint64_t v8;
  NSObject *queue;
  _QWORD *v10;
  _QWORD v12[5];
  id v13;
  _QWORD block[4];
  id v15;

  v5 = a4;
  v6 = v5;
  connection = self->_connection;
  if (!connection)
  {
    v8 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke;
    v12[3] = &unk_1E2ABE0D0;
    v12[4] = self;
    v13 = v5;
    v10 = v12;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_7;
    block[3] = &unk_1E2ABD9A0;
    v15 = v10;
    dispatch_async(queue, block);

  }
  return connection == 0;
}

void __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_2;
  aBlock[3] = &unk_1E2ABE120;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = _Block_copy(aBlock);
  v6 = *(void **)(a1 + 40);
  PKPaymentAuthorizationServiceInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  v8 = *(void **)(a1 + 40);
  PKPaymentAuthorizationHostInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedInterface:", v9);

  objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v10 = *(void **)(a1 + 40);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_3;
  v18[3] = &unk_1E2ABD9A0;
  v11 = v5;
  v19 = v11;
  objc_msgSend(v10, "setInvalidationHandler:", v18);
  v12 = *(void **)(a1 + 40);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_4;
  v16[3] = &unk_1E2ABD9A0;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "setInterruptionHandler:", v16);
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setServiceProxy:", v15);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "resume");
  objc_msgSend(*(id *)(a1 + 32), "_invokeCallbackWithSuccess:", 1);

}

void __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "authorizationDidFinishWithError:", v2);

}

uint64_t __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_remoteObjectProxy
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *connection;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__PKPaymentAuthorizationCoordinator__remoteObjectProxyWithFailureHandler___block_invoke;
    v9[3] = &unk_1E2ABD9C8;
    v10 = v4;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPaymentAuthorizationCoordinator _remoteObjectProxy](self, "_remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __74__PKPaymentAuthorizationCoordinator__remoteObjectProxyWithFailureHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_invokeCallbackWithSuccess:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  _QWORD *v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PKPaymentAuthorizationCoordinator__invokeCallbackWithSuccess___block_invoke;
  v6[3] = &unk_1E2ABE1C0;
  v7 = a3;
  v6[4] = self;
  v5 = v6;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_7;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(queue, block);

}

void __64__PKPaymentAuthorizationCoordinator__invokeCallbackWithSuccess___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
  }
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 80);
    *(_QWORD *)(v3 + 80) = 0;

  }
}

- (void)_viewServiceTimerFired:(id)a3
{
  -[PKPaymentAuthorizationCoordinator _invokeCallbackWithSuccess:](self, "_invokeCallbackWithSuccess:", 0);
}

- (PKPaymentAuthorizationServiceProtocol)serviceProxy
{
  return (PKPaymentAuthorizationServiceProtocol *)objc_loadWeakRetained((id *)&self->_serviceProxy);
}

- (BSProcessHandle)remoteNetworkPaymentInvokingProcess
{
  return self->_remoteNetworkPaymentInvokingProcess;
}

- (void)setRemoteNetworkPaymentInvokingProcess:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNetworkPaymentInvokingProcess, a3);
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_paymentRequest, a3);
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostIdentifier, a3);
}

- (PKPaymentAuthorizationCoordinatorExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong((id *)&self->_exportedObject, a3);
}

- (id)presentationCompletionBlock
{
  return self->_presentationCompletionBlock;
}

- (void)setPresentationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)remotePaymentRequestPromised
{
  return self->_remotePaymentRequestPromised;
}

- (void)setRemotePaymentRequestPromised:(BOOL)a3
{
  self->_remotePaymentRequestPromised = a3;
}

- (id)remoteRequestPromisePresentationCompletionBlock
{
  return self->_remoteRequestPromisePresentationCompletionBlock;
}

- (void)setRemoteRequestPromisePresentationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setInAppPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPaymentService, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (double)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(double)a3
{
  self->_connectionTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_inAppPaymentService, 0);
  objc_storeStrong(&self->_remoteRequestPromisePresentationCompletionBlock, 0);
  objc_storeStrong(&self->_presentationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteNetworkPaymentInvokingProcess, 0);
  objc_destroyWeak((id *)&self->_serviceProxy);
}

@end
