@implementation QuickActionMenuPresenter

- (QuickActionMenuPresenter)init
{
  QuickActionMenuPresenter *result;

  result = (QuickActionMenuPresenter *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (QuickActionMenuPresenter)initWithView:(id)a3
{
  id v5;
  QuickActionMenuPresenter *v6;
  QuickActionMenuPresenter *v7;
  UIContextMenuInteraction *v8;
  UIContextMenuInteraction *contextMenuInteraction;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QuickActionMenuPresenter;
  v6 = -[QuickActionMenuPresenter init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gestureView, a3);
    v7->_enabled = 1;
    v8 = (UIContextMenuInteraction *)objc_msgSend(objc_alloc((Class)UIContextMenuInteraction), "initWithDelegate:", v7);
    contextMenuInteraction = v7->_contextMenuInteraction;
    v7->_contextMenuInteraction = v8;

    -[UIView addInteraction:](v7->_gestureView, "addInteraction:", v7->_contextMenuInteraction);
  }

  return v7;
}

- (void)cancelPresentationGesture
{
  -[UIView removeInteraction:](self->_gestureView, "removeInteraction:", self->_contextMenuInteraction);
  -[UIView addInteraction:](self->_gestureView, "addInteraction:", self->_contextMenuInteraction);
}

- (void)_prepareActions
{
  VKLabelMarker *labelMarker;
  void *v4;
  void *v5;
  _QWORD *v6;
  NSArray *v7;
  SearchResult *searchResult;
  uint64_t v9;
  void **v10;
  SearchResult *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  PersonalizedItem *place;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *actions;
  _QWORD v34[5];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[2];
  void *v38;
  _QWORD v39[2];
  _QWORD v40[3];
  void *v41;
  void *v42;
  _QWORD v43[2];

  labelMarker = self->_labelMarker;
  if (labelMarker && -[VKLabelMarker isTransitLine](labelMarker, "isTransitLine"))
  {
    if ((id)-[VKLabelMarker _maps_numLines](self->_labelMarker, "_maps_numLines") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter transitLineDirectionsAction](self, "transitLineDirectionsAction"));
      v43[0] = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter transitLineViewOnMapAction](self, "transitLineViewOnMapAction"));
      v43[1] = v5;
      v6 = v43;
LABEL_5:
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
LABEL_21:

      goto LABEL_24;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter transitLineViewOnMapAction](self, "transitLineViewOnMapAction"));
    v42 = v4;
    v10 = &v42;
LABEL_23:
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 1));
    goto LABEL_24;
  }
  searchResult = self->_searchResult;
  if (searchResult)
  {
    v9 = objc_opt_class(UserLocationSearchResult);
    if ((objc_opt_isKindOfClass(searchResult, v9) & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter sendMyLocationAction](self, "sendMyLocationAction"));
      v41 = v4;
      v10 = &v41;
      goto LABEL_23;
    }
    v11 = self->_searchResult;
    if (v11)
    {
      if (-[SearchResult appearance](v11, "appearance") == 3)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
        v13 = objc_msgSend(v12, "isCustomSearchResult:", self->_searchResult);

        if (!v13)
        {
          v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter dropPinAction](self, "dropPinAction"));
          v39[0] = v4;
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter shareAction](self, "shareAction"));
          v39[1] = v5;
          v6 = v39;
          goto LABEL_5;
        }
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter directionsAction](self, "directionsAction"));
        v40[0] = v4;
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter removeDroppedPinAction](self, "removeDroppedPinAction"));
        v40[1] = v5;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter shareAction](self, "shareAction"));
        v40[2] = v14;
        v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 3));
LABEL_20:

        goto LABEL_21;
      }
    }
  }
  place = self->_place;
  if (!place || (v16 = objc_opt_class(SuggestionsItem), (objc_opt_isKindOfClass(place, v16) & 1) == 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter directionsAction](self, "directionsAction"));
    v35[0] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter callAction](self, "callAction"));
    v35[1] = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter webAction](self, "webAction"));
    v35[2] = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter shareAction](self, "shareAction"));
    v35[3] = v20;
    v21 = v35;
LABEL_19:
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));

    goto LABEL_20;
  }
  if (-[PersonalizedItem suggestionType](self->_place, "suggestionType") != (id)24)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter directionsAction](self, "directionsAction"));
    v36[0] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter callAction](self, "callAction"));
    v36[1] = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter webAction](self, "webAction"));
    v36[2] = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter shareAction](self, "shareAction"));
    v36[3] = v20;
    v21 = v36;
    goto LABEL_19;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter shareAction](self, "shareAction"));
  v38 = v17;
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));

  if (!-[QuickActionMenuPresenter _directionsEnabled](self, "_directionsEnabled"))
    goto LABEL_25;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter directionsAction](self, "directionsAction"));
  v37[0] = v4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter shareAction](self, "shareAction"));
  v37[1] = v18;
  v19 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));

  v7 = (NSArray *)v19;
LABEL_24:

