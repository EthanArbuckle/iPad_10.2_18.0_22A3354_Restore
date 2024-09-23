@implementation SXMosaicGalleryLayouter

- (SXMosaicGalleryLayouter)initWithDataSource:(id)a3
{
  id v4;
  SXMosaicGalleryLayouter *v5;
  SXMosaicGalleryLayouter *v6;
  uint64_t v7;
  NSMutableArray *layouts;
  uint64_t v9;
  NSMutableArray *clusters;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SXMosaicGalleryLayouter;
  v5 = -[SXMosaicGalleryLayouter init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v6->_numberOfItems = -1;
    v6->_width = 1.79769313e308;
    v6->_contentSize = (CGSize)*MEMORY[0x24BDBF148];
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    layouts = v6->_layouts;
    v6->_layouts = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    clusters = v6->_clusters;
    v6->_clusters = (NSMutableArray *)v9;

  }
  return v6;
}

- (void)calculateLayoutForWidth:(double)a3
{
  double v5;
  SXMosaicGalleryColumnLayout *v6;
  SXMosaicGalleryColumnLayout *v7;
  SXMosaicGalleryColumnLayout *columnLayout;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;

  -[SXMosaicGalleryLayouter width](self, "width");
  if (v5 != a3)
  {
    -[SXMosaicGalleryLayouter resetLayout](self, "resetLayout");
    -[SXMosaicGalleryLayouter setWidth:](self, "setWidth:", a3);
    v6 = [SXMosaicGalleryColumnLayout alloc];
    -[SXMosaicGalleryLayouter width](self, "width");
    v7 = -[SXMosaicGalleryColumnLayout initWithWidth:gutter:](v6, "initWithWidth:gutter:");
    columnLayout = self->_columnLayout;
    self->_columnLayout = v7;

    v9 = -[SXMosaicGalleryLayouter numberOfItems](self, "numberOfItems");
    v10 = v9;
    if (v9 >= 3)
      v11 = 3;
    else
      v11 = v9;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 0;
    while (1)
    {
      objc_msgSend(v35, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v14, "rangeValue");
        v18 = v17;
      }
      else
      {
        v16 = 0;
        v18 = 0;
      }
      -[SXMosaicGalleryLayouter clusterForItemsInRange:](self, "clusterForItemsInRange:", v13, v11);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if ((v19 == 0) | v12 & 1)
        break;
      v21 = v13 + v11;
      if (v11 != 1 || v21 != v10 || v18 != 3 || v10 < 4)
        goto LABEL_17;
      -[SXMosaicGalleryLayouter clusters](self, "clusters");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXMosaicGalleryLayouter clusters](self, "clusters");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObject:", v24);

      -[SXMosaicGalleryLayouter layouts](self, "layouts");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXMosaicGalleryLayouter layouts](self, "layouts");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v27);

      v12 = 1;
      v13 = v16;
      v28 = 2;
LABEL_19:
      if (v28 >= v10 - v13)
        v11 = v10 - v13;
      else
        v11 = v28;

      if (v10 <= v13)
      {

        return;
      }
    }
    if (v19)
    {
      v21 = v13 + v11;
LABEL_17:
      -[SXMosaicGalleryLayouter layouts](self, "layouts");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXMosaicGalleryLayouter layoutForCluster:previousLayouts:](self, "layoutForCluster:previousLayouts:", v20, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v13, v11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v31);

      -[SXMosaicGalleryLayouter layouts](self, "layouts");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v30);

      -[SXMosaicGalleryLayouter clusters](self, "clusters");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v20);

      v13 = v21;
    }
    else
    {
      if ((v12 & 1) == 0)
        goto LABEL_28;
      v34 = v10 - v13;
      if (v10 - v13 >= 3)
        v34 = 3;
      if (v11 == v34)
      {
LABEL_28:
        v28 = v11 - 1;
        goto LABEL_19;
      }
      v12 = 1;
    }
    v28 = 3;
    goto LABEL_19;
  }
}

