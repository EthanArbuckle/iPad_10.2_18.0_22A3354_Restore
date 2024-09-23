@implementation BCStopWatch

+ (void)initialize
{
  if ((id)objc_opt_class(BCStopWatch, a2) == a1)
    mach_timebase_info((mach_timebase_info_t)&dword_30D5A4);
}

- (BCStopWatch)init
{
  BCStopWatch *v2;
  BCStopWatch *v3;
  BCStopWatch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCStopWatch;
  v2 = -[BCStopWatch init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)stopwatchWithDescription:(id)a3
{
  id v3;
  BCStopWatch *v4;

  v3 = a3;
  v4 = objc_opt_new(BCStopWatch);
  -[BCStopWatch setDescription:](v4, "setDescription:", v3);

  -[BCStopWatch start](v4, "start");
  return v4;
}

+ (id)stopwatch
{
  BCStopWatch *v2;

  v2 = objc_opt_new(BCStopWatch);
  -[BCStopWatch start](v2, "start");
  return v2;
}

- (void)start
{
  const __CFString *description;

  self->_startTime = mach_absolute_time();
  description = (const __CFString *)self->_description;
  if (!description)
    description = &stru_296430;
  NSLog(CFSTR("<%p> start%@"), self, description);
}

- (double)time
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = mach_absolute_time();
  LODWORD(v4) = dword_30D5A4;
  LODWORD(v5) = *(_DWORD *)algn_30D5A8;
  return (double)(v3 - self->_startTime) * (double)v4 / (double)v5 / 1000000000.0;
}

- (void)setDescription:(id)a3
{
  id v4;
  NSString *v5;
  NSString *description;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR(" %@"), v4);

  description = self->_description;
  self->_description = v5;

}

- (id)description
{
  const __CFString *description;
  uint64_t v4;

  if (self->_description)
    description = (const __CFString *)self->_description;
  else
    description = &stru_296430;
  -[BCStopWatch time](self, "time");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p>%@: elapsed time: %0.5f"), self, description, v4);
}

- (void)report
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BCStopWatch description](self, "description"));
  NSLog(CFSTR("%@"), v2);

}

- (void)reportWithMarker:(id)a3
{
  double v4;
  const __CFString *description;
  id v6;

  v6 = a3;
  -[BCStopWatch time](self, "time");
  description = &stru_296430;
  if (self->_description)
    description = (const __CFString *)self->_description;
  NSLog(CFSTR("<%p> [%@] %@: elapsed time: %0.5fs (%0.5fms)"), self, v6, description, *(_QWORD *)&v4, v4 * 1000.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

@end
