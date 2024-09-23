@implementation USKTimeCode

- (double)doubleValue
{
  return self->_timeCode._time;
}

- (SdfTimeCode)sdfTimeCode
{
  return self->_timeCode;
}

- (USKTimeCode)initWithSdfTimeCode:(SdfTimeCode)a3
{
  USKTimeCode *v4;
  USKTimeCode *v5;
  USKTimeCode *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)USKTimeCode;
  v4 = -[USKTimeCode init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_timeCode = a3;
    v6 = v4;
  }

  return v5;
}

- (USKTimeCode)initWithDouble:(double)a3
{
  USKTimeCode *v4;
  USKTimeCode *v5;
  USKTimeCode *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)USKTimeCode;
  v4 = -[USKTimeCode init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_timeCode._time = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  USKTimeCode *v4;
  USKTimeCode *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  BOOL v10;

  v4 = (USKTimeCode *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_sdfTimeCode(v5, v6, v7, v8);
    v10 = self->_timeCode._time == v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  if (self->_timeCode._time == 0.0)
    return 0;
  else
    return *(_QWORD *)&self->_timeCode._time;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
