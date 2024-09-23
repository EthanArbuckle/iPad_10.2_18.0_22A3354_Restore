@implementation CLDeviceMotionProperties

- (CLDeviceMotionProperties)initWithMode:(int)a3
{
  CLDeviceMotionProperties *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLDeviceMotionProperties;
  result = -[CLDeviceMotionProperties init](&v5, "init");
  if (result)
    result->_mode = a3;
  return result;
}

- (id)description
{
  const __CFString *v2;
  int mode;
  const __CFString *v4;
  const __CFString *v5;

  v2 = 0;
  mode = self->_mode;
  if (mode > 14)
  {
    v4 = CFSTR("3AxisDynamicGyro");
    v5 = CFSTR("6AxisThrottledGyro");
    if (mode != 67)
      v5 = 0;
    if (mode != 34)
      v4 = v5;
    if (mode == 19)
      v2 = CFSTR("BuildGYTT");
    if (mode == 15)
      v2 = CFSTR("9AxisWithNorthReference");
    if (mode > 33)
      v2 = v4;
  }
  else
  {
    switch(mode)
    {
      case 0:
        v2 = CFSTR("Unknown");
        break;
      case 2:
        v2 = CFSTR("GyroOnly");
        break;
      case 3:
        v2 = CFSTR("6Axis");
        break;
      case 7:
        v2 = CFSTR("9Axis");
        break;
      default:
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CLDeviceMotionProperties<DeviceMotion=%@>"), v2);
    }
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CLDeviceMotionProperties<DeviceMotion=%@>"), v2);
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

@end
