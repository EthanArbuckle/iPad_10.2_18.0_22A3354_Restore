@implementation UIContentUnavailableConfiguration

+ (id)_defaultEmptyConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2
{
  id v2;
  void *v3;
  UIContentUnavailableImageProperties *v4;
  const char *v5;
  void *v6;
  void *v7;
  UIContentUnavailableTextProperties *v8;
  void *v9;
  void *v10;
  UIContentUnavailableTextProperties *v11;
  void *v12;
  void *v13;
  UIContentUnavailableButtonProperties *v14;
  UIContentUnavailableButtonProperties *v15;
  char v16;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id *v33;
  id *v34;

  v2 = a2;
  objc_opt_self();
  _UIContentUnavailableConstantsForTraitCollection(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(UIContentUnavailableImageProperties);
  objc_msgSend(v3, "defaultEmptyImageSymbolConfigurationForTraitCollection:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v5, v6, 24);

  objc_msgSend(v3, "defaultEmptyImageTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v4, v7);

  v8 = objc_alloc_init(UIContentUnavailableTextProperties);
  objc_msgSend(v3, "defaultEmptyTextFontForTraitCollection:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v8, v9);

  objc_msgSend(v3, "defaultEmptyTextColorForTraitCollection:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v10);

  v11 = objc_alloc_init(UIContentUnavailableTextProperties);
  objc_msgSend(v3, "defaultEmptySecondaryTextFontForTraitCollection:", v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v11, v12);

  objc_msgSend(v3, "defaultSecondaryTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  v14 = objc_alloc_init(UIContentUnavailableButtonProperties);
  v15 = objc_alloc_init(UIContentUnavailableButtonProperties);
  v16 = objc_msgSend(v3, "prefersSideBySideButtonAndSecondaryButton");
  objc_msgSend(v3, "defaultDirectionalLayoutMarginsForTraitCollection:", v2);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v3, "defaultEmptyImageToTextPaddingForTraitCollection:", v2);
  v26 = v25;
  objc_msgSend(v3, "defaultEmptyTextToSecondaryTextPaddingForTraitCollection:", v2);
  v28 = v27;
  objc_msgSend(v3, "defaultEmptyTextToButtonPaddingForTraitCollection:", v2);
  v30 = v29;
  objc_msgSend(v3, "defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:", v2);
  v32 = v31;

  v33 = -[UIContentUnavailableConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:buttonProperties:secondaryButtonProperties:sideBySideButtonAndSecondaryButton:directionalLayoutMargins:imageToTextPadding:textToSecondaryTextPadding:textToButtonPadding:buttonToSecondaryButtonPadding:]((id *)[UIContentUnavailableConfiguration alloc], v4, v8, v11, v14, v15, v16, v18, v20, v22, v24, v26, v28, v30, v32);
  v34 = v33;
  if (v33)
    v33[7] = 0;

  return v34;
}

+ (id)_defaultLoadingConfigurationForState:(uint64_t)a1 traitCollection:(void *)a2
{
  id v2;
  void *v3;
  UIContentUnavailableImageProperties *v4;
  const char *v5;
  void *v6;
  void *v7;
  UIContentUnavailableTextProperties *v8;
  void *v9;
  void *v10;
  UIContentUnavailableTextProperties *v11;
  void *v12;
  void *v13;
  UIContentUnavailableButtonProperties *v14;
  UIContentUnavailableButtonProperties *v15;
  char v16;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;

  v2 = a2;
  objc_opt_self();
  _UIContentUnavailableConstantsForTraitCollection(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(UIContentUnavailableImageProperties);
  objc_msgSend(v3, "defaultLoadingImageSymbolConfigurationForTraitCollection:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v5, v6, 24);

  objc_msgSend(v3, "defaultLoadingImageTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v4, v7);

  v8 = objc_alloc_init(UIContentUnavailableTextProperties);
  objc_msgSend(v3, "defaultLoadingTextFontForTraitCollection:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v8, v9);

  objc_msgSend(v3, "defaultLoadingTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v10);

  v11 = objc_alloc_init(UIContentUnavailableTextProperties);
  objc_msgSend(v3, "defaultEmptySecondaryTextFontForTraitCollection:", v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v11, v12);

  objc_msgSend(v3, "defaultSecondaryTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  v14 = objc_alloc_init(UIContentUnavailableButtonProperties);
  v15 = objc_alloc_init(UIContentUnavailableButtonProperties);
  v16 = objc_msgSend(v3, "prefersSideBySideButtonAndSecondaryButton");
  objc_msgSend(v3, "defaultDirectionalLayoutMarginsForTraitCollection:", v2);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v3, "defaultLoadingImageToTextPaddingForTraitCollection:", v2);
  v26 = v25;
  objc_msgSend(v3, "defaultEmptyTextToSecondaryTextPaddingForTraitCollection:", v2);
  v28 = v27;
  objc_msgSend(v3, "defaultEmptyTextToButtonPaddingForTraitCollection:", v2);
  v30 = v29;
  objc_msgSend(v3, "defaultEmptyButtonToSecondaryButtonPaddingForTraitCollection:", v2);
  v32 = -[UIContentUnavailableConfiguration _initWithImageProperties:textProperties:secondaryTextProperties:buttonProperties:secondaryButtonProperties:sideBySideButtonAndSecondaryButton:directionalLayoutMargins:imageToTextPadding:textToSecondaryTextPadding:textToButtonPadding:buttonToSecondaryButtonPadding:]((id *)[UIContentUnavailableConfiguration alloc], v4, v8, v11, v14, v15, v16, v18, v20, v22, v24, v26, v28, v30, v31);
  if (!objc_msgSend(v2, "userInterfaceIdiom") || objc_msgSend(v2, "userInterfaceIdiom") == 1)
  {
    _UILocalizedString(CFSTR("CONTENT_UNAVAILABLE_LOADING_TEXT"), (uint64_t)CFSTR("Default text to display whilst loading content"), CFSTR("Loading..."));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "textProperties");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v34;
    if (v34)
      objc_setProperty_nonatomic_copy(v34, v35, v33, 16);

  }
  if (v32)
    v32[7] = (id)1;

  return v32;
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
  __int128 v15;
  uint64_t v16;
  void *v17;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[UIContentUnavailableImageProperties copy](self->_imageProperties, "copy");
    v6 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v5;

    v7 = -[UIContentUnavailableTextProperties copy](self->_textProperties, "copy");
    v8 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v7;

    v9 = -[UIContentUnavailableTextProperties copy](self->_secondaryTextProperties, "copy");
    v10 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v9;

    v11 = -[UIContentUnavailableButtonProperties copy](self->_buttonProperties, "copy");
    v12 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v11;

    v13 = -[UIContentUnavailableButtonProperties copy](self->_secondaryButtonProperties, "copy");
    v14 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v13;

    *(_BYTE *)(v4 + 12) = self->_prefersSideBySideButtonAndSecondaryButton;
    *(_QWORD *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    v15 = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 112) = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 128) = v15;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    *(double *)(v4 + 32) = self->_textToSecondaryTextPadding;
    *(double *)(v4 + 40) = self->_textToButtonPadding;
    *(double *)(v4 + 48) = self->_buttonToSecondaryButtonPadding;
    v16 = -[UIBackgroundConfiguration copy](self->_background, "copy");
    v17 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v16;

    *(_QWORD *)(v4 + 56) = self->_defaultStyle;
    *($4E4CD6226BC3E2B796C6AE785477D738 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (id)_initWithImageProperties:(void *)a3 textProperties:(void *)a4 secondaryTextProperties:(void *)a5 buttonProperties:(void *)a6 secondaryButtonProperties:(char)a7 sideBySideButtonAndSecondaryButton:(double)a8 directionalLayoutMargins:(double)a9 imageToTextPadding:(double)a10 textToSecondaryTextPadding:(double)a11 textToButtonPadding:(double)a12 buttonToSecondaryButtonPadding:(double)a13
{
  id v29;
  id v30;
  id v31;
  id v32;
  id *v33;
  uint64_t v34;
  id v35;
  id v38;
  objc_super v39;

  v38 = a2;
  v29 = a3;
  v30 = a4;
  v31 = a5;
  v32 = a6;
  if (a1)
  {
    v39.receiver = a1;
    v39.super_class = (Class)UIContentUnavailableConfiguration;
    v33 = (id *)objc_msgSendSuper2(&v39, sel_init);
    a1 = v33;
    if (v33)
    {
      objc_storeStrong(v33 + 8, a2);
      objc_storeStrong(a1 + 9, a3);
      objc_storeStrong(a1 + 10, a4);
      objc_storeStrong(a1 + 11, a5);
      objc_storeStrong(a1 + 12, a6);
      *((_BYTE *)a1 + 12) = a7;
      a1[2] = (id)1;
      *((double *)a1 + 14) = a8;
      *((double *)a1 + 15) = a9;
      *((double *)a1 + 16) = a10;
      *((double *)a1 + 17) = a11;
      *((double *)a1 + 3) = a12;
      *((double *)a1 + 4) = a13;
      *((double *)a1 + 5) = a14;
      *((double *)a1 + 6) = a15;
      +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = a1[13];
      a1[13] = (id)v34;

    }
  }

  return a1;
}

- (UIContentUnavailableImageProperties)imageProperties
{
  return self->_imageProperties;
}

- (UIBackgroundConfiguration)background
{
  return self->_background;
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

- (UIAxis)axesPreservingSuperviewLayoutMargins
{
  return self->_axesPreservingSuperviewLayoutMargins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_secondaryButtonProperties, 0);
  objc_storeStrong((id *)&self->_buttonProperties, 0);
  objc_storeStrong((id *)&self->_secondaryTextProperties, 0);
  objc_storeStrong((id *)&self->_textProperties, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
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
    {
      a1 = 1;
    }
    else if (*(void **)(a1 + 56) == v3[7]
           && -[UIContentUnavailableImageProperties _isEqualToPropertiesQuick:compareImage:](*(_QWORD *)(a1 + 64), v3[8], 1)&& -[UIContentUnavailableTextProperties _isEqualToPropertiesQuick:compareText:](*(_QWORD *)(a1 + 72), v4[9], 1)&& -[UIContentUnavailableTextProperties _isEqualToPropertiesQuick:compareText:](*(_QWORD *)(a1 + 80), v4[10], 1)&& -[UIContentUnavailableButtonProperties _isEqualToPropertiesQuick:](*(_QWORD *)(a1 + 88), v4[11])&& -[UIContentUnavailableButtonProperties _isEqualToPropertiesQuick:](*(_QWORD *)(a1 + 96), v4[12])&& *(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v4 + 12)&& *(void **)(a1 + 16) == v4[2]
           && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 112), *((float64x2_t *)v4 + 7)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 128), *((float64x2_t *)v4 + 8)))), 0xFuLL))) & 1) != 0&& *(double *)(a1 + 24) == *((double *)v4 + 3)&& *(double *)(a1 + 32) == *((double *)v4 + 4)&& *(double *)(a1 + 40) == *((double *)v4 + 5)&& *(double *)(a1 + 48) == *((double *)v4 + 6))
    {
      a1 = -[UIBackgroundConfiguration _isEqualToConfigurationQuick:](*(_QWORD *)(a1 + 104), v4[13]);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

+ (UIContentUnavailableConfiguration)emptyConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UIContentUnavailableConfigurationState _readonlyContentUnavailableConfigurationState:]((uint64_t)UIContentUnavailableConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIContentUnavailableConfiguration _defaultEmptyConfigurationForState:traitCollection:]((uint64_t)a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIContentUnavailableConfiguration *)v5;
}

+ (UIContentUnavailableConfiguration)loadingConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UIContentUnavailableConfigurationState _readonlyContentUnavailableConfigurationState:]((uint64_t)UIContentUnavailableConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIContentUnavailableConfiguration _defaultLoadingConfigurationForState:traitCollection:]((uint64_t)a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIContentUnavailableConfiguration *)v5;
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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char configurationFlags;
  BOOL v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v5 = -[UIContentUnavailableConfiguration copy](self, "copy");
  defaultStyle = self->_defaultStyle;
  v7 = v4;
  v8 = objc_opt_self();
  +[UIContentUnavailableConfigurationState _readonlyContentUnavailableConfigurationState:]((uint64_t)UIContentUnavailableConfigurationState, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(defaultStyle)
  {
    case 2:
      objc_msgSend(v7, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIContentUnavailableConfiguration _defaultSearchConfigurationForState:traitCollection:](v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(v7, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIContentUnavailableConfiguration _defaultLoadingConfigurationForState:traitCollection:](v8, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      objc_msgSend(v7, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIContentUnavailableConfiguration _defaultEmptyConfigurationForState:traitCollection:](v8, v10);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v12 = v11;
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_, v8, CFSTR("UIContentUnavailableConfiguration.m"), 226, CFSTR("Unknown style: %ld"), defaultStyle);
  v12 = 0;
LABEL_9:

  objc_msgSend((id)v5, "imageProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "imageProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v13, v14);

  objc_msgSend((id)v5, "textProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "textProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableTextProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v15, v16);

  objc_msgSend((id)v5, "secondaryTextProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "secondaryTextProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableTextProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v17, v18);

  objc_msgSend((id)v5, "buttonProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "buttonProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableButtonProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v19, v20);

  objc_msgSend((id)v5, "secondaryButtonProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "secondaryButtonProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableButtonProperties _applyPropertiesFromDefaultProperties:]((uint64_t)v21, v22);

  configurationFlags = (char)self->_configurationFlags;
  if ((configurationFlags & 1) != 0)
    goto LABEL_13;
  if (v12)
  {
    v24 = *(_BYTE *)(v12 + 12) != 0;
    if (!v5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v24 = 0;
  if (v5)
  {
LABEL_12:
    *(_BYTE *)(v5 + 12) = v24;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_13:
  if ((configurationFlags & 2) != 0)
    goto LABEL_17;
  if (v12)
  {
    v25 = *(_QWORD *)(v12 + 16);
    if (!v5)
      goto LABEL_17;
    goto LABEL_16;
  }
  v25 = 0;
  if (v5)
  {
LABEL_16:
    *(_QWORD *)(v5 + 16) = v25;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_17:
  if ((configurationFlags & 4) != 0)
    goto LABEL_21;
  if (v12)
  {
    v26 = *(_OWORD *)(v12 + 112);
    v27 = *(_OWORD *)(v12 + 128);
    if (!v5)
      goto LABEL_21;
    goto LABEL_20;
  }
  v26 = 0uLL;
  v27 = 0uLL;
  if (v5)
  {
LABEL_20:
    *(_OWORD *)(v5 + 112) = v26;
    *(_OWORD *)(v5 + 128) = v27;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_21:
  if ((configurationFlags & 8) != 0)
    goto LABEL_25;
  if (v12)
  {
    v28 = *(_QWORD *)(v12 + 24);
    if (!v5)
      goto LABEL_25;
    goto LABEL_24;
  }
  v28 = 0;
  if (v5)
  {
LABEL_24:
    *(_QWORD *)(v5 + 24) = v28;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_25:
  if ((configurationFlags & 0x10) != 0)
    goto LABEL_29;
  if (v12)
  {
    v29 = *(_QWORD *)(v12 + 32);
    if (!v5)
      goto LABEL_29;
    goto LABEL_28;
  }
  v29 = 0;
  if (v5)
  {
LABEL_28:
    *(_QWORD *)(v5 + 32) = v29;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_29:
  if ((configurationFlags & 0x20) != 0)
    goto LABEL_33;
  if (v12)
  {
    v30 = *(_QWORD *)(v12 + 40);
    if (!v5)
      goto LABEL_33;
    goto LABEL_32;
  }
  v30 = 0;
  if (v5)
  {
LABEL_32:
    *(_QWORD *)(v5 + 40) = v30;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_33:
  if ((configurationFlags & 0x40) == 0)
  {
    if (!v12)
    {
      v31 = 0;
      if (!v5)
        goto LABEL_37;
      goto LABEL_36;
    }
    v31 = *(_QWORD *)(v12 + 48);
    if (v5)
LABEL_36:
      *(_QWORD *)(v5 + 48) = v31;
  }
LABEL_37:

  return (id)v5;
}

- (UIContentUnavailableTextProperties)textProperties
{
  return self->_textProperties;
}

- (UIContentUnavailableTextProperties)secondaryTextProperties
{
  return self->_secondaryTextProperties;
}

- (UIContentUnavailableButtonProperties)secondaryButtonProperties
{
  return self->_secondaryButtonProperties;
}

- (UIContentUnavailableButtonProperties)buttonProperties
{
  return self->_buttonProperties;
}

- (id)makeContentView
{
  return -[UIContentUnavailableView initWithConfiguration:]([UIContentUnavailableView alloc], "initWithConfiguration:", self);
}

- (BOOL)isEqual:(id)a3
{
  UIContentUnavailableConfiguration *v4;
  UIContentUnavailableConfiguration *v5;
  UIContentUnavailableConfiguration *v6;
  UIContentUnavailableConfiguration *v7;

  v4 = (UIContentUnavailableConfiguration *)a3;
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
    {
      if (self->_defaultStyle == v6->_defaultStyle
        && -[UIContentUnavailableImageProperties _isEqualToProperties:compareImage:]((uint64_t)self->_imageProperties, v6->_imageProperties, 1)&& -[UIContentUnavailableTextProperties _isEqualToProperties:compareText:]((uint64_t)self->_textProperties, v7->_textProperties, 1)&& -[UIContentUnavailableTextProperties _isEqualToProperties:compareText:]((uint64_t)self->_secondaryTextProperties, v7->_secondaryTextProperties, 1)&& -[UIContentUnavailableButtonProperties _isEqualToProperties:]((uint64_t)self->_buttonProperties, v7->_buttonProperties)&& -[UIContentUnavailableButtonProperties _isEqualToProperties:]((uint64_t)self->_secondaryButtonProperties, v7->_secondaryButtonProperties)&& self->_prefersSideBySideButtonAndSecondaryButton == v7->_prefersSideBySideButtonAndSecondaryButton&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_imageToTextPadding == v7->_imageToTextPadding&& self->_textToSecondaryTextPadding == v7->_textToSecondaryTextPadding&& self->_textToButtonPadding == v7->_textToButtonPadding&& self->_buttonToSecondaryButtonPadding == v7->_buttonToSecondaryButtonPadding)
      {
        LOBYTE(self) = -[UIBackgroundConfiguration _isEqualToConfiguration:]((uint64_t)self->_background, v7->_background);
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (CGFloat)imageToTextPadding
{
  return self->_imageToTextPadding;
}

- (UIContentUnavailableAlignment)alignment
{
  UIContentUnavailableTextProperties *textProperties;

  textProperties = self->_textProperties;
  if (textProperties)
    return textProperties->_alignment;
  else
    return 0;
}

- (void)setText:(NSString *)text
{
  -[UIContentUnavailableTextProperties setText:]((uint64_t)self->_textProperties, text);
}

- (void)setBackground:(UIBackgroundConfiguration *)background
{
  objc_storeStrong((id *)&self->_background, background);
}

+ (UIContentUnavailableConfiguration)searchConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UIContentUnavailableConfigurationState _readonlyContentUnavailableConfigurationState:]((uint64_t)UIContentUnavailableConfigurationState, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIContentUnavailableConfiguration _defaultSearchConfigurationForState:traitCollection:]((uint64_t)a1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIContentUnavailableConfiguration *)v5;
}

+ (_QWORD)_defaultSearchConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  +[UIContentUnavailableConfiguration _defaultEmptyConfigurationForState:traitCollection:](v6, v5);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v9, v8);

  objc_msgSend(v4, "searchText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(v4, "searchText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedFormat(CFSTR("CONTENT_UNAVAILABLE_SEARCH_TEXT_WITH_QUERY"), (uint64_t)CFSTR("Default text to display when a search with a query returns no results"), CFSTR("No Results for “%@”"), v13, v14, v15, v16, v17, (uint64_t)v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    if (v19)
      objc_setProperty_nonatomic_copy(v19, v20, v18, 16);

  }
  else
  {
    _UILocalizedString(CFSTR("CONTENT_UNAVAILABLE_SEARCH_TEXT"), (uint64_t)CFSTR("Default text to display when a search returns no results"), CFSTR("No Results"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    if (v22)
      objc_setProperty_nonatomic_copy(v22, v23, v12, 16);
  }

  _UILocalizedString(CFSTR("CONTENT_UNAVAILABLE_SEARCH_SECONDARY_TEXT"), (uint64_t)CFSTR("Default secondary text to display when a search returns no results"), CFSTR("Check the spelling or try a new search."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secondaryTextProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25;
  if (v25)
    objc_setProperty_nonatomic_copy(v25, v26, v24, 16);

  if (v7)
    v7[7] = 2;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIContentUnavailableConfiguration *v5;
  uint64_t v6;
  UIContentUnavailableImageProperties *imageProperties;
  uint64_t v8;
  UIContentUnavailableTextProperties *textProperties;
  uint64_t v10;
  UIContentUnavailableTextProperties *secondaryTextProperties;
  uint64_t v12;
  UIContentUnavailableButtonProperties *buttonProperties;
  uint64_t v14;
  UIContentUnavailableButtonProperties *secondaryButtonProperties;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  UIBackgroundConfiguration *background;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)UIContentUnavailableConfiguration;
  v5 = -[UIContentUnavailableConfiguration init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageProperties"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageProperties = v5->_imageProperties;
    v5->_imageProperties = (UIContentUnavailableImageProperties *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textProperties"));
    v8 = objc_claimAutoreleasedReturnValue();
    textProperties = v5->_textProperties;
    v5->_textProperties = (UIContentUnavailableTextProperties *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryTextProperties"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryTextProperties = v5->_secondaryTextProperties;
    v5->_secondaryTextProperties = (UIContentUnavailableTextProperties *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonProperties"));
    v12 = objc_claimAutoreleasedReturnValue();
    buttonProperties = v5->_buttonProperties;
    v5->_buttonProperties = (UIContentUnavailableButtonProperties *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryButtonProperties"));
    v14 = objc_claimAutoreleasedReturnValue();
    secondaryButtonProperties = v5->_secondaryButtonProperties;
    v5->_secondaryButtonProperties = (UIContentUnavailableButtonProperties *)v14;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("prefersSideBySideButtonAndSecondaryButton"));
    v5->_prefersSideBySideButtonAndSecondaryButton = v16 != 0.0;
    v5->_axesPreservingSuperviewLayoutMargins = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("axesPreservingSuperviewLayoutMargins"));
    objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("directionalLayoutMargins"));
    v5->_directionalLayoutMargins.top = v17;
    v5->_directionalLayoutMargins.leading = v18;
    v5->_directionalLayoutMargins.bottom = v19;
    v5->_directionalLayoutMargins.trailing = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("imageToTextPadding"));
    v5->_imageToTextPadding = v21;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("textToSecondaryTextPadding"));
    v5->_textToSecondaryTextPadding = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("textToButtonPadding"));
    v5->_textToButtonPadding = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("buttonToSecondaryButtonPadding"));
    v5->_buttonToSecondaryButtonPadding = v24;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("background"));
    v25 = objc_claimAutoreleasedReturnValue();
    background = v5->_background;
    v5->_background = (UIBackgroundConfiguration *)v25;

    v5->_defaultStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultStyle"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("prefersSideBySideButtonAndSecondaryButton"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", v27);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v28))
      v29 = 2;
    else
      v29 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFD | v29;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v30))
      v31 = 4;
    else
      v31 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFB | v31;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageToTextPadding"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v32))
      v33 = 8;
    else
      v33 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xF7 | v33;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToSecondaryTextPadding"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v34))
      v35 = 16;
    else
      v35 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xEF | v35;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToButtonPadding"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v36))
      v37 = 32;
    else
      v37 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xDF | v37;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("buttonToSecondaryButtonPadding"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v38))
      v39 = 64;
    else
      v39 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xBF | v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIContentUnavailableImageProperties *imageProperties;
  id v5;
  double v6;
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
  uint64_t v19;
  id v20;

  imageProperties = self->_imageProperties;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", imageProperties, CFSTR("imageProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textProperties, CFSTR("textProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryTextProperties, CFSTR("secondaryTextProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buttonProperties, CFSTR("buttonProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryButtonProperties, CFSTR("secondaryButtonProperties"));
  v6 = 0.0;
  if (self->_prefersSideBySideButtonAndSecondaryButton)
    v6 = 1.0;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("prefersSideBySideButtonAndSecondaryButton"), v6);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_axesPreservingSuperviewLayoutMargins, CFSTR("axesPreservingSuperviewLayoutMargins"));
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", CFSTR("directionalLayoutMargins"), self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("imageToTextPadding"), self->_imageToTextPadding);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("textToSecondaryTextPadding"), self->_textToSecondaryTextPadding);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("textToButtonPadding"), self->_textToButtonPadding);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("buttonToSecondaryButtonPadding"), self->_buttonToSecondaryButtonPadding);
  objc_msgSend(v5, "encodeObject:forKey:", self->_background, CFSTR("background"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_defaultStyle, CFSTR("defaultStyle"));
  v7 = *(_BYTE *)&self->_configurationFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("prefersSideBySideButtonAndSecondaryButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v7, v8);

  v9 = (*(_BYTE *)&self->_configurationFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v9, v10);

  v11 = (*(_BYTE *)&self->_configurationFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v11, v12);

  v13 = (*(_BYTE *)&self->_configurationFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageToTextPadding"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v13, v14);

  v15 = (*(_BYTE *)&self->_configurationFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToSecondaryTextPadding"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v15, v16);

  v17 = (*(_BYTE *)&self->_configurationFlags >> 5) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToButtonPadding"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v17, v18);

  v19 = (*(_BYTE *)&self->_configurationFlags >> 6) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("buttonToSecondaryButtonPadding"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v19, v20);

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[UIContentUnavailableImageProperties hash](self->_imageProperties, "hash");
  v4 = -[UIContentUnavailableTextProperties hash](self->_textProperties, "hash") ^ v3;
  return v4 ^ -[UIContentUnavailableTextProperties hash](self->_secondaryTextProperties, "hash");
}

- (NSString)description
{
  id v3;
  __CFString *imageProperties;
  void *v5;
  void *v6;
  void *v7;
  UIContentUnavailableTextProperties *textProperties;
  void *v9;
  void *v10;
  void *v11;
  UIContentUnavailableTextProperties *secondaryTextProperties;
  void *v13;
  void *v14;
  void *v15;
  __CFString *buttonProperties;
  void *v17;
  void *v18;
  void *v19;
  __CFString *secondaryButtonProperties;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t defaultStyle;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t axesPreservingSuperviewLayoutMargins;
  void *v32;
  void *v33;
  void *v34;
  CGFloat top;
  double leading;
  double bottom;
  double trailing;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;

  if (self)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    imageProperties = (__CFString *)self->_imageProperties;
    if (imageProperties && imageProperties->data)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      -[UIContentUnavailableImageProperties _shortDescription](imageProperties);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("image = %@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

    }
    textProperties = self->_textProperties;
    if (textProperties && (textProperties->_text || textProperties->_attributedText))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[UIContentUnavailableTextProperties _shortDescription](textProperties);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("text = %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v11);

    }
    secondaryTextProperties = self->_secondaryTextProperties;
    if (secondaryTextProperties && (secondaryTextProperties->_text || secondaryTextProperties->_attributedText))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[UIContentUnavailableTextProperties _shortDescription](secondaryTextProperties);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("secondaryText = %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v15);

    }
    buttonProperties = (__CFString *)self->_buttonProperties;
    if (buttonProperties)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      -[UIContentUnavailableButtonProperties _shortDescription](buttonProperties);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("buttonProperties = %@"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v19);

    }
    secondaryButtonProperties = (__CFString *)self->_secondaryButtonProperties;
    if (secondaryButtonProperties)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      -[UIContentUnavailableButtonProperties _shortDescription](secondaryButtonProperties);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("secondaryButtonProperties = %@"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v23);

    }
    v24 = (void *)MEMORY[0x1E0CB3940];
    defaultStyle = self->_defaultStyle;
    if (defaultStyle >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_UIContentUnavailableConfigurationStyleToString(_UIContentUnavailableConfigurationStyle)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("UIContentUnavailableConfiguration.m"), 35, CFSTR("Unknown style: %ld"), defaultStyle);

      v26 = 0;
    }
    else
    {
      v26 = off_1E16DB5F0[defaultStyle];
    }
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Base Style = %@"), v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prefersSideBySideButtonAndSecondaryButton = %d"), self->_prefersSideBySideButtonAndSecondaryButton);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

    axesPreservingSuperviewLayoutMargins = self->_axesPreservingSuperviewLayoutMargins;
    if (axesPreservingSuperviewLayoutMargins)
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      _UIContentViewStringForAxis(axesPreservingSuperviewLayoutMargins);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("axesPreservingSuperviewLayoutMargins = %@"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v34);

    }
    top = self->_directionalLayoutMargins.top;
    leading = self->_directionalLayoutMargins.leading;
    bottom = self->_directionalLayoutMargins.bottom;
    trailing = self->_directionalLayoutMargins.trailing;
    if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("directionalLayoutMargins = %@"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v41);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageToTextPadding = %g"), *(_QWORD *)&self->_imageToTextPadding);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v42);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textToSecondaryTextPadding = %g"), *(_QWORD *)&self->_textToSecondaryTextPadding);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v43);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textToButtonPadding = %g"), *(_QWORD *)&self->_textToButtonPadding);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v44);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buttonToSecondaryButtonPadding = %g"), *(_QWORD *)&self->_buttonToSecondaryButtonPadding);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v45);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("background = %@"), self->_background);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v46);

    if (!objc_msgSend(v3, "count"))
      objc_msgSend(v3, "addObject:", CFSTR("(empty)"));
  }
  else
  {
    v3 = 0;
  }
  v47 = (void *)MEMORY[0x1E0CB3940];
  v48 = (objc_class *)objc_opt_class();
  NSStringFromClass(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v49, self, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v51;
}

