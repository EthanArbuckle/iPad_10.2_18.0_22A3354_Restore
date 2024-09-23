@implementation REMXPCIndexingPerformerInterface

+ (id)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global_0);
  return (id)interface_result;
}

void __45__REMXPCIndexingPerformerInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10E208);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_result;
  interface_result = v0;

}

@end
