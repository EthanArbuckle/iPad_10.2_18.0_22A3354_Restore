@implementation EQKitOverlayBox

- (EQKitOverlayBox)initWithBox:(id)a3 overlayBox:(id)a4
{
  EQKitOverlayBox *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EQKitOverlayBox;
  v6 = -[EQKitOverlayBox init](&v8, sel_init);
  if (v6)
  {
    v6->mBox = (EQKitBox *)a3;
    v6->mOverlayBox = (EQKitBox *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitOverlayBox;
  -[EQKitOverlayBox dealloc](&v3, sel_dealloc);
}

- (double)width
{
  double result;

  -[EQKitBox width](self->mBox, "width");
  return result;
}

- (double)height
{
  double result;

  -[EQKitBox height](self->mBox, "height");
  return result;
}

- (double)depth
{
  double result;

  -[EQKitBox depth](self->mBox, "depth");
  return result;
}

- (CGRect)erasableBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v17;

  -[EQKitBox erasableBounds](self->mBox, "erasableBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[EQKitBox erasableBounds](self->mOverlayBox, "erasableBounds");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  return CGRectUnion(v15, v17);
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  objc_super v8;

  y = a4.y;
  x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)EQKitOverlayBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_);
  -[EQKitBox renderIntoContext:offset:](self->mBox, "renderIntoContext:offset:", a3, x, y);
  -[EQKitBox renderIntoContext:offset:](self->mOverlayBox, "renderIntoContext:offset:", a3, x, y);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->mBox, "appendOpticalAlignToSpec:offset:", a3, a4.x, a4.y);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  return a4 == self || -[EQKitBox p_getTransform:fromDescendant:](self->mBox, "p_getTransform:fromDescendant:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBox:overlayBox:", -[EQKitOverlayBox box](self, "box"), -[EQKitOverlayBox overlayBox](self, "overlayBox"));
}

- (BOOL)isEqual:(id)a3
{
  EQKitOverlayBox *v3;
  BOOL v4;
  EQKitOverlayBox *v6;
  EQKitOverlayBox *v7;
  EQKitOverlayBox *v8;
  EQKitOverlayBox *v9;

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
        v6 = -[EQKitOverlayBox box](v3, "box");
        self = (EQKitOverlayBox *)objc_msgSend(a3, "box");
        if (v6 == self
          || (v7 = self, LOBYTE(self) = 0, v6)
          && v7
          && (LODWORD(self) = -[EQKitOverlayBox isEqual:](v6, "isEqual:"), (_DWORD)self))
        {
          v8 = -[EQKitOverlayBox overlayBox](v3, "overlayBox");
          self = (EQKitOverlayBox *)objc_msgSend(a3, "overlayBox");
          if (v8 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v9 = self;
            LOBYTE(self) = 0;
            if (v8 && v9)
              LOBYTE(self) = -[EQKitOverlayBox isEqual:](v8, "isEqual:");
          }
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitOverlayBox height](self, "height");
  v6 = v5;
  -[EQKitOverlayBox depth](self, "depth");
  v8 = v7;
  -[EQKitOverlayBox width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f box=%@ overlayBox=%@ "), v4, self, v6, v8, v9, -[EQKitOverlayBox box](self, "box"), -[EQKitOverlayBox overlayBox](self, "overlayBox"));
}

- (EQKitBox)box
{
  return self->mBox;
}

- (EQKitBox)overlayBox
{
  return self->mOverlayBox;
}

@end
