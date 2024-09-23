@implementation VUITextLayout

- (VUITextLayout)init
{
  VUITextLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUITextLayout;
  result = -[VUITextLayout init](&v3, sel_init);
  if (result)
  {
    result->_textStyle = -1;
    result->_fontWeight = 4;
    result->_fontFeature = 0;
    *(_OWORD *)&result->_alignment = xmmword_1DA1C1C20;
    result->_numberOfLinesAXSmall = 0;
    result->_numberOfLinesAXLarge = 0;
    result->_alwaysFocusable = 1;
    result->_blendMode = 0;
    result->_seeMoreHorizontalMargin = 10.0;
    result->_maximumContentSizeCategory = 0;
    *(_DWORD *)&result->_shouldUpdateTextColor = 1;
    result->_appliesColorToStringAttachments = 0;
    result->_lineBreakMode = 4;
    *(_WORD *)&result->_fadesOutTextTruncation = 256;
    result->_preferredVibrancy = 0;
  }
  return result;
}

- (void)setTextStyle:(int64_t)a3
{
  self->_textStyle = a3;
}

- (void)setTextTransform:(int64_t)a3
{
  self->_textTransform = a3;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (void)setFontWeight:(int64_t)a3
{
  self->_fontWeight = a3;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void)setLetterSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_letterSpacing, a3);
}

- (void)setHighContrastTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_highContrastTintColor, a3);
}

- (void)setMaximumContentSizeCategory:(unint64_t)a3
{
  self->_maximumContentSizeCategory = a3;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (void)setShouldUpdateTextColor:(BOOL)a3
{
  self->_shouldUpdateTextColor = a3;
}

- (void)setShouldAllowParagraphHyphenation:(BOOL)a3
{
  self->_shouldAllowParagraphHyphenation = a3;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (void)setNumberOfLinesAXSmall:(unint64_t)a3
{
  self->_numberOfLinesAXSmall = a3;
}

- (void)setNumberOfLinesAXLarge:(unint64_t)a3
{
  self->_numberOfLinesAXLarge = a3;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (void)setHighlightOrSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightOrSelectedColor, a3);
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void)setFontFeature:(int64_t)a3
{
  self->_fontFeature = a3;
}

- (void)setFontFamily:(id)a3
{
  objc_storeStrong((id *)&self->_fontFamily, a3);
}

- (void)setFadesOutTextTruncation:(BOOL)a3
{
  self->_fadesOutTextTruncation = a3;
}

- (void)setDisabledColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledColor, a3);
}

- (void)setDarkCompositingFilter:(id)a3
{
  objc_storeStrong((id *)&self->_darkCompositingFilter, a3);
}

- (void)setDarkColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkColor, a3);
}

- (void)setCompositingFilter:(id)a3
{
  objc_storeStrong((id *)&self->_compositingFilter, a3);
}

- (void)setAvoidsFocusedTextShadow:(BOOL)a3
{
  self->_avoidsFocusedTextShadow = a3;
}

- (void)setAppliesShadowToContainer:(BOOL)a3
{
  self->_appliesShadowToContainer = a3;
}

- (void)setAppliesDirectionalIsolates:(BOOL)a3
{
  self->_appliesDirectionalIsolates = a3;
}

- (void)setAlwaysFocusable:(BOOL)a3
{
  self->_alwaysFocusable = a3;
}

