@implementation SYLinkContextClient

- (void)setDelegate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  objc_storeWeak((id *)&self->_delegate, a3);
  -[SYLinkContextClient _clientQueue](self, "_clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SYLinkContextClient_setDelegate___block_invoke;
  block[3] = &unk_1E757B758;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __65__SYLinkContextClient__updateObserverAndCreateConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clientQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SYLinkContextClient__updateObserverAndCreateConnectionIfNeeded__block_invoke_2;
  block[3] = &unk_1E757B758;
  block[4] = WeakRetained;
  dispatch_async(v2, block);

}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (id)initForTesting:(BOOL)a3
{
  SYLinkContextClient *v4;
  uint64_t v5;
  NSMutableSet *pendingCreateLinkCompletionBlocks;
  uint64_t v7;
  NSMutableSet *pendingFetchLinkCompletionBlocks;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *clientQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SYLinkContextClient;
  v4 = -[SYLinkContextClient init](&v13, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    pendingCreateLinkCompletionBlocks = v4->__pendingCreateLinkCompletionBlocks;
    v4->__pendingCreateLinkCompletionBlocks = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    pendingFetchLinkCompletionBlocks = v4->__pendingFetchLinkCompletionBlocks;
    v4->__pendingFetchLinkCompletionBlocks = (NSMutableSet *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.synapse.LinkContextClient", v9);
    clientQueue = v4->__clientQueue;
    v4->__clientQueue = (OS_dispatch_queue *)v10;

    v4->__forTesting = a3;
  }
  return v4;
}

- (void)_updateObserverAndCreateConnectionIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  SYNotesActivationObserver *v6;
  SYNotesActivationObserver *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  -[SYLinkContextClient _notesObserver](self, "_notesObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (WeakRetained)
  {
    if (v4)
    {

    }
    else if (!-[SYLinkContextClient _forTesting](self, "_forTesting"))
    {
      objc_initWeak(&location, self);
      v6 = [SYNotesActivationObserver alloc];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __65__SYLinkContextClient__updateObserverAndCreateConnectionIfNeeded__block_invoke;
      v18 = &unk_1E757B940;
      objc_copyWeak(&v19, &location);
      v7 = -[SYNotesActivationObserver initWithHandler:](v6, "initWithHandler:", &v15);
      -[SYLinkContextClient set_notesObserver:](self, "set_notesObserver:", v7, v15, v16, v17, v18);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    if (-[SYLinkContextClient _forTesting](self, "_forTesting")
      || (-[SYLinkContextClient _notesObserver](self, "_notesObserver"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isVisible"),
          v8,
          v9))
    {
      -[SYLinkContextClient _connection](self, "_connection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        -[SYLinkContextClient _createConnectionIfNeeded](self, "_createConnectionIfNeeded");
      -[SYLinkContextClient _connection](self, "_connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        -[SYLinkContextClient _sendInitialMessage](self, "_sendInitialMessage");
      -[SYLinkContextClient _connection](self, "_connection");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        -[SYLinkContextClient _notesObserver](self, "_notesObserver");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          -[SYLinkContextClient set_notesObserver:](self, "set_notesObserver:", 0);
      }
    }
  }
  else
  {

    if (v5)
      -[SYLinkContextClient set_notesObserver:](self, "set_notesObserver:", 0);
  }
}

- (SYNotesActivationObserver)_notesObserver
{
  return self->__notesObserver;
}

- (BOOL)_forTesting
{
  return self->__forTesting;
}

- (void)set_notesObserver:(id)a3
{
  objc_storeStrong((id *)&self->__notesObserver, a3);
}

uint64_t __65__SYLinkContextClient__updateObserverAndCreateConnectionIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateObserverAndCreateConnectionIfNeeded");
}

uint64_t __35__SYLinkContextClient_setDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateObserverAndCreateConnectionIfNeeded");
}

- (SYLinkContextClient)init
{
  return (SYLinkContextClient *)-[SYLinkContextClient initForTesting:](self, "initForTesting:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SYLinkContextClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SYLinkContextClient set_connection:](self, "set_connection:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SYLinkContextClient;
  -[SYLinkContextClient dealloc](&v4, sel_dealloc);
}

- (void)_sendInitialMessage
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, v4, "LinkContextClient: proxy doesn't respond to selector: %@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __42__SYLinkContextClient__sendInitialMessage__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__SYLinkContextClient__sendInitialMessage__block_invoke_cold_1();

}

- (void)createAndShowContextualLinkWithUserActivity:(id)a3 linkPreviewMetadata:(id)a4 preferNewDocument:(BOOL)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  SYLinkContextClient *v29;
  _QWORD block[4];
  id v31;
  id v32;
  SYLinkContextClient *v33;
  id v34;
  id v35;
  char v36;
  BOOL v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivity"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  LODWORD(v15) = SYIsLinkableUserActivity(v11);
  objc_msgSend(v11, "_uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self;
    if ((_DWORD)v15)
      v18 = CFSTR("Y");
    else
      v18 = CFSTR("N");
    objc_msgSend(v11, "_linkContextInfo");
    v28 = (char)v15;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    if (v15)
      v19 = CFSTR("Y");
    else
      v19 = CFSTR("N");
    v39 = v16;
    if (v12)
      v20 = CFSTR("Y");
    else
      v20 = CFSTR("N");
    v40 = 2112;
    v41 = v18;
    self = v29;
    v42 = 2112;
    v43 = v19;
    v44 = 2112;
    v45 = v20;
    _os_log_impl(&dword_1BCC38000, v17, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Create contextual link with user activity %@, is linkable: %@, has link context: %@, has link preview: %@", buf, 0x2Au);

    LOBYTE(v15) = v28;
  }

  -[SYLinkContextClient _clientQueue](self, "_clientQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke;
  block[3] = &unk_1E757BCB8;
  v36 = (char)v15;
  v31 = v11;
  v32 = v12;
  v34 = v16;
  v35 = v14;
  v37 = a5;
  v33 = self;
  v22 = v16;
  v23 = v14;
  v24 = v12;
  v25 = v11;
  dispatch_async(v21, block);

}

void __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  SYContentItem *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = &stru_1E757CA18;
    if (v3)
      v5 = (__CFString *)v3;
    v6 = v5;

    v7 = -[SYContentItem initWithUserActivity:sourceAppID:sourceAppName:identifier:]([SYContentItem alloc], "initWithUserActivity:sourceAppID:sourceAppName:identifier:", *(_QWORD *)(a1 + 32), v6, 0, 0);
    -[SYContentItem setLinkPreviewMetadata:](v7, "setLinkPreviewMetadata:", *(_QWORD *)(a1 + 40));
    v25 = 0;
    -[SYContentItem dataRepresentationWithError:](v7, "dataRepresentationWithError:", &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;

    if (v8)
    {
      v10 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
      objc_msgSend(*(id *)(a1 + 48), "_pendingCreateLinkCompletionBlocks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1BCCFF08C](v10);
      objc_msgSend(v11, "addObject:", v12);

      v13 = *(unsigned __int8 *)(a1 + 73);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke_2;
      v21[3] = &unk_1E757BC90;
      v14 = *(void **)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      v16 = *(_QWORD *)(a1 + 48);
      v22 = v15;
      v23 = v16;
      v24 = v10;
      v17 = v10;
      objc_msgSend(v14, "_sendRequestToCreateLinkWithContentItemData:preferNewDocument:completion:", v8, v13, v21);

      goto LABEL_10;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("User activity is not linkable.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -126, v19);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v20 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_10:

}

void __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("N");
    v14 = 138412802;
    if (a2)
      v8 = CFSTR("Y");
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Finished request to create contextual link for activity %@, success: %@, error: %@", (uint8_t *)&v14, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_pendingCreateLinkCompletionBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1BCCFF08C](*(_QWORD *)(a1 + 48));
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "_pendingCreateLinkCompletionBlocks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1BCCFF08C](*(_QWORD *)(a1 + 48));
    objc_msgSend(v12, "removeObject:", v13);

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
  }

}

- (void)_sendRequestToCreateLinkWithContentItemData:(id)a3 preferNewDocument:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t (**v16)(_QWORD, _QWORD);
  int v17;
  __CFString **v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[6];
  uint8_t buf[8];
  _QWORD v26[2];
  _QWORD v27[3];

  v6 = a4;
  v27[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemData"));

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.notes.activity.create-link"));
  v26[0] = CFSTR("SYContentItemData");
  v26[1] = CFSTR("SYLinkPreferNewDocument");
  v27[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInfo:", v13);

  v14 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCC38000, v14, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Sending request to create link.", buf, 2u);
  }

  -[SYLinkContextClient testingShouldSendCreateLinkRequest](self, "testingShouldSendCreateLinkRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    && (-[SYLinkContextClient testingShouldSendCreateLinkRequest](self, "testingShouldSendCreateLinkRequest"),
        v16 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v17 = ((uint64_t (**)(_QWORD, void *))v16)[2](v16, v11),
        v16,
        !v17))
  {
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    v18 = SYSystemPaperActivationMethodAddHighlight;
    if (v6)
      v18 = SYSystemPaperActivationMethodNewHighlight;
    +[SYSystemPaperAnalytics logActivationEvent:](SYSystemPaperAnalytics, "logActivationEvent:", *v18);
    v19 = SYIsPhone();
    v20 = MEMORY[0x1E0C809B0];
    if (v19 && SYIsQuickNoteOnPhoneEnabled())
    {
      v24[0] = v20;
      v24[1] = 3221225472;
      v24[2] = __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke;
      v24[3] = &unk_1E757BCE0;
      v24[4] = self;
      v24[5] = a2;
      +[SYNotesActivationCommandInAppImpl setFetchPresenterViewControllerInvocationBlock:](SYNotesActivationCommandInAppImpl, "setFetchPresenterViewControllerInvocationBlock:", v24);
    }
    v22[0] = v20;
    v22[1] = 3221225472;
    v22[2] = __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke_2;
    v22[3] = &unk_1E757BB90;
    v22[4] = self;
    v23 = v10;
    +[SYNotesActivationCommand activateWithMetaActivity:completion:](SYNotesActivationCommand, "activateWithMetaActivity:completion:", v11, v22);

  }
}

id __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingViewControllerForLinkContextClient:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SYLinkContextClient.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentingViewController != nil"));

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke_3;
    v5[3] = &unk_1E757B850;
    v6 = v3;
    v7 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);

  }
}

