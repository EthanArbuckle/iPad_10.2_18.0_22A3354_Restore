@implementation PKPayLaterFinancingController

- (PKPayLaterFinancingController)initWithAccountService:(id)a3 paymentService:(id)a4 peerPaymentService:(id)a5 paymentWebService:(id)a6 passLibrary:(id)a7 payLaterAccount:(id)a8 configuration:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  PKPayLaterFinancingController *v20;
  id v21;
  PKPayLaterFinancingController *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  uint64_t v26;
  PKPeerPaymentAccount *peerPaymentAccount;
  uint64_t v28;
  NSHashTable *observers;
  NSMutableOrderedSet *v30;
  NSMutableOrderedSet *queuedRequests;
  dispatch_queue_t v32;
  OS_dispatch_queue *replyQueue;
  id v35;
  id obj;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[16];
  objc_super v43;

  v16 = a3;
  obj = a4;
  v40 = a4;
  v17 = a5;
  v18 = a6;
  v41 = a7;
  v37 = a8;
  v38 = a8;
  v19 = a9;
  v20 = 0;
  v39 = v17;
  if (v19 && v17 && v41 && v40 && v16 && v18)
  {
    v21 = v19;
    v43.receiver = self;
    v43.super_class = (Class)PKPayLaterFinancingController;
    v22 = -[PKPayLaterFinancingController init](&v43, sel_init);
    if (v22)
    {
      v35 = v16;
      PKLogFacilityTypeGetObject(0x22uLL);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_id_make_with_pointer(v23, v22);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v24;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18FC92000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v25, "request:paylater:financingOptions", ", buf, 2u);
        }
      }

      objc_storeStrong((id *)&v22->_accountService, a3);
      objc_storeStrong((id *)&v22->_paymentWebService, a6);
      objc_storeStrong((id *)&v22->_peerPaymentService, a5);
      objc_msgSend(v39, "account");
      v26 = objc_claimAutoreleasedReturnValue();
      peerPaymentAccount = v22->_peerPaymentAccount;
      v22->_peerPaymentAccount = (PKPeerPaymentAccount *)v26;

      objc_storeStrong((id *)&v22->_passLibrary, a7);
      objc_storeStrong((id *)&v22->_paymentService, obj);
      objc_storeStrong((id *)&v22->_configuration, a9);
      objc_storeStrong((id *)&v22->_payLaterAccount, v37);
      v22->_lockObservers._os_unfair_lock_opaque = 0;
      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v28 = objc_claimAutoreleasedReturnValue();
      observers = v22->_observers;
      v22->_observers = (NSHashTable *)v28;

      v30 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      queuedRequests = v22->_queuedRequests;
      v22->_queuedRequests = v30;

      v32 = dispatch_queue_create("com.apple.passkit.PKPayLaterFinancingController.reply", 0);
      replyQueue = v22->_replyQueue;
      v22->_replyQueue = (OS_dispatch_queue *)v32;

      v22->_loadingState = 1;
      v22->_optionFetchIneligibleReason = 0;
      -[PKAccountService registerObserver:](v22->_accountService, "registerObserver:", v22);
      -[PKPayLaterFinancingController _payLaterAccountWithCompletion:](v22, "_payLaterAccountWithCompletion:", 0);
      v16 = v35;
    }
    self = v22;
    v20 = self;
    v19 = v21;
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPayLaterFinancingController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterFinancingController;
  -[PKPayLaterFinancingController dealloc](&v3, sel_dealloc);
}

