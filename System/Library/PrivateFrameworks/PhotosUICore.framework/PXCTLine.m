@implementation PXCTLine

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_line);
  v3.receiver = self;
  v3.super_class = (Class)PXCTLine;
  -[PXCTLine dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_referenceAttributedString, 0);
  objc_destroyWeak((id *)&self->_frame);
  objc_storeStrong((id *)&self->_string, 0);
}

- (CGPath)createPath
{
  __int128 v3;
  CGFloat v4;
  CGFloat v5;
  CGPath *Mutable;
  const __CFArray *GlyphRuns;
  CFIndex v8;
  const void *v9;
  const __CTRun *ValueAtIndex;
  const __CFDictionary *Attributes;
  const __CTFont *Value;
  uint64_t GlyphCount;
  uint64_t v14;
  uint64_t v15;
  CGGlyph *v16;
  CGPoint *v17;
  double *p_y;
  CGGlyph v19;
  const CGPath *PathForGlyph;
  CGFloat v21;
  CGFloat v22;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform m;
  CGAffineTransform v27;
  uint64_t v28;
  CFRange v29;
  CFRange v30;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v27.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v27.c = v3;
  *(_OWORD *)&v27.tx = *(_OWORD *)&self->_transform.tx;
  -[PXCTLine origin](self, "origin");
  m = v27;
  CGAffineTransformTranslate(&v27, &m, v4, v5);
  Mutable = CGPathCreateMutable();
  GlyphRuns = CTLineGetGlyphRuns(-[PXCTLine line](self, "line"));
  v8 = 0;
  v9 = (const void *)*MEMORY[0x1E0CA8188];
  while (v8 < CFArrayGetCount(GlyphRuns))
  {
    ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v8);
    Attributes = CTRunGetAttributes(ValueAtIndex);
    Value = (const __CTFont *)CFDictionaryGetValue(Attributes, v9);
    GlyphCount = CTRunGetGlyphCount(ValueAtIndex);
    v14 = MEMORY[0x1E0C80A78](GlyphCount);
    v16 = (CGGlyph *)((char *)&t2 - v15);
    v17 = (CGPoint *)((char *)&t2 - 16 * MEMORY[0x1E0C80A78](v14));
    v29.location = 0;
    v29.length = GlyphCount;
    CTRunGetGlyphs(ValueAtIndex, v29, v16);
    v30.location = 0;
    v30.length = GlyphCount;
    CTRunGetPositions(ValueAtIndex, v30, v17);
    if (GlyphCount >= 1)
    {
      p_y = &v17->y;
      do
      {
        v19 = *v16++;
        PathForGlyph = CTFontCreatePathForGlyph(Value, v19, 0);
        v21 = *(p_y - 1);
        v22 = *p_y;
        memset(&m, 0, sizeof(m));
        CGAffineTransformMakeTranslation(&t1, v21, v22);
        t2 = v27;
        CGAffineTransformConcat(&m, &t1, &t2);
        CGPathAddPath(Mutable, &m, PathForGlyph);
        CGPathRelease(PathForGlyph);
        p_y += 2;
        --GlyphCount;
      }
      while (GlyphCount);
    }
    ++v8;
  }
  return Mutable;
}

- (void)translateVerticallyBy:(double)a3
{
  CGAffineTransform v4;

  CGAffineTransformMakeTranslation(&v4, 0.0, a3);
  -[PXCTLine _transformBy:](self, "_transformBy:", &v4);
}

- (void)_transformBy:(CGAffineTransform *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  CGAffineTransform v7;
  CGAffineTransform t1;
  CGAffineTransform v9;

  v4 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v9, &t1, &v7);
  v6 = *(_OWORD *)&v9.c;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&v9.a;
  *(_OWORD *)&self->_transform.c = v6;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&v9.tx;
}

- (double)baselinePosition
{
  double v3;
  double v4;

  -[PXCTLine origin](self, "origin");
  return self->_transform.ty + v3 * self->_transform.d + self->_transform.b * v4;
}

- (void)prepare
{
  void *v4;
  void *v5;
  NSShadow *v6;
  NSShadow *shadow;
  __CTLine *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  __int128 v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *string;
  NSString *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  CGAffineTransform v26;

  if (!self->_prepared)
  {
    self->_prepared = 1;
    -[PXCTLine frame](self, "frame");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "framesetter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreText+PhotosUICore.m"), 249, CFSTR("missing framesetter"));

    }
    self->_context = (CGContext *)objc_msgSend(v5, "context");
    objc_msgSend(v5, "shadow");
    v6 = (NSShadow *)objc_claimAutoreleasedReturnValue();
    shadow = self->_shadow;
    self->_shadow = v6;

    v8 = -[PXCTLine line](self, "line");
    self->_width = CTLineGetTypographicBounds(v8, &self->_ascent, &self->_descent, 0);
    self->_imageBounds = CTLineGetImageBounds(v8, self->_context);
    -[PXCTLine frame](self, "frame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "origin");
    v11 = v10;
    v13 = v12;

    CGAffineTransformMakeTranslation(&v26, v11, v13);
    v14 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->_transform.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->_transform.c = v14;
    *(_OWORD *)&self->_transform.tx = *(_OWORD *)&v26.tx;
    self->_stringRange = (_NSRange)CTLineGetStringRange(v8);
    -[PXCTLine referenceAttributedString](self, "referenceAttributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "substringWithRange:", self->_stringRange.location, self->_stringRange.length);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    string = self->_string;
    self->_string = v17;

    if (-[PXCTLine isTruncated](self, "isTruncated"))
    {
      -[NSString stringByAppendingString:](self->_string, "stringByAppendingString:", CFSTR("…"));
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = self->_string;
      self->_string = v19;

    }
    if (-[PXCTLine isTruncated](self, "isTruncated"))
    {
      self->_endOfString = 0;
    }
    else
    {
      v21 = -[PXCTLine stringRange](self, "stringRange");
      v23 = v21 + v22;
      -[PXCTLine referenceAttributedString](self, "referenceAttributedString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      self->_endOfString = v23 == objc_msgSend(v24, "length");

    }
  }
}

- (NSAttributedString)referenceAttributedString
{
  return self->_referenceAttributedString;
}

- (BOOL)isTruncated
{
  return self->_truncated;
}

- (PXCTFrame)frame
{
  return (PXCTFrame *)objc_loadWeakRetained((id *)&self->_frame);
}

- (__CTLine)line
{
  return self->_line;
}

- (_NSRange)stringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_stringRange.length;
  location = self->_stringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (PXCTLine)initWithLine:(__CTLine *)a3 origin:(CGPoint)a4 frame:(id)a5 referenceAttributedString:(id)a6 truncated:(BOOL)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  PXCTLine *v15;
  objc_super v17;

  y = a4.y;
  x = a4.x;
  v13 = a5;
  v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PXCTLine;
  v15 = -[PXCTLine init](&v17, sel_init);
  if (v15)
  {
    v15->_line = (__CTLine *)CFRetain(a3);
    v15->_origin.x = x;
    v15->_origin.y = y;
    objc_storeWeak((id *)&v15->_frame, v13);
    objc_storeStrong((id *)&v15->_referenceAttributedString, a6);
    v15->_truncated = a7;
  }

  return v15;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].a;
  return self;
}

