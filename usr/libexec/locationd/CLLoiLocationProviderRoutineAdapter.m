@implementation CLLoiLocationProviderRoutineAdapter

- (CLLoiLocationProviderRoutineAdapter)initWithLoiLocationProvider:(void *)a3
{
  CLLoiLocationProviderRoutineAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLLoiLocationProviderRoutineAdapter;
  result = -[CLLoiLocationProviderRoutineAdapter init](&v5, "init");
  if (result)
  {
    result->_loiLocationProvider = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (void)onVisit:(id)a3
{
  sub_100EA9540((uint64_t)self->_loiLocationProvider, a3);
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
