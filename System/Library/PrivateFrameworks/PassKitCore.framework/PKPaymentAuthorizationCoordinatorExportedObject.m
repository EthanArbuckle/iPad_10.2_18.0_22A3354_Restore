@implementation PKPaymentAuthorizationCoordinatorExportedObject

- (PKPaymentAuthorizationCoordinatorExportedObject)init
{
  return -[PKPaymentAuthorizationCoordinatorExportedObject initWithController:](self, "initWithController:", 0);
}

- (PKPaymentAuthorizationCoordinatorExportedObject)initWithController:(id)a3
{
  id v4;
  PKPaymentAuthorizationCoordinatorExportedObject *v5;
  PKPaymentAuthorizationCoordinatorExportedObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationCoordinatorExportedObject;
  v5 = -[PKPaymentAuthorizationCoordinatorExportedObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    v6->_delegateLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationCoordinatorExportedObject;
  -[PKPaymentAuthorizationCoordinatorExportedObject dealloc](&v2, sel_dealloc);
}

- (void)handleConnectionDidOpenWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)didEncounterAuthorizationEvent:(unint64_t)a3
{
  id WeakRetained;
  id v6;

  -[PKPaymentAuthorizationCoordinatorExportedObject privateDelegate](self, "privateDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v6, "paymentAuthorizationCoordinator:didEncounterAuthorizationEvent:", WeakRetained, a3);

  }
}

- (void)authorizationWillStart
{
  id WeakRetained;
  id v4;

  -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v4, "paymentAuthorizationCoordinatorWillAuthorizePayment:", WeakRetained);

  }
}

- (void)authorizationDidRequestMerchantSession
{
  void *v3;
  PKPaymentRequestMerchantSessionUpdate *WeakRetained;
  _QWORD v5[5];

  -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = (PKPaymentRequestMerchantSessionUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidRequestMerchantSession__block_invoke;
    v5[3] = &unk_1E2AC8880;
    v5[4] = self;
    objc_msgSend(v3, "paymentAuthorizationCoordinator:didRequestMerchantSessionUpdate:", WeakRetained, v5);
  }
  else
  {
    WeakRetained = -[PKPaymentRequestMerchantSessionUpdate initWithStatus:merchantSession:]([PKPaymentRequestMerchantSessionUpdate alloc], "initWithStatus:merchantSession:", 1, 0);
    -[PKPaymentAuthorizationServiceProtocol authorizationDidRequestMerchantSessionCompleteWithUpdate:](self->_serviceProxy, "authorizationDidRequestMerchantSessionCompleteWithUpdate:", WeakRetained);
  }

}

uint64_t __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidRequestMerchantSession__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidRequestMerchantSessionCompleteWithUpdate:", a2);
}

- (void)authorizationDidFinishWithError:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationCoordinatorExportedObject privateDelegate](self, "privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v5, "paymentAuthorizationCoordinator:willFinishWithError:", WeakRetained, v8);

  }
  v7 = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(v4, "paymentAuthorizationCoordinatorDidFinish:", v7);

}

- (void)authorizationDidAuthorizeContext
{
  void *v3;
  PKPaymentAuthorizationResult *WeakRetained;
  _QWORD v5[5];

  -[PKPaymentAuthorizationCoordinatorExportedObject privateDelegate](self, "privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = (PKPaymentAuthorizationResult *)objc_loadWeakRetained((id *)&self->_controller);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizeContext__block_invoke;
    v5[3] = &unk_1E2AC88A8;
    v5[4] = self;
    objc_msgSend(v3, "paymentAuthorizationCoordinator:didAuthorizeContextWithHandler:", WeakRetained, v5);
  }
  else
  {
    WeakRetained = -[PKPaymentAuthorizationResult initWithStatus:errors:]([PKPaymentAuthorizationResult alloc], "initWithStatus:errors:", 0, 0);
    -[PKPaymentAuthorizationServiceProtocol authorizationDidAuthorizeContextCompleteWithResult:](self->_serviceProxy, "authorizationDidAuthorizeContextCompleteWithResult:", WeakRetained);
  }

}

uint64_t __83__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizeContext__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidAuthorizeContextCompleteWithResult:", a2);
}

- (void)authorizationDidAuthorizePayment:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id WeakRetained;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if ((v6 & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePayment___block_invoke;
    v9[3] = &unk_1E2AC88A8;
    v9[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didAuthorizePayment:handler:", WeakRetained, v4, v9);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePayment___block_invoke_2;
    v8[3] = &unk_1E2AC88D0;
    v8[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didAuthorizePayment:completion:", WeakRetained, v4, v8);
  }

}

uint64_t __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePayment___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidAuthorizePaymentCompleteWithResult:", a2);
}

void __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePayment___block_invoke_2(uint64_t a1, uint64_t a2)
{
  PKPaymentAuthorizationResult *v4;

  v4 = objc_alloc_init(PKPaymentAuthorizationResult);
  -[PKPaymentAuthorizationResult setStatus:](v4, "setStatus:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidAuthorizePaymentCompleteWithResult:", v4);

}

- (void)authorizationDidAuthorizePurchase:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];

  v4 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject privateDelegate](self, "privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __85__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePurchase___block_invoke;
    v7[3] = &unk_1E2AC88D0;
    v7[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didAuthorizePurchase:completion:", WeakRetained, v4, v7);

  }
  else
  {
    -[PKPaymentAuthorizationServiceProtocol authorizationDidAuthorizePurchaseCompleteWithStatus:](self->_serviceProxy, "authorizationDidAuthorizePurchaseCompleteWithStatus:", 0);
  }

}

