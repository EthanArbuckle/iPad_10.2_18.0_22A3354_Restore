@implementation WFDictionaryParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFDictionaryParameter)initWithDefinition:(id)a3
{
  id v4;
  WFDictionaryParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *localizedItemTypeName;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *localizedNewItemTypeName;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSSet *allowedValueTypes;
  WFDictionaryParameter *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFDictionaryParameter;
  v5 = -[WFParameter initWithDefinition:](&v24, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ItemTypeName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "localize");
    v9 = objc_claimAutoreleasedReturnValue();
    localizedItemTypeName = v5->_localizedItemTypeName;
    v5->_localizedItemTypeName = (NSString *)v9;

    objc_msgSend(v4, "objectForKey:", CFSTR("NewItemTypeName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "localize");
    v14 = objc_claimAutoreleasedReturnValue();
    localizedNewItemTypeName = v5->_localizedNewItemTypeName;
    v5->_localizedNewItemTypeName = (NSString *)v14;

    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v4, "objectForKey:", CFSTR("AllowedValueTypes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    WFEnforceClass(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "initWithArray:", v19);
    allowedValueTypes = v5->_allowedValueTypes;
    v5->_allowedValueTypes = (NSSet *)v20;

    v22 = v5;
  }

  return v5;
}

- (id)defaultSupportedVariableTypes
{
  return (id)objc_msgSend((id)objc_opt_class(), "allInsertableVariableTypes");
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (NSString)localizedItemTypeName
{
  return self->_localizedItemTypeName;
}

- (NSString)localizedNewItemTypeName
{
  return self->_localizedNewItemTypeName;
}

- (NSSet)allowedValueTypes
{
  return self->_allowedValueTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedValueTypes, 0);
  objc_storeStrong((id *)&self->_localizedNewItemTypeName, 0);
  objc_storeStrong((id *)&self->_localizedItemTypeName, 0);
}

@end
