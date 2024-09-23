@implementation _UIFloatingTabBarPlatformMetrics

- (_UIFloatingTabBarPlatformMetrics)init
{
  _UIFloatingTabBarPlatformMetrics *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIFloatingTabBarContentPalette *v24;
  void *v25;
  void *v26;
  void *v27;
  _UIFloatingTabBarContentPalette *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _UIFloatingTabBarContentPalette *v33;
  _UIFloatingTabBarContentPalette *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  _QWORD v48[4];
  _UIFloatingTabBarContentPalette *v49;
  _UIFloatingTabBarContentPalette *v50;
  objc_super v51;
  uint64_t v52;
  uint64_t v53;
  id (*v54)(uint64_t, void *);
  void *v55;
  id v56;
  id v57;
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)_UIFloatingTabBarPlatformMetrics;
  v2 = -[_UIFloatingTabBarPlatformMetrics init](&v51, sel_init);
  if (v2)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.25, 0.06);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.75, 0.75, 1.0, 0.06);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v5;
    v52 = MEMORY[0x1E0C809B0];
    v53 = 3221225472;
    v54 = ___UIDynamicColor_block_invoke;
    v55 = &unk_1E16D94E0;
    v56 = v4;
    v57 = v3;
    v42 = v4;
    v6 = v3;
    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &v52);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIVisualEffect effectCompositingColor:](UIVisualEffect, "effectCompositingColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIVisualEffect effectCombiningEffects:](UIVisualEffect, "effectCombiningEffects:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarPlatformMetrics setBackgroundEffect:](v2, "setBackgroundEffect:", v10);

    -[_UIFloatingTabBarPlatformMetrics setBackgroundInsets:](v2, "setBackgroundInsets:", 4.0, 4.0, 4.0, 4.0);
    -[_UIFloatingTabBarPlatformMetrics setMaximumWidth:](v2, "setMaximumWidth:", 600.0);
    -[_UIFloatingTabBarPlatformMetrics setMaximumExpandedWidth:](v2, "setMaximumExpandedWidth:", 800.0);
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor systemFillColor](UIColor, "systemFillColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = MEMORY[0x1E0C809B0];
    v53 = 3221225472;
    v54 = ___UIDynamicColor_block_invoke;
    v55 = &unk_1E16D94E0;
    v56 = v12;
    v57 = v11;
    v13 = v12;
    v14 = v11;
    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &v52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBarPlatformMetrics setSelectionBackgroundColor:](v2, "setSelectionBackgroundColor:", v15);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setOpacity:", 0.08);
    objc_msgSend(v16, "setRadius:", 16.0);
    objc_msgSend(v16, "setOffset:", 0.0, 2.0);
    +[UIColor blackColor](UIColor, "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColor:", v17);

    -[_UIFloatingTabBarPlatformMetrics setSelectionShadow:](v2, "setSelectionShadow:", v16);
    -[_UIFloatingTabBarPlatformMetrics setSelectionDistanceThresholdForUnselectedItems:](v2, "setSelectionDistanceThresholdForUnselectedItems:", 44.0);
    v18 = *(double *)off_1E167DC68;
    objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:weight:", CFSTR("UICTFontTextStyleBody"), *(double *)off_1E167DC68);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarPlatformMetrics setContentFont:](v2, "setContentFont:", v19);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarPlatformMetrics setSelectedContentFont:](v2, "setSelectedContentFont:", v20);

    -[_UIFloatingTabBarPlatformMetrics contentFont](v2, "contentFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v21, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarPlatformMetrics setSymbolConfiguration:](v2, "setSymbolConfiguration:", v22);

    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleHeadline"), 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarPlatformMetrics setSelectedSymbolConfiguration:](v2, "setSelectedSymbolConfiguration:", v23);

    -[_UIFloatingTabBarPlatformMetrics setTitleMargins:](v2, "setTitleMargins:", 6.0, 16.0, 6.0, 16.0);
    -[_UIFloatingTabBarPlatformMetrics setImageMargins:](v2, "setImageMargins:", 6.0, 14.0, 6.0, 14.0);
    -[_UIFloatingTabBarPlatformMetrics setImageAndTitleSpacing:](v2, "setImageAndTitleSpacing:", 8.0);
    -[_UIFloatingTabBarPlatformMetrics setSafeAreaOffset:](v2, "setSafeAreaOffset:", 31.0);
    -[_UIFloatingTabBarPlatformMetrics setExpandedDropTargetInset:](v2, "setExpandedDropTargetInset:", 32.0);
    -[_UIFloatingTabBarPlatformMetrics setDefaultImageSize:](v2, "setDefaultImageSize:", 20.0, 20.0);
    -[_UIFloatingTabBarPlatformMetrics setMaximumContentWidth:](v2, "setMaximumContentWidth:", 224.0);
    -[_UIFloatingTabBarPlatformMetrics setContentAlphaDistanceThreshold:](v2, "setContentAlphaDistanceThreshold:", 64.0);
    v24 = objc_alloc_init(_UIFloatingTabBarContentPalette);
    +[UIColor tintColor](UIColor, "tintColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarContentPalette setSelectedColor:](v24, "setSelectedColor:", v25);

    +[UIColor labelColor](UIColor, "labelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarContentPalette setInactiveColor:](v24, "setInactiveColor:", v26);

    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarContentPalette setHighlightedColor:](v24, "setHighlightedColor:", v27);

    v28 = objc_alloc_init(_UIFloatingTabBarContentPalette);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarContentPalette setSelectedColor:](v28, "setSelectedColor:", v29);

    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarContentPalette setInactiveColor:](v28, "setInactiveColor:", v30);

    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarContentPalette setHighlightedColor:](v28, "setHighlightedColor:", v31);

    v32 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __40___UIFloatingTabBarPlatformMetrics_init__block_invoke;
    v48[3] = &unk_1E16D9490;
    v49 = v24;
    v50 = v28;
    v33 = v24;
    v34 = v28;
    -[_UIFloatingTabBarPlatformMetrics setContentPaletteProvider:](v2, "setContentPaletteProvider:", v48);
    -[_UIFloatingTabBarPlatformMetrics setBadgeInsets:](v2, "setBadgeInsets:", 2.0, 4.0, 2.0, 4.0);
    objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:weight:", CFSTR("UICTFontTextStyleCaption1"), v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarPlatformMetrics setBadgeFont:](v2, "setBadgeFont:", v35);

    -[_UIFloatingTabBarPlatformMetrics setMaximumBadgeWidth:](v2, "setMaximumBadgeWidth:", 64.0);
    -[_UIFloatingTabBarPlatformMetrics setBadgeOffset:](v2, "setBadgeOffset:", 3.0, -2.0);
    -[_UIFloatingTabBarPlatformMetrics setSupportsGroupClusters:](v2, "setSupportsGroupClusters:", 0);
    -[_UIFloatingTabBarPlatformMetrics setGroupItemSpacing:](v2, "setGroupItemSpacing:", 4.0);
    -[_UIFloatingTabBarPlatformMetrics setGroupItemPunchOutWidth:](v2, "setGroupItemPunchOutWidth:", 0.0);
    CGAffineTransformMakeScale(&v47, 1.05, 1.05);
    v46 = v47;
    -[_UIFloatingTabBarPlatformMetrics setEditModeTransform:](v2, "setEditModeTransform:", &v46);
    -[_UIFloatingTabBarPlatformMetrics setEditModeItemMargins:](v2, "setEditModeItemMargins:", 0.0, 3.0, 0.0, 3.0);
    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "setOpacity:", 0.4);
    objc_msgSend(v36, "setRadius:", 40.0);
    objc_msgSend(v36, "setOffset:", 0.0, 8.0);
    v37 = (void *)objc_opt_new();
    objc_msgSend(v37, "setOpacity:", 0.5);
    objc_msgSend(v37, "setRadius:", 40.0);
    objc_msgSend(v37, "setOffset:", 0.0, 8.0);
    v43[0] = v32;
    v43[1] = 3221225472;
    v43[2] = __40___UIFloatingTabBarPlatformMetrics_init__block_invoke_2;
    v43[3] = &unk_1E16D94B8;
    v44 = v36;
    v45 = v37;
    v38 = v36;
    v39 = v37;
    -[_UIFloatingTabBarPlatformMetrics setEditModeBackgroundShadowProvider:](v2, "setEditModeBackgroundShadowProvider:", v43);
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarPlatformMetrics setSidebarBackgroundEffect:](v2, "setSidebarBackgroundEffect:", v40);

  }
  return v2;
}

