@implementation CRLWPLineSpacing

+ (id)lineSpacing
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

- (CRLWPLineSpacing)init
{
  return -[CRLWPLineSpacing initWithMode:amount:](self, "initWithMode:amount:", 0, 1.0);
}

- (CRLWPLineSpacing)initWithMode:(int64_t)a3 amount:(double)a4 baselineRule:(double)a5
{
  CRLWPLineSpacing *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLWPLineSpacing;
  result = -[CRLWPLineSpacing init](&v9, "init");
  if (result)
  {
    result->_mode = a3;
    result->_amount = a4;
    result->_baselineRule = a5;
  }
  return result;
}

- (CRLWPLineSpacing)initWithMode:(int64_t)a3 amount:(double)a4
{
  return -[CRLWPLineSpacing initWithMode:amount:baselineRule:](self, "initWithMode:amount:baselineRule:", a3, a4, 0.800000012);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;

  *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
  return _objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "initWithMode:amount:baselineRule:", self->_mode, self->_amount, self->_baselineRule);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double amount;
  double v10;
  double baselineRule;
  double v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class(self, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v8
    && self->_mode == *(_QWORD *)(v8 + 8)
    && ((amount = self->_amount, v10 = *(double *)(v8 + 16), amount == v10)
     || vabdd_f64(amount, v10) < fabs(v10 * 0.000000999999997)))
  {
    baselineRule = self->_baselineRule;
    v12 = *(double *)(v8 + 24);
    v13 = baselineRule == v12 || vabdd_f64(baselineRule, v12) < fabs(v12 * 0.000000999999997);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_mode;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: mode=%lu; amount=%f; baselineRule=%f>"),
                   v5,
                   self->_mode,
                   *(_QWORD *)&self->_amount,
                   *(_QWORD *)&self->_baselineRule));

  return v6;
}

- (int64_t)mode
{
  return self->_mode;
}

- (double)amount
{
  return self->_amount;
}

- (double)baselineRule
{
  return self->_baselineRule;
}

@end
