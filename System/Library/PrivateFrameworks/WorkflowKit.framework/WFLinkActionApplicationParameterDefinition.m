@implementation WFLinkActionApplicationParameterDefinition

- (WFLinkActionApplicationParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionApplicationParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D10];
  v5 = a3;
  objc_msgSend(v4, "applicationValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionApplicationParameterDefinition;
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

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  void *v16;
  id v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v17 = v11;
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v17, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v16, 0);

  }
  else
  {

    v14[2](v14, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  WFAppDescriptorParameterState *v6;
  void *v7;
  WFAppDescriptorParameterState *v8;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (objc_msgSend(v5, "length"))
  {
    v6 = [WFAppDescriptorParameterState alloc];
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v5);
    v8 = -[WFVariableSubstitutableParameterState initWithValue:](v6, "initWithValue:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
