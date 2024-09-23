@implementation VideosExtrasCarouselCollectionViewLayout

- (VideosExtrasCarouselCollectionViewLayout)init
{
  VideosExtrasCarouselCollectionViewLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasCarouselCollectionViewLayout;
  result = -[VideosExtrasCarouselCollectionViewLayout init](&v3, sel_init);
  if (result)
    result->_indexOfVisibleItemForBoundsChange = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)prepareLayout
{
  void *v3;
  double Height;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)VideosExtrasCarouselCollectionViewLayout;
  -[VideosExtrasCarouselCollectionViewLayout prepareLayout](&v22, sel_prepareLayout);
  -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v23);
  -[VideosExtrasCarouselCollectionViewLayout itemWidth](self, "itemWidth");
  v6 = v5;
  -[VideosExtrasCarouselCollectionViewLayout _spaceBetweenItems](self, "_spaceBetweenItems");
  v8 = v7;
  -[VideosExtrasCarouselCollectionViewLayout _neighboringItemVisibleWidth](self, "_neighboringItemVisibleWidth");
  v10 = v9;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v8 + v10;
  v13 = v6 + v8;
  v21 = objc_msgSend(v3, "numberOfSections");
  if (v21 < 1)
  {
    v20 = 0.0;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = objc_msgSend(v3, "numberOfItemsInSection:", v14);
      if (v16 >= 1)
      {
        for (i = 0; i != v16; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setFrame:", v12 + (double)(v15 + i) * v13, 0.0, v6, Height);
          objc_msgSend(v11, "setObject:forKey:", v19, v18);

        }
      }
      v15 += v16;
      ++v14;
    }
    while (v14 != v21);
    v20 = (double)v15;
  }
  -[VideosExtrasCarouselCollectionViewLayout setCachedLayoutAttributes:](self, "setCachedLayoutAttributes:", v11);
  -[VideosExtrasCarouselCollectionViewLayout setCachedCollectionViewContentSize:](self, "setCachedCollectionViewContentSize:", v13 * v20 + v12 * 2.0 - v8, Height);

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VideosExtrasCarouselCollectionViewLayout cachedLayoutAttributes](self, "cachedLayoutAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__VideosExtrasCarouselCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v12[3] = &unk_1E9F9C260;
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  return v10;
}

void __78__VideosExtrasCarouselCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CGRect v5;

  v4 = a3;
  objc_msgSend(v4, "frame");
  if (CGRectIntersectsRect(v5, *(CGRect *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VideosExtrasCarouselCollectionViewLayout cachedLayoutAttributes](self, "cachedLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
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
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView", a3.x, a3.y, a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[VideosExtrasCarouselCollectionViewLayout _contentOffsetForItemAtIndex:collectionViewBounds:](self, "_contentOffsetForItemAtIndex:collectionViewBounds:", -[VideosExtrasCarouselCollectionViewLayout _indexOfVisibleItemForContentOffset:collectionViewBounds:](self, "_indexOfVisibleItemForContentOffset:collectionViewBounds:", x, y, v9, v11, v13, v15), v9, v11, v13, v15);
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  height = a3.size.height;
  width = a3.size.width;
  -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  return v9 != height || v7 != width;
}

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  void *v4;
  int64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasCarouselCollectionViewLayout;
  -[VideosExtrasCarouselCollectionViewLayout prepareForAnimatedBoundsChange:](&v6, sel_prepareForAnimatedBoundsChange_);
  -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v5 = -[VideosExtrasCarouselCollectionViewLayout _indexOfVisibleItemForContentOffset:collectionViewBounds:](self, "_indexOfVisibleItemForContentOffset:collectionViewBounds:");

  -[VideosExtrasCarouselCollectionViewLayout setIndexOfVisibleItemForBoundsChange:](self, "setIndexOfVisibleItemForBoundsChange:", v5);
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  int64_t v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = -[VideosExtrasCarouselCollectionViewLayout indexOfVisibleItemForBoundsChange](self, "indexOfVisibleItemForBoundsChange");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[VideosExtrasCarouselCollectionViewLayout _contentOffsetForItemAtIndex:collectionViewBounds:](self, "_contentOffsetForItemAtIndex:collectionViewBounds:", v7);
    x = v9;
    y = v10;

  }
  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  return 0;
}

- (void)finalizeAnimatedBoundsChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasCarouselCollectionViewLayout;
  -[VideosExtrasCarouselCollectionViewLayout finalizeAnimatedBoundsChange](&v3, sel_finalizeAnimatedBoundsChange);
  -[VideosExtrasCarouselCollectionViewLayout setIndexOfVisibleItemForBoundsChange:](self, "setIndexOfVisibleItemForBoundsChange:", 0x7FFFFFFFFFFFFFFFLL);
}

- (unint64_t)indexOfVisibleItem
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
  unint64_t v12;

  -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "bounds");
  v12 = -[VideosExtrasCarouselCollectionViewLayout _indexOfVisibleItemForContentOffset:collectionViewBounds:](self, "_indexOfVisibleItemForContentOffset:collectionViewBounds:", v5, v7, v8, v9, v10, v11);

  return v12;
}

- (void)setIndexOfVisibleItem:(unint64_t)a3
{
  -[VideosExtrasCarouselCollectionViewLayout setIndexOfVisibleItem:animated:](self, "setIndexOfVisibleItem:animated:", a3, 0);
}

- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  if (-[VideosExtrasCarouselCollectionViewLayout indexOfVisibleItem](self, "indexOfVisibleItem") != a3)
  {
    -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[VideosExtrasCarouselCollectionViewLayout _contentOffsetForItemAtIndex:collectionViewBounds:](self, "_contentOffsetForItemAtIndex:collectionViewBounds:", a3);
    objc_msgSend(v7, "setContentOffset:animated:", v4);

  }
}

- (double)itemWidth
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double result;
  CGRect v14;
  CGRect v15;

  MPULayoutLinearRelationMake();
  -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  CGRectGetWidth(v14);
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  CGRectGetHeight(v15);
  MPULayoutLinearRelationEvaluate();
  return result;
}

- (CGPoint)_contentOffsetForItemAtIndex:(int64_t)a3 collectionViewBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[VideosExtrasCarouselCollectionViewLayout itemWidth](self, "itemWidth");
  v11 = v10;
  -[VideosExtrasCarouselCollectionViewLayout _spaceBetweenItemsForCollectionViewBounds:](self, "_spaceBetweenItemsForCollectionViewBounds:", x, y, width, height);
  v13 = (v11 + v12) * (double)a3;
  v14 = 0.0;
  result.y = v14;
  result.x = v13;
  return result;
}

- (int64_t)_indexOfVisibleItemForContentOffset:(CGPoint)a3 collectionViewBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v10;
  double v11;
  double v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.x;
  -[VideosExtrasCarouselCollectionViewLayout itemWidth](self, "itemWidth", a3.x, a3.y);
  v11 = v10;
  -[VideosExtrasCarouselCollectionViewLayout _spaceBetweenItemsForCollectionViewBounds:](self, "_spaceBetweenItemsForCollectionViewBounds:", x, y, width, height);
  return llround(v8 / (v11 + v12));
}

- (double)_neighboringItemVisibleWidth
{
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  CGRect v9;

  -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v9);

  -[VideosExtrasCarouselCollectionViewLayout itemWidth](self, "itemWidth");
  v6 = (Width - v5) * 0.5;
  -[VideosExtrasCarouselCollectionViewLayout _spaceBetweenItems](self, "_spaceBetweenItems");
  return v6 - v7;
}

- (double)_spaceBetweenItems
{
  void *v3;
  double v4;
  double v5;

  -[VideosExtrasCarouselCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[VideosExtrasCarouselCollectionViewLayout _spaceBetweenItemsForCollectionViewBounds:](self, "_spaceBetweenItemsForCollectionViewBounds:");
  v5 = v4;

  return v5;
}

- (double)_spaceBetweenItemsForCollectionViewBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double result;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MPULayoutLinearRelationMake();
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  CGRectGetWidth(v8);
  MPULayoutLinearRelationEvaluate();
  return result;
}

- (NSDictionary)cachedLayoutAttributes
{
  return self->_cachedLayoutAttributes;
}

- (void)setCachedLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLayoutAttributes, a3);
}

- (CGSize)cachedCollectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedCollectionViewContentSize.width;
  height = self->_cachedCollectionViewContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedCollectionViewContentSize:(CGSize)a3
{
  self->_cachedCollectionViewContentSize = a3;
}

- (int64_t)indexOfVisibleItemForBoundsChange
{
  return self->_indexOfVisibleItemForBoundsChange;
}

- (void)setIndexOfVisibleItemForBoundsChange:(int64_t)a3
{
  self->_indexOfVisibleItemForBoundsChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLayoutAttributes, 0);
}

@end
