@implementation PKPeerPaymentWebService

- (BOOL)needsRegistration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PKPeerPaymentWebService context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PKPeerPaymentWebService context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == 0;

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSURL)peerPaymentServiceURL
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKPeerPaymentServiceOverrideURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Using overridden Peer Payment service URL: %@ ", (uint8_t *)&v8, 0xCu);
    }

    v5 = v3;
  }
  else
  {
    -[PKPeerPaymentWebService context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

- (PKPeerPaymentWebServiceContext)context
{
  return self->_context;
}

- (PKPeerPaymentWebService)initWithTapToRadarDelegate:(id)a3
{
  id v4;
  PKPeerPaymentWebServiceContext *v5;
  PKPeerPaymentWebService *v6;

  v4 = a3;
  v5 = objc_alloc_init(PKPeerPaymentWebServiceContext);
  v6 = -[PKPeerPaymentWebService initWithContext:targetDevice:tapToRadarDelegate:](self, "initWithContext:targetDevice:tapToRadarDelegate:", v5, 0, v4);

  return v6;
}

- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4
{
  return -[PKPeerPaymentWebService initWithContext:targetDevice:archiver:](self, "initWithContext:targetDevice:archiver:", a3, a4, 0);
}

- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5
{
  return -[PKPeerPaymentWebService initWithContext:targetDevice:archiver:tapToRadarDelegate:](self, "initWithContext:targetDevice:archiver:tapToRadarDelegate:", a3, a4, a5, 0);
}

- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 tapToRadarDelegate:(id)a5
{
  id v9;
  id v10;
  PKPeerPaymentWebService *v11;
  PKPeerPaymentWebService *v12;
  PKSecureElement *v13;
  PKSecureElement *secureElement;
  NSMutableDictionary *v15;
  NSMutableDictionary *prewarmedDeviceScorers;
  dispatch_queue_t v17;
  OS_dispatch_queue *prewarmedDeviceScorersQueue;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentWebService;
  v11 = -[PKWebService initWithTapToRadarDelegate:](&v20, sel_initWithTapToRadarDelegate_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    objc_storeStrong((id *)&v12->_targetDevice, a4);
    v13 = objc_alloc_init(PKSecureElement);
    secureElement = v12->_secureElement;
    v12->_secureElement = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    prewarmedDeviceScorers = v12->_prewarmedDeviceScorers;
    v12->_prewarmedDeviceScorers = v15;

    v17 = dispatch_queue_create("com.apple.passkit.peerpayment.webservice.devicescorers", 0);
    prewarmedDeviceScorersQueue = v12->_prewarmedDeviceScorersQueue;
    v12->_prewarmedDeviceScorersQueue = (OS_dispatch_queue *)v17;

  }
  return v12;
}

- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5 tapToRadarDelegate:(id)a6
{
  id v11;
  PKPeerPaymentWebService *v12;
  PKPeerPaymentWebService *v13;

  v11 = a5;
  v12 = -[PKPeerPaymentWebService initWithContext:targetDevice:tapToRadarDelegate:](self, "initWithContext:targetDevice:tapToRadarDelegate:", a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_archiver, a5);

  return v13;
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  objc_super v13;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKPeerPaymentWebService;
    -[PKWebService performRequest:taskIdentifier:completionHandler:](&v13, sel_performRequest_taskIdentifier_completionHandler_, v8, a4, v9);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error: Attempting to perform a nil NSURLRequest. Failing with error PKPeerPaymentWebServiceErrorCodeRequiredParameterMissing.", v12, 2u);
    }

    if (v9)
    {
      _PKPeerPaymentWebServiceError(4, 0, 0, self->_targetDevice);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v11);

    }
  }

}

- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  PKPeerPaymentIdentityVerificationRequiredResponse *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  PKPeerPaymentIdentityVerificationRequest *v27;
  objc_super v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[16];
  id location;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_initWeak(&location, a6);
  v15 = a7;
  v16 = objc_loadWeakRetained(&location);
  objc_msgSend(v16, "currentRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v12, "statusCode");
  if (v18 > 448)
  {
    if (v18 == 449)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Received Peer Payment Status Code 449. Identity Verification Required.", buf, 2u);
      }

      v23 = -[PKPeerPaymentIdentityVerificationRequiredResponse initWithData:]([PKPeerPaymentIdentityVerificationRequiredResponse alloc], "initWithData:", v14);
      -[PKPeerPaymentIdentityVerificationRequiredResponse prerequisiteIdentifier](v23, "prerequisiteIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc_init(PKPeerPaymentIdentityVerificationRequest);
      -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v27);
      -[PKPeerPaymentIdentityVerificationRequest setPrerequisiteIdentifier:](v27, "setPrerequisiteIdentifier:", v24);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __80__PKPeerPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke;
      v29[3] = &unk_1E2ACB598;
      v29[4] = self;
      v31 = v15;
      v30 = v12;
      -[PKPeerPaymentWebService peerPaymentIdentityVerificationRequest:completion:](self, "peerPaymentIdentityVerificationRequest:completion:", v27, v29);

    }
    else
    {
      if (v18 != 451)
      {
LABEL_21:
        v23 = (PKPeerPaymentIdentityVerificationRequiredResponse *)objc_loadWeakRetained(&location);
        v28.receiver = self;
        v28.super_class = (Class)PKPeerPaymentWebService;
        -[PKWebService handleResponse:withError:data:task:completionHandler:](&v28, sel_handleResponse_withError_data_task_completionHandler_, v12, v13, v14, v23, v15);
LABEL_26:

        goto LABEL_27;
      }
      PKLogFacilityTypeGetObject(0xBuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Received Peer Payment Status Code 451. Terms Acceptance Required.", buf, 2u);
      }

      v23 = -[PKPeerPaymentTermsAcceptanceResponse initWithData:]([PKPeerPaymentTermsAcceptanceResponse alloc], "initWithData:", v14);
      if (-[PKPeerPaymentIdentityVerificationRequiredResponse hasTermsData](v23, "hasTermsData"))
      {
        v34 = CFSTR("PKTermsResponseUserInfoKey");
        v35[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      _PKPeerPaymentWebServiceError(5, 0, v24, self->_targetDevice);
      v27 = (PKPeerPaymentIdentityVerificationRequest *)objc_claimAutoreleasedReturnValue();
      if (v15)
        (*((void (**)(id, _QWORD, id, PKPeerPaymentIdentityVerificationRequest *))v15 + 2))(v15, 0, v12, v27);
    }

    goto LABEL_26;
  }
  if (v18 != 301)
  {
    if (v18 == 400)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Received Status Code 400. Bad Request.", buf, 2u);
      }

      +[PKWebServiceResponse responseWithData:](PKPeerPaymentWebServiceBadRequestResponse, "responseWithData:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentWebService badRequestErrorWithResponse:](self, "badRequestErrorWithResponse:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      if (v15)
        (*((void (**)(id, id, id, uint64_t))v15 + 2))(v15, v14, v12, v21);
      v13 = (id)v21;
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Received Peer Payment Status Code 301. Retry after register.", buf, 2u);
  }

  -[PKPeerPaymentWebService _handleRetryAfterRegisterWithRequest:completionHandler:](self, "_handleRetryAfterRegisterWithRequest:completionHandler:", v17, v15);
LABEL_27:

  objc_destroyWeak(&location);
}

void __80__PKPeerPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v10 = CFSTR("PKIdentityVerificationResponse");
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  _PKPeerPaymentWebServiceError(1, 0, v7, *(void **)(a1[4] + 176));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, a1[5], v8);

}

- (id)badRequestErrorWithResponse:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a3, "errorCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  _PKPeerPaymentWebServiceError(v5, 0, 0, self->_targetDevice);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedFailureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedRecoverySuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "code");
  if (!v9)
    v9 = 40099;
  _PKPeerPaymentWebServiceErrorCustom(v9, v7, v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)forbiddenErrorWithResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "errorCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  _PKPeerPaymentWebServiceError(v6, 0, 0, self->_targetDevice);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedFailureReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedRecoverySuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "code");
  objc_msgSend(v4, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    objc_msgSend(v4, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_5;
  }
  objc_msgSend(v4, "localizedTitle");
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedDescription");
  v14 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v13;
  v9 = (void *)v14;
LABEL_5:
  if (!v10)
    v10 = 40399;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentWebService;
  -[PKWebService forbiddenErrorWithResponse:](&v18, sel_forbiddenErrorWithResponse_, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _PKPeerPaymentWebServiceErrorCustom(v10, v8, v9, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  char v19;
  id v20;
  void *v21;
  PKPeerPaymentWebServiceTargetDeviceProtocol *targetDevice;
  PKPeerPaymentWebServiceTargetDeviceProtocol *v23;
  PKPeerPaymentWebServiceTargetDeviceProtocol *v24;
  void *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  objc_msgSend(v8, "pk_valueForHTTPHeaderField:", CFSTR("PeerPaymentURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Redirect specifies new peer payment URL: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentWebService context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pushToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C92C78], "propertyForKey:inRequest:", CFSTR("PKPeerPaymentEndPointKey"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && (unint64_t)(objc_msgSend(v16, "integerValue") - 1) < 2)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Using the webservice to re-register since we are already in passd on target device", buf, 2u);
      }

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke;
      v28[3] = &unk_1E2ACB5C0;
      v28[5] = &v29;
      v18 = v28;
      v28[4] = v10;
      -[PKPeerPaymentWebService peerPaymentRegisterWithURL:pushToken:completion:](self, "peerPaymentRegisterWithURL:pushToken:completion:", v13, v15, v28);
    }
    else
    {
      v19 = objc_opt_respondsToSelector();
      v25 = v11;
      v20 = v9;
      v21 = v13;
      targetDevice = self->_targetDevice;
      if ((v19 & 1) != 0)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke_2;
        v27[3] = &unk_1E2ACB5E8;
        v27[5] = &v29;
        v18 = v27;
        v27[4] = v10;
        v23 = targetDevice;
        v13 = v21;
        -[PKPeerPaymentWebServiceTargetDeviceProtocol peerPaymentReRegisterWithURL:pushToken:peerPaymentWebService:completion:](v23, "peerPaymentReRegisterWithURL:pushToken:peerPaymentWebService:completion:", v21, v15, self, v27);
        v9 = v20;
        v11 = v25;
      }
      else
      {
        v13 = v21;
        v9 = v20;
        v11 = v25;
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "targetDevice cannot peer payment register. Aborting original request", buf, 2u);
          }

          (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
          goto LABEL_15;
        }
        v24 = self->_targetDevice;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke_3;
        v26[3] = &unk_1E2ACB5E8;
        v26[5] = &v29;
        v18 = v26;
        v26[4] = v10;
        -[PKPeerPaymentWebServiceTargetDeviceProtocol peerPaymentReRegisterWithURL:pushToken:completion:](v24, "peerPaymentReRegisterWithURL:pushToken:completion:", v13, v15, v26);
      }
    }

