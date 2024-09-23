@implementation CHRecentAndRelevantAchievementsCollectionViewFlowLayout

- (id)_transformAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double height;
  void *v14;
  void *v15;
  double v16;
  double width;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  double x;
  double y;
  void *v25;
  unsigned int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v4 = objc_msgSend(a3, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantAchievementsCollectionViewFlowLayout collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantAchievementsCollectionViewFlowLayout collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSource"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantAchievementsCollectionViewFlowLayout collectionView](self, "collectionView"));
  objc_msgSend(v6, "collectionView:layout:referenceSizeForHeaderInSection:", v9, self, 0);
  v11 = v10;
  height = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantAchievementsCollectionViewFlowLayout collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  objc_msgSend(v6, "collectionView:layout:sizeForItemAtIndexPath:", v14, self, v15);
  width = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantAchievementsCollectionViewFlowLayout collectionView](self, "collectionView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));
  v20 = objc_msgSend(v8, "collectionView:numberOfItemsInSection:", v18, objc_msgSend(v19, "section"));

  if (!objc_msgSend(v4, "representedElementCategory"))
  {
    objc_msgSend(v4, "frame");
    width = v31;
    y = height;
    x = v32 - v11;
    height = v33;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "representedElementCategory") == (id)1)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representedElementKind"));
    v22 = objc_msgSend(v21, "isEqualToString:", UICollectionElementKindSectionHeader);

    if (v22)
    {
      if (v20)
      {
        objc_msgSend(v4, "frame");
LABEL_14:
        objc_msgSend(v4, "setFrame:", x, y, width, height);
        goto LABEL_15;
      }
LABEL_13:
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      goto LABEL_14;
    }
  }
  if (objc_msgSend(v4, "representedElementCategory") == (id)1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representedElementKind"));
    v26 = objc_msgSend(v25, "isEqualToString:", UICollectionElementKindSectionFooter);

    if (v26)
    {
      if (v20)
      {
        objc_msgSend(v4, "frame");
        v28 = v27;
        v30 = v29;
        if (qword_10083DFC8 != -1)
          dispatch_once(&qword_10083DFC8, &stru_1007799C0);
        x = v28 - v11;
        width = *(double *)&qword_10083DFC0;
        height = v30 + -32.0;
        y = 16.0;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
LABEL_15:

  return v4;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v18.receiver = self;
  v18.super_class = (Class)CHRecentAndRelevantAchievementsCollectionViewFlowLayout;
  v4 = -[CHRecentAndRelevantAchievementsCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v18, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantAchievementsCollectionViewFlowLayout _transformAttributes:](self, "_transformAttributes:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), (_QWORD)v14));
        objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHRecentAndRelevantAchievementsCollectionViewFlowLayout;
  v4 = -[CHRecentAndRelevantAchievementsCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v8, "layoutAttributesForItemAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantAchievementsCollectionViewFlowLayout _transformAttributes:](self, "_transformAttributes:", v5));

  return v6;
}

@end
