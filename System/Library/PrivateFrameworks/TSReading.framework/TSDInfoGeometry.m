@implementation TSDInfoGeometry

- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 widthValid:(BOOL)a5 heightValid:(BOOL)a6 horizontalFlip:(BOOL)a7 verticalFlip:(BOOL)a8 angle:(double)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSDInfoGeometry *v18;
  TSDInfoGeometry *v19;
  char v20;
  char v21;
  char v22;
  double v23;
  objc_super v25;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  v25.receiver = self;
  v25.super_class = (Class)TSDInfoGeometry;
  v18 = -[TSDInfoGeometry init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->mPosition.x = x;
    v18->mPosition.y = y;
    v18->mSize.width = width;
    v18->mSize.height = height;
    if (v11)
      v20 = 2;
    else
      v20 = 0;
    if (v10)
      v21 = 4;
    else
      v21 = 0;
    if (v9)
      v22 = 8;
    else
      v22 = 0;
    *(_BYTE *)&v18->mFlags = v20 | a5 | v21 | v22 | *(_BYTE *)&v18->mFlags & 0xF0;
    TSDNormalizeAngleInDegrees(a9);
    v19->mAngle = v23;
  }
  return v19;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableInfoGeometry *v4;
  $CB6DE01367A4C750E2FF2F6D92039807 mFlags;

  v4 = [TSDMutableInfoGeometry alloc];
  mFlags = self->mFlags;
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v4, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(_BYTE *)&mFlags & 1, (*(unsigned int *)&mFlags >> 1) & 1, (*(unsigned int *)&mFlags >> 2) & 1, (*(unsigned int *)&mFlags >> 3) & 1, self->mPosition.x, self->mPosition.y, self->mSize.width, self->mSize.height, self->mAngle);
}

- (TSDInfoGeometry)init
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 100.0, 100.0, 0.0);
}

- (TSDInfoGeometry)initWithSize:(CGSize)a3
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), a3.width, a3.height, 0.0);
}

- (TSDInfoGeometry)initWithWidth:(double)a3
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 0, 0, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), a3, 0.0, 0.0);
}

- (TSDInfoGeometry)initWithHeight:(double)a3
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 0, 1, 0, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 0.0, a3, 0.0);
}

- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, a3.x, a3.y, a4.width, a4.height, 0.0);
}

- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, a3.x, a3.y, a4.width, a4.height, a5);
}

- (TSDInfoGeometry)initWithCenter:(CGPoint)a3 size:(CGSize)a4
{
  return -[TSDInfoGeometry initWithPosition:size:](self, "initWithPosition:size:", a3.x - a4.width * 0.5, a3.y - a4.height * 0.5);
}

- (TSDInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5
{
  return -[TSDInfoGeometry initWithTransformedBoundsOrigin:size:horizontalFlip:verticalFlip:angle:](self, "initWithTransformedBoundsOrigin:size:horizontalFlip:verticalFlip:angle:", 0, 0, a3.x, a3.y, a4.width, a4.height, a5);
}

- (TSDInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 horizontalFlip:(BOOL)a5 verticalFlip:(BOOL)a6 angle:(double)a7
{
  double y;
  double x;
  TSDInfoGeometry *v9;
  TSDInfoGeometry *v10;
  double v11;
  double v12;
  CGFloat v13;

  y = a3.y;
  x = a3.x;
  v9 = -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, a5, a6, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), a4.width, a4.height, a7);
  v10 = v9;
  if (v9)
  {
    -[TSDInfoGeometry transformedBoundsOrigin](v9, "transformedBoundsOrigin");
    v12 = TSDSubtractPoints(v10->mPosition.x, v10->mPosition.y, v11);
    v10->mPosition.x = TSDAddPoints(x, y, v12);
    v10->mPosition.y = v13;
  }
  return v10;
}

- (BOOL)widthValid
{
  return *(_BYTE *)&self->mFlags & 1;
}

- (BOOL)heightValid
{
  return (*(_BYTE *)&self->mFlags >> 1) & 1;
}

- (BOOL)horizontalFlip
{
  return (*(_BYTE *)&self->mFlags >> 2) & 1;
}

- (BOOL)verticalFlip
{
  return (*(_BYTE *)&self->mFlags >> 3) & 1;
}

