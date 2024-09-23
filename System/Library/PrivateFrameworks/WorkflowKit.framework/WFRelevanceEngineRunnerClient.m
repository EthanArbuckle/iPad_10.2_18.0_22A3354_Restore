@implementation WFRelevanceEngineRunnerClient

- (WFRelevanceEngineRunnerClient)initWithIntent:(id)a3 delegateQueue:(id)a4
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  WFRelevanceEngineRunnerClient *v22;
  WFRelevanceEngineRunnerClient *v23;
  WFRelevanceEngineRunnerClient *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_alloc(MEMORY[0x1E0DC7E28]);
      objc_msgSend(v10, "workflow");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "vocabularyIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "workflow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "spokenPhrase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v11, "initWithIdentifier:name:", v13, v15);

      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRelevanceEngineRunnerClient.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent"));

  }
  v18 = objc_alloc(MEMORY[0x1E0DC7B58]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDBE8]), "initWithIntent:", v8);
  v16 = (void *)objc_msgSend(v18, "initWithShortcut:", v12);
  v10 = 0;
LABEL_6:

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", self);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E60]), "initWithInput:presentationMode:", 0, 3);
  objc_msgSend(v20, "setRunSource:", *MEMORY[0x1E0DC84E0]);
  objc_msgSend(v19, "endpoint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRemoteDialogPresenterEndpoint:", v21);

  objc_msgSend(v20, "setAllowsDialogNotifications:", 0);
  v26.receiver = self;
  v26.super_class = (Class)WFRelevanceEngineRunnerClient;
  v22 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:delegateQueue:](&v26, sel_initWithDescriptor_runRequest_delegateQueue_, v16, v20, v9);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_intent, a3);
    objc_storeStrong((id *)&v23->_dialogRequestListener, v19);
    v24 = v23;
  }

  return v23;
}

- (void)start
{
  void *v3;
  objc_super v4;

  -[WFRelevanceEngineRunnerClient dialogRequestListener](self, "dialogRequestListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resume");

  v4.receiver = self;
  v4.super_class = (Class)WFRelevanceEngineRunnerClient;
  -[WFWorkflowRunnerClient start](&v4, sel_start);
}

- (void)stop
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFRelevanceEngineRunnerClient;
  -[WFWorkflowRunnerClient stop](&v4, sel_stop);
  -[WFRelevanceEngineRunnerClient dialogRequestListener](self, "dialogRequestListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRelevanceEngineRunnerClient intentExecutorIntentResponseFromError:](self, "intentExecutorIntentResponseFromError:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("WFRelevanceEngineRunnerClientIntentResponseErrorKey"));
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v8, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v8, "code"), v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
  }
  objc_msgSend(v6, "resultBySettingError:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)WFRelevanceEngineRunnerClient;
  -[WFWorkflowRunnerClient handleWorkflowRunResult:completion:](&v16, sel_handleWorkflowRunResult_completion_, v15, v7);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WFUIPresenterXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");
  getWFRelevanceEngineLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[WFRelevanceEngineRunnerClient listener:shouldAcceptNewConnection:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s Accepted connection from BackgroundShortcutRunner, connection = %@", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a4;
  getWFRelevanceEngineLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[WFRelevanceEngineRunnerClient dismissPresentedContentForRunningContext:completionHandler:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s dismissPresentedContentForRunningContext:completionHandler called", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 0);
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  void *v17;
  char v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void (**v24)(_QWORD);
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(_QWORD);
  _QWORD v32[4];
  id v33;
  _QWORD block[5];
  id v35;
  id v36;
  void (**v37)(_QWORD);
  _QWORD aBlock[4];
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  if (!v11)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "interaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intentResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "promptForDisplay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke;
    aBlock[3] = &unk_1E7AF8F48;
    v39 = v10;
    v16 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[WFWorkflowRunnerClient delegateQueue](self, "delegateQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = v15;
      block[1] = 3221225472;
      block[2] = __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_2;
      block[3] = &unk_1E7AF8F70;
      block[4] = self;
      v35 = v13;
      v36 = v14;
      v37 = v16;
      dispatch_async(v19, block);

    }
    else
    {
      v16[2](v16);
    }

    goto LABEL_13;
  }

  v20 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithResponseCode:", 4);
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v28, 0);

    goto LABEL_13;
  }
  objc_msgSend(v20, "interaction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "intentResponse");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_3;
  v32[3] = &unk_1E7AF8F48;
  v33 = v10;
  v24 = (void (**)(_QWORD))_Block_copy(v32);
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    -[WFWorkflowRunnerClient delegateQueue](self, "delegateQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_4;
    v29[3] = &unk_1E7AF8378;
    v29[4] = self;
    v30 = v22;
    v31 = v24;
    dispatch_async(v27, v29);

  }
  else
  {
    v24[2](v24);
  }

LABEL_13:
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "wfUnsupportedUserInterfaceError");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, MEMORY[0x1E0C9AAB0], v7);

}

- (id)intentExecutorIntentResponseFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("WFIntentExecutorErrorDomain"));

    objc_msgSend(v5, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WFIntentExecutorIntentResponseErrorKey"));
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v15 = v11;
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v10 = v14;

      -[WFRelevanceEngineRunnerClient intentExecutorIntentResponseFromError:](self, "intentExecutorIntentResponseFromError:", v10);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v15;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (INIntent)intent
{
  return self->_intent;
}

- (NSXPCListener)dialogRequestListener
{
  return self->_dialogRequestListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogRequestListener, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

void __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7A40]), "initWithInteractionResponseCode:", 1);
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevanceEngineRunnerClient:didReceiveConfirmResponse:prompt:proceedHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B50]), "initWithInteractionResponseCode:", 0);
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevanceEngineRunnerClient:didReceiveHandleResponse:proceedHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
