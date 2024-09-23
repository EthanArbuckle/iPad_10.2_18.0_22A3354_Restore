@implementation _dayDrainInfo

- (_dayDrainInfo)init
{
  _dayDrainInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_dayDrainInfo;
  result = -[_dayDrainInfo init](&v3, sel_init);
  if (result)
  {
    result->_drainSoFar = 0;
    result->_lastBatterySoC = 0;
  }
  return result;
}

- (int64_t)drainSoFar
{
  return self->_drainSoFar;
}

- (void)setDrainSoFar:(int64_t)a3
{
  self->_drainSoFar = a3;
}

- (int64_t)lastBatterySoC
{
  return self->_lastBatterySoC;
}

- (void)setLastBatterySoC:(int64_t)a3
{
  self->_lastBatterySoC = a3;
}

@end
