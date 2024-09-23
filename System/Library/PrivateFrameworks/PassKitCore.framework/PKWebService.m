@implementation PKWebService

- (PKWebService)initWithTapToRadarDelegate:(id)a3
{
  id v4;
  PKWebService *v5;
  PKWebService *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *sessionQueue;
  NSOperationQueue *v9;
  NSOperationQueue *delegateOperationQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *webServiceTasks;
  NSMutableDictionary *v13;
  NSMutableDictionary *tasksMetadata;
  uint64_t v15;
  NSMutableDictionary *diagnosticReasonsByTaskID;
  uint64_t v17;
  NSMutableArray *diagnosticReasons;
  dispatch_queue_t v19;
  OS_dispatch_queue *diagnosticReasonsQueue;
  uint64_t v21;
  NSSet *sensitiveKeys;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKWebService;
  v5 = -[PKWebService init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tapToRadarDelegate, v4);
    v6->_taskIDCounter = 0;
    v6->_stateLock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_create("com.apple.passd.urlsession", 0);
    sessionQueue = v6->_sessionQueue;
    v6->_sessionQueue = (OS_dispatch_queue *)v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    delegateOperationQueue = v6->_delegateOperationQueue;
    v6->_delegateOperationQueue = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    webServiceTasks = v6->_webServiceTasks;
    v6->_webServiceTasks = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tasksMetadata = v6->_tasksMetadata;
    v6->_tasksMetadata = v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    diagnosticReasonsByTaskID = v6->_diagnosticReasonsByTaskID;
    v6->_diagnosticReasonsByTaskID = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    diagnosticReasons = v6->_diagnosticReasons;
    v6->_diagnosticReasons = (NSMutableArray *)v17;

    v19 = dispatch_queue_create("com.apple.passkit.diagnosticReasonsQueue", 0);
    diagnosticReasonsQueue = v6->_diagnosticReasonsQueue;
    v6->_diagnosticReasonsQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("cardSecurityCode"), CFSTR("amount"), CFSTR("merchantIdentifier"), CFSTR("merchantName"), CFSTR("cardholderName"), CFSTR("expiration"), CFSTR("firstName"), CFSTR("lastName"), CFSTR("addressLine1"), CFSTR("addressLine2"), CFSTR("street1"), CFSTR("street2"), CFSTR("email"), CFSTR("city"), CFSTR("postalCode"), CFSTR("name"), CFSTR("nameOptions"),
      CFSTR("FPANSuffix"),
      CFSTR("countryCode"),
      CFSTR("SELDInfo"),
      CFSTR("dateOfBirth"),
      CFSTR("emailAddress"),
      CFSTR("phoneNumber"),
      CFSTR("accountNumber"),
      CFSTR("mailboxIdentifier"),
      CFSTR("originURL"),
      CFSTR("aprForPurchase"),
      CFSTR("rewardsEarned"),
      CFSTR("rewardsRedeemed"),
      CFSTR("rewardsBalance"),
      CFSTR("rewardsLifetime"),
      CFSTR("statementBalance"),
      CFSTR("rewardsYTD"),
      CFSTR("cyclesPastDue"),
      CFSTR("inGrace"),
      CFSTR("pastDueAmount"),
      CFSTR("unpostedInterest"),
      CFSTR("requiresDebtCollectionNotices"),
      CFSTR("creditLimit"),
      CFSTR("availableCredit"),
      CFSTR("currentBalance"),
      CFSTR("adjustedBalance"),
      CFSTR("installmentBalance"),
      CFSTR("remainingStatementBalance"),
      CFSTR("remainingMinimumPayment"),
      CFSTR("remainingMinimumPaymentExcludedFromInterestCalculation"),
      CFSTR("purchases"),
      CFSTR("pendingPurchases"),
      CFSTR("balanceTransfers"),
      CFSTR("interestCharged"),
      CFSTR("feesCharged"),
      CFSTR("paymentsAndCredits"),
      CFSTR("payments"),
      CFSTR("credits"),
      CFSTR("remainingStatementBalanceForInterestCalculation"),
      CFSTR("availableBalance"),
      CFSTR("interestYTD"),
      CFSTR("totalBalance"),
      CFSTR("minimumDue"),
      CFSTR("openingBalance"),
      CFSTR("closingBalance"));
    v21 = objc_claimAutoreleasedReturnValue();
    sensitiveKeys = v6->_sensitiveKeys;
    v6->_sensitiveKeys = (NSSet *)v21;

    -[PKWebService resetWebServiceSessionMarker](v6, "resetWebServiceSessionMarker");
  }

  return v6;
}

