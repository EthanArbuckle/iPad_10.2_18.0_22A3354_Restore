@implementation PKExtensionVendorContext

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__PKExtensionVendorContext_handleHostApplicationWillResignActive___block_invoke;
  v3[3] = &unk_1E2ABE1C0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __66__PKExtensionVendorContext_handleHostApplicationWillResignActive___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleHostApplicationWillResignActive:", *(unsigned __int8 *)(a1 + 40));

}

- (void)handleHostApplicationDidBecomeActive
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKExtensionVendorContext_handleHostApplicationDidBecomeActive__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __64__PKExtensionVendorContext_handleHostApplicationDidBecomeActive__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleHostApplicationDidBecomeActive");

}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKExtensionVendorContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__PKExtensionVendorContext_authorizationDidRequestMerchantSessionCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __85__PKExtensionVendorContext_authorizationDidRequestMerchantSessionCompleteWithUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  PKPaymentRequestMerchantSessionUpdate *v5;
  void *v6;
  PKPaymentRequestMerchantSessionUpdate *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "status")
    || (objc_msgSend(*(id *)(a1 + 40), "entitlementWhitelist"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "session"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v2, "isEntitledForMerchantSession:", v3),
        v3,
        v2,
        !v4))
  {
    v5 = -[PKPaymentRequestMerchantSessionUpdate initWithStatus:merchantSession:]([PKPaymentRequestMerchantSessionUpdate alloc], "initWithStatus:merchantSession:", 1, 0);
  }
  else
  {
    v5 = (PKPaymentRequestMerchantSessionUpdate *)*(id *)(a1 + 32);
  }
  v7 = v5;
  objc_msgSend(*(id *)(a1 + 40), "_principalObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authorizationDidRequestMerchantSessionCompleteWithUpdate:", v7);

}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PKExtensionVendorContext_authorizationDidAuthorizePaymentCompleteWithResult___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __79__PKExtensionVendorContext_authorizationDidAuthorizePaymentCompleteWithResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidAuthorizePaymentCompleteWithResult:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidAuthorizePaymentCompleteWithStatus:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__PKExtensionVendorContext_authorizationDidAuthorizePaymentCompleteWithStatus___block_invoke;
  v3[3] = &unk_1E2AC4430;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __79__PKExtensionVendorContext_authorizationDidAuthorizePaymentCompleteWithStatus___block_invoke(uint64_t a1)
{
  void *v2;
  PKPaymentAuthorizationResult *v3;

  v3 = objc_alloc_init(PKPaymentAuthorizationResult);
  -[PKPaymentAuthorizationResult setStatus:](v3, "setStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidAuthorizePaymentCompleteWithResult:", v3);

}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__PKExtensionVendorContext_authorizationDidAuthorizePurchaseCompleteWithStatus___block_invoke;
  v3[3] = &unk_1E2AC4430;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __80__PKExtensionVendorContext_authorizationDidAuthorizePurchaseCompleteWithStatus___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidAuthorizePurchaseCompleteWithStatus:", *(_QWORD *)(a1 + 40));

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
  v6[2] = __88__PKExtensionVendorContext_authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __88__PKExtensionVendorContext_authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:", *(_QWORD *)(a1 + 40));

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
  v6[2] = __83__PKExtensionVendorContext_authorizationDidSelectShippingMethodCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __83__PKExtensionVendorContext_authorizationDidSelectShippingMethodCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidSelectShippingMethodCompleteWithUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectShippingMethodCompleteWithStatus:(int64_t)a3 paymentSummaryItems:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  PKExtensionVendorContext *v10;
  int64_t v11;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PKExtensionVendorContext_authorizationDidSelectShippingMethodCompleteWithStatus_paymentSummaryItems___block_invoke;
  block[3] = &unk_1E2AC5810;
  v10 = self;
  v11 = a3;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __103__PKExtensionVendorContext_authorizationDidSelectShippingMethodCompleteWithStatus_paymentSummaryItems___block_invoke(uint64_t a1)
{
  void *v2;
  PKPaymentRequestShippingMethodUpdate *v3;

  v3 = objc_alloc_init(PKPaymentRequestShippingMethodUpdate);
  -[PKPaymentRequestUpdate setStatus:](v3, "setStatus:", *(_QWORD *)(a1 + 48));
  -[PKPaymentRequestUpdate setPaymentSummaryItems:](v3, "setPaymentSummaryItems:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidSelectShippingMethodCompleteWithUpdate:", v3);

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
  v6[2] = __84__PKExtensionVendorContext_authorizationDidSelectShippingAddressCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __84__PKExtensionVendorContext_authorizationDidSelectShippingAddressCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidSelectShippingAddressCompleteWithUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectShippingAddressCompleteWithStatus:(int64_t)a3 shippingMethods:(id)a4 paymentSummaryItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PKExtensionVendorContext *v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __120__PKExtensionVendorContext_authorizationDidSelectShippingAddressCompleteWithStatus_shippingMethods_paymentSummaryItems___block_invoke;
  v12[3] = &unk_1E2AD0268;
  v13 = v9;
  v14 = v8;
  v15 = self;
  v16 = a3;
  v10 = v8;
  v11 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __120__PKExtensionVendorContext_authorizationDidSelectShippingAddressCompleteWithStatus_shippingMethods_paymentSummaryItems___block_invoke(uint64_t a1)
{
  PKPaymentRequestShippingContactUpdate *v2;
  void *v3;
  PKPaymentRequestShippingContactUpdate *v4;

  v2 = [PKPaymentRequestShippingContactUpdate alloc];
  v4 = -[PKPaymentRequestShippingContactUpdate initWithErrors:paymentSummaryItems:shippingMethods:](v2, "initWithErrors:paymentSummaryItems:shippingMethods:", MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[PKPaymentRequestUpdate setStatus:](v4, "setStatus:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "_principalObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authorizationDidSelectShippingAddressCompleteWithUpdate:", v4);

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
  v6[2] = __82__PKExtensionVendorContext_authorizationDidSelectPaymentMethodCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __82__PKExtensionVendorContext_authorizationDidSelectPaymentMethodCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidSelectPaymentMethodCompleteWithUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKExtensionVendorContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__PKExtensionVendorContext_authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __95__PKExtensionVendorContext_authorizationDidSelectPaymentMethodCompleteWithPaymentSummaryItems___block_invoke(uint64_t a1)
{
  void *v2;
  PKPaymentRequestPaymentMethodUpdate *v3;

  v3 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  -[PKPaymentRequestUpdate setPaymentSummaryItems:](v3, "setPaymentSummaryItems:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidSelectPaymentMethodCompleteWithUpdate:", v3);

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
  v6[2] = __79__PKExtensionVendorContext_authorizationDidChangeCouponCodeCompleteWithUpdate___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __79__PKExtensionVendorContext_authorizationDidChangeCouponCodeCompleteWithUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidChangeCouponCodeCompleteWithUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)handleHostApplicationDidCancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKExtensionVendorContext_handleHostApplicationDidCancel__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__PKExtensionVendorContext_handleHostApplicationDidCancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "handleHostApplicationDidCancel");

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
  v6[2] = __56__PKExtensionVendorContext_handleDismissWithCompletion___block_invoke;
  v6[3] = &unk_1E2ABE058;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__PKExtensionVendorContext_handleDismissWithCompletion___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();
  v3 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v4, "handleDismissWithCompletion:", v3);
  }
  else if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40));
  }

}

- (void)prepareWithPaymentRequest:(id)a3 completion:(id)a4
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
  block[2] = __65__PKExtensionVendorContext_prepareWithPaymentRequest_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__PKExtensionVendorContext_prepareWithPaymentRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "entitlementWhitelist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEntitledForPaymentRequest:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_principalObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "prepareWithPaymentRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (!v4)
      return;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }

}

- (id)entitlementWhitelist
{
  PKEntitlementWhitelist *whitelist;
  PKEntitlementWhitelist *v4;
  void *v5;
  PKEntitlementWhitelist *v6;
  PKEntitlementWhitelist *v7;

  whitelist = self->_whitelist;
  if (!whitelist)
  {
    v4 = [PKEntitlementWhitelist alloc];
    -[PKExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKEntitlementWhitelist initWithConnection:](v4, "initWithConnection:", v5);
    v7 = self->_whitelist;
    self->_whitelist = v6;

    whitelist = self->_whitelist;
  }
  return whitelist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end
