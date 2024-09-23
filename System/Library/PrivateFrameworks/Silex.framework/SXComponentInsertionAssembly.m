@implementation SXComponentInsertionAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v3 = a3;
  objc_msgSend(v3, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F05AC0, v5, &__block_literal_global_79);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57_15);

  objc_msgSend(v3, "privateContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_254F82CC0, &__block_literal_global_63_0);

  objc_msgSend(v3, "privateContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_254F41268, &__block_literal_global_93_1);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254F412E8, &__block_literal_global_95_0);

  objc_msgSend(v3, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerProtocol:name:factory:", &unk_254F5FD48, CFSTR("general"), &__block_literal_global_98_0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "withConfiguration:", &__block_literal_global_101_2);

  objc_msgSend(v3, "privateContainer");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v17 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_254F2A398, &__block_literal_global_104);
}

void __47__SXComponentInsertionAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addProcessor:type:", v6, 1);
}

SXComponentInsertionLayoutProcessor *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SXComponentInsertionLayoutProcessor *v3;
  void *v4;
  SXComponentInsertionLayoutProcessor *v5;

  v2 = a2;
  v3 = [SXComponentInsertionLayoutProcessor alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F82CC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXComponentInsertionLayoutProcessor initWithComponentInsertionManager:](v3, "initWithComponentInsertionManager:", v4);
  return v5;
}

SXComponentInsertionManager *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXComponentInsertionManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SXComponentInsertionManager *v8;

  v2 = a2;
  v3 = [SXComponentInsertionManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F412E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:name:", &unk_254F5FD48, CFSTR("general"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F2A398);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E5C8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SXComponentInsertionManager initWithComponentInserterManager:conditionEngine:blueprintAnalyzer:unitConverterFactory:](v3, "initWithComponentInserterManager:conditionEngine:blueprintAnalyzer:unitConverterFactory:", v4, v5, v6, v7);
  return v8;
}

uint64_t __47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resolveProtocol:", &unk_254F412E8);
}

SXComponentInserterManager *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_5()
{
  return objc_alloc_init(SXComponentInserterManager);
}

SXComponentInsertionConditionEngine *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(SXComponentInsertionConditionEngine);
}

void __47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  SXNeighbouringComponentsPlacementCondition *v4;

  v3 = a3;
  v4 = objc_alloc_init(SXNeighbouringComponentsPlacementCondition);
  objc_msgSend(v3, "addCondition:", v4);

}

SXBlueprintAnalyzer *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_8()
{
  return objc_alloc_init(SXBlueprintAnalyzer);
}

@end
