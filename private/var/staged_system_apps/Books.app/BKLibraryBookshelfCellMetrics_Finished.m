@implementation BKLibraryBookshelfCellMetrics_Finished

- (BKLibraryBookshelfCellMetrics_Finished)init
{
  BKLibraryBookshelfCellMetrics_Finished *v2;
  BKLibraryBookshelfCellMetrics_Finished *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCellMetrics_Finished;
  v2 = -[BKLibraryBookshelfCellMetrics_Finished init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BKLibraryBookshelfCellMetrics setCellType:](v2, "setCellType:", 2);
  return v3;
}

+ (id)sectionName
{
  return CFSTR("bookCellListFinished");
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
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)BKLibraryBookshelfCellMetrics_Finished;
  v4 = a3;
  -[BKLibraryBookshelfCellMetrics configureWithSection:](&v46, "configureWithSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("dateline-color"), v46.receiver, v46.super_class));
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineColor:](self, "setDatelineColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("dateline-circle-hollow-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineCircleHollowColor:](self, "setDatelineCircleHollowColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("dateline-circle-fill-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineCircleFilledColor:](self, "setDatelineCircleFilledColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("finished-fill-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedFillColor:](self, "setFinishedFillColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("finished-fill-hilight-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedFillHilightColor:](self, "setFinishedFillHilightColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("finished-frame-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedFrameColor:](self, "setFinishedFrameColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("finished-text-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedTextColor:](self, "setFinishedTextColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("finished-text-hilight-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedTextHilightColor:](self, "setFinishedTextHilightColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("write-review-fill-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewFillColor:](self, "setWriteReviewFillColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("write-review-fill-hilight-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewFillHilightColor:](self, "setWriteReviewFillHilightColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("write-review-frame-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewFrameColor:](self, "setWriteReviewFrameColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("write-review-text-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewTextColor:](self, "setWriteReviewTextColor:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("write-review-text-hilight-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewTextHilightColor:](self, "setWriteReviewTextHilightColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("still-reading-fill-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingFillColor:](self, "setStillReadingFillColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("still-reading-fill-hilight-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingFillHilightColor:](self, "setStillReadingFillHilightColor:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("still-reading-frame-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingFrameColor:](self, "setStillReadingFrameColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("still-reading-text-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingTextColor:](self, "setStillReadingTextColor:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("still-reading-text-hilight-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingTextHilightColor:](self, "setStillReadingTextHilightColor:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("more-tint-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setMoreTintColor:](self, "setMoreTintColor:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("review-bg-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewBGColor:](self, "setReviewBGColor:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("rating-frame-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setRatingFrameColor:](self, "setRatingFrameColor:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("rating-fill-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setRatingFillColor:](self, "setRatingFillColor:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("rating-empty-color")));
  -[BKLibraryBookshelfCellMetrics_Finished setRatingEmptyColor:](self, "setRatingEmptyColor:", v27);

  objc_msgSend(v4, "floatForKey:", CFSTR("edit-mode-shrink-alpha"));
  -[BKLibraryBookshelfCellMetrics_Finished setShrinkAlpha:](self, "setShrinkAlpha:");
  objc_msgSend(v4, "sizeForKey:", CFSTR("book-cover-size"));
  -[BKLibraryBookshelfCellMetrics_Finished setBookCoverSize:](self, "setBookCoverSize:");
  objc_msgSend(v4, "floatForKey:", CFSTR("book-cover-left-margin"));
  -[BKLibraryBookshelfCellMetrics_Finished setBookCoverLeftMargin:](self, "setBookCoverLeftMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cell-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setCellSpacing:](self, "setCellSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cell-height"));
  -[BKLibraryBookshelfCellMetrics_Finished setCellHeight:](self, "setCellHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("checkmark-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setCheckMarkSpacing:](self, "setCheckMarkSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cloud-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setCloudSpacing:](self, "setCloudSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("dateline-circle-size"));
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineCircleSize:](self, "setDatelineCircleSize:");
  objc_msgSend(v4, "floatForKey:", CFSTR("dateline-width"));
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineWidth:](self, "setDatelineWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("dateline-margin"));
  -[BKLibraryBookshelfCellMetrics_Finished setDatelineMargin:](self, "setDatelineMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("date-space"));
  -[BKLibraryBookshelfCellMetrics_Finished setDateSpace:](self, "setDateSpace:");
  objc_msgSend(v4, "floatForKey:", CFSTR("lockup-margin"));
  -[BKLibraryBookshelfCellMetrics_Finished setLockupMargin:](self, "setLockupMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("author-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setAuthorSpacing:](self, "setAuthorSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("title-max-lines"));
  -[BKLibraryBookshelfCellMetrics_Finished setTitleMaxLines:](self, "setTitleMaxLines:");
  objc_msgSend(v4, "floatForKey:", CFSTR("rating-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setRatingSpacing:](self, "setRatingSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("rating-height"));
  -[BKLibraryBookshelfCellMetrics_Finished setRatingHeight:](self, "setRatingHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("rating-width"));
  -[BKLibraryBookshelfCellMetrics_Finished setRatingWidth:](self, "setRatingWidth:");
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedShortText:](self, "setFinishedShortText:", objc_msgSend(v4, "BOOLForKey:", CFSTR("finished-short-text")));
  objc_msgSend(v4, "floatForKey:", CFSTR("finished-frame-width"));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedFrameWidth:](self, "setFinishedFrameWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("finished-title-inset"));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedTitleInset:](self, "setFinishedTitleInset:");
  objc_msgSend(v4, "floatForKey:", CFSTR("finished-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedSpacing:](self, "setFinishedSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("still-reading-frame-width"));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingFrameWidth:](self, "setStillReadingFrameWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("still-reading-title-inset"));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingTitleInset:](self, "setStillReadingTitleInset:");
  objc_msgSend(v4, "floatForKey:", CFSTR("still-reading-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingSpacing:](self, "setStillReadingSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("write-review-frame-width"));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewFrameWidth:](self, "setWriteReviewFrameWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("write-review-title-inset"));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewTitleInset:](self, "setWriteReviewTitleInset:");
  objc_msgSend(v4, "floatForKey:", CFSTR("write-review--spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewSpacing:](self, "setWriteReviewSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("more-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setMoreSpacing:](self, "setMoreSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("audiobook-control-margin"));
  -[BKLibraryBookshelfCellMetrics_Finished setAudiobookControlMargin:](self, "setAudiobookControlMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("audiobook-control-diameter"));
  -[BKLibraryBookshelfCellMetrics_Finished setAudiobookControlDiameter:](self, "setAudiobookControlDiameter:");
  objc_msgSend(v4, "floatForKey:", CFSTR("review-compact-lines"));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewCompactLines:](self, "setReviewCompactLines:");
  objc_msgSend(v4, "floatForKey:", CFSTR("review-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewSpacing:](self, "setReviewSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("review-left-margin"));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewLeftMargin:](self, "setReviewLeftMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("review-right-margin"));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewRightMargin:](self, "setReviewRightMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("review-top-margin"));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewTopMargin:](self, "setReviewTopMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("review-bottom-margin"));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewBottomMargin:](self, "setReviewBottomMargin:");
  -[BKLibraryBookshelfCellMetrics_Finished setReviewBottomLayout:](self, "setReviewBottomLayout:", objc_msgSend(v4, "BOOLForKey:", CFSTR("review-bottom-layout")));
  objc_msgSend(v4, "floatForKey:", CFSTR("more-height"));
  -[BKLibraryBookshelfCellMetrics_Finished setMoreHeight:](self, "setMoreHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("lockup-bottom-spacing"));
  -[BKLibraryBookshelfCellMetrics_Finished setLockupBottomSpacing:](self, "setLockupBottomSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("small-layout-space-needed"));
  -[BKLibraryBookshelfCellMetrics_Finished setSmallLayoutSpaceNeeded:](self, "setSmallLayoutSpaceNeeded:");
  objc_msgSend(v4, "floatForKey:", CFSTR("author-max-lines"));
  -[BKLibraryBookshelfCellMetrics_Finished setAuthorMaxLines:](self, "setAuthorMaxLines:");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("dateFont")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Finished setDateFontAttributes:](self, "setDateFontAttributes:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("titleFont")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Finished setTitleFontAttributes:](self, "setTitleFontAttributes:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("authorFont")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Finished setAuthorFontAttributes:](self, "setAuthorFontAttributes:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("reviewTitleFont")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "attributesForAttributedStringCentered:truncated:", 0, 1));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewTitleFontAttributes:](self, "setReviewTitleFontAttributes:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("reviewContentFont")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewContentFontAttributes:](self, "setReviewContentFontAttributes:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("reviewMoreFont")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Finished setReviewMoreFontAttributes:](self, "setReviewMoreFontAttributes:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("finishedFont")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Finished setFinishedFontAttributes:](self, "setFinishedFontAttributes:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("stillReadingFont")));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Finished setStillReadingFontAttributes:](self, "setStillReadingFontAttributes:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("writeReviewFont")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Finished setWriteReviewFontAttributes:](self, "setWriteReviewFontAttributes:", v45);

}

- (double)shrinkAlpha
{
  return self->_shrinkAlpha;
}

- (void)setShrinkAlpha:(double)a3
{
  self->_shrinkAlpha = a3;
}

- (double)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(double)a3
{
  self->_cellWidth = a3;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
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

- (double)datelineCircleSize
{
  return self->_datelineCircleSize;
}

- (void)setDatelineCircleSize:(double)a3
{
  self->_datelineCircleSize = a3;
}

- (double)datelineWidth
{
  return self->_datelineWidth;
}

- (void)setDatelineWidth:(double)a3
{
  self->_datelineWidth = a3;
}

- (double)datelineMargin
{
  return self->_datelineMargin;
}

- (void)setDatelineMargin:(double)a3
{
  self->_datelineMargin = a3;
}

- (double)dateSpace
{
  return self->_dateSpace;
}

- (void)setDateSpace:(double)a3
{
  self->_dateSpace = a3;
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

- (BOOL)finishedShortText
{
  return self->_finishedShortText;
}

- (void)setFinishedShortText:(BOOL)a3
{
  self->_finishedShortText = a3;
}

- (double)finishedFrameWidth
{
  return self->_finishedFrameWidth;
}

- (void)setFinishedFrameWidth:(double)a3
{
  self->_finishedFrameWidth = a3;
}

- (double)finishedTitleInset
{
  return self->_finishedTitleInset;
}

- (void)setFinishedTitleInset:(double)a3
{
  self->_finishedTitleInset = a3;
}

- (double)finishedSpacing
{
  return self->_finishedSpacing;
}

- (void)setFinishedSpacing:(double)a3
{
  self->_finishedSpacing = a3;
}

- (double)writeReviewFrameWidth
{
  return self->_writeReviewFrameWidth;
}

- (void)setWriteReviewFrameWidth:(double)a3
{
  self->_writeReviewFrameWidth = a3;
}

- (double)writeReviewTitleInset
{
  return self->_writeReviewTitleInset;
}

- (void)setWriteReviewTitleInset:(double)a3
{
  self->_writeReviewTitleInset = a3;
}

- (double)writeReviewSpacing
{
  return self->_writeReviewSpacing;
}

- (void)setWriteReviewSpacing:(double)a3
{
  self->_writeReviewSpacing = a3;
}

- (double)stillReadingFrameWidth
{
  return self->_stillReadingFrameWidth;
}

- (void)setStillReadingFrameWidth:(double)a3
{
  self->_stillReadingFrameWidth = a3;
}

- (double)stillReadingTitleInset
{
  return self->_stillReadingTitleInset;
}

- (void)setStillReadingTitleInset:(double)a3
{
  self->_stillReadingTitleInset = a3;
}

- (double)stillReadingSpacing
{
  return self->_stillReadingSpacing;
}

- (void)setStillReadingSpacing:(double)a3
{
  self->_stillReadingSpacing = a3;
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

- (double)reviewSpacing
{
  return self->_reviewSpacing;
}

- (void)setReviewSpacing:(double)a3
{
  self->_reviewSpacing = a3;
}

- (double)reviewLeftMargin
{
  return self->_reviewLeftMargin;
}

- (void)setReviewLeftMargin:(double)a3
{
  self->_reviewLeftMargin = a3;
}

- (double)reviewRightMargin
{
  return self->_reviewRightMargin;
}

- (void)setReviewRightMargin:(double)a3
{
  self->_reviewRightMargin = a3;
}

- (double)reviewTopMargin
{
  return self->_reviewTopMargin;
}

- (void)setReviewTopMargin:(double)a3
{
  self->_reviewTopMargin = a3;
}

- (double)reviewBottomMargin
{
  return self->_reviewBottomMargin;
}

- (void)setReviewBottomMargin:(double)a3
{
  self->_reviewBottomMargin = a3;
}

- (double)reviewCompactLines
{
  return self->_reviewCompactLines;
}

- (void)setReviewCompactLines:(double)a3
{
  self->_reviewCompactLines = a3;
}

- (double)smallLayoutSpaceNeeded
{
  return self->_smallLayoutSpaceNeeded;
}

- (void)setSmallLayoutSpaceNeeded:(double)a3
{
  self->_smallLayoutSpaceNeeded = a3;
}

- (double)lockupBottomSpacing
{
  return self->_lockupBottomSpacing;
}

- (void)setLockupBottomSpacing:(double)a3
{
  self->_lockupBottomSpacing = a3;
}

- (double)authorMaxLines
{
  return self->_authorMaxLines;
}

- (void)setAuthorMaxLines:(double)a3
{
  self->_authorMaxLines = a3;
}

- (BOOL)reviewBottomLayout
{
  return self->_reviewBottomLayout;
}

- (void)setReviewBottomLayout:(BOOL)a3
{
  self->_reviewBottomLayout = a3;
}

- (UIColor)datelineColor
{
  return self->_datelineColor;
}

- (void)setDatelineColor:(id)a3
{
  objc_storeStrong((id *)&self->_datelineColor, a3);
}

- (UIColor)datelineCircleHollowColor
{
  return self->_datelineCircleHollowColor;
}

- (void)setDatelineCircleHollowColor:(id)a3
{
  objc_storeStrong((id *)&self->_datelineCircleHollowColor, a3);
}

- (UIColor)datelineCircleFilledColor
{
  return self->_datelineCircleFilledColor;
}

- (void)setDatelineCircleFilledColor:(id)a3
{
  objc_storeStrong((id *)&self->_datelineCircleFilledColor, a3);
}

- (UIColor)finishedFillColor
{
  return self->_finishedFillColor;
}

- (void)setFinishedFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedFillColor, a3);
}

- (UIColor)finishedFillHilightColor
{
  return self->_finishedFillHilightColor;
}

- (void)setFinishedFillHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedFillHilightColor, a3);
}

- (UIColor)finishedFrameColor
{
  return self->_finishedFrameColor;
}

- (void)setFinishedFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedFrameColor, a3);
}

- (UIColor)finishedTextColor
{
  return self->_finishedTextColor;
}

- (void)setFinishedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedTextColor, a3);
}

- (UIColor)finishedTextHilightColor
{
  return self->_finishedTextHilightColor;
}

- (void)setFinishedTextHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_finishedTextHilightColor, a3);
}

- (UIColor)writeReviewFillColor
{
  return self->_writeReviewFillColor;
}

- (void)setWriteReviewFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_writeReviewFillColor, a3);
}

