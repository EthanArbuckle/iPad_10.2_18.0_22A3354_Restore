@implementation _UIVectorTextLayoutRun

- (_UIVectorTextLayoutRun)initWithCTRun:(__CTRun *)a3 lineIndex:(unint64_t)a4 layoutInfo:(id)a5
{
  id v9;
  _UIVectorTextLayoutRun *v10;
  _UIVectorTextLayoutRun *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UIVectorTextLayoutRun;
  v10 = -[_UIVectorTextLayoutRun init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_lineIndex = a4;
    objc_storeStrong((id *)&v10->_layoutInfo, a5);
    if (a3)
    {
      v11->_runRef = a3;
      CFRetain(a3);
    }
  }

  return v11;
}

- (void)dealloc
{
  __CTRun *runRef;
  objc_super v4;

  runRef = self->_runRef;
  if (runRef)
    CFRelease(runRef);
  v4.receiver = self;
  v4.super_class = (Class)_UIVectorTextLayoutRun;
  -[_UIVectorTextLayoutRun dealloc](&v4, sel_dealloc);
}

- (int64_t)glyphCount
{
  return self->_glyphCount;
}

- (_NSRange)stringRange
{
  __CTRun *runRef;
  NSUInteger location;
  NSUInteger length;
  CFRange StringRange;
  _NSRange result;

  runRef = self->_runRef;
  if (runRef)
  {
    StringRange = CTRunGetStringRange(runRef);
    length = StringRange.length;
    location = StringRange.location;
  }
  else
  {
    location = 0x7FFFFFFFFFFFFFFFLL;
    length = 0;
  }
  result.length = length;
  result.location = location;
  return result;
}

