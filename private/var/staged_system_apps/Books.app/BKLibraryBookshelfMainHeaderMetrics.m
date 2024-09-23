@implementation BKLibraryBookshelfMainHeaderMetrics

+ (id)sectionName
{
  return CFSTR("mainHeader");
}

- (void)configureWithSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;

  v4 = a3;
  objc_msgSend(v4, "floatForKey:", CFSTR("title-details-top-margin"));
  -[BKLibraryBookshelfMainHeaderMetrics setTitleDetailsTopMargin:](self, "setTitleDetailsTopMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("title-details-bottom-margin"));
  -[BKLibraryBookshelfMainHeaderMetrics setTitleDetailsBottomMargin:](self, "setTitleDetailsBottomMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("title-details-lines"));
  -[BKLibraryBookshelfMainHeaderMetrics setTitleDetailsMaxLines:](self, "setTitleDetailsMaxLines:");
  objc_msgSend(v4, "floatForKey:", CFSTR("footer-margin"));
  -[BKLibraryBookshelfMainHeaderMetrics setFooterMargin:](self, "setFooterMargin:");
  objc_msgSend(v4, "sizeForKey:", CFSTR("separator-position"));
  -[BKLibraryBookshelfMainHeaderMetrics setSeparatorLinePosition:](self, "setSeparatorLinePosition:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("separator-color")));
  -[BKLibraryBookshelfMainHeaderMetrics setSeparatorLineColor:](self, "setSeparatorLineColor:", v5);

  objc_msgSend(v4, "floatForKey:", CFSTR("reading-list-position"));
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListButtonPosition:](self, "setReadingListButtonPosition:");
  objc_msgSend(v4, "floatForKey:", CFSTR("reading-list-padding"));
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListPadding:](self, "setReadingListPadding:");
  objc_msgSend(v4, "floatForKey:", CFSTR("reading-list-height"));
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListHeight:](self, "setReadingListHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("reading-list-image-spacing"));
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListImageSpacing:](self, "setReadingListImageSpacing:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("reading-list-background-color")));
  -[BKLibraryBookshelfMainHeaderMetrics setReadingBackgroundColor:](self, "setReadingBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("header-background-color")));
  -[BKLibraryBookshelfMainHeaderMetrics setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("reading-list-highlight-color")));
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListHighlightColor:](self, "setReadingListHighlightColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("grid-button-tint-color-on")));
  -[BKLibraryBookshelfMainHeaderMetrics setGridButtonTintColorOn:](self, "setGridButtonTintColorOn:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("grid-button-tint-color-off")));
  -[BKLibraryBookshelfMainHeaderMetrics setGridButtonTintColorOff:](self, "setGridButtonTintColorOff:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("grid-button-background-color-on")));
  -[BKLibraryBookshelfMainHeaderMetrics setGridButtonBackgroundColorOn:](self, "setGridButtonBackgroundColorOn:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("grid-button-background-color-off")));
  -[BKLibraryBookshelfMainHeaderMetrics setGridButtonBackgroundColorOff:](self, "setGridButtonBackgroundColorOff:", v12);

  objc_msgSend(v4, "floatForKey:", CFSTR("nobooks-top-margin"));
  -[BKLibraryBookshelfMainHeaderMetrics setNoBooksDescriptionTopMargin:](self, "setNoBooksDescriptionTopMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("nobooks-spacing"));
  -[BKLibraryBookshelfMainHeaderMetrics setNoBooksDescriptionSpacing:](self, "setNoBooksDescriptionSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("nobooks-description-width"));
  -[BKLibraryBookshelfMainHeaderMetrics setNoBooksDescriptionWidth:](self, "setNoBooksDescriptionWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("sort-header-height"));
  -[BKLibraryBookshelfMainHeaderMetrics setSortHeaderHeight:](self, "setSortHeaderHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("info-header-vertical-margin"));
  -[BKLibraryBookshelfMainHeaderMetrics setCollectionInfoHeaderVerticalMargin:](self, "setCollectionInfoHeaderVerticalMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("sort-button-arrow-margin"));
  -[BKLibraryBookshelfMainHeaderMetrics setSortButtonArrowMargin:](self, "setSortButtonArrowMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("sort-button-spacing"));
  -[BKLibraryBookshelfMainHeaderMetrics setSortButtonSpacing:](self, "setSortButtonSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("sort-title-spacing"));
  -[BKLibraryBookshelfMainHeaderMetrics setSortTitleSpacing:](self, "setSortTitleSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cloud-button-spacing"));
  -[BKLibraryBookshelfMainHeaderMetrics setCloudButtonSpacing:](self, "setCloudButtonSpacing:");
  -[BKLibraryBookshelfMainHeaderMetrics setSortHeaderStacked:](self, "setSortHeaderStacked:", objc_msgSend(v4, "BOOLForKey:", CFSTR("sort-header-stacked")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("reading-list-icon-name")));
  -[BKLibraryBookshelfMainHeaderMetrics setIconName:](self, "setIconName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("reading-list-icon-font-spec")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setIconFontAttributes:](self, "setIconFontAttributes:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("reading-list-chevron-name")));
  -[BKLibraryBookshelfMainHeaderMetrics setChevronName:](self, "setChevronName:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("reading-list-chevron-font-spec")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setChevronFontAttributes:](self, "setChevronFontAttributes:", v18);

  objc_msgSend(v4, "floatForKey:", CFSTR("reading-list-chevron-spacing"));
  -[BKLibraryBookshelfMainHeaderMetrics setChevronSpacing:](self, "setChevronSpacing:");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icloud-button-color")));
  -[BKLibraryBookshelfMainHeaderMetrics setICloudButtonColor:](self, "setICloudButtonColor:", v19);

  objc_msgSend(v4, "floatForKey:", CFSTR("icloud-button-text-inset"));
  -[BKLibraryBookshelfMainHeaderMetrics setICloudButtonInset:](self, "setICloudButtonInset:");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("infoLabel")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "attributesForAttributedStringCentered:truncated:", 1, 1));
  -[BKLibraryBookshelfMainHeaderMetrics setCollectionInfoLabelFontAttributes:](self, "setCollectionInfoLabelFontAttributes:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("cloudButton")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "attributesForAttributedStringCentered:truncated:", 1, 1));
  -[BKLibraryBookshelfMainHeaderMetrics setCloudButtonFontAttributes:](self, "setCloudButtonFontAttributes:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("title")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setTitleFontAttributes:](self, "setTitleFontAttributes:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("largeTitle")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setLargeTitleFontAttributes:](self, "setLargeTitleFontAttributes:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("titleDetails")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setTitleDetailsFontAttributes:](self, "setTitleDetailsFontAttributes:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("titleDetailsPlaceholder")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setTitleDetailsPlaceholderFontAttributes:](self, "setTitleDetailsPlaceholderFontAttributes:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("alternateTitleDetails")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setAlternateTitleDetailsFontAttributes:](self, "setAlternateTitleDetailsFontAttributes:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("footer")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setFooterFontAttributes:](self, "setFooterFontAttributes:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("readingList")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setReadingListButtonFontAttributes:](self, "setReadingListButtonFontAttributes:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("collectionsLabel")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setCollectionsLabelFontAttributes:](self, "setCollectionsLabelFontAttributes:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("editButton")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setEditButtonFontAttributes:](self, "setEditButtonFontAttributes:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("noBooksDescriptionHeader")));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "attributesForAttributedStringCentered:truncated:", 1, 1));
  -[BKLibraryBookshelfMainHeaderMetrics setNoBooksDescriptionHeaderFontAttributes:](self, "setNoBooksDescriptionHeaderFontAttributes:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("noBooksDescription")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "attributesForAttributedStringCentered:truncated:", 1, 0));
  -[BKLibraryBookshelfMainHeaderMetrics setNoBooksDescriptionFontAttributes:](self, "setNoBooksDescriptionFontAttributes:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("sortLabel")));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setSortLabelFontAttributes:](self, "setSortLabelFontAttributes:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("sortPopup")));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "attributesForAttributedStringCentered:truncated:", 0, 1));
  -[BKLibraryBookshelfMainHeaderMetrics setSortPopupFontAttributes:](self, "setSortPopupFontAttributes:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("iCloudButton")));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "attributesForAttributedStringCentered:truncated:", 1, 0));
  -[BKLibraryBookshelfMainHeaderMetrics setICloudButtonFontAttributes:](self, "setICloudButtonFontAttributes:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("iCloudDescription")));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "attributesForAttributedStringCentered:truncated:", 1, 0));
  -[BKLibraryBookshelfMainHeaderMetrics setICloudDescriptionFontAttributes:](self, "setICloudDescriptionFontAttributes:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("iCloudBookStatus")));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setICloudBookStatusFontAttributes:](self, "setICloudBookStatusFontAttributes:", v55);

  v57 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("iCloudBookTitle")));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "attributesForAttributedString"));
  -[BKLibraryBookshelfMainHeaderMetrics setICloudBookTitleFontAttributes:](self, "setICloudBookTitleFontAttributes:", v56);

}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[BKLibraryBookshelfMainHeaderMetrics separatorLinePosition](self, "separatorLinePosition");
  v4 = v3;
  -[BKLibraryBookshelfMainHeaderMetrics separatorLinePosition](self, "separatorLinePosition");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BKLibraryBookshelfMainHeaderMetrics: separatorLinePosition: %f,%f"), v4, v5);
}

- (double)titleDetailsTopMargin
{
  return self->_titleDetailsTopMargin;
}

- (void)setTitleDetailsTopMargin:(double)a3
{
  self->_titleDetailsTopMargin = a3;
}

- (double)titleDetailsBottomMargin
{
  return self->_titleDetailsBottomMargin;
}

- (void)setTitleDetailsBottomMargin:(double)a3
{
  self->_titleDetailsBottomMargin = a3;
}

- (double)footerMargin
{
  return self->_footerMargin;
}

- (void)setFooterMargin:(double)a3
{
  self->_footerMargin = a3;
}

- (CGPoint)separatorLinePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_separatorLinePosition.x;
  y = self->_separatorLinePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSeparatorLinePosition:(CGPoint)a3
{
  self->_separatorLinePosition = a3;
}

- (UIColor)separatorLineColor
{
  return self->_separatorLineColor;
}

- (void)setSeparatorLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLineColor, a3);
}

