@implementation RAPReportComposerIncidentsEditorViewController

- (RAPReportComposerIncidentsEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  RAPReportComposerIncidentsEditorViewController *v10;
  RAPReportComposerIncidentsEditorViewController *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerIncidentsEditorViewController;
  v10 = -[RAPReportTableViewController initWithReport:question:completion:](&v15, "initWithReport:question:completion:", a3, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportTableViewController sendButtonItem](v11, "sendButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerIncidentsEditorViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
  return v11;
}

- (int)analyticTarget
{
  return 741;
}

- (id)tableParts
{
  id v3;
  RAPReportComposerMapFeaturePickerPart *labelMarkerPickerPart;
  void *v5;
  void *v6;
  RAPMarkerViewAttributes *v7;
  RAPReportComposerMapFeaturePickerPart *v8;
  void *v9;
  void *v10;
  void *v11;
  RAPReportComposerMapFeaturePickerPart *v12;
  RAPReportComposerMapFeaturePickerPart *v13;
  RAPReportComposerCommentPart *commentPart;
  RAPReportComposerCommentPart *v15;
  void *v16;
  RAPReportComposerCommentPart *v17;
  RAPReportComposerCommentPart *v18;

  v3 = objc_alloc_init((Class)NSMutableArray);
  labelMarkerPickerPart = self->_labelMarkerPickerPart;
  if (!labelMarkerPickerPart)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPIncidentsQuestion incidentLayoutItem](self->_question, "incidentLayoutItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutItem styleAttributesForType:](TrafficIncidentLayoutItem, "styleAttributesForType:", objc_msgSend(v5, "incidentType")));

    v7 = -[RAPMarkerViewAttributes initWithTitle:styleAttributes:]([RAPMarkerViewAttributes alloc], "initWithTitle:styleAttributes:", 0, v6);
    v8 = [RAPReportComposerMapFeaturePickerPart alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self->_question, "report"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_context"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapCamera"));
    v12 = -[RAPReportComposerMapFeaturePickerPart initWithFeatureKind:camera:delegate:markerViewAttributes:](v8, "initWithFeatureKind:camera:delegate:markerViewAttributes:", 1, v11, self, v7);
    v13 = self->_labelMarkerPickerPart;
    self->_labelMarkerPickerPart = v12;

    labelMarkerPickerPart = self->_labelMarkerPickerPart;
  }
  objc_msgSend(v3, "addObject:", labelMarkerPickerPart);
  commentPart = self->_commentPart;
  if (!commentPart)
  {
    v15 = [RAPReportComposerCommentPart alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPIncidentsQuestion commentQuestion](self->_question, "commentQuestion"));
    v17 = -[RAPReportComposerCommentPart initWithCommentQuestion:](v15, "initWithCommentQuestion:", v16);
    v18 = self->_commentPart;
    self->_commentPart = v17;

    commentPart = self->_commentPart;
  }
  objc_msgSend(v3, "addObject:", commentPart);
  return v3;
}

- (void)inlineMapViewModelRequestsDisplayPowerActions:(id)a3
{
  -[RAPReportComposerIncidentsEditorViewController _presentMapPicker](self, "_presentMapPicker", a3);
}

- (void)_presentMapPicker
{
  void *v3;
  void *v4;
  RAPMarkerViewAttributes *v5;
  RAPEditLocationViewController *v6;
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
  double v18;
  RAPCorrectableEntryPoints *v19;
  RAPEditLocationViewController *v20;
  RAPEditLocationViewController *mapPicker;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, CLLocationDegrees, CLLocationDegrees);
  void *v27;
  id v28;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPIncidentsQuestion incidentLayoutItem](self->_question, "incidentLayoutItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutItem styleAttributesForType:](TrafficIncidentLayoutItem, "styleAttributesForType:", objc_msgSend(v3, "incidentType")));

  v5 = -[RAPMarkerViewAttributes initWithTitle:styleAttributes:]([RAPMarkerViewAttributes alloc], "initWithTitle:styleAttributes:", 0, v4);
  objc_initWeak(&location, self);
  v6 = [RAPEditLocationViewController alloc];
  -[RAPIncidentsQuestion selectedCoordinate](self->_question, "selectedCoordinate");
  v8 = v7;
  v10 = v9;
  -[RAPIncidentsQuestion coordinatePickingMapRect](self->_question, "coordinatePickingMapRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[RAPCorrectableEntryPoints initWithGEORoadAccessPoints:]([RAPCorrectableEntryPoints alloc], "initWithGEORoadAccessPoints:", &__NSArray0__struct);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_10077E6D8;
  v27 = &unk_1011C1650;
  objc_copyWeak(&v28, &location);
  v20 = -[RAPEditLocationViewController initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:allowEditingEntryPoints:correctableEntryPoints:selectionHandler:cancelSelectionHandler:](v6, "initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:allowEditingEntryPoints:correctableEntryPoints:selectionHandler:cancelSelectionHandler:", 1158, v5, 0, v19, &v24, 0, v8, v10, v12, v14, v16, v18);
  mapPicker = self->_mapPicker;
  self->_mapPicker = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPIncidentsQuestion localizedTitle](self->_question, "localizedTitle", v24, v25, v26, v27));
  -[RAPEditLocationViewController setNavigationTitle:](self->_mapPicker, "setNavigationTitle:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportComposerIncidentsEditorViewController navigationController](self, "navigationController"));
  objc_msgSend(v23, "pushViewController:animated:", self->_mapPicker, 1);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_labelMarkerPickerPart, 0);
  objc_storeStrong((id *)&self->_mapPicker, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
