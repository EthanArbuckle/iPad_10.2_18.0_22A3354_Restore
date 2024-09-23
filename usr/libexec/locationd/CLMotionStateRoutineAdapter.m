@implementation CLMotionStateRoutineAdapter

- (CLMotionStateRoutineAdapter)initWithMotionState:(void *)a3
{
  CLMotionStateRoutineAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMotionStateRoutineAdapter;
  result = -[CLMotionStateRoutineAdapter init](&v5, "init");
  if (result)
  {
    result->_motionState = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
