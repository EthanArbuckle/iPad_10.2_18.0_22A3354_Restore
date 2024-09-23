@implementation SHSheetContentLayoutSpec

- (SHSheetContentLayoutSpec)initWithTraitCollection:(id)a3 tintColor:(id)a4 deviceClass:(unint64_t)a5
{
  id v9;
  id v10;
  SHSheetContentLayoutSpec *v11;
  SHSheetContentLayoutSpec *v12;
  void *v13;
  double v14;
  uint64_t v15;
  UIColor *footerBackgroundColor;
  uint64_t v17;
  int64x2_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SHSheetContentLayoutSpec;
  v11 = -[SHSheetContentLayoutSpec init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_traitCollection, a3);
    v12->_deviceClass = a5;
    objc_storeStrong((id *)&v12->_tintColor, a4);
    v12->_estimatedHeaderHeight = 10.0;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v12->_estimatedFooterHeight = 1.0 / v14;

    v12->_customViewVerticalInset = 12.0;
    *(_OWORD *)&v12->_peopleIconWidth = xmmword_19E4D36E0;
    *(_OWORD *)&v12->_actionInterGroupInset = xmmword_19E4D36F0;
    v12->_heroActionItemSpacing = 7.0;
    v12->_horizontalCellWidth = 78.0;
    *(_OWORD *)&v12->_horizontalSectionBottomInset = xmmword_19E4D3700;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v15 = objc_claimAutoreleasedReturnValue();
    footerBackgroundColor = v12->_footerBackgroundColor;
    v12->_footerBackgroundColor = (UIColor *)v15;

    switch(a5)
    {
      case 0uLL:
        *(_OWORD *)&v12->_customViewSectionHeight = xmmword_19E4D3790;
        v17 = 0x405D800000000000;
        goto LABEL_20;
      case 1uLL:
        *(_OWORD *)&v12->_customViewSectionHeight = xmmword_19E4D3780;
        goto LABEL_19;
      case 2uLL:
        v12->_customViewSectionHeight = 275.0;
        *(_OWORD *)&v12->_peopleSectionHeight = xmmword_19E4D3770;
        v12->_sharingAppIconWidth = 64.0;
        break;
      case 3uLL:
        *(_OWORD *)&v12->_customViewSectionHeight = xmmword_19E4D3760;
        break;
      case 4uLL:
        v12->_customViewSectionHeight = 320.0;
        v18 = vdupq_n_s64(0x4050000000000000uLL);
        goto LABEL_11;
      case 5uLL:
        v19 = 0x4074E00000000000;
        goto LABEL_10;
      case 6uLL:
        v19 = 0x4076000000000000;
LABEL_10:
        *(_QWORD *)&v12->_customViewSectionHeight = v19;
        v18 = (int64x2_t)xmmword_19E4D3750;
LABEL_11:
        *(int64x2_t *)&v12->_peopleIconWidth = v18;
        break;
      case 7uLL:
        v20 = 0x406BE00000000000;
        goto LABEL_18;
      case 8uLL:
        v20 = 0x4071800000000000;
LABEL_18:
        *(_QWORD *)&v12->_customViewSectionHeight = v20;
LABEL_19:
        v17 = 0x4060000000000000;
LABEL_20:
        *(_QWORD *)&v12->_peopleSectionHeight = v17;
        break;
      case 9uLL:
        v12->_customViewSectionHeight = 280.0;
        v12->_horizontalCellWidth = 84.0;
        *(int64x2_t *)&v12->_peopleIconWidth = vdupq_n_s64(0x404A000000000000uLL);
        *(_OWORD *)&v12->_horizontalSectionBottomInset = xmmword_19E4D3740;
        goto LABEL_15;
      case 0xAuLL:
        v12->_customViewSectionHeight = 280.0;
        v12->_horizontalCellWidth = 92.0;
        *(int64x2_t *)&v12->_peopleIconWidth = vdupq_n_s64(0x4051000000000000uLL);
        *(_OWORD *)&v12->_horizontalSectionBottomInset = xmmword_19E4D3710;
LABEL_15:
        v12->_estimatedActionFooterHeight = 84.0;
        if (_ShareSheetIsRealityLauncher())
        {
          *(_OWORD *)&v12->_topContentSectionHeaderInsets.top = xmmword_19E4D3720;
          *(_OWORD *)&v12->_topContentSectionHeaderInsets.bottom = xmmword_19E4D3730;
        }
        break;
      default:
        break;
    }
  }

  return v12;
}