- (TUIFontAttributes)titleFontAttributes
{
  return self->_titleFontAttributes;
}

- (void)setTitleFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TUIFontAttributes)largeTitleFontAttributes
{
  return self->_largeTitleFontAttributes;
}

- (void)setLargeTitleFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (TUIFontAttributes)titleDetailsFontAttributes
{
  return self->_titleDetailsFontAttributes;
}

- (void)setTitleDetailsFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TUIFontAttributes)titleDetailsPlaceholderFontAttributes
{
  return self->_titleDetailsPlaceholderFontAttributes;
}

- (void)setTitleDetailsPlaceholderFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)titleDetailsMaxLines
{
  return self->_titleDetailsMaxLines;
}

- (void)setTitleDetailsMaxLines:(double)a3
{
  self->_titleDetailsMaxLines = a3;
}

- (TUIFontAttributes)alternateTitleDetailsFontAttributes
{
  return self->_alternateTitleDetailsFontAttributes;
}

- (void)setAlternateTitleDetailsFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (TUIFontAttributes)footerFontAttributes
{
  return self->_footerFontAttributes;
}

- (void)setFooterFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (TUIFontAttributes)readingListButtonFontAttributes
{
  return self->_readingListButtonFontAttributes;
}

- (void)setReadingListButtonFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (TUIFontAttributes)collectionsLabelFontAttributes
{
  return self->_collectionsLabelFontAttributes;
}

