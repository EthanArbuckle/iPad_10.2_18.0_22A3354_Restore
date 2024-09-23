@implementation UICollectionViewFlowLayout

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  _UIFlowLayoutInfo *data;
  _UIFlowLayoutInfo *v12;
  unint64_t v13;
  _UIFlowLayoutInfo *v14;
  _UIFlowLayoutInfo *v15;
  uint64_t v16;
  uint64_t v17;
  _UIFlowLayoutInfo *v18;
  _BOOL4 horizontal;
  void *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double Width;
  double v49;
  CGRect v51;

  v4 = a3;
  if (v4)
  {
    if ((*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
    {
      -[UICollectionViewFlowLayout _existingLayoutAttributesForItemAtIndexPath:](self, "_existingLayoutAttributesForItemAtIndexPath:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v5 = v6;
      }
      else
      {
        v8 = (void *)objc_msgSend(v4, "copy");
        v9 = -[UICollectionViewFlowLayout _sectionArrayIndexForIndexPath:](self, "_sectionArrayIndexForIndexPath:", v8);
        v10 = objc_msgSend(v8, "item");
        data = self->_data;
        if (data)
          data = (_UIFlowLayoutInfo *)data->_sections;
        v12 = data;
        v13 = -[_UIFlowLayoutInfo count](v12, "count");

        if (v9 >= v13)
        {
          v5 = 0;
        }
        else
        {
          v14 = self->_data;
          if (v14)
            v14 = (_UIFlowLayoutInfo *)v14->_sections;
          v15 = v14;
          -[_UIFlowLayoutInfo objectAtIndex:](v15, "objectAtIndex:", v9);
          v16 = objc_claimAutoreleasedReturnValue();

          if (((*(_WORD *)(&self->_gridLayoutFlags + 1) & 0x401) == 0 || v16 && *(_BYTE *)(v16 + 88))
            && !-[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
          {
            v18 = self->_data;
            if (v18)
              horizontal = v18->_horizontal;
            else
              horizontal = 0;
            -[UICollectionViewLayout collectionView](self, "collectionView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "_shouldReverseLayoutDirection"))
              v21 = -[UICollectionViewLayout _wantsRightToLeftHorizontalMirroringIfNeeded](self, "_wantsRightToLeftHorizontalMirroringIfNeeded");
            else
              v21 = 1;

            if (v16)
            {
              v22 = *(_QWORD *)(v16 + 216);
              v23 = v10 / v22;
              v24 = v10 % v22;
              v26 = *(double *)(v16 + 248);
              v25 = *(double *)(v16 + 256);
              if (horizontal)
                v27 = *(double *)(v16 + 248);
              else
                v27 = *(double *)(v16 + 256);
              if (horizontal)
                v28 = *(double *)(v16 + 256);
              else
                v28 = *(double *)(v16 + 248);
              if (*(_BYTE *)(v16 + 89) && v23 == *(_QWORD *)(v16 + 224) && *(_DWORD *)(v16 + 232) != 3)
              {
                v29 = 200;
                v30 = 184;
              }
              else
              {
                v29 = 176;
                v30 = 160;
              }
              v31 = *(double *)(v16 + 312);
              v32 = *(double *)(v16 + 320);
              v33 = *(double *)(v16 + v30) + (v28 + *(double *)(v16 + v29)) * (double)v24;
              v34 = *(double *)(v16 + 152) + (v27 + *(double *)(v16 + 112)) * (double)v23;
            }
            else
            {
              v25 = 0.0;
              v26 = 0.0;
              v31 = 0.0;
              v32 = 0.0;
              v33 = 0.0;
              v34 = 0.0;
            }
            -[UICollectionViewLayout collectionView](self, "collectionView");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "_currentScreenScale");
            v37 = v36;

            if (horizontal)
              v38 = v34;
            else
              v38 = v33;
            if (!horizontal)
              v33 = v34;
            v39 = v31 + v38;
            if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
            {
              v40 = v37;
              if (v37 == 0.0)
              {
                if (AdjustToScale_onceToken != -1)
                  dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
                v40 = *(double *)&AdjustToScale___s;
              }
              if (v40 == 1.0)
                v39 = round(v39);
              else
                v39 = round(v39 * v40) / v40;
            }
            v41 = v32 + v33;
            if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
            {
              if (v37 == 0.0)
              {
                if (AdjustToScale_onceToken != -1)
                  dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
                v37 = *(double *)&AdjustToScale___s;
              }
              if (v37 == 1.0)
                v41 = round(v41);
              else
                v41 = round(v41 * v37) / v37;
            }
            if (!v21)
            {
              v42 = 0.0;
              v43 = v39;
              v44 = 0;
              v45 = 0;
              v46 = 0;
              v47 = 0.0;
              if (v16)
              {
                v47 = *(double *)(v16 + 312);
                v44 = *(_QWORD *)(v16 + 320);
                v43 = v39 - v47;
                v45 = *(_QWORD *)(v16 + 328);
                v46 = *(_QWORD *)(v16 + 336);
              }
              Width = CGRectGetWidth(*(CGRect *)&v47);
              v51.origin.x = v39;
              v51.origin.y = v41;
              v51.size.width = v26;
              v51.size.height = v25;
              v49 = Width - CGRectGetWidth(v51) - v43;
              if (v16)
                v42 = *(double *)(v16 + 312);
              v39 = v49 + v42;
            }
            -[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](self, "_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:", v8, v39, v41, v26, v25);
            v17 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:usingData:](self, "layoutAttributesForItemAtIndexPath:usingData:", v8, self->_data);
            v17 = objc_claimAutoreleasedReturnValue();
          }
          v5 = (id)v17;

        }
      }

    }
    else
    {
      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewFlowLayout;
  -[UICollectionViewLayout prepareLayout](&v12, sel_prepareLayout);
  self->_contentSizeAdjustment = (CGSize)*MEMORY[0x1E0C9D820];
  self->_contentOffsetAdjustment = (CGPoint)*MEMORY[0x1E0C9D538];
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  if (!CGRectIsEmpty(v13))
    -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", v5, v7, v9, v11);
}

- (int64_t)_sectionArrayIndexForIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  int64_t v6;

  v4 = objc_msgSend(a3, "section");
  -[UICollectionViewLayout _sections](self, "_sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 - objc_msgSend(v5, "firstIndex");

  return v6;
}

- (BOOL)_estimatesSizes
{
  return self->_estimatedItemSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8)
      || self->_estimatedItemSize.width != *MEMORY[0x1E0C9D820];
}

- (int64_t)developmentLayoutDirection
{
  return 0;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  _WORD *v7;
  _WORD *v8;
  BOOL v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  int v18;
  _UIUpdateVisibleCellsContext *v20;
  _UIUpdateVisibleCellsContext *updateVisibleCellsContext;
  double v22;
  double v23;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  UICollectionViewFlowLayout *v56;
  __int16 v57;
  _WORD *v58;
  __int16 v59;
  _WORD *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes");
  if (v8)
    v10 = v8[144] & 1;
  else
    v10 = 0;
  objc_msgSend(v7, "size");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v8, "size");
  if (!v9)
  {
    dyld_program_sdk_at_least();
    goto LABEL_11;
  }
  v17 = v12 != v15;
  if (v14 != v16)
    v17 = 1;
  v18 = v10 & v17;
  if (dyld_program_sdk_at_least() && v18)
  {
    if ((*((_BYTE *)&self->_gridLayoutFlags + 6) & 1) == 0)
    {
      LOBYTE(v18) = 1;
      goto LABEL_12;
    }
    if (!self->_updateVisibleCellsContext)
    {
      v20 = objc_alloc_init(_UIUpdateVisibleCellsContext);
      updateVisibleCellsContext = self->_updateVisibleCellsContext;
      self->_updateVisibleCellsContext = v20;

    }
    objc_msgSend(v7, "size");
    if (v23 == *MEMORY[0x1E0C9D820] && v22 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewFlowLayout.m"), 750, CFSTR("UICollectionView Flow Layout received layout attributes with an empty size. This happens when a reusable view has incorrectly configured constraints, or an incorrect override of -sizeThatFits:, -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:, or -preferredLayoutAttributesFittingAttributes:. Ensure that your view generates a valid preferred size.\nOriginal attributes: %@. Preferred attributes: %@.\nCollection View: %@"), v8, v7, v43);

      v44 = _MergedGlobals_131_0;
      if (!_MergedGlobals_131_0)
      {
        v44 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v44, (unint64_t *)&_MergedGlobals_131_0);
      }
      if ((*(_BYTE *)v44 & 1) == 0)
        goto LABEL_11;
      v45 = *(NSObject **)(v44 + 8);
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v29 = v45;
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v54 = v46;
      v55 = 2048;
      v56 = self;
      v57 = 2112;
      v58 = v7;
      v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "cv == %p; flow layout == %p; ignoring invalid preferred attributes. Preferred attrs: %@; original attrs: %@.",
        buf,
        0x2Au);

    }
    else
    {
      v25 = qword_1ECD78E40;
      if (!qword_1ECD78E40)
      {
        v25 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v25, (unint64_t *)&qword_1ECD78E40);
      }
      if ((*(_BYTE *)v25 & 1) != 0)
      {
        v47 = *(NSObject **)(v25 + 8);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = v47;
          -[UICollectionViewLayout collectionView](self, "collectionView");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v54 = v49;
          v55 = 2048;
          v56 = self;
          v57 = 2112;
          v58 = v7;
          v59 = 2112;
          v60 = v8;
          _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_ERROR, "cv == %p; flow layout == %p; adding preferred attributes to invalidation batch. Preferred attrs: %@; original attrs: %@.",
            buf,
            0x2Au);

        }
      }
      -[UICollectionViewLayout collectionView](self, "collectionView");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
        v28 = *(void **)(v26 + 3240);
      else
        v28 = 0;
      v29 = v28;

      if (v29)
      {
        v30 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v8, "size");
        v52[0] = v31;
        v52[1] = v32;
        objc_msgSend(v30, "valueWithBytes:objCType:", v52, "{CGSize=dd}");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v7, "size");
        v51[0] = v35;
        v51[1] = v36;
        objc_msgSend(v34, "valueWithBytes:objCType:", v51, "{CGSize=dd}");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v8, "size");
        v50[0] = v39;
        v50[1] = v40;
        objc_msgSend(v38, "valueWithBytes:objCType:", v50, "{CGSize=dd}");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject recordPreferredAttributesChangeForElementWithAttributes:reason:changedAttribute:fromValue:toValue:layoutGeneratedValue:](v29, "recordPreferredAttributesChangeForElementWithAttributes:reason:changedAttribute:fromValue:toValue:layoutGeneratedValue:", v7, CFSTR("preferred size changed"), CFSTR("preferredSize"), v33, v37, v41);

      }
      -[_UIUpdateVisibleCellsContext addPreferredAttributes:]((uint64_t)self->_updateVisibleCellsContext, v7);
    }

LABEL_11:
    LOBYTE(v18) = 0;
  }
LABEL_12:

  return v18;
}

- (unint64_t)_layoutAxis
{
  UICollectionViewScrollDirection v2;

  v2 = -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection");
  if (v2)
    return v2 == UICollectionViewScrollDirectionHorizontal;
  else
    return 2;
}

- (UICollectionViewScrollDirection)scrollDirection
{
  return self->_scrollDirection;
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (void)_prepareForCollectionViewUpdates:(id)a3 withDataSourceTranslator:(id)a4
{
  objc_storeStrong((id *)&self->_currentUpdateTranslator, a4);
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setCollectionView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewFlowLayout;
  -[UICollectionViewLayout _setCollectionView:](&v4, sel__setCollectionView_, a3);
  -[UICollectionViewFlowLayout _updateCollectionViewScrollableAxis](self, "_updateCollectionViewScrollableAxis");
}

- (void)_updateCollectionViewScrollableAxis
{
  -[UIScrollView _setContentScrollsAlongXAxis:](self->super._collectionView, "_setContentScrollsAlongXAxis:", self->_scrollDirection == 1);
  -[UIScrollView _setContentScrollsAlongYAxis:](self->super._collectionView, "_setContentScrollsAlongYAxis:", self->_scrollDirection == 0);
}

- (UICollectionViewFlowLayout)init
{
  UICollectionViewFlowLayout *v2;
  UICollectionViewFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewFlowLayout;
  v2 = -[UICollectionViewLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    UICollectionViewFlowLayoutCommonInit((uint64_t)v2);
  return v3;
}

- (void)_willPerformUpdateVisibleCellsPass
{
  *((_DWORD *)&self->_gridLayoutFlags + 1) |= 0x10000u;
}

- (void)_didPerformUpdateVisibleCellsPassWithLayoutOffset:(CGPoint)a3
{
  _UIUpdateVisibleCellsContext *updateVisibleCellsContext;
  _UIFlowLayoutInfo *data;
  _UIUpdateVisibleCellsContext *v7;
  _UIUpdateVisibleCellsContext *v8;
  _UIUpdateVisibleCellsContext *v9;
  _UIUpdateVisibleCellsContext *v10;
  id v11;
  _UIUpdateVisibleCellsContext *v12;
  _UIUpdateVisibleCellsContext *v13;
  _UIUpdateVisibleCellsContext *v14;
  void *v15;

  if (dyld_program_sdk_at_least())
  {
    updateVisibleCellsContext = self->_updateVisibleCellsContext;
    if (updateVisibleCellsContext
      && -[NSMutableArray count](updateVisibleCellsContext->_attributes, "count")
      && !updateVisibleCellsContext->_visibleCellsRefCount)
    {
      data = self->_data;
      v7 = self->_updateVisibleCellsContext;
      if (v7)
        v7 = (_UIUpdateVisibleCellsContext *)v7->_sizes;
      v8 = v7;
      v9 = self->_updateVisibleCellsContext;
      if (v9)
        v9 = (_UIUpdateVisibleCellsContext *)v9->_indexPaths;
      v10 = v9;
      -[_UIFlowLayoutInfo setSizes:forItemsAtIndexPaths:]((uint64_t)data, v8, v10);

      v11 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewFlowLayout.m"), 2107, CFSTR("The invalidation context (%@) sent to -[UICollectionViewFlowLayout invalidateLayoutWithContext:] is not an instance of type UICollectionViewFlowLayoutInvalidationContext or a subclass. Collection view: %@"), v11, self->super._collectionView);

      }
      v12 = self->_updateVisibleCellsContext;
      if (v12)
        v12 = (_UIUpdateVisibleCellsContext *)v12->_indexPaths;
      v13 = v12;
      objc_msgSend(v11, "invalidateItemsAtIndexPaths:", v13);

      objc_msgSend(v11, "setInvalidateFlowLayoutAttributes:", 0);
      objc_msgSend(v11, "_setInvalidateDataSourceCounts:", 0);
      objc_msgSend(v11, "setContentOffsetAdjustment:", self->_contentOffsetAdjustment.x, self->_contentOffsetAdjustment.y);
      objc_msgSend(v11, "setContentSizeAdjustment:", self->_contentSizeAdjustment.width, self->_contentSizeAdjustment.height);
      if (dyld_program_sdk_at_least())
        objc_msgSend(v11, "_setIntent:", 5);
      -[UICollectionViewFlowLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v11);
      -[UICollectionView _setNeedsVisibleCellsUpdate:withLayoutAttributes:](self->super._collectionView, "_setNeedsVisibleCellsUpdate:withLayoutAttributes:", 1, 1);

    }
    v14 = self->_updateVisibleCellsContext;
    self->_updateVisibleCellsContext = 0;

  }
  *((_DWORD *)&self->_gridLayoutFlags + 1) &= ~0x10000u;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_7;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindSectionHeader")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("UICollectionElementKindSectionFooter")))
    {
      -[UICollectionViewFlowLayout layoutAttributesForFooterInSection:usingData:](self, "layoutAttributesForFooterInSection:usingData:", objc_msgSend(v7, "indexAtPosition:", 0), self->_data);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  -[UICollectionViewFlowLayout layoutAttributesForHeaderInSection:usingData:](self, "layoutAttributesForHeaderInSection:usingData:", objc_msgSend(v7, "indexAtPosition:", 0), self->_data);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)v8;
LABEL_8:

  return v9;
}

- (id)layoutAttributesForFooterInSection:(int64_t)a3 usingData:(id)a4
{
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v14;

  -[UICollectionViewFlowLayout _frameForFooterInSection:usingData:](self, "_frameForFooterInSection:usingData:", a3, a4);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  if (CGRectEqualToRect(v14, *MEMORY[0x1E0C9D648]))
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("UICollectionElementKindSectionFooter"), v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setFrame:", x, y, width, height);
    if (dyld_program_sdk_at_least())
      objc_msgSend(v12, "setZIndex:", 10);
    v9 = v12;
  }
  return v9;
}

