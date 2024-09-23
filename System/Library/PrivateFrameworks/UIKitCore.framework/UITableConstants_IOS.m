@implementation UITableConstants_IOS

- (UIEdgeInsets)defaultTableLayoutMarginsForScreen:(id)a3 size:(CGSize)a4 tableStyle:(int64_t)a5
{
  double width;
  id v6;
  int v7;
  void *v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  width = a4.width;
  v6 = a3;
  v7 = dyld_program_sdk_at_least();
  v8 = v6;
  if (!v6)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v7)
    v9 = 16.0;
  else
    v9 = 15.0;
  v10 = objc_msgSend(v8, "_wantsWideContentMargins");
  v11 = 20.0;
  if (width <= 320.0)
    v11 = 16.0;
  if (v10)
    v12 = v11;
  else
    v12 = v9;

  v13 = 0.0;
  v14 = 0.0;
  v15 = v12;
  v16 = v12;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
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

- (UIEdgeInsets)defaultLayoutMarginsInsideSectionForSize:(CGSize)a3 tableStyle:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[UITableConstants_IOS defaultTableLayoutMarginsForScreen:size:tableStyle:](self, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, a4, a3.width, a3.height);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)defaultSidebarLayoutMarginsForElementsInsideSection
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 8.0;
  v4 = 0.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)defaultCellContentTrailingPadding
{
  return 8.0;
}

- (double)defaultCellCornerRadiusForTableViewStyle:(int64_t)a3 isSidebarStyle:(BOOL)a4 isHeaderFooter:(BOOL)a5 traitCollection:(id)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  BOOL v11;
  double v12;

  v7 = a4;
  v9 = a6;
  v10 = v9;
  if (a3)
    v11 = a5;
  else
    v11 = 0;
  if (v11 || (v12 = 0.0, v7))
  {
    objc_msgSend(v9, "userInterfaceIdiom");
    v12 = 10.0;
  }

  return v12;
}

- (double)defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  double v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  if (a3)
    v4 = 28.0;
  else
    v4 = 24.0;
  v5 = a4;
  +[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", v5, v4);
  v8 = v7;

  return v8;
}

- (double)defaultPaddingBetweenHeaderAndRows
{
  return 0.0;
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

- (id)defaultDisclosureImageForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_IOS _defaultDisclosureImageForTraitCollection:](self, "_defaultDisclosureImageForTraitCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableConstants_IOS _accessoryTintColorForAccessoryBaseColor:](self, "_accessoryTintColorForAccessoryBaseColor:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageWithTintColor:renderingMode:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_defaultDisclosureImageForTraitCollection:(id)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = (void *)_MergedGlobals_1236;
  if (!_MergedGlobals_1236
    || v5
    && (!qword_1ECD808F8 || v5[13] != *(_QWORD *)(qword_1ECD808F8 + 104) || v5[15] != *(_QWORD *)(qword_1ECD808F8 + 120)))
  {
    -[UITableConstants_IOS _symbolImageNamed:withTextStyle:scale:](self, "_symbolImageNamed:withTextStyle:scale:", CFSTR("chevron.forward"), CFSTR("UICTFontTextStyleEmphasizedBody"), 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_MergedGlobals_1236;
    _MergedGlobals_1236 = v7;

    objc_storeStrong((id *)&qword_1ECD808F8, a3);
    v6 = (void *)_MergedGlobals_1236;
  }
  v9 = v6;

  return v9;
}

- (id)_accessoryTintColorForAccessoryBaseColor:(id)a3
{
  if (a3)
    return a3;
  -[UITableConstants_IOS _defaultAccessoryTintColor](self, "_defaultAccessoryTintColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultAccessoryTintColor
{
  if ((dyld_program_sdk_at_least() & 1) != 0)
    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  else
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_symbolImageNamed:(id)a3 withTextStyle:(id)a4 scale:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)interspaceBetweenInnerAccessoryIdentifier:(id)a3 outerAccessoryIdentifier:(id)a4 forCell:(id)a5 trailingAccessoryGroup:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (dyld_program_sdk_at_least())
  {
    if (v10)
    {
      if (v11)
      {
        -[UITableConstants_IOS defaultInterAccessoryPaddingForCell:trailingAccessoryGroup:](self, "defaultInterAccessoryPaddingForCell:trailingAccessoryGroup:", v12, v6);
LABEL_22:
        v14 = v13;
        goto LABEL_23;
      }
      objc_msgSend(v12, "_minimumCellAccessoryMargin");
      v16 = v15;
      objc_msgSend(v12, "directionalLayoutMargins");
      if (v6)
        v19 = v18;
      else
        v19 = v17;
      v14 = fmax(v16, v19);
    }
    else
    {
      v14 = 0.0;
      if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) == 0 && v6)
      {
        -[UITableConstants_IOS defaultCellContentTrailingPadding](self, "defaultCellContentTrailingPadding");
        goto LABEL_22;
      }
    }
  }
  else
  {
    v14 = 0.0;
    if ((objc_msgSend(v10, "isEqualToString:", 0x1E170BFC0) & 1) == 0
      && (objc_msgSend(v11, "isEqualToString:", 0x1E170BFC0) & 1) == 0)
    {
      if (v10)
      {
        if (v11)
        {
          if (objc_msgSend(v11, "isEqualToString:", 0x1E1771440))
            v14 = 16.0;
          else
            v14 = 12.0;
        }
        else
        {
          objc_msgSend(v12, "_minimumCellAccessoryMargin");
          v22 = v21;
          objc_msgSend(v12, "directionalLayoutMargins");
          v14 = fmax(v22, v23);
        }
      }
      else if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) == 0 && v6)
      {
        -[UITableConstants_IOS defaultContentAccessoryPadding](self, "defaultContentAccessoryPadding");
        goto LABEL_22;
      }
    }
  }
LABEL_23:

  return v14;
}

- (double)defaultInterAccessoryPaddingForCell:(id)a3 trailingAccessoryGroup:(BOOL)a4
{
  double result;

  if (a4)
    -[UITableConstants_IOS defaultCellContentTrailingPadding](self, "defaultCellContentTrailingPadding", a3);
  else
    -[UITableConstants_IOS defaultCellContentLeadingPaddingForSidebar:](self, "defaultCellContentLeadingPaddingForSidebar:", 0);
  return result;
}

- (BOOL)supportsUserInterfaceStyles
{
  return 0;
}

- (double)defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:(int64_t)a3
{
  return 35.0;
}

- (double)defaultRowHeightForTableView:(id)a3 cellStyle:(int64_t)a4
{
  return 44.0;
}

- (double)defaultRowHeightForTableView:(id)a3
{
  double result;

  -[UITableConstants_IOS defaultRowHeightForTableView:cellStyle:](self, "defaultRowHeightForTableView:cellStyle:", a3, 0);
  return result;
}

- (BOOL)defaultRowHeightDependsOnCellStyle
{
  return 0;
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
  -[UITableConstants_IOS defaultSectionHeaderHeightForTableViewStyle:screen:](self, "defaultSectionHeaderHeightForTableViewStyle:screen:", v5, v8);
  v10 = v9;

  return v10;
}

