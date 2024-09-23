@implementation VSFontCenter

- (VSFontCenter)init
{
  return -[VSFontCenter initWithTraitEnvironment:](self, "initWithTraitEnvironment:", 0);
}

- (VSFontCenter)initWithTraitEnvironment:(id)a3
{
  id v4;
  VSFontCenter *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSFontCenter;
  v5 = -[VSFontCenter init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
      objc_msgSend(v6, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v5->_traitEnvironment, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);
      v7 = 0;
    }

    -[VSFontCenter setTraitCollection:](v5, "setTraitCollection:", v7);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!self->_traitCollection)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)VSFontCenter;
  -[VSFontCenter dealloc](&v4, sel_dealloc);
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[VSFontCenter _updateFontsWithTraitCollection:](self, "_updateFontsWithTraitCollection:", 0);
}

- (void)_updateFontsWithTraitCollection:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
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
  id v18;

  v4 = (void *)MEMORY[0x24BDF6A70];
  v5 = *MEMORY[0x24BDF7840];
  v6 = a3;
  objc_msgSend(v4, "preferredFontForTextStyle:compatibleWithTraitCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setTitle0Font:](self, "setTitle0Font:", v7);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF7848], v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setTitle1Font:](self, "setTitle1Font:", v8);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF7850], v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setTitle2Font:](self, "setTitle2Font:", v9);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF7858], v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setTitle3Font:](self, "setTitle3Font:", v10);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77E8], v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setHeadlineFont:](self, "setHeadlineFont:", v11);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF7810], v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setSubheadlineFont:](self, "setSubheadlineFont:", v12);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77B0], v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setBodyFont:](self, "setBodyFont:", v13);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77B8], v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setCalloutFont:](self, "setCalloutFont:", v14);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77D0], v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setFootnoteFont:](self, "setFootnoteFont:", v15);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77C0], v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setCaption1Font:](self, "setCaption1Font:", v16);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77C8], v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSFontCenter setCaption2Font:](self, "setCaption2Font:", v17);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BDF7868]);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[VSFontCenter setAppAgeRatingFont:](self, "setAppAgeRatingFont:", v18);

}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v4;
  UITraitCollection *traitCollection;
  id v6;

  v6 = a3;
  v4 = (UITraitCollection *)objc_msgSend(v6, "copy");
  traitCollection = self->_traitCollection;
  self->_traitCollection = v4;

  -[VSFontCenter _updateFontsWithTraitCollection:](self, "_updateFontsWithTraitCollection:", v6);
}

- (UITraitEnvironment)traitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_traitEnvironment);
}

- (void)setTraitEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_traitEnvironment, a3);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIFont)title0Font
{
  return self->_title0Font;
}

- (void)setTitle0Font:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIFont)title1Font
{
  return self->_title1Font;
}

- (void)setTitle1Font:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIFont)title2Font
{
  return self->_title2Font;
}

- (void)setTitle2Font:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIFont)title3Font
{
  return self->_title3Font;
}

- (void)setTitle3Font:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIFont)headlineFont
{
  return self->_headlineFont;
}

- (void)setHeadlineFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIFont)subheadlineFont
{
  return self->_subheadlineFont;
}

- (void)setSubheadlineFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIFont)bodyFont
{
  return self->_bodyFont;
}

- (void)setBodyFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIFont)calloutFont
{
  return self->_calloutFont;
}

- (void)setCalloutFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIFont)footnoteFont
{
  return self->_footnoteFont;
}

- (void)setFootnoteFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIFont)caption1Font
{
  return self->_caption1Font;
}

- (void)setCaption1Font:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIFont)caption2Font
{
  return self->_caption2Font;
}

- (void)setCaption2Font:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIFont)appAgeRatingFont
{
  return self->_appAgeRatingFont;
}

- (void)setAppAgeRatingFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAgeRatingFont, 0);
  objc_storeStrong((id *)&self->_caption2Font, 0);
  objc_storeStrong((id *)&self->_caption1Font, 0);
  objc_storeStrong((id *)&self->_footnoteFont, 0);
  objc_storeStrong((id *)&self->_calloutFont, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_subheadlineFont, 0);
  objc_storeStrong((id *)&self->_headlineFont, 0);
  objc_storeStrong((id *)&self->_title3Font, 0);
  objc_storeStrong((id *)&self->_title2Font, 0);
  objc_storeStrong((id *)&self->_title1Font, 0);
  objc_storeStrong((id *)&self->_title0Font, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_traitEnvironment);
}

@end
