@implementation PKIssuerProvisioningExtensionConsumerCoordinator

+ (id)beginWithExtension:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  PKAsyncUnaryOperationComposer *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__14;
    v19[4] = __Block_byref_object_dispose__14;
    v8 = MEMORY[0x1E0C809B0];
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke;
    v16[3] = &unk_1E2AC5050;
    v18 = v19;
    v17 = v5;
    -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v16);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_2;
    v15[3] = &unk_1E2AC5118;
    v15[4] = v19;
    -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v15);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_3_15;
    v12[3] = &unk_1E2AC5140;
    v13 = v6;
    v14 = v19;
    -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v7, "evaluateWithInput:completion:", v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v19, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id, BOOL);
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = -[PKIssuerProvisioningExtensionConsumerCoordinator _initWithExtension:]([PKIssuerProvisioningExtensionConsumerCoordinator alloc], "_initWithExtension:", *(_QWORD *)(a1 + 32));
  else
    v10 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
  if (v9)

  v8[2](v8, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0);
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD handler[4];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD v34[3];
  char v35;
  _QWORD v36[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_3;
  v36[3] = &unk_1E2AC5078;
  v36[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "addCancelAction:", v36);
  v11 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v12 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  handler[0] = v10;
  handler[1] = 3221225472;
  handler[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_4;
  handler[3] = &unk_1E2AC50C8;
  v13 = v7;
  v29 = v13;
  v14 = *(_QWORD *)(a1 + 32);
  v32 = v34;
  v33 = v14;
  v15 = v9;
  v31 = v15;
  v16 = v8;
  v30 = v16;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume(v11);
  v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_12;
  v22[3] = &unk_1E2AC50F0;
  v18 = v11;
  v23 = v18;
  v19 = v13;
  v24 = v19;
  v27 = v34;
  v20 = v15;
  v26 = v20;
  v21 = v16;
  v25 = v21;
  objc_msgSend(v17, "_performWhenConnected:", v22);

  _Block_object_dispose(v34, 8);
}

uint64_t __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_4(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = (void *)a1[4];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_5;
  v5[3] = &unk_1E2AC50A0;
  v5[4] = a1[7];
  v5[5] = &v6;
  objc_msgSend(v2, "performAction:", v5);
  if (*((_BYTE *)v7 + 24))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionConsumerCoordinator: extension did not connect in time...timing out.", v4, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "invalidate");
    (*(void (**)(void))(a1[6] + 16))();
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_5(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_12(uint64_t a1)
{
  void *v2;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_2_13;
  v3[3] = &unk_1E2AC50A0;
  v3[4] = *(_QWORD *)(a1 + 64);
  v3[5] = &v4;
  objc_msgSend(v2, "performAction:", v3);
  if (*((_BYTE *)v5 + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  _Block_object_dispose(&v4, 8);
}

uint64_t __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_2_13(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __82__PKIssuerProvisioningExtensionConsumerCoordinator_beginWithExtension_completion___block_invoke_3_15(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v9 = a4;
  if ((objc_msgSend(v7, "isInvalidated") & 1) != 0)
    v8 = 0;
  else
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8, v9);

}

- (PKIssuerProvisioningExtensionConsumerCoordinator)init
{

  return 0;
}

- (id)_initWithExtension:(id)a3
{
  id v5;
  PKIssuerProvisioningExtensionConsumerCoordinator *v6;
  PKIssuerProvisioningExtensionConsumerCoordinator *v7;
  NSExtension *extension;
  uint64_t v9;
  id v10;
  NSCopying *requestIdentifier;
  _BOOL4 v12;
  NSCopying *v13;
  BOOL v14;
  void *v15;
  PKIssuerProvisioningExtensionConsumerCoordinator *v16;
  BOOL v17;
  NSCopying *v18;
  NSObject *v19;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v22.receiver = self;
    v22.super_class = (Class)PKIssuerProvisioningExtensionConsumerCoordinator;
    v6 = -[PKIssuerProvisioningExtensionConsumerCoordinator init](&v22, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v6->_extension, a3);
      extension = v7->_extension;
      v21 = 0;
      -[NSExtension beginExtensionRequestWithOptions:inputItems:error:](extension, "beginExtensionRequestWithOptions:inputItems:error:", 1, 0, &v21);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v21;
      requestIdentifier = v7->_requestIdentifier;
      v7->_requestIdentifier = (NSCopying *)v9;

      v12 = v10 != 0;
      v13 = v7->_requestIdentifier;
      if (v13)
        v14 = v10 == 0;
      else
        v14 = 0;
      if (v14)
      {
        -[NSExtension _extensionContextForUUID:](v7->_extension, "_extensionContextForUUID:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_storeStrong((id *)&v7->_context, v15);
          v12 = 0;
        }
        else
        {
          v12 = 1;
        }

        v13 = v7->_requestIdentifier;
      }
      if (v13)
        v17 = !v12;
      else
        v17 = 1;
      if (!v17)
      {
        -[NSExtension cancelExtensionRequestWithIdentifier:](v7->_extension, "cancelExtensionRequestWithIdentifier:");
        v18 = v7->_requestIdentifier;
        v7->_requestIdentifier = 0;

        v13 = v7->_requestIdentifier;
      }
      if (!v13)
      {
        v7->_invalidated = 1;
        PKLogFacilityTypeGetObject(6uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v10;
          _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionConsumerCoordinator: failed to begin extension request with error %@.", buf, 0xCu);
        }

      }
    }
    self = v7;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[PKIssuerProvisioningExtensionConsumerCoordinator invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKIssuerProvisioningExtensionConsumerCoordinator;
  -[PKIssuerProvisioningExtensionConsumerCoordinator dealloc](&v3, sel_dealloc);
}

- (BOOL)isInvalidated
{
  PKIssuerProvisioningExtensionConsumerCoordinator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSCopying *requestIdentifier;
  PKIssuerProvisioningExtensionConsumerContext *context;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_requestIdentifier)
    {
      -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
      requestIdentifier = self->_requestIdentifier;
      self->_requestIdentifier = 0;

    }
    context = self->_context;
    self->_context = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_performWhenConnected:(id)a3
{
  void (**v4)(void);
  os_unfair_lock_s *p_lock;
  PKIssuerProvisioningExtensionConsumerContext *v6;
  void (**v7)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = self->_context;
    os_unfair_lock_unlock(p_lock);
    if (v6)
      -[PKIssuerProvisioningExtensionConsumerContext performWhenConnected:](v6, "performWhenConnected:", v7);
    else
      v7[2]();

    v4 = v7;
  }

}

- (void)statusWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  PKIssuerProvisioningExtensionConsumerContext *v6;
  void (**v7)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = self->_context;
    os_unfair_lock_unlock(p_lock);
    if (v6)
      -[PKIssuerProvisioningExtensionConsumerContext statusWithCompletion:](v6, "statusWithCompletion:", v7);
    else
      v7[2](v7, 0);

    v4 = v7;
  }

}

- (void)passEntriesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  PKIssuerProvisioningExtensionConsumerContext *v6;
  void (**v7)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = self->_context;
    os_unfair_lock_unlock(p_lock);
    if (v6)
      -[PKIssuerProvisioningExtensionConsumerContext passEntriesWithCompletion:](v6, "passEntriesWithCompletion:", v7);
    else
      v7[2](v7, 0);

    v4 = v7;
  }

}

