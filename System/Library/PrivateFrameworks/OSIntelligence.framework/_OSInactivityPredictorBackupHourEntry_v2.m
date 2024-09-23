@implementation _OSInactivityPredictorBackupHourEntry_v2

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[_OSInactivityPredictorBackupHourEntry_v2 pctLong](self, "pctLong");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pct"));
  -[_OSInactivityPredictorBackupHourEntry stdDev](self, "stdDev");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("stdDev"));
  -[_OSInactivityPredictorBackupHourEntry averageDuration](self, "averageDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("avg"));

}

- (_OSInactivityPredictorBackupHourEntry_v2)initWithCoder:(id)a3
{
  id v4;
  _OSInactivityPredictorBackupHourEntry_v2 *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (_OSInactivityPredictorBackupHourEntry_v2 *)objc_alloc_init((Class)objc_opt_class());

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pct"));
  -[_OSInactivityPredictorBackupHourEntry_v2 setPctLong:](v5, "setPctLong:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("stdDev"));
  -[_OSInactivityPredictorBackupHourEntry setStdDev:](v5, "setStdDev:");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("avg"));
  v7 = v6;

  -[_OSInactivityPredictorBackupHourEntry setAverageDuration:](v5, "setAverageDuration:", v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _OSInactivityPredictorBackupHourEntry_v2 *v4;
  _OSInactivityPredictorBackupHourEntry_v2 *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = (_OSInactivityPredictorBackupHourEntry_v2 *)a3;
  if (self == v4)
  {
    v15 = 1;
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
        v15 = 0;
      }
      else
      {
        -[_OSInactivityPredictorBackupHourEntry_v2 pctLong](self, "pctLong");
        v13 = v12;
        -[_OSInactivityPredictorBackupHourEntry_v2 pctLong](v5, "pctLong");
        v15 = vabdd_f64(v13, v14) < 0.001;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_OSInactivityPredictorBackupHourEntry averageDuration](self, "averageDuration");
  v5 = v4;
  -[_OSInactivityPredictorBackupHourEntry_v2 pctLong](self, "pctLong");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<Inactivity Entry v2: Duration: %.1lfh, %.2f%% Long>"), v5, v6);
}

- (double)pctLong
{
  return self->_pctLong;
}

- (void)setPctLong:(double)a3
{
  self->_pctLong = a3;
}

@end
