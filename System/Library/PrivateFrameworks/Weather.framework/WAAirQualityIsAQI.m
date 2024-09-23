@implementation WAAirQualityIsAQI

void ___WAAirQualityIsAQI_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("CN"), CFSTR("US"), CFSTR("MX"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_WAAirQualityIsAQI_AQICountries;
  _WAAirQualityIsAQI_AQICountries = v0;

}

@end
