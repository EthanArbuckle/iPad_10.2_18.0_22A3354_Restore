@implementation REMXPCClientInterface

+ (NSXPCInterface)interface
{
  if (interface_onceToken_26 != -1)
    dispatch_once(&interface_onceToken_26, &__block_literal_global_27_0);
  return (NSXPCInterface *)(id)interface_sInterface_25;
}

void __34__REMXPCClientInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF0F27E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_sInterface_25;
  interface_sInterface_25 = v0;

}

@end
