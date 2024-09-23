@implementation RoutePlanningOutlineRootController

- (RoutePlanningOutlineRootController)initWithCollectionView:(id)a3
{
  id v4;
  RoutePlanningOutlineRootController *v5;
  uint64_t v6;
  NSMapTable *routeOverviewSectionsByRoute;
  uint64_t v8;
  NSMapTable *stepsSectionsByRoute;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningOutlineRootController;
  v5 = -[RoutePlanningOutlineController initWithCollectionView:](&v11, "initWithCollectionView:", v4);
  if (v5)
  {
    objc_msgSend(v4, "setRemembersLastFocusedIndexPath:", 1);
    v6 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    routeOverviewSectionsByRoute = v5->_routeOverviewSectionsByRoute;
    v5->_routeOverviewSectionsByRoute = (NSMapTable *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    stepsSectionsByRoute = v5->_stepsSectionsByRoute;
    v5->_stepsSectionsByRoute = (NSMapTable *)v8;

  }
  return v5;
}

- (void)prepareOutlineSections
{
  void *v3;
  id v4;
  RoutePlanningFeatureDiscoverOutlineSection *featureDiscoverySection;
  RoutePlanningFeatureDiscoverOutlineSection *v6;
  void *v7;
  RoutePlanningFeatureDiscoverOutlineSection *v8;
  RoutePlanningFeatureDiscoverOutlineSection *v9;
  RoutePlanningFeatureDiscoverOutlineSection *v10;
  int64_t transportType;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  void *v23;
  int IsEnabled_HikingiOS;
  void *v25;
  unsigned __int8 v26;
  id *p_routeCreationSection;
  RoutePlanningRouteCreationOutlineSection *v28;
  void *v29;
  RoutePlanningRouteCreationOutlineSection *v30;
  id v31;
  void *v32;
  int v33;
  NSUInteger v34;
  NSArray *v35;
  id v36;
  NSArray *v37;
  NSArray *v38;
  NSArray *outlineSections;
  NSArray *routeOverviewSections;
  RoutePlanningRouteCreationOutlineSection *routeCreationSection;
  objc_super v42;
  _QWORD v43[4];
  id v44;
  RoutePlanningOutlineRootController *v45;
  NSUInteger v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));

  if (!v3)
  {
    outlineSections = self->super._outlineSections;
    self->super._outlineSections = (NSArray *)&__NSArray0__struct;

    routeOverviewSections = self->_routeOverviewSections;
    self->_routeOverviewSections = 0;

    -[NSMapTable removeAllObjects](self->_routeOverviewSectionsByRoute, "removeAllObjects");
    -[NSMapTable removeAllObjects](self->_stepsSectionsByRoute, "removeAllObjects");
    routeCreationSection = self->_routeCreationSection;
    self->_routeCreationSection = 0;

    v52.receiver = self;
    v52.super_class = (Class)RoutePlanningOutlineRootController;
    -[RoutePlanningOutlineController prepareOutlineSections](&v52, "prepareOutlineSections");
    return;
  }
  v4 = objc_alloc_init((Class)NSMutableArray);
  featureDiscoverySection = self->_featureDiscoverySection;
  if (!featureDiscoverySection)
  {
    v6 = [RoutePlanningFeatureDiscoverOutlineSection alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
    v8 = -[RoutePlanningFeatureDiscoverOutlineSection initWithCollectionView:sectionIdentifier:](v6, "initWithCollectionView:sectionIdentifier:", v7, CFSTR("FeatureDiscovery"));
    v9 = self->_featureDiscoverySection;
    self->_featureDiscoverySection = v8;

    v10 = self->_featureDiscoverySection;
    transportType = self->_transportType;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection"));
    -[RoutePlanningFeatureDiscoverOutlineSection updateWithTransportType:routeCollection:](v10, "updateWithTransportType:routeCollection:", transportType, v12);

    featureDiscoverySection = self->_featureDiscoverySection;
  }
  objc_msgSend(v4, "addObject:", featureDiscoverySection);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController dataCoordinator](self, "dataCoordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "waypointRequests"));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v19), "waypointRequest"));
        v21 = objc_opt_class(SavedRouteWaypointRequest);
        isKindOfClass = objc_opt_isKindOfClass(v20, v21);

        if ((isKindOfClass & 1) != 0)
        {
          v23 = v15;
          goto LABEL_20;
        }
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v17)
        continue;
      break;
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController dataCoordinator](self, "dataCoordinator"));
  if (objc_msgSend(v23, "inACustomRouteRegion") && self->_transportType == 2)
  {
    IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();

    if (IsEnabled_HikingiOS)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v26 = objc_msgSend(v25, "isUsingOfflineMaps");

      if ((v26 & 1) == 0)
      {
        p_routeCreationSection = (id *)&self->_routeCreationSection;
        if (!self->_routeCreationSection)
        {
          v28 = [RoutePlanningRouteCreationOutlineSection alloc];
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
          v30 = -[RoutePlanningRouteCreationOutlineSection initWithCollectionView:sectionIdentifier:](v28, "initWithCollectionView:sectionIdentifier:", v29, CFSTR("RouteCreation"));
          v31 = *p_routeCreationSection;
          *p_routeCreationSection = v30;

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCreationDelegate](self, "routeCreationDelegate"));
          objc_msgSend(*p_routeCreationSection, "setRouteCreationDelegate:", v32);

        }
        v33 = 1;
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_20:

  }
  v33 = 0;
  p_routeCreationSection = (id *)&self->_routeCreationSection;
