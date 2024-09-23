@implementation EQKitHSpace

- (EQKitHSpace)initWithWidth:(double)a3
{
  EQKitHSpace *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitHSpace;
  result = -[EQKitHSpace init](&v5, sel_init);
  if (result)
    result->mWidth = a3;
  return result;
}

- (EQKitHSpace)init
{
  return -[EQKitHSpace initWithWidth:](self, "initWithWidth:", 0.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitHSpace width](self, "width");
  return (id)objc_msgSend(v4, "initWithWidth:");
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  double v6;
  double v7;
  double v8;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3)
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
    {
      -[EQKitHSpace width](self, "width");
      v7 = v6;
      objc_msgSend(a3, "width");
      LOBYTE(v5) = v7 == v8;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitHSpace width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: width=%f"), v4, self, v5);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 0;
}

- (double)width
{
  return self->mWidth;
}

@end
