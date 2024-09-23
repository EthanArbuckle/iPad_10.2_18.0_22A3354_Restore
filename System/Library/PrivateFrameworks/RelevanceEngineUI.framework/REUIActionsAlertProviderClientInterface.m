@implementation REUIActionsAlertProviderClientInterface

void __REUIActionsAlertProviderClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BBB918);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REUIActionsAlertProviderClientInterface_interface;
  REUIActionsAlertProviderClientInterface_interface = v0;

}

@end
