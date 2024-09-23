@implementation PKPeerPaymentController

- (PKPeerPaymentController)init
{

  return 0;
}

- (PKPeerPaymentController)initWithPeerPaymentWebService:(id)a3
{
  return -[PKPeerPaymentController initWithPeerPaymentWebService:queue:](self, "initWithPeerPaymentWebService:queue:", a3, 0);
}

- (PKPeerPaymentController)initWithPeerPaymentWebService:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  PKPeerPaymentController *v10;
  NSObject *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v14;
  id v15;
  PKPeerPaymentControllerInternalState *v16;
  PKPeerPaymentControllerInternalState *is;
  void *v18;
  void *v19;
  uint64_t v20;
  PKPeerPaymentAccount *account;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PKPaymentPass *peerPaymentPass;
  PKMockPeerPaymentController *v27;
  PKPeerPaymentController *p_super;
  objc_super v30;
  uint8_t buf[4];
  PKPeerPaymentController *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (PKUseMockSURFServer() && (v9 = objc_opt_class(), v9 == objc_opt_class()))
  {
    v27 = -[PKMockPeerPaymentController initWithPeerPaymentWebService:]([PKMockPeerPaymentController alloc], "initWithPeerPaymentWebService:", v7);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PKPeerPaymentController;
    v10 = -[PKPeerPaymentController init](&v30, sel_init);
    if (v10)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v32 = v10;
        v33 = 2112;
        v34 = v7;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: %p initWithPeerPaymentWebService: %@", buf, 0x16u);
      }

      if (v8)
      {
        v12 = (OS_dispatch_queue *)v8;
        queue = v10->_queue;
        v10->_queue = v12;
      }
      else
      {
        v14 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
        v15 = MEMORY[0x1E0C80D38];
        queue = v10->_queue;
        v10->_queue = v14;
      }

      v16 = objc_alloc_init(PKPeerPaymentControllerInternalState);
      is = v10->_is;
      v10->_is = v16;

      objc_storeStrong((id *)&v10->_webService, a3);
      v10->_is->state = 1;
      v10->_is->mode = 0;
      -[PKPeerPaymentWebService peerPaymentService](v10->_webService, "peerPaymentService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel__handleAccountChanged_, CFSTR("PKPeerPaymentServiceAccountChangedNotification"), v18);

      objc_msgSend(v18, "account");
      v20 = objc_claimAutoreleasedReturnValue();
      account = v10->_account;
      v10->_account = (PKPeerPaymentAccount *)v20;

      +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentAccount associatedPassUniqueID](v10->_account, "associatedPassUniqueID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "passWithUniqueID:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "paymentPass");
      v25 = objc_claimAutoreleasedReturnValue();
      peerPaymentPass = v10->_peerPaymentPass;
      v10->_peerPaymentPass = (PKPaymentPass *)v25;

      v10->_is->supportsPreserveCurrentBalance = -[PKPeerPaymentAccount supportsPreserveCurrentBalance](v10->_account, "supportsPreserveCurrentBalance");
    }
    v27 = v10;
    self = &v27->super;
  }
  p_super = &v27->super;

  return p_super;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentController;
  -[PKPeerPaymentController dealloc](&v4, sel_dealloc);
}

- (void)_setState:(unint64_t)a3 notify:(BOOL)a4
{
  unint64_t state;
  _BOOL4 v5;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  PKPeerPaymentController *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  state = self->_is->state;
  if (state != a3)
  {
    v5 = a4;
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (state - 1 > 6)
        v9 = CFSTR("Unknown");
      else
        v9 = off_1E2ACD7A8[state - 1];
      if (a3 - 1 > 6)
        v10 = CFSTR("Unknown");
      else
        v10 = off_1E2ACD7A8[a3 - 1];
      v11 = CFSTR("NO");
      v13 = 134218754;
      v14 = self;
      if (v5)
        v11 = CFSTR("YES");
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Changed state. From %{public}@ -> %{public}@. (shouldNotify: %{public}@)", (uint8_t *)&v13, 0x2Au);
    }

    self->_is->state = a3;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:", PKPeerPaymentControllerStateDidChangeNotification, self);

    }
  }
}

- (BOOL)_ensureState:(unint64_t)a3
{
  unint64_t state;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  state = self->_is->state;
  if (state != a3)
  {
    if (a3 - 1 > 6)
      v5 = CFSTR("Unknown");
    else
      v5 = off_1E2ACD7A8[a3 - 1];
    if (state - 1 > 6)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E2ACD7A8[state - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPeerPaymentController: Error: Invalid state detected. (Expected: %@, Actual: %@)"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v7);
  }
  return state == a3;
}

- (void)reset
{
  NSObject *v3;
  int v4;
  PKPeerPaymentController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Reset called.", (uint8_t *)&v4, 0xCu);
  }

  -[PKPeerPaymentController _resetToState:](self, "_resetToState:", 1);
}

- (void)_resetToState:(unint64_t)a3
{
  PKPeerPaymentControllerInternalState *is;
  PKPeerPaymentRecipient *recipient;
  PKPeerPaymentControllerInternalState *v7;
  NSString *recipientPhoneOrEmail;
  PKPeerPaymentControllerInternalState *v9;
  NSString *recipientDisplayName;
  PKPeerPaymentControllerInternalState *v11;
  NSString *accountNumber;
  PKPeerPaymentControllerInternalState *v13;
  NSString *routingNumber;
  PKPeerPaymentControllerInternalState *v15;
  NSString *accountName;
  PKPeerPaymentControllerInternalState *v17;
  PKPeerPaymentQuoteCertificatesResponse *quoteCertificatesResponse;
  PKPeerPaymentRequestToken *requestToken;
  PKPeerPaymentQuote *quote;
  PKPeerPaymentControllerInternalState *v21;
  PKPeerPaymentQuoteRequest *quoteRequest;
  PKPeerPaymentControllerInternalState *v23;
  NSString *recurringPaymentIdentifier;
  PKPeerPaymentControllerInternalState *v25;
  NSDate *startDate;
  PKPeerPaymentControllerInternalState *v27;
  NSDecimalNumber *threshold;
  NSError *quoteAuthorizationError;
  PKPaymentAuthorizationCoordinator *quoteAuthorizationCoordinator;
  PKPeerPaymentPerformResponse *performQuoteResponse;
  NSError *performQuoteError;

  is = self->_is;
  if (is->state != a3)
  {
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
        recipient = is->recipient;
        is->recipient = 0;

        v7 = self->_is;
        recipientPhoneOrEmail = v7->recipientPhoneOrEmail;
        v7->recipientPhoneOrEmail = 0;

        v9 = self->_is;
        recipientDisplayName = v9->recipientDisplayName;
        v9->recipientDisplayName = 0;

        v11 = self->_is;
        accountNumber = v11->accountNumber;
        v11->accountNumber = 0;

        v13 = self->_is;
        routingNumber = v13->routingNumber;
        v13->routingNumber = 0;

        v15 = self->_is;
        accountName = v15->accountName;
        v15->accountName = 0;

        v17 = self->_is;
        quoteCertificatesResponse = v17->quoteCertificatesResponse;
        v17->quoteCertificatesResponse = 0;

        is = self->_is;
        goto LABEL_4;
      case 2uLL:
LABEL_4:
        is->mode = 0;
        is = self->_is;
        goto LABEL_5;
      case 3uLL:
        goto LABEL_6;
      case 4uLL:
        goto LABEL_7;
      case 5uLL:
        goto LABEL_8;
      case 6uLL:
LABEL_5:
        requestToken = is->requestToken;
        is->requestToken = 0;

        is = self->_is;
LABEL_6:
        quote = is->quote;
        is->quote = 0;

        v21 = self->_is;
        quoteRequest = v21->quoteRequest;
        v21->quoteRequest = 0;

        v23 = self->_is;
        recurringPaymentIdentifier = v23->recurringPaymentIdentifier;
        v23->recurringPaymentIdentifier = 0;

        v25 = self->_is;
        startDate = v25->startDate;
        v25->startDate = 0;

        self->_is->frequency = 0;
        v27 = self->_is;
        threshold = v27->threshold;
        v27->threshold = 0;

LABEL_7:
        self->_quoteAuthorizationSuccess = 0;
        quoteAuthorizationError = self->_quoteAuthorizationError;
        self->_quoteAuthorizationError = 0;

        -[PKPaymentAuthorizationCoordinator dismissWithCompletion:](self->_quoteAuthorizationCoordinator, "dismissWithCompletion:", 0);
        quoteAuthorizationCoordinator = self->_quoteAuthorizationCoordinator;
        self->_quoteAuthorizationCoordinator = 0;

        self->_performOnAuthorization = 0;
        is = self->_is;
LABEL_8:
        performQuoteResponse = is->performQuoteResponse;
        is->performQuoteResponse = 0;

        self->_performQuoteSuccess = 0;
        performQuoteError = self->_performQuoteError;
        self->_performQuoteError = 0;

        break;
      default:
        break;
    }
    -[PKPeerPaymentController _setState:notify:](self, "_setState:notify:", a3, 1);
  }
}

- (id)externalizedControllerState
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_is, 1, 0);
}

- (BOOL)restoreStateWithExternalizedControllerState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  PKPeerPaymentControllerInternalState *v8;
  NSObject *v9;
  PKPeerPaymentControllerInternalState *is;
  PKPeerPaymentControllerInternalState *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  PKPeerPaymentController *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_13;
  v19 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, &v19);
  v6 = v19;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      v16 = objc_opt_class();
      v17 = *MEMORY[0x1E0CB2CD0];
      v18 = 0;
      objc_msgSend(v5, "decodeTopLevelObjectOfClass:forKey:error:", v16, v17, &v18);
      v8 = (PKPeerPaymentControllerInternalState *)objc_claimAutoreleasedReturnValue();
      v7 = v18;
      objc_msgSend(v5, "finishDecoding");
      if (!v7)
        goto LABEL_9;
      goto LABEL_6;
    }
    objc_msgSend(v5, "finishDecoding");
  }
  v8 = 0;
LABEL_6:
  PKLogFacilityTypeGetObject(0xBuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v21 = self;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Failed to init unarchiver with peer payment controller state data: %@ %@.", buf, 0x20u);
  }

LABEL_9:
  if (!v8)
  {
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  -[PKPeerPaymentController reset](self, "reset");
  is = self->_is;
  self->_is = v8;
  v11 = v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", PKPeerPaymentControllerStateDidChangeNotification, self);

  PKLogFacilityTypeGetObject(0xBuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = self;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Successfully restored controller state.", buf, 0xCu);
  }

  v14 = 1;
LABEL_14:

  return v14;
}

- (unint64_t)state
{
  return self->_is->state;
}

- (unint64_t)mode
{
  return self->_is->mode;
}

- (NSString)senderPhoneOrEmail
{
  return self->_is->senderPhoneOrEmail;
}

- (NSString)recipientPhoneOrEmail
{
  return self->_is->recipientPhoneOrEmail;
}

- (PKPeerPaymentRecipient)recipient
{
  return self->_is->recipient;
}

- (NSString)recipientDisplayName
{
  PKPeerPaymentControllerInternalState *is;
  NSString *recipientDisplayName;
  void *v5;
  uint64_t v6;
  PKPeerPaymentControllerInternalState *v7;
  NSString *v8;

  is = self->_is;
  recipientDisplayName = is->recipientDisplayName;
  if (!recipientDisplayName)
  {
    if (is->recipientPhoneOrEmail)
    {
      -[PKPeerPaymentController displayNameForRecipientAddress:](self, "displayNameForRecipientAddress:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "copy");
      v7 = self->_is;
      v8 = v7->recipientDisplayName;
      v7->recipientDisplayName = (NSString *)v6;

      recipientDisplayName = self->_is->recipientDisplayName;
    }
    else
    {
      recipientDisplayName = 0;
    }
  }
  return recipientDisplayName;
}

- (PKPeerPaymentRequestToken)requestToken
{
  return self->_is->requestToken;
}

- (PKPeerPaymentQuote)quote
{
  return self->_is->quote;
}

- (PKPeerPaymentPerformResponse)performQuoteResponse
{
  return self->_is->performQuoteResponse;
}

- (void)identifyRecipientWithAddress:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  PKPeerPaymentController *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  PKPeerPaymentController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject(0xBuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v19 = self;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: identifyRecipientWithAddress: %@ senderAddress: %@ called.", buf, 0x20u);
  }

  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 1))
  {
    if (v8)
    {
      dispatch_get_global_queue(2, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __81__PKPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke;
      v13[3] = &unk_1E2ABE1E8;
      v14 = v8;
      v15 = self;
      v16 = v9;
      v17 = v10;
      dispatch_async(v12, v13);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v10 + 2))(v10, 2, 0, 0);
    }
  }

}

void __81__PKPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[PKPeerPaymentRecipientCache sharedCache](PKPeerPaymentRecipientCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipientForRecipientAddress:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(0xBuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v30 = v6;
      v31 = 2112;
      v32 = v3;
      v33 = 2112;
      v34 = v7;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Found a cached recipient: %@ for address: %@.", buf, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
    v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

    v11 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setPhoneOrEmail:", *(_QWORD *)(a1 + 32));
    v14 = *(_QWORD **)(a1 + 40);
    v15 = *(void **)(v14[1] + 40);
    objc_msgSend(v14, "recipientDisplayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDisplayName:", v16);

    v17 = *(_QWORD **)(a1 + 40);
    if (*(_QWORD *)(v17[1] + 8) == 1)
      objc_msgSend(v17, "_setState:notify:", 2, 1);
    v18 = *(_QWORD *)(a1 + 56);
    if (v18)
      (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v18 + 16))(v18, objc_msgSend(v3, "status"), v3, 0);
  }
  else
  {
    if (v5)
    {
      v20 = *(void **)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Failed to find a cached recipient for address: %@. Attempting remote lookup request.", buf, 0x16u);
    }

    v22 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    v23 = *(void **)(v21 + 128);
    v24 = *(_QWORD *)(a1 + 48);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __81__PKPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke_42;
    v25[3] = &unk_1E2ACD498;
    v25[4] = v21;
    v26 = v22;
    v27 = *(id *)(a1 + 48);
    v28 = *(id *)(a1 + 56);
    objc_msgSend(v23, "peerPaymentRecipientForRecipientAddress:senderAddress:source:completion:", v26, v24, 1, v25);

  }
}