- (void)setCollectionsLabelFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (TUIFontAttributes)editButtonFontAttributes
{
  return self->_editButtonFontAttributes;
}

- (void)setEditButtonFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (UIColor)gridButtonTintColorOn
{
  return self->_gridButtonTintColorOn;
}

- (void)setGridButtonTintColorOn:(id)a3
{
  objc_storeStrong((id *)&self->_gridButtonTintColorOn, a3);
}

- (UIColor)gridButtonTintColorOff
{
  return self->_gridButtonTintColorOff;
}

- (void)setGridButtonTintColorOff:(id)a3
{
  objc_storeStrong((id *)&self->_gridButtonTintColorOff, a3);
}

- (UIColor)gridButtonBackgroundColorOn
{
  return self->_gridButtonBackgroundColorOn;
}

- (void)setGridButtonBackgroundColorOn:(id)a3
{
  objc_storeStrong((id *)&self->_gridButtonBackgroundColorOn, a3);
}

- (UIColor)gridButtonBackgroundColorOff
{
  return self->_gridButtonBackgroundColorOff;
}

- (void)setGridButtonBackgroundColorOff:(id)a3
{
  objc_storeStrong((id *)&self->_gridButtonBackgroundColorOff, a3);
}

- (UIColor)headerBackgroundColor
{
  return self->_headerBackgroundColor;
}

