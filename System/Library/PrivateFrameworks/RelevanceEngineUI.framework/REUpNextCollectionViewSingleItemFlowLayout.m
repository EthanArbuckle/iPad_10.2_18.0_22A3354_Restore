@implementation REUpNextCollectionViewSingleItemFlowLayout

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  NSDictionary *allAttributes;
  objc_super v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)REUpNextCollectionViewSingleItemFlowLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v22, sel_prepareLayout);
  -[REUpNextCollectionViewSingleItemFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  UIRectGetCenter();
  v5 = v4;
  v7 = v6;
  v8 = (NSDictionary *)objc_opt_new();
  -[REUpNextCollectionViewSingleItemFlowLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfSections");

  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      -[REUpNextCollectionViewSingleItemFlowLayout collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "numberOfItemsInSection:", i);

      if (v13 >= 1)
      {
        for (j = 0; j != v13; ++j)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", j, i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21.receiver = self;
          v21.super_class = (Class)REUpNextCollectionViewSingleItemFlowLayout;
          -[REUpNextCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v21, sel_layoutAttributesForItemAtIndexPath_, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "copy");

          v18 = -[NSIndexPath isEqual:](self->_preferedIndexPath, "isEqual:", v15);
          v19 = 0.0;
          if (v18)
          {
            objc_storeStrong((id *)&self->_preferedCellAttributes, v17);
            objc_msgSend(v17, "setCenter:", v5, v7);
            v19 = 1.0;
          }
          objc_msgSend(v17, "setAlpha:", v19);
          -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v17, v15);

        }
      }
    }
  }
  allAttributes = self->_allAttributes;
  self->_allAttributes = v8;

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (self->_preferedCellAttributes)
  {
    v5[0] = self->_preferedCellAttributes;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_allAttributes, "objectForKeyedSubscript:", a3);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REUpNextCollectionViewSingleItemFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v7, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "setAlpha:", 0.0);
  return v5;
}

- (NSIndexPath)preferedIndexPath
{
  return self->_preferedIndexPath;
}

- (void)setPreferedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_preferedIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferedIndexPath, 0);
  objc_storeStrong((id *)&self->_allAttributes, 0);
  objc_storeStrong((id *)&self->_preferedCellAttributes, 0);
}

@end
