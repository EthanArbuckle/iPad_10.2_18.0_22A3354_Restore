@implementation WiFiCloudSyncEnginePruneNetworksInCloud

uint64_t __WiFiCloudSyncEnginePruneNetworksInCloud_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizeKVS");
}

@end
