@implementation UIKBTextStyle

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void)setMinFontSize:(double)a3
{
  self->_minFontSize = a3;
}

+ (id)styleWithTextColor:(id)a3
{
  id v3;
  UIKBTextStyle *v4;

  v3 = a3;
  v4 = objc_alloc_init(UIKBTextStyle);
  -[UIKBTextStyle setFontWeight:](v4, "setFontWeight:", 0.0);
  -[UIKBTextStyle setFontWidth:](v4, "setFontWidth:", *(double *)off_1E167DC90);
  -[UIKBTextStyle setTextOpacity:](v4, "setTextOpacity:", 1.0);
  -[UIKBTextStyle setImageScale:](v4, "setImageScale:", 1.0);
  -[UIKBTextStyle setTextColor:](v4, "setTextColor:", v3);

  -[UIKBTextStyle setIgnoreTextMarginOnKey:](v4, "setIgnoreTextMarginOnKey:", 0);
  -[UIKBTextStyle setAnchorCorner:](v4, "setAnchorCorner:", 0);
  -[UIKBTextStyle setSymbolScale:](v4, "setSymbolScale:", 0);
  return v4;
}

+ (id)styleWithFontName:(id)a3 withFontSize:(double)a4
{
  id v5;
  UIKBTextStyle *v6;

  v5 = a3;
  v6 = objc_alloc_init(UIKBTextStyle);
  -[UIKBTextStyle setTextOpacity:](v6, "setTextOpacity:", 1.0);
  -[UIKBTextStyle setImageScale:](v6, "setImageScale:", 1.0);
  -[UIKBTextStyle setFontName:](v6, "setFontName:", v5);

  -[UIKBTextStyle setFontSize:](v6, "setFontSize:", a4);
  -[UIKBTextStyle setFontWeight:](v6, "setFontWeight:", 0.0);
  -[UIKBTextStyle setFontWidth:](v6, "setFontWidth:", *(double *)off_1E167DC90);
  -[UIKBTextStyle setIgnoreTextMarginOnKey:](v6, "setIgnoreTextMarginOnKey:", 0);
  -[UIKBTextStyle setAnchorCorner:](v6, "setAnchorCorner:", 0);
  -[UIKBTextStyle setSymbolScale:](v6, "setSymbolScale:", 0);
  return v6;
}

- (void)setFontName:(id)a3
{
  objc_storeStrong((id *)&self->_fontName, a3);
}

- (void)setTextOpacity:(double)a3
{
  self->_textOpacity = a3;
}

- (void)setIgnoreTextMarginOnKey:(BOOL)a3
{
  self->_ignoreTextMarginOnKey = a3;
}

- (void)setSymbolScale:(int64_t)a3
{
  self->_symbolScale = a3;
}

- (void)setImageScale:(double)a3
{
  self->_imageScale = a3;
}

- (void)setFontWeight:(double)a3
{
  self->_fontWeight = a3;
}

- (void)setAnchorCorner:(unint64_t)a3
{
  self->_anchorCorner = a3;
}

- (UIKBTextStyle)init
{
  UIKBTextStyle *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBTextStyle;
  result = -[UIKBTextStyle init](&v3, sel_init);
  if (result)
  {
    result->_imageScale = 1.0;
    result->_alignment = 1;
    result->_pathWeight = 1.0;
  }
  return result;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void)setTextOffset:(CGPoint)a3
{
  self->_textOffset = a3;
}

- (BOOL)usesSymbolImage
{
  return self->_usesSymbolImage;
}

- (void)setFontWeightForSymbolImage:(double)a3
{
  self->_fontWeightForSymbolImage = a3;
}

- (void)setFontSizeForSymbolImage:(double)a3
{
  self->_fontSizeForSymbolImage = a3;
}

- (void)setUsesSymbolImage:(BOOL)a3
{
  self->_usesSymbolImage = a3;
}