- (CGRect)boundsBeforeRotation
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[TSDInfoGeometry position](self, "position");
  v4 = v3;
  v6 = v5;
  v7 = -[TSDInfoGeometry size](self, "size");
  v10 = TSDRectWithOriginAndSize(v7, v4, v6, v8, v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGPoint)center
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  CGPoint result;

  -[TSDInfoGeometry boundsBeforeRotation](self, "boundsBeforeRotation");
  v6 = TSDCenterOfRect(v2, v3, v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)-[TSDInfoGeometry boundsBeforeRotation](self, "boundsBeforeRotation");
  if (self)
    return -[TSDInfoGeometry transformBasedOnRect:](self, "transformBasedOnRect:");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGAffineTransform)transformBasedOnRect:(SEL)a3
{
  double y;
  double x;
  CGAffineTransform *v6;
  double v7;
  double v8;

  if (self)
  {
    y = a4.origin.y;
    x = a4.origin.x;
    v6 = self;
    v7 = TSDCenterOfRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    return (CGAffineTransform *)-[CGAffineTransform transformBasedOnPoint:centeredAtPoint:](v6, "transformBasedOnPoint:centeredAtPoint:", x, y, v7, v8);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return self;
}

- (CGAffineTransform)transformBasedOnPoint:(SEL)a3 centeredAtPoint:(CGPoint)a4
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform transformBasedOnPoint:centeredAtPoint:withFlips:](self, "transformBasedOnPoint:centeredAtPoint:withFlips:", 1, a4.x, a4.y, a5.x, a5.y);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGAffineTransform)transformBasedOnPoint:(SEL)a3 centeredAtPoint:(CGPoint)a4 withFlips:(CGPoint)a5
{
  _BOOL4 v6;
  double y;
  double x;
  double v9;
  CGAffineTransform *result;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4.x;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, a4.x, a4.y);
  result = (CGAffineTransform *)-[TSDInfoGeometry angle](self, "angle");
  v14 = v13;
  if (v13 != 0.0
    || v6
    && (-[TSDInfoGeometry horizontalFlip](self, "horizontalFlip")
     || (result = (CGAffineTransform *)-[TSDInfoGeometry verticalFlip](self, "verticalFlip"), (_DWORD)result)))
  {
    v15 = TSDSubtractPoints(x, y, v9);
    v17 = v16;
    v18 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v28.c = v18;
    *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v29, &v28, v15, v17);
    v19 = *(_OWORD *)&v29.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
    *(_OWORD *)&retstr->c = v19;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v29.tx;
    if (v14 != 0.0)
    {
      v20 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v28.c = v20;
      *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformRotate(&v29, &v28, (v14 * -3.14159265 + v14 * -3.14159265) / 360.0);
      v21 = *(_OWORD *)&v29.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
      *(_OWORD *)&retstr->c = v21;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v29.tx;
    }
    if (v6)
    {
      if (-[TSDInfoGeometry horizontalFlip](self, "horizontalFlip"))
      {
        v22 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&v28.c = v22;
        *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
        CGAffineTransformScale(&v29, &v28, -1.0, 1.0);
        v23 = *(_OWORD *)&v29.c;
        *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
        *(_OWORD *)&retstr->c = v23;
        *(_OWORD *)&retstr->tx = *(_OWORD *)&v29.tx;
      }
      if (-[TSDInfoGeometry verticalFlip](self, "verticalFlip"))
      {
        v24 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&v28.c = v24;
        *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
        CGAffineTransformScale(&v29, &v28, 1.0, -1.0);
        v25 = *(_OWORD *)&v29.c;
        *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
        *(_OWORD *)&retstr->c = v25;
        *(_OWORD *)&retstr->tx = *(_OWORD *)&v29.tx;
      }
    }
    v26 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v28.c = v26;
    *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v29, &v28, -v15, -v17);
    v27 = *(_OWORD *)&v29.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v29.tx;
  }
  return result;
}

