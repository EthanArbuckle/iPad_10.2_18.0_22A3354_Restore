@implementation INCodableBooleanAttributeMetadata(Workflow)

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
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_super v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v24.receiver = a1;
  v24.super_class = (Class)&off_1EF77ADA8;
  objc_msgSendSuper2(&v24, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_, a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultValue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = MEMORY[0x1E0C9AAA0];
  v29 = CFSTR("DefaultValue");
  v30[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "definitionByAddingEntriesInDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "localizedTrueDisplayNameWithLocalizer:", v8);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
  {
    v27 = CFSTR("OnDisplayName");
    v28 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "definitionByAddingEntriesInDictionary:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v18;
  }
  objc_msgSend(a1, "localizedFalseDisplayNameWithLocalizer:", v8);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
  {
    v25 = CFSTR("OffDisplayName");
    v26 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "definitionByAddingEntriesInDictionary:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v22;
  }

  return v14;
}

- (WFBooleanSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  WFBooleanSubstitutableState *v10;
  NSObject *v11;
  id v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (!v9)
  {
LABEL_7:
    v14.receiver = a1;
    v14.super_class = (Class)&off_1EF77ADA8;
    objc_msgSendSuper2(&v14, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
    v10 = (WFBooleanSubstitutableState *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "WFEnforceClass";
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v8;
      v12 = v20;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    goto LABEL_7;
  }
  v10 = -[WFNumberSubstitutableState initWithNumber:]([WFBooleanSubstitutableState alloc], "initWithNumber:", v9);

LABEL_8:
  return v10;
}

@end
