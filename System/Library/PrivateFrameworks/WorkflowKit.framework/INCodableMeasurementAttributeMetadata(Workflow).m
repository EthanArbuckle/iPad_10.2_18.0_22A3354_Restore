@implementation INCodableMeasurementAttributeMetadata(Workflow)

- (id)wf_measurementType
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  WFUnitTypeFromAttributeName(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  objc_super v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v24.receiver = a1;
  v24.super_class = (Class)&off_1EF789B50;
  objc_msgSendSuper2(&v24, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFUnitTypeFromAttributeName(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v30[0] = CFSTR("WFUnitType");
    v30[1] = CFSTR("AllowsNegativeNumbers");
    v31[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "supportsNegativeNumbers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v28[0] = CFSTR("DefaultUnit");
      objc_msgSend(a1, "unit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "symbol");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v10;
      v28[1] = CFSTR("PossibleUnits");
      objc_msgSend(a1, "unit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "symbol");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v29[1] = v13;
      v28[2] = CFSTR("DefaultValue");
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a1, "defaultValue");
      objc_msgSend(v14, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "definitionByAddingEntriesInDictionary:", v16);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(a1, "defaultUnits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0C99840]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      v25 = CFSTR("DefaultUnit");
      objc_msgSend(a1, "defaultUnits");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v21;
      if (v20)
        objc_msgSend(v21, "firstObject");
      else
        objc_msgSend(v21, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "symbol");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "definitionByAddingEntriesInDictionary:", v12);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v2 = v7;
  }
LABEL_11:
  v22 = v2;

  return v22;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;

  v9 = a3;
  v10 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v16 = v12;

    objc_msgSend(v16, "measurement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v16 = v14;

    objc_msgSend(a1, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WFUnitTypeFromAttributeName(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0DC7BE8];
      objc_msgSend(v16, "unitString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "unitFromString:unitType:caseSensitive:", v20, v18, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(v16, "magnitude");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v15 = (void *)objc_msgSend(v22, "initWithDoubleValue:unit:", v21);

      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = 0;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      v24 = v13;
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
      }
      else
      {
        v25 = 0;
      }
      v21 = v25;

      objc_msgSend(v21, "measurement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_28;
  }
  v15 = 0;
LABEL_30:
  v10[2](v10, v15, 0);

  return 1;
}

- (WFQuantityParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  id v8;
  WFNumberStringSubstitutableState *v9;
  void *v10;
  void *v11;
  void *v12;
  WFNumberStringSubstitutableState *v13;
  WFQuantityParameterState *v14;
  void *v15;
  void *v16;
  WFQuantityParameterState *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v9 = [WFNumberStringSubstitutableState alloc];
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFNumberStringSubstitutableState initWithValue:](v9, "initWithValue:", v12);

    v14 = [WFQuantityParameterState alloc];
    objc_msgSend(v8, "unit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "symbol");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WFQuantityParameterState initWithMagnitudeState:unitString:](v14, "initWithMagnitudeState:unitString:", v13, v16);

  }
  else
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_1EF789B50;
    objc_msgSendSuper2(&v19, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
    v17 = (WFQuantityParameterState *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)wf_updateWithParameterState:()Workflow
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      WFUnitTypeFromAttributeName(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1E0DC7BE8];
      objc_msgSend(v9, "unitString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unitFromString:unitType:caseSensitive:", v7, v5, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setUnit:", v8);

    }
  }

}

- (void)wf_updateWithParameterValue:()Workflow
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "unit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setUnit:", v4);

    }
  }

}

@end
