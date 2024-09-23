@implementation PUFilmstripTilingLayout

- (PUFilmstripTilingLayout)initWithDataSource:(id)a3 contentSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  PUFilmstripTilingLayout *v6;
  PUFilmstripTilingLayout *v7;
  NSCache *v8;
  NSCache *layoutInfoCache;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v11.receiver = self;
  v11.super_class = (Class)PUFilmstripTilingLayout;
  v6 = -[PUTilingLayout initWithDataSource:](&v11, sel_initWithDataSource_, a3);
  v7 = v6;
  if (v6)
  {
    v6->_contentSize.width = width;
    v6->_contentSize.height = height;
    v6->_contentBounds.origin.x = 0.0;
    v6->_contentBounds.origin.y = 0.0;
    v6->_contentBounds.size.width = width;
    v6->_contentBounds.size.height = height;
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    layoutInfoCache = v7->_layoutInfoCache;
    v7->_layoutInfoCache = v8;

  }
  return v7;
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

- (void)prepareLayout
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUFilmstripTilingLayout;
  -[PUTilingLayout prepareLayout](&v7, sel_prepareLayout);
  -[PUTilingLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "pu_rootIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfItems = objc_msgSend(v3, "numberOfSubItemsAtIndexPath:", v4);

  -[PUFilmstripTilingLayout contentBounds](self, "contentBounds");
  self->_itemSize.width = v5 / (double)self->_numberOfItems;
  self->_itemSize.height = v6;
}

- (id)layoutInfosForTilesInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger v8;
  NSRange v9;
  NSUInteger location;
  NSUInteger length;
  void *v12;
  void *v13;
  double MinX;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  double v28;
  double v29;
  NSRange v30;
  NSRange v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (uint64_t)(CGRectGetMinX(a3) / self->_itemSize.width);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v30.length = vcvtpd_s64_f64(CGRectGetMaxX(v32) / self->_itemSize.width) - v8 + 1;
  v31.length = self->_numberOfItems;
  v30.location = v8;
  v31.location = 0;
  v9 = NSIntersectionRange(v30, v31);
  location = v9.location;
  length = v9.length;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9.length);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (location < location + v9.length)
  {
    do
    {
      -[PUFilmstripTilingLayout _layoutInfoForTileWithIndex:kind:](self, "_layoutInfoForTileWithIndex:kind:", location, CFSTR("PUTileKindItemContent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

      ++location;
      --length;
    }
    while (length);
  }
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MinX = CGRectGetMinX(v33);
  -[PUFilmstripTilingLayout contentSize](self, "contentSize");
  v16 = MinX / v15;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v17 = CGRectGetWidth(v34);
  -[PUFilmstripTilingLayout contentSize](self, "contentSize");
  v19 = v17 / v18;
  -[PUTilingLayout dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "indicatorInfos");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __53__PUFilmstripTilingLayout_layoutInfosForTilesInRect___block_invoke;
  v26[3] = &unk_1E589F8D0;
  v28 = v16;
  v29 = v19;
  v26[4] = self;
  v22 = v12;
  v27 = v22;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v26);

  v23 = v27;
  v24 = v22;

  return v24;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PUFilmstripTilingLayout _layoutInfoForTileWithIndex:kind:](self, "_layoutInfoForTileWithIndex:kind:", objc_msgSend(a3, "indexAtPosition:", 0), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)preferredScrollInfo
{
  return +[PUTilingScrollInfo scrollInfoWithScrollDirections:](PUTilingScrollInfo, "scrollInfoWithScrollDirections:", 2);
}

- (id)_layoutInfoForTileWithIndex:(int64_t)a3 kind:(id)a4
{
  id v6;
  void *v7;
  NSCache *layoutInfoCache;
  void *v9;
  PUTileLayoutInfo *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  PUTileLayoutInfo *v15;
  void *v16;
  double width;
  double height;
  __int128 v19;
  NSCache *v20;
  void *v21;
  _OWORD v23[3];

  v6 = a4;
  v7 = v6;
  if (self->_numberOfItems > a3 && objc_msgSend(v6, "isEqualToString:", CFSTR("PUTileKindItemContent")))
  {
    layoutInfoCache = self->_layoutInfoCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](layoutInfoCache, "objectForKey:", v9);
    v10 = (PUTileLayoutInfo *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = self->_itemSize.width * 0.5 + (double)a3 * self->_itemSize.width;
      v12 = self->_itemSize.height * 0.5;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v13, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = [PUTileLayoutInfo alloc];
      -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      width = self->_itemSize.width;
      height = self->_itemSize.height;
      v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v23[0] = *MEMORY[0x1E0C9BAA8];
      v23[1] = v19;
      v23[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v10 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v15, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v14, v23, v16, v11, v12, width, height, 1.0, 0.0);

      v20 = self->_layoutInfoCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](v20, "setObject:forKey:", v10, v21);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_layoutInfoForIndicatorInfo:(id)a3 withIndex:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MidY;
  double Height;
  PUFilmstripIndicatorLayoutInfo *v16;
  void *v17;
  __int128 v18;
  PUFilmstripIndicatorLayoutInfo *v19;
  void *v20;
  PUFilmstripIndicatorLayoutInfo *v21;
  _OWORD v23[3];
  CGRect v24;
  CGRect v25;

  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = a3;
  objc_msgSend(v6, "indexPathWithIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v8, CFSTR("PUTileKindItemContentFilmStripIndicator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFilmstripTilingLayout contentBounds](self, "contentBounds");
  v11 = v10;
  objc_msgSend(v7, "normalizedLocation");
  v13 = v12 * v11;
  -[PUFilmstripTilingLayout contentBounds](self, "contentBounds");
  MidY = CGRectGetMidY(v24);
  -[PUFilmstripTilingLayout contentBounds](self, "contentBounds");
  Height = CGRectGetHeight(v25);
  v16 = [PUFilmstripIndicatorLayoutInfo alloc];
  -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v23[0] = *MEMORY[0x1E0C9BAA8];
  v23[1] = v18;
  v23[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v19 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v16, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v9, v23, v17, v13, MidY, 3.0, Height, 1.0, 1.0);

  objc_msgSend(v7, "preferredColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFilmstripIndicatorLayoutInfo setHighlightColor:](v19, "setHighlightColor:", v20);
  v21 = v19;

  return v21;
}

- (CGSize)contentSize
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfoCache, 0);
}

void __53__PUFilmstripTilingLayout_layoutInfosForTilesInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "normalizedLocation");
  if (v5 >= *(double *)(a1 + 48) && v5 <= v5 + *(double *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_layoutInfoForIndicatorInfo:withIndex:", v7, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
}

@end
