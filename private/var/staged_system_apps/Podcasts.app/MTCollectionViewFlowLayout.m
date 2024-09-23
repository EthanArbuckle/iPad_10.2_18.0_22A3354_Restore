@implementation MTCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class(MTCollectionViewFlowLayoutAttributes, a2);
}

- (MTCollectionViewFlowLayout)init
{
  MTCollectionViewFlowLayout *v2;
  MTCollectionViewFlowLayout *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[3];
  _QWORD v8[3];

  v6.receiver = self;
  v6.super_class = (Class)MTCollectionViewFlowLayout;
  v2 = -[MTCollectionViewFlowLayout init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MTBaseCollectionViewFlowLayout setNumberOfColumns:](v2, "setNumberOfColumns:", 1);
    v7[0] = UIFlowLayoutCommonRowHorizontalAlignmentKey;
    v7[1] = UIFlowLayoutLastRowHorizontalAlignmentKey;
    v8[0] = &off_1004D5E78;
    v8[1] = &off_1004D5E78;
    v7[2] = UIFlowLayoutRowVerticalAlignmentKey;
    v8[2] = &off_1004D5E90;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
    -[MTCollectionViewFlowLayout _setRowAlignmentsOptions:](v3, "_setRowAlignmentsOptions:", v4);

    -[MTCollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", kMTCollectionViewInterItemSpacing);
    -[MTCollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", kMTCollectionViewInterLineSpacing);
    -[MTCollectionViewFlowLayout setSectionInset:](v3, "setSectionInset:", kMTCollectionViewVerticalSectionInset, 0.0, kMTCollectionViewVerticalSectionInset, 0.0);
  }
  return v3;
}

- (BOOL)updateAttributes:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  double v30;
  void *v31;
  char *v32;
  char *v33;
  void *v34;
  double Width;
  double v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  BOOL v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  BOOL v55;
  void *v56;
  id v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double MaxY;
  double v68;
  unint64_t v70;
  id v71;
  unint64_t v72;
  id v73;
  objc_super v74;
  objc_super v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v7, "section"));

  if (v8 >= v10)
    goto LABEL_26;
  v11 = (unint64_t)objc_msgSend(v7, "row");
  v12 = v11 / -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");
  v13 = (unint64_t)objc_msgSend(v7, "row");
  v72 = v13 % -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");
  objc_msgSend(v6, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");
  v73 = v10;
  v71 = v8;
  v70 = v12;
  if (-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"))
  {
    v23 = 0;
    do
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v23 + v22 * v12, objc_msgSend(v7, "section")));
      v25 = objc_msgSend(v24, "item");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
      v27 = objc_msgSend(v26, "numberOfItemsInSection:", objc_msgSend(v7, "section"));

      if (v25 < v27 && objc_msgSend(v24, "compare:", v7))
      {
        v75.receiver = self;
        v75.super_class = (Class)MTCollectionViewFlowLayout;
        v28 = -[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v75, "layoutAttributesForItemAtIndexPath:", v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        objc_msgSend(v29, "frame");
        if (v30 < v17)
          v17 = v30;

      }
      ++v23;
    }
    while (v23 < -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"));
  }
  if (v72)
  {
    v8 = v71;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
    v32 = (char *)objc_msgSend(v31, "numberOfItemsInSection:", objc_msgSend(v7, "section")) - 1;
    v33 = (char *)objc_msgSend(v7, "row");

    v8 = v71;
    if (v32 == v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
      objc_msgSend(v34, "bounds");
      Width = CGRectGetWidth(v76);

      objc_msgSend(v6, "frame");
      v36 = CGRectGetWidth(v77);
      v37 = Width - v36 * (double)-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");
      -[MTCollectionViewFlowLayout minimumInteritemSpacing](self, "minimumInteritemSpacing");
      v15 = (v37 - v38 * (double)(-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") - 1)) * 0.5;
    }
  }
  objc_msgSend(v6, "setFrame:", v15, v17, v19, v21);
  objc_msgSend(v6, "setZIndex:", 1);
  v39 = objc_msgSend(v7, "section");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
  if (v39 != objc_msgSend(v40, "section"))
  {
LABEL_24:
    v10 = v73;
    goto LABEL_25;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
  v42 = objc_msgSend(v41, "compare:", v7);

  v10 = v73;
  if (!v42)
    goto LABEL_26;
  v43 = v8;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
  v45 = (unint64_t)objc_msgSend(v44, "row");
  v46 = v45 / -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
  v48 = (unint64_t)objc_msgSend(v47, "row");
  v49 = v48 % -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");

  v50 = v70 > v46;
  if (v70 != v46)
  {
    v8 = v43;
    v10 = v73;
    if (!v50 || v49 == v72)
      goto LABEL_26;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (_BYTE *)objc_msgSend(v7, "row")- (_BYTE *)-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"), objc_msgSend(v7, "section")));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v40));
    objc_msgSend(v6, "frame");
    v62 = v61;
    v64 = v63;
    v66 = v65;
    objc_msgSend(v60, "frame");
    MaxY = CGRectGetMaxY(v78);
    -[MTCollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
    objc_msgSend(v6, "setFrame:", v62, MaxY + v68, v64, v66);

    goto LABEL_24;
  }
  v10 = v73;
  v8 = v43;
  if (v49 != v72)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
    v52 = objc_msgSend(v51, "row");
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
    v54 = objc_msgSend(v53, "numberOfItemsInSection:", objc_msgSend(v7, "section"));

    v55 = v52 >= v54;
    v10 = v73;
    if (!v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
      v74.receiver = self;
      v74.super_class = (Class)MTCollectionViewFlowLayout;
      v57 = -[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v74, "layoutAttributesForItemAtIndexPath:", v56);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v57);

      v10 = v73;
      objc_msgSend(v6, "frame");
      v59 = v58;
      objc_msgSend(v40, "frame");
      objc_msgSend(v6, "setFrame:", v59);
LABEL_25:

    }
  }
LABEL_26:

  return v8 < v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTCollectionViewFlowLayout;
  v5 = -[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v8, "layoutAttributesForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") < 2)
    objc_msgSend(v6, "setZIndex:", 1);
  else
    -[MTCollectionViewFlowLayout updateAttributes:forIndexPath:](self, "updateAttributes:forIndexPath:", v6, v4);
  -[MTCollectionViewFlowLayout updateCellPresentationAttributes:](self, "updateCellPresentationAttributes:", v6);

  return v6;
}

- (id)superLayoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTCollectionViewFlowLayout;
  v8 = -[MTCollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v11, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double Width;
  double v15;
  double Height;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  char *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGRect v31;
  CGRect v32;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("MTUnplayedBackgroundCollectionReusableViewKind")))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", UICollectionElementKindSectionHeader, v7));
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    Width = v13;
    Height = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTCollectionViewFlowLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](MTCollectionViewFlowLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("MTUnplayedBackgroundCollectionReusableViewKind"), v7));
    objc_msgSend(v17, "setZIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "refreshControl"));
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "frame");
      Height = CGRectGetHeight(v31);
      objc_msgSend(v20, "frame");
      Width = CGRectGetWidth(v32);
    }
    objc_msgSend(v17, "setFrame:", v10, v12, Width, Height);

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7));
    if (v8)
    {
      -[MTBaseCollectionViewFlowLayout appliedYOffset](self, "appliedYOffset");
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
      v24 = (char *)objc_msgSend(v23, "numberOfSections") - 1;

      if (objc_msgSend(v7, "section") == v24)
      {
        v25 = 1.79769313e308;
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", (char *)objc_msgSend(v7, "section") + 1));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v26));
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "frame");
          v25 = v29;
        }
        else
        {
          v25 = 1.79769313e308;
        }

      }
      -[MTCollectionViewFlowLayout updateAttributes:withTopAlignmentGuide:andLastYOrigin:](self, "updateAttributes:withTopAlignmentGuide:andLastYOrigin:", v8, v22, v25);
      v8 = v8;
      v17 = v8;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  double MaxY;
  BOOL v41;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *k;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  double v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v68;
  objc_super v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  CGRect v86;
  CGRect v87;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v82.receiver = self;
  v82.super_class = (Class)MTCollectionViewFlowLayout;
  v8 = -[MTCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v82, "layoutAttributesForElementsInRect:");
  v68 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  v10 = objc_msgSend(v9, "numberOfSections") == 0;

  if (v10)
  {
    v66 = v68;
    v65 = v68;
  }
  else
  {
    v11 = objc_msgSend(v68, "mutableCopy");
    if (-[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") >= 2)
    {
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v79;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v79 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "representedElementKind"));
            v18 = v17 == 0;

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "indexPath"));
              -[MTCollectionViewFlowLayout updateAttributes:forIndexPath:](self, "updateAttributes:forIndexPath:", v16, v19);

            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
        }
        while (v13);
      }

    }
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v20 = v11;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v75 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "representedElementKind"));
          v26 = v25 == 0;

          if (v26)
            -[MTCollectionViewFlowLayout updateCellPresentationAttributes:](self, "updateCellPresentationAttributes:", v24);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      }
      while (v21);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
    if (v27)
    {
      v28 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") > 1;

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseCollectionViewFlowLayout expandedIndexPath](self, "expandedIndexPath"));
        v30 = (unint64_t)objc_msgSend(v29, "row");
        v31 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns");

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "indexPath"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
        v35 = (char *)objc_msgSend(v34, "numberOfItemsInSection:", objc_msgSend(v33, "section"));

        v36 = (unint64_t)objc_msgSend(v33, "item") + 1;
        if ((uint64_t)v36 < (uint64_t)v35)
        {
          v37 = v30 % v31;
          do
          {
            while (v36 % -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns") == v37)
            {
              if ((uint64_t)++v36 >= (uint64_t)v35)
                goto LABEL_33;
            }
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v36, objc_msgSend(v33, "section")));
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v38));
            objc_msgSend(v20, "addObject:", v39);
            objc_msgSend(v39, "frame");
            MaxY = CGRectGetMaxY(v86);
            v87.origin.x = x;
            v87.origin.y = y;
            v87.size.width = width;
            v87.size.height = height;
            v41 = MaxY < CGRectGetMaxY(v87);

          }
          while ((uint64_t)++v36 < (uint64_t)v35 && v41);
        }
