@implementation CACCorrectionsFlowLayout

- (void)prepareLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACCorrectionsFlowLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v2, sel_prepareLayout);
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (double)_availableWidth
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  -[CACCorrectionsFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v16);
  -[CACCorrectionsFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = Width - v6;
  -[CACCorrectionsFlowLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInset");
  v10 = v7 - v9;
  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  v12 = v10 - v11;
  -[UICollectionViewFlowLayout sectionInset](self, "sectionInset");
  v14 = v12 - v13;

  return v14;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACCorrectionsFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v6, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsFlowLayout _availableWidth](self, "_availableWidth");
  objc_msgSend(v4, "setAvailableWidth:");
  return v4;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)CACCorrectionsFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v17, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsFlowLayout _availableWidth](self, "_availableWidth");
  v6 = v5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "setAvailableWidth:", v6, (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

  return v7;
}

@end