- (id)layoutAttributesForHeaderInSection:(int64_t)a3 usingData:(id)a4
{
  double x;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v14;

  -[UICollectionViewFlowLayout _frameForHeaderInSection:usingData:](self, "_frameForHeaderInSection:usingData:", a3, a4);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  if (CGRectEqualToRect(v14, *MEMORY[0x1E0C9D648]))
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("UICollectionElementKindSectionHeader"), v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setFrame:", x, y, width, height);
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v12, "setZIndex:", 10);
      if (dyld_program_sdk_at_least())
        objc_msgSend(v12, "_setZPosition:", 1);
    }
    v9 = v12;
  }
  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewFlowLayout _layoutAttributesForItemsInRect:](self, "_layoutAttributesForItemsInRect:", x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);
  -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](self, "indexesForSectionHeadersInRect:usingData:", self->_data, x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        -[UICollectionViewFlowLayout layoutAttributesForHeaderInSection:usingData:](self, "layoutAttributesForHeaderInSection:usingData:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "indexAtPosition:", 0), self->_data);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }
  -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](self, "indexesForSectionFootersInRect:usingData:", self->_data, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        -[UICollectionViewFlowLayout layoutAttributesForFooterInSection:usingData:](self, "layoutAttributesForFooterInSection:usingData:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "indexAtPosition:", 0), self->_data);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }
  if ((*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) == 0)
    -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", x, y, width, height);

  return v8;
}

- (id)indexesForSectionHeadersInRect:(CGRect)a3 usingData:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  _UIFlowLayoutInfo *v11;
  NSMutableArray *sections;
  NSMutableArray *v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = (_UIFlowLayoutInfo *)v9;
LABEL_4:
    sections = v11->_sections;
    goto LABEL_5;
  }
  v11 = self->_data;
  if (v11)
    goto LABEL_4;
  sections = 0;
LABEL_5:
  v13 = sections;
  v14 = -[NSMutableArray count](v13, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 >= 1)
  {
    for (i = 0; i != v14; ++i)
    {
      -[NSMutableArray objectAtIndex:](v13, "objectAtIndex:", i);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
      {
        if (*(double *)(v17 + 128) > 0.0)
        {
          v24.origin.x = x;
          v24.origin.y = y;
          v24.size.width = width;
          v24.size.height = height;
          v21 = CGRectIntersection(*(CGRect *)(v17 + 312), v24);
          if (!CGRectIsNull(v21))
          {
            -[UICollectionViewFlowLayout _frameForHeaderInSection:usingData:](self, "_frameForHeaderInSection:usingData:", i, v11);
            v25.origin.x = x;
            v25.origin.y = y;
            v25.size.width = width;
            v25.size.height = height;
            v23 = CGRectIntersection(v22, v25);
            if (!CGRectIsNull(v23))
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, i);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v19);

            }
          }
        }
      }

    }
  }

  return v15;
}

- (id)indexesForSectionFootersInRect:(CGRect)a3 usingData:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  _UIFlowLayoutInfo *v11;
  NSMutableArray *sections;
  NSMutableArray *v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = (_UIFlowLayoutInfo *)v9;
LABEL_4:
    sections = v11->_sections;
    goto LABEL_5;
  }
  v11 = self->_data;
  if (v11)
    goto LABEL_4;
  sections = 0;
LABEL_5:
  v13 = sections;
  v14 = -[NSMutableArray count](v13, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 >= 1)
  {
    for (i = 0; i != v14; ++i)
    {
      -[NSMutableArray objectAtIndex:](v13, "objectAtIndex:", i);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
      {
        if (*(double *)(v17 + 136) > 0.0)
        {
          v24.origin.x = x;
          v24.origin.y = y;
          v24.size.width = width;
          v24.size.height = height;
          v21 = CGRectIntersection(*(CGRect *)(v17 + 312), v24);
          if (!CGRectIsNull(v21))
          {
            -[UICollectionViewFlowLayout _frameForFooterInSection:usingData:](self, "_frameForFooterInSection:usingData:", i, v11);
            v25.origin.x = x;
            v25.origin.y = y;
            v25.size.width = width;
            v25.size.height = height;
            v23 = CGRectIntersection(v22, v25);
            if (!CGRectIsNull(v23))
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, i);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v19);

            }
          }
        }
      }

    }
  }

  return v15;
}

- (void)setEstimatedItemSize:(CGSize)estimatedItemSize
{
  id v5;

  if (estimatedItemSize.width != self->_estimatedItemSize.width
    || estimatedItemSize.height != self->_estimatedItemSize.height)
  {
    self->_estimatedItemSize = estimatedItemSize;
    if (dyld_program_sdk_at_least())
    {
      if (-[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
        -[UICollectionViewFlowLayout _resetCachedItems](self, "_resetCachedItems");
      objc_msgSend((id)objc_opt_class(), "invalidationContextClass");
      v5 = (id)objc_opt_new();
      objc_msgSend(v5, "_setInvalidateEverything:", 1);
      -[UICollectionViewFlowLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

    }
  }
}

- (BOOL)_shouldInvalidateLayoutForOldInsets:(UIEdgeInsets)a3 newInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3.right;
  v9 = a3.bottom;
  v10 = a3.left;
  v11 = a3.top;
  v12 = -[UICollectionViewFlowLayout _layoutAxis](self, "_layoutAxis");
  if (v12 == 1)
    v13 = 2;
  else
    v13 = v12 == 2;
  return !_UIEdgeInsetsEqualToInsetsAlongAxis(v13, v11, v10, v9, v8, top, left, bottom, right);
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  objc_super v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The invalidation context (%@) sent to -[UICollectionViewFlowLayout invalidateLayoutWithContext:] is not an instance of type UICollectionViewFlowLayoutInvalidationContext or a subclass. Collection view: %@"), v4, self->super._collectionView);
  if (dyld_program_sdk_at_least()
    && -[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes")
    && ((objc_msgSend(v4, "_retainExistingSizingInfoForEstimates") & 1) != 0
     || objc_msgSend(v4, "_intent") == 3
     && -[UICollectionView _dataSourceMatchesCurrentCounts](self->super._collectionView, "_dataSourceMatchesCurrentCounts")))
  {
    -[UICollectionViewFlowLayout collectionViewContentSize](self, "collectionViewContentSize");
    v6 = v5;
    v8 = v7;
    if (fabs(v5 * v7) >= 2.22044605e-16)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__42;
      v27 = __Block_byref_object_dispose__42;
      -[_UIFlowLayoutInfo specifiedItemSizes]((uint64_t)self->_data);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_updateItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v14 = (void *)v24[5];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __58__UICollectionViewFlowLayout_invalidateLayoutWithContext___block_invoke;
        v19[3] = &unk_1E16BDEF0;
        v19[4] = self;
        v20 = v4;
        v22 = &v23;
        v15 = v13;
        v21 = v15;
        objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
        v16 = (void *)v24[5];
        v24[5] = (uint64_t)v15;
        v17 = v15;

      }
      -[_UIFlowLayoutInfo invalidate:]((uint64_t)self->_data, 0);
      -[UICollectionViewFlowLayout _getSizingInfosWithExistingSizingDictionary:](self, "_getSizingInfosWithExistingSizingDictionary:", v24[5]);
      -[UICollectionViewFlowLayout _updateItemsLayoutForRect:allowsPartialUpdate:](self, "_updateItemsLayoutForRect:allowsPartialUpdate:", 0, 0.0, 0.0, v6, v8);
      -[UICollectionViewFlowLayout _resetCachedItems](self, "_resetCachedItems");
      *((_DWORD *)&self->_gridLayoutFlags + 1) |= 0x180u;
      _Block_object_dispose(&v23, 8);

    }
    else
    {
      -[_UIFlowLayoutInfo invalidate:]((uint64_t)self->_data, 0);
      -[UICollectionViewFlowLayout _resetCachedItems](self, "_resetCachedItems");
      *((_DWORD *)&self->_gridLayoutFlags + 1) &= 0xFFFFFE7F;
    }
  }
  else
  {
    if (((objc_msgSend(v4, "invalidateFlowLayoutAttributes") & 1) != 0
       || objc_msgSend(v4, "invalidateDataSourceCounts"))
      && (*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
    {
      -[_UIFlowLayoutInfo invalidate:]((uint64_t)self->_data, objc_msgSend(v4, "invalidateFlowLayoutDelegateMetrics") ^ 1);
      -[UICollectionViewFlowLayout _resetCachedItems](self, "_resetCachedItems");
      if ((objc_msgSend(v4, "invalidateFlowLayoutDelegateMetrics") & 1) != 0)
      {
        v9 = 0;
      }
      else if (-[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
      {
        v9 = 0;
      }
      else
      {
        v9 = 256;
      }
      *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFE7F | v9;
    }
    objc_msgSend(v4, "invalidatedItemIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      -[NSMutableDictionary removeObjectsForKeys:](self->_cachedItemAttributes, "removeObjectsForKeys:", v10);
      -[NSMutableDictionary removeObjectsForKeys:](self->_cachedItemFrames, "removeObjectsForKeys:", v10);
    }

  }
  self->_contentSizeAdjustment = (CGSize)*MEMORY[0x1E0C9D820];
  self->_contentOffsetAdjustment = (CGPoint)*MEMORY[0x1E0C9D538];
  v18.receiver = self;
  v18.super_class = (Class)UICollectionViewFlowLayout;
  -[UICollectionViewLayout invalidateLayoutWithContext:](&v18, sel_invalidateLayoutWithContext_, v4);

}

- (void)_resetCachedItems
{
  -[NSMutableDictionary removeAllObjects](self->_cachedItemAttributes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_cachedItemFrames, "removeAllObjects");
}

- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewFlowLayout;
  -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v5, sel__invalidationContextForUpdatedLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (dyld_program_sdk_at_least())
    objc_msgSend(v3, "_setIntent:", 7);
  return v3;
}

- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3.right;
  v9 = a3.bottom;
  v10 = a3.left;
  v11 = a3.top;
  return !_UISupportsShouldInvalidateForInsets()
      || -[UICollectionViewFlowLayout _shouldInvalidateLayoutForOldInsets:newInsets:](self, "_shouldInvalidateLayoutForOldInsets:newInsets:", top, left, bottom, right, v11, v10, v9, v8);
}

- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3.right;
  v9 = a3.bottom;
  v10 = a3.left;
  v11 = a3.top;
  return !_UISupportsShouldInvalidateForInsets()
      || -[UICollectionViewFlowLayout _shouldInvalidateLayoutForOldInsets:newInsets:](self, "_shouldInvalidateLayoutForOldInsets:newInsets:", top, left, bottom, right, v11, v10, v9, v8);
}

- (CGRect)_frameForItem:(int64_t)a3 inSection:(int64_t)a4 usingData:(id)a5
{
  id v8;
  _QWORD *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  id *v22;
  double v23;
  double *WeakRetained;
  double *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect result;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v11 = *((double *)v8 + 39);
    v10 = *((double *)v8 + 40);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_UIFlowLayoutSection frameForItemAtIndexPath:]((uint64_t)v9, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;

  if (v9)
    v20 = (void *)v9[12];
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v21, "objectAtIndex:", a3);
  v22 = (id *)objc_claimAutoreleasedReturnValue();

  v23 = 0.0;
  if (v22)
  {
    WeakRetained = (double *)objc_loadWeakRetained(v22 + 3);
    v25 = WeakRetained;
    if (WeakRetained)
    {
      v26 = WeakRetained[9];
      v23 = WeakRetained[10];
      goto LABEL_8;
    }
  }
  else
  {
    v25 = 0;
  }
  v26 = 0.0;
LABEL_8:
  v27 = v13 + v11 + v26;
  v28 = v10 + v23;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_currentScreenScale");
  v31 = v30;

  if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
  {
    v32 = v31;
    if (v31 == 0.0)
    {
      if (AdjustToScale_onceToken != -1)
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
      v32 = *(double *)&AdjustToScale___s;
    }
    if (v32 == 1.0)
      v27 = round(v27);
    else
      v27 = round(v27 * v32) / v32;
  }
  v33 = v15 + v28;
  if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
  {
    if (v31 == 0.0)
    {
      if (AdjustToScale_onceToken != -1)
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
      v31 = *(double *)&AdjustToScale___s;
    }
    if (v31 == 1.0)
      v33 = round(v33);
    else
      v33 = round(v33 * v31) / v31;
  }

  v34 = v27;
  v35 = v33;
  v36 = v17;
  v37 = v19;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)_frameForFooterInSection:(int64_t)a3 usingData:(id)a4
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
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
  double v43;
  _UIFlowLayoutInfo *data;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MaxX;
  double v55;
  double v56;
  double MaxY;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double Width;
  CGFloat v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double Height;
  CGFloat v76;
  BOOL v77;
  CGFloat rect;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  double v83;
  double v84;
  CGFloat v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect result;

  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = (void *)v6[13];
  else
    v8 = 0;
  v9 = v8;
  v10 = objc_msgSend(v9, "count");

  if (v10 <= a3)
  {
    v25 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_36;
  }
  if (v7)
    v11 = (void *)v7[13];
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = *(double *)(v13 + 312);
    v15 = *(double *)(v13 + 320);
    v17 = *(double *)(v13 + 328);
    v16 = *(double *)(v13 + 336);
    if (!-[UICollectionViewFlowLayout _footerFollowsSectionMargins](self, "_footerFollowsSectionMargins"))
    {
      v18 = *(double *)(v13 + 376);
      v19 = *(double *)(v13 + 384);
      v21 = *(double *)(v13 + 392);
      v23 = *(double *)(v13 + 400);
      goto LABEL_11;
    }
  }
  else
  {
    v77 = -[UICollectionViewFlowLayout _footerFollowsSectionMargins](self, "_footerFollowsSectionMargins");
    v14 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v15 = 0.0;
    v19 = 0.0;
    v21 = 0.0;
    v23 = 0.0;
    v18 = 0.0;
    if (!v77)
      goto LABEL_11;
  }
  v18 = -[_UIFlowLayoutSection effectiveFooterFrameWithSectionMarginsApplied](v13);
  v21 = v20;
  v23 = v22;
