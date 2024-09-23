@implementation PUPhotoEditToolbarButton

- (id)baseConfiguration
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonSize:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseBackgroundColor:", v4);

  objc_msgSend(v3, "setTitleLineBreakMode:", 4);
  objc_msgSend(v3, "contentInsets");
  v6 = v5;
  v8 = v7;
  -[PUPhotoEditToolbarButton photoEditSpec](self, "photoEditSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "shouldUseCompactToolbarSpacing"))
    v10 = 3.0;
  else
    v10 = 9.0;

  objc_msgSend(v3, "setContentInsets:", v6, v10, v8, v10);
  -[PUPhotoEditToolbarButton toolLabel](self, "toolLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "contentInsets");
    objc_msgSend(v3, "setContentInsets:");
  }
  return v3;
}

- (id)imageConfigurationForSelectedState:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3888];
  if (-[PUPhotoEditToolbarButton isTopToolbarButton](self, "isTopToolbarButton"))
    objc_msgSend(v5, "topToolbarToolButtonGlyphSize");
  else
    objc_msgSend(v5, "editToolbarButtonSize");
  objc_msgSend(v6, "configurationWithPointSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton selectedColor](self, "selectedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    if (-[PUPhotoEditToolbarButton selectedGlyphHasHighlightColor](self, "selectedGlyphHasHighlightColor"))
      objc_msgSend(v5, "photoEditingToolbarMainButtonColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  if (-[PUPhotoEditToolbarButton isEnabled](self, "isEnabled")
    && -[PUPhotoEditToolbarButton available](self, "available"))
  {
    if (a3)
    {
      v13 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v15 = -[PUPhotoEditToolbarButton usesHierarchicalColor](self, "usesHierarchicalColor");
  v16 = (void *)MEMORY[0x1E0DC3888];
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithHierarchicalColor:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithPaletteColors:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "configurationByApplyingConfiguration:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "configurationByApplyingConfiguration:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)selectedConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PUPhotoEditToolbarButton baseConfiguration](self, "baseConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton imageConfigurationForSelectedState:](self, "imageConfigurationForSelectedState:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3870];
  -[PUPhotoEditToolbarButton selectedGlyphName](self, "selectedGlyphName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    -[PUPhotoEditToolbarButton unselectedGlyphName](self, "unselectedGlyphName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "_systemImageNamed:withConfiguration:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v8);

  if (!v6)
  return v3;
}

- (id)unselectedConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PUPhotoEditToolbarButton baseConfiguration](self, "baseConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton unselectedGlyphName](self, "unselectedGlyphName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUPhotoEditToolbarButton imageConfigurationForSelectedState:](self, "imageConfigurationForSelectedState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3870];
    -[PUPhotoEditToolbarButton unselectedGlyphName](self, "unselectedGlyphName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_systemImageNamed:withConfiguration:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v8);

  }
  return v3;
}

