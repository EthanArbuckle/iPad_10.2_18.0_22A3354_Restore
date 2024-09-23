@implementation MapSelectionManager

- (MapSelectionManager)initWithCameraController:(id)a3
{
  id v5;
  MapSelectionManager *v6;
  void *v7;
  void *v8;
  dispatch_group_t v9;
  OS_dispatch_group *updateGroup;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapSelectionManager;
  v6 = -[MapSelectionManager init](&v12, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
    -[MapSelectionManager _addGestureRecognizersForMapView:](v6, "_addGestureRecognizersForMapView:", v7);

    objc_storeStrong((id *)&v6->_mapCameraController, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v8, "registerDefaults:", &off_1012749A8);

    v9 = dispatch_group_create();
    updateGroup = v6->_updateGroup;
    v6->_updateGroup = (OS_dispatch_group *)v9;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
  -[MapSelectionManager _removeGestureRecognizersForMapView:](self, "_removeGestureRecognizersForMapView:", v3);

  v4.receiver = self;
  v4.super_class = (Class)MapSelectionManager;
  -[MapSelectionManager dealloc](&v4, "dealloc");
}

- (MKMapView)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapCameraController](self, "mapCameraController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return (MKMapView *)v3;
}

- (void)_notifyDelegate
{
  int *p_updateCount;
  unsigned int v4;
  MKAnnotationView *annotationView;
  id v6;
  id WeakRetained;

  p_updateCount = &self->_updateCount;
  do
    v4 = __ldxr((unsigned int *)p_updateCount);
  while (__stxr(v4, (unsigned int *)p_updateCount));
  if (!v4)
  {
    if (self->_labelMarker)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "mapSelectionManager:selectVKLabelMarker:", self, self->_labelMarker);
    }
    else
    {
      annotationView = self->_annotationView;
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      WeakRetained = v6;
      if (annotationView)
        objc_msgSend(v6, "mapSelectionManager:selectAnnotationView:", self, self->_annotationView);
      else
        objc_msgSend(v6, "mapSelectionManagerClearSelection:", self);
    }

  }
}

- (void)_setNeedsUpdate
{
  NSObject *updateGroup;
  _QWORD v4[5];
  _QWORD block[5];

  if (!self->needsUpdate)
  {
    self->needsUpdate = 1;
    -[MapSelectionManager suspendUpdates](self, "suspendUpdates");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B17F54;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    updateGroup = self->_updateGroup;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100B17F5C;
    v4[3] = &unk_1011AC860;
    v4[4] = self;
    dispatch_group_notify(updateGroup, (dispatch_queue_t)&_dispatch_main_q, v4);

  }
}

- (void)setMapCameraController:(id)a3
{
  MapCameraController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MapCameraController *v10;

  v5 = (MapCameraController *)a3;
  if (self->_mapCameraController != v5)
  {
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapCameraController](self, "mapCameraController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));
    -[MapSelectionManager _removeGestureRecognizersForMapView:](self, "_removeGestureRecognizersForMapView:", v7);

    objc_storeStrong((id *)&self->_mapCameraController, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapCameraController](self, "mapCameraController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
    -[MapSelectionManager _addGestureRecognizersForMapView:](self, "_addGestureRecognizersForMapView:", v9);

    v5 = v10;
  }

}

- (void)_addGestureRecognizersForMapView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_pinchGestureRecognizer"));
    objc_msgSend(v5, "addTarget:action:", self, "_handleMapPinch:");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_oneHandedZoomGestureRecognizer"));
    objc_msgSend(v6, "addTarget:action:", self, "_handleMapZoomingGesture:");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_doubleTapGestureRecognizer"));
    objc_msgSend(v7, "addTarget:action:", self, "_clearClusterSelectionOnGesture:");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_twoFingerTapGestureRecognizer"));
    objc_msgSend(v8, "addTarget:action:", self, "_clearClusterSelectionOnGesture:");

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_selectingTapGestureRecognizer"));
    objc_msgSend(v9, "addTarget:action:", self, "_handleSelectingTapGesture:");

  }
}