- (void)setAllowsTextAlignmentOverride:(BOOL)a3
{
  self->_allowsTextAlignmentOverride = a3;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (NSNumber)letterSpacing
{
  return self->_letterSpacing;
}

- (BOOL)fadesOutTextTruncation
{
  return self->_fadesOutTextTruncation;
}

- (void)setHighlightStyle:(int64_t)a3
{
  self->_highlightStyle = a3;
}

- (void)setFocusSizeIncrease:(double)a3
{
  self->_focusSizeIncrease = a3;
}

- (void)setFocusCornerRadius:(double)a3
{
  self->_focusCornerRadius = a3;
}

- (void)setAppliesColorToStringAttachments:(BOOL)a3
{
  self->_appliesColorToStringAttachments = a3;
}

- (BOOL)alwaysFocusable
{
  return self->_alwaysFocusable;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (id)attributedStringWithString:(id)a3 isHighlighted:(BOOL)a4 isDisabled:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  UIColor *v10;
  UIColor *disabledColor;
  UIColor *v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
  else
    v9 = 0;
  v10 = self->_color;
  if (v5 && (disabledColor = self->_disabledColor) != 0
    || v6 && (disabledColor = self->_highlightOrSelectedColor) != 0)
  {
    v12 = disabledColor;

    v10 = v12;
  }
  -[VUITextLayout attributedStringWithAttributedString:textColor:](self, "attributedStringWithAttributedString:textColor:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkCompositingFilter, 0);
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_darkSeeMoreTextColor, 0);
  objc_storeStrong((id *)&self->_darkHighlightOrSelectedColor, 0);
  objc_storeStrong((id *)&self->_darkColor, 0);
  objc_storeStrong((id *)&self->_seeMoreTextColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_highlightOrSelectedColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_highContrastTintColor, 0);
  objc_storeStrong((id *)&self->_letterSpacing, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_fontFamily, 0);
}

void __64__VUITextLayout_attributedStringWithAttributedString_textColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "letterSpacing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "shadow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1178];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, *(_QWORD *)(a1 + 40), a3, a4);
  v12 = *MEMORY[0x1E0DC1150];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1150]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = 1;
  else
    v14 = v8 == 0;
  if (!v14)
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v12, v8, a3, a4);
  v15 = *MEMORY[0x1E0DC1198];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1198]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = 1;
  else
    v17 = v9 == 0;
  if (v17)
  {

  }
  else if (objc_msgSend(WeakRetained, "appliesShadowToContainer"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v15, v9, a3, a4);
  }
  v18 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

  }
  else
  {
    v20 = *(_QWORD *)(a1 + 48);
    if (v20)
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v18, v20, a3, a4);
  }
  v21 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {

  }
  else
  {
    v23 = *(_QWORD *)(a1 + 56);
    if (v23)
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v21, v23, a3, a4);
  }

}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (id)attributedStringWithString:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v6 && (v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6)) != 0)
  {
    v9 = (void *)v8;
    -[VUITextLayout attributedStringWithAttributedString:view:updateTextColor:](self, "attributedStringWithAttributedString:view:updateTextColor:", v8, v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)attributedStringWithAttributedString:(id)a3 view:(id)a4 updateTextColor:(BOOL)a5
{
  id v8;
  id v9;
  UIColor *v10;
  _BOOL4 v11;
  UIColor *highContrastTintColor;
  UIColor *v13;
  UIColor *v14;
  uint64_t v15;
  UIColor *v16;
  UIColor *highlightOrSelectedColor;
  UIColor *v18;
  UIColor *disabledColor;
  UIColor *v20;
  uint64_t v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  self->_shouldUpdateTextColor = a5;
  v10 = self->_color;
  v11 = UIAccessibilityDarkerSystemColorsEnabled();
  if (v9 && v11)
  {
    highContrastTintColor = self->_highContrastTintColor;
    if (highContrastTintColor)
    {
      v13 = highContrastTintColor;
    }
    else
    {
      objc_msgSend(v9, "_accessibilityHigherContrastTintColorForColor:", v10);
      v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    v10 = v14;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    -[UIColor colorByRemovingTransparency](v10, "colorByRemovingTransparency");
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (UIColor *)v15;
  }
  if (v9 && self->_darkColor)
  {
    if (objc_msgSend(v9, "vuiUserInterfaceStyle") == 2)
    {
      v16 = self->_darkColor;

      v10 = v16;
    }
  }
  else if (!v9)
  {
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "isEnabled") & 1) == 0)
  {
    disabledColor = self->_disabledColor;
    if (!disabledColor)
      goto LABEL_27;
  }
  else
  {
    if (((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v9, "isHighlighted") & 1) == 0)
      && ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v9, "isSelected")))
    {
      goto LABEL_27;
    }
    highlightOrSelectedColor = self->_highlightOrSelectedColor;
    if (highlightOrSelectedColor)
    {
      v18 = highlightOrSelectedColor;

      v10 = v18;
    }
    if (!self->_darkHighlightOrSelectedColor || objc_msgSend(v9, "vuiUserInterfaceStyle") != 2)
      goto LABEL_27;
    disabledColor = self->_darkHighlightOrSelectedColor;
  }
  v20 = disabledColor;

  v10 = v20;
LABEL_27:
  if (v10)
  {
    objc_msgSend(v9, "_accessibilityHigherContrastTintColorForColor:", v10);
    v21 = objc_claimAutoreleasedReturnValue();

    v10 = (UIColor *)v21;
  }
