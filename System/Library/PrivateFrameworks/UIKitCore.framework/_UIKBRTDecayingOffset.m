@implementation _UIKBRTDecayingOffset

- (_UIKBRTDecayingOffset)initWithTimeoutDuration:(double)a3 limitMovement:(BOOL)a4
{
  _UIKBRTDecayingOffset *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKBRTDecayingOffset;
  result = -[_UIKBRTDecayingObject initWithTimeoutDuration:](&v6, sel_initWithTimeoutDuration_, a3);
  if (result)
    result->_limitMovement = a4;
  return result;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTDecayingOffset;
  -[_UIKBRTDecayingObject reset](&v3, sel_reset);
  self->_offset = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (void)updateOffsetTo:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  y = a3.y;
  x = a3.x;
  v6 = -[_UIKBRTDecayingObject isActive](self, "isActive");
  -[_UIKBRTDecayingOffset offset](self, "offset");
  if (v6 && self->_limitMovement)
  {
    v9 = x - v7;
    v10 = y - v8;
    v11 = v9 * v9 + v10 * v10;
    if (v11 > 625.0)
    {
      v12 = 25.0 / sqrt(v11);
      v9 = v9 * v12;
      v10 = v10 * v12;
    }
    v13 = self->_offset.y;
    x = trunc(v9 + self->_offset.x + 0.5);
    self->_offset.x = x;
    self->_offset.y = trunc(v10 + v13 + 0.5);
  }
  else
  {
    self->_offset.x = x;
    self->_offset.y = y;
  }
  if (fabs(x) >= 1.0 || fabs(self->_offset.y) >= 1.0)
  {
    -[_UIKBRTDecayingObject resetDecayTo:](self, "resetDecayTo:", CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff);
  }
  else
  {
    -[_UIKBRTDecayingOffset reset](self, "reset");
    self->_offset = (CGPoint)*MEMORY[0x1E0C9D538];
  }
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  -[_UIKBRTDecayingObject updateDecay](self, "updateDecay");
  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)originalOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