- (void)scaleVerticallyBy:(double)a3
{
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, 1.0, a3);
  -[PXCTLine _transformBy:](self, "_transformBy:", &v4);
}

- (CGRect)contentBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXCTLine textPosition](self, "textPosition");
  -[PXCTLine ascentPosition](self, "ascentPosition");
  -[PXCTLine textPosition](self, "textPosition");
  -[PXCTLine width](self, "width");
  -[PXCTLine descentPosition](self, "descentPosition");
  PXRectWithEdges();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)textPosition
{
  double v3;
  double v4;
  float64x2_t v5;
  double v6;
  CGPoint result;

  -[PXCTLine origin](self, "origin");
  v5 = vaddq_f64(*(float64x2_t *)&self->_transform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transform.c, v3), *(float64x2_t *)&self->_transform.a, v4));
  v6 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v6;
  return result;
}

- (CGRect)imageBounds
{
  CGFloat v3;
  CGFloat v4;
  __int128 v5;
  CGAffineTransform v6;
  CGRect v7;

  -[PXCTLine origin](self, "origin");
  v7 = CGRectOffset(self->_imageBounds, v3, v4);
  v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v6.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v6.c = v5;
  *(_OWORD *)&v6.tx = *(_OWORD *)&self->_transform.tx;
  return CGRectApplyAffineTransform(v7, &v6);
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)ascentPosition
{
  double v3;
  double v4;

  -[PXCTLine origin](self, "origin");
  return self->_transform.ty + (v3 + self->_ascent) * self->_transform.d + self->_transform.b * v4;
}

- (double)width
{
  __int128 v2;
  CGAffineTransform v4;
  CGRect v5;
  CGRect v6;

  v5.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v5.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
  v5.size.height = *(CGFloat *)(MEMORY[0x1E0C9D648] + 24);
  v5.size.width = self->_width;
  v2 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v4.c = v2;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->_transform.tx;
  v6 = CGRectApplyAffineTransform(v5, &v4);
  return v6.size.width;
}

- (double)descentPosition
{
  double v3;
  double v4;

  -[PXCTLine origin](self, "origin");
  return self->_transform.ty + (v3 - self->_descent) * self->_transform.d + self->_transform.b * v4;
}

- (void)draw
{
  CGContext *v3;
  __int128 v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  CGColor *v16;
  CGAffineTransform v17;
  CGSize v18;

  v3 = -[PXCTLine context](self, "context");
  CGContextSaveGState(v3);
  v4 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v17.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v17.c = v4;
  *(_OWORD *)&v17.tx = *(_OWORD *)&self->_transform.tx;
  CGContextConcatCTM(v3, &v17);
  -[PXCTLine origin](self, "origin");
  CGContextSetTextPosition(v3, v5, v6);
  CGContextSetShouldSmoothFonts(v3, 0);
  -[PXCTLine shadow](self, "shadow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "shadowOffset");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v8, "shadowBlurRadius");
    v14 = v13;
    objc_msgSend(v8, "shadowColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (CGColor *)objc_msgSend(v15, "CGColor");
    v18.width = v10;
    v18.height = v12;
    CGContextSetShadowWithColor(v3, v18, v14, v16);

  }
  CTLineDraw(-[PXCTLine line](self, "line"), v3);
  CGContextRestoreGState(v3);

}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (CGContext)context
{
  return self->_context;
}

- (PXCTLine)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreText+PhotosUICore.m"), 223, CFSTR("%s is not available as initializer"), "-[PXCTLine init]");

  abort();
}

- (void)translateHorizontallyBy:(double)a3
{
  CGAffineTransform v4;

  CGAffineTransformMakeTranslation(&v4, a3, 0.0);
  -[PXCTLine _transformBy:](self, "_transformBy:", &v4);
}

- (void)scaleBy:(double)a3
{
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, a3, a3);
  -[PXCTLine _transformBy:](self, "_transformBy:", &v4);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXCTLine string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p string='%@' CTLine=%@>"), v4, self, v5, -[PXCTLine line](self, "line"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (BOOL)isEndOfString
{
  return self->_endOfString;
}

- (double)ascent
{
  return self->_ascent;
}

- (double)descent
{
  return self->_descent;
}

@end