- (void)_removeGestureRecognizersForMapView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_pinchGestureRecognizer"));
    objc_msgSend(v5, "removeTarget:action:", self, "_handleMapPinch:");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_oneHandedZoomGestureRecognizer"));
    objc_msgSend(v6, "removeTarget:action:", self, "_handleMapZoomingGesture:");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_doubleTapGestureRecognizer"));
    objc_msgSend(v7, "removeTarget:action:", self, "_clearClusterSelectionOnGesture:");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_twoFingerTapGestureRecognizer"));
    objc_msgSend(v8, "removeTarget:action:", self, "_clearClusterSelectionOnGesture:");

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_selectingTapGestureRecognizer"));
    objc_msgSend(v9, "removeTarget:action:", self, "_handleSelectingTapGesture:");

  }
}

- (void)setLabelMarker:(id)a3
{
  -[MapSelectionManager setLabelMarker:updateIfNeeded:](self, "setLabelMarker:updateIfNeeded:", a3, 1);
}

- (void)setLabelMarker:(id)a3 updateIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  VKLabelMarker *v7;
  VKLabelMarker **p_labelMarker;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MKAnnotationView *annotationView;
  void *v14;
  id v15;
  unsigned int v16;
  void *v17;
  VKLabelMarker *v18;

  v4 = a4;
  v7 = (VKLabelMarker *)a3;
  p_labelMarker = &self->_labelMarker;
  if (self->_labelMarker == v7)
    goto LABEL_14;
  v18 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](v7, "featureAnnotation"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](*p_labelMarker, "featureAnnotation"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](v18, "featureAnnotation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](*p_labelMarker, "featureAnnotation"));
      LODWORD(v9) = objc_msgSend(v11, "isEqual:", v12);

    }
    else
    {
      LODWORD(v9) = 0;
    }
  }
  objc_storeStrong((id *)&self->_labelMarker, a3);
  annotationView = self->_annotationView;
  self->_annotationView = 0;

  if (-[VKLabelMarker countFeatureIDs](v18, "countFeatureIDs"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    v15 = *(id *)-[VKLabelMarker featureIDs](v18, "featureIDs");
LABEL_10:
    objc_msgSend(v14, "setSelectedVenuePoiFeatureId:", v15);
    goto LABEL_12;
  }
  v16 = -[VKLabelMarker hasBusinessID](v18, "hasBusinessID");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
  v14 = v17;
  if (v16)
  {
    v15 = -[VKLabelMarker businessID](v18, "businessID");
    goto LABEL_10;
  }
  objc_msgSend(v17, "deselectVenuePoiFeatureId");
LABEL_12:

  self->_isCluster = -[VKLabelMarker isCluster](v18, "isCluster");
  v7 = v18;
  if (((!v4 | v9) & 1) == 0)
  {
    -[MapSelectionManager _setNeedsUpdate](self, "_setNeedsUpdate");
    v7 = v18;
  }
LABEL_14:

}

- (void)setAnnotationView:(id)a3
{
  MKAnnotationView *v5;
  VKLabelMarker *labelMarker;
  void *v7;
  MKAnnotationView *v8;

  v5 = (MKAnnotationView *)a3;
  if (self->_annotationView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_annotationView, a3);
    labelMarker = self->_labelMarker;
    self->_labelMarker = 0;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    objc_msgSend(v7, "deselectVenuePoiFeatureId");

    -[MapSelectionManager _setNeedsUpdate](self, "_setNeedsUpdate");
    v5 = v8;
  }

}

- (CustomPOIAnnotation)customLabelMarker
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](self->_labelMarker, "featureAnnotation"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    v4 = v3;
  else
    v4 = 0;

  return (CustomPOIAnnotation *)v4;
}

- (BOOL)hasSelection
{
  return self->_annotationView || self->_labelMarker != 0;
}

- (void)clearSelection
{
  -[MapSelectionManager clearSelectionAnimated:](self, "clearSelectionAnimated:", 1);
}

