@implementation REExportRelevanceEngineService

void __REExportRelevanceEngineService_block_invoke()
{
  uint64_t v0;
  void *v1;

  REExportRelevanceEngineService_SimulationProxiesLock = 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SimulationProxies;
  SimulationProxies = v0;

}

@end
