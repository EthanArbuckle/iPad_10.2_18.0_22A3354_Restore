@implementation WFAccessibilityWorkflowRunnerClient

- (WFAccessibilityWorkflowRunnerClient)initWithAccessibilityWorkflow:(id)a3
{
  void *v4;
  WFAccessibilityWorkflowRunnerClient *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFAccessibilityWorkflowRunnerClient initWithWorkflowIdentifier:](self, "initWithWorkflowIdentifier:", v4);

  return v5;
}

- (WFAccessibilityWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3
{
  id v4;
  WFWorkflowDatabaseRunDescriptor *v5;
  WFWorkflowRunRequest *v6;
  WFAccessibilityWorkflowRunnerClient *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithIdentifier:", v4);

  v6 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, 1);
  -[WFWorkflowRunRequest setRunSource:](v6, "setRunSource:", CFSTR("accessibility_gesture"));
  v9.receiver = self;
  v9.super_class = (Class)WFAccessibilityWorkflowRunnerClient;
  v7 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v9, sel_initWithDescriptor_runRequest_, v5, v6);

  return v7;
}

@end