LABEL_11:
  v25 = v14 + v18;
  v24 = v15 + v19;
  if ((*((_BYTE *)&self->_gridLayoutFlags + 5) & 0x10) != 0)
  {
    v79 = v15;
    v80 = v17;
    v82 = v23;
    v85 = v14;
    v81 = v16;
    -[UIView bounds](self->super._collectionView, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    -[UIScrollView _effectiveContentInset](self->super._collectionView, "_effectiveContentInset");
    v41 = v39 + v40;
    v43 = v38 + v42;
    data = self->_data;
    v45 = v21;
    if (data)
      LODWORD(data) = data->_horizontal;
    v46 = v31 + v39;
    v47 = v33 + v38;
    v48 = v35 - v41;
    v49 = v37 - v43;
    rect = v24;
    v50 = v46;
    v51 = v47;
    v52 = v48;
    v53 = v49;
    if ((_DWORD)data)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v50);
      v86.origin.x = v25;
      v86.origin.y = v24;
      v86.size.width = v45;
      v86.size.height = v82;
      if (MaxX >= CGRectGetMaxX(v86))
      {
        v56 = v24;
      }
      else
      {
        v87.origin.x = v46;
        v87.origin.y = v47;
        v87.size.width = v48;
        v87.size.height = v49;
        v55 = CGRectGetMaxX(v87);
        v88.origin.x = v25;
        v88.origin.y = v24;
        v56 = v24;
        v88.size.width = v45;
        v88.size.height = v82;
        v25 = v55 - CGRectGetWidth(v88);
      }
      v21 = v45;
      v23 = v82;
      if (v13)
      {
        v65 = *(_QWORD *)(v13 + 344);
        v66 = *(_QWORD *)(v13 + 352);
        v67 = *(_QWORD *)(v13 + 360);
        v68 = *(_QWORD *)(v13 + 368);
      }
      else
      {
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v65 = 0;
      }
      v24 = v56;
      Width = CGRectGetWidth(*(CGRect *)&v65);
      v92.origin.x = v25;
      v92.origin.y = v24;
      v92.size.width = v21;
      v92.size.height = v82;
      v83 = Width;
      v70 = CGRectGetMinX(v92) - Width;
      v93.origin.x = v85;
      v93.origin.y = v79;
      v93.size.width = v80;
      v93.size.height = v81;
      if (v70 < CGRectGetMinX(v93))
      {
        v94.origin.x = v85;
        v94.origin.y = v79;
        v94.size.width = v80;
        v94.size.height = v81;
        v25 = v83 + CGRectGetMinX(v94);
      }
    }
    else
    {
      MaxY = CGRectGetMaxY(*(CGRect *)&v50);
      v89.origin.x = v25;
      v89.origin.y = v24;
      v58 = v45;
      v89.size.width = v45;
      v23 = v82;
      v89.size.height = v82;
      if (MaxY >= CGRectGetMaxY(v89))
      {
        v60 = rect;
      }
      else
      {
        v90.origin.x = v46;
        v90.origin.y = v47;
        v90.size.width = v48;
        v90.size.height = v49;
        v59 = CGRectGetMaxY(v90);
        v91.origin.x = v25;
        v91.origin.y = rect;
        v91.size.width = v58;
        v91.size.height = v82;
        v60 = v59 - CGRectGetHeight(v91);
      }
      v21 = v58;
      if (v13)
      {
        v71 = *(_QWORD *)(v13 + 344);
        v72 = *(_QWORD *)(v13 + 352);
        v73 = *(_QWORD *)(v13 + 360);
        v74 = *(_QWORD *)(v13 + 368);
      }
      else
      {
        v72 = 0;
        v73 = 0;
        v74 = 0;
        v71 = 0;
      }
      v24 = v60;
      Height = CGRectGetHeight(*(CGRect *)&v71);
      v95.origin.x = v25;
      v95.origin.y = v24;
      v95.size.width = v21;
      v95.size.height = v82;
      v84 = Height;
      v76 = CGRectGetMinY(v95) - Height;
      v96.origin.x = v85;
      v96.origin.y = v79;
      v96.size.width = v80;
      v96.size.height = v81;
      if (v76 < CGRectGetMinY(v96))
      {
        v97.origin.x = v85;
        v97.origin.y = v79;
        v97.size.width = v80;
        v97.size.height = v81;
        v24 = v84 + CGRectGetMinY(v97);
      }
    }
  }
  -[UICollectionViewLayout collectionView](self, "collectionView", *(_QWORD *)&rect);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_currentScreenScale");
  v28 = v27;

  if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
  {
    v29 = v28;
    if (v28 == 0.0)
    {
      if (AdjustToScale_onceToken != -1)
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
      v29 = *(double *)&AdjustToScale___s;
    }
    if (v29 == 1.0)
      v25 = round(v25);
    else
      v25 = round(v25 * v29) / v29;
  }
  if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
  {
    if (v28 == 0.0)
    {
      if (AdjustToScale_onceToken != -1)
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
      v28 = *(double *)&AdjustToScale___s;
    }
    if (v28 == 1.0)
      v24 = round(v24);
    else
      v24 = round(v24 * v28) / v28;
  }

LABEL_36:
  v61 = v25;
  v62 = v24;
  v63 = v21;
  v64 = v23;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (CGRect)_frameForHeaderInSection:(int64_t)a3 usingData:(id)a4
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  _UIFlowLayoutInfo *data;
  double v31;
  _BOOL4 leftToRight;
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
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _UIFlowLayoutInfo *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double MinX;
  double v56;
  double v57;
  double v58;
  double v59;
  double MaxX;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double Width;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  BOOL v72;
  double MinY;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double Height;
  CGFloat v79;
  double MaxY;
  CGFloat v81;
  CGFloat rect;
  CGFloat rectb;
  CGFloat rectc;
  double recta;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect result;

  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = (void *)v6[13];
  else
    v8 = 0;
  v9 = v8;
  v10 = objc_msgSend(v9, "count");

  if (v10 <= a3)
  {
    v25 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_36;
  }
  if (v7)
    v11 = (void *)v7[13];
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = *(double *)(v13 + 312);
    v15 = *(double *)(v13 + 320);
    v17 = *(double *)(v13 + 328);
    v16 = *(double *)(v13 + 336);
    if (-[UICollectionViewFlowLayout _headerFollowsSectionMargins](self, "_headerFollowsSectionMargins"))
    {
LABEL_8:
      v18 = -[_UIFlowLayoutSection effectiveHeaderFrameWithSectionMarginsApplied](v13);
      v21 = v20;
      v23 = v22;
      goto LABEL_11;
    }
    v18 = *(double *)(v13 + 344);
    v19 = *(double *)(v13 + 352);
    v21 = *(double *)(v13 + 360);
    v23 = *(double *)(v13 + 368);
  }
  else
  {
    v72 = -[UICollectionViewFlowLayout _headerFollowsSectionMargins](self, "_headerFollowsSectionMargins");
    v14 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v15 = 0.0;
    v19 = 0.0;
    v21 = 0.0;
    v23 = 0.0;
    v18 = 0.0;
    if (v72)
      goto LABEL_8;
  }
LABEL_11:
  v25 = v14 + v18;
  v24 = v15 + v19;
  if ((*((_BYTE *)&self->_gridLayoutFlags + 5) & 8) != 0)
  {
    v90 = v16;
    v91 = v23;
    data = self->_data;
    v88 = v14;
    v89 = v17;
    v87 = v15;
    v31 = v21;
    if (data)
      leftToRight = data->_leftToRight;
    else
      leftToRight = 0;
    -[UIView bounds](self->super._collectionView, "bounds");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    -[UIScrollView _effectiveContentInset](self->super._collectionView, "_effectiveContentInset");
    v42 = v34 + v41;
    v44 = v36 + v43;
    v46 = v38 - (v41 + v45);
    v48 = v40 - (v43 + v47);
    v49 = self->_data;
    if (v49)
    {
      v21 = v31;
      if (v49->_horizontal)
      {
        v23 = v91;
        rect = v48;
        v50 = v42;
        v51 = v44;
        v52 = v46;
        v53 = v48;
        v54 = v46;
        if (leftToRight)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v50);
          v92.origin.x = v25;
          v92.origin.y = v24;
          v92.size.width = v21;
          v92.size.height = v91;
          if (MinX > CGRectGetMinX(v92))
          {
            v93.origin.x = v42;
            v93.origin.y = v44;
            v93.size.width = v54;
            v93.size.height = rect;
            v25 = CGRectGetMinX(v93);
          }
        }
        else
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v50);
          v94.origin.x = v25;
          v94.origin.y = v24;
          v94.size.width = v21;
          v94.size.height = v91;
          if (MaxX < CGRectGetMaxX(v94))
          {
            v95.origin.x = v42;
            v95.origin.y = v44;
            v95.size.width = v54;
            v95.size.height = rect;
            v61 = CGRectGetMaxX(v95);
            v96.origin.x = v25;
            v96.origin.y = v24;
            v96.size.width = v21;
            v96.size.height = v91;
            v25 = v61 - CGRectGetWidth(v96);
          }
        }
        if (v13)
        {
          v62 = *(_QWORD *)(v13 + 376);
          v63 = *(_QWORD *)(v13 + 384);
          v64 = *(_QWORD *)(v13 + 392);
          v65 = *(_QWORD *)(v13 + 400);
        }
        else
        {
          v63 = 0;
          v64 = 0;
          v65 = 0;
          v62 = 0;
        }
        Width = CGRectGetWidth(*(CGRect *)&v62);
        v86 = Width;
        v67 = v25;
        v68 = v24;
        v69 = v21;
        v70 = v91;
        if (leftToRight)
        {
          rectb = Width + CGRectGetMaxX(*(CGRect *)&v67);
          v97.origin.x = v88;
          v97.origin.y = v87;
          v97.size.width = v89;
          v97.size.height = v90;
          if (rectb > CGRectGetMaxX(v97))
          {
            v98.origin.x = v88;
            v98.origin.y = v87;
            v98.size.width = v89;
            v98.size.height = v90;
            v71 = CGRectGetMaxX(v98);
            v99.origin.x = v25;
            v99.origin.y = v24;
            v99.size.width = v21;
            v99.size.height = v91;
            v25 = v71 - (v86 + CGRectGetWidth(v99));
          }
        }
        else
        {
          rectc = CGRectGetMinX(*(CGRect *)&v67) - Width;
          v100.origin.x = v88;
          v100.origin.y = v87;
          v100.size.width = v89;
          v100.size.height = v90;
          if (rectc < CGRectGetMinX(v100))
          {
            v101.origin.x = v88;
            v101.origin.y = v87;
            v101.size.width = v89;
            v101.size.height = v90;
            v25 = Width + CGRectGetMinX(v101);
          }
        }
        goto LABEL_12;
      }
    }
    else
    {
      v21 = v31;
    }
    v102.origin.x = v42;
    v102.origin.y = v44;
    v102.size.width = v46;
    v81 = v46;
    v102.size.height = v48;
    MinY = CGRectGetMinY(v102);
    v103.origin.x = v25;
    v103.origin.y = v24;
    v103.size.width = v21;
    v23 = v91;
    v103.size.height = v91;
    if (MinY > CGRectGetMinY(v103))
    {
      v104.origin.x = v42;
      v104.origin.y = v44;
      v104.size.width = v81;
      v104.size.height = v48;
      v24 = CGRectGetMinY(v104);
    }
    if (v13)
    {
      v74 = *(_QWORD *)(v13 + 376);
      v75 = *(_QWORD *)(v13 + 384);
      v76 = *(_QWORD *)(v13 + 392);
      v77 = *(_QWORD *)(v13 + 400);
    }
    else
    {
      v75 = 0;
      v76 = 0;
      v77 = 0;
      v74 = 0;
    }
    Height = CGRectGetHeight(*(CGRect *)&v74);
    v105.origin.x = v25;
    v105.origin.y = v24;
    v105.size.width = v21;
    v105.size.height = v91;
    recta = Height;
    v79 = Height + CGRectGetMaxY(v105);
    v106.origin.x = v88;
    v106.origin.y = v87;
    v106.size.width = v89;
    v106.size.height = v90;
    if (v79 > CGRectGetMaxY(v106))
    {
      v107.origin.x = v88;
      v107.origin.y = v87;
      v107.size.width = v89;
      v107.size.height = v90;
      MaxY = CGRectGetMaxY(v107);
      v108.origin.x = v25;
      v108.origin.y = v24;
      v108.size.width = v21;
      v108.size.height = v91;
      v24 = MaxY - (recta + CGRectGetHeight(v108));
    }
  }
LABEL_12:
  -[UICollectionViewLayout collectionView](self, "collectionView", *(_QWORD *)&v81);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_currentScreenScale");
  v28 = v27;

  if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
  {
    v29 = v28;
    if (v28 == 0.0)
    {
      if (AdjustToScale_onceToken != -1)
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
      v29 = *(double *)&AdjustToScale___s;
    }
    if (v29 == 1.0)
      v25 = round(v25);
    else
      v25 = round(v25 * v29) / v29;
  }
  if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
  {
    if (v28 == 0.0)
    {
      if (AdjustToScale_onceToken != -1)
        dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
      v28 = *(double *)&AdjustToScale___s;
    }
    if (v28 == 1.0)
      v24 = round(v24);
    else
      v24 = round(v24 * v28) / v28;
  }

