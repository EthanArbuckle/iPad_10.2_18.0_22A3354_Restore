@implementation OITSUBezierPath

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[OITSUBezierPath setVersion:](OITSUBezierPath, "setVersion:", 524);
}

+ (id)bezierPath
{
  return objc_alloc_init((Class)a1);
}

+ (id)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = (void *)objc_msgSend(a1, "bezierPath");
  objc_msgSend(v8, "moveToPoint:", v7, v6);
  objc_msgSend(v8, "lineToPoint:", x, y);
  return v8;
}

+ (id)bezierPathWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_msgSend(a1, "bezierPath");
  objc_msgSend(v7, "appendBezierPathWithRect:", x, y, width, height);
  return v7;
}

+ (id)bezierPathWithOvalInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_msgSend(a1, "bezierPath");
  objc_msgSend(v7, "appendBezierPathWithOvalInRect:", x, y, width, height);
  return v7;
}

+ (id)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  CGPath *v4;
  OITSUBezierPath *v5;

  v4 = TSUCreateRoundRectPathForRectWithRadius(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  v5 = +[OITSUBezierPath bezierPathWithCGPath:](OITSUBezierPath, "bezierPathWithCGPath:", v4);
  CGPathRelease(v4);
  return v5;
}

+ (id)bezierPathWithCGPath:(CGPath *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "bezierPath");
  CGPathApply(a3, v4, (CGPathApplierFunction)pBuildBezierPath);
  return v4;
}

+ (void)fillRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v8;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextFillRect(CurrentContext, v8);
    }
  }
}

+ (void)strokeRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat v11;
  CGFloat v12;
  CGFloat MaxY;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextSetLineCap(CurrentContext, (CGLineCap)sfrdefaultLineCapStyle);
      CGContextSetLineJoin(CurrentContext, (CGLineJoin)sfrdefaultLineJoinStyle);
      _SFRSetLineWidth(CurrentContext, *(CGFloat *)&sfrdefaultLineWidth);
      CGContextSetMiterLimit(CurrentContext, *(CGFloat *)&sfrdefaultMiterLimit);
      CGContextBeginPath(CurrentContext);
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      MinX = CGRectGetMinX(v16);
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      MinY = CGRectGetMinY(v17);
      CGContextMoveToPoint(CurrentContext, MinX, MinY);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      MaxX = CGRectGetMaxX(v18);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v11 = CGRectGetMinY(v19);
      CGContextAddLineToPoint(CurrentContext, MaxX, v11);
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v12 = CGRectGetMaxX(v20);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      MaxY = CGRectGetMaxY(v21);
      CGContextAddLineToPoint(CurrentContext, v12, MaxY);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v14 = CGRectGetMinX(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v15 = CGRectGetMaxY(v23);
      CGContextAddLineToPoint(CurrentContext, v14, v15);
      CGContextClosePath(CurrentContext);
      CGContextStrokePath(CurrentContext);
      CGContextRestoreGState(CurrentContext);
    }
  }
}

+ (void)clipRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v8;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextClipToRect(CurrentContext, v8);
    }
  }
}

+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGContext *CurrentContext;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)sfrdefaultLineCapStyle);
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)sfrdefaultLineJoinStyle);
  _SFRSetLineWidth(CurrentContext, *(CGFloat *)&sfrdefaultLineWidth);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7, v6);
  CGContextAddLineToPoint(CurrentContext, x, y);
  CGContextStrokePath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

+ (void)setDefaultMiterLimit:(double)a3
{
  sfrdefaultMiterLimit = *(_QWORD *)&a3;
}

+ (double)defaultMiterLimit
{
  return *(double *)&sfrdefaultMiterLimit;
}

+ (void)setDefaultFlatness:(double)a3
{
  sfrdefaultFlatness = *(_QWORD *)&a3;
}

+ (double)defaultFlatness
{
  return *(double *)&sfrdefaultFlatness;
}

+ (void)setDefaultWindingRule:(unint64_t)a3
{
  sfrdefaultWindingRule = a3;
}

+ (unint64_t)defaultWindingRule
{
  return sfrdefaultWindingRule;
}

+ (void)setDefaultLineCapStyle:(unint64_t)a3
{
  sfrdefaultLineCapStyle = a3;
}

+ (unint64_t)defaultLineCapStyle
{
  return sfrdefaultLineCapStyle;
}

+ (void)setDefaultLineJoinStyle:(unint64_t)a3
{
  sfrdefaultLineJoinStyle = a3;
}

+ (unint64_t)defaultLineJoinStyle
{
  return sfrdefaultLineJoinStyle;
}

+ (void)setDefaultLineWidth:(double)a3
{
  sfrdefaultLineWidth = *(_QWORD *)&a3;
}

+ (double)defaultLineWidth
{
  return *(double *)&sfrdefaultLineWidth;
}

- (OITSUBezierPath)init
{
  OITSUBezierPath *result;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  $7B3C09426D5A94CD5FE07DCF037609F1 v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUBezierPath;
  result = -[OITSUBezierPath init](&v6, sel_init);
  sfr_bpFlags = result->sfr_bpFlags;
  *(_OWORD *)&result->sfr_elementCount = 0u;
  *(_OWORD *)&result->sfr_head = 0u;
  result->sfr_extraSegmentCount = 0;
  result->sfr_extraSegmentMax = 0;
  result->sfr_totalLength = 0.0;
  result->sfr_lastSubpathIndex = -1;
  result->sfr_extraSegments = 0;
  v4 = ($7B3C09426D5A94CD5FE07DCF037609F1)(((8 * sfrdefaultWindingRule) | ((_BYTE)sfrdefaultLineCapStyle << 6)) | 5 | *(_DWORD *)&sfr_bpFlags & 0xFFFFF800 | (16 * (sfrdefaultLineJoinStyle & 0xF)));
  *(_QWORD *)&result->sfr_lineWidth = sfrdefaultLineWidth;
  v5 = *(double *)&sfrdefaultFlatness;
  *(_QWORD *)&result->sfr_miterLimit = sfrdefaultMiterLimit;
  result->sfr_flatness = v5;
  result->sfr_dashedLinePattern = 0;
  result->sfr_dashedLineCount = 0;
  result->sfr_dashedLinePhase = 0.0;
  result->sfr_bpFlags = v4;
  return result;
}

- (void)dealloc
{
  NSZone *v3;
  double *sfr_dashedLinePattern;
  void *sfr_path;
  void *sfr_extraSegments;
  objc_super v7;

  v3 = (NSZone *)-[OITSUBezierPath zone](self, "zone");
  NSZoneFree(v3, self->sfr_head);
  NSZoneFree(v3, self->sfr_elementLength);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    NSZoneFree(v3, sfr_dashedLinePattern);
  sfr_path = self->sfr_path;
  if (sfr_path)
    CFRelease(sfr_path);
  sfr_extraSegments = self->sfr_extraSegments;
  if (sfr_extraSegments)
    NSZoneFree(v3, sfr_extraSegments);
  v7.receiver = self;
  v7.super_class = (Class)OITSUBezierPath;
  -[OITSUBezierPath dealloc](&v7, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double v13[6];
  double v14[7];

  v14[6] = *(double *)MEMORY[0x24BDAC8D0];
  if (self == a3)
  {
LABEL_16:
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = (void *)TSUCheckedDynamicCast(v6, (uint64_t)a3);
    v8 = -[OITSUBezierPath elementCount](self, "elementCount");
    if (v8 != objc_msgSend(v7, "elementCount"))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (v8 >= 1)
    {
      v9 = 0;
      while (1)
      {
        v10 = -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, v14);
        if (v10 != objc_msgSend(v7, "elementAtIndex:associatedPoints:", v9, v13))
          goto LABEL_17;
        if (v10 >= 2)
        {
          if (v10 == 2)
          {
            v11 = 0;
            while (TSUNearlyEqualPoints(v14[v11], v14[v11 + 1], v13[v11], v13[v11 + 1]))
            {
              v11 += 2;
              if (v11 == 6)
                goto LABEL_14;
            }
            goto LABEL_17;
          }
        }
        else if (!TSUNearlyEqualPoints(v14[0], v14[1], v13[0], v13[1]))
        {
          goto LABEL_17;
        }
LABEL_14:
        ++v9;
        LOBYTE(v5) = 1;
        if (v9 == v8)
          return v5;
      }
    }
    goto LABEL_16;
  }
  return v5;
}

- (void)copyPathAttributesTo:(id)a3
{
  double *sfr_dashedLinePattern;

  objc_msgSend(a3, "setWindingRule:", -[OITSUBezierPath windingRule](self, "windingRule"));
  objc_msgSend(a3, "setLineCapStyle:", -[OITSUBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(a3, "setLineJoinStyle:", -[OITSUBezierPath lineJoinStyle](self, "lineJoinStyle"));
  -[OITSUBezierPath lineWidth](self, "lineWidth");
  objc_msgSend(a3, "setLineWidth:");
  -[OITSUBezierPath miterLimit](self, "miterLimit");
  objc_msgSend(a3, "setMiterLimit:");
  -[OITSUBezierPath flatness](self, "flatness");
  objc_msgSend(a3, "setFlatness:");
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    objc_msgSend(a3, "setLineDash:count:phase:", sfr_dashedLinePattern, self->sfr_dashedLineCount, self->sfr_dashedLinePhase);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[OITSUBezierPath copyPathAttributesTo:](self, "copyPathAttributesTo:", v4);
  objc_msgSend(v4, "appendBezierPath:", self);
  return v4;
}

- (void)lineToPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[OITSUBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for line"));
  -[OITSUBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x, y);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  if (-[OITSUBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for curve"));
  -[OITSUBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", v10, v9, v8, v7, x, y);
}

- (void)removeAllPoints
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  void *sfr_path;

  sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF);
  self->sfr_bpFlags = sfr_bpFlags;
  self->sfr_elementCount = 0;
  self->sfr_extraSegmentCount = 0;
  self->sfr_lastSubpathIndex = -1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
    sfr_bpFlags = self->sfr_bpFlags;
  }
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
}

- (void)relativeMoveToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[OITSUBezierPath currentPoint](self, "currentPoint");
  -[OITSUBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", x + v6, y + v7);
}

- (void)relativeLineToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[OITSUBezierPath currentPoint](self, "currentPoint");
  -[OITSUBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x + v6, y + v7);
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  -[OITSUBezierPath currentPoint](self, "currentPoint");
  -[OITSUBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", v10 + v12, v9 + v13, v8 + v12, v7 + v13, x + v12, y + v13);
}

- (double)lineWidth
{
  return self->sfr_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->sfr_lineWidth = a3;
}

- (unint64_t)lineCapStyle
{
  return *(_DWORD *)&self->sfr_bpFlags >> 6;
}

- (void)setLineCapStyle:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFF3F | ((a3 & 3) << 6));
}

