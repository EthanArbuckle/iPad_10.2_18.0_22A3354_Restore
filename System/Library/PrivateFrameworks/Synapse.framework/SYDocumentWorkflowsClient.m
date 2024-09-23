@implementation SYDocumentWorkflowsClient

- (SYDocumentWorkflowsClient)init
{
  SYDocumentWorkflowsClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *processingQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SYDocumentWorkflowsClient;
  v2 = -[SYDocumentWorkflowsClient init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.DocumentWorkflowsClient", v3);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

+ (BOOL)_verifyFeatureFlagWithError:(id *)a3
{
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = SYIsReturnToSenderEnabled();
  v5 = v4;
  if (a3 && (v4 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("Feature is not available.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -127, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_createUnableToPerformRequestErrorWithCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  _SYBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Unable to perform request."), CFSTR("Unable to perform request."), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_INFO, "Document Workflows client deallocated.", buf, 2u);
  }

  -[SYDocumentWorkflowsClient _invalidateConnection](self, "_invalidateConnection");
  v4.receiver = self;
  v4.super_class = (Class)SYDocumentWorkflowsClient;
  -[SYDocumentWorkflowsClient dealloc](&v4, sel_dealloc);
}

- (void)fetchUserActivityForDocumentIndexKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  char v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke;
  v17[3] = &unk_1E757BDA8;
  v9 = v7;
  v18 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v17);
  v16 = 0;
  v11 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v16);
  v12 = v16;
  if ((v11 & 1) != 0)
  {
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke_2;
    v13[3] = &unk_1E757BDF8;
    v15 = v10;
    v14 = v6;
    -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v13);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v12);
  }

}

uint64_t __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke_3;
    v4[3] = &unk_1E757BDD0;
    v3 = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(a2, "fetchUserActivityForDocumentIndexKey:completion:", v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "userActivity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)saveUserActivity:(id)a3 forDocumentIndexKey:(id)a4 sourceBundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  char v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  id v24;
  _QWORD v25[4];
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke;
  v25[3] = &unk_1E757B5D0;
  v15 = v13;
  v26 = v15;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v25);
  v24 = 0;
  v17 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v24);
  v18 = v24;
  if ((v17 & 1) != 0)
  {
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke_2;
    v19[3] = &unk_1E757BE20;
    v23 = v16;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v19);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v16)[2](v16, 0, v18);
  }

}

uint64_t __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SYUserActivityWrapper *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = -[SYUserActivityWrapper initWithUserActivity:]([SYUserActivityWrapper alloc], "initWithUserActivity:", *(_QWORD *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke_3;
    v7[3] = &unk_1E757B5D0;
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v3, "saveUserActivity:forDocumentIndexKey:sourceBundleIdentifier:completion:", v4, v5, v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke;
  v24[3] = &unk_1E757BE48;
  v9 = v7;
  v25 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v24);
  if (!objc_msgSend(v6, "count"))
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SYDocumentWorkflowsClient fetchAttributesForDocumentsWithIndexKeys:completion:].cold.1();

    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v16 = CFSTR("indexKeys can't be nil or empty");
LABEL_13:
    objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  if (!v9)
  {
    v17 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SYDocumentWorkflowsClient fetchAttributesForDocumentsWithIndexKeys:completion:].cold.2();

    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v16 = CFSTR("completion can't be nil");
    goto LABEL_13;
  }
  v23 = 0;
  v11 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v23);
  v12 = v23;
  if ((v11 & 1) != 0)
  {
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_22;
    v19[3] = &unk_1E757BE70;
    v21 = v10;
    v20 = v6;
    v22 = v9;
    -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v19);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, MEMORY[0x1E0C9AA60], v12);
  }

}

