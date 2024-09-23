@implementation PerformanceDebugBookmarksController

- (PerformanceDebugBookmarksController)init
{
  PerformanceDebugBookmarksController *v2;
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *items;
  PerformanceDebugBookmarksController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PerformanceDebugBookmarksController;
  v2 = -[AuxiliaryDebugViewController init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Maps")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("Bookmarks"), CFSTR("plist")));

    v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithContentsOfFile:", v4);
    items = v2->_items;
    v2->_items = v5;

    v7 = v2;
  }

  return v2;
}

+ (id)navigationDestinationTitle
{
  return CFSTR("Bookmarks");
}

- (id)title
{
  return CFSTR("Bookmarks");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_items, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *items;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PerformanceCell")));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("PerformanceCell"));
  objc_msgSend(v7, "setAccessoryView:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v8, "setText:", 0);

  items = self->_items;
  v10 = objc_msgSend(v6, "row");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Name")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v13, "setText:", v12);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  long double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  __n128 v38;
  __n128 v39;
  __n128 v40;
  __n128 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[PerformanceDebugBookmarksController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("latitude")));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("latitude")));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

  }
  else
  {
    v12 = 37.78;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("longitude")));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("longitude")));
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

  }
  else
  {
    v16 = -122.0;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("yaw")));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("yaw")));
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

  }
  else
  {
    v20 = 12.0;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pitch")));
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pitch")));
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

  }
  else
  {
    v24 = 35.0;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("regionSize")));
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("regionSize")));
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

  }
  else
  {
    v28 = 0.000244;
  }

  v29 = log2(v28);
  v30 = objc_initWeak(&location, self);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PerformanceDebugBookmarksController delegate](self, "delegate"));
  v32 = objc_loadWeakRetained(&location);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allVisibleMapViewsForDebugController:", v32));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));

  v35 = objc_msgSend(v34, "frame");
  v38.n128_f64[0] = MKCoordinateRegionMakeWithZoomLevel(v35, v12, v16, 9.0 - v29, v36, v37);
  v42 = MKMapRectForCoordinateRegion(v38, v39, v40, v41);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  objc_msgSend(v34, "frame");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v42, v44, v46, v48, v49, v50));
  objc_msgSend(v51, "setPitch:", v24);
  objc_msgSend(v51, "setHeading:", v20);
  objc_msgSend(v34, "setCamera:", v51);

  objc_destroyWeak(&location);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Maps"), a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathForResource:ofType:", CFSTR("Bookmarks"), CFSTR("plist")));

  return v5;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
