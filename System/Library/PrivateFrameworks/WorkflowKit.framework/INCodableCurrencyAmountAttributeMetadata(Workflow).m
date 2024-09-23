@implementation INCodableCurrencyAmountAttributeMetadata(Workflow)

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
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EF778EE0;
  objc_msgSendSuper2(&v8, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("PossibleUnits");
  objc_msgSend(a1, "currencyCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("AllowsNegativeNumbers");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "supportsNegativeNumbers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  char isKindOfClass;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a7;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v11 = (objc_class *)MEMORY[0x1E0CBD848];
    v12 = v8;
    v13 = [v11 alloc];
    objc_msgSend(v12, "magnitude");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unitString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(v13, "initWithAmount:currencyCode:", v14, v15);
    v9[2](v9, v16, 0);

  }
  return isKindOfClass & 1;
}

- (WFQuantityParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6;
  id v7;
  id v8;
  WFQuantityParameterState *v9;
  WFNumberStringSubstitutableState *v10;
  void *v11;
  void *v12;
  WFNumberStringSubstitutableState *v13;
  void *v14;
  WFQuantityParameterState *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v9 = [WFQuantityParameterState alloc];
    v10 = [WFNumberStringSubstitutableState alloc];
    objc_msgSend(v8, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFNumberStringSubstitutableState initWithValue:](v10, "initWithValue:", v12);
    objc_msgSend(v8, "currencyCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[WFQuantityParameterState initWithMagnitudeState:unitString:](v9, "initWithMagnitudeState:unitString:", v13, v14);
  }
  else
  {
    v17.receiver = a1;
    v17.super_class = (Class)&off_1EF778EE0;
    objc_msgSendSuper2(&v17, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
    v15 = (WFQuantityParameterState *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)wf_updateWithParameterState:()Workflow
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "unitString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setCurrencyCode:", v4);

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
      objc_msgSend(v5, "currencyCode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setCurrencyCode:", v4);

    }
  }

}

@end
