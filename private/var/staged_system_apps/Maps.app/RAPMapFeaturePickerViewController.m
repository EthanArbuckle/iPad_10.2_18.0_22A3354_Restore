@implementation RAPMapFeaturePickerViewController

- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 inMapRect:(id)a6 withCamera:(id)a7 analyticsTarget:(int)a8 selection:(id)a9
{
  double var1;
  double var0;
  double v14;
  double v15;
  id v19;
  id v20;
  id v21;
  id v22;
  RAPMapFeaturePickerViewController *v23;
  RAPMapFeaturePickerViewController *v24;
  id v25;
  id selection;
  NSString *v27;
  NSString *prompt;
  MKMapCamera *v29;
  MKMapCamera *mapCamera;
  CLLocationCoordinate2D v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  var1 = a6.var1.var1;
  var0 = a6.var1.var0;
  v14 = a6.var0.var1;
  v15 = a6.var0.var0;
  v19 = a4;
  v20 = a5;
  v21 = a7;
  v22 = a9;
  v36.receiver = self;
  v36.super_class = (Class)RAPMapFeaturePickerViewController;
  v23 = -[RAPMapFeaturePickerViewController initWithNibName:bundle:](&v36, "initWithNibName:bundle:", 0, 0);
  v24 = v23;
  if (v23)
  {
    v23->_kind = a3;
    v23->_rect.origin.x = v15;
    v23->_rect.origin.y = v14;
    v23->_rect.size.width = var0;
    v23->_rect.size.height = var1;
    v25 = objc_msgSend(v22, "copy");
    selection = v24->_selection;
    v24->_selection = v25;

    v27 = (NSString *)objc_msgSend(v19, "copy");
    prompt = v24->_prompt;
    v24->_prompt = v27;

    objc_storeStrong((id *)&v24->_originalPromptMessage, v24->_prompt);
    v29 = (MKMapCamera *)objc_msgSend(v21, "copy");
    mapCamera = v24->_mapCamera;
    v24->_mapCamera = v29;

    v31 = kCLLocationCoordinate2DInvalid;
    v24->_selectedCoordinate = kCLLocationCoordinate2DInvalid;
    v24->_initialFeatureCoordinate = v31;
    v24->_analyticsTarget = a8;
    -[RAPMapFeaturePickerViewController setTitle:](v24, "setTitle:", v20);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("localized string not found"), 0));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationItem](v24, "navigationItem"));
    objc_msgSend(v34, "setBackButtonTitle:", v33);

    v24->_mapViewZoomLevel = -1.0;
  }

  return v24;
}

- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 inMapRect:(id)a6 withCamera:(id)a7 analyticsTarget:(int)a8 preferredMapType:(unint64_t)a9 selection:(id)a10
{
  id result;

  result = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:selection:](self, "initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:selection:", a3, a4, a5, a7, *(_QWORD *)&a8, a10, a6.var0.var0, a6.var0.var1, a6.var1.var0, a6.var1.var1);
  if (result)
  {
    *((_BYTE *)result + 56) = 1;
    *((_QWORD *)result + 8) = a9;
  }
  return result;
}

- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 initialFeatureCoordinate:(CLLocationCoordinate2D)a6 inMapRect:(id)a7 withCamera:(id)a8 analyticsTarget:(int)a9 selection:(id)a10
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id result;

  longitude = a6.longitude;
  latitude = a6.latitude;
  result = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:selection:](self, "initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:selection:", a3, a4, a5, a8, *(_QWORD *)&a9, a10, a7.var0.var0, a7.var0.var1, a7.var1.var0, a7.var1.var1);
  if (result)
  {
    *((CLLocationDegrees *)result + 19) = latitude;
    *((CLLocationDegrees *)result + 20) = longitude;
  }
  return result;
}

- (id)initForPickingFeatureOfKind:(int64_t)a3 withPrompt:(id)a4 title:(id)a5 initialFeatureCoordinate:(CLLocationCoordinate2D)a6 inMapRect:(id)a7 withCamera:(id)a8 analyticsTarget:(int)a9 selection:(id)a10 textFieldTitle:(id)a11 textFieldText:(id)a12 textFieldWithEditBlock:(id)a13
{
  uint64_t v14;
  double var1;
  double var0;
  double v20;
  double v21;
  double longitude;
  double latitude;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;

  v14 = *(_QWORD *)&a9;
  var1 = a7.var1.var1;
  var0 = a7.var1.var0;
  v20 = a7.var0.var1;
  v21 = a7.var0.var0;
  longitude = a6.longitude;
  latitude = a6.latitude;
  v26 = a11;
  v27 = a12;
  v28 = a13;
  v29 = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:initialFeatureCoordinate:inMapRect:withCamera:analyticsTarget:selection:](self, "initForPickingFeatureOfKind:withPrompt:title:initialFeatureCoordinate:inMapRect:withCamera:analyticsTarget:selection:", a3, a4, a5, a8, v14, a10, latitude, longitude, v21, v20, var0, var1);
  if (v29)
  {
    v30 = objc_msgSend(v26, "copy");
    v31 = (void *)v29[23];
    v29[23] = v30;

    v32 = objc_msgSend(v27, "copy");
    v33 = (void *)v29[24];
    v29[24] = v32;

    objc_msgSend(v29, "_updateCommitBarItem");
    objc_initWeak(&location, v29);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10092A27C;
    v37[3] = &unk_1011DC2C0;
    objc_copyWeak(&v39, &location);
    v38 = v28;
    v34 = objc_retainBlock(v37);
    v35 = (void *)v29[22];
    v29[22] = v34;

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v29;
}

