@implementation UIKeyboardSyntheticTouch

+ (id)syntheticTouchWithPoint:(CGPoint)a3 timestamp:(double)a4 window:(id)a5
{
  double y;
  double x;
  id v8;
  UIKeyboardSyntheticTouch *v9;

  y = a3.y;
  x = a3.x;
  v8 = a5;
  v9 = -[UIKeyboardSyntheticTouch initWithPoint:timestamp:window:]([UIKeyboardSyntheticTouch alloc], "initWithPoint:timestamp:window:", v8, x, y, a4);

  return v9;
}

- (UIKeyboardSyntheticTouch)initWithPoint:(CGPoint)a3 timestamp:(double)a4 window:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  UIKeyboardSyntheticTouch *v11;
  UIKeyboardSyntheticTouch *v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardSyntheticTouch;
  v11 = -[UIKeyboardSyntheticTouch init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->timestamp = a4;
    objc_storeStrong((id *)&v11->window, a5);
    v12->locationInWindow.x = x;
    v12->locationInWindow.y = y;
    *(_OWORD *)&v12->phase = xmmword_1866794A0;
  }

  return v12;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[UIKeyboardSyntheticTouch window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v5, self->locationInWindow.x, self->locationInWindow.y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)previousLocationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[UIKeyboardSyntheticTouch window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v5, self->locationInWindow.x, self->locationInWindow.y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)getLocationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->locationInWindow.x;
  y = self->locationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocationInWindow:(CGPoint)a3
{
  self->locationInWindow = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (int64_t)phase
{
  return self->phase;
}

- (void)setPhase:(int64_t)a3
{
  self->phase = a3;
}

- (unint64_t)tapCount
{
  return self->tapCount;
}

- (void)setTapCount:(unint64_t)a3
{
  self->tapCount = a3;
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->window, a3);
}

- (CGPoint)locationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->locationInWindow.x;
  y = self->locationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unsigned)_pathIndex
{
  return self->_pathIndex;
}

- (unsigned)_pathIdentity
{
  return self->_pathIdentity;
}

- (float)_pathMajorRadius
{
  return self->_pathMajorRadius;
}

- (void)set_pathMajorRadius:(float)a3
{
  self->_pathMajorRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->window, 0);
}

@end