- (double)defaultSectionHeaderHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  double result;
  int v6;
  void *v7;
  double v8;
  double v9;

  if (a3)
    return 17.5;
  v6 = dyld_program_sdk_at_least();
  result = 23.0;
  if (v6)
  {
    -[UITableConstants_IOS defaultHeaderFontForTableViewStyle:](self, "defaultHeaderFontForTableViewStyle:", 0, 23.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_scaledValueForValue:", 28.0);
    v9 = v8;

    return v9;
  }
  return result;
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
  -[UITableConstants_IOS defaultSectionFooterHeightForTableViewStyle:screen:](self, "defaultSectionFooterHeightForTableViewStyle:screen:", v5, v8);
  v10 = v9;

  return v10;
}

- (double)_defaultMarginWidthForTableView:(id)a3 canUseLayoutMargins:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  int v13;
  void *v14;
  double v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  v4 = a4;
  objc_msgSend(a3, "_scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "_scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v12 = v8;
  v13 = dyld_program_sdk_at_least();
  v14 = v12;
  if (!v12)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v13)
    v15 = 16.0;
  else
    v15 = 15.0;
  v16 = objc_msgSend(v14, "_wantsWideContentMargins");
  v17 = 20.0;
  if (v11 <= 320.0)
    v17 = 16.0;
  if (v16)
    v18 = v17;
  else
    v18 = v15;

  if (!v4)
    return v18;
  objc_msgSend(a3, "_scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "directionalLayoutMargins");
  v21 = v20;

  return fmax(v18, v21);
}

- (double)defaultSectionFooterHeightForTableViewStyle:(int64_t)a3 screen:(id)a4
{
  double result;

  if (a3)
    return 17.5;
  -[UITableConstants_IOS defaultSectionHeaderHeightForTableViewStyle:screen:](self, "defaultSectionHeaderHeightForTableViewStyle:screen:", 0, a4);
  return result;
}

- (double)defaultPaddingAboveSectionHeadersForTableStyle:(int64_t)a3
{
  _BOOL4 v3;
  double result;

  v3 = -[UITableConstants_IOS useChromelessSectionHeadersAndFootersForTableStyle:](self, "useChromelessSectionHeadersAndFootersForTableStyle:", a3);
  result = 0.0;
  if (v3)
    return 22.0;
  return result;
}

- (int64_t)defaultHeaderFooterPinningBehaviorForTableStyle:(int64_t)a3
{
  return -[UITableConstants_IOS useChromelessSectionHeadersAndFootersForTableStyle:](self, "useChromelessSectionHeadersAndFootersForTableStyle:", a3);
}

- (BOOL)useChromelessSectionHeadersAndFootersForTableStyle:(int64_t)a3
{
  if (a3)
    return 0;
  else
    return dyld_program_sdk_at_least();
}