uint64_t __85__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePurchase___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidAuthorizePurchaseCompleteWithStatus:", a2);
}

- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];

  v4 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject privateDelegate](self, "privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __93__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePeerPaymentQuote___block_invoke;
    v7[3] = &unk_1E2AC88A8;
    v7[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didAuthorizePeerPaymentQuote:handler:", WeakRetained, v4, v7);

  }
  else
  {
    -[PKPaymentAuthorizationServiceProtocol authorizationDidAuthorizePurchaseCompleteWithStatus:](self->_serviceProxy, "authorizationDidAuthorizePurchaseCompleteWithStatus:", 0);
  }

}

uint64_t __93__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizePeerPaymentQuote___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:", a2);
}

- (void)authorizationDidAuthorizeApplePayTrustSignature:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];

  v4 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject privateDelegate](self, "privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __99__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizeApplePayTrustSignature___block_invoke;
    v7[3] = &unk_1E2AC88A8;
    v7[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didAuthorizeApplePayTrustSignature:handler:", WeakRetained, v4, v7);

  }
  else
  {
    -[PKPaymentAuthorizationServiceProtocol authorizationDidAuthorizePurchaseCompleteWithStatus:](self->_serviceProxy, "authorizationDidAuthorizePurchaseCompleteWithStatus:", 0);
  }

}

uint64_t __99__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidAuthorizeApplePayTrustSignature___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:", a2);
}

- (void)authorizationDidUpdateAccountServicePaymentMethod:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(0xEuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[PKPaymentAuthorizationCoordinatorExportedObject authorizationDidUpdateAccountServicePaymentMethod:]";
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[PKPaymentAuthorizationCoordinatorExportedObject privateDelegate](self, "privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __101__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidUpdateAccountServicePaymentMethod___block_invoke;
    v8[3] = &unk_1E2AC88F8;
    v8[4] = self;
    objc_msgSend(v6, "paymentAuthorizationCoordinator:didUpdateAccountServicePaymentMethod:handler:", WeakRetained, v4, v8);

  }
  else
  {
    -[PKPaymentAuthorizationServiceProtocol authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:signatureRequest:](self->_serviceProxy, "authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:signatureRequest:", 0, 0);
  }

}

uint64_t __101__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidUpdateAccountServicePaymentMethod___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:signatureRequest:", a2, a3);
}

- (void)authorizationDidSelectShippingMethod:(id)a3
{
  id v4;
  void *v5;
  PKPaymentRequestShippingMethodUpdate *WeakRetained;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = (PKPaymentRequestShippingMethodUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingMethod___block_invoke;
    v8[3] = &unk_1E2AC8920;
    v8[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didSelectShippingMethod:handler:", WeakRetained, v4, v8);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = (PKPaymentRequestShippingMethodUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingMethod___block_invoke_2;
    v7[3] = &unk_1E2AC8948;
    v7[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didSelectShippingMethod:completion:", WeakRetained, v4, v7);
  }
  else
  {
    WeakRetained = objc_alloc_init(PKPaymentRequestShippingMethodUpdate);
    -[PKPaymentRequestUpdate setStatus:](WeakRetained, "setStatus:", 0);
    -[PKPaymentAuthorizationServiceProtocol authorizationDidSelectShippingMethodCompleteWithUpdate:](self->_serviceProxy, "authorizationDidSelectShippingMethodCompleteWithUpdate:", WeakRetained);
  }

}

uint64_t __88__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingMethod___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidSelectShippingMethodCompleteWithUpdate:", a2);
}

void __88__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingMethod___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  PKPaymentRequestShippingMethodUpdate *v6;

  v5 = a3;
  v6 = objc_alloc_init(PKPaymentRequestShippingMethodUpdate);
  -[PKPaymentRequestUpdate setStatus:](v6, "setStatus:", a2);
  -[PKPaymentRequestUpdate setPaymentSummaryItems:](v6, "setPaymentSummaryItems:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidSelectShippingMethodCompleteWithUpdate:", v6);
}

