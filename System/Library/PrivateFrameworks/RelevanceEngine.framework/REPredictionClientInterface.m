@implementation REPredictionClientInterface

void __REPredictionClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BC0E40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REPredictionClientInterface_interface;
  REPredictionClientInterface_interface = v0;

}

@end
