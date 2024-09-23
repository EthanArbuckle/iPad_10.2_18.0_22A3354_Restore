@implementation _TVRUITouch

- (_TVRUITouch)initWithTimestamp:(double)a3 touchPhase:(int64_t)a4 fingerIndex:(int64_t)a5
{
  _TVRUITouch *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVRUITouch;
  result = -[_TVRUITouch init](&v9, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_phase = a4;
    result->_fingerIndex = a5;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)phase
{
  return self->_phase;
}

- (int64_t)fingerIndex
{
  return self->_fingerIndex;
}

@end
