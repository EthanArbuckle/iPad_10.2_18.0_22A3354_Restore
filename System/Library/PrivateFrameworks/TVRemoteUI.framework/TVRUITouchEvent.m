@implementation TVRUITouchEvent

- (TVRUITouchEvent)initWithTimestamp:(double)a3 touchPhase:(int64_t)a4 fingerIndex:(int64_t)a5 digitizerLocation:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  TVRUITouchEvent *result;
  objc_super v12;

  y = a6.y;
  x = a6.x;
  v12.receiver = self;
  v12.super_class = (Class)TVRUITouchEvent;
  result = -[TVRUITouchEvent init](&v12, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_touchPhase = a4;
    result->_fingerIndex = a5;
    result->_digitizerLocation.x = x;
    result->_digitizerLocation.y = y;
  }
  return result;
}

- (CGPoint)digitizerLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_digitizerLocation.x;
  y = self->_digitizerLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)touchPhase
{
  return self->_touchPhase;
}

- (int64_t)fingerIndex
{
  return self->_fingerIndex;
}

@end