- (void)_selectionDidChange
{
  RAPMapStateProtocol *mapViewReportContext;
  void *v4;
  void (**selection)(id, RAPMapFeaturePickerViewController *);

  if (!self->_creatingMapViewReportContext)
  {
    mapViewReportContext = self->_mapViewReportContext;
    self->_mapViewReportContext = 0;

  }
  -[RAPMapFeaturePickerViewController _updateCommitBarItem](self, "_updateCommitBarItem");
  if (-[RAPMapFeaturePickerViewController analyticTarget](self, "analyticTarget")
    && -[RAPMapFeaturePickerViewController _selectionAction](self, "_selectionAction"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", -[RAPMapFeaturePickerViewController _selectionAction](self, "_selectionAction"), -[RAPMapFeaturePickerViewController analyticTarget](self, "analyticTarget"), 0);

  }
  selection = (void (**)(id, RAPMapFeaturePickerViewController *))self->_selection;
  if (selection)
    selection[2](selection, self);
}

- (void)setDidCommit:(BOOL)a3
{
  if (self->_didCommit != a3)
  {
    self->_didCommit = a3;
    -[RAPMapFeaturePickerViewController _updateCommitBarItem](self, "_updateCommitBarItem");
  }
}

- (void)setPrompt:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_prompt != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_prompt, a3);
    -[LocationRefinementViewController setInstructionsText:](self->_locationPicker, "setInstructionsText:", self->_prompt);
    v5 = v6;
  }

}

- (void)setHandlerBlocksForUserCommittedSelection:(id)a3 cancelled:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id cancel;
  UIBarButtonItem *v12;
  UIBarButtonItem *cancelBarItem;
  UIBarButtonItem *v14;
  void *v15;
  void *v16;
  UIBarButtonItem *v17;
  void *v18;
  UIBarButtonItem *v19;
  UIBarButtonItem *v20;
  id v21;

  v21 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Next [Report a Problem]"), CFSTR("localized string not found"), 0));
  -[RAPMapFeaturePickerViewController setHandlerBlocksForUserCommittedSelection:withRightBarButtonItemTitle:](self, "setHandlerBlocksForUserCommittedSelection:withRightBarButtonItemTitle:", v6, v8);

  v9 = v21;
  if (self->_cancel != v21)
  {
    v10 = objc_msgSend(v21, "copy");
    cancel = self->_cancel;
    self->_cancel = v10;

    v9 = v21;
    if (v21)
    {
      if (!self->_cancelBarItem)
      {
        v12 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancel");
        cancelBarItem = self->_cancelBarItem;
        self->_cancelBarItem = v12;

        v14 = self->_cancelBarItem;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationItem](self, "navigationItem"));
        v16 = v15;
        v17 = v14;
LABEL_7:
        objc_msgSend(v15, "setLeftBarButtonItem:", v17);

        v9 = v21;
      }
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationItem](self, "navigationItem"));
      v19 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leftBarButtonItem"));
      v20 = self->_cancelBarItem;

      v9 = 0;
      if (v19 == v20)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationItem](self, "navigationItem"));
        v16 = v15;
        v17 = 0;
        goto LABEL_7;
      }
    }
  }

}

- (void)setHandlerBlocksForUserCommittedSelection:(id)a3 withRightBarButtonItemTitle:(id)a4
{
  id v6;
  id v7;
  id commit;
  id v9;
  UIBarButtonItem *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;
  void *v14;
  void *v15;
  UIBarButtonItem *v16;
  UIBarButtonItem *commitBarItem;
  UIBarButtonItem *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (self->_commit != v19)
  {
    v7 = objc_msgSend(v19, "copy");
    commit = self->_commit;
    self->_commit = v7;

    if (v19)
    {
      if (!self->_commitBarItem)
      {
        v9 = objc_alloc((Class)UIBarButtonItem);
        if (v6)
          v10 = (UIBarButtonItem *)objc_msgSend(v9, "initWithTitle:style:target:action:", v6, 2, self, "_commit");
        else
          v10 = (UIBarButtonItem *)objc_msgSend(v9, "initWithBarButtonSystemItem:target:action:", 0, self, "_commit");
        commitBarItem = self->_commitBarItem;
        self->_commitBarItem = v10;

        -[RAPMapFeaturePickerViewController _updateCommitBarItem](self, "_updateCommitBarItem");
        v18 = self->_commitBarItem;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationItem](self, "navigationItem"));
        v15 = v14;
        v16 = v18;
        goto LABEL_10;
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationItem](self, "navigationItem"));
      v12 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rightBarButtonItem"));
      v13 = self->_commitBarItem;

      if (v12 == v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationItem](self, "navigationItem"));
        v15 = v14;
        v16 = 0;