- (unint64_t)lineJoinStyle
{
  return ((unint64_t)self->sfr_bpFlags >> 4) & 3;
}

- (void)setLineJoinStyle:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFCF | (16 * (a3 & 0xF)));
}

- (unint64_t)windingRule
{
  return ((unint64_t)self->sfr_bpFlags >> 3) & 1;
}

- (void)setWindingRule:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFF7 | (8 * (a3 & 0x1F)));
}

- (double)miterLimit
{
  return self->sfr_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->sfr_miterLimit = a3;
}

- (double)flatness
{
  return self->sfr_flatness;
}

- (void)setFlatness:(double)a3
{
  self->sfr_flatness = a3;
}

- (void)setLineDash:(const double *)a3 count:(int64_t)a4 phase:(double)a5
{
  double **p_sfr_dashedLinePattern;
  double *sfr_dashedLinePattern;
  const double *v10;
  NSZone *v11;
  double *v12;
  uint64_t v13;

  p_sfr_dashedLinePattern = &self->sfr_dashedLinePattern;
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (a3)
  {
    v10 = a3;
    v11 = (NSZone *)-[OITSUBezierPath zone](self, "zone");
    if (sfr_dashedLinePattern)
      v12 = (double *)NSZoneRealloc(v11, *p_sfr_dashedLinePattern, 8 * a4);
    else
      v12 = (double *)NSZoneMalloc(v11, 8 * a4);
    self->sfr_dashedLinePattern = v12;
    self->sfr_dashedLineCount = a4;
    self->sfr_dashedLinePhase = a5;
    if (a4 >= 1)
    {
      do
      {
        v13 = *(_QWORD *)v10++;
        *(_QWORD *)v12++ = v13;
        --a4;
      }
      while (a4);
    }
  }
  else if (sfr_dashedLinePattern)
  {
    NSZoneFree((NSZone *)-[OITSUBezierPath zone](self, "zone", a5), self->sfr_dashedLinePattern);
    *p_sfr_dashedLinePattern = 0;
    p_sfr_dashedLinePattern[1] = 0;
    p_sfr_dashedLinePattern[2] = 0;
  }
}

- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5
{
  double *sfr_dashedLinePattern;
  unint64_t i;
  uint64_t v7;

  if (a4)
    *a4 = self->sfr_dashedLineCount;
  if (a5)
    *a5 = self->sfr_dashedLinePhase;
  if (a3)
  {
    sfr_dashedLinePattern = self->sfr_dashedLinePattern;
    if (sfr_dashedLinePattern)
    {
      for (i = self->sfr_dashedLineCount; i; --i)
      {
        v7 = *(_QWORD *)sfr_dashedLinePattern++;
        *(_QWORD *)a3++ = v7;
      }
    }
  }
}

- (BOOL)_isValid:(double)a3
{
  double v3;

  v3 = fabs(a3);
  return v3 > INFINITY || v3 < INFINITY;
}

- (CGPoint)_checkPointForValidity:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (!-[OITSUBezierPath _isValid:](self, "_isValid:"))
    x = 0.0;
  if (-[OITSUBezierPath _isValid:](self, "_isValid:", y))
    v6 = y;
  else
    v6 = 0.0;
  v7 = x;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)_doPath
{
  CGPath *Mutable;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;

  if (!self->sfr_path && !-[OITSUBezierPath isEmpty](self, "isEmpty"))
  {
    Mutable = CGPathCreateMutable();
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      v6 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      do
      {
        switch(*(_QWORD *)sfr_head & 0xFLL)
        {
          case 0:
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGPathMoveToPoint(Mutable, 0, v8, v9);
            break;
          case 1:
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            CGPathAddLineToPoint(Mutable, 0, v10, v11);
            break;
          case 2:
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
            v13 = v12;
            v15 = v14;
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", *sfr_extraSegments, sfr_extraSegments[1]);
            v17 = v16;
            v19 = v18;
            -[OITSUBezierPath _checkPointForValidity:](self, "_checkPointForValidity:", sfr_extraSegments[2], sfr_extraSegments[3]);
            CGPathAddCurveToPoint(Mutable, 0, v17, v19, v20, v21, v13, v15);
            sfr_extraSegments += 4;
            break;
          case 3:
            CGPathCloseSubpath(Mutable);
            break;
          default:
            break;
        }
        sfr_head += 6;
      }
      while (sfr_head < v6);
    }
    self->sfr_path = Mutable;
  }
}

- (void)stroke
{
  CGContext *CurrentContext;
  double *sfr_dashedLinePattern;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v7;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)-[OITSUBezierPath lineCapStyle](self, "lineCapStyle"));
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)-[OITSUBezierPath lineJoinStyle](self, "lineJoinStyle"));
  _SFRSetLineWidth(CurrentContext, self->sfr_lineWidth);
  CGContextSetMiterLimit(CurrentContext, self->sfr_miterLimit);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    CGContextSetLineDash(CurrentContext, self->sfr_dashedLinePhase, sfr_dashedLinePattern, self->sfr_dashedLineCount);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v7 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v7);
  }
  CGContextStrokePath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)fill
{
  CGContext *CurrentContext;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  if (-[OITSUBezierPath windingRule](self, "windingRule"))
    CGContextEOFillPath(CurrentContext);
  else
    CGContextFillPath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)addClip
{
  CGContext *CurrentContext;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  CGContextBeginPath(CurrentContext);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  if (-[OITSUBezierPath windingRule](self, "windingRule"))
    CGContextEOClip(CurrentContext);
  else
    CGContextClip(CurrentContext);
  CGContextBeginPath(CurrentContext);
}

- (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  __int128 v7;
  float64x2_t v8;
  CGFloat y;
  float64x2_t v11;
  CGFloat v12;
  CGFloat v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  uint64_t v32;
  uint64_t v36;
  unint64_t v37;
  CGPoint v38;
  __int128 v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;

  v8 = (float64x2_t)a4;
  a4.x = a7.x;
  *(CGFloat *)&v7 = a7.y;
  y = a5.y;
  v11 = vsubq_f64((float64x2_t)a5, v8);
  v12 = a6.y;
  v38 = a4;
  v39 = v7;
  v13 = a7.y;
  v14 = vsubq_f64((float64x2_t)a6, (float64x2_t)a5);
  v15 = vsubq_f64(v14, v11);
  v16 = vsubq_f64(vsubq_f64((float64x2_t)a4, (float64x2_t)a6), v14);
  v17 = (float64x2_t)vzip2q_s64((int64x2_t)v15, (int64x2_t)v16);
  v18 = (float64x2_t)vzip1q_s64((int64x2_t)v15, (int64x2_t)v16);
  v19 = vmlaq_f64(vmulq_f64(v17, v17), v18, v18);
  if (v19.f64[0] <= v19.f64[1])
    v19.f64[0] = v19.f64[1];
  v20 = a3 * a3;
  v21 = v19.f64[0] * 9.0 * 0.0625;
  if (v21 > v20)
  {
    v22 = vsubq_f64(v16, v15);
    __asm
    {
      FMOV            V5.2D, #3.0
      FMOV            V6.2D, #6.0
    }
    v29 = vmulq_f64(v22, _Q6);
    v30 = vmlaq_f64(v22, _Q5, vaddq_f64(v11, v15));
    v31 = vmulq_f64(vaddq_f64(v15, v22), _Q6);
    v32 = 1;
    __asm
    {
      FMOV            V2.2D, #0.125
      FMOV            V3.2D, #0.25
      FMOV            V4.2D, #0.5
    }
    do
    {
      v36 = v32;
      v29 = vmulq_f64(v29, _Q2);
      v31 = vsubq_f64(vmulq_f64(v31, _Q3), v29);
      v30 = vsubq_f64(vmulq_f64(v30, _Q4), vmulq_f64(v31, _Q4));
      v32 *= 2;
      v21 = v21 * 0.0625;
    }
    while (v21 > v20 && v32 <= 0x10000);
    if (v32 >= 2)
    {
      v37 = (2 * v36) | 1;
      do
      {
        v42 = v29;
        v43 = vaddq_f64(v8, v30);
        v40 = vaddq_f64(v30, v31);
        v41 = vaddq_f64(v29, v31);
        -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v43, v38, v39);
        v30 = v40;
        v31 = v41;
        v29 = v42;
        v8 = v43;
        --v37;
      }
      while (v37 > 2);
    }
  }
  -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", v38.x, *(double *)&v39);
}

- (void)flattenIntoPath:(id)a3
{
  -[OITSUBezierPath flattenIntoPath:flatness:](self, "flattenIntoPath:flatness:", a3, *(double *)&sfrdefaultFlatness);
}

- (void)flattenIntoPath:(id)a3 flatness:(double)a4
{
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v8;
  double *sfr_extraSegments;

  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v8 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(a3, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(a3, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:", a4, *(double *)&sfr_head[-4], *(double *)&sfr_head[-2], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(_QWORD *)&sfr_head[2], *(_QWORD *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          objc_msgSend(a3, "closePath");
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v8);
  }
}

- (id)bezierPathByFlatteningPath
{
  return -[OITSUBezierPath bezierPathByFlatteningPathWithFlatness:](self, "bezierPathByFlatteningPathWithFlatness:", *(double *)&sfrdefaultFlatness);
}

- (id)bezierPathByFlatteningPathWithFlatness:(double)a3
{
  id v5;

  if (-[OITSUBezierPath isFlat](self, "isFlat"))
  {
    v5 = (id)-[OITSUBezierPath copy](self, "copy");
  }
  else
  {
    v5 = objc_alloc_init((Class)objc_opt_class());
    -[OITSUBezierPath flattenIntoPath:flatness:](self, "flattenIntoPath:flatness:", v5, a3);
  }
  return v5;
}

- (id)_copyFlattenedPath
{
  id v3;

  v3 = objc_alloc_init((Class)objc_opt_class());
  -[OITSUBezierPath flattenIntoPath:](self, "flattenIntoPath:", v3);
  return v3;
}

