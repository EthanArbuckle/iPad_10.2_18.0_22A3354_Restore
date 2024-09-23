@implementation MapViewDragSource

- (BOOL)shouldBeginDragFromLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  SearchResult *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  SearchResult *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SearchResult *searchResult;
  BOOL v21;
  void *v22;
  VKLabelMarker *labelMarker;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView hitTest:withEvent:](self->_mapView, "hitTest:withEvent:", 0));
  v7 = -[MKMapView calloutViewContainsPoint:](self->_mapView, "calloutViewContainsPoint:", x, y);
  self->_draggingCallout = 0;
  if (!v7)
  {
    if (!objc_msgSend(v6, "isDescendantOfView:", self->_mapView))
    {
LABEL_21:
      v21 = 0;
      goto LABEL_22;
    }
    v16 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[MKMapView _annotationAtPoint:avoidCurrent:](self->_mapView, "_annotationAtPoint:avoidCurrent:", 0, x, y));
    v17 = objc_opt_class(MKUserLocation);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[SearchResult annotation](v16, "annotation"));

      v16 = (SearchResult *)v18;
    }
    v19 = objc_opt_class(SearchResult);
    if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
    {
      searchResult = self->_searchResult;
      self->_searchResult = v16;

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _labelMarkerAtPoint:](self->_mapView, "_labelMarkerAtPoint:", x, y));
      if (!-[MapViewDragSource _isValidLabelMarkerForDragging:](self, "_isValidLabelMarkerForDragging:", v22))
      {

LABEL_20:
        goto LABEL_21;
      }
      labelMarker = self->_labelMarker;
      self->_labelMarker = (VKLabelMarker *)v22;

    }
    v21 = 1;
    goto LABEL_22;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView selectedAnnotations](self->_mapView, "selectedAnnotations"));
  v9 = objc_msgSend(v8, "count");

  if (v9 != (id)1)
  {
LABEL_13:
    v16 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[MKMapView _selectedLabelMarker](self->_mapView, "_selectedLabelMarker"));
    if (-[MapViewDragSource _isValidLabelMarkerForDragging:](self, "_isValidLabelMarkerForDragging:", v16))
    {
      v15 = self->_labelMarker;
      self->_labelMarker = (VKLabelMarker *)v16;
      goto LABEL_15;
    }
    goto LABEL_20;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView selectedAnnotations](self->_mapView, "selectedAnnotations"));
  v11 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  v12 = objc_opt_class(MKUserLocation);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[SearchResult annotation](v11, "annotation"));

    v11 = (SearchResult *)v13;
  }
  v14 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v11, v14) & 1) == 0)
  {

    goto LABEL_13;
  }
  v15 = self->_searchResult;
  self->_searchResult = v11;
LABEL_15:

  v21 = 1;
  self->_draggingCallout = 1;
LABEL_22:

  return v21;
}

- (BOOL)_isValidLabelMarkerForDragging:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  unsigned int v7;

  v3 = a3;
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "isTransitLine") & 1) != 0
    || (objc_msgSend(v4, "isFlyoverTour") & 1) != 0
    || (objc_msgSend(v4, "isTrafficIncident") & 1) != 0
    || (objc_msgSend(v4, "isOneWayArrow") & 1) != 0
    || (objc_msgSend(v4, "isRouteAnnotation") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "featureType");
    if (v7 <= 6)
      v5 = (0x68u >> v7) & 1;
    else
      LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  DragAndDropMapItem *v15;
  DragAndDropMapItem *v16;
  double v17;
  CLLocationDegrees v18;
  void *searchResult;
  DragAndDropMapItem *v20;
  DragAndDropMapItem *dragItem;
  double v22;
  CLLocationDegrees v23;
  CLLocationCoordinate2D v24;
  DragAndDropPreview *v25;
  DragAndDropMapItem *v26;
  void *v27;
  DragAndDropPreview *v28;
  DragAndDropPreview *previewView;
  void *v30;
  id v31;
  void *v32;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  v9 = objc_msgSend(v8, "canStartNewDrag");

  if (!v9)
    goto LABEL_8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  if (!-[MapViewDragSource shouldBeginDragFromLocation:](self, "shouldBeginDragFromLocation:", v12, v14))
    goto LABEL_8;
  if (!self->_labelMarker)
  {
    if (self->_searchResult)
    {
      v20 = (DragAndDropMapItem *)objc_claimAutoreleasedReturnValue(+[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:"));
      dragItem = self->_dragItem;
      self->_dragItem = v20;

      -[SearchResult coordinate](self->_searchResult, "coordinate");
      v18 = v22;
      searchResult = self->_searchResult;
      goto LABEL_7;
    }
LABEL_8:
    v32 = &__NSArray0__struct;
    goto LABEL_9;
  }
  v15 = (DragAndDropMapItem *)objc_claimAutoreleasedReturnValue(+[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:"));
  v16 = self->_dragItem;
  self->_dragItem = v15;

  -[VKLabelMarker coordinate](self->_labelMarker, "coordinate");
  v18 = v17;
  searchResult = self->_labelMarker;
LABEL_7:
  objc_msgSend(searchResult, "coordinate");
  v24 = CLLocationCoordinate2DMake(v18, v23);
  -[DragAndDropMapItem setSourceView:](self->_dragItem, "setSourceView:", self->_mapView);
  -[DragAndDropMapItem setSourceCoordinate:](self->_dragItem, "setSourceCoordinate:", v24.latitude, v24.longitude);
  v25 = [DragAndDropPreview alloc];
  v26 = self->_dragItem;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView traitCollection](self->_mapView, "traitCollection"));
  v28 = -[DragAndDropPreview initWithDragAndDropMapItem:traitCollection:](v25, "initWithDragAndDropMapItem:traitCollection:", v26, v27);
  previewView = self->_previewView;
  self->_previewView = v28;

  -[DragAndDropPreview setContentUpdateDelegate:](self->_previewView, "setContentUpdateDelegate:", self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem itemProvider](self->_dragItem, "itemProvider"));
  v31 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v30);
  objc_msgSend(v31, "setLocalObject:", self->_dragItem);
  v34 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));

