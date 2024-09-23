@implementation TKVibrationRecorderRippleTouchContext

- (TKVibrationRecorderRippleTouchContext)init
{
  TKVibrationRecorderRippleTouchContext *v2;
  TKVibrationRecorderRippleTouchContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderRippleTouchContext;
  v2 = -[TKVibrationRecorderRippleTouchContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TKVibrationRecorderRippleTouchContext reset](v2, "reset");
  return v3;
}

- (double)timeIntervalSinceCreation
{
  double v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  return v3 - self->_creationTimestamp;
}

- (void)configureWithTimeIntervalSinceCreation:(double)a3 location:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  double v8;

  y = a4.y;
  x = a4.x;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_creationTimestamp = v8 - a3;
  self->_location.x = x;
  self->_location.y = y;
}

- (void)reset
{
  self->_creationTimestamp = 0.0;
  self->_location = (CGPoint)*MEMORY[0x24BDBEFB0];
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
