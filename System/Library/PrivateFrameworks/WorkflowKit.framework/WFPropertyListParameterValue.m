@implementation WFPropertyListParameterValue

- (WFPropertyListParameterValue)initWithType:(int64_t)a3 state:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  WFPropertyListParameterValue *v9;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFPropertyListParameterValue initWithType:state:identity:](self, "initWithType:state:identity:", a3, v7, v8);

  return v9;
}

- (WFPropertyListParameterValue)initWithType:(int64_t)a3 state:(id)a4 identity:(id)a5
{
  id v9;
  id v10;
  WFPropertyListParameterValue *v11;
  WFPropertyListParameterValue *v12;
  uint64_t v13;
  WFParameterState *state;
  WFPropertyListParameterValue *v15;
  void *v17;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "classForValueType:", a3);
  if ((objc_opt_isKindOfClass() & 1) == 0 && (a3 != 5 || v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPropertyListParameterValue.m"), 107, CFSTR("State for WFPropertyListParameterValue is not of the expected class"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFPropertyListParameterValue;
  v11 = -[WFPropertyListParameterValue init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_valueType = a3;
    v13 = objc_msgSend(v9, "copyWithZone:", MEMORY[0x1C3BB2920]());
    state = v12->_state;
    v12->_state = (WFParameterState *)v13;

    objc_storeStrong((id *)&v12->_identity, a5);
    v15 = v12;
  }

  return v12;
}

- (WFPropertyListParameterValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  WFPropertyListParameterValue *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("WFItemType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  v13 = -[WFPropertyListParameterValue initWithSerializedRepresentation:variableProvider:parameter:valueType:variableStringStateClass:](self, "initWithSerializedRepresentation:variableProvider:parameter:valueType:variableStringStateClass:", v10, v9, v8, v12, objc_opt_class());
  return v13;
}

- (WFPropertyListParameterValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5 valueType:(int64_t)a6 variableStringStateClass:(Class)a7
{
  id v12;
  id v13;
  void *v14;
  WFVariableString *v15;
  void *v16;
  __objc2_class *v17;
  WFBooleanSubstitutableState *v18;
  WFChooseFromMenuItemParameterState *v19;
  WFVariableString *v20;
  id v21;
  WFVariableString *v22;
  WFPropertyListParameterValue *v23;

  v12 = a4;
  v13 = a5;
  objc_msgSend(a3, "objectForKey:", CFSTR("WFValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a6)
  {
    case 0:
    case 3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        WFDeserializedVariableObject(v14, v12, v13);
        v15 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v20 = v15;
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v14);
        goto LABEL_13;
      }
      v20 = 0;
LABEL_15:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (WFChooseFromMenuItemParameterState *)objc_msgSend([a7 alloc], "initWithVariableString:", v20);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = [a7 alloc];
          v22 = -[WFVariableString initWithVariable:]([WFVariableString alloc], "initWithVariable:", v20);
          v19 = (WFChooseFromMenuItemParameterState *)objc_msgSend(v21, "initWithVariableString:", v22);

        }
        else
        {
          v19 = 0;
        }
      }

      if (!v19)
        goto LABEL_21;
      goto LABEL_22;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      WFDeserializedVariableObject(v14, v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WFBooleanSubstitutableState initWithNumberSubstitutableState:]([WFBooleanSubstitutableState alloc], "initWithNumberSubstitutableState:", v16);
      goto LABEL_27;
    case 6:
      v19 = -[WFChooseFromMenuItemParameterState initWithSerializedRepresentation:variableProvider:parameter:]([WFChooseFromMenuItemParameterState alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v14, v12, v13);
      if (!v19)
        goto LABEL_21;
      goto LABEL_22;
    default:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFSerializationType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("WFDictionaryFieldValue")))
      {
        v17 = WFDictionarySubstitutableParameterState;
LABEL_25:
        v18 = (WFBooleanSubstitutableState *)objc_msgSend([v17 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v14, v12, v13);
        goto LABEL_27;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("WFArrayParameterState")))
      {
        v17 = WFArraySubstitutableParameterState;
        goto LABEL_25;
      }
      WFDeserializedVariableObject(v14, v12, v13);
      v18 = (WFBooleanSubstitutableState *)objc_claimAutoreleasedReturnValue();
LABEL_27:
      v19 = (WFChooseFromMenuItemParameterState *)v18;

      if (!v19)
      {
LABEL_21:
        objc_msgSend((id)objc_opt_class(), "defaultStateForValueType:", a6);
        v19 = (WFChooseFromMenuItemParameterState *)objc_claimAutoreleasedReturnValue();
      }
LABEL_22:
      v23 = -[WFPropertyListParameterValue initWithType:state:](self, "initWithType:state:", a6, v19);

      return v23;
  }
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v3 = (void *)objc_opt_new();
  v4 = -[WFPropertyListParameterValue valueType](self, "valueType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("WFItemType"));

  -[WFPropertyListParameterValue state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    switch(v4)
    {
      case 0:
      case 3:
        objc_msgSend(v6, "variableString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 1:
        WFSerializedVariableObject(v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

        objc_msgSend(v7, "variable");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_12;
        v12 = CFSTR("WFDictionaryFieldValue");
        break;
      case 2:
        WFSerializedVariableObject(v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v13, "mutableCopy");

        objc_msgSend(v7, "variable");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_12;
        v12 = CFSTR("WFArrayParameterState");
        break;
      case 4:
        objc_msgSend(v6, "numberSubstitutableState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v10 = v8;
        WFSerializedVariableObject(v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("WFValue"));

        goto LABEL_13;
      case 6:
        objc_msgSend(v6, "serializedRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("WFValue"));

        objc_msgSend(v3, "setObject:forKey:", &unk_1E7B8BCF8, CFSTR("WFItemType"));
        goto LABEL_14;
      default:
        WFSerializedVariableObject(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
    }
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("WFSerializationType"));
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("WFValue"));
LABEL_13:

  }
LABEL_14:

  return (WFPropertyListObject *)v3;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFPropertyListParameterValue state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __89__WFPropertyListParameterValue_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
    v12[3] = &unk_1E7AF5D38;
    v12[4] = self;
    v14 = v10;
    v13 = v8;
    objc_msgSend(v11, "processWithContext:userInputRequiredHandler:valueHandler:", v13, v9, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (NSArray)containedVariables
{
  void *v2;
  void *v3;

  -[WFPropertyListParameterValue state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containedVariables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  WFPropertyListParameterValue *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = (WFPropertyListParameterValue *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFPropertyListParameterValue state](v4, "state");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPropertyListParameterValue state](self, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        -[WFPropertyListParameterValue state](v4, "state");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v7 = 0;
        }
        else
        {
          -[WFPropertyListParameterValue state](self, "state");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v9 == 0;

        }
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFPropertyListParameterValue state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") ^ 0x700F00D5;

  return v3;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (WFParameterState)state
{
  return self->_state;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

void __89__WFPropertyListParameterValue_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend((id)objc_opt_class(), "processedClassForValueType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0D13F18], "resultsForString:ofTypes:error:", v5, 0x200000000, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "number");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) == 4
    && (WFNumberIsBoolean(v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v10;
  }
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultStateForValueType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:state:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v11);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __89__WFPropertyListParameterValue_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
      v14[3] = &unk_1E7AF4E48;
      v13 = *(_QWORD *)(a1 + 40);
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v12, "processWithContext:userInputRequiredHandler:valueHandler:", v13, v14, *(_QWORD *)(a1 + 48));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

uint64_t __89__WFPropertyListParameterValue_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)localizedTitleForValueType:(int64_t)a3
{
  if ((unint64_t)a3 <= 6)
  {
    WFLocalizedString(off_1E7AF4F10[a3]);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)defaultStateForValueType:(int64_t)a3
{
  WFVariableStringParameterState *v3;
  __objc2_class *v4;
  WFDictionarySubstitutableParameterState *v5;
  uint64_t v6;
  WFArraySubstitutableParameterState *v7;
  WFVariableStringParameterState *v8;
  WFVariableString *v9;
  const __CFString *v10;
  WFBooleanSubstitutableState *v11;
  WFVariableString *v12;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = WFVariableStringParameterState;
      goto LABEL_9;
    case 1:
      v5 = [WFDictionarySubstitutableParameterState alloc];
      v6 = -[WFDictionarySubstitutableParameterState initWithKeyValuePairs:](v5, "initWithKeyValuePairs:", MEMORY[0x1E0C9AA60]);
      goto LABEL_7;
    case 2:
      v7 = [WFArraySubstitutableParameterState alloc];
      v6 = -[WFArraySubstitutableParameterState initWithValues:](v7, "initWithValues:", MEMORY[0x1E0C9AA60]);
      goto LABEL_7;
    case 3:
      v8 = [WFVariableStringParameterState alloc];
      v9 = [WFVariableString alloc];
      v10 = CFSTR("0");
      goto LABEL_10;
    case 4:
      v11 = [WFBooleanSubstitutableState alloc];
      v6 = -[WFNumberSubstitutableState initWithNumber:](v11, "initWithNumber:", MEMORY[0x1E0C9AAA0]);
LABEL_7:
      v3 = (WFVariableStringParameterState *)v6;
      break;
    case 6:
      v4 = WFChooseFromMenuItemParameterState;
LABEL_9:
      v8 = (WFVariableStringParameterState *)[v4 alloc];
      v9 = [WFVariableString alloc];
      v10 = &stru_1E7AFA810;
LABEL_10:
      v12 = -[WFVariableString initWithString:](v9, "initWithString:", v10);
      v3 = -[WFVariableStringParameterState initWithVariableString:](v8, "initWithVariableString:", v12);

      break;
    default:
      return v3;
  }
  return v3;
}

+ (Class)classForValueType:(int64_t)a3
{
  if ((unint64_t)a3 <= 6)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

+ (Class)processedClassForValueType:(int64_t)a3
{
  void *v3;
  void *v4;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return (Class)v3;
  }
  return (Class)v3;
}

- (WFPropertyListParameterValue)initWithStringState:(id)a3
{
  return -[WFPropertyListParameterValue initWithType:state:](self, "initWithType:state:", 0, a3);
}

- (WFPropertyListParameterValue)initWithDictionaryState:(id)a3
{
  return -[WFPropertyListParameterValue initWithType:state:](self, "initWithType:state:", 1, a3);
}

- (WFPropertyListParameterValue)initWithArrayState:(id)a3
{
  return -[WFPropertyListParameterValue initWithType:state:](self, "initWithType:state:", 2, a3);
}

- (WFPropertyListParameterValue)initWithNumberState:(id)a3
{
  return -[WFPropertyListParameterValue initWithType:state:](self, "initWithType:state:", 3, a3);
}

- (WFPropertyListParameterValue)initWithBooleanState:(id)a3
{
  return -[WFPropertyListParameterValue initWithType:state:](self, "initWithType:state:", 4, a3);
}

- (WFPropertyListParameterValue)initWithChooseFromMenuItemState:(id)a3
{
  return -[WFPropertyListParameterValue initWithType:state:](self, "initWithType:state:", 6, a3);
}

- (WFPropertyListParameterValue)initWithString:(id)a3
{
  id v4;
  WFVariableStringParameterState *v5;
  WFVariableString *v6;
  WFVariableStringParameterState *v7;
  WFPropertyListParameterValue *v8;

  v4 = a3;
  v5 = [WFVariableStringParameterState alloc];
  v6 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v4);

  v7 = -[WFVariableStringParameterState initWithVariableString:](v5, "initWithVariableString:", v6);
  v8 = -[WFPropertyListParameterValue initWithStringState:](self, "initWithStringState:", v7);

  return v8;
}

- (WFPropertyListParameterValue)initWithChooseFromMenuString:(id)a3
{
  id v4;
  WFChooseFromMenuItemParameterState *v5;
  WFVariableString *v6;
  WFChooseFromMenuItemParameterState *v7;
  WFPropertyListParameterValue *v8;

  v4 = a3;
  v5 = [WFChooseFromMenuItemParameterState alloc];
  v6 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v4);

  v7 = -[WFVariableStringParameterState initWithVariableString:](v5, "initWithVariableString:", v6);
  v8 = -[WFPropertyListParameterValue initWithChooseFromMenuItemState:](self, "initWithChooseFromMenuItemState:", v7);

  return v8;
}

- (WFPropertyListParameterValue)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  WFDictionarySubstitutableParameterState *v7;
  WFPropertyListParameterValue *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__WFPropertyListParameterValue_Convenience__initWithDictionary___block_invoke;
  v10[3] = &unk_1E7AF4E70;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = -[WFDictionarySubstitutableParameterState initWithKeyValuePairs:]([WFDictionarySubstitutableParameterState alloc], "initWithKeyValuePairs:", v6);
  v8 = -[WFPropertyListParameterValue initWithDictionaryState:](self, "initWithDictionaryState:", v7);

  return v8;
}

- (WFPropertyListParameterValue)initWithArray:(id)a3
{
  void *v4;
  WFArraySubstitutableParameterState *v5;
  WFPropertyListParameterValue *v6;

  objc_msgSend(a3, "if_map:", &__block_literal_global_47335);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFArraySubstitutableParameterState initWithValues:]([WFArraySubstitutableParameterState alloc], "initWithValues:", v4);
  v6 = -[WFPropertyListParameterValue initWithArrayState:](self, "initWithArrayState:", v5);

  return v6;
}

- (WFPropertyListParameterValue)initWithNumber:(id)a3
{
  id v4;
  WFVariableStringParameterState *v5;
  WFVariableString *v6;
  void *v7;
  WFVariableString *v8;
  WFVariableStringParameterState *v9;
  WFPropertyListParameterValue *v10;

  v4 = a3;
  v5 = [WFVariableStringParameterState alloc];
  v6 = [WFVariableString alloc];
  objc_msgSend(v4, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFVariableString initWithString:](v6, "initWithString:", v7);
  v9 = -[WFVariableStringParameterState initWithVariableString:](v5, "initWithVariableString:", v8);
  v10 = -[WFPropertyListParameterValue initWithNumberState:](self, "initWithNumberState:", v9);

  return v10;
}

- (WFPropertyListParameterValue)initWithBoolean:(id)a3
{
  id v4;
  WFBooleanSubstitutableState *v5;
  WFPropertyListParameterValue *v6;

  v4 = a3;
  v5 = -[WFNumberSubstitutableState initWithNumber:]([WFBooleanSubstitutableState alloc], "initWithNumber:", v4);

  v6 = -[WFPropertyListParameterValue initWithBooleanState:](self, "initWithBooleanState:", v5);
  return v6;
}

- (WFPropertyListParameterValue)initWithChooseFromMenuItem:(id)a3
{
  id v4;
  WFVariableString *v5;
  void *v6;
  WFVariableString *v7;
  void *v8;
  void *v9;
  WFVariableString *v10;
  void *v11;
  WFVariableString *v12;
  WFChooseFromMenuItemParameterState *v13;
  WFPropertyListParameterValue *v14;

  v4 = a3;
  v5 = [WFVariableString alloc];
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFVariableString initWithString:](v5, "initWithString:", v6);

  objc_msgSend(v4, "synonyms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_map:", &__block_literal_global_265_47333);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [WFVariableString alloc];
  objc_msgSend(v4, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[WFVariableString initWithString:](v10, "initWithString:", v11);
  v13 = -[WFChooseFromMenuItemParameterState initWithVariableString:synonyms:subtitle:]([WFChooseFromMenuItemParameterState alloc], "initWithVariableString:synonyms:subtitle:", v7, v9, v12);
  v14 = -[WFPropertyListParameterValue initWithChooseFromMenuItemState:](self, "initWithChooseFromMenuItemState:", v13);

  return v14;
}

- (WFPropertyListParameterValue)initWithObject:(id)a3
{
  id v4;
  WFPropertyListParameterValue *v5;
  WFPropertyListParameterValue *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[WFPropertyListParameterValue initWithString:](self, "initWithString:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[WFPropertyListParameterValue initWithDictionary:](self, "initWithDictionary:", v4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = -[WFPropertyListParameterValue initWithArray:](self, "initWithArray:", v4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && WFNumberIsBoolean(v4))
        {
          v5 = -[WFPropertyListParameterValue initWithBoolean:](self, "initWithBoolean:", v4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v5 = -[WFPropertyListParameterValue initWithNumber:](self, "initWithNumber:", v4);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v6 = 0;
              goto LABEL_15;
            }
            v5 = -[WFPropertyListParameterValue initWithChooseFromMenuItem:](self, "initWithChooseFromMenuItem:", v4);
          }
        }
      }
    }
  }
  self = v5;
  v6 = self;
LABEL_15:

  return v6;
}

