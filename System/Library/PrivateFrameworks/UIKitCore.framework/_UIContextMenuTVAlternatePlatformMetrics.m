@implementation _UIContextMenuTVAlternatePlatformMetrics

- (_UIContextMenuTVAlternatePlatformMetrics)init
{
  _UIContextMenuTVAlternatePlatformMetrics *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIContextMenuTVAlternatePlatformMetrics;
  v2 = -[_UIContextMenuPlatformMetrics init](&v11, sel_init);
  if (v2)
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 5002);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setMenuBackgroundEffect:](v2, "setMenuBackgroundEffect:", v3);
    -[_UIContextMenuPlatformMetrics setMenuCornerRadius:](v2, "setMenuCornerRadius:", 36.0);
    -[_UIContextMenuPlatformMetrics setDefaultMenuWidth:](v2, "setDefaultMenuWidth:", 302.0);
    -[_UIContextMenuPlatformMetrics setItemSeparatorHeight:](v2, "setItemSeparatorHeight:", 0.0);
    -[_UIContextMenuPlatformMetrics setItemTopToFirstBaseline:](v2, "setItemTopToFirstBaseline:", 44.0);
    -[_UIContextMenuPlatformMetrics setItemTopToFirstBaselineWithSubtitle:](v2, "setItemTopToFirstBaselineWithSubtitle:", 44.0);
    -[_UIContextMenuPlatformMetrics setItemLastBaselineToBottom:](v2, "setItemLastBaselineToBottom:", 28.0);
    -[_UIContextMenuPlatformMetrics setItemLastBaselineToBottomWithSubtitle:](v2, "setItemLastBaselineToBottomWithSubtitle:", 28.0);
    -[_UIContextMenuPlatformMetrics setItemBaselineToBaseline:](v2, "setItemBaselineToBaseline:", 32.0);
    -[_UIContextMenuPlatformMetrics setDynamicImageBoxWidth:](v2, "setDynamicImageBoxWidth:", 35.0);
    -[_UIContextMenuPlatformMetrics setMinIntraItemSpacing:](v2, "setMinIntraItemSpacing:", 8.0);
    -[_UIContextMenuPlatformMetrics setMenuItemInternalPadding:](v2, "setMenuItemInternalPadding:", 0.0, 24.0, 0.0, 24.0);
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setTitleFont:](v2, "setTitleFont:", v4);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedCaption2"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setTitleEmphasizedFont:](v2, "setTitleEmphasizedFont:", v5);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption2"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setSubtitleFont:](v2, "setSubtitleFont:", v6);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setIconSymbolFont:](v2, "setIconSymbolFont:", v7);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedCaption2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setIconEmphasizedSymbolFont:](v2, "setIconEmphasizedSymbolFont:", v8);

    -[_UIContextMenuPlatformMetrics setItemBackgroundColorProvider:](v2, "setItemBackgroundColorProvider:", &__block_literal_global_370);
    -[_UIContextMenuPlatformMetrics setHeaderPadding:](v2, "setHeaderPadding:", 16.0, 24.0, 14.0, 24.0);
    -[_UIContextMenuPlatformMetrics headerPadding](v2, "headerPadding");
    -[_UIContextMenuPlatformMetrics setMenuTitlePadding:](v2, "setMenuTitlePadding:");
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption3"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPlatformMetrics setHeaderFont:](v2, "setHeaderFont:", v9);

    -[_UIContextMenuPlatformMetrics setMenuMaximumHeight:](v2, "setMenuMaximumHeight:", 400.0);
    -[_UIContextMenuPlatformMetrics setPreviewPlatterCornerRadius:](v2, "setPreviewPlatterCornerRadius:", 24.0);

  }
  return v2;
}

@end
