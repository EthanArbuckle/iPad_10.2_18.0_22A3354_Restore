@implementation CarBaseSearchViewController

- (CarBaseSearchViewController)initWithDisabledETAUpdates:(BOOL)a3
{
  CarBaseSearchViewController *v4;
  CarBaseSearchViewController *v5;
  uint64_t v6;
  NSMapTable *modelsByItem;
  uint64_t v8;
  NSMapTable *lastKnownETAResultsForItem;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CarBaseSearchViewController;
  v4 = -[CarBaseSearchViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_disableETAUpdates = a3;
    v4->_suppressETAUpdates = 1;
    v4->_cellStyle = 0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    modelsByItem = v5->_modelsByItem;
    v5->_modelsByItem = (NSMapTable *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    lastKnownETAResultsForItem = v5->_lastKnownETAResultsForItem;
    v5->_lastKnownETAResultsForItem = (NSMapTable *)v8;

    -[CarBaseSearchViewController prepareQuickRouteETAs](v5, "prepareQuickRouteETAs");
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v3, "stopLocationUpdateWithObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarBaseSearchViewController;
  -[CarBaseSearchViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarBaseSearchViewController;
  -[CarBaseSearchViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  self->_suppressETAUpdates = 0;
  -[CarBaseSearchViewController setUserIsActive:](self, "setUserIsActive:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSIndexPath *lastSelectedIndexPath;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarBaseSearchViewController;
  -[CarBaseSearchViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v4, "startLocationUpdateWithObserver:", self);

  -[CarBaseSearchViewController setUserIsActive:](self, "setUserIsActive:", 0);
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = 0;

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarBaseSearchViewController;
  -[CarBaseSearchViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[CarBaseSearchViewController _markAllQuickRouteManagersNotVisible](self, "_markAllQuickRouteManagersNotVisible");
  -[CarBaseSearchViewController setUserIsActive:](self, "setUserIsActive:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarBaseSearchViewController;
  -[CarBaseSearchViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  self->_suppressETAUpdates = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v4, "stopLocationUpdateWithObserver:", self);

}

- (void)setUserIsActive:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  if (a3)
  {
    self->_userIsActive = 1;
    +[CarQuickRouteRefreshOperation suspendQueues:](CarQuickRouteRefreshOperation, "suspendQueues:", 1);
    -[CarBaseSearchViewController _markAllQuickRouteManagersNotVisible](self, "_markAllQuickRouteManagersNotVisible");
  }
  else if (!-[CarBaseSearchViewController userIsActiveStateChangeQueued](self, "userIsActiveStateChangeQueued"))
  {
    -[CarBaseSearchViewController setUserIsActiveStateChangeQueued:](self, "setUserIsActiveStateChangeQueued:", 1);
    v4 = dispatch_time(0, 1000000000* +[CarQuickRouteRefreshOperation throttlePreventionLevel](CarQuickRouteRefreshOperation, "throttlePreventionLevel"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100532754;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)prepareQuickRouteETAs
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *quickRouteManagers;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!self->_disableETAUpdates)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v4 = objc_msgSend(v3, "isAuthorizedForPreciseLocation");

    if (v4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_quickRouteManagers, "allValues", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v10, "set_Car_isVisible:", 0);
            objc_msgSend(v10, "_Car_cancelUpdateETA");
            objc_msgSend(v10, "setDelegate:", 0);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }

      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      quickRouteManagers = self->_quickRouteManagers;
      self->_quickRouteManagers = v11;

    }
  }
}

- (void)continueQuickRouteETAs
{
  void *v3;
  unsigned int v4;

  if (-[CarBaseSearchViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!self->_disableETAUpdates)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v4 = objc_msgSend(v3, "isAuthorizedForPreciseLocation");

      if (v4)
      {
        if (!self->_userIsActive)
        {
          if (-[CarBaseSearchViewController _markVisibleQuickRouteManagersVisible](self, "_markVisibleQuickRouteManagersVisible"))
          {
            +[CarQuickRouteRefreshOperation suspendQueues:](CarQuickRouteRefreshOperation, "suspendQueues:", 0);
          }
        }
      }
    }
  }
}

- (void)updateAllETAs
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!self->_suppressETAUpdates && !self->_disableETAUpdates)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v4 = objc_msgSend(v3, "isAuthorizedForPreciseLocation");

    if (v4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_quickRouteManagers, "allValues", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v10, "_Car_etaAge");
            if (v11 <= 90.0)
            {
              objc_msgSend(v10, "_Car_etaAge");
              if (v12 >= 0.0)
                continue;
            }
            objc_msgSend(v10, "_Car_queueUpdateETA");
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }

    }
  }
}

