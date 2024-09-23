@implementation IMStopWatch

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    mach_timebase_info((mach_timebase_info_t)&timeBase);
}

- (IMStopWatch)init
{
  IMStopWatch *v2;
  IMStopWatch *v3;
  IMStopWatch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMStopWatch;
  v2 = -[IMStopWatch init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)stopwatchWithDescription:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDescription:", v3);

  objc_msgSend(v4, "start");
  return v4;
}

+ (id)stopwatch
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "start");
  return v2;
}

- (void)start
{
  const __CFString *descriptionString;

  self->_startTime = mach_absolute_time();
  descriptionString = (const __CFString *)self->_descriptionString;
  if (!descriptionString)
    descriptionString = &stru_1E5500770;
  NSLog(CFSTR("<%p> start%@"), self, descriptionString);
}

- (double)time
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = mach_absolute_time();
  LODWORD(v4) = timeBase;
  LODWORD(v5) = *(_DWORD *)algn_1EEAC0BF4;
  return (double)(v3 - self->_startTime) * (double)v4 / (double)v5 / 1000000000.0;
}

- (void)setDescription:(id)a3
{
  objc_class *v4;
  id v5;
  NSString *v6;
  NSString *descriptionString;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (NSString *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR(" %@"), v5);

  descriptionString = self->_descriptionString;
  self->_descriptionString = v6;

}

- (id)description
{
  void *v3;
  const __CFString *descriptionString;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_descriptionString)
    descriptionString = (const __CFString *)self->_descriptionString;
  else
    descriptionString = &stru_1E5500770;
  -[IMStopWatch time](self, "time");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p>%@: elapsed time: %0.5f"), self, descriptionString, v5);
}

- (void)report
{
  id v2;

  -[IMStopWatch description](self, "description");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v2);

}

- (void)reportWithMarker:(id)a3
{
  double v4;
  const __CFString *descriptionString;
  id v6;

  v6 = a3;
  -[IMStopWatch time](self, "time");
  descriptionString = &stru_1E5500770;
  if (self->_descriptionString)
    descriptionString = (const __CFString *)self->_descriptionString;
  NSLog(CFSTR("<%p> [%@] %@: elapsed time: %0.5fs (%0.5fms)"), self, v6, descriptionString, *(_QWORD *)&v4, v4 * 1000.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionString, 0);
}

@end