- (void)setHeaderBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_headerBackgroundColor, a3);
}

- (UIColor)readingListHighlightColor
{
  return self->_readingListHighlightColor;
}

- (void)setReadingListHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_readingListHighlightColor, a3);
}

- (double)readingListButtonPosition
{
  return self->_readingListButtonPosition;
}

- (void)setReadingListButtonPosition:(double)a3
{
  self->_readingListButtonPosition = a3;
}

- (double)readingListHeight
{
  return self->_readingListHeight;
}

- (void)setReadingListHeight:(double)a3
{
  self->_readingListHeight = a3;
}

- (double)readingListPadding
{
  return self->_readingListPadding;
}

- (void)setReadingListPadding:(double)a3
{
  self->_readingListPadding = a3;
}

- (double)readingListImageSpacing
{
  return self->_readingListImageSpacing;
}

- (void)setReadingListImageSpacing:(double)a3
{
  self->_readingListImageSpacing = a3;
}

- (UIColor)readingBackgroundColor
{
  return self->_readingBackgroundColor;
}

- (void)setReadingBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_readingBackgroundColor, a3);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (TUIFontAttributes)iconFontAttributes
{
  return self->_iconFontAttributes;
}

- (void)setIconFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (double)chevronSpacing
{
  return self->_chevronSpacing;
}

- (void)setChevronSpacing:(double)a3
{
  self->_chevronSpacing = a3;
}

- (NSString)chevronName
{
  return self->_chevronName;
}

- (void)setChevronName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (TUIFontAttributes)chevronFontAttributes
{
  return self->_chevronFontAttributes;
}

- (void)setChevronFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (TUIFontAttributes)noBooksDescriptionHeaderFontAttributes
{
  return self->_noBooksDescriptionHeaderFontAttributes;
}

- (void)setNoBooksDescriptionHeaderFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (TUIFontAttributes)noBooksDescriptionFontAttributes
{
  return self->_noBooksDescriptionFontAttributes;
}

- (void)setNoBooksDescriptionFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (double)noBooksDescriptionTopMargin
{
  return self->_noBooksDescriptionTopMargin;
}

- (void)setNoBooksDescriptionTopMargin:(double)a3
{
  self->_noBooksDescriptionTopMargin = a3;
}

- (double)noBooksDescriptionSpacing
{
  return self->_noBooksDescriptionSpacing;
}

- (void)setNoBooksDescriptionSpacing:(double)a3
{
  self->_noBooksDescriptionSpacing = a3;
}

- (double)noBooksDescriptionWidth
{
  return self->_noBooksDescriptionWidth;
}

- (void)setNoBooksDescriptionWidth:(double)a3
{
  self->_noBooksDescriptionWidth = a3;
}

- (double)collectionInfoHeaderVerticalMargin
{
  return self->_collectionInfoHeaderVerticalMargin;
}

- (void)setCollectionInfoHeaderVerticalMargin:(double)a3
{
  self->_collectionInfoHeaderVerticalMargin = a3;
}

- (double)sortHeaderHeight
{
  return self->_sortHeaderHeight;
}

- (void)setSortHeaderHeight:(double)a3
{
  self->_sortHeaderHeight = a3;
}

- (BOOL)sortHeaderStacked
{
  return self->_sortHeaderStacked;
}

- (void)setSortHeaderStacked:(BOOL)a3
{
  self->_sortHeaderStacked = a3;
}

- (double)sortButtonArrowMargin
{
  return self->_sortButtonArrowMargin;
}

- (void)setSortButtonArrowMargin:(double)a3
{
  self->_sortButtonArrowMargin = a3;
}

