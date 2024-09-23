@implementation TCVegaCGContext

- (CGContext)context
{
  return self->_bitmapContext;
}

+ (CGAffineTransform)flipYAxisWithHeight:(SEL)a3
{
  __int128 v5;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformTranslate(&v8, &v7, 0.0, a4);
  return CGAffineTransformScale(retstr, &v8, 1.0, -1.0);
}

- (void)resizeWithWidth:(double)a3 height:(double)a4
{
  double v5;
  double v6;
  uint64_t v7;
  __int128 v8;
  CGColorSpace *DeviceRGB;

  v5 = fmax(a3, 1.0);
  v6 = fmax(a4, 1.0);
  v7 = MEMORY[0x24BDBD8B8];
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&self->_currentTransform.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&self->_currentTransform.c = v8;
  *(_OWORD *)&self->_currentTransform.tx = *(_OWORD *)(v7 + 32);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  self->_bitmapContext = CGBitmapContextCreate(0, (unint64_t)v5, (unint64_t)v6, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
}

- (double)width
{
  CGContext *bitmapContext;

  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
    return (double)CGBitmapContextGetWidth(bitmapContext);
  else
    return 1.0;
}

- (void)setWidth:(double)a3
{
  double v5;

  -[TCVegaCGContext height](self, "height");
  -[TCVegaCGContext resizeWithWidth:height:](self, "resizeWithWidth:height:", a3, v5);
}

- (double)height
{
  CGContext *bitmapContext;

  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
    return (double)CGBitmapContextGetHeight(bitmapContext);
  else
    return 1.0;
}

- (void)setHeight:(double)a3
{
  -[TCVegaCGContext width](self, "width");
  -[TCVegaCGContext resizeWithWidth:height:](self, "resizeWithWidth:height:");
}

- (TCVegaCGContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCVegaCGContext;
  return -[TCVegaCGContext init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_bitmapContext);
  v3.receiver = self;
  v3.super_class = (Class)TCVegaCGContext;
  -[TCVegaCGContext dealloc](&v3, sel_dealloc);
}

- (JSValue)fillStyle
{
  return self->_fillStyle;
}

- (void)setFillStyle:(id)a3
{
  id *p_fillStyle;
  void *v6;
  char isKindOfClass;
  void *v8;
  TCVegaCGLinearGradient *v9;
  void *v10;
  TCVegaCGLinearGradient *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v15 = a3;
  p_fillStyle = (id *)&self->_fillStyle;
  objc_storeStrong((id *)&self->_fillStyle, a3);
  if (-[JSValue isObject](self->_fillStyle, "isObject")
    && (objc_msgSend(*p_fillStyle, "toObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    v8 = (void *)MEMORY[0x24BDDA730];
    v9 = [TCVegaCGLinearGradient alloc];
    objc_msgSend(v15, "toObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TCVegaCGLinearGradient initWithDictionary:](v9, "initWithDictionary:", v10);
    objc_msgSend(v15, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueWithObject:inContext:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *p_fillStyle;
    *p_fillStyle = (id)v13;

  }
  else
  {
    objc_msgSend(*p_fillStyle, "isString");
  }

}

- (id)textAttributes
{
  return 0;
}

- (NSString)font
{
  return self->_font;
}

- (double)globalAlpha
{
  return self->_globalAlpha;
}

- (void)setGlobalAlpha:(double)a3
{
  self->_globalAlpha = a3;
  CGContextSetAlpha(-[TCVegaCGContext context](self, "context"), self->_globalAlpha);
}

- (NSString)lineCap
{
  return self->_lineCap;
}

- (void)setLineCap:(id)a3
{
  CGLineCap v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_lineCap, a3);
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("butt")) & 1) != 0)
  {
    v5 = kCGLineCapButt;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("round")) & 1) != 0)
  {
    v5 = kCGLineCapRound;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("square")))
  {
    v5 = kCGLineCapSquare;
  }
  else
  {
    v5 = kCGLineCapButt;
  }
  CGContextSetLineCap(-[TCVegaCGContext context](self, "context"), v5);

}

- (NSString)lineJoin
{
  return self->_lineJoin;
}

- (void)setLineJoin:(id)a3
{
  CGLineJoin v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_lineJoin, a3);
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("miter")) & 1) != 0)
  {
    v5 = kCGLineJoinMiter;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("round")) & 1) != 0)
  {
    v5 = kCGLineJoinRound;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("bevel")))
  {
    v5 = kCGLineJoinBevel;
  }
  else
  {
    v5 = kCGLineJoinMiter;
  }
  CGContextSetLineJoin(-[TCVegaCGContext context](self, "context"), v5);

}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
  CGContextSetLineWidth(-[TCVegaCGContext context](self, "context"), self->_lineWidth);
}

