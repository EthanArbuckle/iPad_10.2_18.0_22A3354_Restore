@implementation PXCuratedLibrarySectionHeaderLayoutSpec

- (PXTitleSubtitleLabelSpec)titleSubtitleLabelSpec
{
  return self->_titleSubtitleLabelSpec;
}

- (void)setTitleSubtitleLabelSpec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setWantsTitle:(BOOL)a3
{
  self->_wantsTitle = a3;
}

- (void)setWantsSubtitle:(BOOL)a3
{
  self->_wantsSubtitle = a3;
}

- (void)setGradientAlpha:(double)a3
{
  self->_gradientAlpha = a3;
}

- (void)setEllipsisButtonSpecialTreatment:(BOOL)a3
{
  self->_ellipsisButtonSpecialTreatment = a3;
}

- (void)setContentPadding:(UIEdgeInsets)a3
{
  self->_contentPadding = a3;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  id v8;
  PXCuratedLibrarySectionHeaderLayoutSpec *v9;
  PXCuratedLibrarySectionHeaderLayoutSpec *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PXCuratedLibraryStyleGuide *v18;
  PXCuratedLibraryStyleGuide *styleGuide;
  uint64_t v20;
  PXExtendedImageConfiguration *headerGradientImageConfiguration;
  void *v22;
  objc_super v24;

  v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXCuratedLibrarySectionHeaderLayoutSpec;
  v9 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v24, sel_initWithExtendedTraitCollection_options_, v8, a4);
  v10 = v9;
  if (v9)
  {
    v9->_variant = a5;
    v11 = objc_msgSend(v8, "contentSizeCategory");
    v12 = 34.0;
    if ((unint64_t)(v11 - 8) >= 5)
      v12 = 28.0;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setButtonHeight:](v10, "setButtonHeight:", v12);
    v13 = objc_msgSend(v8, "layoutSizeClass");
    if (v13 == 1)
      v14 = 8.0;
    else
      v14 = 12.0;
    if (v13 == 1)
      v15 = 12.0;
    else
      v15 = 16.0;
    if (v13 == 1)
      v16 = 8.0;
    else
      v16 = 11.0;
    if (v13 == 1)
      v17 = 9.0;
    else
      v17 = 12.0;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setButtonSpacing:](v10, "setButtonSpacing:", v14);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setButtonHorizontalPadding:](v10, "setButtonHorizontalPadding:", v15);
    v10->_minimumSpacingBetweenTopSafeAreaAndContentTop = v16;
    v10->_minimumSpacingBetweenTopSafeAreaAndTitleTop = v17;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitlePadding:](v10, "setTitlePadding:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v18 = -[PXCuratedLibraryStyleGuide initWithExtendedTraitCollection:]([PXCuratedLibraryStyleGuide alloc], "initWithExtendedTraitCollection:", v8);
    styleGuide = v10->_styleGuide;
    v10->_styleGuide = v18;

    v20 = objc_msgSend(objc_alloc((Class)off_1E50B2470), "initWithImageName:", CFSTR("PXHeaderGradient"));
    headerGradientImageConfiguration = v10->_headerGradientImageConfiguration;
    v10->_headerGradientImageConfiguration = (PXExtendedImageConfiguration *)v20;

    v10->_canShowCancelButton = 1;
    v10->_canShowSelectButton = 1;
    v10->_canShowEllipsisButton = 1;
    if (objc_msgSend(v8, "curatedLibraryLayoutStyle") == 1)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_titleSubtitleColorOverBackground, v22);

  }
  return v10;
}

- (void)setTitlePadding:(UIEdgeInsets)a3
{
  self->_titlePadding = a3;
}

- (void)setButtonSpacing:(double)a3
{
  self->_buttonSpacing = a3;
}

- (void)setButtonHorizontalPadding:(double)a3
{
  self->_buttonHorizontalPadding = a3;
}

- (void)setButtonHeight:(double)a3
{
  self->_buttonHeight = a3;
}

- (PXTitleSubtitleLabelSpec)debugNonInterestingTitleSubtitleLabelSpec
{
  return self->_debugNonInterestingTitleSubtitleLabelSpec;
}

- (PXTitleSubtitleLabelSpec)debugInterestingTitleSubtitleLabelSpec
{
  return self->_debugInterestingTitleSubtitleLabelSpec;
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientHeight = a3;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setGradientRespectsSafeArea:(BOOL)a3
{
  self->_gradientRespectsSafeArea = a3;
}

- (void)setDebugNonInterestingTitleSubtitleLabelSpec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void)setDebugInterestingTitleSubtitleLabelSpec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void)setCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_cornerRadius.var0.var0.topLeft = v3;
  self->_cornerRadius.var0.var0.topRight = v4;
  self->_cornerRadius.var0.var0.bottomLeft = v5;
  self->_cornerRadius.var0.var0.bottomRight = v6;
}

