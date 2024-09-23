@implementation _UICollectionViewListLayoutSection

- (NSDirectionalEdgeInsets)_defaultDirectionalLayoutMarginsInsideSection
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSDirectionalEdgeInsets result;

  -[_UICollectionViewListLayoutSection _defaultLayoutMarginsInsideSection](self, "_defaultLayoutMarginsInsideSection");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[_UICollectionViewListLayoutSection _isRTL](self, "_isRTL");
  if (v11)
    v12 = v10;
  else
    v12 = v6;
  if (v11)
    v13 = v6;
  else
    v13 = v10;
  v14 = v4;
  v15 = v8;
  result.trailing = v13;
  result.bottom = v15;
  result.leading = v12;
  result.top = v14;
  return result;
}

- (void)_configureLayoutAttributesForPlainCell:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;

  -[_UICollectionViewListLayoutSection _configureLayoutAttributesWithDefaultMasking:](self, "_configureLayoutAttributesWithDefaultMasking:");
  -[_UICollectionViewListLayoutSection _defaultLayoutMarginsInsideSection](self, "_defaultLayoutMarginsInsideSection");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader"))
  {
    objc_msgSend(a3, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "item");

    if (!v14
      && !-[NSCollectionLayoutSection supplementariesFollowContentInsets](self, "supplementariesFollowContentInsets"))
    {
      -[_UICollectionViewListLayoutSection _effectiveSectionHorizontalInsets](self, "_effectiveSectionHorizontalInsets");
      v16 = v15;
      v18 = v17;
      objc_msgSend(a3, "bounds");
      objc_msgSend(a3, "setBounds:");
      v19 = -[_UICollectionViewListLayoutSection _isRTL](self, "_isRTL");
      if (v19)
        v20 = v18;
      else
        v20 = v16;
      if (v19)
        v21 = v16;
      else
        v21 = v18;
      v8 = v8 + v20;
      v12 = v12 + v21;
    }
  }
  if (a3)
  {
    *((_WORD *)a3 + 144) |= 0x200u;
    *((_QWORD *)a3 + 40) = v6;
    *((double *)a3 + 41) = v8;
    *((_QWORD *)a3 + 42) = v10;
    *((double *)a3 + 43) = v12;
  }
}

- (UIEdgeInsets)_defaultLayoutMarginsInsideSection
{
  int64_t v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UIEdgeInsets result;

  v3 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
  v4 = v3;
  if (!v3)
  {
    -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 6)
    {
LABEL_5:
      -[NSCollectionLayoutEnvironment_Private container](self->_layoutEnvironment, "container");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentSize");
      v9 = v8;
      v11 = v10;

      -[_UICollectionViewListLayoutSection _defaultSectionContentInsetsForAppearanceStyle:](self, "_defaultSectionContentInsetsForAppearanceStyle:", v4);
      v14 = v9 - v12 - v13;
      -[_UICollectionViewListLayoutSection _constants](self, "_constants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "defaultLayoutMarginsInsideSectionForSize:tableStyle:", 2 * (v4 == 2), v14, v11);
      goto LABEL_6;
    }
LABEL_11:
    -[_UICollectionViewListLayoutSection _effectiveCollectionViewLayoutMarginsForAppearanceStyle:forUseAsContentInsets:](self, "_effectiveCollectionViewLayoutMarginsForAppearanceStyle:forUseAsContentInsets:", v4, 0);
    v20 = v24;
    v21 = v25;
    v22 = v26;
    v23 = v27;
    goto LABEL_12;
  }
  if (v3 == 2)
    goto LABEL_5;
  if ((unint64_t)(v3 - 3) > 1)
    goto LABEL_11;
  -[_UICollectionViewListLayoutSection _constants](self, "_constants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0.0;
  v22 = 0.0;
  v21 = 0.0;
  v20 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v15, "defaultSidebarLayoutMarginsForElementsInsideSection");
LABEL_6:
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
LABEL_7:

LABEL_12:
  v28 = v20;
  v29 = v21;
  v30 = v22;
  v31 = v23;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (void)_enrichLayoutAttributes:(id)a3 interactionState:(id)a4
{
  unint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  _QWORD *v10;
  __int16 v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  _UICollectionViewListLayoutSection *v16;
  id v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  int v58;
  _QWORD *v59;

  -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
  v59 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
  if (v59)
  {
    v59[2] = v7;
    v8 = -[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader");
    *((_BYTE *)v59 + 8) = v59[1] & 0xFE | v8;
  }
  else
  {
    v8 = -[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader");
  }
  -[UICollectionViewLayoutAttributes _preferredSizingData]((id *)a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (_QWORD *)v9;
  if (v9)
  {
    if (!a3)
      goto LABEL_42;
    *((_QWORD *)a3 + 38) = *(_QWORD *)(v9 + 16);
  }
  else if (!a3)
  {
    goto LABEL_42;
  }
  v11 = *((_WORD *)a3 + 144);
  if ((v11 & 1) != 0)
  {
    if (v7 != 2 && *((_QWORD *)a3 + 38) != 0)
    {
      v20 = -[_UICollectionViewListLayoutSection _maskedCornersForBackgroundOfItemWithSelectionGrouping:](self, "_maskedCornersForBackgroundOfItemWithSelectionGrouping:");
      if (v59)
      {
        v59[3] = v20;
        *((_BYTE *)v59 + 8) |= 2u;
      }
    }
    objc_msgSend(a3, "setZIndex:", 10);
    switch(v7)
    {
      case 0uLL:
        -[_UICollectionViewListLayoutSection _configureLayoutAttributesForPlainCell:](self, "_configureLayoutAttributesForPlainCell:", a3);
        break;
      case 1uLL:
      case 3uLL:
        -[_UICollectionViewListLayoutSection _defaultLayoutMarginsInsideSection](self, "_defaultLayoutMarginsInsideSection");
        *((_WORD *)a3 + 144) |= 0x200u;
        *((_QWORD *)a3 + 40) = v21;
        *((_QWORD *)a3 + 41) = v22;
        *((_QWORD *)a3 + 42) = v23;
        *((_QWORD *)a3 + 43) = v24;
        -[_UICollectionViewListLayoutSection _configureLayoutAttributesWithDefaultMasking:](self, "_configureLayoutAttributesWithDefaultMasking:", a3);
        break;
      case 2uLL:
        -[_UICollectionViewListLayoutSection _defaultLayoutMarginsInsideSection](self, "_defaultLayoutMarginsInsideSection");
        *((_WORD *)a3 + 144) |= 0x200u;
        *((_QWORD *)a3 + 40) = v44;
        *((_QWORD *)a3 + 41) = v45;
        *((_QWORD *)a3 + 42) = v46;
        *((_QWORD *)a3 + 43) = v47;
        -[_UICollectionViewListLayoutSection _configureLayoutAttributesWithInsetGroupedMasking:stylesFirstItemAsHeader:](self, "_configureLayoutAttributesWithInsetGroupedMasking:stylesFirstItemAsHeader:", a3, v8);
        break;
      case 4uLL:
        -[_UICollectionViewListLayoutSection _configureLayoutAttributesForSidebarPlainCell:](self, "_configureLayoutAttributesForSidebarPlainCell:", a3);
        break;
      default:
        break;
    }
  }
  else if ((v11 & 3) != 0)
  {
    if ((v11 & 2) != 0)
    {
      -[UIBarButtonItemGroup _items]((id *)a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("UICollectionViewListLayoutElementKindBottomSeparator"));

      if (v13)
      {
        if (v10)
          v14 = (void *)v10[1];
        else
          v14 = 0;
        v15 = v14;
        v16 = self;
        v17 = a3;
        v18 = 1;
LABEL_41:
        -[_UICollectionViewListLayoutSection _configureLayoutAttributes:forSeparatorAtBottom:preferredConfiguration:interactionState:](v16, "_configureLayoutAttributes:forSeparatorAtBottom:preferredConfiguration:interactionState:", v17, v18, v15, a4);

        goto LABEL_42;
      }
      -[UIBarButtonItemGroup _items]((id *)a3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("UICollectionViewListLayoutElementKindTopSeparator"));

      if (v49)
      {
        if (v10)
          v50 = (void *)v10[1];
        else
          v50 = 0;
        v15 = v50;
        v16 = self;
        v17 = a3;
        v18 = 0;
        goto LABEL_41;
      }
      -[UIBarButtonItemGroup _items]((id *)a3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "isEqualToString:", 0x1E174E8E0);

      if (v52)
      {
        objc_msgSend(a3, "setHidden:", 1);
        if (v7 <= 4)
        {
          if (v7 == 2)
            -[_UICollectionViewListLayoutSection _configureLayoutAttributesWithInsetGroupedMasking:stylesFirstItemAsHeader:](self, "_configureLayoutAttributesWithInsetGroupedMasking:stylesFirstItemAsHeader:", a3, v8);
          else
            -[_UICollectionViewListLayoutSection _configureLayoutAttributesForSwipeActionMasking:interactionState:](self, "_configureLayoutAttributesForSwipeActionMasking:interactionState:", a3, a4);
        }
        -[_UICollectionViewListLayoutSection _defaultLayoutMarginsInsideSection](self, "_defaultLayoutMarginsInsideSection");
        *((_WORD *)a3 + 144) |= 0x200u;
        *((_QWORD *)a3 + 40) = v53;
        *((_QWORD *)a3 + 41) = v54;
        *((_QWORD *)a3 + 42) = v55;
        *((_QWORD *)a3 + 43) = v56;
      }
      else
      {
        -[UIBarButtonItemGroup _items]((id *)a3);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("_UICollectionViewListLayoutSectionBackgroundColorDecorationElementKind"));

        if (v58)
          -[_UICollectionViewListLayoutSection _configureLayoutAttributesForBackgroundDecoration:](self, "_configureLayoutAttributesForBackgroundDecoration:", a3);
      }
    }
  }
  else
  {
    if (dyld_program_sdk_at_least())
    {
      -[_UICollectionViewListLayoutSection _defaultLayoutMarginsForSupplementaryViewWithLayoutAttributes:](self, "_defaultLayoutMarginsForSupplementaryViewWithLayoutAttributes:", a3);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
    }
    else
    {
      -[_UICollectionViewListLayoutSection _defaultLayoutMarginsInsideSection](self, "_defaultLayoutMarginsInsideSection");
      v26 = v33;
      v28 = v34;
      v30 = v35;
      v32 = v36;
      if (!-[NSCollectionLayoutSection supplementariesFollowContentInsets](self, "supplementariesFollowContentInsets"))
      {
        -[_UICollectionViewListLayoutSection _effectiveSectionHorizontalInsets](self, "_effectiveSectionHorizontalInsets");
        v38 = v37;
        v40 = v39;
        v41 = -[_UICollectionViewListLayoutSection _isRTL](self, "_isRTL");
        if (v41)
          v42 = v40;
        else
          v42 = v38;
        if (v41)
          v43 = v38;
        else
          v43 = v40;
        v28 = v28 + v42;
        v32 = v32 + v43;
      }
    }
    *((_WORD *)a3 + 144) |= 0x200u;
    *((_QWORD *)a3 + 40) = v26;
    *((double *)a3 + 41) = v28;
    *((_QWORD *)a3 + 42) = v30;
    *((double *)a3 + 43) = v32;
    if (!v7)
      -[_UICollectionViewListLayoutSection _configureLayoutAttributesForPlainSupplementaryView:](self, "_configureLayoutAttributesForPlainSupplementaryView:", a3);
  }
LABEL_42:

}

- (void)_configureLayoutAttributesWithDefaultMasking:(id)a3
{
  if (a3)
  {
    *((_WORD *)a3 + 144) &= ~0x10u;
    -[UICollectionViewLayoutAttributes _setMaskedCorners:]((uint64_t)a3, 0xFuLL);
    *((_QWORD *)a3 + 39) = 0;
  }
  else
  {
    -[UICollectionViewLayoutAttributes _setMaskedCorners:](0, 0xFuLL);
  }
}

- (UIEdgeInsets)_effectiveCollectionViewLayoutMarginsForAppearanceStyle:(int64_t)a3 forUseAsContentInsets:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  UIEdgeInsets result;

  v4 = a4;
  -[NSCollectionLayoutEnvironment_Private container](self->_layoutEnvironment, "container");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[_UICollectionViewListLayoutSection _isRTL](self, "_isRTL");
    v10 = (void *)v8[1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 921, CFSTR("UIKit internal bug: missing layout container for environment: %@ section: %@"), self->_layoutEnvironment, self);

    v9 = -[_UICollectionViewListLayoutSection _isRTL](self, "_isRTL");
    v10 = 0;
  }
  v11 = v10;
  objc_msgSend(v11, "safeAreaInsets");
  v13 = v12;

  if (v8)
    v14 = (void *)v8[1];
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v15, "layoutMarginsInsets");
  v19 = v18;
  v21 = v20;
  if (v9)
    v22 = v17;
  else
    v22 = v16;
  if (v9)
    v23 = v16;
  else
    v23 = v17;

  if (!v4)
  {
    UIEdgeInsetsSubtract(15, v19, v22, v21, v23, v13);
    v22 = v24;
    v23 = v25;
  }
  if ((unint64_t)(a3 - 1) > 2)
    v26 = 0;
  else
    v26 = qword_186684DD8[a3 - 1];
  if (v4)
  {
    -[_UICollectionViewListLayoutSection _constants](self, "_constants");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "shouldUseDefaultTableLayoutMarginsAsContentInsets");

    if ((v28 & 1) == 0)
    {
      -[_UICollectionViewListLayoutSection _constants](self, "_constants");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "defaultSectionContentInsetsForTableStyle:", v26);
      v31 = v39;
      v33 = v40;
      v35 = v41;
      v37 = v42;

      goto LABEL_21;
    }
  }
  -[_UICollectionViewListLayoutSection _constants](self, "_constants");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSize");
  objc_msgSend(v29, "defaultTableLayoutMarginsForScreen:size:tableStyle:", 0, v26);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  if (v4)
  {
LABEL_21:
    UIEdgeInsetsAdd(15, v31, v33, v35, v37, v13);
    v33 = v43;
    v37 = v44;
  }
  if (v22 >= v33)
    v45 = v22;
  else
    v45 = v33;
  if (v23 >= v37)
    v46 = v23;
  else
    v46 = v37;

  v47 = 0.0;
  v48 = 0.0;
  v49 = v45;
  v50 = v46;
  result.right = v50;
  result.bottom = v48;
  result.left = v49;
  result.top = v47;
  return result;
}