uint64_t __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

- (void)fetchLinkContextsForUserActivity:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryActivity"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[SYLinkContextClient _clientQueue](self, "_clientQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke;
  block[3] = &unk_1E757B388;
  block[4] = self;
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  dispatch_async(v10, block);

}

void __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  _BYTE buf[24];
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createConnectionIfNeeded");
  v2 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "_uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "LinkContextClient: fetchLinkContexts started for activity: %@, connection: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke_46;
  v7[3] = &unk_1E757B558;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = buf;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "_processFetchLinkContextsRequestForUserActivity:serviceProxy:completion:", *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  _Block_object_dispose(buf, 8);
}

void __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke_46_cold_1((uint64_t)v4, a1);

}

- (void)_processFetchLinkContextsRequestForUserActivity:(id)a3 serviceProxy:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  SYUserActivityIdentifierInfo *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceProxy"));

    if (v11)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryActivity"));

  if (!v10)
    goto LABEL_11;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalCompletion"));

LABEL_4:
  -[SYLinkContextClient _clientQueue](self, "_clientQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v11, "copy");
    -[SYLinkContextClient _pendingFetchLinkCompletionBlocks](self, "_pendingFetchLinkCompletionBlocks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1BCCFF08C](v13);
    objc_msgSend(v14, "addObject:", v15);

    v16 = -[SYUserActivityIdentifierInfo initWithUserActivity:]([SYUserActivityIdentifierInfo alloc], "initWithUserActivity:", v9);
    objc_msgSend(v9, "_uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke;
    v26[3] = &unk_1E757BD30;
    v26[4] = self;
    v27 = v17;
    v28 = v13;
    v18 = v13;
    v19 = v17;
    objc_msgSend(v10, "fetchLinkContextsDataForUserActivityInfo:completion:", v16, v26);

  }
  else
  {
    v20 = os_log_create("com.apple.synapse", "LinkContext");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SYLinkContextClient _processFetchLinkContextsRequestForUserActivity:serviceProxy:completion:].cold.1((int)v10, sel_fetchLinkContextsDataForUserActivityInfo_completion_);

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Error communicating with remote service. The service doesn't have the expected interface.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -124, v22);
    v16 = (SYUserActivityIdentifierInfo *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, SYUserActivityIdentifierInfo *))v11 + 2))(v11, 0, v16);
  }

}

