@implementation _UIMotionEffectAttitudeEvent

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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v4 = a3;
  objc_opt_class();
  v5 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIMotionEffectAttitudeEvent attitude](self, "attitude");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "attitude");
    v15 = v7 - v14;
    v17 = v9 - v16;
    v19 = v11 - v18;
    v21 = v13 - v20;
    -[_UIMotionEffectEvent timestamp](self, "timestamp");
    v23 = v22;
    objc_msgSend(v4, "timestamp");
    v5 = (v21 * v21 + v19 * v19 + v15 * v15 + v17 * v17) / (v23 - v24);
  }

  return v5;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attitude
{
  double x;
  double y;
  double z;
  double w;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  x = self->_attitude.x;
  y = self->_attitude.y;
  z = self->_attitude.z;
  w = self->_attitude.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (_UIMotionEffectAttitudeEvent)initWithTimestamp:(double)a3 attitude:(id)a4
{
  double var3;
  double var2;
  double var1;
  double var0;
  _UIMotionEffectAttitudeEvent *result;
  objc_super v9;

  var3 = a4.var3;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v9.receiver = self;
  v9.super_class = (Class)_UIMotionEffectAttitudeEvent;
  result = -[_UIMotionEffectEvent initWithTimestamp:](&v9, sel_initWithTimestamp_, a3);
  if (result)
  {
    result->_attitude.x = var0;
    result->_attitude.y = var1;
    result->_attitude.z = var2;
    result->_attitude.w = var3;
  }
  return result;
}

- (id)copyWithTimestamp:(double)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = objc_alloc((Class)objc_opt_class());
  -[_UIMotionEffectAttitudeEvent attitude](self, "attitude");
  return (id)objc_msgSend(v5, "initWithTimestamp:attitude:", a3, v6, v7, v8, v9);
}

@end
