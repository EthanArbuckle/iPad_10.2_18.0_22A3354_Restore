@implementation BKLibraryBookshelfBookHeaderMetrics

+ (id)sectionName
{
  return CFSTR("bookHeader");
}

- (void)configureWithSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "floatForKey:", CFSTR("top-margin"));
  -[BKLibraryBookshelfBookHeaderMetrics setTopMargin:](self, "setTopMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("bottom-margin"));
  -[BKLibraryBookshelfBookHeaderMetrics setBottomMargin:](self, "setBottomMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("section-header-height"));
  -[BKLibraryBookshelfBookHeaderMetrics setSectionHeaderHeight:](self, "setSectionHeaderHeight:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("header")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesForAttributedStringCentered:truncated:", 0, 1));
  -[BKLibraryBookshelfBookHeaderMetrics setHeaderFontAttributes:](self, "setHeaderFontAttributes:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("largeHeader")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesForAttributedStringCentered:truncated:", 0, 1));
  -[BKLibraryBookshelfBookHeaderMetrics setLargeHeaderFontAttributes:](self, "setLargeHeaderFontAttributes:", v7);

}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[BKLibraryBookshelfBookHeaderMetrics topMargin](self, "topMargin");
  v4 = v3;
  -[BKLibraryBookshelfBookHeaderMetrics bottomMargin](self, "bottomMargin");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BKLibraryBookshelfBookHeaderMetrics: topMargin: %f, bottomMargin: %f"), v4, v5);
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (void)setSectionHeaderHeight:(double)a3
{
  self->_sectionHeaderHeight = a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (TUIFontAttributes)headerFontAttributes
{
  return self->_headerFontAttributes;
}

- (void)setHeaderFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TUIFontAttributes)largeHeaderFontAttributes
{
  return self->_largeHeaderFontAttributes;
}

- (void)setLargeHeaderFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeHeaderFontAttributes, 0);
  objc_storeStrong((id *)&self->_headerFontAttributes, 0);
}

@end
