@implementation UIListContentConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[UIListContentImageProperties copy](self->_imageProperties, "copy");
    v6 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v5;

    v7 = -[UIListContentTextProperties copy](self->_textProperties, "copy");
    v8 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v7;

    v9 = -[UIListContentTextProperties copy](self->_secondaryTextProperties, "copy");
    v10 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v9;

    *(_QWORD *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    v11 = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 88) = v11;
    *(_BYTE *)(v4 + 12) = self->_prefersSideBySideTextAndSecondaryText;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    *(double *)(v4 + 32) = self->_textToSecondaryTextHorizontalPadding;
    *(double *)(v4 + 40) = self->_textToSecondaryTextVerticalPadding;
    *(double *)(v4 + 48) = self->_alpha;
    *(_BYTE *)(v4 + 13) = self->_enforcesMinimumHeight;
    *(_QWORD *)(v4 + 56) = self->_defaultStyle;
    *($B71C294484D86EC4F08CB958832877D7 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

+ (UIListContentConfiguration)extraProminentInsetGroupedHeaderConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultInsetGroupedHeaderConfigurationForState:traitCollection:isExtraProminent:]((uint64_t)a1, v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

- (void)setImage:(UIImage *)image
{
  -[UIContentUnavailableImageProperties setImage:]((uint64_t)self->_imageProperties, image);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextProperties, 0);
  objc_storeStrong((id *)&self->_textProperties, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
}

+ (id)_defaultHeaderFooterConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 isHeader:(uint64_t)a5 style:
{
  id v8;
  id v9;
  void *v10;
  UIListContentImageProperties *v11;
  const char *v12;
  void *v13;
  void *v14;
  UIListContentTextProperties *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id *v34;

  v8 = a2;
  v9 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(UIListContentImageProperties);
  objc_msgSend(v10, "defaultImageSymbolConfigurationForTraitCollection:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_setProperty_nonatomic_copy(v11, v12, v13, 24);

  objc_msgSend(v10, "defaultImageTintColorForState:traitCollection:", v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v14);

  v15 = objc_alloc_init(UIListContentTextProperties);
  if ((_DWORD)a4)
  {
    objc_msgSend(v10, "defaultHeaderFontForTableViewStyle:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v15, v16);

    objc_msgSend(v10, "defaultHeaderTextColorForTableViewStyle:focused:", a5, objc_msgSend(v8, "isFocused"));
  }
  else
  {
    objc_msgSend(v10, "defaultFooterFontForTableViewStyle:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v15, v17);

    objc_msgSend(v10, "defaultFooterTextColorForTableViewStyle:focused:", a5, objc_msgSend(v8, "isFocused"));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v15, v18);

  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v15, v10, v9, 0);
  if (v15)
  {
    v15->_showsExpansionTextWhenTruncated = 0;
    v15->_transform = objc_msgSend(v10, "shouldUppercaseHeaderFooterTextForTableStyle:isHeader:", a5, a4);
  }
  else
  {
    objc_msgSend(v10, "shouldUppercaseHeaderFooterTextForTableStyle:isHeader:", a5, a4);
  }
  v19 = -[UIListContentTextProperties copy](v15, "copy");
  v20 = (void *)v19;
  if (v19)
    *(_QWORD *)(v19 + 96) = 0;
  objc_msgSend(v10, "defaultHeaderFooterLayoutMarginsForTableViewStyle:isHeader:isFirstSection:", a5, a4, 0);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = objc_msgSend(v9, "layoutDirection");
  if (v29 == 1)
    v30 = v28;
  else
    v30 = v24;
  if (v29 != 1)
    v24 = v28;
  objc_msgSend(v10, "defaultImageToTextPaddingForSidebar:", 0);
  v32 = v31;
  objc_msgSend(v10, "defaultTextToSubtitlePaddingForCellStyle:", 0);
  v34 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v11, v15, v20, 0, v22, v30, v26, v24, v32, v33);

  return v34;
}

+ (id)_defaultInsetGroupedHeaderConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 isExtraProminent:
{
  id v6;
  id v7;
  void *v8;
  UIListContentImageProperties *v9;
  const char *v10;
  void *v11;
  UIListContentTextProperties *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id *v34;
  id *v35;
  unint64_t v36;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(UIListContentImageProperties);
  objc_msgSend(v8, "defaultImageSymbolConfigurationForTraitCollection:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_setProperty_nonatomic_copy(v9, v10, v11, 24);

  v12 = objc_alloc_init(UIListContentTextProperties);
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v12, v8, v7, 0);

  if (v12)
    v12->_showsExpansionTextWhenTruncated = 0;
  v13 = (void *)-[UIListContentTextProperties copy](v12, "copy");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "defaultInsetGroupedHeaderFontForExtraProminentStyle:secondaryText:", a4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v12, v14);

    objc_msgSend(v8, "defaultInsetGroupedHeaderFontForExtraProminentStyle:secondaryText:", a4, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v13, v15);

  }
  +[UIColor labelColor](UIColor, "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v12, v16);

  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v13, v17);

  v18 = v6;
  if ((objc_msgSend(v18, "isDisabled") & 1) != 0)
  {
    v19 = objc_msgSend(v18, "isSwiped");

    if ((v19 & 1) == 0)
    {
      +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v9, v20);

      +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v12, v21);

      +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v13, v22);

      goto LABEL_13;
    }
  }
  else
  {

  }
  if (objc_msgSend(v18, "isHighlighted"))
  {
    -[UIListContentImageProperties _setTintColorTransformerIdentifier:]((uint64_t)v9, 7);
    -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v12, 7);
    -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v13, 7);
  }
LABEL_13:
  v23 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "defaultInsetGroupedHeaderLayoutMarginsForExtraProminentStyle:", a4);
    v26 = v27;
    v25 = v28;
    v24 = v29;
    v23 = v30;
  }
  objc_msgSend(v8, "defaultImageToTextPaddingForSidebar:", 0);
  v32 = v31;
  objc_msgSend(v8, "defaultTextToSubtitlePaddingForCellStyle:", 0);
  v34 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v9, v12, v13, 0, v26, v25, v24, v23, v32, v33);
  v35 = v34;
  if (v34)
    v34[2] = 0;
  if ((_DWORD)a4)
    v36 = 13;
  else
    v36 = 12;
  -[UIListContentConfiguration _setDefaultStyle:]((uint64_t)v34, v36);

  return v35;
}

+ (id)_defaultCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  void *v6;
  UIListContentImageProperties *v7;
  const char *v8;
  void *v9;
  void *v10;
  UIListContentTextProperties *v11;
  void *v12;
  void *v13;
  UIListContentTextProperties *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id *v27;
  id *v28;
  __int16 v29;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(UIListContentImageProperties);
  objc_msgSend(v6, "defaultImageSymbolConfigurationForTraitCollection:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v8, v9, 24);

  objc_msgSend(v6, "defaultImageTintColorForState:traitCollection:", v5, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v10);

  v11 = objc_alloc_init(UIListContentTextProperties);
  objc_msgSend(v6, "defaultTextLabelFontForCellStyle:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v12);

  objc_msgSend(v6, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 0, v4, 0, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v11, v13);

  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v6, v4, 0);
  v14 = objc_alloc_init(UIListContentTextProperties);
  objc_msgSend(v6, "defaultDetailTextFontForCellStyle:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v15);

  objc_msgSend(v6, "defaultDetailTextColorForCellStyle:traitCollection:state:", 3, v4, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v14, v16);
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v6, v4, 0);
  v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 0, 0, 0);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v6, "defaultImageToTextPaddingForSidebar:", 0);
  v25 = v24;
  objc_msgSend(v6, "defaultTextToSubtitlePaddingForCellStyle:", 0);
  v27 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v7, v11, v14, 0, v17, v19, v21, v23, v25, v26);
  v28 = v27;
  if (v27)
  {
    v27[7] = 0;
    v29 = *((_WORD *)v27 + 4);
    if ((v29 & 0x40) == 0)
      *((_BYTE *)v27 + 13) = 1;
    *((_WORD *)v27 + 4) = v29 & 0xFEFF;
  }

  return v28;
}