LABEL_15:
    goto LABEL_16;
  }
  (*((void (**)(id, _QWORD))v10 + 2))(v10, *((unsigned __int8 *)v30 + 24));
LABEL_16:

  _Block_object_dispose(&v29, 8);
}

uint64_t __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3;
  char v4;

  if (a2)
    v3 = a3 == 0;
  else
    v3 = 0;
  v4 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  char v3;

  if (a3)
    v3 = 0;
  else
    v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  char v3;

  if (a3)
    v3 = 0;
  else
    v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (int64_t)logFacilityType
{
  return 11;
}

+ (id)sharedService
{
  void *v2;
  void *v3;
  void *v4;
  PKSharedPeerPaymentWebServiceArchiver *v5;
  PKPeerPaymentWebService *v6;
  PKPeerPaymentWebServiceTargetDevice *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v2 = (void *)qword_1EE1DB5C8;
  if (!qword_1EE1DB5C8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_11_0);
    if (!qword_1EE1DB5C8)
    {
      +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sharedPeerPaymentWebServiceContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = -[PKSharedPeerPaymentWebServiceArchiver initWithPeerPaymentService:]([PKSharedPeerPaymentWebServiceArchiver alloc], "initWithPeerPaymentService:", v3);
        v6 = [PKPeerPaymentWebService alloc];
        v7 = -[PKPeerPaymentWebServiceTargetDevice initWithTargetDeviceDelegate:]([PKPeerPaymentWebServiceTargetDevice alloc], "initWithTargetDeviceDelegate:", v3);
        v8 = -[PKPeerPaymentWebService initWithContext:targetDevice:archiver:](v6, "initWithContext:targetDevice:archiver:", v4, v7, v5);
        v9 = (void *)qword_1EE1DB5C8;
        qword_1EE1DB5C8 = v8;

        objc_msgSend((id)qword_1EE1DB5C8, "setSharedService:", 1);
        objc_storeStrong((id *)(qword_1EE1DB5C8 + 184), v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_11_0);
    v2 = (void *)qword_1EE1DB5C8;
    if (!qword_1EE1DB5C8)
    {
      PKLogFacilityTypeGetObject(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_error_impl(&dword_18FC92000, v10, OS_LOG_TYPE_ERROR, "Failed to get the shared peer payment web service, therefore +[PKPeerPaymentWebService sharedService] is not available. This is likely an entitlements issue or passd hasn't initialized yet.", v12, 2u);
      }

      v2 = (void *)qword_1EE1DB5C8;
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
  objc_msgSend(v4, "addObserver:selector:name:object:suspensionBehavior:", self, sel_sharedPeerPaymentServiceChanged_, CFSTR("PDSharedPeerPaymentWebServiceDidChangeNotification"), 0, 2);

}

- (void)sharedPeerPaymentServiceChanged:(id)a3
{
  PKPeerPaymentService *peerPaymentService;
  PKPeerPaymentService *v5;
  PKPeerPaymentService *v6;
  _QWORD v7[5];

  if (-[PKPeerPaymentWebService isSharedService](self, "isSharedService", a3))
  {
    peerPaymentService = self->_peerPaymentService;
    if (!peerPaymentService)
    {
      v5 = objc_alloc_init(PKPeerPaymentService);
      v6 = self->_peerPaymentService;
      self->_peerPaymentService = v5;

      peerPaymentService = self->_peerPaymentService;
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PKPeerPaymentWebService_sharedPeerPaymentServiceChanged___block_invoke;
    v7[3] = &unk_1E2ACB610;
    v7[4] = self;
    -[PKPeerPaymentService sharedPeerPaymentWebServiceContextWithCompletion:](peerPaymentService, "sharedPeerPaymentWebServiceContextWithCompletion:", v7);
  }
}

void __59__PKPeerPaymentWebService_sharedPeerPaymentServiceChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setContext:", v3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v4, "postNotificationName:object:", CFSTR("PKSharedPeerPaymentWebServiceDidChangeNotification"), 0);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Received PDSharedPeerPaymentWebServiceDidChangeNotification, however [PKPaymentService sharedPeerPaymentWebServiceContextWithCompletion:] returned nil. Ignoring.", v5, 2u);
    }
  }

}

- (NSString)accountIdentifier
{
  void *v2;
  void *v3;

  -[PKPeerPaymentService account](self->_peerPaymentService, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)canBypassTrustValidation
{
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentWebService;
  if (-[PKWebService canBypassTrustValidation](&v8, sel_canBypassTrustValidation))
    return 1;
  -[PKPeerPaymentWebService context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "devSigned");

  if (v4)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
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

- (unint64_t)peerPaymentRegisterWithURL:(id)a3 pushToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[8];
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  if (v8)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke;
    v16[3] = &unk_1E2ACB6D8;
    v16[4] = self;
    v19 = v10;
    v17 = v9;
    v18 = v8;
    v20 = v11;
    -[PKPeerPaymentWebService _deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:](self, "_deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:", CFSTR("registration"), 0, 0, v16);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Error: Asked to register with a nil service url.", v15, 2u);
    }

    if (v10)
    {
      _PKPeerPaymentWebServiceError(4, 0, 0, self->_targetDevice);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);

    }
  }

  return v11;
}

void __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!(v10 | v11))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the registration endpoint. %@", buf, 0xCu);
    }

  }
  v14 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_136;
  v21[3] = &unk_1E2ACB688;
  v15 = *(id *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v26 = v15;
  v21[4] = v16;
  v22 = v17;
  v23 = *(id *)(a1 + 48);
  v24 = (id)v10;
  v18 = *(_QWORD *)(a1 + 64);
  v25 = (id)v11;
  v27 = v18;
  v19 = (id)v11;
  v20 = (id)v10;
  objc_msgSend(v14, "_deviceRegistrationDataWithCompletion:", v21);

}

void __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  PKPeerPaymentServiceRegistrationRequest *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  PKPeerPaymentServiceRegistrationRequest *v17;
  NSObject *v18;
  uint64_t v19;
  void (*v20)(void);
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  PKPeerPaymentServiceRegistrationRequest *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Error: Failed to get device data for registration with error: %@.", buf, 0xCu);
    }

    v19 = *(_QWORD *)(a1 + 72);
    if (!v19)
      goto LABEL_15;
    v20 = *(void (**)(void))(v19 + 16);
    goto LABEL_14;
  }
  v7 = objc_msgSend(v5, "devSigned");
  if (os_variant_has_internal_ui())
  {
    if ((_DWORD)v7)
    {
      PKStockholmEnvironmentName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsString:", CFSTR("QA"));

      if ((v9 & 1) == 0)
      {
        PKLogFacilityTypeGetObject(0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18FC92000, v21, OS_LOG_TYPE_ERROR, "******** ERROR: Using DevSE with non QA Enviroment - refusing to register **********", buf, 2u);
        }

        v22 = *(_QWORD *)(a1 + 72);
        if (!v22)
          goto LABEL_15;
        v20 = *(void (**)(void))(v22 + 16);
LABEL_14:
        v20();
LABEL_15:
        objc_msgSend(*(id *)(a1 + 32), "_provideDeviceScoreFeedbackIfNeededForEndpoint:recipientAddress:quoteDestinationType:ingested:", CFSTR("registration"), 0, 0, 0);
        goto LABEL_16;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDevSigned:", v7);

  v11 = objc_alloc_init(PKPeerPaymentServiceRegistrationRequest);
  objc_msgSend(*(id *)(a1 + 32), "_updateRequestWithCurrentTargetDevice:", v11);
  -[PKPeerPaymentServiceRegistrationRequest setDeviceData:](v11, "setDeviceData:", v5);
  -[PKPeerPaymentServiceRegistrationRequest setPushToken:](v11, "setPushToken:", *(_QWORD *)(a1 + 40));
  v12 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_140;
  v23[3] = &unk_1E2ACB660;
  v24 = v11;
  v13 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 32);
  v25 = v13;
  v26 = v14;
  v27 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 80);
  v28 = v15;
  v31 = v16;
  v29 = v5;
  v30 = *(id *)(a1 + 72);
  v17 = v11;
  objc_msgSend(v12, "_peerPaymentDeviceMetadataWithCompletion:", v23);

LABEL_16:
}

