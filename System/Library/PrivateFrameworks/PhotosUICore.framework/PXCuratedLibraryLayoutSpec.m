@implementation PXCuratedLibraryLayoutSpec

- (PXAssetsSectionLayoutSpec)sectionLayoutSpec
{
  return self->_sectionLayoutSpec;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)daysTopHeaderSpec
{
  return self->_daysTopHeaderSpec;
}

- (double)spacingBetweenHeaderLastBaselineAndAllPhotosTop
{
  return self->_spacingBetweenHeaderLastBaselineAndAllPhotosTop;
}

- (NSNumber)inlineHeaderOverlayTopInsetOverride
{
  return self->_inlineHeaderOverlayTopInsetOverride;
}

- (double)interbuttonSpacing
{
  return self->_interbuttonSpacing;
}

- (BOOL)allowsSlideshowInYears
{
  return self->_allowsSlideshowInYears;
}

- (int64_t)variant
{
  return self->_variant;
}

- (PXCuratedLibraryLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  id v8;
  PXCuratedLibraryLayoutSpec *v9;
  PXCuratedLibraryLayoutSpec *v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  UIColor *backgroundColor;
  UIColor *contentBackgroundColor;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  _QWORD *p_top;
  uint64_t v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  __int128 v35;
  PXCuratedLibraryYearsTopHeaderSpec *v36;
  PXCuratedLibrarySectionHeaderLayoutSpec *yearsTopHeaderSpec;
  PXCuratedLibraryMonthsTopHeaderSpec *v38;
  PXCuratedLibrarySectionHeaderLayoutSpec *monthsTopHeaderSpec;
  PXCuratedLibraryDaysTopHeaderSpec *v40;
  PXCuratedLibrarySectionHeaderLayoutSpec *daysTopHeaderSpec;
  PXAllPhotosFloatingHeaderSpec *v42;
  PXCuratedLibrarySectionHeaderLayoutSpec *allPhotosFloatingHeaderSpec;
  PXAssetsSectionLayoutSpec *v44;
  PXAssetsSectionLayoutSpec *sectionLayoutSpec;
  NSNumber *inlineHeaderOverlayTopInsetOverride;
  PXYearCardSectionBodyLayoutSpec *v47;
  PXMonthCardSectionBodyLayoutSpec *v48;
  uint64_t v49;
  uint64_t v50;
  PXYearsLayoutMetrics *v51;
  PXYearsLayoutMetrics *yearsLayoutMetrics;
  PXMonthsLayoutMetrics *v53;
  PXMonthsLayoutMetrics *monthsLayoutMetrics;
  PXCuratedLibraryChapterHeaderLayoutSpec *v55;
  BOOL v56;
  BOOL v57;
  uint64_t v58;
  PXExtendedImageConfiguration *statusBarGradientImageConfiguration;
  objc_super v61;

  v8 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PXCuratedLibraryLayoutSpec;
  v9 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v61, sel_initWithExtendedTraitCollection_options_, v8, a4);
  v10 = v9;
  if (!v9)
    goto LABEL_55;
  v9->_variant = a5;
  v9->_axis = 1;
  v11 = -[PXFeatureSpec sizeClass](v9, "sizeClass");
  v12 = 36.0;
  if (v11 != 2)
    v12 = 8.0;
  v13 = 34.0;
  if (v11 != 2)
    v13 = 20.0;
  v10->_spacingBetweenSafeAreaTopAndFirstYearCard = v12;
  v10->_spacingBetweenSafeAreaTopAndFirstMonthTitle = v13;
  v10->_spacingBetweenHeaderLastBaselineAndAllPhotosTop = v13;
  v14 = objc_msgSend(v8, "layoutSizeClass");
  v15 = 12.0;
  if (v14 == 1)
    v15 = 8.0;
  v10->_interbuttonSpacing = v15;
  -[PXFeatureSpec spacingBetweenYearCards](v10, "spacingBetweenYearCards");
  v10->_spacingBetweenYears = v16;
  v10->_isTopSafeAreaFullyCovered = -[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") == 4;
  -[PXFeatureSpec spacingBetweenMonthCards](v10, "spacingBetweenMonthCards");
  v10->_estimatedSpacingBetweenMonths = v17;
  v10->_spacingBetweenMonths = -1.0;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "spacingBetweenDays");
  v10->_spacingBetweenDays = v19;

  v20 = objc_msgSend(v8, "curatedLibraryLayoutStyle");
  v10->_layoutStyle = v20;
  v21 = objc_msgSend(v8, "curatedLibraryLayoutStyle");
  v22 = v21 == 1;
  if (-[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") == 5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v10->_backgroundColor;
    v10->_backgroundColor = (UIColor *)v23;

    contentBackgroundColor = v10->_contentBackgroundColor;
    v10->_contentBackgroundColor = 0;

  }
  else if (-[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") != 4)
  {
    if (v21 == 1)
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_backgroundColor, v26);

    if (v21 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    objc_storeStrong((id *)&v10->_contentBackgroundColor, v27);
    if (v21 != 1)
      goto LABEL_22;

    goto LABEL_21;
  }
  if (v21 != 1)
  {
LABEL_22:
    v28 = v10->_backgroundColor;
    goto LABEL_23;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  objc_storeStrong((id *)&v10->_contentUnavailableBackgroundColor, v28);
  if (v21 == 1)

  v10->_wantsBlurredBackground = v22;
  v10->_wantsBlurredSecondaryToolbarTransition = v22;
  v29 = objc_msgSend(v8, "userInterfaceIdiom") != 4 && objc_msgSend(v8, "userInterfaceIdiom") != 5;
  v10->_wantsStatusBarGradient = v29;
  p_top = (_QWORD *)&v10->_blurredBackgroundEdgeInsets.top;
  if (objc_msgSend(v8, "userInterfaceIdiom") == 4)
  {
    objc_msgSend(v8, "layoutMargins");
    *p_top = v31;
    v10->_blurredBackgroundEdgeInsets.left = v32;
    v10->_blurredBackgroundEdgeInsets.bottom = v33;
    v10->_blurredBackgroundEdgeInsets.right = v34;
  }
  else
  {
    v35 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)p_top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&v10->_blurredBackgroundEdgeInsets.bottom = v35;
  }
  v36 = -[PXCuratedLibraryYearsTopHeaderSpec initWithExtendedTraitCollection:options:variant:]([PXCuratedLibraryYearsTopHeaderSpec alloc], "initWithExtendedTraitCollection:options:variant:", v8, a4, a5);
  yearsTopHeaderSpec = v10->_yearsTopHeaderSpec;
  v10->_yearsTopHeaderSpec = &v36->super;

  v38 = -[PXCuratedLibraryMonthsTopHeaderSpec initWithExtendedTraitCollection:options:variant:]([PXCuratedLibraryMonthsTopHeaderSpec alloc], "initWithExtendedTraitCollection:options:variant:", v8, a4, a5);
  monthsTopHeaderSpec = v10->_monthsTopHeaderSpec;
  v10->_monthsTopHeaderSpec = &v38->super;

  v40 = -[PXCuratedLibraryDaysTopHeaderSpec initWithExtendedTraitCollection:options:variant:]([PXCuratedLibraryDaysTopHeaderSpec alloc], "initWithExtendedTraitCollection:options:variant:", v8, a4, a5);
  daysTopHeaderSpec = v10->_daysTopHeaderSpec;
  v10->_daysTopHeaderSpec = &v40->super;

  v42 = -[PXAllPhotosFloatingHeaderSpec initWithExtendedTraitCollection:options:variant:]([PXAllPhotosFloatingHeaderSpec alloc], "initWithExtendedTraitCollection:options:variant:", v8, a4, a5);
  allPhotosFloatingHeaderSpec = v10->_allPhotosFloatingHeaderSpec;
  v10->_allPhotosFloatingHeaderSpec = &v42->super;

  v44 = -[PXAssetsSectionLayoutSpec initWithExtendedTraitCollection:options:variant:allowsBlur:itemCornerRadius:zoomableSpec:]([PXAssetsSectionLayoutSpec alloc], "initWithExtendedTraitCollection:options:variant:allowsBlur:itemCornerRadius:zoomableSpec:", v8, a4, a5, 0, 0, 0.0);
  sectionLayoutSpec = v10->_sectionLayoutSpec;
  v10->_sectionLayoutSpec = v44;

  if (-[PXFeatureSpec sizeClass](v10, "sizeClass") != 2 && -[PXFeatureSpec sizeSubclass](v10, "sizeSubclass") == 1)
    -[PXFeatureSpec layoutOrientation](v10, "layoutOrientation");
  if (-[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") == 5)
  {
    inlineHeaderOverlayTopInsetOverride = v10->_inlineHeaderOverlayTopInsetOverride;
    v10->_inlineHeaderOverlayTopInsetOverride = (NSNumber *)&unk_1E53EDA10;

  }
  v47 = -[PXYearCardSectionBodyLayoutSpec initWithExtendedTraitCollection:options:]([PXYearCardSectionBodyLayoutSpec alloc], "initWithExtendedTraitCollection:options:", v8, a4);
  v48 = -[PXMonthCardSectionBodyLayoutSpec initWithExtendedTraitCollection:options:]([PXMonthCardSectionBodyLayoutSpec alloc], "initWithExtendedTraitCollection:options:", v8, a4);
  if (-[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") == 2)
    v49 = objc_msgSend(v8, "windowOrientation");
  else
    v49 = -[PXFeatureSpec layoutOrientation](v10, "layoutOrientation");
  v50 = v49;
  v51 = objc_alloc_init(PXYearsLayoutMetrics);
  yearsLayoutMetrics = v10->_yearsLayoutMetrics;
  v10->_yearsLayoutMetrics = v51;

  -[PXYearsLayoutMetrics setSizeClass:](v10->_yearsLayoutMetrics, "setSizeClass:", -[PXFeatureSpec sizeClass](v10, "sizeClass"));
  -[PXYearsLayoutMetrics setOrientation:](v10->_yearsLayoutMetrics, "setOrientation:", v50);
  -[PXFeatureSpec spacingBetweenYearCards](v47, "spacingBetweenYearCards");
  -[PXYearsLayoutMetrics setInteritemSpacing:](v10->_yearsLayoutMetrics, "setInteritemSpacing:");
  -[PXCuratedLibraryCardSectionBodyLayoutSpec aspectRatio](v47, "aspectRatio");
  -[PXYearsLayoutMetrics setDefaultItemAspectRatio:](v10->_yearsLayoutMetrics, "setDefaultItemAspectRatio:");
  -[PXYearsLayoutMetrics setLayoutStyle:](v10->_yearsLayoutMetrics, "setLayoutStyle:", v20);
  -[PXCuratedLibraryCardSectionBodyLayoutSpec horizontalMargin](v47, "horizontalMargin");
  if (-[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") == 2)
    -[PXCuratedLibraryCardSectionBodyLayoutSpec horizontalMargin](v48, "horizontalMargin");
  PXEdgeInsetsMake();
  -[PXYearsLayoutMetrics setPadding:](v10->_yearsLayoutMetrics, "setPadding:");
  -[PXYearCardSectionBodyLayoutSpec multiColumnAspectRatio](v47, "multiColumnAspectRatio");
  -[PXYearsLayoutMetrics setMultiColumnAspectRatio:](v10->_yearsLayoutMetrics, "setMultiColumnAspectRatio:");
  v53 = objc_alloc_init(PXMonthsLayoutMetrics);
  monthsLayoutMetrics = v10->_monthsLayoutMetrics;
  v10->_monthsLayoutMetrics = v53;

  -[PXMonthsLayoutMetrics setSizeClass:](v10->_monthsLayoutMetrics, "setSizeClass:", -[PXFeatureSpec sizeClass](v10, "sizeClass"));
  -[PXMonthsLayoutMetrics setOrientation:](v10->_monthsLayoutMetrics, "setOrientation:", v50);
  -[PXMonthCardSectionBodyLayoutSpec interitemSpacing](v48, "interitemSpacing");
  -[PXMonthsLayoutMetrics setInteritemSpacing:](v10->_monthsLayoutMetrics, "setInteritemSpacing:");
  -[PXCuratedLibraryCardSectionBodyLayoutSpec aspectRatio](v48, "aspectRatio");
  -[PXMonthsLayoutMetrics setDefaultSectionAspectRatio:](v10->_monthsLayoutMetrics, "setDefaultSectionAspectRatio:");
  -[PXMonthsLayoutMetrics setLayoutStyle:](v10->_monthsLayoutMetrics, "setLayoutStyle:", v20);
  -[PXMonthsLayoutMetrics setDisplaceTopLeadingCardTitle:](v10->_monthsLayoutMetrics, "setDisplaceTopLeadingCardTitle:", 0);
  -[PXCuratedLibraryCardSectionBodyLayoutSpec horizontalMargin](v48, "horizontalMargin");
  -[PXCuratedLibraryCardSectionBodyLayoutSpec horizontalMargin](v48, "horizontalMargin");
  PXEdgeInsetsMake();
  -[PXMonthsLayoutMetrics setPadding:](v10->_monthsLayoutMetrics, "setPadding:");
  v55 = -[PXCuratedLibraryChapterHeaderLayoutSpec initWithExtendedTraitCollection:options:]([PXCuratedLibraryChapterHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:", v8, a4);
  -[PXCuratedLibraryChapterHeaderLayoutSpec titleHeight](v55, "titleHeight");
  -[PXMonthsLayoutMetrics setChapterHeaderHeight:](v10->_monthsLayoutMetrics, "setChapterHeaderHeight:");
  -[PXCuratedLibraryChapterHeaderLayoutSpec spacingBetweenTitleTopAndPreviousCardBottom](v55, "spacingBetweenTitleTopAndPreviousCardBottom");
  -[PXCuratedLibraryChapterHeaderLayoutSpec spacingBetweenTitleBottomAndNextCardTop](v55, "spacingBetweenTitleBottomAndNextCardTop");
  PXEdgeInsetsMake();
  -[PXMonthsLayoutMetrics setChapterHeaderPadding:](v10->_monthsLayoutMetrics, "setChapterHeaderPadding:");
  if (-[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") == 5)
  {
    if (v21 == 1)
    {
      PXEdgeInsetsMake();
      -[PXMonthsLayoutMetrics setPadding:](v10->_monthsLayoutMetrics, "setPadding:");
    }
    else
    {
      -[PXMonthsLayoutMetrics setDisplaceTopLeadingCardTitle:](v10->_monthsLayoutMetrics, "setDisplaceTopLeadingCardTitle:", 1);
      -[PXFeatureSpec spacingBetweenMonthCards](v48, "spacingBetweenMonthCards");
      -[PXMonthsLayoutMetrics setChapterHeaderHeight:](v10->_monthsLayoutMetrics, "setChapterHeaderHeight:");
      -[PXMonthsLayoutMetrics setChapterHeaderPadding:](v10->_monthsLayoutMetrics, "setChapterHeaderPadding:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    }
  }
  v56 = -[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") != 4
     && (-[PXFeatureSpec sizeClass](v10, "sizeClass") != 1
      || -[PXFeatureSpec layoutOrientation](v10, "layoutOrientation") != 1);
  v10->_allowsPaginatedScrollingInYearsAndMonths = v56;
  v57 = -[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") != 4
     && -[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") != 2
     && -[PXFeatureSpec userInterfaceIdiom](v10, "userInterfaceIdiom") != 5;
  v10->_allowsSlideshowInYears = v57;
  v58 = objc_msgSend(objc_alloc((Class)off_1E50B2470), "initWithImageName:", CFSTR("PXStatusBarGradient"));
  statusBarGradientImageConfiguration = v10->_statusBarGradientImageConfiguration;
  v10->_statusBarGradientImageConfiguration = (PXExtendedImageConfiguration *)v58;

LABEL_55:
  return v10;
}

- (PXExtendedImageConfiguration)statusBarGradientImageConfiguration
{
  return self->_statusBarGradientImageConfiguration;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)allPhotosFloatingHeaderSpec
{
  return self->_allPhotosFloatingHeaderSpec;
}

- (double)defaultInterlayoutSpacingForZoomLevel:(int64_t)a3
{
  int *v3;
  double result;
  void *v7;

  v3 = &OBJC_IVAR___PXCuratedLibraryLayoutSpec__spacingBetweenYears;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutSpec.m"), 177, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      goto LABEL_5;
    case 2:
      v3 = &OBJC_IVAR___PXCuratedLibraryLayoutSpec__spacingBetweenMonths;
      goto LABEL_5;
    case 3:
      v3 = &OBJC_IVAR___PXCuratedLibraryLayoutSpec__spacingBetweenDays;
LABEL_5:
      result = *(double *)((char *)&self->super.super.isa + *v3);
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentUnavailableBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_statusBarGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_inlineHeaderOverlayTopInsetOverride, 0);
  objc_storeStrong((id *)&self->_monthsLayoutMetrics, 0);
  objc_storeStrong((id *)&self->_yearsLayoutMetrics, 0);
  objc_storeStrong((id *)&self->_sectionLayoutSpec, 0);
  objc_storeStrong((id *)&self->_allPhotosFloatingHeaderSpec, 0);
  objc_storeStrong((id *)&self->_daysTopHeaderSpec, 0);
  objc_storeStrong((id *)&self->_monthsTopHeaderSpec, 0);
  objc_storeStrong((id *)&self->_yearsTopHeaderSpec, 0);
}

- (PXCuratedLibraryLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXCuratedLibraryLayoutSpec initWithExtendedTraitCollection:options:variant:](self, "initWithExtendedTraitCollection:options:variant:", a3, a4, 0);
}

- (double)blurredBackgroundOpacityForZoomLevel:(int64_t)a3
{
  _BOOL4 v6;
  double result;
  void *v8;
  void *v9;
  SEL v10;
  PXCuratedLibraryLayoutSpec *v11;
  uint64_t v12;

  v6 = -[PXCuratedLibraryLayoutSpec wantsBlurredBackground](self, "wantsBlurredBackground");
  result = 0.0;
  if (v6)
  {
    result = 1.0;
    if ((unint64_t)(a3 - 1) >= 2)
    {
      if ((unint64_t)(a3 - 3) >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3)
        {
          v9 = v8;
          v10 = a2;
          v11 = self;
          v12 = 211;
        }
        else
        {
          v9 = v8;
          v10 = a2;
          v11 = self;
          v12 = 202;
        }
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXCuratedLibraryLayoutSpec.m"), v12, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      return 0.0;
    }
  }
  return result;
}

- (BOOL)shouldExcludeNonLibraryRelatedActionsFromTopLevelEllipsisMenuForZoomLevel:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  if (a3 != 2)
    return 0;
  if (-[PXFeatureSpec sizeClass](self, "sizeClass") == 1)
    return -[PXFeatureSpec layoutOrientation](self, "layoutOrientation") == 2;
  return 0;
}

- (int64_t)axis
{
  return self->_axis;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)yearsTopHeaderSpec
{
  return self->_yearsTopHeaderSpec;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)monthsTopHeaderSpec
{
  return self->_monthsTopHeaderSpec;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (PXYearsLayoutMetrics)yearsLayoutMetrics
{
  return self->_yearsLayoutMetrics;
}

- (PXMonthsLayoutMetrics)monthsLayoutMetrics
{
  return self->_monthsLayoutMetrics;
}

- (double)spacingBetweenSafeAreaTopAndFirstYearCard
{
  return self->_spacingBetweenSafeAreaTopAndFirstYearCard;
}

- (double)spacingBetweenSafeAreaTopAndFirstMonthTitle
{
  return self->_spacingBetweenSafeAreaTopAndFirstMonthTitle;
}

- (BOOL)isTopSafeAreaFullyCovered
{
  return self->_isTopSafeAreaFullyCovered;
}

- (BOOL)allowsPaginatedScrollingInYearsAndMonths
{
  return self->_allowsPaginatedScrollingInYearsAndMonths;
}

- (BOOL)wantsStatusBarGradient
{
  return self->_wantsStatusBarGradient;
}

- (BOOL)wantsBlurredSecondaryToolbarTransition
{
  return self->_wantsBlurredSecondaryToolbarTransition;
}

- (BOOL)wantsBlurredBackground
{
  return self->_wantsBlurredBackground;
}

- (UIEdgeInsets)blurredBackgroundEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_blurredBackgroundEdgeInsets.top;
  left = self->_blurredBackgroundEdgeInsets.left;
  bottom = self->_blurredBackgroundEdgeInsets.bottom;
  right = self->_blurredBackgroundEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)contentUnavailableBackgroundColor
{
  return self->_contentUnavailableBackgroundColor;
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

@end