- (void)_setDefaultStyle:(uint64_t)a1
{
  __int16 v3;
  void *v4;

  if (a1)
  {
    *(_QWORD *)(a1 + 56) = a2;
    if ((*(_BYTE *)(a1 + 8) & 0x40) == 0)
    {
      switch(a2)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 7uLL:
        case 8uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
          *(_BYTE *)(a1 + 13) = 1;
          break;
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0x11uLL:
        case 0x12uLL:
          *(_BYTE *)(a1 + 13) = 0;
          break;
        case 9uLL:
          *(_BYTE *)(a1 + 13) = 1;
          goto LABEL_8;
        default:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setDefaultStyle_, a1, CFSTR("UIListContentConfiguration.m"), 905, CFSTR("Unknown style: %ld"), *(_QWORD *)(a1 + 56));

          *(_BYTE *)(a1 + 13) = 1;
          a2 = *(_QWORD *)(a1 + 56);
          break;
      }
    }
    if (a2 <= 0x10 && ((1 << a2) & 0x18F80) != 0)
LABEL_8:
      v3 = *(_WORD *)(a1 + 8) | 0x100;
    else
      v3 = *(_WORD *)(a1 + 8) & 0xFEFF;
    *(_WORD *)(a1 + 8) = v3;
  }
}

- (id)_initWithImageProperties:(void *)a3 textProperties:(void *)a4 secondaryTextProperties:(char)a5 directionalLayoutMargins:(double)a6 prefersSideBySideTextAndSecondaryText:(double)a7 imageToTextPadding:(double)a8 textToSecondaryTextVerticalPadding:(double)a9
{
  id v22;
  id v23;
  id v24;
  id *v25;
  objc_super v27;

  v22 = a2;
  v23 = a3;
  v24 = a4;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)UIListContentConfiguration;
    v25 = (id *)objc_msgSendSuper2(&v27, sel_init);
    a1 = v25;
    if (v25)
    {
      objc_storeStrong(v25 + 8, a2);
      objc_storeStrong(a1 + 9, a3);
      objc_storeStrong(a1 + 10, a4);
      a1[2] = (id)1;
      *((double *)a1 + 11) = a6;
      *((double *)a1 + 12) = a7;
      *((double *)a1 + 13) = a8;
      *((double *)a1 + 14) = a9;
      *((_BYTE *)a1 + 12) = a5;
      *((double *)a1 + 3) = a10;
      a1[4] = (id)0x4020000000000000;
      *((double *)a1 + 5) = a11;
      a1[6] = (id)0x3FF0000000000000;
    }
  }

  return a1;
}

- (id)makeContentView
{
  return -[UIListContentView initWithConfiguration:]([UIListContentView alloc], "initWithConfiguration:", self);
}

- (BOOL)isEqual:(id)a3
{
  UIListContentConfiguration *v4;
  UIListContentConfiguration *v5;
  UIListContentConfiguration *v6;
  UIListContentConfiguration *v7;

  v4 = (UIListContentConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = v6;
    if (self)
      LOBYTE(self) = self->_defaultStyle == v6->_defaultStyle
                  && ((*(_WORD *)&v6->_configurationFlags ^ *(_WORD *)&self->_configurationFlags) & 0x100) == 0
                  && self->_alpha == v6->_alpha
                  && -[UIListContentImageProperties _isEqualToProperties:compareImage:]((uint64_t)self->_imageProperties, v6->_imageProperties, 1)&& -[UIListContentTextProperties _isEqualToProperties:compareText:]((uint64_t)self->_textProperties, v7->_textProperties, 1)&& -[UIListContentTextProperties _isEqualToProperties:compareText:]((uint64_t)self->_secondaryTextProperties, v7->_secondaryTextProperties, 1)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top),
                                                    (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_prefersSideBySideTextAndSecondaryText == v7->_prefersSideBySideTextAndSecondaryText&& self->_imageToTextPadding == v7->_imageToTextPadding&& self->_textToSecondaryTextHorizontalPadding == v7->_textToSecondaryTextHorizontalPadding&& self->_textToSecondaryTextVerticalPadding == v7->_textToSecondaryTextVerticalPadding&& self->_enforcesMinimumHeight == v7->_enforcesMinimumHeight;

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (uint64_t)_isEqualToConfigurationQuick:(uint64_t)a1
{
  void **v3;
  void **v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3 == (void **)a1)
      a1 = 1;
    else
      a1 = *(void **)(a1 + 56) == v3[7]
        && ((*((unsigned __int16 *)v3 + 4) ^ *(unsigned __int16 *)(a1 + 8)) & 0x100) == 0
        && *(double *)(a1 + 48) == *((double *)v3 + 6)
        && -[UIListContentImageProperties _isEqualToPropertiesQuick:compareImage:](*(_QWORD *)(a1 + 64), v3[8], 1)&& -[UIListContentTextProperties _isEqualToPropertiesQuick:compareText:](*(_QWORD *)(a1 + 72), v4[9], 1)&& -[UIListContentTextProperties _isEqualToPropertiesQuick:compareText:](*(_QWORD *)(a1 + 80), v4[10], 1)&& *(void **)(a1 + 16) == v4[2]&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 88), *(float64x2_t *)(v4 + 11)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 104), *(float64x2_t *)(v4 + 13)))), 0xFuLL))) & 1) != 0
        && *(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v4 + 12)
        && *(double *)(a1 + 24) == *((double *)v4 + 3)
        && *(double *)(a1 + 32) == *((double *)v4 + 4)
        && *(double *)(a1 + 40) == *((double *)v4 + 5)
        && *(unsigned __int8 *)(a1 + 13) == *((unsigned __int8 *)v4 + 13);
  }

  return a1;
}

- (void)setText:(NSString *)text
{
  -[UIListContentTextProperties setText:](&self->_textProperties->super.isa, text);
}

- (void)_setSwiftBridgingTextProperties:(id)a3
{
  UIListContentTextProperties *v4;
  UIListContentTextProperties *textProperties;
  const char *v6;
  UIListContentTextProperties *v7;
  UIListContentTextProperties *v8;
  const char *v9;
  UIListContentTextProperties *v10;
  UIListContentTextProperties *v11;

  v4 = (UIListContentTextProperties *)a3;
  textProperties = self->_textProperties;
  if (textProperties)
    textProperties = (UIListContentTextProperties *)textProperties->_text;
  v7 = textProperties;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v6, v7, 24);

  v8 = self->_textProperties;
  if (v8)
    v8 = (UIListContentTextProperties *)v8->_attributedText;
  v10 = v8;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v9, v10, 72);

  v11 = self->_textProperties;
  self->_textProperties = v4;

}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)directionalLayoutMargins
{
  *(_WORD *)&self->_configurationFlags |= 2u;
  self->_directionalLayoutMargins = directionalLayoutMargins;
}