void __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_140(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v5, "_appleAccountInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:deviceScore:odiAssessment:deviceMetadata:", v4, v7, v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 88);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_2;
  v12[3] = &unk_1E2ACB638;
  v12[4] = v10;
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 80);
  objc_msgSend(v10, "performRequest:taskIdentifier:completionHandler:", v9, v11, v12);

}

void __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentServiceRegistrationResponse *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  if (!v7 || v8)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment registration request failed with error %@", (uint8_t *)&v14, 0xCu);
    }

LABEL_11:
    v9 = 0;
    goto LABEL_15;
  }
  v9 = -[PKPeerPaymentServiceRegistrationResponse initWithData:]([PKPeerPaymentServiceRegistrationResponse alloc], "initWithData:", v7);
  -[PKPeerPaymentServiceRegistrationResponse deviceIdentifier](v9, "deviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateContextWithDeviceRegistrationData:registrationResponse:](v11, "updateContextWithDeviceRegistrationData:registrationResponse:", *(_QWORD *)(a1 + 40), v9);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment registration response does not have a device identifier", (uint8_t *)&v14, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_archiveContext");
  v8 = 0;
LABEL_15:
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, PKPeerPaymentServiceRegistrationResponse *, id))(v13 + 16))(v13, v9, v8);
  objc_msgSend(*(id *)(a1 + 32), "_provideDeviceScoreFeedbackIfNeededForEndpoint:recipientAddress:quoteDestinationType:ingested:", CFSTR("registration"), 0, 0, 1);

}

- (unint64_t)peerPaymentUnregisterWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  unint64_t v5;
  void *v6;
  PKPeerPaymentServiceUnregisterRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  void (**v13)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPeerPaymentWebService needsRegistration](self, "needsRegistration"))
  {
    if (v4)
      v4[2](v4, 1, 0);
  }
  else
  {
    v7 = objc_alloc_init(PKPeerPaymentServiceUnregisterRequest);
    -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
    -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentWebService _deviceIdentifier](self, "_deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentServiceUnregisterRequest _urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:](v7, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:", v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__PKPeerPaymentWebService_peerPaymentUnregisterWithCompletion___block_invoke;
    v12[3] = &unk_1E2AC70F8;
    v12[4] = self;
    v13 = v4;
    -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v10, v5, v12);

  }
  return v5;
}

void __63__PKPeerPaymentWebService_peerPaymentUnregisterWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  PKPeerPaymentWebServiceContext *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", v6, v7) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v6, "statusCode") == 404)
  {
    v8 = objc_alloc_init(PKPeerPaymentWebServiceContext);
    objc_msgSend(*(id *)(a1 + 32), "setContext:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_archiveContext");

    v9 = 1;
  }
  else
  {
    if (!v7)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment unregister request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v7);

}

- (unint64_t)peerPaymentAcceptTermsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  PKPeerPaymentAcceptTermsRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(PKPeerPaymentAcceptTermsRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  -[PKPeerPaymentAcceptTermsRequest setTermsIdentifier:](v10, "setTermsIdentifier:", v7);

  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _deviceIdentifier](self, "_deviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAcceptTermsRequest _urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:](v10, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:", v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__PKPeerPaymentWebService_peerPaymentAcceptTermsWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2AC70F8;
  v16[4] = self;
  v17 = v6;
  v14 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  return v8;
}

void __75__PKPeerPaymentWebService_peerPaymentAcceptTermsWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v6);
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment accept terms request failed with error %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);

}

- (unint64_t)peerPaymentPassDetailsWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  PKPeerPaymentPassDetailsRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PKPeerPaymentPassDetailsRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _deviceIdentifier](self, "_deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPassDetailsRequest _urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:](v7, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PKPeerPaymentWebService_peerPaymentPassDetailsWithCompletion___block_invoke;
  v13[3] = &unk_1E2AC70F8;
  v13[4] = self;
  v14 = v4;
  v11 = v4;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v10, v5, v13);

  return v5;
}

void __64__PKPeerPaymentWebService_peerPaymentPassDetailsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentPassDetailsResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentPassDetailsResponse initWithData:]([PKPeerPaymentPassDetailsResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment pass details request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentPassDetailsResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentAccountWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  PKPeerPaymentAccountRequest *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PKPeerPaymentAccountRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccountRequest _urlRequestWithServiceURL:appleAccountInformation:](v7, "_urlRequestWithServiceURL:appleAccountInformation:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__PKPeerPaymentWebService_peerPaymentAccountWithCompletion___block_invoke;
  v12[3] = &unk_1E2AC70F8;
  v12[4] = self;
  v13 = v4;
  v10 = v4;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v5, v12);

  return v5;
}

void __60__PKPeerPaymentWebService_peerPaymentAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentAccountResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentAccountResponse initWithData:]([PKPeerPaymentAccountResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment account request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentAccountResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentAssociatedAccountsWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  PKPeerPaymentAssociatedAccountsRequest *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PKPeerPaymentAssociatedAccountsRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAssociatedAccountsRequest _urlRequestWithServiceURL:appleAccountInformation:](v7, "_urlRequestWithServiceURL:appleAccountInformation:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PKPeerPaymentWebService_peerPaymentAssociatedAccountsWithCompletion___block_invoke;
  v12[3] = &unk_1E2AC70F8;
  v12[4] = self;
  v13 = v4;
  v10 = v4;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v5, v12);

  return v5;
}

void __71__PKPeerPaymentWebService_peerPaymentAssociatedAccountsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentAssociatedAccountsResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentAssociatedAccountsResponse initWithData:]([PKPeerPaymentAssociatedAccountsResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment asscoaited accounts request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentAssociatedAccountsResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentRecipientForRecipientAddress:(id)a3 senderAddress:(id)a4 source:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  PKPeerPaymentRecipientRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(PKPeerPaymentRecipientRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v15);
  -[PKPeerPaymentRecipientRequest setRecipientAddress:](v15, "setRecipientAddress:", v10);
  -[PKPeerPaymentRecipientRequest setRecipientAddressSource:](v15, "setRecipientAddressSource:", a5);
  -[PKPeerPaymentRecipientRequest setSenderAddress:](v15, "setSenderAddress:", v12);

  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _deviceIdentifier](self, "_deviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecipientRequest _urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:](v15, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:", v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__PKPeerPaymentWebService_peerPaymentRecipientForRecipientAddress_senderAddress_source_completion___block_invoke;
  v22[3] = &unk_1E2ACB638;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v19 = v11;
  v20 = v10;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v18, v13, v22);

  return v13;
}

void __99__PKPeerPaymentWebService_peerPaymentRecipientForRecipientAddress_senderAddress_source_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentRecipientResponse *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentRecipientResponse initWithData:]([PKPeerPaymentRecipientResponse alloc], "initWithData:", v7);
      -[PKPeerPaymentRecipientResponse recipient](v9, "recipient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPhoneOrEmail:", *(_QWORD *)(a1 + 40));

      v8 = 0;
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment recipient lookup request failed with error %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, PKPeerPaymentRecipientResponse *, id))(v12 + 16))(v12, v9, v8);

}

- (unint64_t)peerPaymentRequestTokenWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  unint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipientPhoneOrEmail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke;
  v15[3] = &unk_1E2ACB6D8;
  v15[4] = self;
  v16 = v6;
  v18 = v7;
  v19 = v8;
  v17 = v9;
  v11 = v7;
  v12 = v9;
  v13 = v6;
  -[PKPeerPaymentWebService _deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:](self, "_deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:", CFSTR("requestToken"), v10, 1, v15);

  return v8;
}

void __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!(v10 | v11))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the request token endpoint. %@", buf, 0xCu);
    }

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke_157;
  v21[3] = &unk_1E2ACB660;
  v14 = *(void **)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 32);
  v23 = v15;
  v24 = v16;
  v25 = (id)v10;
  v26 = (id)v11;
  v17 = *(void **)(a1 + 56);
  v29 = *(_QWORD *)(a1 + 64);
  v27 = v9;
  v28 = v17;
  v18 = v9;
  v19 = (id)v11;
  v20 = (id)v10;
  objc_msgSend(v14, "_peerPaymentDeviceMetadataWithCompletion:", v21);

}

void __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke_157(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v5, "_appleAccountInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:deviceScore:odiAssessment:deviceMetadata:", v4, v7, v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 88);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke_2;
  v12[3] = &unk_1E2ACB6B0;
  v12[4] = v10;
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 80);
  objc_msgSend(v10, "performRequest:taskIdentifier:completionHandler:", v9, v11, v12);

}

void __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentRequestTokenResponse *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  if (!v7 || v8)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment request token request failed with error %@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(v8, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain")))
    {
      v14 = objc_msgSend(v8, "code");

      if (v14 == 40312)
      {
        _PKPeerPaymentWebServiceError(40001, v8, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
        v15 = objc_claimAutoreleasedReturnValue();

        v9 = 0;
        v8 = (id)v15;
        goto LABEL_16;
      }
    }
    else
    {

    }
    goto LABEL_15;
  }
  v9 = -[PKPeerPaymentRequestTokenResponse initWithData:deviceScoreIdentifier:]([PKPeerPaymentRequestTokenResponse alloc], "initWithData:deviceScoreIdentifier:", v7, *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    +[PKPeerPaymentRecipientCache sharedCache](PKPeerPaymentRecipientCache, "sharedCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "recipientPhoneOrEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "noteSubmittedLowFrequencyDeviceScoreForRecipientAddress:", v11);

  }
  v8 = 0;
LABEL_16:
  v16 = *(_QWORD *)(a1 + 64);
  if (v16)
    (*(void (**)(uint64_t, PKPeerPaymentRequestTokenResponse *, id))(v16 + 16))(v16, v9, v8);
  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "recipientPhoneOrEmail");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_provideDeviceScoreFeedbackIfNeededForEndpoint:recipientAddress:quoteDestinationType:ingested:", CFSTR("requestToken"), v18, 1, 1);

}

- (unint64_t)peerPaymentPendingRequestsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PKPeerPaymentWebService_peerPaymentPendingRequestsWithRequest_completion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v14);

  return v8;
}

void __76__PKPeerPaymentWebService_peerPaymentPendingRequestsWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentPendingRequestsResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentPendingRequestsResponse initWithData:]([PKPeerPaymentPendingRequestsResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment pending requests request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentPendingRequestsResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentPendingRequestPerformAction:(id)a3 withRequestToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  PKPeerPaymentPendingRequestPerformActionRequest *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(PKPeerPaymentPendingRequestPerformActionRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v13);
  -[PKPeerPaymentPendingRequestPerformActionRequest setAction:](v13, "setAction:", v10);

  -[PKPeerPaymentPendingRequestPerformActionRequest setRequestToken:](v13, "setRequestToken:", v9);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPendingRequestPerformActionRequest _urlRequestWithServiceURL:appleAccountInformation:](v13, "_urlRequestWithServiceURL:appleAccountInformation:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__PKPeerPaymentWebService_peerPaymentPendingRequestPerformAction_withRequestToken_completion___block_invoke;
  v18[3] = &unk_1E2AC70F8;
  v18[4] = self;
  v19 = v8;
  v16 = v8;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v11, v18);

  return v11;
}

void __94__PKPeerPaymentWebService_peerPaymentPendingRequestPerformAction_withRequestToken_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentPendingRequestPerformActionResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentPendingRequestPerformActionResponse initWithData:]([PKPeerPaymentPendingRequestPerformActionResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment pending request action request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentPendingRequestPerformActionResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentQuoteWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipientPhoneOrEmail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "destination");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke;
  v16[3] = &unk_1E2ACB6D8;
  v16[4] = self;
  v17 = v6;
  v19 = v7;
  v20 = v8;
  v18 = v9;
  v12 = v7;
  v13 = v9;
  v14 = v6;
  -[PKPeerPaymentWebService _deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:](self, "_deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:", CFSTR("quote"), v10, v11, v16);

  return v8;
}

void __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!(v10 | v11))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the quote endpoint. %@", buf, 0xCu);
    }

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke_163;
  v20[3] = &unk_1E2ACB728;
  v14 = *(void **)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 32);
  v22 = v15;
  v23 = v16;
  v24 = (id)v10;
  v25 = (id)v11;
  v17 = *(void **)(a1 + 56);
  v27 = *(_QWORD *)(a1 + 64);
  v26 = v17;
  v18 = (id)v11;
  v19 = (id)v10;
  objc_msgSend(v14, "_peerPaymentDeviceMetadataWithCompletion:", v20);

}

void __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke_163(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v5, "_appleAccountInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:deviceScore:odiAssessment:deviceMetadata:", v4, v7, v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke_2;
  v12[3] = &unk_1E2ACB700;
  v12[4] = v10;
  v11 = *(_QWORD *)(a1 + 80);
  v14 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v10, "performRequest:taskIdentifier:completionHandler:", v9, v11, v12);

}

void __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPeerPaymentQuoteResponse *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "recurringPaymentsFeatureDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "productTimeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = -[PKPeerPaymentQuoteResponse initWithData:productTimeZone:]([PKPeerPaymentQuoteResponse alloc], "initWithData:productTimeZone:", v7, v12);
      v8 = 0;
      goto LABEL_14;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Peer Payment Quote request failed with error %@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(v8, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain")))
    {
      v16 = objc_msgSend(v8, "code");

      if (v16 == 40312)
      {
        _PKPeerPaymentWebServiceError(40001, v8, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
        v17 = objc_claimAutoreleasedReturnValue();

        v13 = 0;
        v8 = (id)v17;
        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = 0;
LABEL_14:
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(uint64_t, PKPeerPaymentQuoteResponse *, id))(v18 + 16))(v18, v13, v8);
  v19 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recipientPhoneOrEmail");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_provideDeviceScoreFeedbackIfNeededForEndpoint:recipientAddress:quoteDestinationType:ingested:", CFSTR("quote"), v20, objc_msgSend(*(id *)(a1 + 40), "destination"), 1);

}

- (unint64_t)peerPaymentQuoteCertificatesForDestination:(unint64_t)a3 completion:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  PKPeerPaymentQuoteCertificatesRequest *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(PKPeerPaymentQuoteCertificatesRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v9);
  -[PKPeerPaymentQuoteCertificatesRequest setDestination:](v9, "setDestination:", a3);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentQuoteCertificatesRequest _urlRequestWithServiceURL:appleAccountInformation:](v9, "_urlRequestWithServiceURL:appleAccountInformation:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__PKPeerPaymentWebService_peerPaymentQuoteCertificatesForDestination_completion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v7, v14);

  return v7;
}

void __81__PKPeerPaymentWebService_peerPaymentQuoteCertificatesForDestination_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentQuoteCertificatesResponse *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentQuoteCertificatesResponse initWithData:]([PKPeerPaymentQuoteCertificatesResponse alloc], "initWithData:", v7);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentQuoteCertificatesResponse setDevSigned:](v9, "setDevSigned:", objc_msgSend(v10, "devSigned"));

      v8 = 0;
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment Quote Certificates request failed with error %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, PKPeerPaymentQuoteCertificatesResponse *, id))(v12 + 16))(v12, v9, v8);

}

- (unint64_t)peerPaymentIdentityVerificationRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  PKPeerPaymentWebService *v19;
  id v20;
  id v21;
  _QWORD aBlock[5];
  id v23;
  unint64_t v24;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDevSigned:", objc_msgSend(v10, "devSigned"));

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2ACB750;
  v23 = v7;
  v24 = v8;
  aBlock[4] = self;
  v12 = v7;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_169;
  v17[3] = &unk_1E2ACB7A0;
  v18 = v6;
  v19 = self;
  v20 = v9;
  v21 = _Block_copy(aBlock);
  v13 = v21;
  v14 = v9;
  v15 = v6;
  -[PKPeerPaymentWebService _peerPaymentDeviceMetadataWithCompletion:](self, "_peerPaymentDeviceMetadataWithCompletion:", v17);

  return v8;
}

void __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_2;
  v5[3] = &unk_1E2AC70F8;
  v3 = (void *)a1[5];
  v4 = a1[6];
  v6 = (id)a1[4];
  v7 = v3;
  objc_msgSend(v6, "performRequest:taskIdentifier:completionHandler:", a2, v4, v5);

}

void __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      +[PKWebServiceResponse responseWithData:](PKPeerPaymentIdentityVerificationResponse, "responseWithData:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment identity verification response failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v9, v8);

}

void __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_169(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  if (objc_msgSend(a1[4], "hasOverlayParameters"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_2_170;
    v12[3] = &unk_1E2ACB778;
    v4 = a1[5];
    v13 = a1[4];
    v5 = a1[6];
    v6 = a1[5];
    v14 = v5;
    v15 = v6;
    v16 = v3;
    v17 = a1[7];
    objc_msgSend(v4, "_deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:", CFSTR("identityVerification"), 0, 0, v12);

  }
  else
  {
    v7 = a1[6];
    v8 = a1[4];
    objc_msgSend(a1[5], "_appleAccountInformation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "_deviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:deviceScore:odiAssessment:deviceMetadata:", v7, v9, v10, 0, 0, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))a1[7] + 2))();
  }

}

void __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_2_170(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!(v10 | v11))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the identity verification endpoint. %@", (uint8_t *)&v19, 0xCu);
    }

  }
  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_appleAccountInformation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_deviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:deviceScore:odiAssessment:deviceMetadata:", v15, v16, v17, v10, v11, *(_QWORD *)(a1 + 56));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "_provideDeviceScoreFeedbackIfNeededForEndpoint:recipientAddress:quoteDestinationType:ingested:", CFSTR("identityVerification"), 0, 0, 1);

}

- (unint64_t)peerPaymentDocumentSubmissionRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PKPeerPaymentWebService_peerPaymentDocumentSubmissionRequest_completion___block_invoke;
  v15[3] = &unk_1E2ACB638;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v15);

  return v8;
}

void __75__PKPeerPaymentWebService_peerPaymentDocumentSubmissionRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentDocumentSubmissionResponse *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  __int128 block;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  if (!v7 || v8)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(block) = 138412290;
      *(_QWORD *)((char *)&block + 4) = v8;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Peer Payment Submit Document request failed with error %@", (uint8_t *)&block, 0xCu);
    }

LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v9 = -[PKPeerPaymentDocumentSubmissionResponse initWithData:]([PKPeerPaymentDocumentSubmissionResponse alloc], "initWithData:", v7);
  if (os_variant_has_internal_ui() && PKCIPSaveImages())
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__PKPeerPaymentWebService_peerPaymentDocumentSubmissionRequest_completion___block_invoke_2;
    v15[3] = &unk_1E2ABE120;
    v16 = *(id *)(a1 + 40);
    v12 = v15;
    *(_QWORD *)&block = v11;
    *((_QWORD *)&block + 1) = 3221225472;
    v18 = __dispatch_async_ar_block_invoke_9;
    v19 = &unk_1E2ABD9A0;
    v20 = v12;
    dispatch_async(v10, &block);

  }
  v8 = 0;
LABEL_14:
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
    (*(void (**)(uint64_t, PKPeerPaymentDocumentSubmissionResponse *, id))(v14 + 16))(v14, v9, v8);

}

