@implementation MapQuickActionMenuPresenter

- (MapQuickActionMenuPresenter)initWithView:(id)a3
{
  return -[MapQuickActionMenuPresenter initWithMapView:](self, "initWithMapView:", 0);
}

- (MapQuickActionMenuPresenter)initWithMapView:(id)a3
{
  id v5;
  MapQuickActionMenuPresenter *v6;
  MapQuickActionMenuPresenter *v7;
  uint64_t v8;
  uint64_t v9;
  OS_dispatch_queue *iconFetchingQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapQuickActionMenuPresenter;
  v6 = -[QuickActionMenuPresenter initWithView:](&v12, "initWithView:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapView, a3);
    v8 = geo_dispatch_queue_create_with_qos("com.apple.Maps.MapQuickActionMenuPresenter.iconFetchingQueue", 25);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    iconFetchingQueue = v7->_iconFetchingQueue;
    v7->_iconFetchingQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)invalidateIfNeeded
{
  UIView **p_containerView;
  id WeakRetained;
  id v5;

  p_containerView = &self->_containerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_containerView);
    objc_msgSend(v5, "removeFromSuperview");

    objc_storeWeak((id *)p_containerView, 0);
  }
  -[MapQuickActionMenuPresenter reset](self, "reset");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MapQuickActionMenuPresenter;
  -[MapQuickActionMenuPresenter dealloc](&v4, "dealloc");
}

- (void)reset
{
  VKLabelMarker *labelMarker;
  SearchResult *searchResult;
  MKMapItem *resolvedMapItem;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapQuickActionMenuPresenter;
  -[QuickActionMenuPresenter reset](&v6, "reset");
  labelMarker = self->super._labelMarker;
  self->super._labelMarker = 0;

  searchResult = self->super._searchResult;
  self->super._searchResult = 0;

  resolvedMapItem = self->super._resolvedMapItem;
  self->super._resolvedMapItem = 0;

}

- (id)previewViewController
{
  PreviewViewController *v3;

  v3 = -[PreviewViewController initWithNibName:bundle:]([PreviewViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[PreviewViewController setLabelMarker:searchresult:mapView:](v3, "setLabelMarker:searchresult:mapView:", self->super._labelMarker, self->super._searchResult, self->_mapView);
  return v3;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  void *v6;
  uint64_t v7;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  UIPreviewParameters *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter containerViewController](self, "containerViewController", a3, a4, a5));
  v7 = sub_1002A8AA0(v6);

  if (v7 == 5)
    return 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10099D398;
  v21[3] = &unk_1011BAA70;
  v22 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
  v9 = v22;
  -[MapQuickActionMenuPresenter _fetchImageForLabelMarkerWithCompletion:](self, "_fetchImageForLabelMarkerWithCompletion:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "setCornerRadius:", 25.0);

  objc_msgSend(v9, "setClipsToBounds:", 1);
  v11 = objc_alloc((Class)UIView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter containerViewController](self, "containerViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v13, "bounds");
  v14 = objc_msgSend(v11, "initWithFrame:");

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter containerViewController](self, "containerViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  objc_msgSend(v16, "addSubview:", v14);

  objc_storeWeak((id *)&self->_containerView, v14);
  v17 = objc_alloc((Class)UIPreviewTarget);
  -[QuickActionMenuPresenter location](self, "location");
  v18 = objc_msgSend(v17, "initWithContainer:center:", v14);
  v19 = objc_opt_new(UIPreviewParameters);
  v20 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:parameters:target:", v9, v19, v18);

  return v20;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  if (a5)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10099D43C;
    v5[3] = &unk_1011AC860;
    v5[4] = self;
    objc_msgSend(a5, "addCompletion:", v5, a4);
  }
  else
  {
    -[MapQuickActionMenuPresenter invalidateIfNeeded](self, "invalidateIfNeeded", a3, a4);
  }
}

- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  MapQuickActionMenuPresenter *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  BOOL v38;
  void *v39;
  void *v40;
  CGPoint v42;
  CGRect v43;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hitTest:withEvent:", 0, x, y));
  -[MKMapView convertPoint:fromView:](self->_mapView, "convertPoint:fromView:", v7, x, y);
  v10 = v9;
  v12 = v11;
  if (-[MKMapView calloutViewContainsPoint:](self->_mapView, "calloutViewContainsPoint:"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView selectedAnnotations](self->_mapView, "selectedAnnotations"));
    v14 = objc_msgSend(v13, "count");

    if (v14 == (id)1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView selectedAnnotations](self->_mapView, "selectedAnnotations"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

      -[MapQuickActionMenuPresenter setAnnotation:](self, "setAnnotation:", v16);
      v17 = objc_opt_class(MKUserLocation);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "annotation"));

        v16 = (void *)v18;
      }
      v19 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
      {
        -[QuickActionMenuPresenter setSearchResult:](self, "setSearchResult:", v16);
        v20 = self;
        v21 = 4;
        goto LABEL_20;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _selectedLabelMarker](self->_mapView, "_selectedLabelMarker"));
    if (!-[MapQuickActionMenuPresenter _isValidLabelMarkerForInitiatingOrbGesture:](self, "_isValidLabelMarkerForInitiatingOrbGesture:", v16))
    {
      v38 = 0;
      goto LABEL_34;
    }
    -[QuickActionMenuPresenter setLabelMarker:](self, "setLabelMarker:", v16);
    -[QuickActionMenuPresenter setUiTarget:](self, "setUiTarget:", 4);
    if (!objc_msgSend(v16, "isTransitLine"))
    {
LABEL_21:
      v38 = 1;
LABEL_34:

      goto LABEL_35;
    }
    v20 = self;
    v21 = 7;