WFChooseFromMenuItemSynonym *__72__WFPropertyListParameterValue_Convenience__initWithChooseFromMenuItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFVariableString *v3;
  WFChooseFromMenuItemSynonym *v4;
  void *v5;
  WFChooseFromMenuItemSynonym *v6;

  v2 = a2;
  v3 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v2);

  v4 = [WFChooseFromMenuItemSynonym alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFChooseFromMenuItemSynonym initWithIdentity:synonym:](v4, "initWithIdentity:synonym:", v5, v3);

  return v6;
}

WFPropertyListParameterValue *__59__WFPropertyListParameterValue_Convenience__initWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFPropertyListParameterValue *v3;

  v2 = a2;
  v3 = -[WFPropertyListParameterValue initWithObject:]([WFPropertyListParameterValue alloc], "initWithObject:", v2);

  return v3;
}

void __64__WFPropertyListParameterValue_Convenience__initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFPropertyListParameterValue *v7;
  BOOL v8;
  void *v9;
  WFDictionaryParameterKeyValuePair *v10;
  WFVariableString *v11;

  v5 = a3;
  v6 = a2;
  v11 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v6);

  v7 = -[WFPropertyListParameterValue initWithObject:]([WFPropertyListParameterValue alloc], "initWithObject:", v5);
  if (v11)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = *(void **)(a1 + 32);
    v10 = -[WFDictionaryParameterKeyValuePair initWithKey:value:]([WFDictionaryParameterKeyValuePair alloc], "initWithKey:value:", v11, v7);
    objc_msgSend(v9, "addObject:", v10);

  }
}

@end