void __75__PKPeerPaymentWebService_peerPaymentDocumentSubmissionRequest_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  int v23;
  id v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMddHHmmss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKCIPDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-front.jpg"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-back.jpg"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKCIPDirectoryPath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKCIPDirectoryPath();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "frontImageData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v31 = 0;
    v16 = objc_msgSend(v14, "writeToFile:options:error:", v6, 1, &v31);
    v17 = v31;
    if (v16)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      v19 = "Saved frontImageData to: '%@'";
      v20 = v18;
      v21 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = 0;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    goto LABEL_11;
  *(_DWORD *)buf = 138412546;
  v33 = v6;
  v34 = 2112;
  v35 = v17;
  v19 = "Failed to save frontImageData to: '%@'; error: %@";
  v20 = v18;
  v21 = 22;
LABEL_10:
  _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_11:

  objc_msgSend(*(id *)(a1 + 32), "backImageData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v30 = v17;
    v23 = objc_msgSend(v22, "writeToFile:options:error:", v8, 1, &v30);
    v24 = v30;

    if (v23)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v8;
        v26 = "Saved backImageData to: '%@'";
        v27 = v25;
        v28 = 12;
LABEL_18:
        _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v24 = v17;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v8;
    v34 = 2112;
    v35 = v24;
    v26 = "Failed to save backImageData to: '%@'; error: %@";
    v27 = v25;
    v28 = 22;
    goto LABEL_18;
  }
LABEL_19:

}

- (unint64_t)peerPaymentPerformQuoteWithRequest:(id)a3 completion:(id)a4
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
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v6 = a3;
  v7 = a4;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPushToken:", v11);

  -[PKPeerPaymentWebService context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "signedEnrollmentDataSignature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSignedEnrollmentDataSignature:", v13);

  objc_msgSend(v6, "recipientPhoneOrEmail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "destination");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke;
  v20[3] = &unk_1E2ACB6D8;
  v20[4] = self;
  v21 = v6;
  v23 = v7;
  v24 = v8;
  v22 = v9;
  v16 = v7;
  v17 = v9;
  v18 = v6;
  -[PKPeerPaymentWebService _deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:](self, "_deviceScoreForEndpoint:recipientAddress:quoteDestinationType:withCompletion:", CFSTR("performQuote"), v14, v15, v20);

  return v8;
}

void __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!(v10 | v11))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the perform quote endpoint. %@", buf, 0xCu);
    }

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke_183;
  v21[3] = &unk_1E2ACB660;
  v14 = *(void **)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 32);
  v23 = v15;
  v24 = v16;
  v25 = (id)v10;
  v26 = (id)v11;
  v17 = *(void **)(a1 + 56);
  v29 = *(_QWORD *)(a1 + 64);
  v27 = v9;
  v28 = v17;
  v18 = v9;
  v19 = (id)v11;
  v20 = (id)v10;
  objc_msgSend(v14, "_peerPaymentDeviceMetadataWithCompletion:", v21);

}

void __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke_183(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v5, "_appleAccountInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlRequestWithServiceURL:appleAccountInformation:deviceIdentifier:deviceScore:odiAssessment:deviceMetadata:", v4, v7, v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 88);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke_2;
  v12[3] = &unk_1E2ACB6B0;
  v12[4] = v10;
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 80);
  objc_msgSend(v10, "performRequest:taskIdentifier:completionHandler:", v9, v11, v12);

}

void __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentPerformResponse *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (!v7 || v8)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment perform request failed with error %@", (uint8_t *)&v16, 0xCu);
    }

LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  v9 = -[PKPeerPaymentPerformResponse initWithData:deviceScoreIdentifier:]([PKPeerPaymentPerformResponse alloc], "initWithData:deviceScoreIdentifier:", v7, *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    +[PKPeerPaymentRecipientCache sharedCache](PKPeerPaymentRecipientCache, "sharedCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "recipientPhoneOrEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "noteSubmittedLowFrequencyDeviceScoreForRecipientAddress:", v11);

  }
  v8 = 0;
LABEL_13:
  v13 = *(_QWORD *)(a1 + 64);
  if (v13)
    (*(void (**)(uint64_t, PKPeerPaymentPerformResponse *, id))(v13 + 16))(v13, v9, v8);
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "recipientPhoneOrEmail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_provideDeviceScoreFeedbackIfNeededForEndpoint:recipientAddress:quoteDestinationType:ingested:", CFSTR("performQuote"), v15, objc_msgSend(*(id *)(a1 + 56), "destination"), 1);

}

- (unint64_t)peerPaymentStatusWithPaymentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  PKPeerPaymentStatusRequest *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(PKPeerPaymentStatusRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  -[PKPeerPaymentStatusRequest setPaymentIdentifier:](v10, "setPaymentIdentifier:", v7);

  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentStatusRequest _urlRequestWithServiceURL:appleAccountInformation:](v10, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PKPeerPaymentWebService_peerPaymentStatusWithPaymentIdentifier_completion___block_invoke;
  v15[3] = &unk_1E2AC70F8;
  v15[4] = self;
  v16 = v6;
  v13 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v12, v8, v15);

  return v8;
}

void __77__PKPeerPaymentWebService_peerPaymentStatusWithPaymentIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentStatusResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentStatusResponse initWithData:]([PKPeerPaymentStatusResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment status request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentStatusResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentPerformAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  PKPeerPaymentPerformActionRequest *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(PKPeerPaymentPerformActionRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v13);
  -[PKPeerPaymentPerformActionRequest setAction:](v13, "setAction:", v10);

  -[PKPeerPaymentPerformActionRequest setPaymentIdentifier:](v13, "setPaymentIdentifier:", v9);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPerformActionRequest _urlRequestWithServiceURL:appleAccountInformation:](v13, "_urlRequestWithServiceURL:appleAccountInformation:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__PKPeerPaymentWebService_peerPaymentPerformAction_withPaymentIdentifier_completion___block_invoke;
  v18[3] = &unk_1E2AC70F8;
  v18[4] = self;
  v19 = v8;
  v16 = v8;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v11, v18);

  return v11;
}

void __85__PKPeerPaymentWebService_peerPaymentPerformAction_withPaymentIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentPerformActionResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentPerformActionResponse initWithData:]([PKPeerPaymentPerformActionResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment action request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentPerformActionResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentPreferencesWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  PKPeerPaymentPreferencesRequest *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PKPeerPaymentPreferencesRequest);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPreferencesRequest _urlRequestWithServiceURL:appleAccountInformation:](v7, "_urlRequestWithServiceURL:appleAccountInformation:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PKPeerPaymentWebService_peerPaymentPreferencesWithCompletion___block_invoke;
  v12[3] = &unk_1E2AC70F8;
  v12[4] = self;
  v13 = v4;
  v10 = v4;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v5, v12);

  return v5;
}

void __64__PKPeerPaymentWebService_peerPaymentPreferencesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentPreferencesResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentPreferencesResponse initWithData:]([PKPeerPaymentPreferencesResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment preferences request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentPreferencesResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentUpdatePreferencesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__PKPeerPaymentWebService_peerPaymentUpdatePreferencesWithRequest_completion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v14);

  return v8;
}

void __78__PKPeerPaymentWebService_peerPaymentUpdatePreferencesWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentUpdatePreferencesResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentUpdatePreferencesResponse initWithData:]([PKPeerPaymentUpdatePreferencesResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment update preferences request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentUpdatePreferencesResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentBankLookupWithCountryCode:(id)a3 query:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  PKPeerPaymentBankLookupRequest *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKPeerPaymentBankLookupRequest initWithCountryCode:query:]([PKPeerPaymentBankLookupRequest alloc], "initWithCountryCode:query:", v10, v9);

  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v13);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentBankLookupRequest _urlRequestWithServiceURL:appleAccountInformation:](v13, "_urlRequestWithServiceURL:appleAccountInformation:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__PKPeerPaymentWebService_peerPaymentBankLookupWithCountryCode_query_completion___block_invoke;
  v18[3] = &unk_1E2AC70F8;
  v18[4] = self;
  v19 = v8;
  v16 = v8;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v11, v18);

  return v11;
}

void __81__PKPeerPaymentWebService_peerPaymentBankLookupWithCountryCode_query_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentBankLookupResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    if (v7 && !v8)
    {
      v9 = -[PKPeerPaymentBankLookupResponse initWithData:]([PKPeerPaymentBankLookupResponse alloc], "initWithData:", v7);
      goto LABEL_11;
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment bank lookup request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
LABEL_11:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentBankLookupResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentRequestStatementForAccountIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  PKPeerPaymentStatementRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(PKPeerPaymentStatementRequest);
  -[PKPeerPaymentStatementRequest setAccountIdentifier:](v10, "setAccountIdentifier:", v7);

  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  PKPrimaryAppleAccountEmail();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentStatementRequest setEmailAddress:](v10, "setEmailAddress:", v11);

  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentStatementRequest _urlRequestWithServiceURL:appleAccountInformation:](v10, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__PKPeerPaymentWebService_peerPaymentRequestStatementForAccountIdentifier_withCompletion___block_invoke;
  v16[3] = &unk_1E2AC70F8;
  v16[4] = self;
  v17 = v6;
  v14 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v13, v8, v16);

  return v8;
}