- (void)_setSwiftBridgingImageProperties:(id)a3
{
  UIContentUnavailableImageProperties *v4;
  UIContentUnavailableImageProperties *imageProperties;
  UIContentUnavailableImageProperties *v6;
  UIContentUnavailableImageProperties *v7;

  v4 = (UIContentUnavailableImageProperties *)a3;
  imageProperties = self->_imageProperties;
  if (imageProperties)
    imageProperties = (UIContentUnavailableImageProperties *)imageProperties->_image;
  v6 = imageProperties;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v4, v6);

  v7 = self->_imageProperties;
  self->_imageProperties = v4;

}

- (void)_setSwiftBridgingTextProperties:(id)a3
{
  UIContentUnavailableTextProperties *v4;
  UIContentUnavailableTextProperties *textProperties;
  const char *v6;
  UIContentUnavailableTextProperties *v7;
  UIContentUnavailableTextProperties *v8;
  const char *v9;
  UIContentUnavailableTextProperties *v10;
  UIContentUnavailableTextProperties *v11;

  v4 = (UIContentUnavailableTextProperties *)a3;
  textProperties = self->_textProperties;
  if (textProperties)
    textProperties = (UIContentUnavailableTextProperties *)textProperties->_text;
  v7 = textProperties;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16);

  v8 = self->_textProperties;
  if (v8)
    v8 = (UIContentUnavailableTextProperties *)v8->_attributedText;
  v10 = v8;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v9, v10, 48);

  v11 = self->_textProperties;
  self->_textProperties = v4;

}