- (id)bezierPathByReversingPath
{
  id v3;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  unint64_t v6;
  double *sfr_extraSegments;
  PATHSEGMENT *v8;
  PATHSEGMENT *v9;
  uint64_t v10;
  PATHSEGMENT *v12;
  unint64_t v13;
  char v14;
  double *v15;
  int v16;

  if (self->sfr_elementCount > 1)
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount < 2)
      return v3;
    sfr_head = self->sfr_head;
    v6 = (unint64_t)&sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    v8 = sfr_head + 6;
    while (1)
    {
      v9 = sfr_head;
      sfr_head = v8;
      v10 = *(_QWORD *)&v9[6] & 0xFLL;
      if (!v10 || (unint64_t)&v9[12] >= v6)
      {
        v12 = v10 ? sfr_head : v9;
        objc_msgSend(v3, "moveToPoint:", *(double *)&v12[2], *(double *)&v12[4]);
        v13 = *(_QWORD *)v12;
        if ((*(_QWORD *)v12 & 0xFLL) != 0)
          break;
      }
LABEL_28:
      v8 = sfr_head + 6;
      if ((unint64_t)&sfr_head[6] >= v6)
        return v3;
    }
    v14 = 0;
    v15 = (double *)&v12[-2];
    while (1)
    {
      v16 = v13 & 0xF;
      if (v16 == 3)
        break;
      if (v16 == 2)
      {
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", *(v15 - 1), *v15, sfr_extraSegments[4 * (v13 >> 4) + 2], sfr_extraSegments[4 * (v13 >> 4) + 3], sfr_extraSegments[4 * (v13 >> 4)], sfr_extraSegments[4 * (v13 >> 4) + 1]);
        if ((v14 & 1) == 0)
        {
          v14 = 0;
          goto LABEL_27;
        }
        if ((*(_BYTE *)(v15 - 2) & 0xF) == 0)
LABEL_23:
          objc_msgSend(v3, "closePath");
LABEL_25:
        v14 = 1;
        goto LABEL_27;
      }
      if (v16 == 1)
      {
        if ((v14 & 1) != 0 && (*(_BYTE *)(v15 - 2) & 0xF) == 0)
          goto LABEL_23;
        objc_msgSend(v3, "lineToPoint:", *(v15 - 1), *v15);
      }
LABEL_27:
      v13 = *((_QWORD *)v15 - 2);
      v15 -= 3;
      if ((v13 & 0xF) == 0)
        goto LABEL_28;
    }
    objc_msgSend(v3, "lineToPoint:", *(v15 - 1), *v15);
    goto LABEL_25;
  }
  v3 = (id)-[OITSUBezierPath copy](self, "copy");
  return v3;
}

- (id)bezierPathByRemovingSmallSubpathsForInteriorWrapsForInset:(double)a3
{
  return -[OITSUBezierPath p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:](self, "p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:", a3 + a3);
}

- (id)bezierPathByRemovingRedundantElements
{
  return -[OITSUBezierPath p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:](self, "p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:", 0.0);
}

- (id)p_bezierPathByRemovingRedundantElementAndSubregionsSmallerThanThreshold:(double)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
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
  float v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  float v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
  v6 = +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
  v7 = -[OITSUBezierPath elementCount](self, "elementCount");
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *MEMORY[0x24BDBEFB0];
    v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v13 = *MEMORY[0x24BDBEFB0];
    v14 = v12;
    v15 = *MEMORY[0x24BDBEFB0];
    v16 = v12;
    while (2)
    {
      switch(-[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, &v36, *(_QWORD *)&v33, *(_QWORD *)&v34))
      {
        case 0:
          objc_msgSend(v6, "moveToPoint:", v36, v37);
          v10 = 0;
          v11 = v36;
          v12 = v37;
          goto LABEL_13;
        case 1:
          v35 = v11;
          v17 = a3;
          v18 = v36;
          v19 = v37;
          if (TSUNearlyEqualPoints(v13, v14, v36, v37))
            goto LABEL_6;
          if ((v10 & 1) != 0
            && TSUCollinearPoints(v15, v16, v13, v14, v18, v19)
            && (v24 = TSUSubtractPoints(v13, v14, v15),
                v33 = v25,
                v34 = v24,
                v26 = TSUSubtractPoints(v18, v19, v15),
                TSUDotPoints(v34, v33, v26, v27) > 0.0))
          {
            objc_msgSend(v6, "setAssociatedPoints:atIndex:", &v36, objc_msgSend(v6, "elementCount") - 1);
            v10 = 1;
LABEL_6:
            v14 = v16;
            v13 = v15;
          }
          else
          {
            objc_msgSend(v6, "lineToPoint:", v18, v19, *(_QWORD *)&v33, *(_QWORD *)&v34);
            v10 = 1;
          }
          a3 = v17;
          v16 = v14;
          v15 = v13;
          v13 = v36;
          v14 = v37;
          v11 = v35;
LABEL_20:
          if (v8 == ++v9)
            break;
          continue;
        case 2:
          objc_msgSend(v6, "curveToPoint:controlPoint1:controlPoint2:", v40, v41, v36, v37, v38, v39);
          v10 = 0;
          v16 = v14;
          v15 = v13;
          v13 = v40;
          v14 = v41;
          goto LABEL_20;
        case 3:
          objc_msgSend(v6, "closePath");
          if (a3 > 0.0)
          {
            objc_msgSend(v6, "bounds");
            v21 = v20;
            v23 = v22;
            if (fmaxf(v21, v23) > a3)
              objc_msgSend(v5, "appendBezierPath:", v6);
            v6 = +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
          }
          v10 = 0;
LABEL_13:
          v16 = v14;
          v15 = v13;
          v14 = v12;
          v13 = v11;
          goto LABEL_20;
        default:
          goto LABEL_20;
      }
      break;
    }
  }
  if ((objc_msgSend(v5, "isEmpty", *(_QWORD *)&v33, *(_QWORD *)&v34) & 1) != 0)
    return v6;
  if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v6, "bounds");
    v29 = v28;
    v31 = v30;
    if (fmaxf(v29, v31) > a3)
      objc_msgSend(v5, "appendBezierPath:", v6);
  }
  return v5;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v9;
  double *sfr_extraSegments;
  int64_t sfr_extraSegmentCount;
  double *v12;
  void *sfr_path;
  CGAffineTransform v14;
  CGAffineTransform t1;

  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v14.c = v6;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (!CGAffineTransformEqualToTransform(&t1, &v14))
  {
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      v9 = &sfr_head[6 * sfr_elementCount];
      do
      {
        *(float64x2_t *)&sfr_head[2] = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, *(double *)&sfr_head[4]), *(float64x2_t *)&a3->a, *(double *)&sfr_head[2]));
        sfr_head += 6;
      }
      while (sfr_head < v9);
    }
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    if (sfr_extraSegments)
    {
      sfr_extraSegmentCount = self->sfr_extraSegmentCount;
      if (sfr_extraSegmentCount >= 1)
      {
        v12 = &sfr_extraSegments[4 * sfr_extraSegmentCount];
        do
        {
          *(float64x2_t *)sfr_extraSegments = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[1]), *(float64x2_t *)&a3->a, *sfr_extraSegments));
          *((float64x2_t *)sfr_extraSegments + 1) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[3]), *(float64x2_t *)&a3->a, sfr_extraSegments[2]));
          sfr_extraSegments += 4;
        }
        while (sfr_extraSegments < v12);
      }
    }
    sfr_path = self->sfr_path;
    if (sfr_path)
    {
      CFRelease(sfr_path);
      self->sfr_path = 0;
    }
    *(_DWORD *)&self->sfr_bpFlags |= 1u;
  }
}

- (CGPath)CGPath
{
  CGPath *result;
  CGPathRef v4;

  -[OITSUBezierPath _doPath](self, "_doPath");
  result = (CGPath *)self->sfr_path;
  if (result)
  {
    v4 = CGPathRetain(result);
    return (CGPath *)CFAutorelease(v4);
  }
  return result;
}