void __81__PKPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0xBuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 || !v6)
  {
    if (v8)
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(a1 + 40);
      v27 = 134218498;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Remote recipient lookup failed for address: %@ with error: %@.", (uint8_t *)&v27, 0x20u);
    }

    v25 = *(_QWORD *)(a1 + 56);
    if (v25)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v25 + 16))(v25, 0, 0, v26);

    }
  }
  else
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      v27 = 134218498;
      v28 = v9;
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Remote recipient lookup succeeded with recipient: %@ for address: %@.", (uint8_t *)&v27, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
    v11 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = v11;

    v14 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 24);
    *(_QWORD *)(v15 + 24) = v14;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPhoneOrEmail:", *(_QWORD *)(a1 + 40));
    v17 = *(_QWORD **)(a1 + 32);
    v18 = *(void **)(v17[1] + 40);
    objc_msgSend(v17, "recipientDisplayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDisplayName:", v19);

    +[PKPeerPaymentRecipientCache sharedCache](PKPeerPaymentRecipientCache, "sharedCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cacheRecipient:forRecipientAddress:", v6, *(_QWORD *)(a1 + 40));

    v21 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)(v21[1] + 8) == 1)
      objc_msgSend(v21, "_setState:notify:", 2, 1);
    v22 = *(_QWORD *)(a1 + 56);
    if (v22)
      (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v22 + 16))(v22, objc_msgSend(v6, "status"), v6, 0);
  }

}

- (void)_refreshRecipientWithCompletion:(id)a3
{
  id v4;
  NSString *recipientPhoneOrEmail;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  PKPeerPaymentWebService *webService;
  PKPeerPaymentControllerInternalState *is;
  NSString *v11;
  NSString *senderPhoneOrEmail;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  PKPeerPaymentController *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  recipientPhoneOrEmail = self->_is->recipientPhoneOrEmail;
  PKLogFacilityTypeGetObject(0xBuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (recipientPhoneOrEmail)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218242;
      v17 = self;
      v18 = 2112;
      v19 = recipientPhoneOrEmail;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Refreshing recipient %@.", buf, 0x16u);
    }

    +[PKPeerPaymentRecipientCache sharedCache](PKPeerPaymentRecipientCache, "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "purgeRecipientWithRecipientAddress:", self->_is->recipientPhoneOrEmail);

    webService = self->_webService;
    is = self->_is;
    senderPhoneOrEmail = is->senderPhoneOrEmail;
    v11 = is->recipientPhoneOrEmail;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__PKPeerPaymentController__refreshRecipientWithCompletion___block_invoke;
    v14[3] = &unk_1E2ACD4C0;
    v14[4] = self;
    v15 = v4;
    -[PKPeerPaymentWebService peerPaymentRecipientForRecipientAddress:senderAddress:source:completion:](webService, "peerPaymentRecipientForRecipientAddress:senderAddress:source:completion:", v11, senderPhoneOrEmail, 1, v14);

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Asked to refresh a nil recipientPhoneOrEmail. Refusing.", buf, 0xCu);
    }

    if (v4)
    {
      -[PKPeerPaymentController displayableErrorForError:](self, "displayableErrorForError:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v13);

    }
  }

}

void __59__PKPeerPaymentController__refreshRecipientWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0xBuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 || !v6)
  {
    if (v8)
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(*(_QWORD *)(v19 + 8) + 32);
      *(_DWORD *)buf = 134218498;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v5;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Remote recipient lookup failed for address: %@ with error: %@. Recipient is no longer valid. Notifying and returning shouldContinue NO.", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:", PKPeerPaymentControllerRecipientDidBecomeInvalidNotification, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "_resetToState:", 1);
    v22 = *(_QWORD *)(a1 + 40);
    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

    }
  }
  else
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(*(_QWORD *)(v9 + 8) + 32);
      *(_DWORD *)buf = 134218498;
      v31 = v9;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Recipient refresh succeeded with recipient: %@ for address: %@.", buf, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPhoneOrEmail:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
    v11 = *(_QWORD **)(a1 + 32);
    v12 = *(void **)(v11[1] + 40);
    objc_msgSend(v11, "recipientDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplayName:", v13);

    +[PKPeerPaymentRecipientCache sharedCache](PKPeerPaymentRecipientCache, "sharedCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cacheRecipient:forRecipientAddress:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));

    v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "status");
    v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v15 == 1)
    {
      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v31 = v17;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Recipient is still valid. Returning shouldContinue YES.", buf, 0xCu);
      }

      v18 = *(_QWORD *)(a1 + 40);
      if (v18)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v18 + 16))(v18, 1, 0);
    }
    else
    {
      if (v16)
      {
        v24 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v31 = v24;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Recipient is no longer valid. Notifying and returning shouldContinue NO.", buf, 0xCu);
      }

      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_FORMAT"), CFSTR("%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v25, v26, 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "postNotificationName:object:", PKPeerPaymentControllerRecipientDidBecomeInvalidNotification, *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "_resetToState:", 1);
      v29 = *(_QWORD *)(a1 + 40);
      if (v29)
        (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v27);

    }
  }

}

- (void)identifyRecipientWithRoutingNumber:(id)a3 accountNumber:(id)a4 accountName:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  PKPeerPaymentWebService *webService;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  PKLogFacilityTypeGetObject(0xBuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: identifyRecipientWithRoutingNumber:accountNumber:accountName:completion: called.", buf, 2u);
  }

  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 1))
  {
    webService = self->_webService;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__PKPeerPaymentController_identifyRecipientWithRoutingNumber_accountNumber_accountName_completion___block_invoke;
    v16[3] = &unk_1E2ACD4E8;
    v16[4] = self;
    v17 = v11;
    v18 = v10;
    v19 = v12;
    v20 = v13;
    -[PKPeerPaymentWebService peerPaymentQuoteCertificatesForDestination:completion:](webService, "peerPaymentQuoteCertificatesForDestination:completion:", 2, v16);

  }
}

void __99__PKPeerPaymentController_identifyRecipientWithRoutingNumber_accountNumber_accountName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  PKLogFacilityTypeGetObject(0xBuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6 || v7)
  {
    if (v9)
    {
      v22 = *(_QWORD *)(a1 + 32);
      v25 = 134218242;
      v26 = v22;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get quote certificates failed with error: %@.", (uint8_t *)&v25, 0x16u);
    }

    v23 = *(_QWORD *)(a1 + 64);
    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

    }
  }
  else
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v25 = 134218242;
      v26 = v10;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Get quote certificates succeeded with certificates response: %@.", (uint8_t *)&v25, 0x16u);
    }

    v11 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 112);
    *(_QWORD *)(v12 + 112) = v11;

    v14 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 120);
    *(_QWORD *)(v15 + 120) = v14;

    v17 = objc_msgSend(*(id *)(a1 + 56), "copy");
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v19 = *(void **)(v18 + 104);
    *(_QWORD *)(v18 + 104) = v17;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), a2);
    v20 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)(v20[1] + 8) == 1)
      objc_msgSend(v20, "_setState:notify:", 2, 1);
    v21 = *(_QWORD *)(a1 + 64);
    if (v21)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v21 + 16))(v21, 1, 0);
  }

}

- (void)identifyRecipientDebitCardWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  PKPeerPaymentWebService *webService;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: identifyRecipientDebitCardWithCompletion: called.", buf, 2u);
  }

  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 1))
  {
    webService = self->_webService;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PKPeerPaymentController_identifyRecipientDebitCardWithCompletion___block_invoke;
    v7[3] = &unk_1E2ACD510;
    v7[4] = self;
    v8 = v4;
    -[PKPeerPaymentWebService peerPaymentQuoteCertificatesForDestination:completion:](webService, "peerPaymentQuoteCertificatesForDestination:completion:", 4, v7);

  }
}

void __68__PKPeerPaymentController_identifyRecipientDebitCardWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  PKLogFacilityTypeGetObject(0xBuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6 || v7)
  {
    if (v9)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v16 = 134218242;
      v17 = v13;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get quote certificates failed with error: %@.", (uint8_t *)&v16, 0x16u);
    }

    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    }
  }
  else
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v16 = 134218242;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Get quote certificates succeeded with certificates response: %@.", (uint8_t *)&v16, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), a2);
    v11 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)(v11[1] + 8) == 1)
      objc_msgSend(v11, "_setState:notify:", 2, 1);
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, 1, 0);
  }

}

- (void)identifyRecipientSelf
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: identifyRecipientSelf:accountNumber: called.", v4, 2u);
  }

  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 1))
  {
    if (self->_is->state == 1)
      -[PKPeerPaymentController _setState:notify:](self, "_setState:notify:", 2, 1);
  }
}

- (void)selectMode:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  PKPeerPaymentControllerInternalState *is;
  unint64_t state;
  BOOL v13;
  uint64_t v14;
  int v15;
  PKPeerPaymentController *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 5)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E2ACD7E0[a3 - 1];
    v7 = self->_is->mode - 1;
    if (v7 > 5)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E2ACD7E0[v7];
    v15 = 134218498;
    v16 = self;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: selectMode: called. New mode: %{public}@ (previous mode: %{public}@)", (uint8_t *)&v15, 0x20u);
  }

  is = self->_is;
  if (is->state >= 3)
  {
    -[PKPeerPaymentController _resetToState:](self, "_resetToState:", 2);
    is = self->_is;
  }
  if (a3 && is->mode != a3)
  {
    is->mode = a3;
    state = self->_is->state;
    v13 = ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 4) && state == 2;
    v14 = 3;
    if (a3 == 2 || v13)
      goto LABEL_27;
    if (a3 == 3 && state == 2)
    {
      v14 = 6;
LABEL_27:
      -[PKPeerPaymentController _setState:notify:](self, "_setState:notify:", v14, 1);
    }
  }
}

