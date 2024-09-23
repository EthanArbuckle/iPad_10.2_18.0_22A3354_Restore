@implementation WFMenuBarWorkflowRunnerClient

- (WFMenuBarWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3
{
  id v4;
  WFWorkflowDatabaseRunDescriptor *v5;
  WFWorkflowRunRequest *v6;
  WFMenuBarWorkflowRunnerClient *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithIdentifier:", v4);

  v6 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 1);
  -[WFWorkflowRunRequest setRunSource:](v6, "setRunSource:", CFSTR("menu_bar"));
  v9.receiver = self;
  v9.super_class = (Class)WFMenuBarWorkflowRunnerClient;
  v7 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v9, sel_initWithDescriptor_runRequest_, v5, v6);

  return v7;
}

@end
