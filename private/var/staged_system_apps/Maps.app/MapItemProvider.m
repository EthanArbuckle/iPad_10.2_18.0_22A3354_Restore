@implementation MapItemProvider

+ (id)mapItemSourceWithMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  CLLocationCoordinate2D v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placemark")),
        objc_msgSend(v6, "coordinate"),
        v7 = CLLocationCoordinate2DIsValid(v10),
        v6,
        v7))
  {
    v8 = objc_msgSend(objc_alloc((Class)a1), "initWithMapItem:precedence:", v5, 1);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)mapItemSourceWithResolvedWaypoint:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  CLLocationCoordinate2D v12;

  v4 = a3;
  v5 = objc_alloc((Class)MKMapItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));

  v7 = objc_msgSend(v5, "initWithGeoMapItem:isPlaceHolderPlace:", v6, 0);
  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placemark")),
        objc_msgSend(v8, "coordinate"),
        v9 = CLLocationCoordinate2DIsValid(v12),
        v8,
        v9))
  {
    v10 = objc_msgSend(objc_alloc((Class)a1), "initWithMapItem:precedence:", v7, 3);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)mapItemSourceWithPersonalizedItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  v7 = objc_msgSend(v5, "initWithMapItem:precedence:", v6, 2);
  return v7;
}

- (MapItemProvider)initWithMapItem:(id)a3 precedence:(unint64_t)a4
{
  id v7;
  MapItemProvider *v8;
  MapItemProvider *v9;
  MapItemProvider *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapItemProvider;
  v8 = -[MapItemProvider init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_precedence = a4;
    v10 = v9;
  }

  return v9;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)precedence
{
  return self->_precedence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
