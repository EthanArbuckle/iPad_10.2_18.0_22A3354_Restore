@implementation RAPPersonalPlaceRefinementCoordinator

- (RAPPersonalPlaceRefinementCoordinator)initWithPresentingViewController:(id)a3 delegate:(id)a4 shortcut:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPPersonalPlaceRefinementCoordinator *v11;
  RAPPersonalPlaceRefinementCoordinator *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RAPPersonalPlaceRefinementCoordinator;
  v11 = -[RAPPersonalPlaceRefinementCoordinator init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[RAPPersonalPlaceRefinementCoordinator _commonInitWithPresentingViewController:delegate:presentationStyle:shortcut:](v11, "_commonInitWithPresentingViewController:delegate:presentationStyle:shortcut:", v8, v9, 1, v10);
    -[RAPPersonalPlaceRefinementCoordinator _createRAPContext](v12, "_createRAPContext");
  }

  return v12;
}

- (RAPPersonalPlaceRefinementCoordinator)initWithPresentingViewController:(id)a3 delegate:(id)a4 report:(id)a5 question:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RAPPersonalPlaceRefinementCoordinator *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RAPPersonalPlaceRefinementCoordinator;
  v14 = -[RAPPersonalPlaceRefinementCoordinator init](&v17, "init");
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shortcut"));
    -[RAPPersonalPlaceRefinementCoordinator _commonInitWithPresentingViewController:delegate:presentationStyle:shortcut:](v14, "_commonInitWithPresentingViewController:delegate:presentationStyle:shortcut:", v10, v11, 0, v15);

    objc_storeStrong((id *)&v14->_question, a6);
    objc_storeStrong((id *)&v14->_report, a5);
  }

  return v14;
}

- (void)_commonInitWithPresentingViewController:(id)a3 delegate:(id)a4 presentationStyle:(int64_t)a5 shortcut:(id)a6
{
  RAPPersonalPlaceRefinementCoordinatorDelegate *v10;
  id v11;
  id v12;
  RAPPersonalPlaceRefinementCoordinatorDelegate *delegate;

  v10 = (RAPPersonalPlaceRefinementCoordinatorDelegate *)a4;
  self->_presentationStyle = a5;
  objc_storeStrong((id *)&self->_shortcut, a6);
  v11 = a6;
  v12 = a3;
  objc_storeWeak((id *)&self->_parentViewController, v12);

  delegate = self->_delegate;
  self->_delegate = v10;

  self->_hasDisplayedRefinementAlert = 0;
}

- (void)_createRAPContext
{
  RAPAppStateCreator *v3;
  id WeakRetained;
  void *v5;
  RAPAppStateCreator *v6;
  void *v7;
  RAPReport *v8;
  void *v9;
  RAPReport *v10;
  RAPReport *report;
  RAPPersonalPlaceCorrectionsQuestion *v12;
  RAPPersonalPlaceCorrectionsQuestion *question;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = [RAPAppStateCreator alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_maps_mapsSceneDelegate"));
  v6 = -[RAPAppStateCreator initWithSceneDelegate:](v3, "initWithSceneDelegate:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAppStateCreator createReportAProblemAppState](v6, "createReportAProblemAppState"));
  v8 = [RAPReport alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "submissionManager"));
  v10 = -[RAPReport initWithContext:submitter:](v8, "initWithContext:submitter:", v7, v9);
  report = self->_report;
  self->_report = v10;

  v12 = -[RAPPersonalPlaceCorrectionsQuestion initWithReport:parentQuestion:shortcut:]([RAPPersonalPlaceCorrectionsQuestion alloc], "initWithReport:parentQuestion:shortcut:", self->_report, 0, self->_shortcut);
  question = self->_question;
  self->_question = v12;

  -[RAPReport setInitialQuestion:](self->_report, "setInitialQuestion:", self->_question);
  -[RAPPersonalPlaceCorrectionsQuestion addUserPathItem:](self->_question, "addUserPathItem:", 1);

}

- (void)beginShortcutRefinement
{
  -[RAPPersonalPlaceRefinementCoordinator _presentLocationRefinement](self, "_presentLocationRefinement");
}

- (id)_refinementAlertController
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  RAPPersonalPlaceRefinementCoordinator *v26;
  id v27;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Continue Refining location [Personal Place]"), CFSTR("localized string not found"), 0));

  v5 = &stru_1011EB268;
  v6 = 0;
  v7 = &stru_1011EB268;
  v8 = &stru_1011EB268;
  switch((unint64_t)-[MapsSuggestionsShortcut type](self->_shortcut, "type"))
  {
    case 0uLL:
    case 1uLL:
    case 6uLL:
      goto LABEL_11;
    case 2uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Change Home Address? [Personal Place]"), CFSTR("localized string not found"), 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Change Home Address Description [Personal Place]"), CFSTR("localized string not found"), 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("Change Home Address [Personal Place]");
      goto LABEL_5;
    case 3uLL:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Change Work Address? [Personal Place]"), CFSTR("localized string not found"), 0));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Change Work Address Description [Personal Place]"), CFSTR("localized string not found"), 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("Change Work Address [Personal Place]");
      goto LABEL_5;
    case 4uLL:
      break;
    case 5uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Change School Address? [Personal Place]"), CFSTR("localized string not found"), 0));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Change School Address Description [Personal Place]"), CFSTR("localized string not found"), 0));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = v11;
      v13 = CFSTR("Change School Address [Personal Place]");
