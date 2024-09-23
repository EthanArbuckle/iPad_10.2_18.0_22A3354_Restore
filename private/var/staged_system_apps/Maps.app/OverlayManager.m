@implementation OverlayManager

- (void)addOverlayProvider:(id)a3
{
  id v4;
  NSHashTable *providers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  providers = self->_providers;
  v8 = v4;
  if (!providers)
  {
    v6 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 1);
    v7 = self->_providers;
    self->_providers = v6;

    v4 = v8;
    providers = self->_providers;
  }
  -[NSHashTable addObject:](providers, "addObject:", v4);

}

- (void)removeOverlayProvider:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = a3;
  -[NSHashTable removeObject:](self->_providers, "removeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = self->_providerOverlays;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v12 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_providerOverlays, "objectForKey:", v11));
        if (v12 == v4)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  -[MKMapView removeOverlays:](self->_mapView, "removeOverlays:", v5);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[NSMapTable removeObjectForKey:](self->_providerOverlays, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)addOverlay:(id)a3 level:(int64_t)a4 fromProvider:(id)a5
{
  id v8;
  NSMapTable *providerOverlays;
  NSMapTable *v10;
  NSMapTable *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  providerOverlays = self->_providerOverlays;
  if (!providerOverlays)
  {
    v10 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 517, 1);
    v11 = self->_providerOverlays;
    self->_providerOverlays = v10;

    providerOverlays = self->_providerOverlays;
  }
  -[NSMapTable setObject:forKey:](providerOverlays, "setObject:forKey:", v8, v12);
  -[MKMapView addOverlay:level:](self->_mapView, "addOverlay:level:", v12, a4);

}

- (void)removeOverlay:(id)a3 fromProvider:(id)a4
{
  MKMapView *mapView;
  id v6;

  mapView = self->_mapView;
  v6 = a3;
  -[MKMapView removeOverlay:](mapView, "removeOverlay:", v6);
  -[NSMapTable removeObjectForKey:](self->_providerOverlays, "removeObjectForKey:", v6);

}

- (void)setMapView:(id)a3
{
  MKMapView *v5;
  MKMapView *mapView;
  MKCircle *selectedItemUncertaintyRadiusOverlay;
  MKMapView *v8;

  v5 = (MKMapView *)a3;
  mapView = self->_mapView;
  v8 = v5;
  if (mapView != v5)
  {
    if (self->_selectedItemUncertaintyRadiusOverlay)
      -[MKMapView removeOverlay:](mapView, "removeOverlay:");
    objc_storeStrong((id *)&self->_mapView, a3);
    selectedItemUncertaintyRadiusOverlay = self->_selectedItemUncertaintyRadiusOverlay;
    if (selectedItemUncertaintyRadiusOverlay)
      -[MKMapView addOverlay:level:](self->_mapView, "addOverlay:level:", selectedItemUncertaintyRadiusOverlay, 0);
  }

}

- (void)setSelectedLabelMarker:(id)a3
{
  VKLabelMarker *v5;
  MKCircle *selectedItemUncertaintyRadiusOverlay;
  UIColor *selectedItemUncertaintyRadiusColor;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  MKCircle *v19;
  MKCircle *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UIColor *v37;
  UIColor *v38;
  void *v39;
  VKLabelMarker *v40;

  v5 = (VKLabelMarker *)a3;
  if (self->_selectedLabelMarker != v5)
  {
    v40 = v5;
    if (self->_selectedItemUncertaintyRadiusOverlay)
    {
      -[MKMapView removeOverlay:](self->_mapView, "removeOverlay:");
      selectedItemUncertaintyRadiusOverlay = self->_selectedItemUncertaintyRadiusOverlay;
      self->_selectedItemUncertaintyRadiusOverlay = 0;

      selectedItemUncertaintyRadiusColor = self->_selectedItemUncertaintyRadiusColor;
      self->_selectedItemUncertaintyRadiusColor = 0;

    }
    objc_storeStrong((id *)&self->_selectedLabelMarker, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker featureAnnotation](self->_selectedLabelMarker, "featureAnnotation"));
    v9 = v8;
    if (v8 && objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parkedCar"));
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "horizontalAccuracy");
        if (v13 > 0.0)
        {
          objc_msgSend(v12, "coordinate");
          v15 = v14;
          v17 = v16;
          objc_msgSend(v12, "horizontalAccuracy");
          v19 = (MKCircle *)objc_claimAutoreleasedReturnValue(+[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v15, v17, v18));
          v20 = self->_selectedItemUncertaintyRadiusOverlay;
          self->_selectedItemUncertaintyRadiusOverlay = v19;

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "styleAttributes"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "styleAttributes"));

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes styleAttributesForCalloutWithAttributes:](GEOFeatureStyleAttributes, "styleAttributesForCalloutWithAttributes:", v22));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayManager mapView](self, "mapView"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "window"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "screen"));
          if (v26)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayManager mapView](self, "mapView"));
            v39 = v23;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "window"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "screen"));
            objc_msgSend(v29, "scale");
            v31 = v30;

            v23 = v39;
          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
            objc_msgSend(v27, "scale");
            v31 = v32;
          }

          v33 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayManager mapView](self, "mapView"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_mapLayer"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "iconForStyleAttributes:contentScale:size:transparent:", v23, 8, 1, v31));

          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v35, "fillColor")));
            v37 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "colorWithAlphaComponent:", 0.200000003));
            v38 = self->_selectedItemUncertaintyRadiusColor;
            self->_selectedItemUncertaintyRadiusColor = v37;

          }
          -[MKMapView addOverlay:level:](self->_mapView, "addOverlay:level:", self->_selectedItemUncertaintyRadiusOverlay, 0);

        }
      }

    }
    v5 = v40;
  }

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  MKCircle *v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = (MKCircle *)a4;
  if (self->_selectedItemUncertaintyRadiusOverlay == v7)
  {
    v9 = objc_msgSend(objc_alloc((Class)MKCircleRenderer), "initWithCircle:", self->_selectedItemUncertaintyRadiusOverlay);
    objc_msgSend(v9, "setFillColor:", self->_selectedItemUncertaintyRadiusColor);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_providerOverlays, "objectForKey:", v7));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView:rendererForOverlay:", v6, v7));

  }
  return v9;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (VKLabelMarker)selectedLabelMarker
{
  return self->_selectedLabelMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLabelMarker, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_providerOverlays, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_selectedItemUncertaintyRadiusColor, 0);
  objc_storeStrong((id *)&self->_selectedItemUncertaintyRadiusOverlay, 0);
}

@end