- (BOOL)_modeSupportsExternalFundingSource:(unint64_t)a3
{
  return ((a3 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (BOOL)_modeIsSendType:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (id)_featureDescriptorForMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  PKPeerPaymentControllerInternalState *is;
  uint64_t v9;

  -[PKPeerPaymentController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  switch(a3)
  {
    case 1uLL:
      is = self->_is;
      if (is->recurringPaymentIdentifier || is->startDate || is->frequency)
      {
        objc_msgSend(v5, "recurringPaymentsFeatureDescriptor");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "sendToUserFeatureDescriptor");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_10;
    case 2uLL:
      objc_msgSend(v5, "deviceTapFeatureDescriptor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      objc_msgSend(v5, "requestFromUserFeatureDescriptor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      objc_msgSend(v5, "loadFromCardFeatureDescriptor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      objc_msgSend(v5, "instantWithdrawalPromotionFeatureDescriptor");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v7 = (void *)v9;
      break;
    default:
      break;
  }

  return v7;
}

- (void)quoteWithAmount:(id)a3 completion:(id)a4
{
  -[PKPeerPaymentController quoteWithAmount:source:completion:](self, "quoteWithAmount:source:completion:", a3, 0, a4);
}

- (void)quoteWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5
{
  -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:completion:](self, "quoteWithAmount:source:requestToken:alternateFundingSource:completion:", a3, 0, a4, 0, a5);
}

- (void)quoteWithAmount:(id)a3 requestToken:(id)a4 alternateFundingSource:(id)a5 completion:(id)a6
{
  -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:completion:](self, "quoteWithAmount:source:requestToken:alternateFundingSource:completion:", a3, 0, a4, a5, a6);
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  -[PKPeerPaymentController quoteWithAmount:source:requestToken:completion:](self, "quoteWithAmount:source:requestToken:completion:", a3, a4, 0, a5);
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 completion:(id)a6
{
  -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:completion:](self, "quoteWithAmount:source:requestToken:alternateFundingSource:completion:", a3, a4, a5, 0, a6);
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 completion:(id)a7
{
  -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:](self, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:", a3, a4, a5, a6, 0, 0, 0, 0, 0, a7);
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 preserveCurrentBalance:(unint64_t)a7 recurringPaymentIdentifier:(id)a8 frequency:(unint64_t)a9 startDate:(id)a10 threshold:(id)a11 completion:(id)a12
{
  id v17;
  PKPeerPaymentRequestToken *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  PKPeerPaymentRequestToken *v23;
  PKPeerPaymentQuoteRequest *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  PKPeerPaymentControllerInternalState *is;
  PKPeerPaymentRequestToken *requestToken;
  unint64_t mode;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id obj;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  PKPeerPaymentController *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  PKPeerPaymentRequestToken *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = (PKPeerPaymentRequestToken *)a5;
  v19 = a6;
  obj = a8;
  v20 = a8;
  v45 = a10;
  v44 = a11;
  v21 = a12;
  PKLogFacilityTypeGetObject(0xBuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v49 = self;
    v50 = 2112;
    v51 = v17;
    v52 = 2112;
    v53 = v18;
    v54 = 2112;
    v55 = v19;
    _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: quoteWithAmount: %@ requestToken: %@ alternateFundingSource: %@ completion: called.", buf, 0x2Au);
  }

  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 3))
  {
    v43 = v17;
    objc_opt_class();
    v40 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PKPeerPaymentRequestToken initWithRequestToken:deviceScoreIdentifier:expiryDate:]([PKPeerPaymentRequestToken alloc], "initWithRequestToken:deviceScoreIdentifier:expiryDate:", v18, 0, 0);

      v18 = v23;
    }
    v24 = objc_alloc_init(PKPeerPaymentQuoteRequest);
    objc_msgSend(v43, "amount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentQuoteRequest setAmount:](v24, "setAmount:", v25);

    objc_msgSend(v43, "currency");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentQuoteRequest setCurrency:](v24, "setCurrency:", v26);

    -[PKPeerPaymentQuoteRequest setRequestToken:](v24, "setRequestToken:", v18);
    -[PKPeerPaymentQuoteRequest setSenderAddress:](v24, "setSenderAddress:", self->_is->senderPhoneOrEmail);
    -[PKPeerPaymentQuoteRequest setRecipientPhoneOrEmail:](v24, "setRecipientPhoneOrEmail:", self->_is->recipientPhoneOrEmail);
    -[PKPeerPaymentQuoteRequest setSource:](v24, "setSource:", a4);
    if (-[PKPeerPaymentController _modeSupportsExternalFundingSource:](self, "_modeSupportsExternalFundingSource:", self->_is->mode))
    {
      if (v19
        || (-[PKPeerPaymentController _defaultAlternateFundingSourceForMode:](self, "_defaultAlternateFundingSourceForMode:", self->_is->mode), (v19 = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[PKPeerPaymentQuoteRequest updateWithPaymentPass:externalFundingSource:](v24, "updateWithPaymentPass:externalFundingSource:", v19, self->_is->mode != 6);
      }
      else
      {
        mode = self->_is->mode;
        v36 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (mode == 5)
        {
          if (v36)
          {
            *(_DWORD *)buf = 134217984;
            v49 = self;
            _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Failed to request top up quote as no suitable payment cards were found.", buf, 0xCu);
          }

          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_NO_CARDS_ERROR_TITLE"), 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_NO_CARDS_ERROR_MESSAGE"), 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          PKDisplayableErrorCustomWithType(-1, v37, v38, 0, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(id, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v39);
          v19 = 0;
          v20 = v40;
          v29 = v44;
          v28 = v45;
          goto LABEL_26;
        }
        if (v36)
        {
          *(_DWORD *)buf = 134217984;
          v49 = self;
          _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: No acceptable alternate funding source available. Proceeding with transfer quote request with caution.", buf, 0xCu);
        }

        v19 = 0;
      }
    }
    if (!-[PKPeerPaymentController _modeIsSendType:](self, "_modeIsSendType:", self->_is->mode))
    {
LABEL_19:
      switch(self->_is->mode)
      {
        case 2uLL:
          -[PKPeerPaymentQuoteRequest setDestination:](v24, "setDestination:", 5);
          -[PKPeerPaymentQuoteRequest setDeviceTapFlow:](v24, "setDeviceTapFlow:", 2);
          -[PKPeerPaymentQuoteRequest setPaymentMode:](v24, "setPaymentMode:", 2);
          break;
        case 4uLL:
          -[PKPeerPaymentQuoteRequest setDestination:](v24, "setDestination:", 2);
          -[PKPeerPaymentQuoteRequest setBankName:](v24, "setBankName:", self->_is->accountName);
          -[PKPeerPaymentQuoteRequest setAccountNumber:](v24, "setAccountNumber:", self->_is->accountNumber);
          -[PKPeerPaymentQuoteRequest setRoutingNumber:](v24, "setRoutingNumber:", self->_is->routingNumber);
          -[PKPeerPaymentQuoteRequest setQuoteCertificatesResponse:](v24, "setQuoteCertificatesResponse:", self->_is->quoteCertificatesResponse);
          break;
        case 5uLL:
          -[PKPeerPaymentQuoteRequest setDestination:](v24, "setDestination:", 3);
          objc_storeStrong((id *)&self->_is->threshold, a11);
          objc_storeStrong((id *)&self->_is->recurringPaymentIdentifier, obj);
          -[PKPeerPaymentQuoteRequest setThreshold:](v24, "setThreshold:", self->_is->threshold);
          -[PKPeerPaymentQuoteRequest setRecurringPaymentIdentifier:](v24, "setRecurringPaymentIdentifier:", self->_is->recurringPaymentIdentifier);
          break;
        case 6uLL:
          -[PKPeerPaymentQuoteRequest setDestination:](v24, "setDestination:", 4);
          break;
        default:
          -[PKPeerPaymentQuoteRequest setDestination:](v24, "setDestination:", 1);
          -[PKPeerPaymentRecipient identifier](self->_is->recipient, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPeerPaymentQuoteRequest setRecipientIdentifier:](v24, "setRecipientIdentifier:", v30);

          objc_storeStrong((id *)&self->_is->recurringPaymentIdentifier, obj);
          self->_is->frequency = a9;
          objc_storeStrong((id *)&self->_is->startDate, a10);
          -[PKPeerPaymentQuoteRequest setRecurringPaymentIdentifier:](v24, "setRecurringPaymentIdentifier:", self->_is->recurringPaymentIdentifier);
          -[PKPeerPaymentQuoteRequest setFrequency:](v24, "setFrequency:", self->_is->frequency);
          -[PKPeerPaymentQuoteRequest setStartDate:](v24, "setStartDate:", self->_is->startDate);
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPeerPaymentQuoteRequest setSendImmediately:](v24, "setSendImmediately:", objc_msgSend(v31, "isDateInToday:", self->_is->startDate));

          break;
      }
      v29 = v44;
      v28 = v45;
      objc_storeStrong((id *)&self->_is->quoteRequest, v24);
      v32 = -[PKPeerPaymentRequestToken copy](v18, "copy");
      is = self->_is;
      requestToken = is->requestToken;
      is->requestToken = (PKPeerPaymentRequestToken *)v32;

      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __177__PKPeerPaymentController_quoteWithAmount_source_requestToken_alternateFundingSource_preserveCurrentBalance_recurringPaymentIdentifier_frequency_startDate_threshold_completion___block_invoke;
      v46[3] = &unk_1E2AC7550;
      v46[4] = self;
      v47 = v21;
      -[PKPeerPaymentController _requestQuoteWithRequest:withCompletion:](self, "_requestQuoteWithRequest:withCompletion:", v24, v46);

LABEL_26:
      v17 = v43;
      goto LABEL_27;
    }
    if (-[PKPeerPaymentQuoteRequest externalFundingSource](v24, "externalFundingSource") != 1
      || !self->_is->supportsPreserveCurrentBalance)
    {
      goto LABEL_17;
    }
    if (a7 == 1)
    {
      v27 = 1;
      goto LABEL_18;
    }
    if (!a7)
      v27 = (-[PKObject settings](self->_peerPaymentPass, "settings") >> 11) & 1;
    else
LABEL_17:
      v27 = 0;
LABEL_18:
    -[PKPeerPaymentQuoteRequest setPreserveCurrentBalance:](v24, "setPreserveCurrentBalance:", v27);
    goto LABEL_19;
  }
  v29 = v44;
  v28 = v45;
LABEL_27:

}

void __177__PKPeerPaymentController_quoteWithAmount_source_requestToken_alternateFundingSource_preserveCurrentBalance_recurringPaymentIdentifier_frequency_startDate_threshold_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v8[1] + 8) == 3)
    objc_msgSend(v8, "_setState:notify:", 4, 1);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, a2, v10, v7);

}

- (void)_requestQuoteWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentWebService *webService;
  void *v9;
  PKPeerPaymentWebService *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  webService = self->_webService;
  objc_msgSend(v6, "recipientPhoneOrEmail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:](webService, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", CFSTR("quote"), v9, objc_msgSend(v6, "destination"));

  v10 = self->_webService;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PKPeerPaymentController__requestQuoteWithRequest_withCompletion___block_invoke;
  v13[3] = &unk_1E2ACD538;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[PKPeerPaymentWebService peerPaymentQuoteWithRequest:completion:](v10, "peerPaymentQuoteWithRequest:completion:", v12, v13);

}

void __67__PKPeerPaymentController__requestQuoteWithRequest_withCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void (**v11)(id, uint64_t, void *, _QWORD);
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "quote");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 && v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      *(_DWORD *)buf = 134218242;
      v28 = v9;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: fetch quote succeeded with quote: %@.", buf, 0x16u);
    }

    objc_storeStrong((id *)(*((_QWORD *)a1[4] + 1) + 64), v7);
    objc_msgSend(v7, "setRecipient:", *(_QWORD *)(*((_QWORD *)a1[4] + 1) + 40));
    objc_msgSend(v7, "setBankName:", *(_QWORD *)(*((_QWORD *)a1[4] + 1) + 104));
    objc_msgSend(v7, "setAccountNumber:", *(_QWORD *)(*((_QWORD *)a1[4] + 1) + 112));
    objc_msgSend(v7, "setRoutingNumber:", *(_QWORD *)(*((_QWORD *)a1[4] + 1) + 120));
    objc_msgSend(v7, "setStartDate:", *(_QWORD *)(*((_QWORD *)a1[4] + 1) + 144));
    objc_msgSend(v7, "setFrequency:", *(_QWORD *)(*((_QWORD *)a1[4] + 1) + 152));
    objc_msgSend(v7, "setThreshold:", *(_QWORD *)(*((_QWORD *)a1[4] + 1) + 160));
    objc_msgSend(a1[5], "recurringPaymentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsNewRecurringPayment:", v10 == 0);

    objc_msgSend(v7, "setDestinationType:", objc_msgSend(a1[5], "destination"));
    v11 = (void (**)(id, uint64_t, void *, _QWORD))a1[6];
    if (v11)
      v11[2](v11, 1, v7, 0);
    objc_msgSend(a1[4], "_sendAnalyticsForQuote:withRequest:", v7, a1[5]);
    goto LABEL_18;
  }
  objc_msgSend(v5, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain")))
  {
    v13 = objc_msgSend(v5, "code");

    if (v13 == 40001)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = a1[4];
        *(_DWORD *)buf = 134217984;
        v28 = v15;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: fetch quote failed with stale recipient. Refreshing and then re-attempting fetch quote.", buf, 0xCu);
      }

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __67__PKPeerPaymentController__requestQuoteWithRequest_withCompletion___block_invoke_58;
      v23[3] = &unk_1E2ACB900;
      v16 = a1[4];
      v17 = a1[5];
      v18 = a1[4];
      v24 = v17;
      v25 = v18;
      v26 = a1[6];
      objc_msgSend(v16, "_refreshRecipientWithCompletion:", v23);

      goto LABEL_18;
    }
  }
  else
  {

  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = a1[4];
    *(_DWORD *)buf = 134218242;
    v28 = v20;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get quote failed with error: %@.", buf, 0x16u);
  }

  v21 = a1[6];
  if (v21)
  {
    objc_msgSend(a1[4], "displayableErrorForError:", v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v22);

  }
LABEL_18:

}

void __67__PKPeerPaymentController__requestQuoteWithRequest_withCompletion___block_invoke_58(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "destination") == 1)
    {
      v3 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setRecipientIdentifier:", v4);

    }
    objc_msgSend(*(id *)(a1 + 40), "_requestQuoteWithRequest:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "displayableErrorForError:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v6);

  }
}

- (void)_sendAnalyticsForQuote:(id)a3 withRequest:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  __CFString **v24;
  __CFString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "destination") == 1)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsAmountCategoryForAmount(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("p2pAmountCategory"));

    objc_msgSend(v6, "currency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("p2pCurrency"));

    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "requestToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithBool:", v12 != 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("p2pHasRequestToken"));

    PKPeerPaymentQuoteRequestSourceTypeToString(objc_msgSend(v6, "source"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "source") && objc_msgSend(v6, "hasUpdatedPaymentMethod"))
    {
      objc_msgSend(v14, "stringByAppendingString:", CFSTR("-update"));
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("p2pSource"));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v5, "items", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = 0;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v16);
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "type");
          if (v23 == 1)
          {
            v20 = 1;
          }
          else if (v23 == 2)
          {
            v19 = 1;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);

      if (((v19 | v20) & 1) == 0)
        goto LABEL_24;
      v24 = PKAnalyticsPayloadValueP2PQuoteItemTypeTopUpAndTransfer;
      if ((v19 & 1 & v20) == 0)
        v24 = PKAnalyticsPayloadValueP2PQuoteItemTypeTransfer;
      if ((v19 & 1) == 0)
        v24 = PKAnalyticsPayloadValueP2PQuoteItemTypeTopUp;
      v25 = *v24;
      if (!v25)
        goto LABEL_24;
      v16 = v25;
      objc_msgSend(v7, "setObject:forKey:", v25, CFSTR("p2pQuoteItemTypes"));
    }

LABEL_24:
    PKAnalyticsSendEventWithDailyLimit(CFSTR("com.apple.wallet.peer.payment.quote"), v7, 2);

  }
}

- (id)_defaultAlternateFundingSourceForMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPeerPaymentControllerInternalState *is;
  uint64_t v10;
  PKPeerPaymentRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[PKPeerPaymentController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  v8 = 0;
  switch(a3)
  {
    case 1uLL:
      objc_msgSend(v5, "sendToUserFeatureDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      is = self->_is;
      if (is->recurringPaymentIdentifier || is->startDate || is->frequency)
      {
        objc_msgSend(v6, "recurringPaymentsFeatureDescriptor");
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
      }
      if (!v7)
        goto LABEL_14;
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v5, "deviceTapFeatureDescriptor");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3uLL:
    case 4uLL:
      break;
    case 5uLL:
      objc_msgSend(v5, "loadFromCardFeatureDescriptor");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6uLL:
      objc_msgSend(v5, "instantWithdrawalPromotionFeatureDescriptor");
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v7 = (void *)v18;
      if (v18)
      {
LABEL_7:
        v11 = objc_alloc_init(PKPeerPaymentRequest);
        objc_msgSend(v7, "merchantIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentRequest setMerchantIdentifier:](v11, "setMerchantIdentifier:", v12);

        objc_msgSend(v7, "supportedNetworks");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentRequest setSupportedNetworks:](v11, "setSupportedNetworks:", v13);

        -[PKPaymentRequest setMerchantCapabilities:](v11, "setMerchantCapabilities:", objc_msgSend(v7, "merchantCapabilities"));
        v14 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v6, "countryCode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithObject:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentRequest setSupportedCountries:](v11, "setSupportedCountries:", v16);

        if (a3 == 6)
          -[PKPaymentRequest setSupportsInstantFundsIn:](v11, "setSupportsInstantFundsIn:", 1);
        +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_defaultPaymentPassForPaymentRequest:", v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_14:
        v8 = 0;
      }
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (void)authorizeQuote:(id)a3 performOnAuthorization:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *quoteAuthorizationGroup;
  uint64_t v12;
  OS_dispatch_group *v13;
  OS_dispatch_group *v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *quoteAuthorizationCallbackQueue;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  uint64_t v21;
  PKPeerPaymentWebService *webService;
  void *v23;
  void *v24;
  PKPeerPaymentRequest *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PKPeerPaymentControllerInternalState *is;
  unint64_t mode;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  PKPeerPaymentControllerInternalState *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  PKPaymentAuthorizationCoordinator *v50;
  PKPaymentAuthorizationCoordinator *quoteAuthorizationCoordinator;
  PKPaymentAuthorizationCoordinator *v52;
  NSError *v53;
  NSError *v54;
  void *v55;
  void *v56;
  NSError *v57;
  NSError *quoteAuthorizationError;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;
  _QWORD block[5];
  uint8_t buf[4];
  PKPeerPaymentController *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PKLogFacilityTypeGetObject(0xBuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v65 = self;
    v66 = 2112;
    v67 = v8;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: authorizeQuote: %@ completion: called.", buf, 0x16u);
  }

  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 4))
  {
    self->_performOnAuthorization = a4;
    quoteAuthorizationGroup = self->_quoteAuthorizationGroup;
    v12 = MEMORY[0x1E0C809B0];
    if (!quoteAuthorizationGroup)
    {
      v13 = (OS_dispatch_group *)dispatch_group_create();
      v14 = self->_quoteAuthorizationGroup;
      self->_quoteAuthorizationGroup = v13;

      v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.passkitcore.peerpayment.quoteauthorizationqueue", 0);
      quoteAuthorizationCallbackQueue = self->_quoteAuthorizationCallbackQueue;
      self->_quoteAuthorizationCallbackQueue = v15;

      dispatch_group_enter((dispatch_group_t)self->_quoteAuthorizationGroup);
      v17 = self->_quoteAuthorizationGroup;
      v18 = self->_quoteAuthorizationCallbackQueue;
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke;
      block[3] = &unk_1E2ABE120;
      block[4] = self;
      dispatch_group_notify(v17, v18, block);
      quoteAuthorizationGroup = self->_quoteAuthorizationGroup;
    }
    v19 = self->_quoteAuthorizationCallbackQueue;
    v61[0] = v12;
    v61[1] = 3221225472;
    v61[2] = __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke_66;
    v61[3] = &unk_1E2ABE058;
    v61[4] = self;
    v62 = v9;
    dispatch_group_notify(quoteAuthorizationGroup, v19, v61);
    if (self->_quoteAuthorizationCoordinator)
      goto LABEL_37;
    v20 = self->_is->mode - 2;
    if (v20 > 4)
      v21 = 1;
    else
      v21 = qword_1904551C8[v20];
    webService = self->_webService;
    objc_msgSend(v8, "recipient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "phoneOrEmail");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentWebService prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:](webService, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", CFSTR("performQuote"), v24, v21);

    v25 = -[PKPeerPaymentRequest initWithPeerPaymentQuote:]([PKPeerPaymentRequest alloc], "initWithPeerPaymentQuote:", v8);
    objc_msgSend(v8, "firstQuoteItemOfType:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dpanIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "passWithDPANIdentifier:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "serialNumber");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setPassSerialNumber:](v25, "setPassSerialNumber:", v30);

      objc_msgSend(v29, "passTypeIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setPassTypeIdentifier:](v25, "setPassTypeIdentifier:", v31);

    }
    is = self->_is;
    mode = is->mode;
    if ((mode | 2) == 6)
    {
      -[PKPaymentRequest setUseLocationBasedAuthorization:](v25, "setUseLocationBasedAuthorization:", 1);
      is = self->_is;
      mode = is->mode;
    }
    if (mode != 2)
    {
      if (mode != 1)
        goto LABEL_23;
      objc_msgSend(v8, "recipient");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {

        is = self->_is;
      }
      else
      {
        is = self->_is;
        if (is->mode != 2)
          goto LABEL_23;
      }
    }
    if (is->supportsPreserveCurrentBalance)
    {
      -[PKPeerPaymentController _featureDescriptorForMode:](self, "_featureDescriptorForMode:", is->mode);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isRecurringPayment"))
      {
        -[PKPeerPaymentAccount recurringPaymentsFeatureDescriptor](self->_account, "recurringPaymentsFeatureDescriptor");
        v36 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v36;
      }
      objc_msgSend(v35, "merchantIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setMerchantIdentifier:](v25, "setMerchantIdentifier:", v37);

      objc_msgSend(v35, "supportedNetworks");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setSupportedNetworks:](v25, "setSupportedNetworks:", v38);

      -[PKPaymentRequest setMerchantCapabilities:](v25, "setMerchantCapabilities:", objc_msgSend(v35, "merchantCapabilities"));
      v39 = (void *)MEMORY[0x1E0C99E60];
      -[PKPeerPaymentAccount countryCode](self->_account, "countryCode");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setWithObject:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setSupportedCountries:](v25, "setSupportedCountries:", v41);

      is = self->_is;
    }
LABEL_23:
    if (is->mode == 2)
    {
      -[PKPeerPaymentRequest setHasUndeterminedRecipient:](v25, "setHasUndeterminedRecipient:", 1);
      -[PKPaymentRequest setConfirmationStyle:](v25, "setConfirmationStyle:", 1);
    }
    -[PKPeerPaymentController summaryItemsForQuote:](self, "summaryItemsForQuote:", v8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setPaymentSummaryItems:](v25, "setPaymentSummaryItems:", v42);

    +[PKPaymentRequestValidator validatorWithObject:](PKPaymentRequestValidator, "validatorWithObject:", v25);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    v44 = objc_msgSend(v43, "isValidWithError:", &v60);
    v45 = v60;

    if ((v44 & 1) != 0)
    {
      v46 = self->_is;
      if (v46->mode != 1
        || (-[PKPeerPaymentQuote firstQuoteItemOfType:](v46->quote, "firstQuoteItemOfType:", 1),
            (v47 = objc_claimAutoreleasedReturnValue()) == 0)
        || (v48 = (void *)v47,
            -[PKPeerPaymentController _defaultAlternateFundingSourceForMode:](self, "_defaultAlternateFundingSourceForMode:", 1), v49 = (void *)objc_claimAutoreleasedReturnValue(), v49, v48, v49))
      {
        v50 = -[PKPaymentAuthorizationCoordinator initWithPaymentRequest:]([PKPaymentAuthorizationCoordinator alloc], "initWithPaymentRequest:", v25);
        quoteAuthorizationCoordinator = self->_quoteAuthorizationCoordinator;
        self->_quoteAuthorizationCoordinator = v50;

        -[PKPaymentAuthorizationCoordinator setDelegate:](self->_quoteAuthorizationCoordinator, "setDelegate:", self);
        -[PKPaymentAuthorizationCoordinator _setPrivateDelegate:](self->_quoteAuthorizationCoordinator, "_setPrivateDelegate:", self);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v65 = self;
          _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Presenting PKPaymentAuthorizationCoordinator...", buf, 0xCu);
        }

        v52 = self->_quoteAuthorizationCoordinator;
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke_73;
        v59[3] = &unk_1E2AC35F8;
        v59[4] = self;
        -[PKPaymentAuthorizationCoordinator presentWithCompletion:](v52, "presentWithCompletion:", v59);
        goto LABEL_36;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v65 = self;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Generated PKPeerPaymentRequest is invalid because it is configured to use DPAN and there are no usable DPANs", buf, 0xCu);
      }

      self->_quoteAuthorizationSuccess = 0;
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_TITLE"), 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_DESCRIPTION"), 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v55, v56, 0, 0);
      v57 = (NSError *)objc_claimAutoreleasedReturnValue();
      quoteAuthorizationError = self->_quoteAuthorizationError;
      self->_quoteAuthorizationError = v57;

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v65 = self;
        v66 = 2112;
        v67 = v45;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Generated PKPeerPaymentRequest is invalid with error: %@", buf, 0x16u);
      }

      self->_quoteAuthorizationSuccess = 0;
      -[PKPeerPaymentController displayableErrorForError:](self, "displayableErrorForError:", v45);
      v53 = (NSError *)objc_claimAutoreleasedReturnValue();
      v54 = self->_quoteAuthorizationError;
      self->_quoteAuthorizationError = v53;

    }
    dispatch_group_leave((dispatch_group_t)self->_quoteAuthorizationGroup);
LABEL_36:

LABEL_37:
  }

}

void __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 72))
  {
    v7 = *(void **)(v6 + 80);
    *(_QWORD *)(v6 + 80) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_setState:notify:", 5, 1);
  }
  else
  {
    v8 = *(_QWORD *)(v6 + 8);
    v9 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = 0;

  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v11 + 72))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = *(_QWORD *)(v11 + 80);
    v14 = 134218498;
    v15 = v11;
    v16 = 2114;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Completed authorizeQuote: with success: %{public}@ error: %@", (uint8_t *)&v14, 0x20u);
  }

}

void __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke_66(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    objc_msgSend((id)objc_opt_class(), "_paymentNotCompletedErrorWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72));
    v2 = v4;
  }

}

void __76__PKPeerPaymentController_authorizeQuote_performOnAuthorization_completion___block_invoke_73(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 134217984;
      v9 = v6;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Succeeded presenting PKPaymentAuthorizationCoordinator.", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 134217984;
      v9 = v7;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Failed to present PKPaymentAuthorizationCoordinator.", (uint8_t *)&v8, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
  }
}

- (id)analyticsSessionSubjectForPaymentAuthorizationCoordinator:(id)a3
{
  if (self->_is->mode == 2)
    return CFSTR("p2p");
  else
    return 0;
}

- (id)analyticsSessionTokenForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;

  if (self->_is->mode == 2)
  {
    +[PKAnalyticsReporter archivedSessionTokenForSubject:](PKAnalyticsReporter, "archivedSessionTokenForSubject:", CFSTR("p2p"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)performQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *performQuoteGroup;
  uint64_t v10;
  OS_dispatch_group *v11;
  OS_dispatch_group *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *performQuoteCallbackQueue;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[5];
  uint8_t buf[4];
  PKPeerPaymentController *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0xBuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v22 = self;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: performQuote: %@ completion: called.", buf, 0x16u);
  }

  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 4))
  {
    performQuoteGroup = self->_performQuoteGroup;
    v10 = MEMORY[0x1E0C809B0];
    if (!performQuoteGroup)
    {
      v11 = (OS_dispatch_group *)dispatch_group_create();
      v12 = self->_performQuoteGroup;
      self->_performQuoteGroup = v11;

      v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.passkitcore.peerpayment.performquotequeue", 0);
      performQuoteCallbackQueue = self->_performQuoteCallbackQueue;
      self->_performQuoteCallbackQueue = v13;

      dispatch_group_enter((dispatch_group_t)self->_performQuoteGroup);
      v15 = self->_performQuoteGroup;
      v16 = self->_performQuoteCallbackQueue;
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __51__PKPeerPaymentController_performQuote_completion___block_invoke;
      block[3] = &unk_1E2ABE120;
      block[4] = self;
      dispatch_group_notify(v15, v16, block);
      performQuoteGroup = self->_performQuoteGroup;
    }
    v17 = self->_performQuoteCallbackQueue;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __51__PKPeerPaymentController_performQuote_completion___block_invoke_77;
    v18[3] = &unk_1E2ABE058;
    v18[4] = self;
    v19 = v7;
    dispatch_group_notify(performQuoteGroup, v17, v18);
    -[PKPeerPaymentController authorizeQuote:performOnAuthorization:completion:](self, "authorizeQuote:performOnAuthorization:completion:", v6, 1, 0);

  }
}

void __51__PKPeerPaymentController_performQuote_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 112))
  {
    v9 = *(void **)(v8 + 120);
    *(_QWORD *)(v8 + 120) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_setState:notify:", 7, 1);
    objc_msgSend(*(id *)(a1 + 32), "_updateLastUsedAlternateFundingSource");
  }
  else
  {
    v10 = *(_QWORD *)(v8 + 8);
    v11 = *(void **)(v10 + 80);
    *(_QWORD *)(v10 + 80) = 0;

  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = CFSTR("YES");
    if (!*(_BYTE *)(v13 + 112))
      v14 = CFSTR("NO");
    v15 = *(_QWORD *)(*(_QWORD *)(v13 + 8) + 80);
    v16 = *(_QWORD *)(v13 + 120);
    v17 = 134218754;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Completed performQuote: with success: %{public}@ response: %@ error: %@", (uint8_t *)&v17, 0x2Au);
  }

}

void __51__PKPeerPaymentController_performQuote_completion___block_invoke_77(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
  {
    objc_msgSend((id)objc_opt_class(), "_paymentNotCompletedErrorWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80));
    v2 = v4;
  }

}

- (void)performQuoteWithCompletion:(id)a3
{
  -[PKPeerPaymentController performQuote:completion:](self, "performQuote:completion:", self->_is->quote, a3);
}

+ (void)performNearbyAuthorizedQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0xBuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: performAuthorizedQuote:completion: called.", buf, 2u);
  }

  +[PKPeerPaymentPerformRequest requestWithAuthorizedPeerPaymentQuote:](PKPeerPaymentPerformRequest, "requestWithAuthorizedPeerPaymentQuote:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setDestination:", 5);
    objc_msgSend(v10, "setSenderAddressType:", objc_msgSend(v6, "senderAddressType"));
    objc_msgSend(v6, "senderAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSenderAddress:", v11);

    objc_msgSend(v6, "encryptedRecipientData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEncryptedRecipientData:", v12);

    objc_msgSend(v10, "setEncryptionScheme:", objc_msgSend(v6, "encryptionScheme"));
    objc_msgSend(v6, "publicKeyHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPublicKeyHash:", v13);

    objc_msgSend(v6, "ephemeralPublicKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEphemeralPublicKey:", v14);

    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke;
    aBlock[3] = &unk_1E2ACD560;
    v28 = a1;
    v26 = v6;
    v27 = v7;
    v16 = _Block_copy(aBlock);
    +[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke_91;
    v22[3] = &unk_1E2ACD5B0;
    v23 = v10;
    v24 = v16;
    v18 = v16;
    objc_msgSend(v17, "peerPaymentPerformQuoteWithRequest:completion:", v23, v22);

    v19 = v26;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_TITLE"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_DESCRIPTION"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustomWithType(-1, v20, v21, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v19);
    goto LABEL_7;
  }
LABEL_8:

}

void __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = v6;
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain"));

    v9 = v10;
    if (v12)
    {
      v9 = v10;
      if (objc_msgSend(v10, "code") == 40311)
      {
        objc_msgSend(*(id *)(a1 + 32), "peerPaymentQuote");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstQuoteItemOfType:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dpanIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "passWithDPANIdentifier:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "organizationName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v10;
        if (v18)
        {
          v28 = v15;
          if (PKIsPhone())
          {
            objc_msgSend(v17, "passURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("details"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_DECLINED_BY_ISSUER_ERROR_CONTACT_ACTION_FORMAT"), CFSTR("%@"), v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v22 = *MEMORY[0x1E0CB2D78];
              v31 = v21;
              v32[0] = v22;
              v27 = v21;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v32[1] = CFSTR("PKErrorRecoveryURL");
              v33[0] = v23;
              v33[1] = v20;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              v21 = v27;
            }
            else
            {
              v24 = 0;
            }

          }
          else
          {
            v24 = 0;
          }
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_DECLINED_BY_ISSUER_ERROR_TITLE"), 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_DECLINED_BY_ISSUER_ERROR_DESCRIPTION_FORMAT"), CFSTR("%@%@"), v18, v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          PKDisplayableErrorCustomWithType(-1, v25, v26, 0, v24);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v28;
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 48), "_sendAuthorizedQuoteAnalyticsWithSuccess:mode:authorizedQuote:status:", 0, 2, *(_QWORD *)(a1 + 32), objc_msgSend(v5, "status"));
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: Error: Perform nearby authorized quote failed with error: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_sendAuthorizedQuoteAnalyticsWithSuccess:mode:authorizedQuote:status:", 1, 2, *(_QWORD *)(a1 + 32), objc_msgSend(v5, "status"));
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: Perform nearby authorized quote succeeded.", buf, 2u);
    }
    v9 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain")))
  {

    goto LABEL_7;
  }
  v8 = objc_msgSend(v6, "code");

  if (v8 != 40397)
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController: Perform nearby authorized quote received a timeout response, attempting to perform again", buf, 2u);
  }

  +[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke_92;
  v12[3] = &unk_1E2ACD588;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v10, "peerPaymentPerformQuoteWithRequest:completion:", v11, v12);