- (void)clearSelectionAnimated:(BOOL)a3
{
  -[MapSelectionManager clearSelectionAnimated:updateIfNeeded:](self, "clearSelectionAnimated:updateIfNeeded:", a3, 1);
}

- (void)clearSelectionAnimated:(BOOL)a3 updateIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  void *v9;
  VKLabelMarker *labelMarker;
  _BOOL4 v11;
  void *v12;
  void *v13;
  VKLabelMarker *v14;
  void *v15;
  void *v16;
  MKAnnotationView *annotationView;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  int v22;
  MapSelectionManager *v23;

  v4 = a4;
  v5 = a3;
  v7 = sub_100B18694();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v22 = 134349056;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Clearing selection", (uint8_t *)&v22, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager customPOIsController](self, "customPOIsController"));
  objc_msgSend(v9, "clearInjectSearchResult");

  labelMarker = self->_labelMarker;
  v11 = labelMarker != 0;
  if (labelMarker)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    objc_msgSend(v12, "_deselectLabelMarkerAnimated:", v5);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    objc_msgSend(v13, "deselectVenuePoiFeatureId");

    v14 = self->_labelMarker;
    self->_labelMarker = 0;

  }
  if (self->_annotationView)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKAnnotationView annotation](self->_annotationView, "annotation"));
    objc_msgSend(v15, "deselectAnnotation:animated:", v16, v5);

    annotationView = self->_annotationView;
    self->_annotationView = 0;

    v11 = 1;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
  v19 = objc_msgSend(v18, "_hasSelectedTransitLines");

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    objc_msgSend(v20, "_deselectTransitLineMarker");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    objc_msgSend(v21, "_setApplicationState:", 0);

    v11 = 1;
  }
  -[MapSelectionManager deselectTrails](self, "deselectTrails");
  if (v11 && v4)
    -[MapSelectionManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)selectLabelMarker:(id)a3 animated:(BOOL)a4
{
  -[MapSelectionManager selectLabelMarker:animated:updateIfNeeded:](self, "selectLabelMarker:animated:updateIfNeeded:", a3, a4, 1);
}

- (void)selectLabelMarker:(id)a3 animated:(BOOL)a4 updateIfNeeded:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  VKLabelMarker *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  MapSelectionManager *v14;
  __int16 v15;
  VKLabelMarker *v16;

  v5 = a5;
  v6 = a4;
  v8 = (VKLabelMarker *)a3;
  v9 = sub_100B18694();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v13 = 134349314;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Selecting label marker: %@", (uint8_t *)&v13, 0x16u);
  }

  if (self->_labelMarker != v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](v8, "featureAnnotation"));
    if (v11)
    {

LABEL_7:
      -[MapSelectionManager setLabelMarker:updateIfNeeded:](self, "setLabelMarker:updateIfNeeded:", v8, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
      objc_msgSend(v12, "_selectLabelMarker:animated:", v8, v6);

      goto LABEL_8;
    }
    if ((-[VKLabelMarker isSelectable](v8, "isSelectable") & 1) != 0)
      goto LABEL_7;
  }
LABEL_8:

}

- (void)selectSearchResult:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MapSelectionManager *v12;
  __int16 v13;
  id v14;

  v4 = a4;
  v6 = a3;
  v7 = sub_100B18694();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Selecting search result: %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchPinsManagerForMapSelectionManager:", self));

  objc_msgSend(v10, "selectAndShowSearchResult:animated:", v6, v4);
}

- (void)selectTrailId:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  MapSelectionManager *v9;
  __int16 v10;
  unint64_t v11;

  v5 = sub_100B18694();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134349312;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Selecting trail ID: %llu", (uint8_t *)&v8, 0x16u);
  }

  -[MapSelectionManager setSelectedTrailId:](self, "setSelectedTrailId:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
  objc_msgSend(v7, "setSelectedTrailId:", a3);

}

