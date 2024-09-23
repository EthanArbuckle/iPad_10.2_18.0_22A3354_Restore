@implementation WFLinkDynamicOptionsEnumerationParameter

- (BOOL)allowsMultipleValues
{
  int allowsMultipleValues;
  void *v3;
  void *v4;

  allowsMultipleValues = self->_allowsMultipleValues;
  if (!self->_allowsMultipleValues)
  {
    -[WFLinkDynamicOptionsEnumerationParameter parameterMetadata](self, "parameterMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    allowsMultipleValues = objc_opt_isKindOfClass() & 1;

  }
  return allowsMultipleValues != 0;
}

- (LNActionParameterMetadata)parameterMetadata
{
  return self->_parameterMetadata;
}

- (void)setParameterMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_parameterMetadata, a3);
}

- (WFLinkDynamicOptionsEnumerationParameter)initWithDefinition:(id)a3
{
  id v4;
  WFLinkDynamicOptionsEnumerationParameter *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  WFPropertyListObject *serializedDefaultParameterOption;
  WFLinkDynamicOptionsEnumerationParameter *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFLinkDynamicOptionsEnumerationParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v14, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AllowsMultipleValues"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    v9 = objc_msgSend(v8, "BOOLValue");
    v5->_allowsMultipleValues = v9;
    objc_msgSend(v4, "objectForKey:", CFSTR("DefaultValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    serializedDefaultParameterOption = v5->_serializedDefaultParameterOption;
    v5->_serializedDefaultParameterOption = (WFPropertyListObject *)v10;

    v12 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedDefaultParameterOption, 0);
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
}

- (WFPropertyListObject)serializedDefaultParameterOption
{
  return self->_serializedDefaultParameterOption;
}

- (BOOL)dynamicOptionsSupportsSearch
{
  void *v2;
  BOOL v3;

  -[WFLinkDynamicOptionsEnumerationParameter parameterMetadata](self, "parameterMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dynamicOptionsSupport") == 2;

  return v3;
}

- (BOOL)alwaysShowsButton
{
  return 1;
}

- (BOOL)hidesSubtitleInEditor
{
  return 1;
}

- (BOOL)displaysMultipleValueEditor
{
  return -[WFLinkDynamicOptionsEnumerationParameter dynamicOptionsSupportsSearch](self, "dynamicOptionsSupportsSearch")
      || -[WFParameter isRangedSizeArray](self, "isRangedSizeArray");
}

- (BOOL)parameterStateIsValid:(id)a3
{
  return 1;
}

- (id)localizedTitleForButtonWithState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFLinkDynamicOptionsEnumerationParameter;
  -[WFEnumerationParameter localizedTitleForButtonWithState:](&v20, sel_localizedTitleForButtonWithState_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[WFLinkDynamicOptionsEnumerationParameter parameterMetadata](self, "parameterMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      WFLocalizedString(CFSTR("Loading…"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    -[WFLinkDynamicOptionsEnumerationParameter parameterMetadata](self, "parameterMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "memberValueType");
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v4;
        -[WFLinkDynamicOptionsEnumerationParameter parameterMetadata](self, "parameterMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "wf_parameterDefinitionWithParameterMetadata:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedTitleForLinkValue:", v19);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_4;
      }
    }

  }
  v6 = v5;
LABEL_3:
  v7 = v6;
LABEL_4:

  return v7;
}

- (id)statesForMultipleStateLabelWithStates:(id)a3
{
  return a3;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WFLinkDynamicOptionsEnumerationParameter parameterMetadata](self, "parameterMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[WFLinkDynamicOptionsEnumerationParameter action](self, "action"),
        (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_6;
  }
  v17 = (void *)v16;
  -[WFLinkDynamicOptionsEnumerationParameter action](self, "action");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "runningInToolKit");

  if (!v19)
  {
LABEL_6:
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __117__WFLinkDynamicOptionsEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke;
    v24[3] = &unk_1E7AEAE18;
    v25 = v13;
    v23.receiver = self;
    v23.super_class = (Class)WFLinkDynamicOptionsEnumerationParameter;
    -[WFDynamicEnumerationParameter createDialogRequestWithAttribution:defaultState:prompt:completionHandler:](&v23, sel_createDialogRequestWithAttribution_defaultState_prompt_completionHandler_, v10, v11, v12, v24);

    goto LABEL_7;
  }
  v20 = objc_alloc(MEMORY[0x1E0DC7C30]);
  -[WFParameter key](self, "key");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithParameterKey:attribution:prompt:", v21, v10, v12);

  (*((void (**)(id, void *))v13 + 2))(v13, v22);
