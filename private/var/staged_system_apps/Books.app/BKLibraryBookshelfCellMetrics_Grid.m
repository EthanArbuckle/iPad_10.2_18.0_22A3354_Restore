@implementation BKLibraryBookshelfCellMetrics_Grid

- (BKLibraryBookshelfCellMetrics_Grid)init
{
  BKLibraryBookshelfCellMetrics_Grid *v2;
  BKLibraryBookshelfCellMetrics_Grid *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCellMetrics_Grid;
  v2 = -[BKLibraryBookshelfCellMetrics_Grid init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BKLibraryBookshelfCellMetrics setCellType:](v2, "setCellType:", 0);
  return v3;
}

+ (id)sectionName
{
  return CFSTR("bookCellGrid");
}

- (void)configureWithSection:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
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
  double v28;
  double v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)BKLibraryBookshelfCellMetrics_Grid;
  v4 = a3;
  -[BKLibraryBookshelfCellMetrics configureWithSection:](&v30, "configureWithSection:", v4);
  objc_msgSend(v4, "sizeForKey:", CFSTR("cell-size"), v30.receiver, v30.super_class);
  -[BKLibraryBookshelfCellMetrics_Grid setCellSize:](self, "setCellSize:");
  objc_msgSend(v4, "sizeForKey:", CFSTR("small-cell-size"));
  -[BKLibraryBookshelfCellMetrics_Grid setSmallCellSize:](self, "setSmallCellSize:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cell-aspect"));
  -[BKLibraryBookshelfCellMetrics_Grid setCellAspect:](self, "setCellAspect:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cell-dim-alpha"));
  -[BKLibraryBookshelfCellMetrics_Grid setDimmedAlpha:](self, "setDimmedAlpha:");
  objc_msgSend(v4, "floatForKey:", CFSTR("cell-dim-scale"));
  -[BKLibraryBookshelfCellMetrics_Grid setDimmedScale:](self, "setDimmedScale:");
  objc_msgSend(v4, "floatForKey:", CFSTR("info-spacing"));
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarSpacing:](self, "setInfoBarSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("info-height"));
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarHeight:](self, "setInfoBarHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("section-row-limit"));
  -[BKLibraryBookshelfCellMetrics_Grid setSectionItemRowLimit:](self, "setSectionItemRowLimit:", (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("new-badge-color")));
  -[BKLibraryBookshelfCellMetrics_Grid setUnreadBadgeColor:](self, "setUnreadBadgeColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("next-badge-color")));
  -[BKLibraryBookshelfCellMetrics_Grid setNextBadgeColor:](self, "setNextBadgeColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("proof-badge-color")));
  -[BKLibraryBookshelfCellMetrics_Grid setProofBadgeColor:](self, "setProofBadgeColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("preorderable-badge-color")));
  -[BKLibraryBookshelfCellMetrics_Grid setPreOrderableBadgeColor:](self, "setPreOrderableBadgeColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("preordered-badge-color")));
  -[BKLibraryBookshelfCellMetrics_Grid setPreOrderedBadgeColor:](self, "setPreOrderedBadgeColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("sample-badge-color")));
  -[BKLibraryBookshelfCellMetrics_Grid setSampleBadgeColor:](self, "setSampleBadgeColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("price-color")));
  -[BKLibraryBookshelfCellMetrics_Grid setPriceColor:](self, "setPriceColor:", v12);

  objc_msgSend(v4, "floatForKey:", CFSTR("info-dots-spacing"));
  -[BKLibraryBookshelfCellMetrics_Grid setDotsSpacing:](self, "setDotsSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("info-cloud-spacing"));
  -[BKLibraryBookshelfCellMetrics_Grid setCloudSpacing:](self, "setCloudSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("info-audio-badge-spacing"));
  -[BKLibraryBookshelfCellMetrics_Grid setAudioBadgeSpacing:](self, "setAudioBadgeSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("info-badge-endcap"));
  -[BKLibraryBookshelfCellMetrics_Grid setBadgeEndCapWidth:](self, "setBadgeEndCapWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("info-date-height"));
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarExpectedDateHeight:](self, "setInfoBarExpectedDateHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("info-date-spacing"));
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarDateSpacing:](self, "setInfoBarDateSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("drag-alpha"));
  -[BKLibraryBookshelfCellMetrics_Grid setDragAlpha:](self, "setDragAlpha:");
  objc_msgSend(v4, "floatForKey:", CFSTR("audiobook-control-margin"));
  -[BKLibraryBookshelfCellMetrics_Grid setAudiobookControlMargin:](self, "setAudiobookControlMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("audiobook-control-diameter"));
  -[BKLibraryBookshelfCellMetrics_Grid setAudiobookControlDiameter:](self, "setAudiobookControlDiameter:");
  objc_msgSend(v4, "floatForKey:", CFSTR("sequence-label-top-margin"));
  -[BKLibraryBookshelfCellMetrics_Grid setSeriesSequenceLabelTopMargin:](self, "setSeriesSequenceLabelTopMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("sequence-label-bottom-margin"));
  -[BKLibraryBookshelfCellMetrics_Grid setSeriesSequenceLabelBottomMargin:](self, "setSeriesSequenceLabelBottomMargin:");
  objc_msgSend(v4, "floatForKey:", CFSTR("now-playing-inter-level-spacing"));
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingInterLevelSpacing:](self, "setNowPlayingInterLevelSpacing:");
  objc_msgSend(v4, "floatForKey:", CFSTR("now-playinglevelcornerradius"));
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingLevelCornerRadius:](self, "setNowPlayingLevelCornerRadius:");
  objc_msgSend(v4, "floatForKey:", CFSTR("now-playing-level-width"));
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingLevelWidth:](self, "setNowPlayingLevelWidth:");
  objc_msgSend(v4, "floatForKey:", CFSTR("now-playing-maximum-level-height"));
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingMaximumLevelHeight:](self, "setNowPlayingMaximumLevelHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("now-playing-minimum-level-height"));
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingMinimumLevelHeight:](self, "setNowPlayingMinimumLevelHeight:");
  objc_msgSend(v4, "floatForKey:", CFSTR("now-playing-number-of-levels"));
  -[BKLibraryBookshelfCellMetrics_Grid setNowPlayingNumberOfLevels:](self, "setNowPlayingNumberOfLevels:", (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("timeRemainingLabel")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Grid setTimeRemainingFontAttributes:](self, "setTimeRemainingFontAttributes:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("infoBadge")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBadgeFontAttributes:](self, "setInfoBadgeFontAttributes:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("infoDate")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attributesForAttributedStringCentered:truncated:", 0, 1));
  -[BKLibraryBookshelfCellMetrics_Grid setExpectedDateFontAttributes:](self, "setExpectedDateFontAttributes:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCellMetrics_Grid expectedDateFontAttributes](self, "expectedDateFontAttributes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "font"));

  objc_msgSend(v21, "bk_heightFromCapLineToDescender");
  -[BKLibraryBookshelfCellMetrics_Grid setInfoBarExpectedDateHeight:](self, "setInfoBarExpectedDateHeight:");

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("smallTitleFont")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "attributesForAttributedStringCentered:truncated:", 0, 1));
  -[BKLibraryBookshelfCellMetrics_Grid setSmallTitleFontAttributes:](self, "setSmallTitleFontAttributes:", v23);

  -[BKLibraryBookshelfCellMetrics_Grid setNumOfLinesSmallTitle:](self, "setNumOfLinesSmallTitle:", objc_msgSend(v4, "integerForKey:", CFSTR("number-of-lines-small-title")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpecForKey:", CFSTR("sequenceDisplayLabel")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "attributesForAttributedString"));
  -[BKLibraryBookshelfCellMetrics_Grid setSeriesSequenceLabelFontAttributes:](self, "setSeriesSequenceLabelFontAttributes:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCellMetrics_Grid seriesSequenceLabelFontAttributes](self, "seriesSequenceLabelFontAttributes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "font"));

  objc_msgSend(v27, "capHeight");
  -[BKLibraryBookshelfCellMetrics_Grid setSeriesSequenceLabelHeight:](self, "setSeriesSequenceLabelHeight:");

  objc_msgSend(v4, "floatForKey:", CFSTR("small-title-top-margin"));
  v29 = v28;

  -[BKLibraryBookshelfCellMetrics_Grid setSmallTitleTopMargin:](self, "setSmallTitleTopMargin:", v29);
}

- (double)dimmedAlpha
{
  return self->_dimmedAlpha;
}

- (void)setDimmedAlpha:(double)a3
{
  self->_dimmedAlpha = a3;
}

- (double)dimmedScale
{
  return self->_dimmedScale;
}

- (void)setDimmedScale:(double)a3
{
  self->_dimmedScale = a3;
}

- (CGSize)cellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cellSize.width;
  height = self->_cellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (CGSize)smallCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_smallCellSize.width;
  height = self->_smallCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSmallCellSize:(CGSize)a3
{
  self->_smallCellSize = a3;
}

- (double)cellAspect
{
  return self->_cellAspect;
}

- (void)setCellAspect:(double)a3
{
  self->_cellAspect = a3;
}

- (double)dragAlpha
{
  return self->_dragAlpha;
}

- (void)setDragAlpha:(double)a3
{
  self->_dragAlpha = a3;
}

- (int64_t)sectionItemRowLimit
{
  return self->_sectionItemRowLimit;
}

- (void)setSectionItemRowLimit:(int64_t)a3
{
  self->_sectionItemRowLimit = a3;
}

- (double)infoBarSpacing
{
  return self->_infoBarSpacing;
}

- (void)setInfoBarSpacing:(double)a3
{
  self->_infoBarSpacing = a3;
}

- (double)infoBarHeight
{
  return self->_infoBarHeight;
}

- (void)setInfoBarHeight:(double)a3
{
  self->_infoBarHeight = a3;
}

- (double)infoBarExpectedDateHeight
{
  return self->_infoBarExpectedDateHeight;
}

- (void)setInfoBarExpectedDateHeight:(double)a3
{
  self->_infoBarExpectedDateHeight = a3;
}

- (double)infoBarDateSpacing
{
  return self->_infoBarDateSpacing;
}

- (void)setInfoBarDateSpacing:(double)a3
{
  self->_infoBarDateSpacing = a3;
}

- (double)dotsSpacing
{
  return self->_dotsSpacing;
}

- (void)setDotsSpacing:(double)a3
{
  self->_dotsSpacing = a3;
}

- (double)cloudSpacing
{
  return self->_cloudSpacing;
}

- (void)setCloudSpacing:(double)a3
{
  self->_cloudSpacing = a3;
}

- (double)audioBadgeSpacing
{
  return self->_audioBadgeSpacing;
}

- (void)setAudioBadgeSpacing:(double)a3
{
  self->_audioBadgeSpacing = a3;
}

- (double)badgeEndCapWidth
{
  return self->_badgeEndCapWidth;
}

- (void)setBadgeEndCapWidth:(double)a3
{
  self->_badgeEndCapWidth = a3;
}

- (TUIFontAttributes)expectedDateFontAttributes
{
  return self->_expectedDateFontAttributes;
}

- (void)setExpectedDateFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (TUIFontAttributes)timeRemainingFontAttributes
{
  return self->_timeRemainingFontAttributes;
}

- (void)setTimeRemainingFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (TUIFontAttributes)infoBadgeFontAttributes
{
  return self->_infoBadgeFontAttributes;
}

- (void)setInfoBadgeFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (TUIFontAttributes)seriesSequenceLabelFontAttributes
{
  return self->_seriesSequenceLabelFontAttributes;
}

- (void)setSeriesSequenceLabelFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (UIColor)unreadBadgeColor
{
  return self->_unreadBadgeColor;
}

- (void)setUnreadBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_unreadBadgeColor, a3);
}

- (UIColor)nextBadgeColor
{
  return self->_nextBadgeColor;
}

- (void)setNextBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_nextBadgeColor, a3);
}

- (UIColor)proofBadgeColor
{
  return self->_proofBadgeColor;
}

- (void)setProofBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_proofBadgeColor, a3);
}

- (UIColor)preOrderableBadgeColor
{
  return self->_preOrderableBadgeColor;
}

- (void)setPreOrderableBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_preOrderableBadgeColor, a3);
}

