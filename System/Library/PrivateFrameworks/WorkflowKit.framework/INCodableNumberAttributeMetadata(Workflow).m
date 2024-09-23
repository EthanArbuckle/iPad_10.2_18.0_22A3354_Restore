@implementation INCodableNumberAttributeMetadata(Workflow)

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

- (id)wf_parameterClass
{
  void *v1;

  if ((unint64_t)objc_msgSend(a1, "type") > 2)
  {
    v1 = 0;
  }
  else
  {
    objc_opt_class();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[2];
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v34.receiver = a1;
  v34.super_class = (Class)&off_1EF778D70;
  objc_msgSendSuper2(&v34, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_, a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "type");
  objc_msgSend(a1, "defaultValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (objc_msgSend(a1, "type"))
    {
      v45 = CFSTR("DefaultValue");
      v46 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "definitionByAddingEntriesInDictionary:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = CFSTR("DefaultValue");
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "definitionByAddingEntriesInDictionary:", v15);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
    }

    v10 = (void *)v14;
  }
  v43 = CFSTR("AllowsNegativeNumbers");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "supportsNegativeNumbers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "definitionByAddingEntriesInDictionary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v35 = CFSTR("AllowsDecimalNumbers");
    v31 = objc_msgSend(v8, "valueType");
    v32 = MEMORY[0x1E0C9AAA0];
    if (v31 == 21)
      v32 = MEMORY[0x1E0C9AAB0];
    v36 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "definitionByAddingEntriesInDictionary:", v25);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(a1, "minimumValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "maximumValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v41 = CFSTR("MinimumValue");
    v42 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "definitionByAddingEntriesInDictionary:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v22;
  }
  if (v20)
  {
    v39 = CFSTR("MaximumValue");
    v40 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "definitionByAddingEntriesInDictionary:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v24;
  }

  if (v11 == 1)
  {
    v37[0] = CFSTR("StepperDescription");
    objc_msgSend(v8, "localizedDisplayNameWithLocalizer:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = CFSTR("StepperNoun");
    v38[0] = v25;
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "localizedDisplayNameWithLocalizer:", v9);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", CFSTR("%@: %@"), v27, CFSTR("%ld"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "definitionByAddingEntriesInDictionary:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v27;
LABEL_16:

    v18 = (void *)v30;
  }

  return v18;
}

- (WFNumberSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  WFNumberSubstitutableState *v10;
  NSObject *v11;
  id v12;
  WFNumberStringSubstitutableState *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (!v9)
  {
LABEL_8:
    v16.receiver = a1;
    v16.super_class = (Class)&off_1EF778D70;
    objc_msgSendSuper2(&v16, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
    v10 = (WFNumberSubstitutableState *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "WFEnforceClass";
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = (id)objc_opt_class();
      v23 = 2114;
      v24 = v8;
      v12 = v22;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "type"))
  {
    v10 = -[WFNumberSubstitutableState initWithNumber:]([WFNumberSubstitutableState alloc], "initWithNumber:", v9);
  }
  else
  {
    v13 = [WFNumberStringSubstitutableState alloc];
    objc_msgSend(v9, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFNumberStringSubstitutableState initWithValue:](v13, "initWithValue:", v14);

  }
LABEL_11:

  return v10;
}

@end
