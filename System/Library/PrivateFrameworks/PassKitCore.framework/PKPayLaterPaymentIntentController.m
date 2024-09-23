@implementation PKPayLaterPaymentIntentController

- (PKPayLaterPaymentIntentController)initWithPayLaterAccount:(id)a3 paymentWebService:(id)a4 passLibrary:(id)a5 peerPaymentWebService:(id)a6 accountService:(id)a7 defaultPassUniqueIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKPayLaterPaymentIntentController *v18;
  PKPayLaterPaymentIntentController *v19;
  void *v20;
  uint64_t v21;
  PKPeerPaymentAccount *peerPaymentAccount;
  NSMutableDictionary *v23;
  NSMutableDictionary *cacheByIntentType;
  NSMutableDictionary *v25;
  NSMutableDictionary *requests;
  PKPayLaterAvailableFundingSourcesFilter *v27;
  PKPayLaterAvailableFundingSourcesFilter *availableFundingSourcesFilter;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v35.receiver = self;
  v35.super_class = (Class)PKPayLaterPaymentIntentController;
  v18 = -[PKPayLaterPaymentIntentController init](&v35, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paymentWebService, a4);
    objc_storeStrong((id *)&v19->_passLibrary, a5);
    objc_storeStrong((id *)&v19->_defaultPassUniqueIdentifier, a8);
    objc_storeStrong((id *)&v19->_payLaterAccount, a3);
    objc_storeStrong((id *)&v19->_peerPaymentWebService, a6);
    -[PKPeerPaymentWebService targetDevice](v19->_peerPaymentWebService, "targetDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "account");
    v21 = objc_claimAutoreleasedReturnValue();
    peerPaymentAccount = v19->_peerPaymentAccount;
    v19->_peerPaymentAccount = (PKPeerPaymentAccount *)v21;

    objc_storeStrong((id *)&v19->_accountService, a7);
    -[PKAccountService registerObserver:](v19->_accountService, "registerObserver:", v19);
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cacheByIntentType = v19->_cacheByIntentType;
    v19->_cacheByIntentType = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requests = v19->_requests;
    v19->_requests = v25;

    v27 = -[PKPayLaterAvailableFundingSourcesFilter initWithPassLibrary:peerPaymentAccount:defaultPassUniqueIdentifier:]([PKPayLaterAvailableFundingSourcesFilter alloc], "initWithPassLibrary:peerPaymentAccount:defaultPassUniqueIdentifier:", v19->_passLibrary, v19->_peerPaymentAccount, v19->_defaultPassUniqueIdentifier);
    availableFundingSourcesFilter = v19->_availableFundingSourcesFilter;
    v19->_availableFundingSourcesFilter = v27;

    v19->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentWebService targetDevice](v19->_peerPaymentWebService, "targetDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v19, sel__peerPaymentAccountChanged, CFSTR("PKPeerPaymentTargetDeviceAccountDidChangeNotification"), v30);

  }
  return v19;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PKPeerPaymentTargetDeviceAccountDidChangeNotification"), v4);

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterPaymentIntentController;
  -[PKPayLaterPaymentIntentController dealloc](&v5, sel_dealloc);
}

- (void)intentDetailsForFinancingPlan:(id)a3 intent:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *cacheByIntentType;
  void *v14;
  void *v15;
  void *v16;
  PKPayLaterFinancingPlanPaymentIntentRequest *v17;
  NSMutableDictionary *requests;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "planIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!a4 || !v10 || objc_msgSend(v8, "state") == 6 || objc_msgSend(v8, "state") == 5 || objc_msgSend(v8, "state") == 8)
  {
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    cacheByIntentType = self->_cacheByIntentType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](cacheByIntentType, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v15;
    objc_msgSend(v15, "objectForKey:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKPayLaterFinancingPlanPaymentIntentRequest initWithPlanIdentifier:intent:completion:]([PKPayLaterFinancingPlanPaymentIntentRequest alloc], "initWithPlanIdentifier:intent:completion:", v11, a4, v9);
    requests = self->_requests;
    -[PKPayLaterFinancingPlanPaymentIntentRequest identifier](v17, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](requests, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        PKFinancingPlanPaymentIntentTypeToString(a4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v16;
        v28 = 2112;
        v29 = v11;
        v30 = 2112;
        v31 = v22;
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Using cached financing plan intent details %@ for planIdentifier %@, intent \"%@\", buf, 0x20u);

      }
      os_unfair_lock_unlock(p_lock);
      if (v9)
        (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v16, 0);
    }
    else if (v20)
    {
      objc_msgSend(v20, "coalesceWithRequest:", v17);

      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v23 = self->_requests;
      -[PKPayLaterFinancingPlanPaymentIntentRequest identifier](v17, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v17, v24);

      os_unfair_lock_unlock(&self->_lock);
      if (v17)
      {
        -[PKPayLaterPaymentIntentController _executeNextRequest:](self, "_executeNextRequest:", v17);

      }
    }

  }
}

