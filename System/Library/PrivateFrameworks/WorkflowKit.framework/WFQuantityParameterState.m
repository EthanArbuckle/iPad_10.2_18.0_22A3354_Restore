@implementation WFQuantityParameterState

- (WFQuantityParameterState)initWithMagnitudeState:(id)a3 unitString:(id)a4
{
  id v7;
  id v8;
  WFQuantityParameterState *v9;
  WFQuantityParameterState *v10;
  uint64_t v11;
  NSString *unitString;
  WFQuantityParameterState *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFQuantityParameterState;
  v9 = -[WFQuantityParameterState init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_magnitudeState, a3);
    v11 = objc_msgSend(v8, "copy");
    unitString = v10->_unitString;
    v10->_unitString = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (WFQuantityParameterState)initWithMagnitudeState:(id)a3 unitString:(id)a4 variable:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFQuantityParameterState *v12;
  WFQuantityParameterState *v13;
  uint64_t v14;
  NSString *unitString;
  WFQuantityParameterState *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFQuantityParameterState;
  v12 = -[WFQuantityParameterState init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_magnitudeState, a3);
    v14 = objc_msgSend(v10, "copy");
    unitString = v13->_unitString;
    v13->_unitString = (NSString *)v14;

    objc_storeStrong((id *)&v13->_variable, a5);
    v16 = v13;
  }

  return v13;
}

- (WFQuantityParameterState)initWithVariable:(id)a3
{
  id v4;
  WFNumberStringSubstitutableState *v5;
  WFQuantityParameterState *v6;

  v4 = a3;
  v5 = -[WFVariableSubstitutableParameterState initWithVariable:]([WFNumberStringSubstitutableState alloc], "initWithVariable:", v4);
  v6 = -[WFQuantityParameterState initWithMagnitudeState:unitString:variable:](self, "initWithMagnitudeState:unitString:variable:", v5, 0, v4);

  return v6;
}

- (WFQuantityParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  WFQuantityParameterState *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  WFVariable *v20;
  WFNumberStringSubstitutableState *v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("Value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    WFEnforceClass(v13, v14);
    v15 = (WFQuantityParameterState *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[WFQuantityParameterState objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D142A8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFQuantityParameterState objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D142B0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      WFEnforceClass(v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = -[WFVariable initWithDictionary:variableProvider:]([WFVariable alloc], "initWithDictionary:variableProvider:", v16, v8);
        if (v20)
          v21 = -[WFVariableSubstitutableParameterState initWithVariable:]([WFNumberStringSubstitutableState alloc], "initWithVariable:", v20);
        else
          v21 = 0;

      }
      else
      {
        v21 = -[WFVariableSubstitutableParameterState initWithSerializedRepresentation:variableProvider:parameter:]([WFNumberStringSubstitutableState alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v16, v8, v9);
      }
      self = -[WFQuantityParameterState initWithMagnitudeState:unitString:](self, "initWithMagnitudeState:unitString:", v21, v19);

      v15 = self;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[WFQuantityParameterState magnitudeState](self, "magnitudeState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "serializedRepresentation");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setValue:forKey:", v8, *MEMORY[0x1E0D142A8]);
  -[WFQuantityParameterState unitString](self, "unitString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, *MEMORY[0x1E0D142B0]);

  v13[0] = CFSTR("WFSerializationType");
  v13[1] = CFSTR("Value");
  v14[0] = CFSTR("WFQuantityFieldValue");
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPropertyListObject *)v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  WFQuantityParameterState *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (WFQuantityParameterState *)a3;
  if (self == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFQuantityParameterState magnitudeState](v6, "magnitudeState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFQuantityParameterState magnitudeState](self, "magnitudeState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[WFQuantityParameterState magnitudeState](v6, "magnitudeState"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[WFQuantityParameterState magnitudeState](self, "magnitudeState"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        -[WFQuantityParameterState unitString](v6, "unitString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFQuantityParameterState unitString](self, "unitString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v9 = 1;
        }
        else
        {
          -[WFQuantityParameterState unitString](v6, "unitString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFQuantityParameterState unitString](self, "unitString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        if (v7 == v8)
          goto LABEL_13;
      }
      else
      {
        v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFQuantityParameterState magnitudeState](self, "magnitudeState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFQuantityParameterState unitString](self, "unitString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSArray)containedVariables
{
  void *v2;
  void *v3;

  -[WFQuantityParameterState magnitudeState](self, "magnitudeState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containedVariables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFQuantityParameterState magnitudeState](self, "magnitudeState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "decimalNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else
  {
    -[WFQuantityParameterState magnitudeState](self, "magnitudeState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "variable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
      goto LABEL_5;
    }
  }
  -[WFQuantityParameterState magnitudeState](self, "magnitudeState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85__WFQuantityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v19[3] = &unk_1E7AEDDD0;
  v19[4] = self;
  v20 = v9;
  v17[0] = v16;
  v17[1] = 3221225472;
  v17[2] = __85__WFQuantityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
  v17[3] = &unk_1E7AEDDF8;
  v17[4] = self;
  v18 = v10;
  objc_msgSend(v15, "processWithContext:userInputRequiredHandler:valueHandler:", v8, v19, v17);

LABEL_5:
}

- (WFVariable)variable
{
  return self->_variable;
}

- (WFNumberStringSubstitutableState)magnitudeState
{
  return self->_magnitudeState;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_magnitudeState, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

void __85__WFQuantityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "unitString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithMagnitudeState:unitString:", v6, v10);

  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v9);
}

void __85__WFQuantityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0D14068]);
    objc_msgSend(*(id *)(a1 + 32), "unitString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithMagnitude:unitString:", v10, v8);
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v9, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
