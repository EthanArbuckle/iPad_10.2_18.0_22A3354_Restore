@implementation CRLWPRuleOffset

+ (id)ruleOffset
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

+ (id)ruleOffsetWithDX:(double)a3 dY:(double)a4
{
  Class v6;

  objc_opt_class(a1, a2);
  return objc_msgSend([v6 alloc], "initWithDX:dY:", a3, a4);
}

- (CRLWPRuleOffset)initWithDX:(double)a3 dY:(double)a4
{
  CRLWPRuleOffset *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLWPRuleOffset;
  result = -[CRLWPRuleOffset init](&v7, "init");
  if (result)
  {
    result->_dX = a3;
    result->_dY = a4;
  }
  return result;
}

- (CRLWPRuleOffset)init
{
  return -[CRLWPRuleOffset initWithDX:dY:](self, "initWithDX:dY:", 0.0, 0.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  Class v4;

  objc_opt_class(self, a2);
  return objc_msgSend([v4 alloc], "initWithDX:dY:", self->_dX, self->_dY);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  double dX;
  double v11;
  double dY;
  double v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class(self, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8 && (dX = self->_dX, objc_msgSend(v8, "dX"), dX == v11))
  {
    dY = self->_dY;
    objc_msgSend(v9, "dY");
    v14 = dY == v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  return 0;
}

- (CGPoint)pointValue
{
  double dX;
  double dY;
  CGPoint result;

  dX = self->_dX;
  dY = self->_dY;
  result.y = dY;
  result.x = dX;
  return result;
}

- (CGSize)sizeValue
{
  double dX;
  double dY;
  CGSize result;

  dX = self->_dX;
  dY = self->_dY;
  result.height = dY;
  result.width = dX;
  return result;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: dY=%+g; dY=%+g>"),
                   v5,
                   *(_QWORD *)&self->_dX,
                   *(_QWORD *)&self->_dY));

  return v6;
}

- (double)dX
{
  return self->_dX;
}

- (double)dY
{
  return self->_dY;
}

@end