- (id)payLaterPaymentRequestWithIntentDetails:(id)a3 financingPlan:(id)a4 primaryPaymentSource:(id)a5 intent:(unint64_t)a6 currencyAmount:(id)a7
{
  id v12;
  PKPeerPaymentAccount *peerPaymentAccount;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  BOOL v24;
  void *v25;
  void *v26;
  PKPayLaterPaymentRequest *v27;
  PKAccount *payLaterAccount;
  void *v29;
  void *v30;
  PKPayLaterPaymentRequest *v31;
  uint64_t v33;
  unint64_t v34;

  v12 = a7;
  peerPaymentAccount = self->_peerPaymentAccount;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKPeerPaymentAccount currentBalance](peerPaymentAccount, "currentBalance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currency");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currency");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  v21 = v19;
  v34 = a6;
  if (v20 == v21)
  {

    goto LABEL_7;
  }
  v22 = v21;
  if (!v20 || !v21)
  {

    v24 = 0;
    goto LABEL_9;
  }
  v23 = objc_msgSend(v20, "isEqualToString:", v21);

  if ((v23 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(v17, "amount");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "amount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v20, "compare:", v22) != -1;
LABEL_9:

    goto LABEL_10;
  }
  v24 = 0;
LABEL_10:
  objc_msgSend(v15, "planIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPaymentIntentController availableFundingSourcesForPaymentIntentDetails:currencyAmount:planIdentifier:primaryPaymentSource:](self, "availableFundingSourcesForPaymentIntentDetails:currencyAmount:planIdentifier:primaryPaymentSource:", v16, v12, v25, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [PKPayLaterPaymentRequest alloc];
  payLaterAccount = self->_payLaterAccount;
  -[PKAccount payLaterDetails](payLaterAccount, "payLaterDetails");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "countryCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = v24;
  v31 = -[PKPayLaterPaymentRequest initWithIntentDetails:payLaterAccount:financingPlan:intent:acceptedFundingSources:currencyAmount:hasAdequateAppleCashBalance:countryCode:](v27, "initWithIntentDetails:payLaterAccount:financingPlan:intent:acceptedFundingSources:currencyAmount:hasAdequateAppleCashBalance:countryCode:", v16, payLaterAccount, v15, v34, v26, v12, v33, v30);

  return v31;
}

- (id)availableFundingSourcesForPaymentIntentDetails:(id)a3 currencyAmount:(id)a4 planIdentifier:(id)a5 primaryPaymentSource:(id)a6
{
  return -[PKPayLaterAvailableFundingSourcesFilter availableFundingSourcesForPaymentIntentDetails:currencyAmount:planIdentifier:primaryPaymentSource:](self->_availableFundingSourcesFilter, "availableFundingSourcesForPaymentIntentDetails:currencyAmount:planIdentifier:primaryPaymentSource:", a3, a4, a5, a6);
}

- (void)setPayLaterAccount:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPayLaterPaymentIntentController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKPayLaterPaymentIntentController_setPayLaterAccount___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__PKPayLaterPaymentIntentController_setPayLaterAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  char v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    if (v2 == v3)
      return;
  }
  else
  {
    if ((objc_msgSend(v2, "isEqual:") & 1) != 0)
      return;
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
  }
  objc_msgSend(v3, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  v7 = v6;
  if (v10 == v7)
  {

LABEL_19:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 104), *(id *)(a1 + 32));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 80));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 80));
    return;
  }
  if (v10)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {

    return;
  }
  v9 = objc_msgSend(v10, "isEqualToString:", v7);

  if ((v9 & 1) != 0)
    goto LABEL_19;
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  PKPaymentAuthorizationCoordinator *v4;
  NSObject *v5;
  _QWORD block[5];
  PKPaymentAuthorizationCoordinator *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  PKPayLaterPaymentIntentController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_authorizationCoordinator == v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[PKPayLaterPaymentIntentController paymentAuthorizationCoordinatorDidFinish:]";
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    block[3] = &unk_1E2AC2E68;
    objc_copyWeak(&v8, (id *)buf);
    block[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }

}

