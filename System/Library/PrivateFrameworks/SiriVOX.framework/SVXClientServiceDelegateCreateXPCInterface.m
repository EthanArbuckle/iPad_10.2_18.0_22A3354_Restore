@implementation SVXClientServiceDelegateCreateXPCInterface

void __SVXClientServiceDelegateCreateXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D9CC98);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SVXClientServiceDelegateCreateXPCInterface_sharedInterface;
  SVXClientServiceDelegateCreateXPCInterface_sharedInterface = v0;

}

@end