- (id)_lastKnownETAForItem:(id)a3
{
  void *v3;
  double Current;
  double v5;
  void *v6;
  id v7;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_lastKnownETAResultsForItem, "objectForKey:"));
    if (v3)
    {
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v3, "responseTime");
      if (Current - v5 >= 90.0)
        v6 = 0;
      else
        v6 = v3;
      v7 = v6;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_lastKnownETAForIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController _lastKnownETAForItem:](self, "_lastKnownETAForItem:", v4));

  return v5;
}

- (unint64_t)_markVisibleQuickRouteManagersVisible
{
  void *v3;
  unsigned int v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v4 = objc_msgSend(v3, "_maps_isVisible");

  if (!v4)
    return 0;
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView indexPathsForVisibleRows](self->_tableView, "indexPathsForVisibleRows"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController _quickRouteManagerForIndexPath:](self, "_quickRouteManagerForIndexPath:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10)));
        if (v11)
        {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
          objc_msgSend(v11, "set_Car_isVisible:", 1);
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_Car_refreshOperation"));
          if (!v12
            || (v13 = (void *)v12,
                v14 = objc_msgSend(v11, "_Car_isPrimaryRefreshQueue"),
                v13,
                (v14 & 1) == 0))
          {
            objc_msgSend(v11, "_Car_queueUpdateETA");
          }
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  v15 = objc_msgSend(v6, "count");

  return (unint64_t)v15;
}

- (void)_markAllQuickRouteManagersNotVisible
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_quickRouteManagers, "allValues", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "set_Car_isVisible:", 0);
        objc_msgSend(v7, "_Car_cancelUpdateETA");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_quickRouteManagerForIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_quickRouteManagers, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController modelForItemAtIndexPath:](self, "modelForItemAtIndexPath:", v4));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));

    if (v5)
    {
      v5 = objc_alloc_init((Class)_MKQuickRouteManager);
      objc_msgSend(v5, "setDelegate:", self);
      objc_msgSend(v5, "setView:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
      objc_msgSend(v5, "setMapItem:", v7);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_quickRouteManagers, "setObject:forKeyedSubscript:", v5, v4);
    }

  }
  return v5;
}

- (void)quickRouteManager:(id)a3 didUpdateETA:(id)a4 error:(id)a5 animated:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  CarBaseSearchViewController *v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100533064;
  v16[3] = &unk_1011AE758;
  v12 = a5;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = self;
  v14 = v11;
  v20 = v14;
  v21 = a6;
  v15 = objc_retainBlock(v16);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v15[2])(v15);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

}

- (void)_applyRouteETA:(id)a3 toCell:(id)a4 animated:(BOOL)a5
{
  _objc_msgSend(a4, "setRouteETA:animated:", a3, a5);
}

- (unint64_t)preferredDirectionsTypeForQuickRoute
{
  return 1;
}

- (BOOL)quickRouteShouldOnlyUseAutomobile
{
  return 1;
}

- (BOOL)quickRouteShouldIncludeTransitWhenNotPreferredTransportType
{
  return 0;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  -[CarBaseSearchViewController updateAllETAs](self, "updateAllETAs", a3);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (id)itemAtIndexPath:(id)a3
{
  return 0;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController modelForItem:](self, "modelForItem:", v4));

  return v5;
}

