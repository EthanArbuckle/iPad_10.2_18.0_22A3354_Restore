@implementation WAAirQualityIsDAQI

void ___WAAirQualityIsDAQI_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("GB"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_WAAirQualityIsDAQI_DAQICountries;
  _WAAirQualityIsDAQI_DAQICountries = v0;

}

@end