- (CGAffineTransform)transformWithoutFlips
{
  CGAffineTransform *result;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;

  result = (CGAffineTransform *)-[TSDInfoGeometry boundsBeforeRotation](self, "boundsBeforeRotation");
  if (self)
  {
    v10 = v6;
    v11 = v7;
    v12 = TSDCenterOfRect(v6, v7, v8, v9);
    return -[TSDInfoGeometry transformBasedOnPoint:centeredAtPoint:withFlips:](self, "transformBasedOnPoint:centeredAtPoint:withFlips:", 0, v10, v11, v12, v13);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (CGRect)transformedBounds
{
  CGAffineTransform v2;
  CGRect v3;

  -[TSDInfoGeometry transform](self, "transform");
  v3.origin.x = TSDRectWithSize();
  return CGRectApplyAffineTransform(v3, &v2);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;

  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  v5 = TSDNearlyEqualPoints(self->mPosition.x, self->mPosition.y, *((double *)a3 + 1), *((double *)a3 + 2));
  if (v5)
  {
    v5 = TSDNearlyEqualSizes(self->mSize.width, self->mSize.height, *((double *)a3 + 3), *((double *)a3 + 4));
    if (v5)
    {
      if (((*((_BYTE *)a3 + 40) ^ *(_BYTE *)&self->mFlags) & 0xF) == 0)
      {
        LOBYTE(v5) = vabdd_f64(self->mAngle, *((double *)a3 + 6)) < 0.00999999978;
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  CGFloat v2;
  CGFloat v3;
  double v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = self->mPosition.y
     + (double)(41 * (unint64_t)(self->mPosition.x + 41.0 + 1.0))
     + (double)(unint64_t)(self->mPosition.x + 41.0 + 1.0);
  v3 = self->mSize.width + (double)(41 * (unint64_t)v2) + (double)(unint64_t)v2;
  v4 = self->mSize.height + (double)(41 * (unint64_t)v3) + (double)(unint64_t)v3;
  v5 = 131;
  if ((*(_BYTE *)&self->mFlags & 1) == 0)
    v5 = 137;
  v6 = v5 + (unint64_t)v4 + 41 * (unint64_t)v4;
  v7 = 139;
  if ((*(_BYTE *)&self->mFlags & 2) == 0)
    v7 = 149;
  v8 = v6 + v7 + 41 * v6;
  v9 = 151;
  if ((*(_BYTE *)&self->mFlags & 4) == 0)
    v9 = 157;
  v10 = v8 + v9 + 41 * v8;
  v11 = 163;
  if ((*(_BYTE *)&self->mFlags & 8) == 0)
    v11 = 167;
  return (unint64_t)(self->mAngle
                          + (double)(unint64_t)(41 * (v10 + v11 + 41 * v10))
                          + (double)(unint64_t)(v10 + v11 + 41 * v10));
}

- (BOOL)isEqualExceptForPosition:(id)a3
{
  BOOL v5;
  BOOL result;

  if (!a3)
    return 0;
  if (a3 == self)
    return 1;
  objc_opt_class();
  result = (objc_opt_isKindOfClass() & 1) != 0
        && (self->mSize.width == *((double *)a3 + 3) ? (v5 = self->mSize.height == *((double *)a3 + 4)) : (v5 = 0),
            v5 && ((*((_BYTE *)a3 + 40) ^ *(_BYTE *)&self->mFlags) & 0xF) == 0)
        && self->mAngle == *((double *)a3 + 6);
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__TSDInfoGeometry_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __40__TSDInfoGeometry_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  int v6;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInfoGeometry mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInfoGeometry.m"), 345, CFSTR("nil object after cast"));
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "horizontalFlip");
  if (v5 != objc_msgSend(v2, "horizontalFlip"))
    return 2;
  v6 = objc_msgSend(*(id *)(a1 + 40), "verticalFlip");
  if (v6 != objc_msgSend(v2, "verticalFlip"))
    return 2;
  if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", v2))
    return 5;
  return 4;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__TSDInfoGeometry_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDInfoGeometry *__52__TSDInfoGeometry_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  TSDInfoGeometry *v3;
  double v4;
  double v5;
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
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  long double v27;
  long double v28;
  double v29;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = [TSDInfoGeometry alloc];
  objc_msgSend(*(id *)(a1 + 40), "position");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v2, "position");
  v10 = TSDMixPoints(v5, v7, v8, v9, *(double *)(a1 + 48));
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 40), "size");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v2, "size");
  v19 = TSDMixSizes(v14, v16, v17, v18, *(double *)(a1 + 48));
  v21 = v20;
  v22 = objc_msgSend(*(id *)(a1 + 40), "widthValid");
  v23 = objc_msgSend(*(id *)(a1 + 40), "heightValid");
  v24 = objc_msgSend(*(id *)(a1 + 40), "horizontalFlip");
  v25 = objc_msgSend(*(id *)(a1 + 40), "verticalFlip");
  objc_msgSend(*(id *)(a1 + 40), "angle");
  v27 = v26;
  objc_msgSend(v2, "angle");
  TSDMixAnglesInDegrees(v27, v28, *(double *)(a1 + 48));
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v3, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", v22, v23, v24, v25, v10, v12, v19, v21, v29);
}

