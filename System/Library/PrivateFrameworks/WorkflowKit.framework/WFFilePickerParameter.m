@implementation WFFilePickerParameter

- (WFFilePickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFFilePickerParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *supportedTypes;
  uint64_t v17;
  NSArray *v18;
  WFFilePickerParameter *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFFilePickerParameter;
  v5 = -[WFParameter initWithDefinition:](&v21, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AllowsMultipleValues"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsMultipleSelection = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("ShowsFullContextualPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    WFEnforceClass(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldShowFullContextualPath = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("FilePickerSupportedTypes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    WFEnforceClass(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "if_compactMap:", &__block_literal_global_25912);
    v15 = objc_claimAutoreleasedReturnValue();
    supportedTypes = v5->_supportedTypes;
    v5->_supportedTypes = (NSArray *)v15;

    if (!-[NSArray count](v5->_supportedTypes, "count"))
    {
      v22[0] = *MEMORY[0x1E0CEC528];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v5->_supportedTypes;
      v5->_supportedTypes = (NSArray *)v17;

    }
    v19 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)WFFilePickerParameter;
    v6 = -[WFParameter parameterStateIsValid:](&v8, sel_parameterStateIsValid_, v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)displaysMultipleValueEditor
{
  return 0;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  WFFileParameterState *v6;
  void *v7;

  if (-[WFFilePickerParameter usesDefaultValue](self, "usesDefaultValue"))
  {
    -[WFFilePickerParameter workflow](self, "workflow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "workflowID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileValue defaultValueWithWorkflowID:](WFFileValue, "defaultValueWithWorkflowID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[WFVariableSubstitutableParameterState initWithValue:]([WFFileParameterState alloc], "initWithValue:", v5);
      -[WFVariableSubstitutableParameterState serializedRepresentation](v6, "serializedRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)usesDefaultValue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  char isKindOfClass;

  -[WFParameter definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("DefaultsToShortcutsFolder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  if ((v7 & 1) != 0)
    return 1;
  -[WFParameter definition](self, "definition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("AllowsMultipleValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  v13 = objc_msgSend(v12, "BOOLValue");
  -[WFParameter definition](self, "definition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("DefaultValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return v13 & isKindOfClass;
}

- (WFWorkflow)workflow
{
  return (WFWorkflow *)objc_loadWeakRetained((id *)&self->_workflow);
}

- (void)setWorkflow:(id)a3
{
  objc_storeWeak((id *)&self->_workflow, a3);
}

- (NSArray)supportedTypes
{
  return self->_supportedTypes;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  self->_allowsMultipleSelection = a3;
}

- (BOOL)shouldShowFullContextualPath
{
  return self->_shouldShowFullContextualPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);
  objc_destroyWeak((id *)&self->_workflow);
}

uint64_t __44__WFFilePickerParameter_initWithDefinition___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
}

@end