LABEL_33:

      }
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v44 = v20;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v45; k = (char *)k + 1)
        {
          if (*(_QWORD *)v71 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)k);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "representedElementKind"));

          if (v49)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "indexPath"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v50, "section")));
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v48, v51);

          }
        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      }
      while (v45);
    }

    -[MTBaseCollectionViewFlowLayout appliedYOffset](self, "appliedYOffset");
    v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
    v55 = (uint64_t)objc_msgSend(v54, "numberOfSections");

    if (v55 >= 1)
    {
      v56 = v55 + 1;
      v57 = 1.79769313e308;
      while (1)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", v56 - 2));
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v56 - 2));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v59));

        if (v60)
          goto LABEL_48;
        v69.receiver = self;
        v69.super_class = (Class)MTCollectionViewFlowLayout;
        v61 = -[MTCollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v69, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", UICollectionElementKindSectionHeader, v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue(v61);
        if (v60)
          break;
LABEL_51:

        if ((unint64_t)--v56 <= 1)
          goto LABEL_52;
      }
      objc_msgSend(v44, "addObject:", v60);
LABEL_48:
      -[MTCollectionViewFlowLayout updateAttributes:withTopAlignmentGuide:andLastYOrigin:](self, "updateAttributes:withTopAlignmentGuide:andLastYOrigin:", v60, v53, v57);
      objc_msgSend(v60, "frame");
      if (v57 >= v62)
        v57 = v62;

      goto LABEL_51;
    }