- (CGAffineTransform)fullTransform
{
  double height;
  double width;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  __int128 v11;
  CGAffineTransform *result;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  height = 0.0;
  width = 0.0;
  if ((*(_BYTE *)&self->mFlags & 1) != 0)
    width = self->mSize.width;
  if ((*(_BYTE *)&self->mFlags & 2) != 0)
    height = self->mSize.height;
  -[TSDInfoGeometry transformBasedOnRect:](self, "transformBasedOnRect:", TSDRectWithOriginAndSize(self, self->mPosition.x, self->mPosition.y, width, height));
  v7 = 1.0;
  v8 = 1.0;
  if (-[TSDInfoGeometry widthValid](self, "widthValid"))
  {
    -[TSDInfoGeometry size](self, "size");
    v8 = v9;
  }
  if (-[TSDInfoGeometry heightValid](self, "heightValid"))
  {
    -[TSDInfoGeometry size](self, "size");
    v7 = v10;
  }
  v11 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v14.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v14.c = v11;
  *(_OWORD *)&v14.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v15, &v14, v8, v7);
  v13 = *(_OWORD *)&v15.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v15.tx;
  return result;
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  TSDInfoGeometry *v8;
  __int128 v9;
  _OWORD v11[3];

  v5 = a5;
  v6 = a4;
  v8 = [TSDInfoGeometry alloc];
  v9 = *(_OWORD *)&a3->c;
  v11[0] = *(_OWORD *)&a3->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a3->tx;
  return -[TSDInfoGeometry initWithFullTransform:widthValid:heightValid:](v8, "initWithFullTransform:widthValid:heightValid:", v11, v6, v5);
}

