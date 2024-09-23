@implementation RoutePlanningRouteStepsOutlineSection

- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RoutePlanningRouteStepsOutlineSection;
  v4 = -[RoutePlanningOutlineSection layoutSectionAtIndex:layoutEnvironment:](&v7, "layoutSectionAtIndex:layoutEnvironment:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "setContentInsets:", 0.0, 10.0, 0.0, 10.0);
  return v5;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RoutePlanningRouteStepsOutlineSection;
  v7 = -[RoutePlanningOutlineSection listLayoutSectionConfigurationAtIndex:layoutEnvironment:](&v14, "listLayoutSectionConfigurationAtIndex:layoutEnvironment:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = _UICollectionViewListLayoutSectionAutomaticDimension;
  objc_msgSend(v8, "setEstimatedRowHeight:", _UICollectionViewListLayoutSectionAutomaticDimension);
  objc_msgSend(v8, "setRowHeight:", v9);
  objc_msgSend(v8, "setSeparatorStyle:", 1);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100656A30;
  v11[3] = &unk_1011BF008;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "setSeparatorInsetProvider:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (NSDirectionalEdgeInsets)_separatorInsetsForIndexPath:(id)a3
{
  id v4;
  double v5;
  DirectionsStepsListDataSource *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  DirectionsStepsListDataSource *stepsListDataSource;
  uint64_t v12;
  __int128 v13;
  char *v14;
  DirectionsStepsListDataSource *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  NSDirectionalEdgeInsets result;

  v4 = a3;
  v5 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *(_QWORD *)&v32 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *((_QWORD *)&v32 + 1) = _UICollectionViewListLayoutSectionAutomaticDimension;
  *(_QWORD *)&v33 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *((_QWORD *)&v33 + 1) = _UICollectionViewListLayoutSectionAutomaticDimension;
  if (sub_1002A8AA0(self->super._collectionView) == 5
    && (v6 = self->_stepsListDataSource,
        v7 = objc_opt_class(DirectionsStepsListDataSource),
        (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v5 = _UICollectionViewListSectionSeparatorInsetHidden[0];
    v8 = _UICollectionViewListSectionSeparatorInsetHidden[1];
    v9 = _UICollectionViewListSectionSeparatorInsetHidden[2];
    v10 = _UICollectionViewListSectionSeparatorInsetHidden[3];
  }
  else
  {
    stepsListDataSource = self->_stepsListDataSource;
    v12 = objc_opt_class(TransitDirectionsStepsListDataSource);
    if ((objc_opt_isKindOfClass(stepsListDataSource, v12) & 1) != 0)
    {
      if ((-[DirectionsStepsListDataSource shouldShowSeparatorForItemAtIndexPath:insets:](self->_stepsListDataSource, "shouldShowSeparatorForItemAtIndexPath:insets:", v4, &v32) & 1) == 0)
      {
        v13 = *(_OWORD *)&_UICollectionViewListSectionSeparatorInsetHidden[2];
        v32 = *(_OWORD *)_UICollectionViewListSectionSeparatorInsetHidden;
        v33 = v13;
      }
      v8 = *((double *)&v32 + 1);
      v5 = *(double *)&v32;
      v10 = *((double *)&v33 + 1);
      v9 = *(double *)&v33;
    }
    else
    {
      v14 = (char *)objc_msgSend(v4, "row");
      if ((uint64_t)v14 >= (uint64_t)((char *)-[DirectionsStepsListDataSource collectionView:numberOfItemsInSection:](self->_stepsListDataSource, "collectionView:numberOfItemsInSection:", self->super._collectionView, objc_msgSend(v4, "section"))- 1))
      {
        v8 = v5;
      }
      else
      {
        v15 = self->_stepsListDataSource;
        v16 = objc_opt_class(TransitDirectionsStepsListDataSource);
        isKindOfClass = objc_opt_isKindOfClass(v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView traitCollection](self->super._collectionView, "traitCollection"));
        +[DirectionsStepTableViewCell cellMetricsForIdiom:](DirectionsStepTableViewCell, "cellMetricsForIdiom:", objc_msgSend(v18, "userInterfaceIdiom"));
        if ((isKindOfClass & 1) != 0)
        {
          v20 = v30;
          v19 = v31;
          v21 = v29;
        }
        else
        {
          v20 = v27;
          v19 = v28;
          v21 = v26;
        }
        v8 = v21 + v19 + v20;

      }
      v9 = v5;
      v10 = v5;
    }
  }

  v22 = v5;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  result.trailing = v25;
  result.bottom = v24;
  result.leading = v23;
  result.top = v22;
  return result;
}

- (BOOL)wantsDefaultPaddingAboveSection
{
  return 0;
}

- (void)setRoute:(id)a3
{
  id v5;
  GEOComposedRoute *route;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  DirectionsStepsListDataSource *stepsListDataSource;
  DirectionsStepsListDataSource *v12;
  unsigned int v13;
  __objc2_class **v14;
  DirectionsStepsListDataSource *v15;
  DirectionsStepsListDataSource *v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  v5 = a3;
  route = self->_route;
  v7 = (unint64_t)v5;
  v8 = route;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_route, a3);
      stepsListDataSource = self->_stepsListDataSource;
      if (stepsListDataSource)
      {
        -[DirectionsStepsListDataSource setCollectionView:](stepsListDataSource, "setCollectionView:", 0);
        v12 = self->_stepsListDataSource;
        self->_stepsListDataSource = 0;

      }
      if (v7)
      {
        v13 = objc_msgSend((id)v7, "transportType");
        v14 = off_101197FF8;
        if (v13 != 1)
          v14 = off_101196160;
        v15 = (DirectionsStepsListDataSource *)objc_alloc_init(*v14);
        v16 = self->_stepsListDataSource;
        self->_stepsListDataSource = v15;

        -[DirectionsStepsListDataSource setAllowStepSelection:](self->_stepsListDataSource, "setAllowStepSelection:", 1);
        -[DirectionsStepsListDataSource setFlattenToSingleSection:](self->_stepsListDataSource, "setFlattenToSingleSection:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteStepsOutlineSection stepsListDelegate](self, "stepsListDelegate"));
        -[DirectionsStepsListDataSource setDelegate:](self->_stepsListDataSource, "setDelegate:", v17);

        -[DirectionsStepsListDataSource setOptions:](self->_stepsListDataSource, "setOptions:", 15);
        -[DirectionsStepsListDataSource setRoute:](self->_stepsListDataSource, "setRoute:", v7);
        -[DirectionsStepsListDataSource setCollectionView:](self->_stepsListDataSource, "setCollectionView:", self->super._collectionView);
        objc_initWeak(&location, self);
        v20 = _NSConcreteStackBlock;
        v21 = 3221225472;
        v22 = sub_100656E8C;
        v23 = &unk_1011AD260;
        objc_copyWeak(&v24, &location);
        -[DirectionsStepsListDataSource setReloadHandler:](self->_stepsListDataSource, "setReloadHandler:", &v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineSection host](self, "host", v20, v21, v22, v23));
        objc_msgSend(v18, "outlineSectionRequiresReload:", self);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineSection host](self, "host"));
        objc_msgSend(v19, "outlineSectionRequiresReload:", self);

      }
    }
  }

}

