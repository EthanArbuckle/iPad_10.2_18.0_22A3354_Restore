@implementation _AppLoggingInfo

- (_AppLoggingInfo)initWithPid:(int)a3
{
  _AppLoggingInfo *v4;
  _AppLoggingInfo *v5;
  uint64_t v6;
  NSDate *startDate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_AppLoggingInfo;
  v4 = -[_AppLoggingInfo init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

  }
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PID: %d, Start date: %@"), self->_pid, self->_startDate);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