LABEL_22:
  v34 = -[NSArray count](self->_routeOverviewSections, "count");
  v35 = self->_routeOverviewSections;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100651A9C;
  v43[3] = &unk_1011BEEC8;
  v47 = v33;
  v36 = v4;
  v44 = v36;
  v45 = self;
  v46 = v34;
  -[NSArray enumerateObjectsUsingBlock:](v35, "enumerateObjectsUsingBlock:", v43);
  if (v33)
  {
    if ((objc_msgSend(v36, "containsObject:", *p_routeCreationSection) & 1) == 0)
      objc_msgSend(v36, "addObject:", *p_routeCreationSection);
  }
  v37 = (NSArray *)objc_msgSend(v36, "copy");
  v38 = self->super._outlineSections;
  self->super._outlineSections = v37;

  v42.receiver = self;
  v42.super_class = (Class)RoutePlanningOutlineRootController;
  -[RoutePlanningOutlineController prepareOutlineSections](&v42, "prepareOutlineSections");

}

- (void)didUpdateVisibleOutlineSections
{
  NSArray *visibleOutlineSections;
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  objc_super v13;
  uint8_t buf[4];
  __CFString *v15;

  v13.receiver = self;
  v13.super_class = (Class)RoutePlanningOutlineRootController;
  -[RoutePlanningOutlineController didUpdateVisibleOutlineSections](&v13, "didUpdateVisibleOutlineSections");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  visibleOutlineSections = self->super._visibleOutlineSections;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100651D70;
  v8[3] = &unk_1011BEEF0;
  v8[4] = &v9;
  -[NSArray enumerateObjectsUsingBlock:](visibleOutlineSections, "enumerateObjectsUsingBlock:", v8);
  v4 = sub_100432FBC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (*((_BYTE *)v10 + 24))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = v6;
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Found FeatureDiscoverySection: %@", buf, 0xCu);

  }
  -[RoutePlanningOutlineRootController setHasFeatureDiscoverySection:](self, "setHasFeatureDiscoverySection:", *((unsigned __int8 *)v10 + 24));
  _Block_object_dispose(&v9, 8);
}

