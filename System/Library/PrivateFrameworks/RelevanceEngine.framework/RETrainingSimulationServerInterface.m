@implementation RETrainingSimulationServerInterface

uint64_t __RETrainingSimulationServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BA0218);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RETrainingSimulationServerInterface_ServerInterface;
  RETrainingSimulationServerInterface_ServerInterface = v0;

  return REConfigureTrainingSimulationServerXPCInterface(RETrainingSimulationServerInterface_ServerInterface);
}

@end
