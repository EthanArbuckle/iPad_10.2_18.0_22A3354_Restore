@implementation _OSInactivityPredictorBackupHourEntry_v1

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[_OSInactivityPredictorBackupHourEntry_v1 count](self, "count"), CFSTR("count"));
  -[_OSInactivityPredictorBackupHourEntry stdDev](self, "stdDev");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("stdDev"));
  -[_OSInactivityPredictorBackupHourEntry averageDuration](self, "averageDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("avg"));

}

- (_OSInactivityPredictorBackupHourEntry_v1)initWithCoder:(id)a3
{
  id v4;
  _OSInactivityPredictorBackupHourEntry_v1 *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (_OSInactivityPredictorBackupHourEntry_v1 *)objc_alloc_init((Class)objc_opt_class());

  -[_OSInactivityPredictorBackupHourEntry_v1 setCount:](v5, "setCount:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("count")));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("stdDev"));
  -[_OSInactivityPredictorBackupHourEntry setStdDev:](v5, "setStdDev:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("avg"));
  v7 = v6;

  -[_OSInactivityPredictorBackupHourEntry setAverageDuration:](v5, "setAverageDuration:", v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _OSInactivityPredictorBackupHourEntry_v1 *v4;
  _OSInactivityPredictorBackupHourEntry_v1 *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int count;
  BOOL v13;

  v4 = (_OSInactivityPredictorBackupHourEntry_v1 *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_OSInactivityPredictorBackupHourEntry averageDuration](self, "averageDuration");
      v7 = v6;
      -[_OSInactivityPredictorBackupHourEntry averageDuration](v5, "averageDuration");
      if (vabdd_f64(v7, v8) >= 0.01
        || (-[_OSInactivityPredictorBackupHourEntry stdDev](self, "stdDev"),
            v10 = v9,
            -[_OSInactivityPredictorBackupHourEntry stdDev](v5, "stdDev"),
            vabdd_f64(v10, v11) >= 0.01))
      {
        v13 = 0;
      }
      else
      {
        count = self->_count;
        v13 = count == -[_OSInactivityPredictorBackupHourEntry_v1 count](v5, "count");
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_OSInactivityPredictorBackupHourEntry averageDuration](self, "averageDuration");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<Inactivity Entry v1: Duration: %.1lfh, %d Total>"), v4, -[_OSInactivityPredictorBackupHourEntry_v1 count](self, "count"));
}

- (int)count
{
  return self->_count;
}

- (void)setCount:(int)a3
{
  self->_count = a3;
}

@end