- (void)layoutGalleryOnView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  double v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  -[SXMosaicGalleryLayouter columnLayout](self, "columnLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gutter");
  v6 = v5;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[SXMosaicGalleryLayouter layouts](self, "layouts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v38)
  {
    v42 = 0;
    v37 = *(_QWORD *)v48;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v9, "cluster");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = v11;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v12)
        {
          v13 = v12;
          v39 = i;
          v14 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v44 != v14)
                objc_enumerationMutation(v40);
              v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              objc_msgSend(v9, "cluster");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "items");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "indexOfObject:", v16);

              objc_msgSend(v9, "frameForItemAtIndex:", v19);
              v21 = v20;
              v23 = v22;
              v25 = v24;
              v27 = v7 + v26;
              -[SXMosaicGalleryLayouter frames](self, "frames");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v21, v27, v23, v25);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "replaceObjectAtIndex:withObject:", v42 + j, v29);

              -[SXMosaicGalleryLayouter viewForItem:](self, "viewForItem:", v16);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXMosaicGalleryLayouter items](self, "items");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "indexOfObject:", v16);

              -[SXMosaicGalleryLayouter dataSource](self, "dataSource");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v32) = objc_msgSend(v33, "galleryLayouter:viewIsCurrentlyFullscreenForItemAtIndex:", self, v32);

              if ((v32 & 1) == 0)
              {
                objc_msgSend(v30, "setFrame:", v21, v27, v23, v25);
                objc_msgSend(v30, "superview");
                v34 = (id)objc_claimAutoreleasedReturnValue();

                if (v34 != v41)
                  objc_msgSend(v41, "addSubview:", v30);
              }

            }
            v13 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            v42 += j;
          }
          while (v13);
          i = v39;
        }

        objc_msgSend(v9, "height");
        v7 = v7 + v6 + v35;
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v38);
  }

}

- (CGSize)contentSize
{
  double width;
  double height;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  v22 = *MEMORY[0x24BDAC8D0];
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[SXMosaicGalleryLayouter columnLayout](self, "columnLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gutter");
    v8 = v7;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[SXMosaicGalleryLayouter layouts](self, "layouts", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "height");
          v13 = v8 + v13 + v15;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 0.0;
    }

    height = v13 - v8;
    -[SXMosaicGalleryLayouter width](self, "width");
    self->_contentSize.width = width;
    self->_contentSize.height = height;
  }
  v16 = height;
  result.height = v16;
  result.width = width;
  return result;
}

- (CGRect)frameForItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[SXMosaicGalleryLayouter frames](self, "frames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v8 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    objc_msgSend(v5, "CGRectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)viewForItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SXMosaicGalleryLayouter views](self, "views");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)supportedTileTypeClusters
{
  NSArray *supportedTileTypeClusters;

  supportedTileTypeClusters = self->_supportedTileTypeClusters;
  if (!supportedTileTypeClusters)
  {
    self->_supportedTileTypeClusters = (NSArray *)&unk_24D7031A0;

    supportedTileTypeClusters = self->_supportedTileTypeClusters;
  }
  return supportedTileTypeClusters;
}

- (id)clusterForItemsInRange:(_NSRange)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  SXMosaicGalleryCluster *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[SXMosaicGalleryLayouter itemsForRange:](self, "itemsForRange:", a3.location, a3.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "tileType", (_QWORD)v17);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[SXMosaicGalleryLayouter supportedTileTypeClusters](self, "supportedTileTypeClusters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v5);

  if (v14)
    v15 = -[SXMosaicGalleryCluster initWithItems:]([SXMosaicGalleryCluster alloc], "initWithItems:", v6);
  else
    v15 = 0;

  return v15;
}

- (id)layoutForCluster:(id)a3 previousLayouts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  objc_class *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v7, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SXMosaicGalleryLayouter reverseNextHorizontalLivingRoomLayout](self, "reverseNextHorizontalLivingRoomLayout");
  v12 = (objc_class *)objc_opt_class();
  if (v9 == 2)
  {
    if ((objc_msgSend(v6, "clusterIsEqualToTileTypes:", &unk_24D7031D0) & 1) == 0
      && !objc_msgSend(v6, "clusterIsEqualToTileTypes:", &unk_24D7031E8))
    {
      goto LABEL_15;
    }
  }
  else
  {
    if (v9 != 3)
      goto LABEL_17;
    if (objc_msgSend(v6, "isClusterOfType:", 3))
    {
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[SXMosaicGalleryLayouter dataSource](self, "dataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "documentColumnLayoutForGalleryLayouter:", self);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "constrainedViewportSize");
        v16 = v15;
        objc_msgSend(v14, "constrainedViewportSize");
        if (v16 <= v17)
          v9 = 3;
        else
          v9 = 2;
        v12 = (objc_class *)objc_opt_class();

        goto LABEL_17;
      }
    }
    if (objc_msgSend(v6, "clusterIsEqualToTileTypes:", &unk_24D7031B8))
    {
      v12 = (objc_class *)objc_opt_class();
LABEL_15:
      v9 = 2;
      goto LABEL_17;
    }
  }
  v9 = 3;
LABEL_17:
  v18 = [v12 alloc];
  -[SXMosaicGalleryLayouter columnLayout](self, "columnLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithCluster:numberOfColumns:columnLayout:", v6, v9, v19);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "setReverseLayout:", v11);
    -[SXMosaicGalleryLayouter setReverseNextHorizontalLivingRoomLayout:](self, "setReverseNextHorizontalLivingRoomLayout:", v11 ^ 1);
  }

  return v20;
}

