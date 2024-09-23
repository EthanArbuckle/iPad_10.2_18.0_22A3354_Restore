@implementation _UIButtonConfiguration

- (NSDirectionalEdgeInsets)contentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;
  NSDirectionalEdgeInsets result;

  -[_UIButtonConfiguration backgroundToContentInsets](self, "backgroundToContentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIButtonConfiguration _traitCollection](self, "_traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "preferredContentSizeCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v14 = _UIContentSizeCategoryFromStringInternal(v13, &v20);

    if (v14 >= 0x10000)
    {
      v15 = (double)(v14 - 0xFFFF) + (double)(v14 - 0xFFFF);
      v6 = v6 + v15;
      v10 = v10 + v15;
    }
  }

  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.trailing = v19;
  result.bottom = v18;
  result.leading = v17;
  result.top = v16;
  return result;
}

- (int64_t)cornerStyle
{
  return 0;
}

- (double)titlePadding
{
  return 1.0;
}

- (int64_t)titleAlignment
{
  return 0;
}

- (int64_t)_resolvedTitleAlignment
{
  return 0;
}

- (double)_resolvedImageReservation
{
  return 0.0;
}

- (id)_resolvedIndicator
{
  return 0;
}

- (id)_resolvedIndicatorColor
{
  return 0;
}

- (id)_resolvedIndicatorSymbolConfiguration
{
  return 0;
}

- (double)_resolvedIndicatorPadding
{
  return 0.0;
}

- (id)_resolvedActivityIndicatorColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (int64_t)_resolvedIdiom
{
  return -1;
}

- (id)_apiValue
{
  return 0;
}

- (id)_updateFromButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "_configurationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonConfiguration updatedConfigurationForState:](self, "updatedConfigurationForState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_updateMetadataFromButton:", v4);
  return v6;
}

- (int64_t)titleLineBreakMode
{
  return 0;
}

- (int64_t)subtitleLineBreakMode
{
  return 0;
}

