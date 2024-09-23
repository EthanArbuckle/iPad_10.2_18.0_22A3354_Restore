@implementation _UIContextMenuPlatformMetrics

- (_UIClickPresentationFeedbackGeneratorConfiguration)presentationFeedbackConfiguration
{
  return self->_presentationFeedbackConfiguration;
}

- (_UIContextMenuPlatformMetrics)init
{
  _UIContextMenuPlatformMetrics *v2;
  _UIContextMenuPlatformMetrics *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_UIContextMenuPlatformMetrics;
  v2 = -[_UIContextMenuPlatformMetrics init](&v28, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIContextMenuPlatformMetrics setMenuHighlightBackgroundDescriptorProvider:](v2, "setMenuHighlightBackgroundDescriptorProvider:", &__block_literal_global_691);
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setMenuBackgroundEffect:](v3, "setMenuBackgroundEffect:", v4);

    -[_UIContextMenuPlatformMetrics setMenuCornerRadius:](v3, "setMenuCornerRadius:", 13.0);
    -[_UIContextMenuPlatformMetrics setApplySubmenuScaling:](v3, "setApplySubmenuScaling:", 1);
    -[_UIContextMenuPlatformMetrics setTrailingCascadedSubmenuOffset:](v3, "setTrailingCascadedSubmenuOffset:", -11.0, 1.0, 0.0);
    -[_UIContextMenuPlatformMetrics setLeadingCascadedSubmenuOffset:](v3, "setLeadingCascadedSubmenuOffset:", -5.0, 1.0, 0.0);
    -[_UIContextMenuPlatformMetrics setDefaultMenuWidth:](v3, "setDefaultMenuWidth:", 250.0);
    -[_UIContextMenuPlatformMetrics setLeadingIndentationWidth:](v3, "setLeadingIndentationWidth:", 16.0);
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v5, 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setItemSeparatorBackgroundEffect:](v3, "setItemSeparatorBackgroundEffect:", v6);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setItemSeparatorColor:](v3, "setItemSeparatorColor:", v7);

    -[_UIContextMenuPlatformMetrics setItemSubtitleRenderingMode:](v3, "setItemSubtitleRenderingMode:", 1);
    -[_UIContextMenuPlatformMetrics setItemPrimaryCompositingFilterProvider:](v3, "setItemPrimaryCompositingFilterProvider:", 0);
    -[_UIContextMenuPlatformMetrics setItemSubtitleCompositingFilterProvider:](v3, "setItemSubtitleCompositingFilterProvider:", &__block_literal_global_34_6);
    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_36_5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setItemSubtitleColor:](v3, "setItemSubtitleColor:", v8);

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    -[_UIContextMenuPlatformMetrics setItemSeparatorHeight:](v3, "setItemSeparatorHeight:", 1.0 / v10);

    -[_UIContextMenuPlatformMetrics setSectionSeparatorHeight:](v3, "setSectionSeparatorHeight:", 8.0);
    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_38_3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setSectionSeparatorColor:](v3, "setSectionSeparatorColor:", v11);

    -[_UIContextMenuPlatformMetrics setConvertPointBetweenViews:](v3, "setConvertPointBetweenViews:", &__block_literal_global_40_6);
    -[_UIContextMenuPlatformMetrics setItemTopToFirstBaseline:](v3, "setItemTopToFirstBaseline:", 28.0);
    -[_UIContextMenuPlatformMetrics setSmallItemTopToFirstBaseline:](v3, "setSmallItemTopToFirstBaseline:", 32.0);
    -[_UIContextMenuPlatformMetrics setItemLastBaselineToBottom:](v3, "setItemLastBaselineToBottom:", 15.6666667);
    -[_UIContextMenuPlatformMetrics setSmallItemLastBaselineToBottom:](v3, "setSmallItemLastBaselineToBottom:", 19.6666667);
    -[_UIContextMenuPlatformMetrics setItemBaselineToBaseline:](v3, "setItemBaselineToBaseline:", 20.0);
    -[_UIContextMenuPlatformMetrics setItemTopToFirstBaselineWithSubtitle:](v3, "setItemTopToFirstBaselineWithSubtitle:", 28.0);
    -[_UIContextMenuPlatformMetrics setItemLastBaselineToBottomWithSubtitle:](v3, "setItemLastBaselineToBottomWithSubtitle:", 15.6666667);
    -[_UIContextMenuPlatformMetrics setDynamicImageBoxWidth:](v3, "setDynamicImageBoxWidth:", 24.0);
    -[_UIContextMenuPlatformMetrics setMinIntraItemSpacing:](v3, "setMinIntraItemSpacing:", 4.0);
    -[_UIContextMenuPlatformMetrics setMenuItemInternalPadding:](v3, "setMenuItemInternalPadding:", 0.0, 16.0, 0.0, 16.0);
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setTitleFont:](v3, "setTitleFont:", v12);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedBody"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setTitleEmphasizedFont:](v3, "setTitleEmphasizedFont:", v13);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleSubhead"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setSubtitleFont:](v3, "setSubtitleFont:", v14);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setIconSymbolFont:](v3, "setIconSymbolFont:", v15);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedBody"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setIconEmphasizedSymbolFont:](v3, "setIconEmphasizedSymbolFont:", v16);

    -[_UIContextMenuPlatformMetrics setItemBackgroundColorProvider:](v3, "setItemBackgroundColorProvider:", 0);
    -[_UIContextMenuPlatformMetrics setItemPrimaryColorProvider:](v3, "setItemPrimaryColorProvider:", &__block_literal_global_43_3);
    -[_UIContextMenuPlatformMetrics setItemPrimaryDestructiveColorProvider:](v3, "setItemPrimaryDestructiveColorProvider:", &__block_literal_global_44_2);
    -[_UIContextMenuPlatformMetrics setItemPrimaryAlpha:](v3, "setItemPrimaryAlpha:", 0.96);
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleEmphasizedBody"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setDecorationViewSymbolConfiguration:](v3, "setDecorationViewSymbolConfiguration:", v17);

    -[_UIContextMenuPlatformMetrics setTrailingDecorationViewOffset:](v3, "setTrailingDecorationViewOffset:", 2.66666667);
    -[_UIContextMenuPlatformMetrics setLeadingDecorationViewOffset:](v3, "setLeadingDecorationViewOffset:", 2.66666667);
    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setTrailingAccessoryColor:](v3, "setTrailingAccessoryColor:", v18);

    -[_UIContextMenuPlatformMetrics setHeaderPadding:](v3, "setHeaderPadding:", 10.0, 16.0, 11.0, 16.0);
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setHeaderFont:](v3, "setHeaderFont:", v19);

    -[_UIContextMenuPlatformMetrics setHeaderTextAlignment:](v3, "setHeaderTextAlignment:", 4);
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setHeaderPrimaryColor:](v3, "setHeaderPrimaryColor:", v20);

    -[_UIContextMenuPlatformMetrics setHeaderRenderingMode:](v3, "setHeaderRenderingMode:", 1);
    -[_UIContextMenuPlatformMetrics setHeaderPrimaryCompositingFilterProvider:](v3, "setHeaderPrimaryCompositingFilterProvider:", 0);
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setMenuTitleFont:](v3, "setMenuTitleFont:", v21);

    -[_UIContextMenuPlatformMetrics headerPadding](v3, "headerPadding");
    -[_UIContextMenuPlatformMetrics setMenuTitlePadding:](v3, "setMenuTitlePadding:");
    -[_UIContextMenuPlatformMetrics setMenuTitleTextAlignment:](v3, "setMenuTitleTextAlignment:", 4);
    -[_UIContextMenuPlatformMetrics setHeaderRenderingMode:](v3, "setHeaderRenderingMode:", 1);
    -[_UIContextMenuPlatformMetrics setHeaderPrimaryCompositingFilterProvider:](v3, "setHeaderPrimaryCompositingFilterProvider:", 0);
    -[_UIContextMenuPlatformMetrics setForceUnpinnedHeader:](v3, "setForceUnpinnedHeader:", 0);
    -[_UIContextMenuPlatformMetrics setAlignMenuHeaderAndItemContents:](v3, "setAlignMenuHeaderAndItemContents:", 1);
    -[_UIContextMenuPlatformMetrics setMenuGutterWidth:](v3, "setMenuGutterWidth:", 12.0);
    -[_UIContextMenuPlatformMetrics setMenuMaximumHeight:](v3, "setMenuMaximumHeight:", 1.79769313e308);
    -[_UIContextMenuPlatformMetrics setMinimumContainerInsets:](v3, "setMinimumContainerInsets:", 8.0, 8.0, 8.0, 8.0);
    -[_UIContextMenuPlatformMetrics setGradientMaskingConfiguration:](v3, "setGradientMaskingConfiguration:", 0);
    -[_UIContextMenuPlatformMetrics setShouldApplyClippingHandler:](v3, "setShouldApplyClippingHandler:", 0);
    -[_UIContextMenuPlatformMetrics setShouldApplyShadowHandler:](v3, "setShouldApplyShadowHandler:", 0);
    -[_UIContextMenuPlatformMetrics setEnableFloatingFocusStyle:](v3, "setEnableFloatingFocusStyle:", 0);
    -[_UIContextMenuPlatformMetrics setAllowsItemHighlighting:](v3, "setAllowsItemHighlighting:", 1);
    -[_UIContextMenuPlatformMetrics setPaletteMinimumItemSize:](v3, "setPaletteMinimumItemSize:", 38.0, 54.0);
    -[_UIContextMenuPlatformMetrics setLeadingIndentationContributesToWidth:](v3, "setLeadingIndentationContributesToWidth:", 0);
    -[_UIContextMenuPlatformMetrics setContentInsetsApplyToHeaders:](v3, "setContentInsetsApplyToHeaders:", 1);
    +[UIShape rectShapeWithCornerRadius:](UIShape, "rectShapeWithCornerRadius:", 16.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shapeByApplyingInset:", 8.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setSmallItemContentShape:](v3, "setSmallItemContentShape:", v23);

    +[UIShape rectShapeWithCornerRadius:](UIShape, "rectShapeWithCornerRadius:", 16.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shapeByApplyingInset:", 8.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setMediumItemContentShape:](v3, "setMediumItemContentShape:", v25);

    +[_UIClickPresentationFeedbackGeneratorConfiguration defaultConfiguration](_UIClickPresentationFeedbackGeneratorConfiguration, "defaultConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setPresentationFeedbackConfiguration:](v3, "setPresentationFeedbackConfiguration:", v26);

    -[_UIContextMenuPlatformMetrics setMenuMinimumScale:](v3, "setMenuMinimumScale:", 0.8);
    -[_UIContextMenuPlatformMetrics setContentSpacingForContainer:](v3, "setContentSpacingForContainer:", 0);
    -[_UIContextMenuPlatformMetrics setWantsControlAlignmentWithHorizontalEdgeAdjustment:](v3, "setWantsControlAlignmentWithHorizontalEdgeAdjustment:", 1);
    -[_UIContextMenuPlatformMetrics setControlAttachmentYOffsetProvider:](v3, "setControlAttachmentYOffsetProvider:", &__block_literal_global_49_5);
    -[_UIContextMenuPlatformMetrics setPrefersWrapToSidesHandler:](v3, "setPrefersWrapToSidesHandler:", &__block_literal_global_51_2);
    -[_UIContextMenuPlatformMetrics setMaxLiftScale:](v3, "setMaxLiftScale:", 1.15);
    -[_UIContextMenuPlatformMetrics setMaxLiftScaleUpPoints:](v3, "setMaxLiftScaleUpPoints:", 26.0);
    -[_UIContextMenuPlatformMetrics setContainerViewsHitTestAsOpaque:](v3, "setContainerViewsHitTestAsOpaque:", 1);
    -[_UIContextMenuPlatformMetrics setSupportsPassthroughInteraction:](v3, "setSupportsPassthroughInteraction:", 1);
    -[_UIContextMenuPlatformMetrics setPreviewIsConstrainedToSourceWindowBounds:](v3, "setPreviewIsConstrainedToSourceWindowBounds:", 0);
    -[_UIContextMenuPlatformMetrics setPreviewPlatterMaximumSize:](v3, "setPreviewPlatterMaximumSize:", 343.0, 490.0);
    -[_UIContextMenuPlatformMetrics setPreviewPlatterCornerRadius:](v3, "setPreviewPlatterCornerRadius:", 13.0);

  }
  return v3;
}

- (void)setHeaderRenderingMode:(int64_t)a3
{
  self->_headerRenderingMode = a3;
}

- (void)setHeaderPrimaryCompositingFilterProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setWantsControlAlignmentWithHorizontalEdgeAdjustment:(BOOL)a3
{
  self->_wantsControlAlignmentWithHorizontalEdgeAdjustment = a3;
}

- (void)setTrailingDecorationViewOffset:(double)a3
{
  self->_trailingDecorationViewOffset = a3;
}

- (void)setTrailingCascadedSubmenuOffset:(CAPoint3D)a3
{
  self->_trailingCascadedSubmenuOffset = a3;
}

- (void)setTrailingAccessoryColor:(id)a3
{
  objc_storeStrong((id *)&self->_trailingAccessoryColor, a3);
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (void)setTitleEmphasizedFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleEmphasizedFont, a3);
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);
}

