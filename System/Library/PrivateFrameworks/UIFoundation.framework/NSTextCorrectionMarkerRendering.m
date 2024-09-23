@implementation NSTextCorrectionMarkerRendering

+ (CGColor)_colorForSpellType_iOS:(int64_t)a3
{
  objc_class *v4;
  objc_class *v5;
  void *v6;

  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    v4 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", 1);
  }
  else
  {
    v4 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
  v5 = v4;
  if (a3 == 1 || a3 == 3)
  {
    v6 = (void *)-[objc_class systemBlueColor](v4, "systemBlueColor");
  }
  else if (a3 == 2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (void *)-[objc_class textGrammarIndicatorColor](v5, "textGrammarIndicatorColor");
    else
      v6 = (void *)-[objc_class systemGreenColor](v5, "systemGreenColor");
  }
  else
  {
    v6 = (void *)-[objc_class systemRedColor](v4, "systemRedColor");
  }
  return (CGColor *)objc_msgSend(v6, "CGColor");
}

+ (int64_t)textCorrectionMarkerTypeWithAttributes:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", NSTemporaryTextCorrectionAttributeName);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 3;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSTextAlternatives"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSSpellingState"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v6 = objc_msgSend(v5, "integerValue")) == 0)
  {
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSTextAlternativesDisplayStyle"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return -1;
    v6 = objc_msgSend(v7, "integerValue");
    if (!v6)
      return -1;
  }
  if (v6 == 1)
    return 1;
  return 2 * (v6 == 3);
}

+ (CGColor)colorForType:(int64_t)a3 font:(id)a4 dotSize:(double *)a5
{
  double v8;
  double v9;

  if (!a4)
    a4 = (id)NSDefaultFont();
  objc_msgSend(a4, "pointSize");
  v9 = 20.0;
  if (v8 >= 20.0)
  {
    v9 = 40.0;
    if (v8 <= 40.0)
      v9 = v8;
  }
  if (a5)
  {
    v8 = ceil(v9 * 0.13247);
    *a5 = v8;
  }
  return (CGColor *)objc_msgSend(a1, "_colorForSpellType_iOS:", a3, v8, v9);
}

+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 graphicsContext:(id)a7
{
  objc_msgSend(a1, "drawCorrectionMarkerOfType:font:origin:width:originalWidth:graphicsContext:", a3, a4, a7, a5.x, a5.y, a6, a6);
}

+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7 graphicsContext:(id)a8
{
  double y;
  double x;
  uint64_t v13;
  CGColor *v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  CGContext *v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  CGRect v26;

  if (a8)
  {
    y = a5.y;
    x = a5.x;
    v25 = 0.0;
    v13 = objc_msgSend(a1, "colorForType:font:dotSize:", a3, a4, &v25);
    if (v13)
    {
      v14 = (CGColor *)v13;
      v15 = v25 + 1.0;
      v16 = vcvtmd_s64_f64((a7 + 1.0) / (v25 + 1.0));
      if (v16 <= 1)
        v16 = 1;
      v17 = (a7 + 1.0 - (double)v16 * v15) * 0.5;
      v18 = vcvtmd_s64_f64((a6 + 1.0 + v17 * -2.0) / v15);
      if (v18 <= 1)
        v19 = 1;
      else
        v19 = v18;
      v20 = (CGContext *)objc_msgSend(a8, "CGContext");
      CGContextSetFillColorWithColor(v20, v14);
      CGContextBeginPath(v20);
      v21 = 0;
      v22 = y + 0.0;
      v23 = v25;
      v24 = x + v17;
      do
      {
        v26.origin.x = v24 + (double)(int)v21 * (v25 + 1.0);
        v26.origin.y = v22;
        v26.size.width = v23;
        v26.size.height = v23;
        CGContextAddEllipseInRect(v20, v26);
        ++v21;
      }
      while (v19 != v21);
      CGContextClosePath(v20);
      if (CGContextGetCompositeOperation() == 2)
      {
        CGContextFillPath(v20);
      }
      else
      {
        CGContextSetCompositeOperation();
        CGContextFillPath(v20);
        CGContextSetCompositeOperation();
      }
    }
  }
}

+ (CGRect)boundsForCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7
{
  double y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  y = a5.y;
  x = a5.x;
  v14 = 0.0;
  objc_msgSend(a1, "colorForType:font:dotSize:", a3, a4, &v14, a5.x, a5.y, a6, a7);
  v10 = y + 0.0;
  v11 = v14;
  v12 = x;
  v13 = a6;
  result.size.height = v11;
  result.size.width = v13;
  result.origin.y = v10;
  result.origin.x = v12;
  return result;
}

+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 cgContext:(CGContext *)a7
{
  double y;
  double x;
  _NSCGTextGraphicsContext *v13;

  y = a5.y;
  x = a5.x;
  v13 = -[_NSCGTextGraphicsContext initWithCGContext:]([_NSCGTextGraphicsContext alloc], "initWithCGContext:", a7);
  objc_msgSend(a1, "drawCorrectionMarkerOfType:font:origin:width:graphicsContext:", a3, a4, v13, x, y, a6);

}

+ (void)drawCorrectionMarkerOfType:(int64_t)a3 font:(id)a4 origin:(CGPoint)a5 width:(double)a6 originalWidth:(double)a7 cgContext:(CGContext *)a8
{
  double y;
  double x;
  _NSCGTextGraphicsContext *v15;

  y = a5.y;
  x = a5.x;
  v15 = -[_NSCGTextGraphicsContext initWithCGContext:]([_NSCGTextGraphicsContext alloc], "initWithCGContext:", a8);
  objc_msgSend(a1, "drawCorrectionMarkerOfType:font:origin:width:originalWidth:graphicsContext:", a3, a4, v15, x, y, a6, a7);

}

+ (id)textCorrectionAdjustmentAttributedString:(id)a3 range:(_NSRange)a4 glyphOrigin:(CGPoint)a5 yDelta:(double *)a6
{
  double y;
  NSUInteger length;
  NSUInteger location;
  NSTypesetterBehavior v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  void *v18;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;

  y = a5.y;
  length = a4.length;
  location = a4.location;
  v11 = +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior", a5.x);
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__NSTextCorrectionMarkerRendering_textCorrectionAdjustmentAttributedString_range_glyphOrigin_yDelta___block_invoke;
  v20[3] = &unk_1E260BF28;
  v20[5] = &v27;
  v20[6] = v11;
  v20[4] = &v21;
  objc_msgSend(a3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSFont"), location, length, 0, v20);
  if (!v22[5])
  {
    v12 = (void *)NSDefaultFont();
    v22[5] = (uint64_t)v12;
    objc_msgSend(v12, "ascender");
    *((_QWORD *)v28 + 3) = v13;
  }
  if (a6)
  {
    v14 = v28[3];
    v15 = v14 - y;
    v16 = y < v14;
    v17 = 0.0;
    if (v16)
      v17 = v15;
    *a6 = v17;
  }
  v18 = (void *)v22[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v18;
}

uint64_t __101__NSTextCorrectionMarkerRendering_textCorrectionAdjustmentAttributedString_range_glyphOrigin_yDelta___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v5 + 40))
    {
      objc_msgSend(a2, "pointSize");
      v7 = v6;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "pointSize");
      if (v7 <= v8)
        goto LABEL_6;
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    *(_QWORD *)(v5 + 40) = a2;
LABEL_6:
    result = objc_msgSend(a2, "ascender");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v9 > *(double *)(v10 + 24))
      *(double *)(v10 + 24) = v9;
  }
  return result;
}

@end