- (id)dynamicContentPageItemForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5
{
  void *v5;
  void *v6;

  -[PKPayLaterDynamicContent dynamicContentPageForPageType:productType:optionIdentifier:](self->_dynamicContent, "dynamicContentPageForPageType:productType:optionIdentifier:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bnplPayLaterTabDynamicContentItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPayLaterProductAssessmentCollection productAssessmentForProductType:](self->_assessmentCollection, "productAssessmentForProductType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "financingOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterFinancingController dynamicContentPageItemForPageType:productType:optionIdentifier:](self, "dynamicContentPageItemForPageType:productType:optionIdentifier:", 1, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dynamicContentSectionsForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5
{
  void *v5;
  void *v6;

  -[PKPayLaterDynamicContent dynamicContentPageForPageType:productType:optionIdentifier:](self->_dynamicContent, "dynamicContentPageForPageType:productType:optionIdentifier:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dynamicContentPageForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5
{
  return -[PKPayLaterDynamicContent dynamicContentPageForPageType:productType:optionIdentifier:](self->_dynamicContent, "dynamicContentPageForPageType:productType:optionIdentifier:", a3, a4, a5);
}

- (PKPaymentPass)payLaterPass
{
  PKPaymentPass *payLaterPass;
  PKPassLibrary *passLibrary;
  void *v5;
  void *v6;
  PKPaymentPass *v7;
  PKPaymentPass *v8;

  payLaterPass = self->_payLaterPass;
  if (!payLaterPass)
  {
    passLibrary = self->_passLibrary;
    -[PKAccount associatedPassUniqueID](self->_payLaterAccount, "associatedPassUniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLibrary passWithUniqueID:](passLibrary, "passWithUniqueID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentPass");
    v7 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
    v8 = self->_payLaterPass;
    self->_payLaterPass = v7;

    payLaterPass = self->_payLaterPass;
  }
  return payLaterPass;
}

- (void)setPayLaterAccount:(id)a3
{
  PKAccount *v5;
  PKAccount *payLaterAccount;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = (PKAccount *)a3;
  payLaterAccount = self->_payLaterAccount;
  if (v5 && payLaterAccount)
  {
    if (-[PKAccount isEqual:](payLaterAccount, "isEqual:", v5))
      goto LABEL_14;
  }
  else if (payLaterAccount == v5)
  {
    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Pay later account changed", buf, 2u);
  }

  -[PKPayLaterFinancingController payLaterPass](self, "payLaterPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_payLaterAccount, a3);
  -[PKPayLaterFinancingController payLaterPass](self, "payLaterPass");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8 && v9)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPayLaterFinancingController: The pay later pass is now provisioned", v12, 2u);
    }

    -[PKPayLaterFinancingController _updatePayLaterPassEligibility](self, "_updatePayLaterPassEligibility");
    -[PKPayLaterFinancingController refreshAvailableFundingSources](self, "refreshAvailableFundingSources");
    -[PKPayLaterFinancingController _informObserversAssessmentCollectionChanged](self, "_informObserversAssessmentCollectionChanged");
  }

LABEL_14:
}

- (void)updateFinancingOptionsWithCompletion:(id)a3
{
  id v4;
  PKPayLaterFinancingControllerRequest *v5;
  void *v6;
  PKPayLaterFinancingControllerRequest *v7;

  v4 = a3;
  v5 = [PKPayLaterFinancingControllerRequest alloc];
  -[PKPayLaterFinancingControllerConfiguration transactionAmount](self->_configuration, "transactionAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPayLaterFinancingControllerRequest initWithTransactionAmount:completion:](v5, "initWithTransactionAmount:completion:", v6, v4);

  -[PKPayLaterFinancingController _addFinancingOptionRequest:](self, "_addFinancingOptionRequest:", v7);
}

- (void)stateMachineUpdatedAuthenticationState:(unint64_t)a3 selectedOptionIdentifier:(id)a4 error:(id)a5 cancelReason:(int64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  PKPayLaterFinancingControllerRequest *v18;
  void *v19;
  PKPayLaterFinancingControllerRequest *v20;
  __CFString *v21;
  PKPayLaterFinancingController *v22;
  PKPayLaterFinancingControllerRequest *pendingCancellationRequest;
  PKPayLaterFinancingControllerRequest *v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 5)
        v13 = CFSTR("error");
      else
        v13 = off_1E2ACC580[a3];
      v25 = 138412802;
      v26 = v13;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Received state machine authentication state: %@, optionIdentifier: %@, error %@", (uint8_t *)&v25, 0x20u);
    }

    objc_msgSend(v11, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = v15;
    else
      v16 = v11;
    v17 = v16;

    v18 = [PKPayLaterFinancingControllerRequest alloc];
    -[PKPayLaterFinancingControllerConfiguration transactionAmount](self->_configuration, "transactionAmount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PKPayLaterFinancingControllerRequest initWithTransactionAmount:optionIdentifierToCancel:authenticationState:stateMachineError:stateMachineCancelReason:completion:](v18, "initWithTransactionAmount:optionIdentifierToCancel:authenticationState:stateMachineError:stateMachineCancelReason:completion:", v19, v10, a3, v17, a6, 0);

    switch(a3)
    {
      case 1uLL:
      case 4uLL:
        objc_storeStrong((id *)&self->_pendingCancellationRequest, v20);
        break;
      case 2uLL:
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          PKPaymentAuthorizationStateMachineCancelReasonToString(a6);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v25 = 138412290;
          v26 = v21;
          _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "State machine cancelation reason: %@", (uint8_t *)&v25, 0xCu);

        }
        -[PKPayLaterFinancingController _addFinancingOptionRequest:](self, "_addFinancingOptionRequest:", v20);
        break;
      case 3uLL:
        if (self->_pendingCancellationRequest)
        {
          v22 = self;
          pendingCancellationRequest = v20;
          goto LABEL_19;
        }
        break;
      case 5uLL:
        pendingCancellationRequest = self->_pendingCancellationRequest;
        if (pendingCancellationRequest)
        {
          v22 = self;
LABEL_19:
          -[PKPayLaterFinancingController _addFinancingOptionRequest:](v22, "_addFinancingOptionRequest:", pendingCancellationRequest);
          v24 = self->_pendingCancellationRequest;
          self->_pendingCancellationRequest = 0;

        }
        break;
      default:
        break;
    }

    v11 = v17;
  }

}

- (void)fetchPayLaterDynamicContentForType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  PKAsyncUnaryOperationComposer *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[6];
  id v18[2];
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__30;
  v23[4] = __Block_byref_object_dispose__30;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__30;
  v21[4] = __Block_byref_object_dispose__30;
  v22 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke;
  v19[3] = &unk_1E2ACC218;
  v19[1] = 3221225472;
  objc_copyWeak(&v20, &location);
  -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v19);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_4;
  v17[3] = &unk_1E2ACC290;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a3;
  v17[4] = v21;
  v17[5] = v23;
  -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v17);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_8;
  v12[3] = &unk_1E2ACC2E0;
  objc_copyWeak(&v16, &location);
  v14 = v23;
  v15 = v21;
  v10 = v6;
  v13 = v10;
  v11 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v7, "evaluateWithInput:completion:", v9, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(v18);
  objc_destroyWeak(&v20);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
  objc_destroyWeak(&location);

}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_2;
    v9[3] = &unk_1E2AC3040;
    v11 = v7;
    v10 = v6;
    objc_msgSend(WeakRetained, "_payLaterAccountWithCompletion:", v9);

  }
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_3;
  block[3] = &unk_1E2ABDA68;
  v8 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(a1[6] + 16))(a1[6], a1[4], a1[5] == 0);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  id v14[2];

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_5;
  v10[3] = &unk_1E2ACC268;
  objc_copyWeak(v14, (id *)(a1 + 48));
  v14[1] = *(id *)(a1 + 56);
  v13 = *(_OWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(v14);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_5(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  PKAccountWebServicePayLaterContentRequest *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  uint64_t v13;
  id v14;

  v2 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(PKAccountWebServicePayLaterContentRequest);
    objc_msgSend(WeakRetained[3], "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServicePayLaterContentRequest setAccountIdentifier:](v4, "setAccountIdentifier:", v5);

    objc_msgSend(WeakRetained[3], "accountBaseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServicePayLaterContentRequest setBaseURL:](v4, "setBaseURL:", v6);

    -[PKAccountWebServicePayLaterContentRequest setType:](v4, "setType:", *(_QWORD *)(a1 + 72));
    v7 = WeakRetained[28];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_6;
    v10[3] = &unk_1E2ACC240;
    objc_copyWeak(&v14, v2);
    v13 = *(_QWORD *)(a1 + 56);
    v9 = *(_OWORD *)(a1 + 40);
    v8 = (id)v9;
    v12 = v9;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v7, "accountPayLaterContentWithRequest:completion:", v4, v10);

    objc_destroyWeak(&v14);
  }

}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_7;
  block[3] = &unk_1E2ACC3F8;
  objc_copyWeak(&v17, (id *)(a1 + 64));
  v16 = *(_QWORD *)(a1 + 56);
  v12 = v6;
  v13 = v5;
  v10 = *(_OWORD *)(a1 + 40);
  v7 = (id)v10;
  v15 = v10;
  v14 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v17);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 32);
    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "dynamicContent");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v3 != 0);
    WeakRetained = v7;
  }

}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint64_t v13;
  id v14;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_9;
  block[3] = &unk_1E2ACC2B8;
  objc_copyWeak(&v14, (id *)(a1 + 56));
  v6 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v13 = v6;
  v9 = *(_OWORD *)(a1 + 32);
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
      || objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      if (v4)
      {
        v5 = v4;
        v6 = *(void **)(v3 + 40);
        *(_QWORD *)(v3 + 40) = v5;
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_TITLE"), 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_MESSAGE"), 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PKDisplayableErrorCustomWithType(-1, v6, v7, 0, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
    }
    objc_storeStrong(v11 + 24, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v11;
  }

}

