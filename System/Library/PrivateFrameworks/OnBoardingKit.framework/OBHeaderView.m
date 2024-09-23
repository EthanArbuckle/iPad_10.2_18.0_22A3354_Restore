@implementation OBHeaderView

- (OBHeaderView)initWithTitle:(id)a3
{
  return -[OBHeaderView initWithTitle:detailText:icon:](self, "initWithTitle:detailText:icon:", a3, 0, 0);
}

- (OBHeaderView)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  id v8;
  id v9;
  id v10;
  OBHeaderView *v11;
  OBHeaderView *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBHeaderView;
  v11 = -[OBHeaderView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      v11->_usingSymbolImage = 1;
      -[OBHeaderView symbolConfiguration](v11, "symbolConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView _symbolIconForHeaderStyle:configuration:](v12, "_symbolIconForHeaderStyle:configuration:", v10, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[OBHeaderView _createImageView:](v12, "_createImageView:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView setImageView:](v12, "setImageView:", v15);

    }
    -[OBHeaderView extendedInitWithTitle:detailText:](v12, "extendedInitWithTitle:detailText:", v8, v9);
  }

  return v12;
}

- (OBHeaderView)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  OBHeaderView *v11;
  OBHeaderView *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OBHeaderView;
  v11 = -[OBHeaderView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      -[OBHeaderView _createImageView:](v11, "_createImageView:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView setImageView:](v12, "setImageView:", v13);

    }
    -[OBHeaderView extendedInitWithTitle:detailText:](v12, "extendedInitWithTitle:detailText:", v8, v9);
  }

  return v12;
}

- (OBHeaderView)initWithTitle:(id)a3 symbolName:(id)a4
{
  __CFString *v6;
  id v7;
  OBHeaderView *v8;
  OBHeaderView *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  objc_super v16;

  v6 = (__CFString *)a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)OBHeaderView;
  v8 = -[OBHeaderView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      v8->_usingSymbolImage = 1;
      -[OBHeaderView symbolConfiguration](v8, "symbolConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView _symbolIconForHeaderStyle:configuration:](v9, "_symbolIconForHeaderStyle:configuration:", v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[OBHeaderView _createImageView:](v9, "_createImageView:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView setImageView:](v9, "setImageView:", v12);

    }
    v13 = &stru_1E37AB0D0;
    if (v6)
      v13 = v6;
    v14 = v13;

    -[OBHeaderView extendedInitWithTitle:detailText:](v9, "extendedInitWithTitle:detailText:", v14, 0);
    v6 = v14;
  }

  return v9;
}

- (OBHeaderView)initWithTitle:(id)a3 icon:(id)a4
{
  __CFString *v6;
  id v7;
  OBHeaderView *v8;
  OBHeaderView *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  objc_super v14;

  v6 = (__CFString *)a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OBHeaderView;
  v8 = -[OBHeaderView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      -[OBHeaderView _createImageView:](v8, "_createImageView:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView setImageView:](v9, "setImageView:", v10);

    }
    v11 = &stru_1E37AB0D0;
    if (v6)
      v11 = v6;
    v12 = v11;

    -[OBHeaderView extendedInitWithTitle:detailText:](v9, "extendedInitWithTitle:detailText:", v12, 0);
    v6 = v12;
  }

  return v9;
}