- (id)itemsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (location < location + length)
  {
    do
    {
      -[SXMosaicGalleryLayouter itemAtIndex:](self, "itemAtIndex:", location);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      ++location;
      --length;
    }
    while (length);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)itemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SXMosaicGalleryLayoutItem *v14;
  void *v15;

  -[SXMosaicGalleryLayouter items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    -[SXMosaicGalleryLayouter dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "galleryLayouter:dimensionsForItemAtIndex:", self, a3);
    v11 = v10;
    v13 = v12;

    v14 = -[SXMosaicGalleryLayoutItem initWithDimensions:]([SXMosaicGalleryLayoutItem alloc], "initWithDimensions:", v11, v13);
    -[SXMosaicGalleryLayouter items](self, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceObjectAtIndex:withObject:", a3, v14);

    v6 = v14;
  }
  return v6;
}

- (unint64_t)numberOfItems
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *items;
  NSMutableArray *v6;
  NSMutableArray *frames;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *views;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;

  if (self->_numberOfItems == -1)
  {
    -[SXMosaicGalleryLayouter dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numberOfItems = objc_msgSend(v3, "numberOfItemsForGalleryLayouter:", self);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_numberOfItems);
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    items = self->_items;
    self->_items = v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_numberOfItems);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    frames = self->_frames;
    self->_frames = v6;

    if (self->_numberOfItems)
    {
      v8 = 0;
      do
      {
        -[SXMosaicGalleryLayouter items](self, "items");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        -[SXMosaicGalleryLayouter frames](self, "frames");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        ++v8;
      }
      while (v8 < self->_numberOfItems);
    }
    -[SXMosaicGalleryLayouter views](self, "views");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_numberOfItems);
      v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      views = self->_views;
      self->_views = v14;

    }
    -[SXMosaicGalleryLayouter views](self, "views");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v18 = -[SXMosaicGalleryLayouter numberOfItems](self, "numberOfItems");

    if (v17 < v18)
    {
      do
      {
        -[SXMosaicGalleryLayouter views](self, "views");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v20);

        -[SXMosaicGalleryLayouter views](self, "views");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");
        v23 = -[SXMosaicGalleryLayouter numberOfItems](self, "numberOfItems");

      }
      while (v22 < v23);
    }
    while (1)
    {
      -[SXMosaicGalleryLayouter views](self, "views");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");
      v27 = -[SXMosaicGalleryLayouter numberOfItems](self, "numberOfItems");

      if (v26 <= v27)
        break;
      -[SXMosaicGalleryLayouter views](self, "views");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeLastObject");

    }
  }
  return self->_numberOfItems;
}

- (id)viewForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[SXMosaicGalleryLayouter items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[SXMosaicGalleryLayouter views](self, "views");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    -[SXMosaicGalleryLayouter dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "galleryLayouter:viewForItemAtIndex:", self, v6);
    v12 = objc_claimAutoreleasedReturnValue();

    -[SXMosaicGalleryLayouter views](self, "views");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v6, v12);

    v8 = (void *)v12;
  }
  return v8;
}

- (void)resetLayout
{
  SXMosaicGalleryColumnLayout *columnLayout;
  NSArray *supportedTileTypeClusters;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_numberOfItems = -1;
  self->_contentSize = (CGSize)*MEMORY[0x24BDBF148];
  columnLayout = self->_columnLayout;
  self->_columnLayout = 0;

  supportedTileTypeClusters = self->_supportedTileTypeClusters;
  self->_supportedTileTypeClusters = 0;

  -[SXMosaicGalleryLayouter setReverseNextHorizontalLivingRoomLayout:](self, "setReverseNextHorizontalLivingRoomLayout:", 0);
  -[SXMosaicGalleryLayouter items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[SXMosaicGalleryLayouter layouts](self, "layouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[SXMosaicGalleryLayouter clusters](self, "clusters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[SXMosaicGalleryLayouter frames](self, "frames");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (SXMosaicGalleryLayouterDataSource)dataSource
{
  return (SXMosaicGalleryLayouterDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (SXMosaicGalleryColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (NSMutableArray)layouts
{
  return self->_layouts;
}

- (NSMutableArray)clusters
{
  return self->_clusters;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (NSMutableArray)views
{
  return self->_views;
}

- (NSMutableArray)frames
{
  return self->_frames;
}

- (BOOL)reverseNextHorizontalLivingRoomLayout
{
  return self->_reverseNextHorizontalLivingRoomLayout;
}

- (void)setReverseNextHorizontalLivingRoomLayout:(BOOL)a3
{
  self->_reverseNextHorizontalLivingRoomLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_supportedTileTypeClusters, 0);
}

@end
