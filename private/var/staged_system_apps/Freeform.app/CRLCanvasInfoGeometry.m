@implementation CRLCanvasInfoGeometry

- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 widthValid:(BOOL)a5 heightValid:(BOOL)a6 horizontalFlip:(BOOL)a7 verticalFlip:(BOOL)a8 angle:(double)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLCanvasInfoGeometry *v18;
  CRLCanvasInfoGeometry *v19;
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
  v25.super_class = (Class)CRLCanvasInfoGeometry;
  v18 = -[CRLCanvasInfoGeometry init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    v18->_position.x = x;
    v18->_position.y = y;
    v18->_size.width = width;
    v18->_size.height = height;
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
    *(_BYTE *)&v18->_flags = v20 | a5 | v21 | v22 | *(_BYTE *)&v18->_flags & 0xF0;
    sub_1000618C4(a9);
    v19->_angle = v23;
  }
  return v19;
}

- (CRLCanvasInfoGeometry)initWithFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5
{
  unsigned int v5;
  _BOOL4 v6;
  CRLCanvasInfoGeometry *v8;
  double v9;
  double v10;
  __int128 v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  long double v19;
  double v20;
  char v21;
  char v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  CGAffineTransform v28;
  objc_super v29;
  CGRect v30;

  v5 = a5;
  v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CRLCanvasInfoGeometry;
  v8 = -[CRLCanvasInfoGeometry init](&v29, "init");
  if (v8)
  {
    v9 = (double)v6;
    v10 = (double)v5;
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v28.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v28.c = v11;
    *(_OWORD *)&v28.tx = *(_OWORD *)&a3->tx;
    v12 = 0.0;
    v13 = 0;
    *(_QWORD *)&v11 = 0;
    v30 = CGRectApplyAffineTransform(*(CGRect *)(&v9 - 2), &v28);
    v14 = 0.0;
    if (v6)
      v14 = sqrt(a3->b * a3->b + a3->a * a3->a);
    if (v5)
    {
      v12 = sqrt(a3->d * a3->d + a3->c * a3->c);
      LOBYTE(v5) = 2;
    }
    v8->_size.width = v14;
    v8->_size.height = v12;
    v15 = sub_100061400(v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    v8->_position.x = sub_1000603D0(v15, v16, v14 * -0.5);
    v8->_position.y = v17;
    v18 = sub_1000603B8(a3->tx + CGPointZero.y * a3->c + a3->a * CGPointZero.x, a3->ty + CGPointZero.y * a3->d + a3->b * CGPointZero.x, a3->tx + a3->c * 0.0 + a3->a * -1000.0);
    v20 = sub_1000618B4(v18, v19) * -57.2957795;
    v8->_angle = v20;
    v21 = v5 | v6;
    v22 = v5 | v6 | *(_BYTE *)&v8->_flags & 0xFC;
    *(_BYTE *)&v8->_flags = v21 | *(_BYTE *)&v8->_flags & 0xFC;
    v23 = sub_100060C0C(a3->a, a3->c, a3->b, a3->d);
    v24 = v23 <= 0.0;
    *(_BYTE *)&v8->_flags = v22 & 0xF3 | (4 * (v23 > 0.0));
    v25 = v20 + -180.0;
    if (v24)
      v25 = v20;
    sub_1000618C4(v25);
    v8->_angle = v26;
  }
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLCanvasMutableInfoGeometry *v4;
  $CB6DE01367A4C750E2FF2F6D92039807 flags;

  v4 = [CRLCanvasMutableInfoGeometry alloc];
  flags = self->_flags;
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v4, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(_BYTE *)&flags & 1, (*(unsigned int *)&flags >> 1) & 1, (*(unsigned int *)&flags >> 2) & 1, (*(unsigned int *)&flags >> 3) & 1, self->_position.x, self->_position.y, self->_size.width, self->_size.height, self->_angle);
}

- (CRLCanvasInfoGeometry)init
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, CGPointZero.x, CGPointZero.y, 100.0, 100.0, 0.0);
}

