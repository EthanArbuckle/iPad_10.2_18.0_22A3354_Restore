@implementation SKUISwooshCollectionViewLayout

- (SKUISwooshCollectionViewLayout)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUISwooshCollectionViewLayout *v11;
  SKUISwooshCollectionViewLayout *v12;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUISwooshCollectionViewLayout init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUISwooshCollectionViewLayout;
  v11 = -[UICollectionViewFlowLayout init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v11, "setMinimumLineSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v12, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setScrollDirection:](v12, "setScrollDirection:", 1);
  }
  return v12;
}

+ (float)snapToBoundariesDecelerationRate
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUISwooshCollectionViewLayout snapToBoundariesDecelerationRate].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return *(float *)"fff?";
}

+ (Class)layoutAttributesClass
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUISwooshCollectionViewLayout layoutAttributesClass].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SKUISwooshCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v14, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setBackgroundColor:", self->_backgroundColor);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGPoint result;

  x = a4.x;
  v31.receiver = self;
  v31.super_class = (Class)SKUISwooshCollectionViewLayout;
  -[SKUISwooshCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v31, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  v7 = v6;
  v9 = v8;
  if (*(_WORD *)&self->_snapsToItemBoundaries)
  {
    -[SKUISwooshCollectionViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UICollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
      v14 = v13;
      objc_msgSend(v10, "frame");
      v16 = v15 + v15;
      if (objc_msgSend(v10, "numberOfSections") >= 1)
      {
        v17 = 0;
        v18 = 0.0;
        do
        {
          v19 = objc_msgSend(v11, "collectionView:numberOfItemsInSection:", v10, v17);
          if (v19 >= 1)
          {
            v20 = v19;
            v21 = 0;
            while (1)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, v17);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "collectionView:layout:sizeForItemAtIndexPath:", v10, self, v22);
              v16 = v23;

              v24 = v18 + v16;
              if (v7 > v18 && v7 < v24)
                break;
              v18 = v18 + v14 + v16;
              if (v20 == ++v21)
                goto LABEL_18;
            }
            if (x > 0.0 || x >= 0.0 && v7 - v18 >= v16 * 0.5)
              v7 = v14 + v24;
            else
              v7 = v18;
          }
LABEL_18:
          ++v17;
        }
        while (v17 < objc_msgSend(v10, "numberOfSections"));
      }
      if (self->_snapsToItemCenters)
      {
        objc_msgSend(v10, "frame");
        v7 = v7 + (v26 - v16) * -0.5;
        objc_msgSend(v10, "contentInset");
        if (v7 < -v27)
        {
          objc_msgSend(v10, "contentInset");
          v7 = -v28;
        }
      }
    }

  }
  v29 = v7;
  v30 = v9;
  result.y = v30;
  result.x = v29;
  return result;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (BOOL)snapsToItemBoundaries
{
  return self->_snapsToItemBoundaries;
}

- (void)setSnapsToItemBoundaries:(BOOL)a3
{
  self->_snapsToItemBoundaries = a3;
}

- (BOOL)snapsToItemCenters
{
  return self->_snapsToItemCenters;
}

- (void)setSnapsToItemCenters:(BOOL)a3
{
  self->_snapsToItemCenters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
}

+ (void)snapToBoundariesDecelerationRate
{
  OUTLINED_FUNCTION_1();
}

+ (void)layoutAttributesClass
{
  OUTLINED_FUNCTION_1();
}

@end
