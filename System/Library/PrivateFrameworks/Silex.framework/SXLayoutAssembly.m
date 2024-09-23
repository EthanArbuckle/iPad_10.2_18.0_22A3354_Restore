@implementation SXLayoutAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F58558, &__block_literal_global_22);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254F7CF78, &__block_literal_global_108);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_254F71590, &__block_literal_global_110_1);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_254F2A8F8, &__block_literal_global_119);

  objc_msgSend(v3, "privateContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254F715F0, &__block_literal_global_122_0);

  objc_msgSend(v3, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerProtocol:factory:", &unk_254F05AC0, &__block_literal_global_125);

  objc_msgSend(v3, "privateContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerProtocol:factory:", &unk_254F7FF90, &__block_literal_global_135);

  objc_msgSend(v3, "privateContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_254F70468, &__block_literal_global_166);

  objc_msgSend(v3, "privateContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerProtocol:factory:", &unk_254F525A8, &__block_literal_global_179);

  objc_msgSend(v3, "privateContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "registerProtocol:factory:", &unk_254F711E0, &__block_literal_global_186);

  objc_msgSend(v3, "privateContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "registerProtocol:factory:", &unk_254F6F8B0, &__block_literal_global_196);

  objc_msgSend(v3, "privateContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "registerProtocol:factory:", &unk_254F1EA10, &__block_literal_global_199);

  objc_msgSend(v3, "privateContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v28, "registerClass:factory:", objc_opt_class(), &__block_literal_global_202);

  objc_msgSend(v3, "privateContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v30, "registerProtocol:factory:", &unk_254F6F128, &__block_literal_global_204);

  objc_msgSend(v3, "privateContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v32, "registerClass:factory:", objc_opt_class(), &__block_literal_global_208);

  objc_msgSend(v3, "publicContainer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(v34, "registerProtocol:factory:", &unk_254F16998, &__block_literal_global_228_0);

  objc_msgSend(v3, "privateContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v36, "registerProtocol:factory:", &unk_254F3E710, &__block_literal_global_231_0);

  objc_msgSend(v3, "publicContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_msgSend(v38, "registerProtocol:factory:", &unk_254F3E5C8, &__block_literal_global_234_0);

  objc_msgSend(v3, "privateContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v40, "registerClass:factory:", objc_opt_class(), &__block_literal_global_237);

  objc_msgSend(v3, "privateContainer");
  v43 = (id)objc_claimAutoreleasedReturnValue();

  v42 = (id)objc_msgSend(v43, "registerProtocol:factory:", &unk_254F09E30, &__block_literal_global_239);
}

SXLayoutCoordinator *__35__SXLayoutAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXLayoutCoordinator *v12;
  SXLayoutCoordinator *v14;

  v2 = a2;
  v14 = [SXLayoutCoordinator alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F05AC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F7FF90);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6F128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F715F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F09E30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SXLayoutCoordinator initWithPipeline:integrator:instructionFactory:invalidationManager:blueprintProvider:DOMObjectProvider:layoutParametersManager:documentProvider:layoutPolicyManager:](v14, "initWithPipeline:integrator:instructionFactory:invalidationManager:blueprintProvider:DOMObjectProvider:layoutParametersManager:documentProvider:layoutPolicyManager:", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

id __35__SXLayoutAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __35__SXLayoutAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resolveProtocol:", &unk_254F715F0);
}

SXColumnCalculator *__35__SXLayoutAssembly_loadInRegistry___block_invoke_4()
{
  return objc_alloc_init(SXColumnCalculator);
}

SXLayoutInvalidationManager *__35__SXLayoutAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXLayoutInvalidationManager *v3;
  void *v4;
  SXLayoutInvalidationManager *v5;

  v2 = a2;
  v3 = [SXLayoutInvalidationManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F7CF78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXLayoutInvalidationManager initWithBlueprintProvider:](v3, "initWithBlueprintProvider:", v4);
  return v5;
}

SXLayoutPipeline *__35__SXLayoutAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  SXLayoutPipeline *v3;
  void *v4;
  void *v5;
  SXLayoutPipeline *v6;
  void *v7;

  v2 = a2;
  v3 = [SXLayoutPipeline alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F711E0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F40058);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SXLayoutPipeline initWithLayoutOperationFactory:DOMObjectProviderFactory:](v3, "initWithLayoutOperationFactory:DOMObjectProviderFactory:", v4, v5);

  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXLayoutPipeline addProcessor:type:](v6, "addProcessor:type:", v7, 1);
  return v6;
}

uint64_t __35__SXLayoutAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resolveProtocol:", &unk_254F80080);
}

SXLayouterFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  SXLayouterFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  SXLayouterFactory *v7;

  v2 = a2;
  v3 = [SXLayouterFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F2A8F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E710);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E5C8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXLayouterFactory initWithColumnCalculator:layoutContextFactory:unitConverterFactory:](v3, "initWithColumnCalculator:layoutContextFactory:unitConverterFactory:", v4, v5, v6);
  return v7;
}

SXLayoutBlueprintFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  SXLayoutBlueprintFactory *v3;
  void *v4;
  void *v5;
  SXLayoutBlueprintFactory *v6;

  v2 = a2;
  v3 = [SXLayoutBlueprintFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1EA10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E5C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXLayoutBlueprintFactory initWithComponentBlueprintFactory:unitConverterFactory:](v3, "initWithComponentBlueprintFactory:unitConverterFactory:", v4, v5);
  return v6;
}

SXLayoutOperationFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  SXLayoutOperationFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXLayoutOperationFactory *v9;

  v2 = a2;
  v3 = [SXLayoutOperationFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6F8B0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F525A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70468);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E710);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E5C8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SXLayoutOperationFactory initWithComponentSizerEngine:layoutBlueprintFactory:layouterFactory:layoutContextFactory:unitConverterFactory:](v3, "initWithComponentSizerEngine:layoutBlueprintFactory:layouterFactory:layoutContextFactory:unitConverterFactory:", v4, v5, v6, v7, v8);
  return v9;
}