LABEL_36:
  v56 = v25;
  v57 = v24;
  v58 = v21;
  v59 = v23;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (id)_layoutAttributesForItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  BOOL IsEmpty;
  void *v10;
  _UIFlowLayoutInfo *data;
  _UIFlowLayoutInfo *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _UIFlowLayoutInfo *v54;
  _UIFlowLayoutInfo *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  _UIFlowLayoutInfo *v63;
  int v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  CGFloat MaxX;
  double v74;
  double MaxY;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  double v85;
  int64_t v86;
  double v87;
  double v88;
  double v89;
  unint64_t v90;
  uint64_t v91;
  double *WeakRetained;
  double v93;
  double v94;
  double v95;
  BOOL v96;
  double *v97;
  double v98;
  double v99;
  unint64_t v100;
  uint64_t v101;
  void *v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  BOOL v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  uint64_t v130;
  _UIFlowLayoutInfo *obj;
  double v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  int64_t v137;
  int64_t v138;
  double v139;
  double v140;
  uint64_t v141;
  uint64_t v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  double v146;
  int v147;
  uint64_t v148;
  double v149;
  uint64_t v150;
  char v151;
  id v152;
  double MinY;
  double v154;
  uint64_t v155;
  double v156;
  double v157;
  double MinX;
  double v159;
  double rect;
  double v161;
  uint64_t v162;
  void *v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v179 = *MEMORY[0x1E0C80C00];
  if (!CGRectIsEmpty(a3))
  {
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    IsEmpty = CGRectIsEmpty(v180);

    if (!IsEmpty)
    {
      if (-[UICollectionViewFlowLayout _boundsAndInsetsAreValidForReferenceDimension](self, "_boundsAndInsetsAreValidForReferenceDimension"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "_shouldReverseLayoutDirection"))
          v147 = !-[UICollectionViewLayout _wantsRightToLeftHorizontalMirroringIfNeeded](self, "_wantsRightToLeftHorizontalMirroringIfNeeded");
        else
          v147 = 0;

        while (1)
        {
          -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", x, y, width, height);
          data = self->_data;
          if (data)
            data = (_UIFlowLayoutInfo *)data->_sections;
          v13 = data;
          -[UICollectionViewLayout _sections](self, "_sections");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v135, "firstIndex");
          v172 = 0u;
          v173 = 0u;
          v174 = 0u;
          v175 = 0u;
          obj = v13;
          v136 = -[_UIFlowLayoutInfo countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v172, v178, 16);
          if (v136)
            break;
LABEL_174:

          if ((*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
          {

            return v163;
          }
          objc_msgSend(v163, "removeAllObjects");
          -[_UIFlowLayoutInfo invalidate:]((uint64_t)self->_data, 1);

        }
        v162 = 0;
        v134 = *(_QWORD *)v173;
LABEL_14:
        v15 = 0;
        v16 = 0x1E0CB3000uLL;
        while (1)
        {
          if (*(_QWORD *)v173 != v134)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * v15);
          v141 = v15;
          if (v17)
          {
            v18 = *(double *)(v17 + 312);
            v19 = *(double *)(v17 + 320);
            v20 = *(_QWORD *)(v17 + 328);
            v21 = *(_QWORD *)(v17 + 336);
          }
          else
          {
            v19 = 0.0;
            v20 = 0;
            v21 = 0;
            v18 = 0.0;
          }
          rect = v19;
          v161 = v18;
          v144 = v21;
          v145 = v20;
          v191.origin.x = x;
          v191.origin.y = y;
          v191.size.width = width;
          v191.size.height = height;
          v181 = CGRectIntersection(*(CGRect *)&v18, v191);
          v22 = v181.origin.x;
          v23 = v181.origin.y;
          v24 = v181.size.width;
          v25 = v181.size.height;
          if (CGRectIsNull(v181))
            goto LABEL_61;
          if (v17 && *(_QWORD *)(v17 + 208))
            break;
          if (v135)
            v14 = objc_msgSend(v135, "indexGreaterThanIndex:", v14);
          else
            ++v14;
LABEL_65:
          ++v162;
          if (++v15 == v136)
          {
            v130 = -[_UIFlowLayoutInfo countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v172, v178, 16);
            v136 = v130;
            if (!v130)
              goto LABEL_174;
            goto LABEL_14;
          }
        }
        if (*(_BYTE *)(v17 + 88) && !-[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
        {
          v63 = self->_data;
          if (v63 && v63->_horizontal)
          {
            v64 = 1;
            v65 = 0.0;
            v66 = v161;
            v67 = v161;
          }
          else
          {
            v64 = 0;
            v67 = 0.0;
            v65 = rect;
            v66 = v161;
          }
          v68 = v22 - v67;
          v69 = v23 - v65;
          if (v147)
          {
            v70 = rect;
            v72 = v144;
            v71 = v145;
            v156 = CGRectGetWidth(*(CGRect *)&v66);
            v184.origin.x = v68;
            v184.origin.y = v69;
            v184.size.width = v24;
            v184.size.height = v25;
            v157 = v156 - CGRectGetWidth(v184);
            v185.origin.x = v68;
            v185.origin.y = v69;
            v185.size.width = v24;
            v185.size.height = v25;
            v68 = v157 - CGRectGetMinX(v185);
          }
          v186.origin.x = v68;
          v186.origin.y = v69;
          v186.size.width = v24;
          v186.size.height = v25;
          MinX = CGRectGetMinX(v186);
          v187.origin.x = v68;
          v187.origin.y = v69;
          v187.size.width = v24;
          v187.size.height = v25;
          MinY = CGRectGetMinY(v187);
          v188.origin.x = v68;
          v188.origin.y = v69;
          v188.size.width = v24;
          v188.size.height = v25;
          MaxX = CGRectGetMaxX(v188);
          v189.origin.y = v69;
          v74 = MaxX;
          v189.origin.x = v68;
          v189.size.width = v24;
          v189.size.height = v25;
          MaxY = CGRectGetMaxY(v189);
          v76 = MinY;
          if (v64)
            v77 = MinY;
          else
            v77 = MinX;
          if (v64)
          {
            v76 = MinX;
            v78 = MaxY;
          }
          else
          {
            v78 = v74;
          }
          if (v64)
            MaxY = v74;
          v79 = *(double *)(v17 + 248);
          v80 = *(double *)(v17 + 256);
          if (v64)
            v81 = *(double *)(v17 + 248);
          else
            v81 = *(double *)(v17 + 256);
          v159 = *(double *)(v17 + 248);
          if (v64)
            v79 = *(double *)(v17 + 256);
          v154 = v79;
          v82 = *(double *)(v17 + 152);
          if (v76 <= v82)
          {
            v84 = -1;
          }
          else
          {
            v83 = v81 + *(double *)(v17 + 112);
            if (fabs(v83) <= 2.22044605e-16)
              v84 = -1;
            else
              v84 = vcvtmd_s64_f64((v76 - v82) / v83);
            if (v81 + v82 + v83 * (double)v84 < v76)
              ++v84;
          }
          if (MaxY <= v82)
            goto LABEL_174;
          v85 = v81 + *(double *)(v17 + 112);
          if (fabs(v85) <= 2.22044605e-16)
            goto LABEL_174;
          v86 = vcvtmd_s64_f64((MaxY - v82) / v85);
          if (v86 == -1)
            goto LABEL_174;
          if (v84 == -1)
            v84 = 0;
          v133 = v84;
          v87 = *(double *)(v17 + 160);
          if (v77 <= v87)
          {
            v91 = -1;
          }
          else
          {
            v88 = v154 + *(double *)(v17 + 176);
            v89 = (v77 - v87) / v88;
            v90 = vcvtmd_s64_f64(v89);
            v91 = v154 + v87 + v88 * (double)(uint64_t)floor(v89) >= v77 ? v90 : v90 + 1;
          }
          v132 = v81;
          if (v78 <= v87)
          {
            v100 = -1;
          }
          else
          {
            WeakRetained = (double *)objc_loadWeakRetained((id *)(v17 + 144));
            v93 = v80;
            if (WeakRetained)
              v94 = WeakRetained[14];
            else
              v94 = 0.0;
            v95 = v94 - *(double *)(v17 + 168);

            v96 = v78 <= v95;
            v80 = v93;
            if (!v96)
            {
              v97 = (double *)objc_loadWeakRetained((id *)(v17 + 144));
              if (v97)
                v98 = v97[14];
              else
                v98 = 0.0;
              v78 = v98 - *(double *)(v17 + 168);

            }
            v99 = *(double *)(v17 + 176);
            v100 = vcvtmd_s64_f64((v78 - *(double *)(v17 + 160) + v99) / (v154 + v99))
                 - (*(double *)(v17 + 160)
                  + (v154 + v99) * (double)(uint64_t)floor((v78 - *(double *)(v17 + 160) + v99) / (v154 + v99)) >= v78);
          }
          v138 = v100;
          if (v91 == -1 && v100 == -1)
            goto LABEL_174;
          if (v91 == -1)
            v101 = 0;
          else
            v101 = v91;
          v142 = v101;
          -[UICollectionViewLayout collectionView](self, "collectionView");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "_currentScreenScale");
          v149 = v103;

          v137 = v86 - v133;
          v16 = 0x1E0CB3000uLL;
          v151 = v64;
          if (v86 >= v133)
          {
            v104 = 0;
            v105 = v133;
            do
            {
              if (v138 >= v142)
              {
                v107 = *(double *)(v17 + 152) + (v132 + *(double *)(v17 + 112)) * (double)(v104 + v133);
                v143 = rect + v107;
                v146 = v161 + v107;
                v139 = round(v161 + v107);
                v140 = round(rect + v107);
                v108 = *(_QWORD *)(v17 + 216) * v105;
                v109 = v142;
                do
                {
                  if (v108 + v109 >= *(_QWORD *)(v17 + 208))
                    break;
                  objc_msgSend(*(id *)(v16 + 1712), "indexPathForItem:inSection:");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UICollectionViewFlowLayout _existingLayoutAttributesForItemAtIndexPath:](self, "_existingLayoutAttributesForItemAtIndexPath:", v110);
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v111)
                    goto LABEL_167;
                  v112 = *(double *)(v17 + 160) + (v154 + *(double *)(v17 + 176)) * (double)v109;
                  if ((v151 & 1) != 0)
                  {
                    v113 = v146;
                    if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
                    {
                      v114 = v149;
                      if (v149 == 0.0)
                      {
                        if (AdjustToScale_onceToken != -1)
                          dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
                        v114 = *(double *)&AdjustToScale___s;
                      }
                      v106 = v114 == 1.0;
                      v115 = round(v146 * v114) / v114;
                      if (v106)
                        v113 = v139;
                      else
                        v113 = v115;
                    }
                    v116 = v112 + 0.0;
                    if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
                    {
                      v117 = v149;
                      v118 = v161;
                      v119 = v113;
                      if (v149 == 0.0)
                      {
                        if (AdjustToScale_onceToken != -1)
                        {
                          dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
                          v118 = v161;
                        }
                        v117 = *(double *)&AdjustToScale___s;
                      }
                      v116 = v117 == 1.0 ? round(v116) : round(v116 * v117) / v117;
                    }
                    else
                    {
                      v118 = v161;
                      v119 = v113;
                    }
                  }
                  else
                  {
                    v119 = v112 + 0.0;
                    if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
                    {
                      v120 = v149;
                      if (v149 == 0.0)
                      {
                        if (AdjustToScale_onceToken != -1)
                          dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
                        v120 = *(double *)&AdjustToScale___s;
                      }
                      if (v120 == 1.0)
                        v119 = round(v119);
                      else
                        v119 = round(v119 * v120) / v120;
                    }
                    if (-[UICollectionViewFlowLayout _roundsToScreenScale](self, "_roundsToScreenScale"))
                    {
                      v121 = v149;
                      v118 = v161;
                      if (v149 == 0.0)
                      {
                        if (AdjustToScale_onceToken != -1)
                        {
                          dispatch_once(&AdjustToScale_onceToken, &__block_literal_global_113);
                          v118 = v161;
                        }
                        v121 = *(double *)&AdjustToScale___s;
                      }
                      v122 = round(v143 * v121) / v121;
                      v116 = v121 == 1.0 ? v140 : v122;
                    }
                    else
                    {
                      v116 = v143;
                      v118 = v161;
                    }
                  }
                  v123 = rect;
                  if (v147)
                  {
                    v124 = v119 - v118;
                    v126 = v144;
                    v125 = v145;
                    v127 = CGRectGetWidth(*(CGRect *)&v118);
                    v128 = v119;
                    v129 = v127;
                    v190.origin.x = v128;
                    v190.origin.y = v116;
                    v190.size.width = v159;
                    v190.size.height = v80;
                    v119 = v161 + v129 - CGRectGetWidth(v190) - v124;
                  }
                  -[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](self, "_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:", v110, v119, v116, v159, v80);
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v111)
                  {
LABEL_167:
                    objc_msgSend(v163, "addObject:", v111);

                  }
                  ++v109;
                  v16 = 0x1E0CB3000;
                }
                while (v138 + 1 != v109);
              }
              ++v105;
              v106 = v104++ == v137;
            }
            while (!v106);
          }
        }
        else
        {
          v26 = *(_QWORD *)(v17 + 264);
          v168 = 0u;
          v169 = 0u;
          v170 = 0u;
          v171 = 0u;
          v152 = *(id *)(v17 + 104);
          v27 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v168, v177, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v169;
            v148 = *(_QWORD *)v169;
            do
            {
              v30 = 0;
              v150 = v28;
              do
              {
                if (*(_QWORD *)v169 != v29)
                  objc_enumerationMutation(v152);
                v31 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * v30);
                if (v31)
                {
                  v32 = *(double *)(v31 + 72);
                  v33 = *(double *)(v31 + 80);
                  v34 = *(_QWORD *)(v31 + 88);
                  v35 = *(_QWORD *)(v31 + 96);
                }
                else
                {
                  v33 = 0.0;
                  v34 = 0;
                  v35 = 0;
                  v32 = 0.0;
                }
                v36 = v161 + v32;
                v37 = rect + v33;
                v192.origin.x = x;
                v192.origin.y = y;
                v192.size.width = width;
                v192.size.height = height;
                if (CGRectIntersectsRect(*(CGRect *)(&v34 - 2), v192))
                {
                  v166 = 0u;
                  v167 = 0u;
                  v164 = 0u;
                  v165 = 0u;
                  v155 = v30;
                  if (v31)
                    v38 = *(void **)(v31 + 40);
                  else
                    v38 = 0;
                  v39 = v38;
                  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v164, v176, 16);
                  if (v40)
                  {
                    v41 = v40;
                    v42 = *(_QWORD *)v165;
                    while (1)
                    {
                      if (*(_QWORD *)v165 != v42)
                        objc_enumerationMutation(v39);
                      objc_msgSend(*(id *)(v16 + 1712), "indexPathForItem:inSection:", v26, v14);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      -[UICollectionViewFlowLayout _existingLayoutAttributesForItemAtIndexPath:](self, "_existingLayoutAttributesForItemAtIndexPath:", v43);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v45 = v44;
                      if (v44)
                      {
                        objc_msgSend(v44, "frame");
                        v47 = v46;
                        v49 = v48;
                        v51 = v50;
                        v53 = v52;
                      }
                      else
                      {
                        v54 = self->_data;
                        if (v54)
                          v54 = (_UIFlowLayoutInfo *)v54->_sections;
                        v55 = v54;
                        -[_UIFlowLayoutInfo objectAtIndexedSubscript:](v55, "objectAtIndexedSubscript:", v162);
                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                        -[UICollectionViewFlowLayout _frameForItem:inSection:usingData:](self, "_frameForItem:inSection:usingData:", v26, v14, v56);
                        v47 = v57;
                        v49 = v58;
                        v51 = v59;
                        v53 = v60;

                        v16 = 0x1E0CB3000;
                      }
                      v182.origin.x = v47;
                      v182.origin.y = v49;
                      v182.size.width = v51;
                      v182.size.height = v53;
                      v193.origin.x = x;
                      v193.origin.y = y;
                      v193.size.width = width;
                      v193.size.height = height;
                      v183 = CGRectIntersection(v182, v193);
                      if (!CGRectIsNull(v183))
                      {
                        if (v45
                          || (-[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](self, "_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:", v43, v47, v49, v51, v53), (v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          objc_msgSend(v163, "addObject:", v45);
                        }
                      }
                      ++v26;

                      if (!--v41)
                      {
                        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v164, v176, 16);
                        if (!v41)
                          break;
                      }
                    }
                    v29 = v148;
                    v28 = v150;
                  }
                  v30 = v155;
                }
                else
                {
                  if (v31)
                    v61 = *(void **)(v31 + 40);
                  else
                    v61 = 0;
                  v39 = v61;
                  v26 += objc_msgSend(v39, "count");
                }

                ++v30;
              }
              while (v30 != v28);
              v62 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v168, v177, 16);
              v28 = v62;
            }
            while (v62);
          }

        }
LABEL_61:
        if (v135)
          v14 = objc_msgSend(v135, "indexGreaterThanIndex:", v14);
        else
          ++v14;
        v15 = v141;
        goto LABEL_65;
      }
    }
  }
  v163 = (void *)MEMORY[0x1E0C9AA60];
  return v163;
}

- (BOOL)_roundsToScreenScale
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 1) & 1;
}