- (CRLCanvasInfoGeometry)initWithSize:(CGSize)a3
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, CGPointZero.x, CGPointZero.y, a3.width, a3.height, 0.0);
}

- (CRLCanvasInfoGeometry)initWithWidth:(double)a3
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 0, 0, 0, CGPointZero.x, CGPointZero.y, a3, 0.0, 0.0);
}

- (CRLCanvasInfoGeometry)initWithHeight:(double)a3
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 0, 1, 0, 0, CGPointZero.x, CGPointZero.y, 0.0, a3, 0.0);
}

- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, a3.x, a3.y, a4.width, a4.height, 0.0);
}

- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, a3.x, a3.y, a4.width, a4.height, a5);
}

- (CRLCanvasInfoGeometry)initWithCenter:(CGPoint)a3 size:(CGSize)a4
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:](self, "initWithPosition:size:", a3.x - a4.width * 0.5, a3.y - a4.height * 0.5);
}

- (CRLCanvasInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5
{
  return -[CRLCanvasInfoGeometry initWithTransformedBoundsOrigin:size:horizontalFlip:verticalFlip:angle:](self, "initWithTransformedBoundsOrigin:size:horizontalFlip:verticalFlip:angle:", 0, 0, a3.x, a3.y, a4.width, a4.height, a5);
}

- (CRLCanvasInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 horizontalFlip:(BOOL)a5 verticalFlip:(BOOL)a6 angle:(double)a7
{
  double y;
  double x;
  CRLCanvasInfoGeometry *v9;
  CRLCanvasInfoGeometry *v10;
  double v11;
  double v12;
  CGFloat v13;

  y = a3.y;
  x = a3.x;
  v9 = -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, a5, a6, CGPointZero.x, CGPointZero.y, a4.width, a4.height, a7);
  v10 = v9;
  if (v9)
  {
    -[CRLCanvasInfoGeometry transformedBoundsOrigin](v9, "transformedBoundsOrigin");
    v12 = sub_1000603B8(v10->_position.x, v10->_position.y, v11);
    v10->_position.x = sub_1000603D0(x, y, v12);
    v10->_position.y = v13;
  }
  return v10;
}

- (CRLCanvasInfoGeometry)initWithTransform:(CGAffineTransform *)a3 size:(CGSize)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformScale(&v11, &v10, a4.width, a4.height);
  v7 = *(_OWORD *)&v11.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&a3->c = v7;
  *(_OWORD *)&a3->tx = *(_OWORD *)&v11.tx;
  v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v11.c = v8;
  *(_OWORD *)&v11.tx = *(_OWORD *)&a3->tx;
  return -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](self, "initWithFullTransform:widthValid:heightValid:", &v11, 1, 1);
}

- (CRLCanvasInfoGeometry)initWithLayoutGeometry:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  CRLCanvasInfoGeometry *v15;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v4 = a3;
  v5 = v4;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  if (v4)
  {
    objc_msgSend(v4, "transform");
    v18 = v21;
    v19 = v22;
    v20 = v23;
    v6 = sub_100079210((double *)&v18);
    objc_msgSend(v5, "transform");
  }
  else
  {
    v19 = 0uLL;
    v20 = 0uLL;
    v18 = 0uLL;
    v6 = sub_100079210((double *)&v18);
    memset(v17, 0, sizeof(v17));
  }
  sub_1000791B0(v17);
  objc_msgSend(v5, "size");
  v8 = v7;
  objc_msgSend(v5, "frame");
  v13 = sub_100061400(v9, v10, v11, v12);
  v15 = -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, v6, 0, sub_1000603D0(v13, v14, v8 * -0.5));

  return v15;
}

- (BOOL)widthValid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)heightValid
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)horizontalFlip
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)verticalFlip
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (CGRect)boundsBeforeRotation
{
  id v3;
  Swift::String v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[CRLCanvasInfoGeometry position](self, "position");
  v3 = -[CRLCanvasInfoGeometry size](self, "size");
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v3, v4);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
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

  -[CRLCanvasInfoGeometry boundsBeforeRotation](self, "boundsBeforeRotation");
  v6 = sub_100061400(v2, v3, v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGAffineTransform)transform
{
  -[CRLCanvasInfoGeometry boundsBeforeRotation](self, "boundsBeforeRotation");
  return -[CRLCanvasInfoGeometry transformBasedOnRect:](self, "transformBasedOnRect:");
}

