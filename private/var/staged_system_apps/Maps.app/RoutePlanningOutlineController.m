@implementation RoutePlanningOutlineController

- (RoutePlanningOutlineController)initWithCollectionView:(id)a3
{
  id v4;
  RoutePlanningOutlineController *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *sectionsByIdentifier;
  NSMutableDictionary *v8;
  NSMutableDictionary *sectionCountByIdentifier;
  NSMutableDictionary *v10;
  NSMutableDictionary *sectionStartIndexByIdentifier;
  NSMutableDictionary *v12;
  NSMutableDictionary *sectionIdentifiersByStartIndex;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RoutePlanningOutlineController;
  v5 = -[RoutePlanningOutlineController init](&v15, "init");
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sectionsByIdentifier = v5->_sectionsByIdentifier;
    v5->_sectionsByIdentifier = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sectionCountByIdentifier = v5->_sectionCountByIdentifier;
    v5->_sectionCountByIdentifier = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sectionStartIndexByIdentifier = v5->_sectionStartIndexByIdentifier;
    v5->_sectionStartIndexByIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sectionIdentifiersByStartIndex = v5->_sectionIdentifiersByStartIndex;
    v5->_sectionIdentifiersByStartIndex = v12;

    -[RoutePlanningOutlineController setCollectionView:](v5, "setCollectionView:", v4);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeObserver:forKeyPath:context:](self->_headerView, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), &off_1011D9488);
  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningOutlineController;
  -[RoutePlanningOutlineController dealloc](&v3, "dealloc");
}

+ (UICollectionViewLayout)defaultCollectionViewLayout
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10085CD24;
  v11 = sub_10085CD34;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10085CD3C;
  v6[3] = &unk_1011D9498;
  v6[4] = &v7;
  v2 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", v6);
  v3 = (void *)v8[5];
  v8[5] = (uint64_t)v2;

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (UICollectionViewLayout *)v4;
}

- (UICollectionViewLayout)collectionViewLayout
{
  return -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
}

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView *v6;
  UICollectionView **p_collectionView;
  id v8;
  NSObject *v9;
  UICollectionView *v10;
  uint64_t v11;
  void *v12;
  RoutePlanningOutlineController *v13;
  RoutePlanningOutlineController *v14;
  uint8_t v15[16];

  v5 = (UICollectionView *)a3;
  v6 = v5;
  p_collectionView = &self->_collectionView;
  if (self->_collectionView == v5)
  {
    if (!v5)
      goto LABEL_7;
    v13 = (RoutePlanningOutlineController *)objc_claimAutoreleasedReturnValue(-[UICollectionView dataSource](v5, "dataSource"));
    if (v13 == self)
    {
      v14 = (RoutePlanningOutlineController *)objc_claimAutoreleasedReturnValue(-[UICollectionView delegate](v6, "delegate"));

      if (v14 == self)
        goto LABEL_7;
    }
    else
    {

    }
  }
  objc_storeStrong((id *)&self->_collectionView, a3);
  if (*p_collectionView)
  {
    v8 = sub_100432FBC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Adopting collection view", v15, 2u);
    }

    -[UICollectionView setDataSource:](*p_collectionView, "setDataSource:", self);
    -[UICollectionView setDelegate:](*p_collectionView, "setDelegate:", self);
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](*p_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(UICollectionReusableView), CFSTR("RoutePlanningOutlineHeaderView"), CFSTR("RoutePlanningOutlineHeaderView"));
    v10 = *p_collectionView;
    v11 = objc_opt_class(_TtC4Maps29RoutingAdvisoryInfoFooterView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAdvisoryInfoFooterView reuseIdentifier](_TtC4Maps29RoutingAdvisoryInfoFooterView, "reuseIdentifier"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v11, UICollectionElementKindSectionFooter, v12);

  }
  -[RoutePlanningOutlineController prepareOutlineSections](self, "prepareOutlineSections");
  -[RoutePlanningOutlineController _recalculateSectionCounts](self, "_recalculateSectionCounts");
  -[UICollectionView _maps_reloadDataWithoutFocus](*p_collectionView, "_maps_reloadDataWithoutFocus");
