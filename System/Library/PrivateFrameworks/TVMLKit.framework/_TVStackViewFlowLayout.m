@implementation _TVStackViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (_TVStackViewFlowLayout)init
{
  _TVStackViewFlowLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVStackViewFlowLayout;
  result = -[_TVStackViewFlowLayout init](&v3, sel_init);
  if (result)
  {
    result->_supplementaryCellSection = 0x7FFFFFFFFFFFFFFFLL;
    result->_showcaseFactor = NAN;
  }
  return result;
}

- (void)setSupplementaryCellLayoutAttributes:(id)a3
{
  NSArray *v4;
  NSArray *supplementaryCellLayoutAttributes;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  supplementaryCellLayoutAttributes = self->_supplementaryCellLayoutAttributes;
  self->_supplementaryCellLayoutAttributes = v4;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_supplementaryCellLayoutAttributes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "setZIndex:", 0, (_QWORD)v12);
        -[_TVStackViewFlowLayout showcaseFactor](self, "showcaseFactor");
        objc_msgSend(v11, "setShowcaseFactor:");
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)prepareLayout
{
  void *v3;
  id WeakRetained;
  id v5;
  double showcaseFactor;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  CGFloat Width;
  NSArray *sectionCellLayoutAttributes;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  id obj;
  CGRect v18;

  -[_TVStackViewFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  obj = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewDelegateFlowLayout);
  if (WeakRetained != obj)
  {
    if (objc_msgSend(obj, "conformsToProtocol:", &unk_2557D32A0))
    {
      v5 = objc_storeWeak((id *)&self->_stackViewDelegateFlowLayout, obj);
      self->_stackViewDelegateFlowLayoutFlags.hasShowcaseFactorDidChange = objc_opt_respondsToSelector() & 1;

    }
    else
    {
      objc_storeWeak((id *)&self->_stackViewDelegateFlowLayout, 0);
      self->_stackViewDelegateFlowLayoutFlags.hasShowcaseFactorDidChange = 0;
    }
  }
  showcaseFactor = self->_showcaseFactor;
  -[_TVStackViewFlowLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  -[_TVStackViewFlowLayout _computeShowcaseFactorForContentOffset:](self, "_computeShowcaseFactorForContentOffset:");
  self->_showcaseFactor = v8;

  if (showcaseFactor != self->_showcaseFactor && self->_stackViewDelegateFlowLayoutFlags.hasShowcaseFactorDidChange)
  {
    v9 = objc_loadWeakRetained((id *)&self->_stackViewDelegateFlowLayout);
    -[_TVStackViewFlowLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:showcaseFactorDidChangeForLayout:", v10, self);

  }
  -[_TVStackViewFlowLayout collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  Width = CGRectGetWidth(v18);

  if (self->_lastLayoutWidth != Width)
  {
    self->_lastLayoutWidth = Width;
    sectionCellLayoutAttributes = self->_sectionCellLayoutAttributes;
    self->_sectionCellLayoutAttributes = 0;

  }
  -[_TVStackViewFlowLayout sectionCellLayoutAttributes](self, "sectionCellLayoutAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[_TVStackViewFlowLayout onPrepareLayout](self, "onPrepareLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[_TVStackViewFlowLayout onPrepareLayout](self, "onPrepareLayout");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _TVStackViewFlowLayout *))v16)[2](v16, self);

    }
    -[_TVStackViewFlowLayout _prepareSectionMetrics](self, "_prepareSectionMetrics");
  }

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double v4;
  double v5;
  double v6;

  -[_TVStackViewFlowLayout _computeShowcaseFactorForContentOffset:](self, "_computeShowcaseFactorForContentOffset:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  -[_TVStackViewFlowLayout showcaseFactor](self, "showcaseFactor");
  return v5 != v6;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;

  y = a3.origin.y;
  x = a3.origin.x;
  v6 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
  -[_TVStackViewFlowLayout _computeShowcaseFactorForContentOffset:](self, "_computeShowcaseFactorForContentOffset:", x, y);
  v8 = v7;
  -[_TVStackViewFlowLayout showcaseFactor](self, "showcaseFactor");
  if (v8 != v9)
    objc_msgSend(v6, "setInvalidateSectionMetrics:", 1);
  return v6;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *oldSectionCellLayoutAttributes;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "invalidateEverything") & 1) != 0
    || objc_msgSend(v4, "invalidateDataSourceCounts"))
  {
    if (objc_msgSend(v4, "invalidateDataSourceCounts"))
    {
      -[_TVStackViewFlowLayout sectionCellLayoutAttributes](self, "sectionCellLayoutAttributes");
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      oldSectionCellLayoutAttributes = self->_oldSectionCellLayoutAttributes;
      self->_oldSectionCellLayoutAttributes = v5;

    }
    -[_TVStackViewFlowLayout setSectionCellLayoutAttributes:](self, "setSectionCellLayoutAttributes:", 0);
    -[_TVStackViewFlowLayout setContentSize:](self, "setContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[_TVStackViewFlowLayout setSupplementaryCellSection:](self, "setSupplementaryCellSection:", 0x7FFFFFFFFFFFFFFFLL);
    -[_TVStackViewFlowLayout setSupplementaryCellLayoutAttributes:](self, "setSupplementaryCellLayoutAttributes:", 0);
  }
  else if (objc_msgSend(v4, "invalidateSectionMetrics"))
  {
    -[_TVStackViewFlowLayout setSectionCellLayoutAttributes:](self, "setSectionCellLayoutAttributes:", 0);
    -[_TVStackViewFlowLayout setContentSize:](self, "setContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  }
  v7.receiver = self;
  v7.super_class = (Class)_TVStackViewFlowLayout;
  -[_TVStackViewFlowLayout invalidateLayoutWithContext:](&v7, sel_invalidateLayoutWithContext_, v4);

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v43 = *MEMORY[0x24BDAC8D0];
  if (CGRectGetMinY(a3) == 0.0)
  {
    -[_TVStackViewFlowLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentInset");
    v10 = v9;

    y = -v10;
    height = height + v10;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[_TVStackViewFlowLayout supplementaryCellLayoutAttributes](self, "supplementaryCellLayoutAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v17, "frame");
        v46.origin.x = v18;
        v46.origin.y = v19;
        v46.size.width = v20;
        v46.size.height = v21;
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        if (CGRectIntersectsRect(v44, v46))
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v14);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[_TVStackViewFlowLayout sectionCellLayoutAttributes](self, "sectionCellLayoutAttributes", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v27, "frame");
        v47.origin.x = v28;
        v47.origin.y = v29;
        v47.size.width = v30;
        v47.size.height = v31;
        v45.origin.x = x;
        v45.origin.y = y;
        v45.size.width = width;
        v45.size.height = height;
        if (CGRectIntersectsRect(v45, v47))
          objc_msgSend(v11, "addObject:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v24);
  }

  return v11;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == -[_TVStackViewFlowLayout supplementaryCellSection](self, "supplementaryCellSection"))
    -[_TVStackViewFlowLayout supplementaryCellLayoutAttributes](self, "supplementaryCellLayoutAttributes");
  else
    -[_TVStackViewFlowLayout sectionCellLayoutAttributes](self, "sectionCellLayoutAttributes");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "indexPath", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_14;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return v7;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  IKChangeSet *changeSet;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  NSIndexSet *indexesAddedAtEnd;
  _TVStackViewFlowLayout *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39 = self;
  v45.receiver = self;
  v45.super_class = (Class)_TVStackViewFlowLayout;
  -[_TVStackViewFlowLayout prepareForCollectionViewUpdates:](&v45, sel_prepareForCollectionViewUpdates_, v4);
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        if (!objc_msgSend(v12, "updateAction"))
        {
          objc_msgSend(v12, "indexPathAfterUpdate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "section");
          v15 = v5;
          goto LABEL_10;
        }
        if (objc_msgSend(v12, "updateAction") == 1)
        {
          objc_msgSend(v12, "indexPathBeforeUpdate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "section");
          v15 = v6;
LABEL_10:
          objc_msgSend(v15, "addIndex:", v14);
LABEL_11:

          goto LABEL_12;
        }
        if (objc_msgSend(v12, "updateAction") == 3)
        {
          v16 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "indexPathBeforeUpdate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v13, "section"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v12, "indexPathAfterUpdate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "section"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v17, v20);

          goto LABEL_11;
        }
LABEL_12:
        ++v11;
      }
      while (v9 != v11);
      v21 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      v9 = v21;
    }
    while (v21);
  }

  v22 = objc_msgSend(objc_alloc(MEMORY[0x24BE51968]), "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v5, v6, v40, 0);
  changeSet = v39->_changeSet;
  v39->_changeSet = (IKChangeSet *)v22;

  -[_TVStackViewFlowLayout collectionView](v39, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentOffset");
  v39->_initialContentOffset.x = v25;
  v39->_initialContentOffset.y = v26;

  -[_TVStackViewFlowLayout collectionView](v39, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dataSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackViewFlowLayout collectionView](v39, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "numberOfSectionsInCollectionView:", v29);

  v31 = objc_msgSend(v5, "count");
  v39->_isFullReplace = v31 == v30 - 1;
  if (v31 != v30 - 1)
  {
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v5, "lastIndex");
    if (v33 != 0x7FFFFFFFFFFFFFFFLL && v33 == v30 - 2)
    {
      v34 = v30 - 3;
      do
      {
        objc_msgSend(v32, "addIndex:", v34 + 1);
        v35 = objc_msgSend(v5, "indexLessThanIndex:", v34 + 1);
      }
      while (v35 != 0x7FFFFFFFFFFFFFFFLL && v34-- == v35);
    }
    v37 = objc_msgSend(v32, "copy");
    indexesAddedAtEnd = v39->_indexesAddedAtEnd;
    v39->_indexesAddedAtEnd = (NSIndexSet *)v37;

  }
}

- (void)finalizeCollectionViewUpdates
{
  NSArray *oldSectionCellLayoutAttributes;
  IKChangeSet *changeSet;
  NSIndexSet *indexesAddedAtEnd;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVStackViewFlowLayout;
  -[_TVStackViewFlowLayout finalizeCollectionViewUpdates](&v6, sel_finalizeCollectionViewUpdates);
  oldSectionCellLayoutAttributes = self->_oldSectionCellLayoutAttributes;
  self->_oldSectionCellLayoutAttributes = 0;

  changeSet = self->_changeSet;
  self->_changeSet = 0;

  self->_initialContentOffset = (CGPoint)*MEMORY[0x24BDBEFB0];
  indexesAddedAtEnd = self->_indexesAddedAtEnd;
  self->_indexesAddedAtEnd = 0;

}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  NSObject *v27;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[IKChangeSet oldIndexForNewIndex:](self->_changeSet, "oldIndexForNewIndex:", objc_msgSend(v4, "section"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_TVStackViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(v7, "setAlpha:", 0.0);
    if (!self->_isFullReplace
      && !-[NSIndexSet containsIndex:](self->_indexesAddedAtEnd, "containsIndex:", objc_msgSend(v4, "section")))
    {
      objc_msgSend(v7, "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[_TVStackViewFlowLayout collectionView](self, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "effectiveUserInterfaceLayoutDirection");

      if (v17)
        v18 = -1.0;
      else
        v18 = 1.0;
      -[_TVStackViewFlowLayout collectionView](self, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v21 = v9 + v18 * v20;

      -[_TVStackViewFlowLayout collectionView](self, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "contentOffset");
      v24 = v23;

      v25 = v11 - (v24 - self->_initialContentOffset.y);
      objc_msgSend(v7, "setAlpha:", 1.0);
      objc_msgSend(v7, "setFrame:", v21, v25, v13, v15);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVStackViewFlowLayout _oldLayoutAttributesForItemAtIndexPath:](self, "_oldLayoutAttributesForItemAtIndexPath:", v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v27 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v29 = CFSTR("NA");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "section"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v32 = v31;
    objc_msgSend(v7, "frame");
    v34 = 138413058;
    v35 = v29;
    v36 = 2112;
    v37 = v30;
    v38 = 2048;
    v39 = v32;
    v40 = 2048;
    v41 = v33;
    _os_log_debug_impl(&dword_222D98000, v27, OS_LOG_TYPE_DEBUG, "stackUpdate: appearing %@ - %@ initial {%lf, %lf}", (uint8_t *)&v34, 0x2Au);

    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  }

  return v7;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  NSObject *v14;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGAffineTransform v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[IKChangeSet newIndexForOldIndex:](self->_changeSet, "newIndexForOldIndex:", objc_msgSend(v4, "section"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_TVStackViewFlowLayout _oldLayoutAttributesForItemAtIndexPath:](self, "_oldLayoutAttributesForItemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(v7, "setAlpha:", 0.0);
    if (!self->_isFullReplace)
    {
      CGAffineTransformMakeScale(&v21, 1.0, 0.1);
      objc_msgSend(v7, "setTransform:", &v21);
      if (-[IKChangeSet oldIndexForNewIndex:](self->_changeSet, "oldIndexForNewIndex:", objc_msgSend(v4, "section")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v7, "center");
        v9 = v8;
        v11 = v10;
        objc_msgSend(v7, "bounds");
        objc_msgSend(v7, "setCenter:", v9, v11 + v12 * -0.9 * 0.5);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVStackViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = CFSTR("NA");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "frame");
    v19 = v18;
    objc_msgSend(v7, "frame");
    *(_DWORD *)buf = 138413058;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    v26 = 2048;
    v27 = v19;
    v28 = 2048;
    v29 = v20;
    _os_log_debug_impl(&dword_222D98000, v14, OS_LOG_TYPE_DEBUG, "stackUpdate: disappearing %@ - %@ final {%lf, %lf}", buf, 0x2Au);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)

  }
  return v7;
}

- (id)_oldLayoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_oldSectionCellLayoutAttributes;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "indexPath", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_prepareSectionMetrics
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double Width;
  id WeakRetained;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;

  v38 = *MEMORY[0x24BDAC8D0];
  -[_TVStackViewFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  objc_msgSend(v3, "bounds");
  v32 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 < 1)
  {
    v9 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v7 = 0;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      if (v7 == -[_TVStackViewFlowLayout supplementaryCellSection](self, "supplementaryCellSection"))
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        -[_TVStackViewFlowLayout supplementaryCellLayoutAttributes](self, "supplementaryCellLayoutAttributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v34 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "frame");
              Width = CGRectGetWidth(v39);
              if (v8 < Width)
                v8 = Width;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v12);
        }
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewDelegateFlowLayout);
        objc_msgSend(WeakRetained, "collectionView:layout:insetForSectionAtIndex:", v3, self, v7);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;

        v25 = objc_loadWeakRetained((id *)&self->_stackViewDelegateFlowLayout);
        objc_msgSend(v25, "collectionView:layout:sizeForSectionAtIndex:", v3, self, v7);
        v27 = v26;
        v29 = v28;

        v30 = v24 + v20 + v27;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](_TVStackViewFlowLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v10);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setZIndex:", 1);
        objc_msgSend(v31, "setFrame:", floor((v32 - v30) * 0.5), v9 + v18, v27, v29);
        -[_TVStackViewFlowLayout showcaseFactor](self, "showcaseFactor");
        objc_msgSend(v31, "setShowcaseFactor:");
        objc_msgSend(v6, "addObject:", v31);
        if (v8 < v30)
          v8 = v30;
        v9 = v9 + v22 + v18 + v29;

      }
      ++v7;
    }
    while (v7 != v4);
  }
  -[_TVStackViewFlowLayout setContentSize:](self, "setContentSize:", v8, v9);
  -[_TVStackViewFlowLayout setSectionCellLayoutAttributes:](self, "setSectionCellLayoutAttributes:", v6);

}