- (CGAffineTransform)transformBasedOnRect:(SEL)a3
{
  double y;
  double x;
  double v7;
  double v8;

  y = a4.origin.y;
  x = a4.origin.x;
  v7 = sub_100061400(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return -[CRLCanvasInfoGeometry transformBasedOnPoint:centeredAtPoint:](self, "transformBasedOnPoint:centeredAtPoint:", x, y, v7, v8);
}

- (CGAffineTransform)transformBasedOnPoint:(SEL)a3 centeredAtPoint:(CGPoint)a4
{
  return -[CRLCanvasInfoGeometry transformBasedOnPoint:centeredAtPoint:withFlips:](self, "transformBasedOnPoint:centeredAtPoint:withFlips:", 1, a4.x, a4.y, a5.x, a5.y);
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
  result = (CGAffineTransform *)-[CRLCanvasInfoGeometry angle](self, "angle");
  v14 = v13;
  if (v13 != 0.0
    || v6
    && (-[CRLCanvasInfoGeometry horizontalFlip](self, "horizontalFlip")
     || (result = (CGAffineTransform *)-[CRLCanvasInfoGeometry verticalFlip](self, "verticalFlip"), (_DWORD)result)))
  {
    v15 = sub_1000603B8(x, y, v9);
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
      if (-[CRLCanvasInfoGeometry horizontalFlip](self, "horizontalFlip"))
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
      if (-[CRLCanvasInfoGeometry verticalFlip](self, "verticalFlip"))
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
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;

  -[CRLCanvasInfoGeometry boundsBeforeRotation](self, "boundsBeforeRotation");
  v5 = v4;
  v7 = v6;
  v10 = sub_100061400(v4, v6, v8, v9);
  return -[CRLCanvasInfoGeometry transformBasedOnPoint:centeredAtPoint:withFlips:](self, "transformBasedOnPoint:centeredAtPoint:withFlips:", 0, v5, v7, v10, v11);
}

- (CGRect)transformedBounds
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGAffineTransform v10;
  CGRect v11;

  v3 = sub_10005FDDC();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[CRLCanvasInfoGeometry transform](self, "transform");
  v11.origin.x = v3;
  v11.origin.y = v5;
  v11.size.width = v7;
  v11.size.height = v9;
  return CGRectApplyAffineTransform(v11, &v10);
}

- (BOOL)allValuesValidNumbers
{
  double v3;
  double v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  -[CRLCanvasInfoGeometry size](self, "size");
  v5 = sub_100061860(v3, v4);
  -[CRLCanvasInfoGeometry position](self, "position");
  v7 = v6;
  v9 = v8;
  -[CRLCanvasInfoGeometry angle](self, "angle");
  if (!v5)
    return 0;
  v11 = fabs(v10);
  v12 = v11 > INFINITY || v11 < INFINITY;
  return sub_100061860(v7, v9) & v12;
}

- (CRLCanvasInfoGeometry)geometryWithValidNumbers
{
  CRLCanvasInfoGeometry *v2;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = self;
  if (-[CRLCanvasInfoGeometry allValuesValidNumbers](v2, "allValuesValidNumbers"))
    return v2;
  v4 = -[CRLCanvasInfoGeometry mutableCopy](v2, "mutableCopy");
  -[CRLCanvasInfoGeometry size](v2, "size");
  if ((sub_100061860(v5, v6) & 1) == 0)
  {
    objc_msgSend(v4, "setSize:", 1.0, 1.0);
    if (!-[CRLCanvasInfoGeometry widthValid](v2, "widthValid"))
    {
      objc_msgSend(v4, "size");
      objc_msgSend(v4, "setSize:", 0.0);
    }
    if (!-[CRLCanvasInfoGeometry heightValid](v2, "heightValid"))
    {
      objc_msgSend(v4, "size");
      objc_msgSend(v4, "setSize:");
    }
  }
  -[CRLCanvasInfoGeometry position](v2, "position");
  if ((sub_100061860(v7, v8) & 1) == 0)
    objc_msgSend(v4, "setPosition:", CGPointZero.x, CGPointZero.y);
  -[CRLCanvasInfoGeometry angle](v2, "angle");
  v10 = fabs(v9);
  if (v10 >= INFINITY && v10 <= INFINITY)
    objc_msgSend(v4, "setAngle:", 0.0);

  return (CRLCanvasInfoGeometry *)v4;
}

- (unint64_t)hash
{
  return sub_1000BC018((char *)&self->_flags, 4, 0xCBF29CE484222325);
}

- (BOOL)isEqual:(id)a3
{
  CRLCanvasInfoGeometry *v4;
  uint64_t v5;
  double *v6;
  uint64_t v7;
  BOOL v8;

  v4 = (CRLCanvasInfoGeometry *)a3;
  v6 = (double *)v4;
  if (!v4)
    goto LABEL_6;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_8;
  }
  objc_opt_class(CRLCanvasInfoGeometry, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && sub_10005FDF0(self->_position.x, self->_position.y, v6[1], v6[2]))
    v8 = -[CRLCanvasInfoGeometry isEqualExceptForPosition:](self, "isEqualExceptForPosition:", v6);
  else
LABEL_6:
    v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)isEqualExceptForPosition:(id)a3
{
  CRLCanvasInfoGeometry *v4;
  CRLCanvasInfoGeometry *v5;
  CRLCanvasInfoGeometry *v6;
  BOOL v7;
  double angle;
  double v9;

  v4 = (CRLCanvasInfoGeometry *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v7 = 1;
    }
    else
    {
      v6 = v4;
      if (sub_10005FDF0(self->_size.width, self->_size.height, v6->_size.width, v6->_size.height)
        && ((*(_BYTE *)&v6->_flags ^ *(_BYTE *)&self->_flags) & 0xF) == 0)
      {
        angle = self->_angle;
        v9 = v6->_angle;
        v7 = vabdd_f64(angle, v9) < 0.00999999978 || angle == v9;
      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGAffineTransform)fullTransform
{
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  __int128 v10;
  CGAffineTransform *result;
  __int128 v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v15;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v15 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)self, *(Swift::String *)&a3);
  -[CRLCanvasInfoGeometry transformBasedOnRect:](self, "transformBasedOnRect:", v15.recordType._object);
  v6 = 1.0;
  v7 = 1.0;
  if (-[CRLCanvasInfoGeometry widthValid](self, "widthValid"))
  {
    -[CRLCanvasInfoGeometry size](self, "size");
    v7 = v8;
  }
  if (-[CRLCanvasInfoGeometry heightValid](self, "heightValid"))
  {
    -[CRLCanvasInfoGeometry size](self, "size");
    v6 = v9;
  }
  v10 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v14, &v13, v7, v6);
  v12 = *(_OWORD *)&v14.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v14.a;
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v14.tx;
  return result;
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  CRLCanvasInfoGeometry *v8;
  __int128 v9;
  _OWORD v11[3];

  v5 = a5;
  v6 = a4;
  v8 = [CRLCanvasInfoGeometry alloc];
  v9 = *(_OWORD *)&a3->c;
  v11[0] = *(_OWORD *)&a3->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a3->tx;
  return -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v8, "initWithFullTransform:widthValid:heightValid:", v11, v6, v5);
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  return (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", v5, 1, 1));
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
  return (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", &v7));
}

- (id)geometryByAppendingTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  CGAffineTransform v7;
  CGAffineTransform t1;
  CGAffineTransform v9;

  -[CRLCanvasInfoGeometry fullTransform](self, "fullTransform");
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v9, &t1, &v7);
  return (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v9, -[CRLCanvasInfoGeometry widthValid](self, "widthValid"), -[CRLCanvasInfoGeometry heightValid](self, "heightValid")));
}