- (double)_minimumHeightForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (!self->_enforcesMinimumHeight)
    return 0.0;
  v3 = a3;
  _UITableConstantsForTraitCollection(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumContentViewHeightForFont:traitCollection:", v5, v3);
  v7 = v6;

  return v7;
}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_directionalLayoutMargins.top;
  leading = self->_directionalLayoutMargins.leading;
  bottom = self->_directionalLayoutMargins.bottom;
  trailing = self->_directionalLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (id)updatedConfigurationForState:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t defaultStyle;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int16 configurationFlags;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  __int16 v59;
  void *v61;

  v4 = a3;
  v5 = -[UIListContentConfiguration copy](self, "copy");
  if (self)
    defaultStyle = self->_defaultStyle;
  else
    defaultStyle = 0;
  v7 = v4;
  v8 = objc_opt_self();
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (dyld_program_sdk_at_least()
    && (unint64_t)defaultStyle <= 0x12
    && ((1 << defaultStyle) & 0x60007) != 0)
  {
    v11 = _UICollectionViewListStyleFromListEnvironment(objc_msgSend(v10, "listEnvironment"));
    v12 = v11;
    if (defaultStyle > 1)
    {
      if (defaultStyle != 2)
      {
        if (defaultStyle == 17)
        {
          switch(v11)
          {
            case 0uLL:
            case 4uLL:
              goto LABEL_73;
            case 1uLL:
            case 2uLL:
              +[UIListContentConfiguration _defaultGroupedHeaderConfigurationForState:traitCollection:](v8, v9, v10);
              v13 = objc_claimAutoreleasedReturnValue();
              break;
            case 3uLL:
              +[UIListContentConfiguration _defaultSidebarHeaderConfigurationForState:traitCollection:](v8, v9, v10);
              v13 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, CFSTR("UIListContentConfiguration.m"), 732, CFSTR("Unknown list appearance style in trait collection. Style: %ld; trait collection: %@"),
                v12,
                v10);

LABEL_73:
              +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:](v8, v9, v10);
              v13 = objc_claimAutoreleasedReturnValue();
              break;
          }
          goto LABEL_77;
        }
        if (defaultStyle == 18)
        {
          switch(v11)
          {
            case 0uLL:
            case 4uLL:
              goto LABEL_68;
            case 1uLL:
            case 2uLL:
            case 3uLL:
              +[UIListContentConfiguration _defaultGroupedFooterConfigurationForState:traitCollection:](v8, v9, v10);
              v13 = objc_claimAutoreleasedReturnValue();
              break;
            default:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[UIListContentConfiguration _defaultConfigurationForStyle:state:]");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("UIListContentConfiguration.m"), 753, CFSTR("Unknown list appearance style in trait collection. Style: %ld; trait collection: %@"),
                v12,
                v10);

LABEL_68:
              +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:](v8, v9, v10);
              v13 = objc_claimAutoreleasedReturnValue();
              break;
          }
          goto LABEL_77;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, CFSTR("UIListContentConfiguration.m"), 759, CFSTR("Attempting to unknown resolve generic content configuration style: %ld for state: %@"), defaultStyle, v7);

LABEL_41:
        +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:](v8, v9, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_77;
      }
      if (v11 > 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, CFSTR("UIListContentConfiguration.m"), 712, CFSTR("Unknown list appearance style in trait collection. Style: %ld; trait collection: %@"),
          v12,
          v10);

        goto LABEL_27;
      }
      if (v11 != 2)
      {
LABEL_27:
        +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:](v8, v9, v10);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_77:
        v36 = v13;
        goto LABEL_78;
      }
      +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:](v8, v9, v10);
      v37 = objc_claimAutoreleasedReturnValue();
