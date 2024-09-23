@implementation PUValueFilter

- (PUValueFilter)init
{
  return -[PUValueFilter initWithValue:](self, "initWithValue:", 0.0);
}

- (PUValueFilter)initWithValue:(double)a3
{
  PUValueFilter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUValueFilter;
  result = -[PUValueFilter init](&v5, sel_init);
  if (result)
    result->_currentValue = a3;
  return result;
}

- (void)setInputValue:(double)a3
{
  -[PUValueFilter currentValue](self, "currentValue");
  -[PUValueFilter updatedValue:withTargetValue:](self, "updatedValue:withTargetValue:");
  -[PUValueFilter setCurrentValue:](self, "setCurrentValue:");
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  return a4;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(double)a3
{
  self->_currentValue = a3;
}

@end
