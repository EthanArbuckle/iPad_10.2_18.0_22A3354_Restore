@implementation CLTransitMacMonitorAccessPoint

- (CLTransitMacMonitorAccessPoint)initWithMacAddress:(unint64_t)a3 timestamp:(double)a4
{
  CLTransitMacMonitorAccessPoint *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLTransitMacMonitorAccessPoint;
  result = -[CLTransitMacMonitorAccessPoint init](&v7, "init");
  if (result)
  {
    result->_macAddress = a3;
    result->_timestamp = a4;
  }
  return result;
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(unint64_t)a3
{
  self->_macAddress = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
