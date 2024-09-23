@implementation PUSingleHeightHorizontalAlbumListGadgetLayout

- (BOOL)pagingEnabled
{
  return 0;
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
  v11 = -[PUHorizontalAlbumListGadgetLayout _numberOfAlbums](self, "_numberOfAlbums");
  v12 = v11 - 1;
  if (!v11)
    v12 = 0;
  v13 = v8 * (double)v12 + v4 * (double)v11;
  v14 = v6 + v10;
  result.height = v14;
  result.width = v13;
  return result;
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
  v14.super_class = (Class)PUSingleHeightHorizontalAlbumListGadgetLayout;
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
        -[PUSingleHeightHorizontalAlbumListGadgetLayout _adjustLayoutAttributes:](self, "_adjustLayoutAttributes:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }
  return v4;
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
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[PUHorizontalAlbumListGadgetLayout showsHorizontalScrollIndicator](self, "showsHorizontalScrollIndicator"))
    v12 = 0.0;
  else
    v12 = v7;
  objc_msgSend(v13, "setFrame:", v5, v12, v9, v11);

}

@end