- (void)_setSwiftBridgingSecondaryTextProperties:(id)a3
{
  UIContentUnavailableTextProperties *v4;
  UIContentUnavailableTextProperties *secondaryTextProperties;
  const char *v6;
  UIContentUnavailableTextProperties *v7;
  UIContentUnavailableTextProperties *v8;
  const char *v9;
  UIContentUnavailableTextProperties *v10;
  UIContentUnavailableTextProperties *v11;

  v4 = (UIContentUnavailableTextProperties *)a3;
  secondaryTextProperties = self->_secondaryTextProperties;
  if (secondaryTextProperties)
    secondaryTextProperties = (UIContentUnavailableTextProperties *)secondaryTextProperties->_text;
  v7 = secondaryTextProperties;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16);

  v8 = self->_secondaryTextProperties;
  if (v8)
    v8 = (UIContentUnavailableTextProperties *)v8->_attributedText;
  v10 = v8;
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v9, v10, 48);

  v11 = self->_secondaryTextProperties;
  self->_secondaryTextProperties = v4;

}

- (void)_setSwiftBridgingButtonProperties:(id)a3
{
  UIContentUnavailableButtonProperties *v4;
  UIContentUnavailableButtonProperties *buttonProperties;
  UIContentUnavailableButtonProperties *v6;
  UIContentUnavailableButtonProperties *v7;

  v4 = (UIContentUnavailableButtonProperties *)a3;
  buttonProperties = self->_buttonProperties;
  if (buttonProperties)
    buttonProperties = (UIContentUnavailableButtonProperties *)buttonProperties->_configuration;
  v6 = buttonProperties;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v4, v6);

  v7 = self->_buttonProperties;
  self->_buttonProperties = v4;

}