- (TSDInfoGeometry)initWithFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5
{
  unsigned int v5;
  _BOOL4 v6;
  TSDInfoGeometry *v8;
  double v9;
  double v10;
  __int128 v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double *v18;
  CGFloat v19;
  double v20;
  long double v21;
  double v22;
  char v23;
  char v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  CGAffineTransform v30;
  objc_super v31;
  CGRect v32;

  v5 = a5;
  v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TSDInfoGeometry;
  v8 = -[TSDInfoGeometry init](&v31, sel_init);
  if (v8)
  {
    v9 = (double)v6;
    v10 = (double)v5;
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v30.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v30.c = v11;
    *(_OWORD *)&v30.tx = *(_OWORD *)&a3->tx;
    v12 = 0.0;
    v13 = 0;
    *(_QWORD *)&v11 = 0;
    v32 = CGRectApplyAffineTransform(*(CGRect *)(&v9 - 2), &v30);
    v14 = 0.0;
    if (v6)
      v14 = sqrt(a3->b * a3->b + a3->a * a3->a);
    if (v5)
    {
      v12 = sqrt(a3->d * a3->d + a3->c * a3->c);
      LOBYTE(v5) = 2;
    }
    v8->mSize.width = v14;
    v8->mSize.height = v12;
    v15 = TSDCenterOfRect(v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    v17 = TSDAddPoints(v15, v16, v14 * -0.5);
    v18 = (double *)MEMORY[0x24BDBEFB0];
    v8->mPosition.x = v17;
    v8->mPosition.y = v19;
    v20 = TSDSubtractPoints(a3->tx + v18[1] * a3->c + a3->a * *v18, a3->ty + v18[1] * a3->d + a3->b * *v18, a3->tx + a3->c * 0.0 + a3->a * -1000.0);
    v22 = TSDAngleFromDelta(v20, v21) * -57.2957795;
    v8->mAngle = v22;
    v23 = v5 | v6;
    v24 = v5 | v6 | *(_BYTE *)&v8->mFlags & 0xFC;
    *(_BYTE *)&v8->mFlags = v23 | *(_BYTE *)&v8->mFlags & 0xFC;
    v25 = TSDCrossPoints(a3->a, a3->c, a3->b, a3->d);
    v26 = v25 <= 0.0;
    *(_BYTE *)&v8->mFlags = v24 & 0xF3 | (4 * (v25 > 0.0));
    v27 = v22 + -180.0;
    if (v26)
      v27 = v22;
    TSDNormalizeAngleInDegrees(v27);
    v8->mAngle = v28;
  }
  return v8;
}

- (TSDInfoGeometry)initWithTransform:(CGAffineTransform *)a3 size:(CGSize)a4
{
  _BOOL8 v6;
  _BOOL8 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v6 = a4.width > 0.001;
  if (a4.width <= 0.001)
    a4.width = 1.0;
  v7 = a4.height > 0.001;
  if (a4.height <= 0.001)
    a4.height = 1.0;
  v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v12.c = v8;
  *(_OWORD *)&v12.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformScale(&v13, &v12, a4.width, a4.height);
  v9 = *(_OWORD *)&v13.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v13.a;
  *(_OWORD *)&a3->c = v9;
  *(_OWORD *)&a3->tx = *(_OWORD *)&v13.tx;
  v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tx = *(_OWORD *)&a3->tx;
  return -[TSDInfoGeometry initWithFullTransform:widthValid:heightValid:](self, "initWithFullTransform:widthValid:heightValid:", &v13, v6, v7);
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  return +[TSDInfoGeometry geometryFromFullTransform:widthValid:heightValid:](TSDInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", v5, 1, 1);
}

+ (id)geometryFromTransform:(CGAffineTransform *)a3 withSize:(CGSize)a4
{
  __int128 v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformScale(&v7, &v6, a4.width, a4.height);
  return +[TSDInfoGeometry geometryFromFullTransform:](TSDInfoGeometry, "geometryFromFullTransform:", &v7);
}

- (id)geometryByAppendingTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  CGAffineTransform v7;
  CGAffineTransform t1;
  CGAffineTransform v9;

  if (self)
    -[TSDInfoGeometry fullTransform](self, "fullTransform");
  else
    memset(&t1, 0, sizeof(t1));
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v9, &t1, &v7);
  return +[TSDInfoGeometry geometryFromFullTransform:widthValid:heightValid:](TSDInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v9, -[TSDInfoGeometry widthValid](self, "widthValid"), -[TSDInfoGeometry heightValid](self, "heightValid"));
}

- (TSDInfoGeometry)geometryWithParentGeometry:(id)a3
{
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform v8;

  if (!self)
  {
    memset(&t1, 0, sizeof(t1));
    if (a3)
      goto LABEL_3;
LABEL_5:
    memset(&v6, 0, sizeof(v6));
    goto LABEL_6;
  }
  -[TSDInfoGeometry fullTransform](self, "fullTransform");
  if (!a3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a3, "transform");
LABEL_6:
  CGAffineTransformConcat(&v8, &t1, &v6);
  return (TSDInfoGeometry *)+[TSDInfoGeometry geometryFromFullTransform:widthValid:heightValid:](TSDInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v8, -[TSDInfoGeometry widthValid](self, "widthValid"), -[TSDInfoGeometry heightValid](self, "heightValid"));
}

- (id)geometryByAppendingGeometry:(id)a3
{
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform v8;

  if (!a3)
  {
    memset(&t1, 0, sizeof(t1));
    if (self)
      goto LABEL_3;
LABEL_5:
    memset(&v6, 0, sizeof(v6));
    goto LABEL_6;
  }
  objc_msgSend(a3, "fullTransform");
  if (!self)
    goto LABEL_5;
LABEL_3:
  -[TSDInfoGeometry transform](self, "transform");
LABEL_6:
  CGAffineTransformConcat(&v8, &t1, &v6);
  return +[TSDInfoGeometry geometryFromFullTransform:widthValid:heightValid:](TSDInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v8, objc_msgSend(a3, "widthValid"), objc_msgSend(a3, "heightValid"));
}

