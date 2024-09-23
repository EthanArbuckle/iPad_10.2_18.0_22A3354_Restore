@implementation SVXClientServiceCreateXPCInterface

void __SVXClientServiceCreateXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D9C7E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SVXClientServiceCreateXPCInterface_sharedInterface;
  SVXClientServiceCreateXPCInterface_sharedInterface = v0;

}

@end
