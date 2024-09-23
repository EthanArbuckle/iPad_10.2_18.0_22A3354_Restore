@implementation WFWorkflowPickerParameter

- (WFWorkflowPickerParameter)initWithDefinition:(id)a3
{
  WFWorkflowPickerParameter *v3;
  WFWorkflowPickerParameter *v4;
  WFWorkflowPickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWorkflowPickerParameter;
  v3 = -[WFEnumerationParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)workflowForState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowPickerParameter workflow](self, "workflow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchingWorkflowInDatabase:containingWorkflow:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[WFWorkflowPickerParameter workflowForState:](self, "workflowForState:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenScale");
  objc_msgSend(v3, "attributionIconWithSize:scale:rounded:", 1, 38.0, 38.0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  -[WFWorkflowPickerParameter workflowForState:](self, "workflowForState:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributionIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  return 1;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _QWORD))a5;
  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "sortedVisibleWorkflowsByNameWithError:", &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  if (!v8)
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFWorkflowPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to load workflows in WFWorkflowPickerParameter: %@", buf, 0x16u);
    }

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__WFWorkflowPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v13[3] = &unk_1E7AED618;
  v13[4] = self;
  objc_msgSend(v8, "if_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithItems:", v11);
  v6[2](v6, v12, 0);

}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a4, "value", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowPickerParameter workflow](self, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameWithDatabase:containingWorkflow:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (WFWorkflow)workflow
{
  return (WFWorkflow *)objc_loadWeakRetained((id *)&self->_workflow);
}

- (void)setWorkflow:(id)a3
{
  objc_storeWeak((id *)&self->_workflow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workflow);
}

WFWorkflowParameterState *__91__WFWorkflowPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  WFWorkflowParameterStateDescriptor *v8;
  WFWorkflowParameterState *v9;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workflowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  v8 = -[WFWorkflowParameterStateDescriptor initWithWorkflowReference:isSelf:]([WFWorkflowParameterStateDescriptor alloc], "initWithWorkflowReference:isSelf:", v3, v7);
  v9 = -[WFVariableSubstitutableParameterState initWithValue:]([WFWorkflowParameterState alloc], "initWithValue:", v8);

  return v9;
}

@end