- (BOOL)isTriangular
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  _BOOL4 v7;
  BOOL result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  double v14;
  double v15;
  double v16;
  double v17;

  v3 = -[OITSUBezierPath elementCount](self, "elementCount");
  if (v3)
  {
    v4 = v3;
    v5 = v3 - 1;
    if (-[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
      v6 = v4;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[OITSUBezierPath isFlat](self, "isFlat");
  result = 0;
  if (v7 && (v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v9 = 1;
    while (-[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", v9) == 1)
    {
      if (v6 == ++v9)
      {
        v10 = v6 - 1;
        goto LABEL_13;
      }
    }
    v10 = v9 - 1;
LABEL_13:
    if (-[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", v6 - 1) == 3)
      v11 = v10 + 1;
    else
      v11 = v10;
    v12 = v6 != v11 + 1 || v10 > 3;
    result = 0;
    if (!v12)
    {
      if (v10 != 3)
        return 1;
      v16 = 0.0;
      v17 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, &v16);
      -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 3, &v14);
      if (v16 == v14 && v17 == v15)
        return 1;
    }
  }
  return result;
}

- (BOOL)isDiamond
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  _BOOL4 v6;
  BOOL result;
  unint64_t v8;
  uint64_t v9;
  int64_t v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  uint64_t v16;
  double MidY;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  CGRect v21;
  CGRect v22;

  v3 = -[OITSUBezierPath elementCount](self, "elementCount");
  if (!v3)
  {
    -[OITSUBezierPath isFlat](self, "isFlat");
    return 0;
  }
  v4 = v3;
  v5 = v3 - 1;
  if (!-[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
    v4 = v5;
  v6 = -[OITSUBezierPath isFlat](self, "isFlat");
  result = 0;
  if (v6 && v4 == 5)
  {
    v8 = -5;
    v9 = 4;
    while (-[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", v8 + 6) == 1)
    {
      if (++v8 == -1)
        goto LABEL_13;
    }
    if (v8 < 0xFFFFFFFFFFFFFFFELL)
      return 0;
    v9 = v8 + 5;
LABEL_13:
    v10 = -[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", 4);
    if (v9 != 3 || v10 == 3)
    {
      -[OITSUBezierPath bounds](self, "bounds");
      x = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
      MidX = CGRectGetMidX(v21);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v16 = 0;
      MidY = (double)(unint64_t)CGRectGetMidY(v22);
      v18 = v9 + 1;
      v19 = *MEMORY[0x24BDBEFB0];
      while (1)
      {
        v20 = v19;
        -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v16, &v20, v19);
        if (vabdd_f64((double)(unint64_t)MidX, *(double *)&v20) > 0.01
          && vabdd_f64(MidY, *((double *)&v20 + 1)) > 0.01)
        {
          break;
        }
        if (v18 == ++v16)
          return 1;
      }
    }
    return 0;
  }
  return result;
}

- (BOOL)isRectangular
{
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  unint64_t v20;
  double *v21;
  double v22;
  uint64_t v23;
  _BOOL4 v24;
  float64x2_t v25;
  float64x2_t v27[6];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v28 = *MEMORY[0x24BDAC8D0];
  LODWORD(v3) = -[OITSUBezierPath isFlat](self, "isFlat");
  if ((_DWORD)v3)
  {
    v3 = -[OITSUBezierPath elementCount](self, "elementCount");
    if (v3)
    {
      v4 = v3;
      v5 = v3 - 1;
      if (-[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
        v6 = v4;
      else
        v6 = v5;
      if (v6 < 5)
        goto LABEL_7;
      if (v6 <= 6)
      {
        v9 = 1;
        while (-[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", v9) == 1)
        {
          if (v6 == ++v9)
          {
            v10 = v6 - 1;
            goto LABEL_17;
          }
        }
        v10 = v9 - 1;
LABEL_17:
        v11 = -[OITSUBezierPath elementAtIndex:](self, "elementAtIndex:", v6 - 1);
        LOBYTE(v3) = 0;
        if (v11 == 3)
          v12 = v10 + 2;
        else
          v12 = v10 + 1;
        if (v11 == 3)
          v13 = v10 + 1;
        else
          v13 = v10;
        if (v6 == v12 && v13 >= 4)
        {
          -[OITSUBezierPath bounds](self, "bounds");
          x = v29.origin.x;
          y = v29.origin.y;
          width = v29.size.width;
          height = v29.size.height;
          MaxX = CGRectGetMaxX(v29);
          v30.origin.x = x;
          v30.origin.y = y;
          v30.size.width = width;
          v30.size.height = height;
          MaxY = CGRectGetMaxY(v30);
          v20 = 0;
          v21 = (double *)v27;
          while (1)
          {
            -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v20, v21);
            if (vabdd_f64(x, *v21) >= 0.01 && vabdd_f64(MaxX, *v21) >= 0.01)
              goto LABEL_7;
            v22 = v21[1];
            if (vabdd_f64(y, v22) >= 0.01 && vabdd_f64(MaxY, v22) >= 0.01)
              goto LABEL_7;
            ++v20;
            v21 += 2;
            if (v20 > v10)
            {
              v23 = 0;
              v24 = 0;
              while (1)
              {
                v25 = vabdq_f64(v27[(v23 + 1) % (v10 + 1)], v27[v23]);
                if (v25.f64[0] > 0.01 != v25.f64[1] <= 0.01 || v23 && ((v24 ^ (v25.f64[0] > 0.01)) & 1) == 0)
                  break;
                ++v23;
                v24 = v25.f64[0] > 0.01;
                if (v23 == 4)
                {
                  LOBYTE(v3) = 1;
                  return v3;
                }
              }
              goto LABEL_7;
            }
          }
        }
      }
      else
      {
        v7 = -[OITSUBezierPath bezierPathByRemovingRedundantElements](self, "bezierPathByRemovingRedundantElements");
        v8 = objc_msgSend(v7, "elementCount");
        if (v8 >= -[OITSUBezierPath elementCount](self, "elementCount"))
        {
LABEL_7:
          LOBYTE(v3) = 0;
          return v3;
        }
        LOBYTE(v3) = objc_msgSend(v7, "isRectangular");
      }
    }
  }
  return v3;
}

- (BOOL)isCircular
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  double v16;
  double v17;
  int64_t v18;
  float64x2_t *v19;
  double v20;
  double v21;
  double v22;
  float64x2_t v24;
  _BYTE v25[32];
  double v26[4];

  v26[3] = *(double *)MEMORY[0x24BDAC8D0];
  -[OITSUBezierPath bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[OITSUBezierPath elementCount](self, "elementCount");
  if (v11 >= 1)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = v4 + v8 * 0.5;
    v17 = v6 + v10 * 0.5;
    while (1)
    {
      v18 = -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v13, v25, *(_OWORD *)&v24);
      if (v18 == 2)
      {
        if (fabs(TSUPointLength((v26[0] - v16) / v8, (v26[1] - v17) / v10) + -0.5) > 0.0001)
          return v14;
        v20 = TSUPointOnCurve(&v24, 0.5);
        v22 = TSUPointLength((v20 - v16) / v8, (v21 - v17) / v10);
        v19 = (float64x2_t *)v26;
        if (fabs(v22 + -0.5) > 0.0001)
          return v14;
      }
      else
      {
        if (v18 == 3)
        {
          if (v15 > 0)
            return v14;
          v15 = 1;
          goto LABEL_12;
        }
        v19 = (float64x2_t *)v25;
        if (v18 == 1)
          return v14;
      }
      v24 = *v19;
LABEL_12:
      v14 = v12 <= ++v13;
      if (v12 == v13)
        return v14;
    }
  }
  return 1;
}

- (BOOL)isEmpty
{
  return self->sfr_elementCount == 0;
}

- (CGPoint)currentPoint
{
  PATHSEGMENT *v3;
  double v4;
  double v5;
  CGPoint result;

  if (-[OITSUBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for line"));
  v3 = &self->sfr_head[6 * self->sfr_elementCount];
  v4 = *(double *)&v3[-4];
  v5 = *(double *)&v3[-2];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)controlPointBounds
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  CGPoint v4;
  double y;
  float64x2_t size;
  PATHSEGMENT *sfr_head;
  int64_t sfr_elementCount;
  float64x2_t v9;
  unint64_t v10;
  PATHSEGMENT *v11;
  uint64_t v12;
  float64x2_t v14;
  float64x2_t *sfr_extraSegments;
  int64_t sfr_extraSegmentCount;
  float64x2_t *v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  double v22;
  CGRect result;

  if (-[OITSUBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for control point bounds"));
  sfr_bpFlags = self->sfr_bpFlags;
  if ((*(_BYTE *)&sfr_bpFlags & 1) != 0)
  {
    sfr_head = self->sfr_head;
    sfr_elementCount = self->sfr_elementCount;
    v9 = *(float64x2_t *)&sfr_head[2];
    if (sfr_elementCount < 2)
    {
      v4 = *(CGPoint *)&sfr_head[2];
    }
    else
    {
      v10 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      v11 = sfr_head + 6;
      v4 = (CGPoint)v9;
      do
      {
        v12 = *(_QWORD *)v11 & 0xFLL;
        if (v12 != 3 && (v12 || (unint64_t)&v11[6] < v10))
        {
          v14 = *(float64x2_t *)&v11[2];
          v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v14, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v14);
          v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v14, v9), (int8x16_t)v14, (int8x16_t)v9);
        }
        v11 += 6;
      }
      while ((unint64_t)v11 < v10);
    }
    sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
    if (sfr_extraSegments)
    {
      sfr_extraSegmentCount = self->sfr_extraSegmentCount;
      if (sfr_extraSegmentCount >= 1)
      {
        v17 = &sfr_extraSegments[2 * sfr_extraSegmentCount];
        do
        {
          v18 = *sfr_extraSegments;
          v19 = sfr_extraSegments[1];
          sfr_extraSegments += 2;
          v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v18);
          v21 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v9), (int8x16_t)v18, (int8x16_t)v9);
          v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v19, v20), (int8x16_t)v20, (int8x16_t)v19);
          v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v19, v21), (int8x16_t)v19, (int8x16_t)v21);
        }
        while (sfr_extraSegments < v17);
      }
    }
    self->sfr_controlPointBounds.origin = v4;
    size = vsubq_f64(v9, (float64x2_t)v4);
    self->sfr_controlPointBounds.size = (CGSize)size;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags & 0xFFFFFFFE);
    y = v4.y;
  }
  else
  {
    v4.x = self->sfr_controlPointBounds.origin.x;
    y = self->sfr_controlPointBounds.origin.y;
    size = (float64x2_t)self->sfr_controlPointBounds.size;
  }
  v22 = size.f64[1];
  result.size.width = size.f64[0];
  result.origin.x = v4.x;
  result.size.height = v22;
  result.origin.y = y;
  return result;
}

- (CGRect)bounds
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  const CGPath *sfr_path;
  CGRect result;

  if (-[OITSUBezierPath isFlat](self, "isFlat"))
  {
    -[OITSUBezierPath controlPointBounds](self, "controlPointBounds");
  }
  else
  {
    -[OITSUBezierPath _doPath](self, "_doPath");
    sfr_path = (const CGPath *)self->sfr_path;
    if (sfr_path)
    {
      *(CGRect *)&v3 = CGPathGetPathBoundingBox(sfr_path);
    }
    else
    {
      v3 = *MEMORY[0x24BDBF090];
      v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isFlat
{
  return (*(_BYTE *)&self->sfr_bpFlags >> 2) & 1;
}

- (BOOL)isClockwise
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  BOOL v13;
  double v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[OITSUBezierPath elementCount](self, "elementCount");
  if (v3 < 1)
  {
    v9 = 0.0;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *MEMORY[0x24BDBEFB0];
    v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v9 = 0.0;
    v10 = v8;
    v11 = *MEMORY[0x24BDBEFB0];
    do
    {
      switch(-[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v5, &v15))
      {
        case 0:
          v11 = v15;
          v10 = v16;
          v7 = v15;
          v8 = v16;
          break;
        case 1:
          if (v7 != v15 || v8 != v16)
            v9 = v7 * v16 - v8 * v15 + v9;
          v6 = 1;
          v7 = v15;
          v8 = v16;
          break;
        case 2:
          NSLog((NSString *)CFSTR("Warning: Path should be flat. Illegal TSUCurveToBezierPathElement."));
          break;
        case 3:
          v13 = v7 == v11 && v8 == v10;
          v6 = 0;
          if (!v13)
            v9 = v7 * v10 - v8 * v11 + v9;
          break;
        default:
          break;
      }
      ++v5;
    }
    while (v4 != v5);
    if ((v6 & 1) != 0)
      v9 = v7 * v10 - v8 * v11 + v9;
  }
  return v9 >= 0.0;
}

- (double)calculateLengthOfElement:(int64_t)a3
{
  double v3;
  int64_t v4;
  float v5;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = 0.0;
  if (a3)
  {
    v4 = -[OITSUBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a3, &v9);
    switch(v4)
    {
      case 3:
        goto LABEL_5;
      case 2:
        v8 = 0.0;
        addifclose((uint64_t)&v9, &v8);
        return v8;
      case 1:
LABEL_5:
        v5 = (v10 - v12) * (v10 - v12) + (v9 - v11) * (v9 - v11);
        return sqrtf(v5);
    }
  }
  return v3;
}

- (void)calculateLengths
{
  uint64_t v3;
  uint64_t i;
  double v5;

  self->sfr_totalLength = 0.0;
  v3 = -[OITSUBezierPath elementCount](self, "elementCount");
  self->sfr_elementLength = (double *)NSZoneRealloc((NSZone *)-[OITSUBezierPath zone](self, "zone"), self->sfr_elementLength, 8 * self->sfr_elementMax);
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      -[OITSUBezierPath calculateLengthOfElement:](self, "calculateLengthOfElement:", i);
      self->sfr_elementLength[i] = v5;
      self->sfr_totalLength = v5 + self->sfr_totalLength;
    }
  }
  *(_DWORD *)&self->sfr_bpFlags |= 0x400u;
}

