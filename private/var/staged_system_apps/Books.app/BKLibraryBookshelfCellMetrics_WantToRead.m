@implementation BKLibraryBookshelfCellMetrics_WantToRead

- (BKLibraryBookshelfCellMetrics_WantToRead)init
{
  BKLibraryBookshelfCellMetrics_WantToRead *v2;
  BKLibraryBookshelfCellMetrics_WantToRead *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCellMetrics_WantToRead;
  v2 = -[BKLibraryBookshelfCellMetrics_WantToRead init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BKLibraryBookshelfCellMetrics setCellType:](v2, "setCellType:", 3);
  return v3;
}

+ (id)sectionName
{
  return CFSTR("bookCellListWantToRead");
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
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BKLibraryBookshelfCellMetrics_WantToRead;
  -[BKLibraryBookshelfCellMetrics configureWithSection:](&v51, "configureWithSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-fill-color")));
  if (v5)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFillColor:](self, "setReadBuyFillColor:", v5);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFillColor:](self, "setReadBuyFillColor:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-fill-hilight-color")));
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFillHilightColor:](self, "setReadBuyFillHilightColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-fill-hilight-color")));
  if (v8)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFillHilightColor:](self, "setReadBuyFillHilightColor:", v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFillHilightColor:](self, "setReadBuyFillHilightColor:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-frame-color")));
  if (v10)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFrameColor:](self, "setReadBuyFrameColor:", v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFrameColor:](self, "setReadBuyFrameColor:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-text-color")));
  if (v12)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyTextColor:](self, "setReadBuyTextColor:", v12);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyTextColor:](self, "setReadBuyTextColor:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-text-hilight-color")));
  if (v14)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyTextHilightColor:](self, "setReadBuyTextHilightColor:", v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyTextHilightColor:](self, "setReadBuyTextHilightColor:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-store-fill-color")));
  if (v16)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreFillColor:](self, "setReadBuyStoreFillColor:", v16);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreFillColor:](self, "setReadBuyStoreFillColor:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-store-fill-hilight-color")));
  if (v18)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreFillHilightColor:](self, "setReadBuyStoreFillHilightColor:", v18);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreFillHilightColor:](self, "setReadBuyStoreFillHilightColor:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-store-frame-color")));
  if (v20)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreFrameColor:](self, "setReadBuyStoreFrameColor:", v20);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreFrameColor:](self, "setReadBuyStoreFrameColor:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-store-text-color")));
  if (v22)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreTextColor:](self, "setReadBuyStoreTextColor:", v22);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreTextColor:](self, "setReadBuyStoreTextColor:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-store-text-hilight-color")));
  if (v24)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreTextHilightColor:](self, "setReadBuyStoreTextHilightColor:", v24);
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreTextHilightColor:](self, "setReadBuyStoreTextHilightColor:", v25);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("readBuy-store-disabled-color")));
  if (v26)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreTextDisabledColor:](self, "setReadBuyStoreTextDisabledColor:", v26);
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreTextDisabledColor:](self, "setReadBuyStoreTextDisabledColor:", v27);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("buy-button-background-color")));
  if (v28)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setBuyStateBackgroundFillColor:](self, "setBuyStateBackgroundFillColor:", v28);
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setBuyStateBackgroundFillColor:](self, "setBuyStateBackgroundFillColor:", v29);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("more-tint-color")));
  if (v30)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setMoreTintColor:](self, "setMoreTintColor:", v30);
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setMoreTintColor:](self, "setMoreTintColor:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("rating-frame-color")));
  if (v32)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setRatingFrameColor:](self, "setRatingFrameColor:", v32);
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setRatingFrameColor:](self, "setRatingFrameColor:", v33);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("rating-fill-color")));
  if (v34)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setRatingFillColor:](self, "setRatingFillColor:", v34);
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setRatingFillColor:](self, "setRatingFillColor:", v35);

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("rating-empty-color")));
  if (v36)
  {
    -[BKLibraryBookshelfCellMetrics_WantToRead setRatingEmptyColor:](self, "setRatingEmptyColor:", v36);
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    -[BKLibraryBookshelfCellMetrics_WantToRead setRatingEmptyColor:](self, "setRatingEmptyColor:", v37);

  }
  objc_msgSend(v4, "sizeForKey:", CFSTR("book-cover-size"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setBookCoverSize:](self, "setBookCoverSize:");
  objc_msgSend(v4, "floatForKey:", CFSTR("book-cover-left-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setBookCoverLeftMargin:](self, "setBookCoverLeftMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cell-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setCellSpacing:](self, "setCellSpacing:");
  -[BKLibraryBookshelfCellMetrics_WantToRead setStackedLayout:](self, "setStackedLayout:", objc_msgSend(v4, "BOOLForKey:", CFSTR("stacked-layout")));
  objc_msgSend(v4, "floatForKey:", CFSTR("cell-height"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setCellHeight:](self, "setCellHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("checkmark-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setCheckMarkSpacing:](self, "setCheckMarkSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cloud-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setCloudSpacing:](self, "setCloudSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("lockup-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setLockupMargin:](self, "setLockupMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("edit-mode-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setEditModeMargin:](self, "setEditModeMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("drag-handle-horizontal-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDragHandleHorizontalSpacing:](self, "setDragHandleHorizontalSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("title-vertical-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setTitleSpacing:](self, "setTitleSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("author-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setAuthorSpacing:](self, "setAuthorSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("title-max-lines"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setTitleMaxLines:](self, "setTitleMaxLines:");
  objc_msgSend(v4, "floatForKey:", CFSTR("rating-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingSpacing:](self, "setRatingSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("rating-height"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingHeight:](self, "setRatingHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("rating-width"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingWidth:](self, "setRatingWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("rating-count-width"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingCountWidth:](self, "setRatingCountWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("rating-horizontal-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingHorizontalSpacing:](self, "setRatingHorizontalSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("readBuy-frame-width"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFrameWidth:](self, "setReadBuyFrameWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("readBuy-title-inset"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyTitleInset:](self, "setReadBuyTitleInset:");
  objc_msgSend(v4, "floatForKey:", CFSTR("readBuy-leading-edge-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyLeadingEdgeSpacing:](self, "setReadBuyLeadingEdgeSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("readBuy-trailing-edge-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyTrailingEdgeSpacing:](self, "setReadBuyTrailingEdgeSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("readBuy-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuySpacing:](self, "setReadBuySpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("stacked-button-horizontal-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setStackedButtonHorizontalSpacing:](self, "setStackedButtonHorizontalSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("more-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setMoreSpacing:](self, "setMoreSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("description-spacing"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionSpacing:](self, "setDescriptionSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("description-left-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionLeftMargin:](self, "setDescriptionLeftMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("description-right-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionRightMargin:](self, "setDescriptionRightMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("description-top-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionTopMargin:](self, "setDescriptionTopMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("description-bottom-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionBottomMargin:](self, "setDescriptionBottomMargin:");
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionVisibleRows:](self, "setDescriptionVisibleRows:", objc_msgSend(v4, "integerForKey:", CFSTR("description-visible-rows")));
  objc_msgSend(v4, "floatForKey:", CFSTR("more-height"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setMoreHeight:](self, "setMoreHeight:");
  -[BKLibraryBookshelfCellMetrics_WantToRead setShrinkInEditMode:](self, "setShrinkInEditMode:", objc_msgSend(v4, "BOOLForKey:", CFSTR("edit-mode-shrink")));
  objc_msgSend(v4, "floatForKey:", CFSTR("edit-mode-shrink-amount"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setShrinkAmount:](self, "setShrinkAmount:");
  objc_msgSend(v4, "floatForKey:", CFSTR("edit-mode-shrink-alpha"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setShrinkAlpha:](self, "setShrinkAlpha:");
  objc_msgSend(v4, "floatForKey:", CFSTR("edit-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setEditMargin:](self, "setEditMargin:");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("cell-separator-color")));
  -[BKLibraryBookshelfCellMetrics_WantToRead setCellSeparatorColor:](self, "setCellSeparatorColor:", v38);

  objc_msgSend(v4, "floatForKey:", CFSTR("drag-corner-radius"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDragCornerRadius:](self, "setDragCornerRadius:");
  objc_msgSend(v4, "floatForKey:", CFSTR("drag-shadow-opacity"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDragShadowOpacity:](self, "setDragShadowOpacity:");
  objc_msgSend(v4, "floatForKey:", CFSTR("drag-shadow-radius"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDragShadowRadius:](self, "setDragShadowRadius:");
  objc_msgSend(v4, "floatForKey:", CFSTR("audiobook-control-margin"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setAudiobookControlMargin:](self, "setAudiobookControlMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("audiobook-control-diameter"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setAudiobookControlDiameter:](self, "setAudiobookControlDiameter:");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("titleFont")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "attributesForAttributedStringCentered:truncated:", 0, 1));
  -[BKLibraryBookshelfCellMetrics_WantToRead setTitleFontAttributes:](self, "setTitleFontAttributes:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("authorFont")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "attributesForAttributedStringCentered:truncated:", 0, 1));
  -[BKLibraryBookshelfCellMetrics_WantToRead setAuthorFontAttributes:](self, "setAuthorFontAttributes:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("descriptionFont")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionFontAttributes:](self, "setDescriptionFontAttributes:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("readBuyFont")));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFontAttributes:](self, "setReadBuyFontAttributes:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("readBuyStoreFont")));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyStoreFontAttributes:](self, "setReadBuyStoreFontAttributes:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("starRatingCountFont")));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_WantToRead setStarRatingCountFontAttributes:](self, "setStarRatingCountFontAttributes:", v50);

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

- (CGSize)bookCoverSize
{
  double width;
  double height;
  CGSize result;

  width = self->_bookCoverSize.width;
  height = self->_bookCoverSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBookCoverSize:(CGSize)a3
{
  self->_bookCoverSize = a3;
}

- (double)bookCoverLeftMargin
{
  return self->_bookCoverLeftMargin;
}

- (void)setBookCoverLeftMargin:(double)a3
{
  self->_bookCoverLeftMargin = a3;
}

- (double)cellSpacing
{
  return self->_cellSpacing;
}

- (void)setCellSpacing:(double)a3
{
  self->_cellSpacing = a3;
}

- (BOOL)stackedLayout
{
  return self->_stackedLayout;
}

- (void)setStackedLayout:(BOOL)a3
{
  self->_stackedLayout = a3;
}

- (double)stackedButtonHorizontalSpacing
{
  return self->_stackedButtonHorizontalSpacing;
}

- (void)setStackedButtonHorizontalSpacing:(double)a3
{
  self->_stackedButtonHorizontalSpacing = a3;
}

- (double)titleMaxLines
{
  return self->_titleMaxLines;
}

- (void)setTitleMaxLines:(double)a3
{
  self->_titleMaxLines = a3;
}

- (double)lockupMargin
{
  return self->_lockupMargin;
}

- (void)setLockupMargin:(double)a3
{
  self->_lockupMargin = a3;
}

- (double)editModeMargin
{
  return self->_editModeMargin;
}

- (void)setEditModeMargin:(double)a3
{
  self->_editModeMargin = a3;
}

- (double)dragHandleHorizontalSpacing
{
  return self->_dragHandleHorizontalSpacing;
}

- (void)setDragHandleHorizontalSpacing:(double)a3
{
  self->_dragHandleHorizontalSpacing = a3;
}

- (double)cloudSpacing
{
  return self->_cloudSpacing;
}

- (void)setCloudSpacing:(double)a3
{
  self->_cloudSpacing = a3;
}

- (double)checkMarkSpacing
{
  return self->_checkMarkSpacing;
}

- (void)setCheckMarkSpacing:(double)a3
{
  self->_checkMarkSpacing = a3;
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

- (double)ratingHeight
{
  return self->_ratingHeight;
}

- (void)setRatingHeight:(double)a3
{
  self->_ratingHeight = a3;
}

- (double)ratingWidth
{
  return self->_ratingWidth;
}

- (void)setRatingWidth:(double)a3
{
  self->_ratingWidth = a3;
}

- (double)ratingSpacing
{
  return self->_ratingSpacing;
}

- (void)setRatingSpacing:(double)a3
{
  self->_ratingSpacing = a3;
}

- (double)ratingCountWidth
{
  return self->_ratingCountWidth;
}

- (void)setRatingCountWidth:(double)a3
{
  self->_ratingCountWidth = a3;
}

- (double)ratingHorizontalSpacing
{
  return self->_ratingHorizontalSpacing;
}

- (void)setRatingHorizontalSpacing:(double)a3
{
  self->_ratingHorizontalSpacing = a3;
}

- (double)readBuyFrameWidth
{
  return self->_readBuyFrameWidth;
}

- (void)setReadBuyFrameWidth:(double)a3
{
  self->_readBuyFrameWidth = a3;
}

- (double)readBuyTitleInset
{
  return self->_readBuyTitleInset;
}

- (void)setReadBuyTitleInset:(double)a3
{
  self->_readBuyTitleInset = a3;
}

- (double)readBuyLeadingEdgeSpacing
{
  return self->_readBuyLeadingEdgeSpacing;
}

- (void)setReadBuyLeadingEdgeSpacing:(double)a3
{
  self->_readBuyLeadingEdgeSpacing = a3;
}

- (double)readBuyTrailingEdgeSpacing
{
  return self->_readBuyTrailingEdgeSpacing;
}

- (void)setReadBuyTrailingEdgeSpacing:(double)a3
{
  self->_readBuyTrailingEdgeSpacing = a3;
}

- (double)readBuySpacing
{
  return self->_readBuySpacing;
}

- (void)setReadBuySpacing:(double)a3
{
  self->_readBuySpacing = a3;
}

- (double)moreHeight
{
  return self->_moreHeight;
}

- (void)setMoreHeight:(double)a3
{
  self->_moreHeight = a3;
}

- (double)moreSpacing
{
  return self->_moreSpacing;
}

- (void)setMoreSpacing:(double)a3
{
  self->_moreSpacing = a3;
}

- (double)descriptionSpacing
{
  return self->_descriptionSpacing;
}

- (void)setDescriptionSpacing:(double)a3
{
  self->_descriptionSpacing = a3;
}

- (double)descriptionLeftMargin
{
  return self->_descriptionLeftMargin;
}

- (void)setDescriptionLeftMargin:(double)a3
{
  self->_descriptionLeftMargin = a3;
}

- (double)descriptionRightMargin
{
  return self->_descriptionRightMargin;
}

- (void)setDescriptionRightMargin:(double)a3
{
  self->_descriptionRightMargin = a3;
}

- (double)descriptionTopMargin
{
  return self->_descriptionTopMargin;
}

- (void)setDescriptionTopMargin:(double)a3
{
  self->_descriptionTopMargin = a3;
}

- (double)descriptionBottomMargin
{
  return self->_descriptionBottomMargin;
}

- (void)setDescriptionBottomMargin:(double)a3
{
  self->_descriptionBottomMargin = a3;
}

- (unint64_t)descriptionVisibleRows
{
  return self->_descriptionVisibleRows;
}

- (void)setDescriptionVisibleRows:(unint64_t)a3
{
  self->_descriptionVisibleRows = a3;
}

- (double)editMargin
{
  return self->_editMargin;
}

- (void)setEditMargin:(double)a3
{
  self->_editMargin = a3;
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

- (UIColor)cellSeparatorColor
{
  return self->_cellSeparatorColor;
}

- (void)setCellSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellSeparatorColor, a3);
}

- (UIColor)readBuyFillColor
{
  return self->_readBuyFillColor;
}

- (void)setReadBuyFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyFillColor, a3);
}

- (UIColor)readBuyFillHilightColor
{
  return self->_readBuyFillHilightColor;
}

- (void)setReadBuyFillHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyFillHilightColor, a3);
}

- (UIColor)readBuyFrameColor
{
  return self->_readBuyFrameColor;
}

- (void)setReadBuyFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyFrameColor, a3);
}

- (UIColor)readBuyTextColor
{
  return self->_readBuyTextColor;
}

- (void)setReadBuyTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyTextColor, a3);
}

- (UIColor)readBuyTextHilightColor
{
  return self->_readBuyTextHilightColor;
}

- (void)setReadBuyTextHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyTextHilightColor, a3);
}

- (UIColor)readBuyStoreFillColor
{
  return self->_readBuyStoreFillColor;
}

- (void)setReadBuyStoreFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyStoreFillColor, a3);
}

- (UIColor)readBuyStoreFillHilightColor
{
  return self->_readBuyStoreFillHilightColor;
}

- (void)setReadBuyStoreFillHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyStoreFillHilightColor, a3);
}

- (UIColor)readBuyStoreFrameColor
{
  return self->_readBuyStoreFrameColor;
}

- (void)setReadBuyStoreFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyStoreFrameColor, a3);
}

- (UIColor)readBuyStoreTextColor
{
  return self->_readBuyStoreTextColor;
}

- (void)setReadBuyStoreTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyStoreTextColor, a3);
}

- (UIColor)readBuyStoreTextHilightColor
{
  return self->_readBuyStoreTextHilightColor;
}

- (void)setReadBuyStoreTextHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyStoreTextHilightColor, a3);
}

- (UIColor)readBuyStoreTextDisabledColor
{
  return self->_readBuyStoreTextDisabledColor;
}

- (void)setReadBuyStoreTextDisabledColor:(id)a3
{
  objc_storeStrong((id *)&self->_readBuyStoreTextDisabledColor, a3);
}

- (UIColor)buyStateBackgroundFillColor
{
  return self->_buyStateBackgroundFillColor;
}

- (void)setBuyStateBackgroundFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_buyStateBackgroundFillColor, a3);
}

- (UIColor)moreTintColor
{
  return self->_moreTintColor;
}

- (void)setMoreTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_moreTintColor, a3);
}

- (UIColor)ratingFrameColor
{
  return self->_ratingFrameColor;
}

- (void)setRatingFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_ratingFrameColor, a3);
}

