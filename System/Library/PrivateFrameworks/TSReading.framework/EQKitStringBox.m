@implementation EQKitStringBox

- (EQKitStringBox)initWithAttributedString:(id)a3 cgColor:(CGColor *)a4
{
  EQKitStringBox *v6;
  CGColor *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EQKitStringBox;
  v6 = -[EQKitStringBox init](&v9, sel_init);
  if (v6)
  {
    v6->mAttributedString = (NSAttributedString *)objc_msgSend(a3, "copy");
    if (a4)
      v7 = (CGColor *)CFRetain(a4);
    else
      v7 = 0;
    v6->mCGColor = v7;
  }
  return v6;
}

- (EQKitStringBox)init
{
  return -[EQKitStringBox initWithAttributedString:cgColor:](self, "initWithAttributedString:cgColor:", 0, 0);
}

- (void)dealloc
{
  __CTLine *mLine;
  objc_super v4;

  mLine = self->mLine;
  if (mLine)
    CFRelease(mLine);
  CGColorRelease(self->mCGColor);
  v4.receiver = self;
  v4.super_class = (Class)EQKitStringBox;
  -[EQKitStringBox dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAttributedString:cgColor:", -[EQKitStringBox attributedString](self, "attributedString"), self->mCGColor);
}

- (BOOL)isEqual:(id)a3
{
  EQKitStringBox *v3;
  BOOL v4;
  EQKitStringBox *v6;
  EQKitStringBox *v7;

  v3 = self;
  v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
      if ((_DWORD)self)
      {
        v6 = -[EQKitStringBox attributedString](v3, "attributedString");
        self = (EQKitStringBox *)objc_msgSend(a3, "attributedString");
        if (v6 == self
          || (v7 = self, LOBYTE(self) = 0, v6)
          && v7
          && (LODWORD(self) = -[EQKitStringBox isEqualToAttributedString:](v6, "isEqualToAttributedString:"),
              (_DWORD)self))
        {
          LOBYTE(self) = CGColorEqualToColor(-[EQKitStringBox color](v3, "color"), (CGColorRef)objc_msgSend(a3, "color"));
        }
      }
    }
  }
  return (char)self;
}

- (double)height
{
  if (!self->mDimensionsValid)
  {
    -[EQKitStringBox p_cacheDimensions](self, "p_cacheDimensions");
    self->mDimensionsValid = 1;
  }
  return self->mHeight;
}

- (double)depth
{
  if (!self->mDimensionsValid)
  {
    -[EQKitStringBox p_cacheDimensions](self, "p_cacheDimensions");
    self->mDimensionsValid = 1;
  }
  return self->mDepth;
}

- (double)width
{
  if (!self->mDimensionsValid)
  {
    -[EQKitStringBox p_cacheDimensions](self, "p_cacheDimensions");
    self->mDimensionsValid = 1;
  }
  return self->mWidth;
}

- (CGRect)erasableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (!self->mDimensionsValid)
  {
    -[EQKitStringBox p_cacheDimensions](self, "p_cacheDimensions");
    self->mDimensionsValid = 1;
  }
  x = self->mErasableBounds.origin.x;
  y = self->mErasableBounds.origin.y;
  width = self->mErasableBounds.size.width;
  height = self->mErasableBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (__CTLine)line
{
  __CTLine *result;

  result = self->mLine;
  if (!result)
  {
    result = -[EQKitStringBox attributedString](self, "attributedString");
    if (result)
      result = CTLineCreateWithAttributedString(result);
    self->mLine = result;
  }
  return result;
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  __CTLine *v8;
  const __CTLine *v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v14.receiver = self;
  v14.super_class = (Class)EQKitStringBox;
  -[EQKitBox renderIntoContext:offset:](&v14, sel_renderIntoContext_offset_);
  if (a3)
  {
    v8 = -[EQKitStringBox line](self, "line");
    if (v8)
    {
      v9 = v8;
      if (self->mCGColor)
      {
        CGContextSaveGState(a3);
        CGContextSetFillColorWithColor(a3, self->mCGColor);
      }
      memset(&v13, 0, sizeof(v13));
      v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v12.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v12.c = v10;
      *(_OWORD *)&v12.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      CGAffineTransformScale(&v13, &v12, 1.0, -1.0);
      v11 = v13;
      CGContextSetTextMatrix(a3, &v11);
      CGContextSetTextPosition(a3, x, y);
      CTLineDraw(v9, a3);
      if (self->mCGColor)
        CGContextRestoreGState(a3);
    }
  }
}