- (void)setShouldApplyShadowHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void)setShouldApplyClippingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void)setSectionSeparatorHeight:(double)a3
{
  self->_sectionSeparatorHeight = a3;
}

- (void)setSectionSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_sectionSeparatorColor, a3);
}

- (void)setPreviewPlatterMaximumSize:(CGSize)a3
{
  self->_previewPlatterMaximumSize = a3;
}

- (void)setPresentationFeedbackConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_presentationFeedbackConfiguration, a3);
}

- (void)setPrefersWrapToSidesHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (void)setPaletteMinimumItemSize:(CGSize)a3
{
  self->_paletteMinimumItemSize = a3;
}

- (void)setMinimumContainerInsets:(UIEdgeInsets)a3
{
  self->_minimumContainerInsets = a3;
}

- (void)setMinIntraItemSpacing:(double)a3
{
  self->_minIntraItemSpacing = a3;
}

- (void)setMenuTitleTextAlignment:(int64_t)a3
{
  self->_menuTitleTextAlignment = a3;
}

- (void)setMenuTitlePadding:(NSDirectionalEdgeInsets)a3
{
  self->_menuTitlePadding = a3;
}

- (void)setMenuTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_menuTitleFont, a3);
}

- (void)setMenuMinimumScale:(double)a3
{
  self->_menuMinimumScale = a3;
}

