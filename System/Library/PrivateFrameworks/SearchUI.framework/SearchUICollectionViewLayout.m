@implementation SearchUICollectionViewLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id obj;
  char *obja;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)SearchUICollectionViewLayout;
  -[SearchUICollectionViewLayout layoutAttributesForElementsInRect:](&v74, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewLayout snapshotConfiguration](self, "snapshotConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v59 = (void *)objc_opt_new();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v55 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v71 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "indexPath", v55);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "section"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "representedElementKind");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v11, "representedElementKind");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("SearchUIBackgroundReuseIdentifer"));

            if (v17)
              objc_msgSend(v59, "setObject:forKeyedSubscript:", v11, v14);
          }
          else
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              v19 = (void *)objc_opt_new();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v14);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v11);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
      }
      while (v8);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v21 = v6;
    v58 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    if (v58)
    {
      v56 = *(_QWORD *)v67;
      v57 = v21;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v67 != v56)
            objc_enumerationMutation(v21);
          obja = v22;
          v23 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v22);
          -[SearchUICollectionViewLayout _contentFrameForSection:](self, "_contentFrameForSection:", objc_msgSend(v23, "integerValue", v55));
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          objc_msgSend(v21, "objectForKeyedSubscript:", v23);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v63 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
                -[SearchUICollectionViewLayout snapshotConfiguration](self, "snapshotConfiguration");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "sectionIndexesForHeightMatching");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "containsObject:", v23);

                if (v40)
                  objc_msgSend((id)objc_opt_class(), "applyForcedMaxHeightToAttributes:maxHeight:", v37, v31);
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
            }
            while (v34);
          }

          objc_msgSend(v59, "objectForKeyedSubscript:", v23);
          v41 = objc_claimAutoreleasedReturnValue();
          v21 = v57;
          if (v41)
          {
            v42 = (void *)v41;
            objc_msgSend(v57, "objectForKeyedSubscript:", v23);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              objc_msgSend(v59, "objectForKeyedSubscript:", v23);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) != 0
                || (-[SearchUICollectionViewLayout snapshotConfiguration](self, "snapshotConfiguration"),
                    v45 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v45, "sectionIndexesUsingListLayout"),
                    v46 = (void *)objc_claimAutoreleasedReturnValue(),
                    v47 = objc_msgSend(v46, "containsObject:", v23),
                    v46,
                    v45,
                    v47))
              {
                objc_msgSend(v57, "objectForKeyedSubscript:", v23);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v48, "count"))
                {
                  objc_msgSend(v57, "objectForKeyedSubscript:", v23);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SearchUICollectionViewLayout sectionContentFrameFromCellAttributes:](self, "sectionContentFrameFromCellAttributes:", v49);
                  v25 = v50;
                  v27 = v51;
                  v29 = v52;
                  v31 = v53;

                }
              }
              objc_msgSend((id)objc_opt_class(), "applyForcedFrameToAttributes:frame:", v44, v25, v27, v29, v31);

            }
          }
          v22 = obja + 1;
        }
        while (obja + 1 != (char *)v58);
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      }
      while (v58);
    }

    v4 = v55;
  }
  return v4;
}

- (SearchUICollectionViewLayoutConfiguration)snapshotConfiguration
{
  return (SearchUICollectionViewLayoutConfiguration *)objc_getProperty(self, a2, 504, 1);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICollectionViewLayout;
  -[SearchUICollectionViewLayout layoutAttributesForItemAtIndexPath:](&v12, sel_layoutAttributesForItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewLayout snapshotConfiguration](self, "snapshotConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIndexesForHeightMatching");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    -[SearchUICollectionViewLayout _contentFrameForSection:](self, "_contentFrameForSection:", objc_msgSend(v4, "section"));
    objc_msgSend((id)objc_opt_class(), "applyForcedMaxHeightToAttributes:maxHeight:", v5, v10);
  }

  return v5;
}

- (void)setSizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sizingDelegate, a3);
}

