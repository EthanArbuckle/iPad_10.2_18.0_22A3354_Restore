@implementation NSXPCInterface(REMReminderCreationViewServiceInterfaces)

+ (id)rem_reminderCreationViewServiceViewControllerExportedInterface
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D6CF8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_displayForCreationWithContext_completion_, 0, 0);

  return v0;
}

+ (uint64_t)rem_reminderCreationRemoteViewControllerExportedInterface
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CE178);
}

@end
