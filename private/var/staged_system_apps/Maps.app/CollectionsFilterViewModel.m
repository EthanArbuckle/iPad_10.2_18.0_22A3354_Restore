@implementation CollectionsFilterViewModel

- (CollectionsFilterViewModel)initWithFilter:(id)a3 isDarkMode:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  CollectionsFilterViewModel *v8;
  CollectionsFilterViewModel *v9;
  objc_super v11;

  v4 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CollectionsFilterViewModel;
  v8 = -[CollectionsFilterViewModel init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filterTitle, a3);
    -[CollectionsFilterViewModel switchToUnSelectedIsDarkMode:](v9, "switchToUnSelectedIsDarkMode:", v4);
  }

  return v9;
}

- (CollectionsFilterViewModel)initWithKeywordFilter:(id)a3 isDarkMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CollectionsFilterViewModel *v9;
  GEOPublisherViewResultFilterKeyword *keywordFilter;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchSuggestion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayString"));
  v9 = -[CollectionsFilterViewModel initWithFilter:isDarkMode:](self, "initWithFilter:isDarkMode:", v8, v4);

  keywordFilter = v9->_keywordFilter;
  v9->_keywordFilter = (GEOPublisherViewResultFilterKeyword *)v6;

  return v9;
}

- (CollectionsFilterViewModel)initWithAddressFilter:(id)a3 isDarkMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CollectionsFilterViewModel *v8;
  GEOPublisherViewResultFilterAddress *addressFilter;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayString"));
  v8 = -[CollectionsFilterViewModel initWithFilter:isDarkMode:](self, "initWithFilter:isDarkMode:", v7, v4);

  addressFilter = v8->_addressFilter;
  v8->_addressFilter = (GEOPublisherViewResultFilterAddress *)v6;

  return v8;
}

- (CollectionsFilterViewModel)initWithAllCollectionsKeywordFilter:(id)a3 isDarkMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CollectionsFilterViewModel *v9;
  GEOAllCollectionsViewResultFilterTypeKeyword *allCollectionsKeywordFilter;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchSuggestion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayString"));
  v9 = -[CollectionsFilterViewModel initWithFilter:isDarkMode:](self, "initWithFilter:isDarkMode:", v8, v4);

  allCollectionsKeywordFilter = v9->_allCollectionsKeywordFilter;
  v9->_allCollectionsKeywordFilter = (GEOAllCollectionsViewResultFilterTypeKeyword *)v6;

  return v9;
}

- (CollectionsFilterViewModel)initWithAllCollectionsAddressFilter:(id)a3 isDarkMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CollectionsFilterViewModel *v8;
  GEOAllCollectionsViewResultFilterTypeAddress *allCollectionsAddressFilter;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayString"));
  v8 = -[CollectionsFilterViewModel initWithFilter:isDarkMode:](self, "initWithFilter:isDarkMode:", v7, v4);

  allCollectionsAddressFilter = v8->_allCollectionsAddressFilter;
  v8->_allCollectionsAddressFilter = (GEOAllCollectionsViewResultFilterTypeAddress *)v6;

  return v8;
}

- (CollectionsFilterViewModel)initWithGuidesHomeConceptFilter:(id)a3 isDarkMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CollectionsFilterViewModel *v9;
  GEOGuidesHomeResultFilterTypeConcept *conceptFilter;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchSuggestion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayString"));
  v9 = -[CollectionsFilterViewModel initWithFilter:isDarkMode:](self, "initWithFilter:isDarkMode:", v8, v4);

  conceptFilter = v9->_conceptFilter;
  v9->_conceptFilter = (GEOGuidesHomeResultFilterTypeConcept *)v6;

  return v9;
}

- (void)modelSelected:(BOOL)a3 isDarkMode:(BOOL)a4
{
  self->_selected = a3;
  if (a3)
    -[CollectionsFilterViewModel switchToSelectedIsDarkMode:](self, "switchToSelectedIsDarkMode:", a4);
  else
    -[CollectionsFilterViewModel switchToUnSelectedIsDarkMode:](self, "switchToUnSelectedIsDarkMode:", a4);
}

