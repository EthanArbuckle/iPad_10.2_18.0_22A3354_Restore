@implementation PXMonthCardSectionBodyLayoutSpec

- (PXMonthCardSectionBodyLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  PXMonthCardSectionBodyLayoutSpec *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXMonthCardSectionBodyLayoutSpec;
  v7 = -[PXCuratedLibraryCardSectionBodyLayoutSpec initWithExtendedTraitCollection:options:](&v22, sel_initWithExtendedTraitCollection_options_, v6, a4);
  if (v7)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXFeatureSpec userInterfaceIdiom](v7, "userInterfaceIdiom") == 4)
    {
      -[PXFeatureSpec contentGuideInsetsForScrollAxis:](v7, "contentGuideInsetsForScrollAxis:", 1);
      v10 = v9;
LABEL_18:
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setHorizontalMargin:](v7, "setHorizontalMargin:", v10);
      -[PXMonthCardSectionBodyLayoutSpec _configureDynamicAspectRatioWithExtendedTraitCollection:](v7, "_configureDynamicAspectRatioWithExtendedTraitCollection:", v6);
LABEL_21:
      objc_msgSend(v8, "cornerRadiusForMonths");
      *(float *)&v17 = v17;
      LODWORD(v18) = LODWORD(v17);
      LODWORD(v19) = LODWORD(v17);
      LODWORD(v20) = LODWORD(v17);
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setCornerRadius:](v7, "setCornerRadius:", v17, v18, v19, v20);
      v7->_layoutStyle = objc_msgSend(v6, "curatedLibraryLayoutStyle");
      -[PXFeatureSpec spacingBetweenMonthCards](v7, "spacingBetweenMonthCards");
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setDistanceToNextLayout:](v7, "setDistanceToNextLayout:");

      goto LABEL_22;
    }
    if (-[PXFeatureSpec userInterfaceIdiom](v7, "userInterfaceIdiom") == 5)
    {
      objc_msgSend(v8, "lateralMarginMonths");
      -[PXCuratedLibraryCardSectionBodyLayoutSpec setHorizontalMargin:](v7, "setHorizontalMargin:");
      v11 = 1.5;
    }
    else
    {
      if (-[PXFeatureSpec sizeClass](v7, "sizeClass") == 2)
      {
        -[PXCuratedLibraryCardSectionBodyLayoutSpec horizontalMargin](v7, "horizontalMargin");
        v13 = v12;
        if (objc_msgSend(v6, "windowOrientation") == 1)
          v13 = v13 + v13;
        -[PXFeatureSpec layoutReferenceSize](v7, "layoutReferenceSize");
        if (v13 > 104.0 || v14 < 1112.0)
          v10 = v13;
        else
          v10 = 104.0;
        goto LABEL_18;
      }
      if (objc_msgSend(v6, "layoutOrientation") == 2)
      {
        objc_msgSend(v6, "layoutReferenceSize");
        v10 = (v16 + -560.0) * 0.5;
        if (v10 < 104.0)
          v10 = 104.0;
        goto LABEL_18;
      }
      objc_msgSend(v8, "aspectRatioForCompactPortraitMonths");
    }
    -[PXCuratedLibraryCardSectionBodyLayoutSpec setAspectRatio:](v7, "setAspectRatio:", v11);
    goto LABEL_21;
  }
LABEL_22:

  return v7;
}

- (double)interitemSpacing
{
  double result;

  if (self->_layoutStyle == 1 && -[PXFeatureSpec sizeClass](self, "sizeClass") != 2)
    return 6.0;
  -[PXFeatureSpec spacingBetweenMonthCards](self, "spacingBetweenMonthCards");
  return result;
}

- (void)_configureDynamicAspectRatioWithExtendedTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[PXFeatureSpec layoutReferenceSize](self, "layoutReferenceSize");
  v6 = v5;
  -[PXCuratedLibraryCardSectionBodyLayoutSpec horizontalMargin](self, "horizontalMargin");
  v8 = v6 + v7 * -2.0;
  -[PXMonthCardSectionBodyLayoutSpec _cardHeightWithExtendedTraitCollection:](self, "_cardHeightWithExtendedTraitCollection:", v4);
  v10 = v9;

  -[PXCuratedLibraryCardSectionBodyLayoutSpec setAspectRatio:](self, "setAspectRatio:", v8 / v10);
}

- (double)_cardHeightWithExtendedTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PXExploreLayoutMetrics *v17;
  PXExploreLayoutGenerator *v18;
  double v19;
  double v20;
  PXCuratedLibraryStyleGuide *v21;
  double v22;
  PXCuratedLibraryChapterHeaderLayoutSpec *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v4 = a3;
  -[PXFeatureSpec layoutReferenceSize](self, "layoutReferenceSize");
  v6 = v5;
  v8 = v7;
  -[PXFeatureSpec safeAreaInsets](self, "safeAreaInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[PXExploreLayoutMetrics initWithSpec:]([PXExploreLayoutMetrics alloc], "initWithSpec:", self);
  -[PXLayoutMetrics setReferenceSize:](v17, "setReferenceSize:", v6, v8);
  -[PXExploreLayoutMetrics setSafeAreaInsets:](v17, "setSafeAreaInsets:", v10, v12, v14, v16);
  v18 = -[PXExploreLayoutGenerator initWithMetrics:]([PXExploreLayoutGenerator alloc], "initWithMetrics:", v17);
  -[PXExploreLayoutGenerator setItemCount:](v18, "setItemCount:", 1);
  -[PXExploreLayoutGenerator setItemLayoutInfoBlock:](v18, "setItemLayoutInfoBlock:", &__block_literal_global_119393);
  -[PXExploreLayoutGenerator size](v18, "size");
  v20 = v19;
  if (objc_msgSend(v4, "layoutSizeClass") == 2)
  {
    v21 = -[PXCuratedLibraryStyleGuide initWithExtendedTraitCollection:]([PXCuratedLibraryStyleGuide alloc], "initWithExtendedTraitCollection:", v4);
    -[PXCuratedLibraryStyleGuide secondaryToolbarContentInsets](v21, "secondaryToolbarContentInsets");
    if (v22 >= v10)
      v10 = v22;

  }
  v23 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXCuratedLibraryChapterHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:", v4);
  -[PXCuratedLibraryChapterHeaderLayoutSpec titleHeight](v23, "titleHeight");
  v25 = v10 + 11.0 + v24;
  -[PXCuratedLibraryChapterHeaderLayoutSpec spacingBetweenTitleBottomAndNextCardTop](v23, "spacingBetweenTitleBottomAndNextCardTop");
  v27 = v8 - v14 + (v25 + v26) * -2.0;
  if (v20 >= v27)
    v28 = v27;
  else
    v28 = v20;

  return v28;
}

id __75__PXMonthCardSectionBodyLayoutSpec__cardHeightWithExtendedTraitCollection___block_invoke()
{
  return (id)objc_msgSend(objc_alloc((Class)off_1E50B3218), "initWithSize:weight:", 1.0, 1.0, 1.0);
}

@end