- (void)refreshAvailableFundingSources
{
  _QWORD v3[5];

  -[PKPayLaterAvailableFundingSourcesFilter clearCache](self->_availableFundingSourcesFilter, "clearCache");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PKPayLaterFinancingController_refreshAvailableFundingSources__block_invoke;
  v3[3] = &unk_1E2ACC308;
  v3[4] = self;
  -[PKPayLaterFinancingController _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v3);
}

void __63__PKPayLaterFinancingController_refreshAvailableFundingSources__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "payLaterAvailableFundingSourcesDidChange:", *(_QWORD *)(a1 + 32));

}

- (void)invalidate
{
  PKPayLaterFinancingControllerRequest *pendingCancellationRequest;

  pendingCancellationRequest = self->_pendingCancellationRequest;
  self->_pendingCancellationRequest = 0;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  if (self->_didBeginAnalyticsReporter)
  {
    +[PKAnalyticsReporter endSubjectReporting:](PKAnalyticsReporter, "endSubjectReporting:", CFSTR("fpsEngagement"));
    self->_didBeginAnalyticsReporter = 0;
  }
}

- (id)availableFundingSourcesForFinancingOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *bankFundingSources;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "supportedRepaymentTypes") & 8) != 0)
  {
    objc_msgSend(v4, "supportedRepaymentFundingSourceIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    bankFundingSources = self->_bankFundingSources;
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary dictionaryWithValuesForKeys:](bankFundingSources, "dictionaryWithValuesForKeys:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[PKPayLaterAvailableFundingSourcesFilter availableFundingSourcesForFinancingOption:eligibleBankSources:lastUsedFundingSources:](self->_availableFundingSourcesFilter, "availableFundingSourcesForFinancingOption:eligibleBankSources:lastUsedFundingSources:", v4, v5, self->_lastUsedFundingSources);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PKCurrencyAmount)transactionCurrencyAmount
{
  NSDecimalNumber *v3;
  NSString *v4;
  NSString *v5;
  BOOL v6;
  void *v7;

  -[PKPayLaterFinancingControllerConfiguration transactionAmount](self->_configuration, "transactionAmount");
  v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingControllerConfiguration currencyCode](self->_configuration, "currencyCode");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    PKCurrencyAmountCreate(v3, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (PKCurrencyAmount *)v7;
}

- (void)setSelectedFundingSource:(id)a3
{
  void *v4;
  void *v5;
  PKPayLaterPaymentSource *selectedFundingSource;
  PKPayLaterPaymentSource *v7;
  PKPayLaterPaymentSource *v8;
  char v9;
  PKPayLaterPaymentSource *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPaymentSource identifier](self->_selectedFundingSource, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  selectedFundingSource = v4;
  v7 = v5;
  if (selectedFundingSource == v7)
  {

  }
  else
  {
    v8 = v7;
    if (selectedFundingSource && v7)
    {
      v9 = -[PKPayLaterPaymentSource isEqualToString:](selectedFundingSource, "isEqualToString:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    v10 = (PKPayLaterPaymentSource *)v11;
    selectedFundingSource = self->_selectedFundingSource;
    self->_selectedFundingSource = v10;
  }

LABEL_10:
}

- (BOOL)canShowPayLaterTab
{
  PKPayLaterFinancingController *v2;
  PKAccount *payLaterAccount;
  void *v4;

  v2 = self;
  payLaterAccount = self->_payLaterAccount;
  -[PKPayLaterFinancingControllerConfiguration transactionAmount](self->_configuration, "transactionAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[PKPayLaterFinancingController _eligibleToFetchFinancingOptionsWithPayLaterAccount:transactionAmount:](v2, "_eligibleToFetchFinancingOptionsWithPayLaterAccount:transactionAmount:", payLaterAccount, v4);

  return (char)v2;
}

- (void)accountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPayLaterFinancingController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PKPayLaterFinancingController_accountChanged___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __48__PKPayLaterFinancingController_accountChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  char v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "feature") != 3)
    return;
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  v4 = v3;
  if (v6 == v4)
  {

    goto LABEL_8;
  }
  if (!v6 || !v4)
  {

    return;
  }
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "setPayLaterAccount:", *(_QWORD *)(a1 + 32));
}

- (void)accountAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPayLaterFinancingController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PKPayLaterFinancingController_accountAdded___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __46__PKPayLaterFinancingController_accountAdded___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = objc_msgSend(*(id *)(a1 + 32), "feature");
  if (result == 3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pay later account added", v4, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(a1 + 32));
    return objc_msgSend(*(id *)(a1 + 40), "updateFinancingOptionsWithCompletion:", 0);
  }
  return result;
}

- (void)accountRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPayLaterFinancingController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PKPayLaterFinancingController_accountRemoved___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __48__PKPayLaterFinancingController_accountRemoved___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  result = objc_msgSend(*(id *)(a1 + 32), "feature");
  if (result == 3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pay later account removed", v6, 2u);
    }

    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

    return objc_msgSend(*(id *)(a1 + 40), "updateFinancingOptionsWithCompletion:", 0);
  }
  return result;
}

- (BOOL)_eligibleToFetchFinancingOptionsWithPayLaterAccount:(id)a3 transactionAmount:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  BOOL v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_payLaterAccount)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because there is no pay later account defined", buf, 2u);
    }

    v10 = 0;
    v11 = 2;
    goto LABEL_42;
  }
  v8 = -[PKPayLaterFinancingControllerConfiguration channel](self->_configuration, "channel");
  if (v8 - 2 < 2)
  {
    if (objc_msgSend(v6, "hidePayLaterSetupInWallet"))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since \"hidePayLaterSetupInWallet\" is true.", buf, 2u);
      }

      v10 = 0;
      v11 = 10;
      goto LABEL_42;
    }
    goto LABEL_31;
  }
  if (v8)
  {
    if (v8 != 1)
      goto LABEL_31;
    if (objc_msgSend(v6, "hidePayLaterInPaymentSheet"))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since \"hidePayLaterInPaymentSheet\" is true.", buf, 2u);
      }

      v10 = 0;
      v11 = 11;
      goto LABEL_42;
    }
    if (_os_feature_enabled_impl())
    {
      -[PKPayLaterFinancingController payLaterPass](self, "payLaterPass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (PKHideCardBenefitPayLater())
        {
          PKLogFacilityTypeGetObject(6uLL);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because the user has turned off the \"Pay Later Card Benefit\" switch in settings", buf, 2u);
          }

          v10 = 0;
          v11 = 12;
          goto LABEL_42;
        }
