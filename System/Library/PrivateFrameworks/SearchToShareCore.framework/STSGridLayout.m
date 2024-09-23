@implementation STSGridLayout

- (STSGridLayout)init
{
  STSGridLayout *v2;
  STSGridLayout *v3;
  uint64_t v4;
  NSMutableDictionary *tileSmallFrameCache;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STSGridLayout;
  v2 = -[STSGridLayout init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_itemSpacing = 6.0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    tileSmallFrameCache = v3->_tileSmallFrameCache;
    v3->_tileSmallFrameCache = (NSMutableDictionary *)v4;

    -[STSGridLayout registerClass:forDecorationViewOfKind:](v3, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("TileOverlay"));
  }
  return v3;
}

- (void)prepareLayout
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double headerHeight;
  NSDictionary *v11;
  NSDictionary *headerAttributes;
  unint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  void *v24;
  UICollectionViewLayoutAttributes *v25;
  double v26;
  double v27;
  CGFloat v28;
  double footerHeight;
  UICollectionViewLayoutAttributes *footerAttributes;
  NSDictionary *v31;
  NSDictionary *cellAttributes;
  NSDictionary *v33;
  NSDictionary *tileAttributes;
  _QWORD v35[4];
  id v36;
  id v37;
  STSGridLayout *v38;
  _QWORD *v39;
  uint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  double v43;
  double v44;
  BOOL v45;
  _QWORD v46[4];
  __int128 v47;
  __int128 v48;
  double v49;
  uint64_t v50;
  CGFloat *v51;
  uint64_t v52;
  uint64_t v53;
  CGRect v54;
  CGRect v55;

  v3 = -[STSGridLayout _hasOnlyLargeItems](self, "_hasOnlyLargeItems");
  -[STSGridLayout _gridTilesForCurrentDataSource](self, "_gridTilesForCurrentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = (CGFloat *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  if (self->_headerHeight > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4A0], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("STSGridLayoutElementKindHeader"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSGridLayout _availableContentSize](self, "_availableContentSize");
    v9 = v8;
    headerHeight = self->_headerHeight;
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v8, headerHeight);
    objc_msgSend(v7, "setZIndex:", 300);
    v54.origin.x = 0.0;
    v54.origin.y = 0.0;
    v54.size.width = v9;
    v54.size.height = headerHeight;
    v51[3] = CGRectGetMaxY(v54) + self->_itemSpacing;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v7, v6);
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    headerAttributes = self->_headerAttributes;
    self->_headerAttributes = v11;

  }
  v49 = 0.0;
  v13 = -[STSGridLayout _tilesPerRowAndWidth:](self, "_tilesPerRowAndWidth:", &v49);
  v14 = objc_msgSend(v4, "count");
  v15 = v49;
  if (v3)
  {
    -[STSGridLayout collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UICeilToViewScale();
    v18 = v17;

    v15 = v49;
  }
  else
  {
    v18 = v49;
  }
  v19 = 0;
  v46[2] = 0x4010000000;
  v46[3] = &unk_221817A09;
  v47 = 0u;
  v48 = 0u;
  v20 = *((_QWORD *)v51 + 3);
  v46[0] = 0;
  v46[1] = v46;
  *((_QWORD *)&v47 + 1) = v20;
  *(double *)&v48 = v15;
  *((double *)&v48 + 1) = v18;
  if (!v3)
  {
    -[STSGridLayout _tileSmallFramesForSize:](self, "_tileSmallFramesForSize:", v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __30__STSGridLayout_prepareLayout__block_invoke;
  v35[3] = &unk_24E7458F8;
  v45 = v3;
  v39 = v46;
  v21 = (v13 + v14 - 1) / v13;
  v22 = v19;
  v36 = v22;
  v23 = v5;
  v41 = v13;
  v42 = v21;
  v40 = &v50;
  v37 = v23;
  v38 = self;
  v43 = v18;
  v44 = v49;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v35);
  if (self->_footerHeight > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4A0], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("STSGridLayoutElementKindFooter"), v24);
    v25 = (UICollectionViewLayoutAttributes *)objc_claimAutoreleasedReturnValue();
    v26 = v51[3];
    -[STSGridLayout _availableContentSize](self, "_availableContentSize");
    v28 = v27;
    footerHeight = self->_footerHeight;
    -[UICollectionViewLayoutAttributes setFrame:](v25, "setFrame:", 0.0, v26, v27, footerHeight);
    -[UICollectionViewLayoutAttributes setZIndex:](v25, "setZIndex:", 100);
    v55.origin.x = 0.0;
    v55.origin.y = v26;
    v55.size.width = v28;
    v55.size.height = footerHeight;
    v51[3] = CGRectGetMaxY(v55);
    footerAttributes = self->_footerAttributes;
    self->_footerAttributes = v25;

  }
  self->_contentSizeMaxY = v51[3];
  v31 = (NSDictionary *)objc_msgSend(v23, "copy");
  cellAttributes = self->_cellAttributes;
  self->_cellAttributes = v31;

  v33 = (NSDictionary *)objc_msgSend(0, "copy");
  tileAttributes = self->_tileAttributes;
  self->_tileAttributes = v33;

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v50, 8);

}

