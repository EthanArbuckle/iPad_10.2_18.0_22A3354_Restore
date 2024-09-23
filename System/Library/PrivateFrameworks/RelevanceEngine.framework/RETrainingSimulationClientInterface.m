@implementation RETrainingSimulationClientInterface

void __RETrainingSimulationClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BB0318);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RETrainingSimulationClientInterface_ClientInterface;
  RETrainingSimulationClientInterface_ClientInterface = v0;

}

@end
