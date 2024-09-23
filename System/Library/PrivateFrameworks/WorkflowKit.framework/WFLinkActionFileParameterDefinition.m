@implementation WFLinkActionFileParameterDefinition

- (WFLinkActionFileParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionFileParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D10];
  v5 = a3;
  objc_msgSend(v4, "fileValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionFileParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)localizedTitleForLinkValue:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)parameterDefinitionDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[WFLinkActionFileParameterDefinition supportedUTIs](self, "supportedUTIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WFLinkActionFileParameterDefinition;
    -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v10, sel_parameterDefinitionDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("FilePickerSupportedTypes");
    -[WFLinkActionFileParameterDefinition supportedUTIs](self, "supportedUTIs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "definitionByAddingEntriesInDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFLinkActionFileParameterDefinition;
    -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v11, sel_parameterDefinitionDictionary);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v15 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bookmarkData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CBD8A8];
    objc_msgSend(v9, "bookmarkData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_fileWithBookmarkData:filename:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v7)
  {
    objc_msgSend(v7, "workflow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "workflowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    objc_msgSend(v9, "resolveURLWithWorkflowID:error:", v14, &v25);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v15 = 0;
      goto LABEL_6;
    }
    v19 = (void *)v18;
    v20 = (void *)MEMORY[0x1E0CBD8A8];
    objc_msgSend(v9, "filename");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "wfFileType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fileWithFileURL:filename:typeIdentifier:", v19, v21, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v24;
    if (!v24)
    {
      v15 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v14 = 0;
  }
  -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_7:
LABEL_9:

  return v15;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a7;
  v13 = v12;
  if (v10)
  {
    v14 = (void *)MEMORY[0x1E0CBD8A8];
    -[WFLinkActionFileParameterDefinition supportedUTIs](self, "supportedUTIs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __151__WFLinkActionFileParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
    v16[3] = &unk_1E7AF6960;
    v16[4] = self;
    v17 = v13;
    objc_msgSend(v14, "wf_processParameterValue:parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:", v10, v11, v15, 0, 0, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  char isKindOfClass;
  void *v12;
  id v13;
  WFFileParameterState *v14;
  void *v15;
  WFFileValue *v16;
  void *v17;
  void *v18;
  void *v19;
  WFFileValue *v20;
  WFFileValue *v21;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFLinkActionParameterDefinition valueType](self, "valueType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "objectIsMemberOfType:", v4);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99768];
      -[WFLinkActionParameterDefinition valueType](self, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    v14 = 0;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_16;
    objc_msgSend(v10, "_bookmarkData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = [WFFileValue alloc];
      objc_msgSend(v10, "_bookmarkData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filename");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[WFFileValue initWithBookmarkData:filename:displayName:](v16, "initWithBookmarkData:filename:displayName:", v17, v18, v19);

    }
    else
    {
      objc_msgSend(v10, "fileURL");
      v14 = (WFFileParameterState *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_16:

        goto LABEL_17;
      }
      v21 = [WFFileValue alloc];
      objc_msgSend(v10, "fileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[WFFileValue initWithURL:](v21, "initWithURL:", v17);
    }

    if (v20)
    {
      v14 = -[WFVariableSubstitutableParameterState initWithValue:]([WFFileParameterState alloc], "initWithValue:", v20);

    }
    else
    {
      v14 = 0;
    }
    goto LABEL_16;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (NSArray)supportedUTIs
{
  return (NSArray *)-[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43AE8], objc_opt_class());
}

void __151__WFLinkActionFileParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "linkValueWithValue:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40));
  }
}

@end