- (UIButtonConfiguration)sidebarButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentInsets:", 12.0, 16.0, 12.0, 16.0);
  -[_UIFloatingTabBarPlatformMetrics symbolConfiguration](self, "symbolConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v4);

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sidebar.leading"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v5);

  return (UIButtonConfiguration *)v3;
}

- (CGSize)scaledImageSizeForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = a3;
  -[_UIFloatingTabBarPlatformMetrics contentFont](self, "contentFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[_UIFloatingTabBarPlatformMetrics contentFont](self, "contentFont");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[_UIFloatingTabBarPlatformMetrics defaultImageSize](self, "defaultImageSize");
  v10 = v9;
  objc_msgSend(v8, "_scaledValueForValue:useLanguageAwareScaling:", 0);
  v12 = v11;
  objc_msgSend(v8, "_scaledValueForValue:useLanguageAwareScaling:", 0, v10);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIVisualEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (void)setBackgroundEffect:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEffect, a3);
}

- (UIEdgeInsets)backgroundInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_backgroundInsets.top;
  left = self->_backgroundInsets.left;
  bottom = self->_backgroundInsets.bottom;
  right = self->_backgroundInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBackgroundInsets:(UIEdgeInsets)a3
{
  self->_backgroundInsets = a3;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (double)maximumExpandedWidth
{
  return self->_maximumExpandedWidth;
}

- (void)setMaximumExpandedWidth:(double)a3
{
  self->_maximumExpandedWidth = a3;
}

- (UIColor)selectionBackgroundColor
{
  return self->_selectionBackgroundColor;
}

- (void)setSelectionBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionBackgroundColor, a3);
}

