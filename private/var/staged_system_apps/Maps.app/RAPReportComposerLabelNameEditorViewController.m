@implementation RAPReportComposerLabelNameEditorViewController

- (RAPReportComposerLabelNameEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerLabelNameEditorViewController *v10;
  RAPReportComposerLabelNameEditorViewController *v11;
  void *v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *labelPickerDoneBarItem;
  objc_super v17;

  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)RAPReportComposerLabelNameEditorViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v17, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController sendButtonItem](v11, "sendButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerLabelNameEditorViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

    v14 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v11, "_labelPickerFinishedSelectingMarker");
    labelPickerDoneBarItem = v11->_labelPickerDoneBarItem;
    v11->_labelPickerDoneBarItem = v14;

    -[RAPReportComposerLabelNameEditorViewController _updateLabelPickerDoneBarItem](v11, "_updateLabelPickerDoneBarItem");
  }

  return v11;
}

- (int)analyticTarget
{
  return 1127;
}

- (id)tableParts
{
  id v3;
  void *v4;
  RAPReportComposerMapFeaturePickerPart *labelMarkerPickerPart;
  RAPReportComposerMapFeaturePickerPart *v6;
  void *v7;
  void *v8;
  void *v9;
  RAPReportComposerMapFeaturePickerPart *v10;
  RAPReportComposerMapFeaturePickerPart *v11;
  RAPReportComposerIncorrectNamePart *nameEditorPart;
  RAPReportComposerIncorrectNamePart *v13;
  void *v14;
  RAPReportComposerIncorrectNamePart *v15;
  RAPReportComposerIncorrectNamePart *v16;
  RAPReportComposerLabelStatusPart *labelStatusPart;
  RAPReportComposerLabelStatusPart *v18;
  void *v19;
  RAPReportComposerLabelStatusPart *v20;
  RAPReportComposerLabelStatusPart *v21;
  RAPReportComposerCommentPart *commentPart;
  RAPReportComposerCommentPart *v23;
  void *v24;
  RAPReportComposerCommentPart *v25;
  RAPReportComposerCommentPart *v26;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController userInfoPart](self, "userInfoPart"));
  objc_msgSend(v3, "addObject:", v4);

  labelMarkerPickerPart = self->_labelMarkerPickerPart;
  if (!labelMarkerPickerPart)
  {
    v6 = [RAPReportComposerMapFeaturePickerPart alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self->_question, "report"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_context"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapCamera"));
    v10 = -[RAPReportComposerMapFeaturePickerPart initWithFeatureKind:camera:delegate:markerViewAttributes:](v6, "initWithFeatureKind:camera:delegate:markerViewAttributes:", 0, v9, self, 0);
    v11 = self->_labelMarkerPickerPart;
    self->_labelMarkerPickerPart = v10;

    labelMarkerPickerPart = self->_labelMarkerPickerPart;
  }
  objc_msgSend(v3, "addObject:", labelMarkerPickerPart);
  nameEditorPart = self->_nameEditorPart;
  if (!nameEditorPart)
  {
    v13 = [RAPReportComposerIncorrectNamePart alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion correctableName](self->_question, "correctableName"));
    v15 = -[RAPReportComposerIncorrectNamePart initWithCorrectableString:](v13, "initWithCorrectableString:", v14);
    v16 = self->_nameEditorPart;
    self->_nameEditorPart = v15;

    nameEditorPart = self->_nameEditorPart;
  }
  objc_msgSend(v3, "addObject:", nameEditorPart);
  labelStatusPart = self->_labelStatusPart;
  if (!labelStatusPart)
  {
    v18 = [RAPReportComposerLabelStatusPart alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion removeLabelCorrectableFlag](self->_question, "removeLabelCorrectableFlag"));
    v20 = -[RAPReportComposerLabelStatusPart initWithCorrectableFlag:](v18, "initWithCorrectableFlag:", v19);
    v21 = self->_labelStatusPart;
    self->_labelStatusPart = v20;

    labelStatusPart = self->_labelStatusPart;
  }
  objc_msgSend(v3, "addObject:", labelStatusPart);
  commentPart = self->_commentPart;
  if (!commentPart)
  {
    v23 = [RAPReportComposerCommentPart alloc];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion commentQuestion](self->_question, "commentQuestion"));
    v25 = -[RAPReportComposerCommentPart initWithCommentQuestion:](v23, "initWithCommentQuestion:", v24);
    v26 = self->_commentPart;
    self->_commentPart = v25;

    commentPart = self->_commentPart;
  }
  objc_msgSend(v3, "addObject:", commentPart);
  return v3;
}

- (void)inlineMapViewModelRequestsDisplayPowerActions:(id)a3
{
  -[RAPReportComposerLabelNameEditorViewController _presentMapPicker](self, "_presentMapPicker", a3);
}