LABEL_25:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter delegate](self, "delegate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter place](self, "place"));
  v24 = objc_msgSend(v22, "shouldQuickActionMenuPresenter:showDirectionsToPlace:", self, v23);

  if ((v24 & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v25, "shouldShowAddStopForDirectionsInQuickActionMenuPresenter:") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter delegate](self, "delegate"));
      v27 = objc_msgSend(v26, "shouldShowAddStopForDirectionsInQuickActionMenuPresenter:", self);

      if (v27)
      {
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1002E9420;
        v34[3] = &unk_1011B0C00;
        v34[4] = self;
        v28 = sub_10039DCD4(v7, v34);
        v29 = objc_claimAutoreleasedReturnValue(v28);

        v7 = (NSArray *)v29;
      }
    }
    else
    {

    }
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter directionsAction](self, "directionsAction"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter _predicateToRemoveAction:](self, "_predicateToRemoveAction:", v30));
    v32 = objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](v7, "filteredArrayUsingPredicate:", v31));

    v7 = (NSArray *)v32;
  }
  actions = self->_actions;
  self->_actions = v7;

}

- (void)_prepareData
{
  QuickActionMenuPresenterDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CLLocation *lastValidLocation;
  _BOOL4 v14;
  CLLocation *v15;
  OS_dispatch_group *v16;
  OS_dispatch_group *resolveGroup;
  CLLocation *v18;
  CLLocationCoordinate2D v19;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "quickActionMenuWillPresent:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "quickActionMenuWillPresent:", self);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocation"));

  v18 = v8;
  if (v18)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocation timestamp](v18, "timestamp"));
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    lastValidLocation = v18;
    if (v12 <= 300.0)
    {
      -[CLLocation coordinate](v18, "coordinate");
      v14 = CLLocationCoordinate2DIsValid(v19);

      if (!v14)
        goto LABEL_9;
      v15 = v18;
      lastValidLocation = self->_lastValidLocation;
      self->_lastValidLocation = v15;
    }
  }
  else
  {
    lastValidLocation = 0;
  }

LABEL_9:
  v16 = (OS_dispatch_group *)dispatch_group_create();
  resolveGroup = self->_resolveGroup;
  self->_resolveGroup = v16;

  if (self->_place)
  {
    -[QuickActionMenuPresenter updateForPlace:](self, "updateForPlace:");
  }
  else if (self->_labelMarker)
  {
    -[QuickActionMenuPresenter updateForLabelMarker:](self, "updateForLabelMarker:");
  }
  else if (self->_searchResult)
  {
    -[QuickActionMenuPresenter updateForSearchResult:](self, "updateForSearchResult:");
  }

}

- (BOOL)_contextMenuInteractionShouldBegin:(id)a3
{
  id v4;
  id WeakRetained;
  BOOL v6;

  v4 = a3;
  -[QuickActionMenuPresenter reset](self, "reset");
  if (-[QuickActionMenuPresenter enabled](self, "enabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "locationInView:", self->_gestureView);
    if (objc_msgSend(WeakRetained, "shouldQuickActionMenuPresenter:presentAtLocation:inView:", self, self->_gestureView))
    {
      objc_msgSend(v4, "locationInView:", self->_gestureView);
      v6 = -[QuickActionMenuPresenter shouldBeginOrbGestureAtLocation:inView:](self, "shouldBeginOrbGestureAtLocation:inView:", self->_gestureView);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)previewViewController
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (-[QuickActionMenuPresenter _contextMenuInteractionShouldBegin:](self, "_contextMenuInteractionShouldBegin:", v7))
  {
    self->_actionsDisplayed = 0;
    self->_location.x = x;
    self->_location.y = y;
    -[QuickActionMenuPresenter _prepareData](self, "_prepareData");
    -[QuickActionMenuPresenter _prepareActions](self, "_prepareActions");
    +[GEOAPPortal captureUserAction:target:value:placeActionDetails:](GEOAPPortal, "captureUserAction:target:value:placeActionDetails:", 17080, self->_uiTarget, 0, self->_actionDetails);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002E9820;
    v12[3] = &unk_1011B0C28;
    objc_copyWeak(&v13, &location);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002E9858;
    v10[3] = &unk_1011B0C50;
    objc_copyWeak(&v11, &location);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v12, v10));
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a5, "setPreferredCommitStyle:", 0, a4);
  -[QuickActionMenuPresenter handleTapPreview](self, "handleTapPreview");
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  +[GEOAPPortal captureUserAction:target:value:placeActionDetails:](GEOAPPortal, "captureUserAction:target:value:placeActionDetails:", 17072, self->_uiTarget, 0, self->_actionDetails);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice", a3, a4, a5));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == (id)5)
    -[QuickActionMenuPresenter reset](self, "reset");
}

- (id)directionsAction
{
  void *v3;
  void *v4;
  void *v5;
  UIAction *v6;
  UIAction *directionsAction;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_directionsAction)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Directions Orb"), CFSTR("localized string not found"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.turn.up.right")));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1002E9B04;
    v13 = &unk_1011AF8A0;
    objc_copyWeak(&v14, &location);
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v5, CFSTR("_directionsAction"), &v10));
    directionsAction = self->_directionsAction;
    self->_directionsAction = v6;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("Directions"), v10, v11, v12, v13));
  -[UIAction setAccessibilityIdentifier:](self->_directionsAction, "setAccessibilityIdentifier:", v8);

  return self->_directionsAction;
}