- (BOOL)isAccessibilityContentSize
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  -[SHSheetContentLayoutSpec traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (UIColor)editTintColor
{
  void *v3;

  -[SHSheetContentLayoutSpec tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SHSheetContentLayoutSpec tintColor](self, "tintColor");
  else
    SHSheetTintColor();
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (double)horizontalCellWidthForContentWidth:(double)a3 sizeOffset:(double)a4
{
  double v7;
  double v8;
  _BOOL4 v9;
  double result;

  -[SHSheetContentLayoutSpec horizontalCellWidth](self, "horizontalCellWidth");
  v8 = v7;
  v9 = -[SHSheetContentLayoutSpec isAccessibilityContentSize](self, "isAccessibilityContentSize");
  result = -(a4 - a3 * 0.666666667);
  if (!v9)
    return v8;
  return result;
}

- (int64_t)numberOfHorizontalItemsPerGroupForContentWidth:(double)a3
{
  BOOL v5;

  v5 = _ShareSheetPlatformPrefersPopover();
  if (-[SHSheetContentLayoutSpec isAccessibilityContentSize](self, "isAccessibilityContentSize"))
    return 1;
  if (a3 == 540.0 && v5)
    return 6;
  if (a3 <= 320.0)
    return 3;
  if (a3 >= 568.0)
    return 6;
  return 4;
}

- (UIImageSymbolConfiguration)activityImageSymbolConfiguration
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = -[SHSheetContentLayoutSpec isAccessibilityContentSize](self, "isAccessibilityContentSize");
  v3 = *MEMORY[0x1E0DC4A88];
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0DC37F0];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v7, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v8, "pointSize");
    objc_msgSend(v9, "configurationWithPointSize:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIImageSymbolConfiguration *)v10;
}

- (id)actionsLayoutSectionConfigurationWithEnvironment:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3708];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom"))
  {
    if (_ShareSheetPlatformPrefersPopover())
      v6 = 2;
    else
      v6 = 0;
  }
  else
  {
    v6 = 2;
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4098]), "initWithAppearanceStyle:layoutEnvironment:", v6, v4);
  objc_msgSend(v7, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v7, "setEstimatedRowHeight:", 52.0);
  return v7;
}

- (BOOL)shouldUseNarrowLayoutForHeroActionsWithContainerWidth:(double)a3
{
  void *v4;
  NSString *v5;
  NSComparisonResult v6;

  -[SHSheetContentLayoutSpec traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x1E0DC48F8]);

  return a3 <= 320.0 || v6 != NSOrderedAscending;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (NSDirectionalEdgeInsets)topContentSectionHeaderInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_topContentSectionHeaderInsets.top;
  leading = self->_topContentSectionHeaderInsets.leading;
  bottom = self->_topContentSectionHeaderInsets.bottom;
  trailing = self->_topContentSectionHeaderInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (double)customViewSectionHeight
{
  return self->_customViewSectionHeight;
}

- (void)setCustomViewSectionHeight:(double)a3
{
  self->_customViewSectionHeight = a3;
}

- (double)customViewVerticalInset
{
  return self->_customViewVerticalInset;
}

- (void)setCustomViewVerticalInset:(double)a3
{
  self->_customViewVerticalInset = a3;
}

- (double)estimatedHeaderHeight
{
  return self->_estimatedHeaderHeight;
}

- (double)estimatedFooterHeight
{
  return self->_estimatedFooterHeight;
}

- (double)horizontalSectionBottomInset
{
  return self->_horizontalSectionBottomInset;
}

- (double)peopleSectionHeight
{
  return self->_peopleSectionHeight;
}

- (double)peopleIconWidth
{
  return self->_peopleIconWidth;
}

- (double)sharingAppIconWidth
{
  return self->_sharingAppIconWidth;
}

- (double)actionInterGroupInset
{
  return self->_actionInterGroupInset;
}

- (double)estimatedActionFooterHeight
{
  return self->_estimatedActionFooterHeight;
}

- (double)heroActionItemSpacing
{
  return self->_heroActionItemSpacing;
}

- (UIColor)footerBackgroundColor
{
  return self->_footerBackgroundColor;
}

- (double)horizontalCellWidth
{
  return self->_horizontalCellWidth;
}

- (void)setHorizontalCellWidth:(double)a3
{
  self->_horizontalCellWidth = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_footerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