- (void)resetWebServiceSessionMarker
{
  os_unfair_lock_s *p_stateLock;
  NSString *v4;
  void *v5;
  NSString *v6;
  NSString *webServiceSessionMarker;
  NSObject *v8;
  _BOOL4 v9;
  objc_class *v10;
  void *v11;
  NSString *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  objc_class *v16;
  NSString *v17;
  int v18;
  void *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_webServiceSessionMarker;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  webServiceSessionMarker = self->_webServiceSessionMarker;
  self->_webServiceSessionMarker = v6;

  PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_webServiceSessionMarker;
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v4;
      v22 = 2112;
      v23 = v12;
      v13 = "%{public}@ Session Marker Reset - (Old : '%@' ==> New : '%@')";
      v14 = v8;
      v15 = 32;
LABEL_6:
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);

    }
  }
  else if (v9)
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_webServiceSessionMarker;
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v13 = "%{public}@ Session Marker Initialized - ('%@')";
    v14 = v8;
    v15 = 22;
    goto LABEL_6;
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, id, id, void *);
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t v26[8];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, id, id, void *))a7;
  v15 = objc_msgSend(v11, "statusCode");
  switch(v15)
  {
    case 403:
      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Received Status Code 403.", v26, 2u);
      }

      +[PKWebServiceResponse responseWithData:](PKWebServiceForbiddenResponse, "responseWithData:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKWebService forbiddenErrorWithResponse:](self, "forbiddenErrorWithResponse:", v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v14[2](v14, v13, v11, v20);
      break;
    case 503:
      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Received Status Code 503.", v26, 2u);
      }

      v27[0] = *MEMORY[0x1E0CB2D68];
      PKLocalizedPaymentString(CFSTR("RATE_LIMITED_ERROR_TITLE"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v24;
      v27[1] = *MEMORY[0x1E0CB2D80];
      PKLocalizedPaymentString(CFSTR("RATE_LIMITED_ERROR_MESSAGE"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 4, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 429:
      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Received Status Code 429.", v26, 2u);
      }

      v29[0] = *MEMORY[0x1E0CB2D68];
      PKLocalizedPaymentString(CFSTR("RATE_LIMITED_ERROR_TITLE"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v17;
      v29[1] = *MEMORY[0x1E0CB2D80];
      PKLocalizedPaymentString(CFSTR("RATE_LIMITED_ERROR_MESSAGE"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 3, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      if (v14)
        v14[2](v14, v13, v11, v20);

      break;
    default:
      if (v14)
        v14[2](v14, v13, v11, v12);
      v20 = v12;
      break;
  }

}

- (void)processRetryRequest:(id)a3 responseData:(id)a4 orginalRequest:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  if (a6)
  {
    v8 = a6;
    v9 = (id)objc_msgSend(a3, "copy");
    (*((void (**)(id, id))a6 + 2))(v8, v9);

  }
}

- (BOOL)canBypassTrustValidation
{
  int v3;
  NSObject *v4;
  uint8_t v6[16];

  if ((PKBypassCertValidation() & 1) != 0 || (v3 = PKIgnoreSSLPinning()) != 0)
  {
    PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Allowing bypass of extended trust validation by preference on internal build", v6, 2u);
    }

    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
}

- (void)handleAuthenticationFailureWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 2, 0);
}

- (void)invalidate
{
  id v2;

  -[PKWebService urlSession](self, "urlSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndCancel");

}

- (NSURLSessionConfiguration)sessionConfiguration
{
  void *v2;
  void *v3;

  -[PKWebService urlSession](self, "urlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURLSessionConfiguration *)v3;
}

- (void)refreshSessionWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Requested update to web service with configuration: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v4, self, self->_delegateOperationQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKWebService setUrlSession:](self, "setUrlSession:", v6);

}

- (unint64_t)nextTaskID
{
  os_unfair_lock_s *p_stateLock;
  unint64_t taskIDCounter;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  taskIDCounter = self->_taskIDCounter;
  self->_taskIDCounter = taskIDCounter + 1;
  os_unfair_lock_unlock(p_stateLock);
  -[PKWebService _associateDiagnosticReasonsWithTaskID:](self, "_associateDiagnosticReasonsWithTaskID:", taskIDCounter);
  return taskIDCounter;
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 completionHandler:(id)a5
{
  -[PKWebService performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:](self, "performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:", a3, a4, 2, 1, 1, a5);
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 cacheResponse:(BOOL)a5 completionHandler:(id)a6
{
  -[PKWebService performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:](self, "performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:", a3, a4, 2, 1, a5, a6);
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 retries:(unint64_t)a5 authHandling:(BOOL)a6 completionHandler:(id)a7
{
  -[PKWebService performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:](self, "performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:", a3, a4, a5, a6, 1, a7);
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 retries:(unint64_t)a5 authHandling:(BOOL)a6 cacheResponse:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKWebServiceRequestMetadata *v24;
  void *v25;
  NSMutableDictionary *webServiceTasks;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint8_t *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[2];
  __int16 v37;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a8;
  if (!v14)
  {
    PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v37 = 0;
    v29 = "Error: Attempting to perform a nil NSURLRequest. Failing with error PKWebServiceErrorCodeServiceFailure.";
    v30 = (uint8_t *)&v37;
    goto LABEL_10;
  }
  objc_msgSend(v14, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PKWebService _urlRequestTaggedWithWebServiceSessionMarkerHeader:](self, "_urlRequestTaggedWithWebServiceSessionMarkerHeader:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKWebService _urlRequestTaggedWithDiagnosticReasonHeader:forTaskID:](self, "_urlRequestTaggedWithDiagnosticReasonHeader:forTaskID:", v17, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKWebService urlRequestTaggedWithUniqueRequestIdentifier:](self, "urlRequestTaggedWithUniqueRequestIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKWebService _urlRequestWithCustomHeaders:](self, "_urlRequestWithCustomHeaders:", v19);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PKWebService logRequest:](self, "logRequest:", v14);
      objc_msgSend(v14, "HTTPBody");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");

      -[PKWebService urlSession](self, "urlSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dataTaskWithRequest:", v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = objc_alloc_init(PKWebServiceRequestMetadata);
        -[PKWebServiceRequestMetadata setCacheResponse:](v24, "setCacheResponse:", v9);
        -[PKWebServiceRequestMetadata setRetries:](v24, "setRetries:", a5);
        -[PKWebServiceRequestMetadata setOriginalBody:](v24, "setOriginalBody:", v21);
        -[PKWebServiceRequestMetadata setAuthHandling:](v24, "setAuthHandling:", v10);
        -[PKWebServiceRequestMetadata setCompletion:](v24, "setCompletion:", v15);
        os_unfair_lock_lock(&self->_stateLock);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "taskIdentifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        webServiceTasks = self->_webServiceTasks;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](webServiceTasks, "setObject:forKey:", v27, v25);

        -[NSMutableDictionary setObject:forKey:](self->_tasksMetadata, "setObject:forKey:", v24, v25);
        os_unfair_lock_unlock(&self->_stateLock);
        objc_msgSend(v23, "resume");

      }
      else
      {
        PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error - Could not start network request", v34, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 0, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v33);

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error - No request to create task", v35, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v21);
      v14 = 0;
    }
    goto LABEL_20;
  }
  PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v29 = "Error: Attempting to perform NSURLRequest with a nil URL. Failing with error PKWebServiceErrorCodeServiceFailure.";
    v30 = buf;
LABEL_10:
    _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, v29, v30, 2u);
  }
LABEL_11:

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v21);
LABEL_20:

  }
}

