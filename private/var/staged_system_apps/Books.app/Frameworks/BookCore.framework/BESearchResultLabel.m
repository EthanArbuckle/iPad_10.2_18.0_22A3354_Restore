@implementation BESearchResultLabel

- (void)dealloc
{
  objc_super v3;

  -[BESearchResultLabel setBoldColor:](self, "setBoldColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BESearchResultLabel;
  -[BESearchResultLabel dealloc](&v3, "dealloc");
}

- (void)updateConstraints
{
  objc_super v3;

  -[BESearchResultLabel layoutLines](self, "layoutLines");
  v3.receiver = self;
  v3.super_class = (Class)BESearchResultLabel;
  -[BESearchResultLabel updateConstraints](&v3, "updateConstraints");
}

- (void)setBoldColor:(id)a3
{
  objc_storeStrong((id *)&self->_boldColor, a3);
  -[BESearchResultLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setBoldRange:(_NSRange)a3
{
  self->_boldRange = a3;
  -[BESearchResultLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BESearchResultLabel;
  -[BESearchResultLabel setPreferredMaxLayoutWidth:](&v4, "setPreferredMaxLayoutWidth:", a3);
  -[BESearchResultLabel layoutLines](self, "layoutLines");
  -[BESearchResultLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)layoutLines
{
  BESearchResultLabel *v2;
  id v3;
  __CFString *v4;
  __CFAttributedString *Mutable;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  id v15;
  CFIndex v16;
  CFIndex v17;
  void *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  const __CFArray *v23;
  unint64_t v24;
  CFIndex Count;
  const __CTTypesetter *v26;
  CFIndex v27;
  CTLineRef Line;
  CTLineRef v29;
  unint64_t v30;
  id v31;
  CFIndex v32;
  __CFArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFIndex v37;
  CFIndex v38;
  const __CTLine *ValueAtIndex;
  CTLineTruncationType v41;
  BOOL v42;
  CFRange StringRange;
  CFIndex location;
  CFRange v45;
  const __CTLine *v46;
  id v47;
  id v48;
  BESearchResultLabel *v49;
  id v50;
  id v51;
  const __CTLine *v52;
  CTLineRef TruncatedLine;
  CTLineRef v54;
  const void *v55;
  void *v56;
  void *v57;
  __CFAttributedString *cf;
  CFIndex v59;
  const void *v60;
  const __CTTypesetter *typesetter;
  __CFArray *theArray;
  __CFString *replacement;
  CFRange v64;
  CFRange v65;
  CFRange v66;
  CFRange v67;
  CFRange v68;
  CFRange v69;
  CFRange v70;
  CFRange v71;
  CFRange v72;

  v2 = self;
  replacement = (__CFString *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel text](self, "text"));
  v3 = -[__CFString length](replacement, "length");
  v4 = replacement;
  if (v3)
  {
    Mutable = CFAttributedStringCreateMutable(0, (CFIndex)-[__CFString length](replacement, "length"));
    v64.location = 0;
    v64.length = 0;
    CFAttributedStringReplaceString(Mutable, v64, replacement);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel font](v2, "font"));

    v65.length = (CFIndex)-[__CFString length](replacement, "length");
    v65.location = 0;
    v60 = v6;
    CFAttributedStringSetAttribute(Mutable, v65, kCTFontAttributeName, v6);
    v7 = -[__CFString length](replacement, "length");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel textColor](v2, "textColor")));
    v9 = objc_msgSend(v8, "CGColor");
    v66.location = 0;
    v66.length = (CFIndex)v7;
    CFAttributedStringSetAttribute(Mutable, v66, kCTForegroundColorAttributeName, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel font](v2, "font"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontDescriptor"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 2));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel font](v2, "font"));
    objc_msgSend(v13, "pointSize");
    v14 = (const void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12));

    v15 = -[BESearchResultLabel boldRange](v2, "boldRange");
    -[BESearchResultLabel boldRange](v2, "boldRange");
    v17 = v16;
    v67.location = (CFIndex)v15;
    v67.length = v17;
    CFAttributedStringSetAttribute(Mutable, v67, kCTFontAttributeName, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel boldColor](v2, "boldColor"));

    if (v18)
    {
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel boldColor](v2, "boldColor")));
      v20 = objc_msgSend(v19, "CGColor");
      v68.location = (CFIndex)v15;
      v68.length = v17;
      CFAttributedStringSetAttribute(Mutable, v68, kCTForegroundColorAttributeName, v20);

    }
    typesetter = CTTypesetterCreateWithAttributedString(Mutable);
    -[BESearchResultLabel preferredMaxLayoutWidth](v2, "preferredMaxLayoutWidth");
    v22 = v21;
    v23 = CFArrayCreateMutable(0, 5, &kCFTypeArrayCallBacks);
    v57 = (void *)v12;
    cf = Mutable;
    v55 = v14;
    if (-[__CFString length](replacement, "length"))
    {
      v24 = 0;
      Count = 0;
      v26 = typesetter;
      do
      {
        v27 = CTTypesetterSuggestLineBreak(typesetter, v24, v22);
        v69.location = v24;
        v69.length = v27;
        Line = CTTypesetterCreateLine(typesetter, v69);
        if (!Line)
          break;
        v29 = Line;
        v30 = v27 + v24;
        if (v24 <= (unint64_t)-[BESearchResultLabel boldRange](v2, "boldRange", v55, v57, cf)
          && v30 >= (unint64_t)-[BESearchResultLabel boldRange](v2, "boldRange"))
        {
          Count = CFArrayGetCount(v23);
        }
        CFArrayAppendValue(v23, v29);
        CFRelease(v29);
        v24 += v27;
      }
      while (v30 < (unint64_t)-[__CFString length](replacement, "length"));
    }
    else
    {
      Count = 0;
      v26 = typesetter;
    }
    v31 = -[BESearchResultLabel numberOfLines](v2, "numberOfLines", v55);
    if ((uint64_t)v31 <= 1)
      v32 = 1;
    else
      v32 = (CFIndex)v31;
    v33 = CFArrayCreateMutable(0, v32, &kCFTypeArrayCallBacks);
    if (CFArrayGetCount(v23) <= v32)
    {
      v72.length = CFArrayGetCount(v23);
      v72.location = 0;
      CFArrayAppendArray(v33, v23, v72);
    }
    else
    {
      if (Count <= 1)
        v34 = 1;
      else
        v34 = Count;
      v35 = v34 - 1;
      if (v34 - 1 > CFArrayGetCount(v23) - v32)
        v35 = CFArrayGetCount(v23) - v32;
      v36 = 0;
      v37 = v35 + v32;
      v38 = v32 - 1;
      theArray = v33;
      v59 = v32 - 1;
      do
      {
        ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(v23, v35 + v36);
        v41 = v37 < CFArrayGetCount(v23) && v38 == v36;
        if (v36)
          v42 = 1;
        else
          v42 = v35 <= 0;
        if (!v42 || v41)
        {
          StringRange = CTLineGetStringRange(ValueAtIndex);
          location = StringRange.location;
          if (v41)
          {
            v45.length = (CFIndex)-[__CFString length](replacement, "length") - StringRange.location;
          }
          else
          {
            v45.length = StringRange.length + StringRange.location;
            location = 0;
          }
          v45.location = location;
          v46 = CTTypesetterCreateLine(v26, v45);
          v47 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", CFSTR("…"));
          v70.length = (CFIndex)objc_msgSend(v47, "length");
          v70.location = 0;
          CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v47, v70, kCTFontAttributeName, v60);
          v48 = objc_msgSend(v47, "length");
          v49 = v2;
          v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel textColor](v2, "textColor")));
          v51 = objc_msgSend(v50, "CGColor");
          v71.location = 0;
          v71.length = (CFIndex)v48;
          CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v47, v71, kCTForegroundColorAttributeName, v51);

          v52 = CTLineCreateWithAttributedString((CFAttributedStringRef)v47);
          TruncatedLine = CTLineCreateTruncatedLine(v46, v22, v41, v52);
          if (TruncatedLine)
          {
            v54 = TruncatedLine;
            CFArrayAppendValue(theArray, TruncatedLine);
            CFRelease(v54);
          }
          CFRelease(v46);
          CFRelease(v52);

          v2 = v49;
          v26 = typesetter;
          v33 = theArray;
          v38 = v59;
        }
        else
        {
          CFArrayAppendValue(v33, ValueAtIndex);
        }
        ++v36;
      }
      while (v35 + v36 < v37);
    }
    -[BESearchResultLabel setLines:](v2, "setLines:", v33);
    CFRelease(cf);
    CFRelease(v26);
    CFRelease(v23);
    CFRelease(v33);

    v4 = replacement;
  }

}

