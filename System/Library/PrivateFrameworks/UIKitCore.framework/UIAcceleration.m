@implementation UIAcceleration

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: 0x%p; %g, %g, %g at %g>"),
               objc_opt_class(),
               self,
               *(_QWORD *)&self->_x,
               *(_QWORD *)&self->_y,
               *(_QWORD *)&self->_z,
               *(_QWORD *)&self->_timestamp);
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (UIAccelerationValue)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (UIAccelerationValue)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (UIAccelerationValue)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end
