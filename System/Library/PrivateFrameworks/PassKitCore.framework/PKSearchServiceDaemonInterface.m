@implementation PKSearchServiceDaemonInterface

void __PKSearchServiceDaemonInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2968C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_242;
  _MergedGlobals_242 = v0;

}

@end
