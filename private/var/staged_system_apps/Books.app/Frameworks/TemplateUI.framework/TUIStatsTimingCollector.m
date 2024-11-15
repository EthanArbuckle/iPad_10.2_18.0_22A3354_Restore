@implementation TUIStatsTimingCollector

- (TUIStatsTimingCollector)initWithMode:(unint64_t)a3
{
  TUIStatsTimingCollector *v4;
  TUIStatsTimingCollector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIStatsTimingCollector;
  v4 = -[TUIStatsTimingCollector init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v4->_record = (a3 & 4) != 0;
    -[TUIStatsTimingCollector reset](v4, "reset");
  }
  return v5;
}

- (void)reset
{
  self->_reason = 0;
  self->_times[0] = 0u;
  self->_times[1] = 0u;
  self->_times[2] = 0u;
  self->_times[3] = 0u;
  self->_times[4] = 0u;
}

- (void)startPhase:(unint64_t)a3
{
  if (self->_record)
    self->_times[a3].start = mach_absolute_time();
}

- (void)endPhase:(unint64_t)a3
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_record)
  {
    v3 = (char *)self + 16 * a3;
    v4 = *((_QWORD *)v3 + 3);
    v5 = mach_absolute_time();
    v6 = -(uint64_t)v4;
    if (v4 >= v5)
      v6 = ~v4;
    *((_QWORD *)v3 + 4) += v5 + v6;
  }
}

- (unint64_t)elapsed:(unint64_t)a3
{
  return self->_times[a3].elapsed;
}

- (void)recordReason:(unint64_t)a3
{
  self->_reason |= a3;
}

- (void)addPhase:(unint64_t)a3 fromCollector:(id)a4
{
  self->_times[a3].elapsed += (unint64_t)objc_msgSend(a4, "elapsed:");
}

- (void)finalizeWithTimebase:(mach_timebase_info)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = 32;
  v4 = 104;
  do
  {
    *(double *)((char *)&self->super.isa + v4) = (double)a3.numer
                                               * (double)*(unint64_t *)((char *)&self->super.isa + v3)
                                               / (double)a3.denom
                                               / 1000000000.0;
    v3 += 16;
    v4 += 8;
  }
  while (v3 != 112);
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)reason
{
  return self->_reason;
}

@end
