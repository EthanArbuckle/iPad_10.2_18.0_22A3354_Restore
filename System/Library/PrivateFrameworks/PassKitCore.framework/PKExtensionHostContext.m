@implementation PKExtensionHostContext

- (PKExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  PKExtensionHostContext *v5;
  dispatch_group_t v6;
  OS_dispatch_group *delayCallbacksGroup;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKExtensionHostContext;
  v5 = -[PKExtensionHostContext initWithInputItems:listenerEndpoint:contextUUID:](&v9, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  if (v5)
  {
    v6 = dispatch_group_create();
    delayCallbacksGroup = v5->_delayCallbacksGroup;
    v5->_delayCallbacksGroup = (OS_dispatch_group *)v6;

  }
  return v5;
}

- (void)beginDelayingCallbacks
{
  dispatch_group_enter((dispatch_group_t)self->_delayCallbacksGroup);
}

- (void)endDelayingCallbacks
{
  dispatch_group_leave((dispatch_group_t)self->_delayCallbacksGroup);
}

- (void)authorizationWillStart
{
  NSObject *delayCallbacksGroup;
  _QWORD block[5];

  delayCallbacksGroup = self->_delayCallbacksGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PKExtensionHostContext_authorizationWillStart__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], block);
}

void __48__PKExtensionHostContext_authorizationWillStart__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "authorizationWillStart");

}

- (void)authorizationDidFinishWithError:(id)a3
{
  id v4;
  NSObject *delayCallbacksGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PKExtensionHostContext_authorizationDidFinishWithError___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v7);

}

void __58__PKExtensionHostContext_authorizationDidFinishWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidFinishWithError:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidRequestMerchantSession
{
  NSObject *delayCallbacksGroup;
  _QWORD block[5];

  delayCallbacksGroup = self->_delayCallbacksGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKExtensionHostContext_authorizationDidRequestMerchantSession__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], block);
}

void __64__PKExtensionHostContext_authorizationDidRequestMerchantSession__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "authorizationDidRequestMerchantSession");

}

- (void)authorizationDidAuthorizePayment:(id)a3
{
  id v4;
  NSObject *delayCallbacksGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PKExtensionHostContext_authorizationDidAuthorizePayment___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v7);

}

void __59__PKExtensionHostContext_authorizationDidAuthorizePayment___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidAuthorizePayment:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidAuthorizePurchase:(id)a3
{
  id v4;
  NSObject *delayCallbacksGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PKExtensionHostContext_authorizationDidAuthorizePurchase___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v7);

}

void __60__PKExtensionHostContext_authorizationDidAuthorizePurchase___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidAuthorizePurchase:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3
{
  id v4;
  NSObject *delayCallbacksGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PKExtensionHostContext_authorizationDidAuthorizePeerPaymentQuote___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v7);

}

void __68__PKExtensionHostContext_authorizationDidAuthorizePeerPaymentQuote___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidAuthorizePeerPaymentQuote:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectShippingMethod:(id)a3
{
  id v4;
  NSObject *delayCallbacksGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKExtensionHostContext_authorizationDidSelectShippingMethod___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v7);

}

void __63__PKExtensionHostContext_authorizationDidSelectShippingMethod___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidSelectShippingMethod:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectShippingAddress:(id)a3
{
  id v4;
  NSObject *delayCallbacksGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PKExtensionHostContext_authorizationDidSelectShippingAddress___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v7);

}

void __64__PKExtensionHostContext_authorizationDidSelectShippingAddress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidSelectShippingAddress:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidSelectPaymentMethod:(id)a3
{
  id v4;
  NSObject *delayCallbacksGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PKExtensionHostContext_authorizationDidSelectPaymentMethod___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v7);

}

void __62__PKExtensionHostContext_authorizationDidSelectPaymentMethod___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidSelectPaymentMethod:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidChangeCouponCode:(id)a3
{
  id v4;
  NSObject *delayCallbacksGroup;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delayCallbacksGroup = self->_delayCallbacksGroup;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PKExtensionHostContext_authorizationDidChangeCouponCode___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v7);

}

void __59__PKExtensionHostContext_authorizationDidChangeCouponCode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationDidChangeCouponCode:", *(_QWORD *)(a1 + 40));

}

- (void)authorizationDidPresent
{
  NSObject *delayCallbacksGroup;
  _QWORD block[5];

  delayCallbacksGroup = self->_delayCallbacksGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PKExtensionHostContext_authorizationDidPresent__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], block);
}

void __49__PKExtensionHostContext_authorizationDidPresent__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authorizationDidPresent");

  }
}

- (void)didEncounterAuthorizationEvent:(unint64_t)a3
{
  NSObject *delayCallbacksGroup;
  _QWORD v4[6];

  delayCallbacksGroup = self->_delayCallbacksGroup;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PKExtensionHostContext_didEncounterAuthorizationEvent___block_invoke;
  v4[3] = &unk_1E2AC4430;
  v4[4] = self;
  v4[5] = a3;
  dispatch_group_notify(delayCallbacksGroup, MEMORY[0x1E0C80D38], v4);
}

void __57__PKExtensionHostContext_didEncounterAuthorizationEvent___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didEncounterAuthorizationEvent:", *(_QWORD *)(a1 + 40));

  }
}

- (PKPaymentAuthorizationHostProtocol)delegate
{
  return (PKPaymentAuthorizationHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_group)delayCallbacksGroup
{
  return self->_delayCallbacksGroup;
}

- (void)setDelayCallbacksGroup:(id)a3
{
  objc_storeStrong((id *)&self->_delayCallbacksGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayCallbacksGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