- (unint64_t)webServiceTaskIdentifierForTaskIdentifier:(int64_t)a3
{
  os_unfair_lock_s *p_stateLock;
  NSMutableDictionary *webServiceTasks;
  void *v7;
  void *v8;
  unint64_t v9;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  webServiceTasks = self->_webServiceTasks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](webServiceTasks, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  os_unfair_lock_unlock(p_stateLock);
  return v9;
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[PKWebService urlSession](self, "urlSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request is nil, completing with PKWebServiceErrorCodeServiceFailure", v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v11);

    v9 = 0;
  }

  return v9;
}

- (id)urlSession
{
  NSObject *sessionQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  v11 = 0;
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__PKWebService_urlSession__block_invoke;
  v5[3] = &unk_1E2AC1FC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__PKWebService_urlSession__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTimeoutIntervalForResource:", 360.0);
    objc_msgSend(v3, "setTimeoutIntervalForRequest:", 60.0);
    +[PKWebService _sharedCookieStorage](PKWebService, "_sharedCookieStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHTTPCookieStorage:", v4);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", v6);
    objc_msgSend(v3, "set_appleIDContext:", v7);
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = v8;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)setUrlSession:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  PKWebService *v9;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PKWebService_setUrlSession___block_invoke;
  block[3] = &unk_1E2ABE0D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(sessionQueue, block);

}

void __30__PKWebService_setUrlSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
  if (v2 != v3)
  {
    objc_msgSend(v3, "finishTasksAndInvalidate");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 72), *(id *)(a1 + 32));
  }
}

- (id)_accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

+ (id)_sharedCookieStorage
{
  if (qword_1ECF22510 != -1)
    dispatch_once(&qword_1ECF22510, &__block_literal_global_93);
  return (id)_MergedGlobals_227;
}

void __36__PKWebService__sharedCookieStorage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0C99E98];
  PKSharedCacheDirectoryPath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("WebServiceCookies"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = CFHTTPCookieStorageCreateFromFile();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92C08]), "_initWithCFHTTPCookieStorage:", v3);
    v6 = (void *)_MergedGlobals_227;
    _MergedGlobals_227 = v5;

    CFRelease(v4);
  }

}