LABEL_8:
}

uint64_t __67__PKPeerPaymentController_performNearbyAuthorizedQuote_completion___block_invoke_92(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performAuthorizedQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PKPeerPaymentWebService *webService;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  PKPeerPaymentController *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0xBuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v34 = self;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: _performAuthorizedQuote: %@ completion: called.", buf, 0x16u);
  }

  +[PKPeerPaymentPerformRequest requestWithAuthorizedPeerPaymentQuote:](PKPeerPaymentPerformRequest, "requestWithAuthorizedPeerPaymentQuote:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setRecipientPhoneOrEmail:", self->_is->recipientPhoneOrEmail);
    objc_msgSend(v10, "setAccountNumber:", self->_is->accountNumber);
    objc_msgSend(v10, "setRoutingNumber:", self->_is->routingNumber);
    v11 = self->_is->mode - 2;
    if (v11 > 4)
      v12 = 1;
    else
      v12 = qword_1904551C8[v11];
    objc_msgSend(v10, "setDestination:", v12);
    if (self->_is->mode == 2)
    {
      objc_msgSend(v10, "setSenderAddressType:", objc_msgSend(v6, "senderAddressType"));
      objc_msgSend(v6, "senderAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSenderAddress:", v16);

      objc_msgSend(v6, "encryptedRecipientData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEncryptedRecipientData:", v17);

      objc_msgSend(v10, "setEncryptionScheme:", objc_msgSend(v6, "encryptionScheme"));
      objc_msgSend(v6, "publicKeyHash");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPublicKeyHash:", v18);

      objc_msgSend(v6, "ephemeralPublicKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEphemeralPublicKey:", v19);

    }
    objc_msgSend(v6, "peerPaymentQuote");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstQuoteItemOfType:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dpanIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PKPeerPaymentQuote isRecurringPayment](self->_is->quote, "isRecurringPayment"))
    {
      PKPaymentCryptogramTypeToString(0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCryptogramType:", v23);

      if (v22)
      {
        +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "passWithDPANIdentifier:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "serialNumber");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPassSerialNumber:", v26);

        objc_msgSend(v25, "passTypeIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPassTypeIdentifier:", v27);

      }
    }
    webService = self->_webService;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __62__PKPeerPaymentController__performAuthorizedQuote_completion___block_invoke;
    v29[3] = &unk_1E2ACD5D8;
    v29[4] = self;
    v30 = v6;
    v31 = v22;
    v32 = v7;
    v15 = v22;
    -[PKPeerPaymentWebService peerPaymentPerformQuoteWithRequest:completion:](webService, "peerPaymentPerformQuoteWithRequest:completion:", v10, v29);

    goto LABEL_15;
  }
  if (v7)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_TITLE"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_DESCRIPTION"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustomWithType(-1, v13, v14, 0, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v15);
LABEL_15:

  }
}

void __62__PKPeerPaymentController__performAuthorizedQuote_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = (id *)(*(_QWORD *)(a1[4] + 8) + 80);
  if (!v6 || v7)
  {
    v16 = *v8;
    *v8 = 0;

    objc_storeStrong((id *)(a1[4] + 120), a3);
    objc_msgSend(v7, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain"));

    if (v18 && objc_msgSend(v7, "code") == 40311)
    {
      +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "passWithDPANIdentifier:", a1[6]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "organizationName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        if (PKIsPhone())
        {
          objc_msgSend(v20, "passURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "URLByAppendingPathComponent:", CFSTR("details"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_DECLINED_BY_ISSUER_ERROR_CONTACT_ACTION_FORMAT"), CFSTR("%@"), v21);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          if (v23)
          {
            v26 = *MEMORY[0x1E0CB2D78];
            v39 = v24;
            v40[0] = v26;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v40[1] = CFSTR("PKErrorRecoveryURL");
            v41[0] = v27;
            v41[1] = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v28 = 0;
          }

        }
        else
        {
          v28 = 0;
        }
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_DECLINED_BY_ISSUER_ERROR_TITLE"), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_DECLINED_BY_ISSUER_ERROR_DESCRIPTION_FORMAT"), CFSTR("%@%@"), v21, v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        PKDisplayableErrorCustomWithType(-1, v29, v30, 0, v28);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = a1[4];
        v33 = *(void **)(v32 + 120);
        *(_QWORD *)(v32 + 120) = v31;

      }
    }
    objc_msgSend((id)objc_opt_class(), "_sendAuthorizedQuoteAnalyticsWithSuccess:mode:authorizedQuote:status:", 0, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 16), a1[5], objc_msgSend(v6, "status"));
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v34 = a1[4];
      *(_DWORD *)buf = 134218242;
      v36 = v34;
      v37 = 2112;
      v38 = v7;
      v13 = "PKPeerPaymentController %p: Error: Perform authorized quote failed with error: %@";
      v14 = v11;
      v15 = 22;
      goto LABEL_18;
    }
  }
  else
  {
    objc_storeStrong(v8, a2);
    v9 = a1[4];
    v10 = *(void **)(v9 + 120);
    *(_QWORD *)(v9 + 120) = 0;

    objc_msgSend((id)objc_opt_class(), "_sendAuthorizedQuoteAnalyticsWithSuccess:mode:authorizedQuote:status:", 1, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 16), a1[5], objc_msgSend(v6, "status"));
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      *(_DWORD *)buf = 134217984;
      v36 = v12;
      v13 = "PKPeerPaymentController %p: Perform authorized quote succeeded.";
      v14 = v11;
      v15 = 12;
LABEL_18:
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
  }

  (*(void (**)(void))(a1[7] + 16))();
}

- (void)_updateLastUsedAlternateFundingSource
{
  PKPeerPaymentQuoteRequest *v2;
  PKPeerPaymentQuoteRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v2 = self->_is->quoteRequest;
  v3 = v2;
  if (v2 && -[PKPeerPaymentQuoteRequest externalFundingSource](v2, "externalFundingSource") == 1)
  {
    -[PKPeerPaymentQuoteRequest dpanIdentifier](v3, "dpanIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passWithDPANIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v6, "uniqueID");
        v7 = objc_claimAutoreleasedReturnValue();
        +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLastUsedAlternateFundingSourcePassUniqueIdentifier:", v7);

      }
      else
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Could not find alternate funding source pass by DPAN identifier in pass library.", v9, 2u);
        }
      }

    }
  }

}

- (void)formalRequestTokenForAmount:(id)a3 completion:(id)a4
{
  -[PKPeerPaymentController formalRequestTokenForAmount:source:completion:](self, "formalRequestTokenForAmount:source:completion:", a3, 0, a4);
}

- (void)formalRequestTokenForAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  PKPeerPaymentRequestTokenRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKPeerPaymentWebService *webService;
  void *v17;
  PKPeerPaymentWebService *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  uint8_t buf[4];
  PKPeerPaymentController *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PKLogFacilityTypeGetObject(0xBuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = self;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: formalRequestTokenForAmount: %@ completion: called.", buf, 0x16u);
  }

  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 6))
  {
    v11 = objc_alloc_init(PKPeerPaymentRequestTokenRequest);
    -[PKPeerPaymentController recipient](self, "recipient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRequestTokenRequest setRecipientIdentifier:](v11, "setRecipientIdentifier:", v13);

    objc_msgSend(v8, "amount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRequestTokenRequest setAmount:](v11, "setAmount:", v14);

    objc_msgSend(v8, "currency");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRequestTokenRequest setCurrency:](v11, "setCurrency:", v15);

    -[PKPeerPaymentRequestTokenRequest setSenderAddress:](v11, "setSenderAddress:", self->_is->senderPhoneOrEmail);
    -[PKPeerPaymentRequestTokenRequest setRecipientPhoneOrEmail:](v11, "setRecipientPhoneOrEmail:", self->_is->recipientPhoneOrEmail);
    -[PKPeerPaymentRequestTokenRequest setSource:](v11, "setSource:", a4);
    webService = self->_webService;
    -[PKPeerPaymentRequestTokenRequest recipientPhoneOrEmail](v11, "recipientPhoneOrEmail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentWebService prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:](webService, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", CFSTR("requestToken"), v17, 1);

    v18 = self->_webService;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__PKPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke;
    v19[3] = &unk_1E2ACD628;
    v19[4] = self;
    v21 = v9;
    v20 = v8;
    v22 = a4;
    -[PKPeerPaymentWebService peerPaymentRequestTokenWithRequest:completion:](v18, "peerPaymentRequestTokenWithRequest:completion:", v11, v19);

  }
}

void __73__PKPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "success"))
  {
    objc_msgSend(v5, "requestToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (v7)
      {
        objc_msgSend(v5, "requestToken");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PKLogFacilityTypeGetObject(0xBuLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134218242;
          v35 = v10;
          v36 = 2112;
          v37 = v8;
          _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Get request token succeeded with requestToken: %@.", buf, 0x16u);
        }

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56), v8);
        v11 = *(_QWORD **)(a1 + 32);
        if (*(_QWORD *)(v11[1] + 8) == 6)
          objc_msgSend(v11, "_setState:notify:", 7, 1);
        v12 = *(_QWORD *)(a1 + 48);
        if (v12)
          (*(void (**)(uint64_t, uint64_t, __CFString *, _QWORD))(v12 + 16))(v12, 1, v8, 0);

        v6 = 0;
        goto LABEL_27;
      }
    }
  }
  objc_msgSend(v6, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain")))
  {
    v14 = objc_msgSend(v6, "code");

    if (v14 == 40001)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v35 = v16;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get request token failed with stale recipient. Refreshing and then re-attempting request token.", buf, 0xCu);
      }

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __73__PKPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke_95;
      v29[3] = &unk_1E2ACD600;
      v17 = *(void **)(a1 + 40);
      v30 = *(id *)(a1 + 32);
      v18 = v17;
      v20 = *(void **)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 56);
      v31 = v18;
      v33 = v19;
      v32 = v20;
      objc_msgSend(v30, "_refreshRecipientWithCompletion:", v29);

      goto LABEL_27;
    }
  }
  else
  {

  }
  if (!v6)
  {
    if ((objc_msgSend(v5, "success") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REFUSED_TOKEN_ERROR_TITLE"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REFUSED_TOKEN_ERROR_MESSAGE"), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v21, v22, 0, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(_QWORD *)(a1 + 32);
    v25 = objc_msgSend(v5, "success");
    v26 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v35 = v24;
    if (v25)
      v26 = CFSTR("YES");
    v36 = 2114;
    v37 = v26;
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Error: Get request token failed with success: %{public}@ error: %@.", buf, 0x20u);
  }

  v27 = *(_QWORD *)(a1 + 48);
  if (v27)
  {
    objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v27 + 16))(v27, 0, 0, v28);

  }
LABEL_27:

}

void __73__PKPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke_95(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "formalRequestTokenForAmount:source:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, v3);

  }
}

- (void)pendingRequestsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PKPeerPaymentController *v10;
  id v11;

  v4 = a3;
  -[PKPeerPaymentWebService peerPaymentService](self->_webService, "peerPaymentService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke;
  v8[3] = &unk_1E2ACA098;
  v10 = self;
  v11 = v4;
  v9 = v5;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v7, "peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:", v8);

}

void __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  PKPeerPaymentPendingRequestsRequest *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  uint64_t *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v22 = a1;
    v23 = v3;
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__31;
    v56 = __Block_byref_object_dispose__31;
    v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__31;
    v50 = __Block_byref_object_dispose__31;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__31;
    v44 = __Block_byref_object_dispose__31;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v58, 16);
    if (!v5)
      goto LABEL_16;
    v6 = *(_QWORD *)v37;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v8, "requestToken", v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v53[5], "setValue:forKey:", v8, v9);
        objc_msgSend(v8, "expiryDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

        }
        else
        {
          objc_msgSend(v8, "status");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13
            || (objc_msgSend(v8, "status"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("unknown")),
                v14,
                v13,
                (v15 & 1) != 0))
          {
            objc_msgSend(v24, "addObject:", v9);
            goto LABEL_14;
          }
        }
        objc_msgSend(v8, "expiryDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "compare:", v41[5]) == 1;

        if (v12)
        {
          objc_msgSend((id)v47[5], "addObject:", v8);
          objc_msgSend((id)v53[5], "removeObjectForKey:", v9);
        }
LABEL_14:

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v58, 16);
      if (!v5)
      {
LABEL_16:

        v16 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_103;
        aBlock[3] = &unk_1E2ACD670;
        v35 = &v52;
        v33 = *(id *)(v22 + 32);
        v34 = *(id *)(v22 + 48);
        v17 = _Block_copy(aBlock);
        if (objc_msgSend(v24, "count"))
        {
          v18 = objc_alloc_init(PKPeerPaymentPendingRequestsRequest);
          -[PKPeerPaymentPendingRequestsRequest setRequestTokens:](v18, "setRequestTokens:", v24);
          v25[0] = v16;
          v25[2] = __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_3;
          v25[3] = &unk_1E2ACD698;
          v29 = &v40;
          v30 = &v52;
          v31 = &v46;
          v19 = *(void **)(v22 + 32);
          v20 = *(void **)(*(_QWORD *)(v22 + 40) + 128);
          v25[1] = 3221225472;
          v26 = v19;
          v27 = v17;
          v28 = *(id *)(v22 + 48);
          objc_msgSend(v20, "peerPaymentPendingRequestsWithRequest:completion:", v18, v25);

        }
        else
        {
          (*((void (**)(void *, uint64_t))v17 + 2))(v17, v47[5]);
        }

        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(&v46, 8);

        _Block_object_dispose(&v52, 8);
        v3 = v23;
        goto LABEL_22;
      }
    }
  }
  v21 = *(_QWORD *)(a1 + 48);
  if (v21)
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v21 + 16))(v21, 1, 0, 0);
LABEL_22:

}