void __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "_clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke_2;
  block[3] = &unk_1E757BD08;
  v11 = v5;
  v12 = a1[5];
  v13 = v6;
  v14 = a1[4];
  v15 = a1[6];
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  os_log_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = os_log_create("com.apple.synapse", "LinkContext");
  v4 = v3;
  if (v2)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2048;
      v22 = v7;
      _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextClient: fetchLinkContexts finished for activity: %@, found contexts: %ld", buf, 0x16u);
    }

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke_2_cold_1(a1, v4);
  }

  objc_msgSend(*(id *)(a1 + 56), "_pendingFetchLinkCompletionBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1BCCFF08C](*(_QWORD *)(a1 + 64));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      v13 = *(void **)(a1 + 56);
      v18 = v11;
      objc_msgSend(v13, "_linkContextDictionariesFromDataArray:error:", v12, &v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18;

      v11 = v15;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(*(id *)(a1 + 56), "_pendingFetchLinkCompletionBlocks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1BCCFF08C](*(_QWORD *)(a1 + 64));
    objc_msgSend(v16, "removeObject:", v17);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (id)_linkContextDictionariesFromDataArray:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  const __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SYSupportedLinkContextInfoClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v21 = a4;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
        v23 = v13;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v7, v14, &v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v23;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v16 = (void *)MEMORY[0x1E0CB35C8];
          v28 = *MEMORY[0x1E0CB2D50];
          v29 = CFSTR("Invalid link context data, not a dictionary.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -125, v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v19 = os_log_create("com.apple.synapse", "LinkContext");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[SYLinkContextClient _linkContextDictionariesFromDataArray:error:].cold.1(v19);

          v10 = (id)v18;
LABEL_15:
          a4 = v21;

          v6 = 0;
          goto LABEL_16;
        }
        objc_msgSend(v6, "addObject:", v15);
        if (!v15)
          goto LABEL_15;

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v9)
        continue;
      break;
    }
    a4 = v21;
  }
  else
  {
    v10 = 0;
  }
