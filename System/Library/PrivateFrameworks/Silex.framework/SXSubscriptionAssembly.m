@implementation SXSubscriptionAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F7C5D0, &__block_literal_global_91);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254F44D58, &__block_literal_global_59);

  objc_msgSend(v3, "publicContainer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v9, "registerProtocol:factory:", &unk_254F06CB8, &__block_literal_global_66);
}

SXSubscribeActionHandler *__41__SXSubscriptionAssembly_loadInRegistry___block_invoke()
{
  return objc_alloc_init(SXSubscribeActionHandler);
}

SXSubscriptionStatusProvider *__41__SXSubscriptionAssembly_loadInRegistry___block_invoke_2()
{
  return -[SXSubscriptionStatusProvider initWithBundleSubscriptionStatus:channelSubscriptionStatus:]([SXSubscriptionStatusProvider alloc], "initWithBundleSubscriptionStatus:channelSubscriptionStatus:", 0, 0);
}

SXSubscriptionActivationEligibilityDefaultProvider *__41__SXSubscriptionAssembly_loadInRegistry___block_invoke_3()
{
  return objc_alloc_init(SXSubscriptionActivationEligibilityDefaultProvider);
}

@end
