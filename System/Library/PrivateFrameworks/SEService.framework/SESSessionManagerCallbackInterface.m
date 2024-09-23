@implementation SESSessionManagerCallbackInterface

+ (id)interface
{
  if (interface_onceToken_103 != -1)
    dispatch_once(&interface_onceToken_103, &__block_literal_global_104);
  return (id)interface_interface_102;
}

void __47__SESSessionManagerCallbackInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545DC358);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_interface_102;
  interface_interface_102 = v0;

}

@end
