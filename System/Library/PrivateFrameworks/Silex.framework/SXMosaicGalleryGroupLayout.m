@implementation SXMosaicGalleryGroupLayout

- (SXMosaicGalleryGroupLayout)init
{
  return -[SXMosaicGalleryGroupLayout initWithCluster:numberOfColumns:columnLayout:](self, "initWithCluster:numberOfColumns:columnLayout:", 0, 0, 0);
}

- (SXMosaicGalleryGroupLayout)initWithCluster:(id)a3 numberOfColumns:(unint64_t)a4 columnLayout:(id)a5
{
  id v9;
  id v10;
  SXMosaicGalleryGroupLayout *v11;
  SXMosaicGalleryGroupLayout *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SXMosaicGalleryGroupLayout;
  v11 = -[SXMosaicGalleryGroupLayout init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cluster, a3);
    objc_storeStrong((id *)&v12->_columnLayout, a5);
    v12->_height = 1.79769313e308;
    v12->_numberOfColumns = a4;
  }

  return v12;
}

- (CGRect)frameForItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
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
  CGRect result;

  -[SXMosaicGalleryGroupLayout frames](self, "frames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)height
{
  double result;

  result = self->_height;
  if (result == 1.79769313e308)
  {
    -[SXMosaicGalleryGroupLayout calculateHeight](self, "calculateHeight");
    self->_height = result;
  }
  return result;
}

- (NSArray)frames
{
  NSArray *frames;
  NSArray *v4;
  NSArray *v5;

  frames = self->_frames;
  if (!frames)
  {
    -[SXMosaicGalleryGroupLayout calculateFrames](self, "calculateFrames");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_frames;
    self->_frames = v4;

    frames = self->_frames;
  }
  return frames;
}

- (double)calculateHeight
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  double v12;
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
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    v9 = 1.79769313e308;
    v10 = 2.22507386e-308;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        -[SXMosaicGalleryGroupLayout desiredHeightForItem:](self, "desiredHeightForItem:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        if (v9 >= v12)
          v9 = v12;
        if (v10 < v12)
          v10 = v12;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v7);

    v13 = 0.0;
    if (v9 <= v10)
    {
      v14 = 1.79769313e308;
      do
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        -[SXMosaicGalleryGroupLayout cluster](self, "cluster", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "items");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        v18 = 0.0;
        if (v17)
        {
          v19 = v17;
          v20 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v36 != v20)
                objc_enumerationMutation(v16);
              v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
              v23 = -[SXMosaicGalleryGroupLayout columnRangeForItem:](self, "columnRangeForItem:", v22);
              v25 = v24;
              -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "widthForColumnRange:numberOfColumns:", v23, v25, v3);
              v28 = v27;

              objc_msgSend(v22, "aspectRatio");
              v30 = v28 + -v9 * v29;
              if (v30 >= 0.0)
                v31 = v30;
              else
                v31 = -v30;
              -[SXMosaicGalleryGroupLayout desiredHeightForItem:](self, "desiredHeightForItem:", v22);
              v33 = v9 - v32;
              if (v33 < 0.0)
                v33 = -v33;
              if (v33 < 1.0)
                v33 = 1.0;
              v18 = v18 + v31 * v33 * (v31 * v33);
            }
            v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v19);
        }

        if (v14 >= v18)
          v14 = v18;
        if (v14 == v18)
          v13 = v9;
        v9 = v9 + 1.0;
      }
      while (v9 <= v10);
    }
  }
  else
  {

    return 0.0;
  }
  return v13;
}

- (id)calculateFrames
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

      ++v7;
      -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "items");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v7 < v15);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (double)desiredHeightForItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  v5 = -[SXMosaicGalleryGroupLayout columnRangeForItem:](self, "columnRangeForItem:", v4);
  v7 = v6;
  objc_msgSend(v4, "aspectRatio");
  v9 = v8;

  -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widthForColumnRange:numberOfColumns:", v5, v7, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
  v12 = v11;

  return round(v12 / v9);
}

- (_NSRange)columnRangeForItem:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = 0;
  v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSMutableArray)columnRanges
{
  NSMutableArray *columnRanges;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSMutableArray *v13;

  columnRanges = self->_columnRanges;
  if (!columnRanges)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v4, "addObject:", v9);

        ++v8;
        -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

      }
      while (v8 < v12);
    }
    v13 = self->_columnRanges;
    self->_columnRanges = v4;

    columnRanges = self->_columnRanges;
  }
  return columnRanges;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (SXMosaicGalleryCluster)cluster
{
  return self->_cluster;
}

- (SXMosaicGalleryColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnLayout, 0);
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_columnRanges, 0);
}

@end