SXComponentSizerEngine *__35__SXLayoutAssembly_loadInRegistry___block_invoke_11()
{
  return objc_alloc_init(SXComponentSizerEngine);
}

SXComponentBlueprintFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_12()
{
  return objc_alloc_init(SXComponentBlueprintFactory);
}

SXLayoutBlueprintProvider *__35__SXLayoutAssembly_loadInRegistry___block_invoke_13()
{
  return objc_alloc_init(SXLayoutBlueprintProvider);
}

SXLayoutInstructionFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  SXLayoutInstructionFactory *v3;
  void *v4;
  SXLayoutInstructionFactory *v5;

  v2 = a2;
  v3 = [SXLayoutInstructionFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3C320);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXLayoutInstructionFactory initWithPresentationAttributesProvider:](v3, "initWithPresentationAttributesProvider:", v4);
  return v5;
}

SXLayoutFinalizationProcessor *__35__SXLayoutAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  SXLayoutFinalizationProcessor *v3;
  void *v4;
  SXLayoutFinalizationProcessor *v5;

  v2 = a2;
  v3 = [SXLayoutFinalizationProcessor alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E5C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXLayoutFinalizationProcessor initWithUnitConverterFactory:](v3, "initWithUnitConverterFactory:", v4);
  return v5;
}

SXDebugLayoutOptionsProvider *__35__SXLayoutAssembly_loadInRegistry___block_invoke_16()
{
  return objc_alloc_init(SXDebugLayoutOptionsProvider);
}

SXLayoutContextFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_17()
{
  return objc_alloc_init(SXLayoutContextFactory);
}

SXUnitConverterFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_18()
{
  return objc_alloc_init(SXUnitConverterFactory);
}

SXLayoutParametersManager *__35__SXLayoutAssembly_loadInRegistry___block_invoke_19()
{
  return objc_alloc_init(SXLayoutParametersManager);
}

SXLayoutPolicyManager *__35__SXLayoutAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  SXLayoutPolicyManager *v3;
  void *v4;
  void *v5;
  SXLayoutPolicyManager *v6;

  v2 = a2;
  v3 = [SXLayoutPolicyManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F706C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXLayoutPolicyManager initWithDocumentProvider:hintsConfigurationOptionProvider:](v3, "initWithDocumentProvider:hintsConfigurationOptionProvider:", v4, v5);
  return v6;
}

@end