LABEL_71:
      v36 = v37;
      objc_opt_self();
      goto LABEL_78;
    }
    if (!defaultStyle)
    {
      if (v11 >= 2)
      {
        if (v11 - 3 < 2)
        {
          v22 = objc_msgSend(v10, "_splitViewControllerContext");
          v23 = 1;
          if (v22 == 2)
            v23 = 2;
          if (v12 != 3)
            v23 = 0;
          if (v12 == 4)
            v24 = 3;
          else
            v24 = v23;
          +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:](v8, v9, v10, v24);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_77;
        }
        if (v11 == 2)
        {
          +[UIListContentConfiguration _defaultInsetGroupedCellConfigurationForState:traitCollection:](v8, v9, v10);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_77;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, CFSTR("UIListContentConfiguration.m"), 667, CFSTR("Unknown list appearance style in trait collection. Style: %ld; trait collection: %@"),
          v12,
          v10);

      }
      goto LABEL_41;
    }
    if (v11 >= 2)
    {
      if (v11 - 3 < 2)
      {
        v19 = objc_msgSend(v10, "_splitViewControllerContext");
        v20 = 1;
        if (v19 == 2)
          v20 = 2;
        if (v12 != 3)
          v20 = 0;
        if (v12 == 4)
          v21 = 3;
        else
          v21 = v20;
        +[UIListContentConfiguration _defaultSidebarSubtitleCellConfigurationForState:traitCollection:style:](v8, v9, v10, v21);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_77;
      }
      if (v11 == 2)
      {
        +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:](v8, v9, v10);
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_71;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, CFSTR("UIListContentConfiguration.m"), 692, CFSTR("Unknown list appearance style in trait collection. Style: %ld; trait collection: %@"),
        v12,
        v10);

    }
    +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:](v8, v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_77;
  }
  v14 = v9;
  v15 = v10;
  v16 = objc_opt_self();
  v17 = v16;
  switch(defaultStyle)
  {
    case 0:
      goto LABEL_44;
    case 1:
      +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:](v16, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:](v16, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
    case 17:
      +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:](v16, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
    case 18:
      +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:](v16, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[UIListContentConfiguration _defaultGroupedHeaderConfigurationForState:traitCollection:](v16, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[UIListContentConfiguration _defaultGroupedFooterConfigurationForState:traitCollection:](v16, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      v27 = v14;
      v28 = v15;
      v29 = 1;
      goto LABEL_59;
    case 8:
      v30 = v14;
      v31 = v15;
      v32 = 1;
      goto LABEL_61;
    case 9:
      +[UIListContentConfiguration _defaultSidebarHeaderConfigurationForState:traitCollection:](v16, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      v27 = v14;
      v28 = v15;
      v29 = 2;
      goto LABEL_59;
    case 11:
      v30 = v14;
      v31 = v15;
      v32 = 2;
      goto LABEL_61;
    case 12:
      v33 = v14;
      v34 = v15;
      v35 = 0;
      goto LABEL_56;
    case 13:
      v33 = v14;
      v34 = v15;
      v35 = 1;
LABEL_56:
      +[UIListContentConfiguration _defaultInsetGroupedHeaderConfigurationForState:traitCollection:isExtraProminent:](v16, v33, v34, v35);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      +[UIListContentConfiguration _defaultInsetGroupedCellConfigurationForState:traitCollection:](v16, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      v27 = v14;
      v28 = v15;
      v29 = 3;
LABEL_59:
      +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:](v16, v27, v28, v29);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      v30 = v14;
      v31 = v15;
      v32 = 3;
LABEL_61:
      +[UIListContentConfiguration _defaultSidebarSubtitleCellConfigurationForState:traitCollection:style:](v16, v30, v31, v32);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForFixedStyle_state_traitCollection_, v17, CFSTR("UIListContentConfiguration.m"), 825, CFSTR("Default configuration requested for unknown style: %ld; state: %@; trait collection: %@"),
        defaultStyle,
        v14,
        v15);

LABEL_44:
      +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:](v17, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v36 = v18;

LABEL_78:
  objc_msgSend((id)v5, "imageProperties");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v36, "imageProperties");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentImageProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v43, v44);

  objc_msgSend((id)v5, "textProperties");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v36, "textProperties");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v45, v46);

  objc_msgSend((id)v5, "secondaryTextProperties");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v36, "secondaryTextProperties");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v47, v48);

  configurationFlags = (__int16)self->_configurationFlags;
  if ((configurationFlags & 1) != 0)
    goto LABEL_82;
  if (v36)
  {
    v50 = *(_QWORD *)(v36 + 16);
    if (!v5)
      goto LABEL_82;
    goto LABEL_81;
  }
  v50 = 0;
  if (v5)
  {
LABEL_81:
    *(_QWORD *)(v5 + 16) = v50;
    configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_82:
  if ((configurationFlags & 2) != 0)
    goto LABEL_86;
  if (v36)
  {
    v51 = *(_OWORD *)(v36 + 88);
    v52 = *(_OWORD *)(v36 + 104);
    if (!v5)
      goto LABEL_86;
    goto LABEL_85;
  }
  v51 = 0uLL;
  v52 = 0uLL;
  if (v5)
  {
LABEL_85:
    *(_OWORD *)(v5 + 88) = v51;
    *(_OWORD *)(v5 + 104) = v52;
    configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_86:
  if ((configurationFlags & 4) != 0)
    goto LABEL_90;
  if (v36)
  {
    v53 = *(_BYTE *)(v36 + 12) != 0;
    if (!v5)
      goto LABEL_90;
    goto LABEL_89;
  }
  v53 = 0;
  if (v5)
  {
LABEL_89:
    *(_BYTE *)(v5 + 12) = v53;
    configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_90:
  if ((configurationFlags & 8) != 0)
    goto LABEL_94;
  if (v36)
  {
    v54 = *(_QWORD *)(v36 + 24);
    if (!v5)
      goto LABEL_94;
    goto LABEL_93;
  }
  v54 = 0;
  if (v5)
  {
LABEL_93:
    *(_QWORD *)(v5 + 24) = v54;
    configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_94:
  if ((configurationFlags & 0x10) != 0)
    goto LABEL_98;
  if (v36)
  {
    v55 = *(_QWORD *)(v36 + 32);
    if (!v5)
      goto LABEL_98;
    goto LABEL_97;
  }
  v55 = 0;
  if (v5)
  {
LABEL_97:
    *(_QWORD *)(v5 + 32) = v55;
    configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_98:
  if ((configurationFlags & 0x20) != 0)
    goto LABEL_102;
  if (v36)
  {
    v56 = *(_QWORD *)(v36 + 40);
    if (!v5)
      goto LABEL_102;
    goto LABEL_101;
  }
  v56 = 0;
  if (v5)
  {
LABEL_101:
    *(_QWORD *)(v5 + 40) = v56;
    configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_102:
  if ((configurationFlags & 0x80) != 0)
    goto LABEL_106;
  if (v36)
  {
    v57 = *(_QWORD *)(v36 + 48);
    if (!v5)
      goto LABEL_106;
    goto LABEL_105;
  }
  v57 = 0;
  if (v5)
  {
LABEL_105:
    *(_QWORD *)(v5 + 48) = v57;
    configurationFlags = (__int16)self->_configurationFlags;
  }
LABEL_106:
  if ((configurationFlags & 0x40) != 0)
    goto LABEL_110;
  if (v36)
  {
    v58 = *(_BYTE *)(v36 + 13) != 0;
    if (!v5)
      goto LABEL_110;
    goto LABEL_109;
  }
  v58 = 0;
  if (v5)
LABEL_109:
    *(_BYTE *)(v5 + 13) = v58;
LABEL_110:
  if (v36)
    v59 = *(_WORD *)(v36 + 8) & 0x100;
  else
    v59 = 0;
  *(_WORD *)(v5 + 8) = *(_WORD *)(v5 + 8) & 0xFEFF | v59;

  return (id)v5;
}

- (UIListContentTextProperties)textProperties
{
  return self->_textProperties;
}

- (UIListContentImageProperties)imageProperties
{
  return self->_imageProperties;
}

- (UIListContentTextProperties)secondaryTextProperties
{
  return self->_secondaryTextProperties;
}

- (BOOL)prefersSideBySideTextAndSecondaryText
{
  return self->_prefersSideBySideTextAndSecondaryText;
}

- (CGFloat)imageToTextPadding
{
  return self->_imageToTextPadding;
}

- (UIAxis)axesPreservingSuperviewLayoutMargins
{
  return self->_axesPreservingSuperviewLayoutMargins;
}

- (CGFloat)textToSecondaryTextVerticalPadding
{
  return self->_textToSecondaryTextVerticalPadding;
}

+ (UIListContentConfiguration)groupedHeaderConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultGroupedHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultGroupedHeaderConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[UIListContentConfiguration _defaultHeaderFooterConfigurationForState:traitCollection:isHeader:style:](v6, v5, v4, 1, 1);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)(v7 + 56) = 5;
    v8 = *(_WORD *)(v7 + 8);
    if ((v8 & 0x40) == 0)
      *(_BYTE *)(v7 + 13) = 0;
    *(_WORD *)(v7 + 8) = v8 & 0xFEFF;
  }
  return (id)v7;
}

+ (UIListContentConfiguration)prominentInsetGroupedHeaderConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultInsetGroupedHeaderConfigurationForState:traitCollection:isExtraProminent:]((uint64_t)a1, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
  -[UIListContentTextProperties setAttributedText:](&self->_textProperties->super.isa, attributedText);
}

- (UIImage)image
{
  return (UIImage *)-[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_imageProperties->super.isa);
}

- (void)setTextToSecondaryTextVerticalPadding:(CGFloat)textToSecondaryTextVerticalPadding
{
  *(_WORD *)&self->_configurationFlags |= 0x20u;
  self->_textToSecondaryTextVerticalPadding = textToSecondaryTextVerticalPadding;
}

- (void)setTextToSecondaryTextHorizontalPadding:(CGFloat)textToSecondaryTextHorizontalPadding
{
  *(_WORD *)&self->_configurationFlags |= 0x10u;
  self->_textToSecondaryTextHorizontalPadding = textToSecondaryTextHorizontalPadding;
}

+ (UIListContentConfiguration)cellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultInsetGroupedCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultInsetGroupedCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultInsetGroupedCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  __int16 v7;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:]((uint64_t)UIListContentConfiguration, v5, v4);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  if (v6)
  {
    *(_QWORD *)(v6 + 56) = 14;
    v7 = *(_WORD *)(v6 + 8);
    if ((v7 & 0x40) == 0)
      *(_BYTE *)(v6 + 13) = 1;
    *(_WORD *)(v6 + 8) = v7 & 0xFEFF;
  }
  return (id)v6;
}

