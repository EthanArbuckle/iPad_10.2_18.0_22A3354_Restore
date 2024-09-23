@implementation WFChooseFromMenuArrayParameterState

- (WFChooseFromMenuArrayParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WFChooseFromMenuArrayParameterState *v14;
  uint64_t v16;
  uint64_t v17;
  WFPropertyListParameterValue *(*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __99__WFChooseFromMenuArrayParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
    v19 = &unk_1E7AF6E68;
    v20 = v8;
    v21 = v9;
    objc_msgSend(v12, "if_compactMap:", &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFArrayParameterState initWithValues:](self, "initWithValues:", v13, v16, v17, v18, v19);

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

WFPropertyListParameterValue *__99__WFChooseFromMenuArrayParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFPropertyListParameterValue *v4;
  WFPropertyListParameterValue *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[WFPropertyListParameterValue initWithChooseFromMenuString:]([WFPropertyListParameterValue alloc], "initWithChooseFromMenuString:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = -[WFPropertyListParameterValue initWithSerializedRepresentation:variableProvider:parameter:valueType:variableStringStateClass:]([WFPropertyListParameterValue alloc], "initWithSerializedRepresentation:variableProvider:parameter:valueType:variableStringStateClass:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 6, objc_opt_class());
  }
  v5 = v4;
LABEL_7:

  return v5;
}

@end
