@implementation RoutePlanningRouteOverviewOutlineSection

- (RoutePlanningRouteOverviewOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  RoutePlanningRouteOverviewOutlineSection *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningRouteOverviewOutlineSection;
  v7 = -[RoutePlanningOutlineSection initWithCollectionView:sectionIdentifier:](&v9, "initWithCollectionView:sectionIdentifier:", v6, a4);
  if (v7)
  {
    +[DynamicTypeWizard makeObject:performSelector:whenSizeCategoryChangesWithOrder:](DynamicTypeWizard, "makeObject:performSelector:whenSizeCategoryChangesWithOrder:", v7, "_resetCachedRowHeight", 1);
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RouteOverviewCell), CFSTR("RouteOverview"));
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RouteOverviewCell), CFSTR("RouteOverviewAX"));
  }

  return v7;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RoutePlanningRouteOverviewOutlineSection;
  v7 = -[RoutePlanningOutlineSection listLayoutSectionConfigurationAtIndex:layoutEnvironment:](&v15, "listLayoutSectionConfigurationAtIndex:layoutEnvironment:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v8, "setSeparatorStyle:", 1);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100655E98;
  v11[3] = &unk_1011BEFE0;
  objc_copyWeak(&v13, &location);
  v9 = v6;
  v12 = v9;
  objc_msgSend(v8, "setSeparatorInsetProvider:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

- (void)performWhileSuppressingCellReloads:(id)a3
{
  if (a3)
  {
    ++self->_suppressReloads;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    --self->_suppressReloads;
  }
}

- (double)estimatedItemHeight
{
  CGFloat Width;
  double result;
  RouteOverviewCell *v5;
  RouteOverviewCell *v6;
  double v7;
  _QWORD v8[5];
  RouteOverviewCell *v9;
  CGRect v10;

  if (self->_route)
  {
    -[UICollectionView bounds](self->super._collectionView, "bounds");
    Width = CGRectGetWidth(v10);
    result = self->_cachedRowHeight;
    if (result <= 2.22044605e-16 || vabdd_f64(Width, self->_lastCachedWidthForRowHeight) > 2.22044605e-16)
    {
      v5 = -[RouteOverviewCell initWithFrame:]([RouteOverviewCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      self->_lastCachedWidthForRowHeight = Width;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1006560D8;
      v8[3] = &unk_1011AC8B0;
      v8[4] = self;
      v9 = v5;
      v6 = v5;
      -[RouteOverviewCell _maps_compressedSizeForWidth:withBlock:](v6, "_maps_compressedSizeForWidth:withBlock:", v8, Width);
      self->_cachedRowHeight = v7;

      return self->_cachedRowHeight;
    }
  }
  else
  {
    +[RouteOverviewCell minimumHeight](RouteOverviewCell, "minimumHeight");
  }
  return result;
}

- (void)_resetCachedRowHeight
{
  self->_cachedRowHeight = 0.0;
  self->_lastCachedWidthForRowHeight = 0.0;
}

- (void)setRoute:(id)a3
{
  id v5;
  GEOComposedRoute *route;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unint64_t v11;

  v5 = a3;
  route = self->_route;
  v11 = (unint64_t)v5;
  v7 = route;
  v8 = (void *)v11;
  if (v11 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v11, "isEqual:", v7);

    v8 = (void *)v11;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_route, a3);
      -[RoutePlanningRouteOverviewOutlineSection _resetCachedRowHeight](self, "_resetCachedRowHeight");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineSection host](self, "host"));
      objc_msgSend(v10, "outlineSectionRequiresReload:", self);

      v8 = (void *)v11;
    }
  }

}

- (void)setExpanded:(BOOL)a3
{
  -[RoutePlanningRouteOverviewOutlineSection setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  if (self->_expanded != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_expanded = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteOverviewOutlineSection _existingCell](self, "_existingCell"));
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setDetailsButtonRotated:animated:", v5, v4);
      v6 = v7;
    }

  }
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteOverviewOutlineSection route](self, "route", a3));

  return v3 != 0;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;

  v4 = a3;
  if (+[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled"))
    v5 = CFSTR("RouteOverviewAX");
  else
    v5 = CFSTR("RouteOverview");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->super._collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v5, v4));

  -[RoutePlanningRouteOverviewOutlineSection _configureCell:](self, "_configureCell:", v6);
  return v6;
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return self->_showDetailButton;
}

- (void)setCurrentRoute:(BOOL)a3
{
  if (self->_currentRoute != a3)
  {
    self->_currentRoute = a3;
    -[RoutePlanningRouteOverviewOutlineSection reloadExistingCell](self, "reloadExistingCell");
  }
}

- (void)setAllowPersistentHighlight:(BOOL)a3
{
  if (self->_allowPersistentHighlight != a3)
  {
    self->_allowPersistentHighlight = a3;
    -[RoutePlanningRouteOverviewOutlineSection reloadExistingCell](self, "reloadExistingCell");
  }
}

- (void)setShowDetailButton:(BOOL)a3
{
  if (self->_showDetailButton != a3)
  {
    self->_showDetailButton = a3;
    -[RoutePlanningRouteOverviewOutlineSection _resetCachedRowHeight](self, "_resetCachedRowHeight");
    -[RoutePlanningRouteOverviewOutlineSection reloadExistingCell](self, "reloadExistingCell");
  }
}

