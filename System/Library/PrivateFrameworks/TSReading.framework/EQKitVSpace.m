@implementation EQKitVSpace

- (EQKitVSpace)initWithHeight:(double)a3 depth:(double)a4
{
  EQKitVSpace *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EQKitVSpace;
  result = -[EQKitVSpace init](&v7, sel_init);
  if (result)
  {
    result->mHeight = a3;
    result->mDepth = a4;
  }
  return result;
}

- (EQKitVSpace)init
{
  return -[EQKitVSpace initWithHeight:depth:](self, "initWithHeight:depth:", 0.0, 0.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitVSpace height](self, "height");
  v6 = v5;
  -[EQKitVSpace depth](self, "depth");
  return (id)objc_msgSend(v4, "initWithHeight:depth:", v6, v7);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3)
    goto LABEL_7;
  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    -[EQKitVSpace height](self, "height");
    v7 = v6;
    objc_msgSend(a3, "height");
    if (v7 == v8)
    {
      -[EQKitVSpace depth](self, "depth");
      v10 = v9;
      objc_msgSend(a3, "depth");
      LOBYTE(v5) = v10 == v11;
      return v5;
    }
LABEL_7:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitVSpace height](self, "height");
  v6 = v5;
  -[EQKitVSpace depth](self, "depth");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f"), v4, self, v6, v7);
}

- (double)layoutHeight
{
  return self->mHeight;
}

- (double)layoutDepth
{
  return self->mDepth;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 0;
}

- (double)height
{
  return self->mHeight;
}

- (double)depth
{
  return self->mDepth;
}

@end