- (CRLCanvasInfoGeometry)geometryWithParentGeometry:(id)a3
{
  id v4;
  void *v5;
  CGAffineTransform v7;
  CGAffineTransform t1;
  CGAffineTransform v9;

  v4 = a3;
  -[CRLCanvasInfoGeometry fullTransform](self, "fullTransform");
  if (v4)
    objc_msgSend(v4, "transform");
  else
    memset(&v7, 0, sizeof(v7));
  CGAffineTransformConcat(&v9, &t1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v9, -[CRLCanvasInfoGeometry widthValid](self, "widthValid"), -[CRLCanvasInfoGeometry heightValid](self, "heightValid")));

  return (CRLCanvasInfoGeometry *)v5;
}

- (id)geometryRelativeToGeometry:(id)a3
{
  id v4;
  void *v5;
  CGAffineTransform v7;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v10;

  v4 = a3;
  -[CRLCanvasInfoGeometry fullTransform](self, "fullTransform");
  if (v4)
    objc_msgSend(v4, "transform");
  else
    memset(&v7, 0, sizeof(v7));
  CGAffineTransformInvert(&t2, &v7);
  CGAffineTransformConcat(&v10, &t1, &t2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v10, -[CRLCanvasInfoGeometry widthValid](self, "widthValid"), -[CRLCanvasInfoGeometry heightValid](self, "heightValid")));

  return v5;
}

