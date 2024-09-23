@implementation TSWPRuleOffset

+ (id)ruleOffset
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (TSWPRuleOffset)init
{
  return -[TSWPRuleOffset initWithDX:dY:](self, "initWithDX:dY:", 0.0, 0.0);
}

- (TSWPRuleOffset)initWithDX:(double)a3 dY:(double)a4
{
  TSWPRuleOffset *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPRuleOffset;
  result = -[TSWPRuleOffset init](&v7, sel_init);
  if (result)
  {
    result->_dX = a3;
    result->_dY = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDX:dY:", self->_dX, self->_dY);
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  double dX;
  double v7;
  double dY;
  double v9;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    dX = self->_dX;
    objc_msgSend(v4, "dX");
    if (dX == v7)
    {
      dY = self->_dY;
      objc_msgSend(v5, "dY");
      LOBYTE(v4) = dY == v9;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
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
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: dY=%+g; dY=%+g>"),
               NSStringFromClass(v4),
               *(_QWORD *)&self->_dX,
               *(_QWORD *)&self->_dY);
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
