@implementation NSXPCInterface

void __63__NSXPCInterface_ICSystemPaperExtension__ic_extensionInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DB0130);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ic_extensionInterface_extensionInterface;
  ic_extensionInterface_extensionInterface = v0;

}

void __58__NSXPCInterface_ICSystemPaperExtension__ic_hostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DAD4F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ic_hostInterface_hostInterface;
  ic_hostInterface_hostInterface = v0;

}

@end
