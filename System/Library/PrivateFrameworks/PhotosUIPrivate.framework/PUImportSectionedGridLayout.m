@implementation PUImportSectionedGridLayout

- (PUImportSectionedGridLayout)init
{
  PUImportSectionedGridLayout *v2;
  uint64_t v3;
  UIColor *emphasizedSectionBackgroundColor;
  uint64_t v5;
  UIColor *emphasizedSectionBottomStrokeColor;
  void *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUImportSectionedGridLayout;
  v2 = -[PUSectionedGridLayout init](&v10, sel_init);
  if (v2)
  {
    -[PUImportSectionedGridLayout registerClass:forDecorationViewOfKind:](v2, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("PUImportSectionedGridLayoutDecorationKindSectionBackground"));
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
    emphasizedSectionBackgroundColor = v2->_emphasizedSectionBackgroundColor;
    v2->_emphasizedSectionBackgroundColor = (UIColor *)v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v5 = objc_claimAutoreleasedReturnValue();
    emphasizedSectionBottomStrokeColor = v2->_emphasizedSectionBottomStrokeColor;
    v2->_emphasizedSectionBottomStrokeColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v2->_emphasizedSectionBottomStrokeWidth = 1.0 / v8;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *sectionDecorationAttributesBySection;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[PUSectionedGridLayout delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PUImportSectionedGridLayout;
    -[PUSectionedGridLayout setDelegate:](&v9, sel_setDelegate_, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    sectionDecorationAttributesBySection = self->_sectionDecorationAttributesBySection;
    self->_sectionDecorationAttributesBySection = v6;

    -[PUSectionedGridLayout delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_delegateSupportsPerSectionHighlight = objc_opt_respondsToSelector() & 1;

    -[PUImportSectionedGridLayout invalidateLayout](self, "invalidateLayout");
  }

}

- (void)prepareLayout
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUImportSectionedGridLayout;
  -[PUSectionedGridLayout prepareLayout](&v5, sel_prepareLayout);
  -[PUImportSectionedGridLayout sectionDecorationAttributesBySection](self, "sectionDecorationAttributesBySection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  -[PUImportSectionedGridLayout setPreUpdateSectionDecorationAttributesBySection:](self, "setPreUpdateSectionDecorationAttributesBySection:", v4);

  -[PUImportSectionedGridLayout recreateSectionDecorationAttributes](self, "recreateSectionDecorationAttributes");
}

- (void)recreateSectionDecorationAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  -[PUImportSectionedGridLayout sectionDecorationAttributesBySection](self, "sectionDecorationAttributesBySection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PUImportSectionedGridLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSectionedGridLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "numberOfSectionsInCollectionView:", v6);

  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      if (self->_delegateSupportsPerSectionHighlight)
      {
        -[PUSectionedGridLayout delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "importSectionedGridLayout:shouldEmphasizeSection:", self, i);

      }
      else
      {
        v10 = 0;
      }
      -[PUImportSectionedGridLayout collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportSectionedGridLayout collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "collectionView:numberOfItemsInSection:", v13, i);

      if (v10)
      {
        if (v14 >= 1)
        {
          -[PUImportSectionedGridLayout createLayoutAttributesForSectionBackgroundAtSection:](self, "createLayoutAttributesForSectionBackgroundAtSection:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUImportSectionedGridLayout sectionDecorationAttributesBySection](self, "sectionDecorationAttributesBySection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

        }
      }
    }
  }
}

- (id)createLayoutAttributesForSectionBackgroundAtSection:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  CGFloat rect;
  CGFloat v47;
  void *v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  -[PUSectionedGridLayout globalTopPadding](self, "globalTopPadding");
  v6 = v5;
  -[PUSectionedGridLayout sectionTopPadding](self, "sectionTopPadding");
  v8 = v7;
  -[PUSectionedGridLayout sectionHeaderElementKind](self, "sectionHeaderElementKind");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSectionedGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v16 = v12;
  v48 = (void *)v9;
  if (a3)
    v17 = CGRectGetMinY(*(CGRect *)&v12) - v8 - v6;
  else
    v17 = 0.0;
  objc_msgSend(v11, "size");
  v19 = v18;
  +[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:withIndexPath:](PUImportSectionedGridLayoutAttributes, "layoutAttributesForDecorationViewOfKind:withIndexPath:", CFSTR("PUImportSectionedGridLayoutDecorationKindSectionBackground"), v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSectionedGridLayout collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportSectionedGridLayout collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "collectionView:numberOfItemsInSection:", v23, a3);

  if (v24 <= 0)
  {
    v42 = 0.0;
  }
  else
  {
    v47 = v17;
    rect = *(double *)(MEMORY[0x1E0C9D648] + 24);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v24 - 1, a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[PUSectionedGridLayout itemSize](self, "itemSize");
    v36 = v35;
    v49.origin.x = v28;
    v49.origin.y = v30;
    v49.size.width = v32;
    v49.size.height = v34;
    if (CGRectGetHeight(v49) < v36)
    {
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v28 = v37;
      v30 = v38;
      v32 = v39;
      v34 = v40;
    }
    v50.origin.x = v28;
    v50.origin.y = v30;
    v50.size.width = v32;
    v50.size.height = v34;
    v17 = v47;
    v41 = v8 + CGRectGetMaxY(v50);
    v51.origin.x = v16;
    v51.origin.y = v47;
    v51.size.width = v19;
    v51.size.height = rect;
    v42 = v41 - CGRectGetMinY(v51);

  }
  objc_msgSend(v20, "setFrame:", v16, v17, v19, v42);
  -[PUImportSectionedGridLayout emphasizedSectionBackgroundColor](self, "emphasizedSectionBackgroundColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v43);

  -[PUImportSectionedGridLayout emphasizedSectionBottomStrokeWidth](self, "emphasizedSectionBottomStrokeWidth");
  objc_msgSend(v20, "setStrokeWidth:");
  -[PUImportSectionedGridLayout emphasizedSectionBottomStrokeColor](self, "emphasizedSectionBottomStrokeColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBottomStrokeColor:", v44);

  objc_msgSend(v20, "setZIndex:", -1);
  return v20;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "indexPathBeforeUpdate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "section") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v12, "item") == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v11, "updateAction") == 1)
            objc_msgSend(v5, "addObject:", v12);
          else
            objc_msgSend(v11, "updateAction");
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  -[PUImportSectionedGridLayout setSectionIndexPathsBeingDeleted:](self, "setSectionIndexPathsBeingDeleted:", v13);

  v14.receiver = self;
  v14.super_class = (Class)PUImportSectionedGridLayout;
  -[PUSectionedGridLayout prepareForCollectionViewUpdates:](&v14, sel_prepareForCollectionViewUpdates_, v6);

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUImportSectionedGridLayout;
  -[PUSectionedGridLayout finalizeCollectionViewUpdates](&v3, sel_finalizeCollectionViewUpdates);
  -[PUImportSectionedGridLayout setSectionIndexPathsBeingDeleted:](self, "setSectionIndexPathsBeingDeleted:", 0);
  -[PUImportSectionedGridLayout setPreUpdateSectionDecorationAttributesBySection:](self, "setPreUpdateSectionDecorationAttributesBySection:", 0);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PUImportSectionedGridLayout;
  -[PUSectionedGridLayout layoutAttributesForElementsInRect:](&v21, sel_layoutAttributesForElementsInRect_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[PUImportSectionedGridLayout sectionDecorationAttributesBySection](self, "sectionDecorationAttributesBySection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        if (CGRectIntersectsRect(v24, v25))
          objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUImportSectionedGridLayoutDecorationKindSectionBackground")))
  {
    -[PUImportSectionedGridLayout createLayoutAttributesForSectionBackgroundAtSection:](self, "createLayoutAttributesForSectionBackgroundAtSection:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PUImportSectionedGridLayout;
    -[PUImportSectionedGridLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](&v12, sel_layoutAttributesForDecorationViewOfKind_atIndexPath_, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PUImportSectionedGridLayout;
  -[PUImportSectionedGridLayout indexPathsToDeleteForDecorationViewOfKind:](&v23, sel_indexPathsToDeleteForDecorationViewOfKind_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PUImportSectionedGridLayoutDecorationKindSectionBackground")))
  {
    v18 = v4;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[PUImportSectionedGridLayout sectionIndexPathsBeingDeleted](self, "sectionIndexPathsBeingDeleted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "section");
          -[PUImportSectionedGridLayout preUpdateSectionDecorationAttributesBySection](self, "preUpdateSectionDecorationAttributesBySection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v15, "indexPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v9);
    }

    v4 = v18;
  }

  return v6;
}

- (NSMutableDictionary)sectionDecorationAttributesBySection
{
  return self->_sectionDecorationAttributesBySection;
}

- (void)setSectionDecorationAttributesBySection:(id)a3
{
  objc_storeStrong((id *)&self->_sectionDecorationAttributesBySection, a3);
}

- (NSMutableDictionary)preUpdateSectionDecorationAttributesBySection
{
  return self->_preUpdateSectionDecorationAttributesBySection;
}

- (void)setPreUpdateSectionDecorationAttributesBySection:(id)a3
{
  objc_storeStrong((id *)&self->_preUpdateSectionDecorationAttributesBySection, a3);
}

- (UIColor)emphasizedSectionBackgroundColor
{
  return self->_emphasizedSectionBackgroundColor;
}

- (void)setEmphasizedSectionBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizedSectionBackgroundColor, a3);
}

- (UIColor)emphasizedSectionBottomStrokeColor
{
  return self->_emphasizedSectionBottomStrokeColor;
}

- (void)setEmphasizedSectionBottomStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizedSectionBottomStrokeColor, a3);
}

- (double)emphasizedSectionBottomStrokeWidth
{
  return self->_emphasizedSectionBottomStrokeWidth;
}

- (void)setEmphasizedSectionBottomStrokeWidth:(double)a3
{
  self->_emphasizedSectionBottomStrokeWidth = a3;
}

- (NSArray)sectionIndexPathsBeingDeleted
{
  return self->_sectionIndexPathsBeingDeleted;
}

- (void)setSectionIndexPathsBeingDeleted:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIndexPathsBeingDeleted, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIndexPathsBeingDeleted, 0);
  objc_storeStrong((id *)&self->_emphasizedSectionBottomStrokeColor, 0);
  objc_storeStrong((id *)&self->_emphasizedSectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preUpdateSectionDecorationAttributesBySection, 0);
  objc_storeStrong((id *)&self->_sectionDecorationAttributesBySection, 0);
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

@end