LABEL_52:
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("MTUnplayedBackgroundCollectionReusableViewKind"), v63));
    objc_msgSend(v44, "addObject:", v64);
    v65 = objc_msgSend(v44, "copy");
    -[MTCollectionViewFlowLayout updateCachedLayoutAttributesForElementsInRect:](self, "updateCachedLayoutAttributesForElementsInRect:", v65);

    v66 = v68;
  }

  return v65;
}

- (void)updateCachedLayoutAttributesForElementsInRect:(id)a3
{
  id v4;
  objc_class *v5;
  objc_ivar *InstanceVariable;
  void *v7;
  id Ivar;
  void *v9;
  objc_class *v10;
  objc_ivar *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v4 = a3;
  v5 = (objc_class *)objc_opt_class(UICollectionView);
  InstanceVariable = class_getInstanceVariable(v5, "_collectionViewData");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  Ivar = object_getIvar(v7, InstanceVariable);
  v9 = (void *)objc_claimAutoreleasedReturnValue(Ivar);

  if (!v9)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    v34 = v33;
    v35 = CFSTR("Unable to retreive collection view data instance.");
    v36 = 373;
LABEL_26:
    objc_msgSend(v33, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m", v36, v35);

    goto LABEL_30;
  }
  v10 = NSClassFromString(CFSTR("UICollectionViewData"));
  if (!v10)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    v34 = v33;
    v35 = CFSTR("Unable to retreive collection view data class.");
    v36 = 379;
    goto LABEL_26;
  }
  v11 = class_getInstanceVariable(v10, "_supplementaryLayoutAttributes");
  v12 = object_getIvar(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13 && (v14 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", UICollectionElementKindSectionHeader));
    if (v15 && (v16 = objc_opt_class(NSMutableDictionary), (objc_opt_isKindOfClass(v15, v16) & 1) == 0))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
      objc_msgSend(v38, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m", 392, CFSTR("Unable to retreive cached supplementary layout attributes of kind header from collection view data."));

    }
    else if (objc_msgSend(v15, "count"))
    {
      v39 = v13;
      v40 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v41 = v4;
      v18 = v4;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v43 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "representedElementKind"));
            v25 = objc_msgSend(UICollectionElementKindSectionHeader, "isEqualToString:", v24);

            if (v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "indexPath"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v26));
              v28 = v27;
              if (v27 && (objc_msgSend(v27, "isEqual:", v23) & 1) == 0)
              {
                objc_msgSend(v15, "setObject:forKey:", v23, v26);
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v26, "section")));
                objc_msgSend(v17, "addObject:", v29);

              }
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v20);
      }

      if (objc_msgSend(v17, "count"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "componentsJoinedByString:", CFSTR(", ")));
        objc_msgSend(v30, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m", 422, CFSTR("Collection view data cache updated with new attributes for sections: %@"), v32);

      }
      v9 = v40;
      v4 = v41;
      v13 = v39;
    }

  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    objc_msgSend(v37, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/CollectionView/MTCollectionViewFlowLayout.m", 386, CFSTR("Unable to retreive cached supplementary layout attributes from collection view data."));

  }
