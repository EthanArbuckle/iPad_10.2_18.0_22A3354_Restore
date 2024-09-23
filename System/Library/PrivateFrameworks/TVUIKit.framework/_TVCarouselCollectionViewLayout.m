@implementation _TVCarouselCollectionViewLayout

- (void)prepareLayout
{
  uint64_t v3;
  void *v4;
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
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *layoutAttributesByIndexPath;
  id v24;

  -[_TVCarouselCollectionViewLayout collectionView](self, "collectionView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v24, "numberOfItemsInSection:", 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCarouselCollectionViewLayout itemSize](self, "itemSize");
  v6 = v5;
  v8 = v7;
  -[_TVCarouselCollectionViewLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  v10 = v9;
  objc_msgSend(v24, "center");
  v12 = v11;
  objc_msgSend(v24, "contentOffset");
  v14 = v13;
  objc_msgSend(v24, "center");
  objc_msgSend(v24, "contentOffset");
  -[_TVCarouselCollectionViewLayout itemSize](self, "itemSize");
  if (v3 >= 1)
  {
    v16 = 0;
    v17 = (uint64_t)((v12 + v14) / (v10 + v15));
    v18 = v6 + v10;
    v19 = 0.0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v16, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6920], "layoutAttributesForCellWithIndexPath:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", v19, 0.0, v6, v8);
      objc_msgSend(v21, "setZIndex:", objc_msgSend(v20, "item") == v17);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v20);
      v19 = v18 + v19;

      ++v16;
    }
    while (v3 != v16);
  }
  v22 = (NSDictionary *)objc_msgSend(v4, "copy");
  layoutAttributesByIndexPath = self->_layoutAttributesByIndexPath;
  self->_layoutAttributesByIndexPath = v22;

}

- (CGSize)collectionViewContentSize
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[_TVCarouselCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  -[_TVCarouselCollectionViewLayout itemSize](self, "itemSize");
  v6 = v5;
  -[_TVCarouselCollectionViewLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  if (v4)
  {
    v8 = 0.0;
    if (v4 != 1)
      v8 = (v6 + v7) * (double)(unint64_t)(v4 - 1);
    v9 = v6 + v8;
    -[_TVCarouselCollectionViewLayout itemSize](self, "itemSize");
  }
  else
  {
    v9 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v11 = v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v9 = 0;
  if (!CGRectIsEmpty(v23))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = self->_layoutAttributesByIndexPath;
    v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
          -[NSDictionary objectForKeyedSubscript:](self->_layoutAttributesByIndexPath, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "frame");
          v25.origin.x = x;
          v25.origin.y = y;
          v25.size.width = width;
          v25.size.height = height;
          if (CGRectIntersectsRect(v24, v25))
            objc_msgSend(v8, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    v9 = v8;
  }

  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_layoutAttributesByIndexPath, "objectForKeyedSubscript:", a3);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (int64_t)_expectedNumberOfCells
{
  double v3;
  double v4;
  void *v5;
  double Width;
  void *v7;
  double Height;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;

  -[_TVCarouselCollectionViewLayout itemSize](self, "itemSize");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v16);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v17);

  if (Width < Height)
    Width = Height;
  v9 = (double)(uint64_t)v4;
  -[_TVCarouselCollectionViewLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  v11 = v9 + v10 * 2.0;
  v12 = 3;
  while (Width > v11)
  {
    -[_TVCarouselCollectionViewLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
    v9 = (double)(uint64_t)(v9 + v9 + v13 * 2.0);
    -[_TVCarouselCollectionViewLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
    v11 = v9 + v14 * 2.0;
    v12 += 2;
  }
  return v12;
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

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (double)minimumInteritemSpacing
{
  return self->_minimumInteritemSpacing;
}

- (void)setMinimumInteritemSpacing:(double)a3
{
  self->_minimumInteritemSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributesByIndexPath, 0);
}

@end
