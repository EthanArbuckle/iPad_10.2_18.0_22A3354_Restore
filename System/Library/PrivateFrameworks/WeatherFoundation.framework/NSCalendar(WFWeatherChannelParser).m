@implementation NSCalendar(WFWeatherChannelParser)

- (id)wf_dateComponentsForEpochDateNumber:()WFWeatherChannelParser toUnitGranularity:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = 3146270;
  v6 = 3146334;
  if (a4 != 64)
    v6 = 3146462;
  if (a4 != 32)
    v5 = v6;
  v7 = v5 | 0x20;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(a3, "unsignedIntegerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "components:fromDate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
