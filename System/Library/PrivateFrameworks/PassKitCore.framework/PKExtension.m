@implementation PKExtension

- (PKExtension)initWithIdentifier:(id)a3 extension:(id)a4 provider:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKExtension *v11;
  uint64_t v12;
  NSString *identifier;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *containingAppBundleIdentifier;
  uint64_t v20;
  NSString *containingApplicationIdentifier;
  dispatch_queue_t v22;
  void *v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKExtension;
  v11 = -[PKExtension init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeWeak((id *)&v11->_provider, v10);
    objc_storeStrong((id *)&v11->_extension, a4);
    -[PKExtension extension](v11, "extension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_plugIn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containingUrl");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithURL:allowPlaceholder:error:", v16, 1, 0);
      objc_msgSend(v17, "bundleIdentifier");
      v18 = objc_claimAutoreleasedReturnValue();
      containingAppBundleIdentifier = v11->_containingAppBundleIdentifier;
      v11->_containingAppBundleIdentifier = (NSString *)v18;

      objc_msgSend(v17, "applicationIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();
      containingApplicationIdentifier = v11->_containingApplicationIdentifier;
      v11->_containingApplicationIdentifier = (NSString *)v20;

    }
    v22 = dispatch_queue_create("com.apple.passkit.extension.timeout", 0);
    v23 = (void *)_serialQueue;
    _serialQueue = (uint64_t)v22;

  }
  return v11;
}

- (int64_t)type
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  char v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  int64_t v10;

  -[PKExtension extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("com.apple.PassKit.in-app-payment-ui");
  if (v2 == v3)
  {

LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v4 = v3;
  if (v2 && v3)
  {
    v5 = -[__CFString isEqualToString:](v2, "isEqualToString:", v3);

    if ((v5 & 1) != 0)
      goto LABEL_16;
  }
  else
  {

  }
  v6 = v2;
  v7 = CFSTR("com.apple.PassKit.payment-information-event");
  if (v6 == v7)
  {

    goto LABEL_14;
  }
  v8 = v7;
  if (!v2 || !v7)
  {

    goto LABEL_16;
  }
  v9 = -[__CFString isEqualToString:](v6, "isEqualToString:", v7);

  if (!v9)
    goto LABEL_16;
LABEL_14:
  v10 = 1;
LABEL_17:

  return v10;
}

- (NSString)extensionPointIdentifier
{
  void *v2;
  void *v3;

  -[PKExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)performTestExtensionServiceRequestWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "performing test request", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PKExtension_performTestExtensionServiceRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E2ACB358;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKExtension beginExtensionRequestWithCompletion:](self, "beginExtensionRequestWithCompletion:", v7);

}

void __64__PKExtension_performTestExtensionServiceRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  PKBarcodeEventMetadataRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(v3, "extensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved an extension context", buf, 2u);
    }

    v6 = -[PKBarcodeEventMetadataRequest initWithBarcodeIdentifier:deviceAccountIdentifier:]([PKBarcodeEventMetadataRequest alloc], "initWithBarcodeIdentifier:deviceAccountIdentifier:", CFSTR("test"), CFSTR("testBundle"));
    v7 = (void *)MEMORY[0x1E0C9E3A8];
    objc_msgSend(*(id *)(a1 + 32), "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_extensionBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "newAssertionForBundleIdentifier:withReason:", v10, CFSTR("payment metadata"));

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__PKExtension_performTestExtensionServiceRequestWithCompletion___block_invoke_85;
    v15[3] = &unk_1E2ACB330;
    v16 = v11;
    v17 = v3;
    v18 = *(id *)(a1 + 40);
    v12 = v11;
    objc_msgSend(v4, "handleInformationRequest:completion:", v6, v15);

  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Failed to retrieve extension context", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
  }

}

void __64__PKExtension_performTestExtensionServiceRequestWithCompletion___block_invoke_85(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  objc_msgSend(v4, "paymentInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "response is %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v5);

}

- (void)beginLocalExtensionServiceWithUserInteraction:(BOOL)a3 completion:(id)a4 timeout:(unint64_t)a5 timeoutHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  dispatch_source_t v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD handler[5];
  id v25;
  uint8_t buf[16];

  v8 = a3;
  v10 = a4;
  v11 = a6;
  PKLogFacilityTypeGetObject(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Beginning extension request", buf, 2u);
  }

  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)_serialQueue);
  v14 = (void *)_timer;
  _timer = (uint64_t)v13;

  v15 = _timer;
  v16 = dispatch_time(0, 1000000000 * a5);
  dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v17 = MEMORY[0x1E0C809B0];
  v18 = _timer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke;
  handler[3] = &unk_1E2ABE058;
  handler[4] = self;
  v19 = v11;
  v25 = v19;
  dispatch_source_set_event_handler(v18, handler);
  _extensionRunning = 1;
  dispatch_resume((dispatch_object_t)_timer);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "starting request", buf, 2u);
  }

  -[PKExtension extension](self, "extension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_89;
  v22[3] = &unk_1E2ACB380;
  v22[4] = self;
  v23 = v10;
  v21 = v10;
  objc_msgSend(v20, "beginExtensionRequestWithOptions:inputItems:completion:", v8, 0, v22);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Successfully started request", buf, 2u);
  }

}

