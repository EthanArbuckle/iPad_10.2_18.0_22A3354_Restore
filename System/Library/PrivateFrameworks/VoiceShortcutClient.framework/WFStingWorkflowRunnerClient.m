@implementation WFStingWorkflowRunnerClient

- (WFStingWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3
{
  id v4;
  WFWorkflowDatabaseRunDescriptor *v5;
  WFWorkflowRunRequest *v6;
  WFStingWorkflowRunnerClient *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithIdentifier:", v4);

  v6 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 0);
  -[WFWorkflowRunRequest setRunSource:](v6, "setRunSource:", CFSTR("watch-hardware"));
  -[WFWorkflowRunRequest setAllowsHandoff:](v6, "setAllowsHandoff:", 1);
  v9.receiver = self;
  v9.super_class = (Class)WFStingWorkflowRunnerClient;
  v7 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v9, sel_initWithDescriptor_runRequest_, v5, v6);

  return v7;
}

- (WFStingWorkflowRunnerClient)initWithStingWorkflow:(id)a3
{
  void *v4;
  WFStingWorkflowRunnerClient *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFStingWorkflowRunnerClient initWithWorkflowIdentifier:](self, "initWithWorkflowIdentifier:", v4);

  return v5;
}

@end
