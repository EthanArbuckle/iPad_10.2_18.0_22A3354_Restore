@implementation SidecarRegisterServiceProvider

void __SidecarRegisterServiceProvider_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  +[SidecarProviderProxy defaultProxy](SidecarProviderProxy, "defaultProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", v1);

  +[SidecarProviderProxy defaultProxy](SidecarProviderProxy, "defaultProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SidecarCoreProxy defaultProxy](SidecarCoreProxy, "defaultProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  SidecarRelayProxyAsync((uint64_t)SidecarRegisterServiceProvider, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relayRegisterServiceProvider:", &__block_literal_global_26);

}

void __SidecarRegisterServiceProvider_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
    _SidecarCoreLogAPIError(SidecarRegisterServiceProvider, a2);
}

@end