void __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

    v6 = (void *)v4[11];
    v4[11] = 0;

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_BYTE *)(v7 + 84) ^ 1;
    *(_BYTE *)(v7 + 84) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
    v9 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
    v10[3] = &unk_1E2AC6688;
    objc_copyWeak(&v11, v2);
    v12 = v8;
    objc_msgSend(v9, "dismissWithCompletion:", v10);
    objc_destroyWeak(&v11);
  }

}

void __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3;
  v2[3] = &unk_1E2AC6688;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  v4 = *(_BYTE *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
}

void __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    v6 = v3;
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 40), 1, 0);
      v3 = v6;
      v5 = (void *)v6[2];
    }
    else
    {
      v5 = 0;
    }
    v3[2] = 0;

    v3 = v6;
  }

}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  PKAccountService *accountService;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  PKPayLaterPaymentIntentController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject(0xEuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[PKPayLaterPaymentIntentController paymentAuthorizationCoordinator:didAuthorizePayment:handler:]";
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "%s %p: didAuthorizePayment: callback called.", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_didAuthorizePayment = 1;
  -[NSMutableDictionary removeAllObjects](self->_cacheByIntentType, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Updating financing plans following a successful one time payment.", buf, 2u);
  }

  accountService = self->_accountService;
  -[PKAccount accountIdentifier](self->_payLaterAccount, "accountIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke;
  v15[3] = &unk_1E2ABE738;
  v16 = v10;
  v14 = v10;
  -[PKAccountService updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:forceFetch:completion:](accountService, "updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:forceFetch:completion:", v13, 0, 0, 0, 0, v15);

}

void __97__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2;
  block[3] = &unk_1E2ABD9A0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  PKPaymentAuthorizationResult *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(0xEuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Completed updating financing plans following a successful one time payment.", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = -[PKPaymentAuthorizationResult initWithStatus:errors:]([PKPaymentAuthorizationResult alloc], "initWithStatus:errors:", 0, 0);
    (*(void (**)(uint64_t, PKPaymentAuthorizationResult *))(v3 + 16))(v3, v4);

  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  return self->_presentationSceneIdentifier;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  void (**v6)(id, id, _QWORD);
  PKPaymentRequestPaymentMethodUpdate *v7;
  void *v8;
  PKPaymentRequestPaymentMethodUpdate *v9;

  if (a5)
  {
    v6 = (void (**)(id, id, _QWORD))a5;
    v7 = [PKPaymentRequestPaymentMethodUpdate alloc];
    -[PKPaymentRequest paymentSummaryItems](self->_currentPaymentRequest, "paymentSummaryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKPaymentRequestPaymentMethodUpdate initWithPaymentSummaryItems:](v7, "initWithPaymentSummaryItems:", v8);

    v6[2](v6, v9, 0);
  }
}

- (void)_executeNextRequest:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  PKAccountWebServiceFinancingPlanPaymentIntentRequest *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  PKPaymentWebService *paymentWebService;
  id v13;
  _QWORD v14[5];
  id v15;
  void *v16;
  unint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "intent");
  objc_msgSend(v4, "planIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PKAccountWebServiceFinancingPlanPaymentIntentRequest);
  -[PKAccount accountIdentifier](self->_payLaterAccount, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceFinancingPlanPaymentIntentRequest setAccountIdentifier:](v7, "setAccountIdentifier:", v8);

  -[PKAccountWebServiceFinancingPlanPaymentIntentRequest setIntent:](v7, "setIntent:", v5);
  -[PKAccountWebServiceFinancingPlanPaymentIntentRequest setPlanIdentifier:](v7, "setPlanIdentifier:", v6);
  -[PKAccount accountBaseURL](self->_payLaterAccount, "accountBaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceFinancingPlanPaymentIntentRequest setBaseURL:](v7, "setBaseURL:", v9);

  PKLogFacilityTypeGetObject(0xEuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    PKFinancingPlanPaymentIntentTypeToString(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Fetching financing plan intent details for planIdentifier %@, intent \"%@\", buf, 0x16u);

  }
  paymentWebService = self->_paymentWebService;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PKPayLaterPaymentIntentController__executeNextRequest___block_invoke;
  v14[3] = &unk_1E2AC66B0;
  v14[4] = self;
  v15 = v4;
  v16 = v6;
  v17 = v5;
  v13 = v4;
  -[PKPaymentWebService accountFinancingPlanPaymentIntentWithRequest:completion:](paymentWebService, "accountFinancingPlanPaymentIntentWithRequest:completion:", v7, v14);

}

void __57__PKPayLaterPaymentIntentController__executeNextRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  if (!v5 || v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "callCompletionsWithResponse:error:", 0, v6);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v16);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      PKFinancingPlanPaymentIntentTypeToString(*(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v5;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Setting financing plan intent details cache with response %@ for planIdentifier %@, intent \"%@\", (uint8_t *)&v22, 0x20u);

    }
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      v14 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v17 = v14;

    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v17, v19);

    objc_msgSend(v17, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "callCompletionsWithResponse:error:", v5, 0);
    v20 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v21);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  }

}

