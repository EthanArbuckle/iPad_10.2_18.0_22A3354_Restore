@implementation THMultiLineLabel

- (THMultiLineLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  THMultiLineLabel *v7;
  THMultiLineLabel *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)THMultiLineLabel;
  v7 = -[THMultiLineLabel init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[THMultiLineLabel setFrame:](v7, "setFrame:", x, y, width, height);
    -[THMultiLineLabel setBackgroundColor:](v8, "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
    -[THMultiLineLabel setOpaque:](v8, "setOpaque:", 0);
    v8->_scale = 1.0;
  }
  return v8;
}

- (void)dealloc
{
  __CTTypesetter *typesetter;
  objc_super v4;

  self->_runIn = 0;
  self->_text = 0;

  self->_font = 0;
  self->_runInFont = 0;

  self->_textColor = 0;
  typesetter = self->_typesetter;
  if (typesetter)
  {
    CFRelease(typesetter);
    self->_typesetter = 0;
  }

  self->_textShadowColor = 0;
  v4.receiver = self;
  v4.super_class = (Class)THMultiLineLabel;
  -[THMultiLineLabel dealloc](&v4, "dealloc");
}

- (void)setRunIn:(id)a3
{
  NSString *v4;

  v4 = (NSString *)objc_msgSend(a3, "copy");

  self->_runIn = v4;
  -[THMultiLineLabel p_tearDownTypesetter](self, "p_tearDownTypesetter");
}

- (void)setText:(id)a3
{
  NSString *v4;

  v4 = (NSString *)objc_msgSend(a3, "copy");

  self->_text = v4;
  -[THMultiLineLabel p_tearDownTypesetter](self, "p_tearDownTypesetter");
}

- (void)setLineHeight:(double)a3
{
  self->_lineHeight = a3;
  -[THMultiLineLabel p_tearDownTypesetter](self, "p_tearDownTypesetter");
}

- (void)setFont:(id)a3
{
  TSUFont *v4;

  v4 = (TSUFont *)a3;

  self->_font = v4;
  -[THMultiLineLabel p_tearDownTypesetter](self, "p_tearDownTypesetter");
}

- (void)setRunInFont:(id)a3
{
  TSUFont *v4;

  v4 = (TSUFont *)a3;

  self->_runInFont = v4;
  -[THMultiLineLabel p_tearDownTypesetter](self, "p_tearDownTypesetter");
}

- (void)setTextColor:(id)a3
{
  TSUColor *v4;

  v4 = (TSUColor *)a3;

  self->_textColor = v4;
  -[THMultiLineLabel p_tearDownTypesetter](self, "p_tearDownTypesetter");
}

- (void)setAlignment:(int)a3
{
  double v4;
  UIUserInterfaceLayoutDirection v5;

  self->_alignment = a3;
  v4 = 0.5;
  switch(a3)
  {
    case 0:
    case 3:
      goto LABEL_4;
    case 1:
      break;
    case 2:
      v4 = 1.0;
      break;
    case 4:
      v5 = -[UIApplication userInterfaceLayoutDirection](+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0.5), "userInterfaceLayoutDirection");
      v4 = 0.0;
      if (v5 == UIUserInterfaceLayoutDirectionRightToLeft)
        v4 = 1.0;
      break;
    default:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0.5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THMultiLineLabel setAlignment:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THMultiLineLabel.mm"), 153, CFSTR("unrecognized alignment type"));
LABEL_4:
      v4 = 0.0;
      break;
  }
  self->_flushFactor = v4;
  -[THMultiLineLabel p_tearDownTypesetter](self, "p_tearDownTypesetter");
}