- (void)setImageToTextPadding:(CGFloat)imageToTextPadding
{
  *(_WORD *)&self->_configurationFlags |= 8u;
  self->_imageToTextPadding = imageToTextPadding;
}

- (void)setAxesPreservingSuperviewLayoutMargins:(UIAxis)axesPreservingSuperviewLayoutMargins
{
  *(_WORD *)&self->_configurationFlags |= 1u;
  self->_axesPreservingSuperviewLayoutMargins = axesPreservingSuperviewLayoutMargins;
}

- (void)setSecondaryText:(NSString *)secondaryText
{
  -[UIListContentTextProperties setText:](&self->_secondaryTextProperties->super.isa, secondaryText);
}

+ (UIListContentConfiguration)valueCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultValueCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultValueCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  void *v6;
  UIListContentImageProperties *v7;
  const char *v8;
  void *v9;
  void *v10;
  UIListContentTextProperties *v11;
  void *v12;
  void *v13;
  UIListContentTextProperties *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id *v27;
  id *v28;
  __int16 v29;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(UIListContentImageProperties);
  objc_msgSend(v6, "defaultImageSymbolConfigurationForTraitCollection:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v8, v9, 24);

  objc_msgSend(v6, "defaultImageTintColorForState:traitCollection:", v5, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v10);

  v11 = objc_alloc_init(UIListContentTextProperties);
  objc_msgSend(v6, "defaultTextLabelFontForCellStyle:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v12);

  objc_msgSend(v6, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 1, v4, 0, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v11, v13);

  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v6, v4, 0);
  v14 = objc_alloc_init(UIListContentTextProperties);
  objc_msgSend(v6, "defaultDetailTextFontForCellStyle:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v15);

  objc_msgSend(v6, "defaultDetailTextColorForCellStyle:traitCollection:state:", 1, v4, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v14, v16);
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v6, v4, 0);
  v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 1, 0, 0);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v6, "defaultImageToTextPaddingForSidebar:", 0);
  v25 = v24;
  objc_msgSend(v6, "defaultTextToSubtitlePaddingForCellStyle:", 1);
  v27 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v7, v11, v14, 1, v17, v19, v21, v23, v25, v26);
  v28 = v27;
  if (v27)
  {
    v27[7] = (id)2;
    v29 = *((_WORD *)v27 + 4);
    if ((v29 & 0x40) == 0)
      *((_BYTE *)v27 + 13) = 1;
    *((_WORD *)v27 + 4) = v29 & 0xFEFF;
  }

  return v28;
}

+ (UIListContentConfiguration)sidebarSubtitleCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultSidebarSubtitleCellConfigurationForState:traitCollection:style:]((uint64_t)a1, v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)subtitleCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultSubtitleCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  void *v6;
  UIListContentImageProperties *v7;
  const char *v8;
  void *v9;
  void *v10;
  UIListContentTextProperties *v11;
  void *v12;
  void *v13;
  UIListContentTextProperties *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id *v27;
  id *v28;
  __int16 v29;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(UIListContentImageProperties);
  objc_msgSend(v6, "defaultImageSymbolConfigurationForTraitCollection:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v8, v9, 24);

  objc_msgSend(v6, "defaultImageTintColorForState:traitCollection:", v5, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v10);

  v11 = objc_alloc_init(UIListContentTextProperties);
  objc_msgSend(v6, "defaultTextLabelFontForCellStyle:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v12);

  objc_msgSend(v6, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 3, v4, 0, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v11, v13);

  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v6, v4, 0);
  v14 = objc_alloc_init(UIListContentTextProperties);
  objc_msgSend(v6, "defaultDetailTextFontForCellStyle:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v15);

  objc_msgSend(v6, "defaultDetailTextColorForCellStyle:traitCollection:state:", 3, v4, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v14, v16);
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v6, v4, 0);
  v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 3, 0, 0);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v6, "defaultImageToTextPaddingForSidebar:", 0);
  v25 = v24;
  objc_msgSend(v6, "defaultTextToSubtitlePaddingForCellStyle:", 3);
  v27 = -[UIListContentConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:directionalLayoutMargins:prefersSideBySideTextAndSecondaryText:imageToTextPadding:textToSecondaryTextVerticalPadding:]((id *)[UIListContentConfiguration alloc], v7, v11, v14, 0, v17, v19, v21, v23, v25, v26);
  v28 = v27;
  if (v27)
  {
    v27[7] = (id)1;
    v29 = *((_WORD *)v27 + 4);
    if ((v29 & 0x40) == 0)
      *((_BYTE *)v27 + 13) = 1;
    *((_WORD *)v27 + 4) = v29 & 0xFEFF;
  }

  return v28;
}

+ (UIListContentConfiguration)plainHeaderConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultPlainHeaderConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[UIListContentConfiguration _defaultHeaderFooterConfigurationForState:traitCollection:isHeader:style:](v6, v5, v4, 1, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)(v7 + 56) = 3;
    v8 = *(_WORD *)(v7 + 8);
    if ((v8 & 0x40) == 0)
      *(_BYTE *)(v7 + 13) = 0;
    *(_WORD *)(v7 + 8) = v8 & 0xFEFF;
  }
  return (id)v7;
}

+ (id)headerConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int16 v6;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)(v5 + 56) = 17;
    v6 = *(_WORD *)(v5 + 8);
    if ((v6 & 0x40) == 0)
      *(_BYTE *)(v5 + 13) = 0;
    *(_WORD *)(v5 + 8) = v6 & 0xFEFF;
  }
  return (id)v5;
}

+ (id)footerConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int16 v6;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)(v5 + 56) = 18;
    v6 = *(_WORD *)(v5 + 8);
    if ((v6 & 0x40) == 0)
      *(_BYTE *)(v5 + 13) = 0;
    *(_WORD *)(v5 + 8) = v6 & 0xFEFF;
  }
  return (id)v5;
}

+ (id)_defaultPlainFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[UIListContentConfiguration _defaultHeaderFooterConfigurationForState:traitCollection:isHeader:style:](v6, v5, v4, 0, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)(v7 + 56) = 4;
    v8 = *(_WORD *)(v7 + 8);
    if ((v8 & 0x40) == 0)
      *(_BYTE *)(v7 + 13) = 0;
    *(_WORD *)(v7 + 8) = v8 & 0xFEFF;
  }
  return (id)v7;
}

