@implementation NSXPCInterface

uint64_t __55__NSXPCInterface_TUUIXPCClientSupport__clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B6C18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface_interface;
  clientInterface_interface = v0;

  return objc_msgSend((id)clientInterface_interface, "setAllowedClassesForClientProtocol");
}

uint64_t __53__NSXPCInterface_TUUIXPCClientSupport__hostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3AF130);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hostInterface_interface;
  hostInterface_interface = v0;

  return objc_msgSend((id)hostInterface_interface, "setAllowedClassesForHostProtocol");
}

@end