- (id)addStopAction
{
  void *v3;
  void *v4;
  void *v5;
  UIAction *v6;
  UIAction *addStopAction;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_addStopAction)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Add Stop Orb"), CFSTR("localized string not found"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.circle")));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1002E9CB4;
    v13 = &unk_1011AF8A0;
    objc_copyWeak(&v14, &location);
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v5, CFSTR("_addStopAction"), &v10));
    addStopAction = self->_addStopAction;
    self->_addStopAction = v6;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("AddStop"), v10, v11, v12, v13));
  -[UIAction setAccessibilityIdentifier:](self->_addStopAction, "setAccessibilityIdentifier:", v8);

  return self->_addStopAction;
}

- (id)callAction
{
  void *v3;
  void *v4;
  void *v5;
  UIAction *v6;
  UIAction *callAction;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_callAction)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Call"), CFSTR("localized string not found"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("phone")));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1002E9E7C;
    v13 = &unk_1011AF8A0;
    objc_copyWeak(&v14, &location);
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v5, CFSTR("_callAction"), &v10));
    callAction = self->_callAction;
    self->_callAction = v6;

    -[UIAction setAttributes:](self->_callAction, "setAttributes:", -[QuickActionMenuPresenter _callEnabled](self, "_callEnabled", v10, v11, v12, v13) ^ 1);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("Call")));
  -[UIAction setAccessibilityIdentifier:](self->_callAction, "setAccessibilityIdentifier:", v8);

  return self->_callAction;
}

- (id)webAction
{
  void *v3;
  void *v4;
  void *v5;
  UIAction *v6;
  UIAction *webAction;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_webAction)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Open Homepage"), CFSTR("localized string not found"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("safari")));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1002EA044;
    v13 = &unk_1011AF8A0;
    objc_copyWeak(&v14, &location);
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v5, CFSTR("_webAction"), &v10));
    webAction = self->_webAction;
    self->_webAction = v6;

    -[UIAction setAttributes:](self->_webAction, "setAttributes:", -[QuickActionMenuPresenter _webEnabled](self, "_webEnabled", v10, v11, v12, v13) ^ 1);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("OpenHomepage")));
  -[UIAction setAccessibilityIdentifier:](self->_webAction, "setAccessibilityIdentifier:", v8);

  return self->_webAction;
}

- (id)dropPinAction
{
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *dropPinAction;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  if (!self->_dropPinAction)
  {
    v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    if (v3)
      v6 = CFSTR("Mark Location");
    else
      v6 = CFSTR("Drop Pin");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("mappin")));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1002EA214;
    v16 = &unk_1011AF8A0;
    objc_copyWeak(&v17, &location);
    v9 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, v8, CFSTR("_dropPinAction"), &v13));
    dropPinAction = self->_dropPinAction;
    self->_dropPinAction = v9;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("DropPin"), v13, v14, v15, v16));
  -[UIAction setAccessibilityIdentifier:](self->_dropPinAction, "setAccessibilityIdentifier:", v11);

  return self->_dropPinAction;
}

- (id)removeDroppedPinAction
{
  void *v3;
  void *v4;
  void *v5;
  UIAction *v6;
  UIAction *removeDroppedPinAction;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_removeDroppedPinAction)
  {
    +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Remove Marked Location"), CFSTR("localized string not found"), 0));

    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("mappin.slash")));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1002EA3D0;
    v13 = &unk_1011AF8A0;
    objc_copyWeak(&v14, &location);
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v5, CFSTR("_removeDroppedPinAction"), &v10));
    removeDroppedPinAction = self->_removeDroppedPinAction;
    self->_removeDroppedPinAction = v6;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("RemovePin"), v10, v11, v12, v13));
  -[UIAction setAccessibilityIdentifier:](self->_removeDroppedPinAction, "setAccessibilityIdentifier:", v8);

  return self->_removeDroppedPinAction;
}

- (id)shareAction
{
  void *v3;
  id v4;
  UIAction *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *shareAction;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    v5 = (UIAction *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 1));
  }
  else
  {
    if (!self->_shareAction)
    {
      objc_initWeak(&location, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Share Location"), CFSTR("localized string not found"), 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_1002EA5C4;
      v16 = &unk_1011AF8A0;
      objc_copyWeak(&v17, &location);
      v9 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, v8, CFSTR("_shareAction"), &v13));
      shareAction = self->_shareAction;
      self->_shareAction = v9;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("ShareLocation"), v13, v14, v15, v16));
    -[UIAction setAccessibilityIdentifier:](self->_shareAction, "setAccessibilityIdentifier:", v11);

    v5 = self->_shareAction;
  }
  return v5;
}

- (id)sendMyLocationAction
{
  void *v3;
  id v4;
  UIAction *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *sendMyLocationAction;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    v5 = (UIAction *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 1));
  }
  else
  {
    if (!self->_sendMyLocationAction)
    {
      objc_initWeak(&location, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Send My Location"), CFSTR("localized string not found"), 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_1002EA7B8;
      v16 = &unk_1011AF8A0;
      objc_copyWeak(&v17, &location);
      v9 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, v8, CFSTR("_sendMyLocationAction"), &v13));
      sendMyLocationAction = self->_sendMyLocationAction;
      self->_sendMyLocationAction = v9;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("SendMyLocation"), v13, v14, v15, v16));
    -[UIAction setAccessibilityIdentifier:](self->_sendMyLocationAction, "setAccessibilityIdentifier:", v11);

    v5 = self->_sendMyLocationAction;
  }
  return v5;
}

