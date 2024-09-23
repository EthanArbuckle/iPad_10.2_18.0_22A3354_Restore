@implementation RAPRouteStepDetailViewController

- (RAPRouteStepDetailViewController)initWithReport:(id)a3 step:(id)a4 userPath:(id)a5 routeIndex:(unint64_t)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RAPRouteStepDetailViewController *v17;
  RAPRouteStepDetailViewController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RAPRouteStepDetailViewController;
  v17 = -[RAPWebBundleBaseMapViewController initWithReport:](&v20, "initWithReport:", v13);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_report, a3);
    objc_storeStrong((id *)&v18->_step, a4);
    objc_storeStrong((id *)&v18->_userPath, a5);
    v18->_isMissedStep = objc_msgSend(v15, "traversal") == 2;
    v18->_routeIndex = a6;
    objc_storeWeak((id *)&v18->_delegate, v16);
  }

  return v18;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPRouteStepDetailViewController;
  -[RAPWebBundleBaseMapViewController viewDidLoad](&v3, "viewDidLoad");
  -[RAPRouteStepDetailViewController _takeSnapshots](self, "_takeSnapshots");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPRouteStepDetailViewController;
  -[RAPRouteStepDetailViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  +[RAPAnalyticsManager captureRAPRevealActionFromReport:](RAPAnalyticsManager, "captureRAPRevealActionFromReport:", self->_report);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPRouteStepDetailViewController;
  -[RAPRouteStepDetailViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  if (-[RAPRouteStepDetailViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[RAPRouteStepDetailViewController _updateAggregatedDataWithCompletion:](self, "_updateAggregatedDataWithCompletion:", 0);
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 10111, 31, 0);
  }
}

- (void)setupViews
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] Send"), CFSTR("localized string not found"), 0));
  v6 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, self, "_submitPressed:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelPressed:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] Report an Issue"), CFSTR("localized string not found"), 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "setTitle:", v11);

  v13.receiver = self;
  v13.super_class = (Class)RAPRouteStepDetailViewController;
  -[RAPWebBundleBaseViewController setupViews](&v13, "setupViews");
}

- (id)context
{
  RAPWebBundleRouteStepContext *context;
  id v4;
  NSObject *v5;
  RAPWebBundleRouteStepContext *v6;
  RAPWebBundleRouteStepContext *v7;
  uint8_t v9[16];

  context = self->_context;
  if (!context)
  {
    if (!self->_mapSnapshotId)
    {
      v4 = sub_100431F8C();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Map snapshot should be ready by now.", v9, 2u);
      }

    }
    v6 = -[RAPWebBundleRouteStepContext initWithRouteStep:isMissedStep:aggregatedData:locales:mapSnapshotId:routeIndex:]([RAPWebBundleRouteStepContext alloc], "initWithRouteStep:isMissedStep:aggregatedData:locales:mapSnapshotId:routeIndex:", self->_step, self->_isMissedStep, self->_aggregatedData, self->_locales, self->_mapSnapshotId, self->_routeIndex);
    v7 = self->_context;
    self->_context = v6;

    context = self->_context;
  }
  return context;
}

- (void)_takeSnapshots
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id buf[2];

  v3 = sub_100431F8C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Started capturing snapshots.", (uint8_t *)buf, 2u);
  }

  v5 = dispatch_group_create();
  objc_initWeak(buf, self);
  dispatch_group_enter(v5);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002CF6E4;
  v12[3] = &unk_1011AC860;
  v6 = v5;
  v13 = v6;
  -[RAPRouteStepDetailViewController _saveManeuverIconWithCompletion:](self, "_saveManeuverIconWithCompletion:", v12);
  dispatch_group_enter(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002CF754;
  v10[3] = &unk_1011AC860;
  v7 = v6;
  v11 = v7;
  -[RAPRouteStepDetailViewController _saveMapImageWithCompletion:](self, "_saveMapImageWithCompletion:", v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CF7C4;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v9, buf);
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(buf);
}

