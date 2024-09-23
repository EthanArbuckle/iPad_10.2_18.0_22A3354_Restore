@implementation PAWorkInProgressAccessInterval

- (PAWorkInProgressAccessInterval)init
{
  PAWorkInProgressAccessInterval *v2;
  PAWorkInProgressAccessInterval *v3;
  PAWorkInProgressAccessInterval *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAWorkInProgressAccessInterval;
  v2 = -[PAWorkInProgressAccessInterval init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_startTime = xmmword_1A5E020D0;
    v4 = v2;
  }

  return v3;
}

- (id)asSealedRecord
{
  double v2;
  PAPartialAccessRecord *v3;

  v2 = fabs(self->_endTime);
  if (fabs(self->_startTime) == INFINITY)
  {
    if (v2 == INFINITY)
      v3 = 0;
    else
      v3 = -[PAPartialAccessRecord initWithAccess:endTime:]([PAPartialAccessRecord alloc], "initWithAccess:endTime:", self->_access, self->_endTime);
  }
  else if (v2 == INFINITY)
  {
    v3 = -[PAOngoingAccessRecord initWithAccess:startTime:]([PAOngoingAccessRecord alloc], "initWithAccess:startTime:", self->_access, self->_startTime);
  }
  else
  {
    v3 = -[PACompleteAccessRecord initWithAccess:startTime:endTime:]([PACompleteAccessRecord alloc], "initWithAccess:startTime:endTime:", self->_access, self->_startTime, self->_endTime);
  }
  return v3;
}

- (PAAccess)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
  objc_storeStrong((id *)&self->_access, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
}

@end
