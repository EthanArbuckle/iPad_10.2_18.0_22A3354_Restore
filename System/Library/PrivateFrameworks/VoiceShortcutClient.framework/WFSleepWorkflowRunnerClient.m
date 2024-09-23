@implementation WFSleepWorkflowRunnerClient

- (WFSleepWorkflowRunnerClient)initWithTrigger:(id)a3
{
  id v4;
  WFWorkflowDatabaseRunDescriptor *v5;
  void *v6;
  WFWorkflowDatabaseRunDescriptor *v7;
  WFWorkflowRunRequest *v8;
  WFSleepWorkflowRunnerClient *v9;
  objc_super v11;

  v4 = a3;
  v5 = [WFWorkflowDatabaseRunDescriptor alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:](v5, "initWithIdentifier:", v6);
  v8 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 0);
  -[WFWorkflowRunRequest setRunSource:](v8, "setRunSource:", CFSTR("sleep"));
  v11.receiver = self;
  v11.super_class = (Class)WFSleepWorkflowRunnerClient;
  v9 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v11, sel_initWithDescriptor_runRequest_, v7, v8);

  return v9;
}

@end
