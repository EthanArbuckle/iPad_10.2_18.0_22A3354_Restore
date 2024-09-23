@implementation _UIBasicCellContentViewConfiguration

+ (id)listCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultListCellConfigurationForState:", 0);
}

+ (id)outlineRootParentCellConfiguration
{
  return (id)objc_msgSend(a1, "defaultOutlineParentCellConfigurationForState:", 0);
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
  +[_UIBasicCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultListCellConfigurationForState:(void *)a3 traitCollection:
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
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _UIBasicCellContentViewConfiguration *v23;
  _UIContentViewImageViewConfiguration *v24;
  _UIContentViewLabelConfiguration *v25;
  id *v26;
  id *v27;
  objc_super v29;

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
  objc_msgSend(v5, "defaultTextLabelFontForCellStyle:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v11, v12);

  objc_msgSend(v5, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 0, v4, 0, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v11, v13);

  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v11, v5, v4, 0);
  v14 = _UICellContentViewDefaultDirectionalLayoutMargins(v5, v4, 0, 0, 0);
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v5, "defaultImageToTextPaddingForSidebar:", 0);
  v22 = v21;
  v23 = [_UIBasicCellContentViewConfiguration alloc];
  v24 = v7;
  v25 = v11;
  if (v23
    && (v29.receiver = v23,
        v29.super_class = (Class)_UIBasicCellContentViewConfiguration,
        (v26 = (id *)objc_msgSendSuper2(&v29, sel_init)) != 0))
  {
    v27 = v26;
    objc_storeStrong(v26 + 6, v7);
    objc_storeStrong(v27 + 7, v11);
    v27[2] = (id)1;
    *((double *)v27 + 8) = v14;
    v27[9] = v16;
    v27[10] = v18;
    v27[11] = v20;
    v27[3] = v22;

    v27[5] = 0;
  }
  else
  {

    v27 = 0;
  }

  return v27;
}

+ (id)defaultOutlineParentCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBasicCellContentViewConfiguration defaultOutlineRootParentCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultOutlineRootParentCellConfigurationForState:(void *)a3 traitCollection:
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = objc_opt_self();
  _UITableConstantsForTraitCollection(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBasicCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v5, a2, v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_splitViewControllerContext") == 2)
    v8 = 2;
  else
    v8 = 1;
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultImageToTextPaddingForSidebar:", 1);
  if (v7)
  {
    *(_QWORD *)(v7 + 24) = v10;
    *(double *)(v7 + 64) = _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 0, 1, 0);
    *(_QWORD *)(v7 + 72) = v11;
    *(_QWORD *)(v7 + 80) = v12;
    *(_QWORD *)(v7 + 88) = v13;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v6, v4, 0, 1, 0);
  }
  objc_msgSend((id)v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v6, v4, 1);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "defaultSidebarHeaderFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionCompositionalLayoutSolverOptions setLayoutAttributesClass:]((uint64_t)v16, v15);

  }
  objc_msgSend(v6, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v4, v9, 1, 0, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v18, v17);

  objc_msgSend(v6, "defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:", v4, v9, 1, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v20, v19);

  if (objc_msgSend(v9, "isHighlighted"))
  {
    objc_msgSend((id)v7, "textLabel");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = *(void **)(v21 + 32);
    else
      v23 = 0;
    v24 = v23;
    _UIConfigurationCompatibilityColorForHighlightedState(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v7, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v26, v25);

    objc_msgSend((id)v7, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v27, v25);

  }
  if (v7)
    *(_QWORD *)(v7 + 40) = 2;

  return (id)v7;
}

+ (id)defaultOutlineCellConfigurationForState:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[UITraitCollection _fallbackTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIBasicCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:]((uint64_t)a1, a3, v5);
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
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = objc_opt_self();
  +[_UIBasicCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v5, a2, v4);
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
    *(double *)(v6 + 64) = _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 0, 1, 0);
    *(_QWORD *)(v6 + 72) = v11;
    *(_QWORD *)(v6 + 80) = v12;
    *(_QWORD *)(v6 + 88) = v13;
  }
  else
  {
    _UICellContentViewDefaultDirectionalLayoutMargins(v7, v4, 0, 1, 0);
  }
  objc_msgSend((id)v6, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentViewLabelConfiguration _configureWithConstants:traitCollection:forSidebar:]((uint64_t)v14, v7, v4, 1);

  objc_msgSend(v7, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v4, v9, 0, 0, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v16, v15);

  objc_msgSend(v7, "defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:", v4, v9, 0, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v18, v17);

  if (objc_msgSend(v9, "isHighlighted"))
  {
    objc_msgSend((id)v6, "textLabel");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = *(void **)(v19 + 32);
    else
      v21 = 0;
    v22 = v21;
    _UIConfigurationCompatibilityColorForHighlightedState(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v6, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v24, v23);

    objc_msgSend((id)v6, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v25, v23);

  }
  if (v6)
    *(_QWORD *)(v6 + 40) = 1;

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
  objc_msgSend(v4, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 0, v3, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlightedTextColor:", v6);

  return v2;
}