- (id)transitLineDirectionsAction
{
  void *v3;
  void *v4;
  void *v5;
  UIAction *v6;
  UIAction *transitLineDirectionsAction;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_transitLineDirectionsAction)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Directions to Nearest Stop [quick action menu]"), CFSTR("localized string not found"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.turn.up.right")));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1002EA980;
    v13 = &unk_1011AF8A0;
    objc_copyWeak(&v14, &location);
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v5, CFSTR("_transitLineDirectionsAction"), &v10));
    transitLineDirectionsAction = self->_transitLineDirectionsAction;
    self->_transitLineDirectionsAction = v6;

    -[UIAction setAttributes:](self->_transitLineDirectionsAction, "setAttributes:", -[QuickActionMenuPresenter _nearestStationEnabled](self, "_nearestStationEnabled", v10, v11, v12, v13) ^ 1);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("TransitLineDirections")));
  -[UIAction setAccessibilityIdentifier:](self->_transitLineDirectionsAction, "setAccessibilityIdentifier:", v8);

  return self->_transitLineDirectionsAction;
}

- (id)transitLineViewOnMapAction
{
  void *v3;
  void *v4;
  void *v5;
  UIAction *v6;
  UIAction *transitLineViewOnMapAction;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_transitLineViewOnMapAction)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("View on Map [quick action menu]"), CFSTR("localized string not found"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("action-view-on-map")));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1002EAB30;
    v13 = &unk_1011AF8A0;
    objc_copyWeak(&v14, &location);
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v5, CFSTR("_transitLineViewOnMapAction"), &v10));
    transitLineViewOnMapAction = self->_transitLineViewOnMapAction;
    self->_transitLineViewOnMapAction = v6;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickActionMenuItem"), "stringByAppendingString:", CFSTR("ViewOnMap"), v10, v11, v12, v13));
  -[UIAction setAccessibilityIdentifier:](self->_transitLineViewOnMapAction, "setAccessibilityIdentifier:", v8);

  return self->_transitLineViewOnMapAction;
}

- (BOOL)_callEnabled
{
  MKMapItem *resolvedMapItem;
  MKMapItem *v4;
  SearchResult *searchResult;
  MKMapItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;

  resolvedMapItem = self->_resolvedMapItem;
  if (resolvedMapItem || (searchResult = self->_searchResult) == 0)
    v4 = resolvedMapItem;
  else
    v4 = (MKMapItem *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](searchResult, "mapItem"));
  v6 = v4;
  if (-[SearchResult isAddressBookResult](self->_searchResult, "isAddressBookResult"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self->_searchResult, "address"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contact"));

  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem phoneNumber](v6, "phoneNumber"));
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "phoneNumbers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
    v11 = v13 != 0;

  }
  return v11;
}

- (BOOL)_webEnabled
{
  MKMapItem *resolvedMapItem;
  MKMapItem *v4;
  SearchResult *searchResult;
  MKMapItem *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;

  resolvedMapItem = self->_resolvedMapItem;
  if (resolvedMapItem || (searchResult = self->_searchResult) == 0)
    v4 = resolvedMapItem;
  else
    v4 = (MKMapItem *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](searchResult, "mapItem"));
  v6 = v4;
  if (-[SearchResult isAddressBookResult](self->_searchResult, "isAddressBookResult"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self->_searchResult, "address"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contact"));

  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem url](v6, "url"));
  if (v9)
  {
    v10 = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "urlAddresses"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    v10 = v12 != 0;

  }
  return v10;
}

- (BOOL)_directionsEnabled
{
  MKMapItem *resolvedMapItem;
  MKMapItem *v4;
  SearchResult *searchResult;
  MKMapItem *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  _BOOL4 v20;
  id v21;
  double v22;
  double v23;
  CLLocationCoordinate2D v24;
  CLLocationCoordinate2D v25;

  resolvedMapItem = self->_resolvedMapItem;
  if (resolvedMapItem || (searchResult = self->_searchResult) == 0)
    v4 = resolvedMapItem;
  else
    v4 = (MKMapItem *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](searchResult, "mapItem"));
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocation"));

  -[QuickActionMenuPresenter coordinate](self, "coordinate");
  v10 = v9;
  v12 = v11;
  if (v6 && !-[MKMapItem _canGetDirections](v6, "_canGetDirections"))
  {
    v18 = 0;
  }
  else
  {
    v13 = v8;
    if (v13
      && (v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timestamp")),
          objc_msgSend(v14, "timeIntervalSinceDate:", v15),
          v17 = v16,
          v15,
          v14,
          v17 <= 300.0))
    {
      objc_msgSend(v13, "coordinate");
      v20 = CLLocationCoordinate2DIsValid(v24);

      if (v20)
      {
        v25.latitude = v10;
        v25.longitude = v12;
        if (CLLocationCoordinate2DIsValid(v25))
        {
          v21 = objc_msgSend(v13, "coordinate");
          v18 = GEOCalculateDistance(v21, v22, v23, v10, v12) >= 25.0;
          goto LABEL_12;
        }
      }
    }
    else
    {

    }
    v18 = 1;
  }
