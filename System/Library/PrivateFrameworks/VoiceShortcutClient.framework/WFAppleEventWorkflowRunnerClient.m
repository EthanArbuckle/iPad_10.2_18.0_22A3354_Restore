@implementation WFAppleEventWorkflowRunnerClient

- (WFAppleEventWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3 input:(id)a4 parentIdentifier:(id)a5
{
  id v7;
  id v8;
  WFWorkflowDatabaseRunDescriptor *v9;
  WFWorkflowRunRequest *v10;
  WFAppleEventWorkflowRunnerClient *v11;
  objc_super v13;

  v7 = a4;
  v8 = a3;
  v9 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithIdentifier:", v8);

  v10 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", v7, 1);
  -[WFWorkflowRunRequest setRunSource:](v10, "setRunSource:", CFSTR("apple-event"));
  -[WFWorkflowRunRequest setAllowsDialogNotifications:](v10, "setAllowsDialogNotifications:", 0);
  -[WFWorkflowRunRequest setOutputBehavior:](v10, "setOutputBehavior:", 0);
  v13.receiver = self;
  v13.super_class = (Class)WFAppleEventWorkflowRunnerClient;
  v11 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v13, sel_initWithDescriptor_runRequest_, v9, v10);

  return v11;
}

@end