- (id)mostImportantIndexPathWithSelectedRoute:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (-[RoutePlanningFeatureDiscoverOutlineSection numberOfSections](self->_featureDiscoverySection, "numberOfSections") >= 1&& -[RoutePlanningFeatureDiscoverOutlineSection numberOfItemsInSection:](self->_featureDiscoverySection, "numberOfItemsInSection:", 0))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, -[RoutePlanningOutlineController sectionIndexForOutlineSection:](self, "sectionIndexForOutlineSection:", self->_featureDiscoverySection)));
  }
  else
  {
    if (!v4)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController indexPathForRoute:](self, "indexPathForRoute:", v4));
  }
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (CGRect)mostImportantRectToFrameWithSelectedRoute:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  void *v40;
  id v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat r2;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect result;
  CGRect v63;

  v4 = a3;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  r2 = y;
  if (-[RoutePlanningFeatureDiscoverOutlineSection numberOfSections](self->_featureDiscoverySection, "numberOfSections") < 1|| -[RoutePlanningFeatureDiscoverOutlineSection numberOfItemsInSection:](self->_featureDiscoverySection, "numberOfItemsInSection:", 0) < 1)
  {
    v22 = height;
    v16 = width;
    v13 = CGRectZero.origin.x;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, -[RoutePlanningOutlineController sectionIndexForOutlineSection:](self, "sectionIndexForOutlineSection:", self->_featureDiscoverySection)));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionViewLayout](self, "collectionViewLayout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutAttributesForItemAtIndexPath:", v9));

    objc_msgSend(v11, "frame");
    v13 = v12;
    y = v14;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routes"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

    v22 = v18;
    v4 = (id)v21;
  }
  if (v4)
  {
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController indexPathForRoute:](self, "indexPathForRoute:", v4));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionViewLayout](self, "collectionViewLayout"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layoutAttributesForItemAtIndexPath:", v24));

    objc_msgSend(v26, "frame");
    x = v27;
    r2 = v28;
    width = v29;
    height = v30;

    v22 = v23;
  }
  v56 = x;
  v57 = width;
  v31 = CGRectNull.origin.x;
  v33 = CGRectNull.size.width;
  v32 = CGRectNull.size.height;
  v34 = v13;
  v35 = y;
  v36 = v16;
  v37 = v22;
  if (CGRectGetHeight(*(CGRect *)(&v22 - 3)) <= 2.22044605e-16)
  {
    -[RoutePlanningOutlineRootController bottomSafeOffset](self, "bottomSafeOffset");
    if (fabs(v39) <= 2.22044605e-16)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection"));
      v41 = objc_msgSend(v40, "count");

      if ((unint64_t)v41 > 1)
        height = height + 34.0;
    }
    v38 = r2;
    v60.origin.y = r2;
  }
  else
  {
    v59.origin.y = CGRectNull.origin.y;
    v59.origin.x = CGRectNull.origin.x;
    v59.size.width = v33;
    v59.size.height = v32;
    v63.origin.x = v13;
    v63.origin.y = y;
    v63.size.width = v16;
    v63.size.height = v37;
    v60 = CGRectUnion(v59, v63);
    v31 = v60.origin.x;
    v33 = v60.size.width;
    v32 = v60.size.height;
    height = height * 0.600000024;
    v38 = r2;
  }
  v42 = v31;
  v43 = v33;
  v44 = v32;
  v45 = v56;
  v46 = v57;
  v47 = height;
  v61 = CGRectUnion(v60, *(CGRect *)(&v38 - 1));
  v48 = v61.origin.x;
  v49 = v61.origin.y;
  v50 = v61.size.width;
  v51 = v61.size.height;

  v52 = v48;
  v53 = v49;
  v54 = v50;
  v55 = v51;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (BOOL)hasExpandedSteps
{
  NSArray *outlineSections;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  outlineSections = self->super._outlineSections;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006521F8;
  v5[3] = &unk_1011BEEF0;
  v5[4] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](outlineSections, "enumerateObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_hasExpandedStepsForRoute:(id)a3
{
  id v4;
  NSArray *outlineSections;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  outlineSections = self->super._outlineSections;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100652338;
  v8[3] = &unk_1011BF030;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSArray enumerateObjectsUsingBlock:](outlineSections, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(outlineSections) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)outlineSections;
}

- (void)expandCurrentlyFocusedRoute
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  char *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  v4 = sub_1002A8AA0(v3);

  if (v4 != 5)
  {
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v32 = "-[RoutePlanningOutlineRootController expandCurrentlyFocusedRoute]";
      v33 = 2080;
      v34 = "RoutePlanningOutlineRootController.m";
      v35 = 1024;
      v36 = 309;
      v37 = 2080;
      v38 = "MapsIdiomIsMac(self.collectionView)";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v32 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  v6 = sub_1002A8AA0(v5);

  if (v6 == 5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleCells"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v13, "isFocused") & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "indexPathForCell:", v13));

            v17 = (const char *)objc_msgSend(v16, "section");
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController _routeForExpandingOrCollapsingFromIndexPath:](self, "_routeForExpandingOrCollapsingFromIndexPath:", v16));

            if (v14
              && !-[RoutePlanningOutlineRootController _hasExpandedStepsForRoute:](self, "_hasExpandedStepsForRoute:", v14))
            {
              v18 = sub_100432FBC();
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                v20 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueRouteID"));
                *(_DWORD *)buf = 138412546;
                v32 = v20;
                v33 = 2048;
                v34 = v17;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Will expand steps for route %@ at index %lu", buf, 0x16u);

              }
              -[RoutePlanningOutlineRootController _toggleStepsExpansionForRoute:](self, "_toggleStepsExpansionForRoute:", v14);
            }
            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
          continue;
        break;
      }
    }

    v14 = 0;
LABEL_17:

  }
}