LABEL_10:
        objc_msgSend(v14, "setRightBarButtonItem:", v16);

      }
    }
  }

}

- (void)_commit
{
  void (**commit)(id, RAPMapFeaturePickerViewController *);
  id v4;

  commit = (void (**)(id, RAPMapFeaturePickerViewController *))self->_commit;
  if (commit)
    commit[2](commit, self);
  if (-[RAPMapFeaturePickerViewController analyticTarget](self, "analyticTarget"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 10110, -[RAPMapFeaturePickerViewController analyticTarget](self, "analyticTarget"), 0);

  }
}

- (void)_cancel
{
  void (**cancel)(id, RAPMapFeaturePickerViewController *);

  cancel = (void (**)(id, RAPMapFeaturePickerViewController *))self->_cancel;
  if (cancel)
    cancel[2](cancel, self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPMapFeaturePickerViewController;
  -[RAPMapFeaturePickerViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  if (-[RAPMapFeaturePickerViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController backButtonPressedCallback](self, "backButtonPressedCallback"));

    if (v4)
    {
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController backButtonPressedCallback](self, "backButtonPressedCallback"));
      v5[2]();

    }
  }
}

- (int)_selectionAction
{
  unint64_t v2;

  v2 = self->_kind - 6;
  if (v2 > 2)
    return 10141;
  else
    return dword_100E3C808[v2];
}

- (void)_updateCommitBarItem
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  int64_t kind;
  int32x2_t v9;
  double v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  RAPLocationRefinementViewController *locationPicker;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  char mapViewHasFinishedToRenderMap;

  switch(self->_kind)
  {
    case 0:
    case 1:
    case 7:
    case 8:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController selectedLabelMarker](self, "selectedLabelMarker"));
      v4 = v3 != 0;

      break;
    case 2:
      v4 = 1;
      break;
    case 3:
    case 4:
    case 5:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController selectedAddressLocation](self, "selectedAddressLocation"));
      if (v5)
        v6 = !self->_didCommit;
      else
        v6 = 0;

      kind = self->_kind;
      if (kind == 5 || kind == 3)
      {
        v9 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL), vabdq_f64((float64x2_t)self->_initialFeatureCoordinate, (float64x2_t)kCLLocationCoordinate2DInvalid)));
        v4 = v6 & v9.i32[0] & v9.i32[1];
        if ((v9.i32[0] & v9.i32[1] & 1) == 0 && v6)
        {
          -[RAPMapFeaturePickerViewController selectedCoordinate](self, "selectedCoordinate");
          v11 = vabdd_f64(v10, self->_initialFeatureCoordinate.latitude) >= 0.00000000999999994;
          v4 = vabdd_f64(v12, self->_initialFeatureCoordinate.longitude) >= 0.00000000999999994 || v11;
        }
      }
      else
      {
        v4 = v6;
      }
      if (self->_textFieldEditBlock)
      {
        locationPicker = self->_locationPicker;
        v15 = objc_opt_class(RAPAddAPlaceLocationRefinementViewController);
        if ((objc_opt_isKindOfClass(locationPicker, v15) & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLocationRefinementViewController editedValue](self->_locationPicker, "editedValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17));

          if (v4)
            v4 = objc_msgSend(v18, "length") != 0;

        }
      }
      if (self->_didCommit)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Gathering location data [Report a Problem]"), CFSTR("localized string not found"), 0));
        -[RAPMapFeaturePickerViewController setPrompt:](self, "setPrompt:", v19);

        goto LABEL_27;
      }
      -[RAPMapFeaturePickerViewController setPrompt:](self, "setPrompt:", self->_originalPromptMessage);
      break;
    case 6:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController selectedTransitLineMarkers](self, "selectedTransitLineMarkers"));
      if (objc_msgSend(v13, "count"))
        v4 = self->_transitLinesAnnotation != 0;
      else
        v4 = 0;
LABEL_27:

      break;
    default:
      v4 = 0;
      break;
  }
  v20 = -[RAPMapFeaturePickerViewController requiresRenderedMapToContinue](self, "requiresRenderedMapToContinue");
  mapViewHasFinishedToRenderMap = (v20 ^ 1) & v4;
  if (((v20 ^ 1) & 1) == 0 && v4)
    mapViewHasFinishedToRenderMap = self->_mapViewHasFinishedToRenderMap;
  self->_canCommit = mapViewHasFinishedToRenderMap;
  -[UIBarButtonItem setEnabled:](self->_commitBarItem, "setEnabled:");
}

- (void)setMapViewZoomLevel:(double)a3
{
  self->_mapViewZoomLevel = a3;
  if (a3 >= 0.0)
    -[LocationRefinementViewController setInitialMapViewZoomLevel:](self->_locationPicker, "setInitialMapViewZoomLevel:");
}