- (void)_saveManeuverIconWithCompletion:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002CF910;
  v8[3] = &unk_1011B0300;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_saveMapImageWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  GEOComposedRouteStep *step;
  GEOComposedRouteStep *v30;
  void *v31;
  double v32;
  double v33;
  CLLocationDegrees v34;
  double v35;
  CLLocationDegrees v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  CLLocationDegrees v41;
  double v42;
  CLLocationDegrees v43;
  CLLocationCoordinate2D v44;
  CLLocationCoordinate2D v45;
  double x;
  double v47;
  double y;
  double v49;
  double width;
  double v51;
  double height;
  uint64_t v53;
  double v54;
  CLLocationCoordinate2D v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  MKMapSnapshotter *v61;
  MKMapSnapshotter *mapSnapshotter;
  id v63;
  id v64;
  NSObject *v65;
  MKMapSnapshotter *v66;
  id v67;
  double v68;
  double v69;
  double v70;
  double v71;
  _QWORD v72[4];
  id v73;
  id v74[2];
  id v75;
  uint8_t buf[16];
  MKMapPoint v77;
  MKMapPoint v78;

  v4 = a3;
  v5 = objc_alloc_init((Class)MKMapSnapshotOptions);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepDetailViewController view](self, "view"));
  objc_msgSend(v6, "frame");
  v8 = v7 + -32.0;

  v70 = v8 * 0.453999996;
  v71 = v8;
  objc_msgSend(v5, "setSize:", v8);
  objc_msgSend(v5, "setMapType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
  objc_msgSend(v5, "_setComposedRouteForRouteLine:", v9);

  if (-[GEOComposedRouteStep isArrivalStep](self->_step, "isArrivalStep"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
    v11 = objc_msgSend(v10, "legIndexForStepIndex:", -[GEOComposedRouteStep stepIndex](self->_step, "stepIndex"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "legs"));
    v14 = objc_msgSend(v13, "count");

    if (v11 < v14)
    {
      -[GEOComposedRouteStep endGeoCoordinate](self->_step, "endGeoCoordinate");
      v16 = v15;
      -[GEOComposedRouteStep endGeoCoordinate](self->_step, "endGeoCoordinate");
      v18 = v17;
      v19 = objc_msgSend(objc_alloc((Class)VKCustomFeature), "initWithCoordinate:", v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "legs"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v11));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "destination"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "styleAttributes"));
      if ((objc_msgSend(v24, "hasAttributes") & 1) == 0)
      {
        v25 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));

        v24 = (void *)v25;
      }
      v26 = objc_msgSend(v24, "copy");

      *(_OWORD *)buf = xmmword_100E34F20;
      objc_msgSend(v26, "replaceAttributes:count:", buf, 2);
      objc_msgSend(v19, "setStyleAttributes:", v26);
      v27 = objc_msgSend(objc_alloc((Class)MKMapSnapshotCustomFeatureAnnotation), "initWithCustomFeature:coordinate:", v19, v16, v18);
      v75 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v75, 1));
      objc_msgSend(v5, "_setCustomFeatureAnnotations:", v28);

    }
  }
  step = self->_step;
  if (step)
  {
    v30 = step;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](v30, "composedRoute"));
    objc_msgSend(v31, "pointAtRouteCoordinate:", -[GEOComposedRouteStep maneuverStartRouteCoordinate](v30, "maneuverStartRouteCoordinate"));
    v69 = v32;
    v34 = v33;
    v36 = v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](v30, "composedRoute"));
    v38 = -[GEOComposedRouteStep endRouteCoordinate](v30, "endRouteCoordinate");

    objc_msgSend(v37, "pointAtRouteCoordinate:", v38);
    v68 = v39;
    v41 = v40;
    v43 = v42;

    v44 = CLLocationCoordinate2DMake(v34, v36);
    v45 = CLLocationCoordinate2DMake(v41, v43);
    *(MKMapPoint *)buf = MKMapPointForCoordinate(v44);
    v77 = MKMapPointForCoordinate(v45);
    x = MKMapRectBoundingMapPoints(buf, 2);
    y = v47;
    width = v49;
    height = v51;
    v54 = GEOCalculateDistance(v53, v34, v36, v41, v43);
    if (sqrt((v69 - v68) * (v69 - v68) + v54 * v54) < 150.0)
    {
      v78.x = x + width * 0.5;
      v78.y = y + height * 0.5;
      v55 = MKCoordinateForMapPoint(v78);
      x = MKMapRectMakeWithRadialDistance(v55.latitude, v55.longitude, 75.0);
      y = v56;
      width = v57;
      height = v58;
    }
  }
  else
  {
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", x, y, width, height, v71, v70, *(_QWORD *)&v68));
  objc_msgSend(v59, "centerCoordinateDistance");
  objc_msgSend(v59, "setCenterCoordinateDistance:", v60 * 1.2);
  objc_msgSend(v5, "setCamera:", v59);
  objc_msgSend(v5, "_setSearchResultsType:", 1);
  v61 = (MKMapSnapshotter *)objc_msgSend(objc_alloc((Class)MKMapSnapshotter), "initWithOptions:", v5);
  mapSnapshotter = self->_mapSnapshotter;
  self->_mapSnapshotter = v61;

  v63 = -[GEOComposedRouteStep stepIndex](self->_step, "stepIndex");
  v64 = sub_100431F8C();
  v65 = objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v63;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Will create a snapshot of step with stepInde: %lu", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v66 = self->_mapSnapshotter;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1002D0570;
  v72[3] = &unk_1011B0328;
  objc_copyWeak(v74, (id *)buf);
  v74[1] = v63;
  v67 = v4;
  v73 = v67;
  -[MKMapSnapshotter startWithCompletionHandler:](v66, "startWithCompletionHandler:", v72);

  objc_destroyWeak(v74);
  objc_destroyWeak((id *)buf);

}

- (void)_submitPressed:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  v4 = a3;
  v5 = sub_100431F8C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "User pressed submit, will dismiss viewController", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D080C;
  v7[3] = &unk_1011AD260;
  objc_copyWeak(&v8, buf);
  -[RAPRouteStepDetailViewController _updateAggregatedDataWithCompletion:](self, "_updateAggregatedDataWithCompletion:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);

}