- (void)collapseCurrentlyFocusedRoute
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  char *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *(__cdecl **v33)(const char *, int);
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  v4 = sub_1002A8AA0(v3);

  if (v4 != 5)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v31 = "-[RoutePlanningOutlineRootController collapseCurrentlyFocusedRoute]";
      v32 = 2080;
      v33 = (char *(__cdecl **)(const char *, int))"RoutePlanningOutlineRootController.m";
      v34 = 1024;
      v35 = 333;
      v36 = 2080;
      v37 = "MapsIdiomIsMac(self.collectionView)";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v31 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  v6 = sub_1002A8AA0(v5);

  if (v6 == 5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleCells"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v13, "isFocused") & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "indexPathForCell:", v13));

            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController _routeForExpandingOrCollapsingFromIndexPath:](self, "_routeForExpandingOrCollapsingFromIndexPath:", v16));
            if (v14
              && -[RoutePlanningOutlineRootController _hasExpandedStepsForRoute:](self, "_hasExpandedStepsForRoute:", v14))
            {
              v17 = sub_100432FBC();
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                v19 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueRouteID"));
                *(_DWORD *)buf = 138412546;
                v31 = v19;
                v32 = 2048;
                v33 = &index;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Will collapse steps for route %@ at index %lu", buf, 0x16u);

              }
              -[RoutePlanningOutlineRootController _toggleStepsExpansionForRoute:](self, "_toggleStepsExpansionForRoute:", v14);
            }
            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v10)
          continue;
        break;
      }
    }

    v14 = 0;
LABEL_17:

  }
}

- (id)_routeForExpandingOrCollapsingFromIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(a3, "section")));
  v4 = objc_opt_class(RoutePlanningRouteOverviewOutlineSection);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (v5 = objc_opt_class(RoutePlanningRouteStepsOutlineSection),
        (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)toggleStepsExpansionForRouteAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  char *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  v6 = sub_1002A8AA0(v5);

  if (v6 != 5)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "-[RoutePlanningOutlineRootController toggleStepsExpansionForRouteAtIndexPath:]";
      v21 = 2080;
      v22 = "RoutePlanningOutlineRootController.m";
      v23 = 1024;
      v24 = 367;
      v25 = 2080;
      v26 = "MapsIdiomIsMac(self.collectionView)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

      }
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  v8 = sub_1002A8AA0(v7);

  if (v8 == 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeForRowAtIndexPath:](self, "routeForRowAtIndexPath:", v4));
    if (v9)
    {
      v10 = sub_100432FBC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueRouteID"));
        v13 = (const char *)objc_msgSend(v4, "section");
        v19 = 138412546;
        v20 = v12;
        v21 = 2048;
        v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Will toggle expanded steps for route %@ at index %ld", (uint8_t *)&v19, 0x16u);

      }
      -[RoutePlanningOutlineRootController _toggleStepsExpansionForRoute:](self, "_toggleStepsExpansionForRoute:", v9);
    }

  }
}

