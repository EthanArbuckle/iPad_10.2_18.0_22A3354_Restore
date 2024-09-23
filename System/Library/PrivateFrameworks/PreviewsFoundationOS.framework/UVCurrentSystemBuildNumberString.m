@implementation UVCurrentSystemBuildNumberString

void __UVCurrentSystemBuildNumberString_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)_CFCopySystemVersionDictionary();
  if (!v0)
    v0 = (void *)_CFCopyServerVersionDictionary();
  v3 = v0;
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BDBD1F0]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)UVCurrentSystemBuildNumberString_cachedValue;
  UVCurrentSystemBuildNumberString_cachedValue = v1;

}

@end
