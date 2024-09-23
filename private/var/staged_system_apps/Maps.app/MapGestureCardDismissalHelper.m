@implementation MapGestureCardDismissalHelper

- (MapGestureCardDismissalHelper)initWithMapView:(id)a3
{
  id v5;
  MapGestureCardDismissalHelper *v6;
  MapGestureCardDismissalHelper *v7;
  uint64_t v8;
  NSMutableDictionary *insidenessByGesture;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MapGestureCardDismissalHelper *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MapGestureCardDismissalHelper;
  v6 = -[MapGestureCardDismissalHelper init](&v18, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapView, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    insidenessByGesture = v7->_insidenessByGesture;
    v7->_insidenessByGesture = (NSMutableDictionary *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _panningGestureRecognizer](v7->_mapView, "_panningGestureRecognizer"));
    objc_msgSend(v10, "addTarget:action:", v7, "handleMapViewContinuousGesture:");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _pinchGestureRecognizer](v7->_mapView, "_pinchGestureRecognizer"));
    objc_msgSend(v11, "addTarget:action:", v7, "handleMapViewContinuousGesture:");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _oneHandedZoomGestureRecognizer](v7->_mapView, "_oneHandedZoomGestureRecognizer"));
    objc_msgSend(v12, "addTarget:action:", v7, "handleMapViewContinuousGesture:");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _rotationGestureRecognizer](v7->_mapView, "_rotationGestureRecognizer"));
    objc_msgSend(v13, "addTarget:action:", v7, "handleMapViewContinuousGesture:");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _doubleTapGestureRecognizer](v7->_mapView, "_doubleTapGestureRecognizer"));
    objc_msgSend(v14, "addTarget:action:", v7, "handleMapViewDiscreteGesture:");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _twoFingerTapGestureRecognizer](v7->_mapView, "_twoFingerTapGestureRecognizer"));
    objc_msgSend(v15, "addTarget:action:", v7, "handleMapViewDiscreteGesture:");

    v16 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _panningGestureRecognizer](self->_mapView, "_panningGestureRecognizer"));
  objc_msgSend(v3, "removeTarget:action:", self, "handleMapViewContinuousGesture:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _pinchGestureRecognizer](self->_mapView, "_pinchGestureRecognizer"));
  objc_msgSend(v4, "removeTarget:action:", self, "handleMapViewContinuousGesture:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _oneHandedZoomGestureRecognizer](self->_mapView, "_oneHandedZoomGestureRecognizer"));
  objc_msgSend(v5, "removeTarget:action:", self, "handleMapViewContinuousGesture:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _rotationGestureRecognizer](self->_mapView, "_rotationGestureRecognizer"));
  objc_msgSend(v6, "removeTarget:action:", self, "handleMapViewContinuousGesture:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _doubleTapGestureRecognizer](self->_mapView, "_doubleTapGestureRecognizer"));
  objc_msgSend(v7, "removeTarget:action:", self, "handleMapViewDiscreteGesture:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _twoFingerTapGestureRecognizer](self->_mapView, "_twoFingerTapGestureRecognizer"));
  objc_msgSend(v8, "removeTarget:action:", self, "handleMapViewDiscreteGesture:");

  v9.receiver = self;
  v9.super_class = (Class)MapGestureCardDismissalHelper;
  -[MapGestureCardDismissalHelper dealloc](&v9, "dealloc");
}

- (void)continuousGestureDidBegin:(id)a3
{
  id v4;
  unint64_t activeGestureCount;
  void *v6;
  double v7;
  void *v8;
  NSMutableDictionary *insidenessByGesture;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  activeGestureCount = self->_activeGestureCount;
  self->_activeGestureCount = activeGestureCount + 1;
  if (!activeGestureCount)
  {
    v11 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapGestureCardDismissalHelper delegate](self, "delegate"));
    self->_shouldIgnoreGestures = objc_msgSend(v6, "cardDismissalHelperShouldObserveGestures:", self) ^ 1;
    objc_msgSend(v6, "dismissalRectTopEdgeForCardDismissalHelper:coordinateSpace:", self, self->_mapView);
    self->_dismissalRectTopEdge = v7 + -80.0;

    v4 = v11;
  }
  if (!self->_shouldIgnoreGestures)
  {
    v12 = v4;
    -[MapGestureCardDismissalHelper insidenessForGesture:](self, "insidenessForGesture:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    insidenessByGesture = self->_insidenessByGesture;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v12));
    -[NSMutableDictionary setObject:forKeyedSubscript:](insidenessByGesture, "setObject:forKeyedSubscript:", v8, v10);

    v4 = v12;
  }

}

- (void)continuousGestureDidEnd:(id)a3
{
  id v4;
  NSMutableDictionary *insidenessByGesture;
  void *v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  if (!self->_shouldIgnoreGestures)
  {
    insidenessByGesture = self->_insidenessByGesture;
    v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v4));
    -[NSMutableDictionary removeObjectForKey:](insidenessByGesture, "removeObjectForKey:", v6);

    v4 = v8;
  }
  v7 = self->_activeGestureCount - 1;
  self->_activeGestureCount = v7;
  if (!v7)
  {
    *(_WORD *)&self->_shouldIgnoreGestures = 0;
    self->_dismissalRectTopEdge = 1.79769313e308;
  }

}

- (void)continuousGestureDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v4 = a3;
  if (self->_shouldIgnoreGestures)
    goto LABEL_13;
  v17 = v4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _rotationGestureRecognizer](self->_mapView, "_rotationGestureRecognizer"));

  if (v5 == v17)
  {
LABEL_9:
    -[MapGestureCardDismissalHelper dismissCard](self, "dismissCard");
    v8 = v17;
    goto LABEL_10;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _oneHandedZoomGestureRecognizer](self->_mapView, "_oneHandedZoomGestureRecognizer"));
  if (v6 == v17)
  {

    v8 = v17;
LABEL_7:
    objc_msgSend(v8, "scale");
    v8 = v17;
    if (v9 >= 0.910000026 && v9 <= 1.86000001)
      goto LABEL_10;
    goto LABEL_9;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _pinchGestureRecognizer](self->_mapView, "_pinchGestureRecognizer"));

  v8 = v17;
  if (v7 == v17)
    goto LABEL_7;