LABEL_29:
  -[VUITextLayout attributedStringWithAttributedString:textColor:](self, "attributedStringWithAttributedString:textColor:", v8, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)appliesDirectionalIsolates
{
  return self->_appliesDirectionalIsolates;
}

- (id)attributedStringWithAttributedString:(id)a3 textColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t textTransform;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t, uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id location;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
    goto LABEL_11;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v6);
  v9 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  textTransform = self->_textTransform;
  switch(textTransform)
  {
    case 3:
      objc_msgSend(v10, "localizedCapitalizedString");
      v13 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v10, "localizedUppercaseString");
      v13 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v10, "localizedLowercaseString");
      v13 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_9;
  }
  v14 = (void *)v13;

  objc_msgSend(v8, "mutableString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setString:", v14);

  v11 = v14;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextLayout:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout _defaultParagraphStyle](self, "_defaultParagraphStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_initWeak(&location, self);
  objc_msgSend(v8, "beginEditing");
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __64__VUITextLayout_attributedStringWithAttributedString_textColor___block_invoke;
  v27 = &unk_1E9F9B3C8;
  objc_copyWeak(&v32, &location);
  v19 = v8;
  v28 = v19;
  v20 = v18;
  v29 = v20;
  v30 = v7;
  v21 = v16;
  v31 = v21;
  objc_msgSend(v19, "enumerateAttributesInRange:options:usingBlock:", 0, v9, 0, &v24);
  objc_msgSend(v19, "endEditing", v24, v25, v26, v27);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  if (!v19)
  {
LABEL_11:
    v22 = v6;
    goto LABEL_12;
  }
  v22 = (id)objc_msgSend(v19, "copy");

LABEL_12:
  return v22;
}

- (id)_defaultParagraphStyle
{
  void *v3;
  void *v4;
  int64_t lineBreakMode;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setAlignment:", self->_alignment);
  if (self->_fadesOutTextTruncation)
    lineBreakMode = 2;
  else
    lineBreakMode = self->_lineBreakMode;
  objc_msgSend(v4, "setLineBreakMode:", lineBreakMode);
  if (!self->_lineBreakMode && self->_shouldAllowParagraphHyphenation)
  {
    LODWORD(v6) = 1.0;
    objc_msgSend(v4, "setHyphenationFactor:", v6);
  }
  return v4;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)darkCompositingFilter
{
  return self->_darkCompositingFilter;
}

- (BOOL)allowsTextAlignmentOverride
{
  return self->_allowsTextAlignmentOverride;
}