LABEL_7:

}

- (void)setHeaderView:(id)a3
{
  UIView *headerView;
  UIView *v6;
  UIView *v7;

  v7 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView == v7)
  {
    -[RoutePlanningOutlineController _reloadHeaderLayoutItem](self, "_reloadHeaderLayoutItem");
    goto LABEL_9;
  }
  if (headerView)
    -[UIView removeObserver:forKeyPath:context:](self->_headerView, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), &off_1011D9488);
  objc_storeStrong((id *)&self->_headerView, a3);
  v6 = v7;
  if (v7)
  {
    -[RoutePlanningOutlineController _reloadHeaderLayoutItem](self, "_reloadHeaderLayoutItem");
    -[UIView addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 0, &off_1011D9488);
LABEL_9:
    v6 = v7;
    goto LABEL_10;
  }
  if (headerView)
  {
    -[RoutePlanningOutlineController _removeHeaderLayoutItem](self, "_removeHeaderLayoutItem");
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_reloadHeaderLayoutItem
{
  UIView *headerView;
  double v4;
  UIView *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGRect v23;

  headerView = self->_headerView;
  if (headerView)
  {
    -[UIView intrinsicContentSize](headerView, "intrinsicContentSize");
    if (v4 == UIViewNoIntrinsicMetric)
    {
      v5 = self->_headerView;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
      objc_msgSend(v6, "bounds");
      -[UIView _maps_compressedSizeForWidth:withBlock:](v5, "_maps_compressedSizeForWidth:withBlock:", 0, CGRectGetWidth(v23));
      v8 = v7;

    }
    else
    {
      v8 = v4;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionViewLayout](self, "collectionViewLayout"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boundarySupplementaryItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    if (!v12
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutSize")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "heightDimension")),
          objc_msgSend(v14, "dimension"),
          v16 = vabdd_f64(v15, v8),
          v14,
          v13,
          v16 > 2.22044605e-16))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v8));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v18, v17));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v19, CFSTR("RoutePlanningOutlineHeaderView"), 1, 0.0, -16.0));
      v22 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      objc_msgSend(v10, "setBoundarySupplementaryItems:", v21);

      objc_msgSend(v9, "setConfiguration:", v10);
    }

  }
}

- (void)_removeHeaderLayoutItem
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionViewLayout](self, "collectionViewLayout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  objc_msgSend(v2, "setBoundarySupplementaryItems:", &__NSArray0__struct);
  objc_msgSend(v3, "setConfiguration:", v2);

}

- (void)setHideContent:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_hideContent != a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10085D6D0;
    v3[3] = &unk_1011ACE58;
    v4 = a3;
    v3[4] = self;
    -[RoutePlanningOutlineController performBatchSectionUpdates:](self, "performBatchSectionUpdates:", v3);
  }
}

- (BOOL)_shouldUseBlurredBackground
{
  return sub_1002A8AA0(self->_collectionView) != 5;
}

- (id)_blurredBackgroundView
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView backgroundView](self->_collectionView, "backgroundView"));
  v4 = objc_opt_class(UIVisualEffectView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView backgroundView](self->_collectionView, "backgroundView"));
  else
    v5 = 0;

  return v5;
}