- (id)_existingLayoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSMutableDictionary *cachedItemAttributes;
  NSMutableDictionary *cachedItemFrames;
  _QWORD block[4];
  id v24;
  void *v25;
  UICollectionViewFlowLayout *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItemFrames, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItemAttributes, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "CGRectValue");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v6, "frame");
      v32.origin.x = v8;
      v32.origin.y = v10;
      v32.size.width = v12;
      v32.size.height = v14;
      if (!CGRectEqualToRect(v31, v32))
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __74__UICollectionViewFlowLayout__existingLayoutAttributesForItemAtIndexPath___block_invoke;
        block[3] = &unk_1E16BDF18;
        v15 = v4;
        v24 = v15;
        v25 = v6;
        v27 = v8;
        v28 = v10;
        v29 = v12;
        v30 = v14;
        v26 = self;
        v16 = _existingLayoutAttributesForItemAtIndexPath__onceToken;
        v17 = v6;
        v18 = v17;
        if (v16 == -1)
        {
          v19 = v17;
        }
        else
        {
          dispatch_once(&_existingLayoutAttributesForItemAtIndexPath__onceToken, block);
          v15 = v24;
          v19 = v25;
        }
        cachedItemAttributes = self->_cachedItemAttributes;
        self->_cachedItemAttributes = 0;

        cachedItemFrames = self->_cachedItemFrames;
        self->_cachedItemFrames = 0;

        v6 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(v6, "setFrame:", v8, v10, v12, v14);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;

  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", x, y, width, height);
    if (!-[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItemAttributes, "setObject:forKeyedSubscript:", v10, a3);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItemFrames, "setObject:forKeyedSubscript:", v11, a3);

    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  width = self->_currentLayoutSize.width;
  height = self->_currentLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_fetchItemsInfoForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int v8;
  int v9;
  unsigned int v10;
  _QWORD block[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (((*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) == 0
     || -[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
    && -[UICollectionViewFlowLayout _boundsAndInsetsAreValidForReferenceDimension](self, "_boundsAndInsetsAreValidForReferenceDimension"))
  {
    v8 = dyld_program_sdk_at_least();
    v9 = *((_DWORD *)&self->_gridLayoutFlags + 1);
    if (v8 && (v9 & 0x8000) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__UICollectionViewFlowLayout__fetchItemsInfoForRect___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      if (_fetchItemsInfoForRect__once != -1)
        dispatch_once(&_fetchItemsInfoForRect__once, block);
      v9 = *((_DWORD *)&self->_gridLayoutFlags + 1);
    }
    *((_DWORD *)&self->_gridLayoutFlags + 1) = v9 | 0x8000;
    -[UICollectionViewFlowLayout _updateDelegateFlags](self, "_updateDelegateFlags");
    v10 = *((_DWORD *)&self->_gridLayoutFlags + 1);
    if ((v10 & 0x100) == 0)
    {
      -[UICollectionViewFlowLayout _getSizingInfosWithExistingSizingDictionary:](self, "_getSizingInfosWithExistingSizingDictionary:", 0);
      *((_DWORD *)&self->_gridLayoutFlags + 1) |= 0x100u;
    }
    -[UICollectionViewFlowLayout _updateItemsLayoutForRect:allowsPartialUpdate:](self, "_updateItemsLayoutForRect:allowsPartialUpdate:", (v10 >> 8) & 1, x, y, width, height);
    *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFF7F7F | 0x80;
  }
}

- (BOOL)_boundsAndInsetsAreValidForReferenceDimension
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t scrollDirection;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  scrollDirection = self->_scrollDirection;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_effectiveContentInset");
  v11 = v10;
  v13 = v12;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_effectiveContentInset");
  v16 = v15;
  v18 = v17;

  v19 = v5 - v13 - v18;
  if (scrollDirection)
    v19 = v7 - v11 - v16;
  if (v19 < 0.0)
    v19 = 0.0;
  return v19 > 0.0;
}

- (void)_updateDelegateFlags
{
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  id v11;

  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_delegateActual");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 2;
  else
    v4 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFFD | v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 4;
  else
    v5 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFFB | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 8;
  else
    v6 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFF7 | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 16;
  else
    v7 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFEF | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 32;
  else
    v8 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFDF | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 64;
  else
    v9 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFFBF | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 1024;
  else
    v10 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFBFF | v10;

}

- (void)_getSizingInfosWithExistingSizingDictionary:(id)a3
{
  id v4;
  void *v5;
  _UIFlowLayoutInfo *data;
  int64_t *p_scrollDirection;
  _UIFlowLayoutInfo *v8;
  _UIFlowLayoutInfo *v9;
  _UIFlowLayoutInfo *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  _QWORD *v16;
  __int128 v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  uint64_t v27;
  double v28;
  double v29;
  int v30;
  _BOOL4 v31;
  void *v32;
  double *v33;
  double v34;
  double v35;
  unint64_t v38;
  NSObject *v39;
  UICollectionView *collectionView;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t j;
  uint64_t v47;
  BOOL v48;
  void *v49;
  NSObject *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int v55;
  void *v56;
  double v57;
  double v58;
  int v59;
  _BOOL4 v60;
  void *v61;
  double v62;
  double v63;
  int v64;
  _BOOL4 v65;
  void *v66;
  double *v67;
  double v68;
  double v69;
  char v72;
  unint64_t v73;
  NSObject *v74;
  UICollectionView *v75;
  unint64_t v76;
  UICollectionView *v77;
  UICollectionView *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id *v97;
  uint64_t v98;
  char *v99;
  uint64_t *v100;
  double *v101;
  id *v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  double v106;
  double v107;
  uint64_t v108;
  void *v109;
  id v110;
  double bottom;
  double right;
  double top;
  double left;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  NSDictionary *v133;
  void *v134;
  unsigned int v135;
  void *v136;
  uint64_t v137;
  void *v138;
  int v139;
  double width;
  double height;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  double v149;
  double v150;
  BOOL v151;
  double v152;
  void *v153;
  __int128 v154;
  uint64_t v155;
  void *v156;
  id v157;
  UICollectionViewFlowLayout *v158;
  double *v159;
  uint64_t *v160;
  _BOOL4 v161;
  SEL v162;
  __int128 *v163;
  __int128 *v164;
  _QWORD *v165;
  double v166;
  _BOOL4 v167;
  id v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  _QWORD *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  char *v177;
  int64_t *v178;
  int v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  _QWORD v183[2];
  void (*v184)(uint64_t, unint64_t, uint64_t, double, double);
  void *v185;
  UICollectionViewFlowLayout *v186;
  id v187;
  uint64_t *v188;
  uint64_t *v189;
  SEL v190;
  BOOL v191;
  uint64_t v192;
  uint64_t *v193;
  uint64_t v194;
  char v195;
  uint64_t v196;
  double *v197;
  uint64_t v198;
  void *v199;
  char v200;
  uint8_t buf[4];
  UICollectionView *v202;
  __int16 v203;
  uint64_t v204;
  __int16 v205;
  uint64_t v206;
  __int16 v207;
  id v208;
  __int16 v209;
  UICollectionView *v210;
  uint64_t v211;
  CGSize v212;
  CGSize v213;

  v162 = a2;
  v211 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_delegateProxy");
  v180 = (id)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  v170 = 392;
  if (data)
  {
    p_scrollDirection = &self->_scrollDirection;
    goto LABEL_10;
  }
  v8 = objc_alloc_init(_UIFlowLayoutInfo);
  v9 = self->_data;
  self->_data = v8;

  v10 = self->_data;
  if (v10)
    objc_storeWeak((id *)&v10->_layout, self);
  if (objc_msgSend(v5, "_shouldReverseLayoutDirection"))
    v11 = -[UICollectionViewLayout _wantsRightToLeftHorizontalMirroringIfNeeded](self, "_wantsRightToLeftHorizontalMirroringIfNeeded");
  else
    v11 = 1;
  v12 = v170;
  v13 = *(uint64_t *)((char *)&self->super.super.isa + v170);
  if (v13)
  {
    *(_BYTE *)(v13 + 98) = v11;
    data = *(_UIFlowLayoutInfo **)((char *)&self->super.super.isa + v12);
    p_scrollDirection = &self->_scrollDirection;
    if (!data)
    {
LABEL_195:
      v167 = 0;
      goto LABEL_12;
    }
LABEL_10:
    data->_horizontal = *p_scrollDirection == 1;
    v14 = *(uint64_t *)((char *)&self->super.super.isa + v170);
    if (v14)
    {
      v167 = *(unsigned __int8 *)(v14 + 97) != 0;
      goto LABEL_12;
    }
    goto LABEL_195;
  }
  v167 = 0;
  p_scrollDirection = &self->_scrollDirection;
LABEL_12:
  -[UICollectionViewFlowLayout _dimensionFromCollectionView](self, "_dimensionFromCollectionView");
  v166 = v15;
  v181 = 276;
  if ((*(_WORD *)(&self->_gridLayoutFlags + 1) & 0x401) != 0)
    v179 = 0;
  else
    v179 = !-[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes");
  v16 = *(Class *)((char *)&self->super.super.isa + v170);
  v178 = p_scrollDirection;
  if (v16)
    v16 = (_QWORD *)v16[13];
  v172 = v16;
  v175 = objc_msgSend(v172, "count");
  v161 = v175 != 0;
  -[UICollectionViewLayout _sections](self, "_sections");
  v176 = (id)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend(v176, "firstIndex");
  v173 = objc_msgSend(v5, "numberOfSections");
  if (v182 < v173)
  {
    v169 = &v200;
    v18 = 1;
    v19 = *MEMORY[0x1E0C9D820];
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v167)
      v18 = 2;
    v171 = v18;
    *(_QWORD *)&v17 = 138412290;
    v154 = v17;
    v157 = v4;
    v156 = v5;
    v158 = self;
    while (1)
    {
      if (v175)
        objc_msgSend(v172, "objectAtIndexedSubscript:", 0);
      else
        -[_UIFlowLayoutInfo addSection](*(id **)((char *)&self->super.super.isa + v170));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v5, "numberOfItemsInSection:", v182, (_QWORD)v154, *((_QWORD *)&v154 + 1));
      v23 = v22;
      if (v21)
        *(_QWORD *)(v21 + 208) = v22;
      if ((v179 & 1) == 0)
        break;
LABEL_140:
      if ((*((_BYTE *)&self->super.super.isa + v181) & 8) != 0)
      {
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "collectionView:layout:insetForSectionAtIndex:", v115, self, v182);
        if (!v21)
        {

LABEL_187:
          left = 0.0;
          bottom = 0.0;
          right = 0.0;
          top = 0.0;
          if (!self->_sectionInsetReference)
            goto LABEL_149;
          goto LABEL_147;
        }
        *(_QWORD *)(v21 + 280) = v116;
        *(_QWORD *)(v21 + 288) = v117;
        *(_QWORD *)(v21 + 296) = v118;
        *(_QWORD *)(v21 + 304) = v119;

        if (!self->_sectionInsetReference)
          goto LABEL_149;
        top = *(double *)(v21 + 280);
        left = *(double *)(v21 + 288);
        bottom = *(double *)(v21 + 296);
        right = *(double *)(v21 + 304);
      }
      else
      {
        if (!v21)
          goto LABEL_187;
        bottom = self->_sectionInset.bottom;
        right = self->_sectionInset.right;
        top = self->_sectionInset.top;
        left = self->_sectionInset.left;
        *(double *)(v21 + 280) = top;
        *(double *)(v21 + 288) = left;
        *(double *)(v21 + 296) = bottom;
        *(double *)(v21 + 304) = right;
        if (!self->_sectionInsetReference)
          goto LABEL_149;
      }
LABEL_147:
      -[UICollectionViewFlowLayout _adjustedSectionInsetForSectionInset:forAxis:](self, "_adjustedSectionInsetForSectionInset:forAxis:", v171, top, left, bottom, right);
      if (v21)
      {
        *(_QWORD *)(v21 + 280) = v120;
        *(_QWORD *)(v21 + 288) = v121;
        *(_QWORD *)(v21 + 296) = v122;
        *(_QWORD *)(v21 + 304) = v123;
      }
LABEL_149:
      if ((*((_BYTE *)&self->super.super.isa + v181) & 0x10) != 0)
      {
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "collectionView:layout:minimumInteritemSpacingForSectionAtIndex:", v125, self, v182);
        if (v21)
          *(_QWORD *)(v21 + 120) = v126;

      }
      else
      {
        -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
        if (v21)
          *(_QWORD *)(v21 + 120) = v124;
      }
      if ((*((_BYTE *)&self->super.super.isa + v181) & 0x20) != 0)
      {
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "collectionView:layout:minimumLineSpacingForSectionAtIndex:", v128, self, v182);
        if (v21)
        {
          *(_QWORD *)(v21 + 112) = v129;

LABEL_160:
          if ((v179 & 1) != 0)
          {
            *(_BYTE *)(v21 + 88) = 1;
            -[UICollectionViewFlowLayout itemSize](self, "itemSize");
            *(_QWORD *)(v21 + 248) = v130;
            *(_QWORD *)(v21 + 256) = v131;
          }
          goto LABEL_162;
        }

      }
      else
      {
        -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
        if (v21)
        {
          *(_QWORD *)(v21 + 112) = v127;
          goto LABEL_160;
        }
      }
      if ((v179 & 1) != 0)
        -[UICollectionViewFlowLayout itemSize](self, "itemSize");
LABEL_162:
      if ((*((_BYTE *)&self->super.super.isa + v181) & 0x40) == 0
        || (-[UICollectionViewLayout collectionView](self, "collectionView"),
            v132 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v180, "_collectionView:layout:flowLayoutRowAlignmentOptionsForSection:", v132, self, v182),
            v133 = (NSDictionary *)objc_claimAutoreleasedReturnValue(),
            v132,
            !v133))
      {
        v133 = self->_rowAlignmentsOptionsDictionary;
        if (!v133)
        {
          v135 = 0;
          v137 = 0;
          v139 = 0;
          if (!v21)
            goto LABEL_167;
LABEL_166:
          *(_QWORD *)(v21 + 232) = v135 | (unint64_t)(v137 << 32);
          *(_DWORD *)(v21 + 240) = v139;
          goto LABEL_167;
        }
      }
      -[NSDictionary objectForKeyedSubscript:](v133, "objectForKeyedSubscript:", CFSTR("UIFlowLayoutCommonRowHorizontalAlignmentKey"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend(v134, "intValue");

      -[NSDictionary objectForKeyedSubscript:](v133, "objectForKeyedSubscript:", CFSTR("UIFlowLayoutLastRowHorizontalAlignmentKey"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend(v136, "intValue");

      -[NSDictionary objectForKeyedSubscript:](v133, "objectForKeyedSubscript:", CFSTR("UIFlowLayoutRowVerticalAlignmentKey"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend(v138, "intValue");

      if (v21)
        goto LABEL_166;
LABEL_167:
      if ((*((_BYTE *)&self->super.super.isa + v181) & 2) != 0)
      {
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "collectionView:layout:referenceSizeForHeaderInSection:", v142, self, v182);
        width = v143;
        height = v144;

      }
      else
      {
        width = self->_headerReferenceSize.width;
        height = self->_headerReferenceSize.height;
      }
      if (*v178)
        v145 = width;
      else
        v145 = height;
      -[_UIFlowLayoutSection setHeaderDimension:forSection:](v21, v182, v145);
      if ((*((_BYTE *)&self->super.super.isa + v181) & 4) != 0)
      {
        -[UICollectionViewLayout collectionView](self, "collectionView");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "collectionView:layout:referenceSizeForFooterInSection:", v148, self, v182);
        v146 = v149;
        v147 = v150;

      }
      else
      {
        v146 = self->_footerReferenceSize.width;
        v147 = self->_footerReferenceSize.height;
      }
      v151 = v176 == 0;
      if (*v178)
        v152 = v146;
      else
        v152 = v147;
      -[_UIFlowLayoutSection setFooterDimension:forSection:](v21, v182, v152);
      if (v151)
        ++v182;
      else
        v182 = objc_msgSend(v176, "indexGreaterThanIndex:", v182);

      if (v182 >= v173)
        goto LABEL_194;
    }
    v196 = 0;
    v197 = (double *)&v196;
    v198 = 0x3010000000;
    v199 = &unk_18685B0AF;
    *(_OWORD *)v169 = *MEMORY[0x1E0C9D820];
    v192 = 0;
    v193 = &v192;
    v194 = 0x2020000000;
    v195 = 0;
    v195 = !-[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes");
    if (v175)
    {
      if (v23 >= 1)
      {
        for (i = 0; i != v23; ++i)
        {
          if (v21)
            v25 = *(void **)(v21 + 96);
          else
            v25 = 0;
          v26 = v25;
          objc_msgSend(v26, "objectAtIndexedSubscript:", i);
          v27 = objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            v28 = *(double *)(v27 + 48);
            v29 = *(double *)(v27 + 56);
          }
          else
          {
            v28 = 0.0;
            v29 = 0.0;
          }
          v30 = dyld_program_sdk_at_least();
          v31 = v28 < 0.0;
          if (v29 < 0.0)
            v31 = 1;
          if (v30)
          {
            if (v31)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v162, self, CFSTR("UICollectionViewFlowLayout.m"), 1462, CFSTR("Negative sizes are not supported by flow layout. Collection view: %@"), self->super._collectionView);

            }
          }
          else if (v31)
          {
            v38 = qword_1ECD78E48;
            if (!qword_1ECD78E48)
            {
              v38 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v38, (unint64_t *)&qword_1ECD78E48);
            }
            v39 = *(NSObject **)(v38 + 8);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              collectionView = self->super._collectionView;
              *(_DWORD *)buf = v154;
              v202 = collectionView;
              _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "Negative sizes are not supported by flow layout. Collection view: %@", buf, 0xCu);
            }
          }
          if (*((_BYTE *)v193 + 24))
          {
            v33 = v197;
            v34 = v197[4];
            v35 = v197[5];
            if (v19 == v34 && v20 == v35)
            {
              v197[4] = v28;
              v33[5] = v29;
            }
            else if (v28 != v34 || v29 != v35)
            {
              *((_BYTE *)v193 + 24) = 0;
            }
          }
          if (v27)
          {
            *(_QWORD *)(v27 + 32) = 0;
            *(_QWORD *)(v27 + 40) = 0;
            *(double *)(v27 + 48) = v28;
            *(double *)(v27 + 56) = v29;
          }

        }
      }
      goto LABEL_134;
    }
    if ((*((_BYTE *)&self->super.super.isa + v181 + 1) & 4) != 0)
    {
      objc_msgSend(v180, "_collectionView:layout:sizesForItemsInSection:", v5, self, v182);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v183[0] = MEMORY[0x1E0C809B0];
      v183[1] = 3221225472;
      v184 = __74__UICollectionViewFlowLayout__getSizingInfosWithExistingSizingDictionary___block_invoke;
      v185 = &unk_1E16BDF40;
      v190 = v162;
      v186 = self;
      v191 = v161;
      v80 = (id)v21;
      v163 = &v154;
      v187 = v80;
      v188 = &v192;
      v189 = &v196;
      v81 = v79;
      v165 = v183;
      v82 = objc_msgSend(v81, "count");
      v164 = &v154;
      MEMORY[0x1E0C80A78](v82);
      v83 = (char *)&v154 - ((8 * v82 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v83, 8 * v82);
      MEMORY[0x1E0C80A78](v84);
      bzero(v83, 8 * v82);
      v85 = objc_msgSend(v81, "getObjects:andKeys:count:", v83, v83, v82);
      v168 = v81;
      v86 = MEMORY[0x1E0C80A78](v85);
      v87 = MEMORY[0x1E0C80A78](v86);
      v177 = v83;
      v88 = MEMORY[0x1E0C80A78](v87);
      MEMORY[0x1E0C80A78](v88);
      if (v82)
      {
        v90 = 0;
        v91 = (uint64_t *)&v154 - 2 * v82 + 1;
        v92 = (_QWORD *)(v89 + 8);
        v159 = (double *)(v89 + 8);
        v160 = v91;
        do
        {
          objc_msgSend(*(id *)((char *)&v154 + 8 * v90 - ((8 * v82 + 15) & 0xFFFFFFFFFFFFFFF0)), "CGSizeValue");
          *(v92 - 1) = v93;
          *v92 = v94;
          *(_QWORD *)&v177[8 * v90] = 1;
          v95 = objc_msgSend(*(id *)&v83[8 * v90], "rangeCount");
          *(_QWORD *)((char *)&v154 + 8 * v90 - ((8 * v82 + 15) & 0xFFFFFFFFFFFFFFF0)) = v95;
          if (v95)
          {
            *(v91 - 1) = objc_msgSend(*(id *)&v83[8 * v90], "rangeAtIndex:", 0);
            *v91 = v96;
          }
          ++v90;
          v91 += 2;
          v92 += 2;
        }
        while (v82 != v90);
        v174 = 0;
LABEL_121:
        v97 = (id *)((char *)&v154 - ((8 * v82 + 15) & 0xFFFFFFFFFFFFFFF0));
        v98 = v82;
        v99 = v177;
        v100 = v160;
        v101 = v159;
        v102 = v97;
        do
        {
          v103 = *(_QWORD *)v99;
          v105 = (unint64_t)*v97++;
          v104 = v105;
          if (*(_QWORD *)v99 <= v105 && *(v100 - 1) == v174)
          {
            v106 = *(v101 - 1);
            v107 = *v101;
            v155 = *v100;
            ((void (*)(_QWORD *, uint64_t, double, double))v184)(v165, v174, v106, v107);
            if (v103 < v104)
            {
              *(v100 - 1) = objc_msgSend(*v102, "rangeAtIndex:", v103);
              *v100 = v108;
            }
            v174 += v155;
            *(_QWORD *)v99 = v103 + 1;
            goto LABEL_121;
          }
          ++v102;
          v101 += 2;
          v100 += 2;
          v99 += 8;
          --v98;
        }
        while (v98);
        v4 = v157;
        v5 = v156;
      }
      else
      {
        v174 = 0;
      }

      self = v158;
      if (v174 != v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "handleFailureInMethod:object:file:lineNumber:description:", v162, v158, CFSTR("UICollectionViewFlowLayout.m"), 1497, CFSTR("not all items covered by _collectionView:layout:sizesForItemsInSection:"));

        self = v158;
      }

    }
    else
    {
      if (v21)
        v41 = *(void **)(v21 + 96);
      else
        v41 = 0;
      v168 = v41;
      -[UICollectionViewFlowLayout itemSize](self, "itemSize");
      if (v23 >= 1)
      {
        v44 = v42;
        v45 = v43;
        for (j = 0; v23 != j; ++j)
        {
          -[_UIFlowLayoutSection addItem]((id *)v21);
          v47 = objc_claimAutoreleasedReturnValue();

          v48 = (*(_DWORD *)((_BYTE *)&self->super.super.isa + v181) & 1) == 0;
          if ((*(_DWORD *)((_BYTE *)&self->super.super.isa + v181) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", j, v182);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v180, "collectionView:layout:sizeForItemAtIndexPath:", v5, self, v56);
            v53 = v57;
            v54 = v58;

            v59 = dyld_program_sdk_at_least();
            v60 = v53 < 0.0;
            if (v54 < 0.0)
              v60 = 1;
            if (v59)
            {
              if (v60)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v50 = objc_claimAutoreleasedReturnValue();
                v212.width = v53;
                v212.height = v54;
                NSStringFromCGSize(v212);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v50, "handleFailureInMethod:object:file:lineNumber:description:", v162, self, CFSTR("UICollectionViewFlowLayout.m"), 1512, CFSTR("Collection view delegate returned a negative size %@ from -collectionView:layout:sizeForItemAtIndexPath: for item %ld in section %ld, which is not supported by flow layout. Delegate: %@; collection view: %@"),
                  v61,
                  j,
                  v182,
                  v180,
                  self->super._collectionView);

                goto LABEL_72;
              }
            }
            else if (v60)
            {
              v76 = qword_1ECD78E50;
              if (!qword_1ECD78E50)
              {
                v76 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v76, (unint64_t *)&qword_1ECD78E50);
              }
              v50 = *(id *)(v76 + 8);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                v213.width = v53;
                v213.height = v54;
                NSStringFromCGSize(v213);
                v77 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
                v78 = self->super._collectionView;
                *(_DWORD *)buf = 138413314;
                v202 = v77;
                v203 = 2048;
                v204 = j;
                v205 = 2048;
                v206 = v182;
                v207 = 2112;
                v208 = v180;
                v209 = 2112;
                v210 = v78;
                _os_log_impl(&dword_185066000, v50, OS_LOG_TYPE_ERROR, "Collection view delegate returned a negative size %@ from -collectionView:layout:sizeForItemAtIndexPath: for item %ld in section %ld, which is not supported by flow layout. Delegate: %@; collection view: %@",
                  buf,
                  0x34u);

              }
LABEL_72:
              v55 = 1;
LABEL_82:

              goto LABEL_83;
            }
            v48 = 0;
            v55 = 1;
          }
          else
          {
            if (-[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", j, v182);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKeyedSubscript:", v49);
              v50 = objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                -[NSObject CGSizeValue](v50, "CGSizeValue");
                v53 = v51;
                v54 = v52;
                if (v167)
                  v51 = v52;
                if (v51 < v166)
                  goto LABEL_72;
              }
              -[UICollectionViewFlowLayout _effectiveEstimatedItemSize](self, "_effectiveEstimatedItemSize");
              v53 = v62;
              v54 = v63;
              v55 = 0;
              goto LABEL_82;
            }
            v48 = 0;
            v55 = 1;
            v54 = v45;
            v53 = v44;
          }
