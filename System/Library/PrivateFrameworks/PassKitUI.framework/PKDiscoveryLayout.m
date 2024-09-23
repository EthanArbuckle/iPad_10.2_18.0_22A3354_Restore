@implementation PKDiscoveryLayout

- (PKDiscoveryLayout)init
{
  PKDiscoveryLayout *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *attributesPerIndexPath;
  NSMutableDictionary *v5;
  NSMutableDictionary *headersPerIndexPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDiscoveryLayout;
  v2 = -[PKDiscoveryLayout init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributesPerIndexPath = v2->_attributesPerIndexPath;
    v2->_attributesPerIndexPath = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    headersPerIndexPath = v2->_headersPerIndexPath;
    v2->_headersPerIndexPath = v5;

  }
  return v2;
}

- (CGSize)collectionViewContentSize
{
  CGSize *p_currentSize;
  CGFloat width;
  double height;
  unint64_t v6;
  double *v7;
  double v8;
  double v9;
  BOOL v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  p_currentSize = &self->_currentSize;
  width = self->_currentSize.width;
  height = self->_currentSize.height;
  v6 = PKUIGetMinScreenType();
  v7 = (double *)((char *)&unk_19DF16E50 + 8 * v6);
  if (v6 >= 0x12)
    v7 = (double *)(MEMORY[0x1E0C9D820] + 8);
  v8 = *v7;
  v9 = p_currentSize->height;
  v10 = v9 < *v7;
  v11 = v9 >= *v7;
  v12 = v8 + 5.0;
  if (v10)
    v13 = v12;
  else
    v13 = height;
  self->_isScrollable = v11;
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  void *v5;
  CGFloat v6;
  double v7;
  CGSize *p_currentSize;
  id v9;
  uint64_t v10;
  double v11;
  double height;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *headersPerIndexPath;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  objc_super v39;

  -[PKDiscoveryLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    -[NSMutableDictionary removeAllObjects](self->_attributesPerIndexPath, "removeAllObjects");
    objc_msgSend(v3, "bounds");
    v7 = v6;
    p_currentSize = &self->_currentSize;
    self->_currentSize.width = v6;
    self->_currentSize.height = 0.0;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v3, "numberOfSections") >= 1)
    {
      v10 = 0;
      v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v38 = *MEMORY[0x1E0C9D820];
      v37 = *MEMORY[0x1E0DC48A8];
      do
      {
        height = p_currentSize->height;
        objc_msgSend(v5, "collectionView:layout:referenceSizeForHeaderInSection:", v3, self, v10);
        v15 = v14;
        v16 = v14 == v38 && v13 == v11;
        v17 = v11;
        v18 = 0.0;
        if (!v16)
        {
          v19 = v13;
          v20 = (void *)MEMORY[0x1E0DC3628];
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v37, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "setSize:", v15, v19);
          objc_msgSend(v22, "setFrame:", 0.0, height, v15, v19);
          headersPerIndexPath = self->_headersPerIndexPath;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](headersPerIndexPath, "setObject:forKey:", v22, v24);

          objc_msgSend(v9, "addObject:", v22);
          v18 = v15 + 0.0;

          v17 = v19;
        }
        v25 = objc_msgSend(v3, "numberOfItemsInSection:", v10);
        if (v25)
        {
          v26 = v25;
          for (i = 0; i != v26; ++i)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, v10);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "collectionView:layout:sizeForItemAtIndexPath:", v3, self, v28);
            v30 = v29;
            v32 = v31;
            if (v7 - v18 >= v29)
            {
              if (v18 != 0.0)
                v18 = v18 + self->_interimSpacing;
            }
            else
            {
              height = height + v17 + self->_lineSpacing;
              PKFloatRoundToPixel();
              -[PKDiscoveryLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v9);
              objc_msgSend(v9, "removeAllObjects");
              v18 = 0.0;
            }
            objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v28);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setSize:", v30, v32);
            objc_msgSend(v33, "setFrame:", v18, height, v30, v32);
            -[NSMutableDictionary setObject:forKey:](self->_attributesPerIndexPath, "setObject:forKey:", v33, v28);
            objc_msgSend(v9, "addObject:", v33);
            v18 = v30 + v18;

            v17 = v32;
          }
        }
        else
        {
          v32 = v17;
        }
        if (objc_msgSend(v9, "count"))
        {
          PKFloatRoundToPixel();
          v35 = v34;
          v36 = (void *)objc_msgSend(v9, "copy");
          -[PKDiscoveryLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v36, v35);

          objc_msgSend(v9, "removeAllObjects");
        }
        p_currentSize = &self->_currentSize;
        self->_currentSize.height = v32 + height;
        ++v10;
      }
      while (v10 < objc_msgSend(v3, "numberOfSections"));
    }
    p_currentSize->height = p_currentSize->height + 16.0;
    v39.receiver = self;
    v39.super_class = (Class)PKDiscoveryLayout;
    -[PKDiscoveryLayout prepareLayout](&v39, sel_prepareLayout);

  }
}

- (void)_adjustItems:(id)a3 withLateralMove:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "frame");
        objc_msgSend(v10, "setFrame:", v11 + a4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_attributesPerIndexPath;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKey:](self->_attributesPerIndexPath, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (double)interimSpacing
{
  return self->_interimSpacing;
}

- (void)setInterimSpacing:(double)a3
{
  self->_interimSpacing = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (BOOL)isScrollable
{
  return self->_isScrollable;
}

- (void)setIsScrollable:(BOOL)a3
{
  self->_isScrollable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headersPerIndexPath, 0);
  objc_storeStrong((id *)&self->_attributesPerIndexPath, 0);
}

@end
