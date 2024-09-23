@implementation WFEditorRunnerClient

- (WFEditorRunnerClient)initWithWorkflow:(id)a3 runSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  WFEditorRunnerClient *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
    __assert_rtn("-[WFEditorRunnerClient initWithWorkflow:runSource:]", "WFEditorRunnerClient.m", 24, "os_feature_enabled(Shortcuts, intermediate_outputs)");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E60]), "initWithInput:presentationMode:", 0, 0);
  v9 = objc_alloc(MEMORY[0x1E0DC7E28]);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:name:", v10, v11);

  objc_msgSend(v8, "setRunSource:", v7);
  objc_msgSend(v8, "setOutputBehavior:", 3);
  objc_msgSend(v8, "setAllowsDialogNotifications:", 0);
  v15.receiver = self;
  v15.super_class = (Class)WFEditorRunnerClient;
  v13 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:delegateQueue:](&v15, sel_initWithDescriptor_runRequest_delegateQueue_, v12, v8, MEMORY[0x1E0C80D38]);

  return v13;
}

- (WFEditorRunnerClient)initWithWorkflowData:(id)a3 runSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFEditorRunnerClient *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
    __assert_rtn("-[WFEditorRunnerClient initWithWorkflowData:runSource:]", "WFEditorRunnerClient.m", 37, "os_feature_enabled(Shortcuts, intermediate_outputs)");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E20]), "initWithWorkflowData:", v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E60]), "initWithInput:presentationMode:", 0, 3);
  objc_msgSend(v9, "setRunSource:", v7);
  objc_msgSend(v9, "setOutputBehavior:", 3);
  objc_msgSend(v9, "setAllowsDialogNotifications:", 0);
  v12.receiver = self;
  v12.super_class = (Class)WFEditorRunnerClient;
  v10 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:delegateQueue:](&v12, sel_initWithDescriptor_runRequest_delegateQueue_, v8, v9, MEMORY[0x1E0C80D38]);

  return v10;
}

@end