- (UIColor)preOrderedBadgeColor
{
  return self->_preOrderedBadgeColor;
}

- (void)setPreOrderedBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_preOrderedBadgeColor, a3);
}

- (UIColor)sampleBadgeColor
{
  return self->_sampleBadgeColor;
}

- (void)setSampleBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_sampleBadgeColor, a3);
}

- (UIColor)priceColor
{
  return self->_priceColor;
}

- (void)setPriceColor:(id)a3
{
  objc_storeStrong((id *)&self->_priceColor, a3);
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

- (double)nowPlayingInterLevelSpacing
{
  return self->_nowPlayingInterLevelSpacing;
}

- (void)setNowPlayingInterLevelSpacing:(double)a3
{
  self->_nowPlayingInterLevelSpacing = a3;
}

- (double)nowPlayingLevelCornerRadius
{
  return self->_nowPlayingLevelCornerRadius;
}

- (void)setNowPlayingLevelCornerRadius:(double)a3
{
  self->_nowPlayingLevelCornerRadius = a3;
}

- (double)nowPlayingLevelWidth
{
  return self->_nowPlayingLevelWidth;
}

- (void)setNowPlayingLevelWidth:(double)a3
{
  self->_nowPlayingLevelWidth = a3;
}

- (double)nowPlayingMaximumLevelHeight
{
  return self->_nowPlayingMaximumLevelHeight;
}

- (void)setNowPlayingMaximumLevelHeight:(double)a3
{
  self->_nowPlayingMaximumLevelHeight = a3;
}

- (double)nowPlayingMinimumLevelHeight
{
  return self->_nowPlayingMinimumLevelHeight;
}

- (void)setNowPlayingMinimumLevelHeight:(double)a3
{
  self->_nowPlayingMinimumLevelHeight = a3;
}

- (int64_t)nowPlayingNumberOfLevels
{
  return self->_nowPlayingNumberOfLevels;
}

- (void)setNowPlayingNumberOfLevels:(int64_t)a3
{
  self->_nowPlayingNumberOfLevels = a3;
}

- (double)seriesSequenceLabelTopMargin
{
  return self->_seriesSequenceLabelTopMargin;
}

- (void)setSeriesSequenceLabelTopMargin:(double)a3
{
  self->_seriesSequenceLabelTopMargin = a3;
}

- (double)seriesSequenceLabelBottomMargin
{
  return self->_seriesSequenceLabelBottomMargin;
}

- (void)setSeriesSequenceLabelBottomMargin:(double)a3
{
  self->_seriesSequenceLabelBottomMargin = a3;
}

- (double)seriesSequenceLabelHeight
{
  return self->_seriesSequenceLabelHeight;
}

- (void)setSeriesSequenceLabelHeight:(double)a3
{
  self->_seriesSequenceLabelHeight = a3;
}

- (TUIFontAttributes)smallTitleFontAttributes
{
  return self->_smallTitleFontAttributes;
}

- (void)setSmallTitleFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (int64_t)numOfLinesSmallTitle
{
  return self->_numOfLinesSmallTitle;
}

- (void)setNumOfLinesSmallTitle:(int64_t)a3
{
  self->_numOfLinesSmallTitle = a3;
}

- (double)smallTitleTopMargin
{
  return self->_smallTitleTopMargin;
}

- (void)setSmallTitleTopMargin:(double)a3
{
  self->_smallTitleTopMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallTitleFontAttributes, 0);
  objc_storeStrong((id *)&self->_priceColor, 0);
  objc_storeStrong((id *)&self->_sampleBadgeColor, 0);
  objc_storeStrong((id *)&self->_preOrderedBadgeColor, 0);
  objc_storeStrong((id *)&self->_preOrderableBadgeColor, 0);
  objc_storeStrong((id *)&self->_proofBadgeColor, 0);
  objc_storeStrong((id *)&self->_nextBadgeColor, 0);
  objc_storeStrong((id *)&self->_unreadBadgeColor, 0);
  objc_storeStrong((id *)&self->_seriesSequenceLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_infoBadgeFontAttributes, 0);
  objc_storeStrong((id *)&self->_timeRemainingFontAttributes, 0);
  objc_storeStrong((id *)&self->_expectedDateFontAttributes, 0);
}

@end