- (void)setTextFadeOutMinimumAlpha:(double)a3
{
  self->_textFadeOutMinimumAlpha = a3;
}

- (void)setShouldTextFadeOutWhenReachingTop:(BOOL)a3
{
  self->_shouldTextFadeOutWhenReachingTop = a3;
}

- (void)setFadeOutDistanceFromSafeAreaTop:(double)a3
{
  self->_fadeOutDistanceFromSafeAreaTop = a3;
}

- (void)setFadeOutDistance:(double)a3
{
  self->_fadeOutDistance = a3;
}

- (UIEdgeInsets)adjustedContentPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[PXCuratedLibrarySectionHeaderLayoutSpec ellipsisButtonSpecialTreatment](self, "ellipsisButtonSpecialTreatment")
    && -[PXCuratedLibrarySectionHeaderLayoutSpec isFloating](self, "isFloating")
    && -[PXFeatureSpec sizeClass](self, "sizeClass") == 1
    && -[PXFeatureSpec layoutOrientation](self, "layoutOrientation") == 2)
  {
    -[PXFeatureSpec safeAreaInsets](self, "safeAreaInsets");
    top = top + v8;
  }
  v9 = top;
  v10 = left;
  v11 = bottom;
  v12 = right;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (BOOL)ellipsisButtonSpecialTreatment
{
  return self->_ellipsisButtonSpecialTreatment;
}

- (void)setSwapTitleWithSubtitle:(BOOL)a3
{
  self->_swapTitleWithSubtitle = a3;
}

- (void)setShouldOmitYear:(BOOL)a3
{
  self->_shouldOmitYear = a3;
}

- (void)setShouldButtonsFadeOutWhenReachingTop:(BOOL)a3
{
  self->_shouldButtonsFadeOutWhenReachingTop = a3;
}

- (double)fadeOutDistance
{
  return self->_fadeOutDistance;
}

- (void)setSmallVariantSpec:(id)a3
{
  objc_storeStrong((id *)&self->_smallVariantSpec, a3);
}

- (void)setFirstCardVariantSpec:(id)a3
{
  objc_storeStrong((id *)&self->_firstCardVariantSpec, a3);
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstCardVariantSpec, 0);
  objc_storeStrong((id *)&self->_smallVariantSpec, 0);
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_headerGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_subtitleDateFormatter, 0);
  objc_storeStrong((id *)&self->_titleDateFormatter, 0);
  objc_storeStrong((id *)&self->_debugNonInterestingTitleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_debugInterestingTitleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_titleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_titleSubtitleColorOverBackground, 0);
}

- (BOOL)requiresTitleRenderedAsView
{
  return self->_requiresTitleRenderedAsView;
}

- (BOOL)wantsInlineHeader
{
  return self->_wantsInlineHeader;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)buttonSpacing
{
  return self->_buttonSpacing;
}

- (UIEdgeInsets)contentPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentPadding.top;
  left = self->_contentPadding.left;
  bottom = self->_contentPadding.bottom;
  right = self->_contentPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)wantsTitle
{
  return self->_wantsTitle;
}

- (UIEdgeInsets)titlePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_titlePadding.top;
  left = self->_titlePadding.left;
  bottom = self->_titlePadding.bottom;
  right = self->_titlePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)minimumSpacingBetweenTopSafeAreaAndTitleTop
{
  return self->_minimumSpacingBetweenTopSafeAreaAndTitleTop;
}

- (double)maximumTitleSubtitleHeight
{
  void *v2;
  double v3;
  double v4;

  -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](self, "titleSubtitleLabelSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumTitleSubtitleHeight");
  v4 = v3;

  return v4;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (BOOL)showMainEllipsisButtonWhenSecondaryEllipsisButtonIsShown:(BOOL)a3 selectButtonIsShown:(BOOL)a4
{
  return a3;
}

- (BOOL)shouldAvoidOverlapWithSecondaryToolbar
{
  return self->_shouldAvoidOverlapWithSecondaryToolbar;
}

