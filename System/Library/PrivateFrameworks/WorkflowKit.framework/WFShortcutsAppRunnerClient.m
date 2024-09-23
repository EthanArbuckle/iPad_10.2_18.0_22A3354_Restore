@implementation WFShortcutsAppRunnerClient

- (WFShortcutsAppRunnerClient)initWithWorkflow:(id)a3 state:(id)a4 runSource:(id)a5 input:(id)a6 remoteDialogPresenterEndpoint:(id)a7 requestOutput:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  WFHandoffRunDescriptor *v25;
  void *v26;
  WFHandoffRunDescriptor *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  char v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  uint64_t v37;
  WFShortcutsAppRunnerClient *v38;
  id v40;
  objc_super v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v8 = a8;
  v49 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v40 = a5;
  v16 = a7;
  v17 = (objc_class *)MEMORY[0x1E0DC7E60];
  v18 = a6;
  v19 = [v17 alloc];
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithInput:presentationMode:", v18, objc_msgSend(v20, "hasSystemAperture"));

  objc_msgSend(v15, "runningContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = *MEMORY[0x1E0DC7FD8];
    objc_msgSend(v15, "runningContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setOriginatingBundleIdentifier:", v23);

    v25 = [WFHandoffRunDescriptor alloc];
    objc_msgSend(v15, "runningContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[WFHandoffRunDescriptor initWithContext:](v25, "initWithContext:", v26);

    objc_msgSend(v15, "extensionResourceClasses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setExtensionResourceClasses:", v28);

    objc_msgSend(v15, "runningContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    WFWFWorkflowControllerStateDefaultSerializedURLFromContext(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v38 = 0;
      v36 = v40;
      goto LABEL_13;
    }
    v31 = v8;
    v42 = 0;
    v32 = objc_msgSend(v15, "writeToURL:error:", v30, &v42);
    v33 = v42;
    if ((v32 & 1) == 0)
    {
      getWFXPCRunnerLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v44 = "-[WFShortcutsAppRunnerClient initWithWorkflow:state:runSource:input:remoteDialogPresenterEndpoint:requestOutput:]";
        v45 = 2112;
        v46 = v30;
        v47 = 2112;
        v48 = v33;
        _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_FAULT, "%s Unable to save state to (%@): %@", buf, 0x20u);
      }

    }
  }
  else
  {
    v31 = v8;
    v35 = objc_alloc(MEMORY[0x1E0DC7E28]);
    objc_msgSend(v14, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v27 = (WFHandoffRunDescriptor *)objc_msgSend(v35, "initWithIdentifier:name:", v30, v33);
  }

  v36 = v40;
  objc_msgSend(v21, "setRunSource:", v40);
  if (v31)
    v37 = 2;
  else
    v37 = 1;
  objc_msgSend(v21, "setOutputBehavior:", v37, v40);
  objc_msgSend(v21, "setRemoteDialogPresenterEndpoint:", v16);
  objc_msgSend(v21, "setAllowsDialogNotifications:", 0);
  objc_msgSend(v21, "setDonateInteraction:", objc_msgSend(v14, "hiddenFromLibraryAndSync") ^ 1);
  v41.receiver = self;
  v41.super_class = (Class)WFShortcutsAppRunnerClient;
  self = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:delegateQueue:](&v41, sel_initWithDescriptor_runRequest_delegateQueue_, v27, v21, MEMORY[0x1E0C80D38]);
  v38 = self;
LABEL_13:

  return v38;
}

- (WFShortcutsAppRunnerClient)initWithWorkflowData:(id)a3 runSource:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  WFShortcutsAppRunnerClient *v11;
  objc_super v13;

  v6 = (objc_class *)MEMORY[0x1E0DC7E20];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithWorkflowData:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E60]), "initWithInput:presentationMode:", 0, 3);
  objc_msgSend(v10, "setRunSource:", v7);

  objc_msgSend(v10, "setOutputBehavior:", 2);
  objc_msgSend(v10, "setAllowsDialogNotifications:", 0);
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutsAppRunnerClient;
  v11 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:delegateQueue:](&v13, sel_initWithDescriptor_runRequest_delegateQueue_, v9, v10, MEMORY[0x1E0C80D38]);

  return v11;
}

- (WFShortcutsAppRunnerClient)initWithIdentifier:(id)a3 name:(id)a4 action:(id)a5 metadata:(id)a6 runSource:(id)a7 remoteDialogPresenterEndpoint:(id)a8
{
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  WFShortcutsAppRunnerClient *v25;
  objc_super v27;

  v14 = (objc_class *)MEMORY[0x1E0DC7BB8];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_msgSend([v14 alloc], "initWithIdentifier:name:action:metadata:isAutoShortcut:", v20, v19, v18, v17, 1);

  v22 = objc_alloc(MEMORY[0x1E0DC7E60]);
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithInput:presentationMode:", 0, objc_msgSend(v23, "hasSystemAperture"));

  objc_msgSend(v24, "setRunSource:", v16);
  objc_msgSend(v24, "setOutputBehavior:", 1);
  objc_msgSend(v24, "setAllowsDialogNotifications:", 0);
  objc_msgSend(v24, "setRemoteDialogPresenterEndpoint:", v15);

  v27.receiver = self;
  v27.super_class = (Class)WFShortcutsAppRunnerClient;
  v25 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:delegateQueue:](&v27, sel_initWithDescriptor_runRequest_delegateQueue_, v21, v24, MEMORY[0x1E0C80D38]);

  return v25;
}

- (WFShortcutsAppRunnerClient)initWithContextualAction:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WFShortcutsAppRunnerClient *v9;
  objc_super v11;

  v4 = (objc_class *)MEMORY[0x1E0DC7A58];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSurface:", 2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7A78]), "initWithAction:context:", v5, v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7A80]), "initWithAction:actionContext:", v5, v6);

  v11.receiver = self;
  v11.super_class = (Class)WFShortcutsAppRunnerClient;
  v9 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:delegateQueue:](&v11, sel_initWithDescriptor_runRequest_delegateQueue_, v7, v8, MEMORY[0x1E0C80D38]);

  return v9;
}

- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFWorkflowRunnerClient descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunnerClient createWorkflowControllerWithContext:](self, "createWorkflowControllerWithContext:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunnerClient runRequest](self, "runRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resumeRunningWithRequest:error:", v14, 0);

  }
  else
  {

    v16.receiver = self;
    v16.super_class = (Class)WFShortcutsAppRunnerClient;
    -[WFWorkflowRunnerClient runWorkflowWithRequest:descriptor:completion:](&v16, sel_runWorkflowWithRequest_descriptor_completion_, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