LABEL_83:
          v64 = dyld_program_sdk_at_least();
          v65 = v53 < 0.0;
          if (v54 < 0.0)
            v65 = 1;
          if (v64)
          {
            if (v65)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", v162, self, CFSTR("UICollectionViewFlowLayout.m"), 1549, CFSTR("Negative sizes are not supported by flow layout. Collection view: %@"), self->super._collectionView);

            }
          }
          else if (v65)
          {
            v73 = qword_1ECD78E58;
            if (!qword_1ECD78E58)
            {
              v73 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v73, (unint64_t *)&qword_1ECD78E58);
            }
            v74 = *(NSObject **)(v73 + 8);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              v75 = self->super._collectionView;
              *(_DWORD *)buf = v154;
              v202 = v75;
              _os_log_impl(&dword_185066000, v74, OS_LOG_TYPE_ERROR, "Negative sizes are not supported by flow layout. Collection view: %@", buf, 0xCu);
            }
          }
          if (*((_BYTE *)v193 + 24))
          {
            v67 = v197;
            v68 = v197[4];
            v69 = v197[5];
            if (v19 == v68 && v20 == v69)
            {
              v197[4] = v53;
              v67[5] = v54;
            }
            else if (v53 != v68 || v54 != v69)
            {
              *((_BYTE *)v193 + 24) = 0;
            }
          }
          if (v47)
          {
            if (v55)
              v72 = 4;
            else
              v72 = 0;
            *(_BYTE *)(v47 + 8) = v72 | v48 | *(_BYTE *)(v47 + 8) & 0xFA;
            *(_QWORD *)(v47 + 32) = 0;
            *(_QWORD *)(v47 + 40) = 0;
            *(double *)(v47 + 48) = v53;
            *(double *)(v47 + 56) = v54;
          }
        }
      }
    }

LABEL_134:
    if (*((_BYTE *)v193 + 24))
    {
      v109 = v21 ? *(void **)(v21 + 96) : 0;
      v110 = v109;
      objc_msgSend(v110, "removeAllObjects");

      if (v21)
      {
        *(_OWORD *)(v21 + 248) = *((_OWORD *)v197 + 2);
        *(_BYTE *)(v21 + 88) = 1;
      }
    }
    _Block_object_dispose(&v192, 8);
    _Block_object_dispose(&v196, 8);
    goto LABEL_140;
  }
LABEL_194:

}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGFloat)minimumLineSpacing
{
  return self->_lineSpacing;
}

- (CGFloat)minimumInteritemSpacing
{
  return self->_interitemSpacing;
}

- (void)_updateItemsLayoutForRect:(CGRect)a3 allowsPartialUpdate:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  _UIFlowLayoutInfo *data;
  _BOOL4 horizontal;
  BOOL v13;
  CGSize *p_currentLayoutSize;
  int64_t sectionInsetReference;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _UIFlowLayoutInfo *v23;
  _UIFlowLayoutInfo *v24;
  uint64_t v25;
  double v26;
  double dimension;
  _UIFlowLayoutInfo *v28;
  CGFloat *p_dimension;
  _UIFlowLayoutInfo *v30;
  CGFloat v31;
  BOOL v32;
  _UIFlowLayoutInfo *v33;
  NSMutableArray *v34;
  _QWORD v35[5];
  _QWORD v36[10];
  BOOL v37;
  BOOL v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;

  if (self->_data)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[UICollectionViewFlowLayout _dimensionFromCollectionView](self, "_dimensionFromCollectionView");
    if (v10 != 0.0)
    {
      data = self->_data;
      if (data)
      {
        horizontal = data->_horizontal;
        v13 = !data->_horizontal;
        data->_dimension = v10;
      }
      else
      {
        horizontal = 0;
        v13 = 1;
      }
      p_currentLayoutSize = &self->_currentLayoutSize;
      self->_currentLayoutSize.width = 0.0;
      self->_currentLayoutSize.height = 0.0;
      v39 = 0;
      v40 = (double *)&v39;
      v41 = 0x2020000000;
      v42 = 0;
      sectionInsetReference = self->_sectionInsetReference;
      if (sectionInsetReference)
      {
        if (horizontal)
          v16 = 1;
        else
          v16 = 2;
        -[UICollectionViewFlowLayout _adjustedSectionInsetForSectionInset:forAxis:](self, "_adjustedSectionInsetForSectionInset:forAxis:", v16, 0.0, 0.0, 0.0, 0.0);
        v20 = v19;
        v22 = v21;
        if (horizontal)
          v17 = v18;
        v40[3] = v17 + v40[3];
      }
      else
      {
        v22 = 0.0;
        v20 = 0.0;
      }
      v23 = self->_data;
      if (v23)
        v23 = (_UIFlowLayoutInfo *)v23->_sections;
      v24 = v23;
      v25 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __76__UICollectionViewFlowLayout__updateItemsLayoutForRect_allowsPartialUpdate___block_invoke;
      v36[3] = &unk_1E16BDF68;
      *(CGFloat *)&v36[6] = x;
      *(CGFloat *)&v36[7] = y;
      *(CGFloat *)&v36[8] = width;
      *(CGFloat *)&v36[9] = height;
      v37 = a4;
      v38 = v13;
      v36[4] = self;
      v36[5] = &v39;
      -[_UIFlowLayoutInfo enumerateObjectsUsingBlock:](v24, "enumerateObjectsUsingBlock:", v36);

      if (sectionInsetReference)
      {
        if (horizontal)
          v26 = v22;
        else
          v26 = v20;
        v40[3] = v26 + v40[3];
      }
      if (horizontal)
      {
        dimension = v40[3];
        v28 = self->_data;
        if (!v28)
        {
          v31 = 0.0;
LABEL_27:
          p_currentLayoutSize->width = dimension;
          self->_currentLayoutSize.height = v31;
          v32 = -[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes");
          v33 = self->_data;
          if (v32)
          {
            if (!v33)
              goto LABEL_35;
          }
          else
          {
            if (!v33)
              goto LABEL_35;
            if (!v33->_leftToRight && v33->_horizontal)
            {
              v34 = v33->_sections;
              v35[0] = v25;
              v35[1] = 3221225472;
              v35[2] = __76__UICollectionViewFlowLayout__updateItemsLayoutForRect_allowsPartialUpdate___block_invoke_2;
              v35[3] = &unk_1E16BDF90;
              v35[4] = self;
              -[NSMutableArray enumerateObjectsUsingBlock:](v34, "enumerateObjectsUsingBlock:", v35);

              v33 = self->_data;
              if (!v33)
                goto LABEL_35;
            }
          }
          v33->_contentSize = *p_currentLayoutSize;
LABEL_35:
          _Block_object_dispose(&v39, 8);
          return;
        }
        p_dimension = &v28->_dimension;
      }
      else
      {
        v30 = self->_data;
        if (v30)
          dimension = v30->_dimension;
        else
          dimension = 0.0;
        p_dimension = v40 + 3;
      }
      v31 = *p_dimension;
      goto LABEL_27;
    }
  }
}

- (double)_dimensionFromCollectionView
{
  id v3;
  void *v4;
  _UIFlowLayoutInfo *data;
  _BOOL4 horizontal;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;

  v3 = -[UICollectionViewLayout collectionView](self, "collectionView");
  v4 = v3;
  data = self->_data;
  if (data)
    horizontal = data->_horizontal;
  else
    horizontal = 0;
  objc_msgSend(v3, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "_effectiveContentInset");
  v13 = v8 - v11 - v12;
  result = v10 - v14 - v15;
  if (!horizontal)
    result = v13;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (void)_updateContentSizeScrollingDimensionWithDelta:(double)a3
{
  CGSize *p_contentSizeAdjustment;

  if (a3 != 0.0)
  {
    if (self->_scrollDirection == 1)
    {
      self->_currentLayoutSize.width = self->_currentLayoutSize.width + a3;
      p_contentSizeAdjustment = &self->_contentSizeAdjustment;
    }
    else
    {
      self->_currentLayoutSize.height = self->_currentLayoutSize.height + a3;
      p_contentSizeAdjustment = (CGSize *)&self->_contentSizeAdjustment.height;
    }
    p_contentSizeAdjustment->width = a3;
  }
}

- (BOOL)_headerFollowsSectionMargins
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 5) & 1;
}

- (BOOL)_footerFollowsSectionMargins
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 6) & 1;
}