- (void)selectTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  MapSelectionManager *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = sub_100B18694();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 134349826;
    v14 = self;
    v15 = 2048;
    v16 = a3;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Selecting trail with Id: %llu, name: %@, locale: %@", (uint8_t *)&v13, 0x2Au);
  }

  -[MapSelectionManager setSelectedTrailId:](self, "setSelectedTrailId:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
  objc_msgSend(v12, "setSelectedTrailWithId:name:locale:", a3, v8, v9);

}

- (void)deselectTrails
{
  unint64_t v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  MapSelectionManager *v8;
  __int16 v9;
  unint64_t v10;

  v3 = -[MapSelectionManager selectedTrailId](self, "selectedTrailId");
  v4 = sub_100B18694();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      v7 = 134349312;
      v8 = self;
      v9 = 2048;
      v10 = -[MapSelectionManager selectedTrailId](self, "selectedTrailId");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Deselecting trail with Id: %llu", (uint8_t *)&v7, 0x16u);
    }

    -[MapSelectionManager setSelectedTrailId:](self, "setSelectedTrailId:", 0);
    v5 = objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    -[NSObject deselectTrails](v5, "deselectTrails");
  }
  else if (v6)
  {
    v7 = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] No selected trails to deselect.", (uint8_t *)&v7, 0xCu);
  }

}

- (BOOL)isMapItemSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker identifier](self->_labelMarker, "identifier"));
    if (v6 && (objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker _maps_mapItem](self->_labelMarker, "_maps_mapItem"));
      v8 = objc_msgSend(v5, "isEqual:", v9);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)selectMapItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  PersonalizedMapItemKey *v9;
  void *v10;
  PersonalizedMapItemMUIDKey *v11;
  uint64_t v12;
  int v13;
  MapSelectionManager *v14;
  __int16 v15;
  id v16;

  v4 = a4;
  v6 = a3;
  v7 = sub_100B18694();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 134349314;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Selecting map item: %@", (uint8_t *)&v13, 0x16u);
  }

  v9 = -[PersonalizedMapItemKey initWithMapItem:]([PersonalizedMapItemKey alloc], "initWithMapItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
  if (objc_msgSend(v6, "_hasMUID") && objc_msgSend(v6, "_muid"))
  {
    v11 = -[PersonalizedMapItemMUIDKey initWithMUID:]([PersonalizedMapItemMUIDKey alloc], "initWithMUID:", objc_msgSend(v6, "_muid"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "setByAddingObject:", v11));

    v10 = (void *)v12;
  }
  -[MapSelectionManager selectLabelMarkerWithKeys:animated:completion:](self, "selectLabelMarkerWithKeys:animated:completion:", v10, v4, 0);

}

- (void)selectLabelMarkerWithKeys:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[MapSelectionManager _selectLabelMarkerWithKeys:camera:animated:restoreRegion:updateIfNeeded:completion:](self, "_selectLabelMarkerWithKeys:camera:animated:restoreRegion:updateIfNeeded:completion:", a3, 0, a4, 1, 1, a5);
}

- (void)selectLabelMarkerWithKeys:(id)a3 animated:(BOOL)a4 restoreRegion:(BOOL)a5 completion:(id)a6
{
  -[MapSelectionManager _selectLabelMarkerWithKeys:camera:animated:restoreRegion:updateIfNeeded:completion:](self, "_selectLabelMarkerWithKeys:camera:animated:restoreRegion:updateIfNeeded:completion:", a3, 0, a4, a5, 1, a6);
}

- (void)injectAndSelectSearchResult:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager customPOIsController](self, "customPOIsController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "injectSearchResultIfNeeded:", v4));

  -[MapSelectionManager _selectCustomPOIAnnotation:camera:restoreRegion:updateIfNeeded:completion:](self, "_selectCustomPOIAnnotation:camera:restoreRegion:updateIfNeeded:completion:", v6, 0, 1, 1, 0);
}