- (void)setCurrentRoute:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  _BOOL8 v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (self->_currentRoute != a3)
  {
    v3 = a3;
    self->_currentRoute = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineSection host](self, "host"));
    v6 = objc_msgSend(v5, "sectionIndexForOutlineSection:", self);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView indexPathsForVisibleItems](self->super._collectionView, "indexPathsForVisibleItems", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      v11 = !v3;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "section") == v6)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](self->super._collectionView, "cellForItemAtIndexPath:", v13));
            objc_msgSend(v14, "setMaps_suppressBackgroundColors:", v11);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)setStepsListDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stepsListDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_stepsListDelegate, obj);
    -[DirectionsStepsListDataSource setDelegate:](self->_stepsListDataSource, "setDelegate:", obj);
  }

}

- (int64_t)numberOfSections
{
  return self->_stepsListDataSource != 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[DirectionsStepsListDataSource collectionView:numberOfItemsInSection:](self->_stepsListDataSource, "collectionView:numberOfItemsInSection:", self->super._collectionView, 0);
}

- (id)cellForItemAtIndexPath:(id)a3
{
  DirectionsStepsListDataSource *stepsListDataSource;
  UICollectionView *collectionView;
  id v6;
  void *v7;

  stepsListDataSource = self->_stepsListDataSource;
  collectionView = self->super._collectionView;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView:cellForItemAtIndexPath:](stepsListDataSource, "collectionView:cellForItemAtIndexPath:", collectionView, v6));
  -[RoutePlanningRouteStepsOutlineSection _configureCell:forIndexPath:](self, "_configureCell:forIndexPath:", v7, v6);

  return v7;
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _BYTE *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_opt_class(_UICollectionViewListCell);
  if ((objc_opt_isKindOfClass(v11, v7) & 1) != 0)
  {
    v8 = v11;
    v9 = objc_msgSend(v6, "item");
    if (v9 == (char *)-[RoutePlanningRouteStepsOutlineSection numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v6, "section"))- 1)v10 = 4;
    else
      v10 = 3;
    objc_msgSend(v8, "_setBackgroundViewConfigurationGrouping:", v10);

  }
  objc_msgSend(v11, "setMaps_suppressBackgroundColors:", -[RoutePlanningRouteStepsOutlineSection isCurrentRoute](self, "isCurrentRoute") ^ 1);

}

