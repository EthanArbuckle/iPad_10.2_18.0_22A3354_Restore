@implementation PUHorizontalCollectionViewLayout

- (PUHorizontalCollectionViewLayout)init
{
  PUHorizontalCollectionViewLayout *v2;
  PUHorizontalCollectionViewLayout *v3;
  CGSize v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUHorizontalCollectionViewLayout;
  v2 = -[PUHorizontalCollectionViewLayout init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v2->_lastRequestedRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v2->_lastRequestedRect.size = v4;
    -[PUHorizontalCollectionViewLayout setItemSize:](v2, "setItemSize:", 50.0, 50.0);
  }
  return v3;
}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "item");

  if (v5 >= -[NSArray count](self->_cachedItemLayoutAttributes, "count"))
  {
    v9 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_cachedItemLayoutAttributes, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 >= objc_msgSend(v7, "count"))
    {
      v9 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_cachedItemLayoutAttributes, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v9;
}

- (void)setItemSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  -[PUHorizontalCollectionViewLayout itemSize](self, "itemSize");
  if (v7 != width || v6 != height)
  {
    self->_itemSize.width = width;
    self->_itemSize.height = height;
    -[PUHorizontalCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setInteritemSpacing:(double)a3
{
  double v5;

  -[PUHorizontalCollectionViewLayout interitemSpacing](self, "interitemSpacing");
  if (v5 != a3)
  {
    self->_interitemSpacing = a3;
    -[PUHorizontalCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setItemsContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  PUHorizontalCollectionViewLayoutInvalidationContext *v15;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[PUHorizontalCollectionViewLayout itemsContentInset](self, "itemsContentInset");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    self->_itemsContentInset.top = top;
    self->_itemsContentInset.left = left;
    self->_itemsContentInset.bottom = bottom;
    self->_itemsContentInset.right = right;
    v15 = objc_alloc_init(PUHorizontalCollectionViewLayoutInvalidationContext);
    -[PUHorizontalCollectionViewLayoutInvalidationContext _setInvalidateCachedLayout:](v15, "_setInvalidateCachedLayout:", 1);
    -[PUHorizontalCollectionViewLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v15);

  }
}

- (BOOL)_shouldInvalidateCachedLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double v4;

  height = a3.size.height;
  -[PUHorizontalCollectionViewLayout collectionViewBounds](self, "collectionViewBounds", a3.origin.x, a3.origin.y, a3.size.width);
  return v4 != height;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _BOOL8 v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PUHorizontalCollectionViewLayout;
  -[PUHorizontalCollectionViewLayout invalidationContextForBoundsChange:](&v11, sel_invalidationContextForBoundsChange_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_msgSend(v8, "invalidateDataSourceCounts") & 1) != 0
    || (objc_msgSend(v8, "invalidateEverything") & 1) != 0
    || -[PUHorizontalCollectionViewLayout _shouldInvalidateCachedLayoutForBoundsChange:](self, "_shouldInvalidateCachedLayoutForBoundsChange:", x, y, width, height);
  objc_msgSend(v8, "_setInvalidateCachedLayout:", v9);
  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  NSArray *cachedItemLayoutAttributes;
  NSArray *cachedSectionFrames;
  CGSize v7;
  NSArray *lastRequestedLayoutAttributesInRect;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUHorizontalCollectionViewLayout;
  -[PUHorizontalCollectionViewLayout invalidateLayoutWithContext:](&v9, sel_invalidateLayoutWithContext_, v4);
  if ((objc_msgSend(v4, "invalidateCachedLayout") & 1) != 0
    || (objc_msgSend(v4, "invalidateDataSourceCounts") & 1) != 0
    || objc_msgSend(v4, "invalidateEverything"))
  {
    cachedItemLayoutAttributes = self->_cachedItemLayoutAttributes;
    self->_cachedItemLayoutAttributes = 0;

    cachedSectionFrames = self->_cachedSectionFrames;
    self->_cachedSectionFrames = 0;

    v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_lastRequestedRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_lastRequestedRect.size = v7;
    lastRequestedLayoutAttributesInRect = self->_lastRequestedLayoutAttributesInRect;
    self->_lastRequestedLayoutAttributesInRect = 0;

  }
}

- (void)prepareLayout
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
  double v12;
  PUHorizontalCollectionViewLayout *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  PUHorizontalCollectionViewLayout *v39;
  NSArray *cachedItemLayoutAttributes;
  NSArray *v41;
  NSArray *cachedSectionFrames;
  NSArray *v43;
  void *v44;
  void *v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  uint64_t v55;
  NSArray *v56;
  NSArray *v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double height;
  CGFloat v64;
  double width;
  CGFloat v66;
  double y;
  CGFloat v68;
  double x;
  id v70;
  double v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  if (!self->_cachedItemLayoutAttributes || !self->_cachedSectionFrames)
  {
    -[PUHorizontalCollectionViewLayout collectionView](self, "collectionView");
    v70 = (id)objc_claimAutoreleasedReturnValue();
    -[PUHorizontalCollectionViewLayout delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v70, "numberOfSections");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v57 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[PUHorizontalCollectionViewLayout interitemSpacing](self, "interitemSpacing");
    -[PUHorizontalCollectionViewLayout itemsContentInset](self, "itemsContentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v54 = v11;
    -[PUHorizontalCollectionViewLayout collectionViewBounds](self, "collectionViewBounds");
    v71 = v12 - (v6 + v10);
    v13 = self;
    -[PUHorizontalCollectionViewLayout itemSize](self, "itemSize");
    v55 = v4;
    if (v4 >= 1)
    {
      v14 = 0;
      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      do
      {
        v18 = objc_msgSend(v70, "numberOfItemsInSection:", v14);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 >= 1)
        {
          for (i = 0; i != v18; ++i)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v14);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v72.origin.x = v8;
            v72.origin.y = v15;
            v72.size.width = v16;
            v72.size.height = v17;
            CGRectGetMaxX(v72);
            if (v3)
              objc_msgSend(v3, "layout:collectionView:sizeForItemAtIndexPath:", self, v70, v21);
            objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "scale");
            UIRectIntegralWithScale();
            v8 = v23;
            v15 = v24;
            v16 = v25;
            v17 = v26;

            objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setFrame:", v8, v15, v16, v17);
            objc_msgSend(v19, "addObject:", v27);

          }
        }
        -[NSArray addObject:](v56, "addObject:", v19);
        objc_msgSend(v19, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "frame");
        v66 = v30;
        v68 = v29;
        v62 = v32;
        v64 = v31;

        objc_msgSend(v19, "lastObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "frame");
        v60 = v35;
        v61 = v34;
        v58 = v37;
        v59 = v36;

        v73.origin.y = v66;
        v73.origin.x = v68;
        v73.size.height = v62;
        v73.size.width = v64;
        v76.origin.y = v60;
        v76.origin.x = v61;
        v76.size.height = v58;
        v76.size.width = v59;
        v74 = CGRectUnion(v73, v76);
        y = v74.origin.y;
        x = v74.origin.x;
        height = v74.size.height;
        width = v74.size.width;
        v38 = objc_alloc_init(MEMORY[0x1E0DC3628]);
        objc_msgSend(v38, "setFrame:", x, y, width, height);
        -[NSArray addObject:](v57, "addObject:", v38);

        ++v14;
      }
      while (v14 != v55);
    }
    v39 = self;
    cachedItemLayoutAttributes = self->_cachedItemLayoutAttributes;
    v13->_cachedItemLayoutAttributes = v56;
    v41 = v56;

    cachedSectionFrames = v13->_cachedSectionFrames;
    v13->_cachedSectionFrames = v57;
    v43 = v57;

    -[NSArray lastObject](v13->_cachedItemLayoutAttributes, "lastObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "lastObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "frame");
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;

    v75.origin.x = v47;
    v75.origin.y = v49;
    v75.size.width = v51;
    v75.size.height = v53;
    v39->_contentSize.width = v54 + CGRectGetMaxX(v75);
    v39->_contentSize.height = v71;

  }
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

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_lastRequestedRect;
  NSArray *lastRequestedLayoutAttributesInRect;
  NSArray *v10;
  id v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  int64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  void *v25;
  uint64_t v26;
  int64_t v27;
  void *v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_lastRequestedRect = &self->_lastRequestedRect;
  if (CGRectEqualToRect(a3, self->_lastRequestedRect)
    && (lastRequestedLayoutAttributesInRect = self->_lastRequestedLayoutAttributesInRect) != 0)
  {
    v10 = lastRequestedLayoutAttributesInRect;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0DC3628]);
    objc_msgSend(v11, "setFrame:", x, y, width, height);
    v12 = -[NSArray count](self->_cachedSectionFrames, "count");
    v13 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_cachedSectionFrames, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, v12, 256, &__block_literal_global_33566);
    v14 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_cachedSectionFrames, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, v12, 512, &__block_literal_global_33566);
    v15 = 0;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v14;
      -[NSArray objectAtIndexedSubscript:](self->_cachedItemLayoutAttributes, "objectAtIndexedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, objc_msgSend(v18, "count"), 512, &__block_literal_global_33566);
      -[NSArray objectAtIndexedSubscript:](self->_cachedItemLayoutAttributes, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v15, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, objc_msgSend(v15, "count"), 256, &__block_literal_global_33566);
      if (v20 != 0x7FFFFFFFFFFFFFFFLL && v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = v20;
        if (v13 == v17)
        {
          v23 = v19 - v20 + 1;
          v24 = v10;
          v25 = v15;
          v26 = v22;
        }
        else
        {
          PUInsertObjectsInRange(v10, v15, v20, objc_msgSend(v15, "count") - v20);
          v27 = v13 + 1;
          if (v27 >= v17)
          {
            v28 = v15;
          }
          else
          {
            do
            {
              -[NSArray objectAtIndexedSubscript:](self->_cachedItemLayoutAttributes, "objectAtIndexedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSArray addObjectsFromArray:](v10, "addObjectsFromArray:", v28);
              ++v27;
              v15 = v28;
            }
            while (v17 != v27);
          }
          -[NSArray objectAtIndexedSubscript:](self->_cachedItemLayoutAttributes, "objectAtIndexedSubscript:", v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v19 + 1;
          v24 = v10;
          v25 = v15;
          v26 = 0;
        }
        PUInsertObjectsInRange(v24, v25, v26, v23);
      }
    }
    p_lastRequestedRect->origin.x = x;
    p_lastRequestedRect->origin.y = y;
    p_lastRequestedRect->size.width = width;
    p_lastRequestedRect->size.height = height;
    objc_storeStrong((id *)&self->_lastRequestedLayoutAttributesInRect, v10);

  }
  return v10;
}

- (CGRect)collectionViewBounds
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[PUHorizontalCollectionViewLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
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

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (UIEdgeInsets)itemsContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_itemsContentInset.top;
  left = self->_itemsContentInset.left;
  bottom = self->_itemsContentInset.bottom;
  right = self->_itemsContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PUHorizontalCollectionViewLayoutDelegate)delegate
{
  return (PUHorizontalCollectionViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastRequestedLayoutAttributesInRect, 0);
  objc_storeStrong((id *)&self->_cachedSectionFrames, 0);
  objc_storeStrong((id *)&self->_cachedItemLayoutAttributes, 0);
}

uint64_t __70__PUHorizontalCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxX;
  double MinX;
  CGFloat rect;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  rect = v6;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  if (MaxX < CGRectGetMinX(v26))
    return -1;
  v27.origin.x = rect;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  return MinX > CGRectGetMaxX(v28);
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

@end
