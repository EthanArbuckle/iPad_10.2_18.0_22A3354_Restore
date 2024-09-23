@implementation WFMicaWorkflowRunnerClient

- (WFMicaWorkflowRunnerClient)initWithWorkflowName:(id)a3
{
  id v4;
  WFWorkflowDatabaseRunDescriptor *v5;
  WFWorkflowRunRequest *v6;
  WFMicaWorkflowRunnerClient *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[WFWorkflowDatabaseRunDescriptor initWithName:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithName:", v4);

  v6 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 0);
  -[WFWorkflowRunRequest setRunSource:](v6, "setRunSource:", CFSTR("mica"));
  v9.receiver = self;
  v9.super_class = (Class)WFMicaWorkflowRunnerClient;
  v7 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v9, sel_initWithDescriptor_runRequest_, v5, v6);

  return v7;
}

@end
