@implementation TSDPathSource

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setHasHorizontalFlip:", -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
    objc_msgSend(v4, "setHasVerticalFlip:", -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int v6;
  BOOL v8;

  if (a3 == self)
    return 1;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  v6 = -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
  if (v6 != objc_msgSend(a3, "hasHorizontalFlip"))
    return 0;
  v8 = -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip");
  return v8 ^ objc_msgSend(a3, "hasVerticalFlip") ^ 1;
}

- (BOOL)isRectangular
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Concrete subclass %@ must implement -isRectangular."), objc_opt_class()), 0), "raise");
  return 0;
}

- (BOOL)isRectangularForever
{
  return 0;
}

- (BOOL)isCircular
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Concrete subclass %@ must implement -isCircular."), objc_opt_class()), 0), "raise");
  return 0;
}

- (id)bezierPath
{
  id v3;
  _OWORD v5[3];

  v3 = -[TSDPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips");
  if (self)
    -[TSDPathSource pathFlipTransform](self, "pathFlipTransform");
  else
    memset(v5, 0, sizeof(v5));
  objc_msgSend(v3, "transformUsingAffineTransform:", v5);
  return v3;
}

- (id)bezierPathWithoutFlips
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Concrete subclass %@ must implement -bezierPathWithoutFlips."), objc_opt_class()), 0), "raise");
  return 0;
}

- (Class)preferredControllerClass
{
  return 0;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Concrete subclass %@ must implement -naturalSize."), objc_opt_class()), 0), "raise");
  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Concrete subclass %@ must implement -setNaturalSize:."), objc_opt_class()), 0), "raise");
}

- (double)uniformScaleForScalingToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  BOOL v12;
  double v13;

  height = a3.height;
  width = a3.width;
  -[TSDPathSource naturalSize](self, "naturalSize");
  v7 = 1.0;
  if (v5 <= 1.0 || v6 <= 1.0)
    return v7;
  v9 = width / v5;
  v10 = height / v6;
  if (v9 >= 1.0 || v10 >= 1.0)
  {
    v12 = v10 <= 1.0 || v9 <= 1.0;
    v13 = fmin(v9, v10);
    if (!v12)
      return v13;
    return v7;
  }
  return fmax(v9, v10);
}

- (CGAffineTransform)pathFlipTransform
{
  uint64_t v5;
  _BOOL4 v6;
  CGAffineTransform *result;
  int v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MidX;
  double MidY;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;

  v5 = MEMORY[0x24BDBD8B8];
  v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v25 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v24;
  v23 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tx = v23;
  v6 = -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
  result = (CGAffineTransform *)-[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v8 = (int)result;
  if (v6 || (_DWORD)result)
  {
    if (v6)
      v9 = -1.0;
    else
      v9 = 1.0;
    v10 = *MEMORY[0x24BDBEFB0];
    v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[TSDPathSource naturalSize](self, "naturalSize");
    v13 = v12;
    v15 = v14;
    v28.origin.x = v10;
    v28.origin.y = v11;
    v28.size.width = v13;
    v28.size.height = v15;
    MidX = CGRectGetMidX(v28);
    v29.origin.x = v10;
    v29.origin.y = v11;
    v29.size.width = v13;
    v29.size.height = v15;
    MidY = CGRectGetMidY(v29);
    *(_OWORD *)&v27.a = v25;
    *(_OWORD *)&v27.c = v24;
    *(_OWORD *)&v27.tx = v23;
    CGAffineTransformTranslate(retstr, &v27, MidX, MidY);
    if (v8)
      v18 = -1.0;
    else
      v18 = 1.0;
    v19 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v26.c = v19;
    *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v27, &v26, v9, v18);
    v20 = *(_OWORD *)&v27.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v27.a;
    *(_OWORD *)&retstr->c = v20;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v27.tx;
    v21 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v26.c = v21;
    *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v27, &v26, -MidX, -MidY);
    v22 = *(_OWORD *)&v27.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v27.a;
    *(_OWORD *)&retstr->c = v22;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v27.tx;
  }
  return result;
}

- (id)valueForSetSelector:(SEL)a3
{
  return 0;
}