+ (UIListContentConfiguration)accompaniedSidebarCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:]((uint64_t)a1, v3, v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultSidebarCellConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 style:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:](v8, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultImageToTextPaddingForSidebar:", 1);
  if (v9)
  {
    *(_QWORD *)(v9 + 24) = v11;
    *(double *)(v9 + 88) = _UICellContentViewDefaultDirectionalLayoutMargins(v10, v7, 0, 1, 0);
    *(_QWORD *)(v9 + 96) = v12;
    *(_QWORD *)(v9 + 104) = v13;
    *(_QWORD *)(v9 + 112) = v14;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v10, v7, 0, 1, 0);
  }
  +[UIListContentConfiguration _applySidebarCellStylingToConfiguration:forState:traitCollection:constants:style:](v8, (void *)v9, v6, v7, v10, a4);
  if (a4 == 2)
  {
    if (!v9)
      goto LABEL_14;
    v15 = v9 + 8;
    v16 = *(_WORD *)(v9 + 8);
    v17 = 10;
  }
  else if (a4 == 3)
  {
    if (!v9)
      goto LABEL_14;
    v15 = v9 + 8;
    v16 = *(_WORD *)(v9 + 8);
    v17 = 15;
  }
  else
  {
    if (!v9)
      goto LABEL_14;
    v15 = v9 + 8;
    v16 = *(_WORD *)(v9 + 8);
    v17 = 7;
  }
  *(_QWORD *)(v15 + 48) = v17;
  if ((v16 & 0x40) == 0)
    *(_BYTE *)(v9 + 13) = 1;
  *(_WORD *)v15 = v16 | 0x100;
LABEL_14:

  return (id)v9;
}

+ (UIListContentConfiguration)accompaniedSidebarSubtitleCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultSidebarSubtitleCellConfigurationForState:traitCollection:style:]((uint64_t)a1, v3, v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (id)_defaultSidebarSubtitleCellConfigurationForState:(void *)a3 traitCollection:(uint64_t)a4 style:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  +[UIListContentConfiguration _defaultSubtitleCellConfigurationForState:traitCollection:](v8, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultImageToTextPaddingForSidebar:", 1);
  if (v9)
  {
    *(_QWORD *)(v9 + 24) = v11;
    *(double *)(v9 + 88) = _UICellContentViewDefaultDirectionalLayoutMargins(v10, v7, 3, 1, 0);
    *(_QWORD *)(v9 + 96) = v12;
    *(_QWORD *)(v9 + 104) = v13;
    *(_QWORD *)(v9 + 112) = v14;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v10, v7, 3, 1, 0);
  }
  +[UIListContentConfiguration _applySidebarCellStylingToConfiguration:forState:traitCollection:constants:style:](v8, (void *)v9, v6, v7, v10, a4);
  if (a4 == 2)
  {
    if (!v9)
      goto LABEL_14;
    v15 = v9 + 8;
    v16 = *(_WORD *)(v9 + 8);
    v17 = 11;
  }
  else if (a4 == 3)
  {
    if (!v9)
      goto LABEL_14;
    v15 = v9 + 8;
    v16 = *(_WORD *)(v9 + 8);
    v17 = 16;
  }
  else
  {
    if (!v9)
      goto LABEL_14;
    v15 = v9 + 8;
    v16 = *(_WORD *)(v9 + 8);
    v17 = 8;
  }
  *(_QWORD *)(v15 + 48) = v17;
  if ((v16 & 0x40) == 0)
    *(_BYTE *)(v9 + 13) = 1;
  *(_WORD *)v15 = v16 | 0x100;
LABEL_14:

  return (id)v9;
}

+ (id)_defaultGroupedFooterConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[UIListContentConfiguration _defaultHeaderFooterConfigurationForState:traitCollection:isHeader:style:](v6, v5, v4, 0, 1);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)(v7 + 56) = 6;
    v8 = *(_WORD *)(v7 + 8);
    if ((v8 & 0x40) == 0)
      *(_BYTE *)(v7 + 13) = 0;
    *(_WORD *)(v7 + 8) = v8 & 0xFEFF;
  }
  return (id)v7;
}

