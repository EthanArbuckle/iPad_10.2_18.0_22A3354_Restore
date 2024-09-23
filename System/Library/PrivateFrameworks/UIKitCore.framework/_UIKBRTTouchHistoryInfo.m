@implementation _UIKBRTTouchHistoryInfo

- (_UIKBRTTouchHistoryInfo)init
{
  _UIKBRTTouchHistoryInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTTouchHistoryInfo;
  result = -[_UIKBRTTouchHistoryInfo init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_isLeftHand = 257;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)_UIKBRTTouchHistoryInfo;
  -[_UIKBRTTouchHistoryInfo description](&v12, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_isLeftHand)
    v6 = "left";
  else
    v6 = "right";
  v7 = "";
  if (self->_isActive)
    v8 = "";
  else
    v8 = " (INACTIVE)";
  if (self->_ignoreForDrift)
    v9 = " (UNKNOWN)";
  else
    v9 = "";
  if (self->_ignoreTouch)
    v7 = " (IGNORED)";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ID=%@, @%.2f, {%.1f%+.1f, %.1f%+.1f}, %s%s%s%s"), v4, self->_touchIdentifier, *(_OWORD *)&self->_touchTime, *(_QWORD *)&self->_errorVector.x, *(_QWORD *)&self->_actualLocation.y, *(_QWORD *)&self->_errorVector.y, v6, v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)touchIdentifier
{
  return self->_touchIdentifier;
}

- (void)setTouchIdentifier:(id)a3
{
  objc_storeStrong(&self->_touchIdentifier, a3);
}

- (double)touchTime
{
  return self->_touchTime;
}

- (void)setTouchTime:(double)a3
{
  self->_touchTime = a3;
}

- (CGPoint)actualLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_actualLocation.x;
  y = self->_actualLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setActualLocation:(CGPoint)a3
{
  self->_actualLocation = a3;
}

- (BOOL)isLeftHand
{
  return self->_isLeftHand;
}

- (void)setIsLeftHand:(BOOL)a3
{
  self->_isLeftHand = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)ignoreForDrift
{
  return self->_ignoreForDrift;
}

- (void)setIgnoreForDrift:(BOOL)a3
{
  self->_ignoreForDrift = a3;
}

- (BOOL)ignoreTouch
{
  return self->_ignoreTouch;
}

- (void)setIgnoreTouch:(BOOL)a3
{
  self->_ignoreTouch = a3;
}

- (CGPoint)errorVector
{
  double x;
  double y;
  CGPoint result;

  x = self->_errorVector.x;
  y = self->_errorVector.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setErrorVector:(CGPoint)a3
{
  self->_errorVector = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchIdentifier, 0);
}

@end
