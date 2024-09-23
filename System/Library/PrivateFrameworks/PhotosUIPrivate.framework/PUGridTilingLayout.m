@implementation PUGridTilingLayout

- (PUGridTilingLayout)init
{
  PUGridTilingLayout *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUGridTilingLayout;
  result = -[PUTilingLayout init](&v8, sel_init);
  if (result)
  {
    result->_itemSize = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
    __asm { FMOV            V0.2D, #10.0 }
    result->_interItemSpacing = _Q0;
    result->_numberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  PUTilingLayoutInvalidationContext *v13;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUTilingLayout visibleRect](self, "visibleRect");
  v9 = v8;
  v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)PUGridTilingLayout;
  -[PUSectionedTilingLayout setVisibleRect:](&v14, sel_setVisibleRect_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    self->_numberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
    v13 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    -[PUTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v13);

  }
}

- (void)prepareLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)PUGridTilingLayout;
  -[PUSectionedTilingLayout prepareLayout](&v7, sel_prepareLayout);
  -[PUGridTilingLayout itemSize](self, "itemSize");
  v4 = v3;
  -[PUGridTilingLayout interItemSpacing](self, "interItemSpacing");
  v6 = v5;
  -[PUTilingLayout visibleRect](self, "visibleRect");
  self->_numberOfColumns = vcvtmd_s64_f64((v6 + CGRectGetWidth(v8)) / (v4 + v6));
}

- (id)preferredScrollInfo
{
  return +[PUTilingScrollInfo scrollInfoWithScrollDirections:](PUTilingScrollInfo, "scrollInfoWithScrollDirections:", 4);
}

- (CGSize)estimatedSectionSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  -[PUGridTilingLayout itemSize](self, "itemSize");
  v5 = v4;
  -[PUGridTilingLayout interItemSpacing](self, "interItemSpacing");
  v7 = -(v6 - (v5 + v6) * 3.0);
  v8 = v3;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUGridTilingLayout;
  -[PUSectionedTilingLayout addLayoutInfosForTilesInRect:section:toSet:](&v17, sel_addLayoutInfosForTilesInRect_section_toSet_, a4, v11, x, y, width, height);
  v12 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", a4);
  if (v12 >= 1)
  {
    v13 = v12;
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUGridTilingLayout _frameForItemAtIndexPath:](self, "_frameForItemAtIndexPath:", v15);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      if (CGRectIntersectsRect(v18, v19))
      {
        -[PUGridTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v15, CFSTR("PUTileKindItemContent"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v16);

      }
    }
  }

}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  PUTileLayoutInfo *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __int128 v19;
  PUTileLayoutInfo *v20;
  _OWORD v22[3];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PUTileKindItemContent")))
  {
    -[PUGridTilingLayout _frameForItemAtIndexPath:](self, "_frameForItemAtIndexPath:", v6);
    v9 = v8;
    v11 = v10;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [PUTileLayoutInfo alloc];
    UIRectGetCenter();
    v15 = v14;
    v17 = v16;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v22[0] = *MEMORY[0x1E0C9BAA8];
    v22[1] = v19;
    v22[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v20 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v13, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v12, v22, v18, v15, v17, v9, v11, 1.0, 0.0);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  CGSize result;

  -[PUGridTilingLayout itemSize](self, "itemSize", a3);
  v7 = v6;
  v9 = v8;
  -[PUGridTilingLayout interItemSpacing](self, "interItemSpacing");
  v11 = v10;
  v13 = v12;
  v14 = -[PUGridTilingLayout _numberOfColumns](self, "_numberOfColumns");
  if (a4 < 1)
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  else
    v15 = -(v13 - (double)((a4 + v14 - 1) / v14) * (v9 + v13));
  v16 = -(v11 - (double)v14 * (v7 + v11));
  result.height = v15;
  result.width = v16;
  return result;
}

- (CGRect)_frameForItemAtIndexPath:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", objc_msgSend(v4, "section"));
  v6 = v5;
  v8 = v7;
  v9 = -[PUGridTilingLayout _numberOfColumns](self, "_numberOfColumns");
  v10 = objc_msgSend(v4, "item");

  -[PUGridTilingLayout itemSize](self, "itemSize");
  v12 = v11;
  v14 = v13;
  -[PUGridTilingLayout interItemSpacing](self, "interItemSpacing");
  v16 = v6 + (double)(v10 % v9) * (v12 + v15);
  v18 = v8 + (double)(v10 / v9) * (v14 + v17);
  v19 = v12;
  v20 = v14;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (int64_t)_numberOfColumns
{
  int64_t result;
  void *v5;

  result = self->_numberOfColumns;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUGridTilingLayout.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_numberOfColumns != NSNotFound"));

    return self->_numberOfColumns;
  }
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

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (CGSize)interItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interItemSpacing.width;
  height = self->_interItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterItemSpacing:(CGSize)a3
{
  self->_interItemSpacing = a3;
}

@end