+ (void)_applySidebarCellStylingToConfiguration:(void *)a3 forState:(void *)a4 traitCollection:(void *)a5 constants:(uint64_t)a6 style:
{
  _QWORD *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_self();
  objc_msgSend(v10, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v13, v12, 1);

  objc_msgSend(v10, "secondaryTextProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v15, v13, v12, 1);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  if (v13)
  {
    objc_msgSend(v13, "contentPropertiesForSidebarElementWithTraitCollection:state:isHeader:style:", v12, v11, 0, a6);
    v16 = (void *)v28;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v10, "textProperties", (_QWORD)v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v17, v16);

  objc_msgSend(v10, "textProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v18, (void *)v29);

  objc_msgSend(v10, "textProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v19, *((uint64_t *)&v31 + 1));

  objc_msgSend(v10, "secondaryTextProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v20, *((void **)&v28 + 1));

  objc_msgSend(v10, "secondaryTextProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v21, *((void **)&v29 + 1));

  objc_msgSend(v10, "secondaryTextProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v22, v32);

  objc_msgSend(v10, "imageProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v23, (void *)v30);

  objc_msgSend(v10, "imageProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24;
  if (v24)
    objc_setProperty_nonatomic_copy(v24, v25, *((id *)&v30 + 1), 24);

  objc_msgSend(v10, "imageProperties");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentImageProperties _setTintColorTransformerIdentifier:]((uint64_t)v27, *((uint64_t *)&v32 + 1));

  if (v10)
    v10[6] = v31;
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)&v28);

}

+ (id)_sidebarPlainCellConfiguration
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_opt_self();
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:](v0, v1, v2, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_defaultSidebarHeaderConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int16 v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  _UITableConstantsForTraitCollection(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "_splitViewControllerContext");
  v9 = _UICollectionViewListStyleFromListEnvironment(objc_msgSend(v5, "listEnvironment"));
  v10 = 1;
  if (v8 == 2)
    v10 = 2;
  if (v9 != 3)
    v10 = 0;
  if (v9 == 4)
    v11 = 3;
  else
    v11 = v10;
  +[UIListContentConfiguration _defaultCellConfigurationForState:traitCollection:](v6, v4, v5);
  v12 = objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  if (v7)
    objc_msgSend(v7, "contentPropertiesForSidebarElementWithTraitCollection:state:isHeader:style:", v5, v4, 1, v11);
  objc_msgSend(v7, "defaultImageToTextPaddingForSidebar:", 1, (_QWORD)v33);
  if (v12)
    *(_QWORD *)(v12 + 24) = v13;
  v14 = _UICellContentViewDefaultDirectionalLayoutMargins(v7, v5, 0, 1, 0);
  if (v12)
  {
    *(double *)(v12 + 88) = v14;
    *(_QWORD *)(v12 + 96) = v15;
    *(_QWORD *)(v12 + 104) = v16;
    *(_QWORD *)(v12 + 112) = v17;
  }
  objc_msgSend((id)v12, "textProperties", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v18, v7, v5, 1);

  objc_msgSend((id)v12, "secondaryTextProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v19, v7, v5, 1);

  objc_msgSend((id)v12, "textProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v20, (void *)v33);

  objc_msgSend((id)v12, "textProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v21, (void *)v34);

  objc_msgSend((id)v12, "secondaryTextProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v22, *((void **)&v33 + 1));

  objc_msgSend((id)v12, "secondaryTextProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v23, *((void **)&v34 + 1));

  objc_msgSend((id)v12, "imageProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v24, (void *)v35);

  objc_msgSend((id)v12, "imageProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25;
  if (v25)
    objc_setProperty_nonatomic_copy(v25, v26, *((id *)&v35 + 1), 24);

  if (v12)
    *(_QWORD *)(v12 + 48) = v36;
  objc_msgSend((id)v12, "textProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v28, *((uint64_t *)&v36 + 1));

  objc_msgSend((id)v12, "secondaryTextProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentTextProperties _setColorTransformerIdentifier:]((uint64_t)v29, v37);

  objc_msgSend((id)v12, "imageProperties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentImageProperties _setTintColorTransformerIdentifier:]((uint64_t)v30, *((uint64_t *)&v37 + 1));

  if (v12)
  {
    *(_QWORD *)(v12 + 56) = 9;
    v31 = *(_WORD *)(v12 + 8);
    if ((v31 & 0x40) == 0)
      *(_BYTE *)(v12 + 13) = 1;
    *(_WORD *)(v12 + 8) = v31 | 0x100;
  }
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)&v33);

  return (id)v12;
}

+ (UIListContentConfiguration)sidebarCellConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultSidebarCellConfigurationForState:traitCollection:style:]((uint64_t)a1, v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)plainFooterConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)sidebarHeaderConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultSidebarHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (UIListContentConfiguration)groupedFooterConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultGroupedFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIListContentConfiguration *)v5;
}

+ (id)_headerConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int16 v6;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultPlainHeaderConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)(v5 + 56) = 17;
    v6 = *(_WORD *)(v5 + 8);
    if ((v6 & 0x40) == 0)
      *(_BYTE *)(v5 + 13) = 0;
    *(_WORD *)(v5 + 8) = v6 & 0xFEFF;
  }
  return (id)v5;
}

+ (id)_footerConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int16 v6;

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIListContentConfiguration _defaultPlainFooterConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)(v5 + 56) = 18;
    v6 = *(_WORD *)(v5 + 8);
    if ((v6 & 0x40) == 0)
      *(_BYTE *)(v5 + 13) = 0;
    *(_WORD *)(v5 + 8) = v6 & 0xFEFF;
  }
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIListContentConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIListContentConfiguration *v5;
  uint64_t v6;
  UIListContentImageProperties *imageProperties;
  uint64_t v8;
  UIListContentTextProperties *textProperties;
  uint64_t v10;
  UIListContentTextProperties *secondaryTextProperties;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  const __CFString *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  __int16 v35;
  int v36;
  double v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)UIListContentConfiguration;
  v5 = -[UIListContentConfiguration init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageProperties"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageProperties = v5->_imageProperties;
    v5->_imageProperties = (UIListContentImageProperties *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textProperties"));
    v8 = objc_claimAutoreleasedReturnValue();
    textProperties = v5->_textProperties;
    v5->_textProperties = (UIListContentTextProperties *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryTextProperties"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryTextProperties = v5->_secondaryTextProperties;
    v5->_secondaryTextProperties = (UIListContentTextProperties *)v10;

    v5->_axesPreservingSuperviewLayoutMargins = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("axesPreservingSuperviewLayoutMargins"));
    objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("directionalLayoutMargins"));
    v5->_directionalLayoutMargins.top = v12;
    v5->_directionalLayoutMargins.leading = v13;
    v5->_directionalLayoutMargins.bottom = v14;
    v5->_directionalLayoutMargins.trailing = v15;
    v5->_prefersSideBySideTextAndSecondaryText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersSideBySideTextAndSecondaryText"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("imageToTextPadding"));
    v5->_imageToTextPadding = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("textToSecondaryTextHorizontalPadding"));
    v5->_textToSecondaryTextHorizontalPadding = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("textToSecondaryTextVerticalPadding"));
    v5->_textToSecondaryTextVerticalPadding = v18;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("defaultStyle_v2")))
      v19 = CFSTR("defaultStyle_v2");
    else
      v19 = CFSTR("defaultStyle");
    v20 = objc_msgSend(v4, "decodeIntegerForKey:", v19);
    if ((unint64_t)(v20 - 1) >= 0x12)
      v21 = 0;
    else
      v21 = v20;
    -[UIListContentConfiguration _setDefaultStyle:]((uint64_t)v5, v21);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("enforcesMinimumHeight")))
      v5->_enforcesMinimumHeight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enforcesMinimumHeight"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFE | objc_msgSend(v4, "decodeBoolForKey:", v22);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v23))
      v24 = 2;
    else
      v24 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFD | v24;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("prefersSideBySideTextAndSecondaryText"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v25))
      v26 = 4;
    else
      v26 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFFB | v26;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageToTextPadding"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v27))
      v28 = 8;
    else
      v28 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFF7 | v28;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToSecondaryTextHorizontalPadding"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v29))
      v30 = 16;
    else
      v30 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFEF | v30;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToSecondaryTextVerticalPadding"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v31))
      v32 = 32;
    else
      v32 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFDF | v32;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("enforcesMinimumHeight"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v33))
      v34 = 64;
    else
      v34 = 0;
    *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFFBF | v34;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("isSidebarStyle")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSidebarStyle")))
        v35 = 256;
      else
        v35 = 0;
      *(_WORD *)&v5->_configurationFlags = *(_WORD *)&v5->_configurationFlags & 0xFEFF | v35;
    }
    v36 = objc_msgSend(v4, "containsValueForKey:", CFSTR("alpha"));
    v37 = 1.0;
    if (v36)
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("alpha"), 1.0);
    v5->_alpha = v37;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t defaultStyle;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "encodeObject:forKey:", self->_imageProperties, CFSTR("imageProperties"));
  objc_msgSend(v22, "encodeObject:forKey:", self->_textProperties, CFSTR("textProperties"));
  objc_msgSend(v22, "encodeObject:forKey:", self->_secondaryTextProperties, CFSTR("secondaryTextProperties"));
  objc_msgSend(v22, "encodeInteger:forKey:", self->_axesPreservingSuperviewLayoutMargins, CFSTR("axesPreservingSuperviewLayoutMargins"));
  objc_msgSend(v22, "encodeDirectionalEdgeInsets:forKey:", CFSTR("directionalLayoutMargins"), self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  objc_msgSend(v22, "encodeBool:forKey:", self->_prefersSideBySideTextAndSecondaryText, CFSTR("prefersSideBySideTextAndSecondaryText"));
  objc_msgSend(v22, "encodeDouble:forKey:", CFSTR("imageToTextPadding"), self->_imageToTextPadding);
  objc_msgSend(v22, "encodeDouble:forKey:", CFSTR("textToSecondaryTextHorizontalPadding"), self->_textToSecondaryTextHorizontalPadding);
  objc_msgSend(v22, "encodeDouble:forKey:", CFSTR("textToSecondaryTextVerticalPadding"), self->_textToSecondaryTextVerticalPadding);
  objc_msgSend(v22, "encodeBool:forKey:", self->_enforcesMinimumHeight, CFSTR("enforcesMinimumHeight"));
  objc_msgSend(v22, "encodeDouble:forKey:", CFSTR("alpha"), self->_alpha);
  objc_msgSend(v22, "encodeInteger:forKey:", self->_defaultStyle, CFSTR("defaultStyle_v2"));
  defaultStyle = self->_defaultStyle;
  if ((defaultStyle & 0x8000000000000000) != 0)
  {
    v7 = 0;
  }
  else
  {
    v5 = 4 * (defaultStyle == 18);
    if (defaultStyle == 17)
      v5 = 3;
    if (defaultStyle - 15 >= 2)
      v6 = v5;
    else
      v6 = 7;
    if (defaultStyle >= 0xE)
      v7 = v6;
    else
      v7 = self->_defaultStyle;
  }
  objc_msgSend(v22, "encodeInteger:forKey:", v7, CFSTR("defaultStyle"));
  objc_msgSend(v22, "encodeBool:forKey:", HIBYTE(*(_WORD *)&self->_configurationFlags) & 1, CFSTR("isSidebarStyle"));
  v8 = *(_WORD *)&self->_configurationFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeBool:forKey:", v8, v9);

  v10 = (*(_WORD *)&self->_configurationFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeBool:forKey:", v10, v11);

  v12 = (*(_WORD *)&self->_configurationFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("prefersSideBySideTextAndSecondaryText"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeBool:forKey:", v12, v13);

  v14 = (*(_WORD *)&self->_configurationFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageToTextPadding"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeBool:forKey:", v14, v15);

  v16 = (*(_WORD *)&self->_configurationFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToSecondaryTextHorizontalPadding"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeBool:forKey:", v16, v17);

  v18 = (*(_WORD *)&self->_configurationFlags >> 5) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToSecondaryTextVerticalPadding"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeBool:forKey:", v18, v19);

  v20 = (*(_WORD *)&self->_configurationFlags >> 6) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("enforcesMinimumHeight"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeBool:forKey:", v20, v21);

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[UIListContentImageProperties hash](self->_imageProperties, "hash");
  v4 = -[UIListContentTextProperties hash](self->_textProperties, "hash") ^ v3;
  return v4 ^ -[UIListContentTextProperties hash](self->_secondaryTextProperties, "hash");
}

- (id)_descriptionPropertiesForFullDescription:(uint64_t)a1
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(__CFString **)(a1 + 64);
    if (v5 && v5->data)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[UIContentUnavailableImageProperties _shortDescription](v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("image = %@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    v9 = *(__CFString **)(a1 + 72);
    if (v9 && (v9->length || v9[2].info))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[UIListContentTextProperties _shortDescription](v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("text = %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v12);

    }
    v13 = *(__CFString **)(a1 + 80);
    if (v13 && (v13->length || v13[2].info))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[UIListContentTextProperties _shortDescription](v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("secondaryText = %@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

    }
    if (*(double *)(a1 + 48) != 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alpha = %g"), *(_QWORD *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

    }
    if (a2)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = *(_QWORD *)(a1 + 56);
      if (v19 >= 0x13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_UIListContentConfigurationStyleToString(_UIListContentConfigurationStyle)");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("UIListContentConfiguration.m"), 138, CFSTR("Unknown style: %ld"), v19);

        v20 = 0;
      }
      else
      {
        v20 = off_1E16E3158[v19];
      }
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Base Style = %@"), v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v23);

      v24 = *(double *)(a1 + 88);
      v25 = *(double *)(a1 + 96);
      v26 = *(double *)(a1 + 104);
      v27 = *(double *)(a1 + 112);
      if (v25 != 0.0 || v24 != 0.0 || v27 != 0.0 || v26 != 0.0)
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("directionalLayoutMargins = %@"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v30);

      }
      v31 = *(_QWORD *)(a1 + 16);
      if (v31)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        _UIContentViewStringForAxis(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("axesPreservingSuperviewLayoutMargins = %@"), v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v34);

      }
      if (*(_BYTE *)(a1 + 12))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prefersSideBySideTextAndSecondaryText = YES"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v35);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageToTextPadding = %g"), *(_QWORD *)(a1 + 24));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v36);

      if (*(_BYTE *)(a1 + 12))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textToSecondaryTextHorizontalPadding = %g"), *(_QWORD *)(a1 + 32));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v37);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textToSecondaryTextVerticalPadding = %g"), *(_QWORD *)(a1 + 40));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v38);

    }
    if (!objc_msgSend(v4, "count"))
      objc_msgSend(v4, "addObject:", CFSTR("(empty)"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIListContentConfiguration _descriptionPropertiesForFullDescription:]((uint64_t)self, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  return (NSString *)+[UIView _descriptionWithoutTextRedactionForObject:](UIView, "_descriptionWithoutTextRedactionForObject:", self);
}

- (NSString)text
{
  return -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)&self->_textProperties->super.isa);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&self->_textProperties->super.isa);
}

