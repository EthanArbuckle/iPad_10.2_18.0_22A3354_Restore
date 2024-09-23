@implementation SignpostSupportMachTimeTranslationRange

- (id)debugDescription
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v3 = -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime");
  if (v3 == -1)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("machAbsoluteTime: [%llu - Unknown] machContinuousTime: [%llu - Unknown]"), v5, -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime"), v7, v8);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("machAbsoluteTime: [%llu - %llu] machContinuousTime: [%llu - %llu]"), v5, -[SignpostSupportMachTimeTranslationRange endMachAbsoluteTime](self, "endMachAbsoluteTime"), -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime"), -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime");
    if (v6 == objc_msgSend(v5, "startMachAbsoluteTime")
      && (v7 = -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime"),
          v7 == objc_msgSend(v5, "startMachContinuousTime"))
      && (v8 = -[SignpostSupportMachTimeTranslationRange endMachAbsoluteTime](self, "endMachAbsoluteTime"),
          v8 == objc_msgSend(v5, "endMachAbsoluteTime")))
    {
      v9 = -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime");
      v10 = v9 == objc_msgSend(v5, "endMachContinuousTime");
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

  return v10;
}

- (unint64_t)machContinuousTimeDuration
{
  unint64_t result;
  unint64_t v4;

  result = -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime");
  if (result != -1)
  {
    v4 = -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime");
    return v4 - -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime");
  }
  return result;
}

- (int64_t)absoluteMinusContinuousDelta
{
  unint64_t v3;

  v3 = -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime");
  return v3 - -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime");
}

- (int64_t)continuousMinusAbsoluteDelta
{
  unint64_t v3;

  v3 = -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime");
  return v3 - -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime");
}

- (BOOL)setEndMachAbsoluteTimestamp:(unint64_t)a3 endMachContinuousTime:(unint64_t)a4
{
  if (a3 - a4 != -[SignpostSupportMachTimeTranslationRange absoluteMinusContinuousDelta](self, "absoluteMinusContinuousDelta")|| -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime") >= a4)
  {
    return 0;
  }
  self->_endMachAbsoluteTime = a3;
  self->_endMachContinuousTime = a4;
  return 1;
}

- (BOOL)containsMachAbsoluteTime:(unint64_t)a3
{
  return -[SignpostSupportMachTimeTranslationRange endMachAbsoluteTime](self, "endMachAbsoluteTime") != -1
      && -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime") <= a3
      && -[SignpostSupportMachTimeTranslationRange endMachAbsoluteTime](self, "endMachAbsoluteTime") >= a3;
}

- (BOOL)containsMachContinuousTime:(unint64_t)a3
{
  return -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime") != -1
      && -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime") <= a3
      && -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime") >= a3;
}

- (unint64_t)machAbsoluteTimeForMachContinuousTime:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[SignpostSupportMachTimeTranslationRange absoluteMinusContinuousDelta](self, "absoluteMinusContinuousDelta")
     + a3;
  if (!-[SignpostSupportMachTimeTranslationRange containsMachAbsoluteTime:](self, "containsMachAbsoluteTime:", v4))
    -[SignpostSupportMachTimeTranslationRange machAbsoluteTimeForMachContinuousTime:].cold.1();
  return v4;
}

- (unint64_t)machContinuousTimeForMachAbsoluteTime:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[SignpostSupportMachTimeTranslationRange continuousMinusAbsoluteDelta](self, "continuousMinusAbsoluteDelta")
     + a3;
  if (!-[SignpostSupportMachTimeTranslationRange containsMachContinuousTime:](self, "containsMachContinuousTime:", v4))
    -[SignpostSupportMachTimeTranslationRange machContinuousTimeForMachAbsoluteTime:].cold.1();
  return v4;
}

- (SignpostSupportMachTimeTranslationRange)initWithStartMachAbsoluteTime:(unint64_t)a3 startContinuousTime:(unint64_t)a4
{
  SignpostSupportMachTimeTranslationRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SignpostSupportMachTimeTranslationRange;
  result = -[SignpostSupportMachTimeTranslationRange init](&v7, sel_init);
  if (result)
  {
    result->_startMachContinuousTime = a4;
    result->_endMachContinuousTime = -1;
    result->_startMachAbsoluteTime = a3;
    result->_endMachAbsoluteTime = -1;
  }
  return result;
}

- (SignpostSupportMachTimeTranslationRange)initWithArrayRepresentation:(id)a3
{
  id v4;
  SignpostSupportMachTimeTranslationRange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SignpostSupportMachTimeTranslationRange *v10;
  objc_super v12;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 4)
  {
    v12.receiver = self;
    v12.super_class = (Class)SignpostSupportMachTimeTranslationRange;
    v5 = -[SignpostSupportMachTimeTranslationRange init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_startMachAbsoluteTime = objc_msgSend(v6, "unsignedLongLongValue");

      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_startMachContinuousTime = objc_msgSend(v7, "unsignedLongLongValue");

      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_endMachAbsoluteTime = objc_msgSend(v8, "unsignedLongLongValue");

      objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_endMachContinuousTime = objc_msgSend(v9, "unsignedLongLongValue");

    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)serializableArrayRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostSupportMachTimeTranslationRange endMachAbsoluteTime](self, "endMachAbsoluteTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)startMachAbsoluteTime
{
  return self->_startMachAbsoluteTime;
}

- (unint64_t)endMachAbsoluteTime
{
  return self->_endMachAbsoluteTime;
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (void)machAbsoluteTimeForMachContinuousTime:.cold.1()
{
  __assert_rtn("-[SignpostSupportMachTimeTranslationRange machAbsoluteTimeForMachContinuousTime:]", "SignpostSupportMachTimeTranslator.m", 98, "[self containsMachAbsoluteTime:machAbsoluteTimestamp]");
}

- (void)machContinuousTimeForMachAbsoluteTime:.cold.1()
{
  __assert_rtn("-[SignpostSupportMachTimeTranslationRange machContinuousTimeForMachAbsoluteTime:]", "SignpostSupportMachTimeTranslator.m", 103, "[self containsMachContinuousTime:machContinuousTime]");
}

@end