- (void)_selectLabelMarkerWithKeys:(id)a3 camera:(id)a4 animated:(BOOL)a5 restoreRegion:(BOOL)a6 updateIfNeeded:(BOOL)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  BOOL v24;
  uint8_t buf[4];
  MapSelectionManager *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = sub_100B18694();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349570;
    v26 = self;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Selecting label marker with keys: %@, camera: %@", buf, 0x20u);
  }

  if (v13 && objc_msgSend(v13, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager customPOIsController](self, "customPOIsController"));

    if (v18)
    {
      -[MapSelectionManager suspendUpdates](self, "suspendUpdates");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager customPOIsController](self, "customPOIsController"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100B190D0;
      v20[3] = &unk_1011E2DD0;
      v20[4] = self;
      v22 = v15;
      v21 = v14;
      v23 = a6;
      v24 = a7;
      objc_msgSend(v19, "customFeatureForKeys:completion:", v13, v20);

    }
  }
  else if (v15)
  {
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

- (void)_selectCustomPOIAnnotation:(id)a3 camera:(id)a4 restoreRegion:(BOOL)a5 updateIfNeeded:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void ***v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  MapCameraController *mapCameraController;
  void *v24;
  void **v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  MapSelectionManager *v30;
  id v31;
  BOOL v32;

  v9 = a5;
  v12 = a4;
  v13 = a7;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_labelMarkerForCustomFeatureAnnotation:", v14));

  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_100B19294;
  v28 = &unk_1011BE4E8;
  v17 = v16;
  v29 = v17;
  v30 = self;
  v32 = a6;
  v18 = v13;
  v31 = v18;
  v19 = objc_retainBlock(&v25);
  ((void (*)(void ***, uint64_t, uint64_t, uint64_t))v19[2])(v19, v20, v21, v22);
  if (v9)
  {
    if (v12)
    {
      -[MapCameraController restoreRegionForMapSelectionWithCamera:completion:](self->_mapCameraController, "restoreRegionForMapSelectionWithCamera:completion:", v12, 0, v25, v26, v27, v28, v29, v30);
    }
    else if (v17)
    {
      mapCameraController = self->_mapCameraController;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView", v25, v26, v27, v28, v29, v30));
      objc_msgSend(v24, "_edgeInsets");
      -[MapCameraController restoreRegionForMapSelectionForLabelMarker:edgeInsets:completion:](mapCameraController, "restoreRegionForMapSelectionForLabelMarker:edgeInsets:completion:", v17, 0);

    }
  }

}

- (id)selectionStateIncludingCamera:(BOOL)a3 includeNotCustomLabelMarkers:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  MapSelectionManagerState *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v5 = a3;
  v7 = objc_opt_new(MapSelectionManagerState);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_selectedLabelMarker"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedAnnotations"));
    -[MapSelectionManagerState setSelectedAnnotations:](v7, "setSelectedAnnotations:", v11);
LABEL_9:

    goto LABEL_10;
  }
  if (v4)
  {
    -[MapSelectionManagerState setLabelMarker:](v7, "setLabelMarker:", v9);
    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "featureAnnotation"));
  v10 = v12;
  if (v12 && objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keys"));
    -[MapSelectionManagerState setCustomPOIKeys:](v7, "setCustomPOIKeys:", v11);
    goto LABEL_9;
  }
LABEL_10:

  if (v5)
  {
LABEL_11:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "camera"));
    -[MapSelectionManagerState setCamera:](v7, "setCamera:", v14);

  }
LABEL_12:

  return v7;
}

- (void)restoreSelectionState:(id)a3 animated:(BOOL)a4
{
  -[MapSelectionManager restoreSelectionState:animated:restoreRegion:notifyDelegate:](self, "restoreSelectionState:animated:restoreRegion:notifyDelegate:", a3, a4, 1, 1);
}