- (BOOL)gradientRespectsSafeArea
{
  return self->_gradientRespectsSafeArea;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (double)gradientAlpha
{
  return self->_gradientAlpha;
}

- (BOOL)canShowZoomButtons
{
  return self->_canShowZoomButtons;
}

- (BOOL)canShowSelectButton
{
  return self->_canShowSelectButton;
}

- (BOOL)canShowCancelButton
{
  return self->_canShowCancelButton;
}

- (double)buttonHorizontalPadding
{
  return self->_buttonHorizontalPadding;
}

- (double)minimumSpacingBetweenTopSafeAreaAndContentTop
{
  return self->_minimumSpacingBetweenTopSafeAreaAndContentTop;
}

- (BOOL)wantsSubtitle
{
  return self->_wantsSubtitle;
}

- (void)setTitleDateFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setSubtitleDateFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setShouldAvoidOverlapWithSecondaryToolbar:(BOOL)a3
{
  self->_shouldAvoidOverlapWithSecondaryToolbar = a3;
}

- (void)setShouldAccommodateLeadingButtonsLayout:(BOOL)a3
{
  self->_shouldAccommodateLeadingButtonsLayout = a3;
}

- (void)setWantsInlineHeader:(BOOL)a3
{
  self->_wantsInlineHeader = a3;
}

- (void)setRequiresTitleRenderedAsView:(BOOL)a3
{
  self->_requiresTitleRenderedAsView = a3;
}

- (void)setInlineHeaderStyle:(unint64_t)a3
{
  self->_inlineHeaderStyle = a3;
}

- (UIEdgeInsets)curatedLibraryEdgeToEdgeContentDefaultPadding
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibrarySectionHeaderLayoutSpec;
  -[PXFeatureSpec curatedLibraryEdgeToEdgeContentDefaultPadding](&v7, sel_curatedLibraryEdgeToEdgeContentDefaultPadding);
  -[PXCuratedLibrarySectionHeaderLayoutSpec adjustedContentPadding:](self, "adjustedContentPadding:");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (void)setCanShowZoomButtons:(BOOL)a3
{
  self->_canShowZoomButtons = a3;
}

- (void)setCanShowAspectFitButtons:(BOOL)a3
{
  self->_canShowAspectFitButtons = a3;
}

- (PXExtendedImageConfiguration)headerGradientImageConfiguration
{
  return self->_headerGradientImageConfiguration;
}

- (BOOL)shouldTextFadeOutWhenReachingTop
{
  return self->_shouldTextFadeOutWhenReachingTop;
}

- (BOOL)shouldButtonsFadeOutWhenReachingTop
{
  return self->_shouldButtonsFadeOutWhenReachingTop;
}

- (NSDateFormatter)titleDateFormatter
{
  return self->_titleDateFormatter;
}

- (BOOL)swapTitleWithSubtitle
{
  return self->_swapTitleWithSubtitle;
}

- (NSDateFormatter)subtitleDateFormatter
{
  return self->_subtitleDateFormatter;
}

- (BOOL)shouldOmitYear
{
  return self->_shouldOmitYear;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](self, "initWithExtendedTraitCollection:options:variant:", a3, a4, 0);
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (BOOL)canShowEllipsisButton
{
  return self->_canShowEllipsisButton;
}

- (void)setCanShowEllipsisButton:(BOOL)a3
{
  self->_canShowEllipsisButton = a3;
}

- (void)setCanShowSelectButton:(BOOL)a3
{
  self->_canShowSelectButton = a3;
}

- (void)setCanShowCancelButton:(BOOL)a3
{
  self->_canShowCancelButton = a3;
}

- (BOOL)canShowAspectFitButtons
{
  return self->_canShowAspectFitButtons;
}

- (UIColor)titleSubtitleColorOverBackground
{
  return self->_titleSubtitleColorOverBackground;
}

- (unint64_t)inlineHeaderStyle
{
  return self->_inlineHeaderStyle;
}

- (double)fadeOutDistanceFromSafeAreaTop
{
  return self->_fadeOutDistanceFromSafeAreaTop;
}

- (double)textFadeOutMinimumAlpha
{
  return self->_textFadeOutMinimumAlpha;
}

- (double)buttonsFadeOutMinimumAlpha
{
  return self->_buttonsFadeOutMinimumAlpha;
}

- (void)setButtonsFadeOutMinimumAlpha:(double)a3
{
  self->_buttonsFadeOutMinimumAlpha = a3;
}

- (BOOL)shouldAccommodateLeadingButtonsLayout
{
  return self->_shouldAccommodateLeadingButtonsLayout;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)smallVariantSpec
{
  return self->_smallVariantSpec;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)firstCardVariantSpec
{
  return self->_firstCardVariantSpec;
}

@end