void __30__STSGridLayout_prepareLayout__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  double MaxY;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  CGRect *v46;
  double v47;
  double v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  CGFloat *v56;
  uint64_t v57;
  uint64_t v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v5 = a2;
  v6 = objc_msgSend(v5, "layoutStyle");
  if (v6 > 5)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v7 = *(&off_24E7459D8 + v6);
    v8 = qword_221814600[v6];
    v9 = qword_221814630[v6];
  }
  v55 = 0;
  v56 = (CGFloat *)&v55;
  v57 = 0x2020000000;
  v58 = 0;
  objc_msgSend(v5, "largeIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD15D8];
    objc_msgSend(v5, "largeIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForItem:inSection:", objc_msgSend(v12, "integerValue"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD4A0], "layoutAttributesForCellWithIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 104))
    {
      v15 = *(double **)(*(_QWORD *)(a1 + 56) + 8);
      v16 = v15[4];
      v17 = v15[5];
      v18 = v15[6];
      v19 = v15[7];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "CGRectValue");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "CGRectValue");
      v64.origin.x = v30;
      v64.origin.y = v31;
      v64.size.width = v32;
      v64.size.height = v33;
      v59.origin.x = v22;
      v59.origin.y = v24;
      v59.size.width = v26;
      v59.size.height = v28;
      v60 = CGRectUnion(v59, v64);
      x = v60.origin.x;
      y = v60.origin.y;
      width = v60.size.width;
      height = v60.size.height;

      v61.origin.x = x;
      v61.origin.y = y;
      v61.size.width = width;
      v61.size.height = height;
      v62 = CGRectOffset(v61, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v16 = v62.origin.x;
      v17 = v62.origin.y;
      v18 = v62.size.width;
      v19 = v62.size.height;
    }
    objc_msgSend(v14, "setFrame:", v16, v17, v18, v19);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v13);
    v63.origin.x = v16;
    v63.origin.y = v17;
    v63.size.width = v18;
    v63.size.height = v19;
    v56[3] = CGRectGetMaxY(v63);

  }
  objc_msgSend(v5, "smallIndexes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __30__STSGridLayout_prepareLayout__block_invoke_26;
  v49[3] = &unk_24E7458D0;
  v50 = v7;
  v39 = *(id *)(a1 + 32);
  v40 = *(_QWORD *)(a1 + 56);
  v51 = v39;
  v53 = v40;
  v52 = *(id *)(a1 + 40);
  v54 = &v55;
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", v49);

  v41 = *(_QWORD *)(a1 + 72);
  if (a3 / v41 == *(_QWORD *)(a1 + 80) - 1)
  {
    MaxY = v56[3];
  }
  else
  {
    MaxY = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    v41 = *(_QWORD *)(a1 + 72);
  }
  v43 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (MaxY < *(double *)(v43 + 24))
    MaxY = *(double *)(v43 + 24);
  *(double *)(v43 + 24) = MaxY;
  v44 = a3 % v41;
  v45 = v41 - 1;
  v46 = *(CGRect **)(*(_QWORD *)(a1 + 56) + 8);
  if (v44 == v45)
  {
    v46[1].origin.x = 0.0;
    v46 = *(CGRect **)(*(_QWORD *)(a1 + 56) + 8);
    v47 = *(double *)(a1 + 88) + *(double *)(*(_QWORD *)(a1 + 48) + 344);
    v48 = 0.0;
  }
  else
  {
    v48 = *(double *)(a1 + 96) + *(double *)(*(_QWORD *)(a1 + 48) + 344);
    v47 = 0.0;
  }
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = CGRectOffset(v46[1], v48, v47);

  _Block_object_dispose(&v55, 8);
}