- (UIColor)ratingFillColor
{
  return self->_ratingFillColor;
}

- (void)setRatingFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_ratingFillColor, a3);
}

- (UIColor)ratingEmptyColor
{
  return self->_ratingEmptyColor;
}

- (void)setRatingEmptyColor:(id)a3
{
  objc_storeStrong((id *)&self->_ratingEmptyColor, a3);
}

- (TUIFontAttributes)titleFontAttributes
{
  return self->_titleFontAttributes;
}

- (void)setTitleFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (TUIFontAttributes)authorFontAttributes
{
  return self->_authorFontAttributes;
}

- (void)setAuthorFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (TUIFontAttributes)descriptionFontAttributes
{
  return self->_descriptionFontAttributes;
}

- (void)setDescriptionFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (TUIFontAttributes)dateLabelFontAttributes
{
  return self->_dateLabelFontAttributes;
}

- (void)setDateLabelFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (TUIFontAttributes)starRatingCountFontAttributes
{
  return self->_starRatingCountFontAttributes;
}

- (void)setStarRatingCountFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (TUIFontAttributes)readBuyFontAttributes
{
  return self->_readBuyFontAttributes;
}

- (void)setReadBuyFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (TUIFontAttributes)readBuyStoreFontAttributes
{
  return self->_readBuyStoreFontAttributes;
}