- (id)_findVisualEffectView
{
  UICollectionView *v3;
  uint64_t v4;
  uint64_t v5;

  if (-[RoutePlanningOutlineController _shouldUseBlurredBackground](self, "_shouldUseBlurredBackground"))
  {
    v3 = self->_collectionView;
    if (v3)
    {
      do
      {
        v4 = objc_opt_class(UIVisualEffectView);
        if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
          break;
        v5 = objc_claimAutoreleasedReturnValue(-[UICollectionView superview](v3, "superview"));

        v3 = (UICollectionView *)v5;
      }
      while (v5);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &off_1011D94B8)
  {
    -[RoutePlanningOutlineController _resetElevationGraphs](self, "_resetElevationGraphs");
  }
  else if (a6 == &off_1011D9488)
  {
    -[RoutePlanningOutlineController _reloadHeaderLayoutItem](self, "_reloadHeaderLayoutItem");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)RoutePlanningOutlineController;
    -[RoutePlanningOutlineController observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)_resetElevationGraphs
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (-[UICollectionView numberOfSections](self->_collectionView, "numberOfSections") >= 1)
  {
    v3 = 0;
    do
    {
      if (-[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v3) >= 1)
      {
        v4 = 0;
        do
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v4, v3));
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v5));
          v7 = objc_opt_class(RouteOverviewCell);
          if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
            objc_msgSend(v6, "_reloadElevationChart");

          ++v4;
        }
        while (v4 < -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v3));
      }
      ++v3;
    }
    while (v3 < -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections"));
  }
  -[RoutePlanningOutlineController performBatchSectionUpdates:](self, "performBatchSectionUpdates:", &stru_1011D94C0);
}

- (void)prepareOutlineSections
{
  id v3;
  NSObject *v4;
  NSArray *outlineSections;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = sub_100432FBC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will prepare outline sections...", buf, 2u);
  }

  -[NSMutableDictionary removeAllObjects](self->_sectionsByIdentifier, "removeAllObjects");
  outlineSections = self->_outlineSections;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10085DB54;
  v6[3] = &unk_1011D94E8;
  v6[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](outlineSections, "enumerateObjectsUsingBlock:", v6);
  -[RoutePlanningOutlineController _updateVisibleOutlineSections](self, "_updateVisibleOutlineSections");
}

- (void)_updateVisibleOutlineSections
{
  NSArray *visibleOutlineSections;
  NSArray *outlineSections;
  NSArray *v5;
  NSArray *v6;
  id v7;
  NSObject *v8;
  NSUInteger v9;
  NSUInteger v10;
  int v11;
  NSUInteger v12;
  __int16 v13;
  NSUInteger v14;

  if (!self->_batchUpdateCounter)
  {
    if (-[RoutePlanningOutlineController hideContent](self, "hideContent"))
    {
      visibleOutlineSections = self->_visibleOutlineSections;
      self->_visibleOutlineSections = (NSArray *)&__NSArray0__struct;
    }
    else
    {
      outlineSections = self->_outlineSections;
      visibleOutlineSections = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011D9528));
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](outlineSections, "filteredArrayUsingPredicate:", visibleOutlineSections));
      v6 = self->_visibleOutlineSections;
      self->_visibleOutlineSections = v5;

    }
    v7 = sub_100432FBC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = -[NSArray count](self->_visibleOutlineSections, "count");
      v10 = -[NSArray count](self->_outlineSections, "count");
      v11 = 134218240;
      v12 = v9;
      v13 = 2048;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found %lu/%lu sections should be visible", (uint8_t *)&v11, 0x16u);
    }

    -[RoutePlanningOutlineController _recalculateSectionCounts](self, "_recalculateSectionCounts");
    -[RoutePlanningOutlineController didUpdateVisibleOutlineSections](self, "didUpdateVisibleOutlineSections");
  }
}

