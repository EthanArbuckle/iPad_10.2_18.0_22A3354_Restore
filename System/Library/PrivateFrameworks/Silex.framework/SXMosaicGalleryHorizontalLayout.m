@implementation SXMosaicGalleryHorizontalLayout

- (id)calculateFrames
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = -[SXMosaicGalleryHorizontalLayout columnRangeForItem:](self, "columnRangeForItem:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10));
        v13 = v12;
        -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "positionForColumnRange:numberOfColumns:", v11, v13, v4);
        v16 = v15;

        -[SXMosaicGalleryGroupLayout columnLayout](self, "columnLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "widthForColumnRange:numberOfColumns:", v11, v13, v4);
        v19 = v18;

        -[SXMosaicGalleryGroupLayout height](self, "height");
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v16, 0.0, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v21);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
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
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSUInteger v23;
  NSUInteger v24;
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
    v13 = objc_msgSend(v4, "tileType");
    -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v17 = -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns");
    -[SXMosaicGalleryGroupLayout cluster](self, "cluster");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isClusterOfType:", v13);

    if ((v19 & 1) != 0)
    {
      v12 = 1;
      v10 = v7;
    }
    else if (v16 == 2)
    {
      if ((_DWORD)v13 == 3)
        v12 = 2;
      else
        v12 = (v13 - 1) < 2;
      v10 = (v17 - v12) * v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Unexpected cluster in horizontal layout"), CFSTR("The provided cluster contains three items of possibly different types"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "raise");

      v10 = 0;
      v12 = 0;
    }
    -[SXMosaicGalleryGroupLayout columnRanges](self, "columnRanges");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v10, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "replaceObjectAtIndex:withObject:", v7, v22);

  }
  v23 = v10;
  v24 = v12;
  result.length = v24;
  result.location = v23;
  return result;
}

@end
