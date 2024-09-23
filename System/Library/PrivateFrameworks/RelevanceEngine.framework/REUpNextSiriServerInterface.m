@implementation REUpNextSiriServerInterface

void __REUpNextSiriServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BA1D68);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REUpNextSiriServerInterface_interface;
  REUpNextSiriServerInterface_interface = v0;

}

@end