void __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_103(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "sortedArrayUsingComparator:", &__block_literal_global_95);
  v7 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    v3 = (void *)a1[4];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deletePeerPaymentPendingRequestsForRequestTokens:", v4);

  }
  v5 = a1[5];
  v6 = (void *)v7;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, v7, 0);
    v6 = (void *)v7;
  }

}

uint64_t __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "expiryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expiryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __57__PKPeerPaymentController_pendingRequestsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v7 + 16))(v7, 0, 0, v6);
  }
  else
  {
    v24 = v5;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v5, "requestSummaries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v13, "status");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("pending"));

          objc_msgSend(v13, "expiryDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

          if (v15)
            v18 = v17 == -1;
          else
            v18 = 1;
          if (!v18)
          {
            objc_msgSend(v13, "requestToken");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "valueForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              objc_msgSend(v13, "expiryDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setExpiryDate:", v21);

              objc_msgSend(v13, "actions");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setActions:", v22);

              objc_msgSend(v13, "status");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setStatus:", v23);

              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v20);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeObjectForKey:", v19);
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "insertOrUpdatePeerPaymentPendingRequests:shouldScheduleNotifications:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = 0;
    v5 = v24;
  }

}

- (void)performAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  PKPeerPaymentWebService *webService;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a5;
  webService = self->_webService;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__PKPeerPaymentController_performAction_withPaymentIdentifier_completion___block_invoke;
  v11[3] = &unk_1E2ACD6C0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[PKPeerPaymentWebService peerPaymentPerformAction:withPaymentIdentifier:completion:](webService, "peerPaymentPerformAction:withPaymentIdentifier:completion:", a3, a4, v11);

}

void __74__PKPeerPaymentController_performAction_withPaymentIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5)
    v6 = 0;
  else
    v6 = objc_msgSend(v10, "success");
  if (v10)
    v7 = objc_msgSend(v10, "status");
  else
    v7 = -1;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v8 + 16))(*(_QWORD *)(a1 + 40), 1, v7, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v8 + 16))(v8, 0, v7, v9);

    }
  }

}

- (void)performPendingRequestAction:(id)a3 withRequestToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPeerPaymentWebService *webService;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PKPeerPaymentController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  webService = self->_webService;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PKPeerPaymentController_performPendingRequestAction_withRequestToken_completion___block_invoke;
  v15[3] = &unk_1E2ACD6E8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[PKPeerPaymentWebService peerPaymentPendingRequestPerformAction:withRequestToken:completion:](webService, "peerPaymentPendingRequestPerformAction:withRequestToken:completion:", v14, v13, v15);

}

void __83__PKPeerPaymentController_performPendingRequestAction_withRequestToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "success"))
  {
    v11 = 0;
    goto LABEL_9;
  }
  v7 = (__CFString *)*(id *)(a1 + 32);
  v8 = CFSTR("reject");
  if (v7 == v8)
    goto LABEL_24;
  v9 = v8;
  if (v7 && v8)
  {
    v10 = -[__CFString isEqualToString:](v7, "isEqualToString:", v8);

    if ((v10 & 1) != 0)
      goto LABEL_25;
  }
  else
  {

  }
  v7 = (__CFString *)*(id *)(a1 + 32);
  v16 = CFSTR("cancel");
  if (v7 == v16)
  {
LABEL_24:

    goto LABEL_25;
  }
  v17 = v16;
  if (v7 && v16)
  {
    v18 = -[__CFString isEqualToString:](v7, "isEqualToString:", v16);

    if ((v18 & 1) == 0)
      goto LABEL_27;
LABEL_25:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "peerPaymentService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = *(_QWORD *)(a1 + 48);
    v11 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deletePeerPaymentPendingRequestsForRequestTokens:", v20);

    goto LABEL_9;
  }

LABEL_27:
  v11 = 1;
LABEL_9:
  if (*(_QWORD *)(a1 + 56))
  {
    if (v5)
    {
      objc_msgSend(v5, "status");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("unknown");
    }
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 56);
    if (v11)
    {
      (*(void (**)(_QWORD, uint64_t, __CFString *, _QWORD))(v14 + 16))(*(_QWORD *)(a1 + 56), 1, v12, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "displayableErrorForError:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, __CFString *, void *))(v14 + 16))(v14, 0, v13, v15);

    }
  }

}

- (void)statusForPaymentIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  PKPeerPaymentWebService *webService;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    webService = self->_webService;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__PKPeerPaymentController_statusForPaymentIdentifier_withCompletion___block_invoke;
    v11[3] = &unk_1E2ACD710;
    v11[4] = self;
    v12 = v7;
    -[PKPeerPaymentWebService peerPaymentStatusWithPaymentIdentifier:completion:](webService, "peerPaymentStatusWithPaymentIdentifier:completion:", v6, v11);

  }
  else if (v7)
  {
    -[PKPeerPaymentController displayableErrorForError:](self, "displayableErrorForError:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

  }
}

void __69__PKPeerPaymentController_statusForPaymentIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
    {
      (*(void (**)(_QWORD, id, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 40), v8, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "displayableErrorForError:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
  }

}

- (void)handleIdentityVerificationWithError:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend((id)objc_opt_class(), "errorIsIdentityVerificationRequiredError:", v6))
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PKDisplayableError"));

    if (v9)
    {
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v11;
    }
    objc_msgSend(v6, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("PKIdentityVerificationResponse"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PKPeerPaymentWebService peerPaymentService](self->_webService, "peerPaymentService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentIdentityVerificationFlowWithResponse:orientation:completion:", v13, 0, v7);

    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Cannot present identity verification flow because the response data is nil", v16, 2u);
      }

      if (v7)
        v7[2](v7, 0);
    }

  }
  else if (v7)
  {
    v7[2](v7, 0);
  }

}

- (void)handleTermsAcceptanceRequiredWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(), "errorIsTermsAcceptanceRequiredError:", v7);

  if (v8)
  {
    -[PKPeerPaymentWebService peerPaymentService](self->_webService, "peerPaymentService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PKPeerPaymentController_handleTermsAcceptanceRequiredWithError_completion___block_invoke;
    v10[3] = &unk_1E2ACD738;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v9, "updateAccountWithCompletion:", v10);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __77__PKPeerPaymentController_handleTermsAcceptanceRequiredWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "peerPaymentService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentPeerPaymentTermsAndConditionsWithAccount:orientation:completion:", v3, 0, *(_QWORD *)(a1 + 40));

  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Cannot present terms acceptance flow because the account is nil", v7, 2u);
    }

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }

}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKPaymentPass)peerPaymentPass
{
  return self->_peerPaymentPass;
}

- (void)_handleAccountChanged:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PKPeerPaymentController__handleAccountChanged___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__PKPeerPaymentController__handleAccountChanged___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "peerPaymentService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "associatedPassUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passWithUniqueID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentPass");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "updateDeviceScorersWithEncryptedPayloadVersion:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deviceScoreEncryptedPayloadVersion"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "role") == 1)
  {
    v13 = objc_msgSend(v2, "sendRestrictionType");
    if (v13 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendRestrictionType"))
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Resetting peer payment controller since the sendRestrictionType has changed", v16, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "reset");
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", PKPeerPaymentControllerAccountDidChangeNotification, *(_QWORD *)(a1 + 32));

}

+ (id)displayableErrorForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PKDisplayableError"));

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(a1, "_displayableErrorOverrideForUnderlyingError:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_TITLE"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_MESSAGE"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v8, v9, v4, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)displayableErrorForError:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "displayableErrorForError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_displayableErrorOverrideForUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  int v20;
  __CFString *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  __CFString *v36;
  _QWORD v37[3];
  _QWORD v38[3];
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  __CFString *v42;
  _QWORD v43[2];
  _QWORD v44[2];
  void *v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain"));

  if (v7)
  {
    objc_msgSend(v3, "localizedFailureReason");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedRecoverySuggestion");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "code");
    v11 = 0;
    if (v10 > 40311)
    {
      if (v10 == 40312)
      {
        v37[0] = *MEMORY[0x1E0CB2D78];
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_AMBIGUOUS_SENDER_ADDRESS_ERROR_ACTION_OPEN_SETTINGS"), 0);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v36 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v13;
        v38[1] = MEMORY[0x1E0C9AAB0];
        v37[1] = CFSTR("PKDisplayableErrorIsPreferredActionKey");
        v37[2] = CFSTR("PKErrorRecoveryURL");
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2] = v14;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = v38;
        v17 = v37;
        v18 = 3;
LABEL_30:
        objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

        goto LABEL_35;
      }
      if (v10 != 40316)
        goto LABEL_35;
      if (+[PKWalletVisibility isWalletVisible](PKWalletVisibility, "isWalletVisible"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shoebox://%@"), CFSTR("peerPaymentTopUp"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("prefs:root=PASSBOOK&path=");
      }
      v40[0] = *MEMORY[0x1E0CB2D78];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_ADD_MONEY_ACTION_TITLE"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v14;
      v40[1] = CFSTR("PKErrorRecoveryURL");
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v30;
      v31 = (void *)MEMORY[0x1E0C99D80];
      v32 = v41;
      v33 = v40;
LABEL_33:
      objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    }
    if (v10 != 40301)
    {
      if (v10 != 40310)
        goto LABEL_35;
      v43[0] = *MEMORY[0x1E0CB2D78];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_HSA2_ACCOUNT_REQUIRED_ERROR_UPGRADE_ACTION"), 0);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v42 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v13;
      v43[1] = CFSTR("PKErrorRecoveryURL");
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=PASSWORD_AND_SECURITY"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v14;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v44;
      v17 = v43;
      v18 = 2;
      goto LABEL_30;
    }
    if (!objc_msgSend(v5, "role"))
    {
      if (+[PKWalletVisibility isWalletVisible](PKWalletVisibility, "isWalletVisible"))
        v29 = CFSTR("shoebox://");
      else
        v29 = CFSTR("prefs:root=PASSBOOK&path=");
      -[__CFString stringByAppendingString:](v29, "stringByAppendingString:", CFSTR("payment_setup"));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v46[0] = *MEMORY[0x1E0CB2D78];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INSUFFICIENT_BALANCE_ERROR_ADD_CARD_ACTION_TITLE"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v14;
      v46[1] = CFSTR("PKErrorRecoveryURL");
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v30;
      v31 = (void *)MEMORY[0x1E0C99D80];
      v32 = v47;
      v33 = v46;
      goto LABEL_33;
    }
LABEL_23:
    v11 = 0;
    goto LABEL_35;
  }
  objc_msgSend(v3, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v20)
  {
    if (objc_msgSend(v3, "code") == -1009)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_OFFLINE_ERROR_TITLE"), 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("PEER_PAYMENT_OFFLINE_ERROR_MESSAGE");
LABEL_21:
      PKLocalizedPeerPaymentString(&v21->isa, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_20:
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_NETWORK_ERROR_TITLE"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("PEER_PAYMENT_NETWORK_ERROR_MESSAGE");
    goto LABEL_21;
  }
  objc_msgSend(v3, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("PKWebServiceErrorDomain"));

  if (v23)
  {
    v24 = objc_msgSend(v3, "code");
    if ((unint64_t)(v24 - 2) >= 4 && v24)
      goto LABEL_40;
    objc_msgSend(v3, "localizedFailureReason");
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v11 = 0;
      v9 = 0;
      goto LABEL_35;
    }
LABEL_19:
    objc_msgSend(v3, "localizedFailureReason");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedRecoverySuggestion");
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v9 = v28;
    goto LABEL_23;
  }
  objc_msgSend(v3, "domain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("PKPaymentWebServiceErrorDomain"));

  if (v26)
  {
    objc_msgSend(v3, "localizedFailureReason");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_40:
  v11 = 0;
  v9 = 0;
  v8 = 0;
LABEL_35:
  if (v8 | v9)
  {
    PKDisplayableErrorCustomWithType(-1, (void *)v8, (void *)v9, v3, v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (unint64_t)proposedResolutionForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PKDisplayableError"));

  v7 = v4;
  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(a1, "errorIsTermsAcceptanceRequiredError:", v7) & 1) != 0)
  {
    v9 = 2;
  }
  else if ((objc_msgSend(a1, "errorIsIdentityVerificationRequiredError:", v7) & 1) != 0)
  {
    v9 = 3;
  }
  else
  {
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("PKWebServiceErrorDomain")))
    {
      v9 = objc_msgSend(v7, "code") != 1;

    }
    else
    {

      v9 = 1;
    }
  }

  return v9;
}

+ (BOOL)errorIsIdentityVerificationRequiredError:(id)a3
{
  return PKPeerPaymentWebServiceErrorIsIdentityVerificationRequiredError(a3);
}

+ (BOOL)errorIsTermsAcceptanceRequiredError:(id)a3
{
  return PKPeerPaymentWebServiceErrorIsTermsAcceptanceRequiredError(a3);
}

+ (id)_paymentNotCompletedErrorWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "displayableErrorForError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_NOT_COMPLETED"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedRecoverySuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustomWithType(-1, v5, v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_peerPaymentPassURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (+[PKWalletVisibility isWalletVisible](PKWalletVisibility, "isWalletVisible"))
  {
    +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "associatedPassUniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shoebox://cards/%@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSBOOK&path="));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)displayNameForAddress:(id)a3 contactResolver:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_displayNameForRecipientAddress:contactResolver:foundInContacts:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)displayNameForRecipientAddress:(id)a3
{
  return -[PKPeerPaymentController displayNameForRecipientAddress:foundInContacts:](self, "displayNameForRecipientAddress:foundInContacts:", a3, 0);
}