- (double)miterLimit
{
  return self->_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->_miterLimit = a3;
  CGContextSetMiterLimit(-[TCVegaCGContext context](self, "context"), self->_miterLimit);
}

- (NSString)strokeStyle
{
  return self->_strokeStyle;
}

- (BOOL)isPointInPathWithX:(double)a3 y:(double)a4
{
  CGContext *v6;
  CGPoint v8;

  v6 = -[TCVegaCGContext context](self, "context");
  v8.x = a3;
  v8.y = a4;
  return CGContextPathContainsPoint(v6, v8, kCGPathFillStroke);
}

+ (CGColor)newColorFromR:(unsigned int)a3 G:(unsigned int)a4 B:(unsigned int)a5 A:(unsigned int)a6
{
  CGColorSpace *DeviceRGB;
  CGColor *v7;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  components[0] = (double)a3 / 255.0;
  components[1] = (double)a4 / 255.0;
  components[2] = (double)a5 / 255.0;
  components[3] = (double)a6 / 255.0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v7 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  return v7;
}

+ (CGColor)newColorFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CGColor *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v54;
  unsigned int v55;
  uint64_t v56;

  v3 = a3;
  if (objc_msgSend(v3, "characterAtIndex:", 0) == 35)
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length") == 3)
    {
      objc_msgSend(v4, "substringWithRange:", 0, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "substringWithRange:", 1, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "substringWithRange:", 2, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v47 = objc_msgSend(v4, "length");
      objc_msgSend(v4, "substringWithRange:", 0, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringWithRange:", 2, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringWithRange:", 4, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47 != 6)
      {
        objc_msgSend(v4, "substringWithRange:", 6, 2);
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    v48 = CFSTR("ff");
LABEL_15:
    LODWORD(v54) = 0;
    v56 = 0;
    v55 = 0;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "scanHexInt:", &v54);

    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v8);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "scanHexInt:", (char *)&v56 + 4);

    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v10);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "scanHexInt:", &v56);

    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v48);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "scanHexInt:", &v55);

    v43 = (CGColor *)objc_msgSend((id)objc_opt_class(), "newColorFromR:G:B:A:", LODWORD(v54), HIDWORD(v56), v56, v55);
    goto LABEL_16;
  }
  if ((unint64_t)objc_msgSend(v3, "length") >= 4)
  {
    objc_msgSend(v3, "substringToIndex:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("rgb("));

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v54) = 0;
      v56 = 0;
      objc_msgSend(v4, "substringWithRange:", 4, objc_msgSend(v4, "length") - 5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scannerWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scanInt:", &v54);

      v17 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scannerWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scanInt:", (char *)&v56 + 4);

      v20 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scannerWithString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scanInt:", &v56);

      v23 = (void *)objc_opt_class();
      v24 = LODWORD(v54);
      v26 = v56;
      v25 = HIDWORD(v56);
      v27 = 255;
LABEL_10:
      v43 = (CGColor *)objc_msgSend(v23, "newColorFromR:G:B:A:", v24, v25, v26, v27);
LABEL_16:

      goto LABEL_17;
    }
  }
  if ((unint64_t)objc_msgSend(v3, "length") >= 5)
  {
    objc_msgSend(v3, "substringToIndex:", 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("rgba("));

    if (v29)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v30);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = 0;
      v55 = 0;
      v54 = 0.0;
      objc_msgSend(v4, "substringWithRange:", 5, objc_msgSend(v4, "length") - 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "scannerWithString:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "scanInt:", (char *)&v56 + 4);

      v34 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scannerWithString:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "scanInt:", &v56);

      v37 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "scannerWithString:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "scanInt:", &v55);

      v40 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "scannerWithString:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "scanDouble:", &v54);

      v23 = (void *)objc_opt_class();
      v25 = v56;
      v24 = HIDWORD(v56);
      v26 = v55;
      v27 = (v54 * 255.0);
      goto LABEL_10;
    }
  }
  v44 = (void *)objc_opt_class();
  +[TCVegaCGColorMap map](TCVegaCGColorMap, "map");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKey:", v3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (CGColor *)objc_msgSend(v44, "newColorFromString:", v46);

  v4 = v3;
LABEL_17:

  return v43;
}

- (void)setStrokeStyle:(id)a3
{
  NSString *v4;
  NSString *strokeStyle;
  NSString *v6;
  CGColor *v7;
  id v8;

  v4 = (NSString *)a3;
  objc_msgSend(MEMORY[0x24BDDA720], "currentArguments");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  strokeStyle = self->_strokeStyle;
  self->_strokeStyle = v4;
  v6 = v4;

  v7 = (CGColor *)objc_msgSend((id)objc_opt_class(), "newColorFromString:", self->_strokeStyle);
  CGContextSetStrokeColorWithColor(-[TCVegaCGContext context](self, "context"), v7);
  CGColorRelease(v7);

}

