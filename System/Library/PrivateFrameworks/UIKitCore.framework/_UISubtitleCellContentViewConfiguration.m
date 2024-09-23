@implementation _UISubtitleCellContentViewConfiguration

+ (id)listCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultListCellConfigurationForState:", 0);
}

+ (id)outlineCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultOutlineCellConfigurationForState:", 0);
}

+ (id)defaultListCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UISubtitleCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (_UISubtitleCellContentViewConfiguration)defaultListCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  void *v5;
  void *v6;
  _UIContentViewImageViewConfiguration *v7;
  const char *v8;
  void *v9;
  void *v10;
  _UIContentViewLabelConfiguration *v11;
  void *v12;
  void *v13;
  _UIContentViewLabelConfiguration *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _UISubtitleCellContentViewConfiguration *v28;
  _UIContentViewImageViewConfiguration *v29;
  _UIContentViewLabelConfiguration *v30;
  _UIContentViewLabelConfiguration *v31;
  _UISubtitleCellContentViewConfiguration *v32;
  objc_super v34;

  v4 = a3;
  objc_opt_self();
  _UITableConstantsForTraitCollection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(_UIContentViewImageViewConfiguration);
  objc_msgSend(v5, "defaultImageSymbolConfigurationForTraitCollection:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v8, v9, 24);

  objc_msgSend(v5, "defaultImageTintColorForState:traitCollection:", v6, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v10);

  v11 = objc_alloc_init(_UIContentViewLabelConfiguration);
  objc_msgSend(v5, "defaultTextLabelFontForCellStyle:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v11, v12);

  objc_msgSend(v5, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 3, v4, 0, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v5, v4, 0);
  v14 = objc_alloc_init(_UIContentViewLabelConfiguration);
  objc_msgSend(v5, "defaultDetailTextFontForCellStyle:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v14, v15);

  objc_msgSend(v5, "defaultDetailTextColorForCellStyle:traitCollection:state:", 3, v4, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v14, v16);

  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v5, v4, 0);
  v17 = _UICellContentViewDefaultDirectionalLayoutMargins(v5, v4, 3, 0, 0);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v5, "defaultImageToTextPaddingForSidebar:", 0);
  v25 = v24;
  objc_msgSend(v5, "defaultTextToSubtitlePaddingForCellStyle:", 3);
  v27 = v26;
  v28 = [_UISubtitleCellContentViewConfiguration alloc];
  v29 = v7;
  v30 = v11;
  v31 = v14;
  if (v28)
  {
    v34.receiver = v28;
    v34.super_class = (Class)_UISubtitleCellContentViewConfiguration;
    v32 = (_UISubtitleCellContentViewConfiguration *)objc_msgSendSuper2(&v34, sel_init);
    v28 = v32;
    if (v32)
    {
      objc_storeStrong((id *)&v32->_imageView, v7);
      objc_storeStrong((id *)&v28->_textLabel, v11);
      objc_storeStrong((id *)&v28->_subtitleLabel, v14);
      v28->_axesPreservingSuperviewLayoutMargins = 1;
      v28->_directionalLayoutMargins.top = v17;
      v28->_directionalLayoutMargins.leading = v19;
      v28->_directionalLayoutMargins.bottom = v21;
      v28->_directionalLayoutMargins.trailing = v23;
      v28->_imageToTextPadding = v25;
      v28->_textToSubtitlePadding = v27;
    }
  }

  if (v28)
    v28->_defaultStyle = 0;

  return v28;
}