void __90__PKPeerPaymentWebService_peerPaymentRequestStatementForAccountIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentStatementResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    v9 = -[PKPeerPaymentStatementResponse initWithData:]([PKPeerPaymentStatementResponse alloc], "initWithData:", v7);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment statement request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentStatementResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentReOpenAccountWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  PKPeerPaymentReOpenAccountRequest *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PKPeerPaymentReOpenAccountRequest);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentReOpenAccountRequest _urlRequestWithServiceURL:appleAccountInformation:](v7, "_urlRequestWithServiceURL:appleAccountInformation:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PKPeerPaymentWebService_peerPaymentReOpenAccountWithCompletion___block_invoke;
  v12[3] = &unk_1E2AC70F8;
  v12[4] = self;
  v13 = v4;
  v10 = v4;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v5, v12);

  return v5;
}

void __66__PKPeerPaymentWebService_peerPaymentReOpenAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v6);
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment account reopen request failed with error %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);

}

- (unint64_t)peerPaymentEmailTermsWithCompletion:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  PKPeerPaymentEmailTermsAccountRequest *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PKPeerPaymentEmailTermsAccountRequest);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentEmailTermsAccountRequest _urlRequestWithServiceURL:appleAccountInformation:](v7, "_urlRequestWithServiceURL:appleAccountInformation:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKPeerPaymentWebService_peerPaymentEmailTermsWithCompletion___block_invoke;
  v12[3] = &unk_1E2AC70F8;
  v12[4] = self;
  v13 = v4;
  v10 = v4;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v9, v5, v12);

  return v5;
}

void __63__PKPeerPaymentWebService_peerPaymentEmailTermsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v6);
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment email terms request failed with error %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);

}

- (unint64_t)submitDeviceScoreIdentifiersWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__PKPeerPaymentWebService_submitDeviceScoreIdentifiersWithRequest_completion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v14);

  return v8;
}

void __78__PKPeerPaymentWebService_submitDeviceScoreIdentifiersWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v6);
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment submission of device scores failed with error %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);

}

- (unint64_t)peerPaymentAddAssociatedAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__PKPeerPaymentWebService_peerPaymentAddAssociatedAccountWithRequest_completion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v14);

  return v8;
}

void __81__PKPeerPaymentWebService_peerPaymentAddAssociatedAccountWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentAddAssociatedAccountResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    v9 = -[PKPeerPaymentAddAssociatedAccountResponse initWithData:]([PKPeerPaymentAddAssociatedAccountResponse alloc], "initWithData:", v7);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment invite associated account request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentAddAssociatedAccountResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentRemoveAssociatedAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PKPeerPaymentWebService_peerPaymentRemoveAssociatedAccountWithRequest_completion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v14);

  return v8;
}

void __84__PKPeerPaymentWebService_peerPaymentRemoveAssociatedAccountWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentRemoveAssociatedAccountResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    v9 = -[PKPeerPaymentRemoveAssociatedAccountResponse initWithData:]([PKPeerPaymentRemoveAssociatedAccountResponse alloc], "initWithData:", v7);
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment remove associated account request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentRemoveAssociatedAccountResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentAssociatedAccountActionWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PKPeerPaymentWebService_peerPaymentAssociatedAccountActionWithRequest_completion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v14);

  return v8;
}

void __84__PKPeerPaymentWebService_peerPaymentAssociatedAccountActionWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentAssociatedAccountActionResponse *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    v9 = -[PKPeerPaymentAssociatedAccountActionResponse initWithData:]([PKPeerPaymentAssociatedAccountActionResponse alloc], "initWithData:", v7);
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment associated account action request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, PKPeerPaymentAssociatedAccountActionResponse *, id))(v11 + 16))(v11, v9, v8);

}

- (unint64_t)peerPaymentRecurringPaymentsForAccountIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  PKPeerPaymentRecurringPaymentsRequest *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPeerPaymentRecurringPaymentsRequest initWithAccountIdentifier:]([PKPeerPaymentRecurringPaymentsRequest alloc], "initWithAccountIdentifier:", v7);

  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v10);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentsRequest _urlRequestWithServiceURL:appleAccountInformation:](v10, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PKPeerPaymentWebService_peerPaymentRecurringPaymentsForAccountIdentifier_withCompletion___block_invoke;
  v15[3] = &unk_1E2AC70F8;
  v15[4] = self;
  v16 = v6;
  v13 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v12, v8, v15);

  return v8;
}

void __91__PKPeerPaymentWebService_peerPaymentRecurringPaymentsForAccountIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPeerPaymentRecurringPaymentsResponse *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "recurringPaymentsFeatureDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PKPeerPaymentRecurringPaymentsResponse initWithData:productTimeZone:]([PKPeerPaymentRecurringPaymentsResponse alloc], "initWithData:productTimeZone:", v7, v12);
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Peer Payment recurring payments request failed with error %@", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, PKPeerPaymentRecurringPaymentsResponse *, id))(v15 + 16))(v15, v13, v8);

}

- (unint64_t)peerPaymentRecurringPaymentPerformAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  PKPeerPaymentRecurringPaymentActionRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKPeerPaymentRecurringPaymentActionRequest initWithRecurringPaymentIdentifier:]([PKPeerPaymentRecurringPaymentActionRequest alloc], "initWithRecurringPaymentIdentifier:", v9);

  PKPeerPaymentRecurringPaymentActionToString(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentActionRequest setAction:](v12, "setAction:", v13);

  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v12);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentActionRequest _urlRequestWithServiceURL:appleAccountInformation:](v12, "_urlRequestWithServiceURL:appleAccountInformation:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__PKPeerPaymentWebService_peerPaymentRecurringPaymentPerformAction_identifier_completion___block_invoke;
  v18[3] = &unk_1E2AC70F8;
  v18[4] = self;
  v19 = v8;
  v16 = v8;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v15, v10, v18);

  return v10;
}

void __90__PKPeerPaymentWebService_peerPaymentRecurringPaymentPerformAction_identifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPeerPaymentRecurringPaymentActionResponse *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "recurringPaymentsFeatureDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PKPeerPaymentRecurringPaymentActionResponse initWithData:productTimeZone:]([PKPeerPaymentRecurringPaymentActionResponse alloc], "initWithData:productTimeZone:", v7, v12);
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Peer Payment recurring payment action request failed with error %@", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, PKPeerPaymentRecurringPaymentActionResponse *, id))(v15 + 16))(v15, v13, v8);

}

- (unint64_t)peerPaymentEncryptionCertificateForDestination:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  PKPeerPaymentEncryptionCertificatesRequest *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  unint64_t v16;

  v6 = a4;
  v7 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPeerPaymentEncryptionCertificatesRequest initWithEncryptionCertificateDestination:]([PKPeerPaymentEncryptionCertificatesRequest alloc], "initWithEncryptionCertificateDestination:", a3);
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v9);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentEncryptionCertificatesRequest _urlRequestWithServiceURL:appleAccountInformation:](v9, "_urlRequestWithServiceURL:appleAccountInformation:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__PKPeerPaymentWebService_peerPaymentEncryptionCertificateForDestination_withCompletion___block_invoke;
  v14[3] = &unk_1E2ACB7C8;
  v15 = v6;
  v16 = a3;
  v14[4] = self;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v7, v14);

  return v7;
}

void __89__PKPeerPaymentWebService_peerPaymentEncryptionCertificateForDestination_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  PKPeerPaymentEncryptionCertificatesResponse *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v8))
  {
    v9 = -[PKPeerPaymentEncryptionCertificatesResponse initWithData:]([PKPeerPaymentEncryptionCertificatesResponse alloc], "initWithData:", v7);
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentEncryptionCertificateDestinationToString(*(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment encryption certificate request for destination %@ failed with error %@", (uint8_t *)&v13, 0x16u);

    }
    v9 = 0;
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, PKPeerPaymentEncryptionCertificatesResponse *, id))(v12 + 16))(v12, v9, v8);

}

- (unint64_t)peerPaymentFailureDiagnosticWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PKWebService nextTaskID](self, "nextTaskID");
  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService _updateRequestWithCurrentTargetDevice:](self, "_updateRequestWithCurrentTargetDevice:", v7);
  -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlRequestWithServiceURL:appleAccountInformation:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PKPeerPaymentWebService_peerPaymentFailureDiagnosticWithRequest_withCompletion___block_invoke;
  v14[3] = &unk_1E2AC70F8;
  v14[4] = self;
  v15 = v6;
  v12 = v6;
  -[PKPeerPaymentWebService performRequest:taskIdentifier:completionHandler:](self, "performRequest:taskIdentifier:completionHandler:", v11, v8, v14);

  return v8;
}

void __82__PKPeerPaymentWebService_peerPaymentFailureDiagnosticWithRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_isValidResponse:error:", a3, v6);
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(_QWORD *)(a1 + 32) + 176));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment failure diagnostic request failed with error %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);

}

