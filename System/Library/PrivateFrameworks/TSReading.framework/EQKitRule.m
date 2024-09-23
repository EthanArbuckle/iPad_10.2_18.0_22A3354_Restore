@implementation EQKitRule

- (EQKitRule)initWithHeight:(double)a3 depth:(double)a4 width:(double)a5 cgColor:(CGColor *)a6
{
  EQKitRule *v10;
  EQKitRule *v11;
  CGColor *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EQKitRule;
  v10 = -[EQKitRule init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->mHeight = a3;
    v10->mDepth = a4;
    v10->mWidth = a5;
    if (a6)
      v12 = (CGColor *)CFRetain(a6);
    else
      v12 = 0;
    v11->mCGColor = v12;
  }
  return v11;
}

- (EQKitRule)init
{
  return -[EQKitRule initWithHeight:depth:width:cgColor:](self, "initWithHeight:depth:width:cgColor:", 0, 0.0, 0.0, 0.0);
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)EQKitRule;
  -[EQKitRule dealloc](&v3, sel_dealloc);
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
  -[EQKitRule height](self, "height");
  v6 = v5;
  -[EQKitRule depth](self, "depth");
  v8 = v7;
  -[EQKitRule width](self, "width");
  return (id)objc_msgSend(v4, "initWithHeight:depth:width:cgColor:", self->mCGColor, v6, v8, v9);
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
    -[EQKitRule height](self, "height");
    v7 = v6;
    objc_msgSend(a3, "height");
    if (v7 == v8)
    {
      -[EQKitRule depth](self, "depth");
      v10 = v9;
      objc_msgSend(a3, "depth");
      if (v10 == v11)
      {
        -[EQKitRule width](self, "width");
        v13 = v12;
        objc_msgSend(a3, "width");
        if (v13 == v14)
        {
          LOBYTE(v5) = CGColorEqualToColor(-[EQKitRule color](self, "color"), (CGColorRef)objc_msgSend(a3, "color"));
          return v5;
        }
      }
    }
LABEL_8:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (a3)
  {
    y = a4.y;
    x = a4.x;
    -[EQKitRule width](self, "width");
    v9 = v8;
    -[EQKitBox vsize](self, "vsize");
    if (v9 > 0.0)
    {
      v11 = v10;
      if (v10 > 0.0)
      {
        if (self->mCGColor)
        {
          CGContextSaveGState(a3);
          CGContextSetFillColorWithColor(a3, self->mCGColor);
        }
        -[EQKitRule height](self, "height");
        v13 = y - v12;
        if (v9 >= 0.0)
          v14 = v9;
        else
          v14 = -v9;
        v15 = -0.0;
        if (v9 >= 0.0)
          v16 = -0.0;
        else
          v16 = v9;
        v17 = x + v16;
        v18 = -v11;
        if (v11 < 0.0)
          v15 = v11;
        else
          v18 = v11;
        v19 = v15 + v13;
        CGContextFillRect(a3, *(CGRect *)(&v14 - 2));
        if (self->mCGColor)
          CGContextRestoreGState(a3);
      }
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  int v4;

  v4 = *((_DWORD *)a3 + 6);
  if (v4 == 2)
  {
    a4.x = a4.x + self->mWidth;
  }
  else if (v4)
  {
    return 1;
  }
  EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, a4, self->mHeight);
  return 1;
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
  -[EQKitRule height](self, "height");
  v6 = v5;
  -[EQKitRule depth](self, "depth");
  v8 = v7;
  -[EQKitRule width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f"), v4, self, v6, v8, v9);
}

- (double)height
{
  return self->mHeight;
}

- (double)depth
{
  return self->mDepth;
}

- (double)width
{
  return self->mWidth;
}

- (CGColor)color
{
  return self->mCGColor;
}

@end
