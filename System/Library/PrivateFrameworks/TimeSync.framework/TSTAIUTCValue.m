@implementation TSTAIUTCValue

- (TSTAIUTCValue)init
{
  TSTAIUTCValue *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTAIUTCValue;
  v2 = -[TSTAIUTCValue init](&v4, sel_init);
  if (v2 && init_onceToken_1 != -1)
    dispatch_once(&init_onceToken_1, &__block_literal_global_107);
  return v2;
}

uint64_t __21__TSTAIUTCValue_init__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)TSTAIUTCValueDateFormatter;
  TSTAIUTCValueDateFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)TSTAIUTCValueDateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)TSTAIUTCValueDateFormatter, "setFormatOptions:", 3955);
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
    v6 = (void *)TSTAIUTCValueDateFormatter;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utc_date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    utcDate = v5->_utcDate;
    v5->_utcDate = (NSDate *)v8;

    v10 = (void *)TSTAIUTCValueDateFormatter;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tai_date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    taiDate = v5->_taiDate;
    v5->_taiDate = (NSDate *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modified_julian_day"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modifiedJulianDay = objc_msgSend(v14, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("constant"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v5->_constant = v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offset"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_offset = objc_msgSend(v17, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coefficient"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v5->_coefficient = v19;

    coefficient = v5->_coefficient;
    if (coefficient != 0.0)
    {
      -[NSDate dateByAddingTimeInterval:](v5->_utcDate, "dateByAddingTimeInterval:", v5->_constant + (double)(uint64_t)(v5->_modifiedJulianDay - v5->_offset) * coefficient);
      v21 = objc_claimAutoreleasedReturnValue();
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
  void *v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("utc_date");
  v3 = (void *)TSTAIUTCValueDateFormatter;
  -[TSTAIUTCValue utcDate](self, "utcDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v17[1] = CFSTR("tai_date");
  v6 = (void *)TSTAIUTCValueDateFormatter;
  -[TSTAIUTCValue taiDate](self, "taiDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v17[2] = CFSTR("modified_julian_day");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TSTAIUTCValue modifiedJulianDay](self, "modifiedJulianDay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  v17[3] = CFSTR("constant");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[TSTAIUTCValue constant](self, "constant");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v11;
  v17[4] = CFSTR("offset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TSTAIUTCValue offset](self, "offset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v12;
  v17[5] = CFSTR("coefficient");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[TSTAIUTCValue coefficient](self, "coefficient");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TSTAIUTCValue utcDate](self, "utcDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUtcDate:", v5);

  -[TSTAIUTCValue taiDate](self, "taiDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