- (id)forbiddenErrorWithResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D80]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);

  v8 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 2, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_evaluateTrust:(__SecTrust *)a3
{
  BOOL v4;
  CFStringRef v5;
  NSObject *v7;
  CFErrorRef error;
  uint8_t buf[4];
  CFStringRef v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  error = 0;
  v4 = SecTrustEvaluateWithError(a3, &error);
  if (!v4)
  {
    if (error)
      v5 = CFErrorCopyDescription(error);
    else
      v5 = 0;
    PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Not trusted with error: %@.", buf, 0xCu);
    }

    if (v5)
      CFRelease(v5);
  }
  if (error)
    CFRelease(error);
  return v4 || -[PKWebService canBypassTrustValidation](self, "canBypassTrustValidation");
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  void *v7;
  os_unfair_lock_s *p_stateLock;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[NSMutableDictionary objectForKey:](self->_tasksMetadata, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_stateLock);
  objc_msgSend(v9, "responseData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    v12 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v12, "appendData:", v14);
    v13 = (id)objc_msgSend(v12, "copy");

  }
  else
  {
    v13 = v14;
  }
  objc_msgSend(v9, "setResponseData:", v13);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  os_unfair_lock_s *p_stateLock;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  PKTapToRadarRequest *v23;
  void *v24;
  id WeakRetained;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSMutableDictionary *webServiceTasks;
  void *v46;
  void *v47;
  char v48;
  char v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void (**v56)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  _QWORD v61[5];
  void (**v62)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  _QWORD v67[5];
  void (**v68)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char v73;
  _QWORD v74[5];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void (**v80)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[4];

  v94[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "taskIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[NSMutableDictionary objectForKey:](self->_webServiceTasks, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  -[NSMutableDictionary objectForKey:](self->_tasksMetadata, "objectForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_tasksMetadata, "removeObjectForKey:", v10);
  os_unfair_lock_unlock(&self->_stateLock);
  objc_msgSend(v14, "responseData");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "completion");
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v59 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v8)
      {
        v56 = v16;
        v30 = v15;
        PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "localizedDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "description");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v86 = (uint64_t)v32;
          v87 = 2114;
          v88 = (uint64_t)v33;
          _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Error %@ returned from task: %{public}@", buf, 0x16u);

          v9 = 0x1E0CB3000;
        }

        v15 = v30;
        v16 = v56;
      }
      ((void (**)(_QWORD, void *, void *, id))v16)[2](v16, v60, v15, v8);
      goto LABEL_44;
    }
    v52 = v15;
    v17 = v8;
    v18 = v15;
    -[PKWebService logResponse:withData:](self, "logResponse:withData:", v18, v60);
    objc_msgSend(v7, "currentRequest");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "statusCode");
    +[PKWebService _sharedCookieStorage](PKWebService, "_sharedCookieStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_saveCookies");

    v21 = v18;
    objc_msgSend(v18, "allHeaderFields");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("X-Wallet-TapToRadar-Request"));
    v54 = v18;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v86 = (uint64_t)v58;
        _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Server requested a Tap-To-Radar prompt with reason: \"%@\", buf, 0xCu);
      }

      v23 = objc_alloc_init(PKTapToRadarRequest);
      -[PKTapToRadarRequest setReason:](v23, "setReason:", v58);
      -[PKTapToRadarRequest setServerGenerated:](v23, "setServerGenerated:", 1);
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("X-Wallet-TapToRadar-Request-RelatedRadar"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        -[PKTapToRadarRequest setRelatedRadar:](v23, "setRelatedRadar:", v24);
      WeakRetained = objc_loadWeakRetained((id *)&self->_tapToRadarDelegate);
      objc_msgSend(WeakRetained, "displayTapToRadarAlertForRequest:completion:", v23, 0);

      v21 = v54;
    }
    v50 = objc_msgSend(v14, "retries");
    v49 = objc_msgSend(v14, "authHandling");
    v48 = objc_msgSend(v14, "cacheResponse");
    objc_msgSend(v14, "originalBody");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == 504)
    {
      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      v8 = v17;
      v26 = v53;
      if (v50)
      {
        p_stateLock = &self->_stateLock;
        if (v35)
        {
          *(_DWORD *)buf = 134218240;
          v86 = 504;
          v87 = 2048;
          v88 = v50;
          _os_log_impl(&dword_18FC92000, v34, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error %ld (%tu retries remaining).", buf, 0x16u);
        }

        v36 = (void *)objc_msgSend(v53, "mutableCopy");
        objc_msgSend(v36, "setHTTPBody:", v55);
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_234;
        v61[3] = &unk_1E2ACC100;
        v61[4] = self;
        v63 = v59;
        v64 = v50;
        v65 = v49;
        v66 = v48;
        v62 = v16;
        -[PKWebService processRetryRequest:responseData:orginalRequest:completion:](self, "processRetryRequest:responseData:orginalRequest:completion:", v36, v60, v53, v61);

        v15 = v52;
        v21 = v54;
        goto LABEL_43;
      }
      p_stateLock = &self->_stateLock;
      if (v35)
      {
        *(_DWORD *)buf = 134217984;
        v86 = 504;
        _os_log_impl(&dword_18FC92000, v34, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error %ld (giving up).", buf, 0xCu);
      }

    }
    else
    {
      v8 = v17;
      v26 = v53;
      if (v19 == 503)
      {
        objc_msgSend(v21, "allHeaderFields");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Retry-After"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        p_stateLock = &self->_stateLock;
        v47 = v38;
        if (!v38)
          goto LABEL_33;
        v39 = PKRetryAfterSecondsFromNow(v38);
        PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218754;
          v86 = 503;
          v87 = 2112;
          v88 = (uint64_t)v47;
          v89 = 2048;
          v90 = v50;
          v91 = 2048;
          v92 = v39;
          _os_log_impl(&dword_18FC92000, v40, OS_LOG_TYPE_DEFAULT, "Received %ld (Retry-After: %@) (%tu retries remaining) (retry-after in %lu seconds).", buf, 0x2Au);
        }

        if (v39)
        {
          v41 = (void *)objc_msgSend(v53, "mutableCopy");
          objc_msgSend(v41, "setHTTPBody:", v55);
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_233;
          v67[3] = &unk_1E2ACC178;
          v67[4] = self;
          v69 = v39;
          v70 = v59;
          v71 = v50;
          v72 = v49;
          v73 = v48;
          v68 = v16;
          -[PKWebService processRetryRequest:responseData:orginalRequest:completion:](self, "processRetryRequest:responseData:orginalRequest:completion:", v41, v60, v53, v67);

          v15 = v52;
          v21 = v54;
        }
        else
        {
LABEL_33:
          PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v86 = 503;
            _os_log_impl(&dword_18FC92000, v42, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error %ld without retry-after; failing.",
              buf,
              0xCu);
          }

          v21 = v54;
          -[PKWebService handleResponse:withError:data:task:completionHandler:](self, "handleResponse:withError:data:task:completionHandler:", v54, v8, v60, v7, v16);
          v15 = v52;
        }
        v28 = v47;
        goto LABEL_37;
      }
      p_stateLock = &self->_stateLock;
      if (v19 == 401)
      {
        PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
        v27 = objc_claimAutoreleasedReturnValue();
        v15 = v52;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Received Status Code 401.", buf, 2u);
        }

        if (!objc_msgSend(v14, "authHandling"))
        {
          v93 = *MEMORY[0x1E0CB2D50];
          PKLocalizedPaymentString(CFSTR("AUTH_ERROR"), 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v94[0] = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 1, v51);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v54;
          ((void (**)(_QWORD, void *, void *, void *))v16)[2](v16, v60, v54, v44);

          v26 = v53;
          goto LABEL_43;
        }
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke;
        v74[3] = &unk_1E2ACC128;
        v81 = v50;
        v74[4] = self;
        v75 = v53;
        v76 = v14;
        v77 = v60;
        v82 = v59;
        v83 = v49;
        v84 = v48;
        v80 = v16;
        v21 = v54;
        v78 = v54;
        v79 = v8;
        -[PKWebService handleAuthenticationFailureWithCompletionHandler:](self, "handleAuthenticationFailureWithCompletionHandler:", v74);

        v28 = v75;
LABEL_37:

LABEL_43:
        v9 = 0x1E0CB3000uLL;
LABEL_44:
        os_unfair_lock_lock(p_stateLock);
        webServiceTasks = self->_webServiceTasks;
        objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v7, "taskIdentifier"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](webServiceTasks, "removeObjectForKey:", v46);

        os_unfair_lock_unlock(p_stateLock);
        -[PKWebService _cleanUpDiagnosticReasonsForTaskID:](self, "_cleanUpDiagnosticReasonsForTaskID:", v59);
        goto LABEL_45;
      }
    }
    -[PKWebService handleResponse:withError:data:task:completionHandler:](self, "handleResponse:withError:data:task:completionHandler:", v21, v8, v60, v7, v16);
    v15 = v52;
    goto LABEL_43;
  }
  PKLogFacilityTypeGetObject(0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v86 = (uint64_t)v7;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "No completion for task %@", buf, 0xCu);
  }

