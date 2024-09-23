@implementation SUSUIFakeSUAutoInstallForecast

- (int64_t)scheduleType
{
  return 1;
}

- (id)unlockStartDate
{
  double v2;
  void *v4;

  v4 = (void *)MEMORY[0x24BDBCE60];
  -[SUSUIFakeSUAutoInstallForecast _now](self, "_now");
  return (id)objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:", v2 + 18000.0);
}

- (id)unlockEndDate
{
  double v2;
  void *v4;

  v4 = (void *)MEMORY[0x24BDBCE60];
  -[SUSUIFakeSUAutoInstallForecast _now](self, "_now");
  return (id)objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:", v2 + 28800.0);
}

- (id)suStartDate
{
  double v2;
  void *v4;

  v4 = (void *)MEMORY[0x24BDBCE60];
  -[SUSUIFakeSUAutoInstallForecast _now](self, "_now");
  return (id)objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:", v2 + 43200.0);
}

- (id)suEndDate
{
  double v2;
  void *v4;

  v4 = (void *)MEMORY[0x24BDBCE60];
  -[SUSUIFakeSUAutoInstallForecast _now](self, "_now");
  return (id)objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:", v2 + 57600.0);
}

- (id)firstUnlock
{
  double v2;
  void *v4;

  v4 = (void *)MEMORY[0x24BDBCE60];
  -[SUSUIFakeSUAutoInstallForecast _now](self, "_now");
  return (id)objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:", v2 + 10800.0);
}

- (double)_now
{
  double v2;

  if (self->_now == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_now = v2;
  }
  return self->_now;
}

@end