- (void)setMenuMaximumHeight:(double)a3
{
  self->_menuMaximumHeight = a3;
}

- (void)setMenuItemInternalPadding:(NSDirectionalEdgeInsets)a3
{
  self->_menuItemInternalPadding = a3;
}

- (void)setMenuHighlightBackgroundDescriptorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setMenuGutterWidth:(double)a3
{
  self->_menuGutterWidth = a3;
}

- (void)setMenuCornerRadius:(double)a3
{
  self->_menuCornerRadius = a3;
}

- (void)setMenuBackgroundEffect:(id)a3
{
  objc_storeStrong((id *)&self->_menuBackgroundEffect, a3);
}

- (void)setMaxLiftScaleUpPoints:(double)a3
{
  self->_maxLiftScaleUpPoints = a3;
}

- (void)setMaxLiftScale:(double)a3
{
  self->_maxLiftScale = a3;
}

- (void)setLeadingIndentationWidth:(double)a3
{
  self->_leadingIndentationWidth = a3;
}

- (void)setLeadingIndentationContributesToWidth:(BOOL)a3
{
  self->_leadingIndentationContributesToWidth = a3;
}

- (void)setLeadingDecorationViewOffset:(double)a3
{
  self->_leadingDecorationViewOffset = a3;
}

- (void)setLeadingCascadedSubmenuOffset:(CAPoint3D)a3
{
  self->_leadingCascadedSubmenuOffset = a3;
}

