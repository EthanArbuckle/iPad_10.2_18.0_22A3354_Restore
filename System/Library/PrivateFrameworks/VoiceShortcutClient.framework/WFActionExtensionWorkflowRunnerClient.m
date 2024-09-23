@implementation WFActionExtensionWorkflowRunnerClient

- (WFActionExtensionWorkflowRunnerClient)initWithWorkflowIdentifier:(id)a3 input:(id)a4 javaScriptRunners:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFWorkflowDatabaseRunDescriptor *v11;
  WFWorkflowRunRequest *v12;
  void *v13;
  WFActionExtensionWorkflowRunnerClient *v14;
  uint64_t v15;
  NSDictionary *javaScriptRunners;
  WFActionExtensionWorkflowRunnerClient *v17;
  objc_super v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[WFWorkflowDatabaseRunDescriptor initWithIdentifier:]([WFWorkflowDatabaseRunDescriptor alloc], "initWithIdentifier:", v10);

  v12 = -[WFWorkflowRunRequest initWithInput:presentationMode:]([WFWorkflowRunRequest alloc], "initWithInput:presentationMode:", v9, 1);
  -[WFWorkflowRunRequest setRunSource:](v12, "setRunSource:", CFSTR("action_extension"));
  objc_msgSend(v8, "if_compactMap:", &__block_literal_global_5052);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunRequest setListenerEndpoints:](v12, "setListenerEndpoints:", v13);

  v19.receiver = self;
  v19.super_class = (Class)WFActionExtensionWorkflowRunnerClient;
  v14 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v19, sel_initWithDescriptor_runRequest_, v11, v12);
  if (v14)
  {
    v15 = objc_msgSend(v8, "copy");
    javaScriptRunners = v14->_javaScriptRunners;
    v14->_javaScriptRunners = (NSDictionary *)v15;

    v17 = v14;
  }

  return v14;
}

- (NSDictionary)javaScriptRunners
{
  return self->_javaScriptRunners;
}

- (void)setJavaScriptRunners:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javaScriptRunners, 0);
}

id __92__WFActionExtensionWorkflowRunnerClient_initWithWorkflowIdentifier_input_javaScriptRunners___block_invoke(int a1, id a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  id result;

  *a4 = objc_retainAutorelease(a2);
  objc_msgSend(a3, "endpoint");
  result = (id)objc_claimAutoreleasedReturnValue();
  *a5 = result;
  return result;
}

@end
