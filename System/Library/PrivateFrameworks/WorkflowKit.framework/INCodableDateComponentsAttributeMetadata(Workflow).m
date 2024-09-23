@implementation INCodableDateComponentsAttributeMetadata(Workflow)

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  id v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = a1;
  v9.super_class = (Class)&off_1EF776EA0;
  objc_msgSendSuper2(&v9, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "type");
  if (v3 <= 2 && (v4 = *off_1E7AEDB00[v3]) != 0)
  {
    v5 = v4;
    v10 = CFSTR("HintDateMode");
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v2;
  }

  return v7;
}

- (WFDateFieldParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  WFVariableString *v12;
  WFDateFieldParameterState *v13;
  NSObject *v14;
  id v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (!v9)
  {
LABEL_7:
    v17.receiver = a1;
    v17.super_class = (Class)&off_1EF776EA0;
    objc_msgSendSuper2(&v17, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
    v13 = (WFDateFieldParameterState *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "WFEnforceClass";
      v20 = 2114;
      v21 = v9;
      v22 = 2114;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v8;
      v15 = v23;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_intents_readableTitleWithLocalizer:metadata:", v10, a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v11);
  v13 = -[WFVariableStringParameterState initWithVariableString:]([WFDateFieldParameterState alloc], "initWithVariableString:", v12);

LABEL_8:
  return v13;
}

@end
