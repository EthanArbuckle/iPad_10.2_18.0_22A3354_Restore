@implementation EQKitVShift

- (EQKitVShift)init
{
  return -[EQKitVShift initWithBox:offset:](self, "initWithBox:offset:", 0, 0.0);
}

- (EQKitVShift)initWithBox:(id)a3 offset:(double)a4
{
  EQKitVShift *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EQKitVShift;
  v6 = -[EQKitVShift init](&v8, sel_init);
  if (v6)
  {
    v6->mBox = (EQKitBox *)a3;
    v6->mOffset = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitVShift;
  -[EQKitVShift dealloc](&v3, sel_dealloc);
}

- (double)width
{
  double result;

  -[EQKitBox width](self->mBox, "width");
  return result;
}

- (double)height
{
  double v3;

  -[EQKitBox height](self->mBox, "height");
  return v3 + self->mOffset;
}

- (double)depth
{
  double v3;

  -[EQKitBox depth](self->mBox, "depth");
  return v3 - self->mOffset;
}

- (CGRect)erasableBounds
{
  CGRect v3;

  -[EQKitBox erasableBounds](self->mBox, "erasableBounds");
  return CGRectOffset(v3, 0.0, -self->mOffset);
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  objc_super v8;

  y = a4.y;
  x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)EQKitVShift;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_);
  -[EQKitBox renderIntoContext:offset:](self->mBox, "renderIntoContext:offset:", a3, x, y - self->mOffset);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->mBox, "appendOpticalAlignToSpec:offset:", a3, a4.x, a4.y - self->mOffset);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  uint64_t v14;
  uint64_t v15;

  if (a4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v14 = v4;
    v15 = v5;
    v8 = -[EQKitBox p_getTransform:fromDescendant:](self->mBox, "p_getTransform:fromDescendant:");
    if (v8)
    {
      v9 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v12.c = v9;
      *(_OWORD *)&v12.tx = *(_OWORD *)&a3->tx;
      CGAffineTransformTranslate(&v13, &v12, 0.0, -self->mOffset);
      v10 = *(_OWORD *)&v13.c;
      *(_OWORD *)&a3->a = *(_OWORD *)&v13.a;
      *(_OWORD *)&a3->c = v10;
      *(_OWORD *)&a3->tx = *(_OWORD *)&v13.tx;
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  EQKitBox *v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[EQKitVShift box](self, "box");
  -[EQKitVShift offset](self, "offset");
  return (id)objc_msgSend(v4, "initWithBox:offset:", v5);
}

- (BOOL)isEqual:(id)a3
{
  EQKitVShift *v3;
  BOOL v4;
  double v6;
  double v7;
  double v8;
  EQKitVShift *v9;
  EQKitVShift *v10;

  v3 = self;
  v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
      if ((_DWORD)self)
      {
        -[EQKitVShift offset](v3, "offset");
        v7 = v6;
        objc_msgSend(a3, "offset");
        if (v7 == v8)
        {
          v9 = -[EQKitVShift box](v3, "box");
          self = (EQKitVShift *)objc_msgSend(a3, "box");
          if (v9 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v10 = self;
            LOBYTE(self) = 0;
            if (v9 && v10)
              LOBYTE(self) = -[EQKitVShift isEqual:](v9, "isEqual:");
          }
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
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
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitVShift height](self, "height");
  v6 = v5;
  -[EQKitVShift depth](self, "depth");
  v8 = v7;
  -[EQKitVShift width](self, "width");
  v10 = v9;
  -[EQKitVShift offset](self, "offset");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f offset=%f box=%@ "), v4, self, v6, v8, v10, v11, -[EQKitVShift box](self, "box"));
}

- (EQKitBox)box
{
  return self->mBox;
}

- (double)offset
{
  return self->mOffset;
}

@end