- (void)presentPaymentAuthorizationForFinancingPlan:(id)a3 primaryPaymentSource:(id)a4 intentDetails:(id)a5 intent:(unint64_t)a6 currencyAmount:(id)a7 presentationSceneIdentifier:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (v20)
  {
    if (self->_paymentAuthorizationCompletion)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Cannot display oslo sheet when one is already being displayed", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v20 + 2))(v20, 0, 0, 0);
    }
    else if (v17)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "planIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        PKFinancingPlanPaymentIntentTypeToString(a6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v33 = v18;
        v34 = 2112;
        v35 = v28;
        v36 = 2112;
        v37 = v23;
        _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Presenting financing plan payment intent authorization for amount %@, planIdentifier %@, intent %@", buf, 0x20u);

      }
      -[PKPayLaterPaymentIntentController payLaterPaymentRequestWithIntentDetails:financingPlan:primaryPaymentSource:intent:currencyAmount:](self, "payLaterPaymentRequestWithIntentDetails:financingPlan:primaryPaymentSource:intent:currencyAmount:", v17, v15, v16, a6, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __177__PKPayLaterPaymentIntentController_presentPaymentAuthorizationForFinancingPlan_primaryPaymentSource_intentDetails_intent_currencyAmount_presentationSceneIdentifier_completion___block_invoke;
      v29[3] = &unk_1E2AC66D8;
      objc_copyWeak(&v31, (id *)buf);
      v29[4] = self;
      v30 = v20;
      -[PKPayLaterPaymentIntentController _presentPaymentAuthorizationWithPaymentRequest:presentationSceneIdentifier:completion:](self, "_presentPaymentAuthorizationWithPaymentRequest:presentationSceneIdentifier:completion:", v24, v19, v29);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_TITLE"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("GENERIC_ERROR_MESSAGE"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v25, v26, 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, void *))v20 + 2))(v20, 0, 0, v27);
    }
  }

}