- (void)_finalizeCollectionViewUpdate:(id)a3
{
  NSMutableDictionary *insertedItemsAttributesDict;
  id v5;
  NSMutableDictionary *insertedSectionHeadersAttributesDict;
  NSMutableDictionary *insertedSectionFootersAttributesDict;
  NSMutableDictionary *deletedItemsAttributesDict;
  NSMutableDictionary *deletedSectionHeadersAttributesDict;
  NSMutableDictionary *deletedSectionFootersAttributesDict;
  _UICollectionViewUpdateTranslating *currentUpdateTranslator;
  objc_super v12;

  insertedItemsAttributesDict = self->_insertedItemsAttributesDict;
  self->_insertedItemsAttributesDict = 0;
  v5 = a3;

  insertedSectionHeadersAttributesDict = self->_insertedSectionHeadersAttributesDict;
  self->_insertedSectionHeadersAttributesDict = 0;

  insertedSectionFootersAttributesDict = self->_insertedSectionFootersAttributesDict;
  self->_insertedSectionFootersAttributesDict = 0;

  deletedItemsAttributesDict = self->_deletedItemsAttributesDict;
  self->_deletedItemsAttributesDict = 0;

  deletedSectionHeadersAttributesDict = self->_deletedSectionHeadersAttributesDict;
  self->_deletedSectionHeadersAttributesDict = 0;

  deletedSectionFootersAttributesDict = self->_deletedSectionFootersAttributesDict;
  self->_deletedSectionFootersAttributesDict = 0;

  currentUpdateTranslator = self->_currentUpdateTranslator;
  self->_currentUpdateTranslator = 0;

  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewFlowLayout;
  -[UICollectionViewLayout _finalizeCollectionViewUpdate:](&v12, sel__finalizeCollectionViewUpdate_, v5);

}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t scrollDirection;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  void *v23;
  void *v24;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)UICollectionViewFlowLayout;
  -[UICollectionViewLayout invalidationContextForBoundsChange:](&v27, sel_invalidationContextForBoundsChange_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInvalidateFlowLayoutDelegateMetrics:", 0);
  objc_msgSend(v8, "setInvalidateFlowLayoutAttributes:", 0);
  -[UICollectionViewLayout bounds](self, "bounds");
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  scrollDirection = self->_scrollDirection;
  if (scrollDirection == 1)
  {
    if (height == v12 && y == v10)
      goto LABEL_5;
LABEL_17:
    objc_msgSend(v8, "setInvalidateFlowLayoutAttributes:", 1);
    goto LABEL_18;
  }
  if (!scrollDirection && (width != v11 || x != v9))
    goto LABEL_17;
LABEL_5:
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v29 = CGRectUnion(v28, *(CGRect *)&v13);
  v18 = v29.origin.x;
  v19 = v29.origin.y;
  v20 = v29.size.width;
  v21 = v29.size.height;
  v22 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  if ((v22 & 0x800) != 0)
  {
    -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](self, "indexesForSectionHeadersInRect:usingData:", self->_data, v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
      objc_msgSend(v8, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("UICollectionElementKindSectionHeader"), v23);

    v22 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  }
  if ((v22 & 0x1000) != 0)
  {
    -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](self, "indexesForSectionFootersInRect:usingData:", self->_data, v18, v19, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
      objc_msgSend(v8, "invalidateSupplementaryElementsOfKind:atIndexPaths:", CFSTR("UICollectionElementKindSectionFooter"), v24);

  }
LABEL_18:
  if (dyld_program_sdk_at_least()
    && -[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
  {
    objc_msgSend(v8, "setInvalidateFlowLayoutDelegateMetrics:", 0);
    objc_msgSend(v8, "setInvalidateFlowLayoutAttributes:", 0);
    objc_msgSend(v8, "_setRetainExistingSizingInfoForEstimates:", 1);
  }
  return v8;
}

- (CGSize)headerReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_headerReferenceSize.width;
  height = self->_headerReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UICollectionViewFlowLayoutSectionInsetReference)sectionInsetReference
{
  return self->_sectionInsetReference;
}

- (void)setMinimumLineSpacing:(CGFloat)minimumLineSpacing
{
  if (self->_lineSpacing != minimumLineSpacing && (*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
  {
    self->_lineSpacing = minimumLineSpacing;
    -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
  else
  {
    self->_lineSpacing = minimumLineSpacing;
  }
}

- (void)setSectionInset:(UIEdgeInsets)sectionInset
{
  int v3;
  UIEdgeInsets *p_sectionInset;
  double bottom;
  BOOL v6;

  v3 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  p_sectionInset = &self->_sectionInset;
  if ((v3 & 8) != 0)
  {
    p_sectionInset->top = sectionInset.top;
    self->_sectionInset.left = sectionInset.left;
    self->_sectionInset.bottom = sectionInset.bottom;
    self->_sectionInset.right = sectionInset.right;
  }
  else
  {
    bottom = self->_sectionInset.bottom;
    v6 = sectionInset.left == self->_sectionInset.left;
    if (sectionInset.top != p_sectionInset->top)
      v6 = 0;
    if (sectionInset.right != self->_sectionInset.right)
      v6 = 0;
    p_sectionInset->top = sectionInset.top;
    self->_sectionInset.left = sectionInset.left;
    if (sectionInset.bottom != bottom)
      v6 = 0;
    self->_sectionInset.bottom = sectionInset.bottom;
    self->_sectionInset.right = sectionInset.right;
    if ((v3 & 0x80) != 0 && !v6)
      -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setMinimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
{
  if (self->_interitemSpacing != minimumInteritemSpacing && (*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
  {
    self->_interitemSpacing = minimumInteritemSpacing;
    -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
  else
  {
    self->_interitemSpacing = minimumInteritemSpacing;
  }
}

void __76__UICollectionViewFlowLayout__updateItemsLayoutForRect_allowsPartialUpdate___block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  uint64_t v24;
  double v25;
  double v26;
  CGFloat rect;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  if (objc_msgSend(*(id *)(a1 + 32), "_estimatesSizes"))
  {
    -[_UIFlowLayoutSection updateEstimatedSizeForSection:]((uint64_t)a2, a3);
    if (a2)
    {
      v7 = a2[39];
      v6 = a2[40];
      v8 = a2[41];
      v9 = a2[42];
    }
    else
    {
      v6 = 0.0;
      v8 = 0.0;
      v9 = 0.0;
      v7 = 0.0;
    }
    v28.origin.x = v7;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v9;
    if (CGRectIntersectsRect(v28, *(CGRect *)(a1 + 48)))
    {
      v10 = v7;
      v11 = v6;
      v12 = v8;
      v13 = v9;
      if (*(_BYTE *)(a1 + 80))
      {
        v33.origin.x = v7;
        v33.origin.y = v6;
        v33.size.width = v8;
        v33.size.height = v9;
        *(CGRect *)(&v13 - 3) = CGRectIntersection(*(CGRect *)(a1 + 48), v33);
        v10 = v14;
        v11 = v15;
        v12 = v16;
      }
      rect = v13;
      v29.origin.x = v7;
      v29.origin.y = v6;
      v29.size.width = v8;
      v29.size.height = v9;
      v17 = -CGRectGetMinX(v29);
      v30.origin.x = v7;
      v30.origin.y = v6;
      v30.size.width = v8;
      v30.size.height = v9;
      v18 = -CGRectGetMinY(v30);
      v31.origin.x = v10;
      v31.origin.y = v11;
      v31.size.width = v12;
      v31.size.height = rect;
      v32 = CGRectOffset(v31, v17, v18);
      -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:]((uint64_t)a2, a3, 0, 0, v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    }
  }
  else
  {
    -[_UIFlowLayoutSection computeLayout]((uint64_t)a2);
  }
  if (a2)
  {
    v20 = a2[39];
    v19 = a2[40];
    v21 = a2[41];
    v22 = a2[42];
  }
  else
  {
    v19 = 0.0;
    v21 = 0.0;
    v22 = 0.0;
    v20 = 0.0;
  }
  v23 = *(unsigned __int8 *)(a1 + 81);
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v25 = *(double *)(v24 + 24);
  if (*(_BYTE *)(a1 + 81))
    v26 = v22;
  else
    v26 = v21;
  *(double *)(v24 + 24) = v26 + v25;
  if (a2)
  {
    if (v23)
      v19 = v25;
    else
      v20 = v25;
    a2[39] = v20;
    a2[40] = v19;
    a2[41] = v21;
    a2[42] = v22;
  }
}

- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
  if (self->_scrollDirection != scrollDirection && (*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) != 0)
  {
    self->_scrollDirection = scrollDirection;
    -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
  else
  {
    self->_scrollDirection = scrollDirection;
  }
  -[UICollectionViewFlowLayout _updateCollectionViewScrollableAxis](self, "_updateCollectionViewScrollableAxis");
}

- (void)setSectionHeadersPinToVisibleBounds:(BOOL)sectionHeadersPinToVisibleBounds
{
  int v3;

  if (sectionHeadersPinToVisibleBounds)
    v3 = 2048;
  else
    v3 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFF7FF | v3;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  BOOL v18;
  BOOL v19;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  if ((v17 & 0x800) != 0)
  {
    -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](self, "indexesForSectionHeadersInRect:usingData:", self->_data, v10, v12, v14, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
LABEL_14:

      return 1;
    }
    -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](self, "indexesForSectionHeadersInRect:usingData:", self->_data, x, y, width, height);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
      return 1;
    if ((*(_DWORD *)(&self->_gridLayoutFlags + 1) & 0x1000) == 0)
      goto LABEL_3;
LABEL_13:
    -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](self, "indexesForSectionFootersInRect:usingData:", self->_data, v10, v12, v14, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
      goto LABEL_14;
    -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](self, "indexesForSectionFootersInRect:usingData:", self->_data, x, y, width, height);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (!v25)
      goto LABEL_3;
    return 1;
  }
  if ((v17 & 0x1000) != 0)
    goto LABEL_13;
LABEL_3:
  v18 = height != v16;
  if (y != v12)
    v18 = 1;
  v19 = width != v14;
  if (x != v10)
    v19 = 1;
  if (self->_scrollDirection)
    return v18;
  else
    return v19;
}

- (void)setItemSize:(CGSize)itemSize
{
  double height;
  double width;
  CGSize *p_itemSize;
  double v7;
  double v8;
  int v10;
  int v11;

  height = itemSize.height;
  width = itemSize.width;
  if (itemSize.width <= 0.0)
    UICollectionViewFlowLayoutAlertForInvalidItemSize(self->super._collectionView, itemSize.width, itemSize.height);
  p_itemSize = &self->_itemSize;
  if ((*(_WORD *)(&self->_gridLayoutFlags + 1) & 0x401) != 0)
  {
    p_itemSize->width = width;
    self->_itemSize.height = height;
  }
  else
  {
    v7 = p_itemSize->width;
    v8 = self->_itemSize.height;
    p_itemSize->width = width;
    self->_itemSize.height = height;
    if (width != v7 || height != v8)
    {
      v10 = dyld_program_sdk_at_least();
      v11 = *((_DWORD *)&self->_gridLayoutFlags + 1);
      if (v10)
      {
        v11 |= 0x80u;
        *((_DWORD *)&self->_gridLayoutFlags + 1) = v11;
      }
      if ((v11 & 0x80) != 0)
        -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUpdateTranslator, 0);
  objc_storeStrong((id *)&self->_updateVisibleCellsContext, 0);
  objc_storeStrong((id *)&self->_cachedItemFrames, 0);
  objc_storeStrong((id *)&self->_cachedItemAttributes, 0);
  objc_storeStrong((id *)&self->_rowAlignmentsOptionsDictionary, 0);
  objc_storeStrong((id *)&self->_deletedSectionFootersAttributesDict, 0);
  objc_storeStrong((id *)&self->_deletedSectionHeadersAttributesDict, 0);
  objc_storeStrong((id *)&self->_deletedItemsAttributesDict, 0);
  objc_storeStrong((id *)&self->_insertedSectionFootersAttributesDict, 0);
  objc_storeStrong((id *)&self->_insertedSectionHeadersAttributesDict, 0);
  objc_storeStrong((id *)&self->_insertedItemsAttributesDict, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (UICollectionViewFlowLayout)initWithCoder:(id)a3
{
  id v4;
  UICollectionViewFlowLayout *v5;
  UICollectionViewFlowLayout *v6;
  float v7;
  float v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UICollectionViewFlowLayout;
  v5 = -[UICollectionViewLayout init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    UICollectionViewFlowLayoutCommonInit((uint64_t)v5);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIInteritemSpacing")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIInteritemSpacing"));
      v6->_interitemSpacing = v7;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILineSpacing")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UILineSpacing"));
      v6->_lineSpacing = v8;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIItemSize")))
    {
      objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("UIItemSize"));
      v6->_itemSize.width = v9;
      v6->_itemSize.height = v10;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIHeaderReferenceSize")))
    {
      objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("UIHeaderReferenceSize"));
      v6->_headerReferenceSize.width = v11;
      v6->_headerReferenceSize.height = v12;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIFooterReferenceSize")))
    {
      objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("UIFooterReferenceSize"));
      v6->_footerReferenceSize.width = v13;
      v6->_footerReferenceSize.height = v14;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISectionInset")))
    {
      objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UISectionInset"));
      v6->_sectionInset.top = v15;
      v6->_sectionInset.left = v16;
      v6->_sectionInset.bottom = v17;
      v6->_sectionInset.right = v18;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISectionInsetReference")))
      v6->_sectionInsetReference = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UISectionInsetReference"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIScrollDirection")))
      v6->_scrollDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIScrollDirection"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double interitemSpacing;
  double lineSpacing;
  double v8;
  double v9;
  double top;
  int64_t sectionInsetReference;
  int64_t scrollDirection;
  id v15;

  v4 = a3;
  interitemSpacing = self->_interitemSpacing;
  v15 = v4;
  if (interitemSpacing != 10.0)
  {
    *(float *)&interitemSpacing = interitemSpacing;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIInteritemSpacing"), interitemSpacing);
    v4 = v15;
  }
  lineSpacing = self->_lineSpacing;
  if (lineSpacing != 10.0)
  {
    *(float *)&lineSpacing = lineSpacing;
    objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("UILineSpacing"), lineSpacing);
    v4 = v15;
  }
  if (self->_itemSize.width != 50.0 || self->_itemSize.height != 50.0)
  {
    objc_msgSend(v15, "encodeCGSize:forKey:", CFSTR("UIItemSize"));
    v4 = v15;
  }
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (self->_headerReferenceSize.width != *MEMORY[0x1E0C9D820] || self->_headerReferenceSize.height != v9)
  {
    objc_msgSend(v15, "encodeCGSize:forKey:", CFSTR("UIHeaderReferenceSize"));
    v4 = v15;
  }
  if (self->_footerReferenceSize.width != v8 || self->_footerReferenceSize.height != v9)
  {
    objc_msgSend(v15, "encodeCGSize:forKey:", CFSTR("UIFooterReferenceSize"));
    v4 = v15;
  }
  top = self->_sectionInset.top;
  if (self->_sectionInset.left != 0.0
    || top != 0.0
    || self->_sectionInset.right != 0.0
    || self->_sectionInset.bottom != 0.0)
  {
    objc_msgSend(v15, "encodeUIEdgeInsets:forKey:", CFSTR("UISectionInset"), top);
    v4 = v15;
  }
  sectionInsetReference = self->_sectionInsetReference;
  if (sectionInsetReference)
  {
    objc_msgSend(v15, "encodeInteger:forKey:", sectionInsetReference, CFSTR("UISectionInsetReference"));
    v4 = v15;
  }
  scrollDirection = self->_scrollDirection;
  if (scrollDirection)
  {
    objc_msgSend(v15, "encodeInteger:forKey:", scrollDirection, CFSTR("UIScrollDirection"));
    v4 = v15;
  }

}

void __58__UICollectionViewFlowLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(a2, "item");
  v8 = objc_msgSend(a2, "section");
  if (dyld_program_sdk_at_least() && (v9 = *(void **)(*(_QWORD *)(a1 + 32) + 536)) != 0)
  {
    objc_msgSend(v9, "finalIndexPathForInitialIndexPath:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      v7 = objc_msgSend(v10, "item");
      v8 = objc_msgSend(v11, "section");

LABEL_26:
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7, v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, v23);

    }
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "_updateItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (!v13)
    {

      goto LABEL_26;
    }
    v14 = v13;
    v15 = a1;
    v24 = v6;
    v16 = *(_QWORD *)v28;
    v25 = 1;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v18, "indexPathBeforeUpdate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "indexPathAfterUpdate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "updateAction") == 1)
        {
          if (objc_msgSend(v19, "section") == v8)
          {
            if (objc_msgSend(v19, "item") == v7)
              v25 = 0;
            else
              v7 -= objc_msgSend(v19, "item") < v7;
          }
        }
        else if (objc_msgSend(v18, "updateAction"))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8);
          v22 = *(void **)(v21 + 40);
          *(_QWORD *)(v21 + 40) = 0;

          *a4 = 1;
        }
        else if (objc_msgSend(v20, "section") == v8 && objc_msgSend(v20, "item") <= v7)
        {
          ++v7;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);

    v6 = v24;
    a1 = v15;
    if ((v25 & 1) != 0)
      goto LABEL_26;
  }

}

- (id)indexesForSectionHeadersInRect:(CGRect)a3
{
  return 0;
}

- (id)indexesForSectionFootersInRect:(CGRect)a3
{
  return 0;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3 usingData:(id)a4
{
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;

  v7 = a3;
  v8 = a4;
  -[UICollectionViewFlowLayout _existingLayoutAttributesForItemAtIndexPath:](self, "_existingLayoutAttributesForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[UICollectionViewLayout _sections](self, "_sections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "section");
    v14 = v13;
    if (v12)
    {
      if ((objc_msgSend(v12, "containsIndex:", v13) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewFlowLayout.m"), 616, CFSTR("request for layout attributes at index path (%@) when this flow layout only lays out sections in the set (%@)"), v7, v12);

      }
      v14 = objc_msgSend(v12, "countOfIndexesInRange:", 0, v13);
    }
    v15 = objc_msgSend(v7, "item");
    if (v8)
      v16 = (void *)v8[13];
    else
      v16 = 0;
    v17 = v16;
    objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewFlowLayout _frameForItem:inSection:usingData:](self, "_frameForItem:inSection:usingData:", v15, v13, v18);
    -[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](self, "_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)layoutAttributesForHeaderInSection:(int64_t)a3
{
  return -[UICollectionViewFlowLayout layoutAttributesForHeaderInSection:usingData:](self, "layoutAttributesForHeaderInSection:usingData:", a3, self->_data);
}

- (id)layoutAttributesForFooterInSection:(int64_t)a3
{
  return -[UICollectionViewFlowLayout layoutAttributesForFooterInSection:usingData:](self, "layoutAttributesForFooterInSection:usingData:", a3, self->_data);
}

- (void)_calculateAttributesForRect:(CGRect)a3
{
  if ((*(_BYTE *)(&self->_gridLayoutFlags + 1) & 0x80) == 0)
    -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](self, "_fetchItemsInfoForRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _UIFlowLayoutInfo *data;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  UICollectionViewFlowLayout *v38;
  id v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "size");
  if (v13 == v9 && v12 == v11)
  {
    v40.receiver = self;
    v40.super_class = (Class)UICollectionViewFlowLayout;
    -[UICollectionViewLayout invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:](&v40, sel_invalidationContextForPreferredLayoutAttributes_withOriginalAttributes_, v6, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInvalidateFlowLayoutAttributes:", 0);
    objc_msgSend(v17, "setInvalidateFlowLayoutDelegateMetrics:", 0);
  }
  else
  {
    data = self->_data;
    objc_msgSend(v7, "indexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFlowLayoutInfo setSize:forItemAtIndexPath:]((uint64_t)data, v16, v9, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (dyld_program_sdk_at_least()
      && -[UICollectionViewFlowLayout _estimatesSizes](self, "_estimatesSizes"))
    {
      v39 = v6;
      objc_msgSend(v7, "indexPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "section");

      v38 = self;
      -[UICollectionView _collectionViewData](self->super._collectionView, "_collectionViewData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewData existingSupplementaryLayoutAttributesInSection:]((uint64_t)v20, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v42;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v42 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v26);
            if (v27)
            {
              if ((*(_WORD *)(v27 + 288) & 3) == 0)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v26), "indexPath");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "indexPath");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v28, "isEqual:", v29);

                if (!v30
                  || (-[UIBarButtonItemGroup _items]((id *)v27),
                      v31 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[UIBarButtonItemGroup _items]((id *)v7),
                      v32 = (void *)objc_claimAutoreleasedReturnValue(),
                      v33 = objc_msgSend(v31, "isEqualToString:", v32),
                      v32,
                      v31,
                      (v33 & 1) == 0))
                {
                  -[UIBarButtonItemGroup _items]((id *)v27);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v27, "indexPath");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = v35;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v34, v36);

                }
              }
            }
            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v24);
      }

      self = v38;
      v6 = v39;
    }
  }
  objc_msgSend(v17, "setContentOffsetAdjustment:", self->_contentOffsetAdjustment.x, self->_contentOffsetAdjustment.y);
  objc_msgSend(v17, "setContentSizeAdjustment:", self->_contentSizeAdjustment.width, self->_contentSizeAdjustment.height);

  return v17;
}