- (BOOL)_hasMultilineTitle
{
  void *v2;
  BOOL v3;

  -[_UIButtonConfiguration attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)_hasMultilineSubtitle
{
  void *v2;
  BOOL v3;

  -[_UIButtonConfiguration attributedSubtitle](self, "attributedSubtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)_hasOversizedTitle
{
  return 0;
}

- (BOOL)_hasOversizedSubtitle
{
  return 0;
}

- (BOOL)_hasSymbolImage
{
  return 0;
}

- (BOOL)_isRoundButton
{
  return 0;
}

- (BOOL)_hasObscuringBackground
{
  _UIButtonConfiguration *v2;
  void *v3;

  v2 = self;
  -[_UIButtonConfiguration background](self, "background");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonConfiguration _resolvedIdiom](v2, "_resolvedIdiom");
  LOBYTE(v2) = _UIBackgroundConfigurationIsObscuring(v3);

  return (char)v2;
}

+ (_UIButtonConfiguration)configurationWithStyle:(int64_t)a3
{
  _UIButtonConfiguration *v4;
  int64x2_t *v5;
  int64x2_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  int64x2_t v16;
  objc_super v18;

  v4 = [_UIButtonConfiguration alloc];
  if (!v4)
    return (_UIButtonConfiguration *)0;
  v18.receiver = v4;
  v18.super_class = (Class)_UIButtonConfiguration;
  v5 = objc_msgSendSuper2(&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[9].i64[0] = a3;
    v5[5].i64[0] = 2;
    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v6[2].i64[1];
    v6[2].i64[1] = v7;

    v9 = v6[9].i64[0];
    switch(v9)
    {
      case 3:
        objc_msgSend((id)v6[2].i64[1], "setBackgroundColor:", 0);
        +[UIColor whiteColor](UIColor, "whiteColor");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v6[3].i64[1];
        v6[3].i64[1] = v12;

        break;
      case 2:
        objc_msgSend((id)v6[2].i64[1], "setBackgroundColor:", 0);
        break;
      case 1:
        +[UIColor clearColor](UIColor, "clearColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v6[2].i64[1], "setStrokeColor:", v10);

        objc_msgSend((id)v6[2].i64[1], "setStrokeWidth:", 1.0);
        +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v6[2].i64[1], "setBackgroundColor:", v11);

        break;
    }
    objc_msgSend(MEMORY[0x1E0CD27A8], "cornerCurveExpansionFactor:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend((id)v6[2].i64[1], "setCornerRadius:", 22.0 / v14);
    +[UIColor clearColor](UIColor, "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6[2].i64[1], "setStrokeColor:", v15);

    objc_msgSend((id)v6[2].i64[1], "setStrokeWidth:", 1.0);
    v6[8].i64[0] = 0x4020000000000000;
    v16 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v6[10] = v16;
    v6[11] = v16;
  }
  return (_UIButtonConfiguration *)v6;
}

+ (id)plainButtonConfiguration
{
  return (id)objc_msgSend(a1, "configurationWithStyle:", 0);
}

+ (id)grayButtonConfiguration
{
  return (id)objc_msgSend(a1, "configurationWithStyle:", 1);
}

+ (id)tintedButtonConfiguration
{
  return (id)objc_msgSend(a1, "configurationWithStyle:", 2);
}

+ (id)filledButtonConfiguration
{
  return (id)objc_msgSend(a1, "configurationWithStyle:", 3);
}

- (id)updatedConfigurationForState:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;

  v4 = a3;
  v5 = (_QWORD *)-[_UIButtonConfiguration copy](self, "copy");
  -[UIBackgroundConfiguration updatedConfigurationForState:](self->_background, "updatedConfigurationForState:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5[5];
  v5[5] = v6;

  switch(-[_UIButtonConfiguration style](self, "style"))
  {
    case 0:
      if (objc_msgSend(v4, "isHighlighted"))
      {
        objc_msgSend(v4, "traitCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "userInterfaceStyle");

        if (v9 == 2)
          v10 = 17;
        else
          v10 = 14;
        _UIConfigurationColorTransformerForIdentifier(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
        v12 = 0;
      }
      v15 = 0;
      if ((objc_msgSend(v4, "isDisabled") & 1) != 0)
        goto LABEL_39;
      break;
    case 1:
      if (objc_msgSend(v4, "isHighlighted"))
      {
        objc_msgSend(v4, "traitCollection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "userInterfaceStyle");

        if (v26 == 2)
          v10 = 16;
        else
          v10 = 14;
        _UIConfigurationColorTransformerForIdentifier(v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "traitCollection");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "userInterfaceStyle");

        if (v29 == 2)
          v15 = 15;
        else
          v15 = 14;
      }
      else
      {
        v10 = 0;
        v12 = 0;
        v15 = 0;
      }
      goto LABEL_37;
    case 2:
      objc_msgSend(v4, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceStyle");

      if (v14 == 2)
        v15 = 22;
      else
        v15 = 21;
      if (objc_msgSend(v4, "isHighlighted"))
      {
        objc_msgSend(v4, "traitCollection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "userInterfaceStyle");

        if (v17 == 2)
          v10 = 16;
        else
          v10 = 14;
        _UIConfigurationColorTransformerForIdentifier(v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "traitCollection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "userInterfaceStyle");

        if (v20 == 2)
          v15 = 24;
        else
          v15 = 25;
      }
      else
      {
        v10 = 0;
        v12 = 0;
      }
LABEL_37:
      if ((objc_msgSend(v4, "isDisabled") & 1) != 0)
        goto LABEL_38;
      break;
    case 3:
      if (objc_msgSend(v4, "isHighlighted"))
      {
        objc_msgSend(v4, "traitCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "userInterfaceStyle");

        v22 = &__block_literal_global_4_5;
        -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, &__block_literal_global_4_5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "traitCollection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "userInterfaceStyle");

        v10 = 14;
        if (v24 == 2)
          v15 = 17;
        else
          v15 = 14;
      }
      else
      {
        v10 = 0;
        v12 = 0;
        v15 = 0;
      }
      if (!objc_msgSend(v4, "isDisabled"))
        break;
LABEL_38:
      v15 = 23;
LABEL_39:
      objc_msgSend(v4, "traitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "userInterfaceStyle");

      v31 = &__block_literal_global_23_1;
      -[_UIButtonConfiguration _baseAttributesTransformerForTransformer:](self, &__block_literal_global_23_1);
      v32 = objc_claimAutoreleasedReturnValue();

      v10 = 26;
      v12 = (void *)v32;
      break;
    default:
      v10 = 0;
      v12 = 0;
      v15 = 0;
      break;
  }
  if (!self->_hasCustomizedImageTintColorTransformer)
    objc_msgSend(v5, "_setImageTintColorTransformerIdentifier:", v10);
  v33 = _Block_copy(v12);
  v34 = (void *)v5[1];
  v5[1] = v33;

  objc_msgSend(v5, "background");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35 && (*(_WORD *)(v35 + 8) & 0x20) == 0)
    -[UIBackgroundConfiguration _setBackgroundColorTransformerIdentifier:](v35, v15);

  return v5;
}

- (id)_baseAttributesTransformerForTransformer:(void *)a1
{
  id v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67___UIButtonConfiguration__baseAttributesTransformerForTransformer___block_invoke;
    aBlock[3] = &unk_1E16DAAF8;
    v7 = v3;
    a1 = _Block_copy(aBlock);

  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIButtonConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIButtonConfiguration *v5;
  uint64_t v6;
  NSAttributedString *attributedTitle;
  uint64_t v8;
  NSAttributedString *attributedSubtitle;
  uint64_t v10;
  UIImage *image;
  uint64_t v12;
  UIColor *imageTintColor;
  float v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  UIBackgroundConfiguration *background;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_UIButtonConfiguration;
  v5 = -[_UIButtonConfiguration init](&v22, sel_init);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationButtonStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationAttributedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    attributedTitle = v5->_attributedTitle;
    v5->_attributedTitle = (NSAttributedString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationAttributedSubtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    attributedSubtitle = v5->_attributedSubtitle;
    v5->_attributedSubtitle = (NSAttributedString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationImage"));
    v10 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationImageTintColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageTintColor = v5->_imageTintColor;
    v5->_imageTintColor = (UIColor *)v12;

    v5->_showsBusyIndicator = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIButtonConfigurationShowsBusyIndicator"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIButtonConfigurationTitlePadding"));
    v5->_imageToTitlePadding = v14;
    v5->_imageEdge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationImageEdge"));
    v5->_macIdiomStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationMacIdiomStyle"));
    objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("UIButtonConfigurationBackgroundToContentInsets"));
    v5->_backgroundToContentInsets.top = v15;
    v5->_backgroundToContentInsets.leading = v16;
    v5->_backgroundToContentInsets.bottom = v17;
    v5->_backgroundToContentInsets.trailing = v18;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationBackground"));
    v19 = objc_claimAutoreleasedReturnValue();
    background = v5->_background;
    v5->_background = (UIBackgroundConfiguration *)v19;

    -[_UIButtonConfiguration _setImageTintColorTransformerIdentifier:](v5, "_setImageTintColorTransformerIdentifier:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationImageColorTransformer")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  double imageToTitlePadding;
  id v6;

  style = self->_style;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", style, CFSTR("UIButtonStyle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_attributedTitle, CFSTR("UIButtonConfigurationAttributedTitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_attributedSubtitle, CFSTR("UIButtonConfigurationAttributedSubtitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_image, CFSTR("UIButtonConfigurationImage"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_imageTintColor, CFSTR("UIButtonConfigurationImageTintColor"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_showsBusyIndicator, CFSTR("UIButtonConfigurationShowsBusyIndicator"));
  imageToTitlePadding = self->_imageToTitlePadding;
  *(float *)&imageToTitlePadding = imageToTitlePadding;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("UIButtonConfigurationTitlePadding"), imageToTitlePadding);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_imageEdge, CFSTR("UIButtonConfigurationImageEdge"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_macIdiomStyle, CFSTR("UIButtonConfigurationMacIdiomStyle"));
  objc_msgSend(v6, "encodeDirectionalEdgeInsets:forKey:", CFSTR("UIButtonConfigurationBackgroundToContentInsets"), self->_backgroundToContentInsets.top, self->_backgroundToContentInsets.leading, self->_backgroundToContentInsets.bottom, self->_backgroundToContentInsets.trailing);
  objc_msgSend(v6, "encodeObject:forKey:", self->_background, CFSTR("UIButtonConfigurationBackground"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_imageTintColorTransformerIdentifier, CFSTR("UIButtonConfigurationImageColorTransformer"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = objc_msgSend(self->_baseAttributesTransformer, "copy");
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  *(_QWORD *)(v4 + 144) = self->_style;
  *(_QWORD *)(v4 + 152) = self->_macIdiomStyle;
  v7 = -[UIBackgroundConfiguration copy](self->_background, "copy");
  v8 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v7;

  objc_storeStrong((id *)(v4 + 48), self->_image);
  objc_storeStrong((id *)(v4 + 56), self->_imageTintColor);
  v9 = objc_msgSend(self->_imageTintColorTransformer, "copy");
  v10 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v9;

  *(_QWORD *)(v4 + 136) = self->_imageTintColorTransformerIdentifier;
  objc_storeStrong((id *)(v4 + 72), self->_preferredSymbolConfigurationForImage);
  *(_QWORD *)(v4 + 88) = self->_buttonSize;
  v11 = -[NSAttributedString copy](self->_attributedTitle, "copy");
  v12 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v11;

  v13 = objc_msgSend(self->_titleTextAttributesTransformer, "copy");
  v14 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v13;

  v15 = -[NSAttributedString copy](self->_attributedSubtitle, "copy");
  v16 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v15;

  v17 = objc_msgSend(self->_subtitleTextAttributesTransformer, "copy");
  v18 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v17;

  *(_BYTE *)(v4 + 33) = self->_showsBusyIndicator;
  v19 = *(_OWORD *)&self->_backgroundToContentInsets.bottom;
  *(_OWORD *)(v4 + 160) = *(_OWORD *)&self->_backgroundToContentInsets.top;
  *(_OWORD *)(v4 + 176) = v19;
  *(double *)(v4 + 128) = self->_imageToTitlePadding;
  *(_QWORD *)(v4 + 80) = self->_imageEdge;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIButtonConfiguration *v4;
  _UIButtonConfiguration *v5;
  _UIButtonConfiguration *v6;
  char v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;

  v4 = (_UIButtonConfiguration *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_style != v5->_style)
        goto LABEL_7;
      if (self->_macIdiomStyle != v5->_macIdiomStyle)
        goto LABEL_7;
      if (self->_showsBusyIndicator != v5->_showsBusyIndicator)
        goto LABEL_7;
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundToContentInsets.top, *(float64x2_t *)&v5->_backgroundToContentInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_backgroundToContentInsets.bottom, *(float64x2_t *)&v5->_backgroundToContentInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_7;
      if (self->_imageToTitlePadding != v5->_imageToTitlePadding)
        goto LABEL_7;
      if (self->_imageEdge != v5->_imageEdge)
        goto LABEL_7;
      if (!UIEqual(self->_image, v5->_image))
        goto LABEL_7;
      v9 = _Block_copy(self->_imageTintColorTransformer);
      v10 = _Block_copy(v6->_imageTintColorTransformer);
      v11 = UIEqual(v9, v10);

      if (!v11)
        goto LABEL_7;
      if (self->_buttonSize != v6->_buttonSize)
        goto LABEL_7;
      if (!UIEqual(self->_preferredSymbolConfigurationForImage, v6->_preferredSymbolConfigurationForImage))goto LABEL_7;
      if (!UIEqual(self->_attributedTitle, v6->_attributedTitle))
        goto LABEL_7;
      v12 = _Block_copy(self->_titleTextAttributesTransformer);
      v13 = _Block_copy(v6->_titleTextAttributesTransformer);
      v14 = UIEqual(v12, v13);

      if (!v14)
        goto LABEL_7;
      if (UIEqual(self->_attributedSubtitle, v6->_attributedSubtitle)
        && (v15 = _Block_copy(self->_subtitleTextAttributesTransformer),
            v16 = _Block_copy(v6->_subtitleTextAttributesTransformer),
            v17 = UIEqual(v15, v16),
            v16,
            v15,
            v17))
      {
        v7 = UIEqual(self->_background, v6->_background);
      }
      else
      {
LABEL_7:
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[UIBackgroundConfiguration hash](self->_background, "hash");
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSAttributedString *attributedTitle;
  void *v6;
  NSAttributedString *attributedSubtitle;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIButtonConfiguration;
  -[_UIButtonConfiguration description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" background=%@"), self->_background);
  if (-[NSAttributedString length](self->_attributedTitle, "length"))
  {
    attributedTitle = self->_attributedTitle;
    -[NSAttributedString string](attributedTitle, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" title=[<%p>]%@"), attributedTitle, v6);

  }
  if (-[NSAttributedString length](self->_attributedSubtitle, "length"))
  {
    attributedSubtitle = self->_attributedSubtitle;
    -[NSAttributedString string](attributedSubtitle, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" subTitle=[<%p>]%@"), attributedSubtitle, v8);

  }
  if (self->_image)
    objc_msgSend(v4, "appendFormat:", CFSTR(" image=%@"), self->_image);
  return (NSString *)v4;
}

- (void)setImageEdge:(unint64_t)a3
{
  void *v6;

  if (a3 > 8 || ((1 << a3) & 0x116) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonConfiguration.m"), 360, CFSTR("Only single edges are supported by _UIButtonConfiguration.imageEdge (%lx was specified)"), a3);

  }
  self->_imageEdge = a3;
}

- (void)setImageTintColorTransformer:(id)a3
{
  void *v4;
  id imageTintColorTransformer;

  v4 = _Block_copy(a3);
  imageTintColorTransformer = self->_imageTintColorTransformer;
  self->_imageTintColorTransformer = v4;

  self->_hasCustomizedImageTintColorTransformer = 1;
}

- (NSString)title
{
  return -[NSAttributedString string](self->_attributedTitle, "string");
}

- (void)setTitle:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
    -[_UIButtonConfiguration setAttributedTitle:](self, "setAttributedTitle:", v4);

  }
  else
  {
    -[_UIButtonConfiguration setAttributedTitle:](self, "setAttributedTitle:", 0);
  }

}

- (NSString)subtitle
{
  return -[NSAttributedString string](self->_attributedSubtitle, "string");
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
    -[_UIButtonConfiguration setAttributedSubtitle:](self, "setAttributedSubtitle:", v4);

  }
  else
  {
    -[_UIButtonConfiguration setAttributedSubtitle:](self, "setAttributedSubtitle:", 0);
  }

}

- (NSDirectionalEdgeInsets)backgroundToContentInsets
{
  unint64_t v2;
  double bottom;
  double trailing;
  double top;
  double leading;
  NSDirectionalEdgeInsets result;

  v2 = self->_buttonSize - 1;
  if (v2 > 2)
  {
    trailing = 12.0;
    bottom = 7.0;
  }
  else
  {
    bottom = dbl_186681F38[v2];
    trailing = dbl_186681F50[v2];
  }
  top = self->_backgroundToContentInsets.top;
  leading = self->_backgroundToContentInsets.leading;
  if (top == -1.79769313e308)
    top = bottom;
  if (leading == -1.79769313e308)
    leading = trailing;
  if (self->_backgroundToContentInsets.bottom != -1.79769313e308)
    bottom = self->_backgroundToContentInsets.bottom;
  if (self->_backgroundToContentInsets.trailing != -1.79769313e308)
    trailing = self->_backgroundToContentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)_setImageTintColorTransformerIdentifier:(int64_t)a3
{
  void *v4;
  id imageTintColorTransformer;

  self->_imageTintColorTransformerIdentifier = a3;
  _UIConfigurationColorTransformerForIdentifier(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  imageTintColorTransformer = self->_imageTintColorTransformer;
  self->_imageTintColorTransformer = v4;

}

- (_QWORD)_defaultTitleColor
{
  if (a1)
  {
    if (a1[18] == 3)
      +[UIColor whiteColor](UIColor, "whiteColor");
    else
      +[UIColor tintColor](UIColor, "tintColor");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_titleFontForRole
{
  unint64_t v1;
  BOOL v2;
  __CFString **v3;
  const UIFontTextStyle *v4;
  id *v5;
  id v6;
  void *v7;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 88) - 1;
    v2 = v1 >= 2;
    if (v1 >= 2)
      v3 = UIFontTextStyleEmphasizedBody;
    else
      v3 = UIFontTextStyleEmphasizedSubheadline;
    v4 = &UIFontTextStyleSubheadline;
    if (v2)
      v4 = &UIFontTextStyleBody;
    if (*(_QWORD *)(a1 + 24) == 1)
      v5 = (id *)v3;
    else
      v5 = (id *)v4;
    v6 = *v5;
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_resolvedTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!-[NSAttributedString length](self->_attributedTitle, "length"))
    return 0;
  v8[0] = *(_QWORD *)off_1E1678D90;
  -[_UIButtonConfiguration _titleFontForRole]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *(_QWORD *)off_1E1678D98;
  -[_UIButtonConfiguration _defaultTitleColor](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _UIButtonUpdateStringAttributes_0(self->_attributedTitle, v5, self->_baseAttributesTransformer, self->_titleTextAttributesTransformer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_resolvedSubtitle
{
  const UIFontTextStyle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!-[NSAttributedString length](self->_attributedSubtitle, "length"))
    return 0;
  v9[0] = *(_QWORD *)off_1E1678D90;
  if ((unint64_t)(self->_buttonSize - 1) >= 2)
    v3 = &UIFontTextStyleFootnote;
  else
    v3 = &UIFontTextStyleCaption1;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *(_QWORD *)off_1E1678D98;
  -[_UIButtonConfiguration _defaultTitleColor](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _UIButtonUpdateStringAttributes_0(self->_attributedSubtitle, v6, self->_baseAttributesTransformer, self->_subtitleTextAttributesTransformer);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_resolvedImageColor
{
  UIColor *imageTintColor;
  UIColor *v4;
  void *v5;
  void (**imageTintColorTransformer)(id, void *);
  uint64_t v7;

  imageTintColor = self->_imageTintColor;
  if (imageTintColor)
  {
    v4 = imageTintColor;
  }
  else
  {
    +[UIColor tintColor](UIColor, "tintColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  imageTintColorTransformer = (void (**)(id, void *))self->_imageTintColorTransformer;
  if (imageTintColorTransformer)
  {
    imageTintColorTransformer[2](imageTintColorTransformer, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (double)_resolvedActivityIndicatorSize
{
  void *v2;
  double v3;
  double v4;

  -[_UIButtonConfiguration _titleFontForRole]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  v4 = v3;

  return v4;
}

- (id)_traitCollection
{
  return self->_traitCollection;
}

- (void)_updateMetadataFromButton:(id)a3
{
  id v4;
  UITraitCollection *v5;
  UITraitCollection *traitCollection;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "traitCollection");
  v5 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  traitCollection = self->_traitCollection;
  self->_traitCollection = v5;

  v7 = objc_msgSend(v4, "role");
  self->_role = v7;
}

- (UIBackgroundConfiguration)background
{
  return self->_background;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageTintColor, a3);
}

- (id)imageTintColorTransformer
{
  return self->_imageTintColorTransformer;
}

- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImage
{
  return self->_preferredSymbolConfigurationForImage;
}

- (void)setPreferredSymbolConfigurationForImage:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSymbolConfigurationForImage, a3);
}

- (unint64_t)imageEdge
{
  return self->_imageEdge;
}

- (int64_t)buttonSize
{
  return self->_buttonSize;
}

- (void)setButtonSize:(int64_t)a3
{
  self->_buttonSize = a3;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)titleTextAttributesTransformer
{
  return self->_titleTextAttributesTransformer;
}

- (void)setTitleTextAttributesTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (void)setAttributedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)subtitleTextAttributesTransformer
{
  return self->_subtitleTextAttributesTransformer;
}

- (void)setSubtitleTextAttributesTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)showsBusyIndicator
{
  return self->_showsBusyIndicator;
}

- (void)setShowsBusyIndicator:(BOOL)a3
{
  self->_showsBusyIndicator = a3;
}

- (void)setBackgroundToContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_backgroundToContentInsets = a3;
}

- (double)imageToTitlePadding
{
  return self->_imageToTitlePadding;
}

- (void)setImageToTitlePadding:(double)a3
{
  self->_imageToTitlePadding = a3;
}

- (int64_t)imageTintColorTransformerIdentifier
{
  return self->_imageTintColorTransformerIdentifier;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)macIdiomStyle
{
  return self->_macIdiomStyle;
}

- (void)setMacIdiomStyle:(int64_t)a3
{
  self->_macIdiomStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subtitleTextAttributesTransformer, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong(&self->_titleTextAttributesTransformer, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfigurationForImage, 0);
  objc_storeStrong(&self->_imageTintColorTransformer, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong(&self->_baseAttributesTransformer, 0);
}

@end
