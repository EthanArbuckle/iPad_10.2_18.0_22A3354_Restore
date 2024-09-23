@implementation SMWatchdogRecord

- (SMWatchdogRecord)initWithState:(id)a3 timeout:(double)a4
{
  id v7;
  SMWatchdogRecord *v8;
  SMWatchdogRecord *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMWatchdogRecord;
  v8 = -[SMWatchdogRecord init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_state, a3);
    v9->_timeout = a4;
  }

  return v9;
}

- (id)description
{
  void *v2;
  SMSessionManagerState *state;
  double timeout;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  state = self->_state;
  timeout = self->_timeout;
  -[NSDate stringFromDate](self->_startDate, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("state, %@, timeout, %.2f, startDate, %@"), state, *(_QWORD *)&timeout, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SMSessionManagerState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