- (void)setTextFieldPlaceholder:(id)a3
{
  NSString *v4;
  NSString *textFieldPlaceholder;
  RAPLocationRefinementViewController *locationPicker;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = (NSString *)objc_msgSend(v8, "copy");
  textFieldPlaceholder = self->_textFieldPlaceholder;
  self->_textFieldPlaceholder = v4;

  locationPicker = self->_locationPicker;
  v7 = objc_opt_class(RAPAddAPlaceLocationRefinementViewController);
  if ((objc_opt_isKindOfClass(locationPicker, v7) & 1) != 0)
    -[RAPLocationRefinementViewController setTextFieldPlaceholder:](self->_locationPicker, "setTextFieldPlaceholder:", v8);

}

- (void)viewDidLoad
{
  void *v3;
  unint64_t v4;
  RAPAddAPlaceLocationRefinementViewController *v5;
  RAPLocationRefinementViewController *locationPicker;
  double v7;
  RAPLocationRefinementViewController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  MKMapView *v26;
  MKMapView *mapView;
  void *v28;
  double y;
  unint64_t preferredMapType;
  unint64_t v31;
  id v32;
  id v33;
  void *v34;
  VKLabelMarker *selectedLabelMarker;
  objc_super v36;
  MKPointOfInterestCategory v37;

  v36.receiver = self;
  v36.super_class = (Class)RAPMapFeaturePickerViewController;
  -[RAPMapFeaturePickerViewController viewDidLoad](&v36, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController view](self, "view"));
  v4 = self->_kind - 3;
  if (self->_textFieldEditBlock)
    v5 = -[RAPAddAPlaceLocationRefinementViewController initWithCamera:showCrosshair:textFieldTitle:textFieldPlaceholder:textFieldText:textFieldEditBlock:]([RAPAddAPlaceLocationRefinementViewController alloc], "initWithCamera:showCrosshair:textFieldTitle:textFieldPlaceholder:textFieldText:textFieldEditBlock:", self->_mapCamera, v4 < 3, self->_textFieldTitle, self->_textFieldPlaceholder, self->_textFieldText, self->_textFieldEditBlock);
  else
    v5 = -[LocationRefinementViewController initWithCamera:showCrosshair:]([RAPLocationRefinementViewController alloc], "initWithCamera:showCrosshair:", self->_mapCamera, v4 < 3);
  locationPicker = self->_locationPicker;
  self->_locationPicker = &v5->super;

  -[RAPMapFeaturePickerViewController mapViewZoomLevel](self, "mapViewZoomLevel");
  if (v7 >= 0.0)
  {
    v8 = self->_locationPicker;
    -[RAPMapFeaturePickerViewController mapViewZoomLevel](self, "mapViewZoomLevel");
    -[LocationRefinementViewController setInitialMapViewZoomLevel:](v8, "setInitialMapViewZoomLevel:");
  }
  objc_msgSend(v3, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLocationRefinementViewController view](self->_locationPicker, "view"));
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  -[LocationRefinementViewController setMapViewDelegate:](self->_locationPicker, "setMapViewDelegate:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self->_locationPicker, "mapView"));
  objc_msgSend(v18, "setShowsUserLocation:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self->_locationPicker, "mapView"));
  objc_msgSend(v19, "_setShowsVenues:", 1);

  -[LocationRefinementViewController setInstructionsText:](self->_locationPicker, "setInstructionsText:", self->_prompt);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self->_locationPicker, "mapView"));
  objc_msgSend(v20, "visibleMapRect");
  self->_selectedMapRect.origin.x = v21;
  self->_selectedMapRect.origin.y = v22;
  self->_selectedMapRect.size.width = v23;
  self->_selectedMapRect.size.height = v24;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self->_locationPicker, "mapView"));
  objc_msgSend(v25, "setBackdropViewQualityChangingDisabled:", 1);

  v26 = (MKMapView *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self->_locationPicker, "mapView"));
  mapView = self->_mapView;
  self->_mapView = v26;

  -[RAPMapFeaturePickerViewController addChildViewController:](self, "addChildViewController:", self->_locationPicker);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLocationRefinementViewController view](self->_locationPicker, "view"));
  objc_msgSend(v3, "addSubview:", v28);

  -[RAPLocationRefinementViewController didMoveToParentViewController:](self->_locationPicker, "didMoveToParentViewController:", self);
  y = self->_rect.origin.y;
  if (self->_rect.origin.x != MKMapRectNull.origin.x || y != MKMapRectNull.origin.y)
    -[MKMapView setVisibleMapRect:](self->_mapView, "setVisibleMapRect:", self->_rect.origin.x, y, self->_rect.size.width, self->_rect.size.height);
  switch(self->_kind)
  {
    case 0:
    case 1:
    case 5:
    case 8:
      if (self->_hasPreferredMapType)
      {
        if ((self->_preferredMapType & 0xFFFFFFFFFFFFFFFDLL) == 1)
          preferredMapType = 0;
        else
          preferredMapType = self->_preferredMapType;
      }
      else
      {
        preferredMapType = 0;
      }
      -[MKMapView setMapType:](self->_mapView, "setMapType:", preferredMapType);
      -[MKMapView _setCanSelectAllLabels:](self->_mapView, "_setCanSelectAllLabels:", 1);
      break;
    case 2:
      -[MKMapView setMapType:](self->_mapView, "setMapType:", 3);
      break;
    case 3:
    case 4:
      if (self->_hasPreferredMapType)
      {
        if ((self->_preferredMapType & 0xFFFFFFFFFFFFFFFDLL) == 1)
          v31 = 4;
        else
          v31 = self->_preferredMapType;
      }
      else
      {
        v31 = 4;
      }
      -[MKMapView setMapType:](self->_mapView, "setMapType:", v31);
      if (CLLocationCoordinate2DIsValid(self->_initialFeatureCoordinate))
        -[LocationRefinementViewController setSelectedCoordinate:animated:](self->_locationPicker, "setSelectedCoordinate:animated:", 0, self->_initialFeatureCoordinate.latitude, self->_initialFeatureCoordinate.longitude);
      break;
    case 6:
      -[MKMapView setMapType:](self->_mapView, "setMapType:", 104);
      v32 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_mapTappedForTransitLineSelection:");
      -[MKMapView addGestureRecognizer:](self->_mapView, "addGestureRecognizer:", v32);
      goto LABEL_23;
    case 7:
      -[MKMapView setMapType:](self->_mapView, "setMapType:", 104);
      -[MKMapView _setCanSelectAllLabels:](self->_mapView, "_setCanSelectAllLabels:", 1);
      v33 = objc_alloc((Class)MKPointOfInterestFilter);
      v37 = MKPointOfInterestCategoryPublicTransport;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
      v32 = objc_msgSend(v33, "initIncludingCategories:", v34);

      -[MKMapView setPointOfInterestFilter:](self->_mapView, "setPointOfInterestFilter:", v32);
LABEL_23:

      break;
    default:
      break;
  }
  selectedLabelMarker = self->_selectedLabelMarker;
  if (selectedLabelMarker)
    -[MKMapView _selectLabelMarker:animated:](self->_mapView, "_selectLabelMarker:animated:", selectedLabelMarker, 1);
  if (-[RAPMapFeaturePickerViewController _shouldShowModeSelector](self, "_shouldShowModeSelector"))
  {
    -[RAPMapFeaturePickerViewController _showModeSelector](self, "_showModeSelector");
    -[RAPMapFeaturePickerViewController _updateAttributionInsets](self, "_updateAttributionInsets");
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPMapFeaturePickerViewController;
  -[RAPMapFeaturePickerViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[LocationRefinementViewController setMapViewDelegate:](self->_locationPicker, "setMapViewDelegate:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPMapFeaturePickerViewController;
  -[RAPMapFeaturePickerViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  -[LocationRefinementViewController setMapViewDelegate:](self->_locationPicker, "setMapViewDelegate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationController](self, "navigationController"));
  v5 = objc_msgSend(v4, "isToolbarHidden");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationController](self, "navigationController"));
    objc_msgSend(v6, "setToolbarHidden:animated:", 0, 0);

  }
}

- (int)analyticTarget
{
  return self->_analyticsTarget;
}

- (CLLocationCoordinate2D)selectedCoordinate
{
  CLLocationCoordinate2D *p_selectedCoordinate;
  double v4;
  double v5;
  double v6;
  double v7;
  double latitude;
  double longitude;
  RAPAddressLocation *v10;
  RAPAddressLocation *v11;
  RAPAddressLocation *selectedAddressLocation;
  CLLocationCoordinate2D result;

  p_selectedCoordinate = &self->_selectedCoordinate;
  if ((unint64_t)(self->_kind - 3) >= 3)
  {
    latitude = p_selectedCoordinate->latitude;
    longitude = self->_selectedCoordinate.longitude;
  }
  else
  {
    -[LocationRefinementViewController selectedCoordinate](self->_locationPicker, "selectedCoordinate");
    v5 = v4;
    v7 = v6;
    latitude = p_selectedCoordinate->latitude;
    if (vabdd_f64(p_selectedCoordinate->latitude, v5) >= 0.00000000999999994
      || (longitude = p_selectedCoordinate->longitude, vabdd_f64(longitude, v7) >= 0.00000000999999994))
    {
      v10 = [RAPAddressLocation alloc];
      -[LocationRefinementViewController selectedCoordinate](self->_locationPicker, "selectedCoordinate");
      v11 = -[RAPAddressLocation initWithCoordinate:](v10, "initWithCoordinate:");
      selectedAddressLocation = self->_selectedAddressLocation;
      self->_selectedAddressLocation = v11;

      -[LocationRefinementViewController selectedCoordinate](self->_locationPicker, "selectedCoordinate");
    }
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)_mapTappedForTransitLineSelection:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  void *v10;
  id v11;
  id v12;
  RAPTransitLinesAnnotation *transitLinesAnnotation;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  NSArray *v22;
  NSArray *selectedTransitLineIdentifiers;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  objc_msgSend(a3, "locationInView:", self->_mapView);
  v5 = v4;
  v7 = v6;
  -[MKMapView convertPoint:toCoordinateFromView:](self->_mapView, "convertPoint:toCoordinateFromView:", self->_mapView);
  self->_tappedCoordinate.latitude = v8;
  self->_tappedCoordinate.longitude = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _transitLineMarkersForSelectionAtPoint:](self->_mapView, "_transitLineMarkersForSelectionAtPoint:", v5, v7));
  v11 = objc_msgSend(v10, "count");
  if (v11)
    v12 = objc_msgSend(v10, "copy");
  else
    v12 = 0;
  objc_storeStrong((id *)&self->_selectedTransitLineMarkers, v12);
  if (v11)

  if (self->_transitLinesAnnotation)
  {
    -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:");
    transitLinesAnnotation = self->_transitLinesAnnotation;
    self->_transitLinesAnnotation = 0;

  }
  v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "identifier", (_QWORD)v24));
        if (v20)
          objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  v21 = MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray(v14);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue(v21);
  selectedTransitLineIdentifiers = self->_selectedTransitLineIdentifiers;
  self->_selectedTransitLineIdentifiers = v22;

  -[RAPMapFeaturePickerViewController _selectionDidChange](self, "_selectionDidChange");
  -[RAPMapFeaturePickerViewController _updateCommitBarItem](self, "_updateCommitBarItem");

}

