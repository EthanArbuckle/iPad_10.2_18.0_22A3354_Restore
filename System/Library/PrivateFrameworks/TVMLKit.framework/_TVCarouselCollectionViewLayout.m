@implementation _TVCarouselCollectionViewLayout

- (void)prepareLayout
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *layoutAttributesByIndexPath;
  id v17;

  -[_TVCarouselCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v6 = v5;
  v8 = v7;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  if (v4 >= 1)
  {
    v10 = 0;
    v11 = v6 + v9;
    v12 = 0.0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v10, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6920], "layoutAttributesForCellWithIndexPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFrame:", v12, 0.0, v6, v8);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v13);

      v12 = v11 + v12;
      ++v10;
    }
    while (v4 != v10);
  }
  v15 = (NSDictionary *)objc_msgSend(v17, "copy");
  layoutAttributesByIndexPath = self->_layoutAttributesByIndexPath;
  self->_layoutAttributesByIndexPath = v15;

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

  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v6 = v5;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  if (v4)
  {
    v8 = 0.0;
    if (v4 != 1)
      v8 = (v6 + v7) * (double)(unint64_t)(v4 - 1);
    v9 = v6 + v8;
    -[UICollectionViewFlowLayout itemSize](self, "itemSize");
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
  return 0;
}

- (int64_t)_expectedNumberOfCells
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double Width;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  CGRect v15;
  CGRect v16;

  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v4 = v3;
  -[_TVCarouselCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  if (CGRectGetWidth(v15) > 0.0)
    -[_TVCarouselCollectionViewLayout collectionView](self, "collectionView");
  else
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v16);

  v8 = (double)(uint64_t)v4;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
  v10 = v8 + v9 * 2.0;
  v11 = 3;
  while (Width > v10)
  {
    -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
    v8 = (double)(uint64_t)(v8 + v8 + v12 * 2.0);
    -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
    v10 = v8 + v13 * 2.0;
    v11 += 2;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributesByIndexPath, 0);
}

@end
