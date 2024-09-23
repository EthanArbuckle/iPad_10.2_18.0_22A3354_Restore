@implementation UITableConstants_TV

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants_3;
  if (!sharedConstants___sharedConstants_3)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_3;
    sharedConstants___sharedConstants_3 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_3;
  }
  return v3;
}

- (id)sidebarVariant
{
  return +[UITableConstants_TVSidebar sharedConstants](UITableConstants_TVSidebar, "sharedConstants");
}

- (BOOL)supportsUserInterfaceStyles
{
  return 1;
}

- (id)defaultBackgroundColorForTableViewStyle:(int64_t)a3
{
  return +[UIColor clearColor](UIColor, "clearColor", a3);
}

- (id)defaultBackgroundEffectsForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (id)defaultSeparatorColorForTableViewStyle:(int64_t)a3
{
  if (a3)
    +[UIColor tableSeparatorDarkColor](UIColor, "tableSeparatorDarkColor");
  else
    +[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultSeparatorVisualEffectForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  id v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id var1;
  _UITableConstantsBackgroundProperties *result;
  id v18;

  v18 = a5;
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
  -[UITableConstants_TV defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  if (a4)
  {
    if (objc_msgSend(v18, "isHighlighted"))
    {
      +[UIColor tableCellHighlightedBackgroundColor](UIColor, "tableCellHighlightedBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v18, "isFocused"))
    {
      +[UIColor tableCellFocusedBackgroundColor](UIColor, "tableCellFocusedBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v18, "isSelected"))
    {
      +[UIColor tableCellGroupedSelectedBackgroundColor](UIColor, "tableCellGroupedSelectedBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v18, "isDisabled"))
        +[UIColor tableCellDisabledBackgroundColor](UIColor, "tableCellDisabledBackgroundColor");
      else
        +[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    var1 = retstr->var1;
    retstr->var1 = v12;

    v15 = objc_msgSend(v18, "isFocused");
    goto LABEL_23;
  }
  if (objc_msgSend(v18, "isHighlighted"))
  {
    +[UIColor tableCellHighlightedBackgroundColor](UIColor, "tableCellHighlightedBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v18, "isFocused"))
  {
    +[UIColor tableCellFocusedBackgroundColor](UIColor, "tableCellFocusedBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v18, "isSelected"))
    {
      v14 = retstr->var1;
      retstr->var1 = 0;
      goto LABEL_15;
    }
    +[UIColor tableCellPlainSelectedBackgroundColor](UIColor, "tableCellPlainSelectedBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = retstr->var1;
  retstr->var1 = v13;
LABEL_15:

  if (!objc_msgSend(v18, "isSelected"))
    goto LABEL_25;
  v15 = objc_msgSend(v18, "isFocused");
LABEL_23:
  if ((v15 & 1) == 0)
    retstr->var5 = 3;
LABEL_25:

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
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Calling a method on tvOS that is not implemented for this platform. This is a UIKit bug.", buf, 2u);
    }

  }
  else
  {
    v7 = defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection____s_category_0;
    if (!defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection____s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&defaultSidebarCellBackgroundPropertiesForStyle_state_traitCollection____s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Calling a method on tvOS that is not implemented for this platform. This is a UIKit bug.", v11, 2u);
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
      _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Calling a method on tvOS that is not implemented for this platform. This is a UIKit bug.", buf, 2u);
    }

  }
  else
  {
    v6 = defaultSidebarHeaderBackgroundPropertiesWithState_traitCollection____s_category_0;
    if (!defaultSidebarHeaderBackgroundPropertiesWithState_traitCollection____s_category_0)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&defaultSidebarHeaderBackgroundPropertiesWithState_traitCollection____s_category_0);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Calling a method on tvOS that is not implemented for this platform. This is a UIKit bug.", v10, 2u);
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
  double result;

  result = 66.0;
  if (a4 == 3)
    return 120.0;
  return result;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  double result;

  -[UITableConstants_TV defaultRowHeightForTableView:cellStyle:](self, "defaultRowHeightForTableView:cellStyle:", a3, 0);
  return result;
}

- (BOOL)defaultRowHeightDependsOnCellStyle
{
  return 1;
}

- (double)defaultSectionHeaderHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;

  v5 = a4;
  if (!v5)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = dbl_186680B50[a3 == 0];
  objc_msgSend(v5, "scale");
  v8 = UIPixelBoundaryOffset(1, v6, v7);

  return v8;
}

- (double)defaultSectionFooterHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  id v6;
  double v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v6 = a4;
  if (!v6)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = dbl_186680B50[a3 == 0];
  v8 = dyld_program_sdk_at_least();
  if (!a3 && v8)
  {
    -[UITableConstants_TV defaultFooterFontForTableViewStyle:](self, "defaultFooterFontForTableViewStyle:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointSize");
    v7 = v10;

  }
  objc_msgSend(v6, "scale");
  v12 = UIPixelBoundaryOffset(0, v7, v11);

  return v12;
}

- (double)defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:(int64_t)a3
{
  return 35.0;
}

- (double)defaultSectionHeaderHeightForTableView:(id)a3
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
  -[UITableConstants_TV defaultSectionHeaderHeightForTableViewStyle:screen:](self, "defaultSectionHeaderHeightForTableViewStyle:screen:", v5, v8);
  v10 = v9;

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
  -[UITableConstants_TV defaultSectionHeaderHeightForTableViewStyle:screen:](self, "defaultSectionHeaderHeightForTableViewStyle:screen:", v5, v8);
  v10 = v9;

  return v10;
}

- (double)defaultTextToSubtitlePaddingForCellStyle:(int64_t)a3
{
  return 15.0;
}

- (double)_defaultNeighborPadding
{
  return 20.0;
}

- (double)minimumContentViewHeightForFont:(id)a3 traitCollection:(id)a4
{
  double result;

  objc_msgSend(a3, "_bodyLeading");
  return result;
}

- (UIEdgeInsets)defaultLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIEdgeInsets result;

  v7 = objc_msgSend(a4, "_tableStyle");
  v8 = objc_msgSend(a3, "_cellStyle");
  -[UITableConstants_TV defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", objc_msgSend(a3, "_cellStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "_rawLayoutMargins");
  -[UITableConstants_TV defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:](self, "defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:", v7, v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = a4;
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "screen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v22 = v21;
    v24 = v23;
    v25 = objc_msgSend(v18, "style");

    -[UITableConstants_TV defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", v20, v25, v22, v24);
    v27 = v26;

    v11 = UIEdgeInsetsMax(15, v11, v13, v15, v17, v27);
    v13 = v28;
    v15 = v29;
    v17 = v30;
  }
  v31 = v11;
  v32 = v13;
  v33 = v15;
  v34 = v17;
  result.right = v34;
  result.bottom = v33;
  result.left = v32;
  result.top = v31;
  return result;
}

- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  -[UITableConstants_TV _defaultNeighborPadding](self, "_defaultNeighborPadding", a3, a4, a5, a6.top, a6.left, a6.bottom, a6.right);
  v7 = v6;
  v8 = 10.0;
  v9 = 10.0;
  v10 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[UITableConstants_TV _defaultNeighborPadding](self, "_defaultNeighborPadding", a3, a4, a5);
  v7 = v6;
  -[UITableConstants_TV _defaultNeighborPadding](self, "_defaultNeighborPadding");
  v9 = v8;
  v10 = 15.0;
  v11 = 15.0;
  v12 = v7;
  result.right = v9;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (BOOL)imageViewOffsetByLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  return 0;
}

- (double)defaultContentEditPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 0.0;
}

- (double)defaultContentReorderPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 0.0;
}

- (double)defaultContentAccessoryPadding
{
  return 20.0;
}

- (double)_symbolImageLayoutSizeForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  +[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v3, 35.0);
  v6 = v5;

  return v6;
}

- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  double result;

  -[UITableConstants_TV _symbolImageLayoutSizeForTraitCollection:](self, "_symbolImageLayoutSizeForTraitCollection:", a4);
  return result;
}

- (double)defaultDisclosureLayoutWidthForView:(id)a3
{
  return 0.0;
}

- (double)defaultCellCornerRadiusForTableViewStyle:(int64_t)a3 isSidebarStyle:(BOOL)a4 isHeaderFooter:(BOOL)a5 traitCollection:(id)a6
{
  return 12.0;
}

- (double)interspaceBetweenInnerAccessoryIdentifier:(id)a3 outerAccessoryIdentifier:(id)a4 forCell:(id)a5 trailingAccessoryGroup:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v13 = 12.0;
    if (!v11)
    {
      if (qword_1ECD80968 != -1)
        dispatch_once(&qword_1ECD80968, &__block_literal_global_525);
      v13 = 0.0;
      if ((objc_msgSend((id)_MergedGlobals_1239, "containsObject:", v10) & 1) == 0)
      {
        objc_msgSend(v12, "_minimumCellAccessoryMargin");
        v15 = v14;
        objc_msgSend(v12, "directionalLayoutMargins");
        v13 = fmax(v15, v16);
      }
    }
  }
  else
  {
    v13 = 0.0;
    if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) == 0 && v6)
    {
      -[UITableConstants_TV defaultContentAccessoryPadding](self, "defaultContentAccessoryPadding");
      v13 = v17;
    }
  }

  return v13;
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
  return 14.0;
}

