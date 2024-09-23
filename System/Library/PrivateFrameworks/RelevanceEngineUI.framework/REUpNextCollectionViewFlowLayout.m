@implementation REUpNextCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = *MEMORY[0x24BDAC8D0];
  -[REUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v32.receiver = self;
  v32.super_class = (Class)REUpNextCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v32, sel_layoutAttributesForElementsInRect_, x, y, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v22, "frame");
        objc_msgSend(v22, "setUnitFrameOnScreen:", REUpNextUnitRectForFrameInBounds(v23, v24, v25, v26, v10, v12, v14, v16));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v19);
  }
  return v17;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v20;

  v4 = a3;
  -[REUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v20.receiver = self;
  v20.super_class = (Class)REUpNextCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v20, sel_layoutAttributesForItemAtIndexPath_, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "frame");
  objc_msgSend(v14, "setUnitFrameOnScreen:", REUpNextUnitRectForFrameInBounds(v15, v16, v17, v18, v7, v9, v11, v13));
  return v14;
}

@end
