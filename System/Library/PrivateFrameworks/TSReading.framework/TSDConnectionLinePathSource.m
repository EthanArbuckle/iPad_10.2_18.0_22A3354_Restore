@implementation TSDConnectionLinePathSource

- (TSDConnectionLinePathSource)initWithBezierPath:(id)a3
{
  id v3;
  double v5;
  double v6;
  BOOL v7;
  objc_super v9;

  v3 = a3;
  if (objc_msgSend(a3, "elementCount") < 1)
  {
    v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  else
  {
    objc_msgSend(v3, "controlPointBounds");
  }
  v7 = v5 == *MEMORY[0x24BDBF148] && v6 == *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v7 || (TSDRectHasNaNComponents() & 1) != 0 || objc_msgSend(v3, "elementCount") != 3)
  {
    v3 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    objc_msgSend(v3, "moveToPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend(v3, "lineToPoint:", 50.0, 50.0);
    objc_msgSend(v3, "lineToPoint:", 100.0, 100.0);
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDConnectionLinePathSource;
  return -[TSDBezierPathSource initWithBezierPath:](&v9, sel_initWithBezierPath_, v3);
}

+ (id)pathSourceOfLength:(double)a3
{
  id v4;

  v4 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  objc_msgSend(v4, "moveToPoint:", 0.0, 0.0);
  objc_msgSend(v4, "lineToPoint:", a3 * 0.5, 0.0);
  objc_msgSend(v4, "lineToPoint:", a3, 0.0);
  return -[TSDConnectionLinePathSource initWithBezierPath:]([TSDConnectionLinePathSource alloc], "initWithBezierPath:", v4);
}

+ (id)pathSourceAtAngleOfSize:(CGSize)a3 forType:(int)a4
{
  uint64_t v4;
  double height;
  double width;
  id v7;
  void *v8;
  TSDConnectionLinePathSource *v9;

  v4 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  v7 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v8 = v7;
  if (!(_DWORD)v4)
  {
    objc_msgSend(v7, "moveToPoint:", 0.0, height);
    objc_msgSend(v8, "lineToPoint:", width * 0.5, height * 0.5);
    height = 0.0;
    goto LABEL_5;
  }
  if ((_DWORD)v4 == 1)
  {
    objc_msgSend(v7, "moveToPoint:", 0.0, 0.0);
    objc_msgSend(v8, "lineToPoint:", 0.0, height);
LABEL_5:
    objc_msgSend(v8, "lineToPoint:", width, height);
  }
  v9 = -[TSDConnectionLinePathSource initWithBezierPath:]([TSDConnectionLinePathSource alloc], "initWithBezierPath:", v8);
  -[TSDConnectionLinePathSource setType:](v9, "setType:", v4);
  return v9;
}

- (void)bend
{
  double v3;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  -[TSDConnectionLinePathSource getControlKnobPosition:](self, "getControlKnobPosition:", 12);
  v4 = v3;
  v6 = v5;
  -[TSDConnectionLinePathSource getControlKnobPosition:](self, "getControlKnobPosition:", 10);
  v8 = v7;
  -[TSDConnectionLinePathSource getControlKnobPosition:](self, "getControlKnobPosition:", 11);
  v11 = TSDSubtractPoints(v9, v10, v8);
  v13 = TSDNormalizePoint(v11, v12);
  v15 = TSDRotatePoint90Degrees(1, v13, v14);
  v17 = v15;
  v18 = v16;
  if (v16 > 0.0)
  {
    v17 = TSDMultiplyPointScalar(v15, v16, -1.0);
    v18 = v19;
  }
  -[TSDBezierPathSource naturalSize](self, "naturalSize");
  v21 = v20;
  -[TSDBezierPathSource naturalSize](self, "naturalSize");
  v23 = v22;
  -[TSDBezierPathSource naturalSize](self, "naturalSize");
  v25 = v24;
  -[TSDBezierPathSource naturalSize](self, "naturalSize");
  v27 = TSDMultiplyPointScalar(v17, v18, sqrt(v25 * v26 + v21 * v23) * 0.3);
  -[TSDConnectionLinePathSource setControlKnobPosition:toPoint:](self, "setControlKnobPosition:toPoint:", 12, TSDAddPoints(v4, v6, v27));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLinePathSource;
  v4 = -[TSDBezierPathSource copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", self->mType);
  -[TSDConnectionLinePathSource outsetFrom](self, "outsetFrom");
  objc_msgSend(v4, "setOutsetFrom:");
  -[TSDConnectionLinePathSource outsetTo](self, "outsetTo");
  objc_msgSend(v4, "setOutsetTo:");
  return v4;
}

- (unint64_t)numberOfControlKnobs
{
  return 1;
}

- (int64_t)pathElementIndexForKnobTag:(unint64_t)a3
{
  if (a3 - 10 > 2)
    return -1;
  else
    return qword_217C2A4E0[a3 - 10];
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  int64_t v4;
  double v5;
  double v6;
  __int128 v7;
  CGPoint result;

  v7 = *MEMORY[0x24BDBEFB0];
  v4 = -[TSDConnectionLinePathSource pathElementIndexForKnobTag:](self, "pathElementIndexForKnobTag:", a3);
  if ((v4 & 0x8000000000000000) == 0)
    -[TSDBezierPath elementAtIndex:associatedPoints:](self->super.mPath, "elementAtIndex:associatedPoints:", v4, &v7);
  v6 = *((double *)&v7 + 1);
  v5 = *(double *)&v7;
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  int64_t v5;
  uint64_t v6;

  v5 = -[TSDConnectionLinePathSource pathElementIndexForKnobTag:](self, "pathElementIndexForKnobTag:", a3, *(_QWORD *)&a4.x, *(_QWORD *)&a4.y);
  if ((v5 & 0x8000000000000000) == 0)
    -[TSDBezierPath setAssociatedPoints:atIndex:](self->super.mPath, "setAssociatedPoints:atIndex:", &v6, v5);
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  TSDBezierPath *mPath;
  CGAffineTransform v9;
  CGAffineTransform v10;

  height = a3.height;
  width = a3.width;
  -[TSDBezierPath bounds](self->super.mPath, "bounds");
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, width / v6, height / v7);
  mPath = self->super.mPath;
  v9 = v10;
  -[TSDBezierPath transformUsingAffineTransform:](mPath, "transformUsingAffineTransform:", &v9);
  -[TSDBezierPathSource setNaturalSize:](self, "setNaturalSize:", width, height);
}

- (id)bezierPath
{
  return self->super.mPath;
}

- (CGPoint)fixedPointForControlKnobChange
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGPoint result;

  v4 = 0.0;
  v5 = 0.0;
  -[TSDBezierPath elementAtIndex:associatedPoints:](self->super.mPath, "elementAtIndex:associatedPoints:", 0, &v4);
  v2 = v4;
  v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  return &stru_24D82FEB0;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  return 0;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (BOOL)isLineSegment
{
  return 0;
}

- (void)p_setBezierPath:(id)a3
{
  TSDBezierPath *v3;
  void *v5;
  uint64_t v6;
  TSDBezierPath *v7;
  CGSize *p_mNaturalSize;
  CGFloat v9;
  CGFloat v10;
  float64x2_t v11[3];
  double v12;
  double v13;
  uint64_t v14;

  v3 = (TSDBezierPath *)a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLinePathSource p_setBezierPath:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLinePathSource.m"), 199, CFSTR("invalid nil value for '%s'"), "path");
  }
  if (-[TSDBezierPath elementCount](v3, "elementCount") == 2
    && -[TSDBezierPath elementAtIndex:](v3, "elementAtIndex:", 1) == 2)
  {
    -[TSDBezierPath elementAtIndex:allPoints:](v3, "elementAtIndex:allPoints:", 1, v11);
    v3 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    -[TSDBezierPath moveToPoint:](v3, "moveToPoint:", *(_OWORD *)v11);
    -[TSDBezierPath lineToPoint:](v3, "lineToPoint:", TSDPointOnCurve(v11, 0.5));
    -[TSDBezierPath lineToPoint:](v3, "lineToPoint:", v12, v13);
  }
  v7 = v3;

  self->super.mPath = v3;
  p_mNaturalSize = &self->super.mNaturalSize;
  -[TSDBezierPath bounds](v3, "bounds");
  p_mNaturalSize->width = v9;
  p_mNaturalSize->height = v10;
}

- (id)description
{
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDConnectionLinePathSource;
  v3 = (void *)objc_msgSend(-[TSDBezierPathSource description](&v8, sel_description), "mutableCopy");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = -[TSDConnectionLinePathSource type](self, "type");
  v6 = CFSTR("curved");
  if (v5 == 1)
    v6 = CFSTR("orthogonal");
  objc_msgSend(v3, "appendString:", objc_msgSend(v4, "stringWithFormat:", CFSTR("; connection type: %@"), v6));
  return v3;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (double)outsetFrom
{
  return self->mOutsetFrom;
}

- (void)setOutsetFrom:(double)a3
{
  self->mOutsetFrom = a3;
}

- (double)outsetTo
{
  return self->mOutsetTo;
}

- (void)setOutsetTo:(double)a3
{
  self->mOutsetTo = a3;
}

@end
