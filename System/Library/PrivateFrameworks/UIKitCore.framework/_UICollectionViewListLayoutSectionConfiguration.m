@implementation _UICollectionViewListLayoutSectionConfiguration

- (int64_t)appearanceStyle
{
  return self->_appearanceStyle;
}

- (BOOL)stylesFirstItemAsHeader
{
  return self->_stylesFirstItemAsHeader;
}

- (id)_itemSeparatorHandler
{
  return self->_itemSeparatorHandler;
}

- (void)setSectionHeaderHugsContent:(BOOL)a3
{
  self->_sectionHeaderHugsContent = a3;
}

- (void)setWillBeginSwipingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setTrailingSwipeActionsConfigurationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setSeparatorStyle:(int64_t)a3
{
  self->_separatorStyle = a3;
}

- (void)setLeadingSwipeActionsConfigurationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setDidEndSwipingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)set_headerElementKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)set_footerElementKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)set_backgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundColor, a3);
}

- (void)set_apiVersion:(BOOL)a3
{
  self->__apiVersion = a3;
}

- (void)setStylesFirstItemAsHeader:(BOOL)a3
{
  self->_stylesFirstItemAsHeader = a3;
}

- (void)setSectionHeaderHeight:(double)a3
{
  self->_sectionHeaderHeight = a3;
}

- (void)setSectionFooterHeight:(double)a3
{
  self->_sectionFooterHeight = a3;
}

- (void)setHeaderTopPadding:(double)a3
{
  if (a3 < 0.0)
    a3 = 1.79769313e308;
  self->_headerTopPadding = a3;
}

- (void)setCornerRadius:(double)a3
{
  if (a3 < 0.0)
    a3 = 1.79769313e308;
  self->_cornerRadius = a3;
}

- (void)setAppearanceStyle:(int64_t)a3
{
  self->_appearanceStyle = a3;
}

- (void)_setSeparatorConfiguration:(id)a3
{
  _UIListSeparatorConfiguration *v4;
  _UIListSeparatorConfiguration *separatorConfiguration;

  if (a3)
  {
    v4 = (_UIListSeparatorConfiguration *)objc_msgSend(a3, "copy");
  }
  else
  {
    +[_UIListSeparatorConfiguration _configurationForAppearanceStyle:inLayoutEnvironment:](_UIListSeparatorConfiguration, "_configurationForAppearanceStyle:inLayoutEnvironment:", self->_appearanceStyle, self->_layoutEnvironment);
    v4 = (_UIListSeparatorConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  separatorConfiguration = self->_separatorConfiguration;
  self->_separatorConfiguration = v4;

}

- (void)_setItemSeparatorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)new
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAppearanceStyle:layoutEnvironment:", 0, 0);
}

- (_UIListSeparatorConfiguration)_separatorConfiguration
{
  return (_UIListSeparatorConfiguration *)(id)-[_UIListSeparatorConfiguration copy](self->_separatorConfiguration, "copy");
}

- (_UIListSeparatorConfiguration)_separatorConfigurationNoCopy
{
  return self->_separatorConfiguration;
}

- (id)separatorInsetProvider
{
  return self->_separatorInsetProvider;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)_hasHeaderOrFirstItemStyledAsHeader
{
  return self->_sectionHeaderHeight != -1000.0 || self->_stylesFirstItemAsHeader;
}

- (NSDirectionalEdgeInsets)_sectionContentInsetsForVerticallySeparatedSectionsWithDefaultInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing;
  double bottom;
  CGFloat leading;
  double top;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  -[_UICollectionViewListLayoutSectionConfiguration _topContentInsetForGroupedAppearance](self, "_topContentInsetForGroupedAppearance");
  v9 = v8;
  v10 = -[NSCollectionLayoutEnvironment_Private _sectionIndex](self->_layoutEnvironment, "_sectionIndex");
  -[NSCollectionLayoutEnvironment_Private _dataSourceSnapshot](self->_layoutEnvironment, "_dataSourceSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfSections") - 1;

  v13 = 20.0;
  if (v10 != v12)
  {
    -[_UICollectionViewListLayoutSectionConfiguration _defaultSectionFooterHeight](self, "_defaultSectionFooterHeight");
    v13 = v14;
  }
  v15 = top + v9;
  v16 = -[_UICollectionViewListLayoutSectionConfiguration _hasFooter](self, "_hasFooter");
  v17 = 0.0;
  if (!v16)
    v17 = v13;
  v18 = bottom + v17;
  v19 = v15;
  v20 = leading;
  v21 = trailing;
  result.trailing = v21;
  result.bottom = v18;
  result.leading = v20;
  result.top = v19;
  return result;
}