- (BOOL)_isRTL
{
  void *v2;
  BOOL v3;

  -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirection") == 1;

  return v3;
}

- (id)_constants
{
  void *v2;
  void *v3;

  -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureLayoutAttributesForSidebarPlainCell:(id)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[_UICollectionViewListLayoutSection _configureLayoutAttributesForPlainCell:](self, "_configureLayoutAttributesForPlainCell:");
  if ((unint64_t)(-[_UICollectionViewListLayoutSection _headerFooterPinningBehavior](self, "_headerFooterPinningBehavior")- 1) >= 2)
  {
    if (-[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader"))
    {
      objc_msgSend(a3, "indexPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "item");

      if (!v6)
      {
        objc_msgSend(a3, "center");
        v8 = v7;
        v10 = v9;
        -[NSCollectionLayoutSection contentInsets](self, "contentInsets");
        if (v11 > 8.0)
          v11 = 8.0;
        objc_msgSend(a3, "setCenter:", v8, v10 - v11);
      }
    }
  }
}

- (void)_transformPreferredLayoutAttributes:(id)a3 interactionState:(id)a4
{
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 && (*((_WORD *)a3 + 144) & 1) != 0)
  {
    -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      v10 = *(id *)(v8 + 32);
      if (v10)
        goto LABEL_5;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = a3;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "No list section data present in the preferred attributes from the cell. Attrs: %@", buf, 0xCu);
      }

    }
    else
    {
      v20 = _transformPreferredLayoutAttributes_interactionState____s_category;
      if (!_transformPreferredLayoutAttributes_interactionState____s_category)
      {
        v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&_transformPreferredLayoutAttributes_interactionState____s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = a3;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "No list section data present in the preferred attributes from the cell. Attrs: %@", buf, 0xCu);
      }
    }
    -[_UICollectionViewListLayoutSection _generateListSectionDataForLayoutAttributes:interactionState:](self, "_generateListSectionDataForLayoutAttributes:interactionState:", a3, a4);
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v10)
LABEL_5:
      v11 = (void *)v10[1];
    else
      v11 = 0;
    v12 = v11;
    if (!objc_msgSend(v12, "topSeparatorVisibility"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 1561, CFSTR("Separator configuration from preferred attributes of cell has unresolved top separator visibility. %@"), a3);

    }
    if (!objc_msgSend(v12, "bottomSeparatorVisibility"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 1562, CFSTR("Separator configuration from preferred attributes of cell has unresolved bottom separator visibility. %@"), a3);

    }
    -[_UICollectionViewListLayoutSectionConfiguration _itemSeparatorHandler](self->_configuration, "_itemSeparatorHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(a3, "indexPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "copy");
      ((void (**)(_QWORD, void *, void *))v13)[2](v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");

      objc_msgSend(v17, "_replaceAutomaticValuesWithValuesFromConfiguration:", v12);
      -[UIViewAnimationContext setViewAnimations:]((uint64_t)v10, v17);

    }
    -[UICollectionViewLayoutAttributes _setPreferredSizingData:]((uint64_t)a3, v10);
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v9, 0);

  }
}

- (void)_transformFittingLayoutAttributes:(id)a3 interactionState:(id)a4
{
  void *v6;
  void *v7;

  if (a3 && (*((_WORD *)a3 + 144) & 1) != 0)
  {
    -[_UICollectionViewListLayoutSection _generateListSectionDataForLayoutAttributes:interactionState:](self, "_generateListSectionDataForLayoutAttributes:interactionState:", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v7, v6);

  }
  -[_UICollectionViewListLayoutSection _updateMaxWidthForLayoutAttributes:](self, "_updateMaxWidthForLayoutAttributes:", a3, a4);
}