LABEL_16:

  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v6;
}

- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[SYLinkContextClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v6);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "_linkContextInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYLinkContextClient delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke;
      v15[3] = &unk_1E757BD58;
      v16 = v12;
      v17 = v7;
      v14 = v12;
      objc_msgSend(v13, "userWillAddLinkWithActivity:completion:", v11, v15);

    }
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  SYContentItem *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (SYIsLinkableUserActivity(v5))
    {
      objc_msgSend(v5, "_linkContextInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7 || objc_msgSend(*(id *)(a1 + 32), "isEqualToDictionary:", v7))
      {
        v8 = os_log_create("com.apple.synapse", "LinkContext");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke_cold_2(v5, v8);

      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = &stru_1E757CA18;
      if (v10)
        v12 = (__CFString *)v10;
      v13 = v12;

      v14 = -[SYContentItem initWithUserActivity:sourceAppID:sourceAppName:identifier:]([SYContentItem alloc], "initWithUserActivity:sourceAppID:sourceAppName:identifier:", v5, v13, 0, 0);
      -[SYContentItem setLinkPreviewMetadata:](v14, "setLinkPreviewMetadata:", v6);
      v19 = 0;
      -[SYContentItem dataRepresentationWithError:](v14, "dataRepresentationWithError:", &v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      if (v16)
      {
        v17 = os_log_create("com.apple.synapse", "LinkContext");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke_cold_1();

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v18 = *(_QWORD *)(a1 + 40);
      if (v18)
        (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);
    }
  }

}

- (void)userDidRemoveContentItemDatas:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SYContentItem *v14;
  SYContentItem *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SYLinkContextClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          v14 = [SYContentItem alloc];
          v15 = -[SYContentItem initWithData:error:](v14, "initWithData:error:", v13, 0, (_QWORD)v17);
          if (v15)
            objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    -[SYLinkContextClient delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userDidRemoveContentItems:", v7);

  }
}

- (void)userEditDidAddContentItemDatas:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SYContentItem *v14;
  SYContentItem *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SYLinkContextClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          v14 = [SYContentItem alloc];
          v15 = -[SYContentItem initWithData:error:](v14, "initWithData:error:", v13, 0, (_QWORD)v17);
          if (v15)
            objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    -[SYLinkContextClient delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userEditDidAddContentItems:", v7);

  }
}

- (void)insertImagesData:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  SYLinkContextClient *v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imagesData"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[SYLinkContextClient _clientQueue](self, "_clientQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SYLinkContextClient_insertImagesData_completion___block_invoke;
  block[3] = &unk_1E757BD80;
  v17 = self;
  v18 = v9;
  v16 = v7;
  v11 = v9;
  v12 = v7;
  dispatch_async(v10, block);

}

void __51__SYLinkContextClient_insertImagesData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.notes.activity.insert-image"));
  v3 = *(_QWORD *)(a1 + 32);
  v12 = CFSTR("SYContentItemData");
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInfo:", v4);

  v5 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v11 = v6;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Sending request to insert %lu images.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SYLinkContextClient_insertImagesData_completion___block_invoke_70;
  v8[3] = &unk_1E757BB90;
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v7;
  +[SYNotesActivationCommand activateWithMetaActivity:completion:](SYNotesActivationCommand, "activateWithMetaActivity:completion:", v2, v8);

}

void __51__SYLinkContextClient_insertImagesData_completion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__SYLinkContextClient_insertImagesData_completion___block_invoke_2;
    v5[3] = &unk_1E757B850;
    v6 = v3;
    v7 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);

  }
}