- (void)displayAnnotationAtCoordinate:(CLLocationCoordinate2D)a3 withText:(id)a4
{
  double longitude;
  double latitude;
  RAPTransitLinesAnnotation *v7;
  RAPTransitLinesAnnotation *transitLinesAnnotation;
  id v9;
  CLLocationCoordinate2D v10;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a4;
  v10.latitude = latitude;
  v10.longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v10))
  {
    v7 = -[RAPTransitLinesAnnotation initWithCoordinate:title:]([RAPTransitLinesAnnotation alloc], "initWithCoordinate:title:", v9, latitude, longitude);
    transitLinesAnnotation = self->_transitLinesAnnotation;
    self->_transitLinesAnnotation = v7;

    -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", self->_transitLinesAnnotation);
    -[RAPMapFeaturePickerViewController _updateCommitBarItem](self, "_updateCommitBarItem");
  }

}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  RAPTransitLinesAnnotation *transitLinesAnnotation;
  id v7;
  void *v8;
  unsigned int v9;
  dispatch_time_t v10;
  _QWORD block[5];

  transitLinesAnnotation = self->_transitLinesAnnotation;
  if (transitLinesAnnotation)
  {
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewForAnnotation:", transitLinesAnnotation));
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      v10 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10092B5E8;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }

  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  LOBYTE(v9) = 0;
  switch(self->_kind)
  {
    case 0:
      v9 = objc_msgSend(v7, "isOneWayArrow") ^ 1;
      break;
    case 1:
      LOBYTE(v9) = objc_msgSend(v7, "hasBusinessID");
      break;
    case 7:
      if (!objc_msgSend(v7, "hasBusinessID"))
        goto LABEL_11;
      v10 = objc_msgSend(v8, "featureType") == 5;
      goto LABEL_8;
    case 8:
      if (objc_msgSend(v7, "hasBusinessID"))
      {
        v10 = objc_msgSend(v8, "featureType") == 6;
LABEL_8:
        LOBYTE(v9) = v10;
      }
      else
      {
LABEL_11:
        LOBYTE(v9) = 0;
      }
      break;
    default:
      break;
  }

  return v9;
}

