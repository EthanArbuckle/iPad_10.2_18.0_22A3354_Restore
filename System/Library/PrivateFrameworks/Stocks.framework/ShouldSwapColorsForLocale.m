@implementation ShouldSwapColorsForLocale

void __ShouldSwapColorsForLocale_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D760B08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ShouldSwapColorsForLocale_countryCodesToSwap;
  ShouldSwapColorsForLocale_countryCodesToSwap = v0;

}

@end