- (void)setKerning:(double)a3
{
  self->_kerning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etchColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

- (int64_t)selector
{
  return self->_selector;
}

- (unint64_t)anchorCorner
{
  return self->_anchorCorner;
}

- (void)overlayWithStyle:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "fontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v24, "fontName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTextStyle setFontName:](self, "setFontName:", v5);

  }
  objc_msgSend(v24, "fontSize");
  if (v6 > 0.0)
  {
    objc_msgSend(v24, "fontSize");
    -[UIKBTextStyle setFontSize:](self, "setFontSize:");
  }
  objc_msgSend(v24, "fontSizeForSymbolImage");
  if (v7 > 0.0)
  {
    objc_msgSend(v24, "fontSizeForSymbolImage");
    -[UIKBTextStyle setFontSizeForSymbolImage:](self, "setFontSizeForSymbolImage:");
  }
  objc_msgSend(v24, "minFontSize");
  if (v8 > 0.0)
  {
    objc_msgSend(v24, "minFontSize");
    -[UIKBTextStyle setMinFontSize:](self, "setMinFontSize:");
  }
  objc_msgSend(v24, "kerning");
  if (fabs(v9) >= 2.22044605e-16)
  {
    objc_msgSend(v24, "kerning");
    -[UIKBTextStyle setKerning:](self, "setKerning:");
  }
  objc_msgSend(v24, "textOpacity");
  if (fabs(v10 + -1.0) >= 2.22044605e-16)
  {
    objc_msgSend(v24, "textOpacity");
    -[UIKBTextStyle setTextOpacity:](self, "setTextOpacity:");
  }
  objc_msgSend(v24, "textColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v24, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTextStyle setTextColor:](self, "setTextColor:", v12);

  }
  objc_msgSend(v24, "etchColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v24, "etchColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTextStyle setEtchColor:](self, "setEtchColor:", v14);

  }
  if (objc_msgSend(v24, "alignment") != 1)
    -[UIKBTextStyle setAlignment:](self, "setAlignment:", objc_msgSend(v24, "alignment"));
  if (objc_msgSend(v24, "anchorCorner"))
  {
    v16 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    objc_msgSend(v24, "textOffset");
    v16 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (*MEMORY[0x1E0C9D538] != v18 || v15 != v17)
    {
      objc_msgSend(v24, "textOffset");
      -[UIKBTextStyle setTextOffset:](self, "setTextOffset:");
    }
  }
  objc_msgSend(v24, "etchOffset");
  if (v16 != v20 || v15 != v19)
  {
    objc_msgSend(v24, "etchOffset");
    -[UIKBTextStyle setEtchOffset:](self, "setEtchOffset:");
  }
  objc_msgSend(v24, "pathWeight");
  if (v21 != 0.0)
  {
    objc_msgSend(v24, "pathWeight");
    -[UIKBTextStyle setPathWeight:](self, "setPathWeight:");
  }
  objc_msgSend(v24, "fontWeight");
  if (v22 != 0.0)
  {
    objc_msgSend(v24, "fontWeight");
    -[UIKBTextStyle setFontWeight:](self, "setFontWeight:");
  }
  objc_msgSend(v24, "fontWidth");
  if (v23 != 0.0)
  {
    objc_msgSend(v24, "fontWidth");
    -[UIKBTextStyle setFontWidth:](self, "setFontWidth:");
  }
  if (objc_msgSend(v24, "selector"))
    -[UIKBTextStyle setSelector:](self, "setSelector:", objc_msgSend(v24, "selector"));
  if (objc_msgSend(v24, "isVertical"))
    -[UIKBTextStyle setIsVertical:](self, "setIsVertical:", objc_msgSend(v24, "isVertical"));
  -[UIKBTextStyle setIgnoreTextMarginOnKey:](self, "setIgnoreTextMarginOnKey:", objc_msgSend(v24, "ignoreTextMarginOnKey"));
  if (objc_msgSend(v24, "symbolScale"))
    -[UIKBTextStyle setSymbolScale:](self, "setSymbolScale:", objc_msgSend(v24, "symbolScale"));

}

- (NSString)textColor
{
  return self->_textColor;
}

- (double)pathWeight
{
  return self->_pathWeight;
}

- (double)textOpacity
{
  return self->_textOpacity;
}

- (CGPoint)textOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_textOffset.x;
  y = self->_textOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (void)setPathWeight:(double)a3
{
  self->_pathWeight = a3;
}

- (double)minFontSize
{
  return self->_minFontSize;
}

