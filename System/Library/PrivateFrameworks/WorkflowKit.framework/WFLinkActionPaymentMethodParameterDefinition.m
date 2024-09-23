@implementation WFLinkActionPaymentMethodParameterDefinition

- (WFLinkActionPaymentMethodParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionPaymentMethodParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D10];
  v5 = a3;
  objc_msgSend(v4, "paymentMethodValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionPaymentMethodParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (id)linkValueFromParameterState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFLinkActionPaymentMethodParameterDefinition *v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_alloc(MEMORY[0x1E0CBDA50]);
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identificationHint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "icon");
    v17 = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v5, "initWithType:name:identificationHint:icon:", v7, v9, v11, v13);

    -[WFLinkActionParameterDefinition linkValueWithValue:](v17, "linkValueWithValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  id v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v16 = v11;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15, 0);

  }
  else
  {

    v14[2](v14, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v3;
  WFINPaymentMethodParameterState *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = -[WFVariableSubstitutableParameterState initWithValue:]([WFINPaymentMethodParameterState alloc], "initWithValue:", v3);
  else
    v4 = 0;

  return v4;
}

@end
