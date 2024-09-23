@implementation INCodableScalarAttribute(Workflow)

- (id)wf_objectClass
{
  void *v1;
  void *v3;

  switch(objc_msgSend(a1, "type"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
      objc_opt_class();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v1 = 0;
      break;
  }
  return v1;
}

- (id)wf_parameterClass
{
  void *v1;

  if (objc_msgSend(a1, "type") == 7)
  {
    objc_opt_class();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  id v23;
  objc_super v25;
  const __CFString *v26;
  __CFString *v27;
  _QWORD v28[4];
  _QWORD v29[4];
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v25.receiver = a1;
  v25.super_class = (Class)&off_1EF77FFB0;
  objc_msgSendSuper2(&v25, sel_wf_updatedParameterDefinition_parameterClass_localizer_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "supportsDynamicEnumeration") & 1) == 0 && objc_msgSend(a1, "type") == 7)
  {
    objc_msgSend(a1, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    WFEnforceClass(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = CFSTR("TextAlignment");
    v6 = objc_msgSend(v5, "isMultiline");
    v7 = CFSTR("Right");
    if (v6)
      v7 = CFSTR("Left");
    v33[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "localizedDefaultValue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v30 = CFSTR("DefaultValue");
      v31 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "definitionByAddingEntriesInDictionary:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    v28[0] = CFSTR("Multiline");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isMultiline"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v14;
    v28[1] = CFSTR("DisableAutocorrection");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "disableAutocorrect"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v15;
    v28[2] = CFSTR("DisableSmartDashes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "disableSmartDashes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v16;
    v28[3] = CFSTR("DisableSmartQuotes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "disableSmartQuotes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "definitionByAddingEntriesInDictionary:", v18);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v5, "capitalization");
    if (v19 <= 3)
    {
      v20 = off_1E7AF2760[v19];
      v26 = CFSTR("AutocapitalizationType");
      v27 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v22;
    }

  }
  v23 = v2;

  return v23;
}

- (id)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  WFVariableString *v10;
  WFVariableStringParameterState *v11;
  void *v12;
  uint64_t v13;
  WFMultipleValueParameterState *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "type") == 7)
  {
    if (objc_msgSend(a1, "modifier"))
    {
      v8 = objc_opt_class();
      WFEnforceClass(v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v9);
        v11 = -[WFVariableStringParameterState initWithVariableString:]([WFVariableStringParameterState alloc], "initWithVariableString:", v10);
LABEL_8:
        v12 = v11;

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      v13 = objc_opt_class();
      WFEnforceClass(v6, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v14 = [WFMultipleValueParameterState alloc];
        objc_msgSend(v9, "if_compactMap:", &__block_literal_global_36865);
        v10 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
        v11 = -[WFMultipleValueParameterState initWithParameterStates:](v14, "initWithParameterStates:", v10);
        goto LABEL_8;
      }
    }
    v12 = 0;
    goto LABEL_10;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&off_1EF77FFB0;
  objc_msgSendSuper2(&v16, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
}

- (uint64_t)wf_contentItemForValue:()Workflow
{
  return objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:");
}

@end