- (void)authorizationDidSelectShippingAddress:(id)a3
{
  id v4;
  void *v5;
  PKPaymentRequestShippingContactUpdate *WeakRetained;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = (PKPaymentRequestShippingContactUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingAddress___block_invoke;
    v8[3] = &unk_1E2AC8970;
    v8[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didSelectShippingAddress:handler:", WeakRetained, v4, v8);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = (PKPaymentRequestShippingContactUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingAddress___block_invoke_2;
    v7[3] = &unk_1E2AC8998;
    v7[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didSelectShippingAddress:completion:", WeakRetained, v4, v7);
  }
  else
  {
    WeakRetained = objc_alloc_init(PKPaymentRequestShippingContactUpdate);
    -[PKPaymentRequestUpdate setStatus:](WeakRetained, "setStatus:", 0);
    -[PKPaymentAuthorizationServiceProtocol authorizationDidSelectShippingAddressCompleteWithUpdate:](self->_serviceProxy, "authorizationDidSelectShippingAddressCompleteWithUpdate:", WeakRetained);
  }

}

uint64_t __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidSelectShippingAddressCompleteWithUpdate:", a2);
}

void __89__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectShippingAddress___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  PKPaymentRequestShippingContactUpdate *v9;
  PKPaymentRequestShippingContactUpdate *v10;

  v7 = a4;
  v8 = a3;
  v9 = [PKPaymentRequestShippingContactUpdate alloc];
  v10 = -[PKPaymentRequestShippingContactUpdate initWithErrors:paymentSummaryItems:shippingMethods:](v9, "initWithErrors:paymentSummaryItems:shippingMethods:", MEMORY[0x1E0C9AA60], v7, v8);

  -[PKPaymentRequestUpdate setStatus:](v10, "setStatus:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidSelectShippingAddressCompleteWithUpdate:", v10);

}

- (void)authorizationDidSelectPaymentMethod:(id)a3
{
  id v4;
  void *v5;
  PKPaymentRequestPaymentMethodUpdate *WeakRetained;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = (PKPaymentRequestPaymentMethodUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectPaymentMethod___block_invoke;
    v8[3] = &unk_1E2AC89C0;
    v8[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didSelectPaymentMethod:handler:", WeakRetained, v4, v8);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = (PKPaymentRequestPaymentMethodUpdate *)objc_loadWeakRetained((id *)&self->_controller);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectPaymentMethod___block_invoke_2;
    v7[3] = &unk_1E2AC89E8;
    v7[4] = self;
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didSelectPaymentMethod:completion:", WeakRetained, v4, v7);
  }
  else
  {
    WeakRetained = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
    -[PKPaymentAuthorizationServiceProtocol authorizationDidSelectPaymentMethodCompleteWithUpdate:](self->_serviceProxy, "authorizationDidSelectPaymentMethodCompleteWithUpdate:", WeakRetained);
  }

}

uint64_t __87__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectPaymentMethod___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidSelectPaymentMethodCompleteWithUpdate:", a2);
}

void __87__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidSelectPaymentMethod___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentRequestPaymentMethodUpdate *v4;

  v3 = a2;
  v4 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  -[PKPaymentRequestUpdate setPaymentSummaryItems:](v4, "setPaymentSummaryItems:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidSelectPaymentMethodCompleteWithUpdate:", v4);
}

- (void)authorizationDidChangeCouponCode:(id)a3
{
  id v4;
  void *v5;
  PKPaymentRequestCouponCodeUpdate *v6;
  id WeakRetained;
  _QWORD aBlock[5];

  v4 = a3;
  -[PKPaymentAuthorizationCoordinatorExportedObject delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidChangeCouponCode___block_invoke;
    aBlock[3] = &unk_1E2AC8A10;
    aBlock[4] = self;
    v6 = (PKPaymentRequestCouponCodeUpdate *)_Block_copy(aBlock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v5, "paymentAuthorizationCoordinator:didChangeCouponCode:handler:", WeakRetained, v4, v6);

  }
  else
  {
    v6 = objc_alloc_init(PKPaymentRequestCouponCodeUpdate);
    -[PKPaymentAuthorizationServiceProtocol authorizationDidChangeCouponCodeCompleteWithUpdate:](self->_serviceProxy, "authorizationDidChangeCouponCodeCompleteWithUpdate:", v6);
  }

}

uint64_t __84__PKPaymentAuthorizationCoordinatorExportedObject_authorizationDidChangeCouponCode___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "authorizationDidChangeCouponCodeCompleteWithUpdate:", a2);
}

- (PKPaymentAuthorizationCoordinatorDelegate)delegate
{
  os_unfair_lock_s *p_delegateLock;
  id WeakRetained;

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_delegateLock);
  return (PKPaymentAuthorizationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_delegateLock;
  id v5;

  p_delegateLock = &self->_delegateLock;
  v5 = a3;
  os_unfair_lock_lock(p_delegateLock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_delegateLock);
}

- (PKPaymentAuthorizationCoordinatorPrivateDelegate)privateDelegate
{
  os_unfair_lock_s *p_delegateLock;
  id WeakRetained;

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);
  os_unfair_lock_unlock(p_delegateLock);
  return (PKPaymentAuthorizationCoordinatorPrivateDelegate *)WeakRetained;
}

- (void)setPrivateDelegate:(id)a3
{
  os_unfair_lock_s *p_delegateLock;
  id v5;

  p_delegateLock = &self->_delegateLock;
  v5 = a3;
  os_unfair_lock_lock(p_delegateLock);
  objc_storeWeak((id *)&self->_privateDelegate, v5);

  os_unfair_lock_unlock(p_delegateLock);
}

- (PKPaymentAuthorizationCoordinator)controller
{
  return (PKPaymentAuthorizationCoordinator *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (PKPaymentAuthorizationServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