- (BOOL)_hasFooter
{
  return self->_sectionFooterHeight != -1000.0;
}

- (double)_topContentInsetForGroupedAppearance
{
  double v3;
  double v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;

  v3 = 0.0;
  if (!-[_UICollectionViewListLayoutSectionConfiguration _hasHeaderOrFirstItemStyledAsHeader](self, "_hasHeaderOrFirstItemStyledAsHeader"))
  {
    -[_UICollectionViewListLayoutSectionConfiguration _defaultSectionHeaderHeight](self, "_defaultSectionHeaderHeight");
    v3 = v4;
  }
  if (dyld_program_sdk_at_least())
  {
    if (!-[NSCollectionLayoutEnvironment_Private _sectionIndex](self->_layoutEnvironment, "_sectionIndex"))
    {
      v3 = 0.0;
      if ((-[NSCollectionLayoutEnvironment_Private _wantsCollapsedTopSpacing](self->_layoutEnvironment, "_wantsCollapsedTopSpacing") & 1) == 0&& !-[_UICollectionViewListLayoutSectionConfiguration _hasHeaderOrFirstItemStyledAsHeader](self, "_hasHeaderOrFirstItemStyledAsHeader"))
      {
        v5 = self->_appearanceStyle - 1;
        if (v5 > 2)
          v6 = 0;
        else
          v6 = qword_186684DD8[v5];
        -[_UICollectionViewListLayoutSectionConfiguration _constants](self, "_constants");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "defaultPaddingAboveFirstSectionWithoutHeaderTableStyle:", v6);
        v3 = v8;

      }
    }
  }
  return v3;
}

- (double)_defaultSectionFooterHeight
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v3 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self, "appearanceStyle") - 1;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = qword_186684DD8[v3];
  -[_UICollectionViewListLayoutSectionConfiguration _constants](self, "_constants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSectionFooterHeightForTableViewStyle:screen:", v4, 0);
  v7 = v6;
  -[_UICollectionViewListLayoutSectionConfiguration _traitCollection](self, "_traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = UIPixelBoundaryOffset(1, v7, v9);

  return v10;
}

- (BOOL)_hasSupplementaryAsHeader
{
  return self->_sectionHeaderHeight != -1000.0;
}

- (double)headerTopPadding
{
  return self->_headerTopPadding;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    objc_storeWeak((id *)(v4 + 152), WeakRetained);

    objc_storeStrong((id *)(v4 + 160), self->_layoutEnvironment);
    objc_storeStrong((id *)(v4 + 168), self->_itemHeights);
    *(_BYTE *)(v4 + 10) = self->__apiVersion;
    objc_storeStrong((id *)(v4 + 176), self->__headerElementKind);
    objc_storeStrong((id *)(v4 + 184), self->__footerElementKind);
    objc_storeStrong((id *)(v4 + 192), self->__backgroundColor);
    *(_QWORD *)(v4 + 32) = self->_appearanceStyle;
    *(double *)(v4 + 40) = self->_cornerRadius;
    *(_BYTE *)(v4 + 8) = self->_stylesFirstItemAsHeader;
    *(double *)(v4 + 48) = self->_rowHeight;
    *(double *)(v4 + 56) = self->_sectionHeaderHeight;
    *(double *)(v4 + 64) = self->_sectionFooterHeight;
    *(double *)(v4 + 72) = self->_estimatedRowHeight;
    *(double *)(v4 + 80) = self->_estimatedSectionHeaderHeight;
    *(double *)(v4 + 88) = self->_estimatedSectionFooterHeight;
    *(double *)(v4 + 96) = self->_headerTopPadding;
    *(_QWORD *)(v4 + 104) = self->_separatorStyle;
    v6 = objc_msgSend(self->_separatorInsetProvider, "copy");
    v7 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = v6;

    v8 = -[_UIListSeparatorConfiguration copy](self->_separatorConfiguration, "copy");
    v9 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v8;

    v10 = objc_msgSend(self->_itemSeparatorHandler, "copy");
    v11 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v10;

    v12 = objc_msgSend(self->_leadingSwipeActionsConfigurationProvider, "copy");
    v13 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = v12;

    v14 = objc_msgSend(self->_trailingSwipeActionsConfigurationProvider, "copy");
    v15 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v14;

    v16 = objc_msgSend(self->_willBeginSwipingHandler, "copy");
    v17 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = v16;

    v18 = objc_msgSend(self->_didEndSwipingHandler, "copy");
    v19 = *(void **)(v4 + 144);
    *(_QWORD *)(v4 + 144) = v18;

    *(_BYTE *)(v4 + 9) = self->_sectionHeaderHugsContent;
  }
  return (id)v4;
}

