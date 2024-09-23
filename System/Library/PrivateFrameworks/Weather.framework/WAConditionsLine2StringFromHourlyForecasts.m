@implementation WAConditionsLine2StringFromHourlyForecasts

uint64_t __WAConditionsLine2StringFromHourlyForecasts_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)WAConditionsLine2StringFromHourlyForecasts__percentFormatter;
  WAConditionsLine2StringFromHourlyForecasts__percentFormatter = (uint64_t)v0;

  objc_msgSend((id)WAConditionsLine2StringFromHourlyForecasts__percentFormatter, "setNumberStyle:", 3);
  return objc_msgSend((id)WAConditionsLine2StringFromHourlyForecasts__percentFormatter, "setMaximumFractionDigits:", 0);
}

@end
