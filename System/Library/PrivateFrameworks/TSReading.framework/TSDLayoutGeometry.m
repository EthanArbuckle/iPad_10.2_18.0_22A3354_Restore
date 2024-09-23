@implementation TSDLayoutGeometry

- (id)geometryByTranslatingBy:(CGPoint)a3
{
  CGAffineTransform v5;

  CGAffineTransformMakeTranslation(&v5, a3.x, a3.y);
  return -[TSDLayoutGeometry geometryByTransformingBy:](self, "geometryByTransformingBy:", &v5);
}

- (CGRect)frame
{
  __int128 v3;
  CGAffineTransform v4;
  CGRect v5;

  v5.origin.x = TSDRectWithSize();
  v3 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&v4.c = v3;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->mTransform.tx;
  return CGRectApplyAffineTransform(v5, &v4);
}

- (TSDLayoutGeometry)init
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return -[TSDLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", v4, 100.0, 100.0);
}

- (id)geometryByTransformingBy:(CGAffineTransform *)a3
{
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  TSDLayoutGeometry *v13;
  CGAffineTransform v15;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v18;

  memset(&v18, 0, sizeof(v18));
  if (self)
    -[TSDLayoutGeometry transform](self, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v5;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v18, &t1, &t2);
  t2 = v18;
  v6 = TSDTransformXYScale(&t2.a);
  v8 = v7;
  v15 = v18;
  memset(&t2, 0, sizeof(t2));
  CGAffineTransformScale(&t2, &v15, 1.0 / v6, 1.0 / v7);
  -[TSDLayoutGeometry size](self, "size");
  v10 = v6 * v9;
  -[TSDLayoutGeometry size](self, "size");
  v12 = v8 * v11;
  v13 = [TSDLayoutGeometry alloc];
  v15 = t2;
  return -[TSDLayoutGeometry initWithSize:transform:](v13, "initWithSize:transform:", &v15, v10, v12);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->mSize.width;
  height = self->mSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double width;
  double height;
  __int128 v7;
  _OWORD v9[3];

  v4 = objc_alloc((Class)objc_opt_class());
  width = self->mSize.width;
  height = self->mSize.height;
  v7 = *(_OWORD *)&self->mTransform.c;
  v9[0] = *(_OWORD *)&self->mTransform.a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&self->mTransform.tx;
  return (id)objc_msgSend(v4, "initWithSize:transform:", v9, width, height);
}

- (TSDLayoutGeometry)initWithSize:(CGSize)a3 transform:(CGAffineTransform *)a4
{
  CGFloat height;
  CGFloat width;
  TSDLayoutGeometry *result;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)TSDLayoutGeometry;
  result = -[TSDLayoutGeometry init](&v10, sel_init);
  if (result)
  {
    result->mSize.width = width;
    result->mSize.height = height;
    v8 = *(_OWORD *)&a4->a;
    v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&result->mTransform.tx = *(_OWORD *)&a4->tx;
    *(_OWORD *)&result->mTransform.c = v9;
    *(_OWORD *)&result->mTransform.a = v8;
  }
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

- (TSDLayoutGeometry)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  CGAffineTransform v7;

  height = a3.size.height;
  width = a3.size.width;
  CGAffineTransformMakeTranslation(&v7, a3.origin.x, a3.origin.y);
  return -[TSDLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", &v7, width, height);
}

