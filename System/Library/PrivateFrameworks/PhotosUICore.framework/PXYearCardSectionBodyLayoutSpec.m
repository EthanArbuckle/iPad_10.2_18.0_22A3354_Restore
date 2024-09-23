@implementation PXYearCardSectionBodyLayoutSpec

- (PXYearCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  PXYearCardSectionBodyLayoutSpec *v7;
  PXYearCardSectionBodyLayoutSpec *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXYearCardSectionBodyLayoutSpec;
  v7 = -[PXCuratedLibraryCardSectionBodyLayoutSpec initWithExtendedTraitCollection:options:](&v16, sel_initWithExtendedTraitCollection_options_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[PXYearCardSectionBodyLayoutSpec setMultiColumnAspectRatio:](v7, "setMultiColumnAspectRatio:", 1.0);
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "layoutSizeClass") == 2)
    {
      objc_msgSend(v9, "aspectRatioForRegularYears");
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setAspectRatio:](v8, "setAspectRatio:");
      if (objc_msgSend(v6, "userInterfaceIdiom") == 4)
      {
        -[PXFeatureSpec contentGuideInsetsForScrollAxis:](v8, "contentGuideInsetsForScrollAxis:", 1);
        -[PXCuratedLibraryCardSectionBodyLayoutSpec setHorizontalMargin:](v8, "setHorizontalMargin:", v10);
      }
    }
    else if (objc_msgSend(v6, "layoutOrientation") == 2)
    {
      objc_msgSend(v9, "aspectRatioForCompactLandscapeYears");
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setAspectRatio:](v8, "setAspectRatio:");
      -[PXYearCardSectionBodyLayoutSpec setMultiColumnAspectRatio:](v8, "setMultiColumnAspectRatio:", 1.5);
    }
    else
    {
      objc_msgSend(v9, "aspectRatioForCompactPortraitYears");
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setAspectRatio:](v8, "setAspectRatio:");
    }
    objc_msgSend(v9, "cornerRadiusForYears");
    *(float *)&v11 = v11;
    LODWORD(v12) = LODWORD(v11);
    LODWORD(v13) = LODWORD(v11);
    LODWORD(v14) = LODWORD(v11);
    -[PXCuratedLibraryCardSectionBodyLayoutSpec setCornerRadius:](v8, "setCornerRadius:", v11, v12, v13, v14);

  }
  return v8;
}

- (void)setMultiColumnAspectRatio:(double)a3
{
  self->_multiColumnAspectRatio = a3;
}

- (double)multiColumnAspectRatio
{
  return self->_multiColumnAspectRatio;
}

@end
