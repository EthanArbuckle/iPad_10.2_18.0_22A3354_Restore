@implementation _TUISnapValue

- (_TUISnapValue)initWithValue:(double)a3
{
  _TUISnapValue *v4;
  _TUISnapValue *v5;
  NSCopying *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TUISnapValue;
  v4 = -[_TUISnapValue init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    identifier = v4->_identifier;
    v4->_identifier = 0;

    *(int64x2_t *)&v5->_step = vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return v5;
}

- (_TUISnapValue)initWithOther:(id)a3
{
  id v4;
  _TUISnapValue *v5;
  double v6;
  uint64_t v7;
  NSCopying *identifier;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUISnapValue;
  v5 = -[_TUISnapValue init](&v12, "init");
  if (v5)
  {
    objc_msgSend(v4, "value");
    v5->_value = v6;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    identifier = v5->_identifier;
    v5->_identifier = (NSCopying *)v7;

    objc_msgSend(v4, "step");
    v5->_step = v9;
    objc_msgSend(v4, "max");
    v5->_max = v10;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TUISnapValue *v4;
  _TUISnapValue *v5;
  unsigned __int8 v6;
  NSCopying *identifier;

  v4 = (_TUISnapValue *)a3;
  v5 = v4;
  v6 = self == v4;
  if (v4 && self != v4)
  {
    if (self->_value == v4->_value
      && TUICGFloatIsEqualFloatOrBothNaN(self->_step, v4->_step)
      && TUICGFloatIsEqualFloatOrBothNaN(self->_max, v5->_max))
    {
      identifier = self->_identifier;
      if (identifier == v5->_identifier)
        v6 = 1;
      else
        v6 = -[NSCopying isEqual:](identifier, "isEqual:");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (_TUISnapValue)valueWithIdentifier:(id)a3
{
  NSCopying *v4;
  _TUISnapValue *v5;
  NSCopying *identifier;

  v4 = (NSCopying *)a3;
  v5 = -[_TUISnapValue initWithOther:]([_TUISnapValue alloc], "initWithOther:", self);
  identifier = v5->_identifier;
  v5->_identifier = v4;

  return v5;
}

- (_TUISnapValue)valueWithStep:(double)a3
{
  _TUISnapValue *v4;

  v4 = -[_TUISnapValue initWithOther:]([_TUISnapValue alloc], "initWithOther:", self);
  v4->_step = a3;
  return v4;
}

- (_TUISnapValue)valueWithMax:(double)a3
{
  _TUISnapValue *v4;

  v4 = -[_TUISnapValue initWithOther:]([_TUISnapValue alloc], "initWithOther:", self);
  v4->_max = a3;
  return v4;
}

- (unint64_t)stepForValue:(double)a3
{
  return vcvtmd_u64_f64((fmin(self->_max, a3) - self->_value) / self->_step);
}

- (double)valueForStep:(unint64_t)a3
{
  return self->_value + self->_step * (double)a3;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ value=%f identifier=%@ step=%f max=%f}"), *(_QWORD *)&self->_value, self->_identifier, *(_QWORD *)&self->_step, *(_QWORD *)&self->_max);
}

- (double)value
{
  return self->_value;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (double)step
{
  return self->_step;
}

- (double)max
{
  return self->_max;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