- (double)positionOfCharacterAtIndex:(unint64_t)a3
{
  __CTLine *v5;
  const __CTLine *v6;

  v5 = -[EQKitStringBox line](self, "line");
  if (v5
    && (v6 = v5,
        -[NSAttributedString length](-[EQKitStringBox attributedString](self, "attributedString"), "length") >= a3))
  {
    return CTLineGetOffsetForStringIndex(v6, a3, 0);
  }
  else
  {
    return 0.0;
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  uint64_t GlyphRuns;
  const __CFArray *v8;
  int v9;
  const __CTRun *ValueAtIndex;
  const __CTRun *v11;
  const __CFDictionary *Attributes;
  const __CTFont *Value;
  int v14;
  const __CTRun *v15;
  const __CTRun *v16;
  CFIndex GlyphCount;
  CFIndex v18;
  const __CFDictionary *v19;
  BOOL v20;
  const __CTFont *v21;
  CGPoint v23;
  CGGlyph buffer;
  CFRange v25;
  CFRange v26;
  CFRange v27;
  CFRange v28;
  CGPoint v29;
  CGPoint v30;

  y = a4.y;
  x = a4.x;
  GlyphRuns = -[EQKitStringBox line](self, "line");
  if (GlyphRuns)
  {
    GlyphRuns = (uint64_t)CTLineGetGlyphRuns((CTLineRef)GlyphRuns);
    v8 = (const __CFArray *)GlyphRuns;
    if (GlyphRuns)
      GlyphRuns = CFArrayGetCount((CFArrayRef)GlyphRuns);
  }
  else
  {
    v8 = 0;
  }
  v9 = *((_DWORD *)a3 + 6);
  if (v9 != 2)
  {
    if (!v9)
    {
      if (GlyphRuns >= 1
        && (ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(v8, 0)) != 0
        && (v11 = ValueAtIndex, CTRunGetGlyphCount(ValueAtIndex) >= 1)
        && (buffer = 0,
            v25.location = 0,
            v25.length = 1,
            CTRunGetGlyphs(v11, v25, &buffer),
            (Attributes = CTRunGetAttributes(v11)) != 0))
      {
        Value = (const __CTFont *)CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x24BDC4C28]);
        v14 = 1;
        v26.location = 0;
        v26.length = 1;
        CTRunGetPositions(v11, v26, &v23);
        v29.x = x + v23.x;
        v29.y = y + v23.y;
        EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v29, Value, buffer);
      }
      else
      {
        v14 = 0;
      }
      return v14 != 0;
    }
    return 0;
  }
  if (GlyphRuns < 1)
    return 0;
  v15 = (const __CTRun *)CFArrayGetValueAtIndex(v8, GlyphRuns - 1);
  if (!v15)
    return 0;
  v16 = v15;
  GlyphCount = CTRunGetGlyphCount(v15);
  v18 = GlyphCount - 1;
  if (GlyphCount < 1)
    return 0;
  buffer = 0;
  v27.location = GlyphCount - 1;
  v27.length = 1;
  CTRunGetGlyphs(v16, v27, &buffer);
  v19 = CTRunGetAttributes(v16);
  v20 = v19 != 0;
  if (v19)
  {
    v21 = (const __CTFont *)CFDictionaryGetValue(v19, (const void *)*MEMORY[0x24BDC4C28]);
    v28.location = v18;
    v28.length = 1;
    CTRunGetPositions(v16, v28, &v23);
    v30.x = x + v23.x;
    v30.y = y + v23.y;
    EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v30, v21, buffer);
  }
  return v20;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitStringBox height](self, "height");
  v6 = v5;
  -[EQKitStringBox depth](self, "depth");
  v8 = v7;
  -[EQKitStringBox width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f attributedString=%@"), v4, self, v6, v8, v9, -[EQKitStringBox attributedString](self, "attributedString"));
}

- (void)p_cacheDimensions
{
  CGRect *p_mErasableBounds;
  CGSize v4;
  __CTLine *v5;
  const __CTLine *v6;
  CGContext *FakeContext;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double MinY;
  double TypographicBounds;
  CGFloat MinX;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect ImageBounds;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  self->mHeight = 0.0;
  self->mDepth = 0.0;
  self->mWidth = 0.0;
  p_mErasableBounds = &self->mErasableBounds;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->mErasableBounds.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->mErasableBounds.size = v4;
  v5 = -[EQKitStringBox line](self, "line");
  if (v5)
  {
    v6 = v5;
    FakeContext = (CGContext *)EQKitUtilGetFakeContext();
    ImageBounds = CTLineGetImageBounds(v6, FakeContext);
    x = ImageBounds.origin.x;
    y = ImageBounds.origin.y;
    width = ImageBounds.size.width;
    height = ImageBounds.size.height;
    MaxY = CGRectGetMaxY(ImageBounds);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    MinY = CGRectGetMinY(v20);
    TypographicBounds = CTLineGetTypographicBounds(v6, 0, 0, 0);
    if (TypographicBounds > 0.0)
    {
      self->mHeight = MaxY;
      self->mDepth = -MinY;
      self->mWidth = TypographicBounds;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      MinX = CGRectGetMinX(v21);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v16 = -CGRectGetMaxY(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v17 = CGRectGetWidth(v23);
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v18 = CGRectGetHeight(v24);
      p_mErasableBounds->origin.x = MinX;
      p_mErasableBounds->origin.y = v16;
      p_mErasableBounds->size.width = v17;
      p_mErasableBounds->size.height = v18;
    }
  }
}

- (NSAttributedString)attributedString
{
  return self->mAttributedString;
}

- (CGColor)color
{
  return self->mCGColor;
}

@end