- (id)string
{
  uint64_t v3;
  NSUInteger v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  void *v10;
  NSRange v11;
  NSRange v13;
  NSRange v14;

  v3 = -[_UIVectorTextLayoutRun stringRange](self, "stringRange");
  v5 = 0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    if (v4)
    {
      v7 = v3;
      -[_UIVectorTextLayoutInfo parameters](self->_layoutInfo, "parameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attributedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v14.length = objc_msgSend(v10, "length");
      v13.location = v7;
      v13.length = v6;
      v14.location = 0;
      v11 = NSIntersectionRange(v13, v14);
      objc_msgSend(v10, "substringWithRange:", v11.location, v11.length);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v5;
}

- (id)font
{
  return (id)CTRunGetFont();
}

- (BOOL)shouldRender
{
  if (self->_runRef && CTRunGetFont())
    return CTFontIsAppleColorEmoji();
  else
    return 0;
}

- (void)renderInContext:(CGContext *)a3
{
  __CTFrame *v5;
  _UIVectorTextLayoutInfo *layoutInfo;
  double height;
  CGAffineTransform v8;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform transform;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGPoint origins;
  CFRange v15;
  CFRange v16;
  CGRect v17;
  CGRect v18;

  origins.x = 0.0;
  origins.y = 0.0;
  v5 = -[_UIVectorTextLayoutInfo frame](self->_layoutInfo, "frame");
  v15.location = -[_UIVectorTextLayoutRun lineIndex](self, "lineIndex");
  v15.length = 1;
  CTFrameGetLineOrigins(v5, v15, &origins);
  memset(&v13, 0, sizeof(v13));
  layoutInfo = self->_layoutInfo;
  if (layoutInfo)
    -[_UIVectorTextLayoutInfo coordinateAdjustment](layoutInfo, "coordinateAdjustment");
  -[_UIVectorTextLayoutRun usedRunRect](self, "usedRunRect");
  v12 = v13;
  v18 = CGRectApplyAffineTransform(v17, &v12);
  height = v18.size.height;
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v12, origins.x - v18.origin.x, origins.y - v18.origin.y);
  t1 = v12;
  CGAffineTransformTranslate(&transform, &t1, 0.0, v13.ty - height);
  v12 = transform;
  t1 = transform;
  t2 = v13;
  CGAffineTransformConcat(&transform, &t1, &t2);
  v12 = transform;
  CGContextSaveGState(a3);
  transform = v12;
  CGContextConcatCTM(a3, &transform);
  CTRunGetTextMatrix(&v8, self->_runRef);
  CGContextSetTextMatrix(a3, &v8);
  v16.location = 0;
  v16.length = 0;
  CTRunDraw(self->_runRef, a3, v16);
  CGContextRestoreGState(a3);
}

- (void)enumerateGlyphsUsingBlock:(id)a3
{
  id v4;
  uint64_t Font;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v4 = a3;
  Font = CTRunGetFont();
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 1.0, -1.0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___UIVectorTextLayoutRun_enumerateGlyphsUsingBlock___block_invoke;
  v7[3] = &unk_1E16EA740;
  v10 = v11;
  v8 = v4;
  v9 = Font;
  v6 = v4;
  -[_UIVectorTextLayoutRun _enumerateGlyphsUsingBlock:](self, "_enumerateGlyphsUsingBlock:", v7);

}

- (void)_enumerateGlyphsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *, __n128, double, double, CGFloat, CGFloat, CGFloat);
  uint64_t Font;
  const __CTFont *v6;
  double v7;
  double v8;
  _UIVectorTextLayoutInfo *layoutInfo;
  uint64_t GlyphCount;
  uint64_t v11;
  CGGlyph *v12;
  uint64_t v13;
  uint64_t v14;
  __CTFrame *v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  _OWORD *v19;
  double *v20;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __n128 v25;
  __int128 v26;
  __int128 v27;
  CGAffineTransform v28;
  char v29;
  CGPoint origins;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  uint64_t v34;
  CFRange v35;
  CFRange v36;
  CFRange v37;
  CGRect BoundingRectsForGlyphs;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *, __n128, double, double, CGFloat, CGFloat, CGFloat))a3;
  Font = CTRunGetFont();
  if (Font)
  {
    v6 = (const __CTFont *)Font;
    -[_UIVectorTextLayoutInfo scale](self->_layoutInfo, "scale");
    v8 = v7;
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    layoutInfo = self->_layoutInfo;
    if (layoutInfo)
      -[_UIVectorTextLayoutInfo coordinateAdjustment](layoutInfo, "coordinateAdjustment");
    GlyphCount = CTRunGetGlyphCount(self->_runRef);
    MEMORY[0x1E0C80A78](GlyphCount);
    v12 = (CGGlyph *)((char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    v35.location = 0;
    v35.length = 0;
    CTRunGetGlyphs(self->_runRef, v35, v12);
    MEMORY[0x1E0C80A78](v13);
    MEMORY[0x1E0C80A78](v14);
    v36.location = 0;
    v36.length = 0;
    CTRunGetPositions(self->_runRef, v36, (CGPoint *)&v26 - GlyphCount);
    BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v6, kCTFontOrientationDefault, v12, (CGRect *)&v26 - GlyphCount, GlyphCount);
    origins.x = 0.0;
    origins.y = 0.0;
    v15 = -[_UIVectorTextLayoutInfo frame](self->_layoutInfo, "frame", BoundingRectsForGlyphs.origin.x, BoundingRectsForGlyphs.origin.y, BoundingRectsForGlyphs.size.width, BoundingRectsForGlyphs.size.height);
    v37.location = -[_UIVectorTextLayoutRun lineIndex](self, "lineIndex");
    v37.length = 1;
    CTFrameGetLineOrigins(v15, v37, &origins);
    v29 = 0;
    if (GlyphCount < 1)
    {
      v18 = 0;
    }
    else
    {
      v18 = 0;
      v19 = &v26 - 2 * GlyphCount + 1;
      v20 = (double *)&v26 - 2 * GlyphCount + 1;
      do
      {
        v39 = *(CGRect *)(v19 - 1);
        *(double *)&v16 = *(v20 - 1) + origins.x;
        *(double *)&v17 = *v20 + origins.y;
        v26 = v16;
        v27 = v17;
        v40 = CGRectOffset(v39, *(CGFloat *)&v16, *(CGFloat *)&v17);
        v41.origin.x = UIRectIntegralWithScale(v40.origin.x, v40.origin.y, v40.size.width, v40.size.height, v8);
        *(float64x2_t *)&v28.a = v31;
        *(float64x2_t *)&v28.c = v32;
        *(float64x2_t *)&v28.tx = v33;
        v42 = CGRectApplyAffineTransform(v41, &v28);
        x = v42.origin.x;
        y = v42.origin.y;
        width = v42.size.width;
        height = v42.size.height;
        if (!v29)
        {
          v25 = (__n128)vaddq_f64(v33, vaddq_f64(vmulq_n_f64(v31, *(double *)&v26), vmulq_n_f64(v32, *(double *)&v27)));
          v4[2](v4, *v12, &v29, v25, v25.n128_f64[1], x, v42.origin.y, v42.size.width, v42.size.height);
        }
        v43.origin.x = x;
        v43.origin.y = y;
        v43.size.width = width;
        v43.size.height = height;
        v18 += !CGRectIsEmpty(v43);
        ++v12;
        v19 += 2;
        v20 += 2;
        --GlyphCount;
      }
      while (GlyphCount);
    }
    self->_glyphCount = v18;
  }

}

- (unint64_t)lineIndex
{
  return self->_lineIndex;
}

- (__CTRun)_CTRun
{
  return self->_runRef;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (CGRect)lineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lineRect.origin.x;
  y = self->_lineRect.origin.y;
  width = self->_lineRect.size.width;
  height = self->_lineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLineRect:(CGRect)a3
{
  self->_lineRect = a3;
}

- (CGRect)usedLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_usedLineRect.origin.x;
  y = self->_usedLineRect.origin.y;
  width = self->_usedLineRect.size.width;
  height = self->_usedLineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUsedLineRect:(CGRect)a3
{
  self->_usedLineRect = a3;
}

- (CGRect)usedRunRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_usedRunRect.origin.x;
  y = self->_usedRunRect.origin.y;
  width = self->_usedRunRect.size.width;
  height = self->_usedRunRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUsedRunRect:(CGRect)a3
{
  self->_usedRunRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_sourceString, 0);
}

@end