LABEL_12:

  return v18;
}

- (BOOL)_nearestStationEnabled
{
  return self->_haveNearestStation;
}

- (void)updateActionEnableStates
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  NSArray *actions;
  UIContextMenuInteraction *contextMenuInteraction;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  id location;
  _BYTE v31[128];

  v3 = -[QuickActionMenuPresenter _callEnabled](self, "_callEnabled");
  v4 = -[QuickActionMenuPresenter _webEnabled](self, "_webEnabled");
  v5 = -[QuickActionMenuPresenter _directionsEnabled](self, "_directionsEnabled");
  v6 = -[QuickActionMenuPresenter _nearestStationEnabled](self, "_nearestStationEnabled");
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1002EB150;
  v24[3] = &unk_1011B0C78;
  objc_copyWeak(&v25, &location);
  v26 = v3;
  v27 = v4;
  v28 = v6;
  v29 = v5;
  v7 = objc_retainBlock(v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_actions, "count")));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = -[NSArray copy](self->_actions, "copy");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = ((uint64_t (*)(_QWORD *, _QWORD))v7[2])(v7, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    }
    while (v10);
  }

  v15 = (NSArray *)objc_msgSend(v8, "copy");
  actions = self->_actions;
  self->_actions = v15;

  if (self->_actionsDisplayed)
  {
    contextMenuInteraction = self->_contextMenuInteraction;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002EB3A0;
    v18[3] = &unk_1011B0CA0;
    objc_copyWeak(&v19, &location);
    -[UIContextMenuInteraction updateVisibleMenuWithBlock:](contextMenuInteraction, "updateVisibleMenuWithBlock:", v18);
    objc_destroyWeak(&v19);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (id)_predicateToRemoveAction:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002EB488;
  v6[3] = &unk_1011B0CC8;
  v7 = a3;
  v3 = v7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v6));

  return v4;
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  OS_dispatch_group *resolveGroup;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_resolveGroup)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002EB57C;
    v9[3] = &unk_1011AC8B0;
    v9[4] = self;
    v10 = v4;
    v6 = objc_retainBlock(v9);
    v7 = v6;
    if (self->_resolvedMapItem || self->_place)
      ((void (*)(_QWORD *))v6[2])(v6);
    else
      dispatch_group_notify((dispatch_group_t)self->_resolveGroup, (dispatch_queue_t)&_dispatch_main_q, v6);
    resolveGroup = self->_resolveGroup;
    self->_resolveGroup = 0;

  }
}

- (void)handleTapPreview
{
  OS_dispatch_group *v3;
  OS_dispatch_group *resolveGroup;
  _QWORD block[5];

  v3 = self->_resolveGroup;
  resolveGroup = self->_resolveGroup;
  self->_resolveGroup = 0;

  if (v3)
  {
    self->_waitingResolution = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002EB8A4;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_group_notify((dispatch_group_t)v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)reset
{
  SearchResult *searchResult;
  PersonalizedItem *place;
  GEOPlaceActionDetails *v5;
  GEOPlaceActionDetails *actionDetails;
  CLLocation *lastValidLocation;
  UIAction *directionsAction;
  UIAction *addStopAction;
  UIAction *callAction;
  UIAction *webAction;
  UIAction *shareAction;
  UIAction *removeDroppedPinAction;
  UIAction *sendMyLocationAction;
  UIAction *transitLineViewOnMapAction;
  UIAction *transitLineDirectionsAction;

  self->_parkedCar = 0;
  searchResult = self->_searchResult;
  self->_searchResult = 0;

  place = self->_place;
  self->_place = 0;

  -[QuickActionMenuPresenter setUiTarget:](self, "setUiTarget:", 0);
  v5 = (GEOPlaceActionDetails *)objc_alloc_init((Class)GEOPlaceActionDetails);
  actionDetails = self->_actionDetails;
  self->_actionDetails = v5;

  lastValidLocation = self->_lastValidLocation;
  self->_lastValidLocation = 0;

  ++self->_resetCounter;
  directionsAction = self->_directionsAction;
  self->_directionsAction = 0;

  addStopAction = self->_addStopAction;
  self->_addStopAction = 0;

  callAction = self->_callAction;
  self->_callAction = 0;

  webAction = self->_webAction;
  self->_webAction = 0;

  shareAction = self->_shareAction;
  self->_shareAction = 0;

  removeDroppedPinAction = self->_removeDroppedPinAction;
  self->_removeDroppedPinAction = 0;

  sendMyLocationAction = self->_sendMyLocationAction;
  self->_sendMyLocationAction = 0;

  transitLineViewOnMapAction = self->_transitLineViewOnMapAction;
  self->_transitLineViewOnMapAction = 0;

  transitLineDirectionsAction = self->_transitLineDirectionsAction;
  self->_transitLineDirectionsAction = 0;

  self->_haveNearestStation = 0;
}

- (BOOL)isAdditionalStop
{
  NSArray *actions;
  void *v3;

  actions = self->_actions;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter addStopAction](self, "addStopAction"));
  LOBYTE(actions) = -[NSArray containsObject:](actions, "containsObject:", v3);

  return (char)actions;
}