- (void)restoreSelectionState:(id)a3 animated:(BOOL)a4 restoreRegion:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  MapSelectionManager *v30;
  __int16 v31;
  id v32;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = sub_100B18694();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v29 = 134349314;
    v30 = self;
    v31 = 2112;
    v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Restoring selection state: %@", (uint8_t *)&v29, 0x16u);
  }

  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "camera"));
    v14 = v13;
    if (v13 && ((objc_msgSend(v13, "centerCoordinate"), v16 < -180.0) || v16 > 180.0 || v15 < -90.0 || v15 > 90.0))
    {

      v14 = 0;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customPOIKeys"));

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customPOIKeys"));
        -[MapSelectionManager _selectLabelMarkerWithKeys:camera:animated:restoreRegion:updateIfNeeded:completion:](self, "_selectLabelMarkerWithKeys:camera:animated:restoreRegion:updateIfNeeded:completion:", v18, v14, v8, v7, v6, 0);

      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedAnnotations"));
        v20 = objc_msgSend(v19, "count");

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedAnnotations"));
          objc_msgSend(v21, "setSelectedAnnotations:", v22);

          if (v14 && v7)
            -[MapCameraController restoreRegionForMapSelectionWithCamera:completion:](self->_mapCameraController, "restoreRegionForMapSelectionWithCamera:completion:", v14, 0);
        }
        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "labelMarker"));

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "labelMarker"));
            v25 = objc_msgSend(v24, "isCluster");

            if (v25)
            {
              -[MapSelectionManager clearSelectionAnimated:updateIfNeeded:](self, "clearSelectionAnimated:updateIfNeeded:", 0, v6);
            }
            else
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "labelMarker"));
              -[MapSelectionManager selectLabelMarker:animated:updateIfNeeded:](self, "selectLabelMarker:animated:updateIfNeeded:", v28, v8, v6);

            }
          }
          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "searchPinsManagerForMapSelectionManager:", self));

            objc_msgSend(v27, "clearLinkedPlacesAndPolygon");
          }
        }
      }
    }

  }
}

- (BOOL)mapShouldSelectLabelMarker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  int v17;
  MapSelectionManager *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  __CFString *v22;

  v4 = a3;
  if (objc_msgSend(v4, "isRouteAnnotation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_selectableRouteAnnotations"));
    if (!objc_msgSend(v5, "count"))
    {

LABEL_10:
      v7 = sub_100B18694();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v17 = 134349056;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Suppressing label marker selection (no selectable route annotations or empty cluster)", (uint8_t *)&v17, 0xCu);
      }
      LOBYTE(v9) = 0;
      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isCluster") & 1) != 0)
    {
      v6 = objc_msgSend(v4, "clusterFeatureCount");

      if (!v6)
        goto LABEL_10;
    }
    else
    {

    }
  }
  else if ((objc_msgSend(v4, "isCluster") & 1) != 0 && !objc_msgSend(v4, "clusterFeatureCount"))
  {
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "mapSelectionManager:shouldSelectVKLabelMarker:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
    v9 = objc_msgSend(v12, "mapSelectionManager:shouldSelectVKLabelMarker:", self, v4);

  }
  else
  {
    v9 = 1;
  }
  v13 = sub_100B18694();
  v8 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v14 = CFSTR("NO");
    if (v9)
      v14 = CFSTR("YES");
    v15 = v14;
    v17 = 134349570;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Should select label marker %@: %@", (uint8_t *)&v17, 0x20u);

  }
LABEL_21:

  return v9;
}

- (void)mapDidSelectLabelMarker:(id)a3
{
  VKLabelMarker *v5;
  id v6;
  NSObject *v7;
  VKLabelMarker *labelMarker;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  MapSelectionManager *v15;
  __int16 v16;
  VKLabelMarker *v17;

  v5 = (VKLabelMarker *)a3;
  v6 = sub_100B18694();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v15 = self;
    v16 = 2112;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Map did select label marker: %@", buf, 0x16u);
  }

  labelMarker = self->_labelMarker;
  if (labelMarker && labelMarker != v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](labelMarker, "featureAnnotation"));
    if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchResult"));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchPinsManagerForMapSelectionManager:", self));

        objc_msgSend(v12, "mapSelectionManagerDidDeselectSearchResult:", v10);
      }

    }
  }
  if (!self->_ignoreSelectionChanges)
  {
    if (!self->_mapSelectionChangePending)
    {
      self->_mapSelectionChangePending = 1;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100B19A9C;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    objc_storeStrong((id *)&self->_pendingSelectedLabelMarker, a3);
    -[MapSelectionManager _performAnalyticsForTappingOnLabelMarker:](self, "_performAnalyticsForTappingOnLabelMarker:", v5);
  }

}

