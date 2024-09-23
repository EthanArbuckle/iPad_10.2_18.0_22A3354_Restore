@implementation PXPhotosLayoutSpec

- (PXPhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 gridStyle:(int64_t)a5 wantsToggleSidebarButton:(BOOL)a6 shouldMakeSpaceForToggleSidebarButton:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  PXPhotosLayoutSpec *v13;
  void *v14;
  void *v15;
  char v16;
  PXZoomablePhotosLayoutSpec *v17;
  PXAssetsSectionLayoutSpec *v18;
  _BOOL8 wantsSectionsBlur;
  uint64_t v20;
  PXAssetsSectionLayoutSpec *assetsSpec;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  UIFont *headerTitleFont;
  uint64_t v34;
  UIFont *headerSubtitleFont;
  uint64_t v36;
  double v37;
  uint64_t v38;
  void *v39;
  UIColor *v40;
  uint64_t v41;
  UIColor *headerTitleOverBackgroundColor;
  uint64_t v43;
  UIColor *headerTitleOverContentColor;
  double v45;
  double v46;
  uint64_t v47;
  double v48;
  int v49;
  double v50;
  double v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  __CFString *v60;
  __CFString *v61;
  uint64_t v62;
  PXExtendedImageConfiguration *backgroundGradientImageConfiguration;
  uint64_t v64;
  PXExtendedImageConfiguration *behindContentBackgroundGradientImageConfiguration;
  uint64_t v66;
  int v67;
  double v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  UIColor *contentBackgroundColor;
  double v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  void *v86;
  uint64_t v87;
  UIFont *placeholderFont;
  uint64_t v89;
  UIColor *placeholderFontColor;
  _BOOL4 v92;
  PXZoomablePhotosLayoutSpec *v93;
  objc_super v94;

  v7 = a7;
  v12 = a3;
  v94.receiver = self;
  v94.super_class = (Class)PXPhotosLayoutSpec;
  v13 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v94, sel_initWithExtendedTraitCollection_options_, v12, a4);
  if (!v13)
    goto LABEL_71;
  v92 = v7;
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a5 == 2)
    v16 = objc_msgSend(v14, "enableBlurInContiguousCollections");
  else
    v16 = 0;
  v13->_wantsSectionsBlur = v16;
  v13->_preferredUserInterfaceStyle = 0;
  v17 = 0;
  if ((-[PXFeatureSpec options](v13, "options") & 2) == 0)
    v17 = -[PXZoomablePhotosLayoutSpec initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:]([PXZoomablePhotosLayoutSpec alloc], "initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:", v12, a4, 0, a5, 0, 0, 1.0, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3), v13->_preferredUserInterfaceStyle, 0);
  v18 = [PXAssetsSectionLayoutSpec alloc];
  wantsSectionsBlur = v13->_wantsSectionsBlur;
  -[PXZoomablePhotosLayoutSpec itemCornerRadius](v17, "itemCornerRadius");
  v93 = v17;
  v20 = -[PXAssetsSectionLayoutSpec initWithExtendedTraitCollection:options:variant:allowsBlur:itemCornerRadius:zoomableSpec:](v18, "initWithExtendedTraitCollection:options:variant:allowsBlur:itemCornerRadius:zoomableSpec:", v12, a4, 0, wantsSectionsBlur, v17);
  assetsSpec = v13->_assetsSpec;
  v13->_assetsSpec = (PXAssetsSectionLayoutSpec *)v20;

  v22 = objc_msgSend(v12, "userInterfaceIdiom") == 3;
  v13->_isTV = v22;
  v13->_allowsEmptyTitles = v22;
  objc_msgSend(v12, "headerCustomizationModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 && objc_msgSend(v23, "shouldUseTextStyles"))
  {
    v25 = objc_msgSend(v24, "titleTextStyle");
    v26 = objc_msgSend(v24, "subtitleTextStyle");
  }
  else
  {
    if (v13->_isTV)
      v25 = 5;
    else
      v25 = 3;
    if (v13->_isTV)
      v26 = 9;
    else
      v26 = 6;
  }
  if (objc_msgSend(v12, "userInterfaceIdiom") == 1)
    v27 = objc_msgSend(v15, "searchActionLocationOnPhone");
  else
    v27 = 1;
  v13->_searchActionLocation = v27;
  objc_msgSend(v12, "layoutMargins");
  v13->_headerTitleLeadingSpacing = v28;
  v29 = 20.0;
  if (!v13->_isTV)
    v29 = 10.0;
  v13->_headerTitleButtonAlignmentSpacing = v29;
  objc_msgSend(v15, "headerTitleTopSpacing");
  v13->_headerTitleTopSpacing = v30;
  objc_msgSend(v15, "headerTitleBottomSpacing");
  v13->_headerTitleBottomSpacing = v31;
  MEMORY[0x1A85CC970](v25, 32770, 0);
  v32 = objc_claimAutoreleasedReturnValue();
  headerTitleFont = v13->_headerTitleFont;
  v13->_headerTitleFont = (UIFont *)v32;

  MEMORY[0x1A85CC970](v26, 32770, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  headerSubtitleFont = v13->_headerSubtitleFont;
  v13->_headerSubtitleFont = (UIFont *)v34;

  v36 = -[PXFeatureSpec userInterfaceIdiom](v13, "userInterfaceIdiom");
  v37 = 44.0;
  if (v36 == 5)
    v37 = 92.0;
  v13->_topChromeHeight = v37;
  objc_msgSend(v12, "traitCollection");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  if (v13->_isTV || !v38)
  {
    if (objc_msgSend(v12, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v40 = (UIColor *)(id)objc_claimAutoreleasedReturnValue();
    headerTitleOverBackgroundColor = v13->_headerTitleOverBackgroundColor;
    v13->_headerTitleOverBackgroundColor = v40;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v40 = (UIColor *)objc_claimAutoreleasedReturnValue();
    -[UIColor resolvedColorWithTraitCollection:](v40, "resolvedColorWithTraitCollection:", v39);
    v41 = objc_claimAutoreleasedReturnValue();
    headerTitleOverBackgroundColor = v13->_headerTitleOverBackgroundColor;
    v13->_headerTitleOverBackgroundColor = (UIColor *)v41;
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v43 = objc_claimAutoreleasedReturnValue();
  headerTitleOverContentColor = v13->_headerTitleOverContentColor;
  v13->_headerTitleOverContentColor = (UIColor *)v43;

  v13->_wantsToggleSidebarButton = a6;
  v45 = 60.0;
  v46 = 0.0;
  if (!v92)
    v45 = 0.0;
  v13->_topTrailingChromeWidth = v45;
  v47 = objc_msgSend(v39, "horizontalSizeClass");
  v48 = 10.0;
  if (v47 != 1)
  {
    v49 = PLHasHomeButton();
    v48 = 10.0;
    if (!v49)
      v48 = 0.0;
  }
  v13->_aspectFitContentVerticalPadding = v48;
  v50 = 168.0;
  if (!v13->_isTV)
    v50 = 0.0;
  v13->_squareContentVerticalPadding = v50;
  v51 = 30.0;
  if (a5 != 2)
    v51 = 10.0;
  v13->_interSectionSpacing = v51;
  v52 = objc_msgSend(v12, "layoutSizeClass");
  v53 = 12.0;
  if (v52 == 1)
    v53 = 8.0;
  v13->_interButtonSpacing = v53;
  v13->_interPageSpacing = 10.0;
  if (v36 != 5)
  {
    if (-[PXFeatureSpec userInterfaceFeature](v13, "userInterfaceFeature") == 7)
      goto LABEL_48;
    -[PXFeatureSpec curatedLibraryEdgeToEdgeContentDefaultPadding](v13, "curatedLibraryEdgeToEdgeContentDefaultPadding");
    v55 = v54;
    objc_msgSend(v12, "layoutMargins");
    if (v55 - v56 >= 0.0)
      v57 = v55 - v56;
    else
      v57 = 0.0;
    objc_msgSend(v12, "displayScale");
    v46 = v58 * v57;
  }
  v13->_endButtonSpacing = v46;
LABEL_48:
  v13->_backgroundGradientCornerRadius = 0.0;
  v59 = objc_msgSend(v15, "enableTitleLegibilityDimmingFilter");
  v60 = CFSTR("PXHeaderGradient");
  if (v59)
    v60 = CFSTR("PXHeaderGradient2");
  v61 = v60;
  v62 = objc_msgSend(objc_alloc((Class)off_1E50B2470), "initWithImageName:", v61);

  backgroundGradientImageConfiguration = v13->_backgroundGradientImageConfiguration;
  v13->_backgroundGradientImageConfiguration = (PXExtendedImageConfiguration *)v62;

  v64 = objc_msgSend(objc_alloc((Class)off_1E50B2470), "initWithImageName:", CFSTR("PXHeaderGradientBehindContent"));
  behindContentBackgroundGradientImageConfiguration = v13->_behindContentBackgroundGradientImageConfiguration;
  v13->_behindContentBackgroundGradientImageConfiguration = (PXExtendedImageConfiguration *)v64;

  v66 = 0;
  if (a5 == 2)
  {
    v67 = objc_msgSend(v15, "enableScrollSnapInContiguousCollections");
    v66 = 3;
    if (!v67)
      v66 = 0;
  }
  v13->_scrollSnapBehavior = v66;
  objc_msgSend(v15, "scrollSnapMaximumDecelerationFactor");
  v13->_scrollSnapMaximumDecelerationFactor = v68;
  objc_msgSend(v15, "scrollSnapMaximumAccelerationFactor");
  v13->_scrollSnapMaximumAccelerationFactor = v69;
  v13->_wantsShowAllButtonsInSectionFooters = objc_msgSend(v15, "enableShowMoreButtonsInEditorialLens");
  v70 = objc_msgSend(v12, "preferredBackgroundStyle");
  if (v70 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v71 = objc_claimAutoreleasedReturnValue();
  }
  else if (v70 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v71 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v70)
      goto LABEL_60;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v71 = objc_claimAutoreleasedReturnValue();
  }
  contentBackgroundColor = v13->_contentBackgroundColor;
  v13->_contentBackgroundColor = (UIColor *)v71;

LABEL_60:
  v73 = 0.0;
  if (!v13->_isTV && -[PXFeatureSpec userInterfaceStyle](v13, "userInterfaceStyle") != 2)
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v74, "forceDarkDetailsView"))
      v73 = 0.0;
    else
      v73 = 1.0;

  }
  v13->_contentBackgroundOpacity = v73;
  if (a5 == 4)
  {
    -[PXFeatureSpec layoutReferenceSize](v13, "layoutReferenceSize");
    v76 = v75;
    v78 = v77;
    if ((PXSizeIsEmpty() & 1) == 0)
    {
      +[PXPhotosDynamicHeaderLayout headerMinimumHeightForReferenceSize:](PXPhotosDynamicHeaderLayout, "headerMinimumHeightForReferenceSize:", v76, v78);
      v80 = v79;
      -[PXFeatureSpec layoutMargins](v13, "layoutMargins");
      v82 = v81;
      v84 = v83;
      -[PXFeatureSpec safeAreaInsets](v13, "safeAreaInsets");
      v13->_contentUnavailablePlaceholderDirectionalLayoutMargins.top = v80 - v85;
      v13->_contentUnavailablePlaceholderDirectionalLayoutMargins.leading = v82;
      v13->_contentUnavailablePlaceholderDirectionalLayoutMargins.bottom = 0.0;
      v13->_contentUnavailablePlaceholderDirectionalLayoutMargins.trailing = v84;
    }
    v13->_contentUnavailablePlaceholderDisablesVerticalBounce = 1;
    v86 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
    objc_msgSend(v86, "systemFontOfSize:");
    v87 = objc_claimAutoreleasedReturnValue();
    placeholderFont = v13->_placeholderFont;
    v13->_placeholderFont = (UIFont *)v87;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v89 = objc_claimAutoreleasedReturnValue();
    placeholderFontColor = v13->_placeholderFontColor;
    v13->_placeholderFontColor = (UIColor *)v89;

  }
LABEL_71:

  return v13;
}

