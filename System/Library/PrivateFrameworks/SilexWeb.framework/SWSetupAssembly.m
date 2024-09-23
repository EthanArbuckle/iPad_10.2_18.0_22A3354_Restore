@implementation SWSetupAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_25501BE78, v5, &__block_literal_global_4);

  objc_msgSend(v3, "privateContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerClass:factory:", objc_opt_class(), &__block_literal_global_49);

  objc_msgSend(v3, "privateContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_60);

  objc_msgSend(v3, "privateContainer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v11, "registerClass:factory:", objc_opt_class(), &__block_literal_global_62);
}

void __34__SWSetupAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a2;
  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTask:", v5);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTask:", v6);

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addTask:", v7);
  objc_msgSend(v8, "performTasks");

}

SWScriptsSetupTask *__34__SWSetupAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SWScriptsSetupTask *v3;
  void *v4;
  SWScriptsSetupTask *v5;

  v2 = a2;
  v3 = [SWScriptsSetupTask alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033D60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWScriptsSetupTask initWithScriptsManager:](v3, "initWithScriptsManager:", v4);
  return v5;
}

SWDatastoreSetupTask *__34__SWSetupAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SWDatastoreSetupTask *v3;
  void *v4;
  void *v5;
  SWDatastoreSetupTask *v6;

  v2 = a2;
  v3 = [SWDatastoreSetupTask alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_2550252C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033D60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWDatastoreSetupTask initWithDatastoreManager:scriptsManager:](v3, "initWithDatastoreManager:scriptsManager:", v4, v5);
  return v6;
}

SWLocalDatastoreSetupTask *__34__SWSetupAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SWLocalDatastoreSetupTask *v3;
  void *v4;
  void *v5;
  SWLocalDatastoreSetupTask *v6;

  v2 = a2;
  v3 = [SWLocalDatastoreSetupTask alloc];
  objc_msgSend(v2, "resolveProtocol:name:", &unk_2550252C0, CFSTR("local"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033D60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWLocalDatastoreSetupTask initWithDatastoreManager:scriptsManager:](v3, "initWithDatastoreManager:scriptsManager:", v4, v5);
  return v6;
}

@end