- (void)setItemTopToFirstBaselineWithSubtitle:(double)a3
{
  self->_itemTopToFirstBaselineWithSubtitle = a3;
}

- (void)setItemTopToFirstBaseline:(double)a3
{
  self->_itemTopToFirstBaseline = a3;
}

- (void)setItemSubtitleRenderingMode:(int64_t)a3
{
  self->_itemSubtitleRenderingMode = a3;
}

- (void)setItemSubtitleCompositingFilterProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setItemSubtitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_itemSubtitleColor, a3);
}

- (void)setItemSeparatorHeight:(double)a3
{
  self->_itemSeparatorHeight = a3;
}

- (void)setItemSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_itemSeparatorColor, a3);
}

- (void)setItemSeparatorBackgroundEffect:(id)a3
{
  objc_storeStrong((id *)&self->_itemSeparatorBackgroundEffect, a3);
}

- (void)setItemPrimaryDestructiveColorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void)setItemPrimaryCompositingFilterProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setItemPrimaryAlpha:(double)a3
{
  self->_itemPrimaryAlpha = a3;
}

- (void)setItemLastBaselineToBottomWithSubtitle:(double)a3
{
  self->_itemLastBaselineToBottomWithSubtitle = a3;
}

- (void)setItemLastBaselineToBottom:(double)a3
{
  self->_itemLastBaselineToBottom = a3;
}

- (void)setItemBaselineToBaseline:(double)a3
{
  self->_itemBaselineToBaseline = a3;
}

- (void)setItemBackgroundColorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setIconSymbolFont:(id)a3
{
  objc_storeStrong((id *)&self->_iconSymbolFont, a3);
}

- (void)setIconEmphasizedSymbolFont:(id)a3
{
  objc_storeStrong((id *)&self->_iconEmphasizedSymbolFont, a3);
}

- (void)setHeaderTextAlignment:(int64_t)a3
{
  self->_headerTextAlignment = a3;
}

- (void)setHeaderPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_headerPrimaryColor, a3);
}

- (void)setHeaderPadding:(NSDirectionalEdgeInsets)a3
{
  self->_headerPadding = a3;
}

- (void)setHeaderFont:(id)a3
{
  objc_storeStrong((id *)&self->_headerFont, a3);
}

- (void)setGradientMaskingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_gradientMaskingConfiguration, a3);
}

- (void)setForceUnpinnedHeader:(BOOL)a3
{
  self->_forceUnpinnedHeader = a3;
}

- (void)setEnableFloatingFocusStyle:(BOOL)a3
{
  self->_enableFloatingFocusStyle = a3;
}

- (void)setDynamicImageBoxWidth:(double)a3
{
  self->_dynamicImageBoxWidth = a3;
}

- (void)setDefaultMenuWidth:(double)a3
{
  self->_defaultMenuWidth = a3;
}

- (void)setDecorationViewSymbolConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void)setConvertPointBetweenViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setControlAttachmentYOffsetProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (void)setContentSpacingForContainer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void)setContentInsetsApplyToHeaders:(BOOL)a3
{
  self->_contentInsetsApplyToHeaders = a3;
}

- (void)setContainerViewsHitTestAsOpaque:(BOOL)a3
{
  self->_containerViewsHitTestAsOpaque = a3;
}

- (void)setApplySubmenuScaling:(BOOL)a3
{
  self->_applySubmenuScaling = a3;
}

- (void)setAllowsItemHighlighting:(BOOL)a3
{
  self->_allowsItemHighlighting = a3;
}

- (void)setAlignMenuHeaderAndItemContents:(BOOL)a3
{
  self->_alignMenuHeaderAndItemContents = a3;
}

