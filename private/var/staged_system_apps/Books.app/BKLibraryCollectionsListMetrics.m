@implementation BKLibraryCollectionsListMetrics

+ (id)sectionName
{
  return CFSTR("collectionsList");
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
  id v38;

  v4 = a3;
  -[BKLibraryCollectionsListMetrics setDarkAppearance:](self, "setDarkAppearance:", objc_msgSend(v4, "BOOLForKey:", CFSTR("dark-appearance")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("popover-background-color")));
  -[BKLibraryCollectionsListMetrics setPopoverBackgroundColor:](self, "setPopoverBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("table-background-color")));
  -[BKLibraryCollectionsListMetrics setTableBackgroundColor:](self, "setTableBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("table-separator-color")));
  -[BKLibraryCollectionsListMetrics setTableSeparatorColor:](self, "setTableSeparatorColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("table-cell-selected-background-color")));
  -[BKLibraryCollectionsListMetrics setTableCellSelectedBackgroundColor:](self, "setTableCellSelectedBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("delete-action-color")));
  -[BKLibraryCollectionsListMetrics setDeleteActionColor:](self, "setDeleteActionColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("hide-action-color")));
  -[BKLibraryCollectionsListMetrics setHideActionColor:](self, "setHideActionColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("chevron-name")));
  -[BKLibraryCollectionsListMetrics setChevronName:](self, "setChevronName:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("chevron-font-spec")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributesForAttributedString"));
  -[BKLibraryCollectionsListMetrics setChevronFontAttributes:](self, "setChevronFontAttributes:", v13);

  objc_msgSend(v4, "sizeForKey:", CFSTR("icon-size"));
  -[BKLibraryCollectionsListMetrics setCollectionIconSize:](self, "setCollectionIconSize:");
  objc_msgSend(v4, "floatForKey:", CFSTR("glyph-point-size"));
  -[BKLibraryCollectionsListMetrics setCollectionGlyphPointSize:](self, "setCollectionGlyphPointSize:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icon-color-finished")));
  -[BKLibraryCollectionsListMetrics setCollectionIconColor_Finished:](self, "setCollectionIconColor_Finished:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icon-color-want-to-read")));
  -[BKLibraryCollectionsListMetrics setCollectionIconColor_WantToRead:](self, "setCollectionIconColor_WantToRead:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icon-color-books")));
  -[BKLibraryCollectionsListMetrics setCollectionIconColor_Books:](self, "setCollectionIconColor_Books:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icon-color-audiobooks")));
  -[BKLibraryCollectionsListMetrics setCollectionIconColor_Audiobooks:](self, "setCollectionIconColor_Audiobooks:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icon-color-pdfs")));
  -[BKLibraryCollectionsListMetrics setCollectionIconColor_PDFs:](self, "setCollectionIconColor_PDFs:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icon-color-downloaded")));
  -[BKLibraryCollectionsListMetrics setCollectionIconColor_Downloaded:](self, "setCollectionIconColor_Downloaded:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icon-color-user")));
  -[BKLibraryCollectionsListMetrics setCollectionIconColor_User:](self, "setCollectionIconColor_User:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("icon-color-add")));
  -[BKLibraryCollectionsListMetrics setCollectionIconColor_Add:](self, "setCollectionIconColor_Add:", v21);

  objc_msgSend(v4, "floatForKey:", CFSTR("icon-dimmed-alpha"));
  -[BKLibraryCollectionsListMetrics setCollectionIconDimmedAlpha:](self, "setCollectionIconDimmedAlpha:");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-books")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_Books:](self, "setCollectionIconName_Books:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-samples")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_Samples:](self, "setCollectionIconName_Samples:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-pdfs")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_PDFs:](self, "setCollectionIconName_PDFs:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-audiobooks")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_Audiobooks:](self, "setCollectionIconName_Audiobooks:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-downloaded")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_Downloaded:](self, "setCollectionIconName_Downloaded:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-finished")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_Finished:](self, "setCollectionIconName_Finished:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-want-to-read")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_WantToRead:](self, "setCollectionIconName_WantToRead:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-user")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_User:](self, "setCollectionIconName_User:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("icon-name-add")));
  -[BKLibraryCollectionsListMetrics setCollectionIconName_Add:](self, "setCollectionIconName_Add:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("tableCellNormalText")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "attributesForAttributedString"));
  -[BKLibraryCollectionsListMetrics setTableCellNormalTextFontAttributes:](self, "setTableCellNormalTextFontAttributes:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("tableCellDimmedText")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "attributesForAttributedString"));
  -[BKLibraryCollectionsListMetrics setTableCellDimmedTextFontAttributes:](self, "setTableCellDimmedTextFontAttributes:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("tableCellDetailNormalText")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "attributesForAttributedString"));
  -[BKLibraryCollectionsListMetrics setTableCellDetailNormalTextFontAttributes:](self, "setTableCellDetailNormalTextFontAttributes:", v36);

  v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("tableCellDetailDimmedText")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "attributesForAttributedString"));
  -[BKLibraryCollectionsListMetrics setTableCellDetailDimmedTextFontAttributes:](self, "setTableCellDetailDimmedTextFontAttributes:", v37);

}

