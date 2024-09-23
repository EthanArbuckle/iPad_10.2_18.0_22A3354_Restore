@implementation UITableConstants_CarPlay

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants_0;
  if (!sharedConstants___sharedConstants_0)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_0;
    sharedConstants___sharedConstants_0 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_0;
  }
  return v3;
}

- (BOOL)supportsUserInterfaceStyles
{
  return 0;
}

- (id)defaultBackgroundColorForTableViewStyle:(int64_t)a3
{
  if (a3)
    +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
  else
    +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultBackgroundEffectsForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (id)defaultSeparatorColorForTableViewStyle:(int64_t)a3
{
  return +[UIColor separatorColor](UIColor, "separatorColor", a3);
}

- (id)defaultSidebarPlainMultiSelectSeparatorColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
}

- (id)defaultSeparatorVisualEffectForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  id v10;
  double v11;
  _UITableConstantsBackgroundProperties *result;
  void *v13;
  id var1;
  id v15;

  v15 = a5;
  v10 = a6;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  -[UITableConstants_CarPlay defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  if ((objc_msgSend(v15, "isFocused") & 1) != 0
    || (objc_msgSend(v15, "isSelected") & 1) != 0
    || objc_msgSend(v15, "isHighlighted"))
  {
    retstr->var0 = 1;
  }
  else
  {
    if (a4)
      +[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor");
    else
      +[UIColor tableCellPlainBackgroundColor](UIColor, "tableCellPlainBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    var1 = retstr->var1;
    retstr->var1 = v13;

  }
  return result;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  unint64_t v7;
  NSObject *v8;
  _UITableConstantsBackgroundProperties *result;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Calling a method on CarPlay that is not implemented for this platform. This is a UIKit bug.", buf, 2u);
    }

  }
  else
  {
    v7 = defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection____s_category;
    if (!defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Calling a method on CarPlay that is not implemented for this platform. This is a UIKit bug.", v11, 2u);
    }
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault);
  return result;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarHeaderBackgroundPropertiesWithState:(SEL)a3 traitCollection:(id)a4
{
  unint64_t v6;
  NSObject *v7;
  _UITableConstantsBackgroundProperties *result;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Calling a method on CarPlay that is not implemented for this platform. This is a UIKit bug.", buf, 2u);
    }

  }
  else
  {
    v6 = defaultSidebarHeaderBackgroundPropertiesWithState_traitCollection____s_category;
    if (!defaultSidebarHeaderBackgroundPropertiesWithState_traitCollection____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&defaultSidebarHeaderBackgroundPropertiesWithState_traitCollection____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Calling a method on CarPlay that is not implemented for this platform. This is a UIKit bug.", v10, 2u);
    }
  }
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault);
  return result;
}

- (id)defaultMultiSelectBackgroundColorForCell:(id)a3 inTableView:(id)a4
{
  return 0;
}

- (int64_t)defaultSeparatorStyleForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (double)defaultRowHeightForTableView:(id)a3 cellStyle:(int64_t)a4
{
  return 44.0;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  double result;

  -[UITableConstants_CarPlay defaultRowHeightForTableView:cellStyle:](self, "defaultRowHeightForTableView:cellStyle:", a3, 0);
  return result;
}

- (BOOL)defaultRowHeightDependsOnCellStyle
{
  return 0;
}

- (double)defaultSectionHeaderHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  return 28.0;
}

- (double)defaultSectionHeaderHeightForTableView:(id)a3
{
  return 28.0;
}

- (double)defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:(int64_t)a3
{
  return 35.0;
}

- (double)defaultSectionFooterHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = a4;
  if (!v6)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
      goto LABEL_3;
LABEL_5:
    -[UITableConstants_CarPlay _defaultPlainHeaderFooterHeightForTableViewStyle:](self, "_defaultPlainHeaderFooterHeightForTableViewStyle:", 0);
    v7 = v8;
    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v7 = 17.5;
LABEL_6:
  objc_msgSend(v6, "scale");
  v10 = UIPixelBoundaryOffset(0, v7, v9);

  return v10;
}