- (NSDirectionalEdgeInsets)headerPadding
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_headerPadding.top;
  leading = self->_headerPadding.leading;
  bottom = self->_headerPadding.bottom;
  trailing = self->_headerPadding.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (double)previewRubberbandingCoefficient
{
  int v2;
  double result;

  v2 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_PlatterRubberbandingCoefficient, (uint64_t)CFSTR("PlatterRubberbandingCoefficient"));
  result = *(double *)&qword_1EDDA8500;
  if (v2)
    return 0.2;
  return result;
}

- (void)setPreviewRubberbandingCoefficient:(double)a3
{
  uint64_t *v4;
  uint64_t v5;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    qword_1EDDA8500 = *(_QWORD *)&a3;
    _UIInternalPreference_PlatterRubberbandingCoefficient = 0x7FFFFFFF;
    if (&_UIInternalPreferencesListener___COUNTER__ != &__PhotoLibraryFrameworkHandle)
    {
      v4 = &_UIInternalPreferencesListener___COUNTER__;
      do
      {
        v5 = *v4++;
        (*(void (**)(void))(v5 + 16))();
      }
      while (v4 != &__PhotoLibraryFrameworkHandle);
    }
  }
}

- (double)previewActionsStyleDragTearOffThreshold
{
  int v2;
  double result;

  v2 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_PlatterActionsStyleDragTearOffThreshold, (uint64_t)CFSTR("PlatterActionsStyleDragTearOffThreshold"));
  result = *(double *)&qword_1EDDA8510;
  if (v2)
    return 15.0;
  return result;
}

- (void)setPreviewActionsStyleDragTearOffThreshold:(double)a3
{
  uint64_t *v4;
  uint64_t v5;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    qword_1EDDA8510 = *(_QWORD *)&a3;
    _UIInternalPreference_PlatterActionsStyleDragTearOffThreshold = 0x7FFFFFFF;
    if (&_UIInternalPreferencesListener___COUNTER__ != &__PhotoLibraryFrameworkHandle)
    {
      v4 = &_UIInternalPreferencesListener___COUNTER__;
      do
      {
        v5 = *v4++;
        (*(void (**)(void))(v5 + 16))();
      }
      while (v4 != &__PhotoLibraryFrameworkHandle);
    }
  }
}

- (id)menuHeaderBackgroundProvider
{
  return _Block_copy(self->_menuTitleBackgroundProvider);
}

- (void)setMenuHeaderBackgroundProvider:(id)a3
{
  void *v4;
  id menuTitleBackgroundProvider;

  v4 = _Block_copy(a3);
  menuTitleBackgroundProvider = self->_menuTitleBackgroundProvider;
  self->_menuTitleBackgroundProvider = v4;

}

- (id)menuHighlightBackgroundDescriptorProvider
{
  return self->_menuHighlightBackgroundDescriptorProvider;
}

- (id)preDismissalHandler
{
  return self->_preDismissalHandler;
}

- (void)setPreDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)postDismissalHandler
{
  return self->_postDismissalHandler;
}

- (void)setPostDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)animateAlongsideTransition
{
  return self->_animateAlongsideTransition;
}

- (void)setAnimateAlongsideTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)containerViewProvider
{
  return self->_containerViewProvider;
}

- (void)setContainerViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)convertPointBetweenViews
{
  return self->_convertPointBetweenViews;
}

- (double)menuMaximumHeight
{
  return self->_menuMaximumHeight;
}

- (double)menuMinimumScale
{
  return self->_menuMinimumScale;
}

- (NSDirectionalEdgeInsets)menuItemInternalPadding
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_menuItemInternalPadding.top;
  leading = self->_menuItemInternalPadding.leading;
  bottom = self->_menuItemInternalPadding.bottom;
  trailing = self->_menuItemInternalPadding.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (double)menuGutterWidth
{
  return self->_menuGutterWidth;
}

- (UIVisualEffect)menuBackgroundEffect
{
  return self->_menuBackgroundEffect;
}

- (UIColor)menuBackgroundColor
{
  return self->_menuBackgroundColor;
}

- (void)setMenuBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_menuBackgroundColor, a3);
}

- (id)menuTitleBackgroundProvider
{
  return self->_menuTitleBackgroundProvider;
}

- (void)setMenuTitleBackgroundProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (double)menuCornerRadius
{
  return self->_menuCornerRadius;
}

- (double)leadingIndentationWidth
{
  return self->_leadingIndentationWidth;
}

- (BOOL)applySubmenuScaling
{
  return self->_applySubmenuScaling;
}

- (BOOL)shouldDismissMenuOnSceneDeactivation
{
  return self->_shouldDismissMenuOnSceneDeactivation;
}

- (void)setShouldDismissMenuOnSceneDeactivation:(BOOL)a3
{
  self->_shouldDismissMenuOnSceneDeactivation = a3;
}

- (NSDictionary)submenuSeparatedOptions
{
  return self->_submenuSeparatedOptions;
}

- (void)setSubmenuSeparatedOptions:(id)a3
{
  objc_storeStrong((id *)&self->_submenuSeparatedOptions, a3);
}

