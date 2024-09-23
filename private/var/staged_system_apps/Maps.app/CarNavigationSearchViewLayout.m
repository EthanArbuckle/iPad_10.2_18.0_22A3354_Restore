@implementation CarNavigationSearchViewLayout

- (CarNavigationSearchViewLayout)init
{
  CarNavigationSearchViewLayout *v2;
  uint64_t v3;
  NSMapTable *layoutAttributes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarNavigationSearchViewLayout;
  v2 = -[CarNavigationSearchViewLayout init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    layoutAttributes = v2->_layoutAttributes;
    v2->_layoutAttributes = (NSMapTable *)v3;

  }
  return v2;
}

- (CGSize)collectionViewContentSize
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

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  height = a3.size.height;
  width = a3.size.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchViewLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y));
  objc_msgSend(v5, "bounds");
  v8 = height != v7 || width != v6;

  return v8;
}

- (void)prepareLayout
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  char v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CarNavigationSearchViewLayout;
  -[CarNavigationSearchViewLayout prepareLayout](&v24, "prepareLayout");
  -[NSMapTable removeAllObjects](self->_layoutAttributes, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchViewLayout collectionView](self, "collectionView"));
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  v23 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchViewLayout collectionView](self, "collectionView"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v21 = 0.0;
  v22 = 0.0;
  -[CarNavigationSearchViewLayout getNumberOfRows:itemSize:forItemCount:availableSize:](self, "getNumberOfRows:itemSize:forItemCount:availableSize:", &v23, &v21, v4, v7, v9);
  -[CarNavigationSearchViewLayout preferredHeightForItemCount:availableSize:](self, "preferredHeightForItemCount:availableSize:", v4, v7, v9);
  self->_contentSize.width = v7;
  self->_contentSize.height = v10;
  if (v23 && v4)
  {
    v11 = 0;
    v12 = 0;
    v13 = v21;
    v14 = v22;
    v15 = v10 * -0.5 + v9 * 0.5;
    do
    {
      v16 = 1;
      v17 = 0.0;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v11, 0));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](UICollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v18));
        objc_msgSend(v19, "setFrame:", v17, v15, v13, v14);
        -[NSMapTable setObject:forKey:](self->_layoutAttributes, "setObject:forKey:", v19, v18);
        v20 = v21;
        ++v11;

        if ((v16 & 1) == 0)
          break;
        v16 = 0;
        v17 = v17 + v20 + 8.0;
      }
      while (v11 < (unint64_t)v4);
      if (++v12 >= v23)
        break;
      v15 = v15 + v22 + 8.0;
    }
    while (v11 < (unint64_t)v4);
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return -[NSMapTable objectForKey:](self->_layoutAttributes, "objectForKey:", a3);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSMapTable count](self->_layoutAttributes, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_layoutAttributes, "objectEnumerator", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "frame");
        v27.origin.x = v15;
        v27.origin.y = v16;
        v27.size.width = v17;
        v27.size.height = v18;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        if (CGRectIntersectsRect(v26, v27))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v19 = objc_msgSend(v8, "copy");
  return v19;
}

- (double)preferredHeightForItemCount:(unint64_t)a3 availableSize:(CGSize)a4
{
  unint64_t v5;
  uint64_t v6;
  double v7;

  v6 = 0;
  v7 = 0.0;
  v5 = 0;
  -[CarNavigationSearchViewLayout getNumberOfRows:itemSize:forItemCount:availableSize:](self, "getNumberOfRows:itemSize:forItemCount:availableSize:", &v5, &v6, a3, a4.width, a4.height);
  return (double)(v5 - 1) * 8.0 + (double)v5 * v7;
}

- (void)getNumberOfRows:(unint64_t *)a3 itemSize:(CGSize *)a4 forItemCount:(unint64_t)a5 availableSize:(CGSize)a6
{
  double v6;
  unint64_t v7;
  double v8;
  double v9;

  v6 = (double)a5 * 0.5;
  v7 = vcvtpd_u64_f64(v6);
  v8 = floor(a6.width + -8.0) * 0.5;
  v9 = (a6.height + (double)(v7 - 1) * -8.0) / (double)(unint64_t)ceil(v6);
  if (v8 < v9)
    v9 = v8;
  if (a3)
    *a3 = v7;
  if (a4)
  {
    a4->width = v8;
    a4->height = v9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

@end
