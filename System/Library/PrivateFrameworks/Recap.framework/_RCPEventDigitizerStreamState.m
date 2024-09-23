@implementation _RCPEventDigitizerStreamState

+ (id)streamStateWithEnvironment:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setEnvironment:", v3);

  objc_msgSend(v4, "setEventNumber:", -1);
  return v4;
}

- (void)ingestEvent:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  int64_t v7;
  int64_t countOfContactsTouching;
  int64_t v9;
  BOOL v10;
  double v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (self->_eventNumber == -1)
  {
    -[RCPEventEnvironment timeIntervalForMachAbsoluteTime:](self->_environment, "timeIntervalForMachAbsoluteTime:", objc_msgSend(v4, "deliveryTimestamp"));
    v4 = v12;
    self->_streamStartTimeInterval = v5;
  }
  v6 = objc_msgSend(v4, "hidEvent");
  if (IOHIDEventGetType() == 11)
  {
    v7 = _RCPEventHIDDigitizerEventCountOfTouchingContacts(v6);
    countOfContactsTouching = self->_countOfContactsTouching;
    v9 = v7 - countOfContactsTouching;
    v10 = v7 != countOfContactsTouching;
    self->_countOfContactsTouching = v7;
    self->_countOfContactsChangeAmount = v9;
  }
  else
  {
    v10 = 0;
  }
  self->_countOfContactsTouchingDidChange = v10;
  -[RCPEventEnvironment timeIntervalForMachAbsoluteTime:](self->_environment, "timeIntervalForMachAbsoluteTime:", objc_msgSend(v12, "deliveryTimestamp"));
  self->_timeIntervalSinceStreamStart = v11 - self->_streamStartTimeInterval;
  ++self->_eventNumber;

}

- (double)timeIntervalSinceStreamStart
{
  return self->_timeIntervalSinceStreamStart;
}

- (void)setTimeIntervalSinceStreamStart:(double)a3
{
  self->_timeIntervalSinceStreamStart = a3;
}

- (BOOL)countOfContactsTouchingDidChange
{
  return self->_countOfContactsTouchingDidChange;
}

- (void)setCountOfContactsTouchingDidChange:(BOOL)a3
{
  self->_countOfContactsTouchingDidChange = a3;
}

- (int64_t)countOfContactsTouching
{
  return self->_countOfContactsTouching;
}

- (void)setCountOfContactsTouching:(int64_t)a3
{
  self->_countOfContactsTouching = a3;
}

- (int64_t)countOfContactsChangeAmount
{
  return self->_countOfContactsChangeAmount;
}

- (int64_t)eventNumber
{
  return self->_eventNumber;
}

- (void)setEventNumber:(int64_t)a3
{
  self->_eventNumber = a3;
}

- (RCPEventEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (double)streamStartTimeInterval
{
  return self->_streamStartTimeInterval;
}

- (void)setStreamStartTimeInterval:(double)a3
{
  self->_streamStartTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
