@implementation PUIIsPlatformSupported

uint64_t __PUIIsPlatformSupported_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t result;
  char v5;
  char v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    result = _os_feature_enabled_impl();
    v5 = 1;
  }
  else
  {
    v6 = _os_feature_enabled_impl();
    result = 0;
    v5 = v6 ^ 1;
  }
  v7 = v5 ^ 1;
  if (v1)
    v7 = 0;
  PUIIsPlatformSupported_isPlatformSupported = v7 | result;
  return result;
}

@end