LABEL_20:
    -[QuickActionMenuPresenter setUiTarget:](v20, "setUiTarget:", v21);
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isDescendantOfView:", self->_mapView))
  {
    -[MKMapView _edgeInsets](self->_mapView, "_edgeInsets");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    -[MKMapView bounds](self->_mapView, "bounds");
    v43.origin.x = v25 + v30;
    v43.origin.y = v23 + v31;
    v43.size.width = v32 - (v25 + v29);
    v43.size.height = v33 - (v23 + v27);
    v42.x = v10;
    v42.y = v12;
    if (CGRectContainsPoint(v43, v42))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _annotationAtPoint:avoidCurrent:](self->_mapView, "_annotationAtPoint:avoidCurrent:", 0, v10, v12));
      -[MapQuickActionMenuPresenter setAnnotation:](self, "setAnnotation:", v16);
      v34 = objc_opt_class(MKUserLocation);
      if ((objc_opt_isKindOfClass(v16, v34) & 1) != 0)
      {
        v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "annotation"));

        v16 = (void *)v35;
      }
      v36 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v16, v36) & 1) != 0)
      {
        -[QuickActionMenuPresenter setSearchResult:](self, "setSearchResult:", v16);
        v37 = -[SearchResult appearance](self->super._searchResult, "appearance");
        if (v37 == 1)
        {
          v20 = self;
          v21 = 5;
        }
        else if (v37 == 3)
        {
          v20 = self;
          v21 = 6;
        }
        else
        {
          v20 = self;
          v21 = 0;
        }
        goto LABEL_20;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _labelMarkerAtPoint:](self->_mapView, "_labelMarkerAtPoint:", v10, v12));
      if (-[MapQuickActionMenuPresenter _isValidLabelMarkerForInitiatingOrbGesture:](self, "_isValidLabelMarkerForInitiatingOrbGesture:", v39))
      {
        -[QuickActionMenuPresenter setLabelMarker:](self, "setLabelMarker:", v39);
        if (!objc_msgSend(v39, "isTransitLine"))
        {
          v38 = 1;
          -[QuickActionMenuPresenter setUiTarget:](self, "setUiTarget:", 1);
          goto LABEL_33;
        }
        -[QuickActionMenuPresenter setUiTarget:](self, "setUiTarget:", 7);
      }
      else
      {
        if (sub_1002A8AA0(self->_mapView) != 5)
        {
          v38 = 0;
          goto LABEL_33;
        }
        -[MKMapView convertPoint:toCoordinateFromView:](self->_mapView, "convertPoint:toCoordinateFromView:", v7, x, y);
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult customSearchResultWithCoordinate:](SearchResult, "customSearchResultWithCoordinate:"));
        -[QuickActionMenuPresenter setSearchResult:](self, "setSearchResult:", v40);

      }
      v38 = 1;
LABEL_33:

      goto LABEL_34;
    }
  }
  v38 = 0;
LABEL_35:

  return v38;
}

- (BOOL)_isValidLabelMarkerForInitiatingOrbGesture:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter delegate](self, "delegate"));
  LOBYTE(self) = objc_msgSend(v5, "mapQuickActionMenuPresenter:shouldBeginOrbGestureForLabelMarkerOnMap:", self, v4);

  return (char)self;
}

- (void)_fetchImageForLabelMarkerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  BOOL v17;
  void *v18;
  NSObject *iconFetchingQueue;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  MapQuickActionMenuPresenter *v24;
  id v25;
  id v26;
  uint64_t v27;
  unsigned int v28;
  BOOL v29;

  v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter presentingViewController](self, "presentingViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "scale");
      v11 = v10;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v12, "scale");
      v11 = v13;

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker iconImageKeys](self->super._labelMarker, "iconImageKeys"));
    v15 = -[VKLabelMarker featureType](self->super._labelMarker, "featureType");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView traitCollection](self->_mapView, "traitCollection"));
    v17 = objc_msgSend(v16, "userInterfaceStyle") == (id)2;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker styleAttributes](self->super._labelMarker, "styleAttributes"));
    iconFetchingQueue = self->_iconFetchingQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10099DA08;
    v22[3] = &unk_1011DD828;
    v23 = v14;
    v27 = v11;
    v28 = v15;
    v25 = v18;
    v26 = v4;
    v24 = self;
    v29 = v17;
    v20 = v18;
    v21 = v14;
    dispatch_async(iconFetchingQueue, v22);

  }
}

- (id)_imageForStyleAttributes:(id)a3 screenScale:(double)a4 isNightMode:(BOOL)a5
{
  NSObject *iconFetchingQueue;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;

  iconFetchingQueue = self->_iconFetchingQueue;
  v8 = a3;
  dispatch_assert_queue_V2(iconFetchingQueue);
  LOBYTE(v12) = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:interactive:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:interactive:nightMode:", v8, 4, 1, 0, 0, 1, a4, v12));

  if (!v9)
  {
    v10 = objc_msgSend(objc_alloc((Class)GEOFeatureStyleAttributes), "initWithAttributes:", 5, 3, 6, 223, 0);
    LOBYTE(v13) = a5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:interactive:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:interactive:nightMode:", v10, 4, 1, 0, 0, 1, a4, v13));

  }
  return v9;
}

- (MKAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_iconFetchingQueue, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
