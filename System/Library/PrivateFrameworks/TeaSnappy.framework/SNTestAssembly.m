@implementation SNTestAssembly

SNTestStore *__33__SNTestAssembly_loadInRegistry___block_invoke_3()
{
  return objc_alloc_init(SNTestStore);
}

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_1EFF47C88, &__block_literal_global);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerClass:factory:", objc_opt_class(), &__block_literal_global_48);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_77);

  objc_msgSend(v3, "privateContainer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v11, "registerProtocol:factory:", &unk_1EFF48010, &__block_literal_global_78);
}

SNTestRunner *__33__SNTestAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SNTestRunner *v3;
  void *v4;
  void *v5;
  void *v6;
  SNTestRunner *v7;

  v2 = a2;
  v3 = [SNTestRunner alloc];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_1EFF48010);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SNTestRunner initWithApplication:testCoordinator:testStore:](v3, "initWithApplication:testCoordinator:testStore:", v4, v5, v6);
  return v7;
}

SNTestCoordinator *__33__SNTestAssembly_loadInRegistry___block_invoke_4()
{
  SNTestCoordinator *v0;
  void *v1;
  SNTestCoordinator *v2;

  v0 = [SNTestCoordinator alloc];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[SNTestCoordinator initWithApplication:](v0, "initWithApplication:", v1);

  return v2;
}

id __33__SNTestAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