- (double)_computeShowcaseFactorForContentOffset:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double result;
  double v11;
  double v12;
  double v13;

  y = a3.y;
  -[_TVStackViewFlowLayout showcaseHeight](self, "showcaseHeight", a3.x);
  v6 = v5;
  -[_TVStackViewFlowLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInset");
  v9 = v8;

  result = 0.0;
  v11 = 0.0;
  if (v6 > 0.0)
  {
    v12 = y + v9;
    v11 = 1.0;
    if (y + v9 > 0.0)
    {
      v11 = 0.0;
      if (v12 < v6)
        v11 = (v6 - v12) / v6;
    }
  }
  v13 = fmin(v11 * 1.005 + -0.0025, 1.0);
  if (v13 >= 0.0)
    return v13;
  return result;
}

- (int64_t)supplementaryCellSection
{
  return self->_supplementaryCellSection;
}

- (void)setSupplementaryCellSection:(int64_t)a3
{
  self->_supplementaryCellSection = a3;
}

- (NSArray)supplementaryCellLayoutAttributes
{
  return self->_supplementaryCellLayoutAttributes;
}

- (id)onPrepareLayout
{
  return self->_onPrepareLayout;
}

- (void)setOnPrepareLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (double)showcaseHeight
{
  return self->_showcaseHeight;
}

- (void)setShowcaseHeight:(double)a3
{
  self->_showcaseHeight = a3;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (NSArray)sectionCellLayoutAttributes
{
  return self->_sectionCellLayoutAttributes;
}

- (void)setSectionCellLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionCellLayoutAttributes, 0);
  objc_storeStrong(&self->_onPrepareLayout, 0);
  objc_storeStrong((id *)&self->_supplementaryCellLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_indexesAddedAtEnd, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_oldSectionCellLayoutAttributes, 0);
  objc_destroyWeak((id *)&self->_stackViewDelegateFlowLayout);
}

@end