void __177__PKPayLaterPaymentIntentController_presentPaymentAuthorizationForFinancingPlan_primaryPaymentSource_intentDetails_intent_currencyAmount_presentationSceneIdentifier_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((a2 & 1) != 0)
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v13 = 136315394;
        v14 = "-[PKPayLaterPaymentIntentController presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:inten"
              "tDetails:intent:currencyAmount:presentationSceneIdentifier:completion:]_block_invoke";
        v15 = 2048;
        v16 = v9;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "%s %p: Succeeded presenting PKPaymentAuthorizationCoordinator.", (uint8_t *)&v13, 0x16u);
      }

      v10 = objc_msgSend(*(id *)(a1 + 40), "copy");
      v11 = (void *)WeakRetained[2];
      WeakRetained[2] = v10;

    }
    else
    {
      if (v8)
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = 136315394;
        v14 = "-[PKPayLaterPaymentIntentController presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:inten"
              "tDetails:intent:currencyAmount:presentationSceneIdentifier:completion:]_block_invoke";
        v15 = 2048;
        v16 = v12;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "%s %p: Failed to present PKPaymentAuthorizationCoordinator.", (uint8_t *)&v13, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

- (void)_presentPaymentAuthorizationWithPaymentRequest:(id)a3 presentationSceneIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  NSString *v10;
  id v11;
  PKPaymentAuthorizationCoordinator *v12;
  PKPaymentAuthorizationCoordinator *authorizationCoordinator;
  NSString *presentationSceneIdentifier;
  NSString *v15;
  PKPaymentAuthorizationCoordinator *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  PKPayLaterPaymentIntentController *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (NSString *)a4;
  v11 = a5;
  v12 = -[PKPaymentAuthorizationCoordinator initWithPaymentRequest:]([PKPaymentAuthorizationCoordinator alloc], "initWithPaymentRequest:", v9);
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = v12;

  -[PKPaymentAuthorizationCoordinator setDelegate:](self->_authorizationCoordinator, "setDelegate:", self);
  -[PKPaymentAuthorizationCoordinator _setPrivateDelegate:](self->_authorizationCoordinator, "_setPrivateDelegate:", self);
  objc_storeStrong((id *)&self->_currentPaymentRequest, a3);
  presentationSceneIdentifier = self->_presentationSceneIdentifier;
  self->_presentationSceneIdentifier = v10;
  v15 = v10;

  v16 = self->_authorizationCoordinator;
  if (v16)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __123__PKPayLaterPaymentIntentController__presentPaymentAuthorizationWithPaymentRequest_presentationSceneIdentifier_completion___block_invoke;
    v22[3] = &unk_1E2ABDCE8;
    v23 = v9;
    v24 = v11;
    -[PKPaymentAuthorizationCoordinator presentWithCompletion:](v16, "presentWithCompletion:", v22);

    v17 = v15;
  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[PKPayLaterPaymentIntentController _presentPaymentAuthorizationWithPaymentRequest:presentationSceneIdentifier:completion:]";
      v29 = 2048;
      v30 = self;
      v31 = 2048;
      v32 = v9;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "%s %p: PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %p.", buf, 0x20u);
    }

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %@."), v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 0, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v17);
  }

}

void __123__PKPayLaterPaymentIntentController__presentPaymentAuthorizationWithPaymentRequest_presentationSceneIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  char v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__PKPayLaterPaymentIntentController__presentPaymentAuthorizationWithPaymentRequest_presentationSceneIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E2ABE0A8;
  v6 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __123__PKPayLaterPaymentIntentController__presentPaymentAuthorizationWithPaymentRequest_presentationSceneIdentifier_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPaymentAuthorizationCoordinator could not be presented with paymentRequest: %@."), *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2D50]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 0, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 48), v2);

}

- (void)accountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPayLaterPaymentIntentController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKPayLaterPaymentIntentController_accountChanged___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __52__PKPayLaterPaymentIntentController_accountChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v2;
  v4 = v3;
  if (v12 == v4)
  {

LABEL_10:
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = v8;
    v11 = *(void **)(v9 + 104);
    *(_QWORD *)(v9 + 104) = v10;

    return;
  }
  v5 = v4;
  if (v12)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v12, "isEqualToString:", v4);

  if ((v7 & 1) != 0)
    goto LABEL_10;
}

- (void)_peerPaymentAccountChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPayLaterPaymentIntentController__peerPaymentAccountChanged__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __63__PKPayLaterPaymentIntentController__peerPaymentAccountChanged__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "targetDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v3;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setPeerPaymentAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPayLaterAvailableFundingSourcesFilter)availableFundingSourcesFilter
{
  return self->_availableFundingSourcesFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableFundingSourcesFilter, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_currentPaymentRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_cacheByIntentType, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong(&self->_paymentAuthorizationCompletion, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
}

@end
