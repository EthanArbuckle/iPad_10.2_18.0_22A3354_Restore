@implementation SHShazamEventsServiceInterface

void __SHShazamEventsServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255917590);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SHShazamEventsServiceInterface_interface;
  SHShazamEventsServiceInterface_interface = v0;

}

@end