+ (id)pathSourceForShapeType:(int)a3 naturalSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  TSDBezierPath *v8;
  TSDBezierPathSource *v9;
  TSDBezierPathSource *v10;
  id result;
  TSDBezierPath *v12;
  TSDBezierPath *v13;
  double v14;
  TSDBezierPath *v15;
  double v16;
  TSDEditableBezierPathSource *v17;

  height = a4.height;
  width = a4.width;
  v7 = a4.height / 100.0;
  switch(a3)
  {
    case 0:
    case 3:
      v10 = +[TSDBezierPathSource pathSourceWithBezierPath:](TSDBezierPathSource, "pathSourceWithBezierPath:", +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", 0.0, 0.0, 100.0, 100.0));
      -[TSDBezierPathSource setNaturalSize:](v10, "setNaturalSize:", width, height);
      goto LABEL_7;
    case 1:
    case 15:
    case 16:
      v8 = +[TSDBezierPath bezierPathWithStart:end:](TSDBezierPath, "bezierPathWithStart:end:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), sqrt(width * width + a4.height * a4.height), 0.0);
      goto LABEL_18;
    case 2:
    case 18:
    case 19:
      v9 = +[TSDConnectionLinePathSource pathSourceAtAngleOfSize:forType:](TSDConnectionLinePathSource, "pathSourceAtAngleOfSize:forType:", a3 == 18, width, a4.height);
      v10 = v9;
      if (a3 == 2)
        -[TSDBezierPathSource bend](v9, "bend");
      goto LABEL_7;
    case 4:
      return +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", 15.0, width, a4.height);
    case 5:
      v12 = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, width, a4.height);
      v13 = v12;
      goto LABEL_17;
    case 6:
      v13 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath", v7);
      -[TSDBezierPath moveToPoint:](v13, "moveToPoint:", width * 0.5, 0.0);
      -[TSDBezierPath lineToPoint:](v13, "lineToPoint:", width, height);
      v14 = 0.0;
      v15 = v13;
      goto LABEL_12;
    case 7:
      v13 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath", v7);
      -[TSDBezierPath moveToPoint:](v13, "moveToPoint:", 0.0, 0.0);
      -[TSDBezierPath lineToPoint:](v13, "lineToPoint:", 0.0, width);
      v15 = v13;
      v14 = width;
LABEL_12:
      v16 = height;
      goto LABEL_16;
    case 8:
      return +[TSDPointPathSource rightSingleArrowWithPoint:naturalSize:](TSDPointPathSource, "rightSingleArrowWithPoint:naturalSize:", v7 * 64.0, 0.34, width, a4.height);
    case 9:
      return +[TSDPointPathSource doubleArrowWithPoint:naturalSize:](TSDPointPathSource, "doubleArrowWithPoint:naturalSize:", v7 * 44.0, 0.34, width, a4.height);
    case 10:
      v13 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath", v7);
      -[TSDBezierPath moveToPoint:](v13, "moveToPoint:", 0.0, height * 0.5);
      -[TSDBezierPath lineToPoint:](v13, "lineToPoint:", width * 0.5, height);
      -[TSDBezierPath lineToPoint:](v13, "lineToPoint:", width, height * 0.5);
      v16 = 0.0;
      v15 = v13;
      v14 = width * 0.5;
LABEL_16:
      -[TSDBezierPath lineToPoint:](v15, "lineToPoint:", v14, v16);
      v12 = v13;
LABEL_17:
      -[TSDBezierPath closePath](v12, "closePath");
      v8 = v13;
LABEL_18:
      result = +[TSDBezierPathSource pathSourceWithBezierPath:](TSDBezierPathSource, "pathSourceWithBezierPath:", v8);
      break;
    case 11:
      result = +[TSDCalloutPathSource quoteBubbleWithTailPosition:tailSize:naturalSize:](TSDCalloutPathSource, "quoteBubbleWithTailPosition:tailSize:naturalSize:", v7, v7 * 96.0, v7 * 10.0, width, a4.height * 0.8);
      break;
    case 12:
      result = +[TSDCalloutPathSource calloutWithCornerRadius:tailPosition:tailSize:naturalSize:](TSDCalloutPathSource, "calloutWithCornerRadius:tailPosition:tailSize:naturalSize:", 5.0, v7 * -20.0, v7 * 50.0, v7 * 10.0, width, a4.height);
      break;
    case 13:
      result = +[TSDScalarPathSource regularPolygonWithScalar:naturalSize:](TSDScalarPathSource, "regularPolygonWithScalar:naturalSize:", 5.0, width, a4.height);
      break;
    case 14:
      result = +[TSDPointPathSource starWithPoint:naturalSize:](TSDPointPathSource, "starWithPoint:naturalSize:", 5.0, 0.382, width, a4.height);
      break;
    case 17:
      v17 = objc_alloc_init(TSDEditableBezierPathSource);
      -[TSDEditableBezierPathSource addNode:](v17, "addNode:", +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8)));
      result = v17;
      break;
    default:
      v10 = 0;
LABEL_7:
      result = v10;
      break;
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)&__block_literal_global_29);
}

uint64_t __38__TSDPathSource_mixingTypeWithObject___block_invoke()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDPathSource mixingTypeWithObject:]_block_invoke");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPathSource.m"), 271, CFSTR("Called on superclass!"));
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4, a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDPathSource mixedObjectWithFraction:ofObject:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPathSource.m"), 280, CFSTR("Called on superclass!"));
  return 0;
}

- (BOOL)hasHorizontalFlip
{
  return self->mHorizontalFlip;
}

- (void)setHasHorizontalFlip:(BOOL)a3
{
  self->mHorizontalFlip = a3;
}

- (BOOL)hasVerticalFlip
{
  return self->mVerticalFlip;
}

- (void)setHasVerticalFlip:(BOOL)a3
{
  self->mVerticalFlip = a3;
}

@end
