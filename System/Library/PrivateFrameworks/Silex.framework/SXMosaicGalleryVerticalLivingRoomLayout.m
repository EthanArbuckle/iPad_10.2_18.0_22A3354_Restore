@implementation SXMosaicGalleryVerticalLivingRoomLayout

- (SXMosaicGalleryVerticalLivingRoomLayout)initWithCluster:(id)a3 numberOfColumns:(unint64_t)a4 columnLayout:(id)a5
{
  SXMosaicGalleryVerticalLivingRoomLayout *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXMosaicGalleryVerticalLivingRoomLayout;
  result = -[SXMosaicGalleryGroupLayout initWithCluster:numberOfColumns:columnLayout:](&v6, sel_initWithCluster_numberOfColumns_columnLayout_, a3, a4, a5);
  if (result)
  {
    result->_largeItemHeight = 1.79769313e308;
    result->_smallItemHeight = 1.79769313e308;
  }
  return result;
}

- (double)calculateHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SXMosaicGalleryVerticalLivingRoomLayout largeItemHeight](self, "largeItemHeight");
  v4 = v3;
  -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gutter");
  v7 = v4 + v6;
  -[SXMosaicGalleryVerticalLivingRoomLayout smallItemHeight](self, "smallItemHeight");
  v9 = v7 + v8;

  return v9;
}

- (id)calculateFrames
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SXMosaicGalleryGroupLayout cluster](self, "cluster", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v11 = -[SXMosaicGalleryVerticalLivingRoomLayout columnRangeForItem:](self, "columnRangeForItem:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v12 = v10;
        if (v10 == 1)
        {
          -[SXMosaicGalleryVerticalLivingRoomLayout smallItemHeight](self, "smallItemHeight");
          v15 = v16;
          -[SXMosaicGalleryVerticalLivingRoomLayout largeItemHeight](self, "largeItemHeight");
          v18 = v17;
          -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "gutter");
          v13 = v18 + v20;

        }
        else
        {
          v13 = 0.0;
          if (v10 == 2)
          {
            -[SXMosaicGalleryVerticalLivingRoomLayout largeItemHeight](self, "largeItemHeight");
            v15 = v14;
          }
          else
          {
            v15 = 0.0;
          }
        }
        -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "widthForColumnRange:numberOfColumns:", v11, v12, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
        v23 = v22;

        -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "positionForColumnRange:numberOfColumns:", v11, v12, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
        v26 = v25;

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v26, v13, v23, v15);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v27);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (_NSRange)columnRangeForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  v4 = a3;
  -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  -[SXMosaicGalleryGroupLayout columnRanges](self, "columnRanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeValue");
  v12 = v11;

  if (!(v10 | v12))
  {
    if (v7)
      v10 = v7 - 1;
    else
      v10 = 0;
    if (v7)
      v12 = 1;
    else
      v12 = 2;
    -[SXMosaicGalleryGroupLayout columnRanges](self, "columnRanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v7, v14);

  }
  v15 = v10;
  v16 = v12;
  result.length = v16;
  result.location = v15;
  return result;
}

- (double)largeItemHeight
{
  double result;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  result = self->_largeItemHeight;
  if (result == 1.79769313e308)
  {
    -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXMosaicGalleryGroupLayout desiredHeightForItem:](self, "desiredHeightForItem:", v6);
    self->_largeItemHeight = v7;

    return self->_largeItemHeight;
  }
  return result;
}

- (double)smallItemHeight
{
  double smallItemHeight;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  smallItemHeight = self->_smallItemHeight;
  if (smallItemHeight == 1.79769313e308)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subarrayWithRange:", 1, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      v10 = 1.79769313e308;
      v11 = 2.22507386e-308;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v6);
          -[SXMosaicGalleryGroupLayout desiredHeightForItem:](self, "desiredHeightForItem:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          if (v10 >= v13)
            v10 = v13;
          if (v11 < v13)
            v11 = v13;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v8);

      smallItemHeight = 0.0;
      if (v10 <= v11)
      {
        v14 = 1.79769313e308;
        do
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          -[SXMosaicGalleryGroupLayout cluster](self, "cluster", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "items");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          v18 = 0.0;
          if (v17)
          {
            v19 = v17;
            v20 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v32 != v20)
                  objc_enumerationMutation(v16);
                v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
                v23 = -[SXMosaicGalleryVerticalLivingRoomLayout columnRangeForItem:](self, "columnRangeForItem:", v22);
                v25 = v24;
                -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "widthForColumnRange:numberOfColumns:", v23, v25, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
                v28 = v27;

                objc_msgSend(v22, "aspectRatio");
                v18 = v18 + (v28 + -v10 * v29) * (v28 + -v10 * v29);
              }
              v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v19);
          }

          if (v14 >= v18)
            v14 = v18;
          if (v14 == v18)
            smallItemHeight = v10;
          v10 = v10 + 1.0;
        }
        while (v10 <= v11);
      }
    }
    else
    {

      smallItemHeight = 0.0;
    }
    self->_smallItemHeight = smallItemHeight;
  }
  return smallItemHeight;
}

@end
