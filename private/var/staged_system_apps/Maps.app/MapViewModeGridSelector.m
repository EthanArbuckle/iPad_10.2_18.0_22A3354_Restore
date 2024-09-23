@implementation MapViewModeGridSelector

- (MapViewModeGridSelector)init
{
  MapViewModeGridSelector *v2;
  MapViewModeGridSelector *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapViewModeGridSelector;
  v2 = -[MapViewModeGridSelector init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[MapViewModeGridSelector _createSubviews](v2, "_createSubviews");
    -[MapViewModeGridSelector _createSatelliteMenu](v3, "_createSatelliteMenu");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_updateState", CFSTR("MKMapViewDidChangeMapTypeNotification"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "_updateState", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  }
  return v3;
}

- (void)_updateState
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectableViewModes", 0));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridSelector _buttonViewModelForViewMode:](self, "_buttonViewModelForViewMode:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "integerValue")));
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[MapViewModeGridView setButtonViewModels:](self->_gridView, "setButtonViewModels:", v3);
}

- (void)setSettingsController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_settingsController, obj);
    -[MapViewModeGridSelector _updateState](self, "_updateState");
    v5 = obj;
  }

}

- (void)_createSubviews
{
  MapViewModeGridView *v3;
  MapViewModeGridView *gridView;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v3 = -[MapViewModeGridView initWithFrame:]([MapViewModeGridView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  gridView = self->_gridView;
  self->_gridView = v3;

  -[MapViewModeGridView setTranslatesAutoresizingMaskIntoConstraints:](self->_gridView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapViewModeGridView setDirectionalLayoutMargins:](self->_gridView, "setDirectionalLayoutMargins:", 8.0, 16.0, 12.0, 16.0);
  -[MapViewModeGridSelector addSubview:](self, "addSubview:", self->_gridView);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView topAnchor](self->_gridView, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridSelector topAnchor](self, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v23[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView leadingAnchor](self->_gridView, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridSelector leadingAnchor](self, "leadingAnchor"));
  LODWORD(v5) = 1144766464;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:priority:", v18, 0.0, v5));
  v23[1] = v17;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView trailingAnchor](self->_gridView, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridSelector trailingAnchor](self, "trailingAnchor"));
  LODWORD(v8) = 1144766464;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:priority:", v7, 0.0, v8));
  v23[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView centerXAnchor](self->_gridView, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridSelector centerXAnchor](self, "centerXAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v23[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView bottomAnchor](self->_gridView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridSelector bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v23[4] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

- (void)_createSatelliteMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIMenu *v10;
  UIMenu *satelliteMenu;
  _QWORD v12[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Settings] Show Labels"), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v4, 0, "toggleLabels", 0));

  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("ShowLabelsButton"));
  objc_msgSend(v5, "setState:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Settings] Show Traffic"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v7, 0, "toggleTraffic", 0));

  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("ShowTrafficButton"));
  objc_msgSend(v8, "setState:", 1);
  v12[0] = v5;
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  v10 = (UIMenu *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v9));
  satelliteMenu = self->_satelliteMenu;
  self->_satelliteMenu = v10;

}