- (id)displayNameForRecipientAddress:(id)a3 foundInContacts:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  -[PKPeerPaymentController _contactResolver](self, "_contactResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_displayNameForRecipientAddress:contactResolver:foundInContacts:", v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_displayNameForRecipientAddress:(id)a3 contactResolver:(id)a4 foundInContacts:(BOOL *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v7 = a3;
  objc_msgSend(a4, "contactForHandle:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a5)
    *a5 = v8 != 0;
  +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:](PKPeerPaymentCounterpartHandleFormatter, "displayNameForCounterpartHandle:contact:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contactForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPeerPaymentController _contactResolver](self, "_contactResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactForHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_contactResolver
{
  PKContactResolver *contactResolver;
  id v4;
  void *v5;
  PKContactResolver *v6;
  PKContactResolver *v7;

  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
    +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys](PKPeerPaymentCounterpartHandleFormatter, "requiredContactKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKContactResolver initWithContactStore:keysToFetch:]([PKContactResolver alloc], "initWithContactStore:keysToFetch:", v4, v5);
    v7 = self->_contactResolver;
    self->_contactResolver = v6;

    contactResolver = self->_contactResolver;
  }
  return contactResolver;
}

- (id)summaryItemsForQuote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  PKPeerPaymentControllerInternalState *is;
  PKPeerPaymentRecipient *recipient;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  NSString *v30;
  void *v31;
  __CFString *accountNumber;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  PKCurrencyAmount *v53;
  void *v54;
  PKCurrencyAmount *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  PKPeerPaymentControllerInternalState *v59;
  PKPeerPaymentRecipient *v60;
  __CFString *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  int v74;
  void *v75;
  void *v76;
  PKPeerPaymentController *v77;
  id obj;
  uint64_t v79;
  uint64_t v80;
  uint8_t buf[16];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalFees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7) ^ 1;

  }
  else
  {
    v8 = 0;
  }
  is = self->_is;
  recipient = is->recipient;
  v74 = v8;
  if (recipient || is->mode == 2)
  {
    if (v8)
    {
      -[PKPeerPaymentRecipient displayName](recipient, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_AMOUNT_TO_PERSON_FORMAT"), CFSTR("%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "totalReceiveAmount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentSummaryItem summaryItemWithLabel:amount:type:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:type:", v12, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v76, "addObject:", v14);
    }
    else
    {
      objc_msgSend(v4, "items");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 == 1 || (objc_msgSend(v4, "isRecurringPayment") & 1) != 0)
      {
        v17 = 0;
        goto LABEL_68;
      }
    }
  }
  v71 = v6;
  v72 = v5;
  v73 = v4;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v5;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
  if (v80)
  {
    v75 = 0;
    v79 = *(_QWORD *)v83;
    v77 = self;
LABEL_13:
    v18 = 0;
    while (2)
    {
      if (*(_QWORD *)v83 != v79)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v18);
      objc_msgSend(v19, "fees");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "totalAmount");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v19, "type"))
      {
        case 1:
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TOP_UP_FEE"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!self->_is->recipient)
          {
            -[PKPass localizedDescription](self->_peerPaymentPass, "localizedDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TOP_UP_ITEM_FORMAT"), CFSTR("%@"), v23);
            goto LABEL_33;
          }
          objc_msgSend(v19, "dpanIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "passWithDPANIdentifier:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            PKLogFacilityTypeGetObject(0xBuLL);
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v43, OS_LOG_TYPE_DEFAULT, "Could not find alternate funding source by DPAN identifier. Displaying unknown card line item.", buf, 2u);
            }

            PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_ITEM_UNKNOWN_CARD"), 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 0;
            goto LABEL_51;
          }
          objc_msgSend(v25, "localizedDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "length"))
          {
            if (v20)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v20, "isEqualToNumber:", v27);

              if ((v28 & 1) == 0)
              {
                v53 = [PKCurrencyAmount alloc];
                objc_msgSend(v19, "feesCurrency");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v53, "initWithAmount:currency:exponent:", v20, v54, 0);

                -[PKCurrencyAmount formattedStringValue](v55, "formattedStringValue");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_ITEM_WITH_FEES_FORMAT"), CFSTR("%@%@"), v26, v56);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                v41 = 1;
                goto LABEL_50;
              }
            }
            PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_ITEM_FORMAT"), CFSTR("%@"), v26);
          }
          else
          {
            PKLogFacilityTypeGetObject(0xBuLL);
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v46, OS_LOG_TYPE_DEFAULT, "Could not get description for alternate funding source pass. Displaying unknown card line item.", buf, 2u);
            }

            PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_ITEM_UNKNOWN_CARD"), 0, v70);
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
LABEL_50:

LABEL_51:
          self = v77;

          goto LABEL_52;
        case 2:
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_FEE"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPass localizedDescription](self->_peerPaymentPass, "localizedDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_ITEM_FORMAT"), CFSTR("%@"), v23);
LABEL_33:
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        case 3:
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CASH_OUT_FEE"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0CB3940];
          v30 = self->_is->accountName;
          PKPANMask();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (self->_is->accountNumber)
            accountNumber = (__CFString *)self->_is->accountNumber;
          else
            accountNumber = &stru_1E2ADF4C0;
          PKFPANSuffixFromFPAN(accountNumber);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("(%@%@)"), v31, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          PKLTRString((uint64_t)v34);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          self = v77;
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CASH_OUT_ITEM_FORMAT"), CFSTR("%@%@"), v30, v23);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
          v41 = 0;
          goto LABEL_52;
        case 4:
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INSTANT_CASH_OUT_FEE"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "receiveAmount");
          v36 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "dpanIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "passWithDPANIdentifier:", v23);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            objc_msgSend(v38, "localizedDescription");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v39, "length"))
            {
              v40 = v39;
            }
            else
            {
              PKLogFacilityTypeGetObject(0xBuLL);
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Could not get description for alternate funding source pass. Displaying unknown card line item.", buf, 2u);
              }

              PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INSTANT_CASH_OUT_UNKNOWN_CARD"), 0);
              v40 = (id)objc_claimAutoreleasedReturnValue();
            }
            v35 = v40;

            self = v77;
          }
          else
          {
            PKLogFacilityTypeGetObject(0xBuLL);
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v42, OS_LOG_TYPE_DEFAULT, "Could not find alternate funding source by DPAN identifier. Displaying unknown card line item.", buf, 2u);
            }

            PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INSTANT_CASH_OUT_UNKNOWN_CARD"), 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v45 = objc_msgSend(v35, "copy");

          v41 = 0;
          v21 = (void *)v36;
          v75 = (void *)v45;
LABEL_52:

          if (!v41)
          {
            if (v22)
            {
              if (v20)
              {
                objc_msgSend(MEMORY[0x1E0CB3598], "zero");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v20, "isEqualToNumber:", v47);

                if ((v48 & 1) == 0)
                {
                  +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v22, v20);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "addObject:", v49);

                }
              }
            }
          }
          if (v35)
          {
            if (v21)
            {
              objc_msgSend(MEMORY[0x1E0CB3598], "zero");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v21, "isEqualToNumber:", v50);

              if ((v51 & 1) == 0)
              {
                +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v35, v21);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "addObject:", v52);

              }
            }
          }
          goto LABEL_61;
        default:
          v35 = 0;
          v22 = 0;
LABEL_61:

          if (v80 != ++v18)
            continue;
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
          v80 = v57;
          if (!v57)
            goto LABEL_67;
          goto LABEL_13;
      }
    }
  }
  v75 = 0;
LABEL_67:

  v5 = v72;
  v4 = v73;
  v6 = v71;
  v17 = (NSString *)v75;
LABEL_68:
  objc_msgSend(v4, "calculatedTotalAmount");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = self->_is;
  v60 = v59->recipient;
  if (!v60)
  {
    if (v59->mode == 2)
    {
      PKLocalizedNearbyPeerPaymentString(CFSTR("TRANSFER_AMOUNT_TO_UNDETERMINED_RECIPIENT"), 0);
      v62 = objc_claimAutoreleasedReturnValue();
      goto LABEL_79;
    }
    objc_msgSend(v4, "firstQuoteItemOfType:", 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
    {
      if (!v17)
        v17 = self->_is->accountName;
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CASH_OUT_TOTAL"), CFSTR("%@"), v17);
      goto LABEL_72;
    }
    if (self->_is->threshold)
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_SHEET_RELOAD_AMOUNT"), 0);
      v62 = objc_claimAutoreleasedReturnValue();
      goto LABEL_79;
    }
    v61 = CFSTR("PEER_PAYMENT_TOP_UP_TOTAL");
LABEL_71:
    PKLocalizedPeerPaymentString(&v61->isa, 0, v70);
LABEL_72:
    v62 = objc_claimAutoreleasedReturnValue();
LABEL_79:
    v64 = (void *)v62;
    goto LABEL_80;
  }
  if (v74)
  {
    v61 = CFSTR("PEER_PAYMENT_TRANSFER_WITH_FEES_TOTAL_DESCRIPTION");
    goto LABEL_71;
  }
  -[PKPeerPaymentRecipient displayName](v60, "displayName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TOTAL_FORMAT"), CFSTR("%@"), v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_80:
  objc_msgSend(v58, "amount");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v64, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v67);

  v68 = (void *)objc_msgSend(v76, "copy");
  return v68;
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  PKPaymentAuthorizationCoordinator *v4;
  NSObject *v5;
  PKPaymentAuthorizationCoordinator *quoteAuthorizationCoordinator;
  _QWORD v7[5];
  uint8_t buf[4];
  PKPeerPaymentController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_quoteAuthorizationCoordinator == v4)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0xCu);
    }

    quoteAuthorizationCoordinator = self->_quoteAuthorizationCoordinator;
    self->_quoteAuthorizationCoordinator = 0;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PKPeerPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v7[3] = &unk_1E2ABE120;
    v7[4] = self;
    -[PKPaymentAuthorizationCoordinator dismissWithCompletion:](v4, "dismissWithCompletion:", v7);
  }

}

void __68__PKPeerPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 96;
  if (!*(_BYTE *)(v1 + 88))
    v2 = 56;
  dispatch_group_leave(*(dispatch_group_t *)(v1 + v2));
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  PKPaymentAuthorizationCoordinator *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  PKPeerPaymentControllerInternalState *is;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  _BOOL4 v28;
  const __CFString *v29;
  PKPeerPaymentQuoteRequest *quoteRequest;
  PKPaymentRequestPaymentMethodUpdate *v31;
  char v32;
  char v33;
  uint64_t v34;
  unsigned int v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  _BYTE v40[10];
  id v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = (PKPaymentAuthorizationCoordinator *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_quoteAuthorizationCoordinator != v8)
    goto LABEL_42;
  PKLogFacilityTypeGetObject(0xBuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v40 = self;
    *(_WORD *)&v40[8] = 2112;
    v41 = v9;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: paymentAuthorizationCoordinator:didSelectPaymentMethod: %@ callback called.", buf, 0x16u);
  }

  objc_msgSend(v9, "paymentPass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "devicePrimaryInAppPaymentApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dpanIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PKPeerPaymentQuoteRequest dpanIdentifier](self->_is->quoteRequest, "dpanIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v15) ^ 1;

    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
    v15 = 0;
  }
  is = self->_is;
  if (!is->supportsPreserveCurrentBalance
    || !-[PKPeerPaymentController _modeIsSendType:](self, "_modeIsSendType:", is->mode))
  {
    v26 = 0;
    goto LABEL_29;
  }
  -[PKPeerPaymentController _defaultAlternateFundingSourceForMode:](self, "_defaultAlternateFundingSourceForMode:", self->_is->mode);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
  {
    v36 = (void *)v19;
    v21 = objc_msgSend(v9, "usePeerPaymentBalance");
    -[PKPeerPaymentQuote firstQuoteItemOfType:](self->_is->quote, "firstQuoteItemOfType:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[PKPeerPaymentQuote preservesCurrentBalance](self->_is->quote, "preservesCurrentBalance");
    v24 = v21;
    v35 = v21 ^ 1;
    if (v21 == v23)
    {
      v33 = v21;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Toggled use peer payment balance. Getting a new quote.", buf, 2u);
      }

      -[PKPeerPaymentQuoteRequest setPreserveCurrentBalance:](self->_is->quoteRequest, "setPreserveCurrentBalance:", v21 ^ 1u);
      v26 = 1;
      v20 = v36;
      if ((v33 & 1) != 0)
        goto LABEL_27;
    }
    else
    {
      v25 = v22 != 0;
      if (v24 == v25)
      {
        v26 = 0;
        v20 = v36;
        if ((v24 & 1) != 0)
        {
LABEL_27:
          -[PKPeerPaymentController updatePreservePeerPaymentBalanceSetting:](self, "updatePreservePeerPaymentBalanceSetting:", v35);
          goto LABEL_28;
        }
      }
      else
      {
        v32 = v24;
        v20 = v36;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v40 = v25;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v35;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Current quote (currentQuoteHasTransferItem: %d) does not match preference for preserveCurrentBalance: %d. Getting a new quote.", buf, 0xEu);
        }

        v26 = 1;
        if ((v32 & 1) != 0)
          goto LABEL_27;
      }
    }
    -[PKPeerPaymentQuoteRequest dpanIdentifier](self->_is->quoteRequest, "dpanIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v27, "length");

    v20 = v36;
    if (!v34)
      -[PKPeerPaymentQuoteRequest updateWithPaymentPass:externalFundingSource:](self->_is->quoteRequest, "updateWithPaymentPass:externalFundingSource:", v36, 1);
    goto LABEL_27;
  }
  -[PKPeerPaymentQuoteRequest setPreserveCurrentBalance:](self->_is->quoteRequest, "setPreserveCurrentBalance:", 0);
  v26 = 0;
LABEL_28:

LABEL_29:
  if (((v17 | v26) & 1) != 0 || -[PKPeerPaymentQuote hasExpired](self->_is->quote, "hasExpired"))
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v28 = -[PKPeerPaymentQuoteRequest preserveCurrentBalance](self->_is->quoteRequest, "preserveCurrentBalance");
      v29 = CFSTR("disabled");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v40 = self;
      *(_WORD *)&v40[8] = 2112;
      if (v28)
        v29 = CFSTR("enabled");
      v41 = v15;
      v42 = 2112;
      v43 = v29;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: Requesting updated quote for dpan %@ with 'preserveCurrentBalance' = %@.", buf, 0x20u);
    }

    if (v13)
      -[PKPeerPaymentQuoteRequest updateWithPaymentPass:](self->_is->quoteRequest, "updateWithPaymentPass:", v13);
    -[PKPeerPaymentQuoteRequest setHasUpdatedPaymentMethod:](self->_is->quoteRequest, "setHasUpdatedPaymentMethod:", 1);
    quoteRequest = self->_is->quoteRequest;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __90__PKPeerPaymentController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke;
    v37[3] = &unk_1E2AC7550;
    v37[4] = self;
    v38 = v10;
    -[PKPeerPaymentController _requestQuoteWithRequest:withCompletion:](self, "_requestQuoteWithRequest:withCompletion:", quoteRequest, v37);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v40 = self;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: New quote request is not required. Returning: PKPaymentAuthorizationStatusSuccess to the authorization controller.", buf, 0xCu);
    }

    -[PKPeerPaymentQuoteRequest setHasUpdatedPaymentMethod:](self->_is->quoteRequest, "setHasUpdatedPaymentMethod:", 0);
    v31 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
    -[PKPaymentRequestUpdate setStatus:](v31, "setStatus:", 0);
    (*((void (**)(id, PKPaymentRequestPaymentMethodUpdate *))v10 + 2))(v10, v31);

  }