- (CGRect)p_boundingRect
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  const __CFArray *v7;
  const __CFArray *v8;
  id v9;
  id v10;
  CFIndex v11;
  const __CTLine *ValueAtIndex;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGRect BoundsWithOptions;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel lines](self, "lines"));
  v8 = v7;
  if (v7)
  {
    v9 = -[__CFArray count](v7, "count");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      do
      {
        v25 = height;
        ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(v8, v11);
        BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0);
        v13 = BoundsWithOptions.origin.x;
        v14 = BoundsWithOptions.origin.y;
        v15 = BoundsWithOptions.size.width;
        v16 = BoundsWithOptions.size.height;
        ++v11;
        -[BESearchResultLabel _labelLineSpacing](self, "_labelLineSpacing");
        v18 = v17;
        v27.origin.x = v13;
        v27.origin.y = v14;
        v27.size.width = v15;
        v27.size.height = v16;
        v19 = -(CGRectGetMaxY(v27) - (double)v11 * v18);
        v28.origin.x = v13;
        v28.origin.y = v14;
        v28.size.width = v15;
        v28.size.height = v16;
        v20 = v19 - CGRectGetMinY(v28);
        v29.origin.x = v13;
        v29.origin.y = v14;
        v29.size.width = v15;
        v29.size.height = v16;
        v33 = CGRectOffset(v29, 0.0, v20);
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.height = v25;
        v30.size.width = width;
        v31 = CGRectUnion(v30, v33);
        x = v31.origin.x;
        y = v31.origin.y;
        width = v31.size.width;
        height = v31.size.height;
      }
      while (v10 != (id)v11);
    }
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)_labelLineSpacing
{
  uint64_t *v2;
  double result;
  unsigned int v4;

  if (!+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))
  {
    v2 = &kBESearchResultLabelLineSpacing;
    return *(double *)v2;
  }
  if (+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge))
  {
    v2 = &kBESearchResultLabelAccessibilityLargestLineSpacing;
    return *(double *)v2;
  }
  v4 = +[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityLarge);
  result = 40.0;
  if (!v4)
    return 30.0;
  return result;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BESearchResultLabel;
  -[BESearchResultLabel layoutSubviews](&v2, "layoutSubviews");
}