- (_UIShadowProperties)selectionShadow
{
  return self->_selectionShadow;
}

- (void)setSelectionShadow:(id)a3
{
  objc_storeStrong((id *)&self->_selectionShadow, a3);
}

- (double)selectionDistanceThresholdForUnselectedItems
{
  return self->_selectionDistanceThresholdForUnselectedItems;
}

- (void)setSelectionDistanceThresholdForUnselectedItems:(double)a3
{
  self->_selectionDistanceThresholdForUnselectedItems = a3;
}

- (UIFont)contentFont
{
  return self->_contentFont;
}

- (void)setContentFont:(id)a3
{
  objc_storeStrong((id *)&self->_contentFont, a3);
}

- (UIFont)selectedContentFont
{
  return self->_selectedContentFont;
}

- (void)setSelectedContentFont:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContentFont, a3);
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (void)setSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_symbolConfiguration, a3);
}

- (UIImageSymbolConfiguration)selectedSymbolConfiguration
{
  return self->_selectedSymbolConfiguration;
}

- (void)setSelectedSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSymbolConfiguration, a3);
}

- (CGSize)defaultImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultImageSize.width;
  height = self->_defaultImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultImageSize:(CGSize)a3
{
  self->_defaultImageSize = a3;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (void)setMaximumContentWidth:(double)a3
{
  self->_maximumContentWidth = a3;
}

- (UIEdgeInsets)titleMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_titleMargins.top;
  left = self->_titleMargins.left;
  bottom = self->_titleMargins.bottom;
  right = self->_titleMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTitleMargins:(UIEdgeInsets)a3
{
  self->_titleMargins = a3;
}

- (UIEdgeInsets)imageMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageMargins.top;
  left = self->_imageMargins.left;
  bottom = self->_imageMargins.bottom;
  right = self->_imageMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setImageMargins:(UIEdgeInsets)a3
{
  self->_imageMargins = a3;
}

- (double)imageAndTitleSpacing
{
  return self->_imageAndTitleSpacing;
}

- (void)setImageAndTitleSpacing:(double)a3
{
  self->_imageAndTitleSpacing = a3;
}

- (double)safeAreaOffset
{
  return self->_safeAreaOffset;
}

- (void)setSafeAreaOffset:(double)a3
{
  self->_safeAreaOffset = a3;
}

- (double)contentAlphaDistanceThreshold
{
  return self->_contentAlphaDistanceThreshold;
}

- (void)setContentAlphaDistanceThreshold:(double)a3
{
  self->_contentAlphaDistanceThreshold = a3;
}

- (id)contentPaletteProvider
{
  return self->_contentPaletteProvider;
}

- (void)setContentPaletteProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UIEdgeInsets)badgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_badgeInsets.top;
  left = self->_badgeInsets.left;
  bottom = self->_badgeInsets.bottom;
  right = self->_badgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBadgeInsets:(UIEdgeInsets)a3
{
  self->_badgeInsets = a3;
}