- (void)_setSwiftBridgingSecondaryButtonProperties:(id)a3
{
  UIContentUnavailableButtonProperties *v4;
  UIContentUnavailableButtonProperties *secondaryButtonProperties;
  UIContentUnavailableButtonProperties *v6;
  UIContentUnavailableButtonProperties *v7;

  v4 = (UIContentUnavailableButtonProperties *)a3;
  secondaryButtonProperties = self->_secondaryButtonProperties;
  if (secondaryButtonProperties)
    secondaryButtonProperties = (UIContentUnavailableButtonProperties *)secondaryButtonProperties->_configuration;
  v6 = secondaryButtonProperties;
  -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v4, v6);

  v7 = self->_secondaryButtonProperties;
  self->_secondaryButtonProperties = v4;

}

- (void)setImage:(UIImage *)image
{
  -[UIContentUnavailableImageProperties setImage:]((uint64_t)self->_imageProperties, image);
}

- (UIImage)image
{
  return (UIImage *)-[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_imageProperties->super.isa);
}

- (NSString)text
{
  return -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_textProperties->super.isa);
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
  -[UIContentUnavailableTextProperties setAttributedText:]((uint64_t)self->_textProperties, attributedText);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)-[UIContentUnavailableTextProperties attributedText]((id *)&self->_textProperties->super.isa);
}

