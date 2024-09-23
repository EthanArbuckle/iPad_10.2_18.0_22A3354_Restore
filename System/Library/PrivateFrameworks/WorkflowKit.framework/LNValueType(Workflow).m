@implementation LNValueType(Workflow)

- (id)wf_parameterDefinitionWithParameterMetadata:()Workflow
{
  id v4;
  _BOOL8 v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "dynamicOptionsSupport") != 0;
  if (objc_msgSend(v4, "wf_isPersistentFileIdentifiableEntity"))
    v5 = objc_msgSend(v4, "dynamicOptionsSupport") == 2;
  objc_msgSend(a1, "wf_parameterDefinitionWithParameterMetadata:dynamicOptionsSupport:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFLinkActionArrayParameterDefinition)wf_parameterDefinitionWithParameterMetadata:()Workflow dynamicOptionsSupport:
{
  id v6;
  WFLinkActionArrayParameterDefinition *v7;
  id v8;
  void *v9;
  __objc2_class *v10;
  id v11;
  void *v12;
  WFLinkActionArrayParameterDefinition *v13;
  WFLinkActionMeasurementParameterDefinition *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[16];
  _QWORD v34[18];

  v34[16] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(v6, "wf_isPersistentFileIdentifiableEntity"))
    {
      v10 = WFLinkActionFileEntityParameterDefinition;
    }
    else if (a4)
    {
      v10 = WFLinkActionDynamicOptionsParameterDefinition;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = WFLinkActionEnumParameterDefinition;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:]([WFLinkActionMeasurementParameterDefinition alloc], "initWithValueType:parameterMetadata:", a1, v6);
LABEL_19:
          v13 = (WFLinkActionArrayParameterDefinition *)v14;
          goto LABEL_20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D43D90], "stringValueType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = v32;
          v34[0] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D90], "attributedStringValueType");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33[1] = v31;
          v34[1] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D90], "intValueType");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v33[2] = v30;
          v34[2] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D90], "doubleValueType");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v33[3] = v29;
          v34[3] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D90], "BOOLValueType");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v33[4] = v28;
          v34[4] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D90], "dateValueType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33[5] = v27;
          v34[5] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D90], "dateComponentsValueType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33[6] = v26;
          v34[6] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D90], "placemarkValueType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v33[7] = v25;
          v34[7] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D90], "URLValueType");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v33[8] = v24;
          v34[8] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D10], "fileValueType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v33[9] = v16;
          v34[9] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D10], "personValueType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v33[10] = v17;
          v34[10] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D10], "currencyAmountValueType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v33[11] = v18;
          v34[11] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D10], "paymentMethodValueType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v33[12] = v19;
          v34[12] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43DE0], "stringValueType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33[13] = v20;
          v34[13] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43C00], "photoItemCollectionValueType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v33[14] = v21;
          v34[14] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0D43D10], "applicationValueType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v33[15] = v22;
          v34[15] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (WFLinkActionArrayParameterDefinition *)objc_msgSend(objc_alloc((Class)objc_msgSend(v23, "objectForKey:", a1)), "initWithParameterMetadata:", v6);
          goto LABEL_20;
        }
        v10 = WFLinkActionEntityParameterDefinition;
      }
    }
    v14 = (WFLinkActionMeasurementParameterDefinition *)objc_msgSend([v10 alloc], "initWithParameterMetadata:", v6);
    goto LABEL_19;
  }
  v7 = [WFLinkActionArrayParameterDefinition alloc];
  v8 = a1;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v11 = v9;

  objc_msgSend(v11, "memberValueType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[WFLinkActionArrayParameterDefinition initWithMemberValueType:parameterMetadata:](v7, "initWithMemberValueType:parameterMetadata:", v12, v6);
LABEL_20:

  return v13;
}

- (id)wf_valueTypeOfClass:()Workflow
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = a1;
  else
    v2 = 0;
  v3 = v2;
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v5 = a1;
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "memberValueType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "memberValueType");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

      a1 = v7;
    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (uint64_t)wf_entityValueType
{
  return objc_msgSend(a1, "wf_valueTypeOfClass:", objc_opt_class());
}

- (uint64_t)wf_enumValueType
{
  return objc_msgSend(a1, "wf_valueTypeOfClass:", objc_opt_class());
}

- (id)wf_objectClass
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v1, "memberValueType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "wf_objectClass");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {

    v4 = (void *)objc_msgSend(v1, "objectClass");
    if (v4 != (void *)objc_opt_class()
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || objc_msgSend(v1, "typeIdentifier") != 1)
    {
      v3 = v4;
      return v3;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)wf_objectValueType
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v1, "memberValueType");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {

    v2 = v1;
  }
  return v2;
}

@end
