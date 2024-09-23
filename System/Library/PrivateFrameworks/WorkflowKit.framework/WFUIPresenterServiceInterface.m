@implementation WFUIPresenterServiceInterface

void __WFUIPresenterServiceInterface_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("com.apple.shortcuts.ui-presenter"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:interpreter:", &unk_1EF72A580, &__block_literal_global_190);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:interpreter:", &unk_1EF728890, &__block_literal_global_198_47907);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)WFUIPresenterServiceInterface_interface;
  WFUIPresenterServiceInterface_interface = v2;

}

id __WFUIPresenterServiceInterface_block_invoke_3(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyAsOnewayVoid");
}

id __WFUIPresenterServiceInterface_block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyAsOnewayVoid");
}

@end
