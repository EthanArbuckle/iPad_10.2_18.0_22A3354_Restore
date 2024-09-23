@implementation _UIRKEOTouchTracking

- (BOOL)valid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beganGestureClass, 0);
}

- (Class)beganGestureClass
{
  return self->_beganGestureClass;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setLargestObservedRadius:(double)a3
{
  self->_largestObservedRadius = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (double)largestObservedRadius
{
  return self->_largestObservedRadius;
}

- (void)setBeganGestureClass:(Class)a3
{
  objc_storeStrong((id *)&self->_beganGestureClass, a3);
}

@end