- (void)setSecondaryText:(NSString *)secondaryText
{
  -[UIContentUnavailableTextProperties setText:]((uint64_t)self->_secondaryTextProperties, secondaryText);
}

- (NSString)secondaryText
{
  return -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_secondaryTextProperties->super.isa);
}

- (void)setSecondaryAttributedText:(NSAttributedString *)secondaryAttributedText
{
  -[UIContentUnavailableTextProperties setAttributedText:]((uint64_t)self->_secondaryTextProperties, secondaryAttributedText);
}

- (NSAttributedString)secondaryAttributedText
{
  return (NSAttributedString *)-[UIContentUnavailableTextProperties attributedText]((id *)&self->_secondaryTextProperties->super.isa);
}

- (void)setButton:(UIButtonConfiguration *)button
{
  -[UIContentUnavailableButtonProperties setConfiguration:](self->_buttonProperties, "setConfiguration:", button);
}

- (UIButtonConfiguration)button
{
  return -[UIContentUnavailableButtonProperties configuration](self->_buttonProperties, "configuration");
}

- (void)setSecondaryButton:(UIButtonConfiguration *)secondaryButton
{
  -[UIContentUnavailableButtonProperties setConfiguration:](self->_secondaryButtonProperties, "setConfiguration:", secondaryButton);
}

