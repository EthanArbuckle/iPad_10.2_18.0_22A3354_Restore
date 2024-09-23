@implementation NSDate(TransparencyDate)

+ (double)kt_currentTimeMs
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1 * 1000.0;

  return v2;
}

- (BOOL)kt_isEqualWithinOneMillisecond:()TransparencyDate
{
  id v4;
  _BOOL8 v5;
  double v6;

  v4 = a3;
  if (a1 == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && a1 && v4)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:", a1);
      v5 = fabs(v6) * 1000.0 < 1.0;
    }
  }

  return v5;
}

- (uint64_t)kt_dateToString
{
  void *v1;
  uint64_t v2;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "timeIntervalSince1970");
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%f"), v2);
}

+ (uint64_t)kt_dateFromString:()TransparencyDate
{
  void *v3;

  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a3, "doubleValue");
  return objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
}

- (id)kt_toISO_8601_UTCString
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  objc_msgSend(v2, "stringFromDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)kt_fuzzyDate
{
  void *v2;
  void *v3;

  if (kt_fuzzyDate_onceToken[0] != -1)
    dispatch_once(kt_fuzzyDate_onceToken, &__block_literal_global_17);
  objc_msgSend((id)kt_fuzzyDate_zulu, "components:fromDate:", 28, a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)kt_fuzzyDate_zulu, "dateFromComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
