@implementation SWCoreAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_255025DF8, &__block_literal_global_6);

  objc_msgSend(v3, "publicContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(v7, "registerProtocol:factory:", &unk_255025C18, &__block_literal_global_61_0);
}

SWLogger *__33__SWCoreAssembly_loadInRegistry___block_invoke()
{
  return objc_alloc_init(SWLogger);
}

SWLocation *__33__SWCoreAssembly_loadInRegistry___block_invoke_2()
{
  return -[SWLocation initWithContext:URL:]([SWLocation alloc], "initWithContext:URL:", CFSTR("unknown"), 0);
}

@end
