@implementation TAInterVisitMetricPerDeviceSettings

- (TAInterVisitMetricPerDeviceSettings)init
{
  return -[TAInterVisitMetricPerDeviceSettings initWithSampledObservationLocationsInterval:sampledObservationLocationsBufferSize:](self, "initWithSampledObservationLocationsInterval:sampledObservationLocationsBufferSize:", 20, 180.0);
}

- (TAInterVisitMetricPerDeviceSettings)initWithSampledObservationLocationsInterval:(double)a3 sampledObservationLocationsBufferSize:(unint64_t)a4
{
  TAInterVisitMetricPerDeviceSettings *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TAInterVisitMetricPerDeviceSettings;
  result = -[TAInterVisitMetricPerDeviceSettings init](&v7, sel_init);
  if (result)
  {
    result->_sampledObservationLocationsInterval = a3;
    result->_sampledObservationLocationsBufferSize = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  TAInterVisitMetricPerDeviceSettings *v4;
  TAInterVisitMetricPerDeviceSettings *v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  BOOL v10;

  v4 = (TAInterVisitMetricPerDeviceSettings *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TAInterVisitMetricPerDeviceSettings sampledObservationLocationsInterval](self, "sampledObservationLocationsInterval");
      v7 = v6;
      -[TAInterVisitMetricPerDeviceSettings sampledObservationLocationsInterval](v5, "sampledObservationLocationsInterval");
      if (v7 == v8)
      {
        v9 = -[TAInterVisitMetricPerDeviceSettings sampledObservationLocationsBufferSize](self, "sampledObservationLocationsBufferSize");
        v10 = v9 == -[TAInterVisitMetricPerDeviceSettings sampledObservationLocationsBufferSize](v5, "sampledObservationLocationsBufferSize");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAInterVisitMetricPerDeviceSettings)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SampleInterval"));
  v6 = v5;
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BufferSize"));

  return -[TAInterVisitMetricPerDeviceSettings initWithSampledObservationLocationsInterval:sampledObservationLocationsBufferSize:](self, "initWithSampledObservationLocationsInterval:sampledObservationLocationsBufferSize:", v7, v6);
}

- (void)encodeWithCoder:(id)a3
{
  double sampledObservationLocationsInterval;
  id v5;

  sampledObservationLocationsInterval = self->_sampledObservationLocationsInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("SampleInterval"), sampledObservationLocationsInterval);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sampledObservationLocationsBufferSize, CFSTR("BufferSize"));

}

- (double)sampledObservationLocationsInterval
{
  return self->_sampledObservationLocationsInterval;
}

- (void)setSampledObservationLocationsInterval:(double)a3
{
  self->_sampledObservationLocationsInterval = a3;
}

- (unint64_t)sampledObservationLocationsBufferSize
{
  return self->_sampledObservationLocationsBufferSize;
}

- (void)setSampledObservationLocationsBufferSize:(unint64_t)a3
{
  self->_sampledObservationLocationsBufferSize = a3;
}

@end