LABEL_45:
}

void __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  int8x16_t v22;
  __int16 v23;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 == 2)
  {
LABEL_11:
    PKLogFacilityTypeGetObject(objc_msgSend(*(id *)(a1 + 32), "logFacilityType"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Credential Renewal Failed.", buf, 2u);
    }

    goto LABEL_14;
  }
  if (a2 == 1)
  {
    PKLogFacilityTypeGetObject(objc_msgSend(*(id *)(a1 + 32), "logFacilityType"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Credential Renewal Rejected by User.", buf, 2u);
    }

    goto LABEL_11;
  }
  if (a2)
  {
LABEL_14:
    v25 = *MEMORY[0x1E0CB2D50];
    PKLocalizedPaymentString(CFSTR("AUTH_ERROR"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKWebServiceErrorDomain"), 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

    goto LABEL_15;
  }
  v6 = *(_QWORD *)(a1 + 88);
  PKLogFacilityTypeGetObject(objc_msgSend(*(id *)(a1 + 32), "logFacilityType"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Credential Renewal succeeded, retrying request.", buf, 2u);
    }

    v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v5, "authorizationHeader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, CFSTR("Authorization"));

    objc_msgSend(*(id *)(a1 + 48), "originalBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHTTPBody:", v11);

    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_228;
    v20[3] = &unk_1E2ACC100;
    v20[4] = v13;
    v22 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
    v23 = *(_WORD *)(a1 + 104);
    v21 = *(id *)(a1 + 80);
    objc_msgSend(v13, "processRetryRequest:responseData:orginalRequest:completion:", v9, v12, v14, v20);

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Exceeded maximum retries (giving up).", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
LABEL_15:

}

uint64_t __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_228(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) - 1, *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 40));
}

void __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_233(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  __int128 v11;
  __int16 v12;

  v3 = a2;
  v4 = dispatch_time(0, 1000000000 * *(_QWORD *)(a1 + 48));
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_2;
  v8[3] = &unk_1E2ACC150;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v11 = *(_OWORD *)(a1 + 56);
  v12 = *(_WORD *)(a1 + 72);
  v10 = v6;
  v7 = v3;
  dispatch_after(v4, v5, v8);

}

uint64_t __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64) - 1, *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 48));
}

