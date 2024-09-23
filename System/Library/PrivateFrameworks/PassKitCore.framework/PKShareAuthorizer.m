@implementation PKShareAuthorizer

- (void)dealloc
{
  objc_super v3;

  -[PKShareAuthorizer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKShareAuthorizer;
  -[PKShareAuthorizer dealloc](&v3, sel_dealloc);
}

+ (id)authorizeForRequest:(id)a3 presentationSceneIdentifier:(id)a4 authHandler:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKShareAuthorizer *v13;
  PKShareAuthorizer *v14;
  PKShareAuthorizer *v15;
  PKShareAuthorizer *v16;
  _QWORD v18[4];
  PKShareAuthorizer *v19;
  id v20;

  v9 = a6;
  if (v9)
  {
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = objc_alloc_init(PKShareAuthorizer);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __92__PKShareAuthorizer_authorizeForRequest_presentationSceneIdentifier_authHandler_completion___block_invoke;
    v18[3] = &unk_1E2ABDDB0;
    v20 = v9;
    v14 = v13;
    v19 = v14;
    -[PKShareAuthorizer _authorizeForRequest:presentationSceneIdentifier:authHandler:completion:](v14, "_authorizeForRequest:presentationSceneIdentifier:authHandler:completion:", v12, v11, v10, v18);

    v15 = v19;
    v16 = v14;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __92__PKShareAuthorizer_authorizeForRequest_presentationSceneIdentifier_authHandler_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_authorizeForRequest:(id)a3 presentationSceneIdentifier:(id)a4 authHandler:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id authorizeHandler;
  void *v16;
  id completion;
  LAContext *v18;
  LAContext *context;
  void *v20;
  PKPaymentAuthorizationCoordinator *v21;
  PKPaymentAuthorizationCoordinator *authorizationCoordinator;
  PKPaymentAuthorizationCoordinator *v23;
  PKPaymentAuthorizationCoordinator *v24;
  _QWORD v25[5];

  v11 = a4;
  v12 = a6;
  v13 = a3;
  v14 = _Block_copy(a5);
  authorizeHandler = self->_authorizeHandler;
  self->_authorizeHandler = v14;

  v16 = _Block_copy(v12);
  completion = self->_completion;
  self->_completion = v16;

  objc_storeStrong((id *)&self->_presentationSceneIdentifier, a4);
  v18 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
  context = self->_context;
  self->_context = v18;

  -[LAContext externalizedContext](self->_context, "externalizedContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExternalizedContext:", v20);

  v21 = -[PKPaymentAuthorizationCoordinator initWithPaymentRequest:]([PKPaymentAuthorizationCoordinator alloc], "initWithPaymentRequest:", v13);
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = v21;

  v23 = self->_authorizationCoordinator;
  if (v23)
  {
    -[PKPaymentAuthorizationCoordinator setDelegate:](v23, "setDelegate:", self);
    -[PKPaymentAuthorizationCoordinator _setPrivateDelegate:](self->_authorizationCoordinator, "_setPrivateDelegate:", self);
    v24 = self->_authorizationCoordinator;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __93__PKShareAuthorizer__authorizeForRequest_presentationSceneIdentifier_authHandler_completion___block_invoke;
    v25[3] = &unk_1E2AC35F8;
    v25[4] = self;
    -[PKPaymentAuthorizationCoordinator presentWithCompletion:](v24, "presentWithCompletion:", v25);
  }
  else
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

void __93__PKShareAuthorizer__authorizeForRequest_presentationSceneIdentifier_authHandler_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((a2 & 1) == 0)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = 0;

    }
  }
}

- (void)invalidate
{
  PKPaymentAuthorizationCoordinator *authorizationCoordinator;

  -[PKPaymentAuthorizationCoordinator dismissWithCompletion:](self->_authorizationCoordinator, "dismissWithCompletion:", 0);
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = 0;

  -[LAContext invalidate](self->_context, "invalidate");
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(0x20uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_resultSuccess)
      v6 = CFSTR("Yes");
    else
      v6 = CFSTR("No");
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Authorization did finish with success: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "dismissWithCompletion:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKShareAuthorizer_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __62__PKShareAuthorizer_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFinishIfNeeded");
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void (**authorizeHandler)(id, void *, _QWORD *);
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x20uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Got authorization starting to share.", buf, 2u);
  }

  v9 = MEMORY[0x1E0C809B0];
  self->_isAuthorizationHandlerRunning = 1;
  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke;
  aBlock[3] = &unk_1E2ABDCE8;
  aBlock[4] = self;
  v10 = v7;
  v17 = v10;
  v11 = _Block_copy(aBlock);
  if (self->_authorizeHandler)
  {
    -[LAContext externalizedContext](self->_context, "externalizedContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      authorizeHandler = (void (**)(id, void *, _QWORD *))self->_authorizeHandler;
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_16;
      v14[3] = &unk_1E2ABDCE8;
      v14[4] = self;
      v15 = v11;
      authorizeHandler[2](authorizeHandler, v12, v14);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Error! Unable to get externalized auth", buf, 2u);
      }

      (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Error! No authorizeHandler completion provided!", buf, 2u);
    }

    (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);
  }

}