- (void)_updateAggregatedDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100431F8C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_updateAggregatedDataWithCompletion will fetch latest aggregatedData.", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[WKContentWorld pageWorld](WKContentWorld, "pageWorld"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002D0944;
  v10[3] = &unk_1011B0350;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", CFSTR("return rapGetData()"), 0, 0, v8, v10);

}

- (void)_dismiss
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  v3 = sub_100431F8C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_cancelPressed, will pop to previous VC", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepDetailViewController navigationController](self, "navigationController"));
  v6 = objc_msgSend(v5, "popViewControllerAnimated:", 1);

  +[RAPAnalyticsManager captureRAPCancelActionFromReport:](RAPAnalyticsManager, "captureRAPCancelActionFromReport:", self->_report);
}

- (void)_submit
{
  id v3;
  NSObject *v4;
  NSString *aggregatedData;
  id v6;
  id v7;
  int v8;
  NSString *v9;

  v3 = sub_100431F8C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    aggregatedData = self->_aggregatedData;
    v8 = 138412290;
    v9 = aggregatedData;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_submit: will try to submit RAP with aggregatedData: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", self->_aggregatedData, 0);
  v7 = objc_msgSend(objc_alloc((Class)GEORPFeedbackDynamicForm), "initWithData:", v6);
  -[RAPRouteStepDetailViewController _uploadForm:](self, "_uploadForm:", v7);

}

- (void)_uploadForm:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  RAPPhoto *v9;
  UIImage *mapSnapshot;
  void *v11;
  RAPPhoto *v12;
  RAPPhotoWithMetadata *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  RAPReport *report;
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  v6 = objc_opt_class(RAPWebBundleQuestion);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "setDynamicForm:", v4);
    objc_msgSend(v8, "setReportedUserPath:", self->_userPath);
    if (self->_mapSnapshot)
    {
      v9 = [RAPPhoto alloc];
      mapSnapshot = self->_mapSnapshot;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v12 = -[RAPPhoto initWithPhoto:date:location:](v9, "initWithPhoto:date:location:", mapSnapshot, v11, 0);

      v13 = -[RAPPhotoWithMetadata initWithRAPPhoto:photoType:]([RAPPhotoWithMetadata alloc], "initWithRAPPhoto:photoType:", v12, 3);
      -[RAPReport addPhotoWithMetadata:](self->_report, "addPhotoWithMetadata:", v13);

    }
    else
    {
      v16 = sub_100431F8C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Couldn't append photo because the snapshot was nil.", buf, 2u);
      }

    }
    v18 = sub_10085876C();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_initWeak((id *)buf, self);
    report = self->_report;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1002D0FCC;
    v25[3] = &unk_1011B03B8;
    objc_copyWeak(&v27, (id *)buf);
    v21 = v19;
    v26 = v21;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1002D10B4;
    v22[3] = &unk_1011B03E0;
    objc_copyWeak(&v24, (id *)buf);
    v15 = v21;
    v23 = v15;
    -[RAPReport submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:](report, "submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:", &stru_1011B0390, v25, v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = sub_100431F8C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Failed to upload form, question was of unsupported type: %@", buf, 0xCu);
    }
  }

}

- (CLLocationCoordinate2D)startingCoordinateForMapPicker
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v8;
  CLLocationCoordinate2D result;

  -[GEOComposedRouteStep endGeoCoordinate](self->_step, "endGeoCoordinate");
  v4 = v3;
  -[GEOComposedRouteStep endGeoCoordinate](self->_step, "endGeoCoordinate");
  v8 = CLLocationCoordinate2DMake(v4, v5);
  longitude = v8.longitude;
  latitude = v8.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *locales;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;

  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = a3;
  v11 = sub_100431F8C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "didReceiveMessageFromUserContentController:message:replyHandler called with message: %@", buf, 0xCu);
  }

  v23.receiver = self;
  v23.super_class = (Class)RAPRouteStepDetailViewController;
  -[RAPWebBundleBaseMapViewController didReceiveMessageFromUserContentController:message:replyHandler:](&v23, "didReceiveMessageFromUserContentController:message:replyHandler:", v10, v8, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name")));
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("context"));

  if (v14)
  {
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("supportedLocales")));
    v16 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));

      v15 = (NSArray *)v17;
    }
    locales = self->_locales;
    self->_locales = v15;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepDetailViewController context](self, "context"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "context"));
    v9[2](v9, v20, 0);

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name")));
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("setValid"));

    if (v22)
      -[RAPRouteStepDetailViewController _updateAggregatedDataWithCompletion:](self, "_updateAggregatedDataWithCompletion:", 0);
  }

}

- (void)macFooterViewRightButtonTapped:(id)a3
{
  -[RAPRouteStepDetailViewController _submitPressed:](self, "_submitPressed:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnapshot, 0);
  objc_storeStrong((id *)&self->_mapSnapshotId, 0);
  objc_storeStrong((id *)&self->_mapSnapshotter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_aggregatedData, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userPath, 0);
  objc_storeStrong((id *)&self->_step, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
