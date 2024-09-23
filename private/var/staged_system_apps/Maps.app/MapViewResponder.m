@implementation MapViewResponder

- (MapViewResponder)initWithMapView:(id)a3
{
  id v4;
  MapViewResponder *v5;
  MapViewResponder *v6;
  void *v7;
  MapViewResponder *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapViewResponder;
  v5 = -[MapViewResponder init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mapView, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_nonselectingTapGestureRecognizer"));
    objc_msgSend(v7, "addTarget:action:", v6, "_nonselectingTapGestureRecognizerAction:");

    v8 = v6;
  }

  return v6;
}

- (MapViewResponder)init
{
  id v3;
  MapViewResponder *v4;

  v3 = objc_alloc_init((Class)MKMapView);
  v4 = -[MapViewResponder initWithMapView:](self, "initWithMapView:", v3);

  return v4;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_nonselectingTapGestureRecognizer"));
  objc_msgSend(v4, "removeTarget:action:", self, 0);

  v5.receiver = self;
  v5.super_class = (Class)MapViewResponder;
  -[MapViewResponder dealloc](&v5, "dealloc");
}

- (void)_nonselectingTapGestureRecognizerAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[MapViewResponder target](self, "target"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewResponder mapView](self, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewResponder mapView](self, "mapView"));
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v11, "didTapMapView:atPoint:", v5, v8, v10);
}

- (MapViewResponderHandling)target
{
  return (MapViewResponderHandling *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_target);
}

@end