- (CAPoint3D)stackedSubmenuOffset
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_stackedSubmenuOffset.x;
  y = self->_stackedSubmenuOffset.y;
  z = self->_stackedSubmenuOffset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStackedSubmenuOffset:(CAPoint3D)a3
{
  self->_stackedSubmenuOffset = a3;
}

- (CAPoint3D)leadingCascadedSubmenuOffset
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_leadingCascadedSubmenuOffset.x;
  y = self->_leadingCascadedSubmenuOffset.y;
  z = self->_leadingCascadedSubmenuOffset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (CAPoint3D)trailingCascadedSubmenuOffset
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_trailingCascadedSubmenuOffset.x;
  y = self->_trailingCascadedSubmenuOffset.y;
  z = self->_trailingCascadedSubmenuOffset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (NSDictionary)accessorySeparatedOptions
{
  return self->_accessorySeparatedOptions;
}

- (void)setAccessorySeparatedOptions:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySeparatedOptions, a3);
}

- (CAPoint3D)baseMenuOffset
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_baseMenuOffset.x;
  y = self->_baseMenuOffset.y;
  z = self->_baseMenuOffset.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBaseMenuOffset:(CAPoint3D)a3
{
  self->_baseMenuOffset = a3;
}

- (UIEdgeInsets)minimumContainerInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minimumContainerInsets.top;
  left = self->_minimumContainerInsets.left;
  bottom = self->_minimumContainerInsets.bottom;
  right = self->_minimumContainerInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)defaultMenuWidth
{
  return self->_defaultMenuWidth;
}

- (double)largePaletteWidthExtension
{
  return self->_largePaletteWidthExtension;
}

- (void)setLargePaletteWidthExtension:(double)a3
{
  self->_largePaletteWidthExtension = a3;
}

- (double)itemSeparatorHeight
{
  return self->_itemSeparatorHeight;
}

- (UIColor)itemSeparatorColor
{
  return self->_itemSeparatorColor;
}

- (UIVisualEffect)itemSeparatorBackgroundEffect
{
  return self->_itemSeparatorBackgroundEffect;
}

- (UIColor)itemSubtitleColor
{
  return self->_itemSubtitleColor;
}

- (int64_t)itemSubtitleRenderingMode
{
  return self->_itemSubtitleRenderingMode;
}

- (id)itemPrimaryCompositingFilterProvider
{
  return self->_itemPrimaryCompositingFilterProvider;
}

- (id)itemSubtitleCompositingFilterProvider
{
  return self->_itemSubtitleCompositingFilterProvider;
}

- (double)itemTopToFirstBaseline
{
  return self->_itemTopToFirstBaseline;
}

- (double)smallItemTopToFirstBaseline
{
  return self->_smallItemTopToFirstBaseline;
}

- (void)setSmallItemTopToFirstBaseline:(double)a3
{
  self->_smallItemTopToFirstBaseline = a3;
}

- (double)itemLastBaselineToBottom
{
  return self->_itemLastBaselineToBottom;
}

- (double)smallItemLastBaselineToBottom
{
  return self->_smallItemLastBaselineToBottom;
}

- (void)setSmallItemLastBaselineToBottom:(double)a3
{
  self->_smallItemLastBaselineToBottom = a3;
}

- (double)itemBaselineToBaseline
{
  return self->_itemBaselineToBaseline;
}

- (double)itemTopToFirstBaselineWithSubtitle
{
  return self->_itemTopToFirstBaselineWithSubtitle;
}

- (double)itemLastBaselineToBottomWithSubtitle
{
  return self->_itemLastBaselineToBottomWithSubtitle;
}

- (double)dynamicImageBoxWidth
{
  return self->_dynamicImageBoxWidth;
}

- (double)minIntraItemSpacing
{
  return self->_minIntraItemSpacing;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)titleEmphasizedFont
{
  return self->_titleEmphasizedFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)iconSymbolFont
{
  return self->_iconSymbolFont;
}

- (UIFont)iconEmphasizedSymbolFont
{
  return self->_iconEmphasizedSymbolFont;
}

- (id)itemBackgroundColorProvider
{
  return self->_itemBackgroundColorProvider;
}

- (id)itemPrimaryColorProvider
{
  return self->_itemPrimaryColorProvider;
}

- (void)setItemPrimaryColorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (id)itemPrimaryDestructiveColorProvider
{
  return self->_itemPrimaryDestructiveColorProvider;
}

- (double)itemPrimaryAlpha
{
  return self->_itemPrimaryAlpha;
}

- (BOOL)leadingIndentationContributesToWidth
{
  return self->_leadingIndentationContributesToWidth;
}

- (BOOL)contentInsetsApplyToHeaders
{
  return self->_contentInsetsApplyToHeaders;
}

- (UIFont)headerFont
{
  return self->_headerFont;
}

- (UIColor)headerPrimaryColor
{
  return self->_headerPrimaryColor;
}

- (int64_t)headerRenderingMode
{
  return self->_headerRenderingMode;
}

- (id)headerPrimaryCompositingFilterProvider
{
  return self->_headerPrimaryCompositingFilterProvider;
}

- (int64_t)headerTextAlignment
{
  return self->_headerTextAlignment;
}

