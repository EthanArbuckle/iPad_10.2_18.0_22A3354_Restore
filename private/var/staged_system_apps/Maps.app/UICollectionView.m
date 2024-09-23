@implementation UICollectionView

- (void)_maps_reloadDataWithoutFocus
{
  unsigned __int8 v3;
  _QWORD v4[5];
  unsigned __int8 v5;

  v3 = -[UICollectionView remembersLastFocusedIndexPath](self, "remembersLastFocusedIndexPath");
  -[UICollectionView setRemembersLastFocusedIndexPath:](self, "setRemembersLastFocusedIndexPath:", 0);
  -[UICollectionView reloadData](self, "reloadData");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002A931C;
  v4[3] = &unk_1011ACE58;
  v4[4] = self;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (CGSize)_maps_contentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v2, "collectionViewContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)_maps_rectForHeaderInSection:(int64_t)a3
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self, "collectionViewLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", UICollectionElementKindSectionHeader, v5));

  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

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

- (CGRect)_maps_rectForRowAtIndexPath:(id)a3
{
  id v4;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self, "collectionViewLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v4));

  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

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

- (void)_maps_commitUpdates
{
  -[UICollectionView performBatchUpdates:completion:](self, "performBatchUpdates:completion:", 0, 0);
}

- (int64_t)_maps_indexOfFirstNonEmptySection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  int64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dataSource](self, "dataSource"));

  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dataSource](self, "dataSource"));
  v5 = objc_opt_class(UICollectionViewDiffableDataSource);
  objc_opt_isKindOfClass(v4, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifiers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((uint64_t)objc_msgSend(v7, "numberOfItemsInSection:", v13) > 0)
        {
          v14 = (int64_t)objc_msgSend(v7, "indexOfSectionIdentifier:", v13);
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v14;
}

- (BOOL)_maps_shouldShowTopHairline
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double y;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  double v27;
  double v28;
  double MaxY;
  uint64_t v30;
  CGRect v32;

  v3 = objc_claimAutoreleasedReturnValue(-[UICollectionView dataSource](self, "dataSource"));
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[UICollectionView contentOffset](self, "contentOffset");
  v6 = v5;
  v8 = v7;
  y = CGPointZero.y;

  if (v6 == CGPointZero.x && v8 == y)
    return 0;
  v11 = -[UICollectionView _maps_indexOfFirstNonEmptySection](self, "_maps_indexOfFirstNonEmptySection");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "snapshot"));
  v14 = objc_msgSend(v13, "numberOfSections");
  v15 = 0;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < (uint64_t)v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v11));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView supplementaryViewForElementKind:atIndexPath:](self, "supplementaryViewForElementKind:atIndexPath:", UICollectionElementKindSectionHeader, v16));

    objc_msgSend(v17, "frame");
    if (v21 == 0.0)
    {
      v15 = 1;
    }
    else
    {
      v22 = v18;
      v23 = v19;
      v24 = v20;
      v25 = v21;
      -[UICollectionView contentOffset](self, "contentOffset");
      v28 = UIRoundToViewScale(self, v26, v27);
      v32.origin.x = v22;
      v32.origin.y = v23;
      v32.size.width = v24;
      v32.size.height = v25;
      MaxY = CGRectGetMaxY(v32);
      v15 = v28 >= UIRoundToViewScale(self, v30, MaxY);
    }

  }
  return v15;
}

- (void)_maps_scrollContentToOriginalPosition
{
  -[UICollectionView setContentOffset:animated:](self, "setContentOffset:animated:", 0, CGPointZero.x, CGPointZero.y);
}

@end
