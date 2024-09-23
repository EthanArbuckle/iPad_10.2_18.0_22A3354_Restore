@implementation SUScriptCanvasContext

- (SUScriptCanvasContext)initWithWidth:(double)a3 height:(double)a4
{
  SUScriptCanvasContext *v6;
  CGColorSpace *DeviceRGB;
  double v8;
  float v9;
  CGContext *context;
  CGAffineTransform v12;

  v6 = -[SUScriptObject init](self, "init");
  if (!v6)
    return v6;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    v6->_scale = v8;
    v9 = v8 * a4;
    a4 = ceilf(v9);
    *(float *)&v8 = v8 * a3;
    a3 = ceilf(*(float *)&v8);
    context = CGBitmapContextCreate(0, vcvtps_u32_f32(*(float *)&v8), vcvtps_u32_f32(v9), 8uLL, (vcvtd_n_u64_f64(a3, 3uLL) + 31) & 0xFFFFFFFFFFFFFFE0, DeviceRGB, 0x2002u);
    v6->_context = context;
    if (context)
      goto LABEL_4;
LABEL_8:

    v6 = 0;
    if (!DeviceRGB)
      return v6;
    goto LABEL_5;
  }
  context = v6->_context;
  if (!context)
    goto LABEL_8;
LABEL_4:
  CGContextSetShouldAntialias(context, 1);
  CGContextSetFillColorSpace(v6->_context, DeviceRGB);
  CGContextTranslateCTM(v6->_context, 0.0, a4);
  CGContextScaleCTM(v6->_context, v6->_scale, -v6->_scale);
  CGContextGetCTM(&v12, v6->_context);
  CGContextSetBaseCTM();
  v6->_contextPath = CGPathCreateMutable();
  v6->_height = a4;
  v6->_width = a3;
  if (DeviceRGB)
LABEL_5:
    CGColorSpaceRelease(DeviceRGB);
  return v6;
}

- (void)dealloc
{
  CGContext *context;
  CGPath *contextPath;
  objc_super v5;

  context = self->_context;
  if (context)
    CGContextRelease(context);
  contextPath = self->_contextPath;
  if (contextPath)
    CGPathRelease(contextPath);

  v5.receiver = self;
  v5.super_class = (Class)SUScriptCanvasContext;
  -[SUScriptObject dealloc](&v5, sel_dealloc);
}