LABEL_5:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));

      break;
    default:
      v7 = &stru_1011EB268;
      v8 = &stru_1011EB268;
      break;
  }
  if (!-[__CFString length](v8, "length"))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    LOWORD(location[0]) = 0;
    v21 = "Assertion failed: changeAddressPrompt.length > 0";
LABEL_21:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v21, (uint8_t *)location, 2u);
    goto LABEL_22;
  }
  if (!-[__CFString length](v7, "length"))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    LOWORD(location[0]) = 0;
    v21 = "Assertion failed: changeAddressDescription.length > 0";
    goto LABEL_21;
  }
  if (!-[__CFString length](v5, "length"))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    LOWORD(location[0]) = 0;
    v21 = "Assertion failed: changeAddressSelection.length > 0";
    goto LABEL_21;
  }
  if (!objc_msgSend(v4, "length"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      v21 = "Assertion failed: continueRefiningLocation.length > 0";
      goto LABEL_21;
    }
LABEL_22:
    v6 = 0;
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v7, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v4, 0, 0));
  objc_msgSend(v6, "addAction:", v18);

  objc_initWeak(location, self);
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_100A11AE4;
  v25 = &unk_1011D9DC8;
  objc_copyWeak(&v27, location);
  v26 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v5, 1, &v22));
  objc_msgSend(v6, "addAction:", v19, v22, v23, v24, v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(location);
LABEL_11:

  return v6;
}

- (void)_presentLocationRefinement
{
  double latitude;
  double longitude;
  CLLocationDegrees v5;
  CLLocationDegrees v6;
  CLLocationDegrees latitudeDelta;
  CLLocationDegrees longitudeDelta;
  uint64_t v9;
  uint64_t v10;
  RAPMarkerViewAttributes *v11;
  EditLocationViewController *v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  EditLocationViewController *v21;
  EditLocationViewController *editLocationViewController;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id WeakRetained;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46[3];
  id location;
  CLLocationCoordinate2D v48;
  MKCoordinateRegion v49;

  -[RAPPersonalPlaceRefinementCoordinator originalCoordinate](self, "originalCoordinate");
  latitude = v48.latitude;
  longitude = v48.longitude;
  v49 = MKCoordinateRegionMakeWithDistance(v48, 100.0, 100.0);
  v5 = v49.center.latitude;
  v6 = v49.center.longitude;
  latitudeDelta = v49.span.latitudeDelta;
  longitudeDelta = v49.span.longitudeDelta;
  v9 = MapsSuggestionsShortcutTypeStyleAttributes(-[MapsSuggestionsShortcut type](self->_shortcut, "type"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = -[RAPMarkerViewAttributes initWithTitle:styleAttributes:]([RAPMarkerViewAttributes alloc], "initWithTitle:styleAttributes:", 0, v10);
  v12 = [EditLocationViewController alloc];
  v13.n128_f64[0] = v5;
  v14.n128_f64[0] = v6;
  v15.n128_f64[0] = latitudeDelta;
  v16.n128_f64[0] = longitudeDelta;
  v17 = MKMapRectForCoordinateRegion(v13, v14, v15, v16);
  v21 = -[EditLocationViewController initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:](v12, "initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:", 603, v11, latitude, longitude, v17, v18, v19, v20);
  editLocationViewController = self->_editLocationViewController;
  self->_editLocationViewController = v21;

  objc_initWeak(&location, self);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100A12030;
  v45[3] = &unk_1011DF9C8;
  objc_copyWeak(v46, &location);
  v46[1] = *(id *)&latitude;
  v46[2] = *(id *)&longitude;
  -[EditLocationViewController setChangeHandler:](self->_editLocationViewController, "setChangeHandler:", v45);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Refine Home Location"), CFSTR("localized string not found"), 0));

  if (-[MapsSuggestionsShortcut type](self->_shortcut, "type") == (id)3)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Refine Work Location"), CFSTR("localized string not found"), 0));

    v24 = (void *)v26;
  }
  v44 = (void *)v10;
  if (-[MapsSuggestionsShortcut type](self->_shortcut, "type") == (id)5)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Refine School Location"), CFSTR("localized string not found"), 0));

    v24 = (void *)v28;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v11));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Done"), CFSTR("localized string not found"), 0));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Cancel"), CFSTR("localized string not found"), 0));

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController navigationItem](self->_editLocationViewController, "navigationItem"));
  objc_msgSend(v33, "setTitle:", v24);

  v34 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v30, 2, self, "_doneLocationRefinement");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController navigationItem](self->_editLocationViewController, "navigationItem"));
  objc_msgSend(v35, "setRightBarButtonItem:", v34);

  if (self->_presentationStyle != 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "navigationController"));
    objc_msgSend(v42, "pushViewController:animated:", self->_editLocationViewController, 1);
