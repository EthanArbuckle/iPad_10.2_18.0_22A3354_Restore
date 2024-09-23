@implementation UITableConstants_TVSidebar

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants;
  if (!sharedConstants___sharedConstants)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants;
    sharedConstants___sharedConstants = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants;
  }
  return v3;
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
  id var1;
  _UITableConstantsBackgroundProperties *result;
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
  -[UITableConstants_TVSidebar defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  if (objc_msgSend(v15, "isHighlighted"))
  {
    +[UIColor tableCellHighlightedBackgroundColor](UIColor, "tableCellHighlightedBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v15, "isFocused"))
  {
    +[UIColor tableCellFocusedBackgroundColor](UIColor, "tableCellFocusedBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v15, "isSelected"))
  {
    +[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v15, "isDisabled"))
      +[UIColor tableCellDisabledBackgroundColor](UIColor, "tableCellDisabledBackgroundColor");
    else
      +[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  var1 = retstr->var1;
  retstr->var1 = v12;

  return result;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  _UITableConstantsBackgroundProperties *result;

  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault);
  return result;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarHeaderBackgroundPropertiesWithState:(SEL)a3 traitCollection:(id)a4
{
  _UITableConstantsBackgroundProperties *result;

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
  return 70.0;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  double result;

  -[UITableConstants_TVSidebar defaultRowHeightForTableView:cellStyle:](self, "defaultRowHeightForTableView:cellStyle:", a3, 0);
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
    -[UITableConstants_TVSidebar defaultFooterFontForTableViewStyle:](self, "defaultFooterFontForTableViewStyle:", 0);
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
  -[UITableConstants_TVSidebar defaultSectionHeaderHeightForTableViewStyle:screen:](self, "defaultSectionHeaderHeightForTableViewStyle:screen:", v5, v8);
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
  -[UITableConstants_TVSidebar defaultSectionHeaderHeightForTableViewStyle:screen:](self, "defaultSectionHeaderHeightForTableViewStyle:screen:", v5, v8);
  v10 = v9;

  return v10;
}

- (double)defaultImageToTextPaddingForSidebar:(BOOL)a3
{
  return 3.0;
}

- (double)defaultTextToSubtitlePaddingForCellStyle:(int64_t)a3
{
  return 15.0;
}

- (double)_defaultNeighborPadding
{
  return 22.0;
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
  -[UITableConstants_TVSidebar defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", objc_msgSend(a3, "_cellStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "_rawLayoutMargins");
  -[UITableConstants_TVSidebar defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:](self, "defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:", v7, v8, v9);
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

    -[UITableConstants_TVSidebar defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", v20, v25, v22, v24);
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
  UIEdgeInsets result;

  v6 = 0.0;
  v7 = 3.0;
  v8 = 0.0;
  v9 = 10.0;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
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

  -[UITableConstants_TVSidebar _defaultNeighborPadding](self, "_defaultNeighborPadding", a3, a4, a5);
  v7 = v6;
  -[UITableConstants_TVSidebar _defaultNeighborPadding](self, "_defaultNeighborPadding");
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
  return 64.0;
}

- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  double result;

  -[UITableConstants_TVSidebar _symbolImageLayoutSizeForTraitCollection:](self, "_symbolImageLayoutSizeForTraitCollection:", a4);
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
      if (qword_1ECD7EF00 != -1)
        dispatch_once(&qword_1ECD7EF00, &__block_literal_global_337);
      v13 = 0.0;
      if ((objc_msgSend((id)_MergedGlobals_1125, "containsObject:", v10) & 1) == 0)
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
      -[UITableConstants_TVSidebar defaultContentAccessoryPadding](self, "defaultContentAccessoryPadding");
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
  return 6.0;
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

  -[UITableConstants_TVSidebar defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, a4, a3.width, a3.height);
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
  v3 = 30.0;
  v4 = 0.0;
  v5 = 30.0;
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
  result = fmax(v6, 30.0);
  if (v7)
    return v6 + 30.0;
  return result;
}

- (double)defaultLeadingCellMarginWidthForTableView:(id)a3
{
  void *v5;
  double v6;
  double v7;

  if ((objc_msgSend(a3, "_sectionContentInsetFollowsLayoutMargins") & 1) != 0)
    return 30.0;
  objc_msgSend(a3, "_scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "directionalLayoutMargins");
  v7 = v6;

  return fmax(v7, 30.0);
}

- (double)defaultTrailingCellMarginWidthForTableView:(id)a3
{
  return 30.0;
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
    -[UITableConstants_TVSidebar defaultHeaderFontForTableViewStyle:](self, "defaultHeaderFontForTableViewStyle:", objc_msgSend(a3, "_tableStyle", a4.origin.x));
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
  -[UITableConstants_TVSidebar defaultTextColorForUserInterfaceStyle:](self, "defaultTextColorForUserInterfaceStyle:", v9);
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
    -[UITableConstants_TVSidebar defaultSidebarHeaderFont](self, "defaultSidebarHeaderFont", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    var0 = retstr->var0;
    retstr->var0 = v14;

    -[UITableConstants_TVSidebar defaultDetailTextFontForCellStyle:](self, "defaultDetailTextFontForCellStyle:", 0);
  }
  else
  {
    -[UITableConstants_TVSidebar defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", 0, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = retstr->var0;
    retstr->var0 = v17;

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = retstr->var1;
  retstr->var1 = v16;

  -[UITableConstants_TVSidebar defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:](self, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v29, v12, 0, 0, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  var2 = retstr->var2;
  retstr->var2 = v20;

  -[UITableConstants_TVSidebar defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:](self, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v29, v12, v8, 1, a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  var3 = retstr->var3;
  retstr->var3 = v22;

  -[UITableConstants_TVSidebar defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:](self, "defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:", v29, v12, v8, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  var4 = retstr->var4;
  retstr->var4 = v24;

  -[UITableConstants_TVSidebar defaultImageSymbolConfigurationForTraitCollection:](self, "defaultImageSymbolConfigurationForTraitCollection:", v29);
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
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v19[6];
  unint64_t v20;
  id v21[18];

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  if ((objc_msgSend(v13, "isDisabled") & 1) == 0)
  {

    goto LABEL_5;
  }
  v14 = objc_msgSend(v13, "isSwiped");

  if ((v14 & 1) != 0)
  {
LABEL_5:
    memset(v21, 0, 136);
    _UITableConstantsGetBackgroundProperties(self, v13, v12, v9, a7, (uint64_t)v21);
    __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v19, (uint64_t)v21);
    if (v20 <= 0xC && ((1 << v20) & 0x1081) != 0)
    {
      v16 = v19[0];
      __destructor_8_s8_s16_s24_s80(v19);
      if (v16 == (id)1)
      {
        if (v8)
          +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
        else
          +[UIColor whiteColor](UIColor, "whiteColor");
LABEL_10:
        v17 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v17;
        __destructor_8_s8_s16_s24_s80(v21);
        goto LABEL_16;
      }
    }
    else
    {
      __destructor_8_s8_s16_s24_s80(v19);
    }
    if (v8)
      +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    else
      -[UITableConstants_TVSidebar defaultTextColorForCellStyle:traitCollection:tintColor:state:](self, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", 0, v12, 0, v13);
    goto LABEL_10;
  }
  +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v15;
}

- (id)defaultSidebarImageTintColorForTraitCollection:(id)a3 state:(id)a4 isHeader:(BOOL)a5 style:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  char v12;
  void *v13;
  id v14;
  id v16[6];
  unint64_t v17;
  id v18[18];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(v11, "isDisabled") & 1) == 0)
  {

    goto LABEL_5;
  }
  v12 = objc_msgSend(v11, "isSwiped");

  if ((v12 & 1) != 0)
  {
LABEL_5:
    memset(v18, 0, 136);
    _UITableConstantsGetBackgroundProperties(self, v11, v10, v7, a6, (uint64_t)v18);
    __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v16, (uint64_t)v18);
    if (v17 <= 0xC && ((1 << v17) & 0x1081) != 0)
    {
      v14 = v16[0];
      __destructor_8_s8_s16_s24_s80(v16);
      if (v14 == (id)1)
      {
        +[UIColor whiteColor](UIColor, "whiteColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        __destructor_8_s8_s16_s24_s80(v18);
        goto LABEL_12;
      }
    }
    else
    {
      __destructor_8_s8_s16_s24_s80(v16);
    }
    v13 = 0;
    goto LABEL_11;
  }
  +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v13;
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
  -[UITableConstants_TVSidebar defaultTextColorForCellStyle:traitCollection:tintColor:state:](self, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)defaultTextLabelFontForCellStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
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
  -[UITableConstants_TVSidebar defaultDetailTextColorForUserInterfaceStyle:](self, "defaultDetailTextColorForUserInterfaceStyle:", v8);
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
  -[UITableConstants_TVSidebar defaultDetailTextColorForCellStyle:traitCollection:state:](self, "defaultDetailTextColorForCellStyle:traitCollection:state:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultDetailTextFontForCellStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *(&off_1E16D5740)[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)defaultDetailTextLabelFontSizeForCellStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
    return 17.0;
  if (a3 == 3)
    return 12.0;
  -[UITableConstants_TVSidebar defaultTextLabelFontSizeForCellStyle:](self, "defaultTextLabelFontSizeForCellStyle:");
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

  -[UITableConstants_TVSidebar defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", objc_msgSend(a3, "_cellStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", qword_1ECD7EF10);
  v7 = (void *)qword_1ECD7EF08;
  if (v6)
    v8 = qword_1ECD7EF08 == 0;
  else
    v8 = 1;
  if (v8)
  {
    -[UITableConstants_TVSidebar _symbolImageNamed:font:cell:](self, "_symbolImageNamed:font:cell:", CFSTR("chevron.forward"), v5, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)qword_1ECD7EF08;
    qword_1ECD7EF08 = v9;

    objc_storeStrong((id *)&qword_1ECD7EF10, v5);
    v7 = (void *)qword_1ECD7EF08;
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

  -[UITableConstants_TVSidebar _defaultDisclosureImageForCell:](self, "_defaultDisclosureImageForCell:", a3);
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

  -[UITableConstants_TVSidebar _defaultDisclosureImageForCell:](self, "_defaultDisclosureImageForCell:", a3, a4);
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

  -[UITableConstants_TVSidebar defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", objc_msgSend(a3, "_cellStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 1000 || a4 == 2)
  {
    v9 = &qword_1ECD7EF28;
    v10 = objc_msgSend(v7, "isEqual:", qword_1ECD7EF30);
    v11 = (void *)qword_1ECD7EF28;
    if (v10)
      v12 = qword_1ECD7EF28 == 0;
    else
      v12 = 1;
    if (!v12)
      goto LABEL_16;
    +[UIColor _tvInterfaceStyleDarkContentColor](UIColor, "_tvInterfaceStyleDarkContentColor");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v16 = (void *)v13;
    -[UITableConstants_TVSidebar _symbolImageNamed:font:cell:](self, "_symbolImageNamed:font:cell:", CFSTR("checkmark"), v8, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithTintColor:renderingMode:", v16, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*v9;
    *v9 = v18;

    objc_storeStrong((id *)v9 + 1, v8);
    v11 = (void *)*v9;
    goto LABEL_16;
  }
  v9 = &qword_1ECD7EF18;
  v14 = objc_msgSend(v7, "isEqual:", qword_1ECD7EF20);
  v11 = (void *)qword_1ECD7EF18;
  if (v14)
    v15 = qword_1ECD7EF18 == 0;
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
  -[UITableConstants_TVSidebar _defaultCheckmarkImageForCell:forUserInterfaceStyle:](self, "_defaultCheckmarkImageForCell:forUserInterfaceStyle:", a3, objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultFocusedCheckmarkImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TVSidebar _defaultCheckmarkImageForCell:forUserInterfaceStyle:](self, "_defaultCheckmarkImageForCell:forUserInterfaceStyle:", a3, 1);
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
    v9 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage;
    if (!defaultDeleteImageForUserInterfaceStyle____deleteImage)
    {
      ImageWithOpacity(v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage;
      defaultDeleteImageForUserInterfaceStyle____deleteImage = v10;

      v9 = (void *)defaultDeleteImageForUserInterfaceStyle____deleteImage;
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
  -[UITableConstants_TVSidebar defaultDeleteImageForUserInterfaceStyle:](self, "defaultDeleteImageForUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
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
  v7 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage;
  if (!defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage)
  {
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("trash"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage;
    defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage = v10;

    v7 = (void *)defaultDeleteImageWithTintColor_backgroundColor____untintedDeleteImage;
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
  return -[UITableConstants_TVSidebar defaultDeleteImageForUserInterfaceStyle:](self, "defaultDeleteImageForUserInterfaceStyle:", 1, a4);
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
    v9 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage;
    if (!_defaultInsertImageForUserInterfaceStyle____insertImage)
    {
      ImageWithOpacity(v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage;
      _defaultInsertImageForUserInterfaceStyle____insertImage = v10;

      v9 = (void *)_defaultInsertImageForUserInterfaceStyle____insertImage;
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
  -[UITableConstants_TVSidebar _defaultInsertImageForUserInterfaceStyle:](self, "_defaultInsertImageForUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
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
  v7 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage;
  if (!defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage)
  {
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage;
    defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage = v10;

    v7 = (void *)defaultInsertImageWithTintColor_backgroundColor____untintedInsertImage;
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
  return -[UITableConstants_TVSidebar _defaultInsertImageForUserInterfaceStyle:](self, "_defaultInsertImageForUserInterfaceStyle:", 1, a4);
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
    v9 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage;
    if (!_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage)
    {
      ImageWithOpacity(v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage;
      _defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage = v10;

      v9 = (void *)_defaultMultiSelectNotSelectedImageForUserInterfaceStyle____multiSelectNotSelectedImage;
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
    v9 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage;
    if (!defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage)
    {
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("circle"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage;
      defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage = v11;

      v9 = (void *)defaultMultiSelectNotSelectedImageForCellStyle_traitCollection_accessoryBaseColor____untintedMultiSelectNotSelectedImage;
    }
    objc_msgSend(v9, "imageWithTintColor:renderingMode:", v8, 1);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITableConstants_TVSidebar _defaultMultiSelectNotSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

- (id)defaultFocusedMultiSelectNotSelectedImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TVSidebar _defaultMultiSelectNotSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectNotSelectedImageForUserInterfaceStyle:", 1, a4);
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
    v9 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage;
    if (!_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage)
    {
      ImageWithOpacity(v6);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage;
      _defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage = v10;

      v9 = (void *)_defaultMultiSelectSelectedImageForUserInterfaceStyle____multiSelectSelectedImage;
    }
    v8 = v9;
  }

  return v8;
}

- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6
{
  return -[UITableConstants_TVSidebar _defaultMultiSelectSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectSelectedImageForUserInterfaceStyle:", objc_msgSend(a4, "userInterfaceStyle", a3));
}

- (id)defaultFocusedMultiSelectSelectedImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TVSidebar _defaultMultiSelectSelectedImageForUserInterfaceStyle:](self, "_defaultMultiSelectSelectedImageForUserInterfaceStyle:", 1, a4);
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
    v4 = (void *)qword_1ECD7EF40;
    if (!qword_1ECD7EF40)
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableConstants_TVSidebar _kitImageNamed:withTint:flippedForRightToLeftLayoutDirection:](self, "_kitImageNamed:withTint:flippedForRightToLeftLayoutDirection:", CFSTR("UITableGrabber"), v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = &qword_1ECD7EF40;
      v8 = (void *)qword_1ECD7EF40;
      qword_1ECD7EF40 = v6;

LABEL_7:
      v4 = (void *)*v7;
    }
  }
  else
  {
    v4 = (void *)qword_1ECD7EF38;
    if (!qword_1ECD7EF38)
    {
      _UIImageWithName(CFSTR("UITableGrabber"));
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = &qword_1ECD7EF38;
      v10 = (void *)qword_1ECD7EF38;
      qword_1ECD7EF38 = v9;

      ImageWithOpacity((void *)qword_1ECD7EF38);
      v11 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)qword_1ECD7EF38;
      qword_1ECD7EF38 = v11;
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
    v9 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage;
    if (!defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage)
    {
      _UIImageWithName(CFSTR("UITableGrabber"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage;
      defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage = v10;

      v9 = (void *)defaultReorderControlImageForTraitCollection_withAccessoryBaseColor_isTracking____untintedGrabberImage;
    }
    objc_msgSend(v9, "imageWithTintColor:renderingMode:", v8, 1);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITableConstants_TVSidebar _defaultReorderControlImageForUserInterfaceStyle:](self, "_defaultReorderControlImageForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)defaultFocusedReorderControlImageForCell:(id)a3 inTableView:(id)a4
{
  return -[UITableConstants_TVSidebar _defaultReorderControlImageForUserInterfaceStyle:](self, "_defaultReorderControlImageForUserInterfaceStyle:", 1, a4);
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
  if (objc_msgSend(a3, "isFocused"))
    +[UIColor blackColor](UIColor, "blackColor");
  else
    +[UIColor labelColor](UIColor, "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableConstants_TVSidebar.m"), 1117, CFSTR("Invalid _UICellAccessorySystemType value: %ld"), a3);

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

- (id)defaultDetailAccessoryImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("info.circle"));
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