LABEL_31:
        if (!v7)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because there is no transactionAmount defined", buf, 2u);
          }

          v10 = 0;
          v11 = 3;
          goto LABEL_42;
        }
        -[PKPayLaterFinancingControllerConfiguration currencyCode](self->_configuration, "currencyCode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because there is no currencyCode defined", buf, 2u);
          }

          v10 = 0;
          self->_optionFetchIneligibleReason = 4;
          goto LABEL_56;
        }
        objc_msgSend(v6, "payLaterDetails");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "countryCode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        PKCurrentRegion();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "payLaterDetails");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isPayLaterSupportedInCurrentRegion");

        if ((v22 & 1) == 0)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v45 = v19;
            v46 = 2112;
            v47 = v20;
            _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since the account countryCode: %@, doesn't match the device country code: %@", buf, 0x16u);
          }

          v10 = 0;
          self->_optionFetchIneligibleReason = 5;
          goto LABEL_55;
        }
        -[PKPaymentWebService context](self->_paymentWebService, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "configuration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "applyServiceEnabledForRegion:", v20) & 1) == 0)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since apply service is not enabled for device region", buf, 2u);
          }

          v10 = 0;
          v26 = 6;
          goto LABEL_53;
        }
        if (PKIsManagedAppleID())
        {
          PKLogFacilityTypeGetObject(6uLL);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since pay later feature is not supported for Managed Apple ID", buf, 2u);
          }

          v10 = 0;
          v26 = 8;
LABEL_53:
          self->_optionFetchIneligibleReason = v26;
LABEL_54:

LABEL_55:
LABEL_56:

          goto LABEL_43;
        }
        v40 = v24;
        objc_msgSend(v23, "applyServiceFeaturesForRegionMeetingEnablementThreshold:", v20);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PKDeviceSupportedFeatureIdentifiers();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = objc_alloc(MEMORY[0x1E0C99E20]);
        v43 = v32;
        objc_msgSend(v32, "allKeys");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "initWithArray:", v35);

        v42 = (void *)v33;
        objc_msgSend((id)v36, "intersectSet:", v33);
        PKFeatureIdentifierToString(3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)v36;
        LOBYTE(v36) = objc_msgSend((id)v36, "containsObject:", v37);

        if ((v36 & 1) != 0)
        {
          if ((PKDeviceSupportsApplicationForFeatureIdentifier(3) & 1) != 0)
          {
            v24 = v40;
            if (self->_loadingState)
            {
              v38 = 0;
              v10 = 1;
LABEL_71:
              self->_optionFetchIneligibleReason = v38;

              goto LABEL_54;
            }
            PKLogFacilityTypeGetObject(6uLL);
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because the loading state is not applicable", buf, 2u);
            }
            v38 = 1;
          }
          else
          {
            PKLogFacilityTypeGetObject(6uLL);
            v39 = objc_claimAutoreleasedReturnValue();
            v24 = v40;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since pay later application not supported on device type", buf, 2u);
            }
            v38 = 9;
          }
        }
        else
        {
          PKLogFacilityTypeGetObject(6uLL);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since pay later feature is not supported", buf, 2u);
          }
          v38 = 7;
          v24 = v40;
        }

        v10 = 0;
        goto LABEL_71;
      }
      if (!PKHidePayLaterOptions())
        goto LABEL_31;
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      *(_WORD *)buf = 0;
    }
    else
    {
      if (!PKHidePayLaterOptions())
        goto LABEL_31;
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      *(_WORD *)buf = 0;
    }
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because the user has turned off the \"Pay Later Offers\" switch in settings", buf, 2u);
LABEL_30:

    v10 = 0;
    v11 = 13;
    goto LABEL_42;
  }
  v10 = 0;
  v11 = 1;
LABEL_42:
  self->_optionFetchIneligibleReason = v11;
LABEL_43:

  return v10;
}

- (void)_addFinancingOptionRequest:(id)a3
{
  PKPayLaterFinancingControllerRequest *v4;
  NSMutableOrderedSet *v5;
  PKPayLaterFinancingControllerRequest *currentRequest;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PKPayLaterFinancingControllerRequest *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  PKPayLaterFinancingControllerRequest *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (PKPayLaterFinancingControllerRequest *)a3;
  if (v4)
  {
    if (-[PKPayLaterFinancingControllerRequest coalesceWithRequest:](self->_currentRequest, "coalesceWithRequest:", v4))
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v5 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEFAULT))
      {
        currentRequest = self->_currentRequest;
        *(_DWORD *)buf = 138412290;
        v20 = currentRequest;
        _os_log_impl(&dword_18FC92000, &v5->super.super, OS_LOG_TYPE_DEFAULT, "Coalescing incoming pay later financing controller request onto current request %@", buf, 0xCu);
      }
LABEL_19:

    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = self->_queuedRequests;
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v5);
            v11 = *(PKPayLaterFinancingControllerRequest **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (-[PKPayLaterFinancingControllerRequest coalesceWithRequest:](v11, "coalesceWithRequest:", v4, (_QWORD)v14))
            {
              PKLogFacilityTypeGetObject(0xEuLL);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v20 = v11;
                _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Coalescing incoming pay later financing controller request onto queued request %@", buf, 0xCu);
              }

              goto LABEL_19;
            }
          }
          v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }

      -[NSMutableOrderedSet addObject:](self->_queuedRequests, "addObject:", v4);
      PKLogFacilityTypeGetObject(0xEuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Adding incoming pay later financing controller request onto queued list %@", buf, 0xCu);
      }

      -[PKPayLaterFinancingController _executeNextRequestIfPossible](self, "_executeNextRequestIfPossible");
    }
  }

}