void __30__STSGridLayout_prepareLayout__block_invoke_26(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  double MaxY;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(a2, "integerValue"), 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4A0], "layoutAttributesForCellWithIndexPath:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    v10 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGRectValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  v25 = CGRectOffset(v24, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v23);
  v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxY = CGRectGetMaxY(v26);
  if (v21 >= MaxY)
    MaxY = v21;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = MaxY;

}

- (void)invalidateLayout
{
  NSDictionary *headerAttributes;
  NSDictionary *cellAttributes;
  NSDictionary *tileAttributes;
  UICollectionViewLayoutAttributes *footerAttributes;
  NSNumber *hasOnlyLargeItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STSGridLayout;
  -[STSGridLayout invalidateLayout](&v8, sel_invalidateLayout);
  headerAttributes = self->_headerAttributes;
  self->_headerAttributes = 0;

  cellAttributes = self->_cellAttributes;
  self->_cellAttributes = 0;

  tileAttributes = self->_tileAttributes;
  self->_tileAttributes = 0;

  footerAttributes = self->_footerAttributes;
  self->_footerAttributes = 0;

  hasOnlyLargeItems = self->_hasOnlyLargeItems;
  self->_hasOnlyLargeItems = 0;

  self->_contentSizeMaxY = 0.0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[STSGridLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  v16 = CGRectGetWidth(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  return v16 != CGRectGetWidth(v19);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UICollectionViewLayoutAttributes *footerAttributes;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  _QWORD v25[4];
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __51__STSGridLayout_layoutAttributesForElementsInRect___block_invoke;
  v25[3] = &__block_descriptor_64_e49_B32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
  v26 = a3;
  v8 = (void *)MEMORY[0x227672A18](v25, a2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_headerHeight > 0.0)
  {
    -[NSDictionary allValues](self->_headerAttributes, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexesOfObjectsPassingTest:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectsAtIndexes:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v12);

  }
  -[NSDictionary allValues](self->_cellAttributes, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexesOfObjectsPassingTest:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectsAtIndexes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v15);

  -[NSDictionary allValues](self->_tileAttributes, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "indexesOfObjectsPassingTest:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectsAtIndexes:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v18);

  footerAttributes = self->_footerAttributes;
  if (footerAttributes)
  {
    -[UICollectionViewLayoutAttributes frame](footerAttributes, "frame");
    v28.origin.x = v20;
    v28.origin.y = v21;
    v28.size.width = v22;
    v28.size.height = v23;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    if (CGRectIntersectsRect(v27, v28))
      objc_msgSend(v9, "addObject:", self->_footerAttributes);
  }

  return v9;
}

BOOL __51__STSGridLayout_layoutAttributesForElementsInRect___block_invoke(CGRect *a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGRect v8;

  objc_msgSend(a2, "frame");
  v8.origin.x = v3;
  v8.origin.y = v4;
  v8.size.width = v5;
  v8.size.height = v6;
  return CGRectIntersectsRect(a1[1], v8);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_cellAttributes, "objectForKeyedSubscript:", a3);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  UICollectionViewLayoutAttributes *v8;
  UICollectionViewLayoutAttributes *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("STSGridLayoutElementKindHeader")))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_headerAttributes, "objectForKeyedSubscript:", v7);
    v8 = (UICollectionViewLayoutAttributes *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("STSGridLayoutElementKindFooter")))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = self->_footerAttributes;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return -[NSDictionary objectForKeyedSubscript:](self->_tileAttributes, "objectForKeyedSubscript:", a4);
}

- (CGSize)collectionViewContentSize
{
  double v3;
  double contentSizeMaxY;
  CGSize result;

  -[STSGridLayout _availableContentSize](self, "_availableContentSize");
  contentSizeMaxY = self->_contentSizeMaxY;
  result.height = contentSizeMaxY;
  result.width = v3;
  return result;
}