- (void)_recalculateSectionCounts
{
  NSArray *visibleOutlineSections;
  id v4;
  NSObject *v5;
  int64_t numberOfSections;
  NSMutableDictionary *sectionCountByIdentifier;
  NSMutableDictionary *sectionStartIndexByIdentifier;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  NSMutableDictionary *v17;
  __int16 v18;
  NSMutableDictionary *v19;

  if (!self->_batchUpdateCounter)
  {
    -[NSMutableDictionary removeAllObjects](self->_sectionCountByIdentifier, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_sectionStartIndexByIdentifier, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_sectionIdentifiersByStartIndex, "removeAllObjects");
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    visibleOutlineSections = self->_visibleOutlineSections;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10085DEDC;
    v9[3] = &unk_1011BF030;
    v9[4] = self;
    v9[5] = &v10;
    -[NSArray enumerateObjectsUsingBlock:](visibleOutlineSections, "enumerateObjectsUsingBlock:", v9);
    self->_numberOfSections = v11[3];
    v4 = sub_100432FBC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      numberOfSections = self->_numberOfSections;
      sectionCountByIdentifier = self->_sectionCountByIdentifier;
      sectionStartIndexByIdentifier = self->_sectionStartIndexByIdentifier;
      *(_DWORD *)buf = 134218498;
      v15 = numberOfSections;
      v16 = 2112;
      v17 = sectionCountByIdentifier;
      v18 = 2112;
      v19 = sectionStartIndexByIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Recalculated %lu section counts (\ncount: %@\nstartIndex: %@", buf, 0x20u);
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)performBatchSectionUpdates:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  NSObject *v6;
  unint64_t batchUpdateCounter;
  id v8;
  NSObject *v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  int v16;
  unint64_t v17;

  ++self->_batchUpdateCounter;
  v4 = (void (**)(_QWORD))a3;
  v5 = sub_100432FBC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    batchUpdateCounter = self->_batchUpdateCounter;
    v16 = 134217984;
    v17 = batchUpdateCounter;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Incrementing batch update counter to %lu", (uint8_t *)&v16, 0xCu);
  }

  v4[2](v4);
  --self->_batchUpdateCounter;
  v8 = sub_100432FBC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = self->_batchUpdateCounter;
    v16 = 134217984;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Decrementing batch update counter to %lu", (uint8_t *)&v16, 0xCu);
  }

  if (!self->_batchUpdateCounter)
  {
    v11 = sub_100432FBC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Reloading sections after batch updates", (uint8_t *)&v16, 2u);
    }

    -[RoutePlanningOutlineController _updateVisibleOutlineSections](self, "_updateVisibleOutlineSections");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
    objc_msgSend(v13, "_maps_reloadDataWithoutFocus");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController postReloadHandler](self, "postReloadHandler"));
    if (v14)
    {
      v15 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController postReloadHandler](self, "postReloadHandler"));
      v15[2]();

    }
  }
}

- (id)outlineSectionAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  char *v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_sectionIdentifiersByStartIndex, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingSelector:", "compare:"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    obj = v7;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
      v13 = objc_msgSend(v12, "integerValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionIdentifiersByStartIndex, "objectForKeyedSubscript:", v12));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionCountByIdentifier, "objectForKeyedSubscript:", v14));
      v16 = objc_msgSend(v15, "integerValue");

      if ((uint64_t)v13 <= a3 && (uint64_t)v13 + (uint64_t)v16 > a3)
        break;

      if (v9 == (id)++v11)
      {
        v7 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionsByIdentifier, "objectForKeyedSubscript:", v14));

    v7 = obj;
    if (!v24)
      goto LABEL_14;
  }
  else
  {
LABEL_13:

LABEL_14:
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid index passed to outlineSectionAtIndex: %ld"), a3));
      *(_DWORD *)buf = 136316162;
      v32 = "-[RoutePlanningOutlineController outlineSectionAtIndex:]";
      v33 = 2080;
      v34 = "RoutePlanningOutlineController.m";
      v35 = 1024;
      v36 = 344;
      v37 = 2080;
      v38 = "section";
      v39 = 2112;
      v40 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v32 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v24 = 0;
  }

  return v24;
}