+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UISubtitleCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultOutlineCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;

  v4 = a3;
  v5 = objc_opt_self();
  +[_UISubtitleCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v5, a2, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_splitViewControllerContext") == 2)
    v8 = 2;
  else
    v8 = 1;
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultImageToTextPaddingForSidebar:", 1);
  if (v6)
  {
    *(_QWORD *)(v6 + 24) = v10;
    *(double *)(v6 + 80) = _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 3, 1, 0);
    *(_QWORD *)(v6 + 88) = v11;
    *(_QWORD *)(v6 + 96) = v12;
    *(_QWORD *)(v6 + 104) = v13;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 3, 1, 0);
  }
  objc_msgSend((id)v6, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v7, v4, 1);

  objc_msgSend((id)v6, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v15, v7, v4, 1);

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v17, v16);

  objc_msgSend(v7, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v4, v9, 0, 0, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v19, v18);

  objc_msgSend(v7, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v4, v9, 0, 1, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "subtitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v21, v20);

  objc_msgSend(v7, "defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:", v4, v9, 0, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v23, v22);

  if (objc_msgSend(v9, "isHighlighted"))
  {
    objc_msgSend((id)v6, "textLabel");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = *(void **)(v24 + 32);
    else
      v26 = 0;
    v27 = v26;
    _UIConfigurationCompatibilityColorForHighlightedState(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v6, "imageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v29, v28);

    objc_msgSend((id)v6, "textLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v30, v28);

    objc_msgSend((id)v6, "subtitleLabel");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
      v33 = *(void **)(v31 + 32);
    else
      v33 = 0;
    v34 = v33;
    _UIConfigurationCompatibilityColorForHighlightedState(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "subtitleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v36, v35);

  }
  if (v6)
    *(_QWORD *)(v6 + 48) = 1;

  return (id)v6;
}

+ (id)defaultConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "defaultListCellConfigurationForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 3, v3, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlightedTextColor:", v6);

  return v2;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return -[_UISubtitleCellContentViewConfiguration updatedConfigurationForState:traitCollection:](self, "updatedConfigurationForState:traitCollection:", a3, 0);
}

- (id)updatedConfigurationForState:(unint64_t)a3 traitCollection:(id)a4
{
  id v6;
  uint64_t v7;
  int64_t defaultStyle;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char configurationFlags;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a4;
  v7 = -[_UISubtitleCellContentViewConfiguration copy](self, "copy");
  defaultStyle = self->_defaultStyle;
  v9 = v6;
  v10 = objc_opt_self();
  v11 = v9;
  if (!v9)
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (defaultStyle == 1)
  {
    +[_UISubtitleCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:](v10, a3, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!defaultStyle)
  {
    +[_UISubtitleCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v10, a3, v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = v12;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v10, CFSTR("_UISubtitleCellContentView.m"), 174, CFSTR("Unknown style: %ld"), defaultStyle);

  v13 = 0;
LABEL_9:

  objc_msgSend((id)v7, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentViewImageViewConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v15, v16);

  objc_msgSend((id)v7, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentViewLabelConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v17, v18);

  objc_msgSend((id)v7, "subtitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "subtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentViewLabelConfiguration _applyPropertiesFromDefaultConfiguration:]((uint64_t)v19, v20);

  configurationFlags = (char)self->_configurationFlags;
  if ((configurationFlags & 1) != 0)
    goto LABEL_13;
  if (v13)
  {
    v22 = *(_QWORD *)(v13 + 16);
    if (!v7)
      goto LABEL_13;
    goto LABEL_12;
  }
  v22 = 0;
  if (v7)
  {
LABEL_12:
    *(_QWORD *)(v7 + 16) = v22;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_13:
  if ((configurationFlags & 2) != 0)
    goto LABEL_17;
  if (v13)
  {
    v23 = *(_OWORD *)(v13 + 80);
    v24 = *(_OWORD *)(v13 + 96);
    if (!v7)
      goto LABEL_17;
    goto LABEL_16;
  }
  v23 = 0uLL;
  v24 = 0uLL;
  if (v7)
  {
LABEL_16:
    *(_OWORD *)(v7 + 80) = v23;
    *(_OWORD *)(v7 + 96) = v24;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_17:
  if ((configurationFlags & 4) != 0)
    goto LABEL_21;
  if (v13)
  {
    v25 = *(_QWORD *)(v13 + 24);
    if (!v7)
      goto LABEL_21;
    goto LABEL_20;
  }
  v25 = 0;
  if (v7)
  {
LABEL_20:
    *(_QWORD *)(v7 + 24) = v25;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_21:
  if ((configurationFlags & 8) == 0)
  {
    if (!v13)
    {
      v26 = 0;
      if (!v7)
        goto LABEL_25;
      goto LABEL_24;
    }
    v26 = *(_QWORD *)(v13 + 32);
    if (v7)
LABEL_24:
      *(_QWORD *)(v7 + 32) = v26;
  }
LABEL_25:

  return (id)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISubtitleCellContentViewConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UISubtitleCellContentViewConfiguration *v5;
  uint64_t v6;
  _UIContentViewImageViewConfiguration *imageView;
  uint64_t v8;
  _UIContentViewLabelConfiguration *textLabel;
  uint64_t v10;
  _UIContentViewLabelConfiguration *subtitleLabel;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_UISubtitleCellContentViewConfiguration;
  v5 = -[_UISubtitleCellContentViewConfiguration init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageView"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageView = v5->_imageView;
    v5->_imageView = (_UIContentViewImageViewConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textLabel"));
    v8 = objc_claimAutoreleasedReturnValue();
    textLabel = v5->_textLabel;
    v5->_textLabel = (_UIContentViewLabelConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitleLabel"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = (_UIContentViewLabelConfiguration *)v10;

    v5->_axesPreservingSuperviewLayoutMargins = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("axesPreservingSuperviewLayoutMargins"));
    objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("directionalLayoutMargins"));
    v5->_directionalLayoutMargins.top = v12;
    v5->_directionalLayoutMargins.leading = v13;
    v5->_directionalLayoutMargins.bottom = v14;
    v5->_directionalLayoutMargins.trailing = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("imageToTextPadding"));
    v5->_imageToTextPadding = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("textToSubtitlePadding"));
    v5->_textToSubtitlePadding = v17;
    v5->_defaultStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultStyle"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", v18);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v19))
      v20 = 2;
    else
      v20 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFD | v20;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageToTextPadding"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v21))
      v22 = 4;
    else
      v22 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFB | v22;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToSubtitlePadding"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v23))
      v24 = 8;
    else
      v24 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xF7 | v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _UIContentViewImageViewConfiguration *imageView;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  imageView = self->_imageView;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", imageView, CFSTR("imageView"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textLabel, CFSTR("textLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleLabel, CFSTR("subtitleLabel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_axesPreservingSuperviewLayoutMargins, CFSTR("axesPreservingSuperviewLayoutMargins"));
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", CFSTR("directionalLayoutMargins"), self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("imageToTextPadding"), self->_imageToTextPadding);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("textToSubtitlePadding"), self->_textToSubtitlePadding);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_defaultStyle, CFSTR("defaultStyle"));
  v6 = *(_BYTE *)&self->_configurationFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_BYTE *)&self->_configurationFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

  v10 = (*(_BYTE *)&self->_configurationFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageToTextPadding"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

  v12 = (*(_BYTE *)&self->_configurationFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("textToSubtitlePadding"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v12, v13);

}

- (id)createContentView
{
  return -[_UISubtitleCellContentView initWithConfiguration:]([_UISubtitleCellContentView alloc], "initWithConfiguration:", self);
}

- (void)applyToContentView:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISubtitleCellContentView.m"), 283, CFSTR("Unable to apply %@ to content view %@"), self, v6);

  }
  objc_msgSend(v6, "setConfiguration:", self);

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
  __int128 v11;
  uint64_t v12;
  void *v13;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[_UIContentViewImageViewConfiguration copy](self->_imageView, "copy");
    v6 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v5;

    v7 = -[_UIContentViewLabelConfiguration copy](self->_textLabel, "copy");
    v8 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v7;

    v9 = -[_UIContentViewLabelConfiguration copy](self->_subtitleLabel, "copy");
    v10 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v9;

    *(_QWORD *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    v11 = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 80) = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 96) = v11;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    *(double *)(v4 + 32) = self->_textToSubtitlePadding;
    v12 = -[_UIContentViewEditingConfiguration copy](self->_textLabelEditingConfiguration, "copy");
    v13 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v12;

    *(_QWORD *)(v4 + 48) = self->_defaultStyle;
    *($BF8D45CD21A2295E3DCCAFF3B37A82F5 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  _UISubtitleCellContentViewConfiguration *v4;
  _UISubtitleCellContentViewConfiguration *v5;
  _UISubtitleCellContentViewConfiguration *v6;
  _UISubtitleCellContentViewConfiguration *v7;
  _UIContentViewEditingConfiguration *textLabelEditingConfiguration;
  _UIContentViewEditingConfiguration *v10;
  _UIContentViewEditingConfiguration *v11;
  _UISubtitleCellContentViewConfiguration *v12;
  _UISubtitleCellContentViewConfiguration *v13;
  BOOL v14;

  v4 = (_UISubtitleCellContentViewConfiguration *)a3;
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
        && -[_UIContentViewImageViewConfiguration _isEqualToConfiguration:]((uint64_t)self->_imageView, v6->_imageView)
        && -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_textLabel, v7->_textLabel)&& -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_subtitleLabel, v7->_subtitleLabel)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_imageToTextPadding == v7->_imageToTextPadding&& self->_textToSubtitlePadding == v7->_textToSubtitlePadding)
      {
        textLabelEditingConfiguration = self->_textLabelEditingConfiguration;
        v10 = v7->_textLabelEditingConfiguration;
        v11 = textLabelEditingConfiguration;
        v12 = v10;
        v13 = v12;
        if (v11 == (_UIContentViewEditingConfiguration *)v12)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          LOBYTE(self) = 0;
          if (v11 && v12)
          {
            self = v12;
            v14 = -[_UIContentViewEditingConfiguration isEqual:](v11, "isEqual:", v12);
            v13 = self;
            LOBYTE(self) = v14;
          }
        }

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
    else if (*(void **)(a1 + 48) == v3[6]
           && -[_UIContentViewImageViewConfiguration _isEqualToConfigurationQuick:](*(_QWORD *)(a1 + 56), v3[7])
           && -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(_QWORD *)(a1 + 64), v4[8])&& -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(_QWORD *)(a1 + 72), v4[9])&& *(void **)(a1 + 16) == v4[2]&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 80), *((float64x2_t *)v4 + 5)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 96), *((float64x2_t *)v4 + 6)))), 0xFuLL))) & 1) != 0&& *(double *)(a1 + 24) == *((double *)v4 + 3)&& *(double *)(a1 + 32) == *((double *)v4 + 4))
    {
      a1 = UIEqual(*(void **)(a1 + 40), v4[5]);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_UIContentViewImageViewConfiguration hash](self->_imageView, "hash");
  v4 = -[_UIContentViewLabelConfiguration hash](self->_textLabel, "hash") ^ v3;
  return v4 ^ -[_UIContentViewLabelConfiguration hash](self->_subtitleLabel, "hash");
}