- (id)updatedConfigurationForState:(unint64_t)a3
{
  return -[_UIBasicCellContentViewConfiguration updatedConfigurationForState:traitCollection:](self, "updatedConfigurationForState:traitCollection:", a3, 0);
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
  char configurationFlags;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v6 = a4;
  v7 = -[_UIBasicCellContentViewConfiguration copy](self, "copy");
  defaultStyle = self->_defaultStyle;
  v9 = v6;
  v10 = objc_opt_self();
  v11 = v9;
  if (!v9)
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  switch(defaultStyle)
  {
    case 2:
      +[_UIBasicCellContentViewConfiguration defaultOutlineRootParentCellConfigurationForState:traitCollection:](v10, a3, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      +[_UIBasicCellContentViewConfiguration defaultOutlineCellConfigurationForState:traitCollection:](v10, a3, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 0:
      +[_UIBasicCellContentViewConfiguration defaultListCellConfigurationForState:traitCollection:](v10, a3, v11);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v13 = v12;
      goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultConfigurationForStyle_state_traitCollection_, v10, CFSTR("_UIBasicCellContentView.m"), 207, CFSTR("Unknown style: %ld"), defaultStyle);

  v13 = 0;
LABEL_11:

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

  configurationFlags = (char)self->_configurationFlags;
  if ((configurationFlags & 1) != 0)
    goto LABEL_15;
  if (v13)
  {
    v20 = *(_QWORD *)(v13 + 16);
    if (!v7)
      goto LABEL_15;
    goto LABEL_14;
  }
  v20 = 0;
  if (v7)
  {
LABEL_14:
    *(_QWORD *)(v7 + 16) = v20;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_15:
  if ((configurationFlags & 2) != 0)
    goto LABEL_19;
  if (v13)
  {
    v21 = *(_OWORD *)(v13 + 64);
    v22 = *(_OWORD *)(v13 + 80);
    if (!v7)
      goto LABEL_19;
    goto LABEL_18;
  }
  v21 = 0uLL;
  v22 = 0uLL;
  if (v7)
  {
LABEL_18:
    *(_OWORD *)(v7 + 64) = v21;
    *(_OWORD *)(v7 + 80) = v22;
    configurationFlags = (char)self->_configurationFlags;
  }
LABEL_19:
  if ((configurationFlags & 4) == 0)
  {
    if (!v13)
    {
      v23 = 0;
      if (!v7)
        goto LABEL_23;
      goto LABEL_22;
    }
    v23 = *(_QWORD *)(v13 + 24);
    if (v7)
LABEL_22:
      *(_QWORD *)(v7 + 24) = v23;
  }
LABEL_23:

  return (id)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBasicCellContentViewConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIBasicCellContentViewConfiguration *v5;
  uint64_t v6;
  _UIContentViewImageViewConfiguration *imageView;
  uint64_t v8;
  _UIContentViewLabelConfiguration *textLabel;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIBasicCellContentViewConfiguration;
  v5 = -[_UIBasicCellContentViewConfiguration init](&v21, sel_init);
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

    v5->_axesPreservingSuperviewLayoutMargins = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("axesPreservingSuperviewLayoutMargins"));
    objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("directionalLayoutMargins"));
    v5->_directionalLayoutMargins.top = v10;
    v5->_directionalLayoutMargins.leading = v11;
    v5->_directionalLayoutMargins.bottom = v12;
    v5->_directionalLayoutMargins.trailing = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("imageToTextPadding"));
    v5->_imageToTextPadding = v14;
    v5->_defaultStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultStyle"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("axesPreservingSuperviewLayoutMargins"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("directionalLayoutMargins"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v16))
      v17 = 2;
    else
      v17 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFD | v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("imageToTextPadding"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v18))
      v19 = 4;
    else
      v19 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFB | v19;

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
  id v11;

  imageView = self->_imageView;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", imageView, CFSTR("imageView"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textLabel, CFSTR("textLabel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_axesPreservingSuperviewLayoutMargins, CFSTR("axesPreservingSuperviewLayoutMargins"));
  objc_msgSend(v5, "encodeDirectionalEdgeInsets:forKey:", CFSTR("directionalLayoutMargins"), self->_directionalLayoutMargins.top, self->_directionalLayoutMargins.leading, self->_directionalLayoutMargins.bottom, self->_directionalLayoutMargins.trailing);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("imageToTextPadding"), self->_imageToTextPadding);
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
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

}