- (double)defaultPaddingBetweenHeaderAndRows
{
  return 0.0;
}

- (UIEdgeInsets)defaultTableLayoutMarginsForScreen:(id)a3 size:(CGSize)a4 tableStyle:(int64_t)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  if (dyld_program_sdk_at_least())
  {
    v7 = 30.0;
    if (a5 != 1)
      v7 = 20.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = v7;
  }
  else
  {
    -[UITableConstants_TV _defaultLayoutMargins](self, "_defaultLayoutMargins");
  }
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[UITableConstants_TV defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, a4, a3.width, a3.height);
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
  v3 = 20.0;
  v4 = 0.0;
  v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)defaultMarginWidthForTableView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  int v7;
  double result;

  objc_msgSend(a3, "_scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "directionalLayoutMargins");
  v6 = v5;

  v7 = objc_msgSend(a3, "_sectionContentInsetFollowsLayoutMargins");
  result = fmax(v6, 20.0);
  if (v7)
    return v6 + 20.0;
  return result;
}

- (double)defaultLeadingCellMarginWidthForTableView:(id)a3
{
  void *v5;
  double v6;
  double v7;

  if ((objc_msgSend(a3, "_sectionContentInsetFollowsLayoutMargins") & 1) != 0)
    return 20.0;
  objc_msgSend(a3, "_scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "directionalLayoutMargins");
  v7 = v6;

  return fmax(v7, 20.0);
}

- (double)defaultTrailingCellMarginWidthForTableView:(id)a3
{
  return 20.0;
}

- (BOOL)shouldUppercaseHeaderFooterTextForTableStyle:(int64_t)a3 isHeader:(BOOL)a4
{
  return a4;
}

- (double)defaultPlainFirstSectionHeaderHeightForTableView:(id)a3
{
  return 58.0;
}

- (double)defaultPlainHeaderLabelYPositionForTableView:(id)a3 headerBounds:(CGRect)a4 textRect:(CGRect)a5 isHeader:(BOOL)a6
{
  double v6;
  double y;
  void *v8;
  double v9;
  double v10;

  v6 = a4.size.height - a5.size.height;
  if (a6)
  {
    if (v6 >= a4.origin.y)
      y = a4.origin.y;
    else
      y = a4.size.height - a5.size.height;
    -[UITableConstants_TV defaultHeaderFontForTableViewStyle:](self, "defaultHeaderFontForTableViewStyle:", objc_msgSend(a3, "_tableStyle", a4.origin.x));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descender");
    v10 = floor(v9);

    if (v6 - (v10 + 22.0) >= y)
      return v6 - (v10 + 22.0);
    else
      return y;
  }
  return v6;
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

- (id)defaultTextColorForUserInterfaceStyle:(int64_t)a3
{
  void *v3;

  if (a3 == 1000 || a3 == 2)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6
{
  id v8;
  uint64_t v9;
  void *v10;

  v8 = a4;
  if ((objc_msgSend(a6, "isFocused") & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v8, "userInterfaceStyle");
  -[UITableConstants_TV defaultTextColorForUserInterfaceStyle:](self, "defaultTextColorForUserInterfaceStyle:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- ($4B60890CD43C21BDA0D821D733CDDD8F)contentPropertiesForSidebarElementWithTraitCollection:(SEL)a3 state:(id)a4 isHeader:(id)a5 style:(BOOL)a6
{
  _BOOL8 v8;
  id v12;
  double v13;
  void *v14;
  id var0;
  void *v16;
  void *v17;
  id v18;
  id var1;
  void *v20;
  id var2;
  void *v22;
  id var3;
  void *v24;
  id var4;
  void *v26;
  id var5;
  $4B60890CD43C21BDA0D821D733CDDD8F *result;
  id v29;

  v8 = a6;
  v29 = a4;
  v12 = a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_QWORD *)&v13 = __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_t48w32((uint64_t)retstr, (uint64_t)&_UITableConstantsContentPropertiesDefault).n128_u64[0];
  if (v8)
  {
    -[UITableConstants_TV defaultSidebarHeaderFont](self, "defaultSidebarHeaderFont", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    var0 = retstr->var0;
    retstr->var0 = v14;

    -[UITableConstants_TV defaultDetailTextFontForCellStyle:](self, "defaultDetailTextFontForCellStyle:", 0);
  }
  else
  {
    -[UITableConstants_TV defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", 0, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = retstr->var0;
    retstr->var0 = v17;

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = retstr->var1;
  retstr->var1 = v16;

  -[UITableConstants_TV defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:](self, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v29, v12, 0, 0, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  var2 = retstr->var2;
  retstr->var2 = v20;

  -[UITableConstants_TV defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:](self, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v29, v12, v8, 1, a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  var3 = retstr->var3;
  retstr->var3 = v22;

  -[UITableConstants_TV defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:](self, "defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:", v29, v12, v8, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  var4 = retstr->var4;
  retstr->var4 = v24;

  -[UITableConstants_TV defaultImageSymbolConfigurationForTraitCollection:](self, "defaultImageSymbolConfigurationForTraitCollection:", v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  var5 = retstr->var5;
  retstr->var5 = v26;

  if (objc_msgSend(v12, "isHighlighted"))
  {
    *(int64x2_t *)&retstr->var7 = vdupq_n_s64(7uLL);
    retstr->var9 = 7;
  }

  return result;
}

- (id)defaultSidebarTextColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 isSecondaryText:(BOOL)a6 style:(int64_t)a7
{
  return -[UITableConstants_TV defaultTextColorForCellStyle:traitCollection:tintColor:state:](self, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 0, a3, 0, a4, a7);
}

- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6
{
  return -[UITableConstants_TV defaultImageTintColorForState:traitCollection:](self, "defaultImageTintColorForState:traitCollection:", a4, a3, a5, a6);
}

- (id)defaultFocusedTextColorForCell:(id)a3 inTableView:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "_cellStyle");
  objc_msgSend(v5, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_TV defaultTextColorForCellStyle:traitCollection:tintColor:state:](self, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)defaultTextLabelFontForCellStyle:(int64_t)a3
{
  const UIFontTextStyle *v3;

  v3 = &UIFontTextStyleHeadline;
  if (a3 == 1000)
    v3 = &UIFontTextStyleBody;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *v3);
  return (id)objc_claimAutoreleasedReturnValue();
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

- (id)defaultDetailTextColorForUserInterfaceStyle:(int64_t)a3
{
  void *v3;

  if (a3 == 1000 || a3 == 2)
  {
    +[UIColor _tvInterfaceStyleDarkContentColor](UIColor, "_tvInterfaceStyleDarkContentColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor _tvInterfaceStyleLightContentColor](UIColor, "_tvInterfaceStyleLightContentColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)defaultDetailTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 state:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;

  v7 = a4;
  if ((objc_msgSend(a5, "isFocused") & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "userInterfaceStyle");
  -[UITableConstants_TV defaultDetailTextColorForUserInterfaceStyle:](self, "defaultDetailTextColorForUserInterfaceStyle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultFocusedDetailTextColorForCell:(id)a3 inTableView:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "_cellStyle");
  objc_msgSend(v5, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_TV defaultDetailTextColorForCellStyle:traitCollection:state:](self, "defaultDetailTextColorForCellStyle:traitCollection:state:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultDetailTextFontForCellStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *off_1E16E39A0[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)defaultDetailTextLabelFontSizeForCellStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
    return 17.0;
  if (a3 == 3)
    return 12.0;
  -[UITableConstants_TV defaultTextLabelFontSizeForCellStyle:](self, "defaultTextLabelFontSizeForCellStyle:");
  return result;
}

- (id)defaultHeaderFontForTableViewStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedBody"));
}

- (id)defaultFooterFontForTableViewStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
}

- (id)fallbackHeaderTextColorForTableViewStyle:(int64_t)a3 userInterfaceStyle:(int64_t)a4
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor", a3, a4);
}

- (id)defaultHeaderTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  if (a4)
    +[UIColor _tvInterfaceStyleLightContentColor](UIColor, "_tvInterfaceStyleLightContentColor", a3);
  else
    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor", a3);
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
  retstr->var13.trailing = 0.0;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return self;
}

- (id)_kitImageNamed:(id)a3 withTint:(id)a4 flippedForRightToLeftLayoutDirection:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "size");
  +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v7, 0, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v12, "imageFlippedForRightToLeftLayoutDirection");
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }

  return v12;
}

- (id)_symbolImageNamed:(id)a3 font:(id)a4 cell:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_defaultDisclosureImageForCell:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[UITableConstants_TV defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", objc_msgSend(a3, "_cellStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", qword_1ECD80978);
  v7 = (void *)qword_1ECD80970;
  if (v6)
    v8 = qword_1ECD80970 == 0;
  else
    v8 = 1;
  if (v8)
  {
    -[UITableConstants_TV _symbolImageNamed:font:cell:](self, "_symbolImageNamed:font:cell:", CFSTR("chevron.forward"), v5, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)qword_1ECD80970;
    qword_1ECD80970 = v9;

    objc_storeStrong((id *)&qword_1ECD80978, v5);
    v7 = (void *)qword_1ECD80970;
  }
  v11 = v7;

  return v11;
}

- (id)defaultDisclosureImageForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  -[UITableConstants_TV _defaultDisclosureImageForCell:](self, "_defaultDisclosureImageForCell:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v11 = v10;
  if (!v10)
  {
    if (v8 == 1000 || v8 == 2)
    {
      +[UIColor _tvInterfaceStyleDarkContentColor](UIColor, "_tvInterfaceStyleDarkContentColor");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIColor _tvInterfaceStyleLightContentColor](UIColor, "_tvInterfaceStyleLightContentColor");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v12;
  }
  objc_msgSend(v9, "imageWithTintColor:renderingMode:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)defaultFocusedDisclosureImageForCell:(id)a3 inTableView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[UITableConstants_TV _defaultDisclosureImageForCell:](self, "_defaultDisclosureImageForCell:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor _tvInterfaceStyleLightContentColor](UIColor, "_tvInterfaceStyleLightContentColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_defaultCheckmarkImageForCell:(id)a3 forUserInterfaceStyle:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t *v9;
  int v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  -[UITableConstants_TV defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", objc_msgSend(a3, "_cellStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 1000 || a4 == 2)
  {
    v9 = &qword_1ECD80990;
    v10 = objc_msgSend(v7, "isEqual:", qword_1ECD80998);
    v11 = (void *)qword_1ECD80990;
    if (v10)
      v12 = qword_1ECD80990 == 0;
    else
      v12 = 1;
    if (!v12)
      goto LABEL_16;
    +[UIColor _tvInterfaceStyleDarkContentColor](UIColor, "_tvInterfaceStyleDarkContentColor");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v16 = (void *)v13;
    -[UITableConstants_TV _symbolImageNamed:font:cell:](self, "_symbolImageNamed:font:cell:", CFSTR("checkmark"), v8, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithTintColor:renderingMode:", v16, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*v9;
    *v9 = v18;

    objc_storeStrong((id *)v9 + 1, v8);
    v11 = (void *)*v9;
    goto LABEL_16;
  }
  v9 = &qword_1ECD80980;
  v14 = objc_msgSend(v7, "isEqual:", qword_1ECD80988);
  v11 = (void *)qword_1ECD80980;
  if (v14)
    v15 = qword_1ECD80980 == 0;
  else
    v15 = 1;
  if (v15)
  {
    +[UIColor _tvInterfaceStyleLightContentColor](UIColor, "_tvInterfaceStyleLightContentColor");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:
  v20 = v11;

  return v20;
}

- (id)defaultCheckmarkImageForCell:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_TV _defaultCheckmarkImageForCell:forUserInterfaceStyle:](self, "_defaultCheckmarkImageForCell:forUserInterfaceStyle:", a3, objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultFocusedCheckmarkImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultCheckmarkImageForCell:forUserInterfaceStyle:](self, "_defaultCheckmarkImageForCell:forUserInterfaceStyle:", a3, 1);
}

- (id)defaultDetailAccessoryImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("info.circle"));
}

- (CGSize)defaultEditControlSizeForCell:(id)a3 inTableView:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = 105.0;
  v5 = 70.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)defaultEditControlPaddingForCell:(id)a3 inTableView:(id)a4
{
  return 0.0;
}

- (double)defaultSpaceBetweenEditAndReorderControlsForCell:(id)a3 inTableView:(id)a4
{
  return 12.0;
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

- (id)defaultDeleteImageForUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("trash"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1000 || a3 == 2)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:renderingMode:", v7, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage_0;
    if (!defaultDeleteImageForUserInterfaceStyle____deleteImage_0)
    {
      ImageWithOpacity(v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage_0;
      defaultDeleteImageForUserInterfaceStyle____deleteImage_0 = v10;

      v9 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage_0;
    }
    v8 = v9;
  }

  return v8;
}

- (id)defaultDeleteImageForCell:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_TV defaultDeleteImageForUserInterfaceStyle:](self, "defaultDeleteImageForUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultDeleteImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0;
  if (!defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0)
  {
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("trash"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0;
    defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0 = v10;

    v7 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage_0;
    if (v5)
      goto LABEL_3;
LABEL_5:
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithTintColor:renderingMode:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (id)defaultFocusedDeleteImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV defaultDeleteImageForUserInterfaceStyle:](self, "defaultDeleteImageForUserInterfaceStyle:", 1, a4);
}

- (id)_defaultInsertImageForUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1000 || a3 == 2)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:renderingMode:", v7, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage_0;
    if (!_defaultInsertImageForUserInterfaceStyle____insertImage_0)
    {
      ImageWithOpacity(v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage_0;
      _defaultInsertImageForUserInterfaceStyle____insertImage_0 = v10;

      v9 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage_0;
    }
    v8 = v9;
  }

  return v8;
}

- (id)defaultInsertImageForCell:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_TV _defaultInsertImageForUserInterfaceStyle:](self, "_defaultInsertImageForUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultInsertImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0;
  if (!defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0)
  {
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0;
    defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0 = v10;

    v7 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage_0;
    if (v5)
      goto LABEL_3;
LABEL_5:
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithTintColor:renderingMode:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (id)defaultFocusedInsertImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultInsertImageForUserInterfaceStyle:](self, "_defaultInsertImageForUserInterfaceStyle:", 1, a4);
}

- (id)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("circle"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1000 || a3 == 2)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:renderingMode:", v7, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0;
    if (!_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0)
    {
      ImageWithOpacity(v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0;
      _defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0 = v10;

      v9 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage_0;
    }
    v8 = v9;
  }

  return v8;
}

- (id)defaultMultiSelectNotSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 accessoryBaseColor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0;
    if (!defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0)
    {
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("circle"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0;
      defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0 = v11;

      v9 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage_0;
    }
    objc_msgSend(v9, "imageWithTintColor:renderingMode:", v8, 1);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITableConstants_TV _defaultMultiSelectNotSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

- (id)defaultFocusedMultiSelectNotSelectedImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultMultiSelectNotSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:", 1, a4);
}

- (id)_defaultMultiSelectSelectedImageForUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage checkmarkImage](UIImage, "checkmarkImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1000 || a3 == 2)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:renderingMode:", v7, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0;
    if (!_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0)
    {
      ImageWithOpacity(v6);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0;
      _defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0 = v10;

      v9 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage_0;
    }
    v8 = v9;
  }

  return v8;
}

- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6
{
  return -[UITableConstants_TV _defaultMultiSelectSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectSelectedImageForUserInterfaceStyle:", objc_msgSend(a4, "userInterfaceStyle", a3));
}

- (id)defaultFocusedMultiSelectSelectedImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultMultiSelectSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectSelectedImageForUserInterfaceStyle:", 1, a4);
}

- (double)defaultEditAndUpdateAnimationDuration
{
  return 0.3;
}

- (CGSize)defaultReorderControlSizeForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = 105.0;
  v5 = 70.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_defaultReorderControlImageForUserInterfaceStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (a3 == 1000 || a3 == 2)
  {
    v4 = (void *)qword_1ECD809A8;
    if (!qword_1ECD809A8)
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableConstants_TV _kitImageNamed:withTint:flippedForRightToLeftLayoutDirection:](self, "_kitImageNamed:withTint:flippedForRightToLeftLayoutDirection:", CFSTR("UITableGrabber"), v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = &qword_1ECD809A8;
      v8 = (void *)qword_1ECD809A8;
      qword_1ECD809A8 = v6;

LABEL_7:
      v4 = (void *)*v7;
    }
  }
  else
  {
    v4 = (void *)qword_1ECD809A0;
    if (!qword_1ECD809A0)
    {
      _UIImageWithName(CFSTR("UITableGrabber"));
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = &qword_1ECD809A0;
      v10 = (void *)qword_1ECD809A0;
      qword_1ECD809A0 = v9;

      ImageWithOpacity((void *)qword_1ECD809A0);
      v11 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)qword_1ECD809A0;
      qword_1ECD809A0 = v11;
      goto LABEL_7;
    }
  }
  return v4;
}

