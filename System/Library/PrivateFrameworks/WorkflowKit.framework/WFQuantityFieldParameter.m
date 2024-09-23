@implementation WFQuantityFieldParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFQuantityFieldParameter)initWithDefinition:(id)a3
{
  id v4;
  WFQuantityFieldParameter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  WFQuantityFieldParameter *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFQuantityFieldParameter;
  v5 = -[WFNumberFieldParameter initWithDefinition:](&v16, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("PossibleUnits"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v18 = "WFEnforceClass";
        v19 = 2114;
        v20 = v8;
        v21 = 2114;
        v22 = v11;
        v23 = 2114;
        v24 = v7;
        v12 = v11;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }

    if (v9)
      v13 = v9;
    else
      v13 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_possibleUnits, v13);

    v14 = v5;
  }

  return v5;
}

- (void)setPossibleUnits:(id)a3
{
  NSArray *v4;
  NSArray *possibleUnits;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  possibleUnits = self->_possibleUnits;
  self->_possibleUnits = v4;

  -[WFParameter attributesDidChange](self, "attributesDidChange");
}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  return a3;
}

- (id)defaultUnit
{
  void *v2;
  void *v3;

  -[WFQuantityFieldParameter possibleUnits](self, "possibleUnits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  WFNumberStringSubstitutableState *v4;
  WFQuantityParameterState *v5;
  void *v6;
  WFQuantityParameterState *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFQuantityFieldParameter;
  -[WFParameter defaultSerializedRepresentation](&v10, sel_defaultSerializedRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[WFVariableSubstitutableParameterState initWithSerializedRepresentation:variableProvider:parameter:]([WFNumberStringSubstitutableState alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v3, 0, 0);
  else
    v4 = 0;
  v5 = [WFQuantityParameterState alloc];
  -[WFQuantityFieldParameter defaultUnit](self, "defaultUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFQuantityParameterState initWithMagnitudeState:unitString:](v5, "initWithMagnitudeState:unitString:", v4, v6);
  -[WFQuantityParameterState serializedRepresentation](v7, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (NSArray)possibleUnits
{
  return self->_possibleUnits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleUnits, 0);
}

+ (BOOL)defaultAllowsDecimalNumbers
{
  return 1;
}

+ (BOOL)defaultAllowsNegativeNumbers
{
  return 0;
}

@end