- (NSDirectionalEdgeInsets)_sectionPreferredTopSeparatorInsetsWithBottomInsets:(NSDirectionalEdgeInsets)a3 hasCustomInsets:(BOOL *)a4
{
  double trailing;
  double leading;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  char v16;
  double v17;
  BOOL v18;
  double v19;
  char v20;
  double v21;
  double v22;
  void *v24;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  leading = a3.leading;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.top, a3.leading, a3.bottom);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 1494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hasCustomInsets != nil"));

  }
  -[_UICollectionViewListLayoutSectionConfiguration _separatorConfigurationNoCopy](self->_configuration, "_separatorConfigurationNoCopy", a3.top, a3.leading, a3.bottom);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topSeparatorInsets");
  v10 = v9;
  v12 = v11;

  v13 = fabs(v10 + -1.79769313e308);
  v14 = fabs(v10 + 1.0) > 2.22044605e-16 && v13 > 2.22044605e-16;
  if (v14)
    v15 = v10;
  else
    v15 = leading;
  v16 = !v14;
  v17 = fabs(v12 + -1.79769313e308);
  v18 = fabs(v12 + 1.0) > 2.22044605e-16 && v17 > 2.22044605e-16;
  if (v18)
    v19 = v12;
  else
    v19 = trailing;
  v20 = !v18;
  *a4 = v16 & v20 ^ 1;
  v21 = 0.0;
  v22 = 0.0;
  result.trailing = v19;
  result.bottom = v22;
  result.leading = v15;
  result.top = v21;
  return result;
}

- (id)_separatorConfigurationForItemAtIndexPath:(id)a3 withSelectionGrouping:(unint64_t)a4 considerNextCellGrouping:(BOOL)a5 interactionState:(id)a6
{
  _BOOL8 v7;
  void *v11;
  int v12;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  BOOL v33;
  double v34;
  _BOOL4 v35;
  int64_t v36;
  uint64_t v37;
  int64_t v38;
  int64_t v39;
  unint64_t v40;
  NSObject *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _UICollectionViewListLayoutSection *v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  NSObject *v50;
  NSObject *v52;
  NSObject *v53;
  _BYTE v54[24];
  uint64_t v55;

  v7 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  -[_UICollectionViewListLayoutSectionConfiguration _separatorConfiguration](self->_configuration, "_separatorConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UICollectionViewLayoutInteractionStateModule itemAtIndexPathIsBeingReordered:]((uint64_t)a6, a3);
  -[_UICollectionViewListLayoutSection _sectionPreferredBottomSeparatorInsetsForIndexPath:](self, "_sectionPreferredBottomSeparatorInsetsForIndexPath:", a3);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  if (v12)
  {
    v54[0] = 0;
    -[_UICollectionViewListLayoutSection _sectionPreferredTopSeparatorInsetsWithBottomInsets:hasCustomInsets:](self, "_sectionPreferredTopSeparatorInsetsWithBottomInsets:hasCustomInsets:", v54, v13, v14, v15, v16);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v11, "setBottomSeparatorInsets:", v17, v18, v19, v20);
    objc_msgSend(v11, "setTopSeparatorInsets:", v22, v24, v26, v28);
    objc_msgSend(v11, "setBottomSeparatorVisibility:", 2);
    objc_msgSend(v11, "setTopSeparatorVisibility:", 2);
    return v11;
  }
  if (v14 == -1000.0 && v16 == -1000.0)
    objc_msgSend(v11, "setBottomSeparatorVisibility:", 2);
  if (!objc_msgSend(v11, "bottomSeparatorVisibility"))
  {
    if (-[_UICollectionViewListLayoutSection _shouldHideBottomSeparatorAtIndexPath:forGrouping:considerNextCellGrouping:interactionState:](self, "_shouldHideBottomSeparatorAtIndexPath:forGrouping:considerNextCellGrouping:interactionState:", a3, a4, v7, a6))
    {
      v29 = 2;
    }
    else
    {
      v29 = 1;
    }
    objc_msgSend(v11, "setBottomSeparatorVisibility:", v29);
  }
  if (!objc_msgSend(v11, "topSeparatorVisibility"))
  {
    v30 = objc_msgSend(v11, "bottomSeparatorVisibility");
    if (a4 && v30 == 2
      || -[_UICollectionViewListLayoutSection _shouldHideTopSeparatorAtIndexPath:interactionState:](self, "_shouldHideTopSeparatorAtIndexPath:interactionState:", a3, a6))
    {
      v31 = 2;
    }
    else
    {
      v31 = 1;
    }
    objc_msgSend(v11, "setTopSeparatorVisibility:", v31);
  }
  v32 = -[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader");
  v33 = v32 && objc_msgSend(a3, "item") == 0;
  -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
  v35 = v34 > 0.0
     && -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle") == 1;
  if (-[_UICollectionViewListLayoutSection __isLastItemInSection:](self, "__isLastItemInSection:", a3))
  {
    v36 = -[_UICollectionViewListLayoutSection _separatorInsetBehaviorAtBottom:ofSection:interactionState:](self, "_separatorInsetBehaviorAtBottom:ofSection:interactionState:", 1, objc_msgSend(a3, "section"), a6);
  }
  else
  {
    if (v35)
      v36 = 2;
    else
      v36 = 0;
    if (v33)
      goto LABEL_33;
  }
  if (!v36)
  {
LABEL_33:
    objc_msgSend(v11, "setBottomSeparatorInsets:", v17, v18, v19, v20);
    goto LABEL_34;
  }
  if (v36 == 2)
  {
    objc_msgSend(v11, "_insetsForBoundarySeparators");
    -[_UICollectionViewListLayoutSection _effectiveBoundarySeparatorInsets:](self, "_effectiveBoundarySeparatorInsets:");
    objc_msgSend(v11, "setBottomSeparatorInsets:");
    objc_msgSend(v11, "_setIgnoreBottomSeparatorInsetsFromCell:", 1);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v54 = 134217984;
      *(_QWORD *)&v54[4] = v36;
      _os_log_fault_impl(&dword_185066000, v52, OS_LOG_TYPE_FAULT, "The separator at the bottom of list sections does not support behavior %ld", v54, 0xCu);
    }

  }
  else
  {
    v49 = _MergedGlobals_87;
    if (!_MergedGlobals_87)
    {
      v49 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v49, (unint64_t *)&_MergedGlobals_87);
    }
    v50 = *(NSObject **)(v49 + 8);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v54 = 134217984;
      *(_QWORD *)&v54[4] = v36;
      _os_log_impl(&dword_185066000, v50, OS_LOG_TYPE_ERROR, "The separator at the bottom of list sections does not support behavior %ld", v54, 0xCu);
    }
  }
LABEL_34:
  v37 = objc_msgSend(a3, "item");
  if (v32)
  {
    if (v37 == 1)
      goto LABEL_36;
LABEL_45:
    if (v35)
      goto LABEL_46;
LABEL_47:
    v54[0] = 0;
    objc_msgSend(v11, "bottomSeparatorInsets", *(_QWORD *)v54);
    -[_UICollectionViewListLayoutSection _sectionPreferredTopSeparatorInsetsWithBottomInsets:hasCustomInsets:](self, "_sectionPreferredTopSeparatorInsetsWithBottomInsets:hasCustomInsets:", v54);
    objc_msgSend(v11, "setTopSeparatorInsets:");
    v47 = v54[0];
    v48 = v11;
LABEL_55:
    objc_msgSend(v48, "_setIgnoreTopSeparatorInsetsFromCell:", v47);
    return v11;
  }
  if (v37)
    goto LABEL_45;
LABEL_36:
  v38 = -[_UICollectionViewListLayoutSection _separatorInsetBehaviorAtBottom:ofSection:interactionState:](self, "_separatorInsetBehaviorAtBottom:ofSection:interactionState:", 0, objc_msgSend(a3, "section"), a6);
  if (!v38)
    goto LABEL_47;
  v39 = v38;
  if (v38 == 1)
  {
    v43 = 1.79769313e308;
    v42 = 0.0;
    v44 = 0.0;
    v46 = self;
    v45 = 1.79769313e308;
    goto LABEL_54;
  }
  if (v38 == 2)
  {
LABEL_46:
    objc_msgSend(v11, "_insetsForBoundarySeparators");
    v46 = self;
LABEL_54:
    -[_UICollectionViewListLayoutSection _effectiveBoundarySeparatorInsets:](v46, "_effectiveBoundarySeparatorInsets:", v42, v43, v44, v45);
    objc_msgSend(v11, "setTopSeparatorInsets:");
    v48 = v11;
    v47 = 1;
    goto LABEL_55;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v54 = 134217984;
      *(_QWORD *)&v54[4] = v39;
      _os_log_fault_impl(&dword_185066000, v53, OS_LOG_TYPE_FAULT, "The separator at the top of list sections does not support behavior %ld", v54, 0xCu);
    }

  }
  else
  {
    v40 = qword_1EDDCA1B0;
    if (!qword_1EDDCA1B0)
    {
      v40 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v40, (unint64_t *)&qword_1EDDCA1B0);
    }
    v41 = *(NSObject **)(v40 + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v54 = 134217984;
      *(_QWORD *)&v54[4] = v39;
      _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_ERROR, "The separator at the top of list sections does not support behavior %ld", v54, 0xCu);
    }
  }
  return v11;
}