- (TSDLayoutGeometry)initWithInfoGeometry:(id)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  uint64_t v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  if (a3)
  {
    if (!objc_msgSend(a3, "heightValid") || (objc_msgSend(a3, "widthValid") & 1) == 0)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayoutGeometry initWithInfoGeometry:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutGeometry.m"), 49, CFSTR("can't create layout geometry from info geometry if width and height are not valid"));
    }
    objc_msgSend(a3, "size");
    v8 = v7;
    v10 = v9;
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    objc_msgSend(a3, "transform");
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    return -[TSDLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", v14, v8, v10);
  }
  else
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayoutGeometry initWithInfoGeometry:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutGeometry.m"), 45, CFSTR("invalid nil value for '%s'"), "infoGeometry");
    return 0;
  }
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3
{
  double b;
  double a;
  double v6;
  double d;
  double c;
  double v9;
  TSDLayoutGeometry *v10;
  __int128 v11;
  _OWORD v13[3];

  a = a3->a;
  b = a3->b;
  v6 = sqrt(b * b + a * a);
  c = a3->c;
  d = a3->d;
  v9 = sqrt(d * d + c * c);
  if (v6 > 0.01)
  {
    a3->a = a / v6;
    a3->b = b / v6;
  }
  if (v9 > 0.01)
  {
    a3->c = c / v9;
    a3->d = d / v9;
  }
  v10 = [TSDLayoutGeometry alloc];
  v11 = *(_OWORD *)&a3->c;
  v13[0] = *(_OWORD *)&a3->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a3->tx;
  return -[TSDLayoutGeometry initWithSize:transform:](v10, "initWithSize:transform:", v13, v6, v9);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableLayoutGeometry *v4;
  double width;
  double height;
  __int128 v7;
  _OWORD v9[3];

  v4 = [TSDMutableLayoutGeometry alloc];
  width = self->mSize.width;
  height = self->mSize.height;
  v7 = *(_OWORD *)&self->mTransform.c;
  v9[0] = *(_OWORD *)&self->mTransform.a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&self->mTransform.tx;
  return -[TSDLayoutGeometry initWithSize:transform:](v4, "initWithSize:transform:", v9, width, height);
}

- (BOOL)isEqual:(id)a3
{
  __int128 v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform t1;

  if (!a3)
    return 0;
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (self->mSize.width != *((double *)a3 + 1) || self->mSize.height != *((double *)a3 + 2))
    return 0;
  v7 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->mTransform.tx;
  v8 = *(_OWORD *)((char *)a3 + 40);
  *(_OWORD *)&v9.a = *(_OWORD *)((char *)a3 + 24);
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tx = *(_OWORD *)((char *)a3 + 56);
  return CGAffineTransformEqualToTransform(&t1, &v9);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  __int128 v8;
  CGAffineTransform transform;
  CGRect v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[TSDLayoutGeometry frame](self, "frame");
  v6 = NSStringFromCGRect(v11);
  v7 = NSStringFromCGSize(self->mSize);
  v8 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&transform.c = v8;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->mTransform.tx;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p frame=%@ size=%@ xform=%@>"), v5, self, v6, v7, NSStringFromCGAffineTransform(&transform));
}

- (CGPoint)center
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vaddq_f64(*(float64x2_t *)&self->mTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->mTransform.c, self->mSize.height * 0.5), *(float64x2_t *)&self->mTransform.a, self->mSize.width * 0.5));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (CGAffineTransform)inverseTransform
{
  __int128 v3;
  CGAffineTransform v5;

  v3 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&v5.a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)&self->mTransform.tx;
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGAffineTransform)fullTransform
{
  CGFloat width;
  CGFloat height;
  __int128 v5;
  CGAffineTransform v7;

  width = self->mSize.width;
  height = self->mSize.height;
  v5 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->mTransform.tx;
  return CGAffineTransformScale(retstr, &v7, width, height);
}

- (id)infoGeometry
{
  TSDInfoGeometry *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = [TSDInfoGeometry alloc];
  if (self)
  {
    -[TSDLayoutGeometry transform](self, "transform");
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  -[TSDLayoutGeometry size](self, "size", v5, v6, v7);
  return -[TSDInfoGeometry initWithTransform:size:](v3, "initWithTransform:size:", &v5);
}

- (id)geometryByOutsettingBy:(CGSize)a3
{
  double height;
  double width;
  void *v5;

  height = a3.height;
  width = a3.width;
  v5 = (void *)-[TSDLayoutGeometry mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "outsetBy:", width, height);
  return v5;
}

- (CGAffineTransform)transformByConcatenatingTransformTo:(SEL)a3
{
  __int128 v4;
  __int128 v5;
  CGAffineTransform v7;
  CGAffineTransform t1;

  v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  v5 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->mTransform.tx;
  return CGAffineTransformConcat(retstr, &t1, &v7);
}

- (BOOL)differsInMoreThanTranslationFrom:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v13;
  _OWORD v14[3];

  if (!a3)
    return 1;
  -[TSDLayoutGeometry frame](self, "frame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a3, "frame");
  if (v6 != v10 || v8 != v9)
    return 1;
  if (self)
    -[TSDLayoutGeometry transform](self, "transform");
  else
    memset(v14, 0, sizeof(v14));
  objc_msgSend(a3, "transform");
  return !TSDTransformsDifferOnlyByTranslation((double *)v14, &v13);
}

@end
