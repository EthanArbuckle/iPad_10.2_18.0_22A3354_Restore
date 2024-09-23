@implementation WFHandoffRunnerClient

- (WFHandoffRunnerClient)initWithRunningContext:(id)a3 runRequest:(id)a4
{
  id v7;
  id v8;
  WFHandoffRunDescriptor *v9;
  WFHandoffRunnerClient *v10;
  WFHandoffRunnerClient *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = -[WFHandoffRunDescriptor initWithContext:]([WFHandoffRunDescriptor alloc], "initWithContext:", v7);
  v13.receiver = self;
  v13.super_class = (Class)WFHandoffRunnerClient;
  v10 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v13, sel_initWithDescriptor_runRequest_, v9, v8);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_runningContext, a3);
    v11 = v10;
  }

  return v10;
}

- (WFHandoffRunnerClient)initWithWorkflowControllerState:(id)a3 runSource:(id)a4 remoteDialogPresenterEndpoint:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  WFHandoffRunnerClient *v25;
  WFHandoffRunnerClient *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  WFWorkflowControllerState *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v41 = a5;
  v40 = a4;
  v8 = a3;
  objc_msgSend(v8, "runningContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v9, "copyWithNewIdentity");

  v34 = [WFWorkflowControllerState alloc];
  objc_msgSend(v8, "workflow");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "variables");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v8, "currentActionIndex");
  objc_msgSend(v8, "currentInput");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentProcessedParameters");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRunSource");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "numberOfDialogsPresented");
  v11 = objc_msgSend(v8, "outputBehavior");
  objc_msgSend(v8, "currentActionContentAttributionTracker");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentItemCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flowTracker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowedOnceSmartPromptStates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionResourceClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v8, "shouldDisablePrivacyPrompts");
  v16 = -[WFWorkflowControllerState initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:](v34, "initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:", v39, v38, v37, v44, v36, v35, v33, v32, v10, v11, v31, v12, v13, v14, v15,
          v30);

  v17 = (void *)v16;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E60]), "initWithInput:presentationMode:", 0, 1);
  objc_msgSend(v18, "setRunSource:", v40);

  objc_msgSend(v18, "setOutputBehavior:", 0);
  objc_msgSend(v18, "setRemoteDialogPresenterEndpoint:", v41);

  objc_msgSend(v8, "extensionResourceClasses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setExtensionResourceClasses:", v19);
  objc_msgSend(v17, "runningContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    WFWFWorkflowControllerStateDefaultSerializedURLFromContext(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v45 = 0;
      v23 = objc_msgSend(v17, "writeToURL:error:", v22, &v45);
      v24 = v45;
      v25 = self;
      if ((v23 & 1) != 0)
      {
        v25 = -[WFHandoffRunnerClient initWithRunningContext:runRequest:](self, "initWithRunningContext:runRequest:", v21, v18);
        v26 = v25;
      }
      else
      {
        getWFXPCRunnerLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          v47 = "-[WFHandoffRunnerClient initWithWorkflowControllerState:runSource:remoteDialogPresenterEndpoint:error:]";
          v48 = 2112;
          v49 = v22;
          v50 = 2112;
          v51 = v24;
          _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_FAULT, "%s Unable to save state to (%@): %@", buf, 0x20u);
        }

        v26 = 0;
        if (a6)
          *a6 = objc_retainAutorelease(v24);
      }

    }
    else
    {
      v25 = self;
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
        v26 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
    }

  }
  else
  {
    getWFXPCRunnerLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[WFHandoffRunnerClient initWithWorkflowControllerState:runSource:remoteDialogPresenterEndpoint:error:]";
      _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, "%s Unable to resume workflow execution when contextToResume is nil.", buf, 0xCu);
    }

    v25 = self;
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
      v26 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFHandoffRunnerClient runningContext](self, "runningContext", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient createWorkflowControllerWithContext:](self, "createWorkflowControllerWithContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWorkflowRunnerClient runRequest](self, "runRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeRunningWithRequest:error:", v8, 0);

  -[WFHandoffRunnerClient runningContext](self, "runningContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)startWithHandler:(id)a3
{
  -[WFHandoffRunnerClient setRunningDidStartHandler:](self, "setRunningDidStartHandler:", a3);
  -[WFWorkflowRunnerClient start](self, "start");
}

- (void)handleWorkflowDidStart:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[WFHandoffRunnerClient notifyStartHandlerWithProgress:](self, "notifyStartHandlerWithProgress:", v4);
  v5.receiver = self;
  v5.super_class = (Class)WFHandoffRunnerClient;
  -[WFWorkflowRunnerClient handleWorkflowDidStart:](&v5, sel_handleWorkflowDidStart_, v4);

}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v6 = (void *)MEMORY[0x1E0CB38A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "progressWithTotalUnitCount:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletedUnitCount:", 1);
  -[WFHandoffRunnerClient notifyStartHandlerWithProgress:](self, "notifyStartHandlerWithProgress:", v9);
  v10.receiver = self;
  v10.super_class = (Class)WFHandoffRunnerClient;
  -[WFWorkflowRunnerClient handleWorkflowRunResult:completion:](&v10, sel_handleWorkflowRunResult_completion_, v8, v7);

}

- (void)notifyStartHandlerWithProgress:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFHandoffRunnerClient runningDidStartHandler](self, "runningDidStartHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFHandoffRunnerClient runningDidStartHandler](self, "runningDidStartHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

    -[WFHandoffRunnerClient setRunningDidStartHandler:](self, "setRunningDidStartHandler:", 0);
  }

}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (id)runningDidStartHandler
{
  return self->_runningDidStartHandler;
}

- (void)setRunningDidStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_runningDidStartHandler, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
}

@end