- (void)setSelectedLabelMarker:(id)a3
{
  VKLabelMarker **p_selectedLabelMarker;
  id v6;

  p_selectedLabelMarker = &self->_selectedLabelMarker;
  objc_storeStrong((id *)&self->_selectedLabelMarker, a3);
  v6 = a3;
  -[MKMapView _selectLabelMarker:animated:](self->_mapView, "_selectLabelMarker:animated:", *p_selectedLabelMarker, 1);

}

- (BOOL)_kindTracksLabelMarkerSelection
{
  return (unint64_t)(self->_kind - 7) < 0xFFFFFFFFFFFFFFFBLL;
}

- (RAPMapStateProtocol)mapViewReportContext
{
  RAPMapStateProtocol *mapViewReportContext;
  void *v4;
  void *v5;
  RAPMapState *v6;
  RAPMapStateProtocol *v7;

  mapViewReportContext = self->_mapViewReportContext;
  if (!mapViewReportContext)
  {
    if (self->_mapView)
    {
      self->_creatingMapViewReportContext = 1;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsDefaultTraitsForMapView:mapViewEnteredForegroundDate:mapViewportChangedDate:", self->_mapView, 0, 0));

      v6 = -[RAPMapState initWithMapView:traits:place:]([RAPMapState alloc], "initWithMapView:traits:place:", self->_mapView, v5, 0);
      v7 = self->_mapViewReportContext;
      self->_mapViewReportContext = (RAPMapStateProtocol *)v6;

      self->_creatingMapViewReportContext = 0;
      mapViewReportContext = self->_mapViewReportContext;
    }
    else
    {
      mapViewReportContext = 0;
    }
  }
  return mapViewReportContext;
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  unsigned int v5;
  VKLabelMarker *v6;
  VKLabelMarker *selectedLabelMarker;
  VKLabelMarker *v8;

  v8 = (VKLabelMarker *)a4;
  v5 = -[RAPMapFeaturePickerViewController _kindTracksLabelMarkerSelection](self, "_kindTracksLabelMarkerSelection");
  v6 = v8;
  if (v5)
  {
    selectedLabelMarker = self->_selectedLabelMarker;
    if (!v8 || selectedLabelMarker == v8)
    {
      self->_selectedLabelMarker = 0;

      -[RAPMapFeaturePickerViewController _selectionDidChange](self, "_selectionDidChange");
      v6 = v8;
    }
  }

}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6;

  v6 = a4;
  if (-[RAPMapFeaturePickerViewController _kindTracksLabelMarkerSelection](self, "_kindTracksLabelMarkerSelection"))
  {
    objc_storeStrong((id *)&self->_selectedLabelMarker, a4);
    -[RAPMapFeaturePickerViewController _selectionDidChange](self, "_selectionDidChange");
  }

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  RAPTransitLinesAnnotation *v6;
  uint64_t v7;
  id v8;

  v6 = (RAPTransitLinesAnnotation *)a4;
  if (self->_transitLinesAnnotation == v6)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("transitLinesAnnotation")));
    if (!v8)
      v8 = objc_msgSend(objc_alloc((Class)MKAnnotationView), "initWithAnnotation:reuseIdentifier:", v6, CFSTR("transitLinesAnnotation"));
    objc_msgSend(v8, "setCanShowCallout:", 1);
  }
  else
  {
    v7 = objc_opt_class(MKUserLocation);
    objc_opt_isKindOfClass(v6, v7);
    v8 = 0;
  }

  return v8;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  int64_t kind;
  double v6;
  double v7;
  double v8;
  double v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  RAPAddressLocation *v12;
  RAPAddressLocation *selectedAddressLocation;
  id v14;

  v14 = a3;
  kind = self->_kind;
  if (kind == 2)
  {
    -[MKMapView visibleMapRect](self->_mapView, "visibleMapRect");
    self->_selectedMapRect.origin.x = v6;
    self->_selectedMapRect.origin.y = v7;
    self->_selectedMapRect.size.width = v8;
    self->_selectedMapRect.size.height = v9;
    -[RAPMapFeaturePickerViewController _selectionDidChange](self, "_selectionDidChange");
    kind = self->_kind;
  }
  if ((unint64_t)(kind - 3) <= 2)
  {
    -[LocationRefinementViewController selectedCoordinate](self->_locationPicker, "selectedCoordinate");
    self->_selectedCoordinate.latitude = v10;
    self->_selectedCoordinate.longitude = v11;
    v12 = -[RAPAddressLocation initWithCoordinate:]([RAPAddressLocation alloc], "initWithCoordinate:", self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
    selectedAddressLocation = self->_selectedAddressLocation;
    self->_selectedAddressLocation = v12;

    -[RAPAddressLocation processWithGeocoderIfNeededWithCompletion:](self->_selectedAddressLocation, "processWithGeocoderIfNeededWithCompletion:", 0);
    -[RAPMapFeaturePickerViewController _selectionDidChange](self, "_selectionDidChange");
  }

}

