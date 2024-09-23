@implementation RAPWebBundleBaseMapViewController

- (RAPWebBundleBaseMapViewController)initWithReport:(id)a3
{
  id v5;
  RAPWebBundleBaseMapViewController *v6;
  RAPWebBundleBaseMapViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPWebBundleBaseMapViewController;
  v6 = -[RAPWebBundleBaseViewController initWithReport:](&v9, "initWithReport:", v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_report, a3);

  return v7;
}

- (void)viewDidLoad
{
  NSMutableDictionary *v3;
  NSMutableDictionary *mapViews;
  NSMutableDictionary *v5;
  NSMutableDictionary *mapViewConstraints;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPWebBundleBaseMapViewController;
  -[RAPWebBundleBaseViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  mapViews = self->_mapViews;
  self->_mapViews = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  mapViewConstraints = self->_mapViewConstraints;
  self->_mapViewConstraints = v5;

}

- (CLLocationCoordinate2D)startingCoordinateForMapPicker
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CLLocationDegrees latitude;
  double v14;
  CLLocationDegrees longitude;
  double v16;
  double v17;
  double v18;
  double v19;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  v4 = objc_opt_class(RAPWebBundleQuestion);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reportedPlace"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reportedPlace"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placemark"));
      objc_msgSend(v11, "coordinate");
      latitude = v12;
      longitude = v14;

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapCamera"));
      objc_msgSend(v10, "centerCoordinate");
      latitude = v16;
      longitude = v17;
    }

  }
  else
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  v18 = latitude;
  v19 = longitude;
  result.longitude = v19;
  result.latitude = v18;
  return result;
}

- (void)_updateMapViewWithUpdateMapPickerViewDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  RAPWebBundleMapViewPosition *v13;
  void *v14;
  NSMutableDictionary *mapViews;
  void *v16;
  RAPWebBundleMapViewController *v17;
  uint64_t v18;
  RAPWebBundleMapViewController *v19;
  RAPWebBundleMapViewController *v20;
  NSMutableDictionary *mapViewConstraints;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  NSMutableDictionary *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSMutableDictionary *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  RAPWebBundleMapViewPosition *v81;
  RAPWebBundleMapViewController *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  RAPWebBundleMapViewPosition *v89;
  id v90;
  id v91;
  _QWORD v92[4];
  RAPWebBundleMapViewController *v93;
  RAPWebBundleMapViewPosition *v94;
  _QWORD v95[4];
  _QWORD v96[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start")));
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end")));
    v10 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v91 = v8;
      v13 = -[RAPWebBundleMapViewPosition initWithDictionary:]([RAPWebBundleMapViewPosition alloc], "initWithDictionary:", v8);
      v90 = v12;
      v89 = -[RAPWebBundleMapViewPosition initWithDictionary:]([RAPWebBundleMapViewPosition alloc], "initWithDictionary:", v12);
      v87 = v4;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration")));
      v88 = (uint64_t)objc_msgSend(v14, "integerValue");

      mapViews = self->_mapViews;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewPosition mapId](v13, "mapId"));
      v17 = (RAPWebBundleMapViewController *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](mapViews, "objectForKeyedSubscript:", v16));

      v18 = objc_opt_class(RAPWebBundleMapViewController);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        v19 = v17;
      else
        v19 = 0;
      v20 = v19;

      if (v20)
      {
        mapViewConstraints = self->_mapViewConstraints;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewPosition mapId](v13, "mapId"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](mapViewConstraints, "objectForKeyedSubscript:", v22));

        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v84);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v20, "view"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "heightAnchor"));
        -[RAPWebBundleMapViewPosition height](v13, "height");
        v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:"));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v20, "view"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "scrollView"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
        -[RAPWebBundleMapViewPosition yPosition](v13, "yPosition");
        v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v29));

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v20, "view"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "safeAreaLayoutGuide"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
        -[RAPWebBundleMapViewPosition xPosition](v13, "xPosition");
        v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v34));

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v20, "view"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "safeAreaLayoutGuide"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
        -[RAPWebBundleMapViewPosition xPosition](v13, "xPosition");
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v40, -v41));

        v43 = (void *)v85;
        v44 = (void *)v83;

        v95[0] = v83;
        v95[1] = v85;
        v45 = (void *)v35;
        v95[2] = v35;
        v95[3] = v42;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v95, 4));

        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
      }
      else
      {
        -[RAPWebBundleBaseMapViewController startingCoordinateForMapPicker](self, "startingCoordinateForMapPicker");
        v17 = -[RAPWebBundleMapViewController initWithReport:coordinate:]([RAPWebBundleMapViewController alloc], "initWithReport:coordinate:", self->_report, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
        objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[RAPWebBundleMapViewController setDelegate:](v17, "setDelegate:", self);
        v50 = self->_mapViews;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewPosition mapId](v13, "mapId"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v17, v51);

        -[RAPWebBundleBaseMapViewController addChildViewController:](self, "addChildViewController:", v17);
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "scrollView"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
        objc_msgSend(v53, "addSubview:", v54);

        -[RAPWebBundleMapViewController didMoveToParentViewController:](v17, "didMoveToParentViewController:", self);
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "heightAnchor"));
        -[RAPWebBundleMapViewPosition height](v13, "height");
        v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:"));

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "scrollView"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
        -[RAPWebBundleMapViewPosition yPosition](v13, "yPosition");
        v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v62));

        v44 = (void *)v57;
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leadingAnchor"));
        v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v66));

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "trailingAnchor"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v71));

        v43 = (void *)v86;
        v96[0] = v44;
        v96[1] = v86;
        v45 = (void *)v67;
        v96[2] = v67;
        v96[3] = v42;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v96, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
      }
      v72 = self->_mapViewConstraints;
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewPosition mapId](v13, "mapId"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v72, "setObject:forKeyedSubscript:", v46, v73);

      -[RAPWebBundleMapViewPosition opacity](v13, "opacity");
      v75 = v74;
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
      objc_msgSend(v76, "setAlpha:", v75);

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
      objc_msgSend(v77, "layoutIfNeeded");

      -[RAPWebBundleMapViewPosition height](v89, "height");
      objc_msgSend(v44, "setConstant:");
      -[RAPWebBundleMapViewPosition yPosition](v89, "yPosition");
      objc_msgSend(v43, "setConstant:");
      -[RAPWebBundleMapViewPosition xPosition](v89, "xPosition");
      v78 = v45;
      objc_msgSend(v45, "setConstant:");
      -[RAPWebBundleMapViewPosition xPosition](v89, "xPosition");
      objc_msgSend(v42, "setConstant:", -v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](v17, "view"));
      objc_msgSend(v80, "layoutIfNeeded");

      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_1003BDD54;
      v92[3] = &unk_1011AC8B0;
      v93 = v17;
      v94 = v89;
      v81 = v89;
      v82 = v17;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v92, (double)(v88 / 1000));
      -[RAPWebBundleMapViewController setMapViewEnabled:](v82, "setMapViewEnabled:", 1);

      v12 = v90;
      v8 = v91;
      v4 = v87;
    }

  }
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v8 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RAPWebBundleBaseMapViewController;
  -[RAPWebBundleBaseViewController didReceiveMessageFromUserContentController:message:replyHandler:](&v10, "didReceiveMessageFromUserContentController:message:replyHandler:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name")));
  LODWORD(a3) = objc_msgSend(v9, "isEqualToString:", CFSTR("updateMapPickerView"));

  if ((_DWORD)a3)
    -[RAPWebBundleBaseMapViewController _updateMapViewWithUpdateMapPickerViewDictionary:](self, "_updateMapViewWithUpdateMapPickerViewDictionary:", v8);

}