- (void)_toggleStepsExpansionForRoute:(id)a3
{
  NSMapTable *stepsSectionsByRoute;
  id v5;
  uint64_t v6;
  RoutePlanningRouteStepsOutlineSection *v7;
  int64_t v8;
  RoutePlanningRouteStepsOutlineSection *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RoutePlanningRouteStepsOutlineSection *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  RoutePlanningRouteStepsOutlineSection *v19;
  int64_t v20;

  stepsSectionsByRoute = self->_stepsSectionsByRoute;
  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](stepsSectionsByRoute, "objectForKey:", v5));
  if (v6)
  {
    v7 = (RoutePlanningRouteStepsOutlineSection *)v6;
    v8 = -[RoutePlanningOutlineController sectionIndexForOutlineSection:](self, "sectionIndexForOutlineSection:", v6);
    -[NSMapTable removeObjectForKey:](self->_stepsSectionsByRoute, "removeObjectForKey:", v5);
  }
  else
  {
    v9 = [RoutePlanningRouteStepsOutlineSection alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Route%lu.Steps"), objc_msgSend(v11, "indexOfRoute:", v5)));
    v7 = -[RoutePlanningOutlineSection initWithCollectionView:sectionIdentifier:](v9, "initWithCollectionView:sectionIdentifier:", v10, v12);

    -[RoutePlanningRouteStepsOutlineSection setRoute:](v7, "setRoute:", v5);
    -[RoutePlanningOutlineSection setHost:](v7, "setHost:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController stepsListDelegate](self, "stepsListDelegate"));
    -[RoutePlanningRouteStepsOutlineSection setStepsListDelegate:](v7, "setStepsListDelegate:", v13);

    -[NSMapTable setObject:forKey:](self->_stepsSectionsByRoute, "setObject:forKey:", v7, v5);
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_routeOverviewSectionsByRoute, "objectForKey:", v5));

  objc_msgSend(v14, "setExpanded:", v8 == 0x7FFFFFFFFFFFFFFFLL);
  -[RoutePlanningRouteStepsOutlineSection setCurrentRoute:](v7, "setCurrentRoute:", objc_msgSend(v14, "isCurrentRoute"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  v17[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100652F50;
  v18[3] = &unk_1011B15B0;
  v19 = v7;
  v20 = v8;
  v18[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10065301C;
  v17[3] = &unk_1011AE8F8;
  v16 = v7;
  objc_msgSend(v15, "performBatchUpdates:completion:", v18, v17);

}

- (void)markFeatureDiscoveryShown
{
  -[RoutePlanningFeatureDiscoverOutlineSection markFeatureDiscoveryViewShown](self->_featureDiscoverySection, "markFeatureDiscoveryViewShown");
}

- (double)estimatedFeatureDiscoveryHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  if (sub_1002A8AA0(v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
    v5 = sub_1002A8AA0(v4);

    if (v5 != 1)
      return 0.0;
  }
  else
  {

  }
  if (-[RoutePlanningFeatureDiscoverOutlineSection numberOfSections](self->_featureDiscoverySection, "numberOfSections") >= 1&& -[RoutePlanningFeatureDiscoverOutlineSection numberOfItemsInSection:](self->_featureDiscoverySection, "numberOfItemsInSection:", 0) >= 1)
  {
    +[FeatureDiscoveryView estimatedHeight](FeatureDiscoveryView, "estimatedHeight");
    return result;
  }
  return 0.0;
}

- (double)estimatedRoutePlanningAdvisoryFooterViewHeight
{
  double v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSAttributedStringKey v23;
  void *v24;

  v2 = 0.0;
  if (self->_advisoryInfo)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
    v5 = sub_1002A8AA0(v4);

    if (v5 == 5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAdvisoriesInfo genericAdvisorys](self->_advisoryInfo, "genericAdvisorys"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

      v8 = objc_alloc((Class)GEOComposedString);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noticeText"));
      v10 = objc_msgSend(v8, "initWithGeoFormattedString:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAdvisoryInfoFooterView learnMoreText](_TtC4Maps29RoutingAdvisoryInfoFooterView, "learnMoreText"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringWithDefaultOptions"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v12, v11));

      v23 = NSFontAttributeName;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
      v24 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
      objc_msgSend(v16, "frame");
      v18 = v17;
      +[RouteOverviewCell horizontalContentInset](RouteOverviewCell, "horizontalContentInset");
      v20 = v18 + v19 * -2.0;

      objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 1, v15, 0, v20, 1.79769313e308);
      v2 = v21 + 16.0;

    }
  }
  return v2;
}

- (id)routeForRowAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(a3, "section")));
  v4 = objc_opt_class(RoutePlanningRouteOverviewOutlineSection);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));
  else
    v5 = 0;

  return v5;
}

- (id)indexPathForRoute:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_routeOverviewSections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route", (_QWORD)v14));

        if (v11 == v4)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, -[RoutePlanningOutlineController sectionIndexForOutlineSection:](self, "sectionIndexForOutlineSection:", v10)));
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (int64_t)indexOfRouteForRowAtIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(a3, "section")));
  v5 = objc_opt_class(RoutePlanningRouteOverviewOutlineSection);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = -[NSArray indexOfObject:](self->_routeOverviewSections, "indexOfObject:", v4);
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (void)reloadExistingCellForRoute:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_routeOverviewSections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route", (_QWORD)v12));

        if (v11 == v4)
        {
          objc_msgSend(v10, "reloadExistingCell");
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)reloadVisibleRouteCells
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleItems"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "section")));
        v10 = objc_opt_class(RoutePlanningRouteOverviewOutlineSection);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          objc_msgSend(v9, "reloadExistingCell");

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)setAllowPersistentHighlight:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  _BOOL8 v9;
  _BOOL8 v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  __CFString *v23;

  if (self->_allowPersistentHighlight != a3)
  {
    v3 = a3;
    v5 = sub_100432FBC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v8 = v7;
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Set allowPersistentHighlight: %@", buf, 0xCu);

    }
    self->_allowPersistentHighlight = v3;
    v9 = -[RoutePlanningOutlineRootController _showPersistentHighlight](self, "_showPersistentHighlight");
    v10 = -[RoutePlanningOutlineRootController _showDetailButton](self, "_showDetailButton");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_routeOverviewSections;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v16, "setAllowPersistentHighlight:", v9, (_QWORD)v17);
          objc_msgSend(v16, "setShowDetailButton:", v10);
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

