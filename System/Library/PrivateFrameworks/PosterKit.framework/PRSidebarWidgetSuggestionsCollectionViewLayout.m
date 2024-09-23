@implementation PRSidebarWidgetSuggestionsCollectionViewLayout

- (PRSidebarWidgetSuggestionsCollectionViewLayout)initWithDisplayScale:(double)a3
{
  PRSidebarWidgetSuggestionsCollectionViewLayout *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRSidebarWidgetSuggestionsCollectionViewLayout;
  result = -[PRSidebarWidgetSuggestionsCollectionViewLayout init](&v5, sel_init);
  if (result)
    result->_displayScale = a3;
  return result;
}

- (void)prepareLayout
{
  CGSize v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *computedAttributesByIndexPath;
  id v30;
  CGRect *p_contentBounds;
  _QWORD v32[4];
  CGAffineTransform v33;
  CGAffineTransform v34;
  _QWORD v35[5];
  id v36;
  id v37;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_contentBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_contentBounds.size = v3;
  p_contentBounds = &self->_contentBounds;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PRSidebarWidgetSuggestionsCollectionViewLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", 0);

  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);
      -[PRSidebarWidgetSuggestionsCollectionViewLayout layoutDelegate](self, "layoutDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "complicationDescriptorForItemAtIndexPath:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v12);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v12);

    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke;
  v35[3] = &unk_1E2184FE8;
  v35[4] = self;
  v36 = v6;
  v37 = v13;
  v14 = v13;
  v30 = v6;
  v15 = (void *)MEMORY[0x18D77C604](v35);
  objc_msgSend(v5, "bs_filter:", &__block_literal_global_23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(v5, "bs_filter:", &__block_literal_global_6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(v5, "bs_filter:", &__block_literal_global_7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v15);
  -[PRSidebarWidgetSuggestionsCollectionViewLayout collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;

  v22 = (v21 - p_contentBounds->size.width) * 0.5;
  -[PRSidebarWidgetSuggestionsCollectionViewLayout collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;

  v26 = (v25 - p_contentBounds->size.height) * 0.5;
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeTranslation(&v34, v22, v26);
  objc_msgSend(v14, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_5;
  v32[3] = &__block_descriptor_80_e49_v32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
  v33 = v34;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v32);

  v28 = (NSDictionary *)objc_msgSend(v14, "copy");
  computedAttributesByIndexPath = self->_computedAttributesByIndexPath;
  self->_computedAttributesByIndexPath = v28;

}

void __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  CGRect *v21;
  id v22;
  CGRect v23;

  v5 = a1[4];
  v6 = a2;
  v7 = objc_msgSend(v5, "_gridCoordinateForDescriptor:atIndex:", v6, a3);
  objc_msgSend(a1[4], "_originForGridCoordinate:", v7, v8);
  v10 = v9;
  v12 = v11;
  +[PRWidgetMetricsProvider sharedInstance](PRWidgetMetricsProvider, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "systemMetricsForWidget:", v14);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "displayScale");
  objc_msgSend(v22, "_effectiveSizePixelAlignedForDisplayScale:");
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v10, v12, v16, v18);
  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v20, v19);
  v21 = (CGRect *)((char *)a1[4] + 296);
  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v16;
  v23.size.height = v18;
  *v21 = CGRectUnion(*v21, v23);

}

BOOL __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "widget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "family") == 1;

  return v3;
}

BOOL __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "widget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "family") == 11;

  return v3;
}

BOOL __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "widget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "family") == 10;

  return v3;
}

void __63__PRSidebarWidgetSuggestionsCollectionViewLayout_prepareLayout__block_invoke_5(_OWORD *a1, void *a2)
{
  id v3;
  __int128 v4;
  CGAffineTransform v5;
  CGRect v6;
  CGRect v7;

  v3 = a2;
  objc_msgSend(v3, "frame");
  v4 = a1[3];
  *(_OWORD *)&v5.a = a1[2];
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tx = a1[4];
  v7 = CGRectApplyAffineTransform(v6, &v5);
  objc_msgSend(v3, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);

}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
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
  -[PRSidebarWidgetSuggestionsCollectionViewLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v8 = height != v7 || width != v6;

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_computedAttributesByIndexPath, "objectForKeyedSubscript:", a3);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  _QWORD v10[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NSDictionary allValues](self->_computedAttributesByIndexPath, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PRSidebarWidgetSuggestionsCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v10[3] = &__block_descriptor_64_e42_B16__0__UICollectionViewLayoutAttributes_8l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  *(CGFloat *)&v10[6] = width;
  *(CGFloat *)&v10[7] = height;
  objc_msgSend(v7, "bs_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __84__PRSidebarWidgetSuggestionsCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(CGRect *a1, void *a2)
{
  CGRect v4;

  objc_msgSend(a2, "frame");
  return CGRectIntersectsRect(v4, a1[1]);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForDescriptor:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_msgSend(a3, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "family");

  if (v7 == 11)
  {
    v8 = -[PRSidebarWidgetSuggestionsCollectionViewLayout _gridCoordinateForRectangularItemAtIndex:](self, "_gridCoordinateForRectangularItemAtIndex:", a4);
  }
  else if (v7 == 1)
  {
    v8 = -[PRSidebarWidgetSuggestionsCollectionViewLayout _gridCoordinateForSystemSmallItemAtIndex:](self, "_gridCoordinateForSystemSmallItemAtIndex:", a4);
  }
  else
  {
    v8 = -[PRSidebarWidgetSuggestionsCollectionViewLayout _gridCoordinateForCircularItemAtIndex:](self, "_gridCoordinateForCircularItemAtIndex:", a4);
  }
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForSystemSmallItemAtIndex:(int64_t)a3
{
  int64_t v3;
  int64_t v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v3 = 2 * a3;
  v4 = (2 * a3) & 2;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForRectangularItemAtIndex:(int64_t)a3
{
  int64_t v3;
  int64_t v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v3 = 2 * a3;
  v4 = ~(2 * (int)a3) & 2;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridCoordinateForCircularItemAtIndex:(int64_t)a3
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  if (a3 + 2 <= 0)
    v3 = -(-(a3 + 2) & 3);
  else
    v3 = (a3 + 2) & 3;
  if (a3 >= 0)
    v4 = a3;
  else
    v4 = a3 + 1;
  v5 = v4 | 1;
  result.var1 = v5;
  result.var0 = v3;
  return result;
}

- (CGPoint)_originForGridCoordinate:(id)a3
{
  int64_t var1;
  int64_t var0;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0D1BC88], "gridUnitSize");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0D1BC88], "complicationEdgeInset");
  v8 = v6 + v7 * 2.0;
  objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacingExcludingInnerInset");
  v10 = v8 * (double)var1 + v9 * (double)var1;
  v11 = v8 * (double)var0 + v9 * (double)var0;
  result.y = v10;
  result.x = v11;
  return result;
}

- (PRSidebarWidgetSuggestionsCollectionViewLayoutDelegate)layoutDelegate
{
  return (PRSidebarWidgetSuggestionsCollectionViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutDelegate, a3);
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (NSDictionary)computedAttributesByIndexPath
{
  return self->_computedAttributesByIndexPath;
}

- (void)setComputedAttributesByIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_computedAttributesByIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedAttributesByIndexPath, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end
