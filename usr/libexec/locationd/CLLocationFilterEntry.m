@implementation CLLocationFilterEntry

- (CLLocationFilterEntry)init
{
  CLLocationFilterEntry *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationFilterEntry;
  result = -[CLLocationDBEntry init](&v3, "init");
  if (result)
    result->_deltaElevation = 1.79769313e308;
  return result;
}

- (double)deltaElevation
{
  return self->_deltaElevation;
}

- (void)setDeltaElevation:(double)a3
{
  self->_deltaElevation = a3;
}

@end
