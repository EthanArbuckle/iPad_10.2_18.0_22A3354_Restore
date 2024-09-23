@implementation TSTAIUTCValue

- (TSTAIUTCValue)init
{
  TSTAIUTCValue *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTAIUTCValue;
  v2 = -[TSTAIUTCValue init](&v4, "init");
  if (v2 && qword_100047C60 != -1)
    dispatch_once(&qword_100047C60, &stru_10003C7D0);
  return v2;
}

- (TSTAIUTCValue)initWithDictionary:(id)a3
{
  id v4;
  TSTAIUTCValue *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDate *utcDate;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDate *taiDate;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double coefficient;
  uint64_t v21;
  NSDate *v22;

  v4 = a3;
  v5 = -[TSTAIUTCValue init](self, "init");
  if (v5)
  {
    v6 = (void *)qword_100047C58;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utc_date")));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateFromString:", v7));
    utcDate = v5->_utcDate;
    v5->_utcDate = (NSDate *)v8;

    v10 = (void *)qword_100047C58;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tai_date")));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateFromString:", v11));
    taiDate = v5->_taiDate;
    v5->_taiDate = (NSDate *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modified_julian_day")));
    v5->_modifiedJulianDay = (unint64_t)objc_msgSend(v14, "integerValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("constant")));
    objc_msgSend(v15, "doubleValue");
    v5->_constant = v16;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offset")));
    v5->_offset = (unint64_t)objc_msgSend(v17, "integerValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coefficient")));
    objc_msgSend(v18, "doubleValue");
    v5->_coefficient = v19;

    coefficient = v5->_coefficient;
    if (coefficient != 0.0)
    {
      v21 = objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v5->_utcDate, "dateByAddingTimeInterval:", v5->_constant + (double)(uint64_t)(v5->_modifiedJulianDay - v5->_offset) * coefficient));
      v22 = v5->_taiDate;
      v5->_taiDate = (NSDate *)v21;

    }
  }

  return v5;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[6];

  v15[0] = CFSTR("utc_date");
  v3 = (void *)qword_100047C58;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSTAIUTCValue utcDate](self, "utcDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v4));
  v16[0] = v5;
  v15[1] = CFSTR("tai_date");
  v6 = (void *)qword_100047C58;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSTAIUTCValue taiDate](self, "taiDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v7));
  v16[1] = v8;
  v15[2] = CFSTR("modified_julian_day");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[TSTAIUTCValue modifiedJulianDay](self, "modifiedJulianDay")));
  v16[2] = v9;
  v15[3] = CFSTR("constant");
  -[TSTAIUTCValue constant](self, "constant");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v16[3] = v10;
  v15[4] = CFSTR("offset");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[TSTAIUTCValue offset](self, "offset")));
  v16[4] = v11;
  v15[5] = CFSTR("coefficient");
  -[TSTAIUTCValue coefficient](self, "coefficient");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v16[5] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 6));

  return (NSDictionary *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSTAIUTCValue utcDate](self, "utcDate"));
  objc_msgSend(v4, "setUtcDate:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSTAIUTCValue taiDate](self, "taiDate"));
  objc_msgSend(v4, "setTaiDate:", v6);

  objc_msgSend(v4, "setModifiedJulianDay:", -[TSTAIUTCValue modifiedJulianDay](self, "modifiedJulianDay"));
  -[TSTAIUTCValue constant](self, "constant");
  objc_msgSend(v4, "setConstant:");
  -[TSTAIUTCValue coefficient](self, "coefficient");
  objc_msgSend(v4, "setCoefficient:");
  objc_msgSend(v4, "setOffset:", -[TSTAIUTCValue offset](self, "offset"));
  return v4;
}

- (NSDate)utcDate
{
  return self->_utcDate;
}

- (void)setUtcDate:(id)a3
{
  objc_storeStrong((id *)&self->_utcDate, a3);
}

- (NSDate)taiDate
{
  return self->_taiDate;
}

- (void)setTaiDate:(id)a3
{
  objc_storeStrong((id *)&self->_taiDate, a3);
}

- (unint64_t)modifiedJulianDay
{
  return self->_modifiedJulianDay;
}

- (void)setModifiedJulianDay:(unint64_t)a3
{
  self->_modifiedJulianDay = a3;
}

- (double)constant
{
  return self->_constant;
}

- (void)setConstant:(double)a3
{
  self->_constant = a3;
}

- (double)coefficient
{
  return self->_coefficient;
}

- (void)setCoefficient:(double)a3
{
  self->_coefficient = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taiDate, 0);
  objc_storeStrong((id *)&self->_utcDate, 0);
}

@end