- (double)length
{
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[OITSUBezierPath calculateLengths](self, "calculateLengths");
  return self->sfr_totalLength;
}

- (double)lengthOfElement:(int64_t)a3
{
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[OITSUBezierPath calculateLengths](self, "calculateLengths");
  return self->sfr_elementLength[a3];
}

- (double)lengthToElement:(int64_t)a3
{
  double *sfr_elementLength;
  double result;
  double v8;

  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[OITSUBezierPath calculateLengths](self, "calculateLengths");
  if (self->sfr_elementCount < a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSUBezierPath.m"), 1582, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("e <= sfr_elementCount"));
  if (a3 < 1)
    return 0.0;
  sfr_elementLength = self->sfr_elementLength;
  result = 0.0;
  do
  {
    v8 = *sfr_elementLength++;
    result = result + v8;
    --a3;
  }
  while (a3);
  return result;
}

- (int64_t)elementCount
{
  return self->sfr_elementCount;
}

- (int64_t)elementAtIndex:(int64_t)a3
{
  return -[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", a3, 0);
}

- (int64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v8;
  CGPoint *v9;

  if (a3 < 0 || self->sfr_elementCount <= a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("%@: index (%ld) beyond bounds (%ld)"), NSStringFromSelector(a2), a3, self->sfr_elementCount);
  sfr_head = self->sfr_head;
  v8 = &sfr_head[6 * a3];
  if (a4)
  {
    if ((*(_QWORD *)v8 & 0xFLL) == 2)
    {
      v9 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(_QWORD *)v8 >> 4));
      *a4 = *v9;
      a4[1] = v9[1];
      a4 += 2;
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(_QWORD *)v8 & 0xFLL;
}

- (int64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4
{
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v8;
  unint64_t v9;
  CGPoint *v10;

  if (a3 < 0 || self->sfr_elementCount <= a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("%@: index (%ld) beyond bounds (%ld)"), NSStringFromSelector(a2), a3, self->sfr_elementCount);
  sfr_head = self->sfr_head;
  v8 = &sfr_head[6 * a3];
  if (a4)
  {
    v9 = *(_QWORD *)v8;
    if ((*(_QWORD *)v8 & 0xFLL) != 0)
    {
      *a4 = *(CGPoint *)&sfr_head[6 * a3 - 4];
      v9 = *(_QWORD *)v8;
    }
    if ((v9 & 0xF) != 0)
    {
      if ((v9 & 0xF) == 2)
      {
        v10 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (v9 >> 4));
        a4[1] = *v10;
        a4[2] = v10[1];
        a4 += 3;
      }
      else
      {
        ++a4;
      }
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(_QWORD *)v8 & 0xFLL;
}

- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4
{
  PATHSEGMENT *sfr_head;
  CGPoint *v8;
  CGPoint v9;
  void *sfr_path;

  if (a4 < 0 || self->sfr_elementCount <= a4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("%@: index (%ld) beyond bounds (%ld)"), NSStringFromSelector(a2), a4, self->sfr_elementCount);
  sfr_head = self->sfr_head;
  if ((*(_QWORD *)&sfr_head[6 * a4] & 0xFLL) == 2)
  {
    v8 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(_QWORD *)&sfr_head[6 * a4] >> 4));
    *v8 = *a3;
    v9 = a3[1];
    a3 += 2;
    v8[1] = v9;
  }
  *(CGPoint *)&sfr_head[6 * a4 + 2] = *a3;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (void)_appendToPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4
{
  PATHSEGMENT *sfr_head;
  int64_t sfr_elementCount;
  double *sfr_extraSegments;
  BOOL v8;
  PATHSEGMENT *v9;

  sfr_head = self->sfr_head;
  sfr_elementCount = self->sfr_elementCount;
  sfr_extraSegments = (double *)self->sfr_extraSegments;
  v8 = a4 && objc_msgSend(a3, "elementCount") > 0;
  if (sfr_elementCount >= 1)
  {
    v9 = &sfr_head[6 * sfr_elementCount];
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          if (!v8)
            objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          v8 = 0;
          break;
        case 1:
          objc_msgSend(a3, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(a3, "curveToPoint:controlPoint1:controlPoint2:", *(double *)&sfr_head[2], *(double *)&sfr_head[4], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3]);
          sfr_extraSegments += 4;
          break;
        case 3:
          objc_msgSend(a3, "closePath");
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v9);
  }
}

- (void)appendBezierPath:(id)a3 skippingInitialMoveIfPossible:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    objc_msgSend(a3, "_appendToPath:skippingInitialMoveIfPossible:", self, v4);
  }
  else
  {
    v8 = v4 && -[OITSUBezierPath elementCount](self, "elementCount") > 0;
    v9 = objc_msgSend(a3, "elementCount");
    if (v9 >= 1)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        switch(objc_msgSend(a3, "elementAtIndex:associatedPoints:", i, &v12))
        {
          case 0:
            if (!v8)
              -[OITSUBezierPath moveToPoint:](self, "moveToPoint:", v12, v13);
            v8 = 0;
            break;
          case 1:
            -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", v12, v13);
            break;
          case 2:
            -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v16, v17, v12, v13, v14, v15);
            break;
          case 3:
            -[OITSUBezierPath closePath](self, "closePath");
            break;
          default:
            continue;
        }
      }
    }
  }
}

- (void)appendBezierPath:(id)a3
{
  -[OITSUBezierPath appendBezierPath:skippingInitialMoveIfPossible:](self, "appendBezierPath:skippingInitialMoveIfPossible:", a3, 0);
}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxX;
  double v9;
  double MinX;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[OITSUBezierPath moveToPoint:](self, "moveToPoint:");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MaxX = CGRectGetMaxX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", MaxX, CGRectGetMinY(v12));
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v9 = CGRectGetMaxX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", v9, CGRectGetMaxY(v14));
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", MinX, CGRectGetMaxY(v16));
  -[OITSUBezierPath closePath](self, "closePath");
}

- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  int64_t v4;
  double *p_y;

  v4 = a4 - 1;
  if (a4 >= 1)
  {
    if (-[OITSUBezierPath isEmpty](self, "isEmpty") || (*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x100)
      -[OITSUBezierPath moveToPoint:](self, "moveToPoint:", a3->x, a3->y);
    else
      -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", a3->x, a3->y);
    if ((unint64_t)a4 >= 2)
    {
      p_y = &a3[1].y;
      do
      {
        -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", *(p_y - 1), *p_y);
        p_y += 2;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  OITSUBezierPath *v8;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v11;
  CGFloat v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v8 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:](v8, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0, -45.0, 315.0);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidY = CGRectGetMidY(v18);
  *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tx = *(_OWORD *)&v16.tx;
  CGAffineTransformTranslate(&v16, &v15, MidX, MidY);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = CGRectGetWidth(v19) * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = CGRectGetHeight(v20);
  v14 = v16;
  CGAffineTransformScale(&v15, &v14, v11, v12 * 0.5);
  v16 = v15;
  -[OITSUBezierPath transformUsingAffineTransform:](v8, "transformUsingAffineTransform:", &v15);
  -[OITSUBezierPath appendBezierPath:](self, "appendBezierPath:", v8);

}

- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6
{
  double y;
  double x;
  __double2 v12;
  double v13;
  __double2 v14;
  __double2 v15;

  y = a3.y;
  x = a3.x;
  v12 = __sincos_stret((a6 - a5) * 0.5);
  v13 = (1.0 - v12.__cosval) * 4.0 / (v12.__sinval * 3.0);
  v14 = __sincos_stret(a5);
  v15 = __sincos_stret(a6);
  -[OITSUBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", x + a4 * v15.__cosval, y + a4 * v15.__sinval, x + a4 * v14.__cosval - v13 * a4 * v14.__sinval, y + a4 * v14.__sinval + v13 * a4 * v14.__cosval, x + a4 * v15.__cosval + v13 * a4 * v15.__sinval, y + a4 * v15.__sinval - v13 * a4 * v15.__cosval);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  double y;
  double x;
  double v15;
  double v16;
  __double2 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  y = a3.y;
  x = a3.x;
  if (__fpclassifyd(a5) < 3 || __fpclassifyd(a6) <= 2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@: illegal angle argument"), NSStringFromSelector(a2));
  v15 = a5 * 3.14159265 / 180.0;
  v16 = a6 * 3.14159265;
  v17 = __sincos_stret(v15);
  v18 = x + a4 * v17.__cosval;
  v19 = y + a4 * v17.__sinval;
  if (-[OITSUBezierPath isEmpty](self, "isEmpty"))
    -[OITSUBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v18, v19);
  else
    -[OITSUBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v18, v19);
  v20 = v16 / 180.0;
  if (a7)
  {
    for (; v15 < v20; v15 = v15 + 6.28318531)
      ;
    v21 = v15 - v20;
    if (v15 - v20 > 1.57079633)
    {
      do
      {
        v22 = v15 + -1.57079633;
        -[OITSUBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v15, v15 + -1.57079633);
        v21 = v22 - v20;
        v15 = v15 + -1.57079633;
      }
      while (v22 - v20 > 1.57079633);
      goto LABEL_19;
    }
  }
  else
  {
    for (; v20 < v15; v20 = v20 + 6.28318531)
      ;
    v21 = v20 - v15;
    if (v20 - v15 > 1.57079633)
    {
      do
      {
        v22 = v15 + 1.57079633;
        -[OITSUBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v15, v15 + 1.57079633);
        v21 = v20 - v22;
        v15 = v15 + 1.57079633;
      }
      while (v20 - v22 > 1.57079633);
      goto LABEL_19;
    }
  }
  v22 = v15;
LABEL_19:
  if (v21 > 0.0)
    -[OITSUBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v22, v20);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6
{
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, a3.x, a3.y, a4, a5, a6);
}

- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGAffineTransform v39;
  CGAffineTransform v40;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v37 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
  v38 = *MEMORY[0x24BDBD8B8];
  v35 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
  v36 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
  v33 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  v34 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  -[OITSUBezierPath currentPoint](self, "currentPoint");
  v13 = v11;
  v14 = v12;
  if (v11 == v9 && v12 == v8)
  {
    v17 = v9 - v11;
    v16 = v8 - v12;
    v18 = 0.0;
    v30 = 0.0;
  }
  else
  {
    v30 = a5;
    v16 = v8 - v12;
    v17 = v9 - v11;
    v18 = atan2(v8 - v12, v17);
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tx = v34;
  v39.ty = v33;
  CGAffineTransformRotate(&v40, &v39, -v18);
  v19 = v40.tx + v16 * v40.c + v40.a * v17;
  v20 = v40.ty + v16 * v40.d + v40.b * v17;
  v32 = v14;
  v21 = v40.tx + (y - v14) * v40.c + v40.a * (x - v13);
  v22 = v40.ty + (y - v14) * v40.d + v40.b * (x - v13);
  v23 = v19 == v21 && v20 == v22;
  v24 = 0.0;
  if (!v23)
    v24 = 3.14159265 - fabs(atan2(v22 - v20, v21 - v19));
  v25 = sin(v24 * 0.5);
  v31 = v13;
  if (v25 == 0.0)
  {
    v26 = 0.0;
    v27 = v20;
    v28 = 0.0;
    v29 = 0.0;
  }
  else
  {
    v19 = v19 - v30 * fabs(cos(v24 * 0.5) / v25);
    if (v22 <= v20)
    {
      v27 = -v30;
      v29 = v24 + -1.57079633;
      v26 = 1.57079633;
    }
    else
    {
      v29 = 1.57079633 - v24;
      v26 = -1.57079633;
      v27 = v30;
    }
    v28 = v30;
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tx = v34;
  v39.ty = v33;
  CGAffineTransformRotate(&v40, &v39, v18);
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v22 <= v20, v31 + v40.tx + v27 * v40.c + v40.a * v19, v32 + v40.ty + v27 * v40.d + v40.b * v19, v28, (v18 + v26) * 180.0 / 3.14159265, (v18 + v29) * 180.0 / 3.14159265);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  const CGPath *sfr_path;
  BOOL v7;
  CGPoint v9;

  y = a3.y;
  x = a3.x;
  if ((containsPoint__doWindingRule & 1) == 0)
    containsPoint__doWindingRule = 1;
  -[OITSUBezierPath _doPath](self, "_doPath");
  sfr_path = (const CGPath *)self->sfr_path;
  if (!sfr_path)
    return 0;
  v7 = -[OITSUBezierPath windingRule](self, "windingRule") == 1;
  v9.x = x;
  v9.y = y;
  return CGPathContainsPoint(sfr_path, 0, v9, v7);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v11;
  float64x2_t *sfr_extraSegments;
  NSUInteger v13;
  char *v14;
  char *v15;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  int64_t sfr_dashedLineCount;
  double *sfr_dashedLinePattern;
  _DWORD *v22;
  double v23;
  unsigned int v24;
  float sfr_lineWidth;
  double sfr_flatness;
  float sfr_miterLimit;
  float v28;
  int64_t v29;
  PATHSEGMENT *v30;
  PATHSEGMENT *v31;
  double *v32;
  uint64_t v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float sfr_dashedLinePhase;
  int64_t v41;
  float v42;
  float v43;
  float v44;
  char v45;
  float v46;
  float v47;
  float v48;
  float v49;
  int v50;
  int v51;
  int v52;
  float v53;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = -[OITSUBezierPath windingRule](self, "windingRule");
    v6 = -[OITSUBezierPath lineCapStyle](self, "lineCapStyle");
    v7 = -[OITSUBezierPath lineJoinStyle](self, "lineJoinStyle");
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      v11 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
      v13 = 9 * (sfr_elementCount + 2 * self->sfr_extraSegmentCount);
      v14 = (char *)NSZoneMalloc((NSZone *)-[OITSUBezierPath zone](self, "zone"), v13);
      v15 = v14;
      do
      {
        v16 = *(_QWORD *)sfr_head;
        if ((*(_QWORD *)sfr_head & 0xFLL) == 2)
        {
          *v15 = 2;
          *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*sfr_extraSegments));
          v15[9] = 2;
          *(int8x8_t *)(v15 + 10) = vrev32_s8((int8x8_t)vcvt_f32_f64(sfr_extraSegments[1]));
          v15 += 18;
          sfr_extraSegments += 2;
          v16 = *(_QWORD *)sfr_head;
        }
        *v15 = v16 & 0xF;
        *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*(float64x2_t *)&sfr_head[2]));
        v15 += 9;
        sfr_head += 6;
      }
      while (sfr_head < v11);
      objc_msgSend(a3, "encodeBytes:length:forKey:", v14, v13, CFSTR("TSUSegments"));
      NSZoneFree((NSZone *)-[OITSUBezierPath zone](self, "zone"), v14);
    }
    if (v5)
    {
      *(float *)&v8 = (float)v5;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("TSUWindingRule"), v8);
    }
    if (v6)
    {
      *(float *)&v8 = (float)v6;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("TSUCapStyle"), v8);
    }
    if (v7)
    {
      *(float *)&v8 = (float)v7;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("TSUJoinStyle"), v8);
    }
    if (self->sfr_lineWidth != 1.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TSULineWidth"));
    if (self->sfr_miterLimit != 10.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TSUMiterLimit"));
    if (self->sfr_flatness != 0.6)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TSUFlatness"));
    if (self->sfr_dashedLineCount)
    {
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TSUDashPhase"), self->sfr_dashedLinePhase);
      v17 = 4 * self->sfr_dashedLineCount;
      v18 = NSZoneMalloc((NSZone *)-[OITSUBezierPath zone](self, "zone"), v17);
      v19 = v18;
      sfr_dashedLineCount = self->sfr_dashedLineCount;
      if (sfr_dashedLineCount >= 1)
      {
        sfr_dashedLinePattern = self->sfr_dashedLinePattern;
        v22 = v18;
        do
        {
          v23 = *sfr_dashedLinePattern++;
          *(float *)&v24 = v23;
          *v22++ = bswap32(v24);
          --sfr_dashedLineCount;
        }
        while (sfr_dashedLineCount);
      }
      objc_msgSend(a3, "encodeBytes:length:forKey:", v18, v17, CFSTR("TSUDashPatterns"));
      NSZoneFree((NSZone *)-[OITSUBezierPath zone](self, "zone"), v19);
    }
  }
  else
  {
    v53 = (float)(self->sfr_elementCount + 2 * self->sfr_extraSegmentCount);
    v52 = -[OITSUBezierPath windingRule](self, "windingRule");
    v51 = -[OITSUBezierPath lineCapStyle](self, "lineCapStyle");
    v50 = -[OITSUBezierPath lineJoinStyle](self, "lineJoinStyle");
    sfr_lineWidth = self->sfr_lineWidth;
    sfr_flatness = self->sfr_flatness;
    sfr_miterLimit = self->sfr_miterLimit;
    v48 = sfr_miterLimit;
    v49 = sfr_lineWidth;
    v28 = sfr_flatness;
    v46 = (float)self->sfr_dashedLineCount;
    v47 = v28;
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v53);
    v29 = self->sfr_elementCount;
    if (v29 >= 1)
    {
      v30 = self->sfr_head;
      v31 = &v30[6 * v29];
      v32 = (double *)self->sfr_extraSegments;
      do
      {
        v33 = *(_QWORD *)v30;
        v45 = *(_BYTE *)v30 & 0xF;
        if ((v33 & 0xF) == 2)
        {
          v34 = *v32;
          v35 = v32[1];
          v43 = v35;
          v44 = v34;
          objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v45, &v44, &v43);
          v36 = v32[2];
          v37 = v32[3];
          v43 = v37;
          v44 = v36;
          objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v45, &v44, &v43);
          v32 += 4;
        }
        v38 = *(double *)&v30[2];
        v39 = *(double *)&v30[4];
        v43 = v39;
        v44 = v38;
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v45, &v44, &v43);
        v30 += 6;
      }
      while (v30 < v31);
    }
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iiifffi", &v52, &v51, &v50, &v49, &v48, &v47, &v46);
    if (self->sfr_dashedLineCount)
    {
      sfr_dashedLinePhase = self->sfr_dashedLinePhase;
      v44 = sfr_dashedLinePhase;
      objc_msgSend(a3, "encodeValueOfObjCType:at:", "f", &v44);
      if ((uint64_t)self->sfr_dashedLineCount >= 1)
      {
        v41 = 0;
        do
        {
          v42 = self->sfr_dashedLinePattern[v41];
          v44 = v42;
          objc_msgSend(a3, "encodeValueOfObjCType:at:", "f", &v44);
          ++v41;
        }
        while (v41 < (int64_t)self->sfr_dashedLineCount);
      }
    }
  }
}

