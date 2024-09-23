@implementation WFWidgetWorkflowRunnerClient

- (WFWidgetWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3 location:(int64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  WFWorkflowDatabaseRunDescriptor *v10;
  WFWorkflowRunRequest *v11;
  WFWidgetWorkflowRunnerClient *v12;
  objc_super v14;

  v6 = a3;
  +[WFDevice currentDevice](WFDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSystemAperture");
  if (a4 == 1)
    v9 = 1;
  else
    v9 = v8;

  v10 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithIdentifier:", v6);
  v11 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", 0, v9);
  -[WFWorkflowRunRequest setRunSource:](v11, "setRunSource:", CFSTR("widget"));
  v14.receiver = self;
  v14.super_class = (Class)WFWidgetWorkflowRunnerClient;
  v12 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v14, sel_initWithDescriptor_runRequest_, v10, v11);

  return v12;
}

@end
