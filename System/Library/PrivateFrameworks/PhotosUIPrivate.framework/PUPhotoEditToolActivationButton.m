@implementation PUPhotoEditToolActivationButton

- (id)baseConfiguration
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerStyle:", 2);
  objc_msgSend(v3, "setTitle:", self->_title);
  objc_msgSend(v3, "setImagePadding:", 3.0);
  objc_msgSend(v3, "setButtonSize:", 2);
  objc_msgSend(v3, "setTitleLineBreakMode:", 4);
  return v3;
}

- (id)imageConfigurationForSelectedState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v3 = a3;
  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v7 = 5;
  else
    v7 = 4;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3888];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationWithHierarchicalColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationWithPaletteColors:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationByApplyingConfiguration:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (UIButtonConfiguration)selectedConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  _QWORD v23[4];
  id v24;

  -[PUPhotoEditToolActivationButton baseConfiguration](self, "baseConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v3, "setBackground:", v5);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__PUPhotoEditToolActivationButton_selectedConfiguration__block_invoke;
  v23[3] = &unk_1E58A6508;
  v7 = v4;
  v24 = v7;
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", v23);
  objc_msgSend(v3, "contentInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PUPhotoEditToolActivationButton selectedGlyphName](self, "selectedGlyphName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PUPhotoEditToolActivationButton imageConfigurationForSelectedState:](self, "imageConfigurationForSelectedState:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0DC3870];
    -[PUPhotoEditToolActivationButton selectedGlyphName](self, "selectedGlyphName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "systemImageNamed:withConfiguration:", v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v20);

    v21 = v11 + -6.0;
  }
  else
  {
    v21 = v11 + -5.0;
  }
  objc_msgSend(v3, "setContentInsets:", v9, v21, v13, v15 + -5.0);

  return (UIButtonConfiguration *)v3;
}

- (UIButtonConfiguration)unselectedConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  _QWORD v24[4];
  id v25;

  -[PUPhotoEditToolActivationButton baseConfiguration](self, "baseConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeColor:", v7);

  objc_msgSend(v5, "setStrokeWidth:", 1.0);
  objc_msgSend(v3, "setBackground:", v5);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__PUPhotoEditToolActivationButton_unselectedConfiguration__block_invoke;
  v24[3] = &unk_1E58A6508;
  v8 = v4;
  v25 = v8;
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", v24);
  objc_msgSend(v3, "contentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PUPhotoEditToolActivationButton unselectedGlyphName](self, "unselectedGlyphName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PUPhotoEditToolActivationButton imageConfigurationForSelectedState:](self, "imageConfigurationForSelectedState:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0DC3870];
    -[PUPhotoEditToolActivationButton unselectedGlyphName](self, "unselectedGlyphName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "systemImageNamed:withConfiguration:", v20, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v21);

    v22 = v12 + -6.0;
  }
  else
  {
    v22 = v12 + -5.0;
  }
  objc_msgSend(v3, "setContentInsets:", v10, v22, v14, v16 + -5.0);

  return (UIButtonConfiguration *)v3;
}

- (void)updateConfiguration
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  if ((-[PUPhotoEditToolActivationButton isSelected](self, "isSelected") & 1) != 0)
    -[PUPhotoEditToolActivationButton selectedConfiguration](self, "selectedConfiguration");
  else
    -[PUPhotoEditToolActivationButton unselectedConfiguration](self, "unselectedConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolActivationButton overrideButtonConfiguration](self, "overrideButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPhotoEditToolActivationButton overrideButtonConfiguration](self, "overrideButtonConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  else
  {
    v5 = v6;
  }
  v7 = v5;
  -[PUPhotoEditToolActivationButton setConfiguration:](self, "setConfiguration:", v5);

}

- (void)buttonTouchUpAction:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t (**v8)(id, PUPhotoEditToolActivationButton *);

  -[PUPhotoEditToolActivationButton isSelectedBlock](self, "isSelectedBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[PUPhotoEditToolActivationButton setSelected:](self, "setSelected:", -[PUPhotoEditToolActivationButton isSelected](self, "isSelected") ^ 1);
  -[PUPhotoEditToolActivationButton actionBlock](self, "actionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUPhotoEditToolActivationButton actionBlock](self, "actionBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PUPhotoEditToolActivationButton *))v6)[2](v6, self);

  }
  -[PUPhotoEditToolActivationButton isSelectedBlock](self, "isSelectedBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PUPhotoEditToolActivationButton isSelectedBlock](self, "isSelectedBlock");
    v8 = (uint64_t (**)(id, PUPhotoEditToolActivationButton *))objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditToolActivationButton setSelected:](self, "setSelected:", v8[2](v8, self));

  }
}

- (void)setSelectedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphName, a3);
  -[PUPhotoEditToolActivationButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setUnselectedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedGlyphName, a3);
  -[PUPhotoEditToolActivationButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  -[PUPhotoEditToolActivationButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setOverrideButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_overrideButtonConfiguration, a3);
  -[PUPhotoEditToolActivationButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (NSString)title
{
  return self->_title;
}

- (NSString)unselectedGlyphName
{
  return self->_unselectedGlyphName;
}

- (NSString)selectedGlyphName
{
  return self->_selectedGlyphName;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 792);
}

- (UIButtonConfiguration)overrideButtonConfiguration
{
  return self->_overrideButtonConfiguration;
}

- (id)isSelectedBlock
{
  return self->_isSelectedBlock;
}

- (void)setIsSelectedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isSelectedBlock, 0);
  objc_storeStrong((id *)&self->_overrideButtonConfiguration, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_selectedGlyphName, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

id __58__PUPhotoEditToolActivationButton_unselectedConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1140]);

  objc_msgSend(*(id *)(a1 + 32), "topToolbarToolButtonFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1138]);

  return v3;
}

id __56__PUPhotoEditToolActivationButton_selectedConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1140]);

  objc_msgSend(*(id *)(a1 + 32), "topToolbarToolButtonFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1138]);

  return v3;
}

+ (id)buttonWithTitle:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditToolActivationButton buttonWithConfiguration:primaryAction:](PUPhotoEditToolActivationButton, "buttonWithConfiguration:primaryAction:", v4, 0);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7BB50], "configurationWithCursorEffect:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPx_configuration:", v6);

  objc_msgSend(v5, "setAutomaticallyUpdatesConfiguration:", 1);
  v7 = (void *)v5[96];
  v5[96] = v3;
  v8 = v3;

  objc_msgSend(v5, "addTarget:action:forControlEvents:", v5, sel_buttonTouchUpAction_, 64);
  objc_msgSend(v5, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 23.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v5;
}

@end