- (PXPhotosSectionHeaderLayoutSpec)sectionHeaderSpec
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayoutSpec.m"), 184, CFSTR("Section header spec accessed on invalid parent spec (not configured for section headers)"));

  abort();
}

- (NSString)visualEffectViewGroupName
{
  return (NSString *)CFSTR("PhotosGridVisualEffectViewBackdropGroup");
}

- (void)configureScrollSnapController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setSnapBehavior:", -[PXPhotosLayoutSpec scrollSnapBehavior](self, "scrollSnapBehavior"));
  -[PXPhotosLayoutSpec scrollSnapMaximumDecelerationFactor](self, "scrollSnapMaximumDecelerationFactor");
  objc_msgSend(v4, "setMaximumDecelerationFactor:");
  -[PXPhotosLayoutSpec scrollSnapMaximumAccelerationFactor](self, "scrollSnapMaximumAccelerationFactor");
  objc_msgSend(v4, "setMaximumAccelerationFactor:");

}

- (PXAssetsSectionLayoutSpec)assetsSpec
{
  return self->_assetsSpec;
}

- (int64_t)searchActionLocation
{
  return self->_searchActionLocation;
}

- (double)headerTitleLeadingSpacing
{
  return self->_headerTitleLeadingSpacing;
}

- (double)headerTitleButtonAlignmentSpacing
{
  return self->_headerTitleButtonAlignmentSpacing;
}

