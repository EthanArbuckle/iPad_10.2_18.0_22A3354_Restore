@implementation RTMotionActivityPedometerData

- (RTMotionActivityPedometerData)initWithDateInterval:(id)a3 numberOfSteps:(unint64_t)a4 distance:(double)a5
{
  id v9;
  RTMotionActivityPedometerData *v10;
  RTMotionActivityPedometerData *v11;
  RTMotionActivityPedometerData *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v9 = a3;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)RTMotionActivityPedometerData;
    v10 = -[RTMotionActivityPedometerData init](&v15, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_dateInterval, a3);
      v11->_numberOfSteps = a4;
      v11->_distance = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTMotionActivityPedometerData dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTMotionActivityPedometerData numberOfSteps](self, "numberOfSteps");
  -[RTMotionActivityPedometerData distance](self, "distance");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("dateInterval, %@, number of steps, %lu, distance, %.3f,"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTMotionActivityPedometerData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  RTMotionActivityPedometerData *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("DateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfSteps"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Distance"));
  v8 = v7;

  v9 = -[RTMotionActivityPedometerData initWithDateInterval:numberOfSteps:distance:](self, "initWithDateInterval:numberOfSteps:distance:", v5, v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("DateInterval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfSteps, CFSTR("NumberOfSteps"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Distance"), self->_distance);

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[RTMotionActivityPedometerData dateInterval](self, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTMotionActivityPedometerData numberOfSteps](self, "numberOfSteps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[RTMotionActivityPedometerData distance](self, "distance");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  RTMotionActivityPedometerData *v4;
  RTMotionActivityPedometerData *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = (RTMotionActivityPedometerData *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTMotionActivityPedometerData dateInterval](self, "dateInterval");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMotionActivityPedometerData dateInterval](v5, "dateInterval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToDateInterval:", v7)
        && (v8 = -[RTMotionActivityPedometerData numberOfSteps](self, "numberOfSteps"),
            v8 == -[RTMotionActivityPedometerData numberOfSteps](v5, "numberOfSteps")))
      {
        -[RTMotionActivityPedometerData distance](self, "distance");
        v10 = v9;
        -[RTMotionActivityPedometerData distance](v5, "distance");
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
  }

  return v12;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)numberOfSteps
{
  return self->_numberOfSteps;
}

- (double)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
