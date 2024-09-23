@implementation RAPReportComposerAccessPointViewController

- (RAPReportComposerAccessPointViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerAccessPointViewController *v10;
  RAPReportComposerAccessPointViewController *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerAccessPointViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v15, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController sendButtonItem](v11, "sendButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerAccessPointViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
  return v11;
}

- (void)inlineMapViewModelRequestsDisplayPowerActions:(id)a3
{
  -[RAPReportComposerAccessPointViewController presentLocationPicker](self, "presentLocationPicker", a3);
}

- (id)tableParts
{
  void *v3;
  void *v4;
  RAPReportComposerMapFeaturePickerPart *locationPart;
  RAPReportComposerMapFeaturePickerPart *v6;
  RAPReportComposerMapFeaturePickerPart *v7;
  RAPReportComposerMapFeaturePickerPart *v8;
  RAPReportComposerEntranceDetailsPart *entranceDetailsPart;
  RAPReportComposerEntranceDetailsPart *v10;
  void *v11;
  RAPReportComposerEntranceDetailsPart *v12;
  RAPReportComposerEntranceDetailsPart *v13;
  RAPReportComposerCommentPart *commentPart;
  RAPReportComposerCommentPart *v15;
  void *v16;
  RAPReportComposerCommentPart *v17;
  RAPReportComposerCommentPart *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController userInfoPart](self, "userInfoPart"));
  objc_msgSend(v3, "addObject:", v4);

  locationPart = self->_locationPart;
  if (!locationPart)
  {
    v6 = [RAPReportComposerMapFeaturePickerPart alloc];
    -[RAPAccessPointQuestion selectedCoordinate](self->_question, "selectedCoordinate");
    v7 = -[RAPReportComposerMapFeaturePickerPart initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:](v6, "initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:", 3, self, 0);
    v8 = self->_locationPart;
    self->_locationPart = v7;

    locationPart = self->_locationPart;
  }
  objc_msgSend(v3, "addObject:", locationPart);
  if ((objc_opt_respondsToSelector(self->_question, "accessPointName") & 1) != 0)
  {
    entranceDetailsPart = self->_entranceDetailsPart;
    if (!entranceDetailsPart)
    {
      v10 = [RAPReportComposerEntranceDetailsPart alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAccessPointQuestion accessPointName](self->_question, "accessPointName"));
      v12 = -[RAPReportComposerEntranceDetailsPart initWithCorrectableString:](v10, "initWithCorrectableString:", v11);
      v13 = self->_entranceDetailsPart;
      self->_entranceDetailsPart = v12;

      entranceDetailsPart = self->_entranceDetailsPart;
    }
    objc_msgSend(v3, "addObject:", entranceDetailsPart);
  }
  commentPart = self->_commentPart;
  if (!commentPart)
  {
    v15 = [RAPReportComposerCommentPart alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAccessPointQuestion commentQuestion](self->_question, "commentQuestion"));
    v17 = -[RAPReportComposerCommentPart initWithCommentQuestion:](v15, "initWithCommentQuestion:", v16);
    v18 = self->_commentPart;
    self->_commentPart = v17;

    commentPart = self->_commentPart;
  }
  objc_msgSend(v3, "addObject:", commentPart);
  return v3;
}

- (int)analyticTarget
{
  return -[RAPAccessPointQuestion analyticTarget](self->_question, "analyticTarget");
}

- (int)_analyticTargetForMapPicker
{
  unsigned int v2;
  int v3;

  v2 = -[RAPAccessPointQuestion analyticTarget](self->_question, "analyticTarget");
  if (v2 == 1105)
    v3 = 1142;
  else
    v3 = 0;
  if (v2 == 1110)
    return 1109;
  else
    return v3;
}

- (void)presentLocationPicker
{
  RAPMapFeaturePickerViewController *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id location;

  objc_initWeak(&location, self);
  v3 = [RAPMapFeaturePickerViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Pan the map to position the entrance [Report a Problem]"), CFSTR("localized string not found"), 0));
  -[RAPAccessPointQuestion selectedCoordinate](self->_question, "selectedCoordinate");
  v7 = v6;
  v9 = v8;
  -[RAPAccessPointQuestion visibleMapRect](self->_question, "visibleMapRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = -[RAPReportComposerAccessPointViewController _analyticTargetForMapPicker](self, "_analyticTargetForMapPicker");
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_10092CC6C;
  v29 = &unk_1011C08B8;
  objc_copyWeak(&v30, &location);
  v19 = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:initialFeatureCoordinate:inMapRect:withCamera:analyticsTarget:selection:](v3, "initForPickingFeatureOfKind:withPrompt:title:initialFeatureCoordinate:inMapRect:withCamera:analyticsTarget:selection:", 3, v5, 0, 0, v18, &v26, v7, v9, v11, v13, v15, v17);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerAccessPointViewController _doneBarItem](self, "_doneBarItem", v26, v27, v28, v29));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
  objc_msgSend(v21, "setRightBarButtonItem:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerAccessPointViewController navigationItem](self, "navigationItem"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "title"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationItem"));
  objc_msgSend(v24, "setTitle:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerAccessPointViewController navigationController](self, "navigationController"));
  objc_msgSend(v25, "pushViewController:animated:", v19, 1);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (id)_doneBarItem
{
  UIBarButtonItem *doneBarItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneBarItem = self->_doneBarItem;
  if (!doneBarItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_mapPickerDone");
    v5 = self->_doneBarItem;
    self->_doneBarItem = v4;

    -[RAPReportComposerAccessPointViewController _updateDoneBarItem](self, "_updateDoneBarItem");
    doneBarItem = self->_doneBarItem;
  }
  return doneBarItem;
}

- (void)_mapPickerDone
{
  id v3;
  id v4;

  -[RAPAccessPointQuestion setSelectedCoordinate:](self->_question, "setSelectedCoordinate:", self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
  -[RAPReportComposerAccessPointViewController reloadLocationRow](self, "reloadLocationRow");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPReportComposerAccessPointViewController navigationController](self, "navigationController"));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)_updateDoneBarItem
{
  double v3;
  _BOOL4 v4;
  double v5;
  uint64_t v6;

  -[RAPAccessPointQuestion originalCoordinate](self->_question, "originalCoordinate");
  v4 = vabdd_f64(v3, self->_selectedCoordinate.latitude) >= 0.00000000999999994;
  v6 = vabdd_f64(v5, self->_selectedCoordinate.longitude) >= 0.00000000999999994 || v4;
  -[UIBarButtonItem setEnabled:](self->_doneBarItem, "setEnabled:", v6);
}

- (void)reloadLocationRow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  RAPReportComposerMapFeaturePickerPart *locationPart;

  -[RAPAccessPointQuestion originalCoordinate](self->_question, "originalCoordinate");
  v4 = v3;
  v6 = v5;
  -[RAPAccessPointQuestion selectedCoordinate](self->_question, "selectedCoordinate");
  if (vabdd_f64(v4, v8) >= 0.00000000999999994 || vabdd_f64(v6, v7) >= 0.00000000999999994)
  {
    locationPart = self->_locationPart;
    -[RAPAccessPointQuestion selectedCoordinate](self->_question, "selectedCoordinate");
    -[RAPReportComposerMapFeaturePickerPart updateCoordinate:](locationPart, "updateCoordinate:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneBarItem, 0);
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_entranceDetailsPart, 0);
  objc_storeStrong((id *)&self->_locationPart, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