LABEL_7:

}

- (void)createParameterStateFromDialogResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFLinkDynamicOptionsEnumerationParameter action](self, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "variableSource");
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
    v13 = v11;

    v14 = (void *)MEMORY[0x1E0D43E38];
    objc_msgSend(v8, "queryResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __101__WFLinkDynamicOptionsEnumerationParameter_createParameterStateFromDialogResponse_completionHandler___block_invoke;
    v16[3] = &unk_1E7AF8790;
    v16[4] = self;
    v17 = v7;
    objc_msgSend(v14, "produceValuesFromEncodedTypedValues:variableDataSource:associatedParameter:completionHandler:", v15, v13, self, v16);

    v12 = v8;
  }
  else
  {

    v18.receiver = self;
    v18.super_class = (Class)WFLinkDynamicOptionsEnumerationParameter;
    -[WFEnumerationParameter parameterStateFromDialogResponse:](&v18, sel_parameterStateFromDialogResponse_, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }

}

- (void)setAllowsMultipleValues:(BOOL)a3
{
  self->_allowsMultipleValues = a3;
}

- (WFAppIntentExecutionAction)action
{
  return (WFAppIntentExecutionAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void)setAction:(id)a3
{
  objc_storeWeak((id *)&self->_action, a3);
}

void __101__WFLinkDynamicOptionsEnumerationParameter_createParameterStateFromDialogResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  WFMultipleValueParameterState *v3;
  void *v4;
  uint64_t v5;
  WFLinkDynamicOptionSubstitutableState *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "if_map:", &__block_literal_global_2899);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "allowsMultipleValues"))
  {
    v3 = [WFMultipleValueParameterState alloc];
    objc_msgSend(v8, "if_map:", &__block_literal_global_135);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFMultipleValueParameterState initWithParameterStates:](v3, "initWithParameterStates:", v4);
  }
  else
  {
    if (!objc_msgSend(v8, "count"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v7 = 0;
      goto LABEL_7;
    }
    v6 = [WFLinkDynamicOptionSubstitutableState alloc];
    objc_msgSend(v8, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFVariableSubstitutableParameterState initWithValue:](v6, "initWithValue:", v4);
  }
  v7 = (void *)v5;

LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

WFLinkDynamicOptionSubstitutableState *__101__WFLinkDynamicOptionsEnumerationParameter_createParameterStateFromDialogResponse_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  WFLinkDynamicOptionSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFLinkDynamicOptionSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

id __101__WFLinkDynamicOptionsEnumerationParameter_createParameterStateFromDialogResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D441A8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:indentationLevel:", v3, 0);

  return v4;
}

void __117__WFLinkDynamicOptionsEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC7BE0]);
    objc_msgSend(v3, "setTitleLineLimit:", &unk_1E7B8AF90);
    objc_msgSend(v4, "setDisplayConfiguration:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (BOOL)wf_supportsSearch
{
  void *v2;
  BOOL v3;

  -[WFLinkDynamicOptionsEnumerationParameter parameterMetadata](self, "parameterMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dynamicOptionsSupport") == 2;

  return v3;
}

- (id)wf_pickerLocalizedTitleForState:(id)a3
{
  return (id)objc_msgSend(a3, "localizedTitle");
}

- (id)wf_pickerLocalizedSubtitleForState:(id)a3
{
  return (id)objc_msgSend(a3, "localizedSubtitle");
}

- (BOOL)wf_allowsMultipleSelection
{
  _BOOL4 v3;

  v3 = -[WFLinkDynamicOptionsEnumerationParameter allowsMultipleValues](self, "allowsMultipleValues");
  if (v3)
    LOBYTE(v3) = !-[WFLinkDynamicOptionsEnumerationParameter wf_supportsSearch](self, "wf_supportsSearch");
  return v3;
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 1;
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__WFLinkDynamicOptionsEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF7790;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", self, v7, v10);

}

void __109__WFLinkDynamicOptionsEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__WFLinkDynamicOptionsEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2;
  block[3] = &unk_1E7AF8378;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __109__WFLinkDynamicOptionsEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

@end
