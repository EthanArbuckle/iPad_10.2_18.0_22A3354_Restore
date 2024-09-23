@implementation REPipedLocationReceiverInterface

void __REPipedLocationReceiverInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BB37E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REPipedLocationReceiverInterface_interface;
  REPipedLocationReceiverInterface_interface = v0;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)REPipedLocationReceiverInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_updateLocation_, 0, 0);

}

@end