- (void)drawRect:(CGRect)a3
{
  const __CFArray *v4;
  const __CFArray *v5;
  id v6;
  CGContext *CurrentContext;
  CFIndex v8;
  double v9;
  const __CTLine *ValueAtIndex;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  CGColor *v18;
  CGAffineTransform v19;
  CGSize v20;

  v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel lines](self, "lines", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v5 = v4;
  if (v4)
  {
    v6 = -[__CFArray count](v4, "count");
    CurrentContext = UIGraphicsGetCurrentContext();
    CGAffineTransformMakeScale(&v19, 1.0, -1.0);
    CGContextSetTextMatrix(CurrentContext, &v19);
    if (v6)
    {
      v8 = 0;
      v9 = 0.0;
      do
      {
        ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(v5, v8);
        -[BESearchResultLabel _labelLineSpacing](self, "_labelLineSpacing");
        v9 = v9 + v11;
        CGContextSetTextPosition(CurrentContext, 0.0, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel shadowColor](self, "shadowColor"));

        if (v12)
        {
          -[BESearchResultLabel shadowOffset](self, "shadowOffset");
          v14 = v13;
          v16 = v15;
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel shadowColor](self, "shadowColor")));
          v18 = (CGColor *)objc_msgSend(v17, "CGColor");
          v20.width = v14;
          v20.height = v16;
          CGContextSetShadowWithColor(CurrentContext, v20, 0.0, v18);

        }
        CTLineDraw(ValueAtIndex, CurrentContext);
        ++v8;
      }
      while (v6 != (id)v8);
    }
  }

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)BESearchResultLabel;
  -[BESearchResultLabel intrinsicContentSize](&v13, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel text](self, "text"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[BESearchResultLabel p_boundingRect](self, "p_boundingRect");
    v4 = v9;
    v6 = v10;
  }
  v11 = v4;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_NSRange)boldRange
{
  _NSRange *p_boldRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_boldRange = &self->_boldRange;
  location = self->_boldRange.location;
  length = p_boldRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (UIColor)boldColor
{
  return self->_boldColor;
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
  objc_storeStrong((id *)&self->_lines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_boldColor, 0);
}

@end
