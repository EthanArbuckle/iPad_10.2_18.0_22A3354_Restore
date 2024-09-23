@implementation WFCustomIntentEnumerationParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFCustomIntentEnumerationParameter)initWithDefinition:(id)a3
{
  id v4;
  WFCustomIntentEnumerationParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  INCodableEnumAttribute *enumAttribute;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSDictionary *enumNamesToKeys;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  NSDictionary *keysToEnumNames;
  NSDictionary *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *enumNamesToLabels;
  WFCustomIntentEnumerationParameter *v23;
  _QWORD v25[4];
  NSDictionary *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFCustomIntentEnumerationParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v27, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("EnumAttribute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    enumAttribute = v5->_enumAttribute;
    v5->_enumAttribute = (INCodableEnumAttribute *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("IntentEnumOverrides"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    enumNamesToKeys = v5->_enumNamesToKeys;
    v5->_enumNamesToKeys = (NSDictionary *)v12;

    v14 = (void *)objc_opt_new();
    v15 = v5->_enumNamesToKeys;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __57__WFCustomIntentEnumerationParameter_initWithDefinition___block_invoke;
    v25[3] = &unk_1E7AF4688;
    v16 = v14;
    v26 = v16;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v25);
    keysToEnumNames = v5->_keysToEnumNames;
    v5->_keysToEnumNames = v16;
    v18 = v16;

    objc_msgSend(v4, "objectForKey:", CFSTR("EnumNamesToLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    WFEnforceClass(v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    enumNamesToLabels = v5->_enumNamesToLabels;
    v5->_enumNamesToLabels = (NSDictionary *)v21;

    v23 = v5;
  }

  return v5;
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  WFStringSubstitutableState *v19;
  NSArray *v20;
  NSArray *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[WFCustomIntentEnumerationParameter enumAttribute](self, "enumAttribute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "codableEnum");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v12, "index"))
          {
            -[WFCustomIntentEnumerationParameter enumNamesToKeys](self, "enumNamesToKeys");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              v17 = v15;
            }
            else
            {
              objc_msgSend(v12, "name");
              v17 = (id)objc_claimAutoreleasedReturnValue();
            }
            v18 = v17;

            v19 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v18);
            objc_msgSend(v4, "addObject:", v19);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v20 = (NSArray *)objc_msgSend(v4, "copy");
    v21 = self->_possibleStates;
    self->_possibleStates = v20;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "value");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFCustomIntentEnumerationParameter keysToEnumNames](self, "keysToEnumNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v5;
    v10 = v9;

    -[WFCustomIntentEnumerationParameter enumNamesToLabels](self, "enumNamesToLabels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (INCodableEnumAttribute)enumAttribute
{
  return self->_enumAttribute;
}

- (NSDictionary)enumNamesToKeys
{
  return self->_enumNamesToKeys;
}

- (NSDictionary)keysToEnumNames
{
  return self->_keysToEnumNames;
}

- (NSDictionary)enumNamesToLabels
{
  return self->_enumNamesToLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumNamesToLabels, 0);
  objc_storeStrong((id *)&self->_keysToEnumNames, 0);
  objc_storeStrong((id *)&self->_enumNamesToKeys, 0);
  objc_storeStrong((id *)&self->_enumAttribute, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

uint64_t __57__WFCustomIntentEnumerationParameter_initWithDefinition___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

@end