LABEL_30:

}

- (void)updateCellPresentationAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "indexPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewFlowLayout collectionView](self, "collectionView"));
  v7 = (char *)objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v5, "section"));

  v8 = (unint64_t)(v7 - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "swipedCellIndexPath"));
  v10 = objc_msgSend(v9, "compare:", v5);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "swipedCellIndexPath"));
  if (v11)
    v12 = v10 == 0;
  else
    v12 = 0;
  v13 = v12;
  objc_msgSend(v20, "setOpen:", v13);

  objc_msgSend(v20, "setShowsSeperator:", 1);
  if (objc_msgSend(v5, "item") == (id)v8
    || (v14 = (unint64_t)objc_msgSend(v5, "item"),
        v15 = v14 / -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
        v16 = (unint64_t)objc_msgSend(v5, "item"),
        v17 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
        v18 = v8 / -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
        v19 = -[MTBaseCollectionViewFlowLayout numberOfColumns](self, "numberOfColumns"),
        v15 == v18 - 1)
    && v16 % v17 != v8 % v19
    || v15 == v18)
  {
    objc_msgSend(v20, "setShowsSeperator:", 0);
  }

}

- (void)updateAttributes:(id)a3 withTopAlignmentGuide:(double)a4 andLastYOrigin:(double)a5
{
  id v7;
  double v8;
  double x;
  double y;
  double width;
  double height;
  double MinY;
  uint64_t v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v7 = a3;
  if (v7)
  {
    v15 = v7;
    objc_msgSend(v7, "naturalRect");
    if (v8 == 0.0)
    {
      objc_msgSend(v15, "frame");
      objc_msgSend(v15, "setNaturalRect:");
    }
    objc_msgSend(v15, "frame");
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    if (CGRectGetMinY(v16) >= a4
      || (v17.origin.x = x,
          v17.origin.y = y,
          v17.size.width = width,
          v17.size.height = height,
          CGRectGetHeight(v17) + a4 >= a5))
    {
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      MinY = CGRectGetMinY(v18);
      if (a5 > a4 && MinY < a4)
      {
        v19.origin.x = x;
        v19.origin.y = y;
        v19.size.width = width;
        v19.size.height = height;
        y = a5 - CGRectGetHeight(v19);
        objc_msgSend(v15, "setFloating:", 1);
        objc_msgSend(v15, "setPartiallyOffTheTop:", 1);
      }
    }
    else
    {
      objc_msgSend(v15, "setFloating:", 1);
      y = a4;
    }
    objc_msgSend(v15, "setFrame:", x, y, width, height);
    if (objc_msgSend(v15, "isFloating"))
      v14 = 3;
    else
      v14 = 2;
    objc_msgSend(v15, "setZIndex:", v14);
    v7 = v15;
  }

}

@end
