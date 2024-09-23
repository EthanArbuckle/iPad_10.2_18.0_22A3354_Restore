@implementation PNPersonParameter

- (PNPersonParameter)init
{
  PNPersonParameter *v2;
  PNPersonParameter *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PNPersonParameter;
  v2 = -[PNPersonParameter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    *(int64x2_t *)&v3->_startValue = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v3->_incrementValue = 1.79769313e308;
  }
  return v3;
}

- (BOOL)isValid
{
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;

  -[PNPersonParameter name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (-[PNPersonParameter startValue](self, "startValue"), v4 == 1.79769313e308)
    || (-[PNPersonParameter endValue](self, "endValue"), v5 == 1.79769313e308))
  {
    v7 = 0;
  }
  else
  {
    -[PNPersonParameter incrementValue](self, "incrementValue");
    v7 = v6 != 1.79769313e308;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PNPersonParameter name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonParameter startValue](self, "startValue");
  v6 = v5;
  -[PNPersonParameter endValue](self, "endValue");
  v8 = v7;
  -[PNPersonParameter incrementValue](self, "incrementValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Parameter name: '%@', start: %lf, end: %lf, increment: %lf"), v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (double)startValue
{
  return self->_startValue;
}

- (void)setStartValue:(double)a3
{
  self->_startValue = a3;
}

- (double)endValue
{
  return self->_endValue;
}

- (void)setEndValue:(double)a3
{
  self->_endValue = a3;
}

- (double)incrementValue
{
  return self->_incrementValue;
}

- (void)setIncrementValue:(double)a3
{
  self->_incrementValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