uint64_t __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_234(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performRequest:taskIdentifier:retries:authHandling:cacheResponse:completionHandler:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) - 1, *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 40));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  void *v9;
  void (**v10)(id, _QWORD);
  id v11;
  os_unfair_lock_s *p_stateLock;
  void *v13;
  id v14;
  id v15;

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = (void (**)(id, _QWORD))a6;
  v11 = a5;
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[NSMutableDictionary objectForKey:](self->_tasksMetadata, "objectForKey:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_stateLock);
  if (objc_msgSend(v13, "cacheResponse"))
    v14 = v11;
  else
    v14 = 0;
  ((void (**)(id, id))v10)[2](v10, v14);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  _QWORD aBlock[4];
  id v46;
  id v47;
  id v48;
  PKWebService *v49;
  id v50;
  uint8_t buf[16];

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD))a7;
  -[PKWebService logResponse:withData:](self, "logResponse:withData:", v12, 0);
  PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Performing redirection…", buf, 2u);
  }

  objc_msgSend(v11, "originalRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scheme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v18;
  if (objc_msgSend(v19, "isEqual:", CFSTR("https")))
  {
    objc_msgSend(v18, "scheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
    {
      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v40, OS_LOG_TYPE_DEFAULT, "ERROR: https request redirects to non https URL.", buf, 2u);
      }

      goto LABEL_10;
    }
  }
  v22 = objc_msgSend(v13, "mutableCopy");
  if (!v22)
  {
LABEL_10:
    v14[2](v14, 0);
    goto LABEL_11;
  }
  v23 = (void *)v22;
  objc_msgSend(v11, "originalRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "HTTPMethod");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHTTPMethod:", v25);

  objc_msgSend(v24, "valueForHTTPHeaderField:", CFSTR("Authorization"));
  v43 = v11;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:forHTTPHeaderField:", v26, CFSTR("Authorization"));

  objc_msgSend(v24, "HTTPBody");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHTTPBody:", v27);

  objc_msgSend(MEMORY[0x1E0C92C78], "propertyForKey:inRequest:", CFSTR("overlayRequest"), v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CB3710];
  v41 = v17;
  v30 = v12;
  v31 = objc_opt_class();
  objc_msgSend(v28, "data");
  v42 = v13;
  v32 = v14;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "unarchivedObjectOfClass:fromData:error:", v31, v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PKWebService_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E2ACC1C8;
  v35 = v30;
  v46 = v35;
  v47 = v34;
  v48 = v23;
  v49 = self;
  v50 = v32;
  v36 = v23;
  v37 = v34;
  v38 = _Block_copy(aBlock);
  v39 = v35;
  v12 = v30;
  v17 = v41;
  -[PKWebService handleWillPerformHTTPRedirectionWithResponse:originalRequest:redirectHandler:](self, "handleWillPerformHTTPRedirectionWithResponse:originalRequest:redirectHandler:", v39, v24, v38);

  v14 = (void (**)(id, _QWORD))v32;
  v13 = v42;

  v11 = v43;
LABEL_11:

}