- (id)_deviceIdentifier
{
  void *v2;
  void *v3;

  -[PKPeerPaymentWebService context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_deviceRegistrationDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PKPeerPaymentDeviceRegistrationData *v8;
  void *v9;
  PKSecureElement *secureElement;
  uint64_t v11;
  PKPeerPaymentDeviceRegistrationData *v12;
  NSObject *v13;
  PKSecureElement *v14;
  PKPeerPaymentDeviceRegistrationData *v15;
  NSObject *v16;
  NSObject *v17;
  PKPeerPaymentDeviceRegistrationData *v18;
  _QWORD block[4];
  PKPeerPaymentDeviceRegistrationData *v20;
  PKPeerPaymentWebService *v21;
  id v22;
  _QWORD v23[4];
  PKPeerPaymentDeviceRegistrationData *v24;
  NSObject *v25;
  _QWORD v26[4];
  PKPeerPaymentDeviceRegistrationData *v27;
  PKPeerPaymentWebService *v28;
  NSObject *v29;

  v4 = a3;
  if (v4)
  {
    -[PKPeerPaymentWebService _appleAccountInformation](self, "_appleAccountInformation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authorizationHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = dispatch_group_create();
    v8 = objc_alloc_init(PKPeerPaymentDeviceRegistrationData);
    -[PKPeerPaymentDeviceRegistrationData setDevSigned:](v8, "setDevSigned:", -[PKSecureElement isProductionSigned](self->_secureElement, "isProductionSigned") ^ 1);
    -[PKPeerPaymentDeviceRegistrationData setAuthorizationHeader:](v8, "setAuthorizationHeader:", v6);
    dispatch_group_enter(v7);
    objc_msgSend(v5, "aidaAlternateDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    secureElement = self->_secureElement;
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke;
    v26[3] = &unk_1E2ACB7F0;
    v12 = v8;
    v27 = v12;
    v28 = self;
    v13 = v7;
    v29 = v13;
    -[PKSecureElement peerPaymentEnrollmentDataWithAlternateDSID:completion:](secureElement, "peerPaymentEnrollmentDataWithAlternateDSID:completion:", v9, v26);
    dispatch_group_enter(v13);
    v14 = self->_secureElement;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke_2;
    v23[3] = &unk_1E2ABE2F0;
    v15 = v12;
    v24 = v15;
    v25 = v13;
    v16 = v13;
    -[PKSecureElement signatureForAuthToken:completion:](v14, "signatureForAuthToken:completion:", v6, v23);
    dispatch_get_global_queue(21, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke_3;
    block[3] = &unk_1E2AC4930;
    v20 = v15;
    v21 = self;
    v22 = v4;
    v18 = v15;
    dispatch_group_notify(v16, v17, block);

  }
}

void __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setEnrollmentData:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setSignedEnrollmentDataSignature:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "setSignedEnrollmentDataSignature:", v6);

  objc_msgSend(*(id *)(a1 + 40), "_archiveContext");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setSignedAuthToken:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x19400CFE8]();
  objc_msgSend(*(id *)(a1 + 32), "enrollmentData");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(*(id *)(a1 + 32), "signedAuthToken"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    _PKPeerPaymentWebServiceError(2, 0, 0, *(void **)(*(_QWORD *)(a1 + 40) + 176));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
  objc_autoreleasePoolPop(v2);
}

- (void)_peerPaymentDeviceMetadataWithCompletion:(id)a3
{
  id v4;
  PKPaymentDevice *paymentDevice;
  PKPaymentDevice *v6;
  PKPaymentDevice *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    paymentDevice = self->_paymentDevice;
    v8 = v4;
    if (!paymentDevice)
    {
      v6 = objc_alloc_init(PKPaymentDevice);
      v7 = self->_paymentDevice;
      self->_paymentDevice = v6;

      paymentDevice = self->_paymentDevice;
    }
    -[PKPaymentDevice paymentDeviceMetadataFields:completion:](paymentDevice, "paymentDeviceMetadataFields:completion:", 43, v8);
    v4 = v8;
  }

}

- (id)_appleAccountInformation
{
  void *v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKPeerPaymentWebServiceTargetDeviceProtocol appleAccountInformation](self->_targetDevice, "appleAccountInformation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleAccountInformation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_renewAppleAccountWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  PKPeerPaymentWebService *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __67__PKPeerPaymentWebService__renewAppleAccountWithCompletionHandler___block_invoke;
  v11 = &unk_1E2ABDBF8;
  v12 = self;
  v5 = v4;
  v13 = v5;
  v6 = _Block_copy(&v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKPeerPaymentWebServiceTargetDeviceProtocol renewAppleAccountWithCompletionHandler:](self->_targetDevice, "renewAppleAccountWithCompletionHandler:", v6, v8, v9, v10, v11, v12);
  }
  else
  {
    +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance", v8, v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renewAppleAccountWithCompletionHandler:", v6);

  }
}

void __67__PKPeerPaymentWebService__renewAppleAccountWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)prewarmDeviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *prewarmedDeviceScorersQueue;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PKPeerPaymentService account](self->_peerPaymentService, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", objc_msgSend(v10, "deviceScoreEncryptedPayloadVersion"), v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    prewarmedDeviceScorersQueue = self->_prewarmedDeviceScorersQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__PKPeerPaymentWebService_prewarmDeviceScoreForEndpoint_recipientAddress_quoteDestinationType___block_invoke;
    block[3] = &unk_1E2ACB818;
    block[4] = self;
    v15 = v11;
    v16 = v8;
    v17 = v9;
    v18 = a5;
    dispatch_async(prewarmedDeviceScorersQueue, block);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Invalid key for endpoint %@.", buf, 0xCu);
    }

  }
}

void __95__PKPeerPaymentWebService_prewarmDeviceScoreForEndpoint_recipientAddress_quoteDestinationType___block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  int v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (__CFString *)*(id *)(a1 + 48);
    if (v3 == CFSTR("requestToken")
      || (v4 = v3) != 0
      && (v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("requestToken")), v4, v5))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", objc_msgSend(v6, "deviceScoreEncryptedPayloadVersion"), CFSTR("quote"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      v21 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {

        return;
      }
      if (*(_QWORD *)(a1 + 56))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "account");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", objc_msgSend(v16, "deviceScoreEncryptedPayloadVersion"), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", v12);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v14 = (void *)v17;
          PKLogFacilityTypeGetObject(0xBuLL);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            goto LABEL_18;
          }
          goto LABEL_19;
        }
      }
      else
      {
        v12 = v21;
      }
    }
    else
    {
      v8 = (__CFString *)*(id *)(a1 + 48);
      if (v8 != CFSTR("quote"))
      {
        v9 = v8;
        if (!v8)
          goto LABEL_24;
        v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("quote"));

        if (!v10)
          goto LABEL_24;
      }
      if (!*(_QWORD *)(a1 + 56))
        goto LABEL_24;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", objc_msgSend(v11, "deviceScoreEncryptedPayloadVersion"), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        PKLogFacilityTypeGetObject(0xBuLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v12;
LABEL_18:
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Recovered device scorer from key: %@.", buf, 0xCu);
        }
LABEL_19:

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObjectForKey:", v12);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setObject:forKey:", v14, *(_QWORD *)(a1 + 40));

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134218242;
          v23 = v14;
          v24 = 2112;
          v25 = v18;
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Pre-warmed device scorer already exists %p for key: %@.", buf, 0x16u);
        }

        objc_msgSend(v14, "updateAttributesWithEndpointIdentifier:recipientAddress:quoteDestinationType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_27:

        return;
      }
    }

LABEL_24:
    objc_msgSend(*(id *)(a1 + 32), "_createDeviceScorerForEndpoint:recipientAddress:quoteDestinationType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setObject:forKey:", v14, *(_QWORD *)(a1 + 40));
    PKLogFacilityTypeGetObject(0xBuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v23 = v14;
      v24 = 2112;
      v25 = v20;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Inserted pre-warming device scorer %p for key: %@.", buf, 0x16u);
    }

    goto LABEL_27;
  }
}

- (void)unloadDeviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5
{
  id v8;
  PKPeerPaymentService *peerPaymentService;
  id v10;
  void *v11;
  void *v12;
  NSObject *prewarmedDeviceScorersQueue;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  peerPaymentService = self->_peerPaymentService;
  v10 = a4;
  -[PKPeerPaymentService account](peerPaymentService, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", objc_msgSend(v11, "deviceScoreEncryptedPayloadVersion"), v8, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    prewarmedDeviceScorersQueue = self->_prewarmedDeviceScorersQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __94__PKPeerPaymentWebService_unloadDeviceScoreForEndpoint_recipientAddress_quoteDestinationType___block_invoke;
    v15[3] = &unk_1E2ABE0D0;
    v15[4] = self;
    v16 = v12;
    dispatch_async(prewarmedDeviceScorersQueue, v15);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Invalid key for endpoint %@.", buf, 0xCu);
    }

  }
}

void __94__PKPeerPaymentWebService_unloadDeviceScoreForEndpoint_recipientAddress_quoteDestinationType___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Removing unused pre-warmed device score for key: %@.", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v2, "provideSessionFeedbackWithIngested:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

}

- (void)updateDeviceScorersWithEncryptedPayloadVersion:(unint64_t)a3
{
  NSMutableDictionary *prewarmedDeviceScorers;
  _QWORD v4[5];

  prewarmedDeviceScorers = self->_prewarmedDeviceScorers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__PKPeerPaymentWebService_updateDeviceScorersWithEncryptedPayloadVersion___block_invoke;
  v4[3] = &__block_descriptor_40_e74_v32__0__NSString_8__PKPeerPaymentDeviceScoreEncryptedPayloadManager_16_B24l;
  v4[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](prewarmedDeviceScorers, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __74__PKPeerPaymentWebService_updateDeviceScorersWithEncryptedPayloadVersion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setDeviceScoreEncryptedPayloadVersion:", *(_QWORD *)(a1 + 32));
}

- (id)_createDeviceScorerForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5
{
  PKPeerPaymentService *peerPaymentService;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  PKPeerPaymentDeviceScoreEncryptedPayloadManager *v12;

  peerPaymentService = self->_peerPaymentService;
  v8 = a4;
  v9 = a3;
  -[PKPeerPaymentService account](peerPaymentService, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "deviceScoreEncryptedPayloadVersion");

  v12 = -[PKPeerPaymentDeviceScoreEncryptedPayloadManager initWithEndpointIdentifier:recipientAddress:deviceScoreEncryptedPayloadVersion:quoteDestinationType:]([PKPeerPaymentDeviceScoreEncryptedPayloadManager alloc], "initWithEndpointIdentifier:recipientAddress:deviceScoreEncryptedPayloadVersion:quoteDestinationType:", v9, v8, v11, a5);
  return v12;
}

- (void)_deviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *prewarmedDeviceScorersQueue;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD aBlock[4];
  id v30;
  PKPeerPaymentWebService *v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    -[PKPeerPaymentService account](self->_peerPaymentService, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "deviceScoreEncryptedPayloadVersion");

    +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", v14, v10, v11, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke;
    aBlock[3] = &unk_1E2ACB888;
    v17 = v15;
    v30 = v17;
    v31 = self;
    v32 = v12;
    v18 = _Block_copy(aBlock);
    prewarmedDeviceScorersQueue = self->_prewarmedDeviceScorersQueue;
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_222;
    block[3] = &unk_1E2ACB8B0;
    block[4] = self;
    v23 = v17;
    v26 = v18;
    v27 = v14;
    v24 = v10;
    v25 = v11;
    v28 = a5;
    v20 = v18;
    v21 = v17;
    dispatch_async(prewarmedDeviceScorersQueue, block);

  }
}

