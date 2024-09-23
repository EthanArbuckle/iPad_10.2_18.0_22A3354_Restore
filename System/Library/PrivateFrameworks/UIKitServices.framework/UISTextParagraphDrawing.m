@implementation UISTextParagraphDrawing

- (UISTextParagraphDrawing)initWithString:(id)a3 attributes:(__CFDictionary *)a4 size:(CGSize)a5 numberOfLines:(unsigned __int8)a6 scale:(double)a7
{
  unsigned int v8;
  double height;
  CGFloat width;
  __CFString *v13;
  UISTextParagraphDrawing *v14;
  UISTextParagraphDrawing *v15;
  const __CFAllocator *Default;
  const __CFAttributedString *v17;
  const __CTFramesetter *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  const CGPath *v23;
  const __CTFrame *Frame;
  const __CFArray *Lines;
  CFIndex Count;
  unsigned __int8 v27;
  CGPoint *v28;
  const __CTLine *ValueAtIndex;
  const __CTLine *v30;
  uint64_t v32;
  CGFloat descent;
  CGFloat ascent;
  objc_super v35;
  uint64_t v36;
  CFRange v37;
  CFRange v38;

  v8 = a6;
  height = a5.height;
  width = a5.width;
  v36 = *MEMORY[0x1E0C80C00];
  v13 = (__CFString *)a3;
  v35.receiver = self;
  v35.super_class = (Class)UISTextParagraphDrawing;
  v14 = -[UISTextParagraphDrawing init](&v35, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_scale = a7;
    Default = CFAllocatorGetDefault();
    v17 = CFAttributedStringCreate(Default, v13, a4);
    v15->_textString = v17;
    v18 = CTFramesetterCreateWithAttributedString(v17);
    if (height <= 0.0)
      v19 = 10000.0;
    else
      v19 = height;
    v15->_frameSize.width = width;
    v15->_frameSize.height = v19;
    v20 = 0;
    v21 = 0;
    v22 = width;
    v23 = CGPathCreateWithRect(*(CGRect *)(&v19 - 3), 0);
    v37.location = 0;
    v37.length = 0;
    Frame = CTFramesetterCreateFrame(v18, v37, v23, 0);
    v15->_frame = Frame;
    Lines = CTFrameGetLines(Frame);
    Count = CFArrayGetCount(Lines);
    v27 = v8;
    if (Count < v8)
      v27 = Count;
    if (!v8)
      v27 = Count;
    v15->_lineCount = v27;
    if (v27)
    {
      CFArrayGetCount(Lines);
      v28 = (CGPoint *)(&v32 - 2 * MEMORY[0x1E0C80A78]());
      v38.location = 0;
      v38.length = 0;
      CTFrameGetLineOrigins(v15->_frame, v38, v28);
      descent = 0.0;
      ascent = 0.0;
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0);
      CTLineGetTypographicBounds(ValueAtIndex, &ascent, 0, 0);
      v30 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v15->_lineCount - 1);
      CTLineGetTypographicBounds(v30, 0, &descent, 0);
      v15->_drawingHeight = ceil((v28->y - v28[v15->_lineCount - 1].y + ascent + descent) * v15->_scale) / v15->_scale;
    }
    if (v18)
      CFRelease(v18);
    if (v23)
      CFRelease(v23);
  }

  return v15;
}