uint64_t __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_2;
    v4[3] = &unk_1E757BE48;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(a2, "fetchAttributesForDocumentsWithIndexKeys:completion:", v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)canPerformRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v5 = a3;
  v6 = a4;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __58__SYDocumentWorkflowsClient_canPerformRequest_completion___block_invoke;
  v31[3] = &unk_1E757B5D0;
  v7 = v6;
  v32 = v7;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v31);
  v30 = 0;
  v9 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v30);
  v10 = v30;
  if ((v9 & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v28 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SYDocumentWorkflowsClient canPerformRequest:completion:].cold.3();

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unsupported request type"), 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v29);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v5, "verifyParameters") & 1) == 0)
    {
      v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SYDocumentWorkflowsClient canPerformRequest:completion:].cold.2((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);

      objc_msgSend((id)objc_opt_class(), "_createUnableToPerformRequestErrorWithCode:", -129);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v27);

    }
    else
    {
      objc_msgSend(v5, "documentIndexKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v8[2](v8, 1, 0);
      }
      else
      {
        v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[SYDocumentWorkflowsClient canPerformRequest:completion:].cold.1((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);

        objc_msgSend((id)objc_opt_class(), "_createUnableToPerformRequestErrorWithCode:", -129);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v19);

      }
    }
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v10);
  }

}

uint64_t __58__SYDocumentWorkflowsClient_canPerformRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)canPerformRequest:(id)a3 withError:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__SYDocumentWorkflowsClient_canPerformRequest_withError___block_invoke;
  v12[3] = &unk_1E757B5A8;
  v14 = &v22;
  v15 = &v16;
  v8 = v7;
  v13 = v8;
  -[SYDocumentWorkflowsClient canPerformRequest:completion:](self, "canPerformRequest:completion:", v6, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v9 = (void *)v17[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __57__SYDocumentWorkflowsClient_canPerformRequest_withError___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)performRequest:(id)a3 withErrorHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__SYDocumentWorkflowsClient_performRequest_withErrorHandler_completion___block_invoke;
  v12[3] = &unk_1E757BE98;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[SYDocumentWorkflowsClient performRequest:completion:](self, "performRequest:completion:", a3, v12);

}

void __72__SYDocumentWorkflowsClient_performRequest_withErrorHandler_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
      v5 = v8;
    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    v5 = v8;
  }

}

- (void)performRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SYDocumentWorkflowsClient_performRequest_withCompletion___block_invoke;
  v8[3] = &unk_1E757B5D0;
  v9 = v6;
  v7 = v6;
  -[SYDocumentWorkflowsClient performRequest:completion:](self, "performRequest:completion:", a3, v8);

}

uint64_t __59__SYDocumentWorkflowsClient_performRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SYDocumentWorkflowsClient *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke;
  v16[3] = &unk_1E757B5D0;
  v17 = v7;
  v9 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2;
  v12[3] = &unk_1E757BEE8;
  v14 = self;
  v15 = (id)MEMORY[0x1BCCFF08C](v16);
  v13 = v6;
  v10 = v15;
  v11 = v6;
  -[SYDocumentWorkflowsClient canPerformRequest:completion:](self, "canPerformRequest:completion:", v11, v12);

}

uint64_t __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_29;
    v8[3] = &unk_1E757BDF8;
    v6 = *(void **)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "_dispatchRequestWithCompletion:", v8);

  }
  else
  {
    v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_29(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_30;
    v5[3] = &unk_1E757BEC0;
    v6 = v4;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performWithServiceProxy:completion:", a2, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_30_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)hasOriginalDocumentForFileAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  char v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke;
  v22[3] = &unk_1E757BF10;
  v9 = v7;
  v24 = v9;
  v10 = v6;
  v23 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v22);
  v21 = 0;
  v12 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v21);
  v13 = v21;
  if ((v12 & 1) != 0)
  {
    v20 = 0;
    +[SYDocumentAttributes documentAttributesForFileAtURL:error:](SYDocumentAttributes, "documentAttributesForFileAtURL:error:", v10, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    if (v14)
    {
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke_33;
      v16[3] = &unk_1E757BF38;
      v19 = v11;
      v17 = v10;
      v18 = v14;
      -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v16);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v15);
    }

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v13);
  }

}

