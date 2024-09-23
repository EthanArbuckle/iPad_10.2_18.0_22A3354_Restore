@implementation PKPaymentAuthorizationServiceProxy

- (PKEntitlementWhitelist)entitlementWhitelist
{
  PKEntitlementWhitelist *entitlementWhitelist;
  PKEntitlementWhitelist *v4;
  PKEntitlementWhitelist *v5;

  entitlementWhitelist = self->_entitlementWhitelist;
  if (!entitlementWhitelist)
  {
    v4 = (PKEntitlementWhitelist *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D40]), "initWithConnection:", self->_connection);
    v5 = self->_entitlementWhitelist;
    self->_entitlementWhitelist = v4;

    entitlementWhitelist = self->_entitlementWhitelist;
  }
  return entitlementWhitelist;
}

- (PKPaymentAuthorizationServiceProxy)initWithConnection:(id)a3 paymentRequest:(id)a4
{
  id v7;
  id v8;
  PKPaymentAuthorizationServiceProxy *v9;
  PKPaymentAuthorizationServiceProxy *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationServiceProxy;
  v9 = -[PKPaymentAuthorizationServiceProxy init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_paymentRequest, a4);
  }

  return v10;
}

- (void)handleHostApplicationDidCancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationServiceProxy_handleHostApplicationDidCancel__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __68__PKPaymentAuthorizationServiceProxy_handleHostApplicationDidCancel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "handleHostApplicationDidCancel");

}

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PKPaymentAuthorizationServiceProxy_handleHostApplicationWillResignActive___block_invoke;
  v3[3] = &unk_1E3E64C10;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __76__PKPaymentAuthorizationServiceProxy_handleHostApplicationWillResignActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "handleHostApplicationWillResignActive:", *(unsigned __int8 *)(a1 + 40));

}

- (void)handleHostApplicationDidBecomeActive
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKPaymentAuthorizationServiceProxy_handleHostApplicationDidBecomeActive__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__PKPaymentAuthorizationServiceProxy_handleHostApplicationDidBecomeActive__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "handleHostApplicationDidBecomeActive");

}

- (void)handleDismissWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKPaymentAuthorizationServiceProxy_handleDismissWithCompletion___block_invoke;
  v6[3] = &unk_1E3E61850;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __66__PKPaymentAuthorizationServiceProxy_handleDismissWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "handleDismissWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentAuthorizationServiceProxy_fulfillRemotePaymentRequestPromise_completion___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __84__PKPaymentAuthorizationServiceProxy_fulfillRemotePaymentRequestPromise_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  objc_msgSend(WeakRetained, "fulfillRemotePaymentRequestPromise:completion:", a1[5], a1[6]);

}

- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__PKPaymentAuthorizationServiceProxy_rejectRemotePaymentRequestPromiseWithFailure___block_invoke;
  v3[3] = &unk_1E3E62010;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __83__PKPaymentAuthorizationServiceProxy_rejectRemotePaymentRequestPromiseWithFailure___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "rejectRemotePaymentRequestPromiseWithFailure:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__PKPaymentAuthorizationServiceProxy_authorizationDidRequestMerchantSessionCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __95__PKPaymentAuthorizationServiceProxy_authorizationDidRequestMerchantSessionCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sanitizeMerchantSessionUpdate:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidRequestMerchantSessionCompleteWithUpdate:", v3);

}

- (id)_sanitizeMerchantSessionUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "status")
    || (-[PKPaymentAuthorizationServiceProxy entitlementWhitelist](self, "entitlementWhitelist"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "session"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEntitledForMerchantSession:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D67270]), "initWithStatus:merchantSession:", 1, 0);
  }
  else
  {
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentAuthorizationServiceProxy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizeContextCompleteWithResult___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __89__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizeContextCompleteWithResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(WeakRetained, "authorizationDidAuthorizeContextCompleteWithResult:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "merchantIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_fault_impl(&dword_19D178000, v2, OS_LOG_TYPE_FAULT, "PKPaymentAuthorizationResult was nil. This is a serious error: %@", buf, 0xCu);

    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "merchantIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationResult was nil. This is a serious error: %@", buf, 0xCu);

    }
  }
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentAuthorizationServiceProxy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePaymentCompleteWithResult___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __89__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePaymentCompleteWithResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(WeakRetained, "authorizationDidAuthorizePaymentCompleteWithResult:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "merchantIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_fault_impl(&dword_19D178000, v2, OS_LOG_TYPE_FAULT, "PKPaymentAuthorizationResult was nil. This is a serious error: %@", buf, 0xCu);

    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "merchantIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationResult was nil. This is a serious error: %@", buf, 0xCu);

    }
  }
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePurchaseCompleteWithStatus___block_invoke;
  v3[3] = &unk_1E3E62010;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __90__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePurchaseCompleteWithStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidAuthorizePurchaseCompleteWithStatus:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __98__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __104__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __104__PKPaymentAuthorizationServiceProxy_authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__PKPaymentAuthorizationServiceProxy_authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate_signatureRequest___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __123__PKPaymentAuthorizationServiceProxy_authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate_signatureRequest___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  objc_msgSend(WeakRetained, "authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:signatureRequest:", a1[5], a1[6]);

}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__PKPaymentAuthorizationServiceProxy_authorizationDidSelectShippingMethodCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __93__PKPaymentAuthorizationServiceProxy_authorizationDidSelectShippingMethodCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidSelectShippingMethodCompleteWithUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__PKPaymentAuthorizationServiceProxy_authorizationDidSelectShippingAddressCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __94__PKPaymentAuthorizationServiceProxy_authorizationDidSelectShippingAddressCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidSelectShippingAddressCompleteWithUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__PKPaymentAuthorizationServiceProxy_authorizationDidSelectPaymentMethodCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __92__PKPaymentAuthorizationServiceProxy_authorizationDidSelectPaymentMethodCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidSelectPaymentMethodCompleteWithUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__PKPaymentAuthorizationServiceProxy_authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __105__PKPaymentAuthorizationServiceProxy_authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidSelectPaymentMethodCompleteWithUpdate:", 0);

}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__PKPaymentAuthorizationServiceProxy_authorizationDidChangeCouponCodeCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __89__PKPaymentAuthorizationServiceProxy_authorizationDidChangeCouponCodeCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "authorizationDidChangeCouponCodeCompleteWithUpdate:", *(_QWORD *)(a1 + 40));

}

- (PKPaymentAuthorizationServiceProtocol)delegate
{
  return (PKPaymentAuthorizationServiceProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementWhitelist, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