- (OITSUBezierPath)initWithCoder:(id)a3
{
  OITSUBezierPath *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  float64x2_t v8;
  int v9;
  double v10;
  int v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unsigned int *v21;
  unint64_t v22;
  double v23;
  double *v24;
  unsigned int v25;
  float sfr_lineWidth;
  double sfr_flatness;
  float sfr_miterLimit;
  float v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  float v34;
  float sfr_dashedLineCount;
  float v36;
  float v37;
  float v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  char v42;
  unint64_t v43;

  v4 = -[OITSUBezierPath init](self, "init");
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v43 = 0;
    v5 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("TSUSegments"), &v43);
    if (v5)
    {
      if (v43)
      {
        v6 = v5 + v43;
        if (v5 < v5 + v43)
        {
          do
          {
            v7 = v5 + 9;
            v8 = vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v5 + 1)));
            switch(*(_BYTE *)v5)
            {
              case 0:
                -[OITSUBezierPath moveToPoint:](v4, "moveToPoint:", *(_OWORD *)&v8);
                break;
              case 1:
                -[OITSUBezierPath lineToPoint:](v4, "lineToPoint:", *(_OWORD *)&v8);
                break;
              case 2:
                v7 = v5 + 27;
                -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v5 + 19))), *(_OWORD *)&v8, vcvtq_f64_f32((float32x2_t)vrev32_s8(*(int8x8_t *)(v5 + 10))));
                break;
              case 3:
                -[OITSUBezierPath closePath](v4, "closePath");
                break;
              default:
                break;
            }
            v5 = v7;
          }
          while (v7 < v6);
        }
      }
    }
    -[OITSUBezierPath setWindingRule:](v4, "setWindingRule:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("TSUWindingRule")));
    -[OITSUBezierPath setLineCapStyle:](v4, "setLineCapStyle:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("TSUCapStyle")));
    -[OITSUBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("TSUJoinStyle")));
    v9 = objc_msgSend(a3, "containsValueForKey:", CFSTR("TSULineWidth"));
    v10 = 1.0;
    if (v9)
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TSULineWidth"), 1.0);
    v4->sfr_lineWidth = v10;
    v11 = objc_msgSend(a3, "containsValueForKey:", CFSTR("TSUMiterLimit"));
    v12 = 10.0;
    if (v11)
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TSUMiterLimit"), 10.0);
    v4->sfr_miterLimit = v12;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("TSUFlatness")))
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TSUFlatness"));
    else
      v13 = 0x3FE3333333333333;
    *(_QWORD *)&v4->sfr_flatness = v13;
    v20 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("TSUDashPatterns"), &v43);
    if (v20 && v43)
    {
      v21 = (unsigned int *)v20;
      v22 = v20 + v43;
      v4->sfr_dashedLineCount = v43 >> 2;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TSUDashPhase"));
      v4->sfr_dashedLinePhase = v23;
      v24 = (double *)NSZoneMalloc((NSZone *)-[OITSUBezierPath zone](v4, "zone"), 8 * v4->sfr_dashedLineCount);
      v4->sfr_dashedLinePattern = v24;
      while ((unint64_t)v21 < v22)
      {
        v25 = *v21++;
        *v24++ = COERCE_FLOAT(bswap32(v25));
      }
    }
  }
  else
  {
    LODWORD(v43) = 0;
    v42 = 0;
    v41 = 0.0;
    v39 = 0;
    v40 = 0;
    v14 = objc_msgSend(a3, "versionForClassName:", CFSTR("TSUBezierPath"));
    objc_msgSend(a3, "decodeValueOfObjCType:at:", "i", &v43);
    if ((_DWORD)v43)
    {
      v15 = 0;
      do
      {
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v42, &v41, (char *)&v40 + 4);
        v16 = v41;
        v17 = *((float *)&v40 + 1);
        switch(v42)
        {
          case 0:
            -[OITSUBezierPath moveToPoint:](v4, "moveToPoint:", v41, *((float *)&v40 + 1));
            break;
          case 1:
            -[OITSUBezierPath lineToPoint:](v4, "lineToPoint:", v41, *((float *)&v40 + 1));
            break;
          case 2:
            objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v42, &v41, (char *)&v40 + 4);
            v18 = v41;
            v19 = *((float *)&v40 + 1);
            objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v42, &v41, (char *)&v40 + 4);
            v15 += 2;
            -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", v41, *((float *)&v40 + 1), v16, v17, v18, v19);
            break;
          case 3:
            -[OITSUBezierPath closePath](v4, "closePath");
            break;
          default:
            break;
        }
        ++v15;
      }
      while (v15 < v43);
    }
    if (v14 > 523)
    {
      sfr_lineWidth = v4->sfr_lineWidth;
      sfr_flatness = v4->sfr_flatness;
      sfr_miterLimit = v4->sfr_miterLimit;
      v37 = sfr_miterLimit;
      v38 = sfr_lineWidth;
      v29 = sfr_flatness;
      sfr_dashedLineCount = (float)v4->sfr_dashedLineCount;
      v36 = v29;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "iiifffi", &v40, &v39, (char *)&v39 + 4, &v38, &v37, &v36, &sfr_dashedLineCount);
      -[OITSUBezierPath setWindingRule:](v4, "setWindingRule:", v40);
      -[OITSUBezierPath setLineCapStyle:](v4, "setLineCapStyle:", v39);
      -[OITSUBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", HIDWORD(v39));
      v4->sfr_lineWidth = v38;
      v30 = v36;
      v4->sfr_miterLimit = v37;
      v4->sfr_flatness = v30;
      v31 = (unint64_t)sfr_dashedLineCount;
      v4->sfr_dashedLineCount = (unint64_t)sfr_dashedLineCount;
      if (v31)
      {
        v34 = 0.0;
        objc_msgSend(a3, "decodeValueOfObjCType:at:", "f", &v34);
        v4->sfr_dashedLinePhase = v34;
        v4->sfr_dashedLinePattern = (double *)NSZoneMalloc((NSZone *)-[OITSUBezierPath zone](v4, "zone"), 8 * v4->sfr_dashedLineCount);
        if (v4->sfr_dashedLineCount)
        {
          v32 = 0;
          do
          {
            objc_msgSend(a3, "decodeValueOfObjCType:at:", "f", &v34);
            v4->sfr_dashedLinePattern[v32++] = v34;
          }
          while (v32 < v4->sfr_dashedLineCount);
        }
      }
    }
    else
    {
      v38 = 0.0;
      LOBYTE(v37) = 0;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "iiifc", &v40, &v39, (char *)&v39 + 4, &v38, &v37);
      v4->sfr_lineWidth = v38;
      -[OITSUBezierPath setWindingRule:](v4, "setWindingRule:", v40);
      -[OITSUBezierPath setLineCapStyle:](v4, "setLineCapStyle:", v39);
      -[OITSUBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", HIDWORD(v39));
    }
  }
  return v4;
}

- (const)cString
{
  void *v3;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  char *v8;
  size_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  _BYTE v15[271];

  *(_QWORD *)&v15[255] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    while (2)
    {
      if (sfr_head == self->sfr_head)
      {
        v8 = &v14;
        v9 = 256;
      }
      else
      {
        v14 = 32;
        v8 = v15;
        v9 = 255;
      }
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          v10 = snprintf(v8, v9, "M %f %f");
          goto LABEL_12;
        case 1:
          v10 = snprintf(v8, v9, "L %f %f");
          goto LABEL_12;
        case 2:
          v10 = snprintf(v8, v9, "C %f %f %f %f %f %f", *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          sfr_extraSegments += 4;
          goto LABEL_12;
        case 3:
          *v8 = 90;
          v10 = 1;
LABEL_12:
          if (v10 < 1 || v10 >= (int)v9)
            goto LABEL_17;
          objc_msgSend(v3, "appendBytes:length:", &v14, &v8[v10] - &v14);
          sfr_head += 6;
          if (sfr_head >= v6)
            break;
          continue;
        default:
          v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath cString]");
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"), 2364, 0, "Unhandled path element type");
          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_17:
          v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath cString]");
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"), 2372, 0, "buffer too small for path element string");
          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
          goto LABEL_18;
      }
      break;
    }
  }
LABEL_18:
  v14 = 0;
  objc_msgSend(v3, "appendBytes:length:", &v14, 1);
  return (const char *)objc_msgSend(v3, "bytes");
}

- (OITSUBezierPath)initWithCString:(const char *)a3
{
  OITSUBezierPath *v4;
  OITSUBezierPath *v5;
  int v6;
  int v7;
  const char *v8;
  int v9;
  float v10;
  float v11;
  float v12;
  double v13;
  OITSUBezierPath *v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  uint64_t v35;
  uint64_t v37;
  char v38;
  int v39;

  v4 = -[OITSUBezierPath init](self, "init");
  v5 = v4;
  if (a3 && v4 && *a3)
  {
    v39 = 0;
    v38 = 0;
    while (1)
    {
      v6 = v39;
      v7 = a3[v39];
      if (v7 == 32)
      {
        v8 = &a3[v39 + 1];
        do
        {
          ++v6;
          v9 = *(unsigned __int8 *)v8++;
          v7 = v9;
        }
        while (v9 == 32);
      }
      v39 = v6 + 1;
      if (!v7)
        return v5;
      if ((char)v7 > 98)
      {
        if ((char)v7 > 108)
        {
          if ((char)v7 == 122)
            goto LABEL_29;
          if ((char)v7 == 113)
          {
LABEL_30:
            v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath initWithCString:]");
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"), 2416, 0, "kCGPathElementAddQuadCurveToPoint not supported yet");
            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
            scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
            v32 = v31;
            scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
            v34 = v33;
            scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
            scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
            v15 = v32;
            v13 = v34;
            v14 = v5;
            goto LABEL_31;
          }
          if ((char)v7 != 109)
          {
LABEL_35:
            v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath initWithCString:]");
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"), 2446, 0, "Bezier path string contained unknown elmt.");
            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_33:
            v35 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath initWithCString:]");
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"), 2452, 0, "Something is wrong with this bezier path!");
            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
            return v5;
          }
LABEL_27:
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          v17 = v16;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          -[OITSUBezierPath moveToPoint:](v5, "moveToPoint:", v17, v18);
          goto LABEL_32;
        }
        if ((char)v7 == 99)
        {
LABEL_28:
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          v20 = v19;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          v22 = v21;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          v24 = v23;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          v26 = v25;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          v28 = v27;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", v28, v29, v20, v22, v24, v26);
          goto LABEL_32;
        }
        if ((char)v7 != 101)
        {
          if ((char)v7 != 108)
            goto LABEL_35;
          goto LABEL_19;
        }
      }
      else
      {
        if ((char)v7 > 76)
        {
          if ((char)v7 != 77)
          {
            if ((char)v7 == 81)
              goto LABEL_30;
            if ((char)v7 != 90)
              goto LABEL_35;
LABEL_29:
            -[OITSUBezierPath closePath](v5, "closePath");
            goto LABEL_32;
          }
          goto LABEL_27;
        }
        if ((char)v7 == 67)
          goto LABEL_28;
        if ((char)v7 != 69)
        {
          if ((char)v7 != 76)
            goto LABEL_35;
LABEL_19:
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          v11 = v10;
          scanSpaceThenFloat((uint64_t)a3, &v39, &v38);
          v13 = v12;
          v14 = v5;
          v15 = v11;
LABEL_31:
          -[OITSUBezierPath lineToPoint:](v14, "lineToPoint:", v15, v13);
        }
      }
LABEL_32:
      if (v38)
        goto LABEL_33;
    }
  }
  return v5;
}

- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  int64_t sfr_elementCount;
  PATHSEGMENT *v9;
  double *v10;
  int64_t v11;
  PATHSEGMENT *v12;
  void *sfr_path;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  double v15;

  y = a4.y;
  x = a4.x;
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount == self->sfr_elementMax)
  {
    self->sfr_elementMax = 2 * sfr_elementCount + 10;
    v9 = (PATHSEGMENT *)NSZoneRealloc((NSZone *)-[OITSUBezierPath zone](self, "zone"), self->sfr_head, 24 * self->sfr_elementMax);
    if (v9)
      self->sfr_head = v9;
    else
      NSLog((NSString *)CFSTR("ERROR: TSUBezierPath _addPathSegment. sfr_head could not NSZoneRealloc. No memory"));
    if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) != 0)
    {
      v10 = (double *)NSZoneRealloc((NSZone *)-[OITSUBezierPath zone](self, "zone"), self->sfr_elementLength, 8 * self->sfr_elementMax);
      if (v10)
        self->sfr_elementLength = v10;
      else
        NSLog((NSString *)CFSTR("ERROR: TSUBezierPath _addPathSegment. sfr_elementLength could not NSZoneRealloc. No memory"));
    }
  }
  *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] = *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] & 0xFFFFFFFFFFFFFFF0 | a3 & 0xF;
  *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] &= 0xFuLL;
  v11 = self->sfr_elementCount;
  v12 = &self->sfr_head[6 * v11];
  *(CGFloat *)&v12[2] = x;
  *(CGFloat *)&v12[4] = y;
  self->sfr_elementCount = v11 + 1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  sfr_bpFlags = self->sfr_bpFlags;
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
  if (a3 != 2 && (*(_WORD *)&sfr_bpFlags & 0x400) != 0)
  {
    -[OITSUBezierPath lengthOfElement:](self, "lengthOfElement:", self->sfr_elementCount - 1);
    self->sfr_elementLength[self->sfr_elementCount - 1] = v15;
    self->sfr_totalLength = v15 + self->sfr_totalLength;
  }
}