- (UIFont)badgeFont
{
  return self->_badgeFont;
}

- (void)setBadgeFont:(id)a3
{
  objc_storeStrong((id *)&self->_badgeFont, a3);
}

- (double)minimumBadgeWidth
{
  return self->_minimumBadgeWidth;
}

- (void)setMinimumBadgeWidth:(double)a3
{
  self->_minimumBadgeWidth = a3;
}

- (double)maximumBadgeWidth
{
  return self->_maximumBadgeWidth;
}

- (void)setMaximumBadgeWidth:(double)a3
{
  self->_maximumBadgeWidth = a3;
}

- (UIOffset)badgeOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_badgeOffset.horizontal;
  vertical = self->_badgeOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setBadgeOffset:(UIOffset)a3
{
  self->_badgeOffset = a3;
}

- (BOOL)supportsGroupClusters
{
  return self->_supportsGroupClusters;
}

- (void)setSupportsGroupClusters:(BOOL)a3
{
  self->_supportsGroupClusters = a3;
}

- (double)groupItemSpacing
{
  return self->_groupItemSpacing;
}

- (void)setGroupItemSpacing:(double)a3
{
  self->_groupItemSpacing = a3;
}

- (double)groupItemPunchOutWidth
{
  return self->_groupItemPunchOutWidth;
}

- (void)setGroupItemPunchOutWidth:(double)a3
{
  self->_groupItemPunchOutWidth = a3;
}

- (UIVisualEffect)sidebarBackgroundEffect
{
  return self->_sidebarBackgroundEffect;
}

- (void)setSidebarBackgroundEffect:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarBackgroundEffect, a3);
}

- (UIEdgeInsets)editModeItemMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_editModeItemMargins.top;
  left = self->_editModeItemMargins.left;
  bottom = self->_editModeItemMargins.bottom;
  right = self->_editModeItemMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEditModeItemMargins:(UIEdgeInsets)a3
{
  self->_editModeItemMargins = a3;
}

- (CGAffineTransform)editModeTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].ty;
  return self;
}

- (void)setEditModeTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_editModeTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_editModeTransform.tx = v4;
  *(_OWORD *)&self->_editModeTransform.a = v3;
}

- (double)expandedDropTargetInset
{
  return self->_expandedDropTargetInset;
}

- (void)setExpandedDropTargetInset:(double)a3
{
  self->_expandedDropTargetInset = a3;
}

- (id)editModeBackgroundShadowProvider
{
  return self->_editModeBackgroundShadowProvider;
}

- (void)setEditModeBackgroundShadowProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_editModeBackgroundShadowProvider, 0);
  objc_storeStrong((id *)&self->_sidebarBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_badgeFont, 0);
  objc_storeStrong(&self->_contentPaletteProvider, 0);
  objc_storeStrong((id *)&self->_selectedSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedContentFont, 0);
  objc_storeStrong((id *)&self->_contentFont, 0);
  objc_storeStrong((id *)&self->_selectionShadow, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundEffect, 0);
}

@end
