@implementation SBIconLabelImageParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_focusHighlightColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (SBIconLabelImageParameters)init
{
  SBIconLabelImageParameters *v2;
  SBIconLabelImageParameters *v3;
  void *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconLabelImageParameters;
  v2 = -[SBIconLabelImageParameters init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_recalculateHash = 1;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v3->_scale = v5;

  }
  return v3;
}

- (SBIconLabelImageParameters)initWithParameters:(id)a3
{
  char *v4;
  SBIconLabelImageParameters *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *contentSizeCategory;
  __int128 v10;
  __int128 v11;

  v4 = (char *)a3;
  v5 = -[SBIconLabelImageParameters init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 2), "copy");
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_containsEmoji = v4[24];
    v5->_canTruncate = v4[25];
    v5->_canTighten = v4[26];
    v5->_maxSize = (CGSize)*((_OWORD *)v4 + 3);
    objc_storeStrong((id *)&v5->_font, *((id *)v4 + 1));
    v5->_legibilityStyle = *((_QWORD *)v4 + 8);
    v5->_scale = *((double *)v4 + 5);
    objc_storeStrong((id *)&v5->_textColor, *((id *)v4 + 9));
    v5->_recalculateHash = v4[27];
    v5->_hash = *((_QWORD *)v4 + 20);
    v5->_accessibilityReduceTransparencyEnabled = v4[28];
    v8 = objc_msgSend(*((id *)v4 + 4), "copy");
    contentSizeCategory = v5->_contentSizeCategory;
    v5->_contentSizeCategory = (NSString *)v8;

    objc_storeStrong((id *)&v5->_focusHighlightColor, *((id *)v4 + 10));
    v10 = *(_OWORD *)(v4 + 88);
    *(_OWORD *)&v5->_textInsets.bottom = *(_OWORD *)(v4 + 104);
    *(_OWORD *)&v5->_textInsets.top = v10;
    v11 = *(_OWORD *)(v4 + 120);
    *(_OWORD *)&v5->_fontLanguageInsets.bottom = *(_OWORD *)(v4 + 136);
    *(_OWORD *)&v5->_fontLanguageInsets.top = v11;
    v5->_colorspaceGrayscale = v4[29];
    v5->_colorspaceGrayscaleSet = v4[30];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SBIconLabelImageParameters *v4;
  void *v5;
  char isKindOfClass;
  SBIconLabelImageParameters *v7;
  char v8;

  v4 = (SBIconLabelImageParameters *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (self->_legibilityStyle != v7->_legibilityStyle
        || !BSFloatEqualToFloat()
        || !SBFBoolEquals()
        || !SBFBoolEquals())
      {
        goto LABEL_21;
      }
      v8 = 0;
      if (self->_maxSize.width != v7->_maxSize.width || self->_maxSize.height != v7->_maxSize.height)
        goto LABEL_22;
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textInsets.top, *(float64x2_t *)&v7->_textInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textInsets.bottom, *(float64x2_t *)&v7->_textInsets.bottom))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_fontLanguageInsets.top, *(float64x2_t *)&v7->_fontLanguageInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_fontLanguageInsets.bottom,
                                                       *(float64x2_t *)&v7->_fontLanguageInsets.bottom))),
                                      0xFuLL))) & 1) != 0
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && SBFBoolEquals()
        && BSEqualObjects()
        && SBFBoolEquals())
      {
        v8 = SBFBoolEquals();
      }
      else
      {
LABEL_21:
        v8 = 0;
      }
LABEL_22:

      goto LABEL_23;
    }
    v8 = 0;
  }
LABEL_23:

  return v8;
}

- (BOOL)containsEmoji
{
  return self->_containsEmoji;
}

- (NSString)text
{
  return self->_text;
}

