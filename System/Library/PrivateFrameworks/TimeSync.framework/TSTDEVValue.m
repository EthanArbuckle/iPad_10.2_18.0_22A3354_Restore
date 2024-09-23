@implementation TSTDEVValue

- (TSTDEVValue)initWithObservationInterval:(double)a3 andTDEV:(double)a4
{
  TSTDEVValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTDEVValue;
  result = -[TSTDEVValue init](&v7, sel_init);
  if (result)
  {
    result->_observationInterval = a3;
    result->_tdev = a4;
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
  -[TSTDEVValue observationInterval](self, "observationInterval");
  v7 = v6;
  -[TSTDEVValue tdev](self, "tdev");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: {%.9f,%.9f}>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)observationInterval
{
  return self->_observationInterval;
}

- (double)tdev
{
  return self->_tdev;
}

@end
