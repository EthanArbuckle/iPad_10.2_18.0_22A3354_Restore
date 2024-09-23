@implementation WFDictionaryParameterKeyValuePair

- (WFDictionaryParameterKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  WFDictionaryParameterKeyValuePair *v10;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFDictionaryParameterKeyValuePair initWithKey:value:identity:](self, "initWithKey:value:identity:", v8, v7, v9);

  return v10;
}

- (WFDictionaryParameterKeyValuePair)initWithKey:(id)a3 value:(id)a4 identity:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFDictionaryParameterKeyValuePair *v12;
  uint64_t v13;
  WFVariableString *key;
  uint64_t v15;
  WFPropertyListParameterValue *value;
  WFDictionaryParameterKeyValuePair *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDictionaryParameterState.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[key isKindOfClass:[WFVariableString class]]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDictionaryParameterState.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFPropertyListParameterValue class]]"));

  }
  v21.receiver = self;
  v21.super_class = (Class)WFDictionaryParameterKeyValuePair;
  v12 = -[WFDictionaryParameterKeyValuePair init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    key = v12->_key;
    v12->_key = (WFVariableString *)v13;

    v15 = objc_msgSend(v10, "copy");
    value = v12->_value;
    v12->_value = (WFPropertyListParameterValue *)v15;

    objc_storeStrong((id *)&v12->_identity, a5);
    v17 = v12;
  }

  return v12;
}

- (void)getProcessedPair:(id)a3 context:(id)a4 userInputRequiredHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFDictionaryParameterKeyValuePair key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke;
  v15[3] = &unk_1E7AEEC78;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v11, "processWithContext:completionHandler:", v14, v15);

}

- (id)containedVariables
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[WFDictionaryParameterKeyValuePair key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "variables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[WFDictionaryParameterKeyValuePair value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containedVariables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  return v3;
}

- (WFDictionaryParameterKeyValuePair)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  WFVariableString *v12;
  WFVariableString *v13;
  WFPropertyListParameterValue *v14;
  WFDictionaryParameterKeyValuePair *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("WFKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WFDeserializedVariableObject(v11, v9, v10);
    v12 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = v12;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v11);
    goto LABEL_5;
  }
  v13 = 0;
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = -[WFPropertyListParameterValue initWithSerializedRepresentation:variableProvider:parameter:]([WFPropertyListParameterValue alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v8, v9, v10);
    self = -[WFDictionaryParameterKeyValuePair initWithKey:value:](self, "initWithKey:value:", v13, v14);

    v15 = self;
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
  void *v7;

  v3 = (void *)objc_opt_new();
  -[WFDictionaryParameterKeyValuePair key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFSerializedVariableObject(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("WFKey"));

  -[WFDictionaryParameterKeyValuePair value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  return (WFPropertyListObject *)v3;
}

- (BOOL)isEqual:(id)a3
{
  WFDictionaryParameterKeyValuePair *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (WFDictionaryParameterKeyValuePair *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[WFDictionaryParameterKeyValuePair key](v4, "key"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          -[WFDictionaryParameterKeyValuePair key](self, "key"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "isEqual:", v6),
          v6,
          v5,
          v7))
    {
      -[WFDictionaryParameterKeyValuePair value](v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDictionaryParameterKeyValuePair value](self, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (WFVariableString)key
{
  return self->_key;
}

- (WFPropertyListParameterValue)value
{
  return self->_value;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

void __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke_2;
  v24[3] = &unk_1E7AED010;
  v14 = *(_QWORD *)(a1 + 40);
  v27 = *(id *)(a1 + 48);
  v25 = v9;
  v26 = v10;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke_3;
  v18[3] = &unk_1E7AED038;
  v22 = *(id *)(a1 + 56);
  v23 = a3;
  v19 = v25;
  v20 = v26;
  v21 = v11;
  v15 = v11;
  v16 = v26;
  v17 = v25;
  objc_msgSend(v12, "processWithContext:userInputRequiredHandler:valueHandler:", v14, v24, v18);

}

uint64_t __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a1[5])
    a2 = a1[5];
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a2, a3);
}

uint64_t __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a1[6])
    a3 = a1[6];
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, uint64_t))(a1[7] + 16))(a1[7], a1[4], a2, a1[8], a1[5], a3);
}

@end
