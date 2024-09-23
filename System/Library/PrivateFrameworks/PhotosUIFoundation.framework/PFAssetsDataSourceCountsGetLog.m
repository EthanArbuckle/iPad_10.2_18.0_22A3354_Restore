@implementation PFAssetsDataSourceCountsGetLog

void __PFAssetsDataSourceCountsGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE71BC8], "AssetsDataSourceCounts");
  v1 = (void *)PFAssetsDataSourceCountsGetLog_log;
  PFAssetsDataSourceCountsGetLog_log = (uint64_t)v0;

}

@end