- (UIColor)writeReviewFillHilightColor
{
  return self->_writeReviewFillHilightColor;
}

- (void)setWriteReviewFillHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_writeReviewFillHilightColor, a3);
}

- (UIColor)writeReviewFrameColor
{
  return self->_writeReviewFrameColor;
}

- (void)setWriteReviewFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_writeReviewFrameColor, a3);
}

- (UIColor)writeReviewTextColor
{
  return self->_writeReviewTextColor;
}

- (void)setWriteReviewTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_writeReviewTextColor, a3);
}

- (UIColor)writeReviewTextHilightColor
{
  return self->_writeReviewTextHilightColor;
}

- (void)setWriteReviewTextHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_writeReviewTextHilightColor, a3);
}

- (UIColor)stillReadingFillColor
{
  return self->_stillReadingFillColor;
}

- (void)setStillReadingFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_stillReadingFillColor, a3);
}

- (UIColor)stillReadingFillHilightColor
{
  return self->_stillReadingFillHilightColor;
}

- (void)setStillReadingFillHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_stillReadingFillHilightColor, a3);
}

- (UIColor)stillReadingFrameColor
{
  return self->_stillReadingFrameColor;
}

- (void)setStillReadingFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_stillReadingFrameColor, a3);
}

- (UIColor)stillReadingTextColor
{
  return self->_stillReadingTextColor;
}

