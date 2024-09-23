@implementation TSDShadowSwatch

- (TSDShadowSwatch)initWithShadow:(id)a3
{
  TSDShadowSwatch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDShadowSwatch;
  v4 = -[TSDShadowSwatch init](&v6, sel_init);
  if (v4)
    v4->mShadow = (TSDShadow *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDShadowSwatch;
  -[TSDShadowSwatch dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  TSDShadow *mShadow;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "shadow");
    mShadow = self->mShadow;
    if (mShadow != (TSDShadow *)v5)
      return -[TSDShadow isEqual:](mShadow, "isEqual:");
    return 1;
  }
  return 0;
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4 forImage:(CGImage *)a5 swatchRect:(CGRect)a6 wantsStroke:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  TSDShadow *mShadow;
  id v20;
  CGColor *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CGFloat lengths[3];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v7 = a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a3.size.height;
  v15 = a3.size.width;
  v16 = a3.origin.y;
  v17 = a3.origin.x;
  v37 = *MEMORY[0x24BDAC8D0];
  CGContextSaveGState(a4);
  mShadow = self->mShadow;
  if (!mShadow)
  {
    v21 = (CGColor *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "CGColor");
    CGContextSetStrokeColorWithColor(a4, v21);
    *(_OWORD *)lengths = xmmword_217C29330;
    CGContextSetLineWidth(a4, 1.0);
    CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    CGContextStrokeRect(a4, v39);
    CGContextSetFillColorWithColor(a4, v21);
    v22 = (void *)objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("None"), &stru_24D82FEB0, CFSTR("TSDrawables"));
    UIGraphicsPushContext(a4);
    v23 = objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 16.0);
    v34 = *MEMORY[0x24BDF65F8];
    v24 = v34;
    v35 = v23;
    objc_msgSend(v22, "sizeWithAttributes:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
    *(float *)&v25 = (width - v25) * 0.5;
    v26 = x + floorf(*(float *)&v25);
    *(float *)&v25 = (height - v27) * 0.5;
    v32 = v24;
    v33 = v23;
    objc_msgSend(v22, "drawAtPoint:withAttributes:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), v26, y + floorf(*(float *)&v25));
    UIGraphicsPopContext();
    goto LABEL_12;
  }
  if (-[TSDShadow isContactShadow](mShadow, "isContactShadow"))
  {
    objc_opt_class();
    v20 = (id)objc_msgSend((id)TSUDynamicCast(), "newShadowClampedForSwatches");
    CGContextSaveGState(a4);
    -[TSDShadowSwatch p_drawContactShadowInContext:inRect:forShadow:forImage:forSwatchRect:](self, "p_drawContactShadowInContext:inRect:forShadow:forImage:forSwatchRect:", a4, v20, a5, v17, v16, v15, v14, x, y, width, height);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    CGContextDrawImage(a4, v38, a5);
    CGContextRestoreGState(a4);
    if (!a5)
      goto LABEL_11;
    goto LABEL_8;
  }
  if (-[TSDShadow isDropShadow](self->mShadow, "isDropShadow"))
  {
    -[TSDShadow applyToContext:viewScale:flipped:](self->mShadow, "applyToContext:viewScale:flipped:", a4, 1, 1.0);
    if (a5)
      goto LABEL_8;
LABEL_11:
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "lightGrayColor"), "CGColor"));
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    CGContextFillRect(a4, v42);
    goto LABEL_12;
  }
  v30 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShadowSwatch drawSwatchInRect:inContext:forImage:swatchRect:wantsStroke:]");
  objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadowSwatch.m"), 79, CFSTR("-drawSwatchInRect: Invalid shadow type"));
  if (!a5)
    goto LABEL_11;
LABEL_8:
  v28 = x + 1.0;
  v29 = y + 1.0;
  CGContextTranslateCTM(a4, 0.0, v14);
  CGContextScaleCTM(a4, 1.0, -1.0);
  v40.origin.x = v28;
  v40.origin.y = v29;
  v40.size.width = width;
  v40.size.height = height;
  CGContextDrawImage(a4, v40, a5);
  if (v7)
  {
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.0, 0.2), "CGColor"));
    v41.origin.x = v28;
    v41.origin.y = v29;
    v41.size.width = width;
    v41.size.height = height;
    CGContextStrokeRectWithWidth(a4, v41, 1.0);
  }
LABEL_12:
  CGContextRestoreGState(a4);
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("TSD_ShadowSwatch"), TSDBundle()), "CGImage");
  v11 = TSDCenterRectOverRect(0.0, 0.0, 50.0, 50.0, x, y, width, height);
  -[TSDShadowSwatch drawSwatchInRect:inContext:forImage:swatchRect:wantsStroke:](self, "drawSwatchInRect:inContext:forImage:swatchRect:wantsStroke:", a4, v10, 1, x, y, width, height, v11, v12, v13, v14);
}

- (void)p_drawContactShadowInContext:(CGContext *)a3 inRect:(CGRect)a4 forShadow:(id)a5 forImage:(CGImage *)a6 forSwatchRect:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  void *v19;
  uint64_t v20;
  CGContext *v21;
  CGImage *v22;
  CGFloat v23;
  CGRect v24;
  CGRect v25;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = a4.size.height;
  v14 = a4.size.width;
  v15 = a4.origin.y;
  v16 = a4.origin.x;
  objc_opt_class();
  v18 = (void *)TSUDynamicCast();
  if (!v18)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShadowSwatch p_drawContactShadowInContext:inRect:forShadow:forImage:forSwatchRect:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShadowSwatch.m"), 155, CFSTR("invalid nil value for '%s'"), "contactShadow");
  }
  v21 = TSDBitmapContextCreate(3, v14);
  CGContextTranslateCTM(v21, -v16, -v15);
  CGContextTranslateCTM(v21, 0.0, v13 * 0.5);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  CGContextDrawImage(v21, v24, a6);
  v22 = (CGImage *)objc_msgSend(v18, "newShadowImageFromContext:withSize:bounds:unflipped:", v21, 0, v14, v13, x, y, width, height);
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, 0.0, v13 * -0.5);
  CGContextTranslateCTM(a3, 0.0, height);
  objc_msgSend(a5, "offset");
  CGContextTranslateCTM(a3, 0.0, v23);
  v25.origin.x = v16;
  v25.origin.y = v15;
  v25.size.width = v14;
  v25.size.height = v13;
  CGContextDrawImage(a3, v25, v22);
  CGContextRestoreGState(a3);
  CGImageRelease(v22);
  CGContextRelease(v21);
}

- (TSDShadow)shadow
{
  return self->mShadow;
}

@end