- (void)_configureLayoutAttributes:(id)a3 forSeparatorAtBottom:(BOOL)a4 preferredConfiguration:(id)a5 interactionState:(id)a6
{
  _BOOL4 v8;
  uint64_t v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  char v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int v43;
  void *v44;
  int v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;

  v8 = a4;
  objc_msgSend(a3, "indexPath");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    v12 = *((_QWORD *)a3 + 38);
  else
    v12 = 0;
  v13 = a5;
  if (!v13)
  {
    -[_UICollectionViewListLayoutSection _separatorConfigurationForItemAtIndexPath:withSelectionGrouping:considerNextCellGrouping:interactionState:](self, "_separatorConfigurationForItemAtIndexPath:withSelectionGrouping:considerNextCellGrouping:interactionState:", v51, 0, 0, a6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v13, "topSeparatorVisibility"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "indexPath");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 2009, CFSTR("topSeparatorVisibility for %@ is unresolved in the list section data, which is unsupported. This is a UIKit bug."), v48);

  }
  if (!objc_msgSend(v13, "bottomSeparatorVisibility"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "indexPath");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 2010, CFSTR("bottomSeparatorVisibility for %@ is unresolved in the list section data, which is unsupported. This is a UIKit bug."), v50);

  }
  v14 = -[_UICollectionViewLayoutInteractionStateModule itemAtIndexPathIsSelected:]((uint64_t)a6, v51);
  -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutItemSolver setSolveResult:]((uint64_t)v15, v16);

  objc_msgSend(v13, "visualEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutListAttributes setSeparatorVisualEffect:]((uint64_t)v15, v17);

  if (v8)
  {
    objc_msgSend(a3, "setHidden:", objc_msgSend(v13, "bottomSeparatorVisibility") == 2);
    objc_msgSend(v13, "bottomSeparatorInsets");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(a3, "frame");
    objc_msgSend(a3, "setFrame:", v21 + v26, v19 + v27, v28 - (v21 + v25), v29 - (v19 + v23));
    if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v30 = v14;
    else
      v30 = 0;
    if ((v30 & 1) == 0)
      goto LABEL_20;
  }
  else
  {
    objc_msgSend(a3, "setHidden:", objc_msgSend(v13, "topSeparatorVisibility") == 2);
    objc_msgSend(v13, "topSeparatorInsets");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    objc_msgSend(a3, "frame");
    objc_msgSend(a3, "setFrame:", v34 + v39, v32 + v40, v41 - (v34 + v38), v42 - (v32 + v36));
    if ((unint64_t)(v12 - 3) < 2)
      v43 = v14;
    else
      v43 = 0;
    if (v43 != 1)
      goto LABEL_20;
  }
  objc_msgSend(v13, "multipleSelectionColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutItemSolver setSolveResult:]((uint64_t)v15, v44);

LABEL_20:
  v45 = objc_msgSend(a3, "isHidden");
  v46 = 1.0;
  if (v45)
    v46 = 0.0;
  objc_msgSend(a3, "setAlpha:", v46);

}

- (BOOL)_shouldHideTopSeparatorAtIndexPath:(id)a3 interactionState:(id)a4
{
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  -[_UICollectionViewListLayoutSectionConfiguration _separatorConfigurationNoCopy](self->_configuration, "_separatorConfigurationNoCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "topSeparatorVisibility");

  if (v8 == 1)
    return 0;
  if (v8 == 2)
    return 1;
  v9 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
  -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 6)
    return 1;
  v13 = -[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader");
  v14 = objc_msgSend(a3, "item");
  v15 = v14;
  if (v13)
  {
    if (!objc_msgSend(a3, "item") || v15 == 1)
    {
      if (v15 != 1)
        return 1;
      return !-[_UICollectionViewListLayoutSection _shouldDrawSeparatorAtBottom:ofSection:interactionState:](self, "_shouldDrawSeparatorAtBottom:ofSection:interactionState:", 0, objc_msgSend(a3, "section"), a4);
    }
  }
  else if (!v14)
  {
    return !-[_UICollectionViewListLayoutSection _shouldDrawSeparatorAtBottom:ofSection:interactionState:](self, "_shouldDrawSeparatorAtBottom:ofSection:interactionState:", 0, objc_msgSend(a3, "section"), a4);
  }
  -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
  return v16 <= 0.0 || v9 != 1;
}

- (BOOL)_shouldHideBottomSeparatorAtIndexPath:(id)a3 forGrouping:(unint64_t)a4 considerNextCellGrouping:(BOOL)a5 interactionState:(id)a6
{
  _BOOL4 v7;
  void *v12;
  uint64_t v13;
  double v14;
  BOOL v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  int64_t v20;
  _BOOL4 v21;
  _BOOL4 v22;
  char v23;
  double v24;
  void *v25;
  double v27;
  double v28;
  void *v30;

  v7 = a5;
  -[_UICollectionViewListLayoutSectionConfiguration _separatorConfigurationNoCopy](self->_configuration, "_separatorConfigurationNoCopy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_hidingBehavior");
  if (!v13)
  {
    v19 = objc_msgSend(v12, "bottomSeparatorVisibility");
    if (v19 == 1)
      goto LABEL_23;
    if (v19 == 2)
    {
LABEL_50:
      v16 = 1;
      goto LABEL_51;
    }
    v20 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
    if (objc_msgSend(a3, "item"))
      v21 = 0;
    else
      v21 = -[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader");
    v22 = -[_UICollectionViewListLayoutSection __isLastItemInSection:](self, "__isLastItemInSection:", a3);
    if (v20 == 3)
    {
      if (v21 && v22)
        v13 = 3;
      else
        v13 = 2;
    }
    else
    {
      if (v21)
        v13 = 2;
      else
        v13 = 3;
      if (!v21 && v22)
      {
        if (-[_UICollectionViewListLayoutSection _shouldDrawSeparatorAtBottom:ofSection:interactionState:](self, "_shouldDrawSeparatorAtBottom:ofSection:interactionState:", 1, objc_msgSend(a3, "section"), a6))
        {
          v13 = 3;
        }
        else
        {
          v13 = 2;
        }
      }
      v23 = v20 != 2 || v21;
      if ((v23 & 1) == 0)
      {
        -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
        if (v24 > 0.0)
          v13 = 2;
      }
    }
    -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "userInterfaceIdiom") == 6 && v20 == 0)
    {
      -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
      v28 = v27;

      if (v28 > 0.0)
        goto LABEL_50;
    }
    else
    {

    }
  }
  if (v13 == 2)
    goto LABEL_50;
  if (v13 == 1)
    goto LABEL_23;
  if ((unint64_t)(v13 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 1955, CFSTR("Hiding behavior resolved to unsupported type"));

  }
  -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
  v16 = v14 > 0.0 || v13 == 4;
  if (!v7
    || v14 > 0.0
    || (objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(a3, "item") + 1, objc_msgSend(a3, "section")), v17 = (void *)objc_claimAutoreleasedReturnValue(), v18 = -[_UICollectionViewLayoutInteractionStateModule selectionGroupingForItemAtIndexPath:]((uint64_t)a6, v17)- 1, v17, v18 > 1))
  {
    if (a4 - 2 < 2)
      goto LABEL_51;
    if (a4 != 4)
    {
      if (a4 == 1)
      {
        v16 = v13 == 3;
        goto LABEL_51;
      }
LABEL_23:
      v16 = 0;
      goto LABEL_51;
    }
  }
  if (v13 == 3)
    v16 = 1;
LABEL_51:

  return v16;
}

- (NSDirectionalEdgeInsets)_sectionPreferredBottomSeparatorInsetsForIndexPath:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  NSDirectionalEdgeInsets result;

  -[_UICollectionViewListLayoutSectionConfiguration _separatorConfigurationNoCopy](self->_configuration, "_separatorConfigurationNoCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomSeparatorInsets");
  v7 = v6;
  v9 = v8;

  -[_UICollectionViewListLayoutSectionConfiguration separatorInsetProvider](self->_configuration, "separatorInsetProvider");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, a3);
    v7 = v12;
    v9 = v13;
  }
  -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0.0;
  if (objc_msgSend(v14, "userInterfaceIdiom") != 6)
  {
    -[_UICollectionViewListLayoutSection _defaultDirectionalLayoutMarginsInsideSection](self, "_defaultDirectionalLayoutMarginsInsideSection");
    v15 = v16;
  }

  v17 = fabs(v7 + -1.79769313e308);
  if (fabs(v7 + 1.0) <= 2.22044605e-16 || v17 <= 2.22044605e-16)
    v7 = v15;
  v19 = fabs(v9 + -1.79769313e308);
  if (fabs(v9 + 1.0) <= 2.22044605e-16 || v19 <= 2.22044605e-16)
    v9 = 0.0;

  v21 = 0.0;
  v22 = 0.0;
  v23 = v7;
  v24 = v9;
  result.trailing = v24;
  result.bottom = v22;
  result.leading = v23;
  result.top = v21;
  return result;
}

