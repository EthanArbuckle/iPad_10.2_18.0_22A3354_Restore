@implementation CRLWPAdornmentLine

- (CRLWPAdornmentLine)initWithStart:(CGPoint)a3 length:(double)a4 color:(CGColor *)a5 thickness:(double)a6 lineCount:(unint64_t)a7 underline:(int64_t)a8 adornmentLocation:(int)a9 underLineAdjustment:(double)a10 isWhitespace:(BOOL)a11 renderingDelegate:(id)a12 allowAntialiasing:(BOOL)a13
{
  CGFloat y;
  CGFloat x;
  id v25;
  CRLWPAdornmentLine *v26;
  CRLWPAdornmentLine *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  int v34;
  objc_super v35;

  y = a3.y;
  x = a3.x;
  v25 = a12;
  v35.receiver = self;
  v35.super_class = (Class)CRLWPAdornmentLine;
  v26 = -[CRLWPAdornmentLine init](&v35, "init");
  v27 = v26;
  if (v26)
  {
    v26->_start.x = x;
    v26->_start.y = y;
    v26->_length = a4;
    if (a5)
      v26->_color = CGColorRetain(a5);
    if (a7 >= 3)
    {
      v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B1B0);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2FB9C(v34, v28);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B1D0);
      v29 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v29, v34);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornmentLine initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:]"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentLine.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 34, 0, "Illegal line count");

    }
    v27->_thickness = a6;
    v32 = 2;
    if (a7 < 2)
      v32 = a7;
    v27->_lineCount = v32;
    v27->_underline = a8;
    v27->_adornmentLocation = a9;
    v27->_underlineAdjustment = a10;
    v27->_isWhitespace = a11;
    objc_storeStrong((id *)&v27->_renderingDelegate, a12);
    v27->_allowAntialiasing = a13;
  }

  return v27;
}

- (CRLWPAdornmentLine)initWithStart:(CGPoint)a3 length:(double)a4 color:(CGColor *)a5 thickness:(double)a6 lineCount:(unint64_t)a7 underline:(int64_t)a8 adornmentLocation:(int)a9 underLineAdjustment:(double)a10
{
  uint64_t v11;

  LOBYTE(v11) = 0;
  return -[CRLWPAdornmentLine initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:](self, "initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:", a5, a7, a8, *(_QWORD *)&a9, 0, 0, a3.x, a3.y, a4, a6, a10, v11);
}

- (void)dealloc
{
  CGColor *color;
  objc_super v4;

  color = self->_color;
  if (color)
    CGColorRelease(color);
  v4.receiver = self;
  v4.super_class = (Class)CRLWPAdornmentLine;
  -[CRLWPAdornmentLine dealloc](&v4, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLWPAdornmentLine *v4;
  uint64_t v6;

  v4 = [CRLWPAdornmentLine alloc];
  LOBYTE(v6) = self->_allowAntialiasing;
  return -[CRLWPAdornmentLine initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:](v4, "initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:", self->_color, self->_lineCount, self->_underline, self->_adornmentLocation, self->_isWhitespace, self->_renderingDelegate, self->_start.x, self->_start.y, self->_length, self->_thickness, self->_underlineAdjustment, v6);
}

- (id)copyWithColor:(CGColor *)a3
{
  _QWORD *v4;
  CGColorRef v5;
  void *v6;

  v4 = -[CRLWPAdornmentLine copy](self, "copy");
  if (a3)
    v5 = CGColorRetain(a3);
  else
    v5 = 0;
  v4[2] = v5;
  v6 = (void *)v4[8];
  v4[8] = 0;

  return v4;
}

- (void)setStart:(CGPoint)a3
{
  self->_start = a3;
}

- (CGColor)color
{
  CRLWPAdornmentLineRenderingDelegate *renderingDelegate;

  renderingDelegate = self->_renderingDelegate;
  if (renderingDelegate)
    return (CGColor *)-[CRLWPAdornmentLineRenderingDelegate cgColor](renderingDelegate, "cgColor");
  else
    return self->_color;
}

- (BOOL)merge:(id)a3
{
  id v4;
  double *v5;
  double y;
  double x;
  double v8;
  double v9;
  int64_t underline;
  unsigned int v11;
  double v12;
  double thickness;
  double v14;
  BOOL v15;
  double v17;

  v4 = a3;
  v5 = (double *)v4;
  if (*((_QWORD *)v4 + 5) != self->_lineCount)
    goto LABEL_15;
  x = self->_start.x;
  y = self->_start.y;
  v9 = *((double *)v4 + 9);
  v8 = *((double *)v4 + 10);
  underline = self->_underline;
  if (!CGColorEqualToColor(self->_color, *((CGColorRef *)v4 + 2)))
    goto LABEL_15;
  if (objc_msgSend(v5, "underline") != (id)self->_underline)
    goto LABEL_15;
  v11 = objc_msgSend(v5, "adornmentLocation");
  if (v11 != self->_adornmentLocation)
    goto LABEL_15;
  if (!underline)
  {
    thickness = self->_thickness;
    v14 = v5[4];
    if (thickness != v14 && vabdd_f64(thickness, v14) >= 0.00999999978)
      goto LABEL_15;
    if (y != v8 && vabdd_f64(y, v8) >= 0.00999999978)
      goto LABEL_15;
  }
  if ((CRLWPAdornmentLineRenderingDelegate *)*((_QWORD *)v5 + 8) != self->_renderingDelegate)
  {
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  self->_length = v9 - x + v5[3];
  if (!underline)
    goto LABEL_18;
  if (!self->_isWhitespace)
  {
    if (*((_BYTE *)v5 + 8))
      goto LABEL_23;
    goto LABEL_18;
  }
  if (*((_BYTE *)v5 + 8))
  {
LABEL_18:
    if (v11 == 1)
      v17 = fmin(y, v8);
    else
      v17 = fmax(y, v8);
    self->_start.y = v17;
    v12 = fmax(self->_thickness, v5[4]);
    goto LABEL_22;
  }
  self->_start.y = v8;
  v12 = v5[4];
LABEL_22:
  self->_thickness = v12;
LABEL_23:
  if (self->_isWhitespace && !*((_BYTE *)v5 + 8))
    self->_isWhitespace = 0;
  v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)shouldRenderForLineDrawFlags:(unint64_t)a3
{
  CRLWPAdornmentLineRenderingDelegate *renderingDelegate;

  renderingDelegate = self->_renderingDelegate;
  if (renderingDelegate)
    return -[CRLWPAdornmentLineRenderingDelegate shouldRenderForLineDrawFlags:](renderingDelegate, "shouldRenderForLineDrawFlags:", a3);
  else
    return 1;
}

- (CGPoint)start
{
  double x;
  double y;
  CGPoint result;

  x = self->_start.x;
  y = self->_start.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)length
{
  return self->_length;
}

- (double)thickness
{
  return self->_thickness;
}

- (unint64_t)lineCount
{
  return self->_lineCount;
}

- (int64_t)underline
{
  return self->_underline;
}

- (int)adornmentLocation
{
  return self->_adornmentLocation;
}

- (double)underlineAdjustment
{
  return self->_underlineAdjustment;
}

- (BOOL)isWhitespace
{
  return self->_isWhitespace;
}

- (BOOL)allowAntialiasing
{
  return self->_allowAntialiasing;
}

- (CRLWPAdornmentLineRenderingDelegate)renderingDelegate
{
  return self->_renderingDelegate;
}

- (void)setRenderingDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_renderingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingDelegate, 0);
}

@end
