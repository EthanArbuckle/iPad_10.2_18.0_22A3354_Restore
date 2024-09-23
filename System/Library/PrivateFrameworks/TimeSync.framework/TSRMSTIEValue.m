@implementation TSRMSTIEValue

- (TSRMSTIEValue)initWithObservationInterval:(double)a3 andRMSTIE:(double)a4
{
  TSRMSTIEValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSRMSTIEValue;
  result = -[TSRMSTIEValue init](&v7, sel_init);
  if (result)
  {
    result->_observationInterval = a3;
    result->_rmstie = a4;
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
  -[TSRMSTIEValue observationInterval](self, "observationInterval");
  v7 = v6;
  -[TSRMSTIEValue rmstie](self, "rmstie");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: {%.3f,%.9f}>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)observationInterval
{
  return self->_observationInterval;
}

- (double)rmstie
{
  return self->_rmstie;
}

@end
