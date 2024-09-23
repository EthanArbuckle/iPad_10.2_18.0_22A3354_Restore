@implementation WFLinkActionBoolParameterDefinition

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)parameterDefinitionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)objc_opt_new();
  -[WFLinkActionBoolParameterDefinition trueDisplayName](self, "trueDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("OnDisplayName"));

  -[WFLinkActionBoolParameterDefinition falseDisplayName](self, "falseDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("OffDisplayName"));

  v11.receiver = self;
  v11.super_class = (Class)WFLinkActionBoolParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v11, sel_parameterDefinitionDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "definitionByAddingEntriesInDictionary:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)trueDisplayName
{
  return -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43A90], objc_opt_class());
}

- (id)falseDisplayName
{
  return -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43A88], objc_opt_class());
}

- (WFLinkActionBoolParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionBoolParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D90];
  v5 = a3;
  objc_msgSend(v4, "BOOLValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionBoolParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {

    v12.receiver = self;
    v12.super_class = (Class)WFLinkActionBoolParameterDefinition;
    -[WFLinkActionParameterDefinition linkValueFromParameterState:action:](&v12, sel_linkValueFromParameterState_action_, v8, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  objc_super v14;
  objc_super v15;

  v8 = a6;
  if (a3 || a6)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFLinkActionBoolParameterDefinition;
    v13 = a7;
    -[WFLinkActionParameterDefinition getLinkValueFromProcessedParameterValue:parameterState:permissionRequestor:runningFromToolKit:completionHandler:](&v14, sel_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler_, a3, a4, a5, v8, v13);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFLinkActionBoolParameterDefinition;
    v12 = a7;
    -[WFLinkActionParameterDefinition linkValueWithValue:](&v15, sel_linkValueWithValue_, MEMORY[0x1E0C9AAA0]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a7 + 2))(v12, v13, 0);

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
  WFBooleanSubstitutableState *v10;

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
    v10 = -[WFBooleanSubstitutableState initWithBoolValue:]([WFBooleanSubstitutableState alloc], "initWithBoolValue:", objc_msgSend(v4, "BOOLValue"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;

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

  v7 = objc_msgSend(v6, "BOOLValue");
  if (!v7)
  {
    -[WFLinkActionBoolParameterDefinition falseDisplayName](self, "falseDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[WFLinkActionBoolParameterDefinition falseDisplayName](self, "falseDisplayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v12 = CFSTR("False");
LABEL_14:
    WFLocalizedString(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[WFLinkActionBoolParameterDefinition trueDisplayName](self, "trueDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v12 = CFSTR("True");
    goto LABEL_14;
  }
  -[WFLinkActionBoolParameterDefinition trueDisplayName](self, "trueDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v10 = v9;
  objc_msgSend(v9, "wf_localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v11;
}

@end
