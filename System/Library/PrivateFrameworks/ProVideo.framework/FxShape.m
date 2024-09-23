@implementation FxShape

+ (id)infiniteShape
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInfiniteBounds");
}

+ (id)shapeWithRect:(CGRect)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (FxShape)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  FxShape *v7;
  FxShapePriv *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)FxShape;
  v7 = -[FxShape init](&v10, sel_init);
  if (v7)
  {
    v8 = (FxShapePriv *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004074F221ECuLL);
    v7->_priv = v8;
    if (v8)
    {
      v8->var0.origin.x = x;
      v8->var0.origin.y = y;
      v8->var0.size.width = width;
      v8->var0.size.height = height;
      v8->var1 = 0;
    }
  }
  return v7;
}

- (FxShape)initWithInfiniteBounds
{
  FxShape *v2;
  FxShapePriv *v3;
  CGSize v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FxShape;
  v2 = -[FxShape init](&v6, sel_init);
  if (v2)
  {
    v3 = (FxShapePriv *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004074F221ECuLL);
    v2->_priv = v3;
    if (v3)
    {
      v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v3->var0.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v3->var0.size = v4;
      v2->_priv->var1 = 1;
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_priv);
  v9.receiver = self;
  v9.super_class = (Class)FxShape;
  -[FxShape dealloc](&v9, sel_dealloc);
}

- (CGRect)extent
{
  FxShapePriv *priv;
  double width;
  double y;
  double x;
  double height;
  CGRect result;

  priv = self->_priv;
  if (priv->var1)
  {
    width = 3.40282347e38;
    y = -1.70141173e38;
    x = -1.70141173e38;
    height = 3.40282347e38;
  }
  else
  {
    x = priv->var0.origin.x;
    y = priv->var0.origin.y;
    width = priv->var0.size.width;
    height = priv->var0.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isInfinite
{
  return self->_priv->var1;
}

- (id)intersectWithShape:(id)a3
{
  CGRect *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGRect v8;
  CGRect v9;

  if (a3)
  {
    v3 = (CGRect *)*((_QWORD *)self + 1);
    objc_msgSend(a3, "extent");
    v9.origin.x = v4;
    v9.origin.y = v5;
    v9.size.width = v6;
    v9.size.height = v7;
    v8 = CGRectIntersection(*v3, v9);
    return +[FxShape shapeWithRect:](FxShape, "shapeWithRect:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  }
  return self;
}

@end