- (CGRect)alignmentRect
{
  double width;
  double drawingHeight;
  double v4;
  double v5;
  CGRect result;

  width = self->_frameSize.width;
  drawingHeight = self->_drawingHeight;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = drawingHeight;
  result.size.width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y;
  CGFloat x;
  const __CFArray *Lines;
  unsigned __int8 Count;
  unsigned int v10;
  BOOL v11;
  CGFloat v12;
  uint64_t v13;
  uint64_t v14;
  CGPoint *v15;
  const __CFArray *v16;
  unint64_t lineCount;
  CFIndex v18;
  CGFloat *p_y;
  const __CTLine *ValueAtIndex;
  CFIndex v21;
  const __CTLine *v22;
  CFIndex Length;
  CFIndex v24;
  const __CTLine *v25;
  CFRange StringRange;
  CFIndex v27;
  const __CFAttributedString *v28;
  CTLineRef v29;
  const __CTLine *TruncatedLineWithTokenHandler;
  int IsRightToLeft;
  double v32;
  double PenOffsetForFlush;
  uint64_t v34;
  CGAffineTransform transform;
  uint64_t v36;
  CFRange v37;
  CFRange v38;

  y = a4.y;
  x = a4.x;
  v36 = *MEMORY[0x1E0C80C00];
  Lines = CTFrameGetLines(self->_frame);
  Count = CFArrayGetCount(Lines);
  v10 = Count;
  if (self->_lineCount)
    v11 = Count >= self->_lineCount;
  else
    v11 = 0;
  if (v11)
  {
    v12 = y + self->_frameSize.height;
    transform.a = 1.0;
    transform.b = 0.0;
    transform.c = 0.0;
    transform.d = -1.0;
    transform.tx = x;
    transform.ty = v12;
    CGContextConcatCTM(a3, &transform);
    v13 = CGContextSetFontRenderingStyle();
    if (self->_frameSize.height == 10000.0 && self->_lineCount == Count)
    {
      CTFrameDraw(self->_frame, a3);
    }
    else
    {
      MEMORY[0x1E0C80A78](v13);
      v15 = (CGPoint *)((char *)&v34 - v14);
      v16 = CTFrameGetLines(self->_frame);
      v37.location = 0;
      v37.length = 0;
      CTFrameGetLineOrigins(self->_frame, v37, v15);
      lineCount = self->_lineCount;
      if (lineCount < 2)
      {
        v21 = lineCount - 1;
      }
      else
      {
        v18 = 0;
        p_y = &v15->y;
        do
        {
          ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(v16, v18);
          CGContextSetTextPosition(a3, *(p_y - 1), *p_y);
          CTLineDraw(ValueAtIndex, a3);
          ++v18;
          v21 = self->_lineCount - 1;
          p_y += 2;
        }
        while (v18 < v21);
      }
      v22 = (const __CTLine *)CFArrayGetValueAtIndex(v16, v21);
      Length = CFAttributedStringGetLength(self->_textString);
      v24 = self->_lineCount;
      if (v10 <= v24)
      {
        v27 = Length;
      }
      else
      {
        v25 = (const __CTLine *)CFArrayGetValueAtIndex(v16, v24);
        StringRange = CTLineGetStringRange(v25);
        v27 = StringRange.location + StringRange.length;
      }
      v38.location = CTLineGetStringRange(v22).location;
      v38.length = v27 - v38.location;
      v28 = CFAttributedStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_textString, v38);
      v29 = CTLineCreateWithAttributedString(v28);
      TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();
      IsRightToLeft = CTLineIsRightToLeft();
      v32 = 0.0;
      if (IsRightToLeft)
        v32 = 1.0;
      PenOffsetForFlush = CTLineGetPenOffsetForFlush(TruncatedLineWithTokenHandler, v32, self->_frameSize.width);
      CGContextSetTextPosition(a3, PenOffsetForFlush, v15[self->_lineCount - 1].y);
      CTLineDraw(TruncatedLineWithTokenHandler, a3);
      if (v28)
        CFRelease(v28);
      if (v29)
        CFRelease(v29);
      if (TruncatedLineWithTokenHandler)
        CFRelease(TruncatedLineWithTokenHandler);
    }
  }
}

- (CGSize)drawingSize
{
  double width;
  double drawingHeight;
  CGSize result;

  width = self->_frameSize.width;
  drawingHeight = self->_drawingHeight;
  result.height = drawingHeight;
  result.width = width;
  return result;
}

- (void)dealloc
{
  __CFAttributedString *textString;
  __CTFrame *frame;
  objc_super v5;

  textString = self->_textString;
  if (textString)
    CFRelease(textString);
  frame = self->_frame;
  if (frame)
    CFRelease(frame);
  v5.receiver = self;
  v5.super_class = (Class)UISTextParagraphDrawing;
  -[UISTextParagraphDrawing dealloc](&v5, sel_dealloc);
}

- (unsigned)lineCount
{
  return self->_lineCount;
}

@end
