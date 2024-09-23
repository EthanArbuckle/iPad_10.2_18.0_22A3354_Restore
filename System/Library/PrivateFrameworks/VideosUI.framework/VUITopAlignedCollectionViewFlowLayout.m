@implementation VUITopAlignedCollectionViewFlowLayout

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
  -[VUITopAlignedCollectionViewFlowLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  return v9 != height || v7 != width;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v3;
  void *v4;
  double MidY;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGFloat v25;
  CGFloat v26;
  CGFloat rect;
  _QWORD v28[8];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)VUITopAlignedCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v33, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MidY = CGRectGetMidY(v36);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    rect = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = *(_QWORD *)v30;
    v12 = 1.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (!objc_msgSend(v14, "representedElementCategory"))
        {
          objc_msgSend(v14, "frame");
          x = v37.origin.x;
          y = v37.origin.y;
          width = v37.size.width;
          height = v37.size.height;
          v19 = CGRectGetMidY(v37);
          v20 = v19 - MidY;
          if (v19 - MidY < 0.0)
            v20 = -v20;
          if (v20 >= v12)
            goto LABEL_13;
          v21 = MidY;
          objc_msgSend(v6, "addObject:", v14);
          v38.origin.x = x;
          v38.origin.y = y;
          v38.size.width = width;
          v38.size.height = height;
          v22 = CGRectGetHeight(v38);
          v39.origin.x = v10;
          v39.origin.y = v25;
          v39.size.width = v26;
          v39.size.height = rect;
          if (v22 > CGRectGetHeight(v39))
          {
            v26 = width;
            rect = height;
            v25 = y;
            v10 = x;
          }
          objc_msgSend(v7, "lastObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          MidY = v21;
          v12 = 1.0;
          if (v14 == v23)
          {
LABEL_13:
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __75__VUITopAlignedCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke;
            v28[3] = &__block_descriptor_64_e49_v32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
            *(CGFloat *)&v28[4] = v10;
            *(CGFloat *)&v28[5] = v25;
            *(CGFloat *)&v28[6] = v26;
            *(CGFloat *)&v28[7] = rect;
            objc_msgSend(v6, "enumerateObjectsUsingBlock:", v28);
            objc_msgSend(v6, "removeAllObjects");
            objc_msgSend(v6, "addObject:", v14);
            v26 = width;
            rect = height;
            v25 = y;
            v10 = x;
            MidY = v19;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  return v7;
}

void __75__VUITopAlignedCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  id v14;
  CGRect v15;
  CGRect v16;

  v14 = a2;
  objc_msgSend(v14, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(double *)(a1 + 40);
  objc_msgSend(v14, "frame");
  v13 = v11 - v12;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v16 = CGRectOffset(v15, 0.0, v13);
  objc_msgSend(v14, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);

}

@end