LABEL_42:

}

void __90__PKPeerPaymentController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  PKPaymentRequestPaymentMethodUpdate *v8;
  PKPaymentRequestPaymentMethodUpdate *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  v9 = v8;
  if (!v6 || v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), a4);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    -[PKPaymentRequestUpdate setStatus:](v9, "setStatus:", 1);
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v19 = 134218242;
      v20 = v16;
      v21 = 2112;
      v22 = v7;
      v13 = "PKPeerPaymentController %p: Error: Get updated quote failed with error: %@ Returning: PKPaymentAuthorization"
            "StatusFailure to the authorization controller.";
      v14 = v11;
      v15 = 22;
      goto LABEL_7;
    }
  }
  else
  {
    -[PKPaymentRequestPaymentMethodUpdate setPeerPaymentQuote:](v8, "setPeerPaymentQuote:", v6);
    objc_msgSend(*(id *)(a1 + 32), "summaryItemsForQuote:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequestUpdate setPaymentSummaryItems:](v9, "setPaymentSummaryItems:", v10);

    -[PKPaymentRequestUpdate setStatus:](v9, "setStatus:", 0);
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v19 = 134217984;
      v20 = v12;
      v13 = "PKPeerPaymentController %p: Get updated quote succeeded. Returning: PKPaymentAuthorizationStatusSuccess to t"
            "he authorization controller.";
      v14 = v11;
      v15 = 12;
LABEL_7:
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    }
  }

  (*(void (**)(_QWORD, PKPaymentRequestPaymentMethodUpdate *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9, v17, v18);
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSceneIdentifierForPeerPaymentController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)presentationSceneBundleIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSceneBundleIdentifierForPeerPaymentController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_contactInfoIsValidForAuthorizedQuote:(id)a3 errors:(id *)a4
{
  id v6;
  id v7;
  void *v8;
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
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  BOOL v41;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_is->mode - 5 <= 1)
  {
    objc_msgSend(v6, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "givenName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "length"))
        {
          PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_FIRST_NAME"), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("name"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        objc_msgSend(v11, "familyName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "length"))
        {
          PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_LAST_NAME"), 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("name"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);

        }
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_NAME"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("name"), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);
      }

      objc_msgSend(v9, "postalAddress");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v19;
      if (v19)
      {
        objc_msgSend(v19, "street");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");

        if (!v21)
        {
          PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_STREET"), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("post"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v23);

        }
        objc_msgSend(v18, "city");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "length");

        if (!v25)
        {
          PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_CITY"), 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("post"), v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v27);

        }
        objc_msgSend(v18, "state");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length");

        if (!v29)
        {
          PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_STATE"), 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("post"), v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v31);

        }
        objc_msgSend(v18, "postalCode");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "length");

        if (!v33)
        {
          PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_POSTAL_CODE"), 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("post"), v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v35);

        }
        objc_msgSend(v18, "country");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "length");

        if (v37)
          goto LABEL_23;
        v38 = CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_COUNTRY");
      }
      else
      {
        v38 = CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_BILLING_ADDRESS");
      }
      PKLocalizedPaymentString(&v38->isa, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("post"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v40);

    }
    else
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_CONTACT_INVALID_BILLING_ADDRESS"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:", CFSTR("post"), v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v18);
    }
LABEL_23:

  }
  if (a4)
    *a4 = (id)objc_msgSend(v7, "copy");
  v41 = objc_msgSend(v7, "count") == 0;

  return v41;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5
{
  PKPaymentAuthorizationCoordinator *v8;
  PKPaymentAuthorizationResult *v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  PKPaymentAuthorizationResult *v13;
  PKPeerPaymentControllerInternalState *is;
  NSError *quoteAuthorizationError;
  NSObject *performQuoteGroup;
  PKAuthorizedPeerPaymentQuote *authorizedQuote;
  PKPaymentAuthorizationResult *v18;
  PKPaymentAuthorizationResult *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  PKPeerPaymentController *v25;
  __int16 v26;
  PKPaymentAuthorizationResult *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (PKPaymentAuthorizationCoordinator *)a3;
  v9 = (PKPaymentAuthorizationResult *)a4;
  v10 = a5;
  if (self->_quoteAuthorizationCoordinator == v8)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: paymentAuthorizationCoordinator:didAuthorizePeerPaymentQuote: %@ callback called.", buf, 0x16u);
    }

    if (v9)
    {
      v23 = 0;
      v12 = -[PKPeerPaymentController _contactInfoIsValidForAuthorizedQuote:errors:](self, "_contactInfoIsValidForAuthorizedQuote:errors:", v9, &v23);
      v13 = (PKPaymentAuthorizationResult *)v23;
      if (v12)
      {
        is = self->_is;
        self->_quoteAuthorizationSuccess = 1;
        -[PKPaymentAuthorizationResult setPaymentMethodType:](v9, "setPaymentMethodType:", -[PKPeerPaymentQuoteRequest paymentMethodType](is->quoteRequest, "paymentMethodType"));
        objc_storeStrong((id *)&self->_is->authorizedQuote, a4);
        quoteAuthorizationError = self->_quoteAuthorizationError;
        self->_quoteAuthorizationError = 0;

        if (self->_performOnAuthorization)
        {
          dispatch_group_leave((dispatch_group_t)self->_quoteAuthorizationGroup);
          performQuoteGroup = self->_performQuoteGroup;
          if (performQuoteGroup)
            dispatch_group_enter(performQuoteGroup);
          objc_initWeak((id *)buf, self);
          authorizedQuote = self->_is->authorizedQuote;
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __96__PKPeerPaymentController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke;
          v20[3] = &unk_1E2ACD760;
          objc_copyWeak(&v22, (id *)buf);
          v20[4] = self;
          v21 = v10;
          -[PKPeerPaymentController _performAuthorizedQuote:completion:](self, "_performAuthorizedQuote:completion:", authorizedQuote, v20);

          objc_destroyWeak(&v22);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v19 = objc_alloc_init(PKPaymentAuthorizationResult);
          -[PKPaymentAuthorizationResult setStatus:](v19, "setStatus:", !self->_quoteAuthorizationSuccess);
          (*((void (**)(id, PKPaymentAuthorizationResult *))v10 + 2))(v10, v19);

        }
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v25 = self;
          v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: contact information was invalid with errors %@. returning PKPaymentAuthorizationStatusFailure.", buf, 0x16u);
        }

        v18 = -[PKPaymentAuthorizationResult initWithStatus:errors:]([PKPaymentAuthorizationResult alloc], "initWithStatus:errors:", 1, v13);
        (*((void (**)(id, PKPaymentAuthorizationResult *))v10 + 2))(v10, v18);

      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = self;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: authorizedPeerPaymentQuote was nil. returning PKPaymentAuthorizationStatusFailure.", buf, 0xCu);
      }

      v13 = -[PKPaymentAuthorizationResult initWithStatus:errors:]([PKPaymentAuthorizationResult alloc], "initWithStatus:errors:", 1, 0);
      (*((void (**)(id, PKPaymentAuthorizationResult *))v10 + 2))(v10, v13);
    }

  }
}

void __96__PKPeerPaymentController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *WeakRetained;
  id v8;
  PKPaymentAuthorizationResult *v9;
  PKPaymentAuthorizationResult *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  PKPeerPaymentTransactionMetadata *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  PKPaymentAuthorizationResult *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_27;
  v8 = v6;
  v9 = objc_alloc_init(PKPaymentAuthorizationResult);
  v10 = v9;
  if (v5 && !v8)
  {
    -[PKPaymentAuthorizationResult setStatus:](v9, "setStatus:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "devicePrimaryInAppPaymentApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dpanIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "transactionIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v8)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      v15 = objc_alloc_init(PKPeerPaymentTransactionMetadata);
      -[PKPeerPaymentTransactionMetadata setDPANIdentifier:](v15, "setDPANIdentifier:", v8);
      -[PKPeerPaymentTransactionMetadata setServiceIdentifier:](v15, "setServiceIdentifier:", v13);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56), "deviceScoreIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentTransactionMetadata setRequestDeviceScoreIdentifier:](v15, "setRequestDeviceScoreIdentifier:", v16);

      objc_msgSend(v5, "deviceScoreIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentTransactionMetadata setSendDeviceScoreIdentifier:](v15, "setSendDeviceScoreIdentifier:", v17);

      -[PKPaymentAuthorizationResult setPeerPaymentTransactionMetadata:](v10, "setPeerPaymentTransactionMetadata:", v15);
    }
    WeakRetained[112] = 1;

    v18 = 0;
    goto LABEL_19;
  }
  -[PKPaymentAuthorizationResult setStatus:](v9, "setStatus:", 1);
  objc_msgSend(v8, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "isEqualToString:", CFSTR("PKPeerPaymentWebServiceErrorDomain")))
    goto LABEL_14;
  v20 = objc_msgSend(v8, "code");

  if (v20 == 40397)
  {
    objc_msgSend(v8, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0CB2D68]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "length"))
    {
      -[PKPaymentAuthorizationResult setLocalizedErrorMessageOverride:](v10, "setLocalizedErrorMessageOverride:", v19);

      v8 = 0;
    }
LABEL_14:

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16) == 2)
    objc_msgSend(WeakRetained, "_resetToState:", 4);
  WeakRetained[112] = 0;
  if (!v8)
  {
    v18 = 0;
    goto LABEL_20;
  }
  objc_msgSend((id)objc_opt_class(), "_paymentNotCompletedErrorWithError:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
  PKLogFacilityTypeGetObject(0xBuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("YES");
    v24 = *(_QWORD *)(a1 + 32);
    v26 = 134218754;
    if (!v5)
      v23 = CFSTR("NO");
    v27 = v24;
    v28 = 2112;
    v29 = v23;
    v30 = 2112;
    v31 = v18;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentController %p: perform quote finished with success: %@, returning error: %@, returning: %@ to the authorization controller.", (uint8_t *)&v26, 0x2Au);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  v25 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (v25)
    dispatch_group_leave(v25);

LABEL_27:
}

+ (void)_sendAuthorizedQuoteAnalyticsWithSuccess:(BOOL)a3 mode:(unint64_t)a4 authorizedQuote:(id)a5 status:(int64_t)a6
{
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  const __CFString **v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v8 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  PKLogFacilityTypeGetObject(0xBuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v9;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "NearbyPeerPayment: sending analytics for authorized quote: %@", buf, 0xCu);
  }

  objc_msgSend(v9, "peerPaymentQuote");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "totalReceiveAmount");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (a4 == 5)
  {
    if (v8)
    {
      v27 = CFSTR("success");
      v28 = CFSTR("amount");
      v29 = MEMORY[0x1E0C9AAB0];
      v30 = v12;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v29;
      v16 = &v27;
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  if (a4 == 4)
  {
    if (v8)
    {
      v31 = CFSTR("success");
      v32 = CFSTR("amount");
      v33 = MEMORY[0x1E0C9AAB0];
      v34 = v12;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v33;
      v16 = &v31;
LABEL_9:
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 2, v27, v28, v29, v30, v31, v32, v33, v34);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();
LABEL_21:

      goto LABEL_22;
    }
LABEL_15:
    AnalyticsSendEvent();
    goto LABEL_22;
  }
  if (a4 - 1 <= 1)
  {
    if (v8)
    {
      objc_msgSend(v11, "items");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      objc_msgSend(v11, "items");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19 == 1)
      {
        objc_msgSend(v20, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "type") == 1)
          objc_msgSend(v9, "paymentMethodType");
        AnalyticsSendEvent();

        goto LABEL_20;
      }
      v23 = objc_msgSend(v20, "count");

      if (v23 != 2)
      {
LABEL_20:
        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        PKAnalyticsAmountCategoryForAmount(v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("p2pAmountCategory"));

        objc_msgSend(v11, "totalReceiveAmountCurrency");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v25, CFSTR("p2pCurrency"));

        PKPeerPaymentStatusToString(a6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v26, CFSTR("p2pPerformStatus"));

        PKAnalyticsSendEventWithDailyLimit(CFSTR("com.apple.wallet.peer.payment.perform"), v17, 2);
        goto LABEL_21;
      }
      objc_msgSend(v9, "paymentMethodType");
    }
    AnalyticsSendEvent();
    goto LABEL_20;
  }
LABEL_22:

}

- (id)internalState
{
  return self->_is;
}

- (void)_setPerformQuoteSuccess:(BOOL)a3
{
  self->_quoteAuthorizationSuccess = a3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; state: %@>"),
                       objc_opt_class(),
                       self,
                       self->_is);
}

- (void)updatePreservePeerPaymentBalanceSetting:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PKObject settings](self->_peerPaymentPass, "settings");
  if (((v5 >> 11) & 1) != v3)
  {
    v6 = 2048;
    if (!v3)
      v6 = 0;
    -[PKObject setSettings:](self->_peerPaymentPass, "setSettings:", v5 & 0xFFFFFFFFFFFFF7FFLL | v6);
  }
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (PKPeerPaymentControllerDelegate)delegate
{
  return (PKPeerPaymentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_performQuoteError, 0);
  objc_storeStrong((id *)&self->_performQuoteCallbackQueue, 0);
  objc_storeStrong((id *)&self->_performQuoteGroup, 0);
  objc_storeStrong((id *)&self->_quoteAuthorizationError, 0);
  objc_storeStrong((id *)&self->_quoteAuthorizationCallbackQueue, 0);
  objc_storeStrong((id *)&self->_quoteAuthorizationGroup, 0);
  objc_storeStrong((id *)&self->_quoteAuthorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_is, 0);
}

- (void)identifyRecipientWithAddress:(id)a3 completion:(id)a4
{
  -[PKPeerPaymentController identifyRecipientWithAddress:senderAddress:completion:](self, "identifyRecipientWithAddress:senderAddress:completion:", a3, 0, a4);
}

- (void)requestTokenForAmount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPeerPaymentController_PKDeprecated__requestTokenForAmount_completion___block_invoke;
  v8[3] = &unk_1E2ACD788;
  v9 = v6;
  v7 = v6;
  -[PKPeerPaymentController formalRequestTokenForAmount:source:completion:](self, "formalRequestTokenForAmount:source:completion:", a3, 0, v8);

}

void __74__PKPeerPaymentController_PKDeprecated__requestTokenForAmount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  id v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v7 = a4;
    objc_msgSend(a3, "requestToken");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, a2, v8, v7);

  }
}

@end