- (void)_deviceMoveToPoint:(CGPoint)a3
{
  int v4;
  PATHSEGMENT *sfr_head;
  int64_t v6;

  v4 = (*(_DWORD *)&self->sfr_bpFlags >> 8) & 3;
  if (v4 == 2)
  {
    sfr_head = self->sfr_head;
    v6 = self->sfr_elementCount - 1;
    if ((*(_BYTE *)&sfr_head[6 * v6] & 0xF) == 0)
      goto LABEL_6;
  }
  else if (v4 == 1)
  {
    sfr_head = self->sfr_head;
    v6 = self->sfr_elementCount - 1;
LABEL_6:
    *(CGPoint *)&sfr_head[6 * v6 + 2] = a3;
    goto LABEL_7;
  }
  -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, a3.x, a3.y);
  v6 = self->sfr_elementCount - 1;
LABEL_7:
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
  self->sfr_lastSubpathIndex = v6;
}

- (void)_deviceLineToPoint:(CGPoint)a3
{
  -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 1, a3.x, a3.y);
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
}

- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  int64_t sfr_extraSegmentCount;
  void *v11;
  int64_t v12;
  CGFloat *v13;
  PATHSEGMENT *v14;
  double v15;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 2, a3.x, a3.y);
  sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  if (sfr_extraSegmentCount == self->sfr_extraSegmentMax)
  {
    self->sfr_extraSegmentMax = 2 * sfr_extraSegmentCount + 10;
    v11 = NSZoneRealloc((NSZone *)-[OITSUBezierPath zone](self, "zone"), self->sfr_extraSegments, 32 * self->sfr_extraSegmentMax);
    if (v11)
      self->sfr_extraSegments = v11;
    else
      NSLog((NSString *)CFSTR("ERROR: TSUBezierPath _deviceCurveToPoint sfr_extraSegments could not NSZoneRealloc. No memory"));
  }
  v12 = self->sfr_extraSegmentCount;
  v13 = (CGFloat *)((char *)self->sfr_extraSegments + 32 * v12);
  *v13 = v8;
  v13[1] = v7;
  v13[2] = x;
  v13[3] = y;
  self->sfr_extraSegmentCount = v12 + 1;
  v14 = &self->sfr_head[6 * self->sfr_elementCount];
  *(_QWORD *)&v14[-6] = *(_QWORD *)&v14[-6] & 0xFLL | (16 * v12);
  LODWORD(v14) = self->sfr_bpFlags;
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(v14 & 0xFFFFFCFB | 0x200);
  if (((unsigned __int16)v14 & 0x400) != 0)
  {
    -[OITSUBezierPath lengthOfElement:](self, "lengthOfElement:", self->sfr_elementCount - 1);
    self->sfr_elementLength[self->sfr_elementCount - 1] = v15;
    self->sfr_totalLength = v15 + self->sfr_totalLength;
  }
}

- (void)_deviceClosePath
{
  int64_t sfr_lastSubpathIndex;
  uint64_t v4;
  PATHSEGMENT *v5;

  if ((*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x200)
  {
    sfr_lastSubpathIndex = self->sfr_lastSubpathIndex;
    if (sfr_lastSubpathIndex < 0)
    {
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath(TSUBezierPathDevicePrimitives) _deviceClosePath]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPath.m"), 2614, 0, "Invalid parameter not satisfying: %{public}s", "sfr_lastSubpathIndex >= 0");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      sfr_lastSubpathIndex = self->sfr_lastSubpathIndex;
    }
    -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 3, *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 2], *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 4]);
    v5 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[OITSUBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, *(double *)&v5[2], *(double *)&v5[4]);
    self->sfr_lastSubpathIndex = self->sfr_elementCount - 1;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x100);
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGRect v16;
  CGRect v17;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v3, "appendFormat:", CFSTR("TSUBezierPath <%p>"), self);
  if (!-[OITSUBezierPath isEmpty](self, "isEmpty"))
  {
    -[OITSUBezierPath bounds](self, "bounds");
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Bounds: %@"), NSStringFromCGRect(v16));
    -[OITSUBezierPath controlPointBounds](self, "controlPointBounds");
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Control point bounds: %@"), NSStringFromCGRect(v17));
    v4 = -[OITSUBezierPath elementCount](self, "elementCount");
    if (v4 >= 1)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        switch(-[OITSUBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v12))
        {
          case 0:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f moveto"), v12[0], v8, v9, v10, v11);
            break;
          case 1:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f lineto"), v12[0], v8, v9, v10, v11);
            break;
          case 2:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f %f %f %f %f curveto"), v12[0], v12[1], v13, v14);
            break;
          case 3:
            objc_msgSend(v3, "appendString:", CFSTR("\n    closepath"));
            break;
          default:
            continue;
        }
      }
    }
  }
  return v3;
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(int)a6 startNewPath:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  CGFloat MidY;
  CGFloat v32;
  CGFloat MidX;
  _BOOL4 v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v38;
  CGAffineTransform v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v34 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40 = *MEMORY[0x24BDAC8D0];
  MidX = CGRectGetMidX(a3);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  MidY = CGRectGetMidY(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v14 = CGRectGetWidth(v42) * 0.5;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v15 = CGRectGetHeight(v43) * 0.5;
  if (a6 == 1)
  {
    TSUEllipseParametricAngleWithPolarAngle(a4, v14, v15);
    v16 = v18;
    TSUEllipseParametricAngleWithPolarAngle(a4 + a5, v14, v15);
    v17 = v19;
  }
  else
  {
    if (a6)
      v16 = 0.0;
    else
      v16 = a4;
    if (a6)
      v17 = 0.0;
    else
      v17 = a4 + a5;
  }
  v20 = +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath", *(_QWORD *)&MidY);
  objc_msgSend(v20, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v16 > v17, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0, v16, v17);
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeScale(&t1, v14, v15);
  CGAffineTransformMakeTranslation(&t2, MidX, v32);
  CGAffineTransformConcat(&v38, &t1, &t2);
  v39 = v38;
  objc_msgSend(v20, "transformUsingAffineTransform:", &v39);
  v21 = objc_msgSend(v20, "elementCount");
  if (v21 >= 1)
  {
    v22 = v21;
    for (i = 0; i != v22; ++i)
    {
      memset(&v39, 0, sizeof(v39));
      switch(objc_msgSend(v20, "elementAtIndex:associatedPoints:", i, &v39))
      {
        case 0:
          if (i)
          {
            v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath(TSUAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPathAdditions.m"), 104, 0, "Only the first element of the arc should be a moveto");
            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
          }
          if (v34)
            -[OITSUBezierPath moveToPoint:](self, "moveToPoint:", *(_OWORD *)&v39.a);
          else
            -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v39.a);
          break;
        case 1:
          v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath(TSUAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
          v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPathAdditions.m");
          v27 = v25;
          v28 = 112;
          v29 = "The arc shouldn't contain lineto elements";
          goto LABEL_19;
        case 2:
          -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", *(_OWORD *)&v39.tx, *(_OWORD *)&v39.a, *(_OWORD *)&v39.c);
          break;
        case 3:
          v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath(TSUAdditions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
          v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPathAdditions.m");
          v27 = v30;
          v28 = 118;
          v29 = "The arc shouldn't contain close_subpath elements";
LABEL_19:
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v26, v28, 0, v29);
          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
          break;
        default:
          continue;
      }
    }
  }
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startRadialVector:(CGPoint)a4 endRadialVector:(CGPoint)a5 angleSign:(int)a6 startNewPath:(BOOL)a7
{
  _BOOL8 v7;
  double x;
  double v10;
  double v11;
  CGFloat height;
  CGFloat width;
  CGFloat v14;
  CGFloat v15;
  double MidX;
  double MidY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double i;
  uint64_t v25;
  CGFloat v26;
  double y;
  CGRect v28;

  v7 = a7;
  y = a5.y;
  x = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v14 = a3.origin.y;
  v15 = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v28.origin.x = v15;
  v28.origin.y = v14;
  v26 = height;
  v28.size.width = width;
  v28.size.height = height;
  MidY = CGRectGetMidY(v28);
  v19 = atan2(v10 - MidY, v11 - MidX) * 180.0 / 3.14159265;
  v20 = atan2(y - MidY, x - MidX) * 180.0 / 3.14159265;
  if (a6)
  {
    if (a6 == 1)
    {
      if (v19 < v20)
      {
        v21 = width;
        v22 = v26;
        v23 = v15;
        i = v14;
        do
          v19 = v19 + 360.0;
        while (v19 < v20);
        goto LABEL_12;
      }
    }
    else
    {
      v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUBezierPath(TSUAdditions) appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBezierPathAdditions.m"), 141, 0, "Unexpected angle sign");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    v21 = width;
    v22 = v26;
    v23 = v15;
    i = v14;
    goto LABEL_12;
  }
  v21 = width;
  v22 = v26;
  v23 = v15;
  for (i = v14; v20 < v19; v20 = v20 + 360.0)
    ;
LABEL_12:
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](self, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, v7, v23, i, v21, v22, v19, v20 - v19);
}

- (void)attachBezierPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  double v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "elementCount");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = (__int128 *)MEMORY[0x24BDBEFB0];
    do
    {
      v10 = *v7;
      v11 = v10;
      v12 = v10;
      switch(objc_msgSend(v4, "elementAtIndex:associatedPoints:", v6, &v10))
      {
        case 0:
          if (v6
            || -[OITSUBezierPath isEmpty](self, "isEmpty")
            || (-[OITSUBezierPath currentPoint](self, "currentPoint"), vabdd_f64(v9, *(double *)&v10) >= 0.001)
            || vabdd_f64(v8, *((double *)&v10 + 1)) >= 0.001)
          {
            -[OITSUBezierPath moveToPoint:](self, "moveToPoint:", v10);
          }
          break;
        case 1:
          -[OITSUBezierPath lineToPoint:](self, "lineToPoint:", v10);
          break;
        case 2:
          -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v12, v10, v11);
          break;
        case 3:
          -[OITSUBezierPath closePath](self, "closePath");
          break;
        default:
          break;
      }
      ++v6;
    }
    while (v5 != v6);
  }

}

@end
