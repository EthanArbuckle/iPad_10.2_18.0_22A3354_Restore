@implementation MapsSuggestionsDebugMapController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *possibleOverlayColors;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  MapsSuggestionsDGVDataSource *v17;
  MapsSuggestionsDGVDataSource *dataSource;
  MKMapView *v19;
  MKMapView *mapView;
  MKMapView *v21;
  void *v22;
  MKMapView *v23;
  void *v24;
  MKMapView *v25;
  NSObject *v26;
  uint64_t Log;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;

  v36.receiver = self;
  v36.super_class = (Class)MapsSuggestionsDebugMapController;
  -[MapsSuggestionsDebugMapController viewDidLoad](&v36, "viewDidLoad");
  v3 = objc_alloc((Class)NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cyanColor](UIColor, "cyanColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor purpleColor](UIColor, "purpleColor"));
  v9 = (NSArray *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, 0);
  possibleOverlayColors = self->_possibleOverlayColors;
  self->_possibleOverlayColors = v9;

  v11 = objc_alloc((Class)NSString);
  v12 = MapsSuggestionsDefaultCacheDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("destinationGraph.txt")));

  v35 = 0;
  v15 = objc_msgSend(v11, "initWithContentsOfFile:usedEncoding:error:", v14, 0, &v35);
  v16 = v35;

  if (!objc_msgSend(v15, "length"))
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MapsSuggestionsDebugMapController");
    v26 = objc_claimAutoreleasedReturnValue(Log);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v28 = MapsSuggestionsDefaultCacheDirectory();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("destinationGraph.txt")));

    *(_DWORD *)buf = 138412290;
    v38 = v30;
    v31 = "Could not read %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);

    goto LABEL_9;
  }
  v17 = -[MapsSuggestionsDGVDataSource initWithJSONString:]([MapsSuggestionsDGVDataSource alloc], "initWithJSONString:", v15);
  dataSource = self->_dataSource;
  self->_dataSource = v17;

  if (!self->_dataSource)
  {
    v32 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MapsSuggestionsDebugMapController");
    v26 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v33 = MapsSuggestionsDefaultCacheDirectory();
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingPathComponent:", CFSTR("destinationGraph.txt")));

    *(_DWORD *)buf = 138412290;
    v38 = v30;
    v31 = "Could not parse %@";
    goto LABEL_8;
  }
  v19 = (MKMapView *)objc_alloc_init((Class)MKMapView);
  mapView = self->_mapView;
  self->_mapView = v19;

  -[MapsSuggestionsDebugMapController _setupMapView](self, "_setupMapView");
  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
  v21 = self->_mapView;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVDataSource annotations](self->_dataSource, "annotations"));
  -[MKMapView addAnnotations:](v21, "addAnnotations:", v22);

  v23 = self->_mapView;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDGVDataSource linkOverlays](self->_dataSource, "linkOverlays"));
  -[MKMapView addOverlays:](v23, "addOverlays:", v24);

  v25 = self->_mapView;
  v26 = objc_claimAutoreleasedReturnValue(-[MKMapView annotations](v25, "annotations"));
  -[MKMapView showAnnotations:animated:](v25, "showAnnotations:animated:", v26, 1);
LABEL_9:

}

- (void)_setupMapView
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self, "view"));
  objc_msgSend(v3, "addSubview:", self->_mapView);

  -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView topAnchor](self->_mapView, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  objc_msgSend(v7, "setActive:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView bottomAnchor](self->_mapView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView leftAnchor](self->_mapView, "leftAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leftAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView rightAnchor](self->_mapView, "rightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  MapsSuggestionsDGVAnnotationView *v6;
  double v7;

  v5 = a4;
  v6 = (MapsSuggestionsDGVAnnotationView *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("entryCell")));
  if (!v6)
  {
    v6 = -[MapsSuggestionsDGVAnnotationView initWithAnnotation:reuseIdentifier:]([MapsSuggestionsDGVAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v5, CFSTR("entryCell"));
    -[MapsSuggestionsDGVAnnotationView setCanShowCallout:](v6, "setCanShowCallout:", 1);
  }
  LODWORD(v7) = 1148846080;
  -[MapsSuggestionsDGVAnnotationView setDisplayPriority:](v6, "setDisplayPriority:", v7);

  return v6;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)MKPolylineRenderer), "initWithOverlay:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_possibleOverlayColors, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v5, "index")% -[NSArray count](self->_possibleOverlayColors, "count")));
    objc_msgSend(v6, "setStrokeColor:", v7);
    objc_msgSend(v6, "setLineWidth:", 3.0);

  }
  else
  {
    v6 = objc_alloc_init((Class)MKOverlayRenderer);
  }

  return v6;
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v4;

  v4 = a4;
  if (objc_msgSend(v4, "isSelected"))
    objc_msgSend(v4, "hideCalloutView");
  else
    objc_msgSend(v4, "showCalloutView");

}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (objc_msgSend(v6, "isSelected"))
    objc_msgSend(v6, "hideCalloutView");
  else
    objc_msgSend(v6, "showCalloutView");
  objc_msgSend(v6, "setCalloutTableViewDataSource:", self);
  objc_msgSend(v6, "setCalloutTableViewDelegate:", self);
  objc_msgSend(v6, "reloadCalloutTableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v5, "setZPosition:", 9.22337204e18);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t Log;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController _currentlySelectedAnnotation](self, "_currentlySelectedAnnotation"));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entriesDictionaries"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("title")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("type")));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("entryCell")));
    if (!v14)
      v14 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("entryCell"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textLabel"));
    objc_msgSend(v15, "setText:", v12);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "detailTextLabel"));
    objc_msgSend(v16, "setText:", v13);

  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MapsSuggestionsDebugMapController");
    v18 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDebugMapController.m";
      v22 = 1024;
      v23 = 136;
      v24 = 2082;
      v25 = "-[MapsSuggestionsDebugMapController tableView:cellForRowAtIndexPath:]";
      v26 = 2082;
      v27 = "nil == (selectedAnnotation)";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. selectedAnnotation cannot be nil, something must have changed in numberOfRowsInSection", (uint8_t *)&v20, 0x26u);
    }

    v14 = objc_alloc_init((Class)UITableViewCell);
  }

  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsDebugMapController _currentlySelectedAnnotation](self, "_currentlySelectedAnnotation", a3, a4));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entriesDictionaries"));
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return (int64_t)v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return CFSTR("Entries");
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 35.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 25.0;
}

- (id)_currentlySelectedAnnotation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView selectedAnnotations](self->_mapView, "selectedAnnotations"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView selectedAnnotations](self->_mapView, "selectedAnnotations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleOverlayColors, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