- (void)mapViewWillStartRenderingMap:(id)a3
{
  self->_mapViewHasFinishedToRenderMap = 0;
  if (-[RAPMapFeaturePickerViewController requiresRenderedMapToContinue](self, "requiresRenderedMapToContinue", a3))
    -[RAPMapFeaturePickerViewController _updateCommitBarItem](self, "_updateCommitBarItem");
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  self->_mapViewHasFinishedToRenderMap = 1;
  if (-[RAPMapFeaturePickerViewController requiresRenderedMapToContinue](self, "requiresRenderedMapToContinue", a3, a4))
    -[RAPMapFeaturePickerViewController _updateCommitBarItem](self, "_updateCommitBarItem");
}

- (BOOL)_shouldShowModeSelector
{
  return (self->_kind > 8uLL) | (0x1Bu >> self->_kind) & 1;
}

- (void)_showModeSelector
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MapViewModeSelector *v7;
  MapViewModeSelector *modeSelector;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  UIView *v14;
  UIView *floatingControlsView;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController userLocationButtonBottomConstraint](self->_locationPicker, "userLocationButtonBottomConstraint"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController userLocationButtonBottomConstraint](self->_locationPicker, "userLocationButtonBottomConstraint"));
    v33 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController snapToUserLocationContainerView](self->_locationPicker, "snapToUserLocationContainerView"));
    objc_msgSend(v6, "removeFromSuperview");

  }
  v7 = -[MapViewModeSelector initWithDesiredViewModes:]([MapViewModeSelector alloc], "initWithDesiredViewModes:", &off_101273FF8);
  modeSelector = self->_modeSelector;
  self->_modeSelector = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self->_locationPicker, "mapView"));
  v10 = objc_msgSend(v9, "mapType");
  switch((unint64_t)v10)
  {
    case 1uLL:
      v11 = 2;
      break;
    case 2uLL:
      v11 = 1;
      break;
    case 3uLL:
      v11 = 6;
      break;
    case 4uLL:
      v11 = 5;
      break;
    default:
      v12 = 3;
      if (v10 != (id)104)
        v12 = 0;
      if (v10 == (id)103)
        v11 = -1;
      else
        v11 = v12;
      break;
  }

  -[MapViewModeSelector addTarget:action:forControlEvents:](self->_modeSelector, "addTarget:action:forControlEvents:", self, "_handleSegmentedControlTap:", 4096);
  -[MapViewModeSelector setSelectedViewMode:](self->_modeSelector, "setSelectedViewMode:", v11);
  v13 = sub_100485870(self->_modeSelector);
  v14 = (UIView *)objc_claimAutoreleasedReturnValue(v13);
  floatingControlsView = self->_floatingControlsView;
  self->_floatingControlsView = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", self->_floatingControlsView);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_floatingControlsView, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "safeAreaLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 8.0));
  v32[0] = v27;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_floatingControlsView, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "safeAreaLayoutGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20, -8.0));
  v32[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_floatingControlsView, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView safeAreaLayoutGuide](self->_mapView, "safeAreaLayoutGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -8.0));
  v32[2] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

}