- (BOOL)mapShouldSelectAnnotationView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  int v14;
  MapSelectionManager *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  __CFString *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "mapSelectionManager:shouldSelectAnnotationView:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "mapSelectionManager:shouldSelectAnnotationView:", self, v4);

  }
  else
  {
    v8 = 1;
  }
  v9 = sub_100B18694();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("NO");
    if (v8)
      v11 = CFSTR("YES");
    v12 = v11;
    v14 = 134349570;
    v15 = self;
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Should select annotationView %@: %@", (uint8_t *)&v14, 0x20u);

  }
  return v8;
}

- (void)mapDidSelectAnnotationView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _BOOL8 ignoreSelectionChanges;
  void *v11;
  void *v12;
  int v13;
  MapSelectionManager *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = v4;
  if (!self->_ignoreSelectionChanges)
  {
    if (v4 && !-[MapSelectionManager mapShouldSelectAnnotationView:](self, "mapShouldSelectAnnotationView:", v4))
    {
      v8 = sub_100B18694();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 134349314;
        v14 = self;
        v15 = 2112;
        v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Will reverse annotation view selection: %@", (uint8_t *)&v13, 0x16u);
      }

      ignoreSelectionChanges = self->_ignoreSelectionChanges;
      -[MapSelectionManager setIgnoreSelectionChanges:](self, "setIgnoreSelectionChanges:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotation"));
      objc_msgSend(v11, "deselectAnnotation:animated:", v12, 0);

      -[MapSelectionManager setIgnoreSelectionChanges:](self, "setIgnoreSelectionChanges:", ignoreSelectionChanges);
    }
    else
    {
      v6 = sub_100B18694();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v13 = 134349314;
        v14 = self;
        v15 = 2112;
        v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Map did select annotation view: %@", (uint8_t *)&v13, 0x16u);
      }

      -[MapSelectionManager setAnnotationView:](self, "setAnnotationView:", v5);
      -[MapSelectionManager _performAnalyticsForTappingOnAnnotationView:](self, "_performAnalyticsForTappingOnAnnotationView:", v5);
    }
  }

}

- (void)_performAnalyticsForTappingOnLabelMarker:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B19E24;
    v6[3] = &unk_1011AC8B0;
    v6[4] = self;
    v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  }
}

- (void)_performAnalyticsForTappingOnAnnotationView:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B1A008;
    v6[3] = &unk_1011AC8B0;
    v6[4] = self;
    v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  }
}

- (void)_applyMapSelectionDidChange
{
  VKLabelMarker *pendingSelectedLabelMarker;
  VKLabelMarker *v4;

  self->_mapSelectionChangePending = 0;
  pendingSelectedLabelMarker = self->_pendingSelectedLabelMarker;
  self->_pendingSelectedLabelMarker = 0;
  v4 = pendingSelectedLabelMarker;

  -[MapSelectionManager setLabelMarker:](self, "setLabelMarker:", v4);
}

- (void)_handleMapPinch:(id)a3
{
  -[MapSelectionManager _handleMapZoomingGesture:](self, "_handleMapZoomingGesture:", a3);
}