void __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_2;
  v7[3] = &unk_1E2AC4A20;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PKLogFacilityTypeGetObject(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: calculateWithDeviceScoreEncryptedPayloadManager() called with deviceScoreEncryptedPayloadManager for key: %@.", buf, 0xCu);
    }

    v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_220;
    v11[3] = &unk_1E2ACB860;
    v12 = v6;
    v13 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = v7;
    objc_msgSend(v12, "deviceScoreWithCompletion:", v11);

    v8 = v12;
  }
  else
  {
    if (v4)
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: calculateWithDeviceScoreEncryptedPayloadManager() called with a nil deviceScoreEncryptedPayloadManager for key: %@. Calling completion with error.", buf, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 56);
    _PKPeerPaymentWebServiceError(3, 0, 0, *(void **)(*(_QWORD *)(a1 + 48) + 176));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v10 + 16))(v10, 0, 0, 0, v8);
  }

}

void __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_220(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  __CFString **v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  PKLogFacilityTypeGetObject(0xBuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10 | v11)
  {
    if (v14)
    {
      v15 = a1[5];
      v22 = 138412290;
      v23 = v15;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: deviceScoreWithCompletion: successfully returned a deviceScore for key: %@. Calling completion with score.", (uint8_t *)&v22, 0xCu);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (v14)
    {
      v16 = a1[5];
      v22 = 138412290;
      v23 = v16;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: peerPaymentDeviceScoreWithCompletion: failed to return a deviceScore for key: %@. Calling completion with error.", (uint8_t *)&v22, 0xCu);
    }

    v17 = PKIsPad();
    v18 = PKAggDKeyPeerPaymentDeviceScoreErrorPhone;
    if (v17)
      v18 = PKAggDKeyPeerPaymentDeviceScoreErrorPad;
    v19 = *v18;
    if (v19)
      AnalyticsSendEvent();
    v20 = a1[7];
    _PKPeerPaymentWebServiceError(3, v12, 0, *(void **)(a1[6] + 176));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, 0, v21);

  }
}

void __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_222(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Found an existing, pre-warmed device scorer for key: %@.", (uint8_t *)&v7, 0xCu);
    }

    if (!*(_QWORD *)(a1 + 72))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: No pre-warmed device scorer available for key: %@. Creating a new scorer.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_createDeviceScorerForEndpoint:recipientAddress:quoteDestinationType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)_provideDeviceScoreFeedbackIfNeededForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5 ingested:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *prewarmedDeviceScorersQueue;
  id v16;
  _QWORD block[4];
  id v18;
  PKPeerPaymentWebService *v19;
  id v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;

  v10 = a3;
  v11 = a4;
  -[PKPeerPaymentService account](self->_peerPaymentService, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "deviceScoreEncryptedPayloadVersion");

  if (v13 == 1)
  {
    +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", 1, v10, v11, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    prewarmedDeviceScorersQueue = self->_prewarmedDeviceScorersQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__PKPeerPaymentWebService__provideDeviceScoreFeedbackIfNeededForEndpoint_recipientAddress_quoteDestinationType_ingested___block_invoke;
    block[3] = &unk_1E2ACB8D8;
    v18 = v14;
    v19 = self;
    v24 = a6;
    v20 = v10;
    v22 = a5;
    v23 = 1;
    v21 = v11;
    v16 = v14;
    dispatch_async(prewarmedDeviceScorersQueue, block);

  }
}

void __121__PKPeerPaymentWebService__provideDeviceScoreFeedbackIfNeededForEndpoint_recipientAddress_quoteDestinationType_ingested___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "objectForKey:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(a1 + 80))
          v5 = CFSTR("YES");
        else
          v5 = CFSTR("NO");
        v25 = 138412546;
        v26 = v5;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Providing feedback ingested %@ for key %@", (uint8_t *)&v25, 0x16u);
      }

      objc_msgSend(v2, "provideSessionFeedbackWithIngested:", *(unsigned __int8 *)(a1 + 80));
      v6 = (__CFString *)*(id *)(a1 + 48);
      if (v6 != CFSTR("quote"))
      {
        v7 = v6;
        if (!v6
          || (v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("quote")),
              v7,
              (v8 & 1) == 0))
        {
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            v9 = *(const __CFString **)(a1 + 32);
            v25 = 138412290;
            v26 = v9;
            _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Releasing session for key %@", (uint8_t *)&v25, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
        }
      }
    }
  }
  else
  {
    v2 = 0;
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v10 = *(_QWORD *)(a1 + 64);
    v11 = (__CFString *)*(id *)(a1 + 48);
    v12 = CFSTR("quote");
    if (v11 != CFSTR("requestToken"))
    {
      v13 = v11;
      if (!v11
        || (v14 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("requestToken")),
            v13,
            (v14 & 1) == 0))
      {
        v15 = (__CFString *)*(id *)(a1 + 48);
        if (v15 == CFSTR("quote")
          || (v16 = v15) != 0
          && (v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("quote")), v16, v17))
        {
          v18 = *(_QWORD *)(a1 + 64);
          v19 = CFSTR("quote");
          v20 = 4;
          v21 = CFSTR("requestToken");
          if (v18 != 1)
            v21 = 0;
          if (v18 != 2)
          {
            v19 = v21;
            v20 = v10;
          }
          if (v18 == 4)
            v12 = CFSTR("quote");
          else
            v12 = v19;
          if (v18 == 4)
            v10 = 2;
          else
            v10 = v20;
        }
        else
        {
          v12 = 0;
        }
      }
    }
    +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", *(_QWORD *)(a1 + 72), v12, *(_QWORD *)(a1 + 56), v10);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412290;
        v26 = v22;
        _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Providing feedback not ingested for key %@ and releasing session", (uint8_t *)&v25, 0xCu);
      }

      objc_msgSend(v23, "provideSessionFeedbackWithIngested:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "removeObjectForKey:", v22);
    }

  }
}

- (void)_handleRetryAfterRegisterWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPeerPaymentWebServiceTargetDeviceProtocol *targetDevice;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0xBuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Registering device", buf, 2u);
  }

  -[PKPeerPaymentWebService peerPaymentServiceURL](self, "peerPaymentServiceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    targetDevice = self->_targetDevice;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__PKPeerPaymentWebService__handleRetryAfterRegisterWithRequest_completionHandler___block_invoke;
    v14[3] = &unk_1E2ACB900;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    -[PKPeerPaymentWebServiceTargetDeviceProtocol peerPaymentReRegisterWithURL:pushToken:peerPaymentWebService:completion:](targetDevice, "peerPaymentReRegisterWithURL:pushToken:peerPaymentWebService:completion:", v9, v11, self, v14);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "targetDevice cannot peer payment register. Aborting original request", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPeerPaymentWebServiceErrorDomain"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v13);

  }
}

void __82__PKPeerPaymentWebService__handleRetryAfterRegisterWithRequest_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[16];

  v5 = a3;
  PKLogFacilityTypeGetObject(0xBuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 || !a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Registration failed. Aborting original request", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Registration succeeded, retrying original request", buf, 2u);
    }

    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __82__PKPeerPaymentWebService__handleRetryAfterRegisterWithRequest_completionHandler___block_invoke_227;
    v14 = &unk_1E2AC70F8;
    v15 = v8;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v9, &v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume", v11, v12, v13, v14, v15);

  }
}

void __82__PKPeerPaymentWebService__handleRetryAfterRegisterWithRequest_completionHandler___block_invoke_227(uint64_t a1, void *a2, void *a3, void *a4)
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

- (void)_archiveContext
{
  void *v3;
  void *v4;
  id v5;

  -[PKPeerPaymentWebService context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPeerPaymentWebService archiver](self, "archiver");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentWebService context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archiveContext:", v4);

  }
}

- (BOOL)_isValidResponse:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v5;
    v8 = objc_msgSend(v7, "statusCode");
    v9 = v8 == 200;
    if (v6 && v8 != 200)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "absoluteString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v12;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ error: %@", (uint8_t *)&v14, 0x16u);

      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateRequestWithCurrentTargetDevice:(id)a3
{
  objc_msgSend(a3, "setTargetDevice:", self->_targetDevice);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PKPeerPaymentWebServiceArchiver)archiver
{
  return self->_archiver;
}

- (PKPeerPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return self->_targetDevice;
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (void)setPeerPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentService, a3);
}

- (BOOL)isSharedService
{
  return self->_sharedService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_paymentDevice, 0);
  objc_storeStrong((id *)&self->_prewarmedDeviceScorersQueue, 0);
  objc_storeStrong((id *)&self->_prewarmedDeviceScorers, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
}

@end
