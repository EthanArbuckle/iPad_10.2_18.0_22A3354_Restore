@implementation MapsSuggestionsDebugController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsSuggestionsDebugController;
  -[MapsSuggestionsDebugController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setTitle:", CFSTR("Debug Settings"));

  self->_debugValuesVCHeight = 450.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[MapsSuggestionsDebugController _setupDebugValuesController](self, "_setupDebugValuesController");
  -[MapsSuggestionsDebugController _setupDebugMapController](self, "_setupDebugMapController");
}

- (void)_setupDebugValuesController
{
  MapsDebugValuesViewController *v3;
  MapsDebugValuesViewController *debugValuesVC;
  MapsDebugValuesViewController *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v23;
  void *v24;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id location;

  v3 = objc_alloc_init(MapsDebugValuesViewController);
  debugValuesVC = self->_debugValuesVC;
  self->_debugValuesVC = v3;

  objc_initWeak(&location, self);
  v5 = self->_debugValuesVC;
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_100B30D78;
  v28 = &unk_1011C1B08;
  objc_copyWeak(&v29, &location);
  -[MapsDebugValuesViewController setPrepareContentBlock:](v5, "setPrepareContentBlock:", &v25);
  -[MapsSuggestionsDebugController setupChildViewController:](self, "setupChildViewController:", self->_debugValuesVC, v25, v26, v27, v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController view](self->_debugValuesVC, "view"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController view](self->_debugValuesVC, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", self->_debugValuesVCHeight));
  objc_msgSend(v9, "setActive:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController view](self->_debugValuesVC, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController view](self->_debugValuesVC, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leftAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leftAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController view](self->_debugValuesVC, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  objc_msgSend(v24, "setActive:", 1);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)_setupDebugMapController
{
  MapsSuggestionsDebugMapController *v3;
  MapsSuggestionsDebugMapController *mapVC;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = objc_alloc_init(MapsSuggestionsDebugMapController);
  mapVC = self->_mapVC;
  self->_mapVC = v3;

  -[MapsSuggestionsDebugController setupChildViewController:](self, "setupChildViewController:", self->_mapVC);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self->_mapVC, "view"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self->_mapVC, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self->_mapVC, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController view](self->_debugValuesVC, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self->_mapVC, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leftAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leftAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self->_mapVC, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "rightAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
  objc_msgSend(v25, "setActive:", 1);

  v26 = (id)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self->_mapVC, "view"));
  objc_msgSend(v26, "setHidden:", GEOConfigGetBOOL(MapsConfig_MSgDestinationGraphVisualizerDebugPanelSetting, off_1014B36A8) ^ 1);

}

- (void)_addMapsSuggestionsSettingsToDebugVC:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Logging"), &stru_1011E3918);
  v6 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Transportation Mode"), &stru_1011E3978);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B31264;
  v8[3] = &unk_1011B4BC0;
  v8[4] = self;
  v7 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Real-Time Destination Graph Visualizer"), v8);

}

- (void)setupChildViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "willMoveToParentViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v4, "addSubview:", v5);

  -[MapsSuggestionsDebugController addChildViewController:](self, "addChildViewController:", v6);
  objc_msgSend(v6, "didMoveToParentViewController:", self);

}

+ (id)navigationDestinationTitle
{
  return CFSTR("MapsSuggestions");
}

- (MapsDebugViewControllerDelegate)delegate
{
  return (MapsDebugViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MapsDebugViewControllerNavigationDelegate)navigationDelegate
{
  return (MapsDebugViewControllerNavigationDelegate *)objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapVC, 0);
  objc_storeStrong((id *)&self->_debugValuesVC, 0);
}

@end
