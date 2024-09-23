@implementation REUpNextPeriodOfDayPredictor

- (unint64_t)currentPeriodOfDay
{
  return 0;
}

- (NSDateInterval)intervalForCurrentPeriodOfDay
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithStartDate:duration:", v3, 0.0);

  return (NSDateInterval *)v4;
}

- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithStartDate:duration:", v4, 0.0);

  return v5;
}

- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithStartDate:duration:", v4, 0.0);

  return v5;
}

@end
