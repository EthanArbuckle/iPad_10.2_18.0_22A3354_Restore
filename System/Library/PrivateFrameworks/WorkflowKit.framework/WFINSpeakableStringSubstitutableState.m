@implementation WFINSpeakableStringSubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "prompt");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13, 0);

    }
    else
    {

      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __98__WFINSpeakableStringSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_1E7AEEF80;
      v17[4] = self;
      v18 = v10;
      objc_msgSend(v14, "getObjectRepresentationForClass:context:completionHandler:", v15, v8, v17);

      v12 = v18;
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFINSpeakableStringSubstitutableState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v16, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }

}

- (BOOL)stateIsEquivalent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

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
  v10 = v9;

  v11 = 0;
  if (v7 && v10)
  {
    objc_msgSend(v7, "vocabularyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vocabularyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v7, "spokenPhrase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "spokenPhrase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "isEqualToString:", v15);

    }
  }

  return v11;
}

void __98__WFINSpeakableStringSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void (*v12)(uint64_t, _QWORD, id);
  id v13;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  if (v7)
  {
    v9 = a5;
    v10 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "processingValueClass"));
    objc_msgSend(v10, "wf_initWithIdentifier:displayString:", 0, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v11, v9);

  }
  else
  {
    v12 = *(void (**)(uint64_t, _QWORD, id))(v8 + 16);
    v10 = a5;
    v12(v8, 0, v10);
  }

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return WFSerializedRepresentationFromWFINObject(a3);
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6;
  void *v7;

  v6 = a3;
  WFINObjectFromSerializedRepresentation(v6, (objc_class *)objc_msgSend(a1, "processingValueClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