- (id)_buttonViewModelForViewMode:(int64_t)a3
{
  UIMenu *v3;
  void *v6;
  MapViewModeGridButtonViewModel *v7;
  void *v8;
  int v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id WeakRetained;
  id v18;
  MapViewModeGridButtonViewModel *v19;
  void *v20;
  UIMenu *v21;
  void *v22;
  UIMenu *v23;
  void *v24;
  const __CFString *v26;
  unsigned int v27;

  v3 = 0;
  v6 = 0;
  v7 = 0;
  switch(a3)
  {
    case 0:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Settings] Explore Map"), CFSTR("localized string not found"), 0));

      v9 = 0;
      v3 = 0;
      v10 = 1;
      v11 = CFSTR("StandardMap");
      v12 = CFSTR("StandardMapWide");
      if (v6)
        goto LABEL_7;
      goto LABEL_18;
    case 1:
    case 4:
    case 5:
    case 6:
      break;
    case 2:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Settings] Satellite"), CFSTR("localized string not found"), 0));

      v3 = self->_satelliteMenu;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v15 = objc_msgSend(v14, "isUsingOfflineMaps");

      v12 = 0;
      v10 = v15 ^ 1;
      v9 = 1;
      v11 = CFSTR("SatelliteMap");
      if (!v6)
        goto LABEL_18;
      goto LABEL_7;
    case 3:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[Settings] Transit"), CFSTR("localized string not found"), 0));

      v12 = 0;
      v3 = 0;
      v9 = 1;
      v10 = 1;
      v11 = CFSTR("TransitMap");
      if (v6)
        goto LABEL_7;
      goto LABEL_18;
    case 7:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Settings] Driving"), CFSTR("localized string not found"), 0));

      v12 = 0;
      v3 = 0;
      v9 = 1;
      v10 = 1;
      v11 = CFSTR("DrivingMap");
      if (v6)
      {
LABEL_7:
        v26 = v12;
        v27 = v10;
        WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
        v18 = objc_msgSend(WeakRetained, "selectedViewMode");

        v19 = [MapViewModeGridButtonViewModel alloc];
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v11));
        if (v9)
        {
          if (v18 == (id)a3)
            v21 = v3;
          else
            v21 = 0;
          v7 = -[MapViewModeGridButtonViewModel initWithTitle:image:wideImage:enabled:selected:overflowMenu:delegate:axIdentifier:](v19, "initWithTitle:image:wideImage:enabled:selected:overflowMenu:delegate:axIdentifier:", v6, v20, 0, v27, v18 == (id)a3, v21, self, v11);
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v26));
          if (v18 == (id)a3)
            v23 = v3;
          else
            v23 = 0;
          v7 = -[MapViewModeGridButtonViewModel initWithTitle:image:wideImage:enabled:selected:overflowMenu:delegate:axIdentifier:](v19, "initWithTitle:image:wideImage:enabled:selected:overflowMenu:delegate:axIdentifier:", v6, v20, v22, v27, v18 == (id)a3, v23, self, v11);

        }
      }
      else
      {
LABEL_18:
        v7 = 0;
      }
      break;
    default:
      v6 = 0;
      v7 = 0;
      break;
  }

  return v7;
}

- (void)mapViewModeButtonViewTapped:(id)a3
{
  MapViewModeGridView *gridView;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char *v15;
  id v16;
  NSObject *v17;
  char *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  gridView = self->_gridView;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView buttonViewModels](gridView, "buttonViewModels"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewModel"));

  v8 = objc_msgSend(v6, "indexOfObject:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectableViewModes"));
  v11 = objc_msgSend(v10, "count");

  if (v8 >= v11)
    v8 = 0;
  v12 = objc_loadWeakRetained((id *)&self->_settingsController);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectableViewModes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v8));
  v15 = (char *)objc_msgSend(v14, "integerValue");

  v16 = sub_10043181C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v15 + 1;
    if ((unint64_t)(v15 + 1) < 9 && ((0x1DFu >> (char)v18) & 1) != 0)
      v19 = *(&off_1011C8F08 + (_QWORD)v18);
    else
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v15));
    *(_DWORD *)buf = 138543362;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "User selected map mode %{public}@", buf, 0xCu);

  }
  v20 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v20, "mapViewModeGridSelector:selectedMapMode:", self, v15);

}

- (void)validateCommand:(id)a3
{
  id v4;
  id WeakRetained;
  unsigned int v6;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "action") == "toggleLabels")
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
    v6 = objc_msgSend(WeakRetained, "showsLabels");
LABEL_6:
    objc_msgSend(v4, "setState:", v6);

    goto LABEL_7;
  }
  if (objc_msgSend(v4, "action") == "toggleTraffic")
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
    v6 = objc_msgSend(WeakRetained, "showsTraffic");
    goto LABEL_6;
  }
  v7.receiver = self;
  v7.super_class = (Class)MapViewModeGridSelector;
  -[MapViewModeGridSelector validateCommand:](&v7, "validateCommand:", v4);
LABEL_7:

}

- (void)toggleLabels
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  objc_msgSend(WeakRetained, "toggleLabels");

  -[MapViewModeGridSelector refresh](self, "refresh");
}

- (void)toggleTraffic
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);
  objc_msgSend(WeakRetained, "toggleTraffic");

  -[MapViewModeGridSelector refresh](self, "refresh");
}

- (MapViewModeGridSelectorDelegate)delegate
{
  return (MapViewModeGridSelectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SettingsController)settingsController
{
  return (SettingsController *)objc_loadWeakRetained((id *)&self->_settingsController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_satelliteMenu, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
}

@end
