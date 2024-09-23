@implementation RERemoteTrainingClientInterface

void __RERemoteTrainingClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BC0D80);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RERemoteTrainingClientInterface_ClientInterface;
  RERemoteTrainingClientInterface_ClientInterface = v0;

}

@end