uint64_t __51__SYLinkContextClient_insertImagesData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

- (void)_createConnectionIfNeeded
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_DEBUG, "LinkContextClient: Create new connection if needed: %@", v4, 0xCu);

  OUTLINED_FUNCTION_3_0();
}

- (void)_configureConnectionAndResume
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  -[SYLinkContextClient _connection](self, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkContextClient.m"), 464, CFSTR("the XPC connection is unexpectedly nil"));

  }
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__SYLinkContextClient__configureConnectionAndResume__block_invoke;
  v17[3] = &unk_1E757B438;
  objc_copyWeak(&v18, &location);
  -[SYLinkContextClient _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", v17);

  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __52__SYLinkContextClient__configureConnectionAndResume__block_invoke_77;
  v15[3] = &unk_1E757B438;
  objc_copyWeak(&v16, &location);
  -[SYLinkContextClient _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterruptionHandler:", v15);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF492560);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLinkContextClient _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v8);

  -[SYLinkContextClient _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExportedObject:", self);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF494AC8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLinkContextClient _connection](self, "_connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExportedInterface:", v11);

  -[SYLinkContextClient _connection](self, "_connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __52__SYLinkContextClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Connection was invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

void __52__SYLinkContextClient__configureConnectionAndResume__block_invoke_77(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Connection was interrupted.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

- (void)_invalidateConnection
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pendingCreateLinkCompletionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(a1, "_pendingFetchLinkCompletionBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v4;
  v10 = 2048;
  v11 = v6;
  v12 = 2048;
  v13 = objc_msgSend(v7, "count");
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "LinkContextClient: Invalidating connection: %@, pending createLink blocks: %ld, fetchLink blocks: %ld", (uint8_t *)&v8, 0x20u);

}

void __44__SYLinkContextClient__invalidateConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateObserverAndCreateConnectionIfNeeded");

}

- (void)createConnectionWithEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SYLinkContextClient _clientQueue](self, "_clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SYLinkContextClient_createConnectionWithEndpoint___block_invoke;
  block[3] = &unk_1E757B460;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __52__SYLinkContextClient_createConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "set_connection:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_clientQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_configureConnectionAndResume");
}

- (SYLinkContextClientDelegate)delegate
{
  return (SYLinkContextClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)set_connection:(id)a3
{
  objc_storeStrong((id *)&self->__connection, a3);
}

- (NSMutableSet)_pendingCreateLinkCompletionBlocks
{
  return self->__pendingCreateLinkCompletionBlocks;
}

- (NSMutableSet)_pendingFetchLinkCompletionBlocks
{
  return self->__pendingFetchLinkCompletionBlocks;
}

- (void)set_clientQueue:(id)a3
{
  objc_storeStrong((id *)&self->__clientQueue, a3);
}

- (id)testingShouldSendCreateLinkRequest
{
  return self->_testingShouldSendCreateLinkRequest;
}

- (void)setTestingShouldSendCreateLinkRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testingShouldSendCreateLinkRequest, 0);
  objc_storeStrong((id *)&self->__notesObserver, 0);
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__pendingFetchLinkCompletionBlocks, 0);
  objc_storeStrong((id *)&self->__pendingCreateLinkCompletionBlocks, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__SYLinkContextClient__sendInitialMessage__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, v0, v1, "LinkContextClient: Error creating remote service proxy: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, v0, v1, "LinkContextClient: Request to create link failed: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke_46_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a2 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v3, v4, "LinkContextClient: Error creating remote service proxy: %@, connection: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

- (void)_processFetchLinkContextsRequestForUserActivity:(int)a1 serviceProxy:(SEL)aSelector completion:.cold.1(int a1, SEL aSelector)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(aSelector);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v3, v4, "LinkContextClient: service proxy: %@, doesn't respond to selector: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

void __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "LinkContextClient: fetchLinkContexts FAILED for activity: %@, error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_linkContextDictionariesFromDataArray:(NSObject *)a1 error:.cold.1(NSObject *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_2_0();
  v3 = v2;
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a1, v4, "LinkContextClient: Error decoding link context data, not a dictionary: %@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, v0, v1, "LinkContextClient: error creating data for contentItem %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_linkContextInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = a1;
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v5;
  v14 = 2112;
  v15 = v7;
  _os_log_debug_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_DEBUG, "LinkContextClient: link context info wasn't added or updated for userActivity: %@, type: %@, title: %@, contextInfo keys: %@", (uint8_t *)&v8, 0x2Au);

}

@end
