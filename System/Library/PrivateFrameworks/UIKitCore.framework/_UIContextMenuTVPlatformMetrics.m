@implementation _UIContextMenuTVPlatformMetrics

- (_UIContextMenuTVPlatformMetrics)init
{
  _UIContextMenuTVPlatformMetrics *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _UIContextMenuGradientMaskingConfiguration *v17;
  double v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_UIContextMenuTVPlatformMetrics;
  v2 = -[_UIContextMenuPlatformMetrics init](&v21, sel_init);
  if (v2)
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 5002);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setMenuBackgroundEffect:](v2, "setMenuBackgroundEffect:", v3);
    -[_UIContextMenuPlatformMetrics setMenuCornerRadius:](v2, "setMenuCornerRadius:", 30.0);
    -[_UIContextMenuPlatformMetrics setDefaultMenuWidth:](v2, "setDefaultMenuWidth:", 440.0);
    -[_UIContextMenuPlatformMetrics setLargePaletteWidthExtension:](v2, "setLargePaletteWidthExtension:", 60.0);
    -[_UIContextMenuPlatformMetrics setItemSeparatorHeight:](v2, "setItemSeparatorHeight:", 0.0);
    -[_UIContextMenuPlatformMetrics setSectionSeparatorHeight:](v2, "setSectionSeparatorHeight:", 10.0);
    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_242);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setSectionSeparatorColor:](v2, "setSectionSeparatorColor:", v4);

    -[_UIContextMenuPlatformMetrics setItemPrimaryCompositingFilterProvider:](v2, "setItemPrimaryCompositingFilterProvider:", &__block_literal_global_3_8);
    -[_UIContextMenuPlatformMetrics itemPrimaryCompositingFilterProvider](v2, "itemPrimaryCompositingFilterProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setItemSubtitleCompositingFilterProvider:](v2, "setItemSubtitleCompositingFilterProvider:", v5);

    -[_UIContextMenuPlatformMetrics setItemTopToFirstBaseline:](v2, "setItemTopToFirstBaseline:", 44.0);
    -[_UIContextMenuPlatformMetrics setItemTopToFirstBaselineWithSubtitle:](v2, "setItemTopToFirstBaselineWithSubtitle:", 44.0);
    -[_UIContextMenuPlatformMetrics setItemLastBaselineToBottom:](v2, "setItemLastBaselineToBottom:", 28.0);
    -[_UIContextMenuPlatformMetrics setItemLastBaselineToBottomWithSubtitle:](v2, "setItemLastBaselineToBottomWithSubtitle:", 28.0);
    -[_UIContextMenuPlatformMetrics setItemBaselineToBaseline:](v2, "setItemBaselineToBaseline:", 32.0);
    -[_UIContextMenuPlatformMetrics setDynamicImageBoxWidth:](v2, "setDynamicImageBoxWidth:", 35.0);
    -[_UIContextMenuPlatformMetrics setMinIntraItemSpacing:](v2, "setMinIntraItemSpacing:", 20.0);
    -[_UIContextMenuPlatformMetrics setMenuItemInternalPadding:](v2, "setMenuItemInternalPadding:", 0.0, 24.0, 0.0, 24.0);
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setTitleFont:](v2, "setTitleFont:", v6);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedCaption2"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setTitleEmphasizedFont:](v2, "setTitleEmphasizedFont:", v7);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setSubtitleFont:](v2, "setSubtitleFont:", v8);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setIconSymbolFont:](v2, "setIconSymbolFont:", v9);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedCaption2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setIconEmphasizedSymbolFont:](v2, "setIconEmphasizedSymbolFont:", v10);

    -[_UIContextMenuPlatformMetrics setItemBackgroundColorProvider:](v2, "setItemBackgroundColorProvider:", &__block_literal_global_6_5);
    -[_UIContextMenuPlatformMetrics setItemPrimaryColorProvider:](v2, "setItemPrimaryColorProvider:", &__block_literal_global_9_5);
    -[_UIContextMenuPlatformMetrics setItemPrimaryDestructiveColorProvider:](v2, "setItemPrimaryDestructiveColorProvider:", &__block_literal_global_11_1);
    -[_UIContextMenuPlatformMetrics setItemPrimaryAlpha:](v2, "setItemPrimaryAlpha:", 1.0);
    -[_UIContextMenuPlatformMetrics setTrailingAccessoryColor:](v2, "setTrailingAccessoryColor:", 0);
    -[_UIContextMenuPlatformMetrics setLeadingDecorationViewOffset:](v2, "setLeadingDecorationViewOffset:", 2.0);
    -[_UIContextMenuPlatformMetrics menuItemInternalPadding](v2, "menuItemInternalPadding");
    -[_UIContextMenuPlatformMetrics setLeadingIndentationWidth:](v2, "setLeadingIndentationWidth:", 70.0 - v11);
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleCaption1"), 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setDecorationViewSymbolConfiguration:](v2, "setDecorationViewSymbolConfiguration:", v12);

    -[_UIContextMenuPlatformMetrics menuItemInternalPadding](v2, "menuItemInternalPadding");
    v14 = v13;
    -[_UIContextMenuPlatformMetrics menuItemInternalPadding](v2, "menuItemInternalPadding");
    -[_UIContextMenuPlatformMetrics setHeaderPadding:](v2, "setHeaderPadding:", 20.0, v14, 25.0);
    -[_UIContextMenuPlatformMetrics headerPadding](v2, "headerPadding");
    -[_UIContextMenuPlatformMetrics setMenuTitlePadding:](v2, "setMenuTitlePadding:");
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption2"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setHeaderFont:](v2, "setHeaderFont:", v15);

    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_13_2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setHeaderPrimaryColor:](v2, "setHeaderPrimaryColor:", v16);

    -[_UIContextMenuPlatformMetrics setHeaderPrimaryCompositingFilterProvider:](v2, "setHeaderPrimaryCompositingFilterProvider:", &__block_literal_global_15_1);
    -[_UIContextMenuPlatformMetrics setForceUnpinnedHeader:](v2, "setForceUnpinnedHeader:", 1);
    -[_UIContextMenuPlatformMetrics setMenuMaximumHeight:](v2, "setMenuMaximumHeight:", 600.0);
    v17 = objc_alloc_init(_UIContextMenuGradientMaskingConfiguration);
    -[_UIContextMenuGradientMaskingConfiguration setGradientMaskEdgeInsets:](v17, "setGradientMaskEdgeInsets:", 15.0, 0.0, 60.0, 0.0);
    -[_UIContextMenuGradientMaskingConfiguration setGradientMaskLengths:](v17, "setGradientMaskLengths:", 74.0, -60.0, 74.0, -60.0);
    -[_UIContextMenuGradientMaskingConfiguration setEmbedBackgroundForCompositing:](v17, "setEmbedBackgroundForCompositing:", 1);
    -[_UIContextMenuGradientMaskingConfiguration setBackgroundMasksCorners:](v17, "setBackgroundMasksCorners:", 1);
    -[_UIContextMenuGradientMaskingConfiguration setSpacerHeaderFooterHeight:](v17, "setSpacerHeaderFooterHeight:", 14.0);
    -[_UIContextMenuGradientMaskingConfiguration setPlatterHairlineColorProvider:](v17, "setPlatterHairlineColorProvider:", &__block_literal_global_17_2);
    -[_UIContextMenuPlatformMetrics setGradientMaskingConfiguration:](v2, "setGradientMaskingConfiguration:", v17);
    -[_UIContextMenuGradientMaskingConfiguration spacerHeaderFooterHeight](v17, "spacerHeaderFooterHeight");
    -[_UIContextMenuPlatformMetrics setTrailingCascadedSubmenuOffset:](v2, "setTrailingCascadedSubmenuOffset:", -13.0, -v18, 0.0);
    -[_UIContextMenuGradientMaskingConfiguration spacerHeaderFooterHeight](v17, "spacerHeaderFooterHeight");
    -[_UIContextMenuPlatformMetrics setLeadingCascadedSubmenuOffset:](v2, "setLeadingCascadedSubmenuOffset:", -5.0, -v19, 0.0);
    -[_UIContextMenuPlatformMetrics setShouldApplyShadowHandler:](v2, "setShouldApplyShadowHandler:", &__block_literal_global_19_2);
    -[_UIContextMenuPlatformMetrics setShouldApplyClippingHandler:](v2, "setShouldApplyClippingHandler:", &__block_literal_global_20_1);
    -[_UIContextMenuPlatformMetrics setEnableFloatingFocusStyle:](v2, "setEnableFloatingFocusStyle:", 1);
    -[_UIContextMenuPlatformMetrics setAllowsItemHighlighting:](v2, "setAllowsItemHighlighting:", 0);
    -[_UIContextMenuPlatformMetrics setSupportsLargePaletteMenus:](v2, "setSupportsLargePaletteMenus:", 1);
    -[_UIContextMenuPlatformMetrics setPaletteMinimumItemSize:](v2, "setPaletteMinimumItemSize:", 72.0, 72.0);
    -[_UIContextMenuPlatformMetrics setOverrideElementSize:](v2, "setOverrideElementSize:", &__block_literal_global_22_5);
    -[_UIContextMenuPlatformMetrics setItemColoredSymbolImageUserInterfaceStyleOverrideProvider:](v2, "setItemColoredSymbolImageUserInterfaceStyleOverrideProvider:", &__block_literal_global_24_2);
    -[_UIContextMenuPlatformMetrics setContentSpacingForContainer:](v2, "setContentSpacingForContainer:", &__block_literal_global_26_1);
    -[_UIContextMenuPlatformMetrics setWantsControlAlignmentWithHorizontalEdgeAdjustment:](v2, "setWantsControlAlignmentWithHorizontalEdgeAdjustment:", 0);
    -[_UIContextMenuPlatformMetrics setControlAttachmentYOffsetProvider:](v2, "setControlAttachmentYOffsetProvider:", &__block_literal_global_28_0);
    -[_UIContextMenuPlatformMetrics setPrefersWrapToSidesHandler:](v2, "setPrefersWrapToSidesHandler:", &__block_literal_global_30_0);
    -[_UIContextMenuPlatformMetrics setMaxLiftScale:](v2, "setMaxLiftScale:", 1.2);
    -[_UIContextMenuPlatformMetrics setMaxLiftScaleUpPoints:](v2, "setMaxLiftScaleUpPoints:", 48.0);
    -[_UIContextMenuPlatformMetrics setShouldDismissMenuOnSceneDeactivation:](v2, "setShouldDismissMenuOnSceneDeactivation:", 1);
    -[_UIContextMenuPlatformMetrics setSupportsPassthroughInteraction:](v2, "setSupportsPassthroughInteraction:", 0);

  }
  return v2;
}

@end
