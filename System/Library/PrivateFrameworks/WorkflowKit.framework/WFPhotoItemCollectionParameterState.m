@implementation WFPhotoItemCollectionParameterState

+ (id)processingValueClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0D43D78];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v10, v9, v8);

  return v11;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return (id)objc_msgSend(a3, "serializedRepresentation");
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = (void (**)(id, void *, _QWORD))a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getContentWithContext:completionHandler:", v10, v7);
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, 0);
  }

}

@end
