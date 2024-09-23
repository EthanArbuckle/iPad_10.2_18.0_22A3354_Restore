@implementation TPSCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class(TPSCollectionViewLayoutAttributes, a2);
}

- (TPSCollectionViewFlowLayout)init
{
  TPSCollectionViewFlowLayout *v2;
  TPSCollectionViewFlowLayout *v3;
  CGSize size;
  TPSParallaxComputer *v5;
  TPSParallaxComputer *parallaxComputer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSCollectionViewFlowLayout;
  v2 = -[TPSCollectionViewFlowLayout init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    size = CGRectZero.size;
    v2->_cacheBounds.origin = CGRectZero.origin;
    v2->_cacheBounds.size = size;
    v5 = objc_alloc_init(TPSParallaxComputer);
    parallaxComputer = v3->_parallaxComputer;
    v3->_parallaxComputer = v5;

    -[TPSParallaxComputer setAxis:](v3->_parallaxComputer, "setAxis:", 1);
    -[TPSParallaxComputer setParallaxFactor:](v3->_parallaxComputer, "setParallaxFactor:", 0.125);
    -[TPSParallaxComputer setModel:](v3->_parallaxComputer, "setModel:", 1);
  }
  return v3;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)TPSCollectionViewFlowLayout;
  -[TPSCollectionViewFlowLayout collectionViewContentSize](&v13, "collectionViewContentSize");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout collectionView](self, "collectionView"));
  v8 = (uint64_t)objc_msgSend(v7, "numberOfItemsInSection:", 0);

  if (v8 >= 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout collectionView](self, "collectionView"));
    objc_msgSend(v9, "_interpageSpacing");
    v4 = v4 + v10 * (double)(v8 - 1);

  }
  v11 = v4;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)prepareLayout
{
  NSMutableArray *v3;
  NSMutableArray *layoutAttributesCache;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCollectionViewFlowLayout;
  -[TPSCollectionViewFlowLayout prepareLayout](&v5, "prepareLayout");
  if (!self->_layoutAttributesCache)
  {
    v3 = (NSMutableArray *)objc_msgSend(&__NSArray0__struct, "mutableCopy");
    layoutAttributesCache = self->_layoutAttributesCache;
    self->_layoutAttributesCache = v3;

  }
  -[TPSCollectionViewFlowLayout updateLayoutAttributesCache](self, "updateLayoutAttributesCache");
}

- (void)updateLayoutAttributesCache
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;

  -[NSMutableArray removeAllObjects](self->_layoutAttributesCache, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout collectionView](self, "collectionView"));
  v4 = (uint64_t)objc_msgSend(v3, "numberOfItemsInSection:", 0);

  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v6));
      if (v7)
        -[NSMutableArray addObject:](self->_layoutAttributesCache, "addObject:", v7);

    }
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned __int8 v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  NSIndexPath *v13;
  NSIndexPath *preRotationIndexPath;
  double MinX;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)TPSCollectionViewFlowLayout;
  v8 = -[TPSCollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange:](&v17, "shouldInvalidateLayoutForBoundsChange:");
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v9 = CGRectGetWidth(v18);
  if ((v8 & 1) != 0)
    goto LABEL_4;
  v10 = v9;
  v9 = CGRectGetWidth(self->_cacheBounds);
  if (v9 != v10)
  {
    self->_cacheBounds.size.width = v10;
LABEL_4:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout collectionView](self, "collectionView", v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathsForVisibleItems"));
    v13 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    preRotationIndexPath = self->_preRotationIndexPath;
    self->_preRotationIndexPath = v13;

    return 1;
  }
  MinX = CGRectGetMinX(self->_cacheBounds);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  return MinX != CGRectGetMinX(v19);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  v14.receiver = self;
  v14.super_class = (Class)TPSCollectionViewFlowLayout;
  v6 = -[TPSCollectionViewFlowLayout invalidationContextForBoundsChange:](&v14, "invalidationContextForBoundsChange:", a3.origin.x, a3.origin.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "setInvalidateFlowLayoutDelegateMetrics:", 1);
  objc_msgSend(v7, "setInvalidateFlowLayoutAttributes:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout collectionView](self, "collectionView"));
  objc_msgSend(v8, "bounds");
  if (width == v10 && height == v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForVisibleItems"));
    objc_msgSend(v7, "invalidateItemsAtIndexPaths:", v12);

  }
  return v7;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_layoutAttributesCache;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "frame", (_QWORD)v16);
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        if (CGRectIntersectsRect(v21, v22))
        {
          if (!v11)
            v11 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
          -[TPSCollectionViewFlowLayout _updateParallaxForLayoutAttributes:](self, "_updateParallaxForLayoutAttributes:", v14);
          objc_msgSend(v11, "addObject:", v14);
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result
{
  void *v4;
  CGFloat MinX;
  NSIndexPath *preRotationIndexPath;
  double v7;
  CGRect v8;

  if (self->_preRotationIndexPath)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", result.x, result.y));
    objc_msgSend(v4, "frame");
    MinX = CGRectGetMinX(v8);

    preRotationIndexPath = self->_preRotationIndexPath;
    self->_preRotationIndexPath = 0;

    result.y = 0.0;
  }
  else
  {
    MinX = result.x;
  }
  v7 = MinX;
  result.x = v7;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  objc_super v18;

  v4 = a3;
  if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
    || (v5 = objc_msgSend(v4, "row"),
        (uint64_t)v5 >= (uint64_t)-[NSMutableArray count](self->_layoutAttributesCache, "count"))
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_layoutAttributesCache, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")))) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)TPSCollectionViewFlowLayout;
    v7 = -[TPSCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v18, "layoutAttributesForItemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout collectionView](self, "collectionView"));
    objc_msgSend(v14, "_interpageSpacing");
    v16 = (v11 + v15) * (double)(uint64_t)objc_msgSend(v4, "row");

    objc_msgSend(v6, "setFrame:", v16, v9, v11, v13);
  }
  -[TPSCollectionViewFlowLayout _updateParallaxForLayoutAttributes:](self, "_updateParallaxForLayoutAttributes:", v6);

  return v6;
}

- (void)_updateParallaxForLayoutAttributes:(id)a3
{
  id v4;
  TPSParallaxComputer *parallaxComputer;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TPSCollectionViewFlowLayout collectionView](self, "collectionView"));
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "adjustedContentInset");
  objc_msgSend(v4, "frame");
  parallaxComputer = self->_parallaxComputer;
  objc_msgSend(v4, "frame");
  -[TPSParallaxComputer contentParallaxOffsetForViewFrame:visibleRect:](parallaxComputer, "contentParallaxOffsetForViewFrame:visibleRect:");
  objc_msgSend(v4, "setParallaxOffset:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parallaxComputer, 0);
  objc_storeStrong((id *)&self->_preRotationIndexPath, 0);
  objc_storeStrong((id *)&self->_layoutAttributesCache, 0);
}

@end
