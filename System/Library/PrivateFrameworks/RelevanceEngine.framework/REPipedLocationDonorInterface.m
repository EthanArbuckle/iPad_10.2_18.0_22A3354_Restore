@implementation REPipedLocationDonorInterface

void __REPipedLocationDonorInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BA8A40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REPipedLocationDonorInterface_interface;
  REPipedLocationDonorInterface_interface = v0;

}

@end