- (id)defaultReorderControlImageForTraitCollection:(id)a3 withAccessoryBaseColor:(id)a4 isTracking:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0;
    if (!defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0)
    {
      _UIImageWithName(CFSTR("UITableGrabber"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0;
      defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0 = v10;

      v9 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage_0;
    }
    objc_msgSend(v9, "imageWithTintColor:renderingMode:", v8, 1);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITableConstants_TV _defaultReorderControlImageForUserInterfaceStyle:](self, "_defaultReorderControlImageForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)defaultFocusedReorderControlImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TV _defaultReorderControlImageForUserInterfaceStyle:](self, "_defaultReorderControlImageForUserInterfaceStyle:", 1, a4);
}

- (double)defaultAlphaForReorderingCell
{
  return 1.0;
}

- (BOOL)reorderingCellWantsShadows
{
  return 0;
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
  return 30.0;
}

- (double)defaultFocusedShadowRadiusForTableView:(id)a3
{
  return 20.0;
}

- (double)defaultMaskGradientHeightForTableView:(id)a3
{
  return 90.0;
}

- (id)defaultImageSymbolConfigurationForTraitCollection:(id)a3
{
  NSString *v3;
  uint64_t v4;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    if (UIContentSizeCategoryCompareToCategory(v3, CFSTR("UICTContentSizeCategoryAccessibilityXL")) == NSOrderedAscending)
    {
      if (UIContentSizeCategoryCompareToCategory(v3, CFSTR("UICTContentSizeCategoryAccessibilityM")) == NSOrderedAscending)
        v4 = 3;
      else
        v4 = 2;
    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = 3;
  }

  return +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), v4);
}

