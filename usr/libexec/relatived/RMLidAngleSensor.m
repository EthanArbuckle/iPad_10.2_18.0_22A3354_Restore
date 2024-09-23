@implementation RMLidAngleSensor

- (void)dealloc
{
  objc_super v3;

  -[RMLidAngleSensor stopLidAngleUpdates](self, "stopLidAngleUpdates");
  v3.receiver = self;
  v3.super_class = (Class)RMLidAngleSensor;
  -[RMLidAngleSensor dealloc](&v3, "dealloc");
}

- (double)lidAngle
{
  return -1.0;
}

- (__IOHIDDevice)lidAngleSensor
{
  return self->_lidAngleSensor;
}

- (void)setLidAngleSensor:(__IOHIDDevice *)a3
{
  self->_lidAngleSensor = a3;
}

@end