- (id)geometryRelativeToGeometry:(id)a3
{
  CGAffineTransform v6;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v9;

  if (!self)
  {
    memset(&t1, 0, sizeof(t1));
    if (a3)
      goto LABEL_3;
LABEL_5:
    memset(&v6, 0, sizeof(v6));
    goto LABEL_6;
  }
  -[TSDInfoGeometry fullTransform](self, "fullTransform");
  if (!a3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a3, "transform");
LABEL_6:
  CGAffineTransformInvert(&t2, &v6);
  CGAffineTransformConcat(&v9, &t1, &t2);
  return +[TSDInfoGeometry geometryFromFullTransform:widthValid:heightValid:](TSDInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v9, -[TSDInfoGeometry widthValid](self, "widthValid"), -[TSDInfoGeometry heightValid](self, "heightValid"));
}

- (TSDInfoGeometry)geometryWithNewBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
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
  float64x2_t v20[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)-[TSDInfoGeometry mutableCopy](self, "mutableCopy");
  objc_msgSend(v8, "setSize:", width, height);
  -[TSDInfoGeometry size](self, "size");
  v10 = v9;
  -[TSDInfoGeometry size](self, "size");
  if (self)
    -[TSDInfoGeometry transform](self, "transform");
  else
    memset(v20, 0, sizeof(v20));
  v11 = TSDCenterOfRect(x, y, width, height);
  v13 = TSDSubtractPoints(v11, v12, v10 * 0.5);
  v15 = TSDDeltaApplyAffineTransform(v20, v13, v14);
  v17 = v16;
  -[TSDInfoGeometry center](self, "center");
  objc_msgSend(v8, "setCenter:", TSDAddPoints(v15, v17, v18));
  return (TSDInfoGeometry *)v8;
}

- (id)normalizedGeometry
{
  double mAngle;
  $CB6DE01367A4C750E2FF2F6D92039807 mFlags;
  unsigned int v5;
  double v6;
  double v7;

  mAngle = self->mAngle;
  mFlags = self->mFlags;
  v5 = (*(unsigned int *)&mFlags >> 2) & 1;
  if ((*(_BYTE *)&mFlags & 8) != 0)
  {
    if (v5)
      v6 = 0.0;
    else
      v6 = 1.0;
    TSDNormalizeAngleInDegrees(mAngle + 180.0);
    mAngle = v7;
  }
  else
  {
    v6 = (double)v5;
  }
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:]([TSDInfoGeometry alloc], "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(_BYTE *)&self->mFlags & 1, (*(_BYTE *)&self->mFlags >> 1) & 1, v6 != 0.0, 0, self->mPosition.x, self->mPosition.y, self->mSize.width, self->mSize.height, mAngle);
}

- (id)description
{
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;

  if ((*(_BYTE *)&self->mFlags & 1) != 0)
    v3 = CFSTR("%g");
  else
    v3 = CFSTR("auto(%g)");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v3, *(_QWORD *)&self->mSize.width);
  if ((*(_BYTE *)&self->mFlags & 2) != 0)
    v5 = CFSTR("%g");
  else
    v5 = CFSTR("auto(%g)");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v5, *(_QWORD *)&self->mSize.height);
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%@, %@}"), v4, v6);
  if (self->mAngle == 0.0)
    v8 = &stru_24D82FEB0;
  else
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" angle=%g"), *(_QWORD *)&self->mAngle);
  v9 = CFSTR(" flip=h+v");
  if ((*(_BYTE *)&self->mFlags & 8) == 0)
    v9 = CFSTR(" flip=h");
  v10 = CFSTR(" flip=v");
  if ((*(_BYTE *)&self->mFlags & 8) == 0)
    v10 = &stru_24D82FEB0;
  if ((*(_BYTE *)&self->mFlags & 4) != 0)
    v11 = v9;
  else
    v11 = v10;
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  return (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@ %p pos=%@ size=%@%@%@>"), v14, self, NSStringFromCGPoint(self->mPosition), v7, v8, v11);
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->mPosition.x;
  y = self->mPosition.y;
  result.y = y;
  result.x = x;
  return result;
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

- (double)angle
{
  return self->mAngle;
}

@end
