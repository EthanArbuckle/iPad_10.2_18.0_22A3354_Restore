@implementation EQKitPaddedBox

- (EQKitPaddedBox)init
{
  return -[EQKitPaddedBox initWithBox:height:width:depth:lspace:voffset:](self, "initWithBox:height:width:depth:lspace:voffset:", 0, 0.0, 0.0, 0.0, 0.0, 0.0);
}

- (EQKitPaddedBox)initWithBox:(id)a3 height:(double)a4 width:(double)a5 depth:(double)a6 lspace:(double)a7 voffset:(double)a8
{
  EQKitPaddedBox *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)EQKitPaddedBox;
  v14 = -[EQKitPaddedBox init](&v16, sel_init);
  if (v14)
  {
    v14->mBox = (EQKitBox *)a3;
    v14->mHeight = a4;
    v14->mWidth = a5;
    v14->mDepth = a6;
    v14->mLspace = a7;
    v14->mVoffset = a8;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitPaddedBox;
  -[EQKitPaddedBox dealloc](&v3, sel_dealloc);
}

- (double)width
{
  return self->mWidth + self->mLspace;
}

- (double)opticalAlignWidth
{
  double result;

  -[EQKitBox opticalAlignWidth](self->mBox, "opticalAlignWidth");
  return result;
}

- (double)height
{
  return self->mHeight + self->mVoffset;
}

- (double)depth
{
  return self->mDepth - self->mVoffset;
}

- (CGRect)erasableBounds
{
  CGRect v3;

  -[EQKitBox erasableBounds](self->mBox, "erasableBounds");
  return CGRectOffset(v3, self->mLspace, -self->mVoffset);
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  objc_super v8;

  y = a4.y;
  x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)EQKitPaddedBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_);
  -[EQKitBox renderIntoContext:offset:](self->mBox, "renderIntoContext:offset:", a3, x + self->mLspace, y - self->mVoffset);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  switch(*((_DWORD *)a3 + 6))
  {
    case 0:
    case 2:
      a4.y = a4.y - self->mVoffset;
      break;
    case 1:
    case 3:
      a4.x = a4.x + self->mLspace;
      break;
    default:
      return -[EQKitBox appendOpticalAlignToSpec:offset:](self->mBox, "appendOpticalAlignToSpec:offset:", a4.x, a4.y);
  }
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->mBox, "appendOpticalAlignToSpec:offset:", a4.x, a4.y);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v8;
  __int128 v9;
  double mLspace;
  __int128 v11;
  CGAffineTransform v13;
  CGAffineTransform v14;
  uint64_t v15;
  uint64_t v16;

  if (a4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v15 = v4;
    v16 = v5;
    v8 = -[EQKitBox p_getTransform:fromDescendant:](self->mBox, "p_getTransform:fromDescendant:");
    if (v8)
    {
      v9 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v13.c = v9;
      mLspace = self->mLspace;
      *(_OWORD *)&v13.tx = *(_OWORD *)&a3->tx;
      CGAffineTransformTranslate(&v14, &v13, mLspace, -self->mVoffset);
      v11 = *(_OWORD *)&v14.c;
      *(_OWORD *)&a3->a = *(_OWORD *)&v14.a;
      *(_OWORD *)&a3->c = v11;
      *(_OWORD *)&a3->tx = *(_OWORD *)&v14.tx;
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  EQKitBox *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[EQKitPaddedBox box](self, "box");
  -[EQKitPaddedBox height](self, "height");
  v7 = v6;
  -[EQKitPaddedBox width](self, "width");
  v9 = v8;
  -[EQKitPaddedBox depth](self, "depth");
  v11 = v10;
  -[EQKitPaddedBox lspace](self, "lspace");
  v13 = v12;
  -[EQKitPaddedBox voffset](self, "voffset");
  return (id)objc_msgSend(v4, "initWithBox:height:width:depth:lspace:voffset:", v5, v7, v9, v11, v13, v14);
}

- (BOOL)isEqual:(id)a3
{
  EQKitPaddedBox *v3;
  BOOL v4;
  double v6;
  double v7;
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
  double v20;
  EQKitPaddedBox *v21;
  EQKitPaddedBox *v22;

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
        -[EQKitPaddedBox height](v3, "height");
        v7 = v6;
        objc_msgSend(a3, "height");
        if (v7 != v8)
          goto LABEL_13;
        -[EQKitPaddedBox width](v3, "width");
        v10 = v9;
        objc_msgSend(a3, "width");
        if (v10 != v11)
          goto LABEL_13;
        -[EQKitPaddedBox depth](v3, "depth");
        v13 = v12;
        objc_msgSend(a3, "depth");
        if (v13 != v14)
          goto LABEL_13;
        -[EQKitPaddedBox lspace](v3, "lspace");
        v16 = v15;
        objc_msgSend(a3, "lspace");
        if (v16 == v17
          && (-[EQKitPaddedBox voffset](v3, "voffset"), v19 = v18, objc_msgSend(a3, "voffset"), v19 == v20))
        {
          v21 = -[EQKitPaddedBox box](v3, "box");
          self = (EQKitPaddedBox *)objc_msgSend(a3, "box");
          if (v21 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v22 = self;
            LOBYTE(self) = 0;
            if (v21 && v22)
              LOBYTE(self) = -[EQKitPaddedBox isEqual:](v21, "isEqual:");
          }
        }
        else
        {
LABEL_13:
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
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitPaddedBox height](self, "height");
  v6 = v5;
  -[EQKitPaddedBox depth](self, "depth");
  v8 = v7;
  -[EQKitPaddedBox width](self, "width");
  v10 = v9;
  -[EQKitPaddedBox lspace](self, "lspace");
  v12 = v11;
  -[EQKitPaddedBox voffset](self, "voffset");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f lspace=%f voffset=%f box=%@ "), v4, self, v6, v8, v10, v12, v13, -[EQKitPaddedBox box](self, "box"));
}

- (EQKitBox)box
{
  return self->mBox;
}

- (double)lspace
{
  return self->mLspace;
}

- (double)voffset
{
  return self->mVoffset;
}

@end