- (void)setAutomaticSharingContacts:(id)a3
{
  id v5;
  NSArray *automaticSharingContacts;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  unint64_t v26;

  v5 = a3;
  automaticSharingContacts = self->_automaticSharingContacts;
  v7 = (unint64_t)v5;
  v8 = automaticSharingContacts;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      v11 = sub_10043237C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "RoutePlanningOutlineRootController setting automatic sharing contacts: %@", buf, 0xCu);
      }

      v13 = sub_100432FBC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Set automaticSharingContacts: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_automaticSharingContacts, a3);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v15 = self->_routeOverviewSections;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v21;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "setAutomaticSharingContacts:", v7, (_QWORD)v20);
            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v17);
      }

    }
  }

}

- (BOOL)_showPersistentHighlight
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!-[RoutePlanningOutlineRootController allowsPersistentHighlight](self, "allowsPersistentHighlight"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection"));
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
    v4 = sub_1002A8AA0(v5) == 5;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)_showDetailButton
{
  BOOL v3;
  void *v4;

  if (-[RoutePlanningOutlineRootController allowsPersistentHighlight](self, "allowsPersistentHighlight"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController collectionView](self, "collectionView"));
  v3 = sub_1002A8AA0(v4) == 5;

  return v3;
}

- (void)_createRouteSectionsForCurrentRoutes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  void *v14;
  double v15;
  double v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  NSArray *v23;
  NSArray *routeOverviewSections;
  id v25;
  NSObject *v26;
  NSUInteger v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  NSUInteger v39;
  _BYTE v40[128];

  -[NSMapTable removeAllObjects](self->_routeOverviewSectionsByRoute, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_stepsSectionsByRoute, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRoute"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routes"));

  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "distance");
        if (v12 <= v15)
        {
          objc_msgSend(v14, "distance");
          v12 = v16;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }

  v17 = -[RoutePlanningOutlineRootController _showPersistentHighlight](self, "_showPersistentHighlight");
  v18 = -[RoutePlanningOutlineRootController _showDetailButton](self, "_showDetailButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100653EFC;
  v28[3] = &unk_1011BEF40;
  v28[4] = self;
  v32 = v18;
  v33 = v17;
  v20 = v4;
  v29 = v20;
  v21 = v19;
  v30 = v21;
  v22 = v7;
  v31 = v22;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v28);
  v23 = (NSArray *)objc_msgSend(v22, "copy");
  routeOverviewSections = self->_routeOverviewSections;
  self->_routeOverviewSections = v23;

  v25 = sub_100432FBC();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = -[NSArray count](self->_routeOverviewSections, "count");
    *(_DWORD *)buf = 134217984;
    v39 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Created %lu for current routes", buf, 0xCu);
  }

}

- (void)setDataCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_dataCoordinator, a3);
}

- (void)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4 isInACustomRouteRegion:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  int64_t transportType;
  RouteCollection *routeCollection;
  unint64_t v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  char v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSArray *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v38;
  NSMapTable *stepsSectionsByRoute;
  void *v40;
  void *v41;
  BOOL v42;
  id obja;
  _QWORD v45[5];
  char v46;
  unsigned __int8 v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  void *v57;

  v5 = a5;
  v8 = a4;
  v9 = sub_100432FBC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4)
      v11 = CFSTR("Undefined");
    else
      v11 = off_1011BF050[a3 - 1];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueRouteIDs"));
    *(_DWORD *)buf = 138412546;
    v55 = v11;
    v56 = 2112;
    v57 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "updateWithTransportType: %@, routeCollection: %@", buf, 0x16u);

  }
  transportType = self->_transportType;
  routeCollection = self->_routeCollection;
  v15 = (unint64_t)v8;
  v16 = (void *)v15;
  if (v15 | (unint64_t)routeCollection)
    v17 = objc_msgSend((id)v15, "isEqual:", routeCollection);
  else
    v17 = 1;

  v18 = -[RoutePlanningOutlineRootController isInACustomRouteRegion](self, "isInACustomRouteRegion") ^ v5;
  v19 = transportType != a3 || v17 == 0;
  if (v19 || (v18 & 1) != 0)
  {
    if (transportType == a3)
      v22 = v18;
    else
      v22 = 1;
    if ((v22 & 1) != 0)
    {
      v23 = 1;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routes"));
      v25 = v16;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self->_routeCollection, "routes"));
      v42 = v5;
      v27 = objc_msgSend(v24, "isEqualToArray:", v26);

      v16 = v25;
      v23 = v27 ^ 1;
      LOBYTE(v5) = v42;
    }
    objc_storeStrong((id *)&self->_routeCollection, a4);
    self->_transportType = a3;
    self->_isInACustomRouteRegion = v5;
    v28 = -[RoutePlanningFeatureDiscoverOutlineSection updateWithTransportType:routeCollection:](self->_featureDiscoverySection, "updateWithTransportType:routeCollection:", a3, v16);
    if ((v23 & 1) != 0 || (v28 & 1) != 0)
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1006545A0;
      v45[3] = &unk_1011BEF68;
      v46 = v17;
      v47 = v28;
      v48 = v18 ^ 1;
      v45[4] = self;
      -[RoutePlanningOutlineController performBatchSectionUpdates:](self, "performBatchSectionUpdates:", v45);
    }
    else
    {
      v29 = sub_100432FBC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Only current route changed", buf, 2u);
      }

      obja = v16;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentRoute"));
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v32 = self->_routeOverviewSections;
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "route"));
            objc_msgSend(v37, "setCurrentRoute:", v38 == v31);

            stepsSectionsByRoute = self->_stepsSectionsByRoute;
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "route"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](stepsSectionsByRoute, "objectForKey:", v40));

            objc_msgSend(v41, "setCurrentRoute:", objc_msgSend(v37, "isCurrentRoute"));
          }
          v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        }
        while (v34);
      }

      v16 = obja;
    }
  }
  else
  {
    v20 = sub_100432FBC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "No changes, exit early", buf, 2u);
    }

  }
}