- (int64_t)indexOfFirstPopulatedSection
{
  int64_t v3;
  void *v4;
  uint64_t v5;

  if (self->_numberOfSections < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  while (1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
    v5 = -[RoutePlanningOutlineController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v4, v3);

    if (v5 > 0)
      break;
    if (++v3 >= self->_numberOfSections)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (unint64_t)totalAvailableSections
{
  return (unint64_t)-[NSMutableDictionary count](self->_sectionStartIndexByIdentifier, "count");
}

- (int64_t)_localSectionForGlobalSectionIndex:(int64_t)a3 forSection:(id)a4
{
  NSMutableDictionary *sectionStartIndexByIdentifier;
  void *v6;
  void *v7;
  id v8;

  sectionStartIndexByIdentifier = self->_sectionStartIndexByIdentifier;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "sectionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sectionStartIndexByIdentifier, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "integerValue");

  return a3 - (_QWORD)v8;
}

- (int64_t)_positionOfSection:(id)a3
{
  return -[NSArray indexOfObject:](self->_visibleOutlineSections, "indexOfObject:", a3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10085CD24;
  v20 = sub_10085CD34;
  v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10085E720;
  v12[3] = &unk_1011B3B68;
  v15 = &v16;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v7, "section")));
  v13 = v8;
  v9 = v7;
  v14 = v9;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return self->_numberOfSections;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", a4));
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", -[RoutePlanningOutlineController _localSectionForGlobalSectionIndex:forSection:](self, "_localSectionForGlobalSectionIndex:forSection:", a4, v6));

  return (int64_t)v7;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v5, "section")));
  v7 = objc_msgSend(v6, "shouldHighlightItemAtIndexPath:", v5);

  return v7;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v5, "section")));
  objc_msgSend(v6, "didHighlightItemAtIndexPath:", v5);

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v5, "section")));
  objc_msgSend(v6, "didUnhighlightItemAtIndexPath:", v5);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v5, "section")));
  v7 = objc_msgSend(v6, "shouldSelectItemAtIndexPath:", v5);

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v5, "section")));
  objc_msgSend(v6, "didSelectItemAtIndexPath:", v5);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v7, "section")));
  objc_msgSend(v9, "willDisplayCell:forIndexPath:", v8, v7);

}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v5, "section")));
  v7 = objc_msgSend(v6, "selectionFollowsFocusForItemAtIndexPath:", v5);

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v10, "isEqualToString:", UICollectionElementKindSectionFooter))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAdvisoryInfoFooterView reuseIdentifier](_TtC4Maps29RoutingAdvisoryInfoFooterView, "reuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v11, v9));

    objc_msgSend(v12, "frame");
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v12, "setAlpha:", 0.0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v10, v9));
    v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("RoutePlanningOutlineHeaderView"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController headerView](self, "headerView"));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController headerView](self, "headerView"));
        objc_msgSend(v12, "addSubview:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController headerView](self, "headerView"));
        LODWORD(v17) = 1148846080;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_maps_constraintsEqualToEdgesOfView:priority:", v12, v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

      }
    }
  }

  return v12;
}

- (int64_t)sectionIndexForOutlineSection:(id)a3
{
  NSMutableDictionary *sectionStartIndexByIdentifier;
  void *v4;
  void *v5;
  int64_t v6;

  sectionStartIndexByIdentifier = self->_sectionStartIndexByIdentifier;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sectionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sectionStartIndexByIdentifier, "objectForKeyedSubscript:", v4));

  if (v5)
    v6 = (int64_t)objc_msgSend(v5, "integerValue");
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (void)outlineSectionRequiresReload:(id)a3
{
  -[RoutePlanningOutlineController performBatchSectionUpdates:](self, "performBatchSectionUpdates:", &stru_1011D9548);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (id)postReloadHandler
{
  return self->_postReloadHandler;
}

- (void)setPostReloadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (BOOL)hideContent
{
  return self->_hideContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong(&self->_postReloadHandler, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiersByStartIndex, 0);
  objc_storeStrong((id *)&self->_sectionStartIndexByIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionCountByIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_visibleOutlineSections, 0);
  objc_storeStrong((id *)&self->_outlineSections, 0);
}

@end