- (CRLCanvasInfoGeometry)geometryWithNewBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v8;
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
  float64x2_t v22[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[CRLCanvasInfoGeometry mutableCopy](self, "mutableCopy");
  objc_msgSend(v8, "setSize:", width, height);
  v9 = sub_100061400(x, y, width, height);
  v11 = v10;
  -[CRLCanvasInfoGeometry size](self, "size");
  v13 = v12 * 0.5;
  -[CRLCanvasInfoGeometry size](self, "size");
  v14 = sub_1000603B8(v9, v11, v13);
  v16 = v15;
  -[CRLCanvasInfoGeometry transform](self, "transform");
  v17 = sub_10006214C(v22, v14, v16);
  v19 = v18;
  -[CRLCanvasInfoGeometry center](self, "center");
  objc_msgSend(v8, "setCenter:", sub_1000603D0(v17, v19, v20));
  return (CRLCanvasInfoGeometry *)v8;
}

- (id)normalizedGeometry
{
  double angle;
  $CB6DE01367A4C750E2FF2F6D92039807 flags;
  unsigned int v5;
  double v6;
  double v7;

  angle = self->_angle;
  flags = self->_flags;
  v5 = (*(unsigned int *)&flags >> 2) & 1;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if (v5)
      v6 = 0.0;
    else
      v6 = 1.0;
    sub_1000618C4(angle + 180.0);
    angle = v7;
  }
  else
  {
    v6 = (double)v5;
  }
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(_BYTE *)&self->_flags & 1, (*(_BYTE *)&self->_flags >> 1) & 1, v6 != 0.0, 0, self->_position.x, self->_position.y, self->_size.width, self->_size.height, angle);
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  Class v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = CFSTR("%g");
  else
    v3 = CFSTR("auto(%g)");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, *(_QWORD *)&self->_size.width));
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = CFSTR("%g");
  else
    v5 = CFSTR("auto(%g)");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, *(_QWORD *)&self->_size.height));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v4, v6));
  if (self->_angle == 0.0)
    v9 = &stru_1012A72B0;
  else
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" angle=%g"), *(_QWORD *)&self->_angle));
  v10 = CFSTR(" flip=h+v");
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    v10 = CFSTR(" flip=h");
  v11 = CFSTR(" flip=v");
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    v11 = &stru_1012A72B0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v12 = v10;
  else
    v12 = v11;
  objc_opt_class(self, v7);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = NSStringFromCGPoint(self->_position);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p pos=%@ size=%@%@%@>"), v15, self, v17, v8, v9, v12));

  return v18;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)angle
{
  return self->_angle;
}

@end