- (_UICollectionViewListLayoutSectionConfiguration)init
{
  return -[_UICollectionViewListLayoutSectionConfiguration initWithAppearanceStyle:layoutEnvironment:](self, "initWithAppearanceStyle:layoutEnvironment:", 0, 0);
}

- (_UICollectionViewListLayoutSectionConfiguration)initWithAppearanceStyle:(int64_t)a3 layoutEnvironment:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewListLayoutSectionConfiguration;
  v6 = -[_UICollectionViewListLayoutSectionConfiguration init](&v15, sel_init);
  if (v6)
  {
    v7 = a4;
    objc_storeStrong((id *)v6 + 20, a4);
    v8 = (void *)*((_QWORD *)v6 + 22);
    *((_QWORD *)v6 + 22) = CFSTR("UICollectionViewListLayoutElementKindSectionHeader");

    v9 = (void *)*((_QWORD *)v6 + 23);
    *((_QWORD *)v6 + 23) = CFSTR("UICollectionViewListLayoutElementKindSectionFooter");

    *((_QWORD *)v6 + 4) = a3;
    v6[8] = 0;
    *(int64x2_t *)(v6 + 40) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)(v6 + 56) = vdupq_n_s64(0xC08F400000000000);
    *((_QWORD *)v6 + 12) = 0x7FEFFFFFFFFFFFFFLL;
    *((_QWORD *)v6 + 13) = objc_msgSend(v6, "_defaultSeparatorStyleForAppearanceStyle:", a3);
    +[_UIListSeparatorConfiguration _configurationForAppearanceStyle:inLayoutEnvironment:](_UIListSeparatorConfiguration, "_configurationForAppearanceStyle:inLayoutEnvironment:", a3, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v10;

    if (objc_msgSend(v6, "_shouldPinSupplementaries"))
    {
      objc_msgSend(v7, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "userInterfaceIdiom") == 6)
        v13 = _UISupportsVisionDefaultContentHuggingSectionHeaders();
      else
        v13 = 0;
      v6[9] = v13;

    }
    else
    {
      v6[9] = 0;
    }

  }
  return (_UICollectionViewListLayoutSectionConfiguration *)v6;
}

