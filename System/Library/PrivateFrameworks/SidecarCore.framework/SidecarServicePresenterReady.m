@implementation SidecarServicePresenterReady

void __SidecarServicePresenterReady_block_invoke(uint64_t a1)
{
  id v2;

  SidecarRelayProxyAsync((uint64_t)SidecarServicePresenterReady, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayServicePresenterReady:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_2);

}

void __SidecarServicePresenterReady_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
    _SidecarCoreLogAPIError(SidecarServicePresenterReady, a2);
}

@end
