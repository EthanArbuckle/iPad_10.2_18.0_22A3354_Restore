@implementation CRLWPListLabel

- (CRLWPListLabel)initWithType:(unint64_t)a3 labelString:(id)a4 textLine:(__CTLine *)a5 listNumber:(unint64_t)a6 isTateChuYoko:(BOOL)a7 baselineOffset:(double)a8
{
  _BOOL4 v9;
  id v15;
  CRLWPListLabel *v16;
  CRLWPListLabel *v17;
  double TypographicBounds;
  double v19;
  CGFloat leading;
  objc_super v22;

  v9 = a7;
  v15 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CRLWPListLabel;
  v16 = -[CRLWPListLabel init](&v22, "init");
  v17 = v16;
  if (v16)
  {
    v16->_labelType = a3;
    objc_storeStrong((id *)&v16->_labelString, a4);
    v17->_textLine = a5;
    CFRetain(a5);
    v17->_listNumber = a6;
    leading = 0.0;
    TypographicBounds = CTLineGetTypographicBounds(v17->_textLine, &v17->_ascent, &v17->_descent, &leading);
    v19 = v17->_ascent + v17->_descent;
    v17->_size.width = TypographicBounds;
    v17->_size.height = v19;
    v17->_isLabelTateChuYoko = v9;
    if (v9)
    {
      v17->_size.width = v19 + leading;
      v17->_size.height = TypographicBounds;
    }
    v17->_baselineOffset = a8;
  }

  return v17;
}

- (void)dealloc
{
  __CTLine *textLine;
  objc_super v4;

  textLine = self->_textLine;
  if (textLine)
    CFRelease(textLine);
  v4.receiver = self;
  v4.super_class = (Class)CRLWPListLabel;
  -[CRLWPListLabel dealloc](&v4, "dealloc");
}

- (BOOL)isEqualToListLabel:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  __CTLine *textLine;
  const void *v8;
  CRLShadow *shadow;
  unsigned __int8 v10;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_18;
  v6 = self->_size.width == *((double *)v4 + 12) && self->_size.height == *((double *)v4 + 13);
  if (!v6
    || self->_baselineOffset != *((double *)v4 + 3)
    || self->_labelType != v4[2]
    || self->_labelIndent != *((double *)v4 + 5)
    || self->_isLabelTateChuYoko != *((unsigned __int8 *)v4 + 9)
    || self->_listNumber != v4[10])
  {
    goto LABEL_18;
  }
  textLine = self->_textLine;
  v8 = (const void *)v5[7];
  if (textLine)
  {
    if (v8 && CFEqual(textLine, v8))
      goto LABEL_15;
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  if (v8)
    goto LABEL_18;
LABEL_15:
  shadow = self->_shadow;
  if (shadow == (CRLShadow *)v5[4])
    v10 = 1;
  else
    v10 = -[CRLShadow isEqual:](shadow, "isEqual:");
LABEL_19:

  return v10;
}

- (double)width
{
  return self->_size.width;
}

- (double)height
{
  return self->_size.height;
}

- (__CTFont)labelFont
{
  CFArrayRef GlyphRuns;
  void *v3;
  void *v4;
  const __CFDictionary *Attributes;
  __CTFont *Value;

  GlyphRuns = CTLineGetGlyphRuns(self->_textLine);
  v3 = (void *)objc_claimAutoreleasedReturnValue(GlyphRuns);
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));

    Attributes = CTRunGetAttributes((CTRunRef)v4);
    Value = (__CTFont *)CFDictionaryGetValue(Attributes, kCTFontAttributeName);
  }
  else
  {
    Value = 0;
  }

  return Value;
}

- (unint64_t)labelType
{
  return self->_labelType;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (CRLShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (double)labelIndent
{
  return self->_labelIndent;
}

- (void)setLabelIndent:(double)a3
{
  self->_labelIndent = a3;
}

- (double)labelTypographicExtent
{
  return self->_labelTypographicExtent;
}

- (void)setLabelTypographicExtent:(double)a3
{
  self->_labelTypographicExtent = a3;
}

- (BOOL)isLabelRTL
{
  return self->_isLabelRTL;
}

- (void)setIsLabelRTL:(BOOL)a3
{
  self->_isLabelRTL = a3;
}

- (__CTLine)textLine
{
  return self->_textLine;
}

- (double)ascent
{
  return self->_ascent;
}

- (double)descent
{
  return self->_descent;
}

- (unint64_t)listNumber
{
  return self->_listNumber;
}

- (BOOL)isLabelTateChuYoko
{
  return self->_isLabelTateChuYoko;
}

- (NSString)labelString
{
  return self->_labelString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelString, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
}

@end