- (NSString)description
{
  id v3;
  void *v4;
  int64_t defaultStyle;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *imageView;
  void *v11;
  void *v12;
  void *v13;
  _UIContentViewLabelConfiguration *textLabel;
  void *v15;
  void *v16;
  void *v17;
  _UIContentViewLabelConfiguration *subtitleLabel;
  void *v19;
  void *v20;
  void *v21;
  CGFloat top;
  double leading;
  double bottom;
  double trailing;
  void *v26;
  void *v27;
  void *v28;
  unint64_t axesPreservingSuperviewLayoutMargins;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  defaultStyle = self->_defaultStyle;
  if (defaultStyle)
  {
    if (defaultStyle == 1)
    {
      v6 = CFSTR("Outline");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_UISubtitleCellContentViewConfigurationStyleToString(_UISubtitleCellContentViewConfigurationStyle)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UISubtitleCellContentView.m"), 31, CFSTR("Unknown style: %ld"), defaultStyle);

      v6 = 0;
    }
  }
  else
  {
    v6 = CFSTR("List");
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Base Style = %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  imageView = (__CFString *)self->_imageView;
  if (imageView && (imageView->data || imageView[1].data))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[_UIContentViewImageViewConfiguration _shortDescription](imageView);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("imageView = %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  textLabel = self->_textLabel;
  if (textLabel && (textLabel->_text || textLabel->_attributedText))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[_UIContentViewLabelConfiguration _shortDescription](textLabel);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("textLabel = %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel && (subtitleLabel->_text || subtitleLabel->_attributedText))
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[_UIContentViewLabelConfiguration _shortDescription](subtitleLabel);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("subtitleLabel = %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  top = self->_directionalLayoutMargins.top;
  leading = self->_directionalLayoutMargins.leading;
  bottom = self->_directionalLayoutMargins.bottom;
  trailing = self->_directionalLayoutMargins.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("directionalLayoutMargins = %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v28);

  }
  axesPreservingSuperviewLayoutMargins = self->_axesPreservingSuperviewLayoutMargins;
  if (axesPreservingSuperviewLayoutMargins)
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    _UIContentViewStringForAxis(axesPreservingSuperviewLayoutMargins);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("axesPreservingSuperviewLayoutMargins = %@"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v32);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageToTextPadding = %g"), *(_QWORD *)&self->_imageToTextPadding);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textToSubtitlePadding = %g"), *(_QWORD *)&self->_textToSubtitlePadding);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v34);

  v35 = (void *)MEMORY[0x1E0CB3940];
  v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v37, self, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v39;
}

- (void)setAxesPreservingSuperviewLayoutMargins:(unint64_t)a3
{
  *(_BYTE *)&self->_configurationFlags |= 1u;
  self->_axesPreservingSuperviewLayoutMargins = a3;
}

- (unint64_t)axesPreservingSuperviewLayoutMargins
{
  return self->_axesPreservingSuperviewLayoutMargins;
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  *(_BYTE *)&self->_configurationFlags |= 2u;
  self->_directionalLayoutMargins = a3;
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

- (void)setImageToTextPadding:(double)a3
{
  *(_BYTE *)&self->_configurationFlags |= 4u;
  self->_imageToTextPadding = a3;
}

- (double)imageToTextPadding
{
  return self->_imageToTextPadding;
}

- (void)setTextToSubtitlePadding:(double)a3
{
  *(_BYTE *)&self->_configurationFlags |= 8u;
  self->_textToSubtitlePadding = a3;
}

- (double)textToSubtitlePadding
{
  return self->_textToSubtitlePadding;
}

- (_UIContentViewEditingConfiguration)_textLabelEditingConfiguration
{
  return self->_textLabelEditingConfiguration;
}

- (void)set_textLabelEditingConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_UIContentViewImageViewConfiguration)imageView
{
  return self->_imageView;
}

- (_UIContentViewLabelConfiguration)textLabel
{
  return self->_textLabel;
}

- (_UIContentViewLabelConfiguration)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabelEditingConfiguration, 0);
}

@end
