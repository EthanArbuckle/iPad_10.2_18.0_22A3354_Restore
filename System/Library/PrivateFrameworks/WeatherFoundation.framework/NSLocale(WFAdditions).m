@implementation NSLocale(WFAdditions)

- (uint64_t)wf_temperatureUnit
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x24BDBCB48]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = NSLocaleTemperatureUnitToWFTemperatureUnit(v1);

  return v2;
}

- (void)setWf_temperatureUnit:()WFAdditions
{
  id v3;

  NSLocaleTemperatureUnitFromWFTemperatureUnit(a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "_setPreferredTemperatureUnit:", v3);

}

@end