- (unint64_t)numberOfLinesForTraitCollection:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[VUITextLayout numberOfLines](self, "numberOfLines");
  if (v4)
  {
    if (objc_msgSend(v4, "isAXSmallEnabled"))
    {
      v6 = -[VUITextLayout numberOfLinesAXSmall](self, "numberOfLinesAXSmall");
LABEL_6:
      v5 = v6;
      goto LABEL_7;
    }
    if (objc_msgSend(v4, "isAXLargeEnabled"))
    {
      v6 = -[VUITextLayout numberOfLinesAXLarge](self, "numberOfLinesAXLarge");
      goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (int64_t)fontFeature
{
  return self->_fontFeature;
}

- (unint64_t)maximumContentSizeCategory
{
  return self->_maximumContentSizeCategory;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (int64_t)fontWeight
{
  return self->_fontWeight;
}

- (unsigned)fontTraits
{
  return self->_fontTraits;
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUITextLayout *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = -[VUITextLayout init](+[VUITextLayout allocWithZone:](VUITextLayout, "allocWithZone:", a3), "init");
  -[VUITextLayout setTextStyle:](v4, "setTextStyle:", self->_textStyle);
  v5 = (void *)-[NSString copy](self->_fontFamily, "copy");
  -[VUITextLayout setFontFamily:](v4, "setFontFamily:", v5);

  -[VUITextLayout setFontWeight:](v4, "setFontWeight:", self->_fontWeight);
  -[VUITextLayout setFontSize:](v4, "setFontSize:", self->_fontSize);
  -[VUITextLayout setFontTraits:](v4, "setFontTraits:", self->_fontTraits);
  -[VUITextLayout setFontFeature:](v4, "setFontFeature:", self->_fontFeature);
  -[VUITextLayout setMargin:](v4, "setMargin:", self->_margin.top, self->_margin.left, self->_margin.bottom, self->_margin.right);
  v6 = (void *)-[UIColor copy](self->_color, "copy");
  -[VUITextLayout setColor:](v4, "setColor:", v6);

  v7 = (void *)-[UIColor copy](self->_highlightOrSelectedColor, "copy");
  -[VUITextLayout setHighlightOrSelectedColor:](v4, "setHighlightOrSelectedColor:", v7);

  v8 = (void *)-[UIColor copy](self->_disabledColor, "copy");
  -[VUITextLayout setDisabledColor:](v4, "setDisabledColor:", v8);

  v9 = (void *)-[UIColor copy](self->_seeMoreTextColor, "copy");
  -[VUITextLayout setSeeMoreTextColor:](v4, "setSeeMoreTextColor:", v9);

  -[VUITextLayout setTextTransform:](v4, "setTextTransform:", self->_textTransform);
  -[VUITextLayout setAlignment:](v4, "setAlignment:", self->_alignment);
  -[VUITextLayout setAllowsTextAlignmentOverride:](v4, "setAllowsTextAlignmentOverride:", self->_allowsTextAlignmentOverride);
  -[VUITextLayout setAppliesDirectionalIsolates:](v4, "setAppliesDirectionalIsolates:", self->_appliesDirectionalIsolates);
  -[VUITextLayout setNumberOfLines:](v4, "setNumberOfLines:", self->_numberOfLines);
  -[VUITextLayout setNumberOfLinesAXSmall:](v4, "setNumberOfLinesAXSmall:", self->_numberOfLinesAXSmall);
  -[VUITextLayout setNumberOfLinesAXLarge:](v4, "setNumberOfLinesAXLarge:", self->_numberOfLinesAXLarge);
  -[VUITextLayout setShadow:](v4, "setShadow:", self->_shadow);
  -[VUITextLayout setAppliesShadowToContainer:](v4, "setAppliesShadowToContainer:", self->_appliesShadowToContainer);
  v10 = (void *)-[NSNumber copy](self->_letterSpacing, "copy");
  -[VUITextLayout setLetterSpacing:](v4, "setLetterSpacing:", v10);

  -[VUITextLayout setLineBreakMode:](v4, "setLineBreakMode:", self->_lineBreakMode);
  -[VUITextLayout setFadesOutTextTruncation:](v4, "setFadesOutTextTruncation:", self->_fadesOutTextTruncation);
  -[VUITextLayout setShouldAllowParagraphHyphenation:](v4, "setShouldAllowParagraphHyphenation:", self->_shouldAllowParagraphHyphenation);
  -[VUITextLayout setHighContrastTintColor:](v4, "setHighContrastTintColor:", self->_highContrastTintColor);
  -[VUITextLayout setBlendMode:](v4, "setBlendMode:", self->_blendMode);
  -[VUITextLayout setAlwaysFocusable:](v4, "setAlwaysFocusable:", self->_alwaysFocusable);
  -[VUITextLayout setShouldUpdateTextColor:](v4, "setShouldUpdateTextColor:", self->_shouldUpdateTextColor);
  -[VUITextLayout setMaximumContentSizeCategory:](v4, "setMaximumContentSizeCategory:", self->_maximumContentSizeCategory);
  v11 = (void *)-[UIColor copy](self->_darkColor, "copy");
  -[VUITextLayout setDarkColor:](v4, "setDarkColor:", v11);

  -[VUITextLayout setSeeMoreHorizontalMargin:](v4, "setSeeMoreHorizontalMargin:", self->_seeMoreHorizontalMargin);
  -[VUITextLayout setAvoidsFocusedTextShadow:](v4, "setAvoidsFocusedTextShadow:", self->_avoidsFocusedTextShadow);
  -[VUITextLayout setMinimumScaleFactor:](v4, "setMinimumScaleFactor:", self->_minimumScaleFactor);
  v12 = (void *)-[UIColor copy](self->_darkHighlightOrSelectedColor, "copy");
  -[VUITextLayout setDarkHighlightOrSelectedColor:](v4, "setDarkHighlightOrSelectedColor:", v12);

  v13 = (void *)-[UIColor copy](self->_darkSeeMoreTextColor, "copy");
  -[VUITextLayout setDarkSeeMoreTextColor:](v4, "setDarkSeeMoreTextColor:", v13);

  -[VUITextLayout setCompositingFilter:](v4, "setCompositingFilter:", self->_compositingFilter);
  -[VUITextLayout setDarkCompositingFilter:](v4, "setDarkCompositingFilter:", self->_darkCompositingFilter);
  -[VUITextLayout setPreferredVibrancy:](v4, "setPreferredVibrancy:", self->_preferredVibrancy);
  return v4;
}

- (void)setSeeMoreTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_seeMoreTextColor, a3);
}

- (void)setSeeMoreHorizontalMargin:(double)a3
{
  self->_seeMoreHorizontalMargin = a3;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setFontTraits:(unsigned int)a3
{
  self->_fontTraits = a3;
}

- (void)setDarkSeeMoreTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkSeeMoreTextColor, a3);
}

