@implementation REUIActionsAlertProviderServerInterface

void __REUIActionsAlertProviderServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BBB8B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REUIActionsAlertProviderServerInterface_interface;
  REUIActionsAlertProviderServerInterface_interface = v0;

  v2 = (void *)REUIActionsAlertProviderServerInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_displayAlertWithProperties_backgroundImageData_reply_, 0, 0);

  v4 = (void *)REUIActionsAlertProviderServerInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_displayAlertWithProperties_backgroundImageData_reply_, 1, 0);

}

@end
