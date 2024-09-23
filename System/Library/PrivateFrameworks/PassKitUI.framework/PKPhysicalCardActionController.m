@implementation PKPhysicalCardActionController

- (PKPhysicalCardActionController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPhysicalCardActionController *v15;
  PKPhysicalCardActionController *v16;
  PKPaymentDevice *v17;
  PKPaymentDevice *paymentDevice;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPhysicalCardActionController;
  v15 = -[PKPhysicalCardActionController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountService, a3);
    objc_storeStrong((id *)&v16->_account, a4);
    objc_storeStrong((id *)&v16->_accountUser, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v17 = (PKPaymentDevice *)objc_alloc_init(MEMORY[0x1E0D67108]);
    paymentDevice = v16->_paymentDevice;
    v16->_paymentDevice = v17;

    v16->_state = 0;
  }

  return v16;
}

- (void)activatePhysicalCard:(id)a3 withActivationCode:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6
    && -[PKPhysicalCardActionController _canPerformActionWithState:](self, "_canPerformActionWithState:", self->_state))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D674C8]), "initWithActionType:", 4);
    objc_msgSend(v7, "setActivationCode:", v6);
    -[PKPhysicalCardActionController _performAction:onPhysicalCard:](self, "_performAction:onPhysicalCard:", v7, v8);

  }
}

- (void)activatePhysicalCardWithoutActivationCode:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PKPhysicalCardActionController _canPerformActionWithState:](self, "_canPerformActionWithState:", self->_state))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D674C8]), "initWithActionType:", 4);
    -[PKPhysicalCardActionController _performAction:onPhysicalCard:](self, "_performAction:onPhysicalCard:", v4, v5);

  }
}

- (void)enablePhysicalCard:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PKPhysicalCardActionController _canPerformActionWithState:](self, "_canPerformActionWithState:", self->_state))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D674C8]), "initWithActionType:", 1);
    -[PKPhysicalCardActionController _performAction:onPhysicalCard:](self, "_performAction:onPhysicalCard:", v4, v5);

  }
}

- (void)disablePhysicalCard:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PKPhysicalCardActionController _canPerformActionWithState:](self, "_canPerformActionWithState:", self->_state))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D674C8]), "initWithActionType:", 2);
    -[PKPhysicalCardActionController _performAction:onPhysicalCard:](self, "_performAction:onPhysicalCard:", v4, v5);

  }
}

- (void)cancelPhysicalCard:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PKPhysicalCardActionController _canPerformActionWithState:](self, "_canPerformActionWithState:", self->_state))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D674C8]), "initWithActionType:", 3);
    -[PKPhysicalCardActionController _performAction:onPhysicalCard:](self, "_performAction:onPhysicalCard:", v4, v5);

  }
}

- (void)replacePhysicalCard:(id)a3 withReason:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[PKPhysicalCardActionController _canPerformActionWithState:](self, "_canPerformActionWithState:", self->_state))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D674C8]), "initWithActionType:", 5);
    objc_msgSend(v6, "setReason:", a4);
    -[PKPhysicalCardActionController _performAction:onPhysicalCard:](self, "_performAction:onPhysicalCard:", v6, v7);

  }
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  PKPaymentAuthorizationCoordinator *v4;
  NSObject *v5;
  _QWORD v6[5];
  PKPaymentAuthorizationCoordinator *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  PKPhysicalCardActionController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_authorizationCoordinator == v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[PKPhysicalCardActionController paymentAuthorizationCoordinatorDidFinish:]";
      v10 = 2048;
      v11 = self;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__PKPhysicalCardActionController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v6[3] = &unk_1E3E61388;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __75__PKPhysicalCardActionController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PKPhysicalCardActionController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  v6[3] = &unk_1E3E612E8;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v4, "dismissWithCompletion:", v6);
}

void __75__PKPhysicalCardActionController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 40))
  {
    v3 = 2;
    v4 = 0;
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 48);
    if (v4)
      v3 = 3;
    else
      v3 = 0;
  }
  objc_msgSend((id)v2, "_transitionToState:withError:", v3, v4);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;

}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSceneIdentifierForPhysicalCardActionController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__PKPhysicalCardActionController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke;
  v9[3] = &unk_1E3E614F0;
  v10 = v7;
  v8 = v7;
  -[PKPhysicalCardActionController _performApplePayTrustSignatureRequestWithSignature:completion:](self, "_performApplePayTrustSignatureRequestWithSignature:completion:", a4, v9);

}

void __109__PKPhysicalCardActionController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke(uint64_t a1, int a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D670A8]), "initWithStatus:errors:", a2 ^ 1u, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_performAction:(id)a3 onPhysicalCard:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  PKPaymentDevice *paymentDevice;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[PKPhysicalCardActionController _transitionToState:withError:](self, "_transitionToState:withError:", 1, 0);
  v8 = objc_msgSend(v6, "actionType");
  paymentDevice = self->_paymentDevice;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  if (v8 == 5)
    v10 = 251;
  else
    v10 = 0;
  v13[2] = __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke;
  v13[3] = &unk_1E3E75998;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[PKPaymentDevice paymentDeviceMetadataFields:completion:](paymentDevice, "paymentDeviceMetadataFields:completion:", v10, v13);

}