- (BOOL)darkAppearance
{
  return self->_darkAppearance;
}

- (void)setDarkAppearance:(BOOL)a3
{
  self->_darkAppearance = a3;
}

- (UIColor)popoverBackgroundColor
{
  return self->_popoverBackgroundColor;
}

- (void)setPopoverBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_popoverBackgroundColor, a3);
}

- (UIColor)tableBackgroundColor
{
  return self->_tableBackgroundColor;
}

- (void)setTableBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableBackgroundColor, a3);
}

- (UIColor)tableSeparatorColor
{
  return self->_tableSeparatorColor;
}

- (void)setTableSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableSeparatorColor, a3);
}

- (UIColor)tableCellSelectedBackgroundColor
{
  return self->_tableCellSelectedBackgroundColor;
}

- (void)setTableCellSelectedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableCellSelectedBackgroundColor, a3);
}

- (UIColor)deleteActionColor
{
  return self->_deleteActionColor;
}

- (void)setDeleteActionColor:(id)a3
{
  objc_storeStrong((id *)&self->_deleteActionColor, a3);
}

- (UIColor)hideActionColor
{
  return self->_hideActionColor;
}

- (void)setHideActionColor:(id)a3
{
  objc_storeStrong((id *)&self->_hideActionColor, a3);
}

- (TUIFontAttributes)tableCellNormalTextFontAttributes
{
  return self->_tableCellNormalTextFontAttributes;
}

- (void)setTableCellNormalTextFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TUIFontAttributes)tableCellDimmedTextFontAttributes
{
  return self->_tableCellDimmedTextFontAttributes;
}

- (void)setTableCellDimmedTextFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TUIFontAttributes)tableCellDetailNormalTextFontAttributes
{
  return self->_tableCellDetailNormalTextFontAttributes;
}

- (void)setTableCellDetailNormalTextFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (TUIFontAttributes)tableCellDetailDimmedTextFontAttributes
{
  return self->_tableCellDetailDimmedTextFontAttributes;
}

- (void)setTableCellDetailDimmedTextFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)chevronName
{
  return self->_chevronName;
}

- (void)setChevronName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (TUIFontAttributes)chevronFontAttributes
{
  return self->_chevronFontAttributes;
}

- (void)setChevronFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CGSize)collectionIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_collectionIconSize.width;
  height = self->_collectionIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCollectionIconSize:(CGSize)a3
{
  self->_collectionIconSize = a3;
}

- (double)collectionGlyphPointSize
{
  return self->_collectionGlyphPointSize;
}

- (void)setCollectionGlyphPointSize:(double)a3
{
  self->_collectionGlyphPointSize = a3;
}

- (UIColor)collectionIconColor_WantToRead
{
  return self->_collectionIconColor_WantToRead;
}

- (void)setCollectionIconColor_WantToRead:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIconColor_WantToRead, a3);
}

- (UIColor)collectionIconColor_Finished
{
  return self->_collectionIconColor_Finished;
}

- (void)setCollectionIconColor_Finished:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIconColor_Finished, a3);
}

