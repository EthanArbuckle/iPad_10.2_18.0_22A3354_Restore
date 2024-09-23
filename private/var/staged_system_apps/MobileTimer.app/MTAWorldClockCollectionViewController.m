@implementation MTAWorldClockCollectionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAWorldClockCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  MTAWorldClockCollectionViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockCollectionViewController;
  result = -[MTAWorldClockCollectionViewController initWithCollectionViewLayout:](&v4, "initWithCollectionViewLayout:", a3);
  if (result)
    result->_cellHeight = -1.0;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTAWorldClockCollectionViewController;
  -[MTAWorldClockCollectionViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "setPagingEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "setIndicatorStyle:", 2);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MTAWorldClockCollectionCell), CFSTR("WorldClockCollectionCellTileReuseIdentifier"));

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockCollectionViewController;
  -[MTAWorldClockCollectionViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[MTAWorldClockCollectionViewController setInstallsStandardGestureForInteractiveMovement:](self, "setInstallsStandardGestureForInteractiveMovement:", 1);
}

- (void)handleContentSizeChange
{
  id v3;

  self->_cellHeight = -1.0;
  -[MTAWorldClockCollectionViewController updateCollectionViewLayout](self, "updateCollectionViewLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v3, "invalidateLayout");

}

- (void)updateCollectionViewLayout
{
  void *v3;
  char *v4;
  void *v5;
  _BOOL4 IsAccessibilityCategory;
  NSComparisonResult v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  float v15;
  float v16;
  void *v17;
  NSString *category;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = (char *)objc_msgSend(v3, "orientation") - 3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  category = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(category);
  v7 = UIContentSizeCategoryCompareToCategory(category, UIContentSizeCategoryAccessibilityLarge);
  v8 = 2;
  if (!IsAccessibilityCategory)
    v8 = 3;
  if (v7 == NSOrderedDescending)
    v9 = 1;
  else
    v9 = v8;
  if (IsAccessibilityCategory)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    objc_msgSend(v10, "_scaledValueForValue:", 150.0);
    v12 = v11;

  }
  else
  {
    v12 = 225.0;
  }
  if ((unint64_t)v4 >= 2)
  {
    v16 = (float)v9;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController view](self, "view"));
    objc_msgSend(v13, "bounds");
    v15 = v14 / v12;
    v16 = floorf(v15);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v17, "setColumnsPerPage:", (unint64_t)v16);

}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTAWorldClockCollectionViewController;
  -[MTAWorldClockCollectionViewController setEditing:](&v15, "setEditing:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setEditing:animated:", v3, 1);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (void)scrollToPageContainingIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 0, v4);

}

- (double)cellHeight
{
  double result;

  result = self->_cellHeight;
  if (result < 0.0)
  {
    +[MTAWorldClockCollectionCell preferredHeight](MTAWorldClockCollectionCell, "preferredHeight");
    self->_cellHeight = result;
  }
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cities"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("WorldClockCollectionCellTileReuseIdentifier"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cities"));
  v9 = objc_msgSend(v5, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v9));
  objc_msgSend(v6, "setCity:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "city"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentView"));
  objc_msgSend(v13, "_setCornerRadius:", 15.0);

  objc_msgSend(v6, "start");
  return v6;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = objc_msgSend(a4, "row");
  v9 = objc_msgSend(v7, "row");
  v10 = (id)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  objc_msgSend(v10, "moveCityFromIndex:toIndex:", v8, v9);
  -[MTAWorldClockCollectionViewController scrollToPageContainingIndexPath:animated:](self, "scrollToPageContainingIndexPath:animated:", v7, 1);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "start");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setEditing:", -[MTAWorldClockCollectionViewController isEditing](self, "isEditing"));

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "stop");
  objc_msgSend(v5, "setDelegate:", 0);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double width;
  double height;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  int v25;
  MTAWorldClockCollectionViewController *v26;
  __int16 v27;
  id v28;
  CGSize result;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController view](self, "view"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  v15 = v9 == CGSizeZero.width && v11 == height;
  if (v15 || !objc_msgSend(v6, "columnsPerPage"))
  {
    v20 = MTLogForCategory(8, v12);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138543618;
      v26 = self;
      v27 = 2048;
      v28 = objc_msgSend(v6, "columnsPerPage");
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Either collectionViewSize or columnsPerPage: %lu is 0", (uint8_t *)&v25, 0x16u);
    }

  }
  else
  {
    v16 = (double)((unint64_t)objc_msgSend(v6, "columnsPerPage") - 1) * 15.0 + 30.0;
    if (objc_msgSend(v6, "scrollDirection") == (id)1)
    {
      v17 = v9 - v16 / (double)(unint64_t)objc_msgSend(v6, "columnsPerPage");
      v18 = v17 / ((double)(unint64_t)objc_msgSend(v6, "columnsPerPage") + 0.333333333) + -15.0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
      width = UIFloorToViewScale(v18);

    }
    else
    {
      width = (v9 - v16) / (double)(unint64_t)objc_msgSend(v6, "columnsPerPage");
    }
    -[MTAWorldClockCollectionViewController cellHeight](self, "cellHeight");
    height = v22;
  }

  v23 = width;
  v24 = height;
  result.height = v24;
  result.width = v23;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 15.0;
  v7 = 0.0;
  v8 = 15.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 1.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 15.0;
}

- (void)deleteCell:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  -[MTAWorldClockCollectionViewController removeCityAtIndexPath:](self, "removeCityAtIndexPath:", v6);
}

- (void)removeCityAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  objc_msgSend(v5, "removeCityAtIndex:", objc_msgSend(v4, "row"));
  objc_msgSend(v5, "saveCities");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  v12 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  objc_msgSend(v8, "deleteItemsAtIndexPaths:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "collectionView:didRemoveCity:", v11, v7);

  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCAWorldClockRemoves);
}

- (void)handleScrollEnd
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  -[MTAWorldClockCollectionViewController saveLastIndexPath](self, "saveLastIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionViewLayout](self, "collectionViewLayout"));
  v4 = objc_msgSend(v3, "scrollDirection");

  if (v4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v9, "contentOffset");
    objc_msgSend(v9, "frame");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController view](self, "view"));
    v6 = objc_msgSend(v5, "mtui_isRTL");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cities"));
      objc_msgSend(v8, "count");

    }
  }
}

- (void)saveLastIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002D6F0;
  v13[3] = &unk_100099AB8;
  v13[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", v13));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("row"), 1));
  v14 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:indexPath:](MTAStateStoreEvent, "eventWithType:indexPath:", 4, v9));
  objc_msgSend(v10, "pushEvent:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  objc_msgSend(v12, "synchronize");

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[MTAWorldClockCollectionViewController handleScrollEnd](self, "handleScrollEnd", a3);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[MTAWorldClockCollectionViewController handleScrollEnd](self, "handleScrollEnd", a3);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("DidPageWorldClock_PPT"), 0);

}

- (MTAWorldClockCollectionViewDelegate)delegate
{
  return (MTAWorldClockCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
