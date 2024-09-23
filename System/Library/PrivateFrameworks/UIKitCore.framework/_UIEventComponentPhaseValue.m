@implementation _UIEventComponentPhaseValue

- (_UIEventComponentPhaseValue)initWithValue:(int64_t)a3 underlyingValue:(int64_t)a4
{
  _UIEventComponentPhaseValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIEventComponentPhaseValue;
  result = -[_UIEventComponentPhaseValue init](&v7, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_underlyingValue = a4;
  }
  return result;
}

- (int64_t)value
{
  return self->_value;
}

- (int64_t)underlyingValue
{
  return self->_underlyingValue;
}

@end
