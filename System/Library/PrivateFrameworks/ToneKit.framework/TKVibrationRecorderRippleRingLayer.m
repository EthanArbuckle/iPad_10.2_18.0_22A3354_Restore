@implementation TKVibrationRecorderRippleRingLayer

- (TKVibrationRecorderRippleRingLayer)init
{
  TKVibrationRecorderRippleRingLayer *v2;
  TKVibrationRecorderRippleRingLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderRippleRingLayer;
  v2 = -[TKVibrationRecorderRippleRingLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TKVibrationRecorderRippleRingLayer setFillColor:](v2, "setFillColor:", 0);
    -[TKVibrationRecorderRippleRingLayer reset](v3, "reset");
  }
  return v3;
}

- (double)timeIntervalSinceCreation
{
  double v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  return v3 - self->_creationTimestamp;
}

- (void)configureWithTimeIntervalSinceCreation:(double)a3 normalizedRingLocation:(CGPoint)a4 ringSpeed:(double)a5
{
  CGFloat y;
  CGFloat x;
  double v10;

  y = a4.y;
  x = a4.x;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_creationTimestamp = v10 - a3;
  self->_normalizedRingLocation.x = x;
  self->_normalizedRingLocation.y = y;
  self->_ringSpeed = a5;
}

- (void)reset
{
  self->_creationTimestamp = 0.0;
  self->_normalizedRingLocation = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->_ringSpeed = 0.0;
}

- (CGPoint)normalizedRingLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedRingLocation.x;
  y = self->_normalizedRingLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)ringSpeed
{
  return self->_ringSpeed;
}

@end
