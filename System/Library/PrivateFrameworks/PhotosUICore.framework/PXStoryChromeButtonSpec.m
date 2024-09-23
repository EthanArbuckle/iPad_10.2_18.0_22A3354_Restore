@implementation PXStoryChromeButtonSpec

- (PXStoryChromeButtonSpec)initWithExtendedTraitCollection:(id)a3
{
  id v5;
  PXStoryChromeButtonSpec *v6;
  PXStoryChromeButtonSpec *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  double v14;
  BOOL v15;
  uint64_t v16;
  double v17;
  uint64_t v22;
  UIColor *defaultTintColor;
  uint64_t v24;
  UIColor *defaultFocusedTintColor;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UIColor *v30;
  uint64_t v31;
  uint64_t v32;
  NSDictionary *labelAttributes;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _OWORD *p_width;
  double v40;
  objc_super v42;
  _QWORD v43[3];
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PXStoryChromeButtonSpec;
  v6 = -[PXStoryChromeButtonSpec init](&v42, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extendedTraitCollection, a3);
    v8 = -[PXExtendedTraitCollection userInterfaceIdiom](v7->_extendedTraitCollection, "userInterfaceIdiom");
    v9 = -[PXExtendedTraitCollection userInterfaceIdiom](v7->_extendedTraitCollection, "userInterfaceIdiom");
    v10 = -[PXExtendedTraitCollection userInterfaceIdiom](v7->_extendedTraitCollection, "userInterfaceIdiom");
    v11 = objc_msgSend(v5, "contentSizeCategory") - 8;
    v12 = 18.0;
    if (v10 == 5)
    {
      _CF = 1;
    }
    else
    {
      v12 = 22.0;
      _CF = v11 >= 5;
    }
    v14 = 44.0;
    if (!_CF)
      v14 = 60.0;
    v15 = v9 == 4;
    v7->_defaultImageSize.width = v14;
    v7->_defaultImageSize.height = v14;
    v16 = 2;
    if (v8 != 3)
      v16 = -1;
    v17 = 19.0;
    if (v8 == 3)
      v17 = 28.0;
    v7->_systemImageSizeWithoutBackground = v12;
    v7->_systemImageSizeWithBackground = v17;
    __asm { FMOV            V0.2D, #16.0 }
    v7->_badgeImageSize = _Q0;
    *(_OWORD *)&v7->_systemImageWeightWithoutBackground = xmmword_1A7C0C930;
    v7->_systemImageScale = v16;
    v7->_badgeSystemImageWeight = 7;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v22 = objc_claimAutoreleasedReturnValue();
    defaultTintColor = v7->_defaultTintColor;
    v7->_defaultTintColor = (UIColor *)v22;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v24 = objc_claimAutoreleasedReturnValue();
    defaultFocusedTintColor = v7->_defaultFocusedTintColor;
    v7->_defaultFocusedTintColor = (UIColor *)v24;

    v7->_roundedRectCornerRadius = 10.0;
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    objc_msgSend(v27, "setAlignment:", 1);
    v43[0] = *MEMORY[0x1E0DC1138];
    PXFontWithTextStyleSymbolicTraits();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0DC1140];
    v30 = v7->_defaultTintColor;
    v44[0] = v28;
    v44[1] = v30;
    v31 = *MEMORY[0x1E0DC1178];
    v43[1] = v29;
    v43[2] = v31;
    v44[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
    v32 = objc_claimAutoreleasedReturnValue();
    labelAttributes = v7->_labelAttributes;
    v7->_labelAttributes = (NSDictionary *)v32;

    PXEdgeInsetsMake();
    PXEdgeInsetsMake();
    v34 = 0.0;
    v7->_labelPadding.top = v35;
    v7->_labelPadding.left = v36;
    v7->_labelPadding.bottom = v37;
    v7->_labelPadding.right = v38;
    *(_OWORD *)&v7->_blurEffectStyle = xmmword_1A7C0C940;
    v7->_textOnlyBlurEffectStyle = 16;
    v7->_systemImageStyle = 0;
    p_width = (_OWORD *)&v7->_focusedShadowOffset.width;
    if (v8 == 3)
      v40 = 34.0;
    else
      v40 = 0.0;
    v7->_shadowRadius = v40;
    if (v8 == 3)
    {
      *p_width = xmmword_1A7C0C950;
      v34 = 0.5;
    }
    else
    {
      *p_width = *MEMORY[0x1E0C9D820];
    }
    v7->_focusedShadowOpacity = v34;
    v7->_shouldDimWhenHighlighted = v15;
    v7->_backgroundStyle = 0;

  }
  return v7;
}

- (PXStoryChromeButtonSpec)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChromeButton.m"), 112, CFSTR("%s is not available as initializer"), "-[PXStoryChromeButtonSpec init]");

  abort();
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (CGSize)defaultImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultImageSize.width;
  height = self->_defaultImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)systemImageSizeWithoutBackground
{
  return self->_systemImageSizeWithoutBackground;
}

- (double)systemImageSizeWithBackground
{
  return self->_systemImageSizeWithBackground;
}

- (int64_t)systemImageWeightWithoutBackground
{
  return self->_systemImageWeightWithoutBackground;
}

- (int64_t)systemImageWeightWithBackground
{
  return self->_systemImageWeightWithBackground;
}

- (int64_t)systemImageScale
{
  return self->_systemImageScale;
}

- (CGSize)badgeImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_badgeImageSize.width;
  height = self->_badgeImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)badgeSystemImageWeight
{
  return self->_badgeSystemImageWeight;
}

- (UIColor)defaultTintColor
{
  return self->_defaultTintColor;
}

- (UIColor)defaultFocusedTintColor
{
  return self->_defaultFocusedTintColor;
}

- (NSDictionary)labelAttributes
{
  return self->_labelAttributes;
}

- (UIEdgeInsets)labelPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_labelPadding.top;
  left = self->_labelPadding.left;
  bottom = self->_labelPadding.bottom;
  right = self->_labelPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (int64_t)highlightedBlurEffectStyle
{
  return self->_highlightedBlurEffectStyle;
}

- (int64_t)textOnlyBlurEffectStyle
{
  return self->_textOnlyBlurEffectStyle;
}

- (double)roundedRectCornerRadius
{
  return self->_roundedRectCornerRadius;
}

- (int64_t)systemImageStyle
{
  return self->_systemImageStyle;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (CGSize)focusedShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_focusedShadowOffset.width;
  height = self->_focusedShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)focusedShadowOpacity
{
  return self->_focusedShadowOpacity;
}

- (BOOL)shouldDimWhenHighlighted
{
  return self->_shouldDimWhenHighlighted;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelAttributes, 0);
  objc_storeStrong((id *)&self->_defaultFocusedTintColor, 0);
  objc_storeStrong((id *)&self->_defaultTintColor, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
}

@end
