@implementation WFLinkActionFileEntityParameterDefinition

- (BOOL)supportsDynamicOptions
{
  void *v2;
  BOOL v3;

  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dynamicOptionsSupport") == 2;

  return v3;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)supportedUTIs
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43AE8], objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEntityMetadata"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemProtocolMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D439E8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    objc_msgSend(v9, "supportedContentTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v9, "supportedContentTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "if_map:", &__block_literal_global_10170);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  return v4;
}

- (id)parameterDefinitionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)WFLinkActionFileEntityParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v8, sel_parameterDefinitionDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("FilePickerSupportedTypes");
  -[WFLinkActionFileEntityParameterDefinition supportedUTIs](self, "supportedUTIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "definitionByAddingEntriesInDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)WFLinkActionFileEntityParameterDefinition;
  -[WFLinkActionDynamicOptionsParameterDefinition linkValueFromParameterState:action:](&v28, sel_linkValueFromParameterState_action_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v11 = v6;
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v10 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bookmarkData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CBD8A8];
      objc_msgSend(v12, "bookmarkData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "filename");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "wf_fileWithBookmarkData:filename:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v7)
    {
      objc_msgSend(v7, "workflow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "workflowID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      objc_msgSend(v12, "resolveURLWithWorkflowID:error:", v17, &v27);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v10 = 0;
        goto LABEL_8;
      }
      v21 = (void *)v20;
      v25 = (void *)MEMORY[0x1E0CBD8A8];
      objc_msgSend(v12, "filename");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "wfFileType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "string");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "fileWithFileURL:filename:typeIdentifier:", v21, v22, v23);
      v26 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v26;
      if (!v26)
      {
        v10 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v17 = 0;
    }
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v17);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
LABEL_11:

    goto LABEL_12;
  }
  v10 = v8;
LABEL_12:

  return v10;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0CBD8A8];
  -[WFLinkActionFileEntityParameterDefinition supportedUTIs](self, "supportedUTIs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __157__WFLinkActionFileEntityParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
  v23[3] = &unk_1E7AF6960;
  v19 = v15;
  v23[4] = self;
  v24 = v19;
  LOBYTE(v16) = objc_msgSend(v16, "wf_processParameterValue:parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:", v12, v13, v17, 0, 0, v23);

  if ((v16 & 1) == 0)
  {
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __157__WFLinkActionFileEntityParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_2;
    v21[3] = &unk_1E7AF4448;
    v22 = v19;
    v20.receiver = self;
    v20.super_class = (Class)WFLinkActionFileEntityParameterDefinition;
    -[WFLinkActionDynamicOptionsParameterDefinition getLinkValueFromProcessedParameterValue:parameterState:permissionRequestor:runningFromToolKit:completionHandler:](&v20, sel_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler_, v12, v13, v14, v8, v21);

  }
}

- (id)parameterStateFromLinkValue:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  WFFileEntityParameterState *v11;
  void *v12;
  WFFileValue *v13;
  void *v14;
  void *v15;
  void *v16;
  WFFileValue *v17;
  void *v18;
  WFFileValue *v19;
  objc_super v20;

  v4 = a3;
  if (-[WFLinkActionFileEntityParameterDefinition supportsDynamicOptions](self, "supportsDynamicOptions"))
  {
    v20.receiver = self;
    v20.super_class = (Class)WFLinkActionFileEntityParameterDefinition;
    -[WFLinkActionDynamicOptionsParameterDefinition parameterStateFromLinkValue:](&v20, sel_parameterStateFromLinkValue_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  v11 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "_bookmarkData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [WFFileValue alloc];
      objc_msgSend(v7, "_bookmarkData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "filename");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "filename");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[WFFileValue initWithBookmarkData:filename:displayName:](v13, "initWithBookmarkData:filename:displayName:", v14, v15, v16);

    }
    else
    {
      objc_msgSend(v7, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_15;
      v19 = [WFFileValue alloc];
      objc_msgSend(v7, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[WFFileValue initWithURL:](v19, "initWithURL:", v14);
    }

    if (v17)
    {
      v11 = -[WFVariableSubstitutableParameterState initWithValue:]([WFFileEntityParameterState alloc], "initWithValue:", v17);

      goto LABEL_16;
    }
LABEL_15:
    v11 = 0;
  }
LABEL_16:

LABEL_17:
  return v11;
}

void __157__WFLinkActionFileEntityParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
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

uint64_t __157__WFLinkActionFileEntityParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__WFLinkActionFileEntityParameterDefinition_supportedUTIs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