- (UIEdgeInsets)textInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textInsets.top;
  left = self->_textInsets.left;
  bottom = self->_textInsets.bottom;
  right = self->_textInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isColorspaceGrayscale
{
  SBIconLabelImageParameters *v2;
  UIColor *textColor;
  UIColor *focusHighlightColor;

  v2 = self;
  if (self->_colorspaceGrayscaleSet)
  {
    LOBYTE(self) = self->_colorspaceGrayscale;
  }
  else if (self->_containsEmoji)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    textColor = self->_textColor;
    if (!textColor || (LODWORD(self) = -[UIColor sbh_isGrayscale](textColor, "sbh_isGrayscale"), (_DWORD)self))
    {
      focusHighlightColor = v2->_focusHighlightColor;
      if (!focusHighlightColor
        || (LODWORD(self) = -[UIColor sbh_isGrayscale](focusHighlightColor, "sbh_isGrayscale"), (_DWORD)self))
      {
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (UIFont)font
{
  return self->_font;
}

- (UIEdgeInsets)fontLanguageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fontLanguageInsets.top;
  left = self->_fontLanguageInsets.left;
  bottom = self->_fontLanguageInsets.bottom;
  right = self->_fontLanguageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)focusHighlightColor
{
  return self->_focusHighlightColor;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (BOOL)canTruncate
{
  return self->_canTruncate;
}

- (BOOL)canTighten
{
  return self->_canTighten;
}

- (unint64_t)hash
{
  double scale;
  CGFloat v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;

  if (!self->_recalculateHash)
    return self->_hash;
  scale = self->_scale;
  v4 = self->_maxSize.height
     + self->_maxSize.width
     + self->_textInsets.top
     + self->_textInsets.bottom
     + self->_textInsets.left
     + self->_textInsets.right
     + self->_fontLanguageInsets.top
     + self->_fontLanguageInsets.bottom
     + self->_fontLanguageInsets.left
     + self->_fontLanguageInsets.right;
  self->_recalculateHash = 0;
  v5 = self->_canTighten + (unint64_t)self->_canTruncate;
  v6 = (unint64_t)(v4 + scale);
  v7 = v5 + -[NSString hash](self->_text, "hash");
  v8 = v7 + -[UIFont hash](self->_font, "hash") + self->_legibilityStyle;
  v9 = v8 + -[UIColor hash](self->_textColor, "hash");
  v10 = v9 + -[UIColor hash](self->_focusHighlightColor, "hash") + self->_accessibilityReduceTransparencyEnabled;
  result = v6
         + v10
         + -[NSString hash](self->_contentSizeCategory, "hash")
         + self->_colorspaceGrayscale
         + self->_colorspaceGrayscaleSet;
  self->_hash = result;
  return result;
}

- (void)_noteNeedsHashRecalculation
{
  self->_recalculateHash = 1;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_text, CFSTR("text"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_font, CFSTR("font"));
  v6 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("maxSize"), self->_maxSize.width, self->_maxSize.height);
  NSStringFromUIEdgeInsets(self->_fontLanguageInsets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("fontLanguageInsets"));

  v9 = (id)objc_msgSend(v3, "appendBool:withName:", self->_containsEmoji, CFSTR("containsEmoji"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", self->_canTruncate, CFSTR("canTruncate"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", self->_canTighten, CFSTR("canTighten"));
  v12 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_legibilityStyle, CFSTR("legibilityStyle"));
  v13 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("scale"), self->_scale);
  v14 = (id)objc_msgSend(v3, "appendBool:withName:", self->_accessibilityReduceTransparencyEnabled, CFSTR("accessibilityReduceTransparencyEnabled"));
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", self->_contentSizeCategory, CFSTR("contentSizeCategory"));
  if (self->_colorspaceGrayscaleSet)
    v16 = (id)objc_msgSend(v3, "appendBool:withName:", self->_colorspaceGrayscale, CFSTR("colorspaceGrayscale"));
  v17 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_overrideTraitCollection, CFSTR("overrideTraitCollection"), 1);
  objc_msgSend(v3, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBIconLabelImageParameters initWithParameters:]([SBMutableIconLabelImageParameters alloc], "initWithParameters:", self);
}

- (int64_t)legibilityStyle
{
  return self->_legibilityStyle;
}

- (BOOL)isAccessibilityReduceTransparencyEnabled
{
  return self->_accessibilityReduceTransparencyEnabled;
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (void)setOverrideTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

@end