LABEL_11:

    goto LABEL_12;
  }
  v36 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v32, 0, self, "_cancelLocationRefinement");
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController navigationItem](self->_editLocationViewController, "navigationItem"));
  objc_msgSend(v37, "setLeftBarButtonItem:", v36);

  WeakRetained = (id)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceRefinementCoordinator _navigationControllerWithRootViewController:](self, "_navigationControllerWithRootViewController:", self->_editLocationViewController));
  v39 = objc_loadWeakRetained((id *)&self->_parentViewController);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "traitCollection"));
  v41 = objc_msgSend(v40, "userInterfaceIdiom");

  if (v41 != (id)5)
  {
    v42 = objc_loadWeakRetained((id *)&self->_parentViewController);
    objc_msgSend(v42, "_maps_topMostPresentViewController:animated:completion:", WeakRetained, 1, 0);
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector(self->_delegate, "refinementCoordinator:presentViewController:") & 1) != 0)
    -[RAPPersonalPlaceRefinementCoordinatorDelegate refinementCoordinator:presentViewController:](self->_delegate, "refinementCoordinator:presentViewController:", self, WeakRetained);
LABEL_12:

  objc_destroyWeak(v46);
  objc_destroyWeak(&location);

}

- (void)_cancelLocationRefinement
{
  id WeakRetained;
  void *v4;
  id v5;
  EditLocationViewController *editLocationViewController;
  _QWORD v7[4];
  id v8;
  id location;

  if (self->_presentationStyle == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == (id)5)
    {
      objc_initWeak(&location, self);
      editLocationViewController = self->_editLocationViewController;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100A121F8;
      v7[3] = &unk_1011AD260;
      objc_copyWeak(&v8, &location);
      -[EditLocationViewController dismissViewControllerAnimated:completion:](editLocationViewController, "dismissViewControllerAnimated:completion:", 1, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      -[EditLocationViewController dismissViewControllerAnimated:completion:](self->_editLocationViewController, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }
}

- (void)_doneLocationRefinement
{
  RAPPersonalPlaceCorrectionsQuestion *question;
  RAPPersonalPlaceRefinementCoordinatorDelegate *delegate;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  question = self->_question;
  -[EditLocationViewController selectedCoordinate](self->_editLocationViewController, "selectedCoordinate");
  -[RAPPersonalPlaceCorrectionsQuestion setCorrectedCoordinate:](question, "setCorrectedCoordinate:");
  -[RAPPersonalPlaceCorrectionsQuestion addUserPathItem:](self->_question, "addUserPathItem:", 5);
  if ((objc_opt_respondsToSelector(self->_delegate, "refinementCoordinator:finishedRefiningCoordinate:withShortcut:") & 1) != 0)
  {
    delegate = self->_delegate;
    -[EditLocationViewController selectedCoordinate](self->_editLocationViewController, "selectedCoordinate");
    -[RAPPersonalPlaceRefinementCoordinatorDelegate refinementCoordinator:finishedRefiningCoordinate:withShortcut:](delegate, "refinementCoordinator:finishedRefiningCoordinate:withShortcut:", self, self->_shortcut);
  }
  if (self->_presentationStyle == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == (id)5)
    {
      objc_initWeak(&location, self);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController navigationController](self->_editLocationViewController, "navigationController"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100A12400;
      v12[3] = &unk_1011AD260;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[EditLocationViewController navigationController](self->_editLocationViewController, "navigationController"));
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[EditLocationViewController navigationController](self->_editLocationViewController, "navigationController"));
    v9 = objc_msgSend(v10, "popViewControllerAnimated:", 1);

  }
}

- (id)_navigationControllerWithRootViewController:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v3);

  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  objc_msgSend(v4, "setModalInPresentation:", 1);
  return v4;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  void *v3;
  double v4;
  CLLocationDegrees v5;
  void *v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcut geoMapItem](self->_shortcut, "geoMapItem"));
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcut geoMapItem](self->_shortcut, "geoMapItem"));
  objc_msgSend(v6, "coordinate");
  v8 = CLLocationCoordinate2DMake(v5, v7);

  latitude = v8.latitude;
  longitude = v8.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (RAPPersonalPlaceCorrectionsQuestion)question
{
  return self->_question;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_homeWorkCorrectionsViewController, 0);
  objc_storeStrong((id *)&self->_editLocationViewController, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