- (void)_configureLayoutAttributesWithInsetGroupedMasking:(id)a3 stylesFirstItemAsHeader:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v4 = a4;
  objc_msgSend(a3, "indexPath");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v17, "item");
  -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
  if (v8 <= 0.0)
  {
    if (v4)
    {
      v10 = 15;
      if (v7)
        v10 = 0;
      if (v7 == 1)
        v9 = 3;
      else
        v9 = v10;
      if (v7)
      {
        -[NSCollectionLayoutEnvironment_Private _dataSourceSnapshot](self->_layoutEnvironment, "_dataSourceSnapshot");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v7 == objc_msgSend(v11, "numberOfItemsInSection:", objc_msgSend(v17, "section")) - 1;

        if (v12)
          v9 |= 0xCuLL;
      }
    }
    else
    {
      if (v7)
        v13 = 0;
      else
        v13 = 3;
      -[NSCollectionLayoutEnvironment_Private _dataSourceSnapshot](self->_layoutEnvironment, "_dataSourceSnapshot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "numberOfItemsInSection:", objc_msgSend(v17, "section")) - 1;

      if (v7 == v15)
        v9 = v13 | 0xC;
      else
        v9 = v13;
    }
  }
  else if (v4 && v7 == 0)
  {
    v9 = 0;
  }
  else
  {
    v9 = 15;
  }
  if (a3)
    *((_WORD *)a3 + 144) |= 0x10u;
  -[UICollectionViewLayoutAttributes _setMaskedCorners:]((uint64_t)a3, v9);
  -[_UICollectionViewListLayoutSection _effectiveCornerRadius](self, "_effectiveCornerRadius");
  if (a3)
    *((_QWORD *)a3 + 39) = v16;

}