- (BOOL)menuTitleAlwaysShowsSeparator
{
  return self->_menuTitleAlwaysShowsSeparator;
}

- (void)setMenuTitleAlwaysShowsSeparator:(BOOL)a3
{
  self->_menuTitleAlwaysShowsSeparator = a3;
}

- (UIFont)menuTitleFont
{
  return self->_menuTitleFont;
}

- (NSDirectionalEdgeInsets)menuTitlePadding
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_menuTitlePadding.top;
  leading = self->_menuTitlePadding.leading;
  bottom = self->_menuTitlePadding.bottom;
  trailing = self->_menuTitlePadding.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (int64_t)menuTitleTextAlignment
{
  return self->_menuTitleTextAlignment;
}

- (BOOL)forceUnpinnedHeader
{
  return self->_forceUnpinnedHeader;
}

- (BOOL)alignMenuHeaderAndItemContents
{
  return self->_alignMenuHeaderAndItemContents;
}

- (NSDirectionalEdgeInsets)sectionInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_sectionInsets.top;
  leading = self->_sectionInsets.leading;
  bottom = self->_sectionInsets.bottom;
  trailing = self->_sectionInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setSectionInsets:(NSDirectionalEdgeInsets)a3
{
  self->_sectionInsets = a3;
}

- (UIColor)sectionSeparatorColor
{
  return self->_sectionSeparatorColor;
}

- (double)sectionSeparatorHeight
{
  return self->_sectionSeparatorHeight;
}

- (NSDirectionalEdgeInsets)sectionSeparatorInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_sectionSeparatorInsets.top;
  leading = self->_sectionSeparatorInsets.leading;
  bottom = self->_sectionSeparatorInsets.bottom;
  trailing = self->_sectionSeparatorInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setSectionSeparatorInsets:(NSDirectionalEdgeInsets)a3
{
  self->_sectionSeparatorInsets = a3;
}

- (UIImageSymbolConfiguration)decorationViewSymbolConfiguration
{
  return self->_decorationViewSymbolConfiguration;
}

- (double)leadingDecorationViewOffset
{
  return self->_leadingDecorationViewOffset;
}

- (double)trailingDecorationViewOffset
{
  return self->_trailingDecorationViewOffset;
}

- (UIColor)trailingAccessoryColor
{
  return self->_trailingAccessoryColor;
}

- (double)previewRubberbandingZCoefficient
{
  return self->_previewRubberbandingZCoefficient;
}

- (void)setPreviewRubberbandingZCoefficient:(double)a3
{
  self->_previewRubberbandingZCoefficient = a3;
}

- (double)previewActionsStyleDragZTearOffThreshold
{
  return self->_previewActionsStyleDragZTearOffThreshold;
}

- (void)setPreviewActionsStyleDragZTearOffThreshold:(double)a3
{
  self->_previewActionsStyleDragZTearOffThreshold = a3;
}

- (double)previewRotationMaxDegrees
{
  return self->_previewRotationMaxDegrees;
}

- (void)setPreviewRotationMaxDegrees:(double)a3
{
  self->_previewRotationMaxDegrees = a3;
}

- (CGSize)previewPlatterMaximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previewPlatterMaximumSize.width;
  height = self->_previewPlatterMaximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_UIPlatterShadowSettings)previewShadowSettings
{
  return self->_previewShadowSettings;
}

- (void)setPreviewShadowSettings:(id)a3
{
  objc_storeStrong((id *)&self->_previewShadowSettings, a3);
}

- (BOOL)previewIsConstrainedToSourceWindowBounds
{
  return self->_previewIsConstrainedToSourceWindowBounds;
}

- (void)setPreviewIsConstrainedToSourceWindowBounds:(BOOL)a3
{
  self->_previewIsConstrainedToSourceWindowBounds = a3;
}

- (double)previewPlatterCornerRadius
{
  return self->_previewPlatterCornerRadius;
}

- (void)setPreviewPlatterCornerRadius:(double)a3
{
  self->_previewPlatterCornerRadius = a3;
}

- (BOOL)enableShadowsForStandardSizeMenus
{
  return self->_enableShadowsForStandardSizeMenus;
}

- (void)setEnableShadowsForStandardSizeMenus:(BOOL)a3
{
  self->_enableShadowsForStandardSizeMenus = a3;
}

- (_UIContextMenuGradientMaskingConfiguration)gradientMaskingConfiguration
{
  return self->_gradientMaskingConfiguration;
}

- (id)shouldApplyClippingHandler
{
  return self->_shouldApplyClippingHandler;
}

- (id)shouldApplyShadowHandler
{
  return self->_shouldApplyShadowHandler;
}

- (id)overrideElementSize
{
  return self->_overrideElementSize;
}

- (void)setOverrideElementSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (BOOL)enableFloatingFocusStyle
{
  return self->_enableFloatingFocusStyle;
}

- (BOOL)allowsItemHighlighting
{
  return self->_allowsItemHighlighting;
}