LABEL_9:
  return v32;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  DragAndDropPreview *previewView;
  id v7;
  void *v8;
  void *v9;
  MKMapView *mapView;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  previewView = self->_previewView;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview renderPreviewImage](previewView, "renderPreviewImage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localObject"));

  mapView = self->_mapView;
  objc_msgSend(v9, "sourceCoordinate");
  -[MKMapView convertCoordinate:toPointToView:](mapView, "convertCoordinate:toPointToView:", self->_mapView);
  v12 = v11;
  v14 = v13;
  v15 = objc_alloc((Class)UIDragPreviewTarget);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceView"));
  v17 = objc_msgSend(v15, "initWithContainer:center:", v16, v12, v14);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "targetedDragPreviewWithTarget:", v17));
  objc_storeStrong((id *)&self->_liftPreview, v18);

  return v18;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  MapsDragLocalContext *v6;
  void *v7;
  void *v8;
  void *v9;
  MapsDragLocalContext *v10;
  UIDragSession *currentDragSession;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a4;
  v6 = [MapsDragLocalContext alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewDragSource mapView](self, "mapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
  v10 = -[MapsDragLocalContext initWithWindowScene:](v6, "initWithWindowScene:", v9);
  objc_msgSend(v5, "setLocalContext:", v10);

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = (UIDragSession *)v5;
  v12 = v5;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v13, "setDragSession:", v12);

  -[MapViewDragSource updatePreviewDrag](self, "updatePreviewDrag");
  -[VKLabelMarker setIsDragged:](self->_labelMarker, "setIsDragged:", 1);
  v17 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem analyticsHelper](self->_dragItem, "analyticsHelper"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionDetails"));
  objc_msgSend(v14, "captureUserAction:onTarget:eventValue:placeActionDetails:", 17001, 1, v15, v16);

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  UIDragSession *currentDragSession;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v8, "setDragSession:", 0);

  -[VKLabelMarker setIsDragged:](self->_labelMarker, "setIsDragged:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem analyticsHelper](self->_dragItem, "analyticsHelper"));
  if (a5 == 2)
  {
    v9 = 17003;
    goto LABEL_5;
  }
  if (!a5)
  {
    v9 = 17002;
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionDetails"));
    objc_msgSend(v10, "captureUserAction:onTarget:eventValue:placeActionDetails:", v9, 1, v11, v12);

  }
  -[MapViewDragSource reset](self, "reset");

}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 0;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  void *v8;
  MKMapView *mapView;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  CGPoint v20;
  CGRect v21;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "localObject"));
  mapView = self->_mapView;
  objc_msgSend(v8, "sourceCoordinate");
  -[MKMapView convertCoordinate:toPointToView:](mapView, "convertCoordinate:toPointToView:", self->_mapView);
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceView"));
  objc_msgSend(v14, "frame");
  v20.x = v11;
  v20.y = v13;
  LODWORD(mapView) = CGRectContainsPoint(v21, v20);

  if ((_DWORD)mapView)
  {
    v15 = objc_alloc((Class)UIDragPreviewTarget);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceView"));
    v17 = objc_msgSend(v15, "initWithContainer:center:", v16, v11, v13);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "retargetedPreviewWithTarget:", v17));
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  return 0;
}

- (void)dragAndDropPreviewDidUpdate:(id)a3
{
  DragAndDropMapItem *v4;
  DragAndDropMapItem *dragItem;

  v4 = (DragAndDropMapItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "item"));
  dragItem = self->_dragItem;

  if (v4 == dragItem)
    -[MapViewDragSource updatePreviewDrag](self, "updatePreviewDrag");
}

- (void)updatePreviewDrag
{
  DragAndDropPreview *previewView;
  void *v4;
  UIDragSession *currentDragSession;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  if (self->_currentDragSession && (previewView = self->_previewView) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview renderPreviewImage](previewView, "renderPreviewImage"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1008D8C0C;
    v12[3] = &unk_1011B28B0;
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dragPreview"));
    currentDragSession = self->_currentDragSession;
    v6 = v13;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIDragSession items](currentDragSession, "items"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    objc_msgSend(v8, "setPreviewProvider:", v12);

  }
  else if (self->_liftPreview)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview renderPreviewImage](self->_previewView, "renderPreviewImage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITargetedDragPreview view](self->_liftPreview, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "image"));
    objc_msgSend(v9, "setImage:", v10);

  }
}

- (void)reset
{
  VKLabelMarker *labelMarker;
  SearchResult *searchResult;
  DragAndDropPreview *previewView;
  UITargetedDragPreview *liftPreview;
  DragAndDropMapItem *dragItem;
  UIDragSession *currentDragSession;
  id v9;

  -[VKLabelMarker setIsDragged:](self->_labelMarker, "setIsDragged:", 0);
  labelMarker = self->_labelMarker;
  self->_labelMarker = 0;

  searchResult = self->_searchResult;
  self->_searchResult = 0;

  previewView = self->_previewView;
  self->_previewView = 0;

  liftPreview = self->_liftPreview;
  self->_liftPreview = 0;

  dragItem = self->_dragItem;
  self->_dragItem = 0;

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v9, "setDragSession:", 0);

}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_currentDragSession, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
  objc_storeStrong((id *)&self->_liftPreview, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end
