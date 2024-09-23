@implementation WFSageWorkflowRunnerClient

- (WFSageWorkflowRunnerClient)initWithClientIdentifier:(id)a3 siriSessionID:(id)a4
{
  id v5;
  void *v6;
  NSXPCListener *v7;
  NSXPCListener *dialogRequestListener;
  NSXPCListener *v9;
  WFSageWorkflowRunRequest *v10;
  void *v11;
  WFSageWorkflowRunnerClient *v12;
  WFSageWorkflowRunnerClient *v13;
  void *v14;
  objc_super v16;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v7 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  -[NSXPCListener setDelegate:](v7, "setDelegate:", self);
  dialogRequestListener = self->_dialogRequestListener;
  self->_dialogRequestListener = v7;
  v9 = v7;

  v10 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFSageWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 0);
  -[WFWorkflowRunRequest setRunSource:](v10, "setRunSource:", CFSTR("siri-planner"));
  -[NSXPCListener endpoint](v9, "endpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setRemoteDialogPresenterEndpoint:](v10, "setRemoteDialogPresenterEndpoint:", v11);

  v16.receiver = self;
  v16.super_class = (Class)WFSageWorkflowRunnerClient;
  v12 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v16, sel_initWithDescriptor_runRequest_, v6, v10);

  v13 = v12;
  v14 = (void *)objc_msgSend(v5, "copy");

  -[WFSageWorkflowRunnerClient setSiriSessionID:](v13, "setSiriSessionID:", v14);
  return v13;
}

- (void)startWithCompletionHandler:(id)a3
{
  -[WFSageWorkflowRunnerClient setStartCompletionBlock:](self, "setStartCompletionBlock:", a3);
  -[WFSageWorkflowRunnerClient start](self, "start");
}

- (void)stepWithEncodedToolInvocation:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a3;
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 66, CFSTR("Please call -start before calling this method"));

  }
  v9 = (void *)objc_msgSend(v12, "copy");
  -[WFSageWorkflowRunnerClient setStepCompletionBlock:](self, "setStepCompletionBlock:", v9);

  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "runToolWithInvocation:", v7);

}

- (void)start
{
  void *v3;
  objc_super v4;

  -[WFSageWorkflowRunnerClient dialogRequestListener](self, "dialogRequestListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resume");

  v4.receiver = self;
  v4.super_class = (Class)WFSageWorkflowRunnerClient;
  -[WFWorkflowRunnerClient start](&v4, sel_start);
}

- (void)stop
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSageWorkflowRunnerClient;
  -[WFWorkflowRunnerClient stop](&v4, sel_stop);
  -[WFSageWorkflowRunnerClient dialogRequestListener](self, "dialogRequestListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 84, CFSTR("Please call -start before calling this method"));

  }
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "injectContentAsVariable:completionHandler:", v8, v7);

}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 89, CFSTR("Please call -start before calling this method"));

  }
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extractVariableContentFromEncodedReference:forEncodedExpectedType:completionHandler:", v11, v10, v9);

}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 94, CFSTR("Please call -start before calling this method"));

  }
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resolveDeferredValueFromEncodedStorage:forEncodedExpectedType:completionHandler:", v11, v10, v9);

}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 99, CFSTR("Please call -start before calling this method"));

  }
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchToolInvocationSummaryForInvocation:completionHandler:", v8, v7);

}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performQuery:inValueSet:toolInvocation:completionHandler:", v13, v12, v11, v10);

}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchDisplayValueForRequest:completionHandler:", v7, v6);

}

- (void)forTestingOnly_simulateXPCInterruption
{
  id v2;

  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forTestingOnly_simulateXPCInterruption");

}

- (id)createRunningContextFromRequestIfNecessary:(id)a3 descriptor:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFSageWorkflowRunnerClient;
  -[WFWorkflowRunnerClient createRunningContextFromRequestIfNecessary:descriptor:](&v11, sel_createRunningContextFromRequestIfNecessary_descriptor_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSageWorkflowRunnerClient siriSessionID](self, "siriSessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[WFSageWorkflowRunnerClient siriSessionID](self, "siriSessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v5, "copyWithCustomIdentity:", v8);

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (void)outOfProcessWorkflowController:(id)a3 didStartFromWorkflowReference:(id)a4 dialogAttribution:(id)a5
{
  void *v7;
  void (**v8)(void);
  void *v9;

  -[WFSageWorkflowRunnerClient startCompletionBlock](self, "startCompletionBlock", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSageWorkflowRunnerClient.m"), 130, CFSTR("Unexpected callback, did you call -startWithCompletionHandler?"));

  }
  -[WFSageWorkflowRunnerClient startCompletionBlock](self, "startCompletionBlock");
  v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v8[2]();

  -[WFSageWorkflowRunnerClient setStartCompletionBlock:](self, "setStartCompletionBlock:", 0);
}

