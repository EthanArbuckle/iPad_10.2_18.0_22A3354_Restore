@implementation WANumberFormatterForDisplayingAQI

uint64_t __WANumberFormatterForDisplayingAQI_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)WANumberFormatterForDisplayingAQI_aqiNumberFormatter;
  WANumberFormatterForDisplayingAQI_aqiNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)WANumberFormatterForDisplayingAQI_aqiNumberFormatter, "setNumberStyle:", 1);
}

@end