- (void)invalidateLayoutWithContext:(id)a3
{
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICollectionViewLayout;
  -[SearchUICollectionViewLayout invalidateLayoutWithContext:](&v6, sel_invalidateLayoutWithContext_, a3);
  -[SearchUICollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
  if (v4 > 0.0)
  {
    -[SearchUICollectionViewLayout sizingDelegate](self, "sizingDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewLayout collectionViewContentSize](self, "collectionViewContentSize");
    objc_msgSend(v5, "contentSizeDidChange:");

  }
}

- (void)prepareLayout
{
  void *v3;
  SearchUICollectionViewLayoutConfiguration *v4;
  SearchUICollectionViewLayoutConfiguration *snapshotConfiguration;
  objc_super v6;

  -[SearchUICollectionViewLayout sizingDelegate](self, "sizingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSnapshotLayoutConfiguration");
  v4 = (SearchUICollectionViewLayoutConfiguration *)objc_claimAutoreleasedReturnValue();
  snapshotConfiguration = self->_snapshotConfiguration;
  self->_snapshotConfiguration = v4;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICollectionViewLayout;
  -[SearchUICollectionViewLayout prepareLayout](&v6, sel_prepareLayout);
}

- (SearchUICollectionViewSizingDelegate)sizingDelegate
{
  return (SearchUICollectionViewSizingDelegate *)objc_loadWeakRetained((id *)&self->_sizingDelegate);
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v26;

  v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SearchUICollectionViewLayout;
  -[SearchUICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v26, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "representedElementKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SearchUIBackgroundReuseIdentifer"));

  if (v9)
  {
    if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) != 0)
      goto LABEL_4;
    -[SearchUICollectionViewLayout snapshotConfiguration](self, "snapshotConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIndexesUsingListLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

    if (v13)
    {
LABEL_4:
      v14 = (void *)objc_opt_new();
      -[SearchUICollectionViewLayout collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "numberOfItemsInSection:", objc_msgSend(v6, "section"));

      if (v16 >= 1)
      {
        for (i = 0; i != v16; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, objc_msgSend(v6, "section"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUICollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v19);

        }
      }
      if (objc_msgSend(v14, "count"))
        -[SearchUICollectionViewLayout sectionContentFrameFromCellAttributes:](self, "sectionContentFrameFromCellAttributes:", v14);
      else
        -[SearchUICollectionViewLayout _contentFrameForSection:](self, "_contentFrameForSection:", objc_msgSend(v6, "section"));
      objc_msgSend((id)objc_opt_class(), "applyForcedFrameToAttributes:frame:", v7, v20, v21, v22, v23);

    }
    else
    {
      v24 = (void *)objc_opt_class();
      -[SearchUICollectionViewLayout _contentFrameForSection:](self, "_contentFrameForSection:", objc_msgSend(v6, "section"));
      objc_msgSend(v24, "applyForcedFrameToAttributes:frame:", v7);
    }
  }

  return v7;
}

+ (void)applyForcedFrameToAttributes:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "setFrame:", x, y, width, height);
  objc_msgSend(v8, "setIsForcingHeight:", 1);

}

+ (void)applyForcedMaxHeightToAttributes:(id)a3 maxHeight:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  double v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (v11 != 1.0
    || (objc_msgSend(v16, "representedElementKind"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("SearchUIBackgroundReuseIdentifer")),
        v13,
        v14))
  {
    if (v12 >= a4)
      v15 = v12;
    else
      v15 = a4;
    objc_msgSend(v16, "setFrame:", v6, v8, v10, v15);
    objc_msgSend(v16, "setIsForcingHeight:", 1);
  }

}

- (CGRect)sectionContentFrameFromCellAttributes:(id)a3
{
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect result;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
        objc_msgSend(v3, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "frame");
        v18 = v14;
        v19 = v15;
        v20 = v16;
        v21 = v17;
        if (v12 != v13)
        {
          v32.origin.x = v4;
          v32.origin.y = v5;
          v32.size.width = v6;
          v32.size.height = v7;
          *(CGRect *)&v14 = CGRectUnion(v32, *(CGRect *)&v18);
        }
        v4 = v14;
        v5 = v15;
        v6 = v16;
        v7 = v17;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  v22 = v4;
  v23 = v5;
  v24 = v6;
  v25 = v7;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_storeStrong((id *)&self->_snapshotConfiguration, 0);
}

@end