- (void)setReadBuyStoreFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (double)audiobookControlMargin
{
  return self->_audiobookControlMargin;
}

- (void)setAudiobookControlMargin:(double)a3
{
  self->_audiobookControlMargin = a3;
}

- (double)audiobookControlDiameter
{
  return self->_audiobookControlDiameter;
}

- (void)setAudiobookControlDiameter:(double)a3
{
  self->_audiobookControlDiameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readBuyStoreFontAttributes, 0);
  objc_storeStrong((id *)&self->_readBuyFontAttributes, 0);
  objc_storeStrong((id *)&self->_starRatingCountFontAttributes, 0);
  objc_storeStrong((id *)&self->_dateLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_descriptionFontAttributes, 0);
  objc_storeStrong((id *)&self->_authorFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleFontAttributes, 0);
  objc_storeStrong((id *)&self->_ratingEmptyColor, 0);
  objc_storeStrong((id *)&self->_ratingFillColor, 0);
  objc_storeStrong((id *)&self->_ratingFrameColor, 0);
  objc_storeStrong((id *)&self->_moreTintColor, 0);
  objc_storeStrong((id *)&self->_buyStateBackgroundFillColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreTextDisabledColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreTextHilightColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreTextColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreFrameColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreFillHilightColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreFillColor, 0);
  objc_storeStrong((id *)&self->_readBuyTextHilightColor, 0);
  objc_storeStrong((id *)&self->_readBuyTextColor, 0);
  objc_storeStrong((id *)&self->_readBuyFrameColor, 0);
  objc_storeStrong((id *)&self->_readBuyFillHilightColor, 0);
  objc_storeStrong((id *)&self->_readBuyFillColor, 0);
  objc_storeStrong((id *)&self->_cellSeparatorColor, 0);
}

@end