- (void)setHasSelectedStep:(BOOL)a3
{
  if (self->_hasSelectedStep != a3)
  {
    self->_hasSelectedStep = a3;
    -[RoutePlanningRouteOverviewOutlineSection reloadExistingCell](self, "reloadExistingCell");
  }
}

- (void)setAutomaticSharingContacts:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_automaticSharingContacts;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_automaticSharingContacts, a3);
      -[RoutePlanningRouteOverviewOutlineSection _resetCachedRowHeight](self, "_resetCachedRowHeight");
      -[RoutePlanningRouteOverviewOutlineSection reloadExistingCell](self, "reloadExistingCell");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)setLastRoute:(BOOL)a3
{
  if (self->_lastRoute != a3)
  {
    self->_lastRoute = a3;
    -[RoutePlanningRouteOverviewOutlineSection reloadExistingCell](self, "reloadExistingCell");
  }
}

- (void)reloadExistingCell
{
  void *v3;
  void *v4;

  if (!self->_suppressReloads)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteOverviewOutlineSection _existingCell](self, "_existingCell"));
    if (v3)
    {
      v4 = v3;
      -[RoutePlanningRouteOverviewOutlineSection _configureCell:](self, "_configureCell:", v3);
      v3 = v4;
    }

  }
}

- (void)_configureCell:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteOverviewOutlineSection route](self, "route"));
  v5 = sub_1002A8AA0(self->super._collectionView) == 5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteOverviewOutlineSection automaticSharingContacts](self, "automaticSharingContacts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteOverviewOutlineSection dataCoordinator](self, "dataCoordinator"));
  +[RouteOverviewCellComposer configureCell:forRoute:isMac:automaticSharingContacts:dataCoordinator:](RouteOverviewCellComposer, "configureCell:forRoute:isMac:automaticSharingContacts:dataCoordinator:", v11, v4, v5, v6, v7);

  objc_msgSend(v11, "setDetailsButtonRotated:", -[RoutePlanningRouteOverviewOutlineSection isExpanded](self, "isExpanded"));
  if (-[RoutePlanningRouteOverviewOutlineSection allowsPersistentHighlight](self, "allowsPersistentHighlight"))
    v8 = -[RoutePlanningRouteOverviewOutlineSection isCurrentRoute](self, "isCurrentRoute");
  else
    v8 = 0;
  objc_msgSend(v11, "setSelectionBackgroundVisible:", v8);
  objc_msgSend(v11, "setDetailsButtonVisible:", -[RoutePlanningRouteOverviewOutlineSection showsDetailButton](self, "showsDetailButton"));
  objc_msgSend(v11, "setHasSelectedStep:", -[RoutePlanningRouteOverviewOutlineSection hasSelectedStep](self, "hasSelectedStep"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteOverviewOutlineSection routeCellDelegate](self, "routeCellDelegate"));
  objc_msgSend(v11, "setDelegate:", v9);

  if (sub_1002A8AA0(v11) != 5)
  {
    if (-[RoutePlanningRouteOverviewOutlineSection isFirstRoute](self, "isFirstRoute")
      && -[RoutePlanningRouteOverviewOutlineSection isLastRoute](self, "isLastRoute"))
    {
      v10 = 1;
    }
    else if (-[RoutePlanningRouteOverviewOutlineSection isFirstRoute](self, "isFirstRoute"))
    {
      v10 = 2;
    }
    else if (-[RoutePlanningRouteOverviewOutlineSection isLastRoute](self, "isLastRoute"))
    {
      v10 = 4;
    }
    else
    {
      v10 = 3;
    }
    objc_msgSend(v11, "setOverrideCellGrouping:", v10);
  }
  objc_msgSend(v11, "setDetailsButtonRotated:", -[RoutePlanningRouteOverviewOutlineSection isExpanded](self, "isExpanded"));

}

- (id)_existingCell
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineSection host](self, "host"));
  v4 = objc_msgSend(v3, "sectionIndexForOutlineSection:", self);

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](self->super._collectionView, "cellForItemAtIndexPath:", v6));
    v8 = objc_opt_class(RouteOverviewCell);
    v5 = 0;
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v5 = v7;

  }
  return v5;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (double)longestRouteLength
{
  return self->_longestRouteLength;
}

- (BOOL)isCurrentRoute
{
  return self->_currentRoute;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)allowsPersistentHighlight
{
  return self->_allowPersistentHighlight;
}

- (BOOL)showsDetailButton
{
  return self->_showDetailButton;
}

- (BOOL)isFirstRoute
{
  return self->_firstRoute;
}

- (void)setFirstRoute:(BOOL)a3
{
  self->_firstRoute = a3;
}

- (BOOL)isLastRoute
{
  return self->_lastRoute;
}

- (BOOL)hasSelectedStep
{
  return self->_hasSelectedStep;
}

- (NSArray)automaticSharingContacts
{
  return self->_automaticSharingContacts;
}

- (RouteOverviewCellDelegate)routeCellDelegate
{
  return (RouteOverviewCellDelegate *)objc_loadWeakRetained((id *)&self->_routeCellDelegate);
}

- (void)setRouteCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_routeCellDelegate, a3);
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  return (RoutePlanningDataCoordination *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (void)setDataCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_dataCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_destroyWeak((id *)&self->_routeCellDelegate);
  objc_storeStrong((id *)&self->_automaticSharingContacts, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