- (void)_updateSearchResultWithMapItemIfNeeded:(id)a3
{
  SearchResult *v4;
  SearchResult *v5;
  void *v6;
  SearchResult *v7;
  id v8;

  v8 = a3;
  if (-[SearchResultRepr hasIncompleteMetadata](self->_searchResult, "hasIncompleteMetadata")
    || -[SearchResult isDynamicCurrentLocation](self->_searchResult, "isDynamicCurrentLocation"))
  {
    v4 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v8);
    if (-[SearchResult isAddressBookResult](self->_searchResult, "isAddressBookResult"))
    {
      v5 = [SearchResult alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self->_searchResult, "address"));
      v7 = -[SearchResult initWithSearchResult:address:](v5, "initWithSearchResult:address:", v4, v6);

      v4 = v7;
    }
    -[QuickActionMenuPresenter setSearchResult:](self, "setSearchResult:", v4);

  }
}

- (void)updateForSearchResult:(id)a3
{
  id v5;
  OS_dispatch_group *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  dispatch_queue_global_t global_queue;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD);
  NSObject *v30;
  dispatch_time_t v31;
  void *v32;
  void *v33;
  void *v34;
  id WeakRetained;
  void *v36;
  id v37;
  void *v38;
  OS_dispatch_group *v39;
  _QWORD v40[4];
  id v41;
  OS_dispatch_group *v42;
  id v43;
  _QWORD v44[4];
  OS_dispatch_group *v45;
  id v46;
  _QWORD v47[4];
  OS_dispatch_group *v48;
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  id v52;
  _QWORD *v53;
  BOOL v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  id location[2];

  v5 = a3;
  objc_storeStrong((id *)&self->_searchResult, a3);
  v6 = self->_resolveGroup;
  objc_initWeak(location, self);
  if (objc_msgSend(v5, "hasIncompleteMetadata"))
  {
    if (objc_msgSend(v5, "businessID"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "poiSearchManager"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchResultForIdentifier:", v9));

      if (v10 && (objc_msgSend(v10, "hasIncompleteMetadata") & 1) == 0)
      {
        -[QuickActionMenuPresenter updateForSearchResult:](self, "updateForSearchResult:", v10);
      }
      else
      {
        dispatch_group_enter((dispatch_group_t)v6);
        v57[0] = 0;
        v57[1] = v57;
        v57[2] = 0x3032000000;
        v57[3] = sub_1002EC1D4;
        v57[4] = sub_1002EC1E4;
        v58 = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v12 = objc_msgSend(v11, "userInterfaceIdiom");
        v39 = v6;

        v38 = v10;
        if (v12 == (id)5)
        {
          global_queue = dispatch_get_global_queue(2, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        }
        else
        {
          v23 = &_dispatch_main_q;
          v24 = &_dispatch_main_q;
        }
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_1002EC1EC;
        v55[3] = &unk_1011B0CF0;
        v55[4] = v57;
        objc_copyWeak(&v56, location);
        v25 = objc_retainBlock(v55);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter delegate](self, "delegate"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapServiceTraitsForQuickActionPresenter:", self));
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1002EC290;
        v50[3] = &unk_1011B0D18;
        v53 = v57;
        v54 = v12 == (id)5;
        v29 = v25;
        v52 = v29;
        v30 = v39;
        v51 = v30;
        objc_msgSend(v8, "searchForIdentifier:allowExpired:traits:completionHandler:callbackQueue:", v26, 1, v28, v50, v23);

        if (v12 == (id)5)
        {
          v31 = dispatch_time(0, 5000000000);
          dispatch_group_wait(v30, v31);
          v29[2](v29);
        }

        objc_destroyWeak(&v56);
        _Block_object_dispose(v57, 8);

        v6 = v39;
        v10 = v38;
      }
      -[GEOPlaceActionDetails setBusinessID:](self->_actionDetails, "setBusinessID:", objc_msgSend(v5, "businessID"));
      -[GEOPlaceActionDetails setResultIndex:](self->_actionDetails, "setResultIndex:", objc_msgSend(v5, "resultIndex"));

      goto LABEL_21;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));

    if (v21)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
      dispatch_group_enter((dispatch_group_t)v6);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1002EC31C;
      v47[3] = &unk_1011B0D40;
      objc_copyWeak(&v49, location);
      v48 = v6;
      objc_msgSend(v8, "forwardGeocodeAddress:", v47);

      v22 = &v49;
LABEL_20:
      objc_destroyWeak(v22);
      goto LABEL_21;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapServiceTraitsForQuickActionPresenter:", self));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ticketForMapItemToRefine:traits:", v34, v36));

      dispatch_group_enter((dispatch_group_t)v6);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1002EC384;
      v44[3] = &unk_1011ADF70;
      objc_copyWeak(&v46, location);
      v45 = v6;
      v37 = &_dispatch_main_q;
      objc_msgSend(v8, "submitWithHandler:queue:networkActivity:", v44, &_dispatch_main_q, 0);

      v22 = &v46;
      goto LABEL_20;
    }
  }
  else
  {
    if (objc_msgSend(v5, "isDynamicCurrentLocation"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastLocation"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapServiceTraitsForQuickActionPresenter:", self));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ticketForReverseGeocodeLocation:traits:", v8, v17));

      dispatch_group_enter((dispatch_group_t)v6);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1002EC438;
      v40[3] = &unk_1011B0D68;
      objc_copyWeak(&v43, location);
      v41 = v5;
      v42 = v6;
      v19 = &_dispatch_main_q;
      objc_msgSend(v18, "submitWithHandler:queue:networkActivity:", v40, &_dispatch_main_q, 0);

      objc_destroyWeak(&v43);
LABEL_21:

      goto LABEL_22;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    -[QuickActionMenuPresenter setResolvedMapItem:](self, "setResolvedMapItem:", v20);

    -[GEOPlaceActionDetails setBusinessID:](self->_actionDetails, "setBusinessID:", objc_msgSend(v5, "businessID"));
    -[GEOPlaceActionDetails setResultIndex:](self->_actionDetails, "setResultIndex:", objc_msgSend(v5, "resultIndex"));
  }