- (double)headerTitleTopSpacing
{
  return self->_headerTitleTopSpacing;
}

- (double)headerTitleBottomSpacing
{
  return self->_headerTitleBottomSpacing;
}

- (UIFont)headerTitleFont
{
  return self->_headerTitleFont;
}

- (UIFont)headerSubtitleFont
{
  return self->_headerSubtitleFont;
}

- (UIColor)headerTitleOverBackgroundColor
{
  return self->_headerTitleOverBackgroundColor;
}

- (UIColor)headerTitleOverContentColor
{
  return self->_headerTitleOverContentColor;
}

- (BOOL)wantsToggleSidebarButton
{
  return self->_wantsToggleSidebarButton;
}

- (double)topTrailingChromeWidth
{
  return self->_topTrailingChromeWidth;
}

- (double)topChromeHeight
{
  return self->_topChromeHeight;
}

- (double)aspectFitContentVerticalPadding
{
  return self->_aspectFitContentVerticalPadding;
}

- (double)squareContentVerticalPadding
{
  return self->_squareContentVerticalPadding;
}

- (double)backgroundGradientCornerRadius
{
  return self->_backgroundGradientCornerRadius;
}

- (PXExtendedImageConfiguration)backgroundGradientImageConfiguration
{
  return self->_backgroundGradientImageConfiguration;
}

