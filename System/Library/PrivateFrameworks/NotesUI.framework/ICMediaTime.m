@implementation ICMediaTime

- (ICMediaTime)initWithCMTime:(id *)a3
{
  CMTime v4;

  v4 = *(CMTime *)a3;
  return -[ICMediaTime initWithSeconds:](self, "initWithSeconds:", CMTimeGetSeconds(&v4));
}

- (ICMediaTime)initWithSeconds:(double)a3
{
  return -[ICMediaTime initWithSeconds:ignoreFractionalSeconds:](self, "initWithSeconds:ignoreFractionalSeconds:", 1, a3);
}

- (ICMediaTime)initWithSeconds:(double)a3 ignoreFractionalSeconds:(BOOL)a4
{
  ICMediaTime *v6;
  uint64_t v7;
  ICMediaTime *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICMediaTime;
  v6 = -[ICMediaTime init](&v14, sel_init);
  v8 = v6;
  if (v6)
  {
    if (a3 < 0.0)
    {
      -[ICMediaTime setNegative:](v6, "setNegative:", 1);
      a3 = -a3;
    }
    if (a3 >= 86400.0)
    {
      v9 = a3 / 86400.0;
      a3 = a3 - floor(a3 / 86400.0) * 86400.0;
      LODWORD(v7) = vcvtmd_s64_f64(v9);
      -[ICMediaTime setDays:](v8, "setDays:", v7);
    }
    if (a3 >= 3600.0)
    {
      v10 = a3 / 3600.0;
      a3 = a3 - floor(a3 / 3600.0) * 3600.0;
      LODWORD(v7) = vcvtmd_s64_f64(v10);
      -[ICMediaTime setHours:](v8, "setHours:", v7);
    }
    if (a3 >= 60.0)
    {
      v11 = a3 / 60.0;
      a3 = a3 - floor(a3 / 60.0) * 60.0;
      LODWORD(v7) = vcvtmd_s64_f64(v11);
      -[ICMediaTime setMinutes:](v8, "setMinutes:", v7);
    }
    LODWORD(v7) = vcvtmd_s64_f64(a3);
    -[ICMediaTime setSeconds:](v8, "setSeconds:", v7);
    if (a4)
      v12 = 0;
    else
      LODWORD(v12) = vcvtmd_s64_f64((a3 - (double)-[ICMediaTime seconds](v8, "seconds")) * 100.0);
    -[ICMediaTime setCentiseconds:](v8, "setCentiseconds:", v12);
  }
  return v8;
}

- (BOOL)isZero
{
  return !-[ICMediaTime days](self, "days")
      && !-[ICMediaTime hours](self, "hours")
      && !-[ICMediaTime minutes](self, "minutes")
      && !-[ICMediaTime seconds](self, "seconds")
      && -[ICMediaTime centiseconds](self, "centiseconds") == 0;
}

- (BOOL)isEqualToMediaTime:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;

  v4 = a3;
  v5 = -[ICMediaTime days](self, "days");
  if (v5 == objc_msgSend(v4, "days")
    && (v6 = -[ICMediaTime hours](self, "hours"), v6 == objc_msgSend(v4, "days"))
    && (v7 = -[ICMediaTime minutes](self, "minutes"), v7 == objc_msgSend(v4, "minutes"))
    && (v8 = -[ICMediaTime seconds](self, "seconds"), v8 == objc_msgSend(v4, "seconds")))
  {
    v9 = -[ICMediaTime centiseconds](self, "centiseconds");
    v10 = v9 == objc_msgSend(v4, "centiseconds");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICMediaTime *v4;

  v4 = -[ICMediaTime init](+[ICMediaTime allocWithZone:](ICMediaTime, "allocWithZone:", a3), "init");
  -[ICMediaTime setDays:](v4, "setDays:", -[ICMediaTime days](self, "days"));
  -[ICMediaTime setHours:](v4, "setHours:", -[ICMediaTime hours](self, "hours"));
  -[ICMediaTime setMinutes:](v4, "setMinutes:", -[ICMediaTime minutes](self, "minutes"));
  -[ICMediaTime setSeconds:](v4, "setSeconds:", -[ICMediaTime seconds](self, "seconds"));
  -[ICMediaTime setCentiseconds:](v4, "setCentiseconds:", -[ICMediaTime centiseconds](self, "centiseconds"));
  return v4;
}

- (NSString)durationDescription
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  if (-[ICMediaTime isZero](self, "isZero"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("zero seconds"), CFSTR("zero seconds"), 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[ICMediaTime days](self, "days"))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%d days"), CFSTR("%d days"), 0, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringWithFormat:", v5, -[ICMediaTime days](self, "days"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    if (-[ICMediaTime hours](self, "hours"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%d hours"), CFSTR("%d hours"), 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, -[ICMediaTime days](self, "days"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    if (-[ICMediaTime minutes](self, "minutes"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%d minutes"), CFSTR("%d minutes"), 0, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v11, -[ICMediaTime minutes](self, "minutes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    if (-[ICMediaTime centiseconds](self, "centiseconds") || -[ICMediaTime seconds](self, "seconds"))
    {
      if (-[ICMediaTime centiseconds](self, "centiseconds"))
      {
        v19 = (float)-[ICMediaTime seconds](self, "seconds");
        v20 = (float)((float)((float)-[ICMediaTime centiseconds](self, "centiseconds") / 100.0) + v19);
        if (!__accessibilityCentisecondsNumberFormatter)
        {
          v21 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          v22 = (void *)__accessibilityCentisecondsNumberFormatter;
          __accessibilityCentisecondsNumberFormatter = (uint64_t)v21;

          objc_msgSend((id)__accessibilityCentisecondsNumberFormatter, "setMaximumFractionDigits:", 2);
        }
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%1$@ %2$f formatted fractional seconds"), CFSTR("%1$@ %2$f formatted fractional seconds"), 0, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = (void *)__accessibilityCentisecondsNumberFormatter;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringFromNumber:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringWithFormat:", v23, v27, *(_QWORD *)&v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%d seconds"), CFSTR("%d seconds"), 0, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringWithFormat:", v23, -[ICMediaTime seconds](self, "seconds"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v28 = 0;
    }
    __ICAccessibilityStringForVariables(0, v6, v13, v14, v15, v16, v17, v18, (uint64_t)v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (unsigned)days
{
  return self->_days;
}

- (void)setDays:(unsigned __int8)a3
{
  self->_days = a3;
}

- (unsigned)hours
{
  return self->_hours;
}

- (void)setHours:(unsigned __int8)a3
{
  self->_hours = a3;
}

- (unsigned)minutes
{
  return self->_minutes;
}

- (void)setMinutes:(unsigned __int8)a3
{
  self->_minutes = a3;
}

- (unsigned)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(unsigned __int8)a3
{
  self->_seconds = a3;
}

- (unsigned)centiseconds
{
  return self->_centiseconds;
}

- (void)setCentiseconds:(unsigned __int8)a3
{
  self->_centiseconds = a3;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (void)setNegative:(BOOL)a3
{
  self->_negative = a3;
}

@end
