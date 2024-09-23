@implementation WFLinkActionArrayParameterDefinition

- (WFLinkActionArrayParameterDefinition)initWithMemberValueType:(id)a3 parameterMetadata:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  WFLinkActionArrayParameterDefinition *v10;
  objc_super v12;

  v6 = (objc_class *)MEMORY[0x1E0D43BD0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithMemberValueType:", v8);

  v12.receiver = self;
  v12.super_class = (Class)WFLinkActionArrayParameterDefinition;
  v10 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v12, sel_initWithValueType_parameterMetadata_, v9, v7);

  return v10;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  WFLinkActionArrayParameterDefinition *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "parameterStates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v12 = v10;

    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __75__WFLinkActionArrayParameterDefinition_linkValueFromParameterState_action___block_invoke;
    v18 = &unk_1E7AF4420;
    v19 = self;
    v20 = v7;
    objc_msgSend(v12, "if_compactMap:", &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v13, v15, v16, v17, v18, v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (id)linkValueFromProcessedParameterValue:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  -[WFLinkActionParameterDefinition valueType](self, "valueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "objectIsMemberOfType:", v4);

  if ((v6 & 1) == 0)
  {
    getWFAppIntentsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      -[WFLinkActionParameterDefinition valueType](self, "valueType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[WFLinkActionArrayParameterDefinition linkValueFromProcessedParameterValue:]";
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v12;

    }
    goto LABEL_7;
  }
  v7 = objc_alloc(MEMORY[0x1E0D43E38]);
  -[WFLinkActionParameterDefinition valueType](self, "valueType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "memberValueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithValues:memberValueType:", v4, v9);

LABEL_8:
  return v10;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[5];
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v12;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_2;
    v23[3] = &unk_1E7AF4470;
    v23[4] = self;
    v24 = v13;
    v25 = v14;
    v26 = a6;
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_4;
    v21[3] = &unk_1E7AF8790;
    v21[4] = self;
    v22 = v15;
    v18 = v15;
    objc_msgSend(v16, "if_mapAsynchronously:completionHandler:", v23, v21);

    v19 = v16;
  }
  else
  {

    -[WFLinkActionArrayParameterDefinition memberParameterDefinition](self, "memberParameterDefinition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
    v27[3] = &unk_1E7AF8790;
    v27[4] = self;
    v28 = v15;
    v20 = v15;
    objc_msgSend(v19, "getLinkArrayValuesFromProcessedParameterValue:parameterState:permissionRequestor:completionHandler:", v16, v13, v14, v27);

  }
}

- (Class)parameterClass
{
  void *v2;
  void *v3;

  -[WFLinkActionArrayParameterDefinition memberParameterDefinition](self, "memberParameterDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameterClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)parameterDefinitionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  BOOL (*v32)(uint64_t, uint64_t);
  void *v33;
  WFLinkActionArrayParameterDefinition *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];
  _QWORD v41[2];
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[10];

  v44[8] = *MEMORY[0x1E0C80C00];
  -[WFLinkActionArrayParameterDefinition memberParameterDefinition](self, "memberParameterDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterDefinitionDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43AE0], objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("DefaultValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[WFLinkActionArrayParameterDefinition defaultSerializedRepresentationFromParameterMetadataDefaultValue:](self, "defaultSerializedRepresentationFromParameterMetadataDefaultValue:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v42 = CFSTR("DefaultValue");
      v43 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "definitionByAddingEntriesInDictionary:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }

  }
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43AA0], objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_dictionaryWithNonEmptyValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C9AAB0];
  if (v12)
  {
    v14 = *MEMORY[0x1E0D43960];
    v44[0] = *MEMORY[0x1E0D43968];
    v44[1] = v14;
    v15 = *MEMORY[0x1E0D43950];
    v44[2] = *MEMORY[0x1E0D43958];
    v44[3] = v15;
    v16 = *MEMORY[0x1E0D43920];
    v44[4] = *MEMORY[0x1E0D43948];
    v44[5] = v16;
    v17 = *MEMORY[0x1E0D43930];
    v44[6] = *MEMORY[0x1E0D43938];
    v44[7] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __69__WFLinkActionArrayParameterDefinition_parameterDefinitionDictionary__block_invoke;
    v36[3] = &unk_1E7AF4498;
    v36[4] = self;
    v20 = v11;
    v37 = v20;
    objc_msgSend(v18, "if_compactMap:", v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v19;
    v31 = 3221225472;
    v32 = __69__WFLinkActionArrayParameterDefinition_parameterDefinitionDictionary__block_invoke_2;
    v33 = &unk_1E7AF44C0;
    v34 = self;
    v35 = v20;
    objc_msgSend(v18, "if_objectsPassingTest:", &v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v21, v22, v30, v31, v32, v33, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = CFSTR("RangedSizeArray");
    v40[1] = CFSTR("ArraySizeRangesForWidgetFamily");
    v41[0] = v13;
    v41[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "definitionByAddingEntriesInDictionary:", v24);
    v25 = v13;
    v26 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v26;
    v13 = v25;
  }
  v38 = CFSTR("AllowsMultipleValues");
  v39 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "definitionByAddingEntriesInDictionary:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)arraySizeRangeForWidgetFamily:(id)a3 withSizes:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  id v24;
  void *v26;
  void *v27;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionArrayParameterDefinition.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("widgetFamily"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionArrayParameterDefinition.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sizes"));

LABEL_3:
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v17 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D43948]);
    v18 = (void *)*MEMORY[0x1E0D43950];
    if ((v17 & 1) != 0)
      goto LABEL_13;
    v19 = objc_msgSend(v7, "isEqualToString:", v18);
    v18 = (void *)*MEMORY[0x1E0D43958];
    if ((v19 & 1) != 0)
      goto LABEL_13;
    v20 = objc_msgSend(v7, "isEqualToString:", v18);
    v18 = (void *)*MEMORY[0x1E0D43960];
    if ((v20 & 1) != 0)
      goto LABEL_13;
    if (!objc_msgSend(v7, "isEqualToString:", v18))
    {
      v21 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D43938]);
      v18 = (void *)*MEMORY[0x1E0D43920];
      if ((v21 & 1) != 0)
        goto LABEL_13;
      v22 = objc_msgSend(v7, "isEqualToString:", v18);
      v18 = (void *)*MEMORY[0x1E0D43928];
      if ((v22 & 1) != 0)
        goto LABEL_13;
      v23 = objc_msgSend(v7, "isEqualToString:", v18);
      v18 = (void *)*MEMORY[0x1E0D43930];
      if ((v23 & 1) != 0)
        goto LABEL_13;
      if (!objc_msgSend(v7, "isEqualToString:", v18))
      {
        v16 = 0;
        goto LABEL_14;
      }
    }
    v18 = (void *)*MEMORY[0x1E0D43968];
LABEL_13:
    v24 = v18;
    -[WFLinkActionArrayParameterDefinition arraySizeRangeForWidgetFamily:withSizes:](self, "arraySizeRangeForWidgetFamily:withSizes:", v24, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  objc_msgSend(v10, "min");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(v11, "max");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue") - v13 + 1;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v16;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
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
  -[WFLinkActionParameterDefinition valueType](self, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "memberValueType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_objectsOfClass:", objc_msgSend(v8, "objectClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFLinkActionArrayParameterDefinition memberParameterDefinition](self, "memberParameterDefinition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultSerializedRepresentationFromParameterMetadataDefaultValues:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __105__WFLinkActionArrayParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke;
      v15[3] = &unk_1E7AF7718;
      v16 = v10;
      objc_msgSend(v9, "if_compactMap:", v15);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  WFMultipleValueParameterState *v8;
  _QWORD v10[5];

  objc_msgSend(a3, "value");
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

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__WFLinkActionArrayParameterDefinition_parameterStateFromLinkValue___block_invoke;
  v10[3] = &unk_1E7AF4500;
  v10[4] = self;
  objc_msgSend(v6, "if_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[WFMultipleValueParameterState initWithParameterStates:]([WFMultipleValueParameterState alloc], "initWithParameterStates:", v7);
  else
    v8 = 0;

  return v8;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFLinkActionArrayParameterDefinition memberParameterDefinition](self, "memberParameterDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitleForLinkValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)memberParameterDefinition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFLinkActionParameterDefinition valueType](self, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "memberValueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_parameterDefinitionWithParameterMetadata:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __68__WFLinkActionArrayParameterDefinition_parameterStateFromLinkValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "memberParameterDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterStateFromLinkValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __105__WFLinkActionArrayParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "defaultSerializedRepresentationFromParameterMetadataDefaultValue:", a2);
}

uint64_t __69__WFLinkActionArrayParameterDefinition_parameterDefinitionDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "arraySizeRangeForWidgetFamily:withSizes:", a2, *(_QWORD *)(a1 + 40));
}

BOOL __69__WFLinkActionArrayParameterDefinition_parameterDefinitionDictionary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "arraySizeRangeForWidgetFamily:withSizes:", a2, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void (*v13)(uint64_t, _QWORD, id);
  id v14;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v14 = v5;
  if (v5)
  {
    v7 = (objc_class *)MEMORY[0x1E0D43E38];
    v8 = a3;
    v9 = [v7 alloc];
    objc_msgSend(*(id *)(a1 + 32), "valueType");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "memberValueType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithValues:memberValueType:", v14, v11);
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v12, v8);

  }
  else
  {
    v13 = *(void (**)(uint64_t, _QWORD, id))(v6 + 16);
    v10 = a3;
    v13(v6, 0, v10);
  }

}

void __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "memberParameterDefinition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(unsigned __int8 *)(a1 + 56);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_3;
  v14[3] = &unk_1E7AF4448;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v9, "getLinkValueFromProcessedParameterValue:parameterState:permissionRequestor:runningFromToolKit:completionHandler:", v8, v10, v11, v12, v14);

}

void __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "linkValueWithValue:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

uint64_t __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __75__WFLinkActionArrayParameterDefinition_linkValueFromParameterState_action___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "memberParameterDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkValueFromParameterState:action:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
