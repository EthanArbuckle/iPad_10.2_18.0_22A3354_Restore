@implementation MSDSessionTimeIntervalDataPoint

- (MSDSessionTimeIntervalDataPoint)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6;
  id v7;
  MSDSessionTimeIntervalDataPoint *v8;
  MSDSessionTimeIntervalDataPoint *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDSessionTimeIntervalDataPoint;
  v8 = -[MSDSessionTimeIntervalDataPoint init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDSessionTimeIntervalDataPoint getTimeIntervalWithStart:end:](v8, "getTimeIntervalWithStart:end:", v6, v7);
    -[MSDSessionTimeIntervalDataPoint setInterval:](v9, "setInterval:");
  }

  return v9;
}

- (double)getTimeIntervalWithStart:(id)a3 end:(id)a4
{
  double result;

  if (!a3 || !a4)
    return -1.0;
  objc_msgSend(a4, "timeIntervalSinceDate:");
  return result;
}

- (id)print
{
  uint64_t v2;

  -[MSDSessionTimeIntervalDataPoint interval](self, "interval");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v2);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

@end
