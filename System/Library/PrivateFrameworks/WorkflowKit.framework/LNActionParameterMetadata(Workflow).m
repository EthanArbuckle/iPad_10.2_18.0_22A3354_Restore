@implementation LNActionParameterMetadata(Workflow)

- (id)wf_parameterDefinition
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "valueType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_parameterDefinitionWithParameterMetadata:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wf_localizedTitle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E7B8BD88, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)wf_localizedDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "parameterDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForLocaleIdentifier:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wf_parameterMetadataWithTypeSpecificMetadata:()Workflow
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;

  v4 = (objc_class *)MEMORY[0x1E0D43BB8];
  v5 = a3;
  v18 = [v4 alloc];
  objc_msgSend(a1, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "isOptional");
  objc_msgSend(a1, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parameterDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolvableInputTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "dynamicOptionsSupport");
  v12 = objc_msgSend(a1, "inputConnectionBehavior");
  v13 = objc_msgSend(a1, "capabilities");
  objc_msgSend(a1, "queryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v18, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:queryIdentifier:", v17, v6, v7, v8, v9, v10, v5, v11, v12, v13, v14);

  return v15;
}

- (id)wf_parameterDictionaryRepresentation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_parameterDefinition");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "parameterDefinitionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)wf_validateParameterValue:()Workflow error:
{
  id v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(a1, "isOptional");
  if (v6 || (v7 & 1) != 0)
  {
    if (v6
      && (objc_msgSend(a1, "valueType"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "value"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v17, "objectIsMemberOfType:", v18),
          v18,
          v17,
          (v19 & 1) == 0))
    {
      if (a4)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0D440A8];
        v23[0] = *MEMORY[0x1E0CB2D50];
        WFLocalizedString(CFSTR("The value is invalid"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v10;
        v23[1] = *MEMORY[0x1E0CB2D80];
        WFLocalizedString(CFSTR("Please ensure that a value is valid"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v11;
        v23[2] = *MEMORY[0x1E0D440B0];
        objc_msgSend(a1, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v20;
        v15 = v21;
        v16 = 2008;
        goto LABEL_10;
      }
    }
    else
    {
      a4 = 1;
    }
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D440A8];
    v25[0] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("The value for a required parameter is missing"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    v25[1] = *MEMORY[0x1E0CB2D80];
    WFLocalizedString(CFSTR("Please ensure that a value is provided for the parameter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v11;
    v25[2] = *MEMORY[0x1E0D440B0];
    objc_msgSend(a1, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    v15 = v9;
    v16 = 2005;
LABEL_10:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v13);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (uint64_t)wf_isPersistentFileIdentifiableEntity
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;

  objc_msgSend(a1, "typeSpecificMetadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEntityMetadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "systemProtocolMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D439E8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
