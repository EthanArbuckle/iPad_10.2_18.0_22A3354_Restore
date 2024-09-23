@implementation SXMosaicGalleryHorizontalLivingRoomLayout

- (double)calculateHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[SXMosaicGalleryHorizontalLivingRoomLayout desiredHeightForLargeItem](self, "desiredHeightForLargeItem");
  v4 = v3;
  -[SXMosaicGalleryHorizontalLivingRoomLayout desiredHeightForSmallerItems](self, "desiredHeightForSmallerItems");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  if (v4 >= v5)
    v7 = v4;
  else
    v7 = v5;
  v8 = 0.0;
  if (v6 <= v7)
  {
    v9 = 1.79769313e308;
    do
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[SXMosaicGalleryGroupLayout cluster](self, "cluster", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v13 = 0.0;
      if (v12)
      {
        v14 = v12;
        v15 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v18 = -[SXMosaicGalleryHorizontalLivingRoomLayout columnRangeForItem:](self, "columnRangeForItem:", v17);
            v20 = v19;
            -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "widthForColumnRange:numberOfColumns:", v18, v20, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
            v23 = v22;

            objc_msgSend(v17, "aspectRatio");
            v25 = v23 + -v6 * v24;
            if (v25 >= 0.0)
              v26 = v25;
            else
              v26 = -v25;
            -[SXMosaicGalleryGroupLayout desiredHeightForItem:](self, "desiredHeightForItem:", v17);
            v28 = v6 - v27;
            if (v28 < 0.0)
              v28 = -v28;
            if (v28 < 1.0)
              v28 = 1.0;
            v13 = v13 + v26 * v28 * (v26 * v28);
          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v14);
      }

      if (v9 >= v13)
        v9 = v13;
      if (v9 == v13)
        v8 = v6;
      v6 = v6 + 1.0;
    }
    while (v6 <= v7);
  }
  return v8;
}

- (id)calculateFrames
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[SXMosaicGalleryGroupLayout cluster](self, "cluster", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    v9 = 0.0;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v11 = -[SXMosaicGalleryHorizontalLivingRoomLayout columnRangeForItem:](self, "columnRangeForItem:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v10));
        v13 = v12;
        v14 = -[SXMosaicGalleryHorizontalLivingRoomLayout columnRangeForLargeItem](self, "columnRangeForLargeItem");
        if (v13 == v15 && v11 == v14)
          v9 = 0.0;
        -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "widthForColumnRange:numberOfColumns:", v11, v13, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
        v19 = v18;

        -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "positionForColumnRange:numberOfColumns:", v11, v13, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
        v22 = v21;

        -[SXMosaicGalleryGroupLayout height](self, "height");
        v24 = v23;
        if (v11 == -[SXMosaicGalleryHorizontalLivingRoomLayout columnRangeForSmallerItems](self, "columnRangeForSmallerItems")&& v13 == v25)
        {
          -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "gutter");
          v24 = (v24 - v28) * 0.5;

        }
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v22, v9, v19, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v29);

        if (v11 == -[SXMosaicGalleryHorizontalLivingRoomLayout columnRangeForSmallerItems](self, "columnRangeForSmallerItems")&& v13 == v30)
        {
          -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "gutter");
          v9 = v9 + v24 + v32;

        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
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
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  NSUInteger v18;
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
    if (v7 == -[SXMosaicGalleryHorizontalLivingRoomLayout indexOfLargeItem](self, "indexOfLargeItem"))
      v13 = -[SXMosaicGalleryHorizontalLivingRoomLayout columnRangeForLargeItem](self, "columnRangeForLargeItem");
    else
      v13 = -[SXMosaicGalleryHorizontalLivingRoomLayout columnRangeForSmallerItems](self, "columnRangeForSmallerItems");
    v10 = v13;
    v12 = v14;
    -[SXMosaicGalleryGroupLayout columnRanges](self, "columnRanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v10, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v7, v16);

  }
  v17 = v10;
  v18 = v12;
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)columnRangeForSmallerItems
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns");
  if (-[SXMosaicGalleryHorizontalLivingRoomLayout reverseLayout](self, "reverseLayout"))
    v4 = 0;
  else
    v4 = v3 - 1;
  v5 = 1;
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)columnRangeForLargeItem
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns") - 1;
  v4 = -[SXMosaicGalleryHorizontalLivingRoomLayout reverseLayout](self, "reverseLayout");
  v5 = v3;
  result.length = v5;
  result.location = v4;
  return result;
}

- (double)desiredHeightForLargeItem
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", -[SXMosaicGalleryHorizontalLivingRoomLayout indexOfLargeItem](self, "indexOfLargeItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXMosaicGalleryGroupLayout desiredHeightForItem:](self, "desiredHeightForItem:", v5);
  v7 = v6;

  return v7;
}

- (double)desiredHeightForSmallerItems
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[SXMosaicGalleryHorizontalLivingRoomLayout reverseLayout](self, "reverseLayout") ^ 1;
  -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gutter");
  v6 = v5;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXMosaicGalleryGroupLayout cluster](self, "cluster", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subarrayWithRange:", v3, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[SXMosaicGalleryGroupLayout desiredHeightForItem:](self, "desiredHeightForItem:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v6 = v6 + v14;
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v6;
}

- (unint64_t)indexOfLargeItem
{
  if (-[SXMosaicGalleryHorizontalLivingRoomLayout reverseLayout](self, "reverseLayout"))
    return 2;
  else
    return 0;
}

- (BOOL)reverseLayout
{
  return self->_reverseLayout;
}

- (void)setReverseLayout:(BOOL)a3
{
  self->_reverseLayout = a3;
}

@end