void __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = a3;
    v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "originalFileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "Original document of: %@, is: %@", (uint8_t *)&v11, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_INFO, "Asking for original document of: %@", buf, 0xCu);

    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke_34;
    v8[3] = &unk_1E757B7B0;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v3, "hasOriginalDocumentForFileAtURL:withAttributes:completion:", v6, v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hasOriginalDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__SYDocumentWorkflowsClient_hasOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke;
  v16[3] = &unk_1E757B7B0;
  v17 = v6;
  v8 = v6;
  v9 = a3;
  v10 = (void *)MEMORY[0x1BCCFF08C](v16);
  objc_msgSend(v9, "indexKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __89__SYDocumentWorkflowsClient_hasOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke_2;
  v14[3] = &unk_1E757BE48;
  v15 = v10;
  v13 = v10;
  -[SYDocumentWorkflowsClient fetchAttributesForDocumentsWithIndexKeys:completion:](self, "fetchAttributesForDocumentsWithIndexKeys:completion:", v12, v14);

}

uint64_t __89__SYDocumentWorkflowsClient_hasOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __89__SYDocumentWorkflowsClient_hasOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)openOriginalDocumentForFileAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__SYDocumentWorkflowsClient_openOriginalDocumentForFileAtURL_completion___block_invoke;
  v19[3] = &unk_1E757BF60;
  v9 = v7;
  v21 = v9;
  v10 = v6;
  v20 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v19);
  v18 = 0;
  +[SYDocumentAttributes documentAttributesForFileAtURL:error:](SYDocumentAttributes, "documentAttributesForFileAtURL:error:", v10, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v12)
  {
    v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_1BCC38000, v14, OS_LOG_TYPE_INFO, "Opening original document of: %@", buf, 0xCu);

    }
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __73__SYDocumentWorkflowsClient_openOriginalDocumentForFileAtURL_completion___block_invoke_36;
    v16[3] = &unk_1E757B5D0;
    v17 = v11;
    -[SYDocumentWorkflowsClient openOriginalDocumentForFileWithDocumentAttributes:completion:](self, "openOriginalDocumentForFileWithDocumentAttributes:completion:", v12, v16);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v13);
  }

}

void __73__SYDocumentWorkflowsClient_openOriginalDocumentForFileAtURL_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v7;
      v10 = 1024;
      v11 = a2;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_INFO, "Original document for: %@, was opened successfully: %d, error: %@", (uint8_t *)&v8, 0x1Cu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __73__SYDocumentWorkflowsClient_openOriginalDocumentForFileAtURL_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openOriginalDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SYReturnToDocumentRequest *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SYReturnToDocumentRequest);
  -[SYReturnToDocumentRequest setDocumentAttributes:](v8, "setDocumentAttributes:", v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__SYDocumentWorkflowsClient_openOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke;
  v10[3] = &unk_1E757B5D0;
  v11 = v6;
  v9 = v6;
  -[SYDocumentWorkflowsClient performRequest:completion:](self, "performRequest:completion:", v8, v10);

}

uint64_t __90__SYDocumentWorkflowsClient_openOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hasLastModifiedDocumentForFileAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;
  char v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke;
  v22[3] = &unk_1E757BF88;
  v9 = v7;
  v24 = v9;
  v10 = v6;
  v23 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v22);
  v21 = 0;
  +[SYDocumentAttributes documentAttributesForFileAtURL:error:](SYDocumentAttributes, "documentAttributesForFileAtURL:error:", v10, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  if (v12)
  {
    v20 = 0;
    v14 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v20);
    v15 = v20;
    if ((v14 & 1) != 0)
    {
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke_39;
      v16[3] = &unk_1E757BF38;
      v19 = v11;
      v17 = v10;
      v18 = v12;
      -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v16);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v15);
    }

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v13);
  }

}