- (void)_presentMapPicker
{
  VKLabelMarker *v3;
  VKLabelMarker *editedLabelMarker;
  void *v5;
  void *v6;
  void *v7;
  VKLabelMarker *v8;
  double v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  CLLocationCoordinate2D v12;
  void *v13;
  void *v14;
  RAPMapFeaturePickerViewController *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  RAPMapFeaturePickerViewController *v27;
  RAPMapFeaturePickerViewController *mapPicker;
  UIBarButtonItem *labelPickerDoneBarItem;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id location;

  v3 = (VKLabelMarker *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion labelMarker](self->_question, "labelMarker"));
  editedLabelMarker = self->_editedLabelMarker;
  self->_editedLabelMarker = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapCamera"));

  v8 = self->_editedLabelMarker;
  if (v8)
  {
    -[VKLabelMarker coordinate](v8, "coordinate");
    v10 = v9;
    -[VKLabelMarker coordinate](self->_editedLabelMarker, "coordinate");
    v12 = CLLocationCoordinate2DMake(v10, v11);
    objc_msgSend(v7, "setCenterCoordinate:", v12.latitude, v12.longitude);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self->_question, "_context"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapCamera"));
    objc_msgSend(v14, "centerCoordinate");
    objc_msgSend(v7, "setCenterCoordinate:");

  }
  objc_initWeak(&location, self);
  v15 = [RAPMapFeaturePickerViewController alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion localizedLabelMarkerPickingPrompt](self->_question, "localizedLabelMarkerPickingPrompt"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion localizedTitle](self->_question, "localizedTitle"));
  -[RAPLabelCorrectionsQuestion initialLabelMarkerPickingMapRect](self->_question, "initialLabelMarkerPickingMapRect");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = -[RAPLabelCorrectionsQuestion coordinatePickingMapType](self->_question, "coordinatePickingMapType");
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1006DA7F8;
  v32[3] = &unk_1011C08B8;
  objc_copyWeak(&v33, &location);
  v27 = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:preferredMapType:selection:](v15, "initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:preferredMapType:selection:", 0, v16, v17, v7, 1126, v26, v19, v21, v23, v25, v32);
  mapPicker = self->_mapPicker;
  self->_mapPicker = v27;

  if (self->_editedLabelMarker)
    -[RAPMapFeaturePickerViewController setSelectedLabelMarker:](self->_mapPicker, "setSelectedLabelMarker:");
  labelPickerDoneBarItem = self->_labelPickerDoneBarItem;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController navigationItem](self->_mapPicker, "navigationItem"));
  objc_msgSend(v30, "setRightBarButtonItem:", labelPickerDoneBarItem);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerLabelNameEditorViewController navigationController](self, "navigationController"));
  objc_msgSend(v31, "pushViewController:animated:", self->_mapPicker, 1);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

- (void)_instrumentSelectingLabel
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 10153, -[RAPMapFeaturePickerViewController analyticTarget](self->_mapPicker, "analyticTarget"), 0);

}

- (void)_updateLabelPickerDoneBarItem
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;

  -[VKLabelMarker coordinate](self->_editedLabelMarker, "coordinate");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion labelMarker](self->_question, "labelMarker"));
  objc_msgSend(v7, "coordinate");
  v9 = v8;
  v11 = v10;

  v12 = (vabdd_f64(v4, v9) >= 0.00000000999999994 || vabdd_f64(v6, v11) >= 0.00000000999999994)
     && self->_editedLabelMarker != 0;
  -[UIBarButtonItem setEnabled:](self->_labelPickerDoneBarItem, "setEnabled:", v12);
}

- (void)_labelPickerFinishedSelectingMarker
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  CLLocationCoordinate2D v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[VKLabelMarker coordinate](self->_editedLabelMarker, "coordinate");
  v4 = v3;
  -[VKLabelMarker coordinate](self->_editedLabelMarker, "coordinate");
  v6 = CLLocationCoordinate2DMake(v4, v5);
  -[RAPReportComposerMapFeaturePickerPart updateCoordinate:](self->_labelMarkerPickerPart, "updateCoordinate:", v6.latitude, v6.longitude);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController selectedLabelMarker](self->_mapPicker, "selectedLabelMarker"));
  -[RAPLabelCorrectionsQuestion setLabelMarker:](self->_question, "setLabelMarker:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapFeaturePickerViewController mapViewReportContext](self->_mapPicker, "mapViewReportContext"));
  -[RAPLabelCorrectionsQuestion setLabelMarkerPickingMapContext:](self->_question, "setLabelMarkerPickingMapContext:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion correctableName](self->_question, "correctableName"));
  -[RAPReportComposerIncorrectNamePart setCorrectableString:](self->_nameEditorPart, "setCorrectableString:", v9);

  -[UIBarButtonItem setEnabled:](self->_labelPickerDoneBarItem, "setEnabled:", -[RAPLabelCorrectionsQuestion isComplete](self->_question, "isComplete"));
  v11 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportComposerLabelNameEditorViewController navigationController](self, "navigationController"));
  v10 = objc_msgSend(v11, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_labelStatusPart, 0);
  objc_storeStrong((id *)&self->_nameEditorPart, 0);
  objc_storeStrong((id *)&self->_labelMarkerPickerPart, 0);
  objc_storeStrong((id *)&self->_editedLabelMarker, 0);
  objc_storeStrong((id *)&self->_labelPickerDoneBarItem, 0);
  objc_storeStrong((id *)&self->_mapPicker, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
