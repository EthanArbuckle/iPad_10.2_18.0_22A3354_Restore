@implementation INCodableURLAttributeMetadata(Workflow)

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

- (WFURLStringParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  WFVariableString *v10;
  void *v11;
  WFVariableString *v12;
  WFURLStringParameterState *v13;
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
    v17.super_class = (Class)&off_1EF780198;
    objc_msgSendSuper2(&v17, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
    v13 = (WFURLStringParameterState *)objc_claimAutoreleasedReturnValue();
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
  v10 = [WFVariableString alloc];
  objc_msgSend(v9, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFVariableString initWithString:](v10, "initWithString:", v11);

  v13 = -[WFVariableStringParameterState initWithVariableString:]([WFURLStringParameterState alloc], "initWithVariableString:", v12);
LABEL_8:

  return v13;
}

@end