- (PXExtendedImageConfiguration)behindContentBackgroundGradientImageConfiguration
{
  return self->_behindContentBackgroundGradientImageConfiguration;
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (double)contentBackgroundOpacity
{
  return self->_contentBackgroundOpacity;
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (double)interButtonSpacing
{
  return self->_interButtonSpacing;
}

- (double)endButtonSpacing
{
  return self->_endButtonSpacing;
}

- (BOOL)wantsShowAllButtonsInSectionFooters
{
  return self->_wantsShowAllButtonsInSectionFooters;
}

- (BOOL)wantsSectionsBlur
{
  return self->_wantsSectionsBlur;
}

- (BOOL)isTV
{
  return self->_isTV;
}

- (BOOL)allowsEmptyTitles
{
  return self->_allowsEmptyTitles;
}

- (double)interPageSpacing
{
  return self->_interPageSpacing;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (NSDirectionalEdgeInsets)contentUnavailablePlaceholderDirectionalLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentUnavailablePlaceholderDirectionalLayoutMargins.top;
  leading = self->_contentUnavailablePlaceholderDirectionalLayoutMargins.leading;
  bottom = self->_contentUnavailablePlaceholderDirectionalLayoutMargins.bottom;
  trailing = self->_contentUnavailablePlaceholderDirectionalLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (BOOL)contentUnavailablePlaceholderDisablesVerticalBounce
{
  return self->_contentUnavailablePlaceholderDisablesVerticalBounce;
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (UIColor)placeholderFontColor
{
  return self->_placeholderFontColor;
}

- (int64_t)scrollSnapBehavior
{
  return self->_scrollSnapBehavior;
}

- (double)scrollSnapMaximumDecelerationFactor
{
  return self->_scrollSnapMaximumDecelerationFactor;
}

- (double)scrollSnapMaximumAccelerationFactor
{
  return self->_scrollSnapMaximumAccelerationFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderFontColor, 0);
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_behindContentBackgroundGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_headerTitleOverContentColor, 0);
  objc_storeStrong((id *)&self->_headerTitleOverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_headerSubtitleFont, 0);
  objc_storeStrong((id *)&self->_headerTitleFont, 0);
  objc_storeStrong((id *)&self->_assetsSpec, 0);
}

@end