- (double)kerning
{
  return self->_kerning;
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

- (BOOL)ignoreTextMarginOnKey
{
  return self->_ignoreTextMarginOnKey;
}

- (double)fontWeight
{
  return self->_fontWeight;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)fontSizeForSymbolImage
{
  return self->_fontSizeForSymbolImage;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (CGPoint)etchOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_etchOffset.x;
  y = self->_etchOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)etchColor
{
  return self->_etchColor;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  uint64_t v29;
  CGPoint v31;
  CGPoint v32;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[UIKBTextStyle fontName](self, "fontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontName = %@"), v4);

  -[UIKBTextStyle fontSize](self, "fontSize");
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontSize = %f"), v5);
  -[UIKBTextStyle fontWeight](self, "fontWeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontWeight = %f"), v6);
  -[UIKBTextStyle fontWidth](self, "fontWidth");
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontWidth = %f"), v7);
  -[UIKBTextStyle minFontSize](self, "minFontSize");
  if (v8 != 0.0)
  {
    -[UIKBTextStyle minFontSize](self, "minFontSize");
    objc_msgSend(v3, "appendFormat:", CFSTR("; minFontSize = %f"), v9);
  }
  -[UIKBTextStyle fontSizeForSymbolImage](self, "fontSizeForSymbolImage");
  if (v10 > 0.0)
  {
    -[UIKBTextStyle fontSizeForSymbolImage](self, "fontSizeForSymbolImage");
    objc_msgSend(v3, "appendFormat:", CFSTR("; fontSizeForSymbolImage = %f"), v11);
  }
  -[UIKBTextStyle kerning](self, "kerning");
  if (v12 != 0.0)
  {
    -[UIKBTextStyle kerning](self, "kerning");
    objc_msgSend(v3, "appendFormat:", CFSTR("; kerning = %f"), v13);
  }
  -[UIKBTextStyle textOpacity](self, "textOpacity");
  if (v14 != 1.0)
  {
    -[UIKBTextStyle textOpacity](self, "textOpacity");
    objc_msgSend(v3, "appendFormat:", CFSTR("; textOpacity = %f"), v15);
  }
  -[UIKBTextStyle textColor](self, "textColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UIKBTextStyle textColor](self, "textColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textColor = %@"), v17);

  }
  -[UIKBTextStyle etchColor](self, "etchColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[UIKBTextStyle etchColor](self, "etchColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; etchColor = %@"), v19);

  }
  if (-[UIKBTextStyle alignment](self, "alignment") != 1)
    objc_msgSend(v3, "appendFormat:", CFSTR("; alignment = %d"), -[UIKBTextStyle alignment](self, "alignment"));
  -[UIKBTextStyle textOffset](self, "textOffset");
  v22 = *MEMORY[0x1E0C9D538];
  v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v23 != *MEMORY[0x1E0C9D538] || v20 != v21)
  {
    -[UIKBTextStyle textOffset](self, "textOffset");
    NSStringFromCGPoint(v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textOffset = %@"), v24);

  }
  -[UIKBTextStyle etchOffset](self, "etchOffset");
  if (v26 != v22 || v25 != v21)
  {
    -[UIKBTextStyle etchOffset](self, "etchOffset");
    NSStringFromCGPoint(v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; etchOffset = %@"), v27);

  }
  -[UIKBTextStyle pathWeight](self, "pathWeight");
  if (v28 != 0.0)
  {
    -[UIKBTextStyle pathWeight](self, "pathWeight");
    objc_msgSend(v3, "appendFormat:", CFSTR("; pathWeight = %f"), v29);
  }
  if (-[UIKBTextStyle selector](self, "selector"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; selector = %d"), -[UIKBTextStyle selector](self, "selector"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; ignoreTextMarginOnKey = %d"),
    -[UIKBTextStyle ignoreTextMarginOnKey](self, "ignoreTextMarginOnKey"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; anchorCorner = %lu"), -[UIKBTextStyle anchorCorner](self, "anchorCorner"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UIKBTextStyle *v4;
  NSString *fontName;
  NSString *textColor;
  NSString *etchColor;
  BOOL v8;

  v4 = (UIKBTextStyle *)a3;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_31;
  fontName = self->_fontName;
  if ((v4->_fontName == 0) == (fontName != 0)
    || fontName && !-[NSString isEqualToString:](fontName, "isEqualToString:"))
  {
    goto LABEL_31;
  }
  if (self->_fontSize != v4->_fontSize)
    goto LABEL_31;
  if (self->_fontSizeForSymbolImage != v4->_fontSizeForSymbolImage)
    goto LABEL_31;
  if (self->_minFontSize != v4->_minFontSize)
    goto LABEL_31;
  if (self->_kerning != v4->_kerning)
    goto LABEL_31;
  if (self->_textOpacity != v4->_textOpacity)
    goto LABEL_31;
  textColor = self->_textColor;
  if ((textColor != 0) == (v4->_textColor == 0)
    || textColor && !-[NSString isEqualToString:](textColor, "isEqualToString:"))
  {
    goto LABEL_31;
  }
  etchColor = self->_etchColor;
  if ((etchColor != 0) == (v4->_etchColor == 0)
    || etchColor && !-[NSString isEqualToString:](etchColor, "isEqualToString:"))
  {
    goto LABEL_31;
  }
  if (self->_alignment != v4->_alignment)
    goto LABEL_31;
  v8 = 0;
  if (self->_textOffset.x == v4->_textOffset.x && self->_textOffset.y == v4->_textOffset.y)
  {
    v8 = 0;
    if (self->_etchOffset.x == v4->_etchOffset.x && self->_etchOffset.y == v4->_etchOffset.y)
    {
      if (self->_pathWeight == v4->_pathWeight
        && self->_fontWeight == v4->_fontWeight
        && self->_fontWidth == v4->_fontWidth
        && self->_fontWeightForSymbolImage == v4->_fontWeightForSymbolImage
        && self->_anchorCorner == v4->_anchorCorner
        && self->_selector == v4->_selector
        && self->_ignoreTextMarginOnKey == v4->_ignoreTextMarginOnKey
        && self->_isVertical == v4->_isVertical)
      {
        v8 = self->_symbolScale == v4->_symbolScale;
        goto LABEL_33;
      }
LABEL_31:
      v8 = 0;
    }
  }
LABEL_33:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBTextStyle *v4;
  uint64_t v5;
  NSString *fontName;
  uint64_t v7;
  NSString *textColor;
  uint64_t v9;
  NSString *etchColor;

  v4 = -[UIKBTextStyle init](+[UIKBTextStyle allocWithZone:](UIKBTextStyle, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_fontName, "copy");
  fontName = v4->_fontName;
  v4->_fontName = (NSString *)v5;

  v4->_fontSize = self->_fontSize;
  v4->_fontSizeForSymbolImage = self->_fontSizeForSymbolImage;
  v4->_minFontSize = self->_minFontSize;
  v4->_kerning = self->_kerning;
  v4->_textOpacity = self->_textOpacity;
  v7 = -[NSString copy](self->_textColor, "copy");
  textColor = v4->_textColor;
  v4->_textColor = (NSString *)v7;

  v9 = -[NSString copy](self->_etchColor, "copy");
  etchColor = v4->_etchColor;
  v4->_etchColor = (NSString *)v9;

  v4->_alignment = self->_alignment;
  v4->_textOffset = self->_textOffset;
  v4->_etchOffset = self->_etchOffset;
  v4->_pathWeight = self->_pathWeight;
  v4->_fontWeight = self->_fontWeight;
  v4->_fontWeightForSymbolImage = self->_fontWeightForSymbolImage;
  v4->_fontWidth = self->_fontWidth;
  v4->_anchorCorner = self->_anchorCorner;
  v4->_selector = self->_selector;
  v4->_usesSymbolImage = self->_usesSymbolImage;
  v4->_isVertical = self->_isVertical;
  v4->_symbolScale = self->_symbolScale;
  return v4;
}

- (double)imageScale
{
  return self->_imageScale;
}

- (void)setEtchColor:(id)a3
{
  objc_storeStrong((id *)&self->_etchColor, a3);
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (void)setEtchOffset:(CGPoint)a3
{
  self->_etchOffset = a3;
}

- (double)fontWidth
{
  return self->_fontWidth;
}

- (void)setFontWidth:(double)a3
{
  self->_fontWidth = a3;
}

- (void)setSelector:(int64_t)a3
{
  self->_selector = a3;
}

- (void)setIsVertical:(BOOL)a3
{
  self->_isVertical = a3;
}

- (double)fontWeightForSymbolImage
{
  return self->_fontWeightForSymbolImage;
}

@end