- (NSString)textAlign
{
  return self->_textAlign;
}

- (void)setTextAlign:(id)a3
{
  objc_storeStrong((id *)&self->_textAlign, a3);
}

- (id)measureText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  TCVegaCGTextMetrics *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = [v4 alloc];
  -[TCVegaCGContext textAttributes](self, "textAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v7);

  v9 = objc_alloc_init(TCVegaCGTextMetrics);
  objc_msgSend(v8, "size");
  -[TCVegaCGTextMetrics setWidth:](v9, "setWidth:");
  +[TCVegaLogProxy wrapObject:](TCVegaLogProxy, "wrapObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)rotateWithAngle:(double)a3
{
  CGContextRotateCTM(-[TCVegaCGContext context](self, "context"), a3);
}

- (void)setTransformWithA:(double)a3 b:(double)a4 c:(double)a5 d:(double)a6 e:(double)a7 f:(double)a8
{
  CGContext *v9;
  __int128 v10;
  CGAffineTransform v11;

  self->_currentTransform.a = a3;
  self->_currentTransform.b = a4;
  self->_currentTransform.c = a5;
  self->_currentTransform.d = a6;
  self->_currentTransform.tx = a7;
  self->_currentTransform.ty = a8;
  v9 = -[TCVegaCGContext context](self, "context");
  v10 = *(_OWORD *)&self->_currentTransform.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&self->_currentTransform.a;
  *(_OWORD *)&v11.c = v10;
  *(_OWORD *)&v11.tx = *(_OWORD *)&self->_currentTransform.tx;
  CGContextConcatCTM(v9, &v11);
}

- (void)restore
{
  CGContextRestoreGState(-[TCVegaCGContext context](self, "context"));
}

- (void)save
{
  CGContextSaveGState(-[TCVegaCGContext context](self, "context"));
}

- (void)clearRectWithX:(double)a3 y:(double)a4 w:(double)a5 h:(double)a6
{
  CGContext *v10;
  CGRect v11;

  v10 = -[TCVegaCGContext context](self, "context");
  v11.origin.x = a3;
  v11.origin.y = a4;
  v11.size.width = a5;
  v11.size.height = a6;
  CGContextClearRect(v10, v11);
}

- (void)translateWithX:(double)a3 y:(double)a4
{
  CGContextTranslateCTM(-[TCVegaCGContext context](self, "context"), a3, a4);
}

- (void)arcWithX:(double)a3 y:(double)a4 radius:(double)a5 startAngle:(double)a6 endAngle:(double)a7 anticlockwise:(BOOL)a8
{
  CGContextAddArc(-[TCVegaCGContext context](self, "context"), a3, a4, a5, a6, a7, a8);
}

- (void)beginPath
{
  id v3;

  objc_msgSend(MEMORY[0x24BDDA720], "currentArguments");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CGContextBeginPath(-[TCVegaCGContext context](self, "context"));

}

- (void)closePath
{
  id v3;

  objc_msgSend(MEMORY[0x24BDDA720], "currentArguments");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CGContextClosePath(-[TCVegaCGContext context](self, "context"));

}

- (void)bezierCurveToCP1x:(double)a3 cp1y:(double)a4 cp2x:(double)a5 cp2y:(double)a6 x:(double)a7 y:(double)a8
{
  CGContextAddCurveToPoint(-[TCVegaCGContext context](self, "context"), a3, a4, a5, a6, a7, a8);
}

- (void)moveToX:(double)a3 y:(double)a4
{
  CGContextMoveToPoint(-[TCVegaCGContext context](self, "context"), a3, a4);
}

- (void)lineToX:(double)a3 y:(double)a4
{
  id v7;

  objc_msgSend(MEMORY[0x24BDDA720], "currentArguments");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  CGContextAddLineToPoint(-[TCVegaCGContext context](self, "context"), a3, a4);

}

- (void)stroke
{
  const CGPath *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDDA720], "currentArguments");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = CGContextCopyPath(-[TCVegaCGContext context](self, "context"));
  CGContextStrokePath(-[TCVegaCGContext context](self, "context"));
  CGContextAddPath(-[TCVegaCGContext context](self, "context"), v3);
  CGPathRelease(v3);

}

- (void)strokeTextWithString:(id)a3 x:(double)a4 y:(double)a5
{
  -[TCVegaCGContext textWithString:x:y:drawingMode:](self, "textWithString:x:y:drawingMode:", a3, 1, a4, a5);
}

- (void)fillTextWithString:(id)a3 x:(double)a4 y:(double)a5
{
  -[TCVegaCGContext textWithString:x:y:drawingMode:](self, "textWithString:x:y:drawingMode:", a3, 0, a4, a5);
}