- (UIColor)collectionIconColor_Books
{
  return self->_collectionIconColor_Books;
}

- (void)setCollectionIconColor_Books:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIconColor_Books, a3);
}

- (UIColor)collectionIconColor_Audiobooks
{
  return self->_collectionIconColor_Audiobooks;
}

- (void)setCollectionIconColor_Audiobooks:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIconColor_Audiobooks, a3);
}

- (UIColor)collectionIconColor_PDFs
{
  return self->_collectionIconColor_PDFs;
}

- (void)setCollectionIconColor_PDFs:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIconColor_PDFs, a3);
}

- (UIColor)collectionIconColor_Downloaded
{
  return self->_collectionIconColor_Downloaded;
}

- (void)setCollectionIconColor_Downloaded:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIconColor_Downloaded, a3);
}

- (UIColor)collectionIconColor_User
{
  return self->_collectionIconColor_User;
}

- (void)setCollectionIconColor_User:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIconColor_User, a3);
}

- (UIColor)collectionIconColor_Add
{
  return self->_collectionIconColor_Add;
}

- (void)setCollectionIconColor_Add:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIconColor_Add, a3);
}

- (double)collectionIconDimmedAlpha
{
  return self->_collectionIconDimmedAlpha;
}

- (void)setCollectionIconDimmedAlpha:(double)a3
{
  self->_collectionIconDimmedAlpha = a3;
}

- (NSString)collectionIconName_WantToRead
{
  return self->_collectionIconName_WantToRead;
}

- (void)setCollectionIconName_WantToRead:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)collectionIconName_Finished
{
  return self->_collectionIconName_Finished;
}

- (void)setCollectionIconName_Finished:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)collectionIconName_Books
{
  return self->_collectionIconName_Books;
}

- (void)setCollectionIconName_Books:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)collectionIconName_Samples
{
  return self->_collectionIconName_Samples;
}

- (void)setCollectionIconName_Samples:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)collectionIconName_Audiobooks
{
  return self->_collectionIconName_Audiobooks;
}

- (void)setCollectionIconName_Audiobooks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)collectionIconName_PDFs
{
  return self->_collectionIconName_PDFs;
}

- (void)setCollectionIconName_PDFs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)collectionIconName_Downloaded
{
  return self->_collectionIconName_Downloaded;
}

- (void)setCollectionIconName_Downloaded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)collectionIconName_User
{
  return self->_collectionIconName_User;
}

- (void)setCollectionIconName_User:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)collectionIconName_Add
{
  return self->_collectionIconName_Add;
}

- (void)setCollectionIconName_Add:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIconName_Add, 0);
  objc_storeStrong((id *)&self->_collectionIconName_User, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Downloaded, 0);
  objc_storeStrong((id *)&self->_collectionIconName_PDFs, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Audiobooks, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Samples, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Books, 0);
  objc_storeStrong((id *)&self->_collectionIconName_Finished, 0);
  objc_storeStrong((id *)&self->_collectionIconName_WantToRead, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Add, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_User, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Downloaded, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_PDFs, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Audiobooks, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Books, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_Finished, 0);
  objc_storeStrong((id *)&self->_collectionIconColor_WantToRead, 0);
  objc_storeStrong((id *)&self->_chevronFontAttributes, 0);
  objc_storeStrong((id *)&self->_chevronName, 0);
  objc_storeStrong((id *)&self->_tableCellDetailDimmedTextFontAttributes, 0);
  objc_storeStrong((id *)&self->_tableCellDetailNormalTextFontAttributes, 0);
  objc_storeStrong((id *)&self->_tableCellDimmedTextFontAttributes, 0);
  objc_storeStrong((id *)&self->_tableCellNormalTextFontAttributes, 0);
  objc_storeStrong((id *)&self->_hideActionColor, 0);
  objc_storeStrong((id *)&self->_deleteActionColor, 0);
  objc_storeStrong((id *)&self->_tableCellSelectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tableSeparatorColor, 0);
  objc_storeStrong((id *)&self->_tableBackgroundColor, 0);
  objc_storeStrong((id *)&self->_popoverBackgroundColor, 0);
}

@end
