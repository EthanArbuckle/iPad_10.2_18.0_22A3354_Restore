@implementation WBSCloudHistoryServiceInterface

void __WBSCloudHistoryServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7042F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WBSCloudHistoryServiceInterface_interface;
  WBSCloudHistoryServiceInterface_interface = v0;

}

@end
