@implementation THLabelWithWordHighlights

- (THLabelWithWordHighlights)initWithFrame:(CGRect)a3
{
  THLabelWithWordHighlights *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THLabelWithWordHighlights;
  v3 = -[THLabelWithWordHighlights initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->mTextColor = +[UIColor blackColor](UIColor, "blackColor");
    v3->mTextFont = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0);
    v3->mHighlightedTextColor = +[UIColor blackColor](UIColor, "blackColor");
    v3->mHighlightedTextFont = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 15.0);
    -[THLabelWithWordHighlights setOpaque:](v3, "setOpaque:", 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[THLabelWithWordHighlights setText:](self, "setText:", 0);
  -[THLabelWithWordHighlights setTextColor:](self, "setTextColor:", 0);
  -[THLabelWithWordHighlights setTextFont:](self, "setTextFont:", 0);
  -[THLabelWithWordHighlights setHighlightedTextColor:](self, "setHighlightedTextColor:", 0);
  -[THLabelWithWordHighlights setHighlightedTextFont:](self, "setHighlightedTextFont:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THLabelWithWordHighlights;
  -[THLabelWithWordHighlights dealloc](&v3, "dealloc");
}

- (void)drawRect:(CGRect)a3
{
  NSArray *v4;
  id v5;
  id v6;
  NSMutableString *v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __CFAttributedString *Mutable;
  id v12;
  const __CFString *v13;
  CGFloat v14;
  CTFontRef v15;
  CGColor *v16;
  const __CFString *v17;
  CGFloat v18;
  id v19;
  id v20;
  CFIndex v21;
  uint64_t v22;
  void *j;
  void *v24;
  id v25;
  CGColor *v26;
  CGContext *CurrentContext;
  __int128 v28;
  CGFloat v29;
  const __CTLine *v30;
  double v31;
  double v32;
  double v33;
  CTFontRef cf;
  __CFAttributedString *aStr;
  CGAffineTransform v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  CFRange v47;
  CFRange v48;
  CFRange v49;
  CFRange v50;
  CFRange v51;

  if (-[NSString length](self->mText, "length", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    v4 = -[NSString componentsSeparatedByCharactersInSet:](self->mText, "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          if (v7)
          {
            -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i));
          }
          else
          {
            v7 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", -[NSString length](self->mText, "length"));
            -[NSMutableString appendString:](v7, "appendString:", v10);
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    Mutable = CFAttributedStringCreateMutable(0, 0);
    CFAttributedStringBeginEditing(Mutable);
    v47.location = 0;
    v47.length = 0;
    CFAttributedStringReplaceString(Mutable, v47, (CFStringRef)v7);
    v12 = -[NSMutableString length](v7, "length");
    v13 = -[UIFont fontName](self->mTextFont, "fontName");
    -[UIFont pointSize](self->mTextFont, "pointSize");
    v15 = CTFontCreateWithName(v13, v14, 0);
    v48.location = 0;
    v48.length = (CFIndex)v12;
    CFAttributedStringSetAttribute(Mutable, v48, kCTFontAttributeName, v15);
    v16 = -[UIColor CGColor](self->mTextColor, "CGColor");
    aStr = Mutable;
    v49.location = 0;
    v49.length = (CFIndex)v12;
    CFAttributedStringSetAttribute(Mutable, v49, kCTForegroundColorAttributeName, v16);
    CFRelease(v15);
    if (self->mDelegate)
    {
      v17 = -[UIFont fontName](self->mHighlightedTextFont, "fontName");
      -[UIFont pointSize](self->mHighlightedTextFont, "pointSize");
      cf = CTFontCreateWithName(v17, v18, 0);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v4);
            v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
            if (v21 > 0)
              ++v21;
            if (-[THLabelWithWordHighlightsDelegate shouldHighlightWord:](self->mDelegate, "shouldHighlightWord:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j)))
            {
              v25 = objc_msgSend(v24, "length");
              v50.location = v21;
              v50.length = (CFIndex)v25;
              CFAttributedStringSetAttribute(aStr, v50, kCTFontAttributeName, cf);
              v26 = -[UIColor CGColor](self->mHighlightedTextColor, "CGColor");
              v51.location = v21;
              v51.length = (CFIndex)v25;
              CFAttributedStringSetAttribute(aStr, v51, kCTForegroundColorAttributeName, v26);
            }
            v21 += (CFIndex)objc_msgSend(v24, "length");
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v20);
      }
      CFRelease(cf);
    }
    CFAttributedStringEndEditing(aStr);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v28 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v36.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v36.c = v28;
    *(_OWORD *)&v36.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGContextSetTextMatrix(CurrentContext, &v36);
    -[THLabelWithWordHighlights frame](self, "frame");
    CGContextTranslateCTM(CurrentContext, 0.0, v29);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v30 = CTLineCreateWithAttributedString(aStr);
    -[THLabelWithWordHighlights frame](self, "frame");
    v32 = v31;
    -[UIFont capHeight](self->mTextFont, "capHeight");
    *(float *)&v33 = (v32 - v33) * 0.5;
    CGContextSetTextPosition(CurrentContext, 0.0, floorf(*(float *)&v33));
    CTLineDraw(v30, CurrentContext);
    CFRelease(v30);
    CFRelease(aStr);
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)setText:(id)a3
{
  NSString *mText;

  mText = self->mText;
  if (mText != a3)
  {
    if (mText)

    self->mText = (NSString *)objc_msgSend(a3, "copy");
    -[THLabelWithWordHighlights setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (THLabelWithWordHighlightsDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THLabelWithWordHighlightsDelegate *)a3;
}

- (NSString)text
{
  return self->mText;
}

- (UIFont)textFont
{
  return self->mTextFont;
}

- (void)setTextFont:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIColor)textColor
{
  return self->mTextColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (UIColor)highlightedTextColor
{
  return self->mHighlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UIFont)highlightedTextFont
{
  return self->mHighlightedTextFont;
}

- (void)setHighlightedTextFont:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
