@implementation PXGadgetCollectionViewLayout

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_disablesDoubleSidedAnimations
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection");
  -[PXGadgetCollectionViewLayout delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTogglingSidebarNoRotating");

  if (v4 == 1 && v5 == 0)
    return v7;
  else
    return 0;
}

- (void)setSpec:(id)a3
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetCollectionViewLayout.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spec"));

  }
  objc_storeStrong((id *)&self->_spec, a3);
  objc_msgSend(v8, "layoutInsets");
  -[PXGadgetSpec layoutInsets](self->_spec, "layoutInsets");
  if (!PXEdgeInsetsEqualToEdgeInsets()
    || (v6 = objc_msgSend(v8, "scrollAxis"), v6 != -[PXGadgetSpec scrollAxis](self->_spec, "scrollAxis")))
  {
    -[PXGadgetCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }

}

- (void)setPrefersPagingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;

  v3 = a3;
  if (a3 && -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetCollectionViewLayout.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!prefersPagingEnabled || (self.scrollDirection == UICollectionViewScrollDirectionHorizontal)"));

  }
  if (self->_prefersPagingEnabled != v3)
  {
    self->_prefersPagingEnabled = v3;
    -[PXGadgetCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setColumnWidth:(double)a3
{
  void *v6;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetCollectionViewLayout.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnWidth > 0"));

  }
  if (self->_columnWidth != a3)
  {
    self->_columnWidth = a3;
    -[PXGadgetCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setInterSectionSpacing:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetCollectionViewLayout.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interSectionSpacing >= 0"));

  }
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_interSectionSpacing = a3;
    -[PXGadgetCollectionViewLayout _updateMinimumLineSpacing](self, "_updateMinimumLineSpacing");
    -[PXGadgetCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setScrollDirection:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGadgetCollectionViewLayout;
  -[UICollectionViewFlowLayout setScrollDirection:](&v4, sel_setScrollDirection_, a3);
  -[PXGadgetCollectionViewLayout _updateMinimumLineSpacing](self, "_updateMinimumLineSpacing");
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double v5;
  double v6;
  objc_super v7;
  CGPoint result;

  v7.receiver = self;
  v7.super_class = (Class)PXGadgetCollectionViewLayout;
  -[PXGadgetCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v7, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  -[PXGadgetCollectionViewLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  CGFloat y;
  double x;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  -[PXGadgetCollectionViewLayout delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");

  if (v8)
  {
    -[PXGadgetCollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isPagingEnabled") & 1) == 0
      && -[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") == 1)
    {
      objc_msgSend(v9, "contentInset");
      v11 = v10;
      objc_msgSend(v9, "contentSize");
      v13 = v12;
      objc_msgSend(v9, "bounds");
      if (x < v13 - CGRectGetWidth(v30) - v11)
      {
        -[PXGadgetCollectionViewLayout interSectionSpacing](self, "interSectionSpacing");
        v15 = v14;
        -[UICollectionViewFlowLayout itemSize](self, "itemSize");
        v17 = v16;
        -[PXGadgetCollectionViewLayout delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "numberOfItemsInSection:", 0);

        if (v20 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXGadgetCollectionViewLayout collectionView:layout:sizeForItemAtIndexPath:](self, "collectionView:layout:sizeForItemAtIndexPath:", v9, self, v21);
          v17 = v22;

        }
        if (v15 + v17 > 0.0)
        {
          -[PXGadgetCollectionViewLayout spec](self, "spec");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "displayScale");
          if (v24 == 0.0)
          {
            objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "scale");

          }
          PXFloatRoundToPixel();
          x = v26;
        }
      }
    }

  }
  v27 = x;
  v28 = y;
  result.y = v28;
  result.x = v27;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[PXGadgetCollectionViewLayout interSectionSpacing](self, "interSectionSpacing", a3, a4);
  v8 = v7;
  if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") == 1 && v8 > 0.0)
  {
    v9 = 0.0;
    if (a5)
      v10 = v8;
    else
      v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
  }
  else
  {
    v12 = *MEMORY[0x1E0DC49E8];
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  result.right = v9;
  result.bottom = v11;
  result.left = v10;
  result.top = v12;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  _QWORD v30[4];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;
  CGSize result;
  CGRect v35;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PXGadgetCollectionViewLayout delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "identifier");
  v13 = objc_msgSend(v9, "section");
  v14 = objc_msgSend(v9, "item");

  v30[0] = v12;
  v30[1] = v13;
  v30[2] = v14;
  v30[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v11, "gadgetAtIndexPath:", v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetCollectionViewLayout spec](self, "spec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "scrollAxis");

  if (v17 == 2)
  {
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "contentInset");
    PXEdgeInsetsInsetSize();
    v19 = v23;
    v18 = v24;
    if (-[PXGadgetCollectionViewLayout prefersPagingEnabled](self, "prefersPagingEnabled"))
    {
      -[PXGadgetCollectionViewLayout columnWidth](self, "columnWidth");
      if (v25 > 0.0)
        v19 = v25;
    }
    else
    {
      -[PXGadgetCollectionViewLayout columnWidth](self, "columnWidth");
      objc_msgSend(v15, "sizeThatFits:");
      v19 = v26;
      if (v26 >= 1.79769313e308)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetCollectionViewLayout.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredWidth < CGFLOAT_MAX"));
        goto LABEL_15;
      }
    }
  }
  else
  {
    if (v17 != 1)
    {
      v18 = 0.0;
      v19 = 0.0;
      if (v17)
        goto LABEL_13;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        -[PXGadgetCollectionViewLayout spec](self, "spec");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v29;
        _os_log_fault_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Undefined scroll axis for spec %@. This shouldn't happen, but actually sometimes still does. See <rdar://problem/49414469> for details.", buf, 0xCu);

      }
    }
    objc_msgSend(v8, "bounds");
    objc_msgSend(v15, "sizeThatFits:", CGRectGetWidth(v35), 1.79769313e308);
    v19 = v20;
    v18 = v21;
    if (v21 >= 1.79769313e308)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetCollectionViewLayout.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredSize.height < CGFLOAT_MAX"));
LABEL_15:

    }
  }
LABEL_13:

  v27 = v19;
  v28 = v18;
  result.height = v28;
  result.width = v27;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  char v17;
  void *v18;
  NSString *v19;
  _BOOL8 IsAccessibilityCategory;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat Width;
  __objc2_class **v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD v35[2];
  __int128 v36;
  CGSize result;
  CGRect v38;

  v7 = a3;
  -[PXGadgetCollectionViewLayout delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = objc_msgSend(v9, "identifier");
  v35[1] = a5;
  v36 = xmmword_1A7C0C1F0;
  objc_msgSend(v9, "gadgetAtIndexPath:", v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0.0;
  v12 = 0.0;
  if (-[PXGadgetCollectionViewLayout _shouldShowSectionHeaderForGadget:](self, "_shouldShowSectionHeaderForGadget:", v10))
  {
    v13 = -[PXGadgetCollectionViewLayout _sectionHeaderStyleForGadget:](self, "_sectionHeaderStyleForGadget:", v10);
    v14 = v13;
    if (a5)
      v15 = v13 == 5;
    else
      v15 = 1;
    v16 = v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = objc_msgSend(v10, "wantsMultilineTitle");
    else
      v17 = 0;
    objc_msgSend(v7, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferredContentSizeCategory");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v19);

    if ((v17 & 1) != 0 || IsAccessibilityCategory)
    {
      -[PXGadgetCollectionViewLayout _titleForGadget:](self, "_titleForGadget:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[PXGadgetCollectionViewLayout _buttonTypeForGadget:](self, "_buttonTypeForGadget:", v10);
      -[PXGadgetCollectionViewLayout delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "insetsForSectionHeaders");
      v26 = v25;
      v28 = v27;

      objc_msgSend(v7, "bounds");
      Width = CGRectGetWidth(v38);
      v30 = off_1E50B2EC8;
      v31 = Width - v26 - v28;
      if (v14 != 6)
        v30 = off_1E50B2F00;
      -[__objc2_class preferredHeightForText:buttonType:fittingWidth:style:dividerHidden:isAccessibilitySize:](*v30, "preferredHeightForText:buttonType:fittingWidth:style:dividerHidden:isAccessibilitySize:", v22, v23, v14, v16, IsAccessibilityCategory, v31);
      v12 = v32;

    }
    else
    {
      +[PXGadgetSpec sectionHeaderHeightForStyle:dividerHidden:](PXGadgetSpec, "sectionHeaderHeightForStyle:dividerHidden:", v14, v16);
      v12 = v21;
    }
    v11 = 1.0;
  }

  v33 = v11;
  v34 = v12;
  result.height = v34;
  result.width = v33;
  return result;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  double v12;
  uint64_t v13;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PXGadgetCollectionViewLayout;
  -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v15, sel_invalidationContextForBoundsChange_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetCollectionViewLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v10 = CGRectGetWidth(v16);
  objc_msgSend(v9, "bounds");
  v11 = v10 != CGRectGetWidth(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v12 = CGRectGetHeight(v18);
  objc_msgSend(v9, "bounds");
  v13 = v12 != CGRectGetHeight(v19) || v11;
  objc_msgSend(v8, "setInvalidateFlowLayoutDelegateMetrics:", v13);

  return v8;
}

- (void)_updateMinimumLineSpacing
{
  if (-[UICollectionViewFlowLayout scrollDirection](self, "scrollDirection") == 1)
  {
    -[PXGadgetCollectionViewLayout interSectionSpacing](self, "interSectionSpacing");
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self, "setMinimumLineSpacing:");
  }
}

- (id)_titleForGadget:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "localizedTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)_buttonTypeForGadget:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "accessoryButtonType");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasButtonForGadget:(id)a3
{
  return -[PXGadgetCollectionViewLayout _buttonTypeForGadget:](self, "_buttonTypeForGadget:", a3) != 0;
}

- (BOOL)_shouldShowSectionHeaderForGadget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  -[PXGadgetCollectionViewLayout _titleForGadget:](self, "_titleForGadget:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "length") != 0;
  else
    v7 = 0;
  v8 = -[PXGadgetCollectionViewLayout _hasButtonForGadget:](self, "_hasButtonForGadget:", v4);
  -[PXGadgetCollectionViewLayout spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "scrollAxis");

  v11 = v10 == 1 && (v7 || v8);
  return v11;
}

- (unint64_t)_sectionHeaderStyleForGadget:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "headerStyle");
  else
    v4 = 0;

  return v4;
}

- (PXGadgetSpec)spec
{
  return self->_spec;
}

- (PXGadgetCollectionViewLayoutDelegate)delegate
{
  return (PXGadgetCollectionViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)prefersPagingEnabled
{
  return self->_prefersPagingEnabled;
}

- (int64_t)pageSizeClass
{
  return self->_pageSizeClass;
}

- (void)setPageSizeClass:(int64_t)a3
{
  self->_pageSizeClass = a3;
}

- (BOOL)isPageFullColumnnWidth
{
  return self->_isPageFullColumnnWidth;
}

- (void)setIsPageFullColumnnWidth:(BOOL)a3
{
  self->_isPageFullColumnnWidth = a3;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