- (void)_executeNextRequestIfPossible
{
  PKPayLaterFinancingControllerRequest *v3;
  PKPayLaterFinancingControllerRequest *currentRequest;
  PKPayLaterFinancingControllerRequest *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  PKAsyncUnaryOperationComposer *v18;
  void *v19;
  id v20;
  id v21;
  id *v22;
  id *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  __int128 *v31;
  _QWORD *v32;
  _QWORD *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 *p_buf;
  id v38[3];
  _QWORD v39[6];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[3];
  char v44;
  _QWORD aBlock[4];
  id v46;
  id v47;
  char v48;
  id location;
  __int128 buf;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!self->_currentRequest)
  {
    -[NSMutableOrderedSet firstObject](self->_queuedRequests, "firstObject");
    v3 = (PKPayLaterFinancingControllerRequest *)objc_claimAutoreleasedReturnValue();
    currentRequest = self->_currentRequest;
    self->_currentRequest = v3;

    v5 = self->_currentRequest;
    if (v5)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Starting pay later financing controller request %@", (uint8_t *)&buf, 0xCu);
      }

      -[NSMutableOrderedSet removeObjectAtIndex:](self->_queuedRequests, "removeObjectAtIndex:", 0);
      -[PKPayLaterFinancingControllerRequest amount](self->_currentRequest, "amount");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingControllerRequest optionIdentifierToCancel](self->_currentRequest, "optionIdentifierToCancel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKPayLaterFinancingControllerRequest authenticationState](self->_currentRequest, "authenticationState");
      v9 = -[PKPayLaterFinancingControllerRequest stateMachineCancelReason](self->_currentRequest, "stateMachineCancelReason");
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      v11 = !v10;
      if (v7)
        v12 = v8 == (void *)2;
      else
        v12 = 0;
      v13 = !v12;
      if (v24)
        v14 = v13;
      else
        v14 = 0;
      objc_initWeak(&location, self);
      v15 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke;
      aBlock[3] = &unk_1E2ACC330;
      v22 = &v47;
      objc_copyWeak(&v47, &location);
      v48 = v11;
      v16 = v7;
      v46 = v16;
      v17 = _Block_copy(aBlock);
      v18 = objc_alloc_init(PKAsyncUnaryOperationComposer);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v51 = 0x3032000000;
      v52 = __Block_byref_object_copy__30;
      v53 = __Block_byref_object_dispose__30;
      v54 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v44 = 0;
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x3032000000;
      v41[3] = __Block_byref_object_copy__30;
      v41[4] = __Block_byref_object_dispose__30;
      v42 = 0;
      v39[0] = v15;
      v39[1] = 3221225472;
      v39[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_42;
      v39[3] = &unk_1E2ACC380;
      v39[4] = self;
      v39[5] = &buf;
      objc_copyWeak(&v40, &location);
      -[PKAsyncUnaryOperationComposer addOperation:](v18, "addOperation:", v39);
      if (v11)
      {
        v35[0] = v15;
        v35[1] = 3221225472;
        v35[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_3;
        v35[3] = &unk_1E2ACC3D0;
        objc_copyWeak(v38, &location);
        p_buf = &buf;
        v36 = v16;
        v38[1] = v8;
        v38[2] = v9;
        -[PKAsyncUnaryOperationComposer addOperation:](v18, "addOperation:", v35, &v47);

        objc_destroyWeak(v38);
      }
      if (v14)
      {
        v29[0] = v15;
        v29[1] = 3221225472;
        v29[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_6;
        v29[3] = &unk_1E2ACC448;
        objc_copyWeak(&v34, &location);
        v31 = &buf;
        v30 = v24;
        v32 = v41;
        v33 = v43;
        -[PKAsyncUnaryOperationComposer addOperation:](v18, "addOperation:", v29);

        objc_destroyWeak(&v34);
      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null", v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v15;
      v25[1] = 3221225472;
      v25[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_49;
      v25[3] = &unk_1E2AC74A8;
      v20 = v17;
      v26 = v20;
      v27 = v43;
      v28 = v41;
      v21 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v18, "evaluateWithInput:completion:", v19, v25);

      objc_destroyWeak(&v40);
      _Block_object_dispose(v41, 8);

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(&buf, 8);

      objc_destroyWeak(v23);
      objc_destroyWeak(&location);

    }
  }
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      PKLocalizedCocoonString(CFSTR("APPLY_GENERIC_ERROR_TITLE"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("APPLY_GENERIC_ERROR_MESSAGE"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKAccountDisplayableError(v5, 3, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)*((_QWORD *)v7 + 33);
      *((_QWORD *)v7 + 33) = v10;

    }
    else
    {
      v8 = (void *)WeakRetained[33];
      WeakRetained[33] = 0;
    }

    PKLogFacilityTypeGetObject(0xEuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *((_QWORD *)v7 + 7);
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Completed pay later financing controller request %@", buf, 0xCu);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*((id *)v7 + 7), "completions", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i) + 16))();
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

    if (a2)
    {
      objc_msgSend(v7, "refreshAvailableFundingSources");
      if (*(_BYTE *)(a1 + 48) && *(_QWORD *)(a1 + 32))
        objc_msgSend(v7, "_informObserversFinancingOptionCancelled:");
      objc_msgSend(v7, "_informObserversAssessmentCollectionChanged");
    }
    v19 = (void *)*((_QWORD *)v7 + 7);
    *((_QWORD *)v7 + 7) = 0;

    objc_msgSend(v7, "_executeNextRequestIfPossible");
  }

}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_42(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2;
  v13[3] = &unk_1E2ACC358;
  v10 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "_payLaterAccountWithCompletion:", v13);

  objc_destroyWeak(&v17);
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      objc_msgSend(WeakRetained, "_updateLoadingState:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id *WeakRetained;
  id *v12;
  PKAccountWebServicePayLaterFinancingOptionCancellationRequest *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateLoadingState:", 1);
    v13 = objc_alloc_init(PKAccountWebServicePayLaterFinancingOptionCancellationRequest);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "accountIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServicePayLaterFinancingOptionCancellationRequest setAccountIdentifier:](v13, "setAccountIdentifier:", v14);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "accountBaseURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServicePayLaterFinancingOptionCancellationRequest setBaseURL:](v13, "setBaseURL:", v15);

    -[PKAccountWebServicePayLaterFinancingOptionCancellationRequest setOptionIdentifier:](v13, "setOptionIdentifier:", *(_QWORD *)(a1 + 32));
    v16 = *(_QWORD *)(a1 + 56);
    v17 = 3;
    if (v16 <= 5)
    {
      if (((1 << v16) & 0x33) != 0)
      {
        v17 = 0;
      }
      else if (v16 == 2)
      {
        v20 = *(_QWORD *)(a1 + 64);
        if (v20 == 1)
          v17 = 1;
        else
          v17 = 2 * (v20 == 0);
      }
    }
    -[PKAccountWebServicePayLaterFinancingOptionCancellationRequest setReason:](v13, "setReason:", v17);
    objc_msgSend(v12[7], "stateMachineError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServicePayLaterFinancingOptionCancellationRequest setError:](v13, "setError:", v18);

    v19 = v12[28];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_4;
    v21[3] = &unk_1E2ACC3A8;
    objc_copyWeak(&v24, v10);
    v23 = v9;
    v22 = v8;
    objc_msgSend(v19, "accountPayLaterFinancingOptionCancellationWithRequest:completion:", v13, v21);

    objc_destroyWeak(&v24);
  }

}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_4(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_5;
  block[3] = &unk_1E2AC8F88;
  objc_copyWeak(&v5, a1 + 6);
  v4 = a1[5];
  v3 = a1[4];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  PKAccountWebServiceFinancingOptionsRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(WeakRetained[7], "amount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v11, "_eligibleToFetchFinancingOptionsWithPayLaterAccount:transactionAmount:", v12, v13);

    if ((v12 & 1) != 0)
    {
      +[PKAnalyticsReporter reporterForSubject:](PKAnalyticsReporter, "reporterForSubject:", CFSTR("fpsEngagement"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        *((_BYTE *)v11 + 120) = 1;
        +[PKAnalyticsReporter beginSubjectReporting:](PKAnalyticsReporter, "beginSubjectReporting:", CFSTR("fpsEngagement"));
      }
      objc_msgSend(v11, "_updateLoadingState:", 1);
      PKLogFacilityTypeGetObject(6uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Fetching financing options", buf, 2u);
      }

      objc_msgSend(v11[22], "currencyCode");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11[22], "merchantIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc_init(PKAccountWebServiceFinancingOptionsRequest);
      -[PKAccountWebServiceFinancingOptionsRequest setAmount:](v18, "setAmount:", *(_QWORD *)(a1 + 32));
      v31 = (void *)v16;
      -[PKAccountWebServiceFinancingOptionsRequest setCurrencyCode:](v18, "setCurrencyCode:", v16);
      objc_msgSend(v11[22], "merchantCountryCode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setCountryCode:](v18, "setCountryCode:", v19);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "accountIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setAccountIdentifier:](v18, "setAccountIdentifier:", v20);

      -[PKAccountWebServiceFinancingOptionsRequest setMerchantIdentifier:](v18, "setMerchantIdentifier:", v17);
      objc_msgSend(v11[22], "originURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setOriginURL:](v18, "setOriginURL:", v21);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "accountBaseURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setBaseURL:](v18, "setBaseURL:", v22);

      -[PKAccountWebServiceFinancingOptionsRequest setChannel:](v18, "setChannel:", objc_msgSend(v11[22], "channel"));
      objc_msgSend(v11[22], "webMerchantName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setWebMerchantName:](v18, "setWebMerchantName:", v23);

      objc_msgSend(v11[22], "merchantName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setMerchantName:](v18, "setMerchantName:", v24);

      objc_msgSend(v11[22], "adamIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setAdamIdentifier:](v18, "setAdamIdentifier:", v25);

      -[PKAccountWebServiceFinancingOptionsRequest setIsMerchantTokenRequest:](v18, "setIsMerchantTokenRequest:", objc_msgSend(v11[22], "isMerchantTokenRequest"));
      -[PKAccountWebServiceFinancingOptionsRequest setIsMultiTokenRequest:](v18, "setIsMultiTokenRequest:", objc_msgSend(v11[22], "isMultiTokenRequest"));
      objc_msgSend(v11[22], "webMerchantIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setWebMerchantIdentifier:](v18, "setWebMerchantIdentifier:", v26);

      -[PKAccountWebServiceFinancingOptionsRequest setReferrerIdentifier:](v18, "setReferrerIdentifier:", v11[31]);
      -[PKAccountWebServiceFinancingOptionsRequest setSessionIdentifier:](v18, "setSessionIdentifier:", v11[12]);
      -[PKAccountWebServiceFinancingOptionsRequest setDueNext30Days:](v18, "setDueNext30Days:", v11[5]);
      objc_msgSend(v11[22], "supportedNetworks");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceFinancingOptionsRequest setSupportedNetworks:](v18, "setSupportedNetworks:", v27);

      -[PKAccountWebServiceFinancingOptionsRequest setSuppressionMode:](v18, "setSuppressionMode:", objc_msgSend(v11[22], "suppressionMode"));
      objc_msgSend(v11, "_reportEventSignpostIfNecessary");
      v28 = v11[28];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_46;
      v32[3] = &unk_1E2ACC420;
      objc_copyWeak(&v37, (id *)(a1 + 64));
      v35 = *(_QWORD *)(a1 + 48);
      v34 = v9;
      v29 = v8;
      v30 = *(_QWORD *)(a1 + 56);
      v33 = v29;
      v36 = v30;
      objc_msgSend(v28, "accountFinancingOptionsWithRequest:completion:", v18, v32);

      objc_destroyWeak(&v37);
    }
    else
    {
      objc_msgSend(v11, "_updateLoadingState:", 0);
      (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
    }
  }

}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2_47;
  block[3] = &unk_1E2ACC3F8;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  v13 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v7 = (id)v11;
  v16 = v11;
  v8 = *(id *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 56);
  v14 = v8;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2_47(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_reportEndSignpostIfNecessary");
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138412290;
        v7 = v4;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error getting financing options: %@", (uint8_t *)&v6, 0xCu);
      }

      objc_msgSend(v3, "_updateLoadingState:", 2);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "_updateStateWithResponse:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v3, "_updateLoadingState:", 3);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_49(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  __int128 v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2_50;
  block[3] = &unk_1E2AC5748;
  v3 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2_50(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_updateLoadingState:(unint64_t)a3
{
  unint64_t loadingState;

  loadingState = self->_loadingState;
  self->_loadingState = a3;
  if (loadingState != a3)
    -[PKPayLaterFinancingController _informObserversAssessmentCollectionChanged](self, "_informObserversAssessmentCollectionChanged");
  -[PKPayLaterFinancingController _updatePayLaterPassEligibility](self, "_updatePayLaterPassEligibility");
}

- (void)_updatePayLaterPassEligibility
{
  unint64_t payLaterPassEligibility;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  payLaterPassEligibility = self->_payLaterPassEligibility;
  switch(self->_loadingState)
  {
    case 0uLL:
      if ((self->_optionFetchIneligibleReason & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        v4 = 3;
      else
        v4 = 2;
      goto LABEL_11;
    case 1uLL:
      v4 = 4;
      goto LABEL_11;
    case 2uLL:
      v4 = 5;
LABEL_11:
      self->_payLaterPassEligibility = v4;
      goto LABEL_14;
    case 3uLL:
      -[PKPayLaterProductAssessmentCollection productAssessmentForProductType:](self->_assessmentCollection, "productAssessmentForProductType:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEligible"))
      {
        objc_msgSend(v5, "financingOptions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        objc_msgSend(v5, "preliminaryAssessment");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v7 | v8;

        v10 = 1;
        if (!v9)
          v10 = 2;
      }
      else
      {
        v10 = 2;
      }
      self->_payLaterPassEligibility = v10;

      v4 = self->_payLaterPassEligibility;
LABEL_14:
      if (payLaterPassEligibility != v4)
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          if (payLaterPassEligibility - 1 > 4)
            v12 = CFSTR("unknown");
          else
            v12 = off_1E2ACC5B0[payLaterPassEligibility - 1];
          if (v4 - 1 > 4)
            v13 = CFSTR("unknown");
          else
            v13 = off_1E2ACC5B0[v4 - 1];
          v14 = 138412546;
          v15 = v12;
          v16 = 2112;
          v17 = v13;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Pay Later pass eligibility changed from %@ to %@", (uint8_t *)&v14, 0x16u);
        }

        -[PKPayLaterFinancingController refreshAvailableFundingSources](self, "refreshAvailableFundingSources");
        -[PKPayLaterFinancingController _informObserversAssessmentCollectionChanged](self, "_informObserversAssessmentCollectionChanged");
      }
      break;
    default:
      return;
  }
}

- (BOOL)_updateStateWithResponse:(id)a3
{
  id v4;
  PKPayLaterProductAssessmentCollection *v5;
  PKPayLaterProductAssessmentCollection *v6;
  PKPayLaterDynamicContent *v7;
  PKPayLaterDynamicContent *dynamicContent;
  NSString *v9;
  NSString *sessionIdentifier;
  char v11;
  NSObject *v12;
  NSArray *lastUsedFundingSources;
  NSArray *v14;
  NSArray *v15;
  char v16;
  NSArray *v17;
  NSArray *v18;
  NSObject *v19;
  NSArray *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  PKPayLaterBankPaymentSource *v28;
  PKPayLaterBankPaymentSource *v29;
  void *v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *bankFundingSources;
  PKPayLaterProductAssessmentCollection *v34;
  BOOL v35;
  NSDictionary *v36;
  NSDictionary *v37;
  NSObject *v38;
  NSDictionary *v39;
  char v41;
  PKPayLaterProductAssessmentCollection *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  PKPayLaterProductAssessmentCollection *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_assessmentCollection;
  objc_msgSend(v4, "assessmentCollection");
  v6 = (PKPayLaterProductAssessmentCollection *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_assessmentCollection, v6);
  objc_msgSend(v4, "dynamicContent");
  v7 = (PKPayLaterDynamicContent *)objc_claimAutoreleasedReturnValue();
  dynamicContent = self->_dynamicContent;
  self->_dynamicContent = v7;

  objc_msgSend(v4, "sessionIdentifier");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  sessionIdentifier = self->_sessionIdentifier;
  self->_sessionIdentifier = v9;

  self->_languageDisclosureLocation = objc_msgSend(v4, "languageDisclosureLocation");
  if (v5 && v6)
  {
    if (-[PKPayLaterProductAssessmentCollection isEqual:](v5, "isEqual:", v6))
    {
LABEL_4:
      v11 = 0;
      goto LABEL_9;
    }
  }
  else if (v5 == v6)
  {
    goto LABEL_4;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v6;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Assessment collection has changed: %@", buf, 0xCu);
  }

  v11 = 1;
LABEL_9:
  lastUsedFundingSources = self->_lastUsedFundingSources;
  objc_msgSend(v4, "lastUsedFundingSources");
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v42 = v5;
  if (lastUsedFundingSources && v14)
  {
    v16 = -[NSArray isEqual:](lastUsedFundingSources, "isEqual:", v14);

    if ((v16 & 1) != 0)
      goto LABEL_17;
  }
  else
  {

    if (lastUsedFundingSources == v15)
      goto LABEL_17;
  }
  objc_msgSend(v4, "lastUsedFundingSources");
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_lastUsedFundingSources;
  self->_lastUsedFundingSources = v17;

  PKLogFacilityTypeGetObject(6uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = self->_lastUsedFundingSources;
    *(_DWORD *)buf = 138412290;
    v49 = (PKPayLaterProductAssessmentCollection *)v20;
    _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Updated lastUsedFundingSources: %@", buf, 0xCu);
  }

  v11 = 1;
LABEL_17:
  v41 = v11;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v4, "acceptedFundingSources");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v27, "type") == 1)
        {
          v28 = -[PKPayLaterBankPaymentSource initWithAccountPaymentFundingSource:]([PKPayLaterBankPaymentSource alloc], "initWithAccountPaymentFundingSource:", v27);
          v29 = v28;
          if (v28)
          {
            -[PKPayLaterBankPaymentSource identifier](v28, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", v29, v30);

          }
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v21, "count"))
    v31 = v21;
  else
    v31 = 0;
  v32 = v31;

  bankFundingSources = self->_bankFundingSources;
  if (v32 && bankFundingSources)
  {
    v34 = v42;
    v35 = v41;
    if ((-[NSDictionary isEqual:](bankFundingSources, "isEqual:", v32) & 1) != 0)
      goto LABEL_39;
  }
  else
  {
    v34 = v42;
    v35 = v41;
    if (bankFundingSources == v32)
      goto LABEL_39;
  }
  v36 = (NSDictionary *)-[NSDictionary copy](v32, "copy");
  v37 = self->_bankFundingSources;
  self->_bankFundingSources = v36;

  PKLogFacilityTypeGetObject(6uLL);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = self->_bankFundingSources;
    *(_DWORD *)buf = 138412290;
    v49 = (PKPayLaterProductAssessmentCollection *)v39;
    _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, "Updated bankFundingSources: %@", buf, 0xCu);
  }

  v35 = 1;
LABEL_39:

  return v35;
}

- (void)_payLaterAccountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKAsyncUnaryOperationComposer *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_payLaterAccount || self->_fetchedPayLaterAccount)
  {
    if (v4)
      (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke;
    v15[3] = &unk_1E2ACC4C0;
    v15[4] = self;
    objc_copyWeak(&v16, &location);
    -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v15);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_56;
    v13[3] = &unk_1E2ACC218;
    objc_copyWeak(&v14, &location);
    -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v13);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_4;
    v10[3] = &unk_1E2ACC538;
    objc_copyWeak(&v12, &location);
    v11 = v5;
    v9 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v6, "evaluateWithInput:completion:", v8, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }

}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_2;
  v13[3] = &unk_1E2ACC498;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "defaultAccountForFeature:completion:", 3, v13);

  objc_destroyWeak(&v16);
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_3;
  block[3] = &unk_1E2ACC470;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v6;
  v11 = v5;
  v13 = a1[5];
  v12 = a1[4];
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  PKPayLaterFinancingPlansFetcher *v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error getting pay later account: %@", (uint8_t *)&v15, 0xCu);
      }

      goto LABEL_12;
    }
    v6 = (void *)WeakRetained[3];
    *((_BYTE *)WeakRetained + 32) = 1;
    v7 = *(id *)(a1 + 40);
    v8 = (void *)v3[3];
    v3[3] = v7;
    v9 = v6;

    v10 = -[PKPayLaterFinancingPlansFetcher initWithPayLaterAccount:]([PKPayLaterFinancingPlansFetcher alloc], "initWithPayLaterAccount:", v3[3]);
    v11 = (void *)v3[14];
    v3[14] = v10;

    v12 = *(id *)(a1 + 40);
    if (v9 && v12)
    {
      v13 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40));

      if ((v13 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

      if (v9 == v12)
      {
LABEL_12:
        (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32) != 0);
        goto LABEL_13;
      }
    }
    v14 = (id)objc_msgSend(v3, "payLaterPass");
    objc_msgSend(v3, "_updatePayLaterPassEligibility");
    goto LABEL_12;
  }
