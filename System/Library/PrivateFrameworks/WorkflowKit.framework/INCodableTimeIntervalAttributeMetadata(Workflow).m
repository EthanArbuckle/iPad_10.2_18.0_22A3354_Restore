@implementation INCodableTimeIntervalAttributeMetadata(Workflow)

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
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v1 = a1;
  v16[4] = *MEMORY[0x1E0C80C00];
  v14.receiver = a1;
  v14.super_class = (Class)&off_1EF77EFD0;
  objc_msgSendSuper2(&v14, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unitNamesWithMinimumUnit:maximumUnit:", objc_msgSend(v1, "minimumUnit"), objc_msgSend(v1, "maximumUnit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[0] = CFSTR("PossibleUnits");
  v15[1] = CFSTR("DefaultUnit");
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("DefaultValue");
  objc_msgSend(v1, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  v15[3] = CFSTR("AllowsNegativeNumbers");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "minimumValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v1, "minimumValue");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v1, "compare:", &unk_1E7B8B6F8) == -1;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  return v12;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a7;
  v10 = objc_opt_class();
  v11 = v8;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "unitString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[WFDurationQuantityFieldParameter calendarUnitFromUnitString:](WFDurationQuantityFieldParameter, "calendarUnitFromUnitString:", v12);

      objc_msgSend(v11, "magnitude");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      switch(v13)
      {
        case 0x40uLL:
          v17 = 60.0;
          break;
        case 0x20uLL:
          v17 = 3600.0;
          break;
        case 0x10uLL:
          v17 = 86400.0;
          break;
        default:
LABEL_14:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v11;
          goto LABEL_15;
      }
      v16 = v16 * v17;
      goto LABEL_14;
    }
    getWFGeneralLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v23 = 136315906;
      v24 = "WFEnforceClass";
      v25 = 2114;
      v26 = v11;
      v27 = 2114;
      v28 = (id)objc_opt_class();
      v29 = 2114;
      v30 = v10;
      v19 = v28;
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v23, 0x2Au);

    }
  }
  v20 = 0;
  v21 = 0;
LABEL_15:
  v9[2](v9, v21, 0);

  return 1;
}

- (WFQuantityParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  WFNumberStringSubstitutableState *v9;
  void *v10;
  void *v11;
  WFNumberStringSubstitutableState *v12;
  WFQuantityParameterState *v13;
  void *v14;
  WFQuantityParameterState *v15;

  objc_msgSend(a3, "doubleValue");
  v5 = v4;
  v6 = objc_msgSend(a1, "defaultUnit");
  v7 = v6;
  switch(v6)
  {
    case 1:
      v8 = 60.0;
      goto LABEL_7;
    case 2:
      v8 = 3600.0;
      goto LABEL_7;
    case 3:
      v8 = 86400.0;
LABEL_7:
      v5 = v5 / v8;
      break;
  }
  v9 = [WFNumberStringSubstitutableState alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFNumberStringSubstitutableState initWithValue:](v9, "initWithValue:", v11);

  v13 = [WFQuantityParameterState alloc];
  objc_msgSend(a1, "unitNameForUnit:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFQuantityParameterState initWithMagnitudeState:unitString:](v13, "initWithMagnitudeState:unitString:", v12, v14);

  return v15;
}

- (const)unitNameForUnit:()Workflow
{
  if (a3 > 2)
    return CFSTR("days");
  else
    return off_1E7AF1DC0[a3];
}

- (id)unitNamesWithMinimumUnit:()Workflow maximumUnit:
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)objc_opt_new();
  if (a3 <= a4)
  {
    v8 = a4 + 1;
    do
    {
      objc_msgSend(a1, "unitNameForUnit:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      ++a3;
    }
    while (v8 != a3);
  }
  return v7;
}

@end
