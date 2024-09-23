@implementation _UIMotionEffectFocusChangeEvent

- (_UIMotionEffectFocusChangeEvent)initWithTimestamp:(double)a3 focusPosition:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  _UIMotionEffectFocusChangeEvent *result;
  objc_super v7;

  y = a4.y;
  x = a4.x;
  v7.receiver = self;
  v7.super_class = (Class)_UIMotionEffectFocusChangeEvent;
  result = -[_UIMotionEffectEvent initWithTimestamp:](&v7, sel_initWithTimestamp_, a3);
  if (result)
  {
    result->_focusPosition.x = x;
    result->_focusPosition.y = y;
  }
  return result;
}

- (id)copyWithTimestamp:(double)a3
{
  id v5;
  double v6;
  double v7;

  v5 = objc_alloc((Class)objc_opt_class());
  -[_UIMotionEffectFocusChangeEvent focusPosition](self, "focusPosition");
  return (id)objc_msgSend(v5, "initWithTimestamp:focusPosition:", a3, v6, v7);
}

- (double)velocityRelativeToPreviousEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_opt_class();
  v5 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIMotionEffectFocusChangeEvent focusPosition](self, "focusPosition");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v4, "focusPosition");
    v11 = v7 - v10;
    v13 = v9 - v12;
    -[_UIMotionEffectEvent timestamp](self, "timestamp");
    v15 = v14;
    objc_msgSend(v4, "timestamp");
    v5 = (v11 * v11 + v13 * v13) / (v15 - v16);
  }

  return v5;
}

- (CGPoint)focusPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_focusPosition.x;
  y = self->_focusPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