- (UIButtonConfiguration)secondaryButton
{
  return -[UIContentUnavailableButtonProperties configuration](self->_secondaryButtonProperties, "configuration");
}

- (void)setAxesPreservingSuperviewLayoutMargins:(UIAxis)axesPreservingSuperviewLayoutMargins
{
  *(_BYTE *)&self->_configurationFlags |= 2u;
  self->_axesPreservingSuperviewLayoutMargins = axesPreservingSuperviewLayoutMargins;
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)directionalLayoutMargins
{
  *(_BYTE *)&self->_configurationFlags |= 4u;
  self->_directionalLayoutMargins = directionalLayoutMargins;
}

- (void)setAlignment:(UIContentUnavailableAlignment)alignment
{
  UIContentUnavailableTextProperties *textProperties;
  UIContentUnavailableTextProperties *secondaryTextProperties;

  textProperties = self->_textProperties;
  if (textProperties)
    textProperties->_alignment = alignment;
  secondaryTextProperties = self->_secondaryTextProperties;
  if (secondaryTextProperties)
    secondaryTextProperties->_alignment = alignment;
}

- (void)setImageToTextPadding:(CGFloat)imageToTextPadding
{
  *(_BYTE *)&self->_configurationFlags |= 8u;
  self->_imageToTextPadding = imageToTextPadding;
}

- (void)setTextToSecondaryTextPadding:(CGFloat)textToSecondaryTextPadding
{
  *(_BYTE *)&self->_configurationFlags |= 0x10u;
  self->_textToSecondaryTextPadding = textToSecondaryTextPadding;
}

- (CGFloat)textToSecondaryTextPadding
{
  return self->_textToSecondaryTextPadding;
}

- (void)setTextToButtonPadding:(CGFloat)textToButtonPadding
{
  *(_BYTE *)&self->_configurationFlags |= 0x20u;
  self->_textToButtonPadding = textToButtonPadding;
}

- (CGFloat)textToButtonPadding
{
  return self->_textToButtonPadding;
}

- (void)setButtonToSecondaryButtonPadding:(CGFloat)buttonToSecondaryButtonPadding
{
  *(_BYTE *)&self->_configurationFlags |= 0x40u;
  self->_buttonToSecondaryButtonPadding = buttonToSecondaryButtonPadding;
}

- (CGFloat)buttonToSecondaryButtonPadding
{
  return self->_buttonToSecondaryButtonPadding;
}

@end