void __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke(uint64_t a1, int a2)
{
  char v2;
  PKPaymentAuthorizationResult *v4;

  v2 = a2;
  v4 = -[PKPaymentAuthorizationResult initWithStatus:errors:]([PKPaymentAuthorizationResult alloc], "initWithStatus:errors:", a2 ^ 1u, 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_handleDidFinishIfNeeded");

}

void __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_16(uint64_t a1, char a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  char v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_2;
  block[3] = &unk_1E2ABE0A8;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__PKShareAuthorizer_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  return self->_presentationSceneIdentifier;
}

- (void)_handleDidFinishIfNeeded
{
  void (**completion)(id, BOOL);
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  completion = (void (**)(id, BOOL))self->_completion;
  if (completion && self->_didFinish)
  {
    if (self->_isAuthorizationHandlerRunning)
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: deferring didFinish while authorization handler runs", v6, 2u);
      }

    }
    else
    {
      completion[2](completion, self->_resultSuccess);
      v5 = self->_completion;
      self->_completion = 0;

    }
  }
}

+ (void)authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CC12A0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(a1, "_authorizeDeviceOwnerWithAuthHandler:completion:context:invalidateContext:", v8, v7, v9, 1);

}

+ (void)_authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4 context:(id)a5 invalidateContext:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  BOOL v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29[0] = &unk_1E2C3F4C0;
  PKLocalizedShareableCredentialString(CFSTR("LOCAL_AUTHENTICATION_REASON"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v29[1] = &unk_1E2C3F4D8;
  PKLocalizedString(CFSTR("WALLET"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = &unk_1E2C3F4F0;
  v30[1] = v13;
  v30[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke;
  aBlock[3] = &unk_1E2ABDDB0;
  v28 = v10;
  v16 = v11;
  v27 = v16;
  v17 = v10;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_25;
  v21[3] = &unk_1E2AD85D8;
  v22 = v16;
  v23 = _Block_copy(aBlock);
  v25 = a6;
  v24 = v9;
  v18 = v9;
  v19 = v23;
  v20 = v16;
  objc_msgSend(v20, "evaluatePolicy:options:reply:", 2, v14, v21);

}

uint64_t __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x20uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("No");
    if (a2)
      v5 = CFSTR("Yes");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Authorization did finish with success: %@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  char v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (v5 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "externalizedContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  PKLogFacilityTypeGetObject(0x20uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("Y");
    if (!v8)
      v10 = CFSTR("N");
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKShareAuthorizer: Obtained externalized auth: %@", buf, 0xCu);
  }

  if (v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_2;
    aBlock[3] = &unk_1E2AD8588;
    v23 = *(_BYTE *)(a1 + 56);
    v12 = &v21;
    v21 = *(id *)(a1 + 32);
    v22 = *(id *)(a1 + 40);
    v13 = _Block_copy(aBlock);
    v14 = v13;
    v15 = *(void **)(a1 + 48);
    if (v15)
    {
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_4;
      block[3] = &unk_1E2AD85B0;
      v18 = v15;
      v17 = v8;
      v19 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(void *, uint64_t))v13 + 2))(v13, 1);
    }

  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_30;
    v24[3] = &unk_1E2ABD9A0;
    v12 = &v25;
    v25 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v24);
  }

}

uint64_t __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;
  char v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_3;
  block[3] = &unk_1E2AD8560;
  v7 = *(_BYTE *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v8 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __95__PKShareAuthorizer__authorizeDeviceOwnerWithAuthHandler_completion_context_invalidateContext___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, 0);
  objc_storeStrong(&self->_authorizeHandler, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
}

@end