- (void)setDarkHighlightOrSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkHighlightOrSelectedColor, a3);
}

- (BOOL)shouldUpdateTextColor
{
  return self->_shouldUpdateTextColor;
}

- (UIEdgeInsets)margin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margin.top;
  left = self->_margin.left;
  bottom = self->_margin.bottom;
  right = self->_margin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)defaultAttributesForLabel:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIColor *darkColor;
  UIColor *color;
  UIColor *v12;
  void *v13;
  void *v14;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextLayout:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1138]);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "userInterfaceStyle") != 2)
  {

LABEL_5:
    color = self->_color;
    if (!color)
      goto LABEL_7;
    goto LABEL_6;
  }
  darkColor = self->_darkColor;

  if (!darkColor)
    goto LABEL_5;
  color = self->_darkColor;
LABEL_6:
  v12 = color;

  v8 = v12;
LABEL_7:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1140]);
  if (!self->_appliesShadowToContainer)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_shadow, *MEMORY[0x1E0DC1198]);
  -[VUITextLayout _defaultParagraphStyle](self, "_defaultParagraphStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0DC1178]);

  v14 = (void *)objc_msgSend(v6, "copy");
  return v14;
}

- (UIColor)darkColor
{
  return self->_darkColor;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (id)attributedStringWithString:(id)a3
{
  return -[VUITextLayout attributedStringWithString:view:](self, "attributedStringWithString:view:", a3, 0);
}

- (BOOL)appliesShadowToContainer
{
  return self->_appliesShadowToContainer;
}

- (void)setColorWithOpacityType:(int64_t)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_opacityColorWithType:userInterfaceStyle:", a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](self, "setColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_opacityColorWithType:userInterfaceStyle:", a3, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setDarkColor:](self, "setDarkColor:", v6);

}

- (int64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (int64_t)textTransform
{
  return self->_textTransform;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (unint64_t)numberOfLinesAXSmall
{
  return self->_numberOfLinesAXSmall;
}

- (unint64_t)numberOfLinesAXLarge
{
  return self->_numberOfLinesAXLarge;
}

- (BOOL)shouldAllowParagraphHyphenation
{
  return self->_shouldAllowParagraphHyphenation;
}

- (UIColor)highContrastTintColor
{
  return self->_highContrastTintColor;
}

- (double)focusSizeIncrease
{
  return self->_focusSizeIncrease;
}

- (double)focusCornerRadius
{
  return self->_focusCornerRadius;
}

- (UIColor)highlightOrSelectedColor
{
  return self->_highlightOrSelectedColor;
}

- (UIColor)disabledColor
{
  return self->_disabledColor;
}

- (UIColor)seeMoreTextColor
{
  return self->_seeMoreTextColor;
}

- (double)seeMoreHorizontalMargin
{
  return self->_seeMoreHorizontalMargin;
}

- (BOOL)avoidsFocusedTextShadow
{
  return self->_avoidsFocusedTextShadow;
}

- (BOOL)appliesColorToStringAttachments
{
  return self->_appliesColorToStringAttachments;
}

- (UIColor)darkHighlightOrSelectedColor
{
  return self->_darkHighlightOrSelectedColor;
}

- (UIColor)darkSeeMoreTextColor
{
  return self->_darkSeeMoreTextColor;
}

- (BOOL)enableAXUnderlineButtonShape
{
  return self->_enableAXUnderlineButtonShape;
}

- (void)setEnableAXUnderlineButtonShape:(BOOL)a3
{
  self->_enableAXUnderlineButtonShape = a3;
}

- (NSString)compositingFilter
{
  return self->_compositingFilter;
}

- (int64_t)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (void)setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

@end