void __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = a3;
    v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138478083;
      v12 = v8;
      v13 = 2113;
      v14 = v10;
      _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "Last modified document of: %{private}@, is: %{private}@", (uint8_t *)&v11, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke_39(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1[4], "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v11 = v5;
      _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_INFO, "Asking for last modified document of: %{private}@", buf, 0xCu);

    }
    objc_msgSend(a1[5], "indexKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke_40;
    v7[3] = &unk_1E757BFB0;
    v8 = a1[4];
    v9 = a1[6];
    objc_msgSend(v3, "hasLastModifiedDocument:completion:", v6, v7);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void (*v13)(void);
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138477827;
      v15 = v12;
      _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "Last modified document is the requested fileURL: %{private}@", (uint8_t *)&v14, 0xCu);

    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v13();

}

- (void)hasLastModifiedDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  char v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke;
  v17[3] = &unk_1E757BFD8;
  v9 = v7;
  v18 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v17);
  v16 = 0;
  v11 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v16);
  v12 = v16;
  if ((v11 & 1) != 0)
  {
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_2;
    v13[3] = &unk_1E757BDF8;
    v15 = v10;
    v14 = v6;
    -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v13);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v12);
  }

}

uint64_t __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "indexKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_3;
    v5[3] = &unk_1E757BFD8;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "hasLastModifiedDocument:completion:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openLastModifiedDocumentForFileAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SYDocumentWorkflowsClient *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke;
  v17[3] = &unk_1E757BF60;
  v19 = v7;
  v9 = v6;
  v18 = v9;
  v10 = v7;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke_41;
  v13[3] = &unk_1E757C000;
  v15 = self;
  v16 = (id)MEMORY[0x1BCCFF08C](v17);
  v14 = v9;
  v11 = v9;
  v12 = v16;
  +[SYDocumentAttributes fetchDocumentAttributesForFileAtURL:completion:](SYDocumentAttributes, "fetchDocumentAttributesForFileAtURL:completion:", v11, v13);

}

void __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v7;
      v10 = 1024;
      v11 = a2;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_INFO, "Last modified document for: %@, was opened successfully: %d, error: %@", (uint8_t *)&v8, 0x1Cu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_INFO, "Opening last modified document of: %@", buf, 0xCu);

    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke_42;
    v7[3] = &unk_1E757B5D0;
    v6 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v6, "openLastModifiedDocumentForFileWithDocumentAttributes:completion:", v3, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openLastModifiedDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  char v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke;
  v17[3] = &unk_1E757B5D0;
  v9 = v7;
  v18 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v17);
  v16 = 0;
  v11 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v16);
  v12 = v16;
  if ((v11 & 1) != 0)
  {
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_2;
    v13[3] = &unk_1E757BDF8;
    v15 = v10;
    v14 = v6;
    -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v13);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v12);
  }

}

uint64_t __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "indexKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_3;
    v5[3] = &unk_1E757B5D0;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "openLastModifiedDocument:completion:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateLinkedDocumentsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  char v8;
  id v9;
  _QWORD v10[4];
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke;
  v13[3] = &unk_1E757B5D0;
  v6 = v4;
  v14 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v13);
  v12 = 0;
  v8 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v12);
  v9 = v12;
  if ((v8 & 1) != 0)
  {
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E757C028;
    v11 = v7;
    -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v10);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v9);
  }

}

