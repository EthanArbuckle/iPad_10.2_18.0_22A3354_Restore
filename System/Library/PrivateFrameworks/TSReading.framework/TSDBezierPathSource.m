@implementation TSDBezierPathSource

+ (id)pathSourceWithBezierPath:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBezierPath:", a3);
}

- (TSDBezierPathSource)initWithBezierPath:(id)a3
{
  TSDBezierPathSource *v4;
  double v5;
  double v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDBezierPathSource;
  v4 = -[TSDBezierPathSource init](&v9, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "elementCount") < 1)
    {
      v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
      v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
    }
    else
    {
      objc_msgSend(a3, "controlPointBounds");
    }
    v7 = v5 == *MEMORY[0x24BDBF148] && v6 == *(double *)(MEMORY[0x24BDBF148] + 8);
    if (v7 || TSDRectHasNaNComponents())
    {
      a3 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
      objc_msgSend(a3, "moveToPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      objc_msgSend(a3, "lineToPoint:", 100.0, 100.0);
    }
    if (a3)
    {
      -[TSDBezierPathSource p_setBezierPath:](v4, "p_setBezierPath:", a3);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (TSDBezierPathSource)initWithNaturalSize:(CGSize)a3
{
  return -[TSDBezierPathSource initWithBezierPath:](self, "initWithBezierPath:", +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", 0.0, 0.0, a3.width, a3.height));
}

- (TSDBezierPathSource)init
{
  return -[TSDBezierPathSource initWithBezierPath:](self, "initWithBezierPath:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDBezierPathSource;
  -[TSDBezierPathSource dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)-[TSDBezierPath copy](self->mPath, "copy");
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBezierPath:", v5);

  objc_msgSend(v6, "setHasHorizontalFlip:", -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
  objc_msgSend(v6, "setHasVerticalFlip:", -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"));
  -[TSDBezierPathSource naturalSize](self, "naturalSize");
  objc_msgSend(v6, "setNaturalSize:");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  TSDBezierPath *mPath;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v12 = v3;
    v13 = v4;
    objc_opt_class();
    v7 = TSUDynamicCast();
    if (v7)
    {
      v8 = v7;
      v11.receiver = self;
      v11.super_class = (Class)TSDBezierPathSource;
      LODWORD(v7) = -[TSDPathSource isEqual:](&v11, sel_isEqual_, a3);
      if ((_DWORD)v7)
      {
        mPath = self->mPath;
        if (mPath == *(TSDBezierPath **)(v8 + 16)
          || (LODWORD(v7) = -[TSDBezierPath isEqual:](mPath, "isEqual:"), (_DWORD)v7))
        {
          LOBYTE(v7) = self->mIsRectangular != (*(_BYTE *)(v8 + 24) == 0)
                    && self->mNaturalSize.height == *(double *)(v8 + 40)
                    && self->mNaturalSize.width == *(double *)(v8 + 32);
        }
      }
    }
  }
  return v7;
}

- (unint64_t)hash
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return -[NSString hash](NSStringFromClass(v2), "hash");
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDBezierPathSource;
  v3 = (void *)objc_msgSend(-[TSDBezierPathSource description](&v5, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("; naturalSize=%@; path=%@; isRectangular=%d"),
      NSStringFromCGSize(self->mNaturalSize),
      self->mPath,
      self->mIsRectangular));
  return v3;
}

- (CGAffineTransform)transformToNaturalSize
{
  double v5;
  double v6;
  double v7;
  double v8;
  double height;
  double width;
  CGAffineTransform *result;
  uint64_t v12;
  __int128 v13;
  double v14;
  double v15;
  float v16;
  float v17;

  -[TSDBezierPath bounds](self->mPath, "bounds");
  v6 = v5;
  v8 = v7;
  width = self->mNaturalSize.width;
  height = self->mNaturalSize.height;
  result = (CGAffineTransform *)TSDNearlyEqualSizes(v5, v7, width, height);
  if ((result & 1) != 0)
  {
    v12 = MEMORY[0x24BDBD8B8];
    v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  }
  else
  {
    v14 = 1.0;
    v15 = 1.0;
    if (v6 > 0.01)
    {
      v16 = width / v6;
      v15 = v16;
    }
    if (v8 > 0.01)
    {
      v17 = height / v8;
      v14 = v17;
    }
    return CGAffineTransformMakeScale(retstr, v15, v14);
  }
  return result;
}

- (id)bezierPathWithoutFlips
{
  void *v3;
  CGAffineTransform v5[2];

  v3 = (void *)-[TSDBezierPath copy](self->mPath, "copy");
  memset(&v5[1], 0, sizeof(CGAffineTransform));
  -[TSDBezierPathSource transformToNaturalSize](self, "transformToNaturalSize");
  v5[0] = v5[1];
  if (!CGAffineTransformIsIdentity(v5))
  {
    v5[0] = v5[1];
    objc_msgSend(v3, "transformUsingAffineTransform:", v5);
  }
  return v3;
}

- (BOOL)isRectangular
{
  return self->mIsRectangular;
}

- (BOOL)isCircular
{
  return -[TSDBezierPath isCircular](self->mPath, "isCircular");
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__TSDBezierPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __44__TSDBezierPathSource_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  objc_opt_class();
  v2 = TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPathSource mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathSource.m"), 176, CFSTR("nil object after cast"));
  }
  if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24) == *(unsigned __int8 *)(v2 + 24))
    return 4;
  else
    return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__TSDBezierPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDBezierPathSource *__56__TSDBezierPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSDBezierPathSource *v12;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_msgSend(*(id *)(a1 + 40), "naturalSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "naturalSize");
  v9 = TSDMixSizes(v4, v6, v7, v8, *(double *)(a1 + 48));
  v11 = v10;
  v12 = +[TSDBezierPathSource pathSourceWithBezierPath:](TSDBezierPathSource, "pathSourceWithBezierPath:", objc_msgSend(*(id *)(a1 + 40), "bezierPath"));
  -[TSDBezierPathSource setNaturalSize:](v12, "setNaturalSize:", v9, v11);
  return v12;
}

- (void)p_setBezierPath:(id)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGAffineTransform v14;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPathSource p_setBezierPath:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathSource.m"), 207, CFSTR("invalid nil value for '%s'"), "path");
  }
  objc_msgSend(a3, "bounds");
  v8 = v7;
  v10 = v9;
  if (!TSDNearlyEqualPoints(v7, v9, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8)))
  {
    CGAffineTransformMakeTranslation(&v14, -v8, -v10);
    objc_msgSend(a3, "transformUsingAffineTransform:", &v14);
  }
  v11 = a3;

  self->mPath = (TSDBezierPath *)a3;
  objc_msgSend(a3, "bounds");
  self->mNaturalSize.width = v12;
  self->mNaturalSize.height = v13;
  self->mIsRectangular = -[TSDBezierPath isRectangular](self->mPath, "isRectangular");
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->mNaturalSize.width;
  height = self->mNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->mNaturalSize = a3;
}

@end
