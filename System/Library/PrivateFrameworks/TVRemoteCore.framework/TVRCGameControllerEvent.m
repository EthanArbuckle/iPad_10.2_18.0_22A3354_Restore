@implementation TVRCGameControllerEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCGameControllerEvent)initWithCoder:(id)a3
{
  id v4;
  TVRCGameControllerEvent *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRCGameControllerEvent;
  v5 = -[TVRCGameControllerEvent init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    v5->_down = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("down"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("joystickLocation.x"));
    v5->_joystickLocation.x = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("joystickLocation.y"));
    v5->_joystickLocation.y = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeBool:forKey:", self->_down, CFSTR("down"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("joystickLocation.x"), self->_joystickLocation.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("joystickLocation.y"), self->_joystickLocation.y);

}

- (id)_initWithTimestamp:(double)a3 isDown:(BOOL)a4 joystickLocation:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id result;
  objc_super v10;

  y = a5.y;
  x = a5.x;
  v10.receiver = self;
  v10.super_class = (Class)TVRCGameControllerEvent;
  result = -[TVRCGameControllerEvent init](&v10, sel_init);
  if (result)
  {
    *((_BYTE *)result + 8) = a4;
    *((double *)result + 2) = a3;
    *((CGFloat *)result + 3) = x;
    *((CGFloat *)result + 4) = y;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p; down=%d; location={%g, %g}>"),
               objc_opt_class(),
               self,
               self->_down,
               *(_QWORD *)&self->_joystickLocation.x,
               *(_QWORD *)&self->_joystickLocation.y);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)isDown
{
  return self->_down;
}

- (CGPoint)joystickLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_joystickLocation.x;
  y = self->_joystickLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