- (void)_updateAttributionInsets
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  MKMapView *mapView;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  -[UIView systemLayoutSizeFittingSize:](self->_floatingControlsView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController view](self, "view"));
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

  mapView = self->_mapView;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController view](self, "view"));
  objc_msgSend(v16, "safeAreaInsets");
  v12 = v11;
  if (v9 == (id)1)
  {
    v12 = v11 + 8.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController view](self, "view"));
    objc_msgSend(v13, "safeAreaInsets");
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController view](self, "view"));
    objc_msgSend(v13, "safeAreaInsets");
    v14 = v15 + 8.0;
  }
  -[MKMapView _setAttributionInsets:](mapView, "_setAttributionInsets:", 0.0, v12, v4 + v7 + 8.0, v14);

}

- (void)_handleSegmentedControlTap:(id)a3
{
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = -[MapViewModeSelector selectedViewMode](self->_modeSelector, "selectedViewMode", a3);
  v5 = 0;
  if (v4 == 2)
    v6 = 0;
  else
    v6 = v4 - 1;
  if (v6 <= 6)
    v5 = qword_100E3C818[v6];
  -[MKMapView setMapType:](self->_mapView, "setMapType:", v5);
}

- (NSArray)selectedTransitLineMarkers
{
  return self->_selectedTransitLineMarkers;
}

- (VKLabelMarker)selectedLabelMarker
{
  return self->_selectedLabelMarker;
}

- ($C79183323B9A0D5602617FF3BE5395AC)selectedMapRect
{
  double x;
  double y;
  double width;
  double height;
  $C79183323B9A0D5602617FF3BE5395AC result;

  x = self->_selectedMapRect.origin.x;
  y = self->_selectedMapRect.origin.y;
  width = self->_selectedMapRect.size.width;
  height = self->_selectedMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (RAPAddressLocation)selectedAddressLocation
{
  return self->_selectedAddressLocation;
}

- (NSArray)selectedTransitLineIdentifiers
{
  return self->_selectedTransitLineIdentifiers;
}

- (void)setSelectedTransitLineIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTransitLineIdentifiers, a3);
}

- (CLLocationCoordinate2D)tappedCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_tappedCoordinate.latitude;
  longitude = self->_tappedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setTappedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_tappedCoordinate = a3;
}

- (BOOL)canCommit
{
  return self->_canCommit;
}

- (BOOL)didCommit
{
  return self->_didCommit;
}

- (BOOL)requiresRenderedMapToContinue
{
  return self->_requiresRenderedMapToContinue;
}

- (void)setRequiresRenderedMapToContinue:(BOOL)a3
{
  self->_requiresRenderedMapToContinue = a3;
}

- (NSString)textFieldPlaceholder
{
  return self->_textFieldPlaceholder;
}

- (id)backButtonPressedCallback
{
  return self->_backButtonPressedCallback;
}

- (void)setBackButtonPressedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (double)mapViewZoomLevel
{
  return self->_mapViewZoomLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backButtonPressedCallback, 0);
  objc_storeStrong((id *)&self->_textFieldPlaceholder, 0);
  objc_storeStrong((id *)&self->_mapViewReportContext, 0);
  objc_storeStrong((id *)&self->_selectedTransitLineIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedAddressLocation, 0);
  objc_storeStrong((id *)&self->_selectedLabelMarker, 0);
  objc_storeStrong((id *)&self->_selectedTransitLineMarkers, 0);
  objc_storeStrong((id *)&self->_modeSelector, 0);
  objc_storeStrong((id *)&self->_floatingControlsView, 0);
  objc_storeStrong((id *)&self->_textFieldText, 0);
  objc_storeStrong((id *)&self->_textFieldTitle, 0);
  objc_storeStrong(&self->_textFieldEditBlock, 0);
  objc_storeStrong((id *)&self->_transitLinesAnnotation, 0);
  objc_storeStrong(&self->_cancel, 0);
  objc_storeStrong(&self->_commit, 0);
  objc_storeStrong((id *)&self->_cancelBarItem, 0);
  objc_storeStrong((id *)&self->_commitBarItem, 0);
  objc_storeStrong((id *)&self->_locationPicker, 0);
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_originalPromptMessage, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_mapCamera, 0);
}

@end