- (BOOL)_shouldPinSupplementaries
{
  return (self->_appearanceStyle & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (int64_t)_defaultSeparatorStyleForAppearanceStyle:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if ((unint64_t)(a3 - 1) > 2)
    v3 = 0;
  else
    v3 = qword_186684DD8[a3 - 1];
  -[_UICollectionViewListLayoutSectionConfiguration _constants](self, "_constants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "defaultSeparatorStyleForTableViewStyle:", v3);

  return v5 != 0;
}

- (double)_separatorHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[_UICollectionViewListLayoutSectionConfiguration _traitCollection](self, "_traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  v6 = 1.0;
  if (v5 > 0.0
    && !-[_UICollectionViewListLayoutSectionConfiguration _shouldDrawThickSeparators](self, "_shouldDrawThickSeparators"))
  {
    return 1.0 / v5;
  }
  return v6;
}

- (BOOL)_shouldDrawThickSeparators
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  -[_UICollectionViewListLayoutSectionConfiguration _traitCollection](self, "_traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (UITableConstants)_constants
{
  void *v2;
  void *v3;

  -[_UICollectionViewListLayoutSectionConfiguration _traitCollection](self, "_traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITableConstants *)v3;
}

- (id)_traitCollection
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (double)_topContentInsetForPaddingAboveHeader
{
  double headerTopPadding;
  int64_t appearanceStyle;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;

  if (!self->_stylesFirstItemAsHeader)
    return 0.0;
  headerTopPadding = self->_headerTopPadding;
  if (headerTopPadding == 1.79769313e308)
  {
    appearanceStyle = self->_appearanceStyle;
    if (appearanceStyle == 3)
    {
      -[_UICollectionViewListLayoutSectionConfiguration _constants](self, "_constants");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "defaultSidebarPaddingAboveSectionHeadersWithFallbackTableStyle:", 1);
    }
    else
    {
      if (appearanceStyle == 2)
        v5 = 2;
      else
        v5 = appearanceStyle == 1;
      -[_UICollectionViewListLayoutSectionConfiguration _layoutEnvironment](self, "_layoutEnvironment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_sectionIndex");

      -[_UICollectionViewListLayoutSectionConfiguration _constants](self, "_constants");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
        objc_msgSend(v8, "defaultPaddingAboveSectionHeadersForTableStyle:", v5);
      else
        objc_msgSend(v8, "defaultPaddingAboveFirstSectionHeaderForTableStyle:", v5);
    }
    headerTopPadding = v10;

  }
  return headerTopPadding;
}

- (int64_t)_defaultContentInsetsReference
{
  return 1;
}

- (UICollectionView)_collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (NSCollectionLayoutEnvironment_Private)_layoutEnvironment
{
  return self->_layoutEnvironment;
}

- (UIColor)_backgroundColor
{
  return self->__backgroundColor;
}

- (NSString)_headerElementKind
{
  return self->__headerElementKind;
}

- (BOOL)sectionHeaderHugsContent
{
  return self->_sectionHeaderHugsContent;
}

- (void)_addSupplementaryItemsToLayout:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  double sectionHeaderHeight;
  double v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double sectionFooterHeight;
  double v18;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(a3, "_pinnedSupplementariesShouldOverlap");
  if (self->_sectionHeaderHugsContent)
    objc_msgSend(off_1E1679980, "estimatedDimension:", 100.0);
  else
    objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sectionHeaderHeight = self->_sectionHeaderHeight;
  v9 = fabs(sectionHeaderHeight + -1.79769313e308);
  if (fabs(sectionHeaderHeight + 1.0) > 2.22044605e-16 && v9 > 2.22044605e-16)
  {
    if (sectionHeaderHeight <= 0.0)
      goto LABEL_16;
    v11 = off_1E16799A8;
    objc_msgSend(off_1E1679980, "absoluteDimension:");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UICollectionViewListLayoutSectionConfiguration _effectiveEstimatedSectionHeaderHeight](self, "_effectiveEstimatedSectionHeaderHeight");
    v11 = off_1E16799A8;
    objc_msgSend(off_1E1679980, "estimatedDimension:");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  objc_msgSend(v11, "sizeWithWidthDimension:heightDimension:", v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (self->_sectionHeaderHugsContent)
      v15 = 2;
    else
      v15 = 1;
    objc_msgSend(off_1E1679970, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v14, self->__headerElementKind, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPinToVisibleBounds:", -[_UICollectionViewListLayoutSectionConfiguration _shouldPinSupplementaries](self, "_shouldPinSupplementaries"));
    objc_msgSend(v16, "setZIndex:", 200);
    if (v6)
      objc_msgSend(v16, "_setPinningZIndex:", 210);
    objc_msgSend(v5, "addObject:", v16);

  }
LABEL_16:
  sectionFooterHeight = self->_sectionFooterHeight;
  v18 = fabs(sectionFooterHeight + -1.79769313e308);
  if (fabs(sectionFooterHeight + 1.0) > 2.22044605e-16 && v18 > 2.22044605e-16)
  {
    if (sectionFooterHeight <= 0.0)
      goto LABEL_28;
    v22 = off_1E16799A8;
    objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "absoluteDimension:", self->_sectionFooterHeight);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UICollectionViewListLayoutSectionConfiguration _effectiveEstimatedSectionFooterHeight](self, "_effectiveEstimatedSectionFooterHeight");
    v21 = v20;
    v22 = off_1E16799A8;
    objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "estimatedDimension:", v21);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v24;
  objc_msgSend(v22, "sizeWithWidthDimension:heightDimension:", v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if (self->_sectionHeaderHugsContent)
      v27 = 4;
    else
      v27 = 5;
    objc_msgSend(off_1E1679970, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v26, self->__footerElementKind, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPinToVisibleBounds:", -[_UICollectionViewListLayoutSectionConfiguration _shouldPinSupplementaries](self, "_shouldPinSupplementaries"));
    objc_msgSend(v28, "setZIndex:", 200);
    if (v6)
      objc_msgSend(v28, "_setPinningZIndex:", 210);
    objc_msgSend(v5, "addObject:", v28);

  }
LABEL_28:
  objc_msgSend(a3, "setSupplementariesFollowContentInsets:", -[_UICollectionViewListLayoutSectionConfiguration _shouldSupplementariesFollowSectionInsets](self, "_shouldSupplementariesFollowSectionInsets"));
  objc_msgSend(a3, "setBoundarySupplementaryItems:", v5);
  if (-[_UICollectionViewListLayoutSectionConfiguration _usesSectionBackgroundDecoration](self, "_usesSectionBackgroundDecoration"))
  {
    objc_msgSend(off_1E1679978, "backgroundDecorationItemWithElementKind:", CFSTR("_UICollectionViewListLayoutSectionBackgroundColorDecorationElementKind"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_setRegistrationViewClass:", objc_opt_class());
    objc_msgSend(v29, "setZIndex:", 0);
    v31[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "setDecorationItems:", v30);

  }
}

- (BOOL)_shouldSupplementariesFollowSectionInsets
{
  void *v3;
  uint64_t v4;

  -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return v4 == 6 || (self->_appearanceStyle & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (BOOL)_isAPIVersion
{
  return self->__apiVersion;
}

- (id)_createSwipeActionsContainer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679968, "layoutAnchorWithAnchorPoint:", 0.5, 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679978, "decorationItemWithSize:elementKind:containerAnchor:", v4, 0x1E174E8E0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setRegistrationViewClass:", objc_opt_class());
  objc_msgSend(v6, "setZIndex:", 5);

  return v6;
}

- (id)_generateLayoutGroup:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UICollectionViewListLayoutSectionConfiguration *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double rowHeight;
  double v27;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  NSArray *obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  objc_storeStrong((id *)&self->_layoutEnvironment, a3);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  if (self->_separatorStyle || self->_itemSeparatorHandler)
  {
    -[_UICollectionViewListLayoutSectionConfiguration _createSeparatorForBottom:](self, "_createSeparatorForBottom:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v5);

    -[_UICollectionViewListLayoutSectionConfiguration _createSeparatorForBottom:](self, "_createSeparatorForBottom:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v6);

  }
  if (-[_UICollectionViewListLayoutSectionConfiguration _wantsSwipeActions](self, "_wantsSwipeActions"))
  {
    -[_UICollectionViewListLayoutSectionConfiguration _createSwipeActionsContainer](self, "_createSwipeActionsContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v7);

  }
  if (!self->_itemHeights)
    goto LABEL_23;
  v8 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = self;
  obj = self->_itemHeights;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "doubleValue");
        v15 = v14;
        v17 = fabs(v14 + 1.0) > 2.22044605e-16;
        v16 = fabs(v14 + -1.79769313e308);
        v17 = v17 && v16 > 2.22044605e-16;
        if (v17)
        {
          v20 = off_1E16799A8;
          objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(off_1E1679980, "absoluteDimension:", v15);
        }
        else
        {
          -[_UICollectionViewListLayoutSectionConfiguration _effectiveEstimatedRowHeight](v9, "_effectiveEstimatedRowHeight", v16);
          v19 = v18;
          v20 = off_1E16799A8;
          objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(off_1E1679980, "estimatedDimension:", v19);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sizeWithWidthDimension:heightDimension:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(off_1E1679998, "itemWithSize:decorationItems:", v23, v47);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v24);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v11);
  }

  v25 = (void *)objc_msgSend(v8, "copy");
  self = v9;
  if (!v25)
  {
LABEL_23:
    rowHeight = self->_rowHeight;
    v27 = fabs(rowHeight + -1.79769313e308);
    if (fabs(rowHeight + 1.0) <= 2.22044605e-16 || v27 <= 2.22044605e-16)
      goto LABEL_27;
    objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679980, "absoluteDimension:", rowHeight);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(off_1E1679998, "itemWithSize:decorationItems:", v42, v47);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
LABEL_27:
      -[_UICollectionViewListLayoutSectionConfiguration _effectiveEstimatedRowHeight](self, "_effectiveEstimatedRowHeight");
      v30 = v29;
      objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E1679980, "estimatedDimension:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E1679998, "itemWithSize:decorationItems:", v33, v47);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "estimatedDimension:", 1000.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679990, "verticalGroupWithLayoutSize:subitems:", v37, v25);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)_createSeparatorForBottom:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString **v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(off_1E1679980, "fractionalWidthDimension:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewListLayoutSectionConfiguration _separatorHeight](self, "_separatorHeight");
  objc_msgSend(off_1E1679980, "absoluteDimension:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v8 = 4;
  else
    v8 = 1;
  if (v3)
    v9 = _UICollectionViewListLayoutElementKindBottomSeparator;
  else
    v9 = &_UICollectionViewListLayoutElementKindTopSeparator;
  objc_msgSend(off_1E1679968, "layoutAnchorWithEdges:absoluteOffset:", v8, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679978, "decorationItemWithSize:elementKind:containerAnchor:", v7, *v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setRegistrationViewClass:", objc_opt_class());
  objc_msgSend(v11, "setZIndex:", 100);

  return v11;
}

- (BOOL)_wantsSwipeActions
{
  return (dyld_program_sdk_at_least() & 1) != 0
      || self->_trailingSwipeActionsConfigurationProvider
      || self->_leadingSwipeActionsConfigurationProvider != 0;
}

- (double)_effectiveEstimatedRowHeight
{
  double result;
  double v3;
  BOOL v4;

  result = self->_estimatedRowHeight;
  v3 = fabs(result + -1.79769313e308);
  v4 = fabs(result + 1.0) > 2.22044605e-16 && v3 > 2.22044605e-16;
  if (!v4 || result == 0.0)
    -[_UICollectionViewListLayoutSectionConfiguration _defaultRowHeight](self, "_defaultRowHeight");
  return result;
}

- (double)_defaultRowHeight
{
  void *v2;
  double v3;
  double v4;

  -[_UICollectionViewListLayoutSectionConfiguration _constants](self, "_constants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultRowHeightForTableView:", 0);
  v4 = v3;

  return v4;
}

- (double)_defaultSectionHeaderHeight
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v3 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self, "appearanceStyle") - 1;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = qword_186684DD8[v3];
  -[_UICollectionViewListLayoutSectionConfiguration _constants](self, "_constants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSectionHeaderHeightForTableViewStyle:screen:", v4, 0);
  v7 = v6;
  -[_UICollectionViewListLayoutSectionConfiguration _traitCollection](self, "_traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = UIPixelBoundaryOffset(1, v7, v9);

  return v10;
}

- (double)_effectiveEstimatedSectionHeaderHeight
{
  double result;
  double v3;
  BOOL v4;

  result = self->_estimatedSectionHeaderHeight;
  v3 = fabs(result + -1.79769313e308);
  v4 = fabs(result + 1.0) > 2.22044605e-16 && v3 > 2.22044605e-16;
  if (!v4 || result == 0.0)
    -[_UICollectionViewListLayoutSectionConfiguration _defaultSectionHeaderHeight](self, "_defaultSectionHeaderHeight");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundColor, 0);
  objc_storeStrong((id *)&self->__footerElementKind, 0);
  objc_storeStrong((id *)&self->__headerElementKind, 0);
  objc_storeStrong((id *)&self->_itemHeights, 0);
  objc_storeStrong((id *)&self->_layoutEnvironment, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong(&self->_didEndSwipingHandler, 0);
  objc_storeStrong(&self->_willBeginSwipingHandler, 0);
  objc_storeStrong(&self->_trailingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong(&self->_leadingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong(&self->_separatorInsetProvider, 0);
  objc_storeStrong(&self->_itemSeparatorHandler, 0);
  objc_storeStrong((id *)&self->_separatorConfiguration, 0);
}

- (void)setSeparatorInset:(NSDirectionalEdgeInsets)a3
{
  -[_UIListSeparatorConfiguration _setInsets:](self->_separatorConfiguration, "_setInsets:", a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (_UICollectionViewListLayoutSectionConfiguration)initWithCollectionView:(id)a3
{
  _UICollectionViewListLayoutSectionConfiguration *v4;
  _UICollectionViewListLayoutSectionConfiguration *v5;

  v4 = -[_UICollectionViewListLayoutSectionConfiguration initWithAppearanceStyle:layoutEnvironment:](self, "initWithAppearanceStyle:layoutEnvironment:", 0, 0);
  v5 = v4;
  if (v4)
    objc_storeWeak((id *)&v4->_collectionView, a3);
  return v5;
}

- (NSDirectionalEdgeInsets)separatorInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[_UIListSeparatorConfiguration _insets](self->_separatorConfiguration, "_insets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)_sectionContentInsetsForAppearanceStyleWithDefaultInsets:(NSDirectionalEdgeInsets)a3 headerFootersAreChromeless:(BOOL)a4
{
  double trailing;
  double bottom;
  double leading;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  -[_UICollectionViewListLayoutSectionConfiguration _topContentInsetForPaddingAboveHeader](self, "_topContentInsetForPaddingAboveHeader", a3.top);
  v10 = v9;
  switch(self->_appearanceStyle)
  {
    case 0:
      -[_UICollectionViewListLayoutSectionConfiguration _traitCollection](self, "_traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "userInterfaceIdiom");

      if (v20 == 6)
        goto LABEL_2;
      break;
    case 1:
    case 2:
      goto LABEL_2;
    case 3:
      -[_UICollectionViewListLayoutSectionConfiguration _traitCollection](self, "_traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "userInterfaceIdiom");

      if (v22 == 6)
      {
LABEL_2:
        -[_UICollectionViewListLayoutSectionConfiguration _sectionContentInsetsForVerticallySeparatedSectionsWithDefaultInsets:](self, "_sectionContentInsetsForVerticallySeparatedSectionsWithDefaultInsets:", v10, leading, bottom, trailing);
        v10 = v11;
        leading = v12;
        bottom = v13;
        trailing = v14;
      }
      else if (!-[_UICollectionViewListLayoutSectionConfiguration _hasFooter](self, "_hasFooter"))
      {
        bottom = bottom + 10.0;
      }
      break;
    case 4:
      if (!a4
        && (-[_UICollectionViewListLayoutSectionConfiguration _hasHeaderOrFirstItemStyledAsHeader](self, "_hasHeaderOrFirstItemStyledAsHeader")|| -[_UICollectionViewListLayoutSectionConfiguration _hasFooter](self, "_hasFooter")))
      {
        v10 = v10 + 8.0;
        bottom = bottom + 8.0;
      }
      break;
    default:
      break;
  }
  v15 = v10;
  v16 = leading;
  v17 = bottom;
  v18 = trailing;
  result.trailing = v18;
  result.bottom = v17;
  result.leading = v16;
  result.top = v15;
  return result;
}

- (double)_effectiveEstimatedSectionFooterHeight
{
  double result;
  double v3;
  BOOL v4;

  result = self->_estimatedSectionFooterHeight;
  v3 = fabs(result + -1.79769313e308);
  v4 = fabs(result + 1.0) > 2.22044605e-16 && v3 > 2.22044605e-16;
  if (!v4 || result == 0.0)
    -[_UICollectionViewListLayoutSectionConfiguration _defaultSectionFooterHeight](self, "_defaultSectionFooterHeight");
  return result;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (double)sectionHeaderHeight
{
  return self->_sectionHeaderHeight;
}

- (double)sectionFooterHeight
{
  return self->_sectionFooterHeight;
}

- (double)estimatedRowHeight
{
  return self->_estimatedRowHeight;
}

- (void)setEstimatedRowHeight:(double)a3
{
  self->_estimatedRowHeight = a3;
}

- (double)estimatedSectionHeaderHeight
{
  return self->_estimatedSectionHeaderHeight;
}

- (void)setEstimatedSectionHeaderHeight:(double)a3
{
  self->_estimatedSectionHeaderHeight = a3;
}

- (double)estimatedSectionFooterHeight
{
  return self->_estimatedSectionFooterHeight;
}

- (void)setEstimatedSectionFooterHeight:(double)a3
{
  self->_estimatedSectionFooterHeight = a3;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void)setSeparatorInsetProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)leadingSwipeActionsConfigurationProvider
{
  return self->_leadingSwipeActionsConfigurationProvider;
}

- (id)trailingSwipeActionsConfigurationProvider
{
  return self->_trailingSwipeActionsConfigurationProvider;
}

- (id)willBeginSwipingHandler
{
  return self->_willBeginSwipingHandler;
}

- (id)didEndSwipingHandler
{
  return self->_didEndSwipingHandler;
}

- (NSArray)_itemHeights
{
  return self->_itemHeights;
}

- (void)_setItemHeights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)_footerElementKind
{
  return self->__footerElementKind;
}

@end