- (double)defaultSectionFooterHeightForTableView:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v5 = objc_msgSend(a3, "_tableStyle");
  objc_msgSend(a3, "_scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_CarPlay defaultSectionHeaderHeightForTableViewStyle:screen:](self, "defaultSectionHeaderHeightForTableViewStyle:screen:", v5, v8);
  v10 = v9;

  return v10;
}

- (double)defaultImageToTextPaddingForSidebar:(BOOL)a3
{
  return 8.0;
}

- (double)defaultTextToSubtitlePaddingForCellStyle:(int64_t)a3
{
  return 3.0;
}

- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v5 = a3;
  objc_msgSend(a4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContentSizeCategoryMin(v6, CFSTR("UICTContentSizeCategoryXXXL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_bodyLeading");
  v11 = v10;

  return v11 + v11;
}

- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  if (dyld_program_sdk_at_least())
  {
    +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", CFSTR("UICTContentSizeCategoryL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleBody"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UITableConstants_CarPlay defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", objc_msgSend(a3, "_cellStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(a4, "_tableStyle");
  v10 = objc_msgSend(a3, "_cellStyle");
  objc_msgSend(a3, "_rawLayoutMargins");
  -[UITableConstants_CarPlay defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:](self, "defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:", v9, v10, v8);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6
{
  CGFloat right;
  CGFloat left;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  right = a6.right;
  left = a6.left;
  objc_msgSend(a5, "lineHeight", a3, a4, a6.top, a6.left, a6.bottom);
  v9 = ceil(v8 * 0.5);
  v10 = left;
  v11 = v9;
  v12 = right;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 8.0;
  if (!a3)
    v5 = 4.0;
  v6 = 8.0;
  v7 = 8.0;
  v8 = v5;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (UIEdgeInsets)headerFooterOffsetFromContentInsetForTableView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = -1.0;
  v5 = 0.0;
  v6 = -1.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)imageViewOffsetByLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  return 1;
}

- (double)defaultContentEditPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 9.0;
}

- (double)defaultContentReorderPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 12.0;
}

- (double)defaultContentAccessoryPadding
{
  return 8.0;
}

- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  return 0.0;
}

- (double)defaultImageViewSymbolImageLayoutHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (double)defaultDisclosureLayoutWidthForView:(id)a3
{
  return 0.0;
}

- (double)defaultCellCornerRadiusForTableViewStyle:(int64_t)a3 isSidebarStyle:(BOOL)a4 isHeaderFooter:(BOOL)a5 traitCollection:(id)a6
{
  return 0.0;
}

- (double)interspaceBetweenInnerAccessoryIdentifier:(id)a3 outerAccessoryIdentifier:(id)a4 forCell:(id)a5 trailingAccessoryGroup:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = 0.0;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E170BFC0) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", 0x1E170BFC0) & 1) == 0)
  {
    if (a3)
    {
      v12 = 12.0;
      if (!v10)
      {
        objc_msgSend(v11, "_minimumCellAccessoryMargin");
        v14 = v13;
        objc_msgSend(v11, "directionalLayoutMargins");
        v12 = fmax(v14, v15);
      }
    }
    else if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) == 0 && v6)
    {
      -[UITableConstants_CarPlay defaultContentAccessoryPadding](self, "defaultContentAccessoryPadding");
      v12 = v16;
    }
  }

  return v12;
}

- (double)defaultIndentationWidthForSidebarStyle:(BOOL)a3
{
  return 10.0;
}

- (double)defaultPaddingAboveSectionHeadersForTableStyle:(int64_t)a3
{
  return 0.0;
}

- (double)defaultPaddingBetweenRows
{
  return 2.0;
}

- (double)defaultPaddingBetweenHeaderAndRows
{
  return 0.0;
}

- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[UITableConstants_CarPlay defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, a4, a3.width, a3.height);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)defaultSectionContentInsetsForTableStyle:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)shouldUseDefaultTableLayoutMarginsAsContentInsets
{
  return 1;
}

- (UIEdgeInsets)_defaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 12.0;
  v4 = 0.0;
  v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)defaultMarginWidthForTableView:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = fmax(v4, 12.0);

  return v5;
}

