@implementation SCRCGestureFinger

- (SCRCGestureFinger)initWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5
{
  CGFloat y;
  CGFloat x;
  SCRCGestureFinger *result;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)SCRCGestureFinger;
  result = -[SCRCGestureFinger init](&v10, sel_init);
  if (result)
  {
    result->_identifier = a3;
    result->_location.x = x;
    result->_location.y = y;
    result->_pressure = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Finger %2lu: x=%.2lf y=%.2lf"), self->_identifier, *(_QWORD *)&self->_location.x, *(_QWORD *)&self->_location.y);
}

- (unint64_t)identifier
{
  return self->_identifier;
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

- (double)pressure
{
  return self->_pressure;
}

- (int64_t)type
{
  return 0;
}

@end
