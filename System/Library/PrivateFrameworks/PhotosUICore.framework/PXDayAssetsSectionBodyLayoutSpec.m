@implementation PXDayAssetsSectionBodyLayoutSpec

- (PXDayAssetsSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  PXDayAssetsSectionBodyLayoutSpec *v4;
  void *v5;
  double v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXDayAssetsSectionBodyLayoutSpec;
  v4 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v9, sel_initWithExtendedTraitCollection_options_, a3, a4);
  if (v4)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interitemSpacingForDays");
    v4->_interitemSpacing = v6;
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_numberOfColumns = objc_msgSend(v7, "aggregatedHighlightColumns");

    v4->_allowsVideoPlaybackAtAnySize = 0;
  }
  return v4;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)bodyCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (BOOL)allowsVideoPlaybackAtAnySize
{
  return self->_allowsVideoPlaybackAtAnySize;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (BOOL)useHorizontalContentGuideInsets
{
  return self->_useHorizontalContentGuideInsets;
}

@end
