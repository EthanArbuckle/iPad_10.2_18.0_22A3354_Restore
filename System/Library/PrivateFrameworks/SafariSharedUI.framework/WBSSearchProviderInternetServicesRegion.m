@implementation WBSSearchProviderInternetServicesRegion

void ___WBSSearchProviderInternetServicesRegion_block_invoke()
{
  uint64_t v0;
  void *v1;
  __CFString *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "internetServicesRegion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v3, "copy");
  v1 = (void *)v0;
  if (v0)
    v2 = (__CFString *)v0;
  else
    v2 = &stru_1E5449658;
  objc_storeStrong((id *)&_WBSSearchProviderInternetServicesRegion_region, v2);

}

@end