- (BOOL)shouldHighlightItemAtIndexPath:(id)a3
{
  DirectionsStepsListDataSource *stepsListDataSource;
  id v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  stepsListDataSource = self->_stepsListDataSource;
  v5 = a3;
  if ((objc_opt_respondsToSelector(stepsListDataSource, "collectionView:shouldHighlightItemAtIndexPath:") & 1) != 0)
  {
    v6 = -[DirectionsStepsListDataSource collectionView:shouldHighlightItemAtIndexPath:](self->_stepsListDataSource, "collectionView:shouldHighlightItemAtIndexPath:", self->super._collectionView, v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RoutePlanningRouteStepsOutlineSection;
    v6 = -[RoutePlanningOutlineSection shouldHighlightItemAtIndexPath:](&v9, "shouldHighlightItemAtIndexPath:", v5);
  }
  v7 = v6;

  return v7;
}

- (void)didHighlightItemAtIndexPath:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector(self->_stepsListDataSource, "collectionView:didHighlightItemAtIndexPath:") & 1) != 0)
    -[DirectionsStepsListDataSource collectionView:didHighlightItemAtIndexPath:](self->_stepsListDataSource, "collectionView:didHighlightItemAtIndexPath:", self->super._collectionView, v4);

}

- (void)didUnhighlightItemAtIndexPath:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector(self->_stepsListDataSource, "collectionView:didUnhighlightItemAtIndexPath:") & 1) != 0)
    -[DirectionsStepsListDataSource collectionView:didUnhighlightItemAtIndexPath:](self->_stepsListDataSource, "collectionView:didUnhighlightItemAtIndexPath:", self->super._collectionView, v4);

}

- (BOOL)shouldSelectItemAtIndexPath:(id)a3
{
  DirectionsStepsListDataSource *stepsListDataSource;
  id v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  stepsListDataSource = self->_stepsListDataSource;
  v5 = a3;
  if ((objc_opt_respondsToSelector(stepsListDataSource, "collectionView:shouldSelectItemAtIndexPath:") & 1) != 0)
  {
    v6 = -[DirectionsStepsListDataSource collectionView:shouldSelectItemAtIndexPath:](self->_stepsListDataSource, "collectionView:shouldSelectItemAtIndexPath:", self->super._collectionView, v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RoutePlanningRouteStepsOutlineSection;
    v6 = -[RoutePlanningOutlineSection shouldSelectItemAtIndexPath:](&v9, "shouldSelectItemAtIndexPath:", v5);
  }
  v7 = v6;

  return v7;
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector(self->_stepsListDataSource, "collectionView:didSelectItemAtIndexPath:") & 1) != 0)
    -[DirectionsStepsListDataSource collectionView:didSelectItemAtIndexPath:](self->_stepsListDataSource, "collectionView:didSelectItemAtIndexPath:", self->super._collectionView, v4);

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)isCurrentRoute
{
  return self->_currentRoute;
}

- (TransitDirectionsStepsListDelegate)stepsListDelegate
{
  return (TransitDirectionsStepsListDelegate *)objc_loadWeakRetained((id *)&self->_stepsListDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stepsListDelegate);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_stepsListDataSource, 0);
}

@end
