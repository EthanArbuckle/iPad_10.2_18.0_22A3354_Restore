@implementation SearchUICollectionView

- (SearchUICollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionView;
  return -[SearchUICollectionView initWithFrame:collectionViewLayout:](&v5, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)focusGroupIdentifier
{
  return +[SearchUIUtilities focusGroupIdentifier](SearchUIUtilities, "focusGroupIdentifier");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SearchUICollectionView;
  -[SearchUICollectionView layoutSubviews](&v15, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SearchUICollectionView subviews](self, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        NSClassFromString(CFSTR("_UICollectionViewListSeparatorView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SearchUISeparatorView separatorColorForAppearance:](SearchUISeparatorView, "separatorColorForAppearance:", v3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setBackgroundColor:", v10);

          objc_msgSend(v3, "enableAppearanceForView:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

}

@end
