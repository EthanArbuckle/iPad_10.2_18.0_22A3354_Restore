@implementation SHShazamEventsClientInterface

void __SHShazamEventsClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2559173B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SHShazamEventsClientInterface_interface;
  SHShazamEventsClientInterface_interface = v0;

}

@end