- (void)switchToSelectedIsDarkMode:(BOOL)a3
{
  UIColor *v5;
  UIColor *textColor;
  UIColor *v7;
  UIColor *backgroundColor;
  UIColor *v9;
  UIColor *selectedBackgroundColor;
  const UIFontTextStyle *v11;
  UIColor *v12;
  UIColor *v13;
  UIColor *v14;
  UIColor *v15;
  UIColor *v16;
  UIColor *v17;
  UIColor *v18;
  UIFont *v19;
  UIFont *filterFont;

  if (MapsFeature_IsEnabled_Maps269(self, a2))
  {
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    textColor = self->_textColor;
    self->_textColor = v5;

    v7 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v7;

    v9 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
    selectedBackgroundColor = self->_selectedBackgroundColor;
    self->_selectedBackgroundColor = v9;

    v11 = &UIFontTextStyleSubheadline;
  }
  else
  {
    v12 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v13 = self->_textColor;
    self->_textColor = v12;

    v14 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    v15 = v14;
    if (a3)
    {
      v16 = (UIColor *)objc_claimAutoreleasedReturnValue(-[UIColor colorWithAlphaComponent:](v14, "colorWithAlphaComponent:", 0.25));
      v17 = self->_backgroundColor;
      self->_backgroundColor = v16;

    }
    else
    {
      v18 = self->_backgroundColor;
      self->_backgroundColor = v14;
      v15 = v18;
    }

    v11 = &UIFontTextStyleBody;
  }
  v19 = (UIFont *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", *v11));
  filterFont = self->_filterFont;
  self->_filterFont = v19;

}

- (void)switchToUnSelectedIsDarkMode:(BOOL)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;
  const UIFontTextStyle *v11;
  UIColor *textColor;
  UIColor *v13;
  UIColor *backgroundColor;
  UIColor *v15;
  UIColor *selectedBackgroundColor;
  UIFont *v17;
  UIFont *filterFont;

  if (MapsFeature_IsEnabled_Maps269(self, a2))
  {
    if (a3)
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    else
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    textColor = self->_textColor;
    self->_textColor = v5;

    v13 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v13;

    v15 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    selectedBackgroundColor = self->_selectedBackgroundColor;
    self->_selectedBackgroundColor = v15;

    v11 = &UIFontTextStyleSubheadline;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v7 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.7));
    v8 = self->_textColor;
    self->_textColor = v7;

    v9 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    v10 = self->_backgroundColor;
    self->_backgroundColor = v9;

    v11 = &UIFontTextStyleBody;
  }
  v17 = (UIFont *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", *v11));
  filterFont = self->_filterFont;
  self->_filterFont = v17;

}

- (GEOPublisherViewResultFilterKeyword)keywordFilter
{
  return self->_keywordFilter;
}

- (void)setKeywordFilter:(id)a3
{
  objc_storeStrong((id *)&self->_keywordFilter, a3);
}

- (GEOPublisherViewResultFilterAddress)addressFilter
{
  return self->_addressFilter;
}

- (void)setAddressFilter:(id)a3
{
  objc_storeStrong((id *)&self->_addressFilter, a3);
}

- (GEOAllCollectionsViewResultFilterTypeKeyword)allCollectionsKeywordFilter
{
  return self->_allCollectionsKeywordFilter;
}

- (void)setAllCollectionsKeywordFilter:(id)a3
{
  objc_storeStrong((id *)&self->_allCollectionsKeywordFilter, a3);
}

- (GEOAllCollectionsViewResultFilterTypeAddress)allCollectionsAddressFilter
{
  return self->_allCollectionsAddressFilter;
}

- (void)setAllCollectionsAddressFilter:(id)a3
{
  objc_storeStrong((id *)&self->_allCollectionsAddressFilter, a3);
}

- (GEOGuidesHomeResultFilterTypeConcept)conceptFilter
{
  return self->_conceptFilter;
}

- (void)setConceptFilter:(id)a3
{
  objc_storeStrong((id *)&self->_conceptFilter, a3);
}

- (NSString)filterTitle
{
  return self->_filterTitle;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (UIFont)filterFont
{
  return self->_filterFont;
}

- (void)setFilterFont:(id)a3
{
  objc_storeStrong((id *)&self->_filterFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterFont, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_filterTitle, 0);
  objc_storeStrong((id *)&self->_conceptFilter, 0);
  objc_storeStrong((id *)&self->_allCollectionsAddressFilter, 0);
  objc_storeStrong((id *)&self->_allCollectionsKeywordFilter, 0);
  objc_storeStrong((id *)&self->_addressFilter, 0);
  objc_storeStrong((id *)&self->_keywordFilter, 0);
}

@end