- (double)defaultTrailingCellMarginWidthForTableView:(id)a3
{
  return 12.0;
}

- (double)_defaultPlainHeaderFooterHeightForTableViewStyle:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[UITableConstants_CarPlay defaultHeaderFontForTableViewStyle:](self, "defaultHeaderFontForTableViewStyle:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 28.0);
  v5 = v4;

  return v5;
}

- (BOOL)shouldUppercaseHeaderFooterTextForTableStyle:(int64_t)a3 isHeader:(BOOL)a4
{
  BOOL v5;

  v5 = a3 == 16 || (unint64_t)(a3 - 1) < 2;
  return a4 && v5;
}

- (double)defaultPlainFirstSectionHeaderHeightForTableView:(id)a3
{
  double result;

  -[UITableConstants_CarPlay _defaultPlainHeaderFooterHeightForTableViewStyle:](self, "_defaultPlainHeaderFooterHeightForTableViewStyle:", objc_msgSend(a3, "_tableStyle"));
  return result;
}

- (double)defaultGroupedHeaderHeightForTableView:(id)a3
{
  return 17.5;
}

- (double)defaultGroupedFooterHeightForTableView:(id)a3
{
  return 17.5;
}

- (double)defaultPlainHeaderLabelYPositionForTableView:(id)a3 headerBounds:(CGRect)a4 textRect:(CGRect)a5 isHeader:(BOOL)a6
{
  return round((a4.size.height - a5.size.height) * 0.5);
}

- (int64_t)defaultLabelNumberOfLinesForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  return 0;
}

- (BOOL)defaultLabelAllowsTighteningForTruncationForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  return 0;
}

- (double)defaultLabelMinimumScaleFactorForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  return 0.0;
}

- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6
{
  return +[UIColor labelColor](UIColor, "labelColor", a3, a4, a5, a6);
}