- (CGSize)_effectiveEstimatedItemSize
{
  double width;
  double height;
  _UIFlowLayoutInfo *data;
  uint64_t computedEstimatedCount;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  CGSize result;

  width = self->_estimatedItemSize.width;
  height = self->_estimatedItemSize.height;
  if (width == 1.79769313e308 && height == 1.79769313e308)
  {
    data = self->_data;
    if (data)
    {
      computedEstimatedCount = data->_computedEstimatedCount;
      v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v8 = *MEMORY[0x1E0C9D820];
      if (computedEstimatedCount >= 1)
      {
        v8 = data->_computedEstimatedSum.width / (double)computedEstimatedCount;
        v7 = data->_computedEstimatedSum.height / (double)computedEstimatedCount;
      }
    }
    else
    {
      v7 = 0.0;
      v8 = 0.0;
    }
    v9 = v8 == *MEMORY[0x1E0C9D820];
    v10 = v7 == *(double *)(MEMORY[0x1E0C9D820] + 8);
    width = 50.0;
    if (v9 && v10)
      height = 50.0;
    else
      height = v7;
    if (!v9 || !v10)
      width = v8;
  }
  result.height = height;
  result.width = width;
  return result;
}

void __74__UICollectionViewFlowLayout__existingLayoutAttributesForItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  CGRect v9;

  NSLog(CFSTR("Logging only once for UICollectionViewFlowLayout cache mismatched frame"));
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  NSStringFromCGRect(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(*(CGRect *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("UICollectionViewFlowLayout has cached frame mismatch for index path %@ - cached value: %@; expected value: %@"),
    v3,
    v4,
    v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("%@"), v8);
  if (objc_msgSend(*(id *)(a1 + 48), "isMemberOfClass:", objc_opt_class()))
  {
    NSLog(CFSTR("This is likely a bug internal to UICollectionViewFlowLayout - please file against UIKit :)"));
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("This is likely occurring because the flow layout subclass %@ is modifying attributes returned by UICollectionViewFlowLayout without copying them"), v7);

  }
}

- (void)setHeaderReferenceSize:(CGSize)headerReferenceSize
{
  double height;
  double width;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  UICollectionView *v10;
  int v11;
  CGSize *p_headerReferenceSize;
  BOOL v13;
  UICollectionView *collectionView;
  int v15;
  void *v16;
  __int16 v17;
  UICollectionView *v18;
  uint64_t v19;
  CGSize v20;
  CGSize v21;

  height = headerReferenceSize.height;
  width = headerReferenceSize.width;
  v19 = *MEMORY[0x1E0C80C00];
  if (headerReferenceSize.width < 0.0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        goto LABEL_8;
      v21.width = width;
      v21.height = height;
      NSStringFromCGSize(v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      collectionView = self->super._collectionView;
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = collectionView;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Negative sizes of headers are not supported by flow layout. Invalid size: %@; collection view: %@",
        (uint8_t *)&v15,
        0x16u);
LABEL_7:

LABEL_8:
      goto LABEL_9;
    }
    v6 = setHeaderReferenceSize____s_category;
    if (!setHeaderReferenceSize____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&setHeaderReferenceSize____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v20.width = width;
      v20.height = height;
      NSStringFromCGSize(v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->super._collectionView;
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Negative sizes of headers are not supported by flow layout. Invalid size: %@; collection view: %@",
        (uint8_t *)&v15,
        0x16u);
      goto LABEL_7;
    }
  }
LABEL_9:
  v11 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  p_headerReferenceSize = &self->_headerReferenceSize;
  if ((v11 & 2) != 0)
  {
    p_headerReferenceSize->width = width;
    self->_headerReferenceSize.height = height;
  }
  else
  {
    v13 = width == p_headerReferenceSize->width;
    if (height != self->_headerReferenceSize.height)
      v13 = 0;
    p_headerReferenceSize->width = width;
    self->_headerReferenceSize.height = height;
    if ((v11 & 0x80) != 0 && !v13)
      -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setFooterReferenceSize:(CGSize)footerReferenceSize
{
  double height;
  double width;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  UICollectionView *v10;
  int v11;
  CGSize *p_footerReferenceSize;
  BOOL v13;
  UICollectionView *collectionView;
  int v15;
  void *v16;
  __int16 v17;
  UICollectionView *v18;
  uint64_t v19;
  CGSize v20;
  CGSize v21;

  height = footerReferenceSize.height;
  width = footerReferenceSize.width;
  v19 = *MEMORY[0x1E0C80C00];
  if (footerReferenceSize.width < 0.0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        goto LABEL_8;
      v21.width = width;
      v21.height = height;
      NSStringFromCGSize(v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      collectionView = self->super._collectionView;
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = collectionView;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Negative sizes of footers are not supported by flow layout. Invalid size: %@; collection view: %@",
        (uint8_t *)&v15,
        0x16u);
LABEL_7:

LABEL_8:
      goto LABEL_9;
    }
    v6 = setFooterReferenceSize____s_category;
    if (!setFooterReferenceSize____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&setFooterReferenceSize____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v20.width = width;
      v20.height = height;
      NSStringFromCGSize(v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->super._collectionView;
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Negative sizes of footers are not supported by flow layout. Invalid size: %@; collection view: %@",
        (uint8_t *)&v15,
        0x16u);
      goto LABEL_7;
    }
  }
LABEL_9:
  v11 = *((_DWORD *)&self->_gridLayoutFlags + 1);
  p_footerReferenceSize = &self->_footerReferenceSize;
  if ((v11 & 4) != 0)
  {
    p_footerReferenceSize->width = width;
    self->_footerReferenceSize.height = height;
  }
  else
  {
    v13 = width == p_footerReferenceSize->width;
    if (height != self->_footerReferenceSize.height)
      v13 = 0;
    p_footerReferenceSize->width = width;
    self->_footerReferenceSize.height = height;
    if ((v11 & 0x80) != 0 && !v13)
      -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

void __74__UICollectionViewFlowLayout__getSizingInfosWithExistingSizingDictionary___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5)
{
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v22;

  if (a4 < 0.0 || a5 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  }
  if (a2 < a2 + a3)
  {
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      v12 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(a1 + 72))
      {
        if (v12)
          v13 = *(void **)(v12 + 96);
        else
          v13 = 0;
        v14 = v13;
        objc_msgSend(v14, "objectAtIndexedSubscript:", a2);
        v15 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[_UIFlowLayoutSection addItem]((id *)v12);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_BYTE *)(v16 + 24))
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v18 = *(double *)(v17 + 32);
        v19 = *(double *)(v17 + 40);
        if (v10 == v18 && v11 == v19)
        {
          *(double *)(v17 + 32) = a4;
          *(double *)(v17 + 40) = a5;
        }
        else if (a4 != v18 || a5 != v19)
        {
          *(_BYTE *)(v16 + 24) = 0;
        }
      }
      if (v15)
      {
        *(_QWORD *)(v15 + 32) = 0;
        *(_QWORD *)(v15 + 40) = 0;
        *(double *)(v15 + 48) = a4;
        *(double *)(v15 + 56) = a5;
      }

      ++a2;
      --a3;
    }
    while (a3);
  }
}

void __76__UICollectionViewFlowLayout__updateItemsLayoutForRect_allowsPartialUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  CGFloat *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double Width;
  double MinX;
  double *v11;
  CGRect v12;
  CGRect v13;

  v3 = a2;
  v11 = v3;
  if (v3)
  {
    v5 = v3[39];
    v4 = v3[40];
    v6 = v3[41];
    v7 = v3[42];
  }
  else
  {
    v4 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    v5 = 0.0;
  }
  v8 = *(double *)(*(_QWORD *)(a1 + 32) + 400);
  v12.origin.x = v5;
  v12.origin.y = v4;
  v12.size.width = v6;
  v12.size.height = v7;
  Width = CGRectGetWidth(v12);
  v13.origin.x = v5;
  v13.origin.y = v4;
  v13.size.width = v6;
  v13.size.height = v7;
  MinX = CGRectGetMinX(v13);
  if (v11)
  {
    v11[39] = v8 - Width - MinX;
    v11[40] = v4;
    v11[41] = v6;
    v11[42] = v7;
  }

}

void __53__UICollectionViewFlowLayout__fetchItemsInfoForRect___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = UICollectionViewFlowLayoutSectionHeaderZPosition_block_invoke___s_category;
  if (!UICollectionViewFlowLayoutSectionHeaderZPosition_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("CollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&UICollectionViewFlowLayoutSectionHeaderZPosition_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "An attempt to update layout information was detected while already in the process of computing the layout (i.e. reentrant call). This will result in unexpected behaviour or a crash. This may happen if a layout pass is triggered while calling out to a delegate. UICollectionViewFlowLayout instance is (%@)", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_setNeedsLayoutComputationWithoutInvalidation
{
  *((_DWORD *)&self->_gridLayoutFlags + 1) &= 0xFFFFFE7F;
}

- (id)initialLayoutAttributesForInsertedItemAtIndexPath:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_insertedItemsAttributesDict, "objectForKey:", a3);
}

- (id)initialLayoutAttributesForHeaderInInsertedSection:(int64_t)a3
{
  NSMutableDictionary *insertedSectionHeadersAttributesDict;
  void *v4;
  void *v5;

  insertedSectionHeadersAttributesDict = self->_insertedSectionHeadersAttributesDict;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](insertedSectionHeadersAttributesDict, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initialLayoutAttributesForFooterInInsertedSection:(int64_t)a3
{
  NSMutableDictionary *insertedSectionFootersAttributesDict;
  void *v4;
  void *v5;

  insertedSectionFootersAttributesDict = self->_insertedSectionFootersAttributesDict;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](insertedSectionFootersAttributesDict, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)finalLayoutAttributesForDeletedItemAtIndexPath:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_deletedItemsAttributesDict, "objectForKey:", a3);
}

- (id)finalLayoutAttributesForHeaderInDeletedSection:(int64_t)a3
{
  NSMutableDictionary *deletedSectionHeadersAttributesDict;
  void *v4;
  void *v5;

  deletedSectionHeadersAttributesDict = self->_deletedSectionHeadersAttributesDict;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](deletedSectionHeadersAttributesDict, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)finalLayoutAttributesForFooterInDeletedSection:(int64_t)a3
{
  NSMutableDictionary *deletedSectionFootersAttributesDict;
  void *v4;
  void *v5;

  deletedSectionFootersAttributesDict = self->_deletedSectionFootersAttributesDict;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](deletedSectionFootersAttributesDict, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)synchronizeLayout
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_invalidateButKeepDelegateInfo
{
  id v3;

  v3 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
  objc_msgSend(v3, "setInvalidateFlowLayoutDelegateMetrics:", 0);
  -[UICollectionViewLayout _invalidateLayoutUsingContext:](self, "_invalidateLayoutUsingContext:", v3);

}

- (void)_invalidateButKeepAllInfo
{
  id v3;

  v3 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
  objc_msgSend(v3, "setInvalidateFlowLayoutDelegateMetrics:", 0);
  objc_msgSend(v3, "setInvalidateFlowLayoutAttributes:", 0);
  -[UICollectionViewLayout _invalidateLayoutUsingContext:](self, "_invalidateLayoutUsingContext:", v3);

}

- (void)_setRowAlignmentsOptions:(id)a3
{
  objc_storeStrong((id *)&self->_rowAlignmentsOptionsDictionary, a3);
}

- (id)_rowAlignmentOptions
{
  return self->_rowAlignmentsOptionsDictionary;
}

- (void)_setRoundsToScreenScale:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFFDFF | v3;
}

- (void)_setHeaderFollowsSectionMargins:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFDFFF | v3;
}

- (void)_setFooterFollowsSectionMargins:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFBFFF | v3;
}

- (BOOL)sectionHeadersPinToVisibleBounds
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 3) & 1;
}

- (void)setSectionFootersPinToVisibleBounds:(BOOL)sectionFootersPinToVisibleBounds
{
  int v3;

  if (sectionFootersPinToVisibleBounds)
    v3 = 4096;
  else
    v3 = 0;
  *((_DWORD *)&self->_gridLayoutFlags + 1) = *(_DWORD *)(&self->_gridLayoutFlags + 1) & 0xFFFFEFFF | v3;
}

- (BOOL)sectionFootersPinToVisibleBounds
{
  return (*((unsigned __int8 *)&self->_gridLayoutFlags + 5) >> 4) & 1;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return (*(_BYTE *)&self->super._layoutFlags & 8) == 0 && self->_scrollDirection == 1;
}

- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
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
  double v17;
  double v18;
  CGRect result;

  -[UICollectionViewFlowLayout layoutAttributesForHeaderInSection:](self, "layoutAttributesForHeaderInSection:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (UIEdgeInsets)_adjustedSectionInsetForSectionInset:(UIEdgeInsets)a3 forAxis:(unint64_t)a4
{
  char v4;
  double right;
  double bottom;
  double left;
  double top;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t sectionInsetReference;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIEdgeInsets result;

  v4 = a4;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adjustedContentInset");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  sectionInsetReference = self->_sectionInsetReference;
  if (sectionInsetReference == 2)
  {
    v33 = v12;
    v34 = v14;
    v35 = v16;
    v36 = v18;
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMargins");
  }
  else
  {
    v20 = 0.0;
    v21 = 0.0;
    v22 = 0.0;
    v23 = 0.0;
    if (sectionInsetReference != 1)
      goto LABEL_13;
    v33 = v12;
    v34 = v14;
    v35 = v16;
    v36 = v18;
    -[UICollectionViewLayout collectionView](self, "collectionView", 0.0, 0.0, 0.0, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safeAreaInsets");
  }
  v29 = v25;
  v30 = v26;
  v31 = v27;
  v32 = v28;

  v23 = fmax(top + v29 - v33, 0.0);
  if ((v4 & 2) == 0)
    v23 = top;
  v22 = fmax(left + v30 - v34, 0.0);
  v21 = fmax(bottom + v31 - v35, 0.0);
  if ((v4 & 2) == 0)
    v21 = bottom;
  if ((v4 & 1) == 0)
    v22 = left;
  v20 = fmax(right + v32 - v36, 0.0);
  if ((v4 & 1) == 0)
    v20 = right;
LABEL_13:
  result.right = v20;
  result.bottom = v21;
  result.left = v22;
  result.top = v23;
  return result;
}

- (CGSize)footerReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_footerReferenceSize.width;
  height = self->_footerReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)estimatedItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_estimatedItemSize.width;
  height = self->_estimatedItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSectionInsetReference:(UICollectionViewFlowLayoutSectionInsetReference)sectionInsetReference
{
  self->_sectionInsetReference = sectionInsetReference;
}

@end