void __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 8);
  v5 = (void *)a1[6];
  v6 = a2;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 64), "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 72), "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke_2;
  v10[3] = &unk_1E3E75970;
  v10[4] = a1[4];
  objc_msgSend(v4, "beginPhysicalCardAction:onPhysicalCardWithIdentifier:forAccountWithIdentifier:accountUserAltDSID:deviceMetadata:completion:", v3, v7, v8, v9, v6, v10);

}

void __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];

  v10 = a2;
  v11 = a3;
  v12 = a6;
  v13 = v12;
  if (!v10 || v12)
  {
    v16 = objc_msgSend(a4, "count");
    if (v13 || !v16)
    {
      v17 = 3;
      v18 = v13;
    }
    else
    {
      v17 = 2;
      v18 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_transitionToState:withError:", v17, v18);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a3);
    objc_msgSend(*(id *)(a1 + 32), "_generatePaymentRequestWithSignatureRequest:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke_3;
    v19[3] = &unk_1E3E62288;
    v19[4] = v15;
    objc_msgSend(v15, "_presentApplePayTrustWithPaymentRequest:completion:", v14, v19);

  }
}

uint64_t __64__PKPhysicalCardActionController__performAction_onPhysicalCard___block_invoke_3(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_transitionToState:withError:", 3, 0);
  return result;
}

- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKAccountWebServicePhysicalCardActionRequest *lastActionRequest;
  PKAccountService *accountService;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  lastActionRequest = self->_lastActionRequest;
  if (lastActionRequest)
  {
    accountService = self->_accountService;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __96__PKPhysicalCardActionController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke;
    v11[3] = &unk_1E3E759C0;
    v11[4] = self;
    v12 = v7;
    -[PKAccountService completePhysicalCardActionRequest:withSignature:completion:](accountService, "completePhysicalCardActionRequest:withSignature:completion:", lastActionRequest, v6, v11);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __96__PKPhysicalCardActionController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKPhysicalCardActionController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2;
  block[3] = &unk_1E3E669B8;
  v16 = v7;
  v17 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __96__PKPhysicalCardActionController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count") && *(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48) == 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 56) + 40) = v2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 56) + 48), *(id *)(a1 + 48));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8))(result + 16))(result, v2);
  return result;
}

- (id)_generatePaymentRequestWithSignatureRequest:(id)a3
{
  void *v3;
  id v4;
  NSDecimalNumber *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3598];
  v4 = a3;
  objc_msgSend(v3, "zero");
  v5 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v5, (NSString *)*MEMORY[0x1E0D6A608]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0D67260]);
  objc_msgSend(v7, "setRequestType:", 4);
  objc_msgSend(v6, "currency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrencyCode:", v8);

  objc_msgSend(v7, "setClientCallbackTimeout:", 65.0);
  objc_msgSend(v7, "setConfirmationStyle:", 1);
  PKLocalizedFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedErrorMessage:", v9);

  PKLocalizedFeatureString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedAuthorizingTitle:", v10);

  v11 = (void *)MEMORY[0x1E0D67358];
  PKLocalizedFeatureString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "summaryItemWithLabel:amount:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaymentSummaryItems:", v15);

  objc_msgSend(v7, "setSuppressTotal:", 1);
  objc_msgSend(v7, "setApplePayTrustSignatureRequest:", v4);

  return v7;
}

- (void)_presentApplePayTrustWithPaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPaymentAuthorizationCoordinator *v8;
  PKPaymentAuthorizationCoordinator *authorizationCoordinator;
  PKPaymentAuthorizationCoordinator *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  PKPhysicalCardActionController *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (PKPaymentAuthorizationCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", v6);
    authorizationCoordinator = self->_authorizationCoordinator;
    self->_authorizationCoordinator = v8;

    -[PKPaymentAuthorizationCoordinator setDelegate:](self->_authorizationCoordinator, "setDelegate:", self);
    -[PKPaymentAuthorizationCoordinator _setPrivateDelegate:](self->_authorizationCoordinator, "_setPrivateDelegate:", self);
    v10 = self->_authorizationCoordinator;
    if (v10)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __85__PKPhysicalCardActionController__presentApplePayTrustWithPaymentRequest_completion___block_invoke;
      v12[3] = &unk_1E3E614F0;
      v13 = v7;
      -[PKPaymentAuthorizationCoordinator presentWithCompletion:](v10, "presentWithCompletion:", v12);

      goto LABEL_9;
    }
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[PKPhysicalCardActionController _presentApplePayTrustWithPaymentRequest:completion:]";
      v16 = 2048;
      v17 = self;
      v18 = 2048;
      v19 = v6;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "%s %p: PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %p.", buf, 0x20u);
    }

  }
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_9:

}

uint64_t __85__PKPhysicalCardActionController__presentApplePayTrustWithPaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_canPerformActionWithState:(int64_t)a3
{
  return ((unint64_t)a3 < 4) & (0xDu >> (a3 & 0xF));
}

- (void)_transitionToState:(int64_t)a3 withError:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_state != a3)
  {
    self->_state = a3;
    if ((unint64_t)a3 > 3)
      v7 = 0;
    else
      v7 = off_1E3E759E0[a3];
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPhysicalCardController transitioning to state: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "physicalCardActionController:didChangeToState:withError:", self, a3, v6);

  }
}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_lastActionError, 0);
  objc_storeStrong((id *)&self->_lastActionRequest, 0);
  objc_storeStrong((id *)&self->_paymentDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