uint64_t __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke_3;
    v3[3] = &unk_1E757B5D0;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(a2, "updateLinkedDocumentsWithCompletion:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unlinkDocumentsWithRelatedUniqueidentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  char v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke;
  v19[3] = &unk_1E757B5D0;
  v9 = v7;
  v20 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v19);
  v18 = 0;
  v11 = objc_msgSend((id)objc_opt_class(), "_verifyFeatureFlagWithError:", &v18);
  v12 = v18;
  if ((v11 & 1) != 0)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke_2;
      v15[3] = &unk_1E757BDF8;
      v17 = v10;
      v6 = v14;
      v16 = v6;
      -[SYDocumentWorkflowsClient _dispatchRequestWithCompletion:](self, "_dispatchRequestWithCompletion:", v15);

    }
    else
    {
      v10[2](v10, 1, 0);
    }
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v12);
  }

}

uint64_t __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke_3;
    v4[3] = &unk_1E757B5D0;
    v3 = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(a2, "unlinkDocumentsWithRelatedUniqueIdentifiers:completion:", v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_dispatchRequestWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SYDocumentWorkflowsClient processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E757B850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_createConnectionIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_2;
  v12 = &unk_1E757BB90;
  v3 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v3;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    (*(void (**)(_QWORD, void *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4, 0, v5);
  }
  else
  {
    v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "_createUnableToPerformRequestErrorWithCode:", -124, v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

void __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend((id)objc_opt_class(), "_createUnableToPerformRequestErrorWithCode:", -124);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

}

- (void)_createConnectionIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  _QWORD v38[2];
  _QWORD v39[3];
  _QWORD v40[6];

  v40[5] = *MEMORY[0x1E0C80C00];
  -[SYDocumentWorkflowsClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    +[SYDocumentWorkflowsService serviceName](SYDocumentWorkflowsService, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, 0);
    -[SYDocumentWorkflowsClient setConnection:](self, "setConnection:", v6);

    -[SYDocumentWorkflowsClient connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDocumentWorkflowsClient processingQueue](self, "processingQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setQueue:", v8);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF497620);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDocumentWorkflowsClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v9);

    -[SYDocumentWorkflowsClient connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v40[2] = objc_opt_class();
    v40[3] = objc_opt_class();
    v40[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_fetchAttributesForDocumentsWithIndexKeys_completion_, 0, 1);

    -[SYDocumentWorkflowsClient connection](self, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteObjectInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v39[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_hasLastModifiedDocument_completion_, 0, 1);

    -[SYDocumentWorkflowsClient connection](self, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "remoteObjectInterface");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_fetchUserActivityForDocumentIndexKey_completion_, 0, 1);

    objc_initWeak(&location, self);
    -[SYDocumentWorkflowsClient connection](self, "connection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __57__SYDocumentWorkflowsClient__createConnectionIfNecessary__block_invoke;
    v35[3] = &unk_1E757B438;
    objc_copyWeak(&v36, &location);
    objc_msgSend(v26, "setInvalidationHandler:", v35);

    -[SYDocumentWorkflowsClient connection](self, "connection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    v31 = 3221225472;
    v32 = __57__SYDocumentWorkflowsClient__createConnectionIfNecessary__block_invoke_122;
    v33 = &unk_1E757B438;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v28, "setInterruptionHandler:", &v30);

    -[SYDocumentWorkflowsClient connection](self, "connection", v30, v31, v32, v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "resume");

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
}

void __57__SYDocumentWorkflowsClient__createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_INFO, "Connection to service was invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

void __57__SYDocumentWorkflowsClient__createConnectionIfNecessary__block_invoke_122(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_INFO, "Connection to service was interrupted.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

- (void)_invalidateConnection
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)fetchAttributesForDocumentsWithIndexKeys:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_1BCC38000, v0, v1, "indexKeys can't be nil or empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)fetchAttributesForDocumentsWithIndexKeys:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_1BCC38000, v0, v1, "completion can't be nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)canPerformRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "%@ request doesn't have a valid document index key.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)canPerformRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "%@ request has invalid parameters.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)canPerformRequest:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_1BCC38000, v0, v1, "Unsupported request type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Unable to perform request: %@, error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_30_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Invoking request: %@, failed with error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_1BCC38000, v0, v1, "Service is not available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Unable to connect to service, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