LABEL_10:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_insidenessByGesture, "objectForKeyedSubscript:", v10));
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  -[MapGestureCardDismissalHelper insidenessForGesture:](self, "insidenessForGesture:", v17);
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_insidenessByGesture, "setObject:forKeyedSubscript:", v16, v10);

  if (v15 > v13)
    -[MapGestureCardDismissalHelper dismissCard](self, "dismissCard");

  v4 = v17;
LABEL_13:

}

- (BOOL)hasContinuousGestureInProgress
{
  return self->_activeGestureCount != 0;
}

- (void)dismissCard
{
  id v3;

  if (-[MapGestureCardDismissalHelper hasContinuousGestureInProgress](self, "hasContinuousGestureInProgress"))
  {
    if (self->_didDismiss)
      return;
    self->_didDismiss = 1;
  }
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MapGestureCardDismissalHelper delegate](self, "delegate"));
  objc_msgSend(v3, "requestDismissalWithCardDismissalHelper:", self);

}

- (double)insidenessForGesture:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  char *v7;
  double v8;
  double dismissalRectTopEdge;
  double v10;
  double v11;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "numberOfTouches");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0.0;
    do
    {
      objc_msgSend(v4, "locationOfTouch:inView:", v7, self->_mapView);
      dismissalRectTopEdge = self->_dismissalRectTopEdge;
      v11 = fmax(v8, v10 - dismissalRectTopEdge);
      if (v10 > dismissalRectTopEdge)
        v8 = v11;
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (void)handleMapViewContinuousGesture:(id)a3
{
  char *v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (char *)objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    -[MapGestureCardDismissalHelper continuousGestureDidEnd:](self, "continuousGestureDidEnd:", v7);
  }
  else if (v4 == (char *)2)
  {
    -[MapGestureCardDismissalHelper continuousGestureDidChange:](self, "continuousGestureDidChange:", v7);
  }
  else
  {
    v5 = v4 == (char *)1;
    v6 = v7;
    if (!v5)
      goto LABEL_9;
    -[MapGestureCardDismissalHelper continuousGestureDidBegin:](self, "continuousGestureDidBegin:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)handleMapViewDiscreteGesture:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapGestureCardDismissalHelper delegate](self, "delegate", a3));
  v5 = objc_msgSend(v4, "cardDismissalHelperShouldObserveGestures:", self);

  if (v5)
    -[MapGestureCardDismissalHelper dismissCard](self, "dismissCard");
}

- (MapGestureCardDismissalHelperDelegate)delegate
{
  return (MapGestureCardDismissalHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_insidenessByGesture, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
