@implementation VideosExtrasCarouselCollectionViewFlowLayout

- (void)setIndexOfVisibleItem:(unint64_t)a3
{
  -[VideosExtrasCarouselCollectionViewFlowLayout setIndexOfVisibleItem:animated:](self, "setIndexOfVisibleItem:animated:", a3, 0);
}

- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "frame");
  v8 = v7;
  -[VideosExtrasCarouselCollectionViewFlowLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentOffset");
  v11 = v10;

  -[VideosExtrasCarouselCollectionViewFlowLayout collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_effectiveContentInset");
  v14 = v13;

  -[VideosExtrasCarouselCollectionViewFlowLayout collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentOffset:animated:", v4, v8 - v14, v11);

}

- (unint64_t)indexOfVisibleItem
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VideosExtrasCarouselCollectionViewFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;

  -[VideosExtrasCarouselCollectionViewFlowLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v5, 0.0, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = v5 + v8 * 0.5;
    v15 = *(_QWORD *)v23;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v18, "frame");
        if (v19 <= v14)
        {
          objc_msgSend(v18, "indexPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v20, "row");

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }
  else
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v16;
}

@end