- (BOOL)__isLastItemInSection:(id)a3
{
  id v3;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v5 = objc_msgSend(a3, "item");
  -[NSCollectionLayoutEnvironment_Private _dataSourceSnapshot](self->_layoutEnvironment, "_dataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v5 == objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v3, "section")) - 1;

  return (char)v3;
}

- (double)_effectiveCornerRadius
{
  double result;
  void *v4;

  -[_UICollectionViewListLayoutSectionConfiguration cornerRadius](self->_configuration, "cornerRadius");
  if (result == 1.79769313e308)
  {
    -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInterfaceIdiom");

    return 10.0;
  }
  return result;
}

- (int64_t)_separatorInsetBehaviorAtBottom:(BOOL)a3 ofSection:(int64_t)a4 interactionState:(id)a5
{
  int64_t v9;
  int64_t v10;

  v9 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
  v10 = v9;
  if (a3)
  {
    if ((v9 | 4) != 4
      || -[_UICollectionViewListLayoutSection _hasHeaderFooterBelowLastItemInSection:interactionState:](self, "_hasHeaderFooterBelowLastItemInSection:interactionState:", a4, a5)&& (unint64_t)(-[_UICollectionViewListLayoutSection _headerFooterPinningBehavior](self, "_headerFooterPinningBehavior")- 1) >= 2)
    {
      return 2;
    }
    return 0;
  }
  if (-[_UICollectionViewListLayoutSection _adjustsLayoutToDrawTopSeparatorInSection:interactionState:](self, "_adjustsLayoutToDrawTopSeparatorInSection:interactionState:", a4, a5))
  {
    return 0;
  }
  if ((unint64_t)(v10 - 1) >= 3)
    return 1;
  else
    return 2;
}

- (BOOL)_shouldDrawSeparatorAtBottom:(BOOL)a3 ofSection:(int64_t)a4 interactionState:(id)a5
{
  int64_t v9;
  _BOOL4 v11;
  int64_t v12;
  double v13;

  v9 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
  if ((unint64_t)(v9 - 2) < 2)
    goto LABEL_19;
  if (v9 != 4 && v9 != 0)
    goto LABEL_14;
  if (!a3)
  {
    if (-[_UICollectionViewListLayoutSection _adjustsLayoutToDrawTopSeparatorInSection:interactionState:](self, "_adjustsLayoutToDrawTopSeparatorInSection:interactionState:", a4, a5)|| -[_UICollectionViewListLayoutSectionConfiguration _hasHeaderOrFirstItemStyledAsHeader](self->_configuration, "_hasHeaderOrFirstItemStyledAsHeader")&& -[_UICollectionViewListLayoutSection _headerFooterPinningBehavior](self, "_headerFooterPinningBehavior") == 1&& ((-[NSCollectionLayoutSection contentInsets](self, "contentInsets"), v13 == 0.0)|| -[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader")))
    {
LABEL_14:
      LOBYTE(v12) = 1;
      return v12;
    }
LABEL_19:
    LOBYTE(v12) = 0;
    return v12;
  }
  v11 = -[_UICollectionViewListLayoutSection _hasHeaderFooterBelowLastItemInSection:interactionState:](self, "_hasHeaderFooterBelowLastItemInSection:interactionState:", a4, a5);
  if (!v11
    || (v12 = -[_UICollectionViewListLayoutSection _headerFooterPinningBehavior](self, "_headerFooterPinningBehavior"),
        v12 != 1))
  {
    LOBYTE(v12) = -[_UICollectionViewListLayoutSection _headerFooterPinningBehavior](self, "_headerFooterPinningBehavior") != 2&& !v11;
  }
  return v12;
}

- (NSDirectionalEdgeInsets)_effectiveBoundarySeparatorInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double leading;
  double v5;
  double v6;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  leading = a3.leading;
  -[_UICollectionViewListLayoutSection _defaultDirectionalLayoutMarginsInsideSection](self, "_defaultDirectionalLayoutMarginsInsideSection", a3.top, a3.leading, a3.bottom);
  v6 = fabs(leading + -1.79769313e308);
  if (fabs(leading + 1.0) > 2.22044605e-16 && v6 > 2.22044605e-16)
    v5 = leading;
  v8 = fabs(trailing + -1.79769313e308);
  v9 = fabs(trailing + 1.0) > 2.22044605e-16 && v8 > 2.22044605e-16;
  v10 = 0.0;
  if (v9)
    v11 = trailing;
  else
    v11 = 0.0;
  v12 = 0.0;
  result.trailing = v11;
  result.bottom = v12;
  result.leading = v5;
  result.top = v10;
  return result;
}

- (BOOL)_adjustsLayoutToDrawTopSeparatorInSection:(int64_t)a3 interactionState:(id)a4
{
  return !-[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle")
      && !-[_UICollectionViewListLayoutSectionConfiguration _hasHeaderOrFirstItemStyledAsHeader](self->_configuration, "_hasHeaderOrFirstItemStyledAsHeader")&& -[_UICollectionViewLayoutInteractionStateModule _shouldAdjustLayoutToDrawTopSeparatorInSection:]((uint64_t)a4, a3);
}

- (BOOL)_hasHeaderFooterBelowLastItemInSection:(int64_t)a3 interactionState:(id)a4
{
  double v8;
  BOOL v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[NSCollectionLayoutSection contentInsets](self, "contentInsets");
  if (v8 > 0.0)
    return 0;
  if (-[_UICollectionViewListLayoutSectionConfiguration _hasFooter](self->_configuration, "_hasFooter"))
    return 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94___UICollectionViewListLayoutSection__hasHeaderFooterBelowLastItemInSection_interactionState___block_invoke;
  v11[3] = &unk_1E16E8C90;
  v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  -[_UICollectionViewLayoutInteractionStateModule enumerateSectionsAfterSectionIndex:enumerator:]((uint64_t)a4, a3, v11);
  v9 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (double)_paddingToBoundarySupplementaries
{
  double v3;
  double v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;

  v3 = 0.0;
  if (-[_UICollectionViewListLayoutSectionConfiguration _hasSupplementaryAsHeader](self->_configuration, "_hasSupplementaryAsHeader"))
  {
    -[_UICollectionViewListLayoutSectionConfiguration headerTopPadding](self->_configuration, "headerTopPadding");
    v3 = v4;
    if (v4 == 1.79769313e308)
    {
      v5 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
      if (v5 == 3)
      {
        -[_UICollectionViewListLayoutSection _constants](self, "_constants");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "defaultSidebarPaddingAboveSectionHeadersWithFallbackTableStyle:", 1);
      }
      else
      {
        if (v5 == 2)
          v6 = 2;
        else
          v6 = v5 == 1;
        -[_UICollectionViewListLayoutSection _layoutEnvironment](self, "_layoutEnvironment");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "_sectionIndex");

        -[_UICollectionViewListLayoutSection _constants](self, "_constants");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v8)
          objc_msgSend(v9, "defaultPaddingAboveSectionHeadersForTableStyle:", v6);
        else
          objc_msgSend(v9, "defaultPaddingAboveFirstSectionHeaderForTableStyle:", v6);
      }
      v3 = v11;

    }
  }
  return v3;
}

- (NSCollectionLayoutEnvironment_Private)_layoutEnvironment
{
  return self->_layoutEnvironment;
}

- (BOOL)_pinnedSupplementariesShouldOverlap
{
  _BOOL4 v3;

  v3 = -[_UICollectionViewListLayoutSectionConfiguration _hasSupplementaryAsHeader](self->_configuration, "_hasSupplementaryAsHeader");
  if (v3)
    LOBYTE(v3) = (unint64_t)(-[_UICollectionViewListLayoutSection _headerFooterPinningBehavior](self, "_headerFooterPinningBehavior")- 1) < 2;
  return v3;
}

- (int64_t)_headerFooterPinningBehavior
{
  return self->_headerFooterPinningBehavior;
}

- (id)_generateListSectionDataForLayoutAttributes:(id)a3 interactionState:(id)a4
{
  void *v6;
  _UICollectionLayoutListSectionData *v7;
  unint64_t v8;
  void *v9;

  objc_msgSend(a3, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(_UICollectionLayoutListSectionData);
  v8 = -[_UICollectionViewLayoutInteractionStateModule selectionGroupingForItemAtIndexPath:]((uint64_t)a4, v6);
  if (v7)
    v7->_selectionGrouping = v8;
  -[_UICollectionViewListLayoutSection _separatorConfigurationForItemAtIndexPath:withSelectionGrouping:considerNextCellGrouping:interactionState:](self, "_separatorConfigurationForItemAtIndexPath:withSelectionGrouping:considerNextCellGrouping:interactionState:", v6, v8, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewAnimationContext setViewAnimations:]((uint64_t)v7, v9);

  return v7;
}

- (_UICollectionViewListLayoutSection)initWithConfiguration:(id)a3 layoutEnvironment:(id)a4
{
  int v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  _UICollectionViewEnvironmentAdapter *v13;
  void *v14;
  _UICollectionViewEnvironmentAdapter *v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  _UICollectionViewListLayoutSection *v26;
  void *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v33;
  objc_super v34;

  v8 = a4 != 0;
  objc_msgSend(a3, "_collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v8 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 764, CFSTR("SPI inconsistency detected. Old and new SPI is being mixed. Please initialize your configuration with -init and then initialize the section with -initWithConfiguration:layoutEnvironement:, passing in the layout environment you receive from the section provider of your compositional layout."));

    if (a4)
      goto LABEL_3;
LABEL_5:
    v13 = [_UICollectionViewEnvironmentAdapter alloc];
    objc_msgSend(a3, "_collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[_UICollectionViewEnvironmentAdapter initWithCollectionView:](v13, "initWithCollectionView:", v14);
    -[_UICollectionViewEnvironmentAdapter createEnvironment](v15, "createEnvironment");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v11 = a4;
LABEL_6:
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 768, CFSTR("Incompatible layout environment. Make sure to pass the layout environment received from the compositional layout's section provider as is."));

  }
  v16 = v11;
  v17 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v17, "_generateLayoutGroup:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "appearanceStyle") - 1;
  if (v19 > 2)
    v20 = 0;
  else
    v20 = qword_186684DD8[v19];
  objc_msgSend(v17, "_constants");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "defaultPaddingBetweenRowsForTableStyle:", v20);
  v23 = v22;

  if (v23 > 0.0)
  {
    objc_msgSend(v17, "_itemHeights");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(off_1E16799B0, "fixedSpacing:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setInterItemSpacing:", v25);

    }
  }
  v34.receiver = self;
  v34.super_class = (Class)_UICollectionViewListLayoutSection;
  v26 = -[NSCollectionLayoutSection initWithLayoutGroup:](&v34, sel_initWithLayoutGroup_, v18);
  if (v26)
  {
    if (v23 > 0.0)
    {
      objc_msgSend(v17, "_itemHeights");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        -[NSCollectionLayoutSection setInterGroupSpacing:](v26, "setInterGroupSpacing:", v23);
    }
    objc_storeStrong((id *)&v26->_layoutEnvironment, v11);
    objc_storeStrong((id *)&v26->_configuration, v17);
    v28 = objc_msgSend(v17, "appearanceStyle");
    objc_msgSend(v17, "headerTopPadding");
    if (v29 == 0.0)
    {
      v26->_headerFooterPinningBehavior = 0;
    }
    else
    {
      if ((unint64_t)(v28 - 1) > 2)
        v30 = 0;
      else
        v30 = qword_186684DD8[v28 - 1];
      -[_UICollectionViewListLayoutSection _constants](v26, "_constants");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v26->_headerFooterPinningBehavior = objc_msgSend(v31, "defaultHeaderFooterPinningBehaviorForTableStyle:", v30);

    }
    objc_msgSend(v17, "_addSupplementaryItemsToLayout:", v26);
    -[NSCollectionLayoutSection setContentInsetsReference:](v26, "setContentInsetsReference:", objc_msgSend(v17, "_defaultContentInsetsReference"));
    -[_UICollectionViewListLayoutSection _defaultSectionContentInsetsForAppearanceStyle:](v26, "_defaultSectionContentInsetsForAppearanceStyle:", v28);
    objc_msgSend(v17, "_sectionContentInsetsForAppearanceStyleWithDefaultInsets:headerFootersAreChromeless:", (unint64_t)(v26->_headerFooterPinningBehavior - 1) < 2);
    -[NSCollectionLayoutSection setContentInsets:](v26, "setContentInsets:");
  }

  return v26;
}

- (NSDirectionalEdgeInsets)_defaultSectionContentInsetsForAppearanceStyle:(int64_t)a3
{
  _UICollectionViewListLayoutSection *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  NSDirectionalEdgeInsets result;

  v4 = self;
  if ((unint64_t)(a3 - 2) < 3)
    goto LABEL_2;
  v12 = 0.0;
  if (a3)
  {
    v10 = 0.0;
    v8 = 0.0;
    v6 = 0.0;
  }
  else
  {
    -[NSCollectionLayoutEnvironment_Private traitCollection](self->_layoutEnvironment, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    v10 = 0.0;
    v8 = 0.0;
    v6 = 0.0;
    if (v14 == 6)
    {
      self = v4;
LABEL_2:
      -[_UICollectionViewListLayoutSection _effectiveCollectionViewLayoutMarginsForAppearanceStyle:forUseAsContentInsets:](self, "_effectiveCollectionViewLayoutMarginsForAppearanceStyle:forUseAsContentInsets:");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
    }
  }
  -[NSCollectionLayoutEnvironment_Private traitCollection](v4->_layoutEnvironment, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 == 6)
  {
    -[NSCollectionLayoutEnvironment_Private container](v4->_layoutEnvironment, "container");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
    {
      v19 = *(void **)(v17 + 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("_UICollectionViewListLayoutSection.m"), 990, CFSTR("UIKit internal bug: missing layout container for environment: %@ section: %@"), v4->_layoutEnvironment, v4);

      v19 = 0;
    }
    v20 = v19;
    objc_msgSend(v20, "scrollAccessoryInsets");
    v22 = v21;

    -[NSCollectionLayoutEnvironment_Private traitCollection](v4->_layoutEnvironment, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutDirection");

    v6 = UIEdgeInsetsMax(10, v6, v8, v10, v12, v22);
    v8 = v24;
    v10 = v25;
    v12 = v26;

  }
  v27 = -[_UICollectionViewListLayoutSection _isRTL](v4, "_isRTL");
  if (v27)
    v28 = v12;
  else
    v28 = v8;
  if (v27)
    v29 = v8;
  else
    v29 = v12;
  v30 = v6;
  v31 = v10;
  result.trailing = v29;
  result.bottom = v31;
  result.leading = v28;
  result.top = v30;
  return result;
}

- (void)_configureLayoutAttributesForBackgroundDecoration:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[_UICollectionViewListLayoutSection _effectiveBackgroundColor](self, "_effectiveBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v6, v5);

  -[_UICollectionViewListLayoutSection _effectiveSectionHorizontalInsets](self, "_effectiveSectionHorizontalInsets");
  -[NSCollectionLayoutEnvironment_Private container](self->_layoutEnvironment, "container");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentSize");
  objc_msgSend(a3, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "section");

  -[_UICollectionViewListLayoutSection __isLastSection:](self, "__isLastSection:", v8);
  objc_msgSend(a3, "bounds");
  objc_msgSend(a3, "setBounds:");
  objc_msgSend(a3, "center");
  objc_msgSend(a3, "setCenter:");

}

- (id)_effectiveBackgroundColor
{
  void *v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;

  -[_UICollectionViewListLayoutSectionConfiguration _backgroundColor](self->_configuration, "_backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
    v5 = v4;
    if (v4 != 1 && v4 != 2)
    {
      if (v4 == 3)
      {
        -[_UICollectionViewListLayoutSection _constants](self, "_constants");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_opt_respondsToSelector();

        if ((v7 & 1) == 0)
        {
          +[UIColor _sidebarBackgroundColor](UIColor, "_sidebarBackgroundColor");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          return v3;
        }
        -[_UICollectionViewListLayoutSection _constants](self, "_constants");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "defaultSidebarBackgroundColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v5 = 0;
    }
    -[_UICollectionViewListLayoutSection _constants](self, "_constants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultBackgroundColorForTableViewStyle:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v3 = (void *)v9;

  }
  return v3;
}

- (BOOL)__isLastSection:(int64_t)a3
{
  void *v4;

  -[NSCollectionLayoutEnvironment_Private _dataSourceSnapshot](self->_layoutEnvironment, "_dataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "numberOfSections") - 1 == a3;

  return a3;
}

- (double)_alignedContentMarginGivenMargin:(double)a3
{
  void *v5;
  char v6;
  double v7;

  if ((unint64_t)(-[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle")- 3) <= 1&& -[_UICollectionViewListLayoutSection _hasHorizontalInsets](self, "_hasHorizontalInsets"))
  {
    -[_UICollectionViewListLayoutSection _constants](self, "_constants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();
    v7 = 0.0;
    if ((v6 & 1) != 0)
      objc_msgSend(v5, "defaultSidebarLayoutMarginsForElementsInsideSection");
    a3 = v7 + a3;

  }
  return a3;
}

- (BOOL)_useRoundedSwipeActions
{
  return -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle") != 2
      && -[_UICollectionViewListLayoutSection _hasHorizontalInsets](self, "_hasHorizontalInsets");
}

- (void)_updateMaxWidthForLayoutAttributes:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double *v12;

  if (!a3
    || (*((_WORD *)a3 + 144) & 3) != 0
    || -[NSCollectionLayoutSection supplementariesFollowContentInsets](self, "supplementariesFollowContentInsets"))
  {
    -[_UICollectionViewListLayoutSection _effectiveSectionHorizontalInsets](self, "_effectiveSectionHorizontalInsets");
  }
  else
  {
    -[_UICollectionViewListLayoutSection _effectiveSectionSupplementaryHorizontalInsets](self, "_effectiveSectionSupplementaryHorizontalInsets");
  }
  v7 = v5;
  v8 = v6;
  -[NSCollectionLayoutEnvironment_Private container](self->_layoutEnvironment, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentSize");
  v11 = v10;

  -[UICollectionViewLayoutAttributes _listAttributesCreatingIfNecessary](a3);
  v12 = (double *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v12[8] = fmax(v11 - v7 - v8, 0.0);

}

- (BOOL)_hasHorizontalInsets
{
  double v2;
  double v3;

  -[_UICollectionViewListLayoutSection _effectiveSectionHorizontalInsets](self, "_effectiveSectionHorizontalInsets");
  return v3 > 0.0 || v2 > 0.0;
}

- (NSDirectionalEdgeInsets)_effectiveSectionHorizontalInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSDirectionalEdgeInsets result;

  -[_UICollectionViewListLayoutSection _horizontalInsetsForInsetsReference:](self, "_horizontalInsetsForInsetsReference:", -[NSCollectionLayoutSection contentInsetsReference](self, "contentInsetsReference"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NSCollectionLayoutSection contentInsets](self, "contentInsets");
  v12 = v6 + v11;
  v14 = v10 + v13;
  v15 = v4;
  v16 = v8;
  result.trailing = v14;
  result.bottom = v16;
  result.leading = v12;
  result.top = v15;
  return result;
}

- (NSDirectionalEdgeInsets)_horizontalInsetsForInsetsReference:(int64_t)a3
{
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSDirectionalEdgeInsets result;

  -[NSCollectionLayoutEnvironment_Private container](self->_layoutEnvironment, "container");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)v6;
  if (v6)
  {
    if (a3)
      goto LABEL_5;
    v8 = *(void **)(v6 + 8);
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 1154, CFSTR("UIKit internal bug: missing layout container for environment: %@ section: %@"), self->_layoutEnvironment, self);

  if (!a3)
  {
    v8 = 0;
LABEL_4:
    v9 = v8;
    a3 = objc_msgSend(v9, "insetReference");

  }
LABEL_5:
  if (a3 == 4)
  {
    if (v7)
      v16 = (void *)v7[1];
    else
      v16 = 0;
    v13 = v16;
    objc_msgSend(v13, "readableContentInsets");
    goto LABEL_17;
  }
  if (a3 == 3)
  {
    if (v7)
      v17 = (void *)v7[1];
    else
      v17 = 0;
    v13 = v17;
    objc_msgSend(v13, "layoutMarginsInsets");
    goto LABEL_17;
  }
  v10 = 0.0;
  v11 = 0.0;
  if (a3 == 2)
  {
    if (v7)
      v12 = (void *)v7[1];
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend(v13, "safeAreaInsets");
LABEL_17:
    v18 = v14;
    v19 = v15;

    v11 = v18 + 0.0;
    v10 = v19 + 0.0;
  }

  v20 = 0.0;
  v21 = 0.0;
  v22 = v11;
  v23 = v10;
  result.trailing = v23;
  result.bottom = v21;
  result.leading = v22;
  result.top = v20;
  return result;
}

- (BOOL)prefersListSolver
{
  return 1;
}

- (void)_configureLayoutAttributesForPlainSupplementaryView:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  -[UIBarButtonItemGroup _items]((id *)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewListLayoutSectionConfiguration _headerElementKind](self->_configuration, "_headerElementKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (-[_UICollectionViewListLayoutSection _headerFooterPinningBehavior](self, "_headerFooterPinningBehavior") == 2)
    {
      objc_msgSend(a3, "indexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "section");

      if (a3)
      {
        if (!v9)
          *((_WORD *)a3 + 144) |= 0x800u;
      }
    }
  }
}

- (UIEdgeInsets)_defaultLayoutMarginsForSupplementaryViewWithLayoutAttributes:(id)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _BOOL4 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  _BOOL8 v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  _BOOL8 v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  UIEdgeInsets result;

  -[_UICollectionViewListLayoutSection _defaultLayoutMarginsInsideSection](self, "_defaultLayoutMarginsInsideSection");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIBarButtonItemGroup _items]((id *)a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewListLayoutSectionConfiguration _headerElementKind](self->_configuration, "_headerElementKind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if (v16)
  {
    -[_UICollectionViewListLayoutSectionConfiguration _layoutEnvironment](self->_configuration, "_layoutEnvironment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "userInterfaceIdiom") == 6)
    {
      v19 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");

      if (!v19)
      {
        v20 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle")- 1;
        if (v20 > 2)
          v21 = 0;
        else
          v21 = qword_186684DD8[v20];
        objc_msgSend(a3, "indexPath");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "section") == 0;

        -[_UICollectionViewListLayoutSection _constants](self, "_constants");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "defaultHeaderFooterLayoutMarginsForTableViewStyle:isHeader:isFirstSection:", v21, 1, v68);
        v7 = v69;
        v9 = v70;
        v11 = v71;
        v13 = v72;
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {

    }
  }
  if (!-[NSCollectionLayoutSection supplementariesFollowContentInsets](self, "supplementariesFollowContentInsets"))
  {
    v74 = v11;
    v75 = v9;
    v76 = v13;
    -[_UICollectionViewListLayoutSection _effectiveSectionHorizontalInsets](self, "_effectiveSectionHorizontalInsets");
    v23 = v22;
    v25 = v24;
    v26 = -[_UICollectionViewListLayoutSection _isRTL](self, "_isRTL");
    if (v26)
      v27 = v25;
    else
      v27 = v23;
    if (v26)
      v28 = v23;
    else
      v28 = v25;
    -[_UICollectionViewListLayoutSection _effectiveSectionSupplementaryHorizontalInsets](self, "_effectiveSectionSupplementaryHorizontalInsets");
    v30 = v29;
    v32 = v31;
    v33 = -[_UICollectionViewListLayoutSection _isRTL](self, "_isRTL");
    if (v33)
      v34 = v32;
    else
      v34 = v30;
    if (v33)
      v35 = v30;
    else
      v35 = v32;
    -[NSCollectionLayoutEnvironment_Private container](self->_layoutEnvironment, "container");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v36;
    if (v36)
    {
      v38 = *(void **)(v36 + 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 1073, CFSTR("UIKit internal bug: missing layout container for environment: %@ section: %@"), self->_layoutEnvironment, self);

      v38 = 0;
    }
    v39 = v38;
    objc_msgSend(v39, "safeAreaInsets");
    v41 = v40;
    v43 = v42;
    v44 = -[_UICollectionViewListLayoutSection _isRTL](self, "_isRTL");
    if (v44)
      v45 = v43;
    else
      v45 = v41;
    if (!v44)
      v41 = v43;

    v13 = v76;
    v46 = v75 + v27;
    v47 = v76 + v28;
    v48 = v45 - v27;
    v9 = v75;
    if (v46 >= v45)
      v48 = -0.0;
    v49 = v46 + v48;
    v50 = v41 - v28;
    if (v47 >= v41)
      v50 = -0.0;
    v51 = v47 + v50;
    if (v34 < v49)
    {
      v52 = v49 - v34;
      if (v34 < v45)
        v9 = v52 - (v45 - v34);
      else
        v9 = v52;
    }
    v11 = v74;
    if (v35 < v51)
    {
      v13 = v51 - v35;
      if (v35 < v41)
        v13 = v13 - (v41 - v35);
    }

  }
  if (_UIShouldApplyVerticalLayoutMarginsToListHeaderFooterViews())
  {
    v53 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle")
        - 1;
    if (v53 > 2)
      v54 = 0;
    else
      v54 = qword_186684DD8[v53];
    -[UIBarButtonItemGroup _items]((id *)a3);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewListLayoutSectionConfiguration _headerElementKind](self->_configuration, "_headerElementKind");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqualToString:", v56);

    objc_msgSend(a3, "indexPath");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "section") == 0;

    -[_UICollectionViewListLayoutSection _constants](self, "_constants");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "defaultHeaderFooterLayoutMarginsForTableViewStyle:isHeader:isFirstSection:", v54, v57, v59);
    v7 = v61;
    v11 = v62;
    goto LABEL_44;
  }
LABEL_45:
  v63 = v7;
  v64 = v9;
  v65 = v11;
  v66 = v13;
  result.right = v66;
  result.bottom = v65;
  result.left = v64;
  result.top = v63;
  return result;
}

- (NSDirectionalEdgeInsets)_effectiveSectionSupplementaryHorizontalInsets
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSDirectionalEdgeInsets result;

  if (-[NSCollectionLayoutSection supplementaryContentInsetsReference](self, "supplementaryContentInsetsReference"))
    v3 = -[NSCollectionLayoutSection supplementaryContentInsetsReference](self, "supplementaryContentInsetsReference");
  else
    v3 = -[NSCollectionLayoutSection contentInsetsReference](self, "contentInsetsReference");
  -[_UICollectionViewListLayoutSection _horizontalInsetsForInsetsReference:](self, "_horizontalInsetsForInsetsReference:", v3);
  result.trailing = v7;
  result.bottom = v6;
  result.leading = v5;
  result.top = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutEnvironment, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListLayoutSection;
  v4 = -[NSCollectionLayoutSection copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[_UICollectionViewListLayoutSectionConfiguration copy](self->_configuration, "copy");
    v6 = (void *)*((_QWORD *)v4 + 33);
    *((_QWORD *)v4 + 33) = v5;

    objc_storeStrong((id *)v4 + 35, self->_layoutEnvironment);
    *((_QWORD *)v4 + 34) = self->_headerFooterPinningBehavior;
  }
  return v4;
}

- (BOOL)_wantsSwipeActions
{
  return -[_UICollectionViewListLayoutSectionConfiguration _wantsSwipeActions](self->_configuration, "_wantsSwipeActions");
}

- (id)_invalidationContextForCellBackgroundOrBottomSeparatorChangeAtIndexPath:(id)a3 interactionState:(id)a4 separatorOnly:(BOOL)a5
{
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;

  if (a4)
    v7 = (objc_class *)*((_QWORD *)a4 + 2);
  else
    v7 = 0;
  v8 = objc_alloc_init(v7);
  objc_msgSend(v8, "_setIntent:", 10);
  if (a5 || objc_msgSend(a3, "item") < 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(a3, "item") - 1, objc_msgSend(a3, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", a3, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateDecorationElementsOfKind:atIndexPaths:", CFSTR("UICollectionViewListLayoutElementKindBottomSeparator"), v10);
  objc_msgSend(v8, "invalidateItemsAtIndexPaths:", v10);

  return v8;
}

- (_UICollectionViewListLayoutSection)initWithConfiguration:(id)a3
{
  return -[_UICollectionViewListLayoutSection initWithConfiguration:layoutEnvironment:](self, "initWithConfiguration:layoutEnvironment:", a3, 0);
}

- (BOOL)shouldRestrictOrthogonalAxisDuringInteractiveMovement
{
  return 1;
}

- (BOOL)_wantsBandSelectionVisuals
{
  return 0;
}

- (void)_updateStyleForSwipeActionsConfiguration:(id)a3
{
  double v5;

  if (a3)
  {
    if (!objc_msgSend(a3, "_swipeActionsStyle")
      && -[_UICollectionViewListLayoutSection _useRoundedSwipeActions](self, "_useRoundedSwipeActions"))
    {
      objc_msgSend(a3, "_setSwipeActionsStyle:", 2);
    }
    if (objc_msgSend(a3, "_swipeActionsStyle") == 2)
    {
      objc_msgSend(a3, "_roundedStyleCornerRadius");
      if (v5 == 0.0)
      {
        -[_UICollectionViewListLayoutSection _effectiveCornerRadius](self, "_effectiveCornerRadius");
        objc_msgSend(a3, "_setRoundedStyleCornerRadius:");
      }
    }
  }
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;

  -[_UICollectionViewListLayoutSectionConfiguration leadingSwipeActionsConfigurationProvider](self->_configuration, "leadingSwipeActionsConfigurationProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UICollectionViewListLayoutSectionConfiguration leadingSwipeActionsConfigurationProvider](self->_configuration, "leadingSwipeActionsConfigurationProvider");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;

  -[_UICollectionViewListLayoutSectionConfiguration trailingSwipeActionsConfigurationProvider](self->_configuration, "trailingSwipeActionsConfigurationProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UICollectionViewListLayoutSectionConfiguration trailingSwipeActionsConfigurationProvider](self->_configuration, "trailingSwipeActionsConfigurationProvider");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_willBeginSwiping
{
  void *v3;
  void (**v4)(void);

  -[_UICollectionViewListLayoutSectionConfiguration willBeginSwipingHandler](self->_configuration, "willBeginSwipingHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UICollectionViewListLayoutSectionConfiguration willBeginSwipingHandler](self->_configuration, "willBeginSwipingHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_didEndSwiping
{
  void *v3;
  void (**v4)(void);

  -[_UICollectionViewListLayoutSectionConfiguration didEndSwipingHandler](self->_configuration, "didEndSwipingHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UICollectionViewListLayoutSectionConfiguration didEndSwipingHandler](self->_configuration, "didEndSwipingHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (BOOL)_shouldInvalidateForScrollViewLayoutAdjustmentsChange
{
  return 1;
}

- (void)_configureLayoutAttributesForSwipeActionMasking:(id)a3 interactionState:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a3, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UICollectionViewLayoutInteractionStateModule swipeActionsStyleForSwipedItemAtIndexPath:]((uint64_t)a4, v7);

  if (v8 == 2)
  {
    if (a3)
      *((_WORD *)a3 + 144) |= 0x10u;
    -[UICollectionViewLayoutAttributes _setMaskedCorners:]((uint64_t)a3, 0xFuLL);
    -[_UICollectionViewListLayoutSection _effectiveCornerRadius](self, "_effectiveCornerRadius");
    if (a3)
      *((_QWORD *)a3 + 39) = v9;
  }
  else
  {
    -[_UICollectionViewListLayoutSection _configureLayoutAttributesWithDefaultMasking:](self, "_configureLayoutAttributesWithDefaultMasking:", a3);
  }
}

- (unint64_t)_maskedCornersForBackgroundOfItemWithSelectionGrouping:(unint64_t)a3
{
  unint64_t v4;
  double v5;

  -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
  v4 = a3 - 2;
  if (v5 > 0.0)
    v4 = -1;
  if (v4 > 2)
    return 15;
  else
    return qword_186684DF0[v4];
}

- (id)_descriptionProperties
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  double v8;
  const __CFString *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_UICollectionViewListLayoutSection;
  -[NSCollectionLayoutSection _descriptionProperties](&v25, sel__descriptionProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_UICollectionViewListLayoutSectionConfiguration _isAPIVersion](self->_configuration, "_isAPIVersion"))
    objc_msgSend(v3, "addObject:", CFSTR("SPI List Section Configuration"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[_UICollectionViewListLayoutSectionConfiguration appearanceStyle](self->_configuration, "appearanceStyle");
  if (v5 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown value: %ld)"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E16E8CB0[v5];
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("appearance = %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[_UICollectionViewListLayoutSectionConfiguration sectionHeaderHeight](self->_configuration, "sectionHeaderHeight");
  if (v8 == -1000.0)
  {
    if (!-[_UICollectionViewListLayoutSectionConfiguration stylesFirstItemAsHeader](self->_configuration, "stylesFirstItemAsHeader"))goto LABEL_11;
    v9 = CFSTR("headerMode = .firstItemInSection");
  }
  else
  {
    v9 = CFSTR("headerMode = .supplementary");
  }
  objc_msgSend(v3, "addObject:", v9);
LABEL_11:
  -[_UICollectionViewListLayoutSectionConfiguration sectionFooterHeight](self->_configuration, "sectionFooterHeight");
  if (v10 != -1000.0)
    objc_msgSend(v3, "addObject:", CFSTR("footerMode = .supplementary"));
  -[_UICollectionViewListLayoutSectionConfiguration headerTopPadding](self->_configuration, "headerTopPadding");
  if (v11 != 1.79769313e308)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[_UICollectionViewListLayoutSectionConfiguration headerTopPadding](self->_configuration, "headerTopPadding");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("headerTopPadding = %g"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  if (-[_UICollectionViewListLayoutSectionConfiguration separatorStyle](self->_configuration, "separatorStyle") != 1)
    objc_msgSend(v3, "addObject:", CFSTR("showsSeparators = NO"));
  -[_UICollectionViewListLayoutSectionConfiguration _itemSeparatorHandler](self->_configuration, "_itemSeparatorHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v3, "addObject:", CFSTR("Has Item Separator Handler"));
  -[_UICollectionViewListLayoutSectionConfiguration _backgroundColor](self->_configuration, "_backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[_UICollectionViewListLayoutSectionConfiguration _backgroundColor](self->_configuration, "_backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("backgroundColor = %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  -[_UICollectionViewListLayoutSectionConfiguration leadingSwipeActionsConfigurationProvider](self->_configuration, "leadingSwipeActionsConfigurationProvider");
  v20 = objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewListLayoutSectionConfiguration trailingSwipeActionsConfigurationProvider](self->_configuration, "trailingSwipeActionsConfigurationProvider");
  v21 = objc_claimAutoreleasedReturnValue();

  if (v20 | v21)
  {
    v22 = CFSTR("Has Leading & Trailing Swipe Actions Providers");
    if (!v21)
      v22 = CFSTR("Has Leading Swipe Actions Provider");
    if (v20)
      v23 = v22;
    else
      v23 = CFSTR("Has Trailing Swipe Actions Provider");
    objc_msgSend(v3, "addObject:", v23);
  }
  return v3;
}

@end
