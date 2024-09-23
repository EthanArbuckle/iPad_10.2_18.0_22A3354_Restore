@implementation WFLinkActionEnumParameterDefinition

- (WFLinkActionEnumParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  WFLinkActionEnumParameterDefinition *v12;
  objc_super v14;

  v5 = a3;
  objc_msgSend(v5, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    objc_msgSend(v5, "valueType");
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

    objc_msgSend(v9, "memberValueType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v11 = v10;
      v6 = v11;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionEnumParameterDefinition.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueType"));
      v6 = 0;
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)WFLinkActionEnumParameterDefinition;
  v12 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v14, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v12;
}

- (id)parameterDefinitionDictionary
{
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  WFLinkActionEnumParameterDefinition *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[WFLinkActionEnumParameterDefinition enumMetadata](self, "enumMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43AF0], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_opt_new();
  v34 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  v32 = (void *)objc_opt_new();
  v30 = v3;
  v31 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v3, "cases");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v4, "containsObject:", v7);

          if (!v8)
            continue;
        }
        objc_msgSend(v6, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "wf_localizedDisplayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "wf_localizedSubtitle");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (__CFString *)v11;
        else
          v13 = &stru_1E7AFA810;
        v14 = v13;

        objc_msgSend(v6, "wf_symbolName");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (__CFString *)v15;
        else
          v17 = &stru_1E7AFA810;
        v18 = v17;

        objc_msgSend(v6, "displayRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "image");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "wf_image");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = v21;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;

        if (v9 && v10)
        {
          objc_msgSend(v35, "addObject:", v9);
          objc_msgSend(v34, "addObject:", v10);
          objc_msgSend(v33, "addObject:", v14);
          objc_msgSend(v32, "addObject:", v18);
          objc_msgSend(v31, "addObject:", v24);
        }

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v38);
  }

  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v25, "setValue:forKey:", v35, CFSTR("Items"));
  objc_msgSend(v25, "setValue:forKey:", v34, CFSTR("ItemDisplayNames"));
  objc_msgSend(v25, "setValue:forKey:", v33, CFSTR("ItemSubtitles"));
  objc_msgSend(v25, "setValue:forKey:", v32, CFSTR("ItemIconNames"));
  objc_msgSend(v25, "setValue:forKey:", v31, CFSTR("ItemImages"));
  v39.receiver = v29;
  v39.super_class = (Class)WFLinkActionEnumParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v39, sel_parameterDefinitionDictionary);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "definitionByAddingEntriesInDictionary:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)enumMetadata
{
  return -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEnumerationMetadata"), objc_opt_class());
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFLinkActionEnumParameterDefinition enumMetadata](self, "enumMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__WFLinkActionEnumParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke;
    v11[3] = &unk_1E7AF89A0;
    v12 = v4;
    v7 = v4;
    objc_msgSend(v6, "if_firstObjectPassingTest:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {

    v9 = 0;
  }

  return v9;
}

uint64_t __104__WFLinkActionEnumParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  void (**v9)(id, void *, _QWORD);
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = (void (**)(id, void *, _QWORD))a7;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v13;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v12, 0);
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
  WFLinkEnumerationSubstitutableState *v14;

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
    if ((isKindOfClass & 1) != 0)
      v14 = -[WFVariableSubstitutableParameterState initWithValue:]([WFLinkEnumerationSubstitutableState alloc], "initWithValue:", v10);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "displayRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[WFLinkActionEnumParameterDefinition enumMetadata](self, "enumMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__WFLinkActionEnumParameterDefinition_localizedTitleForLinkValue___block_invoke;
    v13[3] = &unk_1E7AF89A0;
    v14 = v4;
    objc_msgSend(v10, "if_firstObjectPassingTest:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_localizedDisplayName");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __66__WFLinkActionEnumParameterDefinition_localizedTitleForLinkValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

@end