- (NSString)secondaryText
{
  return -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)&self->_secondaryTextProperties->super.isa);
}

- (void)setSecondaryAttributedText:(NSAttributedString *)secondaryAttributedText
{
  -[UIListContentTextProperties setAttributedText:](&self->_secondaryTextProperties->super.isa, secondaryAttributedText);
}

- (NSAttributedString)secondaryAttributedText
{
  return (NSAttributedString *)-[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&self->_secondaryTextProperties->super.isa);
}

- (void)setPrefersSideBySideTextAndSecondaryText:(BOOL)prefersSideBySideTextAndSecondaryText
{
  *(_WORD *)&self->_configurationFlags |= 4u;
  self->_prefersSideBySideTextAndSecondaryText = prefersSideBySideTextAndSecondaryText;
}

- (CGFloat)textToSecondaryTextHorizontalPadding
{
  return self->_textToSecondaryTextHorizontalPadding;
}

- (void)setAlpha:(double)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x80u;
  self->_alpha = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)_setEnforcesMinimumHeight:(BOOL)a3
{
  *(_WORD *)&self->_configurationFlags |= 0x40u;
  self->_enforcesMinimumHeight = a3;
}

- (BOOL)_enforcesMinimumHeight
{
  return self->_enforcesMinimumHeight;
}

- (void)_setSwiftBridgingImageProperties:(id)a3
{
  UIListContentImageProperties *v4;
  UIListContentImageProperties *imageProperties;
  UIListContentImageProperties *v6;
  UIListContentImageProperties *v7;

  v4 = (UIListContentImageProperties *)a3;
  imageProperties = self->_imageProperties;
  if (imageProperties)
    imageProperties = (UIListContentImageProperties *)imageProperties->_image;
  v6 = imageProperties;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v4, v6);

  v7 = self->_imageProperties;
  self->_imageProperties = v4;

}

- (void)_setSwiftBridgingSecondaryTextProperties:(id)a3
{
  UIListContentTextProperties *v4;
  UIListContentTextProperties *secondaryTextProperties;
  const char *v6;
  UIListContentTextProperties *v7;
  UIListContentTextProperties *v8;
  const char *v9;
  UIListContentTextProperties *v10;
  UIListContentTextProperties *v11;

  v4 = (UIListContentTextProperties *)a3;
  secondaryTextProperties = self->_secondaryTextProperties;
  if (secondaryTextProperties)
    secondaryTextProperties = (UIListContentTextProperties *)secondaryTextProperties->_text;
  v7 = secondaryTextProperties;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v6, v7, 24);

  v8 = self->_secondaryTextProperties;
  if (v8)
    v8 = (UIListContentTextProperties *)v8->_attributedText;
  v10 = v8;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v9, v10, 72);

  v11 = self->_secondaryTextProperties;
  self->_secondaryTextProperties = v4;

}

@end