void __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[16];

  dispatch_source_cancel((dispatch_source_t)_timer);
  if (_extensionRunning)
  {
    _extensionRunning = 0;
    PKLogFacilityTypeGetObject(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Local extension request timed out", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "extension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    objc_msgSend(*(id *)(a1 + 32), "extension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_kill:", 9);

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

void __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error beginning extension request: %@", buf, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    v9 = _serialQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_90;
    v11[3] = &unk_1E2AC4A20;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v5;
    v10 = *(id *)(a1 + 40);
    v13 = 0;
    v14 = v10;
    dispatch_async(v9, v11);

  }
}

void __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_90(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint8_t buf[16];

  if (_extensionRunning)
  {
    PKLogFacilityTypeGetObject(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "extension is running", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "extension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_extensionContextForUUID:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 56);
    if (v5)
    {
      dispatch_get_global_queue(0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_91;
      block[3] = &unk_1E2ABDA68;
      v10 = v5;
      v8 = v4;
      v9 = *(id *)(a1 + 48);
      dispatch_async(v6, block);

    }
  }
}

uint64_t __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_91(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)completeLocalExtensionServiceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = _serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PKExtension_completeLocalExtensionServiceWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __59__PKExtension_completeLocalExtensionServiceWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (_extensionRunning)
  {
    _extensionRunning = 0;
    dispatch_source_cancel((dispatch_source_t)_timer);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)beginExtensionRequestWithCompletion:(id)a3
{
  -[PKExtension beginExtensionRequestWithOptions:completion:](self, "beginExtensionRequestWithOptions:completion:", 0, a3);
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  void (**v11)(id, _QWORD);
  PKExtensionRequestHandler *v12;
  id v13;
  unsigned __int8 *v14;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  PKExtension *v22;
  NSObject *v23;
  id v24;
  uint8_t *v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  char v29;
  uint8_t v30[4];
  PKExtension *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    if (!self->_extension)
    {
      PKLogFacilityTypeGetObject(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKExtension can't begin extension request due to nil NSExtension", buf, 2u);
      }

      v6[2](v6, 0);
    }
    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x2020000000;
    v29 = 0;
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)_serialQueue);
    v9 = dispatch_time(0, 3000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __59__PKExtension_beginExtensionRequestWithOptions_completion___block_invoke;
    v21 = &unk_1E2ACB3A8;
    v22 = self;
    v10 = v8;
    v23 = v10;
    v25 = buf;
    v11 = v6;
    v24 = v11;
    dispatch_source_set_event_handler(v10, &v18);
    dispatch_resume(v10);
    v12 = [PKExtensionRequestHandler alloc];
    v13 = -[PKExtensionRequestHandler _initWithExtension:extensionRequestOptions:](v12, "_initWithExtension:extensionRequestOptions:", self->_extension, a3, v18, v19, v20, v21, v22);
    dispatch_source_cancel(v10);
    v14 = v27 + 24;
    do
    {
      if (__ldaxr(v14))
      {
        __clrex();
        objc_msgSend(v13, "invalidate");
        goto LABEL_18;
      }
    }
    while (__stlxr(1u, v14));
    if (v13 && !objc_msgSend(v13, "isInvalidated"))
    {
      PKLogFacilityTypeGetObject(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v30 = 138412290;
        v31 = self;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "%@ successfully began extension request", v30, 0xCu);
      }

      ((void (**)(id, id))v11)[2](v11, v13);
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v30 = 138412290;
        v31 = self;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%@ failed to begin extension request", v30, 0xCu);
      }

      v11[2](v11, 0);
    }
LABEL_18:

    _Block_object_dispose(buf, 8);
  }

}

void __59__PKExtension_beginExtensionRequestWithOptions_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  unsigned __int8 *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "%@ begin extension request timed out", (uint8_t *)&v6, 0xCu);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  while (!__ldaxr(v4))
  {
    if (!__stlxr(1u, v4))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      return;
    }
  }
  __clrex();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("identifier: %@"), self->_identifier);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)containingAppBundleIdentifier
{
  return self->_containingAppBundleIdentifier;
}

- (void)setContainingAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containingAppBundleIdentifier, a3);
}

- (NSString)containingApplicationIdentifier
{
  return self->_containingApplicationIdentifier;
}

- (void)setContainingApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containingApplicationIdentifier, a3);
}

- (PKExtensionProvider)provider
{
  return (PKExtensionProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_containingApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_containingAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
