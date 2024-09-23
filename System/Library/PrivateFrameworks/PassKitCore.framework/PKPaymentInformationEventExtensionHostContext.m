@implementation PKPaymentInformationEventExtensionHostContext

- (void)handleInformationRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD handler[4];
  id v22;
  _QWORD aBlock[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PKPaymentInformationEventExtensionHostContext replyQueue](self, "replyQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);

    v10 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__32;
    v26[4] = __Block_byref_object_dispose__32;
    v27 = _Block_copy(v7);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke;
    aBlock[3] = &unk_1E2ACDB50;
    v12 = v9;
    v24 = v12;
    v25 = v26;
    handler[0] = v11;
    handler[1] = 3221225472;
    handler[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_2;
    handler[3] = &unk_1E2ABD9A0;
    v13 = _Block_copy(aBlock);
    v22 = v13;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(v12);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_3;
    v19[3] = &unk_1E2ABEB88;
    v19[4] = self;
    v14 = v13;
    v20 = v14;
    -[PKPaymentInformationEventExtensionHostContext vendorContextWithErrorHandler:](self, "vendorContextWithErrorHandler:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_5;
    v17[3] = &unk_1E2ACDB78;
    v17[4] = self;
    v16 = v14;
    v18 = v16;
    objc_msgSend(v15, "handleInformationRequest:completion:", v6, v17);

    _Block_object_dispose(v26, 8);
  }

}

void __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v8 = v3;
  if (v4)
  {
    dispatch_source_cancel(v4);
    v3 = v8;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    v3 = v8;
  }

}

uint64_t __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_4;
  block[3] = &unk_1E2ABD9A0;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_6;
  v7[3] = &unk_1E2ABDA18;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __85__PKPaymentInformationEventExtensionHostContext_handleInformationRequest_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)handleSignatureRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD handler[4];
  id v22;
  _QWORD aBlock[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PKPaymentInformationEventExtensionHostContext replyQueue](self, "replyQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);

    v10 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__32;
    v26[4] = __Block_byref_object_dispose__32;
    v27 = _Block_copy(v7);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke;
    aBlock[3] = &unk_1E2ACDBA0;
    v12 = v9;
    v24 = v12;
    v25 = v26;
    handler[0] = v11;
    handler[1] = 3221225472;
    handler[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_2;
    handler[3] = &unk_1E2ABD9A0;
    v13 = _Block_copy(aBlock);
    v22 = v13;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(v12);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_3;
    v19[3] = &unk_1E2ABEB88;
    v19[4] = self;
    v14 = v13;
    v20 = v14;
    -[PKPaymentInformationEventExtensionHostContext vendorContextWithErrorHandler:](self, "vendorContextWithErrorHandler:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_5;
    v17[3] = &unk_1E2ACDBC8;
    v17[4] = self;
    v16 = v14;
    v18 = v16;
    objc_msgSend(v15, "handleSignatureRequest:completion:", v6, v17);

    _Block_object_dispose(v26, 8);
  }

}

void __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v8 = v3;
  if (v4)
  {
    dispatch_source_cancel(v4);
    v3 = v8;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    v3 = v8;
  }

}

uint64_t __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_4;
  block[3] = &unk_1E2ABD9A0;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_6;
  v7[3] = &unk_1E2ABDA18;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __83__PKPaymentInformationEventExtensionHostContext_handleSignatureRequest_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)handleConfigurationRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD handler[4];
  id v22;
  _QWORD aBlock[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;

  v6 = a3;
  v7 = a4;
  -[PKPaymentInformationEventExtensionHostContext replyQueue](self, "replyQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);

  v10 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__32;
  v26[4] = __Block_byref_object_dispose__32;
  v27 = _Block_copy(v7);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1FC0;
  v12 = v9;
  v24 = v12;
  v25 = v26;
  handler[0] = v11;
  handler[1] = 3221225472;
  handler[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_2;
  handler[3] = &unk_1E2ABD9A0;
  v13 = _Block_copy(aBlock);
  v22 = v13;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume(v12);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_3;
  v19[3] = &unk_1E2ABEB88;
  v19[4] = self;
  v14 = v13;
  v20 = v14;
  -[PKPaymentInformationEventExtensionHostContext vendorContextWithErrorHandler:](self, "vendorContextWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_5;
  v17[3] = &unk_1E2ABE058;
  v17[4] = self;
  v16 = v14;
  v18 = v16;
  objc_msgSend(v15, "handleConfigurationRequest:completion:", v6, v17);

  _Block_object_dispose(v26, 8);
}

void __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_source_cancel(v2);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
}

uint64_t __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_4;
  block[3] = &unk_1E2ABD9A0;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_6;
  block[3] = &unk_1E2ABD9A0;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __87__PKPaymentInformationEventExtensionHostContext_handleConfigurationRequest_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)replyQueue
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  queue = self->_queue;
  if (!queue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("PKPaymentInformationEventExtensionHostContext.replyQueue", 0);
    v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }
  return queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