- (id)modelForItem:(id)a3
{
  return -[NSMapTable objectForKey:](self->_modelsByItem, "objectForKey:", a3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[CarBaseSearchViewController setUserIsActive:](self, "setUserIsActive:", 1);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v5;
  void *v6;
  id v7;

  if (a4.y <= 0.0)
    v5 = 7;
  else
    v5 = 8;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance", a3, a5, a4.x));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  objc_msgSend(v6, "captureUserAction:", v5);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[CarBaseSearchViewController setUserIsActive:](self, "setUserIsActive:", 0);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[CarBaseSearchViewController setUserIsActive:](self, "setUserIsActive:", 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  if (!self->_disableETAUpdates)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v9 = objc_msgSend(v8, "isAuthorizedForPreciseLocation");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController _lastKnownETAForIndexPath:](self, "_lastKnownETAForIndexPath:", v7));
      if (v10)
      {
        -[CarBaseSearchViewController _applyRouteETA:toCell:animated:](self, "_applyRouteETA:toCell:animated:", v10, v12, 1);
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController _quickRouteManagerForIndexPath:](self, "_quickRouteManagerForIndexPath:", v7));
        if (v11)
        {
          if (!-[CarBaseSearchViewController userIsActive](self, "userIsActive"))
            objc_msgSend(v11, "set_Car_isVisible:", 1);
          objc_msgSend(v11, "_Car_queueUpdateETA");
          objc_msgSend(v12, "expectUpdatedRouteETA");
        }

      }
    }
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  double v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController itemAtIndexPath:](self, "itemAtIndexPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController modelForItemAtIndexPath:](self, "modelForItemAtIndexPath:", v5));

  if (!v7)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCellModel modelWithUpdateBlock:](CarSearchItemCellModel, "modelWithUpdateBlock:", 0));
    objc_msgSend(v6, "updateModel:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rating"));
  if (v8)
  {

  }
  else if ((objc_msgSend(v7, "shouldShowChargerlabel") & 1) == 0)
  {
    goto LABEL_7;
  }
  if ((id)-[CarBaseSearchViewController cellStyle](self, "cellStyle") != (id)1)
  {
    v9 = &CarSearchItemCellThreeLineHeight;
    goto LABEL_9;
  }
LABEL_7:
  v9 = &CarSearchItemCellTwoLineHeight;
LABEL_9:
  v10 = *(double *)v9;

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCell reuseIdentifier](CarSearchItemCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController itemAtIndexPath:](self, "itemAtIndexPath:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController modelForItemAtIndexPath:](self, "modelForItemAtIndexPath:", v7));
  if (!v11)
  {
    objc_initWeak(&location, v9);
    objc_initWeak(&from, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10053370C;
    v14[3] = &unk_1011BA7E0;
    objc_copyWeak(&v15, &from);
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    v12 = objc_retainBlock(v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCellModel modelWithUpdateBlock:](CarSearchItemCellModel, "modelWithUpdateBlock:", v12));
    -[NSMapTable setObject:forKey:](self->_modelsByItem, "setObject:forKey:", v11, v10);
    objc_msgSend(v10, "updateModel:", v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v11, "setIsRecent:", objc_msgSend(v7, "section") == (id)1);
  objc_msgSend(v9, "setupWithModel:cellStyle:", v11, -[CarBaseSearchViewController cellStyle](self, "cellStyle"));

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSIndexPath *v6;
  NSIndexPath *lastSelectedIndexPath;

  v6 = (NSIndexPath *)a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = v6;

}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  id v4;
  void *v5;
  NSIndexPath *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController itemAtIndexPath:](self, "itemAtIndexPath:", self->_lastSelectedIndexPath));

  if (v5)
  {
    v6 = self->_lastSelectedIndexPath;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleRows"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleRows"));
      v6 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (CarTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, a3);
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (BOOL)userIsActive
{
  return self->_userIsActive;
}

- (BOOL)userIsActiveStateChangeQueued
{
  return self->_userIsActiveStateChangeQueued;
}

- (void)setUserIsActiveStateChangeQueued:(BOOL)a3
{
  self->_userIsActiveStateChangeQueued = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_modelsByItem, 0);
  objc_storeStrong((id *)&self->_lastFetchedFromLocation, 0);
  objc_storeStrong((id *)&self->_lastKnownETAResultsForItem, 0);
  objc_storeStrong((id *)&self->_quickRouteManagers, 0);
}

@end
