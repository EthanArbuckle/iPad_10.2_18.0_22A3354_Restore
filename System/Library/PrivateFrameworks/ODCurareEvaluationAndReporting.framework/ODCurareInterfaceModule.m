@implementation ODCurareInterfaceModule

- (ODCurareInterfaceModule)initWithBundleIdentifier:(id)a3 evaluationInstance:(id)a4 personalizationInstance:(id)a5 pruningPolicy:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ODCurareInterfaceModule *v16;
  ODCurareInterfaceModuleInternal *v17;
  ODCurareInterfaceModuleInternal *underlyingObject;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ODCurareInterfaceModule;
  v16 = -[ODCurareInterfaceModule init](&v20, sel_init);
  if (v16)
  {
    v17 = -[ODCurareInterfaceModuleInternal initWithBundleIdentifier:evaluationInstance:personalizationInstance:pruningPolicy:error:]([ODCurareInterfaceModuleInternal alloc], "initWithBundleIdentifier:evaluationInstance:personalizationInstance:pruningPolicy:error:", v12, v13, v14, v15, a7);
    underlyingObject = v16->_underlyingObject;
    v16->_underlyingObject = v17;

  }
  return v16;
}

- (BOOL)evaluateModelsWithEvaluationModels:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[ODCurareInterfaceModule underlyingObject](self, "underlyingObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluateModelsWithEvaluationModels:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "BOOLValue");
  return (char)v7;
}

- (BOOL)personalizeModelsWithPersonalizableModels:(id)a3 personalizationPolicy:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[ODCurareInterfaceModule underlyingObject](self, "underlyingObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personalizeModelsWithPersonalizableModels:personalizationPolicy:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v11, "BOOLValue");
  return (char)v9;
}

- (id)getSelectedModelWithDefaultModel:(id)a3 selectionPolicy:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[ODCurareInterfaceModule underlyingObject](self, "underlyingObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getSelectedModelWithDefaultModel:selectionPolicy:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)generateCAReportAndReturnError:(id *)a3
{
  id v4;

  -[ODCurareInterfaceModule underlyingObject](self, "underlyingObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateCAReportAndReturnError:", a3);

}

- (ODCurareInterfaceModuleInternal)underlyingObject
{
  return (ODCurareInterfaceModuleInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
