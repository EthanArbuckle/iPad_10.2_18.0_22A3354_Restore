@implementation MapDataSubscriptionMapContentConfiguration

- (MapDataSubscriptionMapContentConfiguration)initWithSubscriptions:(id)a3
{
  id v4;
  MapDataSubscriptionMapContentConfiguration *v5;
  NSArray *v6;
  NSArray *subscriptions;
  MapDataSubscriptionMapContentConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapDataSubscriptionMapContentConfiguration;
  v5 = -[MapDataSubscriptionMapContentConfiguration init](&v10, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    subscriptions = v5->_subscriptions;
    v5->_subscriptions = v6;

    v8 = v5;
  }

  return v5;
}

- (id)makeContentView
{
  MapDataSubscriptionMapView *v3;
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double y;
  double width;
  double height;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  double v35;
  double x;
  void *j;
  void *v38;
  double v40;
  double v41;
  double v42;
  double v43;
  MapDataSubscriptionMapView *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[8];
  _BYTE v57[128];
  MKMapRect v58;
  MKMapRect v59;
  MKMapRect v60;

  v3 = objc_alloc_init(MapDataSubscriptionMapView);
  -[MapDataSubscriptionMapView setDelegate:](v3, "setDelegate:", self);
  -[MapDataSubscriptionMapView setScrollEnabled:](v3, "setScrollEnabled:", 0);
  -[MapDataSubscriptionMapView setZoomEnabled:](v3, "setZoomEnabled:", 0);
  -[MapDataSubscriptionMapView setRotateEnabled:](v3, "setRotateEnabled:", 0);
  v45 = v3;
  -[MapDataSubscriptionMapView setPitchEnabled:](v3, "setPitchEnabled:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v5 = self->_subscriptions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "subscription"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "region"));

        if (objc_msgSend(v11, "vertexsCount"))
        {
          v12 = malloc_type_calloc((size_t)objc_msgSend(v11, "vertexsCount"), 0x10uLL, 0x1000040451B5BE8uLL);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vertexs"));
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1005C6E6C;
          v50[3] = &unk_1011BCBD8;
          v50[4] = v12;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v50);

          v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKPolygon polygonWithCoordinates:count:](MKPolygon, "polygonWithCoordinates:count:", v12, objc_msgSend(v11, "vertexsCount")));
          free(v12);
          objc_msgSend(v4, "addObject:", v14);

        }
        else
        {
          objc_msgSend(v11, "northLat");
          v16 = v15;
          objc_msgSend(v11, "westLng");
          v56[0] = v16;
          v56[1] = v17;
          objc_msgSend(v11, "southLat");
          v19 = v18;
          objc_msgSend(v11, "westLng");
          v56[2] = v19;
          v56[3] = v20;
          objc_msgSend(v11, "southLat");
          v22 = v21;
          objc_msgSend(v11, "eastLng");
          v56[4] = v22;
          v56[5] = v23;
          objc_msgSend(v11, "northLat");
          v25 = v24;
          objc_msgSend(v11, "eastLng");
          v56[6] = v25;
          v56[7] = v26;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[MKPolygon polygonWithCoordinates:count:](MKPolygon, "polygonWithCoordinates:count:", v56, 4));
          objc_msgSend(v4, "addObject:", v27);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v7);
  }

  y = MKMapRectNull.origin.y;
  width = MKMapRectNull.size.width;
  height = MKMapRectNull.size.height;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v31 = v4;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v47;
    v35 = y;
    x = MKMapRectNull.origin.x;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v34)
          objc_enumerationMutation(v31);
        v38 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        if (x == MKMapRectNull.origin.x && v35 == y)
        {
          objc_msgSend(v38, "boundingMapRect");
        }
        else
        {
          objc_msgSend(v38, "boundingMapRect");
          v60.origin.x = v40;
          v60.origin.y = v41;
          v60.size.width = v42;
          v60.size.height = v43;
          v58.origin.x = x;
          v58.origin.y = v35;
          v58.size.width = width;
          v58.size.height = height;
          v59 = MKMapRectUnion(v58, v60);
        }
        x = v59.origin.x;
        v35 = v59.origin.y;
        width = v59.size.width;
        height = v59.size.height;
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v33);
  }
  else
  {
    v35 = y;
    x = MKMapRectNull.origin.x;
  }

  -[MapDataSubscriptionMapView setVisibleMapRect:edgePadding:animated:](v45, "setVisibleMapRect:edgePadding:animated:", 0, x, v35, width, height, 20.0, 20.0, 20.0, 20.0);
  -[MapDataSubscriptionMapView addOverlays:](v45, "addOverlays:", v31);

  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MapDataSubscriptionMapContentConfiguration initWithSubscriptions:](+[MapDataSubscriptionMapContentConfiguration allocWithZone:](MapDataSubscriptionMapContentConfiguration, "allocWithZone:", a3), "initWithSubscriptions:", self->_subscriptions);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = objc_msgSend(objc_alloc((Class)MKPolygonRenderer), "initWithOverlay:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v5, "setStrokeColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 0.400000006));
  objc_msgSend(v5, "setFillColor:", v8);

  objc_msgSend(v5, "setLineWidth:", 3.0);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end
