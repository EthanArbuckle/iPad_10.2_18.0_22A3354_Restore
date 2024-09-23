@implementation BKLibraryBookshelfCellMetrics_List

- (BKLibraryBookshelfCellMetrics_List)init
{
  BKLibraryBookshelfCellMetrics_List *v2;
  BKLibraryBookshelfCellMetrics_List *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCellMetrics_List;
  v2 = -[BKLibraryBookshelfCellMetrics_Grid init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BKLibraryBookshelfCellMetrics setCellType:](v2, "setCellType:", 1);
  return v3;
}

+ (id)sectionName
{
  return CFSTR("bookCellListUser");
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKLibraryBookshelfCellMetrics_List;
  v4 = a3;
  -[BKLibraryBookshelfCellMetrics_Grid configureWithSection:](&v13, "configureWithSection:", v4);
  objc_msgSend(v4, "floatForKey:", CFSTR("cell-height"), v13.receiver, v13.super_class);
  -[BKLibraryBookshelfCellMetrics_List setCellHeight:](self, "setCellHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("small-cell-height"));
  -[BKLibraryBookshelfCellMetrics_List setSmallCellHeight:](self, "setSmallCellHeight:");
  objc_msgSend(v4, "sizeForKey:", CFSTR("cover-size"));
  -[BKLibraryBookshelfCellMetrics_List setCoverSize:](self, "setCoverSize:");
  objc_msgSend(v4, "sizeForKey:", CFSTR("small-cover-size"));
  -[BKLibraryBookshelfCellMetrics_List setSmallCoverSize:](self, "setSmallCoverSize:");
  objc_msgSend(v4, "insetsForKey:", CFSTR("cover-margins"));
  -[BKLibraryBookshelfCellMetrics_List setCoverMargins:](self, "setCoverMargins:");
  objc_msgSend(v4, "insetsForKey:", CFSTR("small-cover-margins"));
  -[BKLibraryBookshelfCellMetrics_List setSmallCoverMargins:](self, "setSmallCoverMargins:");
  objc_msgSend(v4, "floatForKey:", CFSTR("title-spacing"));
  -[BKLibraryBookshelfCellMetrics_List setTitleSpacing:](self, "setTitleSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("author-spacing"));
  -[BKLibraryBookshelfCellMetrics_List setAuthorSpacing:](self, "setAuthorSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("edit-margin"));
  -[BKLibraryBookshelfCellMetrics_List setEditModeMargin:](self, "setEditModeMargin:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("sep-color")));
  -[BKLibraryBookshelfCellMetrics_List setSeparatorColor:](self, "setSeparatorColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("drag-bar-color")));
  -[BKLibraryBookshelfCellMetrics_List setDragBarTintColor:](self, "setDragBarTintColor:", v6);

  -[BKLibraryBookshelfCellMetrics_List setShrinkInEditMode:](self, "setShrinkInEditMode:", objc_msgSend(v4, "BOOLForKey:", CFSTR("edit-mode-shrink")));
  objc_msgSend(v4, "floatForKey:", CFSTR("edit-mode-shrink-amount"));
  -[BKLibraryBookshelfCellMetrics_List setShrinkAmount:](self, "setShrinkAmount:");
  objc_msgSend(v4, "floatForKey:", CFSTR("edit-mode-shrink-alpha"));
  -[BKLibraryBookshelfCellMetrics_List setShrinkAlpha:](self, "setShrinkAlpha:");
  objc_msgSend(v4, "floatForKey:", CFSTR("drag-corner-radius"));
  -[BKLibraryBookshelfCellMetrics_List setDragCornerRadius:](self, "setDragCornerRadius:");
  objc_msgSend(v4, "floatForKey:", CFSTR("drag-shadow-opacity"));
  -[BKLibraryBookshelfCellMetrics_List setDragShadowOpacity:](self, "setDragShadowOpacity:");
  objc_msgSend(v4, "floatForKey:", CFSTR("drag-shadow-radius"));
  -[BKLibraryBookshelfCellMetrics_List setDragShadowRadius:](self, "setDragShadowRadius:");
  objc_msgSend(v4, "floatForKey:", CFSTR("audiobook-control-diameter"));
  -[BKLibraryBookshelfCellMetrics_List setAudiobookControlDiameter:](self, "setAudiobookControlDiameter:");
  objc_msgSend(v4, "floatForKey:", CFSTR("font-scale"));
  -[BKLibraryBookshelfCellMetrics_List setFontScale:](self, "setFontScale:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("titleFont")));
  -[BKLibraryBookshelfCellMetrics_List fontScale](self, "fontScale");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontSpecWithScale:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_List setTitleFontAttributes:](self, "setTitleFontAttributes:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("authorFont")));
  -[BKLibraryBookshelfCellMetrics_List fontScale](self, "fontScale");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontSpecWithScale:"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_List setAuthorFontAttributes:](self, "setAuthorFontAttributes:", v12);

}

- (double)cellHeight
{
  return self->cellHeight;
}

- (void)setCellHeight:(double)a3
{
  self->cellHeight = a3;
}

- (double)smallCellHeight
{
  return self->smallCellHeight;
}

- (void)setSmallCellHeight:(double)a3
{
  self->smallCellHeight = a3;
}

- (BOOL)shrinkInEditMode
{
  return self->shrinkInEditMode;
}

- (void)setShrinkInEditMode:(BOOL)a3
{
  self->shrinkInEditMode = a3;
}

- (double)shrinkAmount
{
  return self->shrinkAmount;
}

- (void)setShrinkAmount:(double)a3
{
  self->shrinkAmount = a3;
}

- (double)shrinkAlpha
{
  return self->shrinkAlpha;
}

- (void)setShrinkAlpha:(double)a3
{
  self->shrinkAlpha = a3;
}

- (double)audiobookControlDiameter
{
  return self->audiobookControlDiameter;
}

- (void)setAudiobookControlDiameter:(double)a3
{
  self->audiobookControlDiameter = a3;
}

- (CGSize)coverSize
{
  double width;
  double height;
  CGSize result;

  width = self->_coverSize.width;
  height = self->_coverSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCoverSize:(CGSize)a3
{
  self->_coverSize = a3;
}

- (CGSize)smallCoverSize
{
  double width;
  double height;
  CGSize result;

  width = self->_smallCoverSize.width;
  height = self->_smallCoverSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSmallCoverSize:(CGSize)a3
{
  self->_smallCoverSize = a3;
}

- (UIEdgeInsets)coverMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_coverMargins.top;
  left = self->_coverMargins.left;
  bottom = self->_coverMargins.bottom;
  right = self->_coverMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCoverMargins:(UIEdgeInsets)a3
{
  self->_coverMargins = a3;
}

- (UIEdgeInsets)smallCoverMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_smallCoverMargins.top;
  left = self->_smallCoverMargins.left;
  bottom = self->_smallCoverMargins.bottom;
  right = self->_smallCoverMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSmallCoverMargins:(UIEdgeInsets)a3
{
  self->_smallCoverMargins = a3;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
}

- (UIColor)dragBarTintColor
{
  return self->_dragBarTintColor;
}

- (void)setDragBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_dragBarTintColor, a3);
}

- (double)editModeMargin
{
  return self->_editModeMargin;
}

- (void)setEditModeMargin:(double)a3
{
  self->_editModeMargin = a3;
}

- (double)titleSpacing
{
  return self->_titleSpacing;
}

- (void)setTitleSpacing:(double)a3
{
  self->_titleSpacing = a3;
}

- (double)authorSpacing
{
  return self->_authorSpacing;
}

- (void)setAuthorSpacing:(double)a3
{
  self->_authorSpacing = a3;
}

- (double)dragCornerRadius
{
  return self->_dragCornerRadius;
}

- (void)setDragCornerRadius:(double)a3
{
  self->_dragCornerRadius = a3;
}

- (double)dragShadowOpacity
{
  return self->_dragShadowOpacity;
}

- (void)setDragShadowOpacity:(double)a3
{
  self->_dragShadowOpacity = a3;
}

- (double)dragShadowRadius
{
  return self->_dragShadowRadius;
}

- (void)setDragShadowRadius:(double)a3
{
  self->_dragShadowRadius = a3;
}

- (TUIFontAttributes)authorFontAttributes
{
  return self->_authorFontAttributes;
}

- (void)setAuthorFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (TUIFontAttributes)titleFontAttributes
{
  return self->_titleFontAttributes;
}

- (void)setTitleFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (double)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(double)a3
{
  self->_fontScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFontAttributes, 0);
  objc_storeStrong((id *)&self->_authorFontAttributes, 0);
  objc_storeStrong((id *)&self->_dragBarTintColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
}

@end
