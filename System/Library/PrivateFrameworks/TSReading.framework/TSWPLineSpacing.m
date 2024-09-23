@implementation TSWPLineSpacing

- (int)mode
{
  return self->_mode;
}

- (double)baselineRule
{
  return self->_baselineRule;
}

- (double)amount
{
  return self->_amount;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
    LOBYTE(v4) = self->_mode == *(_DWORD *)(v4 + 8)
              && self->_amount == *(double *)(v4 + 16)
              && self->_baselineRule == *(double *)(v4 + 24);
  return v4;
}

+ (id)lineSpacing
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (TSWPLineSpacing)initWithMode:(int)a3 amount:(double)a4 baselineRule:(double)a5
{
  TSWPLineSpacing *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPLineSpacing;
  result = -[TSWPLineSpacing init](&v9, sel_init);
  if (result)
  {
    result->_mode = a3;
    result->_amount = a4;
    result->_baselineRule = a5;
  }
  return result;
}

- (TSWPLineSpacing)initWithMode:(int)a3 amount:(double)a4
{
  return -[TSWPLineSpacing initWithMode:amount:baselineRule:](self, "initWithMode:amount:baselineRule:", *(_QWORD *)&a3, a4, 0.800000012);
}

- (TSWPLineSpacing)init
{
  return -[TSWPLineSpacing initWithMode:amount:](self, "initWithMode:amount:", 0, 1.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMode:amount:baselineRule:", self->_mode, self->_amount, self->_baselineRule);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: mode=%d; amount=%f; baselineRule=%f>"),
               NSStringFromClass(v4),
               self->_mode,
               *(_QWORD *)&self->_amount,
               *(_QWORD *)&self->_baselineRule);
}

@end