- (id)createContentView
{
  return -[_UIBasicCellContentView initWithConfiguration:]([_UIBasicCellContentView alloc], "initWithConfiguration:", self);
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
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBasicCellContentView.m"), 308, CFSTR("Unable to apply %@ to content view %@"), self, v6);

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
  __int128 v9;
  uint64_t v10;
  void *v11;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[_UIContentViewImageViewConfiguration copy](self->_imageView, "copy");
    v6 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v5;

    v7 = -[_UIContentViewLabelConfiguration copy](self->_textLabel, "copy");
    v8 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v7;

    *(_QWORD *)(v4 + 16) = self->_axesPreservingSuperviewLayoutMargins;
    v9 = *(_OWORD *)&self->_directionalLayoutMargins.bottom;
    *(_OWORD *)(v4 + 64) = *(_OWORD *)&self->_directionalLayoutMargins.top;
    *(_OWORD *)(v4 + 80) = v9;
    *(double *)(v4 + 24) = self->_imageToTextPadding;
    v10 = -[_UIContentViewEditingConfiguration copy](self->_textLabelEditingConfiguration, "copy");
    v11 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v10;

    *(_QWORD *)(v4 + 40) = self->_defaultStyle;
    *($51CF450A80AAE809443F9EE75CC1F982 *)(v4 + 8) = self->_configurationFlags;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIBasicCellContentViewConfiguration *v4;
  _UIBasicCellContentViewConfiguration *v5;
  _UIBasicCellContentViewConfiguration *v6;
  _UIBasicCellContentViewConfiguration *v7;
  _UIContentViewEditingConfiguration *textLabelEditingConfiguration;
  _UIContentViewEditingConfiguration *v10;
  _UIContentViewEditingConfiguration *v11;
  _UIContentViewEditingConfiguration *v12;
  _UIContentViewEditingConfiguration *v13;

  v4 = (_UIBasicCellContentViewConfiguration *)a3;
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
        && -[_UIContentViewLabelConfiguration _isEqualToConfiguration:]((uint64_t)self->_textLabel, v7->_textLabel)&& self->_axesPreservingSuperviewLayoutMargins == v7->_axesPreservingSuperviewLayoutMargins&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.top, *(float64x2_t *)&v7->_directionalLayoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_directionalLayoutMargins.bottom, *(float64x2_t *)&v7->_directionalLayoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_imageToTextPadding == v7->_imageToTextPadding)
      {
        textLabelEditingConfiguration = self->_textLabelEditingConfiguration;
        v10 = v7->_textLabelEditingConfiguration;
        v11 = textLabelEditingConfiguration;
        v12 = v10;
        v13 = v12;
        if (v11 == v12)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          LOBYTE(self) = 0;
          if (v11 && v12)
            LOBYTE(self) = -[_UIContentViewEditingConfiguration isEqual:](v11, "isEqual:", v12);
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
    else if (*(void **)(a1 + 40) == v3[5]
           && -[_UIContentViewImageViewConfiguration _isEqualToConfigurationQuick:](*(_QWORD *)(a1 + 48), v3[6])
           && -[_UIContentViewLabelConfiguration _isEqualToConfigurationQuick:](*(_QWORD *)(a1 + 56), v4[7])&& *(void **)(a1 + 16) == v4[2]&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 64), *((float64x2_t *)v4 + 4)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 80), *((float64x2_t *)v4 + 5)))), 0xFuLL))) & 1) != 0&& *(double *)(a1 + 24) == *((double *)v4 + 3))
    {
      a1 = UIEqual(*(void **)(a1 + 32), v4[4]);
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

  v3 = -[_UIContentViewImageViewConfiguration hash](self->_imageView, "hash");
  return -[_UIContentViewLabelConfiguration hash](self->_textLabel, "hash") ^ v3;
}

- (NSString)description
{
  id v3;
  void *v4;
  unint64_t defaultStyle;
  __CFString *v6;
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
  CGFloat top;
  double leading;
  double bottom;
  double trailing;
  void *v22;
  void *v23;
  void *v24;
  unint64_t axesPreservingSuperviewLayoutMargins;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  defaultStyle = self->_defaultStyle;
  if (defaultStyle >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_UIBasicCellContentViewConfigurationStyleToString(_UIBasicCellContentViewConfigurationStyle)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIBasicCellContentView.m"), 35, CFSTR("Unknown style: %ld"), defaultStyle);

    v6 = 0;
  }
  else
  {
    v6 = off_1E16EA058[defaultStyle];
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
  top = self->_directionalLayoutMargins.top;
  leading = self->_directionalLayoutMargins.leading;
  bottom = self->_directionalLayoutMargins.bottom;
  trailing = self->_directionalLayoutMargins.trailing;
  if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("directionalLayoutMargins = %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

  }
  axesPreservingSuperviewLayoutMargins = self->_axesPreservingSuperviewLayoutMargins;
  if (axesPreservingSuperviewLayoutMargins)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    _UIContentViewStringForAxis(axesPreservingSuperviewLayoutMargins);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("axesPreservingSuperviewLayoutMargins = %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v28);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageToTextPadding = %g"), *(_QWORD *)&self->_imageToTextPadding);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  v30 = (void *)MEMORY[0x1E0CB3940];
  v31 = (objc_class *)objc_opt_class();
  NSStringFromClass(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v32, self, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v34;
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

- (_UIContentViewEditingConfiguration)_textLabelEditingConfiguration
{
  return self->_textLabelEditingConfiguration;
}

- (void)set_textLabelEditingConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_UIContentViewImageViewConfiguration)imageView
{
  return self->_imageView;
}

- (_UIContentViewLabelConfiguration)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabelEditingConfiguration, 0);
}

@end