- (BOOL)containerViewsHitTestAsOpaque
{
  return self->_containerViewsHitTestAsOpaque;
}

- (BOOL)supportsLargePaletteMenus
{
  return self->_supportsLargePaletteMenus;
}

- (void)setSupportsLargePaletteMenus:(BOOL)a3
{
  self->_supportsLargePaletteMenus = a3;
}

- (CGSize)paletteMinimumItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_paletteMinimumItemSize.width;
  height = self->_paletteMinimumItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIShape)smallItemContentShape
{
  return self->_smallItemContentShape;
}

- (void)setSmallItemContentShape:(id)a3
{
  objc_storeStrong((id *)&self->_smallItemContentShape, a3);
}

- (UIShape)mediumItemContentShape
{
  return self->_mediumItemContentShape;
}

- (void)setMediumItemContentShape:(id)a3
{
  objc_storeStrong((id *)&self->_mediumItemContentShape, a3);
}

- (id)contentSpacingForContainer
{
  return self->_contentSpacingForContainer;
}

- (id)itemColoredSymbolImageUserInterfaceStyleOverrideProvider
{
  return self->_itemColoredSymbolImageUserInterfaceStyleOverrideProvider;
}

- (void)setItemColoredSymbolImageUserInterfaceStyleOverrideProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (BOOL)wantsControlAlignmentWithHorizontalEdgeAdjustment
{
  return self->_wantsControlAlignmentWithHorizontalEdgeAdjustment;
}

- (id)controlAttachmentYOffsetProvider
{
  return self->_controlAttachmentYOffsetProvider;
}

- (id)prefersWrapToSidesHandler
{
  return self->_prefersWrapToSidesHandler;
}

- (double)maxLiftScale
{
  return self->_maxLiftScale;
}

- (double)maxLiftScaleUpPoints
{
  return self->_maxLiftScaleUpPoints;
}

- (BOOL)supportsPassthroughInteraction
{
  return self->_supportsPassthroughInteraction;
}

- (void)setSupportsPassthroughInteraction:(BOOL)a3
{
  self->_supportsPassthroughInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prefersWrapToSidesHandler, 0);
  objc_storeStrong(&self->_controlAttachmentYOffsetProvider, 0);
  objc_storeStrong(&self->_itemColoredSymbolImageUserInterfaceStyleOverrideProvider, 0);
  objc_storeStrong(&self->_contentSpacingForContainer, 0);
  objc_storeStrong((id *)&self->_presentationFeedbackConfiguration, 0);
  objc_storeStrong((id *)&self->_mediumItemContentShape, 0);
  objc_storeStrong((id *)&self->_smallItemContentShape, 0);
  objc_storeStrong(&self->_overrideElementSize, 0);
  objc_storeStrong(&self->_shouldApplyShadowHandler, 0);
  objc_storeStrong(&self->_shouldApplyClippingHandler, 0);
  objc_storeStrong((id *)&self->_gradientMaskingConfiguration, 0);
  objc_storeStrong((id *)&self->_previewShadowSettings, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryColor, 0);
  objc_storeStrong((id *)&self->_decorationViewSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_sectionSeparatorColor, 0);
  objc_storeStrong((id *)&self->_menuTitleFont, 0);
  objc_storeStrong(&self->_headerPrimaryCompositingFilterProvider, 0);
  objc_storeStrong((id *)&self->_headerPrimaryColor, 0);
  objc_storeStrong((id *)&self->_headerFont, 0);
  objc_storeStrong(&self->_itemPrimaryDestructiveColorProvider, 0);
  objc_storeStrong(&self->_itemPrimaryColorProvider, 0);
  objc_storeStrong(&self->_itemBackgroundColorProvider, 0);
  objc_storeStrong((id *)&self->_iconEmphasizedSymbolFont, 0);
  objc_storeStrong((id *)&self->_iconSymbolFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleEmphasizedFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong(&self->_itemSubtitleCompositingFilterProvider, 0);
  objc_storeStrong(&self->_itemPrimaryCompositingFilterProvider, 0);
  objc_storeStrong((id *)&self->_itemSubtitleColor, 0);
  objc_storeStrong((id *)&self->_itemSeparatorBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_itemSeparatorColor, 0);
  objc_storeStrong((id *)&self->_accessorySeparatedOptions, 0);
  objc_storeStrong((id *)&self->_submenuSeparatedOptions, 0);
  objc_storeStrong(&self->_menuTitleBackgroundProvider, 0);
  objc_storeStrong((id *)&self->_menuBackgroundColor, 0);
  objc_storeStrong((id *)&self->_menuBackgroundEffect, 0);
  objc_storeStrong(&self->_convertPointBetweenViews, 0);
  objc_storeStrong(&self->_containerViewProvider, 0);
  objc_storeStrong(&self->_animateAlongsideTransition, 0);
  objc_storeStrong(&self->_postDismissalHandler, 0);
  objc_storeStrong(&self->_preDismissalHandler, 0);
  objc_storeStrong(&self->_menuHighlightBackgroundDescriptorProvider, 0);
}

@end