- (void)_handleMapZoomingGesture:(id)a3
{
  id v4;
  VKLabelMarker *labelMarker;
  void *v6;
  float v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  float v19;
  double v20;
  id WeakRetained;
  void *v22;

  v4 = a3;
  labelMarker = self->_labelMarker;
  if (labelMarker)
  {
    v22 = v4;
    if (!-[VKLabelMarker isCluster](labelMarker, "isCluster"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](self->_labelMarker, "featureAnnotation"));
      v11 = v10;
      if (v10 && objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
      {
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager mapView](self, "mapView"));
        v14 = objc_msgSend(v13, "_displayedSearchResultsType");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "styleAttributes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "styleAttributes"));
        v17 = objc_msgSend(v16, "isLabelPOI");

        if (v17 && v14 == (id)2)
        {
          if (objc_msgSend(v22, "state") == (id)1)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
            objc_msgSend(v18, "floatForKey:", CFSTR("__personalizedMapsZoomAmountToClearClusterSelection"));
            self->_clusterDeselectZoomThreshold = v19;

          }
          if (objc_msgSend(v22, "state") == (id)2)
          {
            objc_msgSend(v22, "scale");
            if (v20 == 0.0)
              v20 = 1.0;
            if (v20 < 1.0)
              v20 = 1.0 / v20;
            if (v20 > 1.29999995)
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->_customPOIsController);
              objc_msgSend(WeakRetained, "clearSearchResultStyle");

            }
          }
        }

      }
      goto LABEL_27;
    }
    if (objc_msgSend(v22, "state") == (id)1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v6, "floatForKey:", CFSTR("__personalizedMapsZoomAmountToClearClusterSelection"));
      self->_clusterDeselectZoomThreshold = v7;

    }
    v8 = objc_msgSend(v22, "state");
    v4 = v22;
    if (v8 == (id)2)
    {
      objc_msgSend(v22, "scale");
      v4 = v22;
      if (v9 == 0.0)
        v9 = 1.0;
      if (v9 < 1.0)
        v9 = 1.0 / v9;
      if (v9 > self->_clusterDeselectZoomThreshold)
      {
        -[MapSelectionManager clearSelection](self, "clearSelection");
LABEL_27:
        v4 = v22;
      }
    }
  }

}

- (void)_clearClusterSelectionOnGesture:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (self->_labelMarker)
  {
    if (self->_isCluster)
    {
      v6 = v4;
      v5 = objc_msgSend(v4, "state") == (id)3;
      v4 = v6;
      if (v5)
      {
        -[MapSelectionManager clearSelection](self, "clearSelection");
        v4 = v6;
      }
    }
  }

}

- (void)_handleSelectingTapGesture:(id)a3
{
  self->_selectionFromTap = 1;
}

- (void)suspendUpdates
{
  int *p_updateCount;
  unsigned int v4;

  dispatch_group_enter((dispatch_group_t)self->_updateGroup);
  p_updateCount = &self->_updateCount;
  do
    v4 = __ldxr((unsigned int *)p_updateCount);
  while (__stxr(v4 + 1, (unsigned int *)p_updateCount));
}

- (void)resumeUpdates
{
  int *p_updateCount;
  unsigned int v4;

  dispatch_group_leave((dispatch_group_t)self->_updateGroup);
  p_updateCount = &self->_updateCount;
  do
    v4 = __ldxr((unsigned int *)p_updateCount);
  while (__stxr(v4 - 1, (unsigned int *)p_updateCount));
}

- (int)currentUITargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "currentUITargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentUITargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapSelectionManager delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "currentMapViewTargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentMapViewTargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (MapSelectionManagerDelegate)delegate
{
  return (MapSelectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MapCameraController)mapCameraController
{
  return self->_mapCameraController;
}

- (CustomPOIsController)customPOIsController
{
  return (CustomPOIsController *)objc_loadWeakRetained((id *)&self->_customPOIsController);
}

- (void)setCustomPOIsController:(id)a3
{
  objc_storeWeak((id *)&self->_customPOIsController, a3);
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (MKAnnotationView)annotationView
{
  return self->_annotationView;
}

- (BOOL)ignoreSelectionChanges
{
  return self->_ignoreSelectionChanges;
}

- (void)setIgnoreSelectionChanges:(BOOL)a3
{
  self->_ignoreSelectionChanges = a3;
}

- (unint64_t)selectedTrailId
{
  return self->_selectedTrailId;
}

- (void)setSelectedTrailId:(unint64_t)a3
{
  self->_selectedTrailId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationView, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
  objc_destroyWeak((id *)&self->_customPOIsController);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateGroup, 0);
  objc_storeStrong((id *)&self->_pendingSelectedLabelMarker, 0);
}

@end
