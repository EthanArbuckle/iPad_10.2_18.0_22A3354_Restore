@implementation REMXPCSyncInterfacePerformerInterface

+ (id)interface
{
  if (interface_onceToken_0 != -1)
    dispatch_once(&interface_onceToken_0, &__block_literal_global_6);
  return (id)interface_result_0;
}

void __50__REMXPCSyncInterfacePerformerInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10E268);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_result_0;
  interface_result_0 = v0;

}

@end