- (void)setRouteCellDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routeCellDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_routeCellDelegate, v4);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_routeOverviewSections;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setRouteCellDelegate:", v4, (_QWORD)v11);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setRouteCreationDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routeCreationDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_routeCreationDelegate, obj);
    -[RoutePlanningRouteCreationOutlineSection setRouteCreationDelegate:](self->_routeCreationSection, "setRouteCreationDelegate:", obj);
  }

}

- (void)setRouteSelectionDelegate:(id)a3
{
  RouteRowSelectionDelegate **p_routeSelectionDelegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_routeSelectionDelegate = &self->_routeSelectionDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_routeSelectionDelegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_routeSelectionDelegate, obj);
    v6 = obj;
  }

}

- (void)setStepsListDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stepsListDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_stepsListDelegate, v4);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_stepsSectionsByRoute, "objectEnumerator", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "setStepsListDelegate:", v4);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)setTransitPayActionDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  uint64_t Log;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

    if (WeakRetained != v4)
    {
      objc_storeWeak((id *)&self->_transitPayActionDelegate, v4);
      -[RoutePlanningFeatureDiscoverOutlineSection setTransitPayActionDelegate:](self->_featureDiscoverySection, "setTransitPayActionDelegate:", v4);
    }
  }
  else
  {
    v6 = sub_10043253C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RoutePlanningOutlineRootController.m";
      v12 = 1024;
      v13 = 677;
      v14 = 2082;
      v15 = "-[RoutePlanningOutlineRootController setTransitPayActionDelegate:]";
      v16 = 2082;
      v17 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", (uint8_t *)&v10, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RoutePlanningOutlineRootController.m";
      v12 = 1024;
      v13 = 677;
      v14 = 2082;
      v15 = "-[RoutePlanningOutlineRootController setTransitPayActionDelegate:]";
      v16 = 2082;
      v17 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", (uint8_t *)&v10, 0x26u);
    }

  }
}