- (void)outOfProcessWorkflowController:(id)a3 actionWithUUID:(id)a4 didFinishRunningWithError:(id)a5 serializedVariable:(id)a6 executionMetadata:(id)a7
{
  -[WFSageWorkflowRunnerClient completeStepExecutionForActionIdentifier:serializedVariable:executionMetadata:error:](self, "completeStepExecutionForActionIdentifier:serializedVariable:executionMetadata:error:", a4, a6, a7, a5);
}

- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v16 = a4;
  objc_msgSend(v16, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v16;
  if (v7)
  {
    objc_msgSend(v16, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSageWorkflowRunnerClient completeStepExecutionForActionIdentifier:serializedVariable:executionMetadata:error:](self, "completeStepExecutionForActionIdentifier:serializedVariable:executionMetadata:error:", 0, 0, 0, v9);
    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", WFOutOfProcessWorkflowControllerErrorDomain))
    {
      v11 = objc_msgSend(v9, "code");

      if (v11 != 4)
        goto LABEL_8;
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_8;
      v13 = (void *)v12;
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) == 0)
        goto LABEL_8;
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "workflowRunnerClient:postedEvent:", self, 1);
    }

LABEL_8:
    v8 = v16;
  }

}

- (void)completeStepExecutionForActionIdentifier:(id)a3 serializedVariable:(id)a4 executionMetadata:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[WFSageWorkflowRunnerClient stepCompletionBlock](self, "stepCompletionBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v12, "wf_isCancelledStepError"))
    {

      v11 = 0;
      v10 = 0;
    }
    -[WFSageWorkflowRunnerClient stepCompletionBlock](self, "stepCompletionBlock");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id))v14)[2](v14, v15, v10, v11, v12);

    -[WFSageWorkflowRunnerClient setStepCompletionBlock:](self, "setStepCompletionBlock:", 0);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  WFExternalUIPresenterXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, void *);
  NSObject *v5;
  WFSiriActionResponse *v6;
  void *v7;
  WFSiriActionResponse *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a4;
  getWFVoiceShortcutClientLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v9 = 136315138;
    v10 = "-[WFSageWorkflowRunnerClient performSiriRequest:completionHandler:]";
    _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_FAULT, "%s Sage workflow runner client should not receive siri action requests, ignoring.", (uint8_t *)&v9, 0xCu);
  }

  v6 = [WFSiriActionResponse alloc];
  objc_msgSend(MEMORY[0x1E0CB35C8], "wfSiriExecutionRequiresShortcutsJrError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFSiriActionResponse initWithError:](v6, "initWithError:", v7);

  v4[2](v4, v8);
}

- (void)performDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WFDialogResponse *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = -[WFDialogResponse initWithResponseCode:]([WFDialogResponse alloc], "initWithResponseCode:", 4);
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (-[WFWorkflowRunnerClient delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    -[WFWorkflowRunnerClient delegateQueue](self, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__WFSageWorkflowRunnerClient_performDialogRequest_completionHandler___block_invoke;
    block[3] = &unk_1E5FC7900;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(v12, block);

  }
  else
  {
    (*((void (**)(id, WFDialogResponse *))v7 + 2))(v7, v8);
  }

}

- (NSString)siriSessionID
{
  return self->_siriSessionID;
}

- (void)setSiriSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSXPCListener)dialogRequestListener
{
  return self->_dialogRequestListener;
}

- (id)startCompletionBlock
{
  return self->_startCompletionBlock;
}

- (void)setStartCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)stepCompletionBlock
{
  return self->_stepCompletionBlock;
}

- (void)setStepCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stepCompletionBlock, 0);
  objc_storeStrong(&self->_startCompletionBlock, 0);
  objc_storeStrong((id *)&self->_dialogRequestListener, 0);
  objc_storeStrong((id *)&self->_siriSessionID, 0);
}

void __69__WFSageWorkflowRunnerClient_performDialogRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workflowRunnerClient:postedDialogRequest:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
