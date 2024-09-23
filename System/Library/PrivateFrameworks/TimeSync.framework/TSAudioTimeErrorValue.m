@implementation TSAudioTimeErrorValue

- (TSAudioTimeErrorValue)initWithSampleTimestamp:(double)a3 andTimeError:(double)a4
{
  TSAudioTimeErrorValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSAudioTimeErrorValue;
  result = -[TSAudioTimeErrorValue init](&v7, sel_init);
  if (result)
  {
    result->_sampleTimestamp = a3;
    result->_timeError = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSAudioTimeErrorValue sampleTimestamp](self, "sampleTimestamp");
  v7 = v6;
  -[TSAudioTimeErrorValue timeError](self, "timeError");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: {%.9f,%.9f}>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)sampleTimestamp
{
  return self->_sampleTimestamp;
}

- (double)timeError
{
  return self->_timeError;
}

@end
