@implementation WFLinkActionDynamicOptionsParameterDefinition

- (WFLinkActionDynamicOptionsParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  WFLinkActionDynamicOptionsParameterDefinition *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "valueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "memberValueType");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionDynamicOptionsParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v5, v4);

  return v7;
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
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEnumerationMetadata"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __114__WFLinkActionDynamicOptionsParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke;
    v19[3] = &unk_1E7AF89A0;
    v7 = v4;
    v20 = v7;
    objc_msgSend(v6, "if_firstObjectPassingTest:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D43D18]);
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithEnumerationIdentifier:", v10);

      v12 = objc_alloc(MEMORY[0x1E0D43E38]);
      objc_msgSend(v8, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithValue:valueType:displayRepresentation:", v13, v11, v14);

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441A8]), "initWithValue:indentationLevel:", v15, 0);
      +[WFLinkDynamicOptionSubstitutableState serializedRepresentationFromValue:](WFLinkDynamicOptionSubstitutableState, "serializedRepresentationFromValue:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "valueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_parameterDefinitionWithParameterMetadata:dynamicOptionsSupport:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedTitleForLinkValue:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  void (**v8)(id, id, _QWORD);
  char isKindOfClass;
  void *v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = (void (**)(id, id, _QWORD))a7;
  if (v13)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v10 = v13;
    else
      v10 = 0;
    v11 = v10;
    if ((isKindOfClass & 1) != 0)
      v12 = v13;
    else
      v12 = 0;
    v8[2](v8, v12, 0);

  }
  else
  {
    v8[2](v8, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  WFLinkDynamicOptionSubstitutableState *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFLinkDynamicOptionSubstitutableState *v19;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFLinkActionParameterDefinition valueType](self, "valueType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "objectIsMemberOfType:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99768];
      -[WFLinkActionParameterDefinition valueType](self, "valueType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441A8]), "initWithValue:indentationLevel:", v4, 0);
    v12 = [WFLinkDynamicOptionSubstitutableState alloc];
    objc_msgSend(v11, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wf_localizedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wf_localizedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "wf_image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFLinkDynamicOptionSubstitutableState initWithValue:localizedTitle:localizedSubtitle:image:](v12, "initWithValue:localizedTitle:localizedSubtitle:image:", v11, v14, v16, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __114__WFLinkActionDynamicOptionsParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
