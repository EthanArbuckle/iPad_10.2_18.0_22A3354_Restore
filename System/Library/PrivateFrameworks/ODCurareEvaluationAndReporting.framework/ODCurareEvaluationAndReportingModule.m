@implementation ODCurareEvaluationAndReportingModule

- (ODCurareEvaluationAndReportingModule)initWithBundleIdentifier:(id)a3 dataProviderInstance:(id)a4 evaluationInstance:(id)a5 personalizationInstance:(id)a6 pruningPolicy:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ODCurareEvaluationAndReportingModule *v19;
  ODCurareEvaluationAndReportingModuleInternal *v20;
  ODCurareEvaluationAndReportingModuleInternal *underlyingObject;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ODCurareEvaluationAndReportingModule;
  v19 = -[ODCurareEvaluationAndReportingModule init](&v23, sel_init);
  if (v19)
  {
    v20 = -[ODCurareEvaluationAndReportingModuleInternal initWithBundleIdentifier:dataProviderInstance:evaluationInstance:personalizationInstance:pruningPolicy:error:]([ODCurareEvaluationAndReportingModuleInternal alloc], "initWithBundleIdentifier:dataProviderInstance:evaluationInstance:personalizationInstance:pruningPolicy:error:", v14, v15, v16, v17, v18, a8);
    underlyingObject = v19->_underlyingObject;
    v19->_underlyingObject = v20;

  }
  return v19;
}

- (id)getSelectedModel:(id *)a3
{
  void *v4;
  void *v5;

  -[ODCurareEvaluationAndReportingModule underlyingObject](self, "underlyingObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSelectedModelAndReturnError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)trainAndEvaluateModelsWithCandidateModels:(id)a3 personalizationPolicy:(id)a4 selectionPolicy:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[ODCurareEvaluationAndReportingModule underlyingObject](self, "underlyingObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trainAndEvaluateModelsWithCandidateModels:personalizationPolicy:modelSelectionPolicy:error:", v12, v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = objc_msgSend(v14, "BOOLValue");
  return (char)v11;
}

- (BOOL)evaluateDefaultModelWithDefaultModelPath:(id)a3 modelConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[ODCurareEvaluationAndReportingModule underlyingObject](self, "underlyingObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "evaluateDefaultModelWithDefaultModelPath:modelConfiguration:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v11, "BOOLValue");
  return (char)v9;
}

- (BOOL)trainAndEvaluateAdaptedModelsWithAdaptableModelPath:(id)a3 modelConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[ODCurareEvaluationAndReportingModule underlyingObject](self, "underlyingObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trainAndEvaluateAdaptedModelsWithAdaptableModelPath:modelConfiguration:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v11, "BOOLValue");
  return (char)v9;
}

- (id)getEvaluationResults
{
  void *v2;
  void *v3;

  -[ODCurareEvaluationAndReportingModule underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getEvaluationResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ODCurareEvaluationAndReportingModuleInternal)underlyingObject
{
  return (ODCurareEvaluationAndReportingModuleInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
