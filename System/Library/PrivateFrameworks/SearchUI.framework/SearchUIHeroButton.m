@implementation SearchUIHeroButton

- (SearchUIHeroButton)initWithTitle:(id)a3 image:(id)a4 command:(id)a5
{
  id v7;
  id v8;
  SearchUIHeroButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIHeroButton;
  v9 = -[SearchUIHeroButton init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImagePlacement:", 1);
    objc_msgSend(v10, "setContentInsets:", 8.0, 4.0, 11.0, 4.0);
    objc_msgSend(v10, "setImagePadding:", 2.0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B60], 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreferredSymbolConfigurationForImage:", v11);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v10, "background");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCustomView:", v12);

    objc_msgSend(v10, "background");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 8.0);

    -[SearchUIHeroButton setConfiguration:](v9, "setConfiguration:", v10);
    -[SearchUIHeroButton updateWithTitle:image:](v9, "updateWithTitle:image:", v7, v8);

  }
  return v9;
}

- (void)updateWithTitle:(id)a3 image:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0DC1290];
  v9 = a4;
  objc_msgSend(v8, "defaultParagraphStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setAlignment:", 1);
  if (v7)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    v16[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4A98], TLKSnippetModernizationEnabled() ^ 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = *MEMORY[0x1E0DC1178];
    v17[0] = v10;
    v17[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "initWithString:attributes:", v7, v4);
  }
  else
  {
    v13 = 0;
  }
  -[SearchUIHeroButton configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributedTitle:", v13);

  if (v7)
  {

  }
  -[SearchUIHeroButton configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v9);

  -[SearchUIHeroButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  -[SearchUIHeroButton setTitle:forState:](self, "setTitle:forState:", v7, 0);
  -[SearchUIHeroButton setImage:forState:](self, "setImage:forState:", v9, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIHeroButton;
  -[SearchUIHeroButton traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUIHeroButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUIHeroButton tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUIHeroButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIHeroButton;
  -[SearchUIHeroButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIHeroButton tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIHeroButton;
  v4 = a3;
  -[SearchUIHeroButton tlk_updateForAppearance:](&v9, sel_tlk_updateForAppearance_, v4);
  v5 = (void *)MEMORY[0x1E0DBD910];
  v6 = objc_msgSend(v4, "isDark", v9.receiver, v9.super_class);

  objc_msgSend(v5, "appearanceWithStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroButton setTintColor:](self, "setTintColor:", v8);

}

- (SFButtonItem)buttonItem
{
  return (SFButtonItem *)objc_getProperty(self, a2, 752, 1);
}

- (void)setButtonItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->buttonItem, 0);
}

@end