- (void)setupAdvisoryInfoLayout:(id)a3 tapHandler:(id)a4
{
  id v7;
  id v8;
  id advisoryTapHandler;
  id v10;

  v10 = a3;
  v7 = a4;
  if (MapsFeature_IsEnabled_FrenchClimateLaw())
  {
    objc_storeStrong((id *)&self->_advisoryInfo, a3);
    self->_shouldReloadFooterView = v10 != 0;
    v8 = objc_retainBlock(v7);
    advisoryTapHandler = self->_advisoryTapHandler;
    self->_advisoryTapHandler = v8;

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)RoutePlanningOutlineRootController;
  -[RoutePlanningOutlineController collectionView:didSelectItemAtIndexPath:](&v29, "collectionView:didSelectItemAtIndexPath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", objc_msgSend(v7, "section")));
  v9 = objc_opt_class(RoutePlanningRouteOverviewOutlineSection);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeSelectionDelegate](self, "routeSelectionDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));

    objc_msgSend(v11, "dataSource:didSelectRowForRoute:", self, v12);
    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 0);
  }
  else
  {
    v13 = objc_opt_class(RoutePlanningRouteStepsOutlineSection);
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    {
      v24 = v7;
      v23 = v8;
      v14 = v8;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_routeOverviewSectionsByRoute, "keyEnumerator"));
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_routeOverviewSectionsByRoute, "objectForKey:", v20));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "route"));
            objc_msgSend(v21, "setHasSelectedStep:", v20 == v22);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v17);
      }

      v7 = v24;
      v8 = v23;
    }
  }

}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController routeCollection](self, "routeCollection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentRoute"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineRootController indexPathForRoute:](self, "indexPathForRoute:", v7));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  }
  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BYTE *v15;
  id v16;
  uint64_t v17;
  id v18;
  objc_super v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", UICollectionElementKindSectionFooter))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAdvisoriesInfo genericAdvisorys](self->_advisoryInfo, "genericAdvisorys"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAdvisoryInfoFooterView reuseIdentifier](_TtC4Maps29RoutingAdvisoryInfoFooterView, "reuseIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v13, v10));

    if (self->_shouldReloadFooterView
      && (v15 = objc_msgSend(v10, "section"), v15 == (char *)objc_msgSend(v8, "numberOfSections") - 1)
      && v12
      && (v16 = objc_msgSend(v12, "shouldAlwaysShowAdvisoryCard"), (_DWORD)v16)
      && MapsFeature_IsEnabled_FrenchClimateLaw(v16, v17))
    {
      objc_initWeak(&location, self);
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x3042000000;
      v23[3] = sub_100655230;
      v23[4] = sub_10065523C;
      objc_initWeak(&v24, v14);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100655244;
      v21[3] = &unk_1011BEF90;
      objc_copyWeak(&v22, &location);
      v21[4] = v23;
      objc_msgSend(v14, "updateDescriptionInfo:tapHandler:", v12, v21);
      objc_destroyWeak(&v22);
      _Block_object_dispose(v23, 8);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v14, "frame");
      objc_msgSend(v14, "setFrame:");
      objc_msgSend(v14, "setAlpha:", 0.0);
    }

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)RoutePlanningOutlineRootController;
    v18 = -[RoutePlanningOutlineController collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v20, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v18);
  }

  return v14;
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  return (RoutePlanningDataCoordination *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void)setRouteCollection:(id)a3
{
  objc_storeStrong((id *)&self->_routeCollection, a3);
}

- (NSArray)automaticSharingContacts
{
  return self->_automaticSharingContacts;
}

- (BOOL)allowsPersistentHighlight
{
  return self->_allowPersistentHighlight;
}

- (BOOL)hasFeatureDiscoverySection
{
  return self->_hasFeatureDiscoverySection;
}

- (void)setHasFeatureDiscoverySection:(BOOL)a3
{
  self->_hasFeatureDiscoverySection = a3;
}

- (RouteOverviewCellDelegate)routeCellDelegate
{
  return (RouteOverviewCellDelegate *)objc_loadWeakRetained((id *)&self->_routeCellDelegate);
}

- (RoutePlanningOverviewRouteCreationCellDelegate)routeCreationDelegate
{
  return (RoutePlanningOverviewRouteCreationCellDelegate *)objc_loadWeakRetained((id *)&self->_routeCreationDelegate);
}

- (RouteRowSelectionDelegate)routeSelectionDelegate
{
  return (RouteRowSelectionDelegate *)objc_loadWeakRetained((id *)&self->_routeSelectionDelegate);
}

- (TransitDirectionsStepsListDelegate)stepsListDelegate
{
  return (TransitDirectionsStepsListDelegate *)objc_loadWeakRetained((id *)&self->_stepsListDelegate);
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  return (TransitPayActionDelegate *)objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);
}

- (double)bottomSafeOffset
{
  return self->_bottomSafeOffset;
}

- (void)setBottomSafeOffset:(double)a3
{
  self->_bottomSafeOffset = a3;
}

- (BOOL)isInACustomRouteRegion
{
  return self->_isInACustomRouteRegion;
}

- (void)setIsInACustomRouteRegion:(BOOL)a3
{
  self->_isInACustomRouteRegion = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_destroyWeak((id *)&self->_stepsListDelegate);
  objc_destroyWeak((id *)&self->_routeSelectionDelegate);
  objc_destroyWeak((id *)&self->_routeCreationDelegate);
  objc_destroyWeak((id *)&self->_routeCellDelegate);
  objc_storeStrong((id *)&self->_automaticSharingContacts, 0);
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong(&self->_advisoryTapHandler, 0);
  objc_storeStrong((id *)&self->_advisoryInfo, 0);
  objc_storeStrong((id *)&self->_stepsSectionsByRoute, 0);
  objc_storeStrong((id *)&self->_routeOverviewSectionsByRoute, 0);
  objc_storeStrong((id *)&self->_routeCreationSection, 0);
  objc_storeStrong((id *)&self->_routeOverviewSections, 0);
  objc_storeStrong((id *)&self->_featureDiscoverySection, 0);
}

@end