- (int64_t)maximumCellsPerRow
{
  return 3 * -[STSGridLayout _tilesPerRowAndWidth:](self, "_tilesPerRowAndWidth:", 0);
}

- (void)setHeaderHeight:(double)a3
{
  if (self->_headerHeight != a3)
  {
    self->_headerHeight = a3;
    -[STSGridLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setFooterHeight:(double)a3
{
  if (self->_footerHeight != a3)
  {
    self->_footerHeight = a3;
    -[STSGridLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setItemSpacing:(double)a3
{
  if (self->_itemSpacing != a3)
  {
    self->_itemSpacing = a3;
    -[NSMutableDictionary removeAllObjects](self->_tileSmallFrameCache, "removeAllObjects");
    -[STSGridLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (id)_gridLayoutDelegate
{
  void *v2;
  void *v3;

  -[STSGridLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_gridTilesForCurrentDataSource
{
  void *v3;
  unint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  uint64_t v19;
  _BYTE *v21;
  unint64_t v22;
  void *v23;
  STSGridLayout *v24;
  void *v25;
  id v26;
  uint8_t buf;
  _BYTE v28[7];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[STSGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STSGridLayout _tilesPerRowAndWidth:](self, "_tilesPerRowAndWidth:", 0);
  v5 = -[STSGridLayout _hasOnlyLargeItems](self, "_hasOnlyLargeItems");
  v23 = v3;
  if (objc_msgSend(v3, "numberOfSections"))
  {
    v22 = v4;
    if (v5)
    {
      v6 = &unk_24E757560;
    }
    else if (v4 > 2)
    {
      v6 = &unk_24E7575A8;
    }
    else
    {
      v6 = (void *)qword_24E745A08[v4];
    }
    v25 = v6;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    v39 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "numberOfItemsInSection:", 0);
    v9 = v8;
    if (v8)
    {
      v10 = 0;
      v21 = v28;
      v11 = v8 - 1;
      v24 = self;
      do
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v10, 0, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5
          || (-[STSGridLayout _gridLayoutDelegate](self, "_gridLayoutDelegate"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "collectionView:layout:sizeForItemAtIndexPath:", v23, self, v12),
              v13,
              !v14))
        {
          v14 = 0;
          if (v35[5])
            v15 = 0;
          else
            v15 = (unint64_t)objc_msgSend(v7, "count") < 6;
        }
        else
        {
          if (v14 != 1)
            goto LABEL_15;
          if (!v35[5])
            goto LABEL_21;
          if ((unint64_t)objc_msgSend(v7, "count") < 5)
          {
            v14 = 1;
LABEL_15:
            v15 = 1;
            goto LABEL_23;
          }
          if (v35[5])
            v15 = 0;
          else
LABEL_21:
            v15 = (unint64_t)objc_msgSend(v7, "count") < 9;
          v14 = 1;
        }
LABEL_23:
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __47__STSGridLayout__gridTilesForCurrentDataSource__block_invoke;
        v29[3] = &unk_24E745940;
        v16 = v7;
        v33 = &v34;
        v30 = v16;
        v31 = v25;
        v32 = v26;
        v17 = (void (**)(_QWORD))MEMORY[0x227672A18](v29);
        if (!v15)
        {
          if (v11 != v10
            && (!v35[5] && (unint64_t)objc_msgSend(v16, "count") < 9
             || !v5 && v35[5] && (unint64_t)objc_msgSend(v16, "count") <= 4)
            && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[STSGridLayout _gridTilesForCurrentDataSource].cold.1(&buf, v21);
          }
          v17[2](v17);
        }
        if (!v14)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
          v19 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v35[5];
          v35[5] = v19;
          goto LABEL_37;
        }
        if (v14 == 1)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v18);
LABEL_37:

        }
        if (v11 == v10)
          v17[2](v17);

        ++v10;
        self = v24;
      }
      while (v9 != v10);
    }
    if (!v5)
      -[STSGridLayout _redistributeLastRowItemsInTiles:withTilesPerRow:](self, "_redistributeLastRowItemsInTiles:withTilesPerRow:", v26, v22);

    _Block_object_dispose(&v34, 8);
  }

  return v26;
}

void __47__STSGridLayout__gridTilesForCurrentDataSource__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  STSGridTile *v5;

  v5 = objc_alloc_init(STSGridTile);
  -[STSGridTile setSmallIndexes:](v5, "setSmallIndexes:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "count") % (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSGridTile setLayoutStyle:](v5, "setLayoutStyle:", objc_msgSend(v2, "integerValue"));

    -[STSGridTile setLargeIndex:](v5, "setLargeIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    -[STSGridTile setLayoutStyle:](v5, "setLayoutStyle:", 0);
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

- (void)_redistributeLastRowItemsInTiles:(id)a3 withTilesPerRow:(unint64_t)a4
{
  id v4;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  STSGridTile *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;

  v34 = a3;
  v6 = objc_msgSend(v34, "count");
  v7 = v34;
  if (v6)
  {
    objc_msgSend(v34, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(objc_msgSend(v34, "count") % a4))
    {
      objc_msgSend(v8, "largeIndex");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27
        && (objc_msgSend(v8, "smallIndexes"),
            v4 = (id)objc_claimAutoreleasedReturnValue(),
            (unint64_t)objc_msgSend(v4, "count") <= 4))
      {

      }
      else
      {
        objc_msgSend(v8, "largeIndex");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {

          if (!v27)
            goto LABEL_24;
          goto LABEL_23;
        }
        objc_msgSend(v8, "smallIndexes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

        if (v27)
        {

          if (v30 >= 9)
            goto LABEL_24;
        }
        else if (v30 > 8)
        {
          goto LABEL_24;
        }
      }
    }
    v33 = v8;
    v9 = objc_msgSend(v34, "count");
    v10 = v9 - 1 - (a4 + v9 - 1) % a4;
    objc_msgSend(v34, "subarrayWithRange:", v10, objc_msgSend(v34, "count") - v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9 * objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __66__STSGridLayout__redistributeLastRowItemsInTiles_withTilesPerRow___block_invoke;
    v37[3] = &unk_24E745968;
    v4 = v12;
    v38 = v4;
    v31 = v13;
    v32 = v11;
    v39 = v31;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v37);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v15 = 0;
      v16 = v10;
      do
      {
        if (v16 >= objc_msgSend(v34, "count")
          || (objc_msgSend(v34, "objectAtIndexedSubscript:", v16),
              (v17 = (STSGridTile *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v17 = objc_alloc_init(STSGridTile);
          -[STSGridTile setLayoutStyle:](v17, "setLayoutStyle:", 0);
          objc_msgSend(v34, "addObject:", v17);
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, v20);

        }
        -[STSGridTile largeIndex](v17, "largeIndex");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          v22 = (unint64_t)objc_msgSend(v19, "count") < 2;
        else
          v22 = 0;

        v23 = objc_msgSend(v4, "count");
        v24 = 3;
        if (v22)
          v24 = 1;
        if (v24 >= v23 - v15)
          v25 = v23 - v15;
        else
          v25 = v24;
        objc_msgSend(v4, "subarrayWithRange:", v15, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObjectsFromArray:", v26);
        v15 += v25;
        if ((v16 + 1) % a4)
          ++v16;
        else
          v16 = v10;

      }
      while (v15 < objc_msgSend(v4, "count"));
    }
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __66__STSGridLayout__redistributeLastRowItemsInTiles_withTilesPerRow___block_invoke_2;
    v35[3] = &unk_24E745990;
    v36 = v34;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v35);

    v27 = v32;
    v8 = v33;
LABEL_23:

LABEL_24:
    v7 = v34;
  }

}

void __66__STSGridLayout__redistributeLastRowItemsInTiles_withTilesPerRow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "smallIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v12, "smallIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  objc_msgSend(v12, "largeIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v12, "largeIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    if (objc_msgSend(v12, "layoutStyle") == 4)
    {
      v10 = v12;
      v11 = 2;
LABEL_8:
      objc_msgSend(v10, "setLayoutStyle:", v11);
      goto LABEL_9;
    }
    if (objc_msgSend(v12, "layoutStyle") == 5)
    {
      v10 = v12;
      v11 = 3;
      goto LABEL_8;
    }
  }
LABEL_9:

}

void __66__STSGridLayout__redistributeLastRowItemsInTiles_withTilesPerRow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(a2, "integerValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v7, "setSmallIndexes:", v6);
}

- (BOOL)_hasOnlyLargeItems
{
  NSNumber **p_hasOnlyLargeItems;
  NSNumber *hasOnlyLargeItems;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  p_hasOnlyLargeItems = &self->_hasOnlyLargeItems;
  hasOnlyLargeItems = self->_hasOnlyLargeItems;
  if (!hasOnlyLargeItems)
  {
    -[STSGridLayout collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__STSGridLayout__hasOnlyLargeItems__block_invoke;
    v9[3] = &unk_24E7459B8;
    v11 = &v12;
    v9[4] = self;
    v6 = v5;
    v10 = v6;
    objc_msgSend(v6, "sts_enumerateAllIndexPathsUsingBlock:", v9);
    if (v13[5])
      v7 = (void *)v13[5];
    else
      v7 = (void *)MEMORY[0x24BDBD1C0];
    objc_storeStrong((id *)p_hasOnlyLargeItems, v7);

    _Block_object_dispose(&v12, 8);
    hasOnlyLargeItems = *p_hasOnlyLargeItems;
  }
  return -[NSNumber BOOLValue](hasOnlyLargeItems, "BOOLValue");
}

void __35__STSGridLayout__hasOnlyLargeItems__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_QWORD *)(v5 + 40))
  {
    *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1C8];

  }
  objc_msgSend(*(id *)(a1 + 32), "_gridLayoutDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "collectionView:layout:sizeForItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v10);

  if (v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = MEMORY[0x24BDBD1C0];

    *a3 = 1;
  }

}

- (id)_tileSmallFramesForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  char *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_tileSmallFrameCache, "objectForKey:", v6);
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      for (i = 0; i != 3; ++i)
      {
        v10 = (void *)MEMORY[0x24BDD1968];
        -[STSGridLayout _gridFrameForRow:andColumn:inSize:](self, "_gridFrameForRow:andColumn:inSize:", v7, i, width, height);
        objc_msgSend(v10, "valueWithCGRect:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v11);

      }
      ++v7;
    }
    while (v7 != (char *)3);
    v7 = (char *)objc_msgSend(v8, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tileSmallFrameCache, "setObject:forKeyedSubscript:", v7, v6);

  }
  return v7;
}

- (CGRect)_gridFrameForRow:(unint64_t)a3 andColumn:(unint64_t)a4 inSize:(CGSize)a5
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[STSGridLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIFloorToViewScale();
  v8 = v7;

  -[STSGridLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIFloorToViewScale();
  v11 = v10;

  -[STSGridLayout collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIFloorToViewScale();
  v14 = v13;

  v15 = v8;
  v16 = v11;
  v17 = v14;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (unint64_t)_tilesPerRowAndWidth:(double *)a3
{
  double v5;
  double v6;
  unint64_t v7;
  void *v9;
  uint64_t v10;

  -[STSGridLayout _availableContentSize](self, "_availableContentSize");
  if (v5 >= 550.0)
  {
    if (v5 <= v6 || v5 / 3.0 <= 440.0)
      v7 = 2;
    else
      v7 = 3;
    if (a3)
    {
      -[STSGridLayout collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      UIFloorToViewScale();
      *(_QWORD *)a3 = v10;

    }
  }
  else
  {
    if (a3)
      *a3 = v5;
    return 1;
  }
  return v7;
}

- (CGSize)_availableContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[STSGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[STSGridLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInset");
  v11 = v5 - (v9 + v10);
  v14 = v7 - (v12 + v13);

  v15 = v11;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasOnlyLargeItems, 0);
  objc_storeStrong((id *)&self->_tileSmallFrameCache, 0);
  objc_storeStrong((id *)&self->_footerAttributes, 0);
  objc_storeStrong((id *)&self->_tileAttributes, 0);
  objc_storeStrong((id *)&self->_cellAttributes, 0);
  objc_storeStrong((id *)&self->_headerAttributes, 0);
}

- (void)_gridTilesForCurrentDataSource
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unexpected partially filled tile in the middle of results", buf, 2u);
}

@end