LABEL_13:

}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)*((_QWORD *)WeakRetained + 14);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_2_57;
    v11[3] = &unk_1E2ACC4E8;
    v11[4] = WeakRetained;
    v13 = v7;
    v12 = v6;
    objc_msgSend(v10, "financingPlansWithQueryItems:completion:", 1, v11);

  }
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_2_57(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_3_58;
  v5[3] = &unk_1E2AC4A20;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_3_58(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "dueNext30Days");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_4(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_5;
  v2[3] = &unk_1E2ACC510;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id v5;
  PKPayLaterAvailableFundingSourcesFilter *v6;
  id v7;
  uint64_t v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained[1], "defaultPaymentPassUniqueIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v9[8];
    v9[8] = (id)v4;

    v6 = -[PKPayLaterAvailableFundingSourcesFilter initWithPassLibrary:peerPaymentAccount:defaultPassUniqueIdentifier:]([PKPayLaterAvailableFundingSourcesFilter alloc], "initWithPassLibrary:peerPaymentAccount:defaultPassUniqueIdentifier:", v9[29], v9[27], v9[8]);
    v7 = v9[11];
    v9[11] = v6;

    v3 = v9;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9[3]);
      v3 = v9;
    }
  }

}

- (void)_reportEventSignpostIfNecessary
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (-[PKPayLaterFinancingControllerConfiguration channel](self->_configuration, "channel") == 1
    && !self->_hasEndedSignPost)
  {
    PKLogFacilityTypeGetObject(0x22uLL);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, self);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v3, OS_SIGNPOST_EVENT, v5, "request:paylater:financingOptions", ", v6, 2u);
      }
    }

  }
}