- (void)rapWebBundleMapViewController:(id)a3 marker:(id)a4 didUpdateLocationTo:(CLLocationCoordinate2D)a5
{
  double longitude;
  double latitude;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
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
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  id v38;
  id obj;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  _BYTE v48[128];

  longitude = a5.longitude;
  latitude = a5.latitude;
  v38 = a3;
  v8 = a4;
  v36 = objc_alloc_init((Class)NSMutableDictionary);
  v40 = objc_alloc_init((Class)NSMutableArray);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = v8;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "featureHandles"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v14 = objc_alloc_init((Class)NSMutableDictionary);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v13, "featureIndex")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("featureIndex"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "tileX")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("featureTileX"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "tileY")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("featureTileY"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "tileZ")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("featureTileZ"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "tileStyle")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("style"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "featureType")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("type"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "tileVersion")));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("identifier"));

        objc_msgSend(v40, "addObject:", v14);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v10);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_mapViews, "allKeysForObject:", v38));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

  if (v23)
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v23, CFSTR("id"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", latitude));
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v24, CFSTR("latitude"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", longitude));
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v25, CFSTR("longitude"));

  objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, CFSTR("featureHandle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v26, CFSTR("featureName"));

  v41 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v36, 0, &v41));
  v28 = v41;
  if (!objc_msgSend(v27, "length") || v28)
  {
    v29 = sub_10043292C();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v28;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error serializing json into string: %@", buf, 0xCu);
    }

  }
  v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v27, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("return rapSetMapPickerValue(%@)"), v31));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[WKContentWorld pageWorld](WKContentWorld, "pageWorld"));
  objc_msgSend(v33, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", v32, &__NSDictionary0__struct, 0, v34, &stru_1011B4230);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mapViews, "allValues", a3, 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "setMapViewEnabled:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mapViews, "allValues", a3, a5, 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setMapViewEnabled:", 1);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewConstraints, 0);
  objc_storeStrong((id *)&self->_mapViews, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
