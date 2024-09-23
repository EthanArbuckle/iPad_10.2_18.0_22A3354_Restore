@implementation INCodablePlacemarkAttributeMetadata(Workflow)

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_super v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&off_1EF7881F0;
  objc_msgSendSuper2(&v6, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "type") == 2)
  {
    v7 = CFSTR("CurrentLocationAccuracy");
    v8[0] = CFSTR("ThreeKilometers");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  return v2;
}

- (WFLocationParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  id CLPlacemarkClass;
  id v9;
  WFLocationValue *v10;
  WFLocationParameterState *v11;
  NSObject *v12;
  id v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CLPlacemarkClass = getCLPlacemarkClass();
  v9 = v6;
  if (!v9)
  {
LABEL_7:
    v15.receiver = a1;
    v15.super_class = (Class)&off_1EF7881F0;
    objc_msgSendSuper2(&v15, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
    v11 = (WFLocationParameterState *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "WFEnforceClass";
      v18 = 2114;
      v19 = v9;
      v20 = 2114;
      v21 = (id)objc_opt_class();
      v22 = 2114;
      v23 = CLPlacemarkClass;
      v13 = v21;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    goto LABEL_7;
  }
  v10 = -[WFLocationValue initWithPlacemark:]([WFLocationValue alloc], "initWithPlacemark:", v9);
  v11 = -[WFLocationParameterState initWithValue:]([WFLocationParameterState alloc], "initWithValue:", v10);

LABEL_8:
  return v11;
}

@end