- (double)sortButtonSpacing
{
  return self->_sortButtonSpacing;
}

- (void)setSortButtonSpacing:(double)a3
{
  self->_sortButtonSpacing = a3;
}

- (double)sortTitleSpacing
{
  return self->_sortTitleSpacing;
}

- (void)setSortTitleSpacing:(double)a3
{
  self->_sortTitleSpacing = a3;
}

- (TUIFontAttributes)sortLabelFontAttributes
{
  return self->_sortLabelFontAttributes;
}

- (void)setSortLabelFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (TUIFontAttributes)collectionInfoLabelFontAttributes
{
  return self->_collectionInfoLabelFontAttributes;
}

- (void)setCollectionInfoLabelFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (TUIFontAttributes)cloudButtonFontAttributes
{
  return self->_cloudButtonFontAttributes;
}

- (void)setCloudButtonFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (double)cloudButtonSpacing
{
  return self->_cloudButtonSpacing;
}

- (void)setCloudButtonSpacing:(double)a3
{
  self->_cloudButtonSpacing = a3;
}

- (TUIFontAttributes)sortPopupFontAttributes
{
  return self->_sortPopupFontAttributes;
}

- (void)setSortPopupFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (TUIFontAttributes)iCloudButtonFontAttributes
{
  return self->_iCloudButtonFontAttributes;
}

- (void)setICloudButtonFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (TUIFontAttributes)iCloudDescriptionFontAttributes
{
  return self->_iCloudDescriptionFontAttributes;
}

- (void)setICloudDescriptionFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (TUIFontAttributes)iCloudBookStatusFontAttributes
{
  return self->_iCloudBookStatusFontAttributes;
}

- (void)setICloudBookStatusFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (TUIFontAttributes)iCloudBookTitleFontAttributes
{
  return self->_iCloudBookTitleFontAttributes;
}

- (void)setICloudBookTitleFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (UIColor)iCloudButtonColor
{
  return self->_iCloudButtonColor;
}

- (void)setICloudButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudButtonColor, a3);
}

- (double)iCloudButtonInset
{
  return self->_iCloudButtonInset;
}

- (void)setICloudButtonInset:(double)a3
{
  self->_iCloudButtonInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudButtonColor, 0);
  objc_storeStrong((id *)&self->_iCloudBookTitleFontAttributes, 0);
  objc_storeStrong((id *)&self->_iCloudBookStatusFontAttributes, 0);
  objc_storeStrong((id *)&self->_iCloudDescriptionFontAttributes, 0);
  objc_storeStrong((id *)&self->_iCloudButtonFontAttributes, 0);
  objc_storeStrong((id *)&self->_sortPopupFontAttributes, 0);
  objc_storeStrong((id *)&self->_cloudButtonFontAttributes, 0);
  objc_storeStrong((id *)&self->_collectionInfoLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_sortLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_noBooksDescriptionFontAttributes, 0);
  objc_storeStrong((id *)&self->_noBooksDescriptionHeaderFontAttributes, 0);
  objc_storeStrong((id *)&self->_chevronFontAttributes, 0);
  objc_storeStrong((id *)&self->_chevronName, 0);
  objc_storeStrong((id *)&self->_iconFontAttributes, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_readingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_readingListHighlightColor, 0);
  objc_storeStrong((id *)&self->_headerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_gridButtonBackgroundColorOff, 0);
  objc_storeStrong((id *)&self->_gridButtonBackgroundColorOn, 0);
  objc_storeStrong((id *)&self->_gridButtonTintColorOff, 0);
  objc_storeStrong((id *)&self->_gridButtonTintColorOn, 0);
  objc_storeStrong((id *)&self->_editButtonFontAttributes, 0);
  objc_storeStrong((id *)&self->_collectionsLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_readingListButtonFontAttributes, 0);
  objc_storeStrong((id *)&self->_footerFontAttributes, 0);
  objc_storeStrong((id *)&self->_alternateTitleDetailsFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleDetailsPlaceholderFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleDetailsFontAttributes, 0);
  objc_storeStrong((id *)&self->_largeTitleFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleFontAttributes, 0);
  objc_storeStrong((id *)&self->_separatorLineColor, 0);
}

@end