- (void)arcToX1:(double)a3 y1:(double)a4 x2:(double)a5 y2:(double)a6 radius:(double)a7
{
  CGAffineTransform v13;

  -[SUScriptObject lock](self, "lock");
  memset(&v13, 0, sizeof(v13));
  CGContextGetCTM(&v13, self->_context);
  CGPathAddArcToPoint(self->_contextPath, &v13, a3, a4, a5, a6, a7);
  CGContextAddArcToPoint(self->_context, a3, a4, a5, a6, a7);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)arcWithX:(double)a3 y:(double)a4 radius:(double)a5 startAngle:(double)a6 endAngle:(double)a7 antiClockwise:(BOOL)a8
{
  int v8;
  CGAffineTransform v15;

  v8 = a8;
  -[SUScriptObject lock](self, "lock");
  memset(&v15, 0, sizeof(v15));
  CGContextGetCTM(&v15, self->_context);
  v8 ^= 1u;
  CGPathAddArc(self->_contextPath, &v15, a3, a4, a5, a6, a7, v8);
  CGContextAddArc(self->_context, a3, a4, a5, a6, a7, v8);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)beginPath
{
  CGPath *contextPath;

  -[SUScriptObject lock](self, "lock");
  CGContextBeginPath(self->_context);
  contextPath = self->_contextPath;
  if (contextPath)
  {
    CGPathRelease(contextPath);
    self->_contextPath = CGPathCreateMutable();
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (void)bezierCurveToCP1X:(double)a3 cp1y:(double)a4 cp2x:(double)a5 cp2y:(double)a6 x:(double)a7 y:(double)a8
{
  CGAffineTransform v15;

  -[SUScriptObject lock](self, "lock");
  memset(&v15, 0, sizeof(v15));
  CGContextGetCTM(&v15, self->_context);
  CGPathAddCurveToPoint(self->_contextPath, &v15, a3, a4, a5, a6, a7, a8);
  CGContextAddCurveToPoint(self->_context, a3, a4, a5, a6, a7, a8);
  -[SUScriptObject unlock](self, "unlock");
}

- (id)copyCanvasImage
{
  CGContext *context;
  CGImageRef Image;
  CGImage *v5;
  void *v6;

  -[SUScriptObject lock](self, "lock");
  context = self->_context;
  if (context && (Image = CGBitmapContextCreateImage(context)) != 0)
  {
    v5 = Image;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", Image, 0, self->_scale);
    CGImageRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  -[SUScriptObject unlock](self, "unlock");
  return v6;
}

- (CGPath)copyCanvasPath
{
  CGPath *contextPath;
  CGAffineTransform v5;

  -[SUScriptObject lock](self, "lock");
  contextPath = self->_contextPath;
  if (contextPath)
  {
    memset(&v5, 0, sizeof(v5));
    CGAffineTransformMakeScale(&v5, 1.0 / self->_scale, 1.0 / self->_scale);
    contextPath = (CGPath *)MEMORY[0x220762BD8](contextPath, &v5);
  }
  -[SUScriptObject unlock](self, "unlock");
  return contextPath;
}

- (void)clearRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  CGRect v11;

  -[SUScriptObject lock](self, "lock");
  v11.origin.x = a3;
  v11.origin.y = a4;
  v11.size.width = a5;
  v11.size.height = a6;
  CGContextClearRect(self->_context, v11);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)clip
{
  -[SUScriptObject lock](self, "lock");
  CGContextClip(self->_context);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)closePath
{
  -[SUScriptObject lock](self, "lock");
  CGPathCloseSubpath(self->_contextPath);
  CGContextClosePath(self->_context);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)fill
{
  int64_t fillStyleType;
  void *v4;
  uint64_t v5;
  CGShading *v6;

  -[SUScriptObject lock](self, "lock");
  fillStyleType = self->_fillStyleType;
  if (fillStyleType == 1)
  {
    v4 = (void *)objc_msgSend(self->_fillStyle, "copyNativeGradient");
    v5 = objc_msgSend(v4, "copyShading");
    if (v5)
    {
      v6 = (CGShading *)v5;
      CGContextSaveGState(self->_context);
      CGContextClip(self->_context);
      CGContextDrawShading(self->_context, v6);
      CGContextRestoreGState(self->_context);
      CGShadingRelease(v6);
    }

  }
  else if (!fillStyleType)
  {
    CGContextFillPath(self->_context);
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (void)fillRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  int64_t fillStyleType;
  void *v12;
  uint64_t v13;
  CGShading *v14;
  CGRect v15;
  CGRect v16;

  -[SUScriptObject lock](self, "lock");
  fillStyleType = self->_fillStyleType;
  if (fillStyleType == 1)
  {
    v12 = (void *)objc_msgSend(self->_fillStyle, "copyNativeGradient");
    v13 = objc_msgSend(v12, "copyShading");
    if (v13)
    {
      v14 = (CGShading *)v13;
      CGContextSaveGState(self->_context);
      v16.origin.x = a3;
      v16.origin.y = a4;
      v16.size.width = a5;
      v16.size.height = a6;
      CGContextClipToRect(self->_context, v16);
      CGContextDrawShading(self->_context, v14);
      CGContextRestoreGState(self->_context);
      CGShadingRelease(v14);
    }

  }
  else if (!fillStyleType)
  {
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    CGContextFillRect(self->_context, v15);
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (BOOL)isPointInPathWithX:(double)a3 y:(double)a4
{
  BOOL v7;
  CGPoint v9;

  -[SUScriptObject lock](self, "lock");
  v9.x = a3;
  v9.y = a4;
  v7 = CGContextPathContainsPoint(self->_context, v9, kCGPathStroke);
  -[SUScriptObject unlock](self, "unlock");
  return v7;
}

- (void)lineToX:(double)a3 y:(double)a4
{
  CGAffineTransform v7;

  -[SUScriptObject lock](self, "lock");
  memset(&v7, 0, sizeof(v7));
  CGContextGetCTM(&v7, self->_context);
  CGPathAddLineToPoint(self->_contextPath, &v7, a3, a4);
  CGContextAddLineToPoint(self->_context, a3, a4);
  -[SUScriptObject unlock](self, "unlock");
}

- (id)makeLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  return -[SUScriptGradient initLinearGradientWithX0:y0:x1:y1:]([SUScriptGradient alloc], "initLinearGradientWithX0:y0:x1:y1:", a3, a4, a5, a6);
}

- (id)makeRadialGradientWithX0:(double)a3 y0:(double)a4 r0:(double)a5 x1:(double)a6 y1:(double)a7 r1:(double)a8
{
  return -[SUScriptGradient initRadialGraidentWithX0:y0:r0:x1:y1:r1:]([SUScriptGradient alloc], "initRadialGraidentWithX0:y0:r0:x1:y1:r1:", a3, a4, a5, a6, a7, a8);
}

- (void)moveToX:(double)a3 y:(double)a4
{
  CGAffineTransform v7;

  -[SUScriptObject lock](self, "lock");
  memset(&v7, 0, sizeof(v7));
  CGContextGetCTM(&v7, self->_context);
  CGPathMoveToPoint(self->_contextPath, &v7, a3, a4);
  CGContextMoveToPoint(self->_context, a3, a4);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)quadraticCurveToCPX:(double)a3 cpy:(double)a4 x:(double)a5 y:(double)a6
{
  CGAffineTransform v11;

  -[SUScriptObject lock](self, "lock");
  memset(&v11, 0, sizeof(v11));
  CGContextGetCTM(&v11, self->_context);
  CGPathAddQuadCurveToPoint(self->_contextPath, &v11, a3, a4, a5, a6);
  CGContextAddQuadCurveToPoint(self->_context, a3, a4, a5, a6);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)restoreState
{
  -[SUScriptObject lock](self, "lock");
  CGContextRestoreGState(self->_context);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)rotateWithAngle:(double)a3
{
  -[SUScriptObject lock](self, "lock");
  CGContextRotateCTM(self->_context, a3);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)saveState
{
  -[SUScriptObject lock](self, "lock");
  CGContextSaveGState(self->_context);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)scaleWithX:(double)a3 y:(double)a4
{
  -[SUScriptObject lock](self, "lock");
  CGContextScaleCTM(self->_context, a3, a4);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setTransformWithM11:(double)a3 m12:(double)a4 m21:(double)a5 m22:(double)a6 dx:(double)a7 dy:(double)a8
{
  -[SUScriptObject lock](self, "lock");
  CGContextSetCTM();
  -[SUScriptObject unlock](self, "unlock", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
}

- (void)transformWithM11:(double)a3 m12:(double)a4 m21:(double)a5 m22:(double)a6 dx:(double)a7 dy:(double)a8
{
  CGContext *context;
  CGAffineTransform v16;

  -[SUScriptObject lock](self, "lock");
  context = self->_context;
  v16.a = a3;
  v16.b = a4;
  v16.c = a5;
  v16.d = a6;
  v16.tx = a7;
  v16.ty = a8;
  CGContextConcatCTM(context, &v16);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)translateWithX:(double)a3 y:(double)a4
{
  -[SUScriptObject lock](self, "lock");
  CGContextTranslateCTM(self->_context, a3, a4);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)stroke
{
  int64_t strokeStyleType;
  void *v4;
  uint64_t v5;
  CGShading *v6;

  -[SUScriptObject lock](self, "lock");
  strokeStyleType = self->_strokeStyleType;
  if (strokeStyleType == 1)
  {
    v4 = (void *)objc_msgSend(self->_strokeStyle, "copyNativeGradient");
    v5 = objc_msgSend(v4, "copyShading");
    if (v5)
    {
      v6 = (CGShading *)v5;
      CGContextSaveGState(self->_context);
      CGContextReplacePathWithStrokedPath(self->_context);
      CGContextClip(self->_context);
      CGContextDrawShading(self->_context, v6);
      CGContextRestoreGState(self->_context);
      CGShadingRelease(v6);
    }

  }
  else if (!strokeStyleType)
  {
    CGContextStrokePath(self->_context);
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (void)strokeRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  int64_t strokeStyleType;
  void *v12;
  uint64_t v13;
  CGShading *v14;
  CGRect v15;
  CGRect v16;

  -[SUScriptObject lock](self, "lock");
  strokeStyleType = self->_strokeStyleType;
  if (strokeStyleType == 1)
  {
    v12 = (void *)objc_msgSend(self->_strokeStyle, "copyNativeGradient");
    v13 = objc_msgSend(v12, "copyShading");
    if (v13)
    {
      v14 = (CGShading *)v13;
      CGContextSaveGState(self->_context);
      v16.origin.x = a3;
      v16.origin.y = a4;
      v16.size.width = a5;
      v16.size.height = a6;
      CGContextAddRect(self->_context, v16);
      CGContextReplacePathWithStrokedPath(self->_context);
      CGContextClip(self->_context);
      CGContextDrawShading(self->_context, v14);
      CGContextRestoreGState(self->_context);
      CGShadingRelease(v14);
    }

  }
  else if (!strokeStyleType)
  {
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    CGContextStrokeRect(self->_context, v15);
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (id)_className
{
  return CFSTR("iTunesCanvas");
}

- (id)fillStyle
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_fillStyle;
  -[SUScriptObject unlock](self, "unlock");
  if (v3)
    return v3;
  else
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (double)globalAlpha
{
  double v3;
  double v4;

  -[SUScriptObject lock](self, "lock");
  CGContextGetAlpha();
  v4 = v3;
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (NSString)globalCompositeOperation
{
  int CompositeOperation;

  -[SUScriptObject lock](self, "lock");
  CompositeOperation = CGContextGetCompositeOperation();
  -[SUScriptObject unlock](self, "unlock");
  if ((CompositeOperation - 1) > 0x10)
    return (NSString *)CFSTR("source-over");
  else
    return &off_24DE7C840[CompositeOperation - 1]->isa;
}

- (double)height
{
  double height;

  -[SUScriptObject lock](self, "lock");
  height = self->_height;
  -[SUScriptObject unlock](self, "unlock");
  return height;
}

- (id)lineCap
{
  int LineCap;
  const __CFString *v4;

  -[SUScriptObject lock](self, "lock");
  LineCap = CGContextGetLineCap();
  -[SUScriptObject unlock](self, "unlock");
  v4 = CFSTR("butt");
  if (LineCap == 2)
    v4 = CFSTR("square");
  if (LineCap == 1)
    return CFSTR("round");
  else
    return (id)v4;
}

- (id)lineJoin
{
  int LineJoin;
  const __CFString *v4;

  -[SUScriptObject lock](self, "lock");
  LineJoin = CGContextGetLineJoin();
  -[SUScriptObject unlock](self, "unlock");
  v4 = CFSTR("miter");
  if (LineJoin == 1)
    v4 = CFSTR("round");
  if (LineJoin == 2)
    return CFSTR("bevel");
  else
    return (id)v4;
}

- (double)lineWidth
{
  double v3;
  double v4;

  -[SUScriptObject lock](self, "lock");
  CGContextGetLineWidth();
  v4 = v3;
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (double)miterLimit
{
  double v3;
  double v4;

  -[SUScriptObject lock](self, "lock");
  CGContextGetMiterLimit();
  v4 = v3;
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (void)setFillStyle:(id)a3
{
  SUScriptColor *v5;
  int64_t v6;
  int v7;
  SUScriptColor *fillStyle;
  CGColor *v9;
  CGColor *v10;
  SUScriptColor *v11;
  SUScriptColor *v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (SUScriptColor *)a3;
        v7 = 0;
        v6 = 1;
        if (v5)
          goto LABEL_6;
      }
LABEL_13:
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      v11 = 0;
      goto LABEL_14;
    }
    v5 = (SUScriptColor *)a3;
  }
  v6 = 0;
  v7 = 1;
  if (!v5)
    goto LABEL_13;
LABEL_6:
  v12 = v5;
  -[SUScriptObject lock](self, "lock");
  fillStyle = (SUScriptColor *)self->_fillStyle;
  if (fillStyle != v12)
  {

    self->_fillStyle = v12;
    self->_fillStyleType = v6;
    if (v7)
    {
      v9 = (CGColor *)objc_msgSend(self->_fillStyle, "copyCGColor");
      if (v9)
      {
        v10 = v9;
        CGContextSetFillColorWithColor(self->_context, v9);
        CGColorRelease(v10);
      }
    }
  }
  -[SUScriptObject unlock](self, "unlock");
  v11 = v12;
LABEL_14:

}

- (void)setGlobalAlpha:(double)a3
{
  -[SUScriptObject lock](self, "lock");
  CGContextSetAlpha(self->_context, a3);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setGlobalCompositeOperation:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("copy")) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("destination-atop")) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("destination-in")) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("destination-out")) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("destination-over")) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("lighter")) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("source-in")) & 1) == 0
      && (objc_msgSend(a3, "isEqualToString:", CFSTR("source-out")) & 1) == 0)
    {
      objc_msgSend(a3, "isEqualToString:", CFSTR("xor"));
    }
    -[SUScriptObject lock](self, "lock");
    CGContextSetCompositeOperation();
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setLineCap:(id)a3
{
  CGLineCap v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("round")) & 1) != 0)
    {
      v5 = kCGLineCapRound;
    }
    else if (objc_msgSend(a3, "isEqualToString:", CFSTR("square")))
    {
      v5 = kCGLineCapSquare;
    }
    else
    {
      v5 = kCGLineCapButt;
    }
    -[SUScriptObject lock](self, "lock");
    CGContextSetLineCap(self->_context, v5);
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setLineJoin:(id)a3
{
  CGLineJoin v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("bevel")) & 1) != 0)
      v5 = kCGLineJoinBevel;
    else
      v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("round"));
    -[SUScriptObject lock](self, "lock");
    CGContextSetLineJoin(self->_context, v5);
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setLineWidth:(double)a3
{
  -[SUScriptObject lock](self, "lock");
  CGContextSetLineWidth(self->_context, a3);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setMiterLimit:(double)a3
{
  -[SUScriptObject lock](self, "lock");
  CGContextSetMiterLimit(self->_context, a3);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setShadowBlur:(double)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_shadowBlur = a3;
  -[SUScriptCanvasContext _ntsApplyShadow](self, "_ntsApplyShadow");
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setShadowColor:(id)a3
{
  SUScriptColor *v5;
  SUScriptColor *shadowColor;
  SUScriptColor *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", a3);
  else
    v5 = (SUScriptColor *)a3;
  v7 = v5;
  if (v5)
  {
    -[SUScriptObject lock](self, "lock");
    shadowColor = self->_shadowColor;
    if (shadowColor != v7)
    {

      self->_shadowColor = v7;
    }
    -[SUScriptCanvasContext _ntsApplyShadow](self, "_ntsApplyShadow");
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (void)setShadowOffsetX:(double)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_shadowOffsetX = a3;
  -[SUScriptCanvasContext _ntsApplyShadow](self, "_ntsApplyShadow");
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setShadowOffsetY:(double)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_shadowOffsetY = a3;
  -[SUScriptCanvasContext _ntsApplyShadow](self, "_ntsApplyShadow");
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setStrokeStyle:(id)a3
{
  SUScriptColor *v5;
  int64_t v6;
  int v7;
  SUScriptColor *strokeStyle;
  CGColor *v9;
  CGColor *v10;
  SUScriptColor *v11;
  SUScriptColor *v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (SUScriptColor *)a3;
        v7 = 0;
        v6 = 1;
        if (v5)
          goto LABEL_6;
      }
LABEL_13:
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      v11 = 0;
      goto LABEL_14;
    }
    v5 = (SUScriptColor *)a3;
  }
  v6 = 0;
  v7 = 1;
  if (!v5)
    goto LABEL_13;
LABEL_6:
  v12 = v5;
  -[SUScriptObject lock](self, "lock");
  strokeStyle = (SUScriptColor *)self->_strokeStyle;
  if (strokeStyle != v12)
  {

    self->_strokeStyle = v12;
    self->_strokeStyleType = v6;
    if (v7)
    {
      v9 = (CGColor *)objc_msgSend(self->_strokeStyle, "copyCGColor");
      if (v9)
      {
        v10 = v9;
        CGContextSetStrokeColorWithColor(self->_context, v9);
        CGColorRelease(v10);
      }
    }
  }
  -[SUScriptObject unlock](self, "unlock");
  v11 = v12;
LABEL_14:

}

- (double)shadowBlur
{
  double shadowBlur;

  -[SUScriptObject lock](self, "lock");
  shadowBlur = self->_shadowBlur;
  -[SUScriptObject unlock](self, "unlock");
  return shadowBlur;
}

- (id)shadowColor
{
  SUScriptColor *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_shadowColor;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (double)shadowOffsetX
{
  double shadowOffsetX;

  -[SUScriptObject lock](self, "lock");
  shadowOffsetX = self->_shadowOffsetX;
  -[SUScriptObject unlock](self, "unlock");
  return shadowOffsetX;
}

- (double)shadowOffsetY
{
  double shadowOffsetY;

  -[SUScriptObject lock](self, "lock");
  shadowOffsetY = self->_shadowOffsetY;
  -[SUScriptObject unlock](self, "unlock");
  return shadowOffsetY;
}

- (id)strokeStyle
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_strokeStyle;
  -[SUScriptObject unlock](self, "unlock");
  if (v3)
    return v3;
  else
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (double)width
{
  double width;

  -[SUScriptObject lock](self, "lock");
  width = self->_width;
  -[SUScriptObject unlock](self, "unlock");
  return width;
}

- (void)_ntsApplyShadow
{
  SUScriptColor *shadowColor;
  CGColor *v4;
  CGColor *v5;

  shadowColor = self->_shadowColor;
  if (shadowColor && (v4 = -[SUScriptColor copyCGColor](shadowColor, "copyCGColor")) != 0)
  {
    v5 = v4;
    CGContextSetShadowWithColor(self->_context, *(CGSize *)&self->_shadowOffsetX, self->_shadowBlur, v4);
    CGColorRelease(v5);
  }
  else
  {
    CGContextSetShadow(self->_context, *(CGSize *)&self->_shadowOffsetX, self->_shadowBlur);
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_30, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCanvasContext;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_24, 24);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCanvasContext;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptCanvasContext;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_30, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_24 = (uint64_t)sel_arcToX1_y1_x2_y2_radius_;
    unk_255186550 = CFSTR("arcTo");
    qword_255186558 = (uint64_t)sel_arcWithX_y_radius_startAngle_endAngle_antiClockwise_;
    unk_255186560 = CFSTR("arc");
    qword_255186568 = (uint64_t)sel_beginPath;
    unk_255186570 = CFSTR("beginPath");
    qword_255186578 = (uint64_t)sel_bezierCurveToCP1X_cp1y_cp2x_cp2y_x_y_;
    unk_255186580 = CFSTR("bezierCurveTo");
    qword_255186588 = (uint64_t)sel_clearRectWithX_y_width_height_;
    unk_255186590 = CFSTR("clearRect");
    qword_255186598 = (uint64_t)sel_clip;
    unk_2551865A0 = CFSTR("clip");
    qword_2551865A8 = (uint64_t)sel_closePath;
    unk_2551865B0 = CFSTR("closePath");
    qword_2551865B8 = (uint64_t)sel_fill;
    unk_2551865C0 = CFSTR("fill");
    qword_2551865C8 = (uint64_t)sel_fillRectWithX_y_width_height_;
    unk_2551865D0 = CFSTR("fillRect");
    qword_2551865D8 = (uint64_t)sel_isPointInPathWithX_y_;
    unk_2551865E0 = CFSTR("isPointInPath");
    qword_2551865E8 = (uint64_t)sel_lineToX_y_;
    unk_2551865F0 = CFSTR("lineTo");
    qword_2551865F8 = (uint64_t)sel_makeLinearGradientWithX0_y0_x1_y1_;
    unk_255186600 = CFSTR("createLinearGradient");
    qword_255186608 = (uint64_t)sel_makeRadialGradientWithX0_y0_r0_x1_y1_r1_;
    unk_255186610 = CFSTR("createRadialGradient");
    qword_255186618 = (uint64_t)sel_moveToX_y_;
    unk_255186620 = CFSTR("moveTo");
    qword_255186628 = (uint64_t)sel_quadraticCurveToCPX_cpy_x_y_;
    unk_255186630 = CFSTR("quadraticCurveTo");
    qword_255186638 = (uint64_t)sel_restoreState;
    unk_255186640 = CFSTR("restore");
    qword_255186648 = (uint64_t)sel_rotateWithAngle_;
    unk_255186650 = CFSTR("rotate");
    qword_255186658 = (uint64_t)sel_saveState;
    unk_255186660 = CFSTR("save");
    qword_255186668 = (uint64_t)sel_scaleWithX_y_;
    unk_255186670 = CFSTR("scale");
    qword_255186678 = (uint64_t)sel_setTransformWithM11_m12_m21_m22_dx_dy_;
    unk_255186680 = CFSTR("setTransform");
    qword_255186688 = (uint64_t)sel_stroke;
    unk_255186690 = CFSTR("stroke");
    qword_255186698 = (uint64_t)sel_strokeRectWithX_y_width_height_;
    unk_2551866A0 = CFSTR("strokeRect");
    qword_2551866A8 = (uint64_t)sel_transformWithM11_m12_m21_m22_dx_dy_;
    unk_2551866B0 = CFSTR("transform");
    qword_2551866B8 = (uint64_t)sel_translateWithX_y_;
    unk_2551866C0 = CFSTR("translate");
    __KeyMapping_30 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("fillStyle"), CFSTR("globalAlpha"), CFSTR("globalAlpha"), CFSTR("globalCompositeOperation"), CFSTR("globalCompositeOperation"), CFSTR("height"), CFSTR("height"), CFSTR("lineCap"), CFSTR("lineCap"), CFSTR("lineJoin"), CFSTR("lineJoin"), CFSTR("lineWidth"), CFSTR("lineWidth"), CFSTR("miterLimit"), CFSTR("miterLimit"), CFSTR("shadowBlur"), CFSTR("shadowBlur"),
                        CFSTR("shadowColor"),
                        CFSTR("shadowColor"),
                        CFSTR("shadowOffsetX"),
                        CFSTR("shadowOffsetX"),
                        CFSTR("shadowOffsetY"),
                        CFSTR("shadowOffsetY"),
                        CFSTR("strokeStyle"),
                        CFSTR("strokeStyle"),
                        CFSTR("width"),
                        CFSTR("width"),
                        0);
  }
}

@end