void __88__PKWebService_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  uint64_t v15;
  id v16;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pk_valueForHTTPHeaderField:", CFSTR("X-Redirect-Encrypted-Data"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    if (!v4 || (objc_msgSend(v4, "requiresConfigurationForRedirect") ? (v5 = v3 == 0) : (v5 = 1), v5))
    {
      objc_msgSend(*(id *)(a1 + 56), "logRequest:", *(_QWORD *)(a1 + 48));
      v6 = *(_QWORD *)(a1 + 64);
      v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    else
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
      v9 = (void *)v8;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = *(void **)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 48);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __88__PKWebService_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
        v14[3] = &unk_1E2ACC1A0;
        v13 = *(void **)(a1 + 64);
        v15 = *(_QWORD *)(a1 + 56);
        v16 = v13;
        objc_msgSend(v11, "_updateRequestForRedirect:overrides:webService:withCompletion:", v12, v10, v15, v14);

      }
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __88__PKWebService_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "logRequest:", v4);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (id)objc_msgSend(v4, "copy");

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "currentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Task is waiting for connectivity URL: %@", (uint8_t *)&v10, 0xCu);

  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PKWebService urlSession](self, "urlSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[PKWebService setUrlSession:](self, "setUrlSession:", 0);
  PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Session did become invalid. Identifier: %@", (uint8_t *)&v10, 0xCu);

  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  _QWORD *v11;

  v11 = a5;
  objc_msgSend(a4, "protectionSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticationMethod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C92B70]))
  {
    v10 = (void (*)(void))v11[2];
LABEL_6:
    v10();
    goto LABEL_7;
  }
  if (!-[PKWebService _evaluateTrust:](self, "_evaluateTrust:", objc_msgSend(v7, "serverTrust")))
  {
    v10 = (void (*)(void))v11[2];
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C92C60], "credentialForTrust:", objc_msgSend(v7, "serverTrust"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(_QWORD *, _QWORD, void *))v11[2])(v11, 0, v9);

LABEL_7:
}

- (NSString)webServiceSessionMarker
{
  os_unfair_lock_s *p_stateLock;
  void *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (void *)-[NSString copy](self->_webServiceSessionMarker, "copy");
  os_unfair_lock_unlock(p_stateLock);
  return (NSString *)v4;
}

- (id)_urlRequestTaggedWithWebServiceSessionMarkerHeader:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[PKWebService webServiceSessionMarker](self, "webServiceSessionMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, CFSTR("X-Apple-Web-Service-Session"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (id)urlRequestTaggedWithUniqueRequestIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  PKRequestIDHeaderValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v4, CFSTR("x-request-id"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)_urlRequestWithCustomHeaders:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  PKGetCustomHeaders();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PKWebService__urlRequestWithCustomHeaders___block_invoke;
  v8[3] = &unk_1E2AC28C8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

uint64_t __45__PKWebService__urlRequestWithCustomHeaders___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)diagnosticSessionWithReason:(id)a3 sessionHandler:(id)a4
{
  void (**v6)(id, PKWebService *);
  id v7;

  if (a4)
  {
    v6 = (void (**)(id, PKWebService *))a4;
    v7 = a3;
    -[PKWebService addDiagnosticReason:](self, "addDiagnosticReason:", v7);
    v6[2](v6, self);

    -[PKWebService removeDiagnosticReason:](self, "removeDiagnosticReason:", v7);
  }
}

- (void)addDiagnosticReason:(id)a3
{
  id v4;
  NSObject *diagnosticReasonsQueue;
  id v6;
  _QWORD block[4];
  id v8;
  PKWebService *v9;

  v4 = a3;
  diagnosticReasonsQueue = self->_diagnosticReasonsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PKWebService_addDiagnosticReason___block_invoke;
  block[3] = &unk_1E2ABE0D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(diagnosticReasonsQueue, block);

}

void __36__PKWebService_addDiagnosticReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    v4 = (id)objc_msgSend(v2, "copy");
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)removeDiagnosticReason:(id)a3
{
  id v4;
  NSObject *diagnosticReasonsQueue;
  id v6;
  _QWORD block[4];
  id v8;
  PKWebService *v9;

  v4 = a3;
  diagnosticReasonsQueue = self->_diagnosticReasonsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PKWebService_removeDiagnosticReason___block_invoke;
  block[3] = &unk_1E2ABE0D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(diagnosticReasonsQueue, block);

}

uint64_t __39__PKWebService_removeDiagnosticReason___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 64), "removeObject:");
  return result;
}

- (void)_associateDiagnosticReasonsWithTaskID:(unint64_t)a3
{
  NSObject *diagnosticReasonsQueue;
  os_unfair_lock_s *p_stateLock;
  NSMutableDictionary *diagnosticReasonsByTaskID;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  v16 = 0;
  diagnosticReasonsQueue = self->_diagnosticReasonsQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__PKWebService__associateDiagnosticReasonsWithTaskID___block_invoke;
  v10[3] = &unk_1E2AC1F78;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(diagnosticReasonsQueue, v10);
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  diagnosticReasonsByTaskID = self->_diagnosticReasonsByTaskID;
  v8 = v12[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](diagnosticReasonsByTaskID, "setObject:forKey:", v8, v9);

  os_unfair_lock_unlock(p_stateLock);
  _Block_object_dispose(&v11, 8);

}

