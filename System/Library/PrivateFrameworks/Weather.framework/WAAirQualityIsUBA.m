@implementation WAAirQualityIsUBA

void ___WAAirQualityIsUBA_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("DE"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_WAAirQualityIsUBA_UBACountries;
  _WAAirQualityIsUBA_UBACountries = v0;

}

@end