- (void)setTextShadowColor:(id)a3
{
  id v5;

  v5 = a3;

  self->_textShadowColor = (TSUColor *)a3;
  -[THMultiLineLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setTextShadowOffset:(CGSize)a3
{
  self->_textShadowOffset = a3;
  -[THMultiLineLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setTextShadowBlur:(double)a3
{
  self->_textShadowBlur = a3;
  -[THMultiLineLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  -[THMultiLineLabel p_tearDownTypesetter](self, "p_tearDownTypesetter");
}

- (unint64_t)lineCount
{
  double v3;

  -[THMultiLineLabel bounds](self, "bounds");
  return -[THMultiLineLabel lineCountForWidth:](self, "lineCountForWidth:", v3);
}

- (double)firstLineAscent
{
  double v3;
  double v4;
  const __CTLine *Line;
  const __CTLine *v6;
  CTLineRef JustifiedLine;
  CGFloat ascent;
  CFRange v10;

  ascent = 0.0;
  -[THMultiLineLabel p_ensureTypesetterCreated](self, "p_ensureTypesetterCreated");
  if (!self->_typesetter)
    return 0.0;
  -[THMultiLineLabel bounds](self, "bounds");
  v4 = v3;
  v10.length = CTTypesetterSuggestLineBreak(self->_typesetter, 0, v3);
  v10.location = 0;
  Line = CTTypesetterCreateLine(self->_typesetter, v10);
  v6 = Line;
  if (self->_alignment == 3)
  {
    JustifiedLine = CTLineCreateJustifiedLine(Line, 1.0, v4);
    CFRelease(v6);
    v6 = JustifiedLine;
  }
  CTLineGetTypographicBounds(v6, &ascent, 0, 0);
  CFRelease(v6);
  return ascent;
}

- (unint64_t)lineCountForWidth:(double)a3
{
  unint64_t v5;
  unint64_t v6;

  -[THMultiLineLabel p_ensureTypesetterCreated](self, "p_ensureTypesetterCreated");
  if (!self->_typesetter || !-[NSString length](self->_text, "length"))
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    v5 += CTTypesetterSuggestLineBreak(self->_typesetter, v5, a3);
    ++v6;
  }
  while (v5 < -[NSString length](self->_text, "length"));
  return v6;
}

- (void)resizeToFitTightly
{
  _QWORD v3[5];
  _QWORD v4[6];
  CGSize v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x4012000000;
  v4[3] = sub_D56DC;
  v4[4] = nullsub_21;
  v4[5] = "";
  v5 = CGSizeZero;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_D56EC;
  v3[3] = &unk_429318;
  v3[4] = v4;
  -[THMultiLineLabel p_enumerateLinesForWidth:withBlock:](self, "p_enumerateLinesForWidth:withBlock:", v3, 1.79769313e308);
  -[THMultiLineLabel bounds](self, "bounds");
  -[THMultiLineLabel setBounds:](self, "setBounds:");
  _Block_object_dispose(v4, 8);
}

- (void)resizeToFitCurrentWidth
{
  _QWORD v3[5];
  _QWORD v4[4];

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v4[3] = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_D5818;
  v3[3] = &unk_429318;
  v3[4] = v4;
  -[THMultiLineLabel p_enumerateLinesWithBlock:](self, "p_enumerateLinesWithBlock:", v3);
  -[THMultiLineLabel bounds](self, "bounds");
  -[THMultiLineLabel setBounds:](self, "setBounds:");
  _Block_object_dispose(v4, 8);
}

- (void)drawInContext:(CGContext *)a3
{
  TSUColor *textShadowColor;
  CGFloat width;
  CGFloat height;
  double textShadowBlur;
  CGColor *v9;
  _QWORD v10[5];
  CGAffineTransform v11;
  CGSize v12;

  CGContextSaveGState(a3);
  textShadowColor = self->_textShadowColor;
  if (textShadowColor)
  {
    width = self->_textShadowOffset.width;
    height = self->_textShadowOffset.height;
    textShadowBlur = self->_textShadowBlur;
    v9 = (CGColor *)-[TSUColor CGColor](textShadowColor, "CGColor");
    v12.width = width;
    v12.height = height;
    CGContextSetShadowWithColor(a3, v12, textShadowBlur, v9);
  }
  CGAffineTransformMakeScale(&v11, 1.0, -1.0);
  CGContextSetTextMatrix(a3, &v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_D595C;
  v10[3] = &unk_429338;
  v10[4] = a3;
  -[THMultiLineLabel p_enumerateLinesWithBlock:](self, "p_enumerateLinesWithBlock:", v10);
  CGContextRestoreGState(a3);
}

- (__CFAttributedString)p_createAttributedString
{
  __CFAttributedString *Mutable;
  CFIndex v4;
  NSUInteger v5;
  char *v6;
  const __CFString *runIn;
  const __CFString *text;
  const __CFString *v9;
  TSUFont *font;
  id v11;
  TSUColor *textColor;
  id v13;
  TSUFont *runInFont;
  id v15;
  CFRange v17;
  CFRange v18;
  CFRange v19;
  CFRange v20;

  Mutable = CFAttributedStringCreateMutable(0, -[NSString length](self->_runIn, "length") + -[NSString length](self->_text, "length"));
  v4 = -[NSString length](self->_runIn, "length");
  v5 = -[NSString length](self->_runIn, "length");
  v6 = (char *)-[NSString length](self->_text, "length") + v5;
  CFAttributedStringBeginEditing(Mutable);
  runIn = (const __CFString *)self->_runIn;
  text = &stru_43D7D8;
  if (!runIn)
    runIn = &stru_43D7D8;
  if (self->_text)
    text = (const __CFString *)self->_text;
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), runIn, text);
  v17.location = 0;
  v17.length = 0;
  CFAttributedStringReplaceString(Mutable, v17, v9);
  font = self->_font;
  if (font)
  {
    v11 = -[TSUFont CTFont](-[TSUFont fontWithScale:](font, "fontWithScale:", self->_scale), "CTFont");
    v18.location = 0;
    v18.length = (CFIndex)v6;
    CFAttributedStringSetAttribute(Mutable, v18, kCTFontAttributeName, v11);
  }
  textColor = self->_textColor;
  if (textColor)
  {
    v13 = -[TSUColor CGColor](textColor, "CGColor");
    v19.location = 0;
    v19.length = (CFIndex)v6;
    CFAttributedStringSetAttribute(Mutable, v19, kCTForegroundColorAttributeName, v13);
  }
  if (self->_runIn)
  {
    runInFont = self->_runInFont;
    if (runInFont)
    {
      v15 = -[TSUFont CTFont](-[TSUFont fontWithScale:](runInFont, "fontWithScale:", self->_scale), "CTFont");
      v20.location = 0;
      v20.length = v4;
      CFAttributedStringSetAttribute(Mutable, v20, kCTFontAttributeName, v15);
    }
  }
  CFAttributedStringEndEditing(Mutable);
  return Mutable;
}

- (void)p_ensureTypesetterCreated
{
  __CFAttributedString *v3;

  if (!self->_typesetter)
  {
    v3 = -[THMultiLineLabel p_createAttributedString](self, "p_createAttributedString");
    self->_typesetter = CTTypesetterCreateWithAttributedString(v3);
    CFRelease(v3);
  }
}

- (void)p_tearDownTypesetter
{
  __CTTypesetter *typesetter;

  typesetter = self->_typesetter;
  if (typesetter)
  {
    CFRelease(typesetter);
    self->_typesetter = 0;
  }
  -[THMultiLineLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)p_enumerateLinesWithBlock:(id)a3
{
  double v5;

  -[THMultiLineLabel bounds](self, "bounds");
  -[THMultiLineLabel p_enumerateLinesForWidth:withBlock:](self, "p_enumerateLinesForWidth:withBlock:", a3, v5);
}

- (void)p_enumerateLinesForWidth:(double)a3 withBlock:(id)a4
{
  THMultiLineLabel *v6;
  uint64_t v7;
  double lineHeight;
  double v9;
  double v10;
  TSUFont *runInFont;
  double v12;
  double scale;
  uint64_t v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  int *v18;
  int *v19;
  CFIndex v20;
  const __CTLine *Line;
  const __CTLine *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  int *v26;
  int *v27;
  CTLineRef JustifiedLine;
  double PenOffsetForFlush;
  float v30;
  float v31;
  THMultiLineLabel *v32;
  CGFloat descent;
  CFRange v34;

  v6 = self;
  -[THMultiLineLabel p_ensureTypesetterCreated](self, "p_ensureTypesetterCreated");
  v7 = 112;
  if (v6->_typesetter)
  {
    lineHeight = v6->_lineHeight;
    if (lineHeight == 0.0)
    {
      -[TSUFont lineHeight](v6->_font, "lineHeight");
      v10 = v9;
      runInFont = v6->_runInFont;
      if (runInFont)
        -[TSUFont lineHeight](runInFont, "lineHeight");
      else
        v12 = 0.0;
      lineHeight = fmax(v10, v12);
    }
    scale = v6->_scale;
    v14 = 16;
    if (-[NSString length](v6->_text, "length"))
    {
      v15 = 0;
      v16 = lineHeight * scale;
      v17 = 1;
      v18 = &OBJC_IVAR___THChapterBrowserController__originalCanvasScrollViewFrame;
      v19 = &OBJC_IVAR___THChapterBrowserController__originalCanvasScrollViewFrame;
      v32 = v6;
      do
      {
        v20 = CTTypesetterSuggestLineBreak(*(CTTypesetterRef *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v7], v15, a3);
        v34.location = v15;
        v34.length = v20;
        Line = CTTypesetterCreateLine(*(CTTypesetterRef *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v7], v34);
        v22 = Line;
        if (*(_DWORD *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v18[455]] == 3)
        {
          v23 = v7;
          v24 = a4;
          v25 = v14;
          v26 = v19;
          v27 = v18;
          JustifiedLine = CTLineCreateJustifiedLine(Line, 1.0, a3);
          CFRelease(v22);
          v22 = JustifiedLine;
          v18 = v27;
          v19 = v26;
          v14 = v25;
          a4 = v24;
          v7 = v23;
          v6 = v32;
        }
        PenOffsetForFlush = CTLineGetPenOffsetForFlush(v22, *(CGFloat *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v19[456]], a3);
        descent = 0.0;
        CTLineGetTypographicBounds(v22, 0, &descent, 0);
        v30 = PenOffsetForFlush;
        v31 = -(descent - (double)v17 * v16);
        (*((void (**)(id, const __CTLine *, double, double))a4 + 2))(a4, v22, roundf(v30), roundf(v31));
        CFRelease(v22);
        v15 += v20;
        ++v17;
      }
      while (v15 < (unint64_t)objc_msgSend(*(id *)&v6->TSDNoDefaultImplicitActionLayer_opaque[v14], "length"));
    }
  }
}

- (NSString)runIn
{
  return self->_runIn;
}

- (NSString)text
{
  return self->_text;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (TSUFont)font
{
  return self->_font;
}

- (TSUFont)runInFont
{
  return self->_runInFont;
}

- (TSUColor)textColor
{
  return self->_textColor;
}

- (int)alignment
{
  return self->_alignment;
}

- (TSUColor)textShadowColor
{
  return self->_textShadowColor;
}

- (CGSize)textShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_textShadowOffset.width;
  height = self->_textShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)textShadowBlur
{
  return self->_textShadowBlur;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)textSize
{
  double width;
  double height;
  CGSize result;

  width = self->_textSize.width;
  height = self->_textSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
