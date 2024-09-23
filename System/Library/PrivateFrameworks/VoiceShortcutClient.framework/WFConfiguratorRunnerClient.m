@implementation WFConfiguratorRunnerClient

- (WFConfiguratorRunnerClient)initWithWorkflowName:(id)a3 inputStrings:(id)a4
{
  id v7;
  id v8;
  WFWorkflowDatabaseRunDescriptor *v9;
  WFConfiguratorRunRequest *v10;
  WFConfiguratorRunnerClient *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguratorRunnerClient.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowName"));

  }
  v9 = -[WFWorkflowDatabaseRunDescriptor initWithName:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithName:", v7);
  v10 = -[WFConfiguratorRunRequest initWithInputStrings:presentationMode:]([WFConfiguratorRunRequest alloc], "initWithInputStrings:presentationMode:", v8, 0);
  v14.receiver = self;
  v14.super_class = (Class)WFConfiguratorRunnerClient;
  v11 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v14, sel_initWithDescriptor_runRequest_, v9, v10);

  return v11;
}

@end