- (TCVegaCGContext)textWithString:(id)a3 x:(double)a4 y:(double)a5 drawingMode:(int)a6
{
  id v10;
  id v11;
  void *v12;
  const __CTLine *v13;
  double v14;
  double v15;
  TCVegaCGContext *result;
  const __CFAttributedString *attrString;

  v10 = a3;
  CGContextSaveGState(-[TCVegaCGContext context](self, "context"));
  v11 = objc_alloc(MEMORY[0x24BDD1458]);
  -[TCVegaCGContext textAttributes](self, "textAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  attrString = (const __CFAttributedString *)objc_msgSend(v11, "initWithString:attributes:", v10, v12);

  v13 = CTLineCreateWithAttributedString(attrString);
  -[__CFAttributedString size](attrString, "size");
  v15 = v14;
  if (-[NSString isEqualToString:](self->_textAlign, "isEqualToString:", CFSTR("right")))
  {
    a4 = a4 - v15;
  }
  else if (-[NSString isEqualToString:](self->_textAlign, "isEqualToString:", CFSTR("center")))
  {
    a4 = a4 + v15 * -0.5;
  }
  CGContextSetTextPosition(-[TCVegaCGContext context](self, "context"), a4, a5);
  CGContextSetTextDrawingMode(-[TCVegaCGContext context](self, "context"), (CGTextDrawingMode)a6);
  CTLineDraw(v13, -[TCVegaCGContext context](self, "context"));
  CGContextRestoreGState(-[TCVegaCGContext context](self, "context"));
  CFRelease(v13);

  return result;
}

- (void)fillRectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  -[TCVegaCGContext rectWithX:y:width:height:](self, "rectWithX:y:width:height:", a3, a4, a5, a6);
  -[TCVegaCGContext fill](self, "fill");
}

- (void)rectWithX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  CGContext *v10;
  CGRect v11;

  v10 = -[TCVegaCGContext context](self, "context");
  v11.origin.x = a3;
  v11.origin.y = a4;
  v11.size.width = a5;
  v11.size.height = a6;
  CGContextAddRect(v10, v11);
}

- (double)lineDashOffset
{
  return self->_lineDashOffset;
}

- (void)setLineDashOffset:(double)a3
{
  self->_lineDashOffset = a3;
}

- (void)setLineDashWithSegments:(id)a3
{
  id v4;
  size_t v5;
  const CGFloat *v6;
  uint64_t v7;
  void *v8;
  CGFloat v9;
  CGContext *v10;
  CGFloat v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = (const CGFloat *)((char *)v12 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v5)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v6[v7] = v9;

      ++v7;
    }
    while (v5 != v7);
  }
  v10 = -[TCVegaCGContext context](self, "context");
  -[TCVegaCGContext lineDashOffset](self, "lineDashOffset");
  CGContextSetLineDash(v10, v11, v6, v5);

}

- (void)clip
{
  id v3;

  objc_msgSend(MEMORY[0x24BDDA720], "currentArguments");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CGContextClip(-[TCVegaCGContext context](self, "context"));

}

- (void)fill
{
  const CGPath *v3;
  void *v4;
  void *v5;
  CGColor *v6;
  void *v7;

  v3 = CGContextCopyPath(-[TCVegaCGContext context](self, "context"));
  if (-[JSValue isString](self->_fillStyle, "isString"))
  {
    v4 = (void *)objc_opt_class();
    -[JSValue toString](self->_fillStyle, "toString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CGColor *)objc_msgSend(v4, "newColorFromString:", v5);

    CGContextSetFillColorWithColor(-[TCVegaCGContext context](self, "context"), v6);
    CGColorRelease(v6);
    CGContextFillPath(-[TCVegaCGContext context](self, "context"));
  }
  else
  {
    -[JSValue toObject](self->_fillStyle, "toObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fillWithContext:", -[TCVegaCGContext context](self, "context"));

  }
  CGContextAddPath(-[TCVegaCGContext context](self, "context"), v3);
  CGPathRelease(v3);
}

- (id)createLinearGradientWithX0:(double)a3 y0:(double)a4 x1:(double)a5 y1:(double)a6
{
  TCVegaCGLinearGradient *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = -[TCVegaCGLinearGradient initWithX0:y0:x1:y1:]([TCVegaCGLinearGradient alloc], "initWithX0:y0:x1:y1:", a3, a4, a5, a6);
  v7 = (void *)MEMORY[0x24BDDA730];
  objc_msgSend(MEMORY[0x24BDDA720], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithObject:inContext:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)pixelRatio
{
  return self->pixelRatio;
}

- (void)setPixelRatio:(double)a3
{
  self->pixelRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textAlign, 0);
  objc_storeStrong((id *)&self->_strokeStyle, 0);
  objc_storeStrong((id *)&self->_lineJoin, 0);
  objc_storeStrong((id *)&self->_lineCap, 0);
  objc_storeStrong((id *)&self->_fillStyle, 0);
}

@end
