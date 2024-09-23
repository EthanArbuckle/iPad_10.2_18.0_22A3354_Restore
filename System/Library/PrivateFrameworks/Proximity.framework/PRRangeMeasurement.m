@implementation PRRangeMeasurement

- (PRRangeMeasurement)initWithRange:(double)a3 uncertainty:(double)a4
{
  PRRangeMeasurement *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRRangeMeasurement;
  result = -[PRRangeMeasurement init](&v7, sel_init);
  if (result)
  {
    result->_measurement = a3;
    result->_uncertainty = a4;
  }
  return result;
}

+ (PRRangeMeasurement)measurementWithRange:(double)a3 uncertainty:(double)a4
{
  return -[PRRangeMeasurement initWithRange:uncertainty:]([PRRangeMeasurement alloc], "initWithRange:uncertainty:", a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRangeMeasurement)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RangeMeasurement"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RangeUncertainty"));
  v8 = v7;

  return -[PRRangeMeasurement initWithRange:uncertainty:](self, "initWithRange:uncertainty:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  double measurement;
  id v5;

  measurement = self->_measurement;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("RangeMeasurement"), measurement);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("RangeUncertainty"), self->_uncertainty);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRRangeMeasurement initWithRange:uncertainty:]([PRRangeMeasurement alloc], "initWithRange:uncertainty:", self->_measurement, self->_uncertainty);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("measurement: %f m, uncertainty: %f m"), *(_QWORD *)&self->_measurement, *(_QWORD *)&self->_uncertainty);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PRRangeMeasurement measurement](self, "measurement");
    v7 = v6;
    objc_msgSend(v5, "measurement");
    if (v7 == v8)
    {
      -[PRRangeMeasurement uncertainty](self, "uncertainty");
      v10 = v9;
      objc_msgSend(v5, "uncertainty");
      v12 = v10 == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)measurement
{
  return self->_measurement;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

@end