void __54__PKWebService__associateDiagnosticReasonsWithTaskID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_cleanUpDiagnosticReasonsForTaskID:(unint64_t)a3
{
  os_unfair_lock_s *p_stateLock;
  NSMutableDictionary *diagnosticReasonsByTaskID;
  void *v7;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  diagnosticReasonsByTaskID = self->_diagnosticReasonsByTaskID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](diagnosticReasonsByTaskID, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_stateLock);
}

- (id)_urlRequestTaggedWithDiagnosticReasonHeader:(id)a3 forTaskID:(unint64_t)a4
{
  id v6;
  os_unfair_lock_s *p_stateLock;
  NSMutableDictionary *diagnosticReasonsByTaskID;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  diagnosticReasonsByTaskID = self->_diagnosticReasonsByTaskID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](diagnosticReasonsByTaskID, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  os_unfair_lock_unlock(p_stateLock);
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("X-Apple-Diagnostic-Reasons"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v11, "addObject:", v12);
    v13 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v14, CFSTR("X-Apple-Diagnostic-Reasons"));
    v15 = (id)objc_msgSend(v13, "copy");

  }
  else
  {
    v15 = v6;
  }

  return v15;
}

- (int64_t)logFacilityType
{
  return 2;
}

- (void)logRequest:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKWebServiceLoggableRequestBody *v11;
  PKWebServiceLoggableHeaders *v12;
  void *v13;
  PKWebServiceLoggableHeaders *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  PKWebServiceLoggableHeaders *v37;
  __int16 v38;
  PKWebServiceLoggableRequestBody *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    if (v4)
    {
      v7 = (void *)MEMORY[0x19400CFE8]();
      objc_msgSend(v4, "HTTPBody");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      PKTimeProfileBegin(0, v10);
      v11 = -[PKWebServiceLoggableRequestBody initWithBody:sensitiveKeys:]([PKWebServiceLoggableRequestBody alloc], "initWithBody:sensitiveKeys:", v8, self->_sensitiveKeys);
      v12 = [PKWebServiceLoggableHeaders alloc];
      objc_msgSend(v4, "allHTTPHeaderFields");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKWebServiceLoggableHeaders initWithHeaders:](v12, "initWithHeaders:", v13);

      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "HTTPMethod");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v33 = v16;
        v34 = 2112;
        v35 = v10;
        v36 = 2112;
        v37 = v14;
        v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Performing request:\n%@ %@\n%@\n\n%@\n", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0C92C78], "propertyForKey:inRequest:", CFSTR("encryptedCardDataKeys"), v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v25 = v8;
        v26 = v7;
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendString:", CFSTR("Encrypted Card Data Keys: "));
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v19 = v17;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v28 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(v18, "appendFormat:", CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v21);
        }

        v8 = v25;
        v7 = v26;
      }

      objc_autoreleasePoolPop(v7);
    }
    else
    {
      PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Request is nil", buf, 2u);
      }

    }
  }

}

- (void)logResponse:(id)a3 withData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  PKWebServiceLoggableRequestBody *v13;
  PKWebServiceLoggableHeaders *v14;
  void *v15;
  PKWebServiceLoggableHeaders *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  PKWebServiceLoggableHeaders *v25;
  __int16 v26;
  PKWebServiceLoggableRequestBody *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    objc_msgSend(v6, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PKTimeProfileEnd(0, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKWebServiceLoggableRequestBody initWithBody:sensitiveKeys:]([PKWebServiceLoggableRequestBody alloc], "initWithBody:sensitiveKeys:", v7, self->_sensitiveKeys);
    v14 = [PKWebServiceLoggableHeaders alloc];
    objc_msgSend(v6, "allHeaderFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKWebServiceLoggableHeaders initWithHeaders:](v14, "initWithHeaders:", v15);

    PKLogFacilityTypeGetObject(-[PKWebService logFacilityType](self, "logFacilityType"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138413314;
      v19 = v11;
      v20 = 2048;
      v21 = objc_msgSend(v6, "statusCode");
      v22 = 2114;
      v23 = v12;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Response:\n%@ %ld %{public}@\n%@\n\n%@\n", (uint8_t *)&v18, 0x34u);
    }

  }
}

- (PKTapToRadarDelegate)tapToRadarDelegate
{
  return (PKTapToRadarDelegate *)objc_loadWeakRetained((id *)&self->_tapToRadarDelegate);
}

- (void)setTapToRadarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_tapToRadarDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapToRadarDelegate);
  objc_storeStrong((id *)&self->_sensitiveKeys, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticReasonsQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_diagnosticReasons, 0);
  objc_storeStrong((id *)&self->_tasksMetadata, 0);
  objc_storeStrong((id *)&self->_diagnosticReasonsByTaskID, 0);
  objc_storeStrong((id *)&self->_webServiceTasks, 0);
  objc_storeStrong((id *)&self->_delegateOperationQueue, 0);
  objc_storeStrong((id *)&self->_webServiceSessionMarker, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