- (void)_reportEndSignpostIfNecessary
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (-[PKPayLaterFinancingControllerConfiguration channel](self->_configuration, "channel") == 1
    && !self->_hasEndedSignPost)
  {
    PKLogFacilityTypeGetObject(0x22uLL);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, self);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v3, OS_SIGNPOST_INTERVAL_END, v5, "request:paylater:financingOptions", ", v6, 2u);
      }
    }

    self->_hasEndedSignPost = 1;
  }
}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *replyQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__PKPayLaterFinancingController__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __61__PKPayLaterFinancingController__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_informObserversAssessmentCollectionChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __76__PKPayLaterFinancingController__informObserversAssessmentCollectionChanged__block_invoke;
  v2[3] = &unk_1E2ACC308;
  v2[4] = self;
  -[PKPayLaterFinancingController _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v2);
}

void __76__PKPayLaterFinancingController__informObserversAssessmentCollectionChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "payLaterFinancingAssessmentCollectionDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)_informObserversFinancingOptionCancelled:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PKPayLaterFinancingController__informObserversFinancingOptionCancelled___block_invoke;
  v6[3] = &unk_1E2ACC560;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPayLaterFinancingController _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __74__PKPayLaterFinancingController__informObserversFinancingOptionCancelled___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "payLaterFinancingController:financingOptionCancelled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (PKPayLaterFinancingControllerConfiguration)configuration
{
  return self->_configuration;
}