- ($4B60890CD43C21BDA0D821D733CDDD8F)contentPropertiesForSidebarElementWithTraitCollection:(SEL)a3 state:(id)a4 isHeader:(id)a5 style:(BOOL)a6
{
  id v10;
  void *v11;
  id var0;
  void *v13;
  id var1;
  void *v15;
  id var2;
  void *v17;
  id var3;
  $4B60890CD43C21BDA0D821D733CDDD8F *result;
  id v20;

  v20 = a4;
  v10 = a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  -[UITableConstants_CarPlay defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", 0, __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_t48w32((uint64_t)retstr, (uint64_t)&_UITableConstantsContentPropertiesDefault).n128_f64[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = retstr->var0;
  retstr->var0 = v11;

  -[UITableConstants_CarPlay defaultDetailTextFontForCellStyle:](self, "defaultDetailTextFontForCellStyle:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = retstr->var1;
  retstr->var1 = v13;

  +[UIColor labelColor](UIColor, "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  var2 = retstr->var2;
  retstr->var2 = v15;

  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  var3 = retstr->var3;
  retstr->var3 = v17;

  if (objc_msgSend(v10, "isHighlighted"))
  {
    *(int64x2_t *)&retstr->var7 = vdupq_n_s64(7uLL);
    retstr->var9 = 7;
  }

  return result;
}

- (id)defaultSidebarTextColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 isSecondaryText:(BOOL)a6 style:(int64_t)a7
{
  return +[UIColor labelColor](UIColor, "labelColor", a3, a4, a5, a6, a7);
}

- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6
{
  return 0;
}

- (id)defaultFocusedTextColorForCell:(id)a3 inTableView:(id)a4
{
  return +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor", a3, a4);
}

- (id)defaultTextLabelFontForCellStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCallout"));
}

- (double)defaultTextLabelFontSizeForCellStyle:(int64_t)a3
{
  double result;

  result = 18.0;
  if (a3 == 2)
    result = 14.0;
  if (a3 == 1)
    return 17.0;
  return result;
}

- (id)defaultDetailTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 state:(id)a5
{
  return +[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor", a3, a4, a5);
}

- (id)defaultFocusedDetailTextColorForCell:(id)a3 inTableView:(id)a4
{
  return +[UIColor _carSystemFocusPrimaryColor](UIColor, "_carSystemFocusPrimaryColor", a3, a4);
}

- (id)defaultDetailTextFontForCellStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCallout"));
}

- (double)defaultDetailTextLabelFontSizeForCellStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
    return 17.0;
  if (a3 == 3)
    return 12.0;
  -[UITableConstants_CarPlay defaultTextLabelFontSizeForCellStyle:](self, "defaultTextLabelFontSizeForCellStyle:");
  return result;
}

- (id)defaultHeaderFontForTableViewStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[UIScreen _carScreen](UIScreen, "_carScreen", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleEmphasizedTitle3"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultFooterFontForTableViewStyle:(int64_t)a3
{
  __CFString **v3;

  if (a3)
    v3 = UIFontTextStyleShortFootnote;
  else
    v3 = UIFontTextStyleSubtitle2;
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *v3);
}

- (id)defaultHeaderTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  if (a3)
    +[UIColor _groupTableHeaderFooterTextColor](UIColor, "_groupTableHeaderFooterTextColor", a3, a4);
  else
    +[UIColor _plainTableHeaderFooterTextColor](UIColor, "_plainTableHeaderFooterTextColor", 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultFooterTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  if (a3)
    +[UIColor _groupTableHeaderFooterTextColor](UIColor, "_groupTableHeaderFooterTextColor", a3, a4);
  else
    +[UIColor _plainTableHeaderFooterTextColor](UIColor, "_plainTableHeaderFooterTextColor", 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3
{
  return 0;
}

- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3
{
  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6
{
  _UITableConstantsBackgroundProperties *result;

  if (a7)
    +[UIColor tablePlainHeaderFooterFloatingBackgroundColor](UIColor, "tablePlainHeaderFooterFloatingBackgroundColor", a4, a5, a6);
  else
    +[UIColor tablePlainHeaderFooterBackgroundColor](UIColor, "tablePlainHeaderFooterBackgroundColor", a4, a5, a6);
  result = (_UITableConstantsBackgroundProperties *)objc_claimAutoreleasedReturnValue();
  retstr->var13.trailing = 0.0;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var1 = result;
  return result;
}

- (id)defaultAccessoryColorForCell:(id)a3 inTableView:(id)a4
{
  return +[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor", a3, a4);
}

- (id)defaultFocusedAccessoryColorForCell:(id)a3 inTableView:(id)a4
{
  return +[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor", a3, a4);
}

- (id)_defaultAccessoryColorFocused:(BOOL)a3
{
  if (a3)
    +[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor");
  else
    +[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_imageWithName:(id)a3 accessoryBaseColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a4;
  v6 = a3;
  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleEmphasizedCallout"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v8, "imageWithTintColor:renderingMode:", v5, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

- (id)defaultDisclosureImageForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  return -[UITableConstants_CarPlay _imageWithName:accessoryBaseColor:](self, "_imageWithName:accessoryBaseColor:", CFSTR("chevron.forward"), a4);
}

- (id)defaultFocusedDisclosureImageForCell:(id)a3 inTableView:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "_accessoryBaseColor", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_CarPlay _imageWithName:accessoryBaseColor:](self, "_imageWithName:accessoryBaseColor:", CFSTR("chevron.forward"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultCheckmarkImageForCell:(id)a3
{
  return -[UITableConstants_CarPlay _imageWithName:accessoryBaseColor:](self, "_imageWithName:accessoryBaseColor:", CFSTR("checkmark"), 0);
}

- (id)defaultFocusedCheckmarkImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_CarPlay _imageWithName:accessoryBaseColor:](self, "_imageWithName:accessoryBaseColor:", CFSTR("checkmark"), 0);
}

- (id)defaultDetailAccessoryImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("info.circle"));
}

- (CGSize)defaultEditControlSizeForCell:(id)a3 inTableView:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[UITableConstants_CarPlay defaultDeleteImageForCell:](self, "defaultDeleteImageForCell:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)defaultEditControlPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 25.0;
}

- (double)defaultSpaceBetweenEditAndReorderControlsForCell:(id)a3 inTableView:(id)a4
{
  return 0.0;
}

- (CGRect)defaultDeleteMinusRectForCell:(id)a3 inTableView:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = 8.0;
  v5 = 12.0;
  v6 = 13.0;
  v7 = 3.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)defaultDeleteImageForCell:(id)a3
{
  return -[UITableConstants_CarPlay defaultDeleteImageWithTintColor:backgroundColor:](self, "defaultDeleteImageWithTintColor:backgroundColor:", 0, 0);
}

- (id)defaultDeleteImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  void *v4;
  void *v5;

  +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("minus.circle.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultInsertImageForCell:(id)a3
{
  return -[UITableConstants_CarPlay defaultInsertImageWithTintColor:backgroundColor:](self, "defaultInsertImageWithTintColor:backgroundColor:", 0, 0);
}

- (id)defaultInsertImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  void *v4;
  void *v5;

  +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultMultiSelectNotSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 accessoryBaseColor:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  -[UITableConstants_CarPlay defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v8, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("circle"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = v7;
  }
  else
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_msgSend(v10, "imageWithTintColor:renderingMode:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v8 = a5;
  -[UITableConstants_CarPlay defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v9, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage checkmarkImage](UIImage, "checkmarkImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v12, "imageWithTintColor:renderingMode:", v8, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }

  return v12;
}

- (double)defaultEditAndUpdateAnimationDuration
{
  return 0.3;
}

- (CGSize)defaultReorderControlSizeForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  objc_msgSend(a3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_CarPlay defaultReorderControlImageForTraitCollection:withAccessoryBaseColor:isTracking:](self, "defaultReorderControlImageForTraitCollection:withAccessoryBaseColor:isTracking:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;

  v11 = v8 + 30.0;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)defaultReorderControlImageForTraitCollection:(id)a3 withAccessoryBaseColor:(id)a4 isTracking:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _UIImageWithName(CFSTR("UITableGrabber.png"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v7, 0, v8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage;
    if (!defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage)
    {
      _UIImageWithName(CFSTR("UITableGrabber.png"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "size");
      v13 = v12;
      v15 = v14;
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v16, 0, v11, 0, v13, v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage;
      defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage = v17;

      v10 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____grabberImage;
    }
    v9 = v10;
  }

  return v9;
}

- (double)defaultAlphaForReorderingCell
{
  return 0.8;
}

- (BOOL)reorderingCellWantsShadows
{
  return 1;
}

- (double)defaultVerticalAccessorySeparatorReplacementPaddingWidth
{
  return 6.0;
}

- (double)defaultAlphaForDraggingCell:(id)a3 inTableView:(id)a4
{
  return 1.0;
}

- (double)defaultFocusedHorizontalOutsetForTableView:(id)a3
{
  return 0.0;
}

- (double)defaultFocusedShadowRadiusForTableView:(id)a3
{
  return 0.0;
}

- (double)defaultMaskGradientHeightForTableView:(id)a3
{
  return 0.0;
}

- (id)defaultImageSymbolConfigurationForTraitCollection:(id)a3
{
  return 0;
}

- (id)defaultImageTintColorForState:(id)a3 traitCollection:(id)a4
{
  return 0;
}

- (id)defaultAccessoryTintColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7 inheritedTintColor:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v17;
  uint64_t v18;

  v12 = a6;
  v13 = a7;
  v14 = a8;
  v15 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
      break;
    case 7:
      +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 8:
      +[UIColor separatorColor](UIColor, "separatorColor");
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v15 = (void *)v18;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("UITableConstants_CarPlay.m"), 805, CFSTR("Invalid _UICellAccessorySystemType value: %ld"), a3);

      v15 = 0;
      break;
  }

  return v15;
}

- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7
{
  return 0;
}

- (unint64_t)contentClipCornersForCell:(id)a3 inTableView:(id)a4
{
  return 15;
}

- (BOOL)shouldAnimatePropertyInContentViewWithKey:(id)a3
{
  return 0;
}

- (double)reorderControlHoverEffectCornerRadius
{
  return 0.0;
}

- (UIEdgeInsets)reorderControlHoverEffectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