LABEL_22:
  objc_destroyWeak(location);

}

- (void)updateForParkedCar:(id)a3
{
  id v4;

  self->_parkedCar = 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapItem"));
  -[QuickActionMenuPresenter setResolvedMapItem:](self, "setResolvedMapItem:", v4);

}

- (void)updateForLabelMarker:(id)a3
{
  id v5;
  VKLabelMarker **p_labelMarker;
  double v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  OS_dispatch_group *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id WeakRetained;
  void *v23;
  void *v24;
  id v25;
  dispatch_queue_global_t global_queue;
  id v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD);
  NSObject *v33;
  dispatch_time_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  _QWORD *v42;
  BOOL v43;
  _QWORD v44[5];
  id v45;
  _QWORD *v46;
  _QWORD v47[5];
  id v48;

  v5 = a3;
  p_labelMarker = &self->_labelMarker;
  objc_storeStrong((id *)&self->_labelMarker, a3);
  objc_msgSend(v5, "coordinate");
  v8 = v7;
  objc_msgSend(v5, "coordinate");
  v10 = CLLocationCoordinate2DMake(v8, v9);
  v11 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v10.latitude, v10.longitude);
  v12 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:", v11);
  v13 = v5;
  v14 = objc_msgSend(v13, "featureType");
  if (v14 <= 9 && ((1 << v14) & 0x2C0) != 0)
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
  else
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
  v16 = (void *)v15;

  objc_msgSend(v12, "setName:", v16);
  v17 = self->_resolveGroup;
  -[GEOPlaceActionDetails setBusinessID:](self->_actionDetails, "setBusinessID:", objc_msgSend(v13, "businessID"));
  if (-[VKLabelMarker isTransitLine](self->_labelMarker, "isTransitLine"))
  {
    -[QuickActionMenuPresenter setResolvedMapItem:](self, "setResolvedMapItem:", v12);
    if ((id)-[VKLabelMarker _maps_numLines](self->_labelMarker, "_maps_numLines") == (id)1)
      -[QuickActionMenuPresenter resolveNearestTransitStation](self, "resolveNearestTransitStation");
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](*p_labelMarker, "featureAnnotation"));
    v19 = v18;
    if (v18 && objc_msgSend(v18, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "personalizedItem"));
      -[QuickActionMenuPresenter setPlace:](self, "setPlace:", v20);

    }
    else
    {
      v38 = v19;
      v21 = v13;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapServiceTraitsForQuickActionPresenter:", self));

      if (-[VKLabelMarker businessID](self->_labelMarker, "businessID"))
      {
        dispatch_group_enter((dispatch_group_t)v17);
        v47[0] = 0;
        v47[1] = v47;
        v47[2] = 0x3032000000;
        v47[3] = sub_1002EC1D4;
        v47[4] = sub_1002EC1E4;
        v48 = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v25 = objc_msgSend(v24, "userInterfaceIdiom");

        v37 = v23;
        if (v25 == (id)5)
        {
          global_queue = dispatch_get_global_queue(2, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        }
        else
        {
          v36 = &_dispatch_main_q;
          v27 = &_dispatch_main_q;
        }
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_1002EC9B4;
        v44[3] = &unk_1011AE630;
        v44[4] = self;
        v46 = v47;
        v35 = v21;
        v45 = v21;
        v28 = objc_retainBlock(v44);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "poiSearchManager"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker identifier](*p_labelMarker, "identifier"));
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1002ECA38;
        v39[3] = &unk_1011B0D18;
        v42 = v47;
        v43 = v25 == (id)5;
        v32 = v28;
        v41 = v32;
        v33 = v17;
        v40 = v33;
        objc_msgSend(v30, "searchForIdentifier:allowExpired:traits:completionHandler:callbackQueue:", v31, 1, v37, v39, v36);

        if (v25 == (id)5)
        {
          v34 = dispatch_time(0, 5000000000);
          dispatch_group_wait(v33, v34);
          v32[2](v32);
        }

        _Block_object_dispose(v47, 8);
        v21 = v35;
        v23 = v37;
      }

      v19 = v38;
    }

  }
}