- (void)extendedInitWithTitle:(id)a3 detailText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[OBHeaderView _createHeaderLabelIfNeeded](self, "_createHeaderLabelIfNeeded");
  -[OBHeaderView headerLabel](self, "headerLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[OBHeaderView headerLabel](self, "headerLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView addSubview:](self, "addSubview:", v9);

  if (objc_msgSend(v6, "length"))
  {
    -[OBHeaderView _createDetailLabelIfNeeded](self, "_createDetailLabelIfNeeded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView setDetailLabel:](self, "setDetailLabel:", v10);

    -[OBHeaderView detailLabel](self, "detailLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v6);

  }
  -[OBHeaderView detailLabel](self, "detailLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView addSubview:](self, "addSubview:", v12);

  v22 = (void *)MEMORY[0x1E0CB3718];
  -[OBHeaderView leftAnchor](self, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView headerLabel](self, "headerLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  -[OBHeaderView rightAnchor](self, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView headerLabel](self, "headerLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v23 = v6;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v21);

  -[OBHeaderView _insertAndLayoutImageViewIfNeeded](self, "_insertAndLayoutImageViewIfNeeded");
  -[OBHeaderView _updateConstraintsForDetailLabel](self, "_updateConstraintsForDetailLabel");

}

- (void)_createHeaderLabelIfNeeded
{
  void *v3;
  OBTemplateLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[OBHeaderView headerLabel](self, "headerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(OBTemplateLabel);
    -[OBHeaderView setHeaderLabel:](self, "setHeaderLabel:", v4);

    -[OBHeaderView headerLabel](self, "headerLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView headerLabel](self, "headerLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView headerLabel](self, "headerLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[OBHeaderView _updateHeaderLabelFont](self, "_updateHeaderLabelFont");
    -[OBHeaderView headerLabel](self, "headerLabel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 0);

  }
}

- (void)setAllowFullWidthIcon:(BOOL)a3
{
  self->_allowFullWidthIcon = a3;
  -[OBHeaderView _insertAndLayoutImageViewIfNeeded](self, "_insertAndLayoutImageViewIfNeeded");
}

- (void)setIconInheritsTint:(BOOL)a3
{
  self->_iconInheritsTint = a3;
  -[OBHeaderView tintColorDidChange](self, "tintColorDidChange");
}

- (void)setIcon:(id)a3 accessibilityLabel:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  if (*(_OWORD *)&self->_animationView == 0)
  {
    -[OBHeaderView imageView](self, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[OBHeaderView _createImageView:](self, "_createImageView:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView setImageView:](self, "setImageView:", v17);

      -[OBHeaderView _insertAndLayoutImageViewIfNeeded](self, "_insertAndLayoutImageViewIfNeeded");
    }
    -[OBHeaderView imageView](self, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentMode:", 1);

    -[OBHeaderView imageView](self, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:", v6);

    -[OBHeaderView setOriginalIconImage:](self, "setOriginalIconImage:", v6);
    v20 = objc_msgSend(v7, "length") != 0;
    -[OBHeaderView imageView](self, "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIsAccessibilityElement:", v20);

    -[OBHeaderView imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAccessibilityLabel:", v7);

    self->_usingSymbolImage = 0;
  }
  else
  {
    _OBLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[OBHeaderView setIcon:accessibilityLabel:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)setSymbol:(id)a3 accessibilityLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[OBHeaderView symbolConfiguration](self, "symbolConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView _symbolIconForHeaderStyle:configuration:](self, "_symbolIconForHeaderStyle:configuration:", v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[OBHeaderView setIcon:accessibilityLabel:](self, "setIcon:accessibilityLabel:", v9, v6);
  self->_usingSymbolImage = 1;

}

- (id)title
{
  void *v2;
  void *v3;

  -[OBHeaderView headerLabel](self, "headerLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[OBHeaderView headerLabel](self, "headerLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

  }
}

- (void)setTitleTrailingSymbol:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OBHeaderView headerLabel](self, "headerLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleTrailingSymbol:", v4);

}

- (void)setDetailText:(id)a3
{
  id v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[OBHeaderView _createDetailLabelIfNeeded](self, "_createDetailLabelIfNeeded");
    -[OBHeaderView detailLabel](self, "detailLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v4);

  }
}

- (void)setLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[OBHeaderView headerLabel](self, "headerLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_defaultAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("NSLanguage"));
  -[OBHeaderView headerLabel](self, "headerLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setDefaultAttributes:", v7);

  -[OBHeaderView detailLabel](self, "detailLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_defaultAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v4, CFSTR("NSLanguage"));
  -[OBHeaderView detailLabel](self, "detailLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setDefaultAttributes:", v12);

}

- (void)setDetailedTextHeader:(id)a3 detailedTextBody:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      v8 = -[OBHeaderView _createDetailLabelIfNeeded](self, "_createDetailLabelIfNeeded");
      -[OBHeaderView detailLabel](self, "detailLabel");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDetailedTextHeader:detailedTextBody:", v7, v6);

    }
  }
}

- (void)setSubtitleText:(id)a3
{
  void *v4;
  OBTemplateLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[OBHeaderView subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(OBTemplateLabel);
    -[OBHeaderView setSubtitleLabel:](self, "setSubtitleLabel:", v5);

    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBHeaderView _subtitleFont](self, "_subtitleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 0);

    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView addSubview:](self, "addSubview:", v12);

  }
  v13 = objc_msgSend(v16, "length");
  -[OBHeaderView subtitleLabel](self, "subtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v14, "setText:", v16);

  }
  else
  {
    objc_msgSend(v14, "removeFromSuperview");

    -[OBHeaderView setSubtitleLabel:](self, "setSubtitleLabel:", 0);
  }
  -[OBHeaderView _updateConstraintsForDetailLabel](self, "_updateConstraintsForDetailLabel");
  -[OBHeaderView _updateConstraintsForSubtitle](self, "_updateConstraintsForSubtitle");

}

- (void)addAccessoryButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[OBHeaderView detailLabel](self, "detailLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("Accessory button is not supported with no detail text.");
    goto LABEL_6;
  }
  -[OBHeaderView accessoryButton](self, "accessoryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("Only one accessory button is supported.");
LABEL_6:
    objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  -[OBHeaderView setAccessoryButton:](self, "setAccessoryButton:", v4);
  v7 = -[OBHeaderView underlineLinks](self, "underlineLinks");
  -[OBHeaderView accessoryButton](self, "accessoryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUnderlineLinks:", v7);

  -[OBHeaderView addSubview:](self, "addSubview:", v4);
  -[OBHeaderView _updateConstraintsForDetailLabel](self, "_updateConstraintsForDetailLabel");
  v22 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView leadingAnchor](self, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v24;
  objc_msgSend(v4, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView trailingAnchor](self, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(v4, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView centerXAnchor](self, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v13;
  objc_msgSend(v4, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView bottomAnchor](self, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v17);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBHeaderView;
  -[OBHeaderView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  -[OBHeaderView _updateHeaderLabelFont](self, "_updateHeaderLabelFont");
  -[OBHeaderView _subtitleFont](self, "_subtitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[OBHeaderView _detailFont](self, "_detailFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView detailLabel](self, "detailLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OBHeaderView;
  -[OBHeaderView tintColorDidChange](&v10, sel_tintColorDidChange);
  if (-[OBHeaderView iconInheritsTint](self, "iconInheritsTint"))
  {
    -[OBHeaderView tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (self->_usingSymbolImage)
      {
        -[OBHeaderView originalIconImage](self, "originalIconImage");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBHeaderView tintColor](self, "tintColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        -[OBHeaderView imageView](self, "imageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setImage:", v6);
      }
      else
      {
        -[OBHeaderView imageView](self, "imageView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBHeaderView originalIconImage](self, "originalIconImage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBHeaderView tintColor](self, "tintColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_flatImageWithColor:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setImage:", v9);

      }
    }
  }
}

- (void)setTitleStyle:(unint64_t)a3
{
  -[OBHeaderView setHeaderStyle:](self, "setHeaderStyle:", a3);
  -[OBHeaderView _updateHeaderLabelFont](self, "_updateHeaderLabelFont");
}

- (id)headerFont
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[OBHeaderView _headerFontOverride](self, "_headerFontOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[OBHeaderView _headerTextStyle](self, "_headerTextStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC1358];
    -[OBHeaderView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontWithDescriptor:size:", v11, 0.0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setTitleHyphenationFactor:(float)a3
{
  double v4;
  id v5;

  -[OBHeaderView headerLabel](self, "headerLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "_setHyphenationFactor:", v4);

}

- (void)removeDetailLabel
{
  void *v3;

  -[OBHeaderView detailLabel](self, "detailLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[OBHeaderView _updateConstraintsForDetailLabel](self, "_updateConstraintsForDetailLabel");
}

- (void)removeAccessoryButton
{
  void *v3;

  -[OBHeaderView accessoryButton](self, "accessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[OBHeaderView _updateConstraintsForDetailLabel](self, "_updateConstraintsForDetailLabel");
}

- (void)setIconAccessibilityIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OBHeaderView imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

}

- (void)setTitleAccessibilityIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OBHeaderView headerLabel](self, "headerLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

}

- (void)setDetailTextAccessibilityIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OBHeaderView detailLabel](self, "detailLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

}

- (void)_updateHeaderLabelFont
{
  void *v3;
  id v4;

  -[OBHeaderView headerFont](self, "headerFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView headerLabel](self, "headerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (id)_subtitleFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0DC1350];
  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = *MEMORY[0x1E0DC4A90];
  -[OBHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_detailFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0DC1350];
  v3 = (void *)MEMORY[0x1E0DC1358];
  v4 = *MEMORY[0x1E0DC4A88];
  -[OBHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createImageView:(id)a3
{
  id v4;
  OBImageView *v5;
  uint64_t v6;

  v4 = a3;
  -[OBHeaderView setOriginalIconImage:](self, "setOriginalIconImage:", v4);
  v5 = -[OBImageView initWithImage:]([OBImageView alloc], "initWithImage:", v4);

  -[OBImageView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (self->_usingSymbolImage)
    v6 = 4;
  else
    v6 = 1;
  -[OBImageView setContentMode:](v5, "setContentMode:", v6);
  return v5;
}

- (void)_insertAndLayoutImageViewIfNeeded
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  UIView *v9;
  UIView *topAssetContainer;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  -[OBHeaderView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBHeaderView iconHeight](self, "iconHeight");
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[OBHeaderView imageViewConstraints](self, "imageViewConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    if (!self->_topAssetContainer)
    {
      v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v9 = (UIView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      topAssetContainer = self->_topAssetContainer;
      self->_topAssetContainer = v9;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topAssetContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[OBHeaderView topAssetContainer](self, "topAssetContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView addSubview:](self, "addSubview:", v11);

    }
    -[OBHeaderView imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView addSubview:](self, "addSubview:", v12);

    -[OBHeaderView imageView](self, "imageView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v40;
    -[OBHeaderView centerXAnchor](self, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v15;
    -[OBHeaderView imageView](self, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v21, "mutableCopy");

    LODWORD(v16) = -[OBHeaderView allowFullWidthIcon](self, "allowFullWidthIcon");
    -[OBHeaderView imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((_DWORD)v16)
    {
      objc_msgSend(v22, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView topAssetContainer](self, "topAssetContainer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v45;
      objc_msgSend(v45, "addObject:", v27);

      -[OBHeaderView imageView](self, "imageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView topAssetContainer](self, "topAssetContainer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObject:", v32);

    }
    else
    {
      objc_msgSend(v22, "widthAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToConstant:", v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v45;
      objc_msgSend(v45, "addObject:", v30);
    }

    -[OBHeaderView imageView](self, "imageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView iconHeight](self, "iconHeight");
    objc_msgSend(v34, "constraintEqualToConstant:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v35);

    v36 = (void *)objc_msgSend(v28, "copy");
    -[OBHeaderView setImageViewConstraints:](self, "setImageViewConstraints:", v36);

    v37 = (void *)MEMORY[0x1E0CB3718];
    -[OBHeaderView imageViewConstraints](self, "imageViewConstraints");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v38);

  }
  -[OBHeaderView _layoutTopAssetContainer](self, "_layoutTopAssetContainer");
}

- (void)_layoutTopAssetContainer
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[7];

  v38[5] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[OBHeaderView topAssetContainerConstraints](self, "topAssetContainerConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  -[OBHeaderView topAssetContainer](self, "topAssetContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[OBHeaderView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v32 = objc_claimAutoreleasedReturnValue();
    -[OBHeaderView topPadding](self, "topPadding");
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v32, -v8);
    v30 = objc_claimAutoreleasedReturnValue();
    v38[0] = v30;
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView leadingAnchor](self, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v33;
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView trailingAnchor](self, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v26;
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView iconHeight](self, "iconHeight");
    objc_msgSend(v9, "constraintLessThanOrEqualToConstant:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v10;
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView headerLabel](self, "headerLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView iconToHeaderLabelPadding](self, "iconToHeaderLabelPadding");
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView setTopAssetContainerConstraints:](self, "setTopAssetContainerConstraints:", v17);

    v18 = (void *)v30;
    v19 = v28;

    v20 = (void *)v32;
    v21 = v34;

    v3 = 0x1E0CB3000;
  }
  else
  {
    -[OBHeaderView headerLabel](self, "headerLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView topPadding](self, "topPadding");
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v20, -v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView setTopAssetContainerConstraints:](self, "setTopAssetContainerConstraints:", v19);
  }

  v23 = *(void **)(v3 + 1816);
  -[OBHeaderView topAssetContainerConstraints](self, "topAssetContainerConstraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v24);

}

- (id)_createDetailLabelIfNeeded
{
  void *v3;
  OBTemplateHeaderDetailLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[OBHeaderView detailLabel](self, "detailLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(OBTemplateHeaderDetailLabel);
    -[OBHeaderView setDetailLabel:](self, "setDetailLabel:", v4);

    -[OBHeaderView detailLabel](self, "detailLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView detailLabel](self, "detailLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView detailLabel](self, "detailLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[OBHeaderView _detailFont](self, "_detailFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView detailLabel](self, "detailLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[OBHeaderView detailLabel](self, "detailLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 0);

    -[OBHeaderView detailLabel](self, "detailLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView addSubview:](self, "addSubview:", v13);

    -[OBHeaderView _updateConstraintsForDetailLabel](self, "_updateConstraintsForDetailLabel");
  }
  return -[OBHeaderView detailLabel](self, "detailLabel");
}

- (void)_updateConstraintsForDetailLabel
{
  void *v3;
  void *v4;
  OBHeaderView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  -[OBHeaderView detailLabelConstraints](self, "detailLabelConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBHeaderView removeConstraints:](self, "removeConstraints:", v3);

  -[OBHeaderView detailLabel](self, "detailLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (OBHeaderView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[OBHeaderView headerLabelToDetailAndSubtitleLabelPadding](self, "headerLabelToDetailAndSubtitleLabelPadding");
    v12 = v11;
    -[OBHeaderView accessoryButton](self, "accessoryButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -v12;
    if (v13)
    {
      -[OBHeaderView detailLabel](self, "detailLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView accessoryButton](self, "accessoryButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, v14);
      v19 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[OBHeaderView bottomAnchor](self, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView detailLabel](self, "detailLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView bottomPadding](self, "bottomPadding");
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
      v19 = objc_claimAutoreleasedReturnValue();
    }

    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[OBHeaderView headerLabel](self, "headerLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[OBHeaderView leftAnchor](self, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView detailLabel](self, "detailLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v31;
    -[OBHeaderView rightAnchor](self, "rightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView detailLabel](self, "detailLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v27;
    objc_msgSend(v7, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView detailLabel](self, "detailLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v21, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v22;
    v33[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v6 = (void *)v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView setDetailLabelConstraints:](self, "setDetailLabelConstraints:", v23);

  }
  else
  {
    -[OBHeaderView bottomAnchor](self, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView headerLabel](self, "headerLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView bottomPadding](self, "bottomPadding");
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView setDetailLabelConstraints:](self, "setDetailLabelConstraints:", v10);
  }

  v24 = (void *)MEMORY[0x1E0CB3718];
  -[OBHeaderView detailLabelConstraints](self, "detailLabelConstraints");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v25);

}

- (void)_updateConstraintsForSubtitle
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  -[OBHeaderView subtitleLabel](self, "subtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBHeaderView subtitleLabelConstraints](self, "subtitleLabelConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView removeConstraints:](self, "removeConstraints:", v4);

    -[OBHeaderView headerLabelToDetailAndSubtitleLabelPadding](self, "headerLabelToDetailAndSubtitleLabelPadding");
    v6 = v5;
    -[OBHeaderView detailLabel](self, "detailLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[OBHeaderView subtitleLabel](self, "subtitleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView detailLabel](self, "detailLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[OBHeaderView accessoryButton](self, "accessoryButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[OBHeaderView bottomAnchor](self, "bottomAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBHeaderView subtitleLabel](self, "subtitleLabel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bottomAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBHeaderView bottomPadding](self, "bottomPadding");
        objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = -v6;
        goto LABEL_7;
      }
      -[OBHeaderView subtitleLabel](self, "subtitleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView accessoryButton](self, "accessoryButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;
    objc_msgSend(v10, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -v6;
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

LABEL_7:
    v30 = (void *)v15;
    -[OBHeaderView leftAnchor](self, "leftAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v32;
    -[OBHeaderView rightAnchor](self, "rightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v18;
    -[OBHeaderView headerLabel](self, "headerLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView subtitleLabel](self, "subtitleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v23;
    v36[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView setSubtitleLabelConstraints:](self, "setSubtitleLabelConstraints:", v24);

    v25 = (void *)MEMORY[0x1E0CB3718];
    -[OBHeaderView subtitleLabelConstraints](self, "subtitleLabelConstraints");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v26);

  }
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
  -[OBHeaderView _updateHeaderLabelFont](self, "_updateHeaderLabelFont");
  -[OBHeaderView _insertAndLayoutImageViewIfNeeded](self, "_insertAndLayoutImageViewIfNeeded");
}

- (double)topPadding
{
  return 0.0;
}

- (double)iconToHeaderLabelPadding
{
  return 20.0;
}

- (double)headerLabelToDetailAndSubtitleLabelPadding
{
  void *v2;
  uint64_t v3;
  double result;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "templateType");

  result = 0.0;
  if ((unint64_t)(v3 - 1) <= 9)
    return dbl_19A01F248[v3 - 1];
  return result;
}

- (double)detailLabelToAccessoryButtonPadding
{
  void *v2;
  uint64_t v3;
  double result;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "templateType");

  result = 0.0;
  if ((unint64_t)(v3 - 1) <= 9)
    return dbl_19A01F248[v3 - 1];
  return result;
}

- (double)bottomPadding
{
  return 0.0;
}

- (double)iconHeight
{
  double result;

  if (-[OBHeaderView templateType](self, "templateType") - 1 > 2)
    return 80.0;
  -[OBHeaderView _setupAssistantIconHeight](self, "_setupAssistantIconHeight");
  return result;
}

- (double)_setupAssistantIconHeight
{
  void *v2;
  uint64_t v3;
  double result;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "templateType");

  result = 0.0;
  if ((unint64_t)(v3 - 1) <= 9)
    return dbl_19A01F298[v3 - 1];
  return result;
}

- (id)symbolConfiguration
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "templateType");

  v4 = 0.0;
  if ((unint64_t)(v3 - 1) <= 9)
    v4 = dbl_19A01F2E8[v3 - 1];
  v5 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithFont:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_symbolIconForHeaderStyle:(id)a3 configuration:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = a4;
  objc_msgSend(v5, "_systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_animateDetailLabelAlpha:(double)a3 duration:(double)a4
{
  _QWORD v4[6];
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__OBHeaderView__animateDetailLabelAlpha_duration___block_invoke;
  v5[3] = &unk_1E37AAAF8;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__OBHeaderView__animateDetailLabelAlpha_duration___block_invoke_2;
  v4[3] = &unk_1E37AAB20;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, a4);
}

void __50__OBHeaderView__animateDetailLabelAlpha_duration___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "detailLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __50__OBHeaderView__animateDetailLabelAlpha_duration___block_invoke_2(uint64_t a1)
{
  _BOOL8 v1;
  id v2;

  v1 = *(double *)(a1 + 40) == 0.0;
  objc_msgSend(*(id *)(a1 + 32), "detailLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", v1);

}

- (OBAnimationView)animationView
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  OBAnimationView *v12;
  OBAnimationView *animationView;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  OBAnimationView *v20;
  double v21;
  OBAnimationView *v22;
  OBAnimationView *v23;
  void *v24;
  OBAnimationView *v25;
  void *v26;

  -[OBHeaderView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    _OBLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[OBHeaderView animationView].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = 0;
    return v12;
  }
  if (self->_customIconContainerView)
    goto LABEL_4;
  animationView = self->_animationView;
  if (!animationView)
  {
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v17 = (void *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[OBHeaderView setTopAssetContainer:](self, "setTopAssetContainer:", v17);

      -[OBHeaderView topAssetContainer](self, "topAssetContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[OBHeaderView topAssetContainer](self, "topAssetContainer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView addSubview:](self, "addSubview:", v19);

    }
    v20 = [OBAnimationView alloc];
    -[OBHeaderView iconHeight](self, "iconHeight");
    v22 = -[OBAnimationView initWithFrame:](v20, "initWithFrame:", 0.0, 0.0, 0.0, v21);
    v23 = self->_animationView;
    self->_animationView = v22;

    -[OBAnimationView setTranslatesAutoresizingMaskIntoConstraints:](self->_animationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", self->_animationView);

    -[OBHeaderView _layoutTopAssetContainer](self, "_layoutTopAssetContainer");
    v25 = self->_animationView;
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView ob_pinToEdges:](v25, "ob_pinToEdges:", v26);

    animationView = self->_animationView;
  }
  v12 = animationView;
  return v12;
}

- (UIView)customIconContainerView
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIView *v12;
  UIView *customIconContainerView;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIView *v30;
  void *v31;

  -[OBHeaderView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    _OBLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[OBHeaderView customIconContainerView].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = 0;
    return v12;
  }
  if (self->_animationView)
    goto LABEL_4;
  customIconContainerView = self->_customIconContainerView;
  if (!customIconContainerView)
  {
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = *MEMORY[0x1E0C9D648];
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v16 = *MEMORY[0x1E0C9D648];
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v21 = (void *)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E0C9D648], v17, v18, v19);
      -[OBHeaderView setTopAssetContainer:](self, "setTopAssetContainer:", v21);

      -[OBHeaderView topAssetContainer](self, "topAssetContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[OBHeaderView topAssetContainer](self, "topAssetContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView addSubview:](self, "addSubview:", v23);

    }
    v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v16, v17, v18, v19);
    v25 = self->_customIconContainerView;
    self->_customIconContainerView = v24;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_customIconContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](self->_customIconContainerView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMasksToBounds:", 1);

    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", self->_customIconContainerView);

    -[OBHeaderView _layoutTopAssetContainer](self, "_layoutTopAssetContainer");
    -[UIView heightAnchor](self->_customIconContainerView, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBHeaderView iconHeight](self, "iconHeight");
    objc_msgSend(v28, "constraintEqualToConstant:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    v30 = self->_customIconContainerView;
    -[OBHeaderView topAssetContainer](self, "topAssetContainer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView ob_pinToEdges:](v30, "ob_pinToEdges:", v31);

    customIconContainerView = self->_customIconContainerView;
  }
  v12 = customIconContainerView;
  return v12;
}

- (id)_headerFontOverride
{
  return 0;
}

- (id)_headerTextStyle
{
  unint64_t v3;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v11;

  v3 = -[OBHeaderView templateType](self, "templateType");
  v4 = (id *)MEMORY[0x1E0DC4AE8];
  if (v3 - 2 < 2)
  {
    v9 = (void *)*MEMORY[0x1E0DC4AE8];
LABEL_8:
    v5 = v9;
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    v9 = (void *)*MEMORY[0x1E0DC4B50];
    goto LABEL_8;
  }
  if (v3)
  {
    v5 = 0;
  }
  else
  {
    v5 = (id)*MEMORY[0x1E0DC4AE8];
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "templateType");

    if (v7 == 5)
    {
      v8 = (id)*MEMORY[0x1E0DC4B50];

      v5 = v8;
    }
  }
LABEL_10:
  if (v5 == *v4
    && -[OBHeaderView headerStyle](self, "headerStyle")
    && -[OBHeaderView headerStyle](self, "headerStyle") == 1)
  {
    v11 = (id)*MEMORY[0x1E0DC4B50];

    v5 = v11;
  }
  return v5;
}

- (BOOL)iconInheritsTint
{
  return self->_iconInheritsTint;
}

- (BOOL)allowFullWidthIcon
{
  return self->_allowFullWidthIcon;
}

- (void)setAnimationView:(id)a3
{
  objc_storeStrong((id *)&self->_animationView, a3);
}

- (void)setCustomIconContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_customIconContainerView, a3);
}

- (OBImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)topAssetContainer
{
  return self->_topAssetContainer;
}

- (void)setTopAssetContainer:(id)a3
{
  objc_storeStrong((id *)&self->_topAssetContainer, a3);
}

- (NSArray)topAssetContainerConstraints
{
  return self->_topAssetContainerConstraints;
}

- (void)setTopAssetContainerConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_topAssetContainerConstraints, a3);
}

- (OBTemplateLabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (OBTemplateLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (OBTemplateHeaderDetailLabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (NSArray)imageViewConstraints
{
  return self->_imageViewConstraints;
}

- (void)setImageViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewConstraints, a3);
}

- (NSArray)detailLabelConstraints
{
  return self->_detailLabelConstraints;
}

- (void)setDetailLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabelConstraints, a3);
}

- (NSArray)subtitleLabelConstraints
{
  return self->_subtitleLabelConstraints;
}

- (void)setSubtitleLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabelConstraints, a3);
}

- (OBHeaderAccessoryButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (UIImage)originalIconImage
{
  return self->_originalIconImage;
}

- (void)setOriginalIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_originalIconImage, a3);
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (unint64_t)headerStyle
{
  return self->_headerStyle;
}

- (void)setHeaderStyle:(unint64_t)a3
{
  self->_headerStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalIconImage, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabelConstraints, 0);
  objc_storeStrong((id *)&self->_imageViewConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_topAssetContainerConstraints, 0);
  objc_storeStrong((id *)&self->_topAssetContainer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_customIconContainerView, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
}

- (void)setIcon:(uint64_t)a3 accessibilityLabel:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_199FE5000, a1, a3, "Cannot have an Icon when you already have a custom icon container or an animation view set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)animationView
{
  OUTLINED_FUNCTION_0(&dword_199FE5000, a1, a3, "Cannot have an animation view when you already have an Icon/Symbol or a custom icon container view set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)customIconContainerView
{
  OUTLINED_FUNCTION_0(&dword_199FE5000, a1, a3, "Cannot have an custom icon container when you already have an Icon/Symbol or an animation view set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
