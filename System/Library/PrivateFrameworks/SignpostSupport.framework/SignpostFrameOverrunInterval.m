@implementation SignpostFrameOverrunInterval

- (SignpostFrameOverrunInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 timebaseRatio:(double)a5 class:(unint64_t)a6
{
  SignpostFrameOverrunInterval *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SignpostFrameOverrunInterval;
  result = -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](&v8, sel_initWithStartMCT_endMCT_timebaseRatio_, a3, a4, a5);
  if (result)
    result->_overrunClass = a6;
  return result;
}

- (unint64_t)overrunType
{
  return self->_overrunType;
}

- (void)setOverrunType:(unint64_t)a3
{
  self->_overrunType = a3;
}

- (unint64_t)overrunClass
{
  return self->_overrunClass;
}

- (void)setOverrunClass:(unint64_t)a3
{
  self->_overrunClass = a3;
}

@end
