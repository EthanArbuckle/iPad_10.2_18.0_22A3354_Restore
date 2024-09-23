@implementation SidecarRegisterServicePresenter

void __SidecarRegisterServicePresenter_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  +[SidecarCoreProxy defaultProxy](SidecarCoreProxy, "defaultProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPresenterDelegate:", v1);

  SidecarRelayProxyAsync((uint64_t)SidecarRegisterServicePresenter, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relayRegisterServicePresenter:", &__block_literal_global_958);

}

void __SidecarRegisterServicePresenter_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
    _SidecarCoreLogAPIError(SidecarRegisterServicePresenter, a2);
}

@end