- (void)updateForPlace:(id)a3
{
  id v4;
  OS_dispatch_group *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  _QWORD v13[5];
  OS_dispatch_group *v14;

  v4 = a3;
  -[QuickActionMenuPresenter setPlace:](self, "setPlace:", v4);
  v5 = self->_resolveGroup;
  if ((objc_opt_respondsToSelector(v4, "parkedCar") & 1) != 0
    && (v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parkedCar"))) != 0)
  {
    v7 = (void *)v6;
    -[QuickActionMenuPresenter updateForParkedCar:](self, "updateForParkedCar:", v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResult"));
    -[QuickActionMenuPresenter setSearchResult:](self, "setSearchResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    -[QuickActionMenuPresenter setResolvedMapItem:](self, "setResolvedMapItem:", v8);
    if (v7)
    {
      -[QuickActionMenuPresenter updateForSearchResult:](self, "updateForSearchResult:", v7);
    }
    else if ((objc_msgSend(v8, "_hasResolvablePartialInformation") & 1) != 0
           || objc_msgSend(v4, "mustRefineMapItem"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapServiceTraitsForQuickActionPresenter:", self));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketForMapItemToRefine:traits:", v8, v11));

      dispatch_group_enter((dispatch_group_t)v5);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1002ECC64;
      v13[3] = &unk_1011AE6F0;
      v13[4] = self;
      v14 = v5;
      objc_msgSend(v12, "submitWithHandler:queue:networkActivity:", v13, &_dispatch_main_q, 0);

    }
  }

}

- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4
{
  return 0;
}

- (void)setLabelMarker:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_labelMarker, a3);
  v5 = v9;
  if (v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "featureAnnotation"));
    v7 = v6;
    if (v6 && objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "personalizedItem"));
      -[QuickActionMenuPresenter setPlace:](self, "setPlace:", v8);

    }
    v5 = v9;
  }

}

- (void)setResolvedMapItem:(id)a3
{
  SearchResult *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_resolvedMapItem, a3);
  if (v7 && !self->_searchResult)
  {
    v5 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v7);
    -[QuickActionMenuPresenter setSearchResult:](self, "setSearchResult:", v5);

  }
  if (self->_parkedCar)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter searchResult](self, "searchResult"));
    objc_msgSend(v6, "setReverseGeocoded:", 1);

  }
  -[QuickActionMenuPresenter updateActionEnableStates](self, "updateActionEnableStates");

}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationDegrees v2;
  CLLocationDegrees v3;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v6;
  SearchResult *searchResult;
  CLLocationCoordinate2D result;

  if (self->_resolvedMapItem)
  {
    if (self->_labelMarker)
    {
      -[VKLabelMarker coordinate](self->_labelMarker, "coordinate");
      v6 = CLLocationCoordinate2DMake(v2, v3);
      longitude = v6.longitude;
      latitude = v6.latitude;
    }
    else
    {
      searchResult = self->_searchResult;
      if (searchResult)
      {
        -[SearchResult coordinate](searchResult, "coordinate");
      }
      else
      {
        latitude = kCLLocationCoordinate2DInvalid.latitude;
        longitude = kCLLocationCoordinate2DInvalid.longitude;
      }
    }
  }
  else
  {
    objc_msgSend(0, "_coordinate");
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)resolveNearestTransitStation
{
  unint64_t resetCounter;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  if ((id)-[VKLabelMarker _maps_numLines](self->_labelMarker, "_maps_numLines") == (id)1)
  {
    resetCounter = self->_resetCounter;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker _maps_lineIdentifiers](self->_labelMarker, "_maps_lineIdentifiers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002ECF58;
    v9[3] = &unk_1011B0DB8;
    v10 = v5;
    v11 = resetCounter;
    v9[4] = self;
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "singleLocationUpdateWithHandler:", v9));

    objc_msgSend(v8, "start");
  }
}

- (QuickActionMenuPresenterDelegate)delegate
{
  return (QuickActionMenuPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (MKMapItem)resolvedMapItem
{
  return self->_resolvedMapItem;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (PersonalizedItem)place
{
  return self->_place;
}

- (void)setPlace:(id)a3
{
  objc_storeStrong((id *)&self->_place, a3);
}

- (CLLocation)lastValidLocation
{
  return self->_lastValidLocation;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (int)uiTarget
{
  return self->_uiTarget;
}

- (void)setUiTarget:(int)a3
{
  self->_uiTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_lastValidLocation, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_resolveGroup, 0);
  objc_storeStrong((id *)&self->_transitLineDirectionsAction, 0);
  objc_storeStrong((id *)&self->_transitLineViewOnMapAction, 0);
  objc_storeStrong((id *)&self->_sendMyLocationAction, 0);
  objc_storeStrong((id *)&self->_shareAction, 0);
  objc_storeStrong((id *)&self->_dropPinAction, 0);
  objc_storeStrong((id *)&self->_removeDroppedPinAction, 0);
  objc_storeStrong((id *)&self->_webAction, 0);
  objc_storeStrong((id *)&self->_callAction, 0);
  objc_storeStrong((id *)&self->_addStopAction, 0);
  objc_storeStrong((id *)&self->_directionsAction, 0);
  objc_storeStrong((id *)&self->_gestureView, 0);
  objc_storeStrong((id *)&self->_actionDetails, 0);
  objc_destroyWeak((id *)&self->_gestureSourceView);
  objc_storeStrong((id *)&self->_orbGesture, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_resolvedMapItem, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end