- (id)defaultImageTintColorForState:(id)a3 traitCollection:(id)a4
{
  void *v4;

  if (objc_msgSend(a3, "isFocused"))
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)defaultAccessoryTintColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7 inheritedTintColor:(id)a8
{
  id v12;
  uint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  void *v17;
  void *v18;

  v12 = a6;
  v13 = objc_msgSend(a7, "userInterfaceStyle");
  v14 = objc_msgSend(v12, "isFocused");

  v15 = v13 == 2 || v13 == 1000;
  v16 = v14 ^ 1;
  if (!v15)
    v16 = 0;
  if ((unint64_t)a3 > 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableConstants_TV.m"), 1133, CFSTR("Invalid _UICellAccessorySystemType value: %ld"), a3);

    goto LABEL_15;
  }
  if (((1 << a3) & 0x683) != 0)
  {
    if ((v16 & 1) != 0)
    {
      +[UIColor _tvInterfaceStyleDarkContentColor](UIColor, "_tvInterfaceStyleDarkContentColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      return v17;
    }
LABEL_13:
    +[UIColor _tvInterfaceStyleLightContentColor](UIColor, "_tvInterfaceStyleLightContentColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    return v17;
  }
  if (((1 << a3) & 0x3C) == 0)
  {
LABEL_15:
    v17 = 0;
    return v17;
  }
  if ((v16 & 1) == 0)
    goto LABEL_13;
  +[UIColor whiteColor](UIColor, "whiteColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7
{
  return 0;
}

- (BOOL)shouldUseRoundedGroupsForTableViewStyle:(int64_t)a3 backgroundInsets:(UIEdgeInsets)a4
{
  return 0;
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
