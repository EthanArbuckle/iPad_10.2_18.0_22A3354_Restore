@implementation CLBarometricAltimeterAdapter

- (CLBarometricAltimeterAdapter)initWithBarometricAltimeter:(void *)a3
{
  CLBarometricAltimeterAdapter *result;
  BOOL v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLBarometricAltimeterAdapter;
  result = -[CLBarometricAltimeterAdapter init](&v6, "init");
  v5 = 0;
  if (a3 && result)
  {
    result->_barometricAltimeter = a3;
    v5 = 1;
  }
  result->_valid = v5;
  return result;
}

- (void)onVisit:(id)a3
{
  sub_1017C4FC8((uint64_t)self->_barometricAltimeter, a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
