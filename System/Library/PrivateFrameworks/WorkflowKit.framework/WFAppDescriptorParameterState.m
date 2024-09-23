@implementation WFAppDescriptorParameterState

- (id)legacySerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "bundleIdentifier");
  else
    -[WFVariableSubstitutableParameterState serializedRepresentation](self, "serializedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(id, void *, _QWORD);
  id v23;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  WFLocalizedString(CFSTR("Select an app"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableSubstitutableParameterState value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "requiresUserConfirmation");

  if (v13)
  {
    v9[2](v9, v11, 0);
  }
  else
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v15, "prompt");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v16, 0);

      }
      else
      {

        -[WFVariableSubstitutableParameterState variable](self, "variable");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_class();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __90__WFAppDescriptorParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
        v20[3] = &unk_1E7AF7300;
        v22 = v9;
        v21 = v11;
        v23 = v10;
        objc_msgSend(v17, "getObjectRepresentationForClass:context:completionHandler:", v18, v8, v20);

        v15 = v22;
      }

    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)WFAppDescriptorParameterState;
      -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v19, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
    }
  }

}

void __90__WFAppDescriptorParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  id v13;

  v13 = a5;
  v7 = (objc_class *)MEMORY[0x1E0CBD728];
  v8 = a2;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v8, v8, 0, 0, 0, 0, 0, 0);

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolvedAppMatchingDescriptor:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "requiresUserConfirmation"))
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  else
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  v12();

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  if (!v10)
  {
    v13 = 0;
    v15 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v12)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v12);
    if (!v16)
    {
LABEL_12:
      getWFActionsLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v21 = 136315138;
        v22 = "+[WFAppDescriptorParameterState valueFromSerializedRepresentation:variableProvider:parameter:]";
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s No serialized representation to make an app descriptor", (uint8_t *)&v21, 0xCu);
      }
LABEL_20:
      v18 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    if (!v15)
    {
      v13 = 0;
      goto LABEL_12;
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithSerializedRepresentation:", v15);
    v15 = v13;
    v13 = 0;
    if (!v16)
      goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resolvedAppMatchingDescriptor:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    getWFActionsLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315394;
      v22 = "+[WFAppDescriptorParameterState valueFromSerializedRepresentation:variableProvider:parameter:]";
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Unable to resolve descriptor: %@", (uint8_t *)&v21, 0x16u);
    }

    goto LABEL_20;
  }
LABEL_21:

  return v18;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAppDescriptorParameterState.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[INAppDescriptor class]]"));

  }
  v6 = v5;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "serializedRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
