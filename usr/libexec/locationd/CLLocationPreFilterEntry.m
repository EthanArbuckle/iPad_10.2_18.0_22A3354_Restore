@implementation CLLocationPreFilterEntry

- (CLLocationPreFilterEntry)init
{
  CLLocationPreFilterEntry *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationPreFilterEntry;
  result = -[CLLocationDBEntry init](&v3, "init");
  if (result)
    result->_horizontalAccuracy = 1.79769313e308;
  return result;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

@end