- (void)setStillReadingTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_stillReadingTextColor, a3);
}

- (UIColor)stillReadingTextHilightColor
{
  return self->_stillReadingTextHilightColor;
}

- (void)setStillReadingTextHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_stillReadingTextHilightColor, a3);
}

- (UIColor)moreTintColor
{
  return self->_moreTintColor;
}

- (void)setMoreTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_moreTintColor, a3);
}

- (UIColor)reviewBGColor
{
  return self->_reviewBGColor;
}

- (void)setReviewBGColor:(id)a3
{
  objc_storeStrong((id *)&self->_reviewBGColor, a3);
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

- (TUIFontAttributes)dateFontAttributes
{
  return self->_dateFontAttributes;
}

- (void)setDateFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (TUIFontAttributes)titleFontAttributes
{
  return self->_titleFontAttributes;
}

- (void)setTitleFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (TUIFontAttributes)authorFontAttributes
{
  return self->_authorFontAttributes;
}

- (void)setAuthorFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (TUIFontAttributes)reviewTitleFontAttributes
{
  return self->_reviewTitleFontAttributes;
}

- (void)setReviewTitleFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (TUIFontAttributes)reviewContentFontAttributes
{
  return self->_reviewContentFontAttributes;
}

- (void)setReviewContentFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (TUIFontAttributes)reviewMoreFontAttributes
{
  return self->_reviewMoreFontAttributes;
}

- (void)setReviewMoreFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (TUIFontAttributes)finishedFontAttributes
{
  return self->_finishedFontAttributes;
}

- (void)setFinishedFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (TUIFontAttributes)stillReadingFontAttributes
{
  return self->_stillReadingFontAttributes;
}

- (void)setStillReadingFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (TUIFontAttributes)writeReviewFontAttributes
{
  return self->_writeReviewFontAttributes;
}

- (void)setWriteReviewFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
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
  objc_storeStrong((id *)&self->_writeReviewFontAttributes, 0);
  objc_storeStrong((id *)&self->_stillReadingFontAttributes, 0);
  objc_storeStrong((id *)&self->_finishedFontAttributes, 0);
  objc_storeStrong((id *)&self->_reviewMoreFontAttributes, 0);
  objc_storeStrong((id *)&self->_reviewContentFontAttributes, 0);
  objc_storeStrong((id *)&self->_reviewTitleFontAttributes, 0);
  objc_storeStrong((id *)&self->_authorFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleFontAttributes, 0);
  objc_storeStrong((id *)&self->_dateFontAttributes, 0);
  objc_storeStrong((id *)&self->_ratingEmptyColor, 0);
  objc_storeStrong((id *)&self->_ratingFillColor, 0);
  objc_storeStrong((id *)&self->_ratingFrameColor, 0);
  objc_storeStrong((id *)&self->_reviewBGColor, 0);
  objc_storeStrong((id *)&self->_moreTintColor, 0);
  objc_storeStrong((id *)&self->_stillReadingTextHilightColor, 0);
  objc_storeStrong((id *)&self->_stillReadingTextColor, 0);
  objc_storeStrong((id *)&self->_stillReadingFrameColor, 0);
  objc_storeStrong((id *)&self->_stillReadingFillHilightColor, 0);
  objc_storeStrong((id *)&self->_stillReadingFillColor, 0);
  objc_storeStrong((id *)&self->_writeReviewTextHilightColor, 0);
  objc_storeStrong((id *)&self->_writeReviewTextColor, 0);
  objc_storeStrong((id *)&self->_writeReviewFrameColor, 0);
  objc_storeStrong((id *)&self->_writeReviewFillHilightColor, 0);
  objc_storeStrong((id *)&self->_writeReviewFillColor, 0);
  objc_storeStrong((id *)&self->_finishedTextHilightColor, 0);
  objc_storeStrong((id *)&self->_finishedTextColor, 0);
  objc_storeStrong((id *)&self->_finishedFrameColor, 0);
  objc_storeStrong((id *)&self->_finishedFillHilightColor, 0);
  objc_storeStrong((id *)&self->_finishedFillColor, 0);
  objc_storeStrong((id *)&self->_datelineCircleFilledColor, 0);
  objc_storeStrong((id *)&self->_datelineCircleHollowColor, 0);
  objc_storeStrong((id *)&self->_datelineColor, 0);
}

@end
