@implementation NSXPCInterface

void __80__NSXPCInterface_LTUIViewServiceExtension____LTUI_viewServiceExtensionInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D5F20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__LTUI_viewServiceExtensionInterface_interface;
  __LTUI_viewServiceExtensionInterface_interface = v0;

}

void __84__NSXPCInterface_LTUIViewServiceExtension____LTUI_viewServiceExtensionHostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CFD58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__LTUI_viewServiceExtensionHostInterface_interface;
  __LTUI_viewServiceExtensionHostInterface_interface = v0;

}

@end