- (PKPayLaterProductAssessmentCollection)assessmentCollection
{
  return self->_assessmentCollection;
}

- (PKPayLaterDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void)setPayLaterPass:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterPass, a3);
}

- (unint64_t)payLaterPassEligibility
{
  return self->_payLaterPassEligibility;
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (PKPassLibrary)passLibrary
{
  return self->_passLibrary;
}

- (PKPayLaterPaymentSource)selectedFundingSource
{
  return self->_selectedFundingSource;
}

- (BOOL)autoPaymentOn
{
  return self->_autoPaymentOn;
}

- (void)setAutoPaymentOn:(BOOL)a3
{
  self->_autoPaymentOn = a3;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (unint64_t)languageDisclosureLocation
{
  return self->_languageDisclosureLocation;
}

- (BOOL)hasSeenLanguageNotice
{
  return self->_hasSeenLanguageNotice;
}

- (void)setHasSeenLanguageNotice:(BOOL)a3
{
  self->_hasSeenLanguageNotice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_assessmentCollection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_pendingCancellationRequest, 0);
  objc_storeStrong((id *)&self->_plansFetcher, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_availableFundingSourcesFilter, 0);
  objc_storeStrong((id *)&self->_lastUsedFundingSources, 0);
  objc_storeStrong((id *)&self->_bankFundingSources, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_queuedRequests, 0);
  objc_storeStrong((id *)&self->_dueNext30Days, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
