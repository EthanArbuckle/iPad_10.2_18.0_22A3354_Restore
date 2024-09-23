@implementation PUDoubleHeightHorizontalAlbumListGadgetLayout

- (PUDoubleHeightHorizontalAlbumListGadgetLayout)initWithHorizontalLayoutDelegate:(id)a3 showsHorizontalScrollIndicator:(BOOL)a4
{
  PUDoubleHeightHorizontalAlbumListGadgetLayout *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *layoutAttributesByIndexPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUDoubleHeightHorizontalAlbumListGadgetLayout;
  v4 = -[PUHorizontalAlbumListGadgetLayout initWithHorizontalLayoutDelegate:showsHorizontalScrollIndicator:](&v8, sel_initWithHorizontalLayoutDelegate_showsHorizontalScrollIndicator_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    layoutAttributesByIndexPath = v4->_layoutAttributesByIndexPath;
    v4->_layoutAttributesByIndexPath = v5;

  }
  return v4;
}

- (void)invalidateLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUDoubleHeightHorizontalAlbumListGadgetLayout;
  -[PUDoubleHeightHorizontalAlbumListGadgetLayout invalidateLayout](&v3, sel_invalidateLayout);
  -[NSMutableDictionary removeAllObjects](self->_layoutAttributesByIndexPath, "removeAllObjects");
}

- (BOOL)prefersPagingEnabled
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  CGSize result;

  -[PUHorizontalAlbumListGadgetLayout albumCellSize](self, "albumCellSize");
  v4 = v3;
  v6 = v5;
  -[PXGadgetCollectionViewLayout interSectionSpacing](self, "interSectionSpacing");
  v8 = v7;
  -[PUHorizontalAlbumListGadgetLayout _horizontalScrollIndicatorSpacing](self, "_horizontalScrollIndicatorSpacing");
  v10 = v9;
  v11 = vcvtps_u32_f32((float)-[PUHorizontalAlbumListGadgetLayout _numberOfAlbums](self, "_numberOfAlbums") * 0.5);
  v12 = v11 - 1;
  if (!v11)
    v12 = 0;
  v13 = round(v8 * (double)v12 + v4 * (double)v11);
  v14 = round(v10 + v6 * 2.0 + 20.0);
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PUHorizontalAlbumListGadgetLayout _numberOfAlbums](self, "_numberOfAlbums");
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUHorizontalAlbumListGadgetLayout albumCellSize](self, "albumCellSize");
  if (v10 > 0.0)
  {
    v11 = v10;
    -[PXGadgetCollectionViewLayout interSectionSpacing](self, "interSectionSpacing");
    v13 = v11 + v12;
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v14 = floor(CGRectGetMinX(v22) / v13);
    if (v14 < 0.0)
      v14 = 0.0;
    v15 = (unint64_t)v14;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v16 = 2 * v15;
    v17 = (2 * (v15 + vcvtpd_u64_f64(CGRectGetWidth(v23) / v13))) | 1;
    if (v17 >= v8 - 1)
      v18 = v8 - 1;
    else
      v18 = v17;
    for (; v16 <= v18; ++v16)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUDoubleHeightHorizontalAlbumListGadgetLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v20);

    }
  }
  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[PUDoubleHeightHorizontalAlbumListGadgetLayout layoutAttributesByIndexPath](self, "layoutAttributesByIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)PUDoubleHeightHorizontalAlbumListGadgetLayout;
    -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v9, sel_layoutAttributesForItemAtIndexPath_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUDoubleHeightHorizontalAlbumListGadgetLayout _adjustLayoutAttributes:](self, "_adjustLayoutAttributes:", v6);
    -[PUDoubleHeightHorizontalAlbumListGadgetLayout layoutAttributesByIndexPath](self, "layoutAttributesByIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (void)_adjustLayoutAttributes:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "frame");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v17, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v17, "indexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "item");

  -[PXGadgetCollectionViewLayout interSectionSpacing](self, "interSectionSpacing");
  v15 = (v9 + v14) * (double)(v13 >> 1);
  v16 = v11 + 20.0;
  if ((v13 & 1) == 0)
    v16 = 0.0;
  objc_msgSend(v17, "setFrame:", v15, v16, v5, v7);

}

- (NSMutableDictionary)layoutAttributesByIndexPath
{
  return self->_layoutAttributesByIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributesByIndexPath, 0);
}

@end
