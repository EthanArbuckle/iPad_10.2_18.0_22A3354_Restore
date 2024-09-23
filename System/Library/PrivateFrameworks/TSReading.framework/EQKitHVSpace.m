@implementation EQKitHVSpace

- (EQKitHVSpace)init
{
  return -[EQKitHVSpace initWithWidth:height:depth:](self, "initWithWidth:height:depth:", 0.0, 0.0, 0.0);
}

- (EQKitHVSpace)initWithWidth:(double)a3 height:(double)a4 depth:(double)a5
{
  EQKitHVSpace *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EQKitHVSpace;
  result = -[EQKitHVSpace init](&v9, sel_init);
  if (result)
  {
    result->mWidth = a3;
    result->mHeight = a4;
    result->mDepth = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitHVSpace width](self, "width");
  v6 = v5;
  -[EQKitHVSpace height](self, "height");
  v8 = v7;
  -[EQKitHVSpace depth](self, "depth");
  return (id)objc_msgSend(v4, "initWithWidth:height:depth:", v6, v8, v9);
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
  double v12;
  double v13;
  double v14;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3)
    goto LABEL_8;
  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    -[EQKitHVSpace width](self, "width");
    v7 = v6;
    objc_msgSend(a3, "width");
    if (v7 == v8)
    {
      -[EQKitHVSpace height](self, "height");
      v10 = v9;
      objc_msgSend(a3, "height");
      if (v10 == v11)
      {
        -[EQKitHVSpace depth](self, "depth");
        v13 = v12;
        objc_msgSend(a3, "depth");
        LOBYTE(v5) = v13 == v14;
        return v5;
      }
    }
LABEL_8:
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
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitHVSpace height](self, "height");
  v6 = v5;
  -[EQKitHVSpace depth](self, "depth");
  v8 = v7;
  -[EQKitHVSpace width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f"), v4, self, v6, v8, v9);
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

- (double)width
{
  return self->mWidth;
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