- (void)updateConfiguration
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  id v9;

  if ((-[PUPhotoEditToolbarButton isSelected](self, "isSelected") & 1) != 0)
    -[PUPhotoEditToolbarButton selectedConfiguration](self, "selectedConfiguration");
  else
    -[PUPhotoEditToolbarButton unselectedConfiguration](self, "unselectedConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolbarButton toolLabel](self, "toolLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_14;
  if (-[PUPhotoEditToolbarButton isEnabled](self, "isEnabled")
    && -[PUPhotoEditToolbarButton available](self, "available"))
  {
    if (-[PUPhotoEditToolbarButton isSelected](self, "isSelected"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      v6 = 0;
      v7 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v6 = 0;
      v5 = 1;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v5 = 0;
    v6 = 1;
  }
  -[PUPhotoEditToolbarButton toolLabel](self, "toolLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v4);

  if (!v6)
  {
    if (!v5)
      goto LABEL_12;
LABEL_16:

    if (!v7)
      goto LABEL_14;
    goto LABEL_13;
  }

  if (v5)
    goto LABEL_16;
LABEL_12:
  if (v7)
LABEL_13:

LABEL_14:
  -[PUPhotoEditToolbarButton setConfiguration:](self, "setConfiguration:", v9);

}

- (void)buttonTouchUpAction:(id)a3
{
  void *v4;
  void (**v5)(id, PUPhotoEditToolbarButton *);

  -[PUPhotoEditToolbarButton actionBlock](self, "actionBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUPhotoEditToolbarButton actionBlock](self, "actionBlock");
    v5 = (void (**)(id, PUPhotoEditToolbarButton *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditToolbarButton;
  -[PUPhotoEditToolbarButton setSelected:](&v7, sel_setSelected_);
  v5 = (double)v3;
  -[PUPhotoEditToolbarButton selectionIndicator](self, "selectionIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
  -[PUPhotoEditToolbarButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (id)imageForState:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[PUPhotoEditToolbarButton imageView](self, "imageView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)largeContentImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUPhotoEditToolbarButton imageConfigurationForSelectedState:](self, "imageConfigurationForSelectedState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3870];
  -[PUPhotoEditToolbarButton unselectedGlyphName](self, "unselectedGlyphName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_systemImageNamed:withConfiguration:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (UILabel)toolLabel
{
  return self->_toolLabel;
}

- (void)setToolLabel:(id)a3
{
  objc_storeStrong((id *)&self->_toolLabel, a3);
}

- (BOOL)isTopToolbarButton
{
  return self->_isTopToolbarButton;
}

- (void)setIsTopToolbarButton:(BOOL)a3
{
  self->_isTopToolbarButton = a3;
}

- (BOOL)selectedGlyphHasHighlightColor
{
  return self->_selectedGlyphHasHighlightColor;
}

- (void)setSelectedGlyphHasHighlightColor:(BOOL)a3
{
  self->_selectedGlyphHasHighlightColor = a3;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
}

- (BOOL)available
{
  return self->_available;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)unselectedGlyphName
{
  return self->_unselectedGlyphName;
}

- (void)setUnselectedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedGlyphName, a3);
}

- (NSString)selectedGlyphName
{
  return self->_selectedGlyphName;
}

- (void)setSelectedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphName, a3);
}

- (UIImageView)selectionIndicator
{
  return self->_selectionIndicator;
}

- (void)setSelectionIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionIndicator, a3);
}

- (BOOL)usesHierarchicalColor
{
  return self->_usesHierarchicalColor;
}

- (void)setUsesHierarchicalColor:(BOOL)a3
{
  self->_usesHierarchicalColor = a3;
}

- (int64_t)selectionIndicatorType
{
  return self->_selectionIndicatorType;
}

- (void)setSelectionIndicatorType:(int64_t)a3
{
  self->_selectionIndicatorType = a3;
}

- (PUPhotoEditViewControllerSpec)photoEditSpec
{
  return self->_photoEditSpec;
}

- (void)setPhotoEditSpec:(id)a3
{
  objc_storeStrong((id *)&self->_photoEditSpec, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoEditSpec, 0);
  objc_storeStrong((id *)&self->_selectionIndicator, 0);
  objc_storeStrong((id *)&self->_selectedGlyphName, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_toolLabel, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

+ (id)buttonForTool:(id)a3 showingLabel:(BOOL)a4 selectionIndicatorType:(int64_t)a5 spec:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[3];

  v8 = a4;
  v41[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditToolbarButton buttonWithConfiguration:primaryAction:](PUPhotoEditToolbarButton, "buttonWithConfiguration:primaryAction:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPhotoEditSpec:", v10);

  objc_msgSend(MEMORY[0x1E0D7BB50], "configurationWithCursorEffect:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPx_configuration:", v13);

  objc_msgSend(v12, "setAutomaticallyUpdatesConfiguration:", 0);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "localizedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v14);

  objc_msgSend(v12, "setAvailable:", objc_msgSend(v9, "enabled"));
  objc_msgSend(v9, "toolbarIconGlyphName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUnselectedGlyphName:", v15);

  objc_msgSend(v9, "selectedToolbarIconGlyphName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectedGlyphName:", v16);

  objc_msgSend(v12, "setUsesHierarchicalColor:", objc_msgSend(v9, "toolbarGlyphUsesHierarchicalColor"));
  objc_msgSend(v12, "setSelectionIndicatorType:", a5);
  objc_msgSend(v12, "setPointerInteractionEnabled:", 1);
  objc_msgSend(v9, "toolbarIconAccessibilityLabel");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v9, "toolbarIconAccessibilityLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      objc_msgSend(v9, "toolbarIconAccessibilityLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessibilityLabel:", v21);

    }
  }
  objc_msgSend(v12, "setTag:", objc_msgSend(v9, "toolControllerTag"));
  if (v8)
  {
    objc_msgSend(v12, "setShowsLargeContentViewer:", 1);
    v22 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    objc_msgSend(v12, "addInteraction:", v22);

  }
  objc_msgSend(v12, "updateConfiguration");
  if (a5)
  {
    +[PUPhotoEditToolbarButton selectionIndicatorImageForType:](PUPhotoEditToolbarButton, "selectionIndicatorImageForType:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v23);
    objc_msgSend(v12, "setSelectionIndicator:", v24);
    objc_msgSend(v24, "setAlpha:", 0.0);
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "addSubview:", v24);
    objc_msgSend(v12, "imageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditToolbarButton constraintsForSelectionIndicatorType:buttonImageView:selectionIndicator:](PUPhotoEditToolbarButton, "constraintsForSelectionIndicatorType:buttonImageView:selectionIndicator:", a5, v25, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addConstraints:", v26);

  }
  objc_msgSend(v12, "addTarget:action:forControlEvents:", v12, sel_buttonTouchUpAction_, 64);
  if (v8)
  {
    v27 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v11, "photoEditingToolbarButtonCompactFont");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v28);

    objc_msgSend(v9, "localizedName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v29);

    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "setToolLabel:", v27);
    objc_msgSend(v12, "addSubview:", v27);
    objc_msgSend(v27, "firstBaselineAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v30, 12.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v31;
    objc_msgSend(v27, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = v11;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addConstraints:", v36);

    v11 = v34;
  }

  return v12;
}

+ (id)buttonWithImageNamed:(id)a3 selectedImageNamed:(id)a4 accessibilityLabel:(id)a5 spec:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a5;
  v10 = (void *)MEMORY[0x1E0DC3520];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "plainButtonConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditToolbarButton buttonWithConfiguration:primaryAction:](PUPhotoEditToolbarButton, "buttonWithConfiguration:primaryAction:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPhotoEditSpec:", v11);

  objc_msgSend(v15, "setIsTopToolbarButton:", 1);
  objc_msgSend(MEMORY[0x1E0D7BB50], "configurationWithCursorEffect:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPx_configuration:", v16);

  objc_msgSend(v15, "setAutomaticallyUpdatesConfiguration:", 0);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "setAvailable:", 1);
  objc_msgSend(v15, "setUnselectedGlyphName:", v13);

  objc_msgSend(v15, "setSelectedGlyphName:", v12);
  objc_msgSend(v15, "setUsesHierarchicalColor:", 0);
  objc_msgSend(v15, "setPointerInteractionEnabled:", 1);
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v15, "setAccessibilityLabel:", v9);
  objc_msgSend(v15, "updateConfiguration");
  objc_msgSend(v15, "addTarget:action:forControlEvents:", v15, sel_buttonTouchUpAction_, 64);

  return v15;
}

+ (id)selectionIndicatorImageForType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", off_1E589C6C8[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)constraintsForSelectionIndicatorType:(int64_t)a3 buttonImageView:(id)a4 selectionIndicator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  switch(a3)
  {
    case 3:
      objc_msgSend(v8, "centerYAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      objc_msgSend(v9, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leftAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -4.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v15;
      v16 = v19;
      break;
    case 2:
      objc_msgSend(v8, "centerYAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      objc_msgSend(v9, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leftAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -4.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v15;
      v16 = v20;
      break;
    case 1:
      objc_msgSend(v8, "centerXAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centerXAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      objc_msgSend(v9, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -5.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v15;
      v16 = v21;
      break;
    default:
      v17 = 0;
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v17;
}

@end