- (id)defaultHeaderFontForTableViewStyle:(int64_t)a3
{
  void *v3;

  if (a3)
  {
    if (dyld_program_sdk_at_least())
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
    else
      objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 14.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITableConstants_IOS defaultPlainHeaderFooterFont](self, "defaultPlainHeaderFooterFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)defaultInsetGroupedHeaderFontForExtraProminentStyle:(BOOL)a3 secondaryText:(BOOL)a4
{
  __CFString **v4;

  v4 = UIFontTextStyleEmphasizedTitle2;
  if (!a3)
    v4 = UIFontTextStyleEmphasizedTitle3;
  if (a4)
    v4 = (__CFString **)&UIFontTextStyleSubheadline;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)defaultLabelNumberOfLinesForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  NSString *v4;
  int64_t v5;

  if (!a3)
    return 0;
  objc_msgSend(a4, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = !UIContentSizeCategoryIsAccessibilityCategory(v4);

  return v5;
}

- (double)defaultLabelMinimumScaleFactorForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  double result;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;

  result = 0.0;
  if (a3)
  {
    objc_msgSend(a4, "preferredContentSizeCategory", 0.0);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    result = 0.9;
    if (IsAccessibilityCategory)
      return 0.0;
  }
  return result;
}

- (BOOL)defaultLabelAllowsTighteningForTruncationForSidebar:(BOOL)a3 traitCollection:(id)a4
{
  NSString *v4;
  _BOOL4 v5;

  if (a3)
  {
    objc_msgSend(a4, "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = !UIContentSizeCategoryIsAccessibilityCategory(v4);

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (double)defaultImageToTextPaddingForSidebar:(BOOL)a3
{
  double result;

  if (a3)
    return 10.0;
  -[UITableConstants_IOS defaultCellContentLeadingPaddingForSidebar:](self, "defaultCellContentLeadingPaddingForSidebar:", 0);
  return result;
}

- (double)defaultTextToSubtitlePaddingForCellStyle:(int64_t)a3
{
  double result;

  result = 3.0;
  if (a3 == 3)
    return 0.0;
  return result;
}

- (id)defaultTextLabelFontForCellStyle:(int64_t)a3
{
  const UIFontTextStyle *v5;
  void *v6;

  if (dyld_program_sdk_at_least())
  {
    v5 = &UIFontTextStyleFootnote;
    if (a3 != 2)
      v5 = &UIFontTextStyleBody;
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITableConstants_IOS defaultTextLabelFontSizeForCellStyle:](self, "defaultTextLabelFontSizeForCellStyle:", a3);
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)defaultDetailTextFontForCellStyle:(int64_t)a3
{
  void *v5;
  const UIFontTextStyle *v6;
  void *v7;

  if (dyld_program_sdk_at_least())
  {
    switch(a3)
    {
      case 3:
        v5 = off_1E167A828;
        v6 = &UIFontTextStyleCaption1;
        goto LABEL_11;
      case 2:
        v5 = off_1E167A828;
        v6 = &UIFontTextStyleFootnote;
        goto LABEL_11;
      case 1:
        v5 = off_1E167A828;
        v6 = &UIFontTextStyleBody;
LABEL_11:
        objc_msgSend(v5, "preferredFontForTextStyle:", *v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        return v7;
    }
    goto LABEL_8;
  }
  if ((unint64_t)(a3 - 1) > 2)
  {
LABEL_8:
    v7 = 0;
    return v7;
  }
  -[UITableConstants_IOS defaultDetailTextLabelFontSizeForCellStyle:](self, "defaultDetailTextLabelFontSizeForCellStyle:", a3);
  objc_msgSend(off_1E167A828, "systemFontOfSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)defaultDetailTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 state:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  void *v11;

  v7 = a5;
  if (!_UITableUsesTintColorAsBackgroundColor(v7, a4, 0, 0))
  {
    v9 = v7;
    if (objc_msgSend(v9, "isDisabled"))
    {
      v10 = objc_msgSend(v9, "isSwiped");

      if (a3 == 1)
      {
        if ((v10 & 1) == 0)
        {
          +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
LABEL_8:
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if ((v10 & 1) == 0)
      {
        +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    else
    {

      if (a3 == 1)
        goto LABEL_8;
    }
    +[UIColor labelColor](UIColor, "labelColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  +[UIColor whiteColor](UIColor, "whiteColor");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v11 = (void *)v8;

  return v11;
}

- (id)defaultTextColorForCellStyle:(int64_t)a3 traitCollection:(id)a4 tintColor:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  void *v14;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if ((objc_msgSend(v11, "isDisabled") & 1) != 0)
  {
    v12 = objc_msgSend(v11, "isSwiped");

    if ((v12 & 1) == 0)
    {
      +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {

  }
  if (_UITableUsesTintColorAsBackgroundColor(v11, v9, 0, 0))
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2 && v10)
  {
    v13 = v10;
  }
  else
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  v14 = v13;

  return v14;
}

- (id)defaultAccessoryBackgroundColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7
{
  int v10;
  void *v11;
  void *v13;

  v10 = _UITableUsesTintColorAsBackgroundColor(a6, a7, a4, a5);
  if ((unint64_t)a3 > 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableConstants_IOS.m"), 1602, CFSTR("Invalid _UICellAccessorySystemType value: %ld"), a3);

  }
  else if (a3 == 5 && v10)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  v11 = 0;
  return v11;
}

- (id)defaultAccessoryTintColorForAccessorySystemType:(int64_t)a3 header:(BOOL)a4 sidebarStyle:(int64_t)a5 cellConfigurationState:(id)a6 traitCollection:(id)a7 inheritedTintColor:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v23[6];
  unint64_t v24;
  id v25[18];

  v11 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  memset(v25, 0, 136);
  _UITableConstantsGetBackgroundProperties(self, v14, v15, v11, a5, (uint64_t)v25);
  __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)v23, (uint64_t)v25);
  v17 = 0;
  if (v24 <= 0xC && ((1 << v24) & 0x1081) != 0)
    v17 = ((unint64_t)v23[0] & 0xFFFFFFFFFFFFFFFDLL) == 1;
  __destructor_8_s8_s16_s24_s80(v23);
  v18 = 0;
  switch(a3)
  {
    case 0:
    case 4:
      if (!v17)
        goto LABEL_10;
      goto LABEL_21;
    case 1:
    case 6:
    case 9:
      if (!v17)
        goto LABEL_10;
      +[UIColor whiteColor](UIColor, "whiteColor");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 2:
    case 3:
      break;
    case 5:
      if (v17)
        v21 = v16;
      else
        v21 = 0;
      v19 = v21;
      goto LABEL_24;
    case 7:
      if (v17)
        goto LABEL_21;
      +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 8:
      if (v17)
        -[UITableConstants_IOS defaultSidebarPlainMultiSelectSeparatorColor](self, "defaultSidebarPlainMultiSelectSeparatorColor");
      else
        +[UIColor separatorColor](UIColor, "separatorColor");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 10:
      if (v17)
      {
LABEL_21:
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_24:
      v18 = v19;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", 0, self, CFSTR("UITableConstants_IOS.m"), 1572, CFSTR("Invalid _UICellAccessorySystemType value: %ld"), a3);

LABEL_10:
      v18 = 0;
      break;
  }
  __destructor_8_s8_s16_s24_s80(v25);

  return v18;
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
    -[UITableConstants_IOS defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", objc_msgSend(a3, "_cellStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(a4, "_tableStyle");
  v10 = objc_msgSend(a3, "_cellStyle");
  objc_msgSend(a3, "_rawLayoutMargins");
  -[UITableConstants_IOS defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:](self, "defaultCellLayoutMarginsForTableStyle:cellStyle:textLabelFont:rawLayoutMargins:", v9, v10, v8);
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

- (double)defaultCellContentLeadingPaddingForSidebar:(BOOL)a3
{
  double result;

  result = 16.0;
  if (a3)
    return 8.0;
  return result;
}

- (UIEdgeInsets)defaultCellLayoutMarginsForTableStyle:(int64_t)a3 cellStyle:(int64_t)a4 textLabelFont:(id)a5 rawLayoutMargins:(UIEdgeInsets)a6
{
  CGFloat right;
  CGFloat left;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  right = a6.right;
  left = a6.left;
  v9 = a5;
  if (a4 != 3 || (v10 = 4.0, (dyld_program_sdk_at_least() & 1) == 0))
  {
    objc_msgSend(v9, "lineHeight");
    v10 = ceil(v11 * 0.5);
  }

  v12 = v10;
  v13 = left;
  v14 = v10;
  v15 = right;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (NSDirectionalEdgeInsets)defaultInsetGroupedHeaderLayoutMarginsForExtraProminentStyle:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  v3 = 8.0;
  if (a3)
    v3 = 9.0;
  v4 = 10.0;
  if (!a3)
    v4 = 11.0;
  v5 = 3.0;
  v6 = 3.0;
  result.trailing = v6;
  result.bottom = v4;
  result.leading = v5;
  result.top = v3;
  return result;
}

- (id)defaultHeaderTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  void *v5;

  if (dyld_program_sdk_at_least())
  {
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      +[UIColor _groupTableHeaderFooterTextColor](UIColor, "_groupTableHeaderFooterTextColor");
    else
      +[UIColor _plainTableHeaderFooterTextColor](UIColor, "_plainTableHeaderFooterTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)shouldUppercaseHeaderFooterTextForTableStyle:(int64_t)a3 isHeader:(BOOL)a4
{
  BOOL v5;

  v5 = a3 == 16 || (unint64_t)(a3 - 1) < 2;
  return a4 && v5;
}

- (UIEdgeInsets)defaultHeaderFooterLayoutMarginsForTableViewStyle:(int64_t)a3 isHeader:(BOOL)a4 isFirstSection:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  if (a3)
  {
    v5 = a5;
    v6 = a4;
    v7 = dyld_program_sdk_at_least();
    v8 = 8.0;
    v9 = 32.0;
    if (!v5)
      v9 = 17.0;
    v10 = 12.0;
    if (v6)
      v10 = 6.0;
    else
      v9 = 6.0;
    if (v7)
      v8 = v9;
    else
      v10 = 8.0;
  }
  else
  {
    v10 = 4.0;
    v8 = 4.0;
  }
  v11 = 8.0;
  v12 = 8.0;
  result.right = v12;
  result.bottom = v10;
  result.left = v11;
  result.top = v8;
  return result;
}

- (id)defaultPlainHeaderFooterFont
{
  void *v2;
  const UIFontTextStyle *v3;
  int v4;
  void *v5;

  if (dyld_program_sdk_at_least())
  {
    v2 = off_1E167A828;
    v3 = (const UIFontTextStyle *)UIFontTextStyleEmphasizedSubheadline;
  }
  else
  {
    v4 = dyld_program_sdk_at_least();
    v2 = off_1E167A828;
    if (!v4)
    {
      objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 14.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v3 = &UIFontTextStyleHeadline;
  }
  objc_msgSend(v2, "preferredFontForTextStyle:", *v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (double)defaultEditAndUpdateAnimationDuration
{
  return 0.3;
}

- (double)defaultDisclosureLayoutWidthForView:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[UITableConstants_IOS defaultOutlineDisclosureImageForView:](self, "defaultOutlineDisclosureImageForView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "size");
  if (v5 < v6)
    v5 = v6;

  return v5;
}

- (id)defaultOutlineDisclosureImageForView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (_AXSButtonShapesEnabled() || _AXSDifferentiateWithoutColorEnabled())
  {
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableConstants_IOS _defaultCircleDisclosureImageForTraitCollection:](self, "_defaultCircleDisclosureImageForTraitCollection:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableConstants_IOS _defaultDisclosureImageForTraitCollection:](self, "_defaultDisclosureImageForTraitCollection:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (double)defaultIndentationWidthForSidebarStyle:(BOOL)a3
{
  double result;

  result = 10.0;
  if (a3)
    return 20.0;
  return result;
}

- (id)defaultBackgroundEffectsForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (int64_t)defaultSeparatorStyleForTableViewStyle:(int64_t)a3
{
  return 1;
}

- (id)defaultSeparatorColorForTableViewStyle:(int64_t)a3
{
  if ((dyld_program_sdk_at_least() & 1) != 0)
    +[UIColor separatorColor](UIColor, "separatorColor");
  else
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.783921569, 0.780392157, 0.8, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultSeparatorVisualEffectForTableViewStyle:(int64_t)a3
{
  return 0;
}

- (double)defaultPaddingBetweenRows
{
  return 0.0;
}

- (id)defaultBackgroundColorForTableViewStyle:(int64_t)a3
{
  if (a3)
    +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
  else
    +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)defaultTrailingCellMarginWidthForTableView:(id)a3
{
  double result;

  -[UITableConstants_IOS _defaultMarginWidthForTableView:canUseLayoutMargins:](self, "_defaultMarginWidthForTableView:canUseLayoutMargins:", a3, 0);
  return result;
}

- (double)defaultLeadingCellMarginWidthForTableView:(id)a3
{
  double result;

  -[UITableConstants_IOS _defaultMarginWidthForTableView:canUseLayoutMargins:](self, "_defaultMarginWidthForTableView:canUseLayoutMargins:", a3, objc_msgSend(a3, "_sectionContentInsetFollowsLayoutMargins") ^ 1);
  return result;
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

  objc_msgSend(v9, "_bodyLeading");
  v11 = v10 + v10;

  return v11;
}

- (double)defaultImageViewSymbolImageLayoutHeightForTraitCollection:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleBody"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_bodyLeading");
  v5 = v4;

  return v5;
}

- (double)defaultMarginWidthForTableView:(id)a3
{
  double result;

  -[UITableConstants_IOS _defaultMarginWidthForTableView:canUseLayoutMargins:](self, "_defaultMarginWidthForTableView:canUseLayoutMargins:", a3, 1);
  return result;
}

- (_UITableConstantsBackgroundProperties)defaultHeaderFooterBackgroundPropertiesForTableViewStyle:(SEL)a3 cellConfigurationState:(int64_t)a4 traitCollection:(id)a5 floating:(id)a6
{
  _BOOL4 v7;
  id v12;
  double v13;
  void *var1;
  int v15;
  _UITableConstantsBackgroundProperties *result;
  void *v17;
  id var2;
  void *v19;
  id var3;
  void *v21;
  id v22;

  v7 = a7;
  v22 = a5;
  v12 = a6;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  -[UITableConstants_IOS defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 1, v12, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v13;
  if (a4)
    goto LABEL_2;
  if (-[UITableConstants_IOS useChromelessSectionHeadersAndFootersForTableStyle:](self, "useChromelessSectionHeadersAndFootersForTableStyle:", 0))
  {
    if (v7)
    {
      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      var2 = retstr->var2;
      retstr->var2 = v17;

      objc_opt_self();
      var1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForTrait:", var1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      var3 = retstr->var3;
      retstr->var3 = v19;

      goto LABEL_3;
    }
LABEL_2:
    var1 = retstr->var1;
    retstr->var1 = 0;
    goto LABEL_3;
  }
  if (!dyld_program_sdk_at_least())
    goto LABEL_2;
  if (v7)
    +[UIColor tablePlainHeaderFooterFloatingBackgroundColor](UIColor, "tablePlainHeaderFooterFloatingBackgroundColor");
  else
    +[UIColor tablePlainHeaderFooterBackgroundColor](UIColor, "tablePlainHeaderFooterBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = retstr->var1;
  retstr->var1 = v21;
LABEL_3:

  v15 = objc_msgSend(v22, "isFocused") ^ 1;
  if (!a4)
    LOBYTE(v15) = 1;
  if ((v15 & 1) == 0)
  {
    retstr->var0 = 1;
    retstr->var6 = 28;
  }

  return result;
}

- (id)defaultFooterTextColorForTableViewStyle:(int64_t)a3 focused:(BOOL)a4
{
  void *v5;

  if (dyld_program_sdk_at_least())
  {
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      +[UIColor _groupTableHeaderFooterTextColor](UIColor, "_groupTableHeaderFooterTextColor");
    else
      +[UIColor _plainTableHeaderFooterTextColor](UIColor, "_plainTableHeaderFooterTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)defaultFooterFontForTableViewStyle:(int64_t)a3
{
  void *v3;

  if (a3)
  {
    if (dyld_program_sdk_at_least())
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleShortFootnote"));
    else
      objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITableConstants_IOS defaultPlainHeaderFooterFont](self, "defaultPlainHeaderFooterFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)defaultMultiSelectNotSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 accessoryBaseColor:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a5;
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_IOS _accessoryTintColorForAccessoryBaseColor:](self, "_accessoryTintColorForAccessoryBaseColor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarHeaderBackgroundPropertiesWithState:(SEL)a3 traitCollection:(id)a4
{
  id v8;
  double v9;
  _UITableConstantsBackgroundProperties *result;
  id v11;

  v11 = a4;
  v8 = a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var13.leading = 0u;
  retstr->var13.trailing = 0.0;
  -[UITableConstants_IOS defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", 1, 1, 1, v8, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v9;
  if (objc_msgSend(v11, "isFocused"))
  {
    retstr->var0 = 1;
    retstr->var6 = 28;
  }

  return result;
}

- (id)defaultSidebarPlainMultiSelectSeparatorColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
}

+ (id)sharedConstants
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITableConstants_IOS.m"), 72, CFSTR("attempt to instantiate an instance of UITableConstants_IOS - use UITableConstants_Phone or _Pad instead"));

  return 0;
}

- (_UITableConstantsBackgroundProperties)defaultCellBackgroundPropertiesForTableViewStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  id v10;
  double v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _BOOL4 v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  id var1;
  void *v23;
  id var2;
  id v25;
  void *v26;
  id v27;
  _UITableConstantsBackgroundProperties *result;
  id v29;

  v29 = a5;
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
  -[UITableConstants_IOS defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", a4, 0, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  v12 = objc_msgSend(v29, "cellDropState");
  v13 = v10;
  v14 = v13;
  if (v13)
  {
    _UIRecordTraitUsage((unint64_t)v13, 0x19uLL);
    v15 = v14[25];
  }
  else
  {
    v15 = 0;
  }
  if ((unint64_t)(objc_msgSend(v14, "_focusSystemState") - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (v15 == -1)
      objc_msgSend(v14, "_splitViewControllerContext");
    dyld_program_sdk_at_least();
    v16 = 0;
  }
  else
  {
    v16 = v15 == 1;
  }

  v17 = objc_msgSend(v29, "isHighlighted");
  if (v12 == 2)
    v18 = v17;
  else
    v18 = 0;
  if (v18 == 1)
  {
    +[UIColor systemGray2Color](UIColor, "systemGray2Color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
    var1 = retstr->var1;
    retstr->var1 = v19;

    goto LABEL_34;
  }
  if (objc_msgSend(v29, "isFocused") && (objc_msgSend(v29, "isSelected") & v16 & 1) == 0)
  {
    retstr->var0 = 1;
    retstr->var6 = 28;
    goto LABEL_34;
  }
  if ((objc_msgSend(v29, "isHighlighted") & 1) == 0)
  {
    v20 = objc_msgSend(v29, "isSelected");
    v21 = v12 == 2 ? 1 : v20;
    if (v21 != 1)
    {
      if (a4)
        +[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor");
      else
        +[UIColor tableCellPlainBackgroundColor](UIColor, "tableCellPlainBackgroundColor");
      goto LABEL_28;
    }
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.847058824, 0.847058824, 0.847058824, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  if (!v16)
  {
    if (a4)
      +[UIColor tableCellGroupedSelectedBackgroundColor](UIColor, "tableCellGroupedSelectedBackgroundColor");
    else
      +[UIColor tableCellPlainSelectedBackgroundColor](UIColor, "tableCellPlainSelectedBackgroundColor");
LABEL_28:
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  retstr->var0 = 1;
LABEL_34:
  if (objc_msgSend(v29, "isReordering"))
  {
    +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 4.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    var2 = retstr->var2;
    retstr->var2 = v23;

    retstr->var4 = 1;
    v25 = retstr->var1;
    -[UITableConstants_IOS defaultAlphaForReorderingCell](self, "defaultAlphaForReorderingCell");
    objc_msgSend(v25, "colorWithAlphaComponent:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = retstr->var1;
    retstr->var1 = v26;

    if (-[UITableConstants_IOS reorderingCellWantsShadows](self, "reorderingCellWantsShadows"))
      retstr->var5 = 2;
  }

  return result;
}

- (_UITableConstantsBackgroundProperties)defaultSidebarCellBackgroundPropertiesForStyle:(SEL)a3 state:(int64_t)a4 traitCollection:(id)a5
{
  id v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _BOOL4 v18;
  int v19;
  char v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  id v25;
  char v26;
  void *v27;
  id var1;
  int64_t v29;
  int v30;
  int v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id var2;
  id v39;
  char v40;
  _UITableConstantsBackgroundProperties *result;
  id v42;

  v42 = a5;
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
  -[UITableConstants_IOS defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:](self, "defaultCellCornerRadiusForTableViewStyle:isSidebarStyle:isHeaderFooter:traitCollection:", 1, 1, 0, v10, __copy_constructor_8_8_t0w8_s8_s16_s24_t32w41_s80_t88w48((uint64_t)retstr, (uint64_t)&_UITableConstantsBackgroundPropertiesDefault).n128_f64[0]);
  retstr->var12 = v11;
  v12 = objc_msgSend(v42, "cellDropState");
  v13 = objc_msgSend(v42, "cellDropState");
  v14 = _UITableConstantsUseUIPSidebarMetrics();
  v15 = v10;
  v16 = v15;
  if (v15)
  {
    _UIRecordTraitUsage((unint64_t)v15, 0x19uLL);
    v17 = v16[25];
  }
  else
  {
    v17 = 0;
  }
  if ((unint64_t)(objc_msgSend(v16, "_focusSystemState") - 1) > 1
    || _AXSFullKeyboardAccessEnabled())
  {
    if (v17 == -1)
      v18 = objc_msgSend(v16, "_splitViewControllerContext") != 2;
    else
      v18 = v17 == 1;
    if (!dyld_program_sdk_at_least())
      v18 = a4 != 2;
  }
  else
  {
    v18 = v17 == 1;
  }

  if (!objc_msgSend(v42, "isSelected"))
  {
LABEL_14:
    v19 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v42, "isEditing"))
  {
    if (dyld_program_sdk_at_least())
    {
      v19 = objc_msgSend(v42, "_usesAnyPlainListStyle");
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v19 = 1;
LABEL_16:
  if (v12 == 2)
  {
    -[UITableConstants_IOS _applySelectedOrDropTargetAppearanceToSidebarCellBackgroundProperties:selected:sidebarStyle:selectionIsKey:state:traitCollection:]((uint64_t)self, &retstr->var0, v19, a4, v18, v42, v16);
    if (objc_msgSend(v42, "isHighlighted"))
      retstr->var6 = 7;
    v20 = objc_msgSend(v42, "isSelected");
    v21 = v42;
    if ((v20 & 1) == 0)
    {
      *(_OWORD *)&retstr->var13.top = xmmword_1866721B0;
      *(_OWORD *)&retstr->var13.bottom = xmmword_1866721B0;
    }
    goto LABEL_40;
  }
  if (objc_msgSend(v42, "isFocused")
    && (objc_msgSend(v42, "isSelected") & (v18 | v14) & 1) == 0)
  {
    retstr->var0 = 1;
    retstr->var6 = 28;
    v21 = v42;
    goto LABEL_40;
  }
  v21 = v42;
  if (!v19)
    goto LABEL_40;
  v22 = v42;
  if ((objc_msgSend(v22, "isDisabled") & 1) == 0)
  {

LABEL_30:
    if (v13 == 1)
      v26 = v14;
    else
      v26 = 1;
    if ((v26 & 1) != 0)
    {
      -[UITableConstants_IOS _applySelectedOrDropTargetAppearanceToSidebarCellBackgroundProperties:selected:sidebarStyle:selectionIsKey:state:traitCollection:]((uint64_t)self, &retstr->var0, 1, a4, v18, v22, v16);
    }
    else
    {
      +[UIColor systemGrayColor](UIColor, "systemGrayColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      var1 = retstr->var1;
      retstr->var1 = v27;

      v29 = 8;
      if (a4 != 2)
        v29 = 3;
      retstr->var6 = v29;
    }
    goto LABEL_38;
  }
  v23 = objc_msgSend(v22, "isSwiped");

  if ((v23 & 1) != 0)
    goto LABEL_30;
  +[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = retstr->var1;
  retstr->var1 = v24;

LABEL_38:
  v30 = objc_msgSend(v22, "isHighlighted");
  v21 = v42;
  if (v30)
    retstr->var6 = 7;
LABEL_40:
  v31 = objc_msgSend(v21, "isSwiped");
  if (retstr->var1)
    v32 = 0;
  else
    v32 = v31;
  if (v32 == 1 && !retstr->var0 && !retstr->var2)
  {
    +[UIColor _swipedSidebarCellBackgroundColor](UIColor, "_swipedSidebarCellBackgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = retstr->var1;
    retstr->var1 = v33;

  }
  if (objc_msgSend(v42, "isReordering"))
  {
    if (!retstr->var1 && !retstr->var0)
    {
      +[UIColor _sidebarBackgroundColor](UIColor, "_sidebarBackgroundColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = retstr->var1;
      retstr->var1 = v35;

    }
    if (!retstr->var6)
      retstr->var6 = 12;
    retstr->var4 = 1;
    +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 4.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    var2 = retstr->var2;
    retstr->var2 = v37;

    retstr->var5 = 2;
  }
  if (v14)
  {
    v39 = v42;
    if ((objc_msgSend(v39, "isDisabled") & 1) != 0)
    {
      v40 = objc_msgSend(v39, "isSwiped");

      if ((v40 & 1) == 0)
        retstr->var6 = 3;
    }
    else
    {

    }
  }

  return result;
}

- (void)_applySelectedOrDropTargetAppearanceToSidebarCellBackgroundProperties:(int)a3 selected:(uint64_t)a4 sidebarStyle:(int)a5 selectionIsKey:(void *)a6 state:(void *)a7 traitCollection:
{
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  if (a1)
  {
    if (_UITableConstantsUseUIPSidebarMetrics() && a4 != 3)
    {
      if (objc_msgSend(a7, "userInterfaceStyle") == 2)
      {
        +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = 3;
      }
      else
      {
        +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = 2;
      }
      v17 = (void *)a2[1];
      a2[1] = v15;

      *a2 = v16;
      if (a3
        && (objc_msgSend(a6, "isSwiped") & 1) == 0
        && (objc_msgSend(a6, "_inMultiSelectGroup") & 1) == 0
        && (objc_msgSend(a6, "isEditing") & 1) == 0)
      {
        a2[5] = 4;
      }
    }
    else if (a5)
    {
      *a2 = 1;
    }
    else
    {
      +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)a2[1];
      a2[1] = v13;

    }
  }
}

- (id)defaultMultiSelectBackgroundColorForCell:(id)a3 inTableView:(id)a4
{
  if ((dyld_program_sdk_at_least() & 1) != 0)
    +[UIColor systemGray6Color](UIColor, "systemGray6Color");
  else
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.91372549, 0.941176471, 0.980392157, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)imageViewOffsetByLayoutMarginsForCell:(id)a3 inTableView:(id)a4
{
  return 1;
}

- (double)defaultContentEditPaddingForCell:(id)a3 inTableView:(id)a4
{
  int v4;
  double result;

  v4 = dyld_program_sdk_at_least();
  result = 9.0;
  if (v4)
    return 16.0;
  return result;
}

- (double)defaultContentReorderPaddingForCell:(id)a3 inTableView:(id)a4
{
  int v4;
  double result;

  v4 = dyld_program_sdk_at_least();
  result = 12.0;
  if (v4)
    return 16.0;
  return result;
}

- (double)defaultContentAccessoryPadding
{
  int v2;
  double result;

  v2 = dyld_program_sdk_at_least();
  result = 10.0;
  if (v2)
    return 16.0;
  return result;
}

- (UIEdgeInsets)defaultLayoutMarginsForTableView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[UITableConstants_IOS _defaultMarginWidthForTableView:canUseLayoutMargins:](self, "_defaultMarginWidthForTableView:canUseLayoutMargins:", a3, 0);
  v4 = v3;
  v5 = 0.0;
  v6 = 0.0;
  v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (double)defaultPlainHeaderLabelYPositionForTableView:(id)a3 headerBounds:(CGRect)a4 textRect:(CGRect)a5 isHeader:(BOOL)a6
{
  return round((a4.size.height - a5.size.height) * 0.5);
}

- ($4B60890CD43C21BDA0D821D733CDDD8F)contentPropertiesForSidebarElementWithTraitCollection:(SEL)a3 state:(id)a4 isHeader:(id)a5 style:(BOOL)a6
{
  _BOOL8 v8;
  id v12;
  id v13;
  char v14;
  double v15;
  void *v16;
  id var0;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id var1;
  uint64_t v23;
  void *v24;
  id var5;
  _BOOL4 v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id var2;
  void *v40;
  id var3;
  void *v42;
  id var4;
  void *v44;
  _BOOL4 v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  int v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  int v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  char v63;
  $4B60890CD43C21BDA0D821D733CDDD8F *result;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  _OWORD v77[3];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = _UITableConstantsUseUIPSidebarMetrics();
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_QWORD *)&v15 = __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_t48w32((uint64_t)retstr, (uint64_t)&_UITableConstantsContentPropertiesDefault).n128_u64[0];
  if ((v14 & 1) != 0)
  {
    if (v8)
      objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:weight:", CFSTR("UICTFontTextStyleBody"), *(double *)off_1E167DC68);
    else
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    var0 = retstr->var0;
    retstr->var0 = v16;

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    var1 = retstr->var1;
    retstr->var1 = v18;

    v83 = 0;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v78 = 0u;
    memset(v77, 0, sizeof(v77));
    _UITableConstantsGetBackgroundProperties(self, v13, v12, v8, a7, (uint64_t)v77);
    v23 = *(_QWORD *)&v77[0];
    -[UITableConstants_IOS defaultImageSymbolConfigurationForTraitCollection:](self, "defaultImageSymbolConfigurationForTraitCollection:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    var5 = retstr->var5;
    retstr->var5 = v24;

    if (v23 == 1)
    {
      if ((unint64_t)v78 <= 0xC && ((1 << v78) & 0x1081) != 0)
      {
        +[UIColor whiteColor](UIColor, "whiteColor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        var2 = retstr->var2;
        retstr->var2 = v38;

        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        var3 = retstr->var3;
        retstr->var3 = v40;

        +[UIColor whiteColor](UIColor, "whiteColor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        var4 = retstr->var4;
        retstr->var4 = v42;

        goto LABEL_40;
      }
      goto LABEL_18;
    }
    if (v23 != 3)
    {
      if (v23 == 2)
      {
        v26 = (unint64_t)(objc_msgSend(v12, "_focusSystemState") - 1) <= 1
           && _AXSFullKeyboardAccessEnabled() == 0;
        v50 = objc_msgSend(v13, "isEditing");
        if ((v50 | v26) == 1 && !objc_msgSend(v13, "isFocused"))
        {
          +[UIColor labelColor](UIColor, "labelColor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = retstr->var2;
          retstr->var2 = v65;

          retstr->var7 = 12;
          +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = retstr->var3;
          retstr->var3 = v67;

          if (!v50)
          {
            +[UIColor labelColor](UIColor, "labelColor");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = retstr->var4;
            retstr->var4 = v69;

            retstr->var9 = 12;
LABEL_31:
            if ((objc_msgSend(v13, "isEditing") & 1) == 0)
              goto LABEL_39;
            goto LABEL_40;
          }
        }
        else
        {
          +[UIColor tintColor](UIColor, "tintColor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = retstr->var2;
          retstr->var2 = v51;

          +[UIColor tintColor](UIColor, "tintColor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = retstr->var3;
          retstr->var3 = v53;

        }
        v55 = retstr->var4;
        retstr->var4 = 0;

        goto LABEL_31;
      }
LABEL_18:
      if (v8)
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      else
        +[UIColor labelColor](UIColor, "labelColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = retstr->var2;
      retstr->var2 = v44;

      +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = retstr->var3;
      retstr->var3 = v47;

      v49 = retstr->var4;
      retstr->var4 = 0;

      if (v23 != 4 || (objc_msgSend(v13, "isEditing") & 1) != 0)
        goto LABEL_40;
      goto LABEL_39;
    }
    v45 = (unint64_t)(objc_msgSend(v12, "_focusSystemState") - 1) <= 1 && _AXSFullKeyboardAccessEnabled() == 0;
    v56 = objc_msgSend(v13, "isEditing");
    if ((v56 | v45) == 1 && !objc_msgSend(v13, "isFocused"))
    {
      +[UIColor labelColor](UIColor, "labelColor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = retstr->var2;
      retstr->var2 = v71;

      retstr->var7 = 12;
      +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = retstr->var3;
      retstr->var3 = v73;

      if (!v56)
      {
        +[UIColor labelColor](UIColor, "labelColor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = retstr->var4;
        retstr->var4 = v75;

        retstr->var9 = 12;
LABEL_38:
        if ((objc_msgSend(v13, "isEditing") & 1) == 0)
LABEL_39:
          _UITableConstantsApplyBoldSidebarStylingToContentProperties((uint64_t)retstr, v12);
LABEL_40:
        v62 = v13;
        if ((objc_msgSend(v62, "isDisabled") & 1) != 0)
        {
          v63 = objc_msgSend(v62, "isSwiped");

          if ((v63 & 1) == 0)
            retstr->var6 = 0.5;
        }
        else
        {

        }
        if (objc_msgSend(v62, "isHighlighted"))
        {
          *(int64x2_t *)&retstr->var7 = vdupq_n_s64(7uLL);
          retstr->var9 = 7;
        }
        __destructor_8_s8_s16_s24_s80((id *)v77);
        goto LABEL_47;
      }
    }
    else
    {
      +[UIColor labelColor](UIColor, "labelColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = retstr->var2;
      retstr->var2 = v57;

      +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = retstr->var3;
      retstr->var3 = v59;

    }
    v61 = retstr->var4;
    retstr->var4 = 0;

    goto LABEL_38;
  }
  if (v8)
  {
    -[UITableConstants_IOS defaultSidebarHeaderFont](self, "defaultSidebarHeaderFont", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = retstr->var0;
    retstr->var0 = v19;

    -[UITableConstants_IOS defaultDetailTextFontForCellStyle:](self, "defaultDetailTextFontForCellStyle:", 0);
  }
  else
  {
    -[UITableConstants_IOS defaultTextLabelFontForCellStyle:](self, "defaultTextLabelFontForCellStyle:", 0, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = retstr->var0;
    retstr->var0 = v27;

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = retstr->var1;
  retstr->var1 = v21;

  -[UITableConstants_IOS defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:](self, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v12, v13, 0, 0, a7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = retstr->var2;
  retstr->var2 = v30;

  -[UITableConstants_IOS defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:](self, "defaultSidebarTextColorForTraitCollection:state:isHeader:isSecondaryText:style:", v12, v13, v8, 1, a7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = retstr->var3;
  retstr->var3 = v32;

  -[UITableConstants_IOS defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:](self, "defaultSidebarImageTintColorForTraitCollection:state:isHeader:style:", v12, v13, v8, a7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = retstr->var4;
  retstr->var4 = v34;

  -[UITableConstants_IOS defaultImageSymbolConfigurationForTraitCollection:](self, "defaultImageSymbolConfigurationForTraitCollection:", v12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = retstr->var5;
  retstr->var5 = v36;

  if (objc_msgSend(v13, "isHighlighted"))
  {
    *(int64x2_t *)&retstr->var7 = vdupq_n_s64(7uLL);
    retstr->var9 = 7;
  }
LABEL_47:

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
        goto LABEL_14;
      if (v16 == (id)2)
      {
        +[UIColor tintColor](UIColor, "tintColor");
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v15 = (void *)v17;
        __destructor_8_s8_s16_s24_s80(v21);
        goto LABEL_22;
      }
    }
    else
    {
      __destructor_8_s8_s16_s24_s80(v19);
    }
    if (a7 == 2 || (objc_msgSend(v13, "isEditing") & 1) != 0 || objc_msgSend(v13, "cellDropState") != 2)
    {
      if (v8)
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      else
        +[UIColor labelColor](UIColor, "labelColor");
      goto LABEL_16;
    }
LABEL_14:
    if (v8)
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
LABEL_16:
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

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
        goto LABEL_8;
    }
    else
    {
      __destructor_8_s8_s16_s24_s80(v16);
    }
    if (a6 == 2 || (objc_msgSend(v11, "isEditing") & 1) != 0 || objc_msgSend(v11, "cellDropState") != 2)
    {
      v13 = 0;
      goto LABEL_14;
    }
LABEL_8:
    +[UIColor whiteColor](UIColor, "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    __destructor_8_s8_s16_s24_s80(v18);
    goto LABEL_15;
  }
  +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v13;
}

- (id)defaultSidebarHeaderFont
{
  int v2;
  const UIFontTextStyle *v3;

  v2 = _UITableConstantsUseUIPSidebarMetrics();
  v3 = &UIFontTextStyleBody;
  if (!v2)
    v3 = (const UIFontTextStyle *)UIFontTextStyleEmphasizedTitle3;
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

- (double)defaultDetailTextLabelFontSizeForCellStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
    return 17.0;
  if (a3 == 3)
    return 12.0;
  -[UITableConstants_IOS defaultTextLabelFontSizeForCellStyle:](self, "defaultTextLabelFontSizeForCellStyle:");
  return result;
}

- (id)_defaultCircleDisclosureImageForTraitCollection:(id)a3
{
  _QWORD *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  NSComparisonResult v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = (void *)qword_1ECD80900;
  if (!qword_1ECD80900
    || v5
    && (!qword_1ECD80908 || v5[13] != *(_QWORD *)(qword_1ECD80908 + 104) || v5[15] != *(_QWORD *)(qword_1ECD80908 + 120)))
  {
    objc_msgSend(v5, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v7))
    {
      if (UIContentSizeCategoryCompareToCategory(v7, CFSTR("UICTContentSizeCategoryAccessibilityXL")) == NSOrderedAscending)
      {
        v10 = UIContentSizeCategoryCompareToCategory(v7, CFSTR("UICTContentSizeCategoryAccessibilityM"));
        v8 = 2;
        if (v10 == NSOrderedAscending)
          v8 = 3;
      }
      else
      {
        v8 = 1;
      }
      if (v8 >= 2)
        v9 = 2;
      else
        v9 = v8;
    }
    else
    {
      v9 = 2;
    }

    -[UITableConstants_IOS _symbolImageNamed:withTextStyle:scale:](self, "_symbolImageNamed:withTextStyle:scale:", CFSTR("chevron.forward.circle.fill"), CFSTR("UICTFontTextStyleEmphasizedBody"), v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)qword_1ECD80900;
    qword_1ECD80900 = v11;

    objc_storeStrong((id *)&qword_1ECD80908, a3);
    v6 = (void *)qword_1ECD80900;
  }
  v13 = v6;

  return v13;
}

- (id)defaultPopUpMenuIndicatorImageForTraitCollection:(id)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = (void *)qword_1ECD80910;
  if (!qword_1ECD80910
    || v5
    && (!qword_1ECD80918 || v5[13] != *(_QWORD *)(qword_1ECD80918 + 104) || v5[15] != *(_QWORD *)(qword_1ECD80918 + 120)))
  {
    -[UITableConstants_IOS _symbolImageNamed:withTextStyle:scale:](self, "_symbolImageNamed:withTextStyle:scale:", CFSTR("chevron.up.chevron.down"), CFSTR("UICTFontTextStyleEmphasizedBody"), 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)qword_1ECD80910;
    qword_1ECD80910 = v7;

    objc_storeStrong((id *)&qword_1ECD80918, a3);
    v6 = (void *)qword_1ECD80910;
  }
  v9 = v6;

  return v9;
}

- (id)defaultCheckmarkImageForCell:(id)a3
{
  void *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSComparisonResult v8;
  void *v9;

  objc_msgSend(a3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
  {
    if (UIContentSizeCategoryCompareToCategory(v5, CFSTR("UICTContentSizeCategoryAccessibilityXL")) == NSOrderedAscending)
    {
      v8 = UIContentSizeCategoryCompareToCategory(v5, CFSTR("UICTContentSizeCategoryAccessibilityM"));
      v6 = 2;
      if (v8 == NSOrderedAscending)
        v6 = 3;
    }
    else
    {
      v6 = 1;
    }
    if (v6 >= 2)
      v7 = 2;
    else
      v7 = v6;
  }
  else
  {
    v7 = 2;
  }

  -[UITableConstants_IOS _symbolImageNamed:withTextStyle:scale:](self, "_symbolImageNamed:withTextStyle:scale:", CFSTR("checkmark"), CFSTR("UICTFontTextStyleEmphasizedBody"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

  -[UITableConstants_IOS defaultDeleteImageForCell:](self, "defaultDeleteImageForCell:", a3, a4);
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
  void *v4;
  void *v5;

  objc_msgSend(a3, "_editingControlTintColorForStyle:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_IOS defaultDeleteImageWithTintColor:backgroundColor:](self, "defaultDeleteImageWithTintColor:backgroundColor:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultDeleteImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = v5;
    v8 = v6;
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = v7;
      v7 = (id)v11;
    }
    v15[0] = v7;
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("minus.circle.fill"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)defaultInsertImageForCell:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "_editingControlTintColorForStyle:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_IOS defaultInsertImageWithTintColor:backgroundColor:](self, "defaultInsertImageWithTintColor:backgroundColor:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultInsertImageWithTintColor:(id)a3 backgroundColor:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = v5;
    v8 = v6;
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = v7;
      v7 = (id)v11;
    }
    v15[0] = v7;
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)defaultMultiSelectSelectedImageForCellStyle:(int64_t)a3 traitCollection:(id)a4 checkmarkColor:(id)a5 backgroundColor:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v20 = v9;
      v21 = v10;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v20;
      v14 = 2;
    }
    else
    {
      v19 = v9;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = &v19;
      v14 = 1;
    }
    objc_msgSend(v12, "arrayWithObjects:count:", v13, v14, v19, v20, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIImage checkmarkImage](UIImage, "checkmarkImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)defaultDetailAccessoryImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("info.circle"));
}

- (CGSize)defaultReorderControlSizeForCell:(id)a3 withAccessoryBaseColor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v6 = a4;
  objc_msgSend(a3, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableConstants_IOS defaultReorderControlImageForTraitCollection:withAccessoryBaseColor:isTracking:](self, "defaultReorderControlImageForTraitCollection:withAccessoryBaseColor:isTracking:", v7, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  v13 = dyld_program_sdk_at_least();
  v14 = 30.0;
  if (v13)
    v14 = 0.0;
  v15 = v10 + v14;
  v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (id)defaultReorderControlImageForTraitCollection:(id)a3 withAccessoryBaseColor:(id)a4 isTracking:(BOOL)a5
{
  _QWORD *v8;
  id v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (void *)qword_1ECD80920;
  if (!qword_1ECD80920
    || v8
    && (!qword_1ECD80928 || v8[13] != *(_QWORD *)(qword_1ECD80928 + 104) || v8[15] != *(_QWORD *)(qword_1ECD80928 + 120)))
  {
    objc_msgSend(v8, "preferredContentSizeCategory");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v11))
    {
      if (UIContentSizeCategoryCompareToCategory(v11, CFSTR("UICTContentSizeCategoryAccessibilityXL")) == NSOrderedAscending)
      {
        if (UIContentSizeCategoryCompareToCategory(v11, CFSTR("UICTContentSizeCategoryAccessibilityM")) == NSOrderedAscending)
          v12 = 3;
        else
          v12 = 2;
      }
      else
      {
        v12 = 1;
      }
    }
    else
    {
      v12 = 3;
    }

    -[UITableConstants_IOS _symbolImageNamed:withTextStyle:scale:](self, "_symbolImageNamed:withTextStyle:scale:", CFSTR("line.horizontal.3"), CFSTR("UICTFontTextStyleBody"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)qword_1ECD80920;
    qword_1ECD80920 = v13;

    objc_storeStrong((id *)&qword_1ECD80928, a3);
    v10 = (void *)qword_1ECD80920;
  }
  v15 = v10;
  -[UITableConstants_IOS _accessoryTintColorForAccessoryBaseColor:](self, "_accessoryTintColorForAccessoryBaseColor:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithTintColor:renderingMode:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
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

- (double)defaultAlphaForDraggingCell:(id)a3 inTableView:(id)a4
{
  return 0.5;
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

- (id)defaultImageTintColorForState:(id)a3 traitCollection:(id)a4
{
  id v5;
  int v6;
  id v7;
  char v8;
  void *v9;

  v5 = a3;
  v6 = _UITableUsesTintColorAsBackgroundColor(v5, a4, 0, 0);
  v7 = v5;
  if ((objc_msgSend(v7, "isDisabled") & 1) != 0)
  {
    v8 = objc_msgSend(v7, "isSwiped");

    if ((v8 & 1) == 0)
    {
      +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
    }
  }
  else
  {

  }
  if (v6)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)shouldAnimatePropertyInContentViewWithKey:(id)a3
{
  return 0;
}

@end