- (void)remotePassEntriesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  PKIssuerProvisioningExtensionConsumerContext *v6;
  void (**v7)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = self->_context;
    os_unfair_lock_unlock(p_lock);
    if (v6)
      -[PKIssuerProvisioningExtensionConsumerContext remotePassEntriesWithCompletion:](v6, "remotePassEntriesWithCompletion:", v7);
    else
      v7[2](v7, 0);

    v4 = v7;
  }

}

- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PKIssuerProvisioningExtensionConsumerContext *v20;
  NSExtension *v21;
  NSExtension *v22;
  _QWORD v23[4];
  NSExtension *v24;
  id v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v19)
  {
    os_unfair_lock_lock(&self->_lock);
    v20 = self->_context;
    os_unfair_lock_unlock(&self->_lock);
    if (v20)
    {
      v21 = self->_extension;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __157__PKIssuerProvisioningExtensionConsumerCoordinator_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke;
      v23[3] = &unk_1E2AC5168;
      v24 = v21;
      v25 = v19;
      v22 = v21;
      -[PKIssuerProvisioningExtensionConsumerContext generateRequestWithEntryIdentifier:configuration:certificateChain:nonce:nonceSignature:completionHandler:](v20, "generateRequestWithEntryIdentifier:configuration:certificateChain:nonce:nonceSignature:completionHandler:", v14, v15, v16, v17, v18, v23);

    }
    else
    {
      (*((void (**)(id, _QWORD))v19 + 2))(v19, 0);
    }

  }
}

void __157__PKIssuerProvisioningExtensionConsumerCoordinator_generateRequestWithEntryIdentifier_configuration_certificateChain_nonce_nonceSignature_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleInfoDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
  }
  objc_msgSend(v4, "setHostApplicationIdentifier:", v6);
  objc_msgSend(v4, "setHostApplicationVersion:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSExtension)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
