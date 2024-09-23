@implementation WFArrayParameter

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

- (WFArrayParameter)initWithDefinition:(id)a3
{
  id v4;
  WFArrayParameter *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSet *allowedValueTypes;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  WFArrayParameter *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFArrayParameter;
  v5 = -[WFParameter initWithDefinition:](&v18, sel_initWithDefinition_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v4, "objectForKey:", CFSTR("AllowedValueTypes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "initWithArray:", v9);
    allowedValueTypes = v5->_allowedValueTypes;
    v5->_allowedValueTypes = (NSSet *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("SupportsVariables"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    WFEnforceClass(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = objc_msgSend(v14, "BOOLValue");
    else
      v15 = 1;
    v5->_supportsVariables = v15;
    v16 = v5;

  }
  return v5;
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFArrayParameter;
  -[WFParameter defaultSerializedRepresentation](&v6, sel_defaultSerializedRepresentation);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "if_map:", &__block_literal_global_20822);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultSupportedVariableTypes
{
  void *v2;

  if (-[WFArrayParameter supportsVariables](self, "supportsVariables"))
  {
    objc_msgSend((id)objc_opt_class(), "allInsertableVariableTypes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (BOOL)supportsVariables
{
  return self->_supportsVariables;
}

- (NSSet)allowedValueTypes
{
  return self->_allowedValueTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedValueTypes, 0);
}

id __51__WFArrayParameter_defaultSerializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v2, "localize");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

@end
