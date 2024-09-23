@implementation SidecarServiceProviderReady

void __SidecarServiceProviderReady_block_invoke(uint64_t a1)
{
  id v2;

  SidecarRelayProxyAsync((uint64_t)SidecarRegisterServiceProvider, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayServiceProviderReady:", *(_QWORD *)(a1 + 32));

}

@end
